import "../../../..\/5etools-2014-src/js/utils.js";
import "../../../..\/5etools-2014-src/js/render.js";
import "../../../..\/5etools-2014-src/js/utils-ui.js";
import "../../../..\/5etools-2014-src/js/filter/filter-box.js";
import "../../../..\/5etools-2014-src/js/filter-races.js";
import "../../../..\/5etools-2014-src/js/statgen/statgen-ui.js";
import "../../../..\/5etools-2014-src/js/lifegen.js";

let books, races, classes;
let pageFilterRaces, filterBox;
let statGenUi;

const $log = document.getElementById("log");
function log (s) { $log.innerHTML += `<div>${s}</div>`; $log.scrollTop = $log.scrollHeight; }

async function pLoadAll () {
    log("Carregando data/books.json e data/races.json...");
    books = await DataUtil.loadJSON(`${Renderer.get().baseUrl}data/books.json`);
    races = await DataUtil.loadJSON(`${Renderer.get().baseUrl}data/races.json`);
    log(`Loaded books: ${books.length || Object.keys(books).length}`);
    log(`Loaded races: ${races.length}`);

    // popular select de sources
    const srcs = [...new Set((races || []).map(r => r.source))].sort();
    const sel = document.getElementById("selSource");
    srcs.forEach(s => sel.append(new Option(s, s)));

    document.getElementById("btnInitFilters").disabled = false;
}

async function pInitFilters () {
    log("Inicializando PageFilterRaces e FilterBox...");
    pageFilterRaces = new PageFilterRaces();
    await pageFilterRaces.pInitFilterBox({ wrpFormTop: null, btnReset: null });
    filterBox = pageFilterRaces.filterBox;
    log("FilterBox pronto.");

    document.getElementById("btnGenerate").disabled = false;
}

function generateCharacter () {
    const src = document.getElementById("selSource").value;
    if (src) {
        filterBox.setFromValues({ Source: { [src]: 1 } });
        log(`Filtro aplicado: Source=${src}`);
    } else {
        filterBox.setFromValues({});
        log(`Filtro limpo.`);
    }

    // escolher raça visível aleatória
    const visible = races.filter(r => pageFilterRaces.toDisplay(filterBox.getValues(), r));
    if (!visible.length) {
        log("Nenhuma raça visível para os filtros escolhidos.");
        document.getElementById("preview").innerHTML = "<i>Nenhuma raça encontrada</i>";
        return;
    }
    const race = visible[Math.floor(Math.random() * visible.length)];

    // gerar detalhes de vida
    (async () => {
        const lifeArr = await getPersonDetails({ isAdventurer: true, parentRaces: [race.name] });
        const lifeHtml = lifeArr.join("<br>");

        // usar StatGenUi para rolagens básicas
        statGenUi = new StatGenUi({ races: visible, backgrounds: [], feats: [] });
        await statGenUi.pInit();
        // setar raça selecionada
        const ix = visible.indexOf(race);
        statGenUi._state.common_ixRace = ix;

        // rolar stats rápidos
        statGenUi._state.rolled_rollCount = 6;
        statGenUi._state.rolled_formula = "4d6k3";
        statGenUi._state.rolled_rolls = await statGenUi._roll_pGetRolledStats();

        const char = {
            name: `${race.name} ${race.source}`,
            race: race.name,
            cls: "(none)",
            stats: statGenUi.getTotals(),
            lifeHtml,
        };

        const html = `
            <h3>${char.name}</h3>
            <div><b>Race:</b> ${char.race} (${race.source})</div>
            <div><b>Stats mode:</b> ${char.stats.mode}</div>
            <div><b>Rolled:</b> ${char.stats.totals.rolled ? Object.values(char.stats.totals.rolled).join(", ") : "-"}</div>
            <hr>
            <div>${char.lifeHtml}</div>
        `;
        document.getElementById("preview").innerHTML = Renderer.get().render(html);
        document.getElementById("btnExport").disabled = false;
    })();
}

async function exportPng () {
    if (typeof domtoimage === "undefined") await import("../../5etools-2014-src/lib/dom-to-image-more.min.js");
    const el = document.getElementById("preview");
    const dataUrl = await domtoimage.toPng(el, { bgcolor: "#fff" });
    const a = document.createElement("a");
    a.href = dataUrl;
    a.download = `character-${Date.now()}.png`;
    a.click();
}

// event hooks
document.getElementById("btnLoad").addEventListener("click", () => pLoadAll().catch(e => log(`Erro: ${e.message}`)));
document.getElementById("btnInitFilters").addEventListener("click", () => pInitFilters().catch(e => log(`Erro: ${e.message}`)));
document.getElementById("btnGenerate").addEventListener("click", () => generateCharacter());
document.getElementById("btnExport").addEventListener("click", () => exportPng());
