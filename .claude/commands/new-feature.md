# Command: new-feature

## Description
Start a new feature following the correct process: Plan first → Code later. Never start coding immediately upon receiving a request.

## Usage
```
/new-feature <feature-name>
/new-feature user-authentication
/new-feature payment-integration
/new-feature dashboard-analytics
```

## When receiving this command, Claude must follow this exact order:

### Step 1 — Read context
```
1. Read CLAUDE.md → stack, patterns, constraints
2. Read docs/spec-doc.md → which milestone does this feature belong to?
3. Read docs/project-plan.md → where is this feature in the roadmap?
4. Scan current codebase → avoid duplicates, leverage existing code
```

### Step 2 — Analysis and Create Plan

Create a file `.claude/plans/<feature-name>.md` with the following content:

```markdown
# Feature Plan: <Feature Name>
Date: <today's date>

## Objectives
A single sentence describing what this feature does and what problem it solves.

## In Scope
- [ ] Item A
- [ ] Item B

## Out of Scope
- Item C (for a future milestone)

## Files to Change
| File | Change Type | Reason |
|------|--------------|-------|
| `src/modules/X/x.service.ts` | New | Business logic |
| `src/modules/X/x.controller.ts` | New | API endpoints |
| `CLAUDE.md` | Update | Add module X to the structure |

## Implementation Steps
1. [ ] Step 1: ...
2. [ ] Step 2: ...
3. [ ] Step 3: ...
4. [ ] Write tests

## Risks & Dependencies
- Depends on: Module Y (existing / missing)
- Risks: ...

## Definition of Done (Done When)
- [ ] Tests pass
- [ ] Lint pass
- [ ] PR created
```

### Step 3 — Ask for Confirmation

After creating the plan, print a summary and **ask the user** before starting to code:

```
📋 Plan for feature "<name>" has been created at .claude/plans/<feature-name>.md

Summary:
- X files will be created/modified
- Steps: [short list]
- Estimated: ~N hours

✅ Start implementation? (yes/no)
Or if the plan needs adjustment, please let me know.
```

### Step 4 — Implement (only after user confirms)

Execute each step in the plan, in the correct order:
1. Tick off each step in `.claude/plans/<feature-name>.md` when completed
2. Adhere to patterns defined in CLAUDE.md
3. Write tests immediately after writing code (don't wait until the end)

### Step 5 — Completion

When all steps are done:
```bash
# Automatically run quality checks
npm run lint && npx tsc --noEmit && npm test
```

Then suggest:
```
✅ Feature "<name>" complete!

Next steps:
- Run /checkpoint to sync docs
- Run /commit to commit code
- Run /pr to create a pull request
```

## Immutable Principles
1. **Plan is always created first** — never skip this step, even for small features
2. **Do not code without confirmation** from the user
3. **Finish one step before moving to the next** — don't write everything at once
4. **Tests are not optional** — every feature must have at least a happy path test
