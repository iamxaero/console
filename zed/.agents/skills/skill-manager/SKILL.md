---
name: skill-manager
description: >
  Create, edit, and maintain Zed skills (SKILL.md files).
  Load when user asks: create skill, add skill, new skill, skill name,
  update skill, edit skill, fix skill, manage skills, refactor skill.
  Validates frontmatter, flat layout, English body language.
---

# Skill Manager

Rules for creating, editing, and maintaining Zed skills. Apply to ALL operations on any skill.

## Validation Rules (always enforce)

| Field | Required | Rules |
|---|---|---|
| `name` | Yes | Lowercase, numbers, hyphens. Max 64 chars. Must match folder name. |
| `description` | Yes | What the skill does and when to use it. < 1024 bytes. |
| `disable-model-invocation` | No | Set `true` to hide from agent catalog. |

- **Flat layout** — direct children of `~/.agents/skills/` or `<project>/.agents/skills/`.
- **Keep body under 500 lines** — move details to `references/`.
- **Progressive disclosure** — important instructions first.
- **Body language** — all skill content MUST be written in English.
- Docs: https://zed.dev/docs/ai/skills

## Creating a new skill

1. Ask user: skill name, purpose, scope (global or project-local).
2. Create the skill folder: `name/SKILL.md`.
3. Write frontmatter: `name`, `description` (< 1024 bytes), optional `disable-model-invocation`.
4. Validate frontmatter: name matches folder, lowercase-hyphens-numbers, max 64 chars.
5. Write body: numbered rules, most important first. Keep under 500 lines.
6. Optional: add `scripts/`, `references/`, `assets/` if needed.
7. Verify: YAML parses correctly (name, description required; description < 1024 bytes).

## Editing an existing skill

1. Read the existing SKILL.md — understand current content and intent.
2. Read the skill's `references/` directory if present.
3. Make changes — preserve existing structure, don't rewrite from scratch.
4. Re-validate frontmatter (name, description size, naming rules).
5. Update body: numbered rules, most important first. Keep under 500 lines.
6. Verify: YAML parses correctly, no regressions in intent.

## Common edits

- **Add a new rule** — insert at appropriate position in numbered list (most important first).
- **Fix a rule** — replace the specific rule, keep surrounding content intact.
- **Remove a rule** — delete it, re-number if needed.
- **Update parameters** — check all references to the updated value (URLs, paths, etc.).
- **Rename** — update folder name, frontmatter `name`, and all references.

## Adding to a project

1. Symlink from master repository: `ln -sf /Users/vk/github/console/zed/.agents/skills/<name> .agents/skills/`
2. Or create locally: `mkdir -p .agents/skills/<name>`
3. Update project's CLAUDE.md — include SKILL.md content for context loading.
