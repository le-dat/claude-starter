# Project Spec Doc — [Tên Dự Án]

> 📋 Tài liệu đặc tả dự án (lightweight PRD + EDD)
> Hoàn thiện phần này TRƯỚC KHI bắt đầu code.
> Claude sẽ dùng file này để hiểu đúng những gì cần xây dựng.

---

## 1. Mục tiêu dự án

**Dự án này để làm gì?**
> [ ] Học tập / thực hành
> [ ] Validate ý tưởng / prototype nhanh
> [ ] Sản phẩm thực tế cho người dùng

**Mô tả ngắn (1-2 câu):**
[Ví dụ: "Ứng dụng journal cá nhân giúp người dùng ghi lại suy nghĩ hàng ngày và nhận insight từ AI"]

**Thành công trông như thế nào?**
[Ví dụ: "100 người dùng đầu tiên, mỗi người ghi ít nhất 5 entries/tuần"]

---

## 2. PRODUCT REQUIREMENTS

### 2.1 Đối tượng người dùng

**Primary user:**
[Mô tả cụ thể — ví dụ: "Nhân viên văn phòng 25-35 tuổi, muốn tự phản tư nhưng không có thói quen viết journal"]

**User pain points:**
- [Pain point 1]
- [Pain point 2]
- [Pain point 3]

### 2.2 User Stories

**Must Have (Milestone 1):**
- [ ] Là user, tôi muốn [hành động] để [mục đích]
- [ ] Là user, tôi muốn [hành động] để [mục đích]
- [ ] Là user, tôi muốn [hành động] để [mục đích]

**Should Have (Milestone 2):**
- [ ] Là user, tôi muốn [hành động] để [mục đích]

**Nice to Have (Milestone 3+):**
- [ ] Là user, tôi muốn [hành động] để [mục đích]

### 2.3 User Interactions (CỤ THỂ)

> ⚠️ Phần này quan trọng — càng cụ thể, Claude càng build đúng

**[Tính năng 1 — ví dụ: Tạo journal entry]**
1. User mở app, thấy nút "New Entry" ở góc trên phải
2. Click vào → modal mở ra với text editor
3. User gõ nội dung (markdown supported)
4. Có thể thêm mood (emoji picker: 😊 😐 😔 😤 🎉)
5. Click "Save" → entry được lưu, modal đóng
6. Entry xuất hiện ở đầu danh sách với timestamp

**[Tính năng 2]**
...

### 2.4 UI/UX Requirements

- **Platform:** Web (responsive) / Mobile app / Desktop
- **Design style:** [Minimal / Bold / Playful / Professional]
- **Dark mode:** Có / Không
- **Language:** Tiếng Việt / Tiếng Anh / Song ngữ
- **Accessibility:** Cơ bản / WCAG AA compliant

---

## 3. ENGINEERING REQUIREMENTS

### 3.1 Tech Stack

| Component | Technology | Lý do |
|-----------|-----------|-------|
| Framework | Next.js 15 | |
| Styling | Tailwind CSS + shadcn/ui | |
| Database | Supabase | |
| Auth | Clerk | |
| Payments | Stripe | |
| Email | Resend | |
| Hosting | Vercel | |
| AI | Anthropic Claude | |

### 3.2 Architecture Overview

**Loại app:**
> [ ] Full-stack monolith (Next.js)
> [ ] Frontend + separate backend
> [ ] Serverless functions only

**Database design (tóm tắt):**

| Bảng | Mục đích | Fields chính |
|------|---------|--------------|
| users | Thông tin user | id, clerk_id, email, created_at |
| [table_2] | [mục đích] | [fields] |

**Authentication flow:**
- [ ] Email/Password
- [ ] Google OAuth
- [ ] GitHub OAuth
- [ ] Magic link

**Payment model (nếu có):**
- [ ] One-time purchase
- [ ] Monthly subscription
- [ ] Freemium (free tier + paid)
- Giá: [Free tier limits] / $[X]/tháng / $[Y]/năm

### 3.3 API Design

**Các API routes chính:**

| Route | Method | Mục đích | Auth required |
|-------|--------|---------|---------------|
| `/api/entries` | GET | Lấy danh sách entries | ✅ |
| `/api/entries` | POST | Tạo entry mới | ✅ |
| `/api/entries/[id]` | PUT | Cập nhật entry | ✅ |
| `/api/entries/[id]` | DELETE | Xóa entry | ✅ |

### 3.4 Third-party Integrations

| Service | Mục đích | Khi nào trigger |
|---------|---------|----------------|
| Clerk | Auth | Mọi protected route |
| Stripe | Thanh toán | Upgrade plan |
| Resend | Email | Welcome, password reset |
| Claude API | AI features | [Khi nào] |

### 3.5 Performance Requirements

- Page load: < 3s
- API response: < 500ms
- Database queries: < 100ms

### 3.6 Security Requirements

- [ ] RLS trên Supabase (users chỉ thấy data của mình)
- [ ] API routes kiểm tra auth
- [ ] Input validation & sanitization
- [ ] Rate limiting trên AI endpoints
- [ ] HTTPS everywhere

---

## 4. MILESTONES & TIMELINE

### Milestone 1 — MVP (Target: [DATE])
**Definition of Done:** [Khi nào coi là xong MVP?]

Bao gồm:
- [Feature 1]
- [Feature 2]
- [Feature 3]
- Deployed lên production

### Milestone 2 — Beta (Target: [DATE])
**Definition of Done:** [Khi nào coi là xong Beta?]

Bao gồm:
- [Feature 4]
- [Feature 5]

---

## 5. OUT OF SCOPE (Không làm trong lần này)

- [Thứ sẽ không làm để tránh scope creep]
- [Thứ sẽ không làm]
- Mobile native app (chỉ làm web responsive)

---

## 6. OPEN QUESTIONS

> Các câu hỏi chưa có câu trả lời — cần quyết định trước khi code

- [ ] [Câu hỏi 1] — Deadline quyết định: [DATE]
- [ ] [Câu hỏi 2]
