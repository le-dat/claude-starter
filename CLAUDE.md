# CLAUDE.md — Project Memory

> 📌 Cập nhật file này sau mỗi tính năng lớn hoặc thay đổi kiến trúc.
> Claude sẽ đọc file này ở đầu mỗi phiên làm việc.

---

## 🎯 Mục tiêu dự án

<!-- Điền mục tiêu cụ thể: học tập / validate ý tưởng / prototype / production -->
**Mục tiêu:** [Mô tả ngắn gọn dự án của bạn]

**Đối tượng người dùng:** [Ai sẽ dùng sản phẩm này?]

**Vấn đề cần giải quyết:** [Vấn đề cốt lõi mà sản phẩm giải quyết]

---

## 🏗️ Kiến trúc tổng quan

**Tech Stack:**
- **Frontend:** Next.js + Tailwind CSS
- **Backend/Database:** Supabase / MongoDB
- **Auth:** Clerk
- **Payments:** Stripe
- **Email:** Resend
- **Hosting:** Vercel (frontend) + DigitalOcean (backend nếu cần)
- **Storage:** Cloudflare R2
- **AI:** Anthropic Claude API

**Cấu trúc thư mục chính:**
```
/app          → Next.js App Router pages
/components   → React components
/lib          → Utilities, helpers
/api          → API routes
/docs         → Tài liệu dự án (architecture, changelog, status)
```

---

## 🎨 Design Style Guide

- **UI Style:** [Minimal / Bold / Playful / Corporate — chọn một]
- **Color palette chính:** [Ví dụ: slate + emerald accent]
- **Font:** [Ví dụ: Geist Sans]
- **Component library:** [Ví dụ: shadcn/ui]
- **Dark mode:** [Có / Không]

---

## 📋 Milestones

### ✅ Milestone 1 — MVP
- [ ] [Tính năng 1]
- [ ] [Tính năng 2]
- [ ] [Tính năng 3]

### 🔜 Milestone 2 — Beta
- [ ] [Tính năng 4]
- [ ] [Tính năng 5]

---

## ⚠️ Constraints & Rules bắt buộc

1. **KHÔNG** push trực tiếp lên branch `main` — luôn dùng feature branch + PR
2. **KHÔNG** commit file `.env` lên git
3. **KHÔNG** xóa migration files của database
4. **KHÔNG** thay đổi schema database mà không có migration
5. Luôn viết test cho business logic quan trọng
6. Luôn update `docs/changelog.md` sau khi hoàn thành tính năng
7. Dùng TypeScript strict mode — không dùng `any`

---

## 🔌 MCPs đang kết nối

| MCP | Mục đích |
|-----|----------|
| `supabase` | Quản lý database |
| `github` | Tạo issues, PRs |
| `playwright` | Test UI tự động |
| `filesystem` | Đọc/ghi file |

---

## 📁 Tài liệu tự động cập nhật

Claude nên đọc và cập nhật các file sau khi cần:

- `docs/architecture.md` → Sau khi thay đổi hệ thống lớn
- `docs/changelog.md` → Sau mỗi tính năng hoàn thành
- `docs/project-status.md` → Khi bắt đầu/kết thúc session

---

## 🚀 Các lệnh thường dùng

```bash
npm run dev          # Chạy dev server
npm run build        # Build production
npm run test         # Chạy tests
npm run lint         # Lint code
npm run type-check   # TypeScript check
```

---

## 🧠 Quyết định kiến trúc đã chốt

<!-- Ghi lại các quyết định quan trọng và lý do tại sao -->

| Quyết định | Lý do |
|------------|-------|
| Dùng App Router thay Pages Router | Hỗ trợ Server Components, tốt hơn cho SEO |
| Dùng Supabase thay MongoDB | Real-time subscriptions, RLS security |

---

## 🐛 Các lỗi đã gặp & cách fix

<!-- Ghi lại để tránh lặp lại -->

- **[Tên lỗi]:** [Nguyên nhân] → [Cách fix]
