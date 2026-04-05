# Claude Code Starter

> Standardized Claude workflows.

## 1. Setup

```bash
bash setup.sh
claude
```

## 2. Tell Claude About Your Project

```
I want to set up my project. Here's my info:
- Name: YOUR_PROJECT_NAME
- Type: web app / api / mobile / etc
- Tech stack: React + Node.js / Next.js + Supabase / etc
- Core feature: WHAT_IT_DOES
```

## 3. Then running command

1. `/checkpoint` => Save progress and sync docs
2. `/generate-plan` => Generate plan for new feature

## Structure

```
your-project/
├── CLAUDE.md          # Project brain
├── .claude/
│   ├── commands/      # /new-feature, /checkpoint, /commit, /pr
│   ├── agents/        # Test agents
│   └── hooks/          # Auto-lint, auto-save
└── docs/              # Auto-generated docs
```
