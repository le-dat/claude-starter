# 🚀 Claude Code Setup — PSB System

> Bộ setup hoàn chỉnh cho Claude Code theo hệ thống **PSB (Plan → Setup → Build)**
> Dựa trên workflow của Avthar Sewrathan

---

## 📁 Cấu trúc thư mục

```
your-project/
│
├── CLAUDE.md                          # 🧠 Memory của Claude — đọc đầu mỗi session
├── .env.example                       # 📋 Template biến môi trường
│
├── .claude/
│   ├── settings.json                  # ⚙️  Permissions + Hooks config
│   │
│   ├── commands/                      # ⚡ Slash commands tùy chỉnh
│   │   ├── update-docs.md             # /update-docs
│   │   ├── commit.md                  # /commit
│   │   ├── pr.md                      # /pr
│   │   ├── new-feature.md             # /new-feature
│   │   └── retro.md                   # /retro
│   │
│   ├── agents/                        # 🤖 Subagents chạy độc lập
│   │   ├── changelog-agent.md         # Cập nhật changelog
│   │   ├── frontend-test-agent.md     # Chạy Playwright tests
│   │   └── research-agent.md          # Nghiên cứu tech stack
│   │
│   └── hooks/                         # 🪝 Automation hooks
│       ├── on-stop.sh                 # Chạy sau khi task xong
│       ├── auto-lint.sh               # Lint sau khi edit file
│       └── pre-bash-check.sh          # Kiểm tra lệnh nguy hiểm
│
└── docs/
    ├── spec-doc.md                    # 📐 Project specification (Phase 1)
    ├── architecture.md                # 🏗️  System architecture
    ├── changelog.md                   # 📝 Change history
    └── project-status.md              # 📊 Session tracking
```

---

## ⚡ Bắt đầu nhanh

### Bước 1: Copy cấu trúc này vào dự án của bạn

```bash
# Clone hoặc copy thư mục này vào root của dự án
cp -r claude-setup/. your-project/
cd your-project
```

### Bước 2: Cấp quyền cho hooks

```bash
chmod +x .claude/hooks/*.sh
```

### Bước 3: Setup biến môi trường

```bash
cp .env.example .env.local
# Điền các giá trị thực vào .env.local
```

### Bước 4: Điền thông tin vào CLAUDE.md

Mở `CLAUDE.md` và điền:
- [ ] Mục tiêu dự án
- [ ] Tech stack cụ thể
- [ ] Design style guide
- [ ] Milestones

### Bước 5: Hoàn thiện spec-doc.md

Mở `docs/spec-doc.md` và điền đầy đủ trước khi code.

### Bước 6: Khởi động Claude Code

```bash
claude
```

---

## 🎯 Hệ thống PSB

### Phase 1: PLAN
Trước khi mở terminal, trả lời 2 câu hỏi:

**Câu hỏi 1:** Mục tiêu của dự án là gì?
- Học tập → build nhanh, không cần production-ready
- Validate ý tưởng → MVP tối giản trong 1-2 tuần
- Sản phẩm thực → cần scalability, security đầy đủ

**Câu hỏi 2:** Các milestones của dự án là gì?
- Milestone 1 = MVP: [3-5 tính năng cốt lõi]
- Milestone 2 = Beta: [thêm tính năng sau khi có feedback]

**Deliverable:** Hoàn thiện `docs/spec-doc.md`

---

### Phase 2: SETUP (7 bước)

| # | Bước | File | Mô tả |
|---|------|------|-------|
| 1 | GitHub Repo | — | Tạo repo, setup branches |
| 2 | Env Variables | `.env.local` | Copy từ `.env.example`, điền keys |
| 3 | CLAUDE.md | `CLAUDE.md` | Điền project memory |
| 4 | Docs tự động | `docs/` | Tạo architecture, changelog, status |
| 5 | Plugins | — | Cài Anthropic plugins |
| 6 | MCPs | `.claude/settings.json` | Config theo tech stack |
| 7 | Slash Commands | `.claude/commands/` | Đã có sẵn trong bộ này |

**Bonus:** Pre-configure permissions + Hooks (đã config trong `settings.json`)

---

### Phase 3: BUILD

**3 Workflows:**

#### Workflow 1 — Single Feature
```
Research → Plan → Implement → Test
```
Dùng cho: Tính năng đơn lẻ, bug fix

#### Workflow 2 — Issue-Based
```
GitHub Issues → Branch → Build → PR → Merge
```
Dùng cho: Dự án có nhiều tính năng, làm việc có tổ chức

```bash
# Tạo issues từ spec doc
gh issue create --title "feat: [tên tính năng]" --body "[mô tả]"

# Làm việc theo issue
git checkout -b feat/issue-42-ten-tinh-nang
# ... code ...
/commit
/pr
```

#### Workflow 3 — Multi-Agent (nâng cao)
```
Git Worktrees → Nhiều Claude instances song song → Merge
```
Dùng cho: Dự án lớn, cần tốc độ

```bash
# Tạo worktrees cho parallel development
git worktree add ../project-feat-a feat/feature-a
git worktree add ../project-feat-b feat/feature-b

# Mở 2 terminal, chạy claude ở mỗi worktree
cd ../project-feat-a && claude
cd ../project-feat-b && claude
```

---

## ⚡ Slash Commands

| Command | Mục đích |
|---------|---------|
| `/new-feature [tên]` | Bắt đầu tính năng mới theo workflow chuẩn |
| `/commit` | Tạo git commit với message chuẩn |
| `/pr` | Tạo Pull Request lên GitHub |
| `/update-docs` | Cập nhật changelog, status, architecture |
| `/retro` | Tổng kết session, chuẩn bị cho lần sau |

---

## 🤖 Subagents

| Agent | Trigger | Mục đích |
|-------|---------|---------|
| `changelog-agent` | "cập nhật changelog" | Ghi lại thay đổi sau feature |
| `frontend-test-agent` | "test UI" | Chạy Playwright tests |
| `research-agent` | "nghiên cứu X" | So sánh và recommend tech |

---

## 🪝 Hooks

| Hook | Khi nào | Làm gì |
|------|---------|--------|
| `on-stop.sh` | Sau khi task xong | Chạy lint + type check |
| `auto-lint.sh` | Sau khi edit file | Auto-fix lint errors |
| `pre-bash-check.sh` | Trước lệnh bash | Block lệnh nguy hiểm |

---

## 📌 Tips từ video

1. **Dùng Opus 4 cho tasks quan trọng** — tốn hơn nhưng tránh lỗi tốn thời gian fix
2. **Cập nhật CLAUDE.md liên tục** — thêm patterns, lỗi đã gặp, decisions
3. **Khi gặp bug, đừng chỉ fix** — ghi vào CLAUDE.md để tránh lặp lại
4. **Code rẻ hơn thời gian** — đừng ngại xóa và build lại nếu direction sai
5. **Dùng plan mode trước khi code** — `/new-feature` luôn plan trước khi implement
6. **Commit thường xuyên** — mỗi tính năng nhỏ = 1 commit rõ ràng

---

## 🔌 MCPs gợi ý theo tech stack

```json
// Thêm vào .claude/settings.json > mcpServers

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

*Setup này dựa trên video "How I Start EVERY Claude Code Project" — PSB System*
