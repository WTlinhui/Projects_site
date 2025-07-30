#!/bin/bash

# Activate virtualenv
source ~/SES_project/venv/bin/activate

# Start Gunicorn
gunicorn ses_site.wsgi:application \
  --workers 3 \
  --bind 0.0.0.0:8000 \
  --log-level info \
  --access-logfile ~/SES_project/logs/access.log \
  --error-logfile ~/SES_project/logs/error.log
