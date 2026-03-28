# /commit — Tạo git commit chuẩn

Tạo một git commit cho các thay đổi hiện tại.

## Các bước thực hiện:

1. **Kiểm tra thay đổi:** Chạy `git status` và `git diff --staged` để hiểu những gì sẽ commit

2. **Viết commit message** theo Conventional Commits:
   ```
   <type>(<scope>): <mô tả ngắn gọn>
   
   [body — mô tả chi tiết nếu cần]
   
   [footer — breaking changes, closes issues]
   ```
   
   Các type hợp lệ:
   - `feat` — tính năng mới
   - `fix` — sửa lỗi
   - `docs` — cập nhật tài liệu
   - `style` — format, không đổi logic
   - `refactor` — refactor code
   - `test` — thêm/sửa tests
   - `chore` — build, dependencies

3. **Stage và commit:**
   ```bash
   git add -A
   git commit -m "<message>"
   ```

4. **KHÔNG push** lên main trực tiếp — tạo PR thay thế

Nếu muốn tạo PR ngay, dùng `/pr` sau khi commit.
