# CLAUDE.md — {{PROJECT_NAME}}

> [ [Spec](docs/spec-doc.md) ] [ [Architecture](docs/architecture.md) ] [ [Plan](docs/project-plan.md) ] [ [Status](docs/project-status.md) ] [ [Changelog](docs/changelog.md) ]

> Claude reads this at the start of every session for core rules and tech stack.

---

## 1. Project Overview

**Product:** {{PROJECT_NAME}} — {{PROJECT_DESCRIPTION}}
**Core mechanic:** {{CORE_MECHANIC}}
**Links:** [Detailed Specification](docs/spec-doc.md) | [System Architecture](docs/architecture.md)

---

## 2. Repository Structure

```
{{REPO_STRUCTURE}}
```

---

## 3. Core Logic

Detailed in [Project Specification](docs/spec-doc.md).

{{CORE_LOGIC_SECTION}}

---

## 4. System Architecture

Detailed in [Architecture Design](docs/architecture.md).

### Core Coding Patterns

{{CODING_PATTERNS}}

---

## 5. Environment Variables

```bash
{{ENV_VARS}}
```

---

## 6. Coding Patterns & Conventions

### Commit convention

```
feat: add new feature
fix: handle edge case
chore: update dependencies
test: add test coverage
docs: update documentation
```

### TypeScript rules

- `strict: true` — no `any`, no implicit returns
- All DTOs use `class-validator` decorators
- All entities use TypeORM decorators, never raw SQL except migrations
- All service methods return typed promises, never `Promise<any>`

### Error handling pattern

```typescript
// Custom exceptions — always extend HttpException
export class BusinessException extends BadRequestException {
  constructor(message: string) {
    super(message);
  }
}
```

### Testing pattern

```typescript
describe("ServiceName", () => {
  it("should handle success case");
  it("should handle error case");
});
```

---

## 7. Testing & Quality

**Essential Commands:**

- `{{TEST_COMMAND}}` — Run tests
- `{{LINT_COMMAND}} && {{TYPE_CHECK_COMMAND}}` — Static analysis

---

## 8. Security & Safety

Full checklist in [Architecture (Security)](docs/architecture.md).

{{SECURITY_CHECKLIST}}

---

## 9. Constraints & Rules (non-negotiable)

1. **Never** push directly to `main` — always feature branch + PR
2. **Never** commit `.env` or `.env.local` files
3. **Never** use `synchronize: true` in TypeORM DataSource (production data loss risk)
4. **Never** delete migration files — always roll forward
5. **Always** run `{{TYPE_CHAIN_COMMAND}}` after any contract ABI change
6. **Always** create a migration after changing any TypeORM entity
7. **Always** use `/checkpoint` after completing a feature or ending a work session
8. **Always** update `docs/project-plan.md` via `/checkpoint` to track progress
9. Critical logic changes require a second pair of eyes (or explicit test coverage) before merge
10. {{PROJECT_SPECIFIC_RULE}}

---

## 10. Available Slash Commands

| Command | When to use |
| :--- | :--- |
| `/new-feature [name]` | Start any new feature (plans before coding) |
| `/commit` | Create a well-formatted git commit |
| `/pr` | Create a GitHub Pull Request |
| `/checkpoint` | Unified sync: update changelog + status + plan progress |
| `/generate-plan` | Create a detailed implementation plan |
| {{ADDITIONAL_COMMANDS}}

---

## 11. Connected MCPs

| MCP | Purpose |
|-----|---------|
| `github` | Create issues, PRs, search code |
| `filesystem` | File read/write operations |
| `{{PROJECT_MCP}}` | {{PROJECT_MCP_PURPOSE}} |

---

## 12. Architectural Decisions

| Decision | Reason |
|----------|--------|
{{ARCHITECTURAL_DECISIONS}}

---

## 13. Known Issues

| Issue | Workaround |
|-------|------------|
{{KNOWN_ISSUES}}
