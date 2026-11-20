#!/usr/bin/env bash
set -euo pipefail
cd /srv/nsom/app
git pull --ff-only origin main
/srv/nsom/venv/bin/pip install -q -r requirements.txt
/srv/nsom/venv/bin/python manage.py migrate --noinput
/srv/nsom/venv/bin/python manage.py collectstatic --noinput
sudo systemctl restart nsom
echo "deployed $(git rev-parse --short HEAD)"