# /new-feature [tên-feature] — Bắt đầu phát triển tính năng mới

Workflow chuẩn để phát triển một tính năng mới theo quy trình issue-based.

## Các bước thực hiện:

### 1. Research (Nghiên cứu)
- Đọc `docs/architecture.md` để hiểu kiến trúc hiện tại
- Đọc `CLAUDE.md` để nắm constraints và patterns
- Xem issue liên quan trên GitHub nếu có: `gh issue view <number>`

### 2. Planning (Lập kế hoạch)
Trước khi code, hãy trình bày:
- Approach dự kiến (technical approach)
- Files sẽ được tạo/thay đổi
- Các edge cases cần xử lý
- Ước tính độ phức tạp

**Đặt câu hỏi làm rõ nếu yêu cầu chưa rõ ràng trước khi code.**

### 3. Setup branch
```bash
git checkout main
git pull origin main
git checkout -b feat/<tên-feature-ngắn>
```

### 4. Implementation (Triển khai)
- Implement từng phần nhỏ
- Commit thường xuyên với message rõ ràng
- Theo đúng patterns đã có trong codebase

### 5. Testing
- Viết tests cho business logic
- Chạy test suite: `npm run test`
- Chạy type check: `npm run type-check`
- Chạy lint: `npm run lint`

### 6. Documentation
- Chạy `/update-docs` để cập nhật tài liệu

### 7. PR
- Chạy `/pr` để tạo Pull Request
