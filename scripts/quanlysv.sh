#!/bin/bash
# Xac dinh duong dan
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
DATA_FILE="$PROJECT_DIR/data/sinhvien.txt"

# Kiem tra file du lieu
if [ ! -f "$DATA_FILE" ]; then
    echo "Khong tim thay file du lieu sinh vien!"
    exit 1
fi

# Ham hien thi danh sach
hien_thi() {
    echo "===== DANH SACH SINH VIEN ====="
    printf "%-10s %-20s %s\n" "Ma SV" "Ho ten" "Diem"
    awk -F',' '{printf "%-10s %-20s %s\n", $1, $2, $3}' "$DATA_FILE"
}

while true
do
    echo ""
    echo "===== CHUONG TRINH QUAN LY SINH VIEN ====="
    echo "1. Hien thi danh sach sinh vien"
    echo "2. Tim kiem sinh vien theo ma"
    echo "3. Thong ke sinh vien dat va khong dat"
    echo "4. Tinh diem trung binh"
    echo "5. Hien thi sinh vien co diem cao nhat"
    echo "6. Sap xep sinh vien theo diem giam dan"
    echo "0. Thoat chuong trinh"

    read -rp "Nhap lua chon: " chon

    case "$chon" in

        1)
            hien_thi
            ;;

        2)
            read -rp "Nhap ma sinh vien can tim: " ma
            ketqua=$(awk -F',' -v ma="$ma" '$1 == ma' "$DATA_FILE")

            if [ -n "$ketqua" ]; then
                echo "Tim thay sinh vien:"
                echo "$ketqua"
            else
                echo "Khong tim thay sinh vien!"
            fi
            ;;

        3)
            echo "===== THONG KE SINH VIEN ====="
            awk -F',' '
            $3 >= 5 {dat++}
            $3 < 5 {khongdat++}
            END {
                print "So sinh vien dat: " dat+0
                print "So sinh vien khong dat: " khongdat+0
            }' "$DATA_FILE"
            ;;

        4)
            echo "===== DIEM TRUNG BINH ====="
            awk -F',' '
            {tong += $3; dem++}
            END {
                if (dem > 0)
                    printf "Diem trung binh: %.2f\n", tong/dem
            }' "$DATA_FILE"
            ;;

        5)
            echo "===== SINH VIEN CO DIEM CAO NHAT ====="
            awk -F',' '
            NR == 1 || $3 > max {
                max = $3
                sv = $0
            }
            END {
                print sv
            }' "$DATA_FILE"
            ;;

        6)
            echo "===== SAP XEP DIEM GIAM DAN ====="
            (head -n 0 "$DATA_FILE"; sort -t',' -k3,3nr "$DATA_FILE")
            ;;

        0)
            echo "Thoat chuong trinh!"
            break
            ;;

        *)
            echo "Lua chon khong hop le! Vui long nhap lai."
            ;;

    esac
done
