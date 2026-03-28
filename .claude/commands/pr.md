# /pr — Tạo Pull Request lên GitHub

Tạo một Pull Request từ branch hiện tại.

## Các bước thực hiện:

1. **Kiểm tra branch:** Đảm bảo không đang ở `main`
   ```bash
   git branch --show-current
   ```

2. **Push branch lên remote:**
   ```bash
   git push origin $(git branch --show-current)
   ```

3. **Tạo PR bằng GitHub CLI:**
   ```bash
   gh pr create \
     --title "<title>" \
     --body "<body>" \
     --base main
   ```

4. **PR body** nên bao gồm:
   - **Summary:** Mô tả ngắn những gì thay đổi
   - **Changes:** Danh sách thay đổi cụ thể
   - **Testing:** Cách kiểm tra tính năng
   - **Screenshots:** (nếu có UI changes)
   - **Closes:** Đóng issue nào (ví dụ: `Closes #42`)

5. In ra link PR sau khi tạo xong.
