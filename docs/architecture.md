# Architecture — Kiến trúc hệ thống

> 📌 Cập nhật file này sau mỗi thay đổi lớn về kiến trúc.
> Last updated: [DATE]

---

## Tổng quan hệ thống

[Mô tả ngắn 2-3 câu về hệ thống: làm gì, phục vụ ai, quy mô]

---

## Tech Stack

| Layer | Technology | Lý do chọn |
|-------|-----------|------------|
| Frontend Framework | Next.js 15 (App Router) | SSR, SEO, Server Components |
| Styling | Tailwind CSS + shadcn/ui | Nhanh, consistent |
| Database | Supabase (PostgreSQL) | Real-time, RLS, auth tích hợp |
| Auth | Clerk | Dễ integrate, nhiều providers |
| Payments | Stripe | Industry standard |
| Email | Resend | Developer-friendly |
| Hosting | Vercel | Zero-config deploy, Edge |
| Storage | Cloudflare R2 | Rẻ, nhanh, S3-compatible |
| AI | Anthropic Claude API | Best-in-class coding + reasoning |

---

## Kiến trúc tổng thể

```
┌─────────────────────────────────────────────┐
│                   CLIENT                    │
│         Next.js App (Vercel Edge)           │
└────────────────┬────────────────────────────┘
                 │ HTTPS
┌────────────────▼────────────────────────────┐
│               API LAYER                     │
│          Next.js API Routes                 │
│    /api/auth  /api/data  /api/payments      │
└───┬────────────┬────────────────┬───────────┘
    │            │                │
┌───▼──┐   ┌────▼─────┐   ┌─────▼──────┐
│Clerk │   │Supabase  │   │  Stripe    │
│Auth  │   │Database  │   │  Payments  │
└──────┘   └──────────┘   └────────────┘
```

---

## Luồng dữ liệu chính

### Luồng 1: [Tên luồng, ví dụ: User Authentication]
1. User click login
2. Clerk xử lý OAuth / email
3. JWT token được trả về
4. Middleware Next.js verify token
5. User data được load từ Supabase

### Luồng 2: [Tên luồng khác]
...

---

## Database Schema

### Bảng: `users`
```sql
id          uuid PRIMARY KEY DEFAULT gen_random_uuid()
clerk_id    text UNIQUE NOT NULL
email       text NOT NULL
name        text
created_at  timestamptz DEFAULT now()
```

### Bảng: `[tên bảng khác]`
```sql
-- Thêm schema của bảng
```

---

## Key Components

### `components/[ComponentName]`
**Mục đích:** [Làm gì]
**Props:** [Props chính]
**State:** [State quản lý gì]

---

## Environment Variables

| Variable | Mục đích | Required |
|----------|---------|----------|
| `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY` | Clerk frontend auth | ✅ |
| `CLERK_SECRET_KEY` | Clerk server auth | ✅ |
| `DATABASE_URL` | Supabase connection | ✅ |
| `STRIPE_SECRET_KEY` | Stripe payments | ✅ |
| `RESEND_API_KEY` | Email sending | ✅ |
| `ANTHROPIC_API_KEY` | AI features | ✅ |

---

## Quyết định kiến trúc (ADRs)

### ADR-001: [Tên quyết định]
- **Ngày:** [DATE]
- **Trạng thái:** Đã chốt
- **Bối cảnh:** [Vấn đề gặp phải]
- **Quyết định:** [Chọn gì]
- **Hậu quả:** [Trade-offs]

---

## Performance Considerations

- [ ] Images dùng `next/image` với lazy loading
- [ ] Database queries có indexes phù hợp
- [ ] API responses được cache khi có thể
- [ ] Bundle size được monitor

---

## Security Checklist

- [ ] RLS (Row Level Security) được bật trên Supabase
- [ ] API routes có auth middleware
- [ ] Input validation ở cả client và server
- [ ] Environment variables không bị expose
- [ ] CORS được config đúng
