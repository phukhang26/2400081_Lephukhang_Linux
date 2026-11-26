
#!/bin/bash

# Xac dinh thu muc du an
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
LOG_FILE="$PROJECT_DIR/logs/hethong.log"

# Ghi ket qua ra man hinh va file log
exec > >(tee -a "$LOG_FILE") 2>&1

echo "========== KIEM TRA HE THONG =========="

# 1. Thong tin co ban
echo ""
echo "----- THONG TIN CO BAN -----"
echo "Ten nguoi dung: $(whoami)"
echo "Ten may tinh: $(hostname)"
echo "Ngay gio hien tai: $(date)"
echo "Phien ban Linux Kernel: $(uname -r)"

# 2. Dung luong RAM
echo ""
echo "----- THONG TIN RAM -----"
free -h

# 3. Dung luong o dia
echo ""
echo "----- THONG TIN O DIA -----"
df -h

# 4. Kiem tra ket noi mang
echo ""
echo "----- KIEM TRA KET NOI MANG -----"

if ping -c 4 -W 2 google.com.vn > /dev/null 2>&1
then
    echo "Co ket noi mang"
else
    echo "Khong xac nhan duoc ket noi mang"
fi

echo ""
echo "========== KET THUC KIEM TRA =========="
