#!/usr/bin/env python3
"""Smoke test the Character Builder prototype by fetching the HTML and resolving module imports.
Usage: python scripts/smoke_test_prototype.py
"""
import sys
import re
from urllib.request import urlopen, Request
from urllib.parse import urljoin

BASE = 'http://localhost:8000/'
PAGE = 'prototypes/character-builder/character-builder.html'


def fetch(url):
    req = Request(url, headers={"User-Agent": "smoke-test/1.0"})
    with urlopen(req) as r:
        return r.read().decode('utf-8')


def extract_module_scripts(html):
    return re.findall(r'<script[^>]+type=["\']module["\'][^>]*src=["\']([^"\']+)["\']', html, flags=re.I)


def extract_imports(js):
    # simple regex for import ... from 'x' or import 'x';
    imports = re.findall(r'import\s+(?:[^;]*?from\s+)?["\']([^"\']+)["\']', js)
    return imports


def resolve_and_check(url, seen):
    if url in seen:
        return []
    seen.add(url)
    out = []
    try:
        txt = fetch(url)
        out.append((url, True, 'OK'))
        # if JS module, parse imports
        if url.endswith('.js') or 'javascript' in (url.split('?')[0].split('.')[-1]):
            for imp in extract_imports(txt):
                next_url = urljoin(url, imp)
                out.extend(resolve_and_check(next_url, seen))
    except Exception as e:
        out.append((url, False, str(e)))
    return out


def main():
    try:
        html = fetch(urljoin(BASE, PAGE))
    except Exception as e:
        print(f'ERROR: failed to fetch page {PAGE}: {e}')
        sys.exit(2)

    scripts = extract_module_scripts(html)
    if not scripts:
        print('WARNING: no module scripts found in page')

    print(f'Found {len(scripts)} module script(s):')
    for s in scripts:
        print(f' - {s}')

    results = []
    seen = set()
    for s in scripts:
        url = urljoin(BASE, s)
        results.extend(resolve_and_check(url, seen))

    print('\nResolution results:')
    missing = []
    for url, ok, msg in results:
        print(f' - {url} => {"OK" if ok else "MISSING"} ({msg})')
        if not ok:
            missing.append((url, msg))

    if missing:
        print(f'\nSMOKE TEST FAILED: {len(missing)} missing/errored resource(s)')
        sys.exit(3)
    else:
        print('\nSMOKE TEST PASSED: All referenced modules were fetched and resolved (recursively).')


if __name__ == '__main__':
    main()
