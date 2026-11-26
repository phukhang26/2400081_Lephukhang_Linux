#!/bin/bash
# Xac dinh duong dan
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

DATA_DIR="$PROJECT_DIR/data"
BACKUP_DIR="$PROJECT_DIR/backup"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/backup.log"

# Tao thu muc neu chua co
mkdir -p "$BACKUP_DIR" "$LOG_DIR"

echo "===== CHUONG TRINH SAO LUU DU LIEU ====="

# Kiem tra thu muc data
if [ ! -d "$DATA_DIR" ]; then
    echo "Khong tim thay thu muc data!"

    echo "$(date '+%Y-%m-%d %H:%M:%S') | Khong co du lieu | THAT BAI" >> "$LOG_FILE"

else

    # Tao ten file sao luu theo thoi gian
    TIME=$(date '+%Y%m%d_%H%M%S')
    BACKUP_FILE="$BACKUP_DIR/backup_$TIME.tar.gz"

    echo "Dang tien hanh sao luu..."

    # Nen thu muc data
    if tar -czf "$BACKUP_FILE" -C "$PROJECT_DIR" data \
       && tar -tzf "$BACKUP_FILE" > /dev/null 2>&1; then

echo "Sao luu thanh cong!"
echo "File: $BACKUP_FILE"
echo "Dung luong file sao luu:"
du -h "$BACKUP_FILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') | backup_$TIME.tar.gz | THANH CONG" >> "$LOG_FILE"

    else
        echo "Sao luu that bai!"

        rm -f "$BACKUP_FILE"

        echo "$(date '+%Y-%m-%d %H:%M:%S') | backup_$TIME.tar.gz | THAT BAI" >> "$LOG_FILE"
    fi
fi

# Hien thi danh sach file sao luu
echo ""
echo "===== DANH SACH FILE SAO LUU ====="

ls -lh "$BACKUP_DIR"

echo ""
echo "===== KET THUC CHUONG TRINH ====="
