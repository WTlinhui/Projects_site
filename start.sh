#!/bin/bash
# start.sh

# エラー時に処理を停止
set -e

# マイグレーション実行
echo "Apply database migrations..."
python manage.py migrate

# スーパーユーザー作成（環境変数で設定された場合のみ）
echo "Create initial superuser if not exists..."
python manage.py createinitialsuperuser


# 静的ファイルの収集
echo "Collect static files..."
python manage.py collectstatic --noinput

# サーバー起動（Renderの$PORT環境変数を使用）
echo "Starting Gunicorn server..."
exec gunicorn ses_site.wsgi:application --bind 0.0.0.0:$PORT --workers 3
