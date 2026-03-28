# Project Spec Doc — [Project Name]

> 📋 Project specification document (lightweight PRD + EDD)
> Complete this section BEFORE starting to code.
> Claude uses this file to correctly understand what needs to be built.

---

## 1. Project Goals

**What is this project for?**
> [ ] Learning / practice
> [ ] Validate idea / quick prototype
> [ ] Real product for users

**Brief description (1-2 sentences):**
[Example: "Personal journal app that helps users record daily thoughts and receive AI insights"]

**What does success look like?**
[Example: "100 first users, each writing at least 5 entries/week"]

---

## 2. PRODUCT REQUIREMENTS

### 2.1 Target Users

**Primary user:**
[Specific description — example: "Office workers 25-35 years old, want to self-reflect but don't have journaling habit"]

**User pain points:**
- [Pain point 1]
- [Pain point 2]
- [Pain point 3]

### 2.2 User Stories

**Must Have (Milestone 1):**
- [ ] As a user, I want [action] to [purpose]
- [ ] As a user, I want [action] to [purpose]
- [ ] As a user, I want [action] to [purpose]

**Should Have (Milestone 2):**
- [ ] As a user, I want [action] to [purpose]

**Nice to Have (Milestone 3+):**
- [ ] As a user, I want [action] to [purpose]

### 2.3 User Interactions (SPECIFIC)

> ⚠️ This section is important — the more specific, the more accurate Claude builds

**[Feature 1 — example: Create journal entry]**
1. User opens app, sees "New Entry" button in top right
2. Click → modal opens with text editor
3. User types content (markdown supported)
4. Can add mood (emoji picker: 😊 😐 😔 😤 🎉)
5. Click "Save" → entry saved, modal closes
6. Entry appears at top of list with timestamp

**[Feature 2]**
...

### 2.4 UI/UX Requirements

- **Platform:** Web (responsive) / Mobile app / Desktop
- **Design style:** [Minimal / Bold / Playful / Professional]
- **Dark mode:** Yes / No
- **Language:** English / Vietnamese / Bilingual
- **Accessibility:** Basic / WCAG AA compliant

---

## 3. ENGINEERING REQUIREMENTS

### 3.1 Tech Stack

| Component | Technology | Reason |
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

**App type:**
> [ ] Full-stack monolith (Next.js)
> [ ] Frontend + separate backend
> [ ] Serverless functions only

**Database design (summary):**

| Table | Purpose | Main Fields |
|------|---------|--------------|
| users | User info | id, clerk_id, email, created_at |
| [table_2] | [purpose] | [fields] |

**Authentication flow:**
- [ ] Email/Password
- [ ] Google OAuth
- [ ] GitHub OAuth
- [ ] Magic link

**Payment model (if any):**
- [ ] One-time purchase
- [ ] Monthly subscription
- [ ] Freemium (free tier + paid)
- Price: [Free tier limits] / $[X]/month / $[Y]/year

### 3.3 API Design

**Main API routes:**

| Route | Method | Purpose | Auth required |
|-------|--------|---------|---------------|
| `/api/entries` | GET | Get entries list | ✅ |
| `/api/entries` | POST | Create new entry | ✅ |
| `/api/entries/[id]` | PUT | Update entry | ✅ |
| `/api/entries/[id]` | DELETE | Delete entry | ✅ |

### 3.4 Third-party Integrations

| Service | Purpose | When to Trigger |
|---------|---------|----------------|
| Clerk | Auth | Every protected route |
| Stripe | Payments | Upgrade plan |
| Resend | Email | Welcome, password reset |
| Claude API | AI features | [When] |

### 3.5 Performance Requirements

- Page load: < 3s
- API response: < 500ms
- Database queries: < 100ms

### 3.6 Security Requirements

- [ ] RLS on Supabase (users only see their own data)
- [ ] API routes check auth
- [ ] Input validation & sanitization
- [ ] Rate limiting on AI endpoints
- [ ] HTTPS everywhere

---

## 4. MILESTONES & TIMELINE

### Milestone 1 — MVP (Target: [DATE])
**Definition of Done:** [When is MVP considered complete?]

Includes:
- [Feature 1]
- [Feature 2]
- [Feature 3]
- Deployed to production

### Milestone 2 — Beta (Target: [DATE])
**Definition of Done:** [When is Beta considered complete?]

Includes:
- [Feature 4]
- [Feature 5]

---

## 5. OUT OF SCOPE (Not doing this time)

- [Thing to exclude to avoid scope creep]
- [Thing to exclude]
- Mobile native app (only responsive web)

---

## 6. OPEN QUESTIONS

> Questions without answers — need decisions before coding

- [ ] [Question 1] — Decision deadline: [DATE]
- [ ] [Question 2]
