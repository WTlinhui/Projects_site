#!/bin/bash

# 保存先ディレクトリ
BACKUP_DIR="/home/ubuntu/SES_project/backups"
mkdir -p "$BACKUP_DIR"

# ファイル名に日付を付加
TIMESTAMP=$(date +"%Y%m%d_%H%M")
FILENAME="ses_backup_$TIMESTAMP.sql"

# mysqldump 実行（MySQL rootユーザー使用）
docker exec mysql-container mysqldump -u root -prootpass123 ses_project_db > "$BACKUP_DIR/$FILENAME"

# 古いバックアップ削除（30日より前のファイルを削除）
find "$BACKUP_DIR" -type f -name "*.sql" -mtime +30 -exec rm {} \;

# ログ（オプション）
echo "$(date) - Backup completed: $FILENAME" >> "$BACKUP_DIR/backup.log"
