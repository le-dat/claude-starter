# /new-feature [feature-name] — Start developing a new feature

Standard workflow for developing a new feature following the issue-based process.

## Steps to Execute:

### 1. Research
- Read `docs/architecture.md` to understand current architecture
- Read `CLAUDE.md` to understand constraints and patterns
- View related issue on GitHub if any: `gh issue view <number>`

### 2. Planning
Before coding, present:
- Expected approach (technical approach)
- Files to be created/changed
- Edge cases to handle
- Complexity estimate

**Ask clarifying questions if requirements are unclear before coding.**

### 3. Setup Branch
```bash
git checkout main
git pull origin main
git checkout -b feat/<short-feature-name>
```

### 4. Implementation
- Implement in small parts
- Commit frequently with clear messages
- Follow existing patterns in codebase

### 5. Testing
- Write tests for business logic
- Run test suite: `npm run test`
- Run type check: `npm run type-check`
- Run lint: `npm run lint`

### 6. Documentation
- Run `/update-docs` to update documentation

### 7. PR
- Run `/pr` to create Pull Request
