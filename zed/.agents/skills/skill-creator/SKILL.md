---
name: skill-creator
description: >
  Create Zed skills (SKILL.md files). Load when user asks: create skill, add skill,
  new skill, skill name. Validates frontmatter (name <64 chars, description <1024 bytes,
  lowercase-hyphens naming), flat layout, English body language. See body for full steps.
---

## Steps

1. Ask user: skill name, purpose, scope (global or project-local).
2. Create the skill folder: `name/SKILL.md`.
3. Write frontmatter: `name`, `description` (< 1024 bytes), optional `disable-model-invocation`.
4. Validate frontmatter: name matches folder, lowercase-hyphens-numbers, max 64 chars.
5. Write body: numbered rules, most important first. Keep under 500 lines.
6. Optional: add `scripts/`, `references/`, `assets/` if needed.
7. Verify: YAML parses correctly (name, description required; description < 1024 bytes).

## Format Reference

| Field | Required | Rules |
|---|---|---|
| `name` | Yes | Lowercase, numbers, hyphens. Max 64 chars. Matches folder name. |
| `description` | Yes | What the skill does and when to use it. < 1024 bytes. |
| `disable-model-invocation` | No | Set `true` to hide from agent catalog. |

- Flat layout only — direct children of `~/.agents/skills/` or `<worktree>/.agents/skills/`.
- Keep body under 500 lines; move details to `references/`.
- Progressive disclosure: important instructions first.
- **Body language** — all skill content MUST be written in English.
- Docs: https://zed.dev/docs/ai/skills
