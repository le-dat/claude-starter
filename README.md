# Claude Starter

### Copy to Your Project

```bash
cp -r .claude path/to/your/project/
```

### Commands

```
/plan              # Create plan for feature/bug
/cook              # Build project from spec
/debug             # Debug existing issue
/fix               # Fix common errors
/fix-test          # Fix failing tests
/fix-ci            # Fix CI failures
/test              # Run tests
/cmp               # Compare code, git diff
/watzup            # Check project status
/code-reviewer     # Code review
```

### Permissions

Create and add `settings.local.json`:

```json
{
  "permissions": {
    "allow": [
      "Bash(npm run:*)",
      "Bash(curl:*)",
      "Bash(git status:*)",
      "Bash(git check-ignore:*)",
      "Bash(git add:*)",
      "Bash(git rev-list:*)",
      "Bash(git fetch:*)",
      "Bash(git reset:*)",
      "Bash(git checkout:*)",
      "Bash(gh pr:*)",
      "Bash(docker compose:*)",
      "Bash(docker-compose ps:*)",
      "Bash(docker-compose logs:*)",
      "Bash(docker network:*)"
    ]
  }
}

```

### Hooks

Auto-format code on save — configured in `hooks/format-on-save.json`.


### Statusline

Status line displays: directory → git branch → model → session time → cost → tokens.

Requires: `ccusage` (`npm i -g ccusage`).
