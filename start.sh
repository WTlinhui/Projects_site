#!/bin/bash
# start.sh

set -e

echo "Apply database migrations..."
python manage.py migrate --noinput

echo "Create initial superuser if not exists..."
python manage.py createinitialsuperuser

echo "Collect static files..."
python manage.py collectstatic --noinput

echo "Starting Gunicorn server..."
exec gunicorn ses_site.wsgi:application --bind 0.0.0.0:$PORT --workers 3
