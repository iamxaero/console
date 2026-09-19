---

name: self-improvement
description: >
Analyze repeated agent mistakes and improve project skills, CLAUDE.md,
scripts, and workflows. Use after significant failures, repeated corrections,
or when the user explicitly asks to improve the agent workflow.
---------------------------------------------------------------

# Self-Improvement

Improve the agent's future behavior based on observed failures, corrections, and repeated patterns.

## Core principle

Do not optimize for the current task only.

When a failure reveals a reusable pattern, convert it into a concise rule, validation, script, or workflow improvement.

Do not modify instructions merely because of a single accidental or task-specific failure.

## Trigger conditions

Consider self-improvement when:

* the user corrects the same behavior more than once;
* the agent repeats the same mistake;
* a tool/API/CLI behaves differently from the agent's assumptions;
* an existing skill contains an incorrect or ambiguous rule;
* the workflow repeatedly requires manual user correction;
* a missing validation step causes a failure;
* excessive context or tool output repeatedly causes problems.

Do NOT trigger for:

* one-off mistakes with no reusable lesson;
* user preference that applies only to the current task;
* temporary external failures;
* intentional deviations requested by the user.

## Improvement workflow

1. Identify the observed failure.
2. Determine the root cause.
3. Decide whether the lesson is reusable.
4. Identify the smallest artifact that should change:

   * skill rule;
   * CLAUDE.md rule;
   * script;
   * validation;
   * project documentation.
5. Make the smallest possible change.
6. Validate the changed artifact.
7. Verify that the change does not contradict existing rules.
8. Report what changed and why.

## Evidence

Base improvements on concrete evidence:

* user corrections;
* command/tool output;
* test failures;
* API responses;
* documented tool behavior;
* repeated workflow patterns.

Never invent a failure or infer a rule without evidence.

## Rule quality

A new rule should be:

* specific;
* actionable;
* reusable;
* short;
* testable.

Prefer:

"Limit Kubernetes logs with `--tail` unless full history is required."

over:

"Be careful with Kubernetes output."

## Context efficiency

Self-improvement must reduce, not increase, unnecessary context.

Before adding a rule:

1. Check whether an existing rule already covers it.
2. Prefer modifying an existing rule over adding a duplicate.
3. Keep rules concise.
4. Move detailed reference material outside the main skill body.
5. Do not copy skill contents into CLAUDE.md.

Avoid adding rules that merely restate tool documentation.

## Skill changes

When improving a skill:

1. Read the current SKILL.md.
2. Read relevant references if present.
3. Identify the exact rule causing the problem.
4. Modify the smallest relevant section.
5. Preserve unrelated content.
6. Validate frontmatter and structure.
7. Verify the resulting behavior if possible.

Never rewrite an entire skill when a targeted edit is sufficient.

## CLAUDE.md changes

Only modify CLAUDE.md when the lesson is project-wide.

Use a skill when the behavior applies to a specific domain or workflow.

Do not duplicate skill instructions in CLAUDE.md.

## Scripts and automation

Prefer deterministic scripts over additional natural-language instructions when a rule can be enforced mechanically.

Examples:

* validation scripts;
* API response checks;
* configuration validators;
* linting;
* pre-commit checks.

If a rule can be enforced by code, prefer code over asking the LLM to remember the rule.

## Regression prevention

After an improvement:

* verify syntax;
* run relevant tests;
* check affected commands/workflows;
* ensure existing behavior remains intact.

If the improvement cannot be verified, state that explicitly.

## Change threshold

Do not add a permanent rule for a single low-impact failure unless the failure is caused by a clearly incorrect existing rule.

Prefer a permanent change when:

* the failure is repeated;
* the failure has significant impact;
* the missing rule protects data integrity or safety;
* the same correction is likely to recur;
* automation can reliably prevent the failure.

## Final principle

The goal is not to make the instruction set larger.

The goal is to make the agent require fewer corrections while keeping the instruction set as small and precise as possible.
