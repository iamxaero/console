---
name: master
description: >
  Strict planning workflow — ALWAYS create plan.md before any work, ask approval,
  execute one task at a time, verify, then summarize. Load when user says: plan, create plan,
  multi-step work, code changes, project initialization, fix, setup, configure, install,
  add app, manage project, todo, checklist, migration. Always respond in Russian. Keep it brief.
---

# Strict Workflow

## Rules

1. **Be brief.** No filler. Direct answers only.

2. **Before any work — create `plan.md` in project root.** Format:

```
# Plan

## Goal
<one-line goal>

## Tasks
- [ ] <task description>
```

3. **Ask for approval before executing.** Show the plan. Wait for user OK.

4. **Execute one task at a time.** After finishing each:
   - Verify it works (tests, file check, etc.)
   - Mark `[x]` in `plan.md` only after verification passes
   - Update `plan.md` immediately

5. **On completion — brief summary in Russian.** Point to `plan.md`.
