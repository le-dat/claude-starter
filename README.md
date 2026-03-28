# 🚀 Claude Code Setup — PSB System

> Complete setup for Claude Code following the **PSB (Plan → Setup → Build)** system
> Based on Avthar Sewrathan's workflow

---

## 📁 Directory Structure

```
your-project/
│
├── CLAUDE.md                          # 🧠 Claude's Memory — read at start of each session
├── .env.example                       # 📋 Environment variable template
│
├── .claude/
│   ├── settings.json                  # ⚙️ Permissions + Hooks config
│   │
│   ├── commands/                      # ⚡ Custom slash commands
│   │   ├── update-docs.md             # /update-docs
│   │   ├── commit.md                  # /commit
│   │   ├── pr.md                      # /pr
│   │   ├── new-feature.md             # /new-feature
│   │   └── retro.md                   # /retro
│   │
│   ├── agents/                        # 🤖 Subagents running independently
│   │   ├── changelog-agent.md         # Update changelog
│   │   ├── frontend-test-agent.md     # Run Playwright tests
│   │   └── research-agent.md          # Research tech stack
│   │
│   └── hooks/                         # 🪝 Automation hooks
│       ├── on-stop.sh                 # Run after task completes
│       ├── auto-lint.sh               # Lint after file edit
│       └── pre-bash-check.sh          # Check dangerous commands
│
└── docs/
    ├── spec-doc.md                    # 📐 Project specification (Phase 1)
    ├── architecture.md                # 🏗️  System architecture
    ├── changelog.md                   # 📝 Change history
    └── project-status.md              # 📊 Session tracking
```

---

## ⚡ Quick Start

### Step 1: Copy this structure to your project

```bash
# Clone or copy this directory to your project root
cp -r claude-setup/. your-project/
cd your-project/
```

### Step 2: Give hooks execute permission

```bash
chmod +x .claude/hooks/*.sh
```

### Step 3: Setup environment variables

```bash
cp .env.example .env.local
# Fill in actual values in .env.local
```

### Step 4: Fill in CLAUDE.md

Open `CLAUDE.md` and fill in:
- [ ] Project goals
- [ ] Specific tech stack
- [ ] Design style guide
- [ ] Milestones

### Step 5: Complete spec-doc.md

Open `docs/spec-doc.md` and fill it in completely before coding.

### Step 6: Start Claude Code

```bash
claude
```

---

## 🎯 PSB System

### Phase 1: PLAN
Before opening terminal, answer 2 questions:

**Question 1:** What is the project goal?
- Learning → build fast, no need for production-ready
- Validate idea → minimal MVP in 1-2 weeks
- Real product → need full scalability, security

**Question 2:** What are the project milestones?
- Milestone 1 = MVP: [3-5 core features]
- Milestone 2 = Beta: [additional features after feedback]

**Deliverable:** Complete `docs/spec-doc.md`

---

### Phase 2: SETUP (7 steps)

| # | Step | File | Description |
|---|------|------|-------|
| 1 | GitHub Repo | — | Create repo, setup branches |
| 2 | Env Variables | `.env.local` | Copy from `.env.example`, fill in keys |
| 3 | CLAUDE.md | `CLAUDE.md` | Fill in project memory |
| 4 | Auto Docs | `docs/` | Create architecture, changelog, status |
| 5 | Plugins | — | Install Anthropic plugins |
| 6 | MCPs | `.claude/settings.json` | Config based on tech stack |
| 7 | Slash Commands | `.claude/commands/` | Already included in this setup |

**Bonus:** Pre-configured permissions + Hooks (configured in `settings.json`)

---

### Phase 3: BUILD

**3 Workflows:**

#### Workflow 1 — Single Feature
```
Research → Plan → Implement → Test
```
Use for: Single features, bug fixes

#### Workflow 2 — Issue-Based
```
GitHub Issues → Branch → Build → PR → Merge
```
Use for: Multi-feature projects, organized work

```bash
# Create issues from spec doc
gh issue create --title "feat: [feature name]" --body "[description]"

# Work on issue
git checkout -b feat/issue-42-feature-name
# ... code ...
/commit
/pr
```

#### Workflow 3 — Multi-Agent (advanced)
```
Git Worktrees → Multiple Claude instances in parallel → Merge
```
Use for: Large projects, speed needed

```bash
# Create worktrees for parallel development
git worktree add ../project-feat-a feat/feature-a
git worktree add ../project-feat-b feat/feature-b

# Open 2 terminals, run claude in each worktree
cd ../project-feat-a && claude
cd ../project-feat-b && claude
```

---

## ⚡ Slash Commands

| Command | Purpose |
|---------|---------|
| `/new-feature [name]` | Start new feature following standard workflow |
| `/commit` | Create git commit with standard message |
| `/pr` | Create Pull Request to GitHub |
| `/update-docs` | Update changelog, status, architecture |
| `/retro` | Summarize session, prepare for next time |

---

## 🤖 Subagents

| Agent | Trigger | Purpose |
|-------|---------|---------|
| `changelog-agent` | "update changelog" | Record changes after feature |
| `frontend-test-agent` | "test UI" | Run Playwright tests |
| `research-agent` | "research X" | Compare and recommend tech |

---

## 🪝 Hooks

| Hook | When | What |
|------|------|------|
| `on-stop.sh` | After task completes | Run lint + type check |
| `auto-lint.sh` | After file edit | Auto-fix lint errors |
| `pre-bash-check.sh` | Before bash command | Block dangerous commands |

---

## 📌 Tips from the Video

1. **Use Opus 4 for important tasks** — costs more but avoids time-consuming bugs
2. **Keep CLAUDE.md updated** — add patterns, encountered bugs, decisions
3. **When encountering a bug, don't just fix** — record it in CLAUDE.md to avoid repetition
4. **Code is cheaper than time** — don't hesitate to delete and rebuild if direction is wrong
5. **Use plan mode before coding** — `/new-feature` always plans before implementing
6. **Commit frequently** — each small feature = 1 clear commit

---

## 🔌 Suggested MCPs by Tech Stack

```json
// Add to .claude/settings.json > mcpServers

// Database
"supabase": { "command": "npx", "args": ["@supabase/mcp-server-supabase"] }
"mongodb": { "command": "npx", "args": ["@mongodb-js/mcp-server-mongodb"] }

// Testing
"playwright": { "command": "npx", "args": ["@playwright/mcp"] }

// Version Control
"github": { "command": "npx", "args": ["@modelcontextprotocol/server-github"] }

// Files
"filesystem": { "command": "npx", "args": ["@modelcontextprotocol/server-filesystem", "."] }
```

---

*This setup is based on the video "How I Start EVERY Claude Code Project" — PSB System*
