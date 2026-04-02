#!/bin/bash
# setup.sh — Initialize project with claude-starter
# Usage: bash setup.sh [project-name]

set -e

# ── Colors ───────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

info()    { echo -e "${BLUE}ℹ️  $1${NC}"; }
success() { echo -e "${GREEN}✅ $1${NC}"; }
warn()    { echo -e "${YELLOW}⚠️  $1${NC}"; }
error()   { echo -e "${RED}❌ $1${NC}"; exit 1; }

# ── Determine source directory ───────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-.}"  # If no argument passed, use current directory

# ── Header ───────────────────────────────────
echo ""
echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║       Claude Setup — Initialize      ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
echo ""

# ── Prevent copying into itself ─────────
if [ "$(realpath "$TARGET_DIR")" = "$(realpath "$SCRIPT_DIR")" ]; then
  error "Cannot setup into the claude-setup directory itself. Run: bash setup.sh /path/to/your-project"
fi

# ── Create target directory if it doesn't exist ──────────
if [ ! -d "$TARGET_DIR" ]; then
  mkdir -p "$TARGET_DIR"
  info "Created directory: $TARGET_DIR"
fi

cd "$TARGET_DIR"
info "Setup into: $(pwd)"
echo ""

# ── Copy files ───────────────────────────────
info "Copying claude-setup files..."

# Copy .claude/ folder
cp -r "$SCRIPT_DIR/.claude" .
success "Copied .claude/ (commands, agents, hooks, settings)"

# Copy CLAUDE.md if it doesn't exist
if [ ! -f "CLAUDE.md" ]; then
  cp "$SCRIPT_DIR/CLAUDE.md" .
  success "Copied CLAUDE.md"
else
  warn "CLAUDE.md already exists — skipping"
fi

# Copy .env.example if it doesn't exist
if [ ! -f ".env.example" ]; then
  cp "$SCRIPT_DIR/.env.example" .
  success "Copied .env.example"
else
  warn ".env.example already exists — skipping"
fi

echo ""

# ── Set execution permissions for hooks ─────────────
info "Setting execution permissions for hooks..."
chmod +x .claude/hooks/*.sh
success "Hooks have been chmod +x"

# ── Create docs/ folder with templates ──────────
info "Creating docs/ folder..."
mkdir -p docs

if [ ! -f "docs/spec-doc.md" ]; then
- Initialized project with claude-setup

if [ ! -f "docs/architecture.md" ]; then
  cat > docs/architecture.md << 'EOF'
# Architecture

> System architecture and technical decisions.
> Fill this in after setting up CLAUDE.md.

## Tech Stack
| Layer | Technology | Reason |
|-------|-----------|--------|
| Frontend | | |
| Backend | | |
| Database | | |
| Auth | | |
| Hosting | | |

## Directory Structure
```
your-project/
├── (fill in after scaffolding)
```

## Key Components
-

## Security Checklist
- [ ] Input validation on all endpoints
- [ ] Auth middleware on protected routes
- [ ] No secrets in code
- [ ] CORS configured properly
- [ ] Rate limiting enabled
EOF
  success "Created docs/architecture.md"
fi

if [ ! -f "docs/project-plan.md" ]; then
  cat > docs/project-plan.md << 'EOF'
# Project Plan

> Auto-generated. Update via `/checkpoint` or `/generate-plan`.

## Milestones

### Milestone 1 — MVP
- [ ] Feature 1
- [ ] Feature 2

### Milestone 2 — Beta
- [ ] Feature 3

---
*Run `/generate-plan` to generate a detailed plan based on your spec-doc.*
EOF
  success "Created docs/project-plan.md"
fi

if [ ! -f "docs/project-status.md" ]; then
  DATE=$(date +%Y-%m-%d)
  cat > docs/project-status.md << EOF
# Project Status

> Last updated: $DATE

## Current Phase
**Phase 0: Setup**

## Overall Progress
**0%** ░░░░░░░░░░░░░░░░░░░░

## Current Status
- ✅ Completed: Project setup with claude-starter
- 🔄 In Progress: Filling CLAUDE.md and spec-doc.md
- 📋 Next: Run \`/generate-plan\` after filling docs

## Session History

### $DATE — Session 1
- Initialized project with claude-starter

## Next Session — Start Here
1. Tell Claude your project info to fill CLAUDE.md
2. Fill docs/spec-doc.md with project requirements
3. Run \`/generate-plan\` to get the implementation roadmap
EOF
  success "Created docs/project-status.md"
fi

if [ ! -f "docs/changelog.md" ]; then
  DATE=$(date +%Y-%m-%d)
  cat > docs/changelog.md << EOF
# Changelog

> All notable changes are recorded here.
> Auto-updated by \`/checkpoint\`.

---

## [$DATE] — Initial Setup

### Added
- Project initialized with claude-starter
- .claude/ configuration (commands, agents, hooks)
- docs/ folder structure
EOF
  success "Created docs/changelog.md"
fi

# ── Create .claude/plans/ folder ─────────────────
mkdir -p .claude/plans
success "Created .claude/plans/ (for /new-feature command)"

# ── Check if claude CLI is available ─────────
echo ""
if command -v claude &> /dev/null; then
  success "Claude Code CLI is installed: $(claude --version 2>/dev/null || echo 'version unknown')"
else
  warn "Claude Code CLI is not installed. Install with: npm install -g @anthropic-ai/claude-code"
fi

# ── Summary ──────────────────────────────────
echo ""
echo -e "${GREEN}╔══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║           Setup complete!            ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════╝${NC}"
echo ""
echo "📁 Created directories:"
echo "   .claude/commands/    — 5 slash commands"
echo "   .claude/agents/      — 3 agents"
echo "   .claude/hooks/       — 3 hooks (chmod +x applied)"
echo "   .claude/plans/       — Plans for /new-feature"
echo "   docs/                — 5 doc templates"
echo ""
echo "🚀 Next steps:"
echo "   1. cd $(pwd)"
echo "   2. claude"
echo "   3. Tell Claude: 'I want to set up my project. Here's my info:'"
echo "      - Name: <project name>"
echo "      - Type: <type: web app / api / etc>"
echo "      - Stack: <tech stack>"
echo "      - Core feature: <main features>"
echo ""
echo "   Or run immediately: /generate-plan after filling CLAUDE.md"
echo ""
