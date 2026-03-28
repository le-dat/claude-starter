# /update-docs — Cập nhật tài liệu sau khi hoàn thành tính năng

Sau khi tôi hoàn thành tính năng vừa rồi, hãy thực hiện các bước sau:

## 1. Cập nhật `docs/changelog.md`
Thêm entry mới ở đầu file với format:
```
## [DATE] — [Tên tính năng ngắn gọn]
### Added
- [Mô tả những gì đã thêm]
### Changed  
- [Mô tả những gì đã thay đổi]
### Fixed
- [Mô tả những gì đã fix]
```

## 2. Cập nhật `docs/project-status.md`
- Đánh dấu ✅ cho task vừa hoàn thành trong danh sách milestones
- Cập nhật section "Trạng thái hiện tại" với tiến độ mới nhất
- Ghi note về việc cần làm tiếp theo

## 3. Cập nhật `docs/architecture.md` (nếu cần)
Nếu tính năng vừa thêm thay đổi kiến trúc hệ thống:
- Cập nhật sơ đồ hoặc mô tả luồng dữ liệu
- Ghi lại quyết định kỹ thuật quan trọng

## 4. Cập nhật `CLAUDE.md` (nếu cần)
Nếu có:
- Lệnh mới cần biết
- Pattern mới cần tuân theo
- Lỗi mới đã gặp và cách fix

Sau khi update xong, tóm tắt những gì đã thay đổi trong docs.
