# Claude Code Setup

> AI Agent configuration — copy to any project for standardized Claude workflows.

## Setup (30 seconds)

```bash
# 1. Run setup — creates directory, copies files, sets permissions
bash setup.sh /path/to/your-project

# 2. Enter your project
cd your-project

# 3. Start Claude
claude
```

That's it. The rest is automatic.

---

## First Time? Tell Claude About Your Project

When Claude starts, paste this:

```
I want to set up my project. Here's my info:
- Name: YOUR_PROJECT_NAME
- Type: web app / api / mobile / etc
- Tech stack: React + Node.js / Next.js + Supabase / etc
- Core feature: WHAT_IT_DOES
```

Claude will fill in the rest.

---

## Daily Commands

| Command | What it does |
|---------|--------------|
| `/new-feature name` | Plan a feature (always plans before coding) |
| `/checkpoint` | Save progress and sync docs |
| `/commit` | Create a commit |
| `/pr` | Open a pull request |

---

## What You Get

```
your-project/
├── CLAUDE.md          # Project brain
├── .claude/
│   ├── commands/      # /new-feature, /checkpoint, /commit, /pr
│   ├── agents/        # Test agents
│   └── hooks/          # Auto-lint, auto-save
└── docs/              # Auto-generated docs
```

---

## Learn More

- [Setup docs](docs/spec-doc.md) — fill in your project vision
- [Architecture](docs/architecture.md) — system design
- [Roadmap](docs/project-plan.md) — implementation plan
