/**
 * Tool tạo mật khẩu mã hóa cho ShopeeClone
 * Hỗ trợ 2 chuẩn:
 *  1. SHA-256: Chuẩn mã hóa hiện tại của ShopeeClone (Helpers/MaHoaHelper.MaHoaSHA256)
 *  2. BCrypt: Chuẩn mã hóa an toàn theo CONTRACT.md (độ dài muối mặc định 10 rounds)
 */

const crypto = require('crypto');
const bcrypt = require('bcryptjs');

function toSHA256(plainText) {
  return crypto.createHash('sha256').update(plainText, 'utf8').digest('hex');
}

function toBCrypt(plainText, saltRounds = 10) {
  return bcrypt.hashSync(plainText, saltRounds);
}

function verifyBCrypt(plainText, hash) {
  return bcrypt.compareSync(plainText, hash);
}

function printHelp() {
  console.log(`
=====================================================
  ShopeeClone - Password Hash Generator CLI Tool
=====================================================
Cách sử dụng:
  node index.js [lựa_chọn] [mật_khẩu]

Ví dụ:
  node index.js --all                      # Xem bảng băm cho các mật khẩu mặc định (123456, Admin@123)
  node index.js "123456"                   # Xuất cả SHA-256 và BCrypt cho chuỗi '123456'
  node index.js --sha256 "123456"          # Chỉ xuất mã SHA-256 (khớp MaHoaHelper.cs)
  node index.js --bcrypt "Admin@123"       # Chỉ xuất mã BCrypt
  node index.js --verify "123456" "<hash>" # Kiểm tra mật khẩu khớp với chuỗi BCrypt hash không
`);
}

const args = process.argv.slice(2);

if (args.length === 0 || args.includes('-h') || args.includes('--help')) {
  printHelp();
  process.exit(0);
}

if (args[0] === '--all') {
  const defaults = ['123456', 'Admin@123', 'Password123!', 'Shopee@2026'];
  console.log('\n--- BẢNG BĂM CÁC MẬT KHẨU MẪU DỰ ÁN SHOPEECLONE ---');
  defaults.forEach(pwd => {
    console.log(`\n[Plaintext]: "${pwd}"`);
    console.log(` -> SHA-256 (App hiện tại): ${toSHA256(pwd)}`);
    console.log(` -> BCrypt  (Chuẩn an toàn): ${toBCrypt(pwd)}`);
  });
  console.log('\n---------------------------------------------------');
  process.exit(0);
}

if (args[0] === '--sha256') {
  const pwd = args[1] || '123456';
  console.log(`SHA-256("${pwd}") = ${toSHA256(pwd)}`);
  process.exit(0);
}

if (args[0] === '--bcrypt') {
  const pwd = args[1] || '123456';
  console.log(`BCrypt("${pwd}") = ${toBCrypt(pwd)}`);
  process.exit(0);
}

if (args[0] === '--verify') {
  const pwd = args[1];
  const hash = args[2];
  if (!pwd || !hash) {
    console.error('Lỗi: Cần cung cấp đủ <mật_khẩu> và <hash>');
    process.exit(1);
  }
  const match = verifyBCrypt(pwd, hash);
  console.log(`Mật khẩu "${pwd}" ${match ? 'KHỚP' : 'KHÔNG KHỚP'} với hash.`);
  process.exit(match ? 0 : 1);
}

// Mặc định băm cả 2
const input = args[0];
console.log(`\nKết quả băm mật khẩu: "${input}"`);
console.log(`[1] SHA-256 (Tương thích 100% MaHoaHelper.cs & sp_DangNhap):`);
console.log(`    ${toSHA256(input)}`);
console.log(`[2] BCrypt (Tương thích CONTRACT.md):`);
console.log(`    ${toBCrypt(input)}\n`);
