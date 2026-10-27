#!/usr/bin/env python3
"""
Tool tạo hash mật khẩu bằng Python (hỗ trợ SHA-256 tiêu chuẩn và BCrypt nếu có thư viện).
"""

import sys
import hashlib

def sha256_hash(text: str) -> str:
    return hashlib.sha256(text.encode('utf-8')).hexdigest()

def bcrypt_hash(text: str) -> str:
    try:
        import bcrypt
        return bcrypt.hashpw(text.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
    except ImportError:
        return "(Thư viện 'bcrypt' chưa được cài đặt trong Python environment. Hãy dùng node index.js hoặc pip install bcrypt)"

def main():
    if len(sys.argv) < 2 or sys.argv[1] in ('-h', '--help'):
        print("Sử dụng: python3 hash_tool.py <mật_khẩu>")
        print("Ví dụ:   python3 hash_tool.py 123456")
        sys.exit(0)

    pwd = sys.argv[1]
    print(f"Mật khẩu: {pwd}")
    print(f"SHA-256 (ShopeeClone App): {sha256_hash(pwd)}")
    print(f"BCrypt  (CONTRACT.md)     : {bcrypt_hash(pwd)}")

if __name__ == '__main__':
    main()
