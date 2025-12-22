#!/usr/bin/env python3
"""Extrai TODAS as versões de lineages a partir de data/raw_pages/lineages/*.html.

Regras principais:
- Sempre lê dentro de div#page-content.
- Suporta blocos antes do primeiro h1 (usa parágrafo "Source:" para identificar livro).
- Cada h1 inicia um novo bloco de versão; h2/h3 dentro do bloco viram sublinhagens e herdam o mesmo livro.
- Extrai: ASI, tipo de criatura, tamanho (e escolha), velocidades, idiomas, resistências, traits.
"""

import json
import os
import re
from pathlib import Path

from bs4 import BeautifulSoup

ROOT_DIR = Path(__file__).resolve().parents[2]
SCHEMA_BOOKS = ROOT_DIR / "scripts" / "init_db" / "core" / "schema_books.sql"


def load_core_books_codes():
    pattern = re.compile(r"\('([^']+)',\s*'([^']+)'")
    codes = []
    with SCHEMA_BOOKS.open("r", encoding="utf-8") as f:
        for line in f:
            m = pattern.search(line)
            if m:
                code, name = m.group(1), clean_text(m.group(2))
                codes.append((code, name))
    code_to_id = {code: idx + 1 for idx, (code, _) in enumerate(codes)}
    name_to_code = {name: code for code, name in codes}
    code_to_name = {code: name for code, name in codes}
    return code_to_id, name_to_code, code_to_name


ALIAS_TO_CODE = {
    "player's handbook": "PHB",
    "volo's guide to monsters": "VGM",
    "mordenkainen presents: monsters of the multiverse": "MPMM",
    "mordenkainen's tome of foes": "MTF",
    "xanathar's guide to everything": "XGE",
    "tasha's cauldron of everything": "TCE",
    "eberron: rising from the last war": "E:RLW",
    "eberron - rising from the last war": "E:RLW",
    "explorer's guide to wildemount": "EGW",
    "fizban's treasury of dragons": "FTD",
    "sword coast adventurer's guide": "SCAG",
    "elemental evil player's companion": "EEPC",
    "elemental evil player's guide": "EEPG",
    "guildmaster's guide to ravnica": "GGR",
    "guildmasters' guide to ravnica": "GGR",
    "acquisitions incorporated": "AI",
    "acquisitions inc.": "AI",
    "mythic odysseys of theros": "MOT",
    "mythic odyssey of theros": "MOT",
    "van richten's guide to ravenloft": "VRGR",
    "the wild beyond the witchlight": "WBW",
    "strixhaven: a curriculum of chaos": "SCC",
    "mordenkainen's tome of foes": "MTF",
    "plane shift - kaladesh": "PS:K",
    "plane shift: kaladesh": "PS:K2",
    "plane shift - amonkhet": "PS:A",
    "plane shift: amonkhet": "PS:A2",
    "plane shift - zendikar": "PS:Z",
    "plane shift: zendikar": "PS:Z2",
    "plane shift - ixalan": "PS:I",
    "plane shift: ixalan": "PS:I2",
    "plane shift - dominaria": "PS:D",
    "plane shift: dominaria": "PS:D2",
    "plane shift - innistrad": "PS:In",
    "plane shift: innistrad": "PS:In2",
    "spelljammer: adventures in space": "SAS",
    "spelljammer: adventures in space - astral adventurer's guide": "SAS",
    "astral adventurer's guide": "SAS",
    "adventures with muk: dankwood": "AWM",
    "one grung above, extra life 2017": "OGA",
    "locathah rising, extra life 2019": "LR",
    "the tortle package": "TTP",
    "unearthed arcana": "UA",
    "monstrous compendium volume 2 - dragonlance creatures": "MCV2",
    "lost mine of phandelver": "LMP",
}

SLUG_FALLBACK = {
    "aetherborn": "PS:K",
    "aven": "PS:A",
    "khenra": "PS:A",
    "naga": "PS:A",
    "kor": "PS:Z",
    "leonin": "MOT",
    "loxodon": "GGR",
    "simic-hybrid": "GGR",
    "siren": "SAS",
}


def clean_text(text):
    """Remove espaços extras e normaliza whitespace."""
    return " ".join(text.split()).strip()


def resolve_book(title, code_to_id, name_to_code):
    if not title:
        return None, None, "Unknown Source"
    norm = clean_text(title)
    key = norm.lower()
    code = name_to_code.get(norm) or ALIAS_TO_CODE.get(key)
    if not code and key.startswith("unearthed arcana"):
        code = "UA"
    book_id = code_to_id.get(code) if code else None
    return code, book_id, norm

def extract_ability_scores(text):
    if not text:
        return None

    text_clean = clean_text(text)
    result = {"text": text_clean, "fixed": [], "choice": None}

    lowered = text.lower()
    if "increase one score by 2" in lowered or "increase three different scores by 1" in lowered:
        result["choice"] = "1/1/1" if "three different scores by 1" in lowered else "2/1"
        return result

    pattern = r"(?:Your\s+)?(\w+)\s+score\s+increases?\s+by\s+(\d+)"
    matches = re.findall(pattern, text, re.IGNORECASE)
    for ability, value in matches:
        result["fixed"].append((ability.upper()[:3], int(value)))

    return result

def extract_size(text):
    if not text:
        return None, False

    text_lower = text.lower()
    if "medium or small" in text_lower or "small or medium" in text_lower or "you choose" in text_lower:
        return "Medium or Small", True
    if "small" in text_lower:
        return "Small", False
    if "medium" in text_lower:
        return "Medium", False
    if "large" in text_lower:
        return "Large", False
    return None, False


def extract_speed(text):
    if not text:
        return []

    speeds = []
    patterns = {
        "walk": r"walking speed (?:is|of) (\d+)\s*feet",
        "swim": r"swim(?:ming)? speed (?:is|of) (\d+)\s*feet",
        "fly": r"fly(?:ing)? speed (?:is|of) (\d+)\s*feet",
        "climb": r"climb(?:ing)? speed (?:is|of) (\d+)\s*feet",
    }
    for kind, pattern in patterns.items():
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            speeds.append((kind, int(match.group(1))))
    if "flying speed equal to your walking speed" in text.lower():
        speeds.append(("fly", None))
    return speeds


def extract_languages(text):
    if not text:
        return []

    languages = []
    common_langs = [
        "Common",
        "Elvish",
        "Dwarvish",
        "Giant",
        "Gnomish",
        "Goblin",
        "Halfling",
        "Orc",
        "Abyssal",
        "Celestial",
        "Draconic",
        "Deep Speech",
        "Infernal",
        "Primordial",
        "Sylvan",
        "Undercommon",
        "Auran",
        "Aquan",
        "Ignan",
        "Terran",
    ]
    for lang in common_langs:
        if lang in text:
            languages.append(lang)

    lowered = text.lower()
    if "one other language" in lowered or "one additional language" in lowered:
        languages.append("CHOICE:1")
    if "two other languages" in lowered:
        languages.append("CHOICE:2")
    return languages


def extract_resistances(text):
    if not text:
        return []

    resistances = []
    text_lower = text.lower()
    damage_types = [
        "acid",
        "cold",
        "fire",
        "lightning",
        "thunder",
        "poison",
        "necrotic",
        "radiant",
        "psychic",
        "force",
        "bludgeoning",
        "piercing",
        "slashing",
    ]
    for dtype in damage_types:
        if f"immune to {dtype}" in text_lower or f"{dtype} immunity" in text_lower:
            resistances.append((dtype, "immunity"))
        elif f"resistance to {dtype}" in text_lower or f"{dtype} resistance" in text_lower:
            resistances.append((dtype, "resistance"))
    return resistances


def extract_creature_type(text):
    if not text:
        return None
    text_lower = text.lower()
    for key in ["humanoid", "fey", "elemental", "celestial", "fiend", "construct"]:
        if key in text_lower:
            return key.capitalize()
    return None


def find_source_title(elems):
    for el in elems:
        if getattr(el, "name", None) == "p":
            txt = clean_text(el.get_text())
            if re.match(r"^\s*source\s*:\s*", txt, re.IGNORECASE):
                return clean_text(re.split(r"\s*:\s*", txt, 1)[1])
    return None


def parse_version_data_from_elements(elems, book_title, book_code, book_id):
    data = {
        "book_title": book_title,
        "book_code": book_code,
        "book_id": book_id,
        "ability_scores": None,
        "creature_type": None,
        "size": None,
        "size_choice": False,
        "speeds": [],
        "languages": [],
        "resistances": [],
        "traits": [],
    }

    meta_names = {"ability score increase", "ability score increases", "size", "speed", "languages", "creature type"}

    for el in elems:
        if getattr(el, "name", None) == "ul":
            for li in el.find_all("li", recursive=False):
                li_text = clean_text(li.get_text())
                strong = li.find(["strong", "b"])
                trait_name = clean_text(strong.get_text().replace(":", "")) if strong else ""
                lower_name = trait_name.lower()

                if lower_name.startswith("ability score increase"):
                    data["ability_scores"] = extract_ability_scores(li_text)
                elif lower_name == "size":
                    data["size"], data["size_choice"] = extract_size(li_text)
                elif lower_name == "speed":
                    data["speeds"] = extract_speed(li_text)
                elif "language" in lower_name:
                    data["languages"] = extract_languages(li_text)
                elif lower_name.startswith("creature type") or lower_name == "type":
                    data["creature_type"] = extract_creature_type(li_text)
                elif any(word in li_text.lower() for word in ["resistance", "immunity", "immune"]):
                    resists = extract_resistances(li_text)
                    if resists:
                        data["resistances"].extend(resists)

                if trait_name and lower_name not in meta_names:
                    data["traits"].append({"name": trait_name, "description": li_text.replace(trait_name, "", 1).strip()})
    return data


def slice_between(page_content, start, stop):
    elems = []
    node = page_content.contents[0] if start is None else start.next_sibling
    while node and node != stop:
        if getattr(node, "name", None) or str(node).strip():
            elems.append(node)
        node = node.next_sibling
    return elems


def extract_segments(page_content):
    markers = [None] + list(page_content.find_all("h1")) + [None]
    segments = []
    for i in range(len(markers) - 1):
        start = markers[i]
        stop = markers[i + 1]
        elems = slice_between(page_content, start, stop)
        if not elems:
            continue
        if start is None:
            title = find_source_title(elems)
            if not title:
                # se não há source explícita e já existe um h1, pula bloco introdutório
                if markers[i + 1] is not None:
                    continue
                title = "Unknown Source"
        else:
            title = clean_text(start.get_text())
        segments.append((title, elems))
    return segments


def process_lineage_file(html_file, code_to_id, name_to_code, code_to_name):
    print(f"\n{'='*60}")
    print(f"📄 Processando: {html_file.name}")
    print(f"{'='*60}")

    soup = BeautifulSoup(html_file.read_text(encoding="utf-8"), "html.parser")
    page_content = soup.find(id="page-content") or soup

    lineage_slug = html_file.stem.replace("lineage-", "")
    lineage_name = lineage_slug.replace("-", " ").title()

    versions = []

    for raw_title, elems in extract_segments(page_content):
        book_code, book_id, book_title = resolve_book(raw_title, code_to_id, name_to_code)
        if not book_code:
            fallback = SLUG_FALLBACK.get(lineage_slug)
            if fallback:
                book_code = fallback
                book_id = code_to_id.get(book_code)
                book_title = code_to_name.get(book_code, book_title)

        # localizar sub-headings dentro do bloco
        sub_idxs = [idx for idx, el in enumerate(elems) if getattr(el, "name", None) in ("h2", "h3")]
        sub_idxs = [i for i in sub_idxs if not any(skip in clean_text(elems[i].get_text()).lower() for skip in ["community", "wiki", "table of contents", "sources", "credits"])]

        main_elems = elems[: sub_idxs[0]] if sub_idxs else elems
        version_data = parse_version_data_from_elements(main_elems, book_title, book_code, book_id)
        versions.append({
            "type": "main_version",
            "lineage_slug": lineage_slug,
            "lineage_name": lineage_name,
            "version_name": f"{lineage_name} ({book_title})",
            "data": version_data,
        })

        for idx, start_idx in enumerate(sub_idxs):
            end_idx = sub_idxs[idx + 1] if idx + 1 < len(sub_idxs) else len(elems)
            heading = clean_text(elems[start_idx].get_text())
            sub_elems = elems[start_idx + 1 : end_idx]
            sub_data = parse_version_data_from_elements(sub_elems, book_title, book_code, book_id)
            versions.append({
                "type": "sublineage",
                "lineage_slug": lineage_slug,
                "lineage_name": lineage_name,
                "sublineage_name": heading,
                "data": sub_data,
            })

    return versions


def main():
    print("🚀 EXTRAÇÃO COMPLETA DE TODAS AS VERSÕES DE LINEAGES")
    print("=" * 60)

    base_dir = Path("a:/Program_boy/Python/github/Random-char-generator-DnD-5e")
    lineages_dir = base_dir / "data" / "raw_pages" / "lineages"
    output_file = base_dir / "reports" / "lineages_all_versions_extracted.json"

    code_to_id, name_to_code, code_to_name = load_core_books_codes()

    all_versions = []
    for html_file in sorted(lineages_dir.glob("lineage-*.html")):
        all_versions.extend(process_lineage_file(html_file, code_to_id, name_to_code, code_to_name))

    output_file.parent.mkdir(parents=True, exist_ok=True)
    with output_file.open("w", encoding="utf-8") as f:
        json.dump(all_versions, f, indent=2, ensure_ascii=False)

    main_versions = [v for v in all_versions if v["type"] == "main_version"]
    sublineages = [v for v in all_versions if v["type"] == "sublineage"]

    print(f"\n{'='*60}")
    print("📊 ESTATÍSTICAS FINAIS")
    print(f"{'='*60}")
    print(f"📚 Versões principais extraídas: {len(main_versions)}")
    print(f"🔹 Subraças extraídas: {len(sublineages)}")
    print(f"🎯 TOTAL: {len(all_versions)}")
    print(f"\n💾 Dados salvos em: {output_file}")
    print("\n✅ Extração completa!")


if __name__ == "__main__":
    main()
