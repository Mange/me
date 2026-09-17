#!/usr/bin/env bash
set -euo pipefail

deploypath="consessor:/mnt/user/appdata/web/mange.dev/"

make
scp -r website/dist/client/* "$deploypath"
scp cv.pdf "$deploypath/cv.pdf"
