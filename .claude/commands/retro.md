# /retro — Tổng kết phiên làm việc

Sau khi kết thúc session làm việc, hãy thực hiện tổng kết nhanh.

## Thực hiện:

1. **Nhìn lại những gì đã làm** trong session này:
   ```bash
   git log --oneline --since="8 hours ago"
   ```

2. **Tóm tắt:**
   - ✅ Đã hoàn thành: [liệt kê]
   - 🔄 Đang làm dở: [liệt kê + trạng thái]
   - 🐛 Bugs đã phát hiện nhưng chưa fix: [liệt kê]
   - 💡 Ý tưởng cải thiện: [liệt kê]

3. **Cập nhật `docs/project-status.md`** với:
   - Trạng thái cuối session
   - Next steps ưu tiên
   - Bất kỳ context quan trọng cần nhớ cho session tiếp theo

4. **Kiểm tra có gì cần làm trước khi thoát:**
   - Uncommitted changes? → Commit hoặc stash
   - Failing tests? → Ghi chú lại
   - TODOs trong code? → Tạo issues trên GitHub

5. **Gợi ý cho session tiếp theo:** Nên bắt đầu từ đâu?
