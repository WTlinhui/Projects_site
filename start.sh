#!/bin/bash
# start.sh

set -e

echo "Apply database migrations..."
python manage.py migrate --noinput

echo "Create initial superuser if not exists..."
python manage.py createinitialsuperuser

echo "Collect static files..."
python manage.py collectstatic --noinput

echo "Create initial customers..."
echo "
from projects.models import Customer
Customer.objects.get_or_create(id=1, defaults={'name': '仮の顧客'})
" | python manage.py shell

echo "Starting Gunicorn server..."
exec gunicorn ses_site.wsgi:application --bind 0.0.0.0:$PORT --workers 3
