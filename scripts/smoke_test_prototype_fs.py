#!/usr/bin/env python3
"""Filesystem smoke test for Character Builder prototype.
Checks HTML module scripts and verifies imported paths exist on disk.
"""
import re
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PAGE = ROOT / 'prototypes' / 'character-builder' / 'character-builder.html'

if not PAGE.exists():
    print(f'ERROR: page not found at {PAGE}')
    raise SystemExit(2)

html = PAGE.read_text(encoding='utf-8')
module_scripts = re.findall(r'<script[^>]+type=["\']module["\'][^>]*src=["\']([^"\']+)["\']', html, flags=re.I)
print(f'Found {len(module_scripts)} module script(s):')
for s in module_scripts:
    print(' -', s)

missing = []
seen = set()

def resolve_and_check_file(url_path, base_path):
    # url_path is something like 'js/character-builder.js' or '../../5etools-2014-src/js/utils.js'
    candidate = (base_path / url_path).resolve()
    if candidate in seen:
        return []
    seen.add(candidate)
    out = []
    if not candidate.exists():
        out.append((candidate, False, 'MISSING'))
        return out
    out.append((candidate, True, 'OK'))
    # if JS, parse imports
    if candidate.suffix == '.js':
        txt = candidate.read_text(encoding='utf-8')
        imports = re.findall(r'import\s+(?:[^;]*?from\s+)?["\']([^"\']+)["\']', txt)
        for imp in imports:
            # resolve relative to candidate's parent
            out.extend(resolve_and_check_file(imp, candidate.parent))
    return out

for s in module_scripts:
    results = resolve_and_check_file(s, PAGE.parent)
    for path, ok, msg in results:
        print(f'   -> {path} => {msg}')
        if not ok:
            missing.append((path, msg))

if missing:
    print('\nSMOKE TEST FAILED: Missing files found')
    for p, m in missing:
        print(' -', p)
    raise SystemExit(3)
else:
    print('\nSMOKE TEST PASSED: all referenced files exist on disk (resolved recursively).')
