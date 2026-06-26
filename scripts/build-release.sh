#!/usr/bin/env bash
set -euo pipefail
VERSION="$(grep '^## Version:' CopyEnglishName/CopyEnglishName.toc | sed 's/.*Version: *//' | tr -d '[:space:]')"
OUTDIR="$(cd "$(dirname "$0")/.." && pwd)/dist/${VERSION}"
ZIP_NAME="CopyEnglishName${VERSION}.zip"
mkdir -p "$OUTDIR"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT
cp -r "$(dirname "$0")/../CopyEnglishName" "$TMPDIR/"
cp -r "$(dirname "$0")/../CopyEnglishName_Data" "$TMPDIR/"
cd "$TMPDIR" && zip -r "${OUTDIR}/${ZIP_NAME}" .
echo "Packaged: ${OUTDIR}/${ZIP_NAME}"
unzip -l "${OUTDIR}/${ZIP_NAME}" | tail -5
