---

name: skill-manager
description: >
Create, edit, validate, refactor, and maintain Zed skills (SKILL.md files).
Use when creating a skill, changing skill instructions, fixing skill metadata,
renaming a skill, restructuring skill resources, or reviewing skill quality.
----------------------------------------------------------------------------

# Skill Manager

Manage Zed Skills consistently and with minimal context overhead.

## 1. Core rules

* Treat `SKILL.md` as the source of truth for the skill.
* Preserve the skill's existing intent unless the user explicitly asks to change it.
* Prefer small, targeted edits over full rewrites.
* Do not duplicate skill instructions in `CLAUDE.md` or other always-loaded instruction files.
* Keep frequently needed rules in `SKILL.md`; move detailed reference material to `references/`.
* Prefer deterministic scripts over long natural-language instructions when a rule can be mechanically enforced.

## 2. Skill format validation

Every skill must have YAML frontmatter with:

| Field                      | Required | Rules                                                                                                             |
| -------------------------- | -------- | ----------------------------------------------------------------------------------------------------------------- |
| `name`                     | Yes      | Lowercase letters, numbers, and hyphens only; 1–64 characters; no leading/trailing hyphen; no consecutive hyphens |
| `description`              | Yes      | Clearly state what the skill does and when it should be used; max 1024 characters                                 |
| `disable-model-invocation` | No       | Use `true` when the skill must not be selected autonomously                                                       |

The skill directory name should match the `name` field.

## 3. Skill layout

Skills must be direct children of a skills root:

* Global: `~/.agents/skills/<name>/`
* Project-local: `<project>/.agents/skills/<name>/`

Required:

```text
<name>/
└── SKILL.md
```

Optional:

```text
<name>/
├── SKILL.md
├── scripts/
├── references/
└── assets/
```

Do not nest skills inside another skill directory.

## 4. Creating a skill

When the user's intent is clear, do not ask unnecessary clarification questions.

1. Determine the skill name, purpose, and scope.
2. Choose global or project-local scope.
3. Create `<name>/SKILL.md`.
4. Write valid YAML frontmatter.
5. Put the most important instructions first.
6. Keep the main body concise and task-oriented.
7. Move detailed documentation, examples, API references, and large procedures to `references/`.
8. Add scripts when deterministic validation or transformation is useful.
9. Validate the final structure and frontmatter.
10. Verify that the skill does not duplicate existing project instructions or another skill.

Ask for clarification only when the missing information materially affects the skill's behavior or scope.

## 5. Editing a skill

Before editing:

1. Read the existing `SKILL.md`.
2. Inspect `references/`, `scripts/`, and other bundled resources when relevant.
3. Identify the specific requested change.
4. Preserve unrelated content.

After editing:

1. Re-validate frontmatter.
2. Verify the `name` and directory name still match.
3. Check that the description still accurately identifies when the skill should be used.
4. Check for duplicated, contradictory, or obsolete instructions.
5. Keep the body under 500 lines.
6. Verify that referenced files and paths still exist.

## 6. Common changes

### Add a rule

Insert the rule where it has the highest operational relevance.

Prefer a short, precise rule over explanatory prose.

### Fix a rule

Change only the affected instruction unless the surrounding structure becomes inconsistent.

### Remove a rule

Delete obsolete instructions and remove resulting duplication.

### Update a parameter

Search for all references to the parameter before changing it.

### Rename a skill

Update all of the following:

* directory name
* `name` in frontmatter
* references to the old skill name
* symlinks or project references when applicable

## 7. Progressive disclosure

Use this hierarchy:

1. `SKILL.md` — essential workflow and rules.
2. `references/` — detailed documentation and rarely needed information.
3. `scripts/` — deterministic operations and validation.
4. `assets/` — templates and static resources.

Do not place large reference material directly in `SKILL.md`.

## 8. Context efficiency

Optimize for useful behavior per token.

* Do not repeat information already provided by project instructions.
* Do not copy `SKILL.md` into `CLAUDE.md`.
* Do not repeat the same rule in multiple skills unless the duplication is intentional.
* Avoid long examples when a concise rule is sufficient.
* Avoid loading large files when a targeted search is enough.
* Prefer scripts for repetitive checks.
* Keep descriptions concise because all skill descriptions are present in the agent's skill catalog.

## 9. Validation checklist

Before declaring a skill complete, verify:

* [ ] YAML frontmatter parses correctly.
* [ ] `name` is valid.
* [ ] Directory name matches `name`.
* [ ] `description` is accurate and ≤1024 characters.
* [ ] `SKILL.md` is under 500 lines.
* [ ] No unsupported nested skill layout is used.
* [ ] Referenced files exist.
* [ ] No unnecessary duplication with `CLAUDE.md`.
* [ ] No obvious contradiction with other project skills.
* [ ] The skill's behavior matches the user's requested purpose.

## 10. Project integration

For a shared master skill repository, prefer a symlink:

```bash
ln -sf /Users/vk/github/console/zed/.agents/skills/<name> .agents/skills/<name>
```

For a project-specific skill:

```bash
mkdir -p .agents/skills/<name>
```

Do not copy the full skill into `CLAUDE.md`.

If the project needs to tell the agent that a particular skill exists, add only a short pointer to `CLAUDE.md` describing its purpose and when to invoke it.

## 11. Self-improvement boundary

Do not modify a skill merely because of a single one-off mistake.

Consider a permanent skill change when:

* the same mistake happens repeatedly;
* the user explicitly corrects the workflow;
* the failure represents a significant data-integrity or safety problem;
* the missing behavior is likely to recur;
* the behavior can be prevented deterministically.

Prefer the smallest effective change.

After changing a skill because of a failure, verify that the new rule prevents the original failure without creating unnecessary context or workflow overhead.

## 12. Documentation

Use the current Zed Skills documentation as the format reference:

https://zed.dev/docs/ai/skills
