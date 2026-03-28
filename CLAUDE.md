# CLAUDE.md — Project Memory

> 📌 Update this file after each major feature or architectural change.
> Claude reads this file at the start of each session.

---

## 🎯 Project Goals

**Objective:** [Brief description of your project]

**Target Users:** [Who will use this product?]

**Problem Solved:** [Core problem the product solves]

---

## 🏗️ Architecture Overview

**Tech Stack:**
- **Frontend:** Next.js + Tailwind CSS
- **Backend/Database:** Supabase / MongoDB
- **Auth:** Clerk
- **Payments:** Stripe
- **Email:** Resend
- **Hosting:** Vercel (frontend) + DigitalOcean (backend if needed)
- **Storage:** Cloudflare R2
- **AI:** Anthropic Claude API

**Main Directory Structure:**
```
/app          → Next.js App Router pages
/components   → React components
/lib          → Utilities, helpers
/api          → API routes
/docs         → Project documentation (architecture, changelog, status)
```

---

## 🎨 Design Style Guide

- **UI Style:** [Minimal / Bold / Playful / Corporate — choose one]
- **Main Color palette:** [Example: slate + emerald accent]
- **Font:** [Example: Geist Sans]
- **Component library:** [Example: shadcn/ui]
- **Dark mode:** [Yes / No]

---

## 📋 Milestones

### ✅ Milestone 1 — MVP
- [ ] [Feature 1]
- [ ] [Feature 2]
- [ ] [Feature 3]

### 🔜 Milestone 2 — Beta
- [ ] [Feature 4]
- [ ] [Feature 5]

---

## ⚠️ Constraints & Rules

1. **DO NOT** push directly to `main` branch — always use feature branch + PR
2. **DO NOT** commit `.env` file to git
3. **DO NOT** delete database migration files
4. **DO NOT** change database schema without a migration
5. Always write tests for important business logic
6. Always update `docs/changelog.md` after completing a feature
7. Use TypeScript strict mode — no `any`

---

## 🔌 Connected MCPs

| MCP | Purpose |
|-----|---------|
| `supabase` | Database management |
| `github` | Create issues, PRs |
| `playwright` | Automated UI testing |
| `filesystem` | File read/write |

---

## 📁 Auto-Updated Documentation

Claude should read and update these files as needed:

- `docs/architecture.md` → After major system changes
- `docs/changelog.md` → After each completed feature
- `docs/project-status.md` → When starting/ending a session

---

## 🚀 Common Commands

```bash
npm run dev          # Run dev server
npm run build        # Build production
npm run test         # Run tests
npm run lint         # Lint code
npm run type-check   # TypeScript check
```

---

## 🧠 Architectural Decisions

| Decision | Reason |
|------------|-------|
| Use App Router instead of Pages Router | Server Components support, better SEO |
| Use Supabase instead of MongoDB | Real-time subscriptions, RLS security |

---

## 🐛 Known Issues & Fixes

- **[Bug Name]:** [Cause] → [Fix]
