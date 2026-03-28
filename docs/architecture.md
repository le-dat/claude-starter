# Architecture — System Architecture

> 📌 Update this file after each major architectural change.
> Last updated: [DATE]

---

## System Overview

[2-3 sentence brief description of the system: what it does, who it serves, scale]

---

## Tech Stack

| Layer | Technology | Reason for Choice |
|-------|-----------|------------|
| Frontend Framework | Next.js 15 (App Router) | SSR, SEO, Server Components |
| Styling | Tailwind CSS + shadcn/ui | Fast, consistent |
| Database | Supabase (PostgreSQL) | Real-time, RLS, built-in auth |
| Auth | Clerk | Easy integration, multiple providers |
| Payments | Stripe | Industry standard |
| Email | Resend | Developer-friendly |
| Hosting | Vercel | Zero-config deploy, Edge |
| Storage | Cloudflare R2 | Cheap, fast, S3-compatible |
| AI | Anthropic Claude API | Best-in-class coding + reasoning |

---

## Overall Architecture

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

## Main Data Flows

### Flow 1: [Flow name, example: User Authentication]
1. User clicks login
2. Clerk handles OAuth / email
3. JWT token is returned
4. Next.js middleware verifies token
5. User data is loaded from Supabase

### Flow 2: [Another flow name]
...

---

## Database Schema

### Table: `users`
```sql
id          uuid PRIMARY KEY DEFAULT gen_random_uuid()
clerk_id    text UNIQUE NOT NULL
email       text NOT NULL
name        text
created_at  timestamptz DEFAULT now()
```

### Table: `[other table name]`
```sql
-- Add table schema
```

---

## Key Components

### `components/[ComponentName]`
**Purpose:** [What it does]
**Props:** [Main props]
**State:** [What state it manages]

---

## Environment Variables

| Variable | Purpose | Required |
|----------|---------|----------|
| `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY` | Clerk frontend auth | ✅ |
| `CLERK_SECRET_KEY` | Clerk server auth | ✅ |
| `DATABASE_URL` | Supabase connection | ✅ |
| `STRIPE_SECRET_KEY` | Stripe payments | ✅ |
| `RESEND_API_KEY` | Email sending | ✅ |
| `ANTHROPIC_API_KEY` | AI features | ✅ |

---

## Architecture Decisions (ADRs)

### ADR-001: [Decision name]
- **Date:** [DATE]
- **Status:** Decided
- **Context:** [Problem encountered]
- **Decision:** [What was chosen]
- **Consequences:** [Trade-offs]

---

## Performance Considerations

- [ ] Images use `next/image` with lazy loading
- [ ] Database queries have appropriate indexes
- [ ] API responses are cached when possible
- [ ] Bundle size is monitored

---

## Security Checklist

- [ ] RLS (Row Level Security) is enabled on Supabase
- [ ] API routes have auth middleware
- [ ] Input validation on both client and server
- [ ] Environment variables are not exposed
- [ ] CORS is configured correctly
