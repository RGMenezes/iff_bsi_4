#!/bin/bash

DB_NAME="training_timer_db"
DB_USER="admin"
DB_PASS="SenhaSegura123!"
DB_HOST="localhost"

BACKUP_DIR="/var/backups/tt_iff"
DATE=$(date +%Y-%m-%d_%H-%m-%S)
DAY_OF_WEEK=$(date +%u) # 1 (Segunda) a 7 (Domingo)

mkdir -p "$BACKUP_DIR/full"
mkdir -p "$BACKUP_DIR/daily"

# Log de início da operação
echo "----------------------------------------------------" >> "$BACKUP_DIR/backup.log"
echo "[$(date)] Iniciando rotina de backup do banco $DB_NAME..." >> "$BACKUP_DIR/backup.log"

if [ "$DAY_OF_WEEK" -eq 7 ]; then
    FILE_NAME="full_tt_iff_${DATE}.sql"
    DEST_PATH="$BACKUP_DIR/full/$FILE_NAME"

    # Executa dump completo (Estrutura + Dados + Triggers/Routines)
    mysqldump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" \
      --routines --triggers --single-transaction --databases "$DB_NAME" > "$DEST_PATH"

    # Compacta o arquivo gerado
    tar -czf "${DEST_PATH}.tar.gz" -C "$BACKUP_DIR/full" "$FILE_NAME"
    rm -f "$DEST_PATH"

    echo "[$(date)] Backup COMPLETO (Full) gerado: ${FILE_NAME}.tar.gz" >> "$BACKUP_DIR/backup.log"
else
    # Executa Backup Diário dos dados
    FILE_NAME="daily_tt_iff_${DATE}.sql"
    DEST_PATH="$BACKUP_DIR/daily/$FILE_NAME"

    mysqldump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" \
      --single-transaction --quick "$DB_NAME" > "$DEST_PATH"

    # Compacta o arquivo gerado
    tar -czf "${DEST_PATH}.tar.gz" -C "$BACKUP_DIR/daily" "$FILE_NAME"
    rm -f "$DEST_PATH"

    echo "[$(date)] Backup DIÁRIO gerado: ${FILE_NAME}.tar.gz" >> "$BACKUP_DIR/backup.log"
fi

# Remove backups diários com mais de 7 dias
find "$BACKUP_DIR/daily" -type f -name "*.tar.gz" -mtime +7 -exec rm -f {} \;

# Remove backups completos com mais de 30 dias
find "$BACKUP_DIR/full" -type f -name "*.tar.gz" -mtime +30 -exec rm -f {} \;

echo "[$(date)] Rotina de limpeza finalizada." >> "$BACKUP_DIR/backup.log"
echo "[$(date)] Processo de backup concluído com sucesso!" >> "$BACKUP_DIR/backup.log"
