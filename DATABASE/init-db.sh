#!/bin/bash
set -e

echo "=== [db-init] Bắt đầu kiểm tra khởi tạo cơ sở dữ liệu ==="

# Chọn phiên bản sqlcmd thích hợp
if [ -f /opt/mssql-tools18/bin/sqlcmd ]; then
    SQLCMD="/opt/mssql-tools18/bin/sqlcmd -C"
elif [ -f /opt/mssql-tools/bin/sqlcmd ]; then
    SQLCMD="/opt/mssql-tools/bin/sqlcmd"
else
    SQLCMD="sqlcmd"
fi

echo "=== [db-init] Đang kết nối tới SQL Server (db)... ==="
for i in {1..60}; do
    if $SQLCMD -S db -U sa -P "$SA_PASSWORD" -Q "SELECT 1" > /dev/null 2>&1; then
        echo "=== [db-init] Kết nối SQL Server thành công! ==="
        break
    fi
    echo "=== [db-init] Đang đợi SQL Server khởi động ($i/60)... ==="
    sleep 2
done

# Kiểm tra database QLSANPHAM đã tồn tại và có đầy đủ dữ liệu chưa (dùng OBJECT_ID an toàn, không lỗi compile)
echo "=== [db-init] Kiểm tra trạng thái database QLSANPHAM... ==="
DB_STATUS=$($SQLCMD -S db -U sa -P "$SA_PASSWORD" -Q "SET NOCOUNT ON; IF DB_ID('QLSANPHAM') IS NOT NULL AND OBJECT_ID('QLSANPHAM.dbo.NguoiDung', 'U') IS NOT NULL AND OBJECT_ID('QLSANPHAM.dbo.SanPham', 'U') IS NOT NULL AND (SELECT COUNT(*) FROM QLSANPHAM.dbo.SanPham) > 0 PRINT 'EXISTS' ELSE PRINT 'NOT_EXISTS'" -h -1 2>/dev/null | tr -d '[:space:]')

if [ "$DB_STATUS" = "EXISTS" ]; then
    echo "=== [db-init] Database QLSANPHAM đã tồn tại. Bỏ qua tạo bảng gốc (idempotent). ==="
else
    echo "=== [db-init] Database QLSANPHAM chưa có hoặc dữ liệu chưa đầy đủ. Đang nạp script /init/QLSANPHAM.sql... ==="
    # Nếu database tồn tại nhưng bị lỗi/thiếu bảng từ lần chạy trước, drop để tạo lại sạch sẽ
    $SQLCMD -S db -U sa -P "$SA_PASSWORD" -Q "IF DB_ID('QLSANPHAM') IS NOT NULL BEGIN ALTER DATABASE QLSANPHAM SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE QLSANPHAM; END"
    # Nạp script SQL
    $SQLCMD -S db -U sa -P "$SA_PASSWORD" -i /init/QLSANPHAM.sql
    echo "=== [db-init] Khởi tạo cơ sở dữ liệu QLSANPHAM hoàn tất thành công! ==="
fi

# Luôn kiểm tra và nạp seed data nếu có (tập lệnh idempotent)
if [ -f /init/seed_data.sql ]; then
    echo "=== [db-init] Kiểm tra và nạp seed_data.sql vào QLSANPHAM... ==="
    $SQLCMD -S db -U sa -P "$SA_PASSWORD" -i /init/seed_data.sql
    echo "=== [db-init] Nạp seed_data.sql hoàn tất thành công! ==="
fi

echo "=== [db-init] Hoàn thành tác vụ db-init ==="
