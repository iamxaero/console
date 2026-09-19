---

name: master
description: >
Project workflow for planning, executing, and verifying non-trivial work.
Use for multi-step changes, fixes, setup, migrations, configuration, project
initialization, and other tasks requiring coordinated actions. Use planning
proportionally to task complexity. Always respond in Russian.
-------------------------------------------------------------

# Master Workflow

Control execution of non-trivial project work with minimal overhead.

## 1. Core principles

1. Be concise and action-oriented. Avoid filler.
2. Preserve existing project behavior unless the user explicitly requests a change.
3. Make the smallest effective change.
4. Verify changes before declaring the task complete.
5. Do not invent results, test outcomes, API behavior, or external information.
6. Avoid unnecessary tool calls and large tool outputs.
7. Do not repeat information already available in `CLAUDE.md`, skills, or project documentation.

## 2. Decide whether planning is required

### Trivial task — no `plan.md`

Do not create `plan.md` for a simple, isolated operation such as:

* reading or explaining existing code;
* changing a typo or obvious one-line value;
* answering a question;
* inspecting a file;
* running a single diagnostic command;
* making a small, self-contained edit with no dependencies.

Perform the task directly and verify when verification is meaningful.

### Non-trivial task — use `plan.md`

Create or update `plan.md` for work involving:

* multiple files;
* multiple dependent steps;
* architectural changes;
* migrations;
* project initialization;
* infrastructure or deployment changes;
* configuration changes with side effects;
* debugging requiring several investigation steps;
* new features;
* tasks expected to require multiple tool calls.

## 3. Create the plan

Create `plan.md` in the project root.

Use:

```markdown
# Plan

## Goal
<one-line goal>

## Tasks
- [ ] <task>
- [ ] <task>
- [ ] <task>
```

Keep the plan short.

Each task should represent a meaningful unit of work that can be independently verified.

Do not put implementation details, command output, logs, or long explanations into `plan.md`.

## 4. Approval

For non-trivial work:

1. Create or update `plan.md`.
2. Show the plan to the user.
3. Wait for explicit approval before making changes.

Accept approval such as:

* `ok`
* `да`
* `go`
* `approved`
* an equivalent explicit confirmation.

Do not interpret unrelated messages as approval.

### Exception

Do not request approval for:

* trivial tasks;
* read-only investigation;
* diagnostics;
* explanations;
* commands explicitly requested by the user;
* a sequence of actions that the user has already explicitly authorized.

If the user explicitly says to proceed, do not ask for another `ok`.

## 5. Execute the plan

Execute tasks in dependency order.

For each task:

1. Make the smallest required change.
2. Run the most relevant verification.
3. If verification passes, mark the task `[x]`.
4. Update `plan.md` immediately.
5. Continue with the next task.

Do not mark a task complete based only on the absence of an obvious error.

## 6. Verification

Choose verification proportional to the change.

Examples:

* configuration → parse/validate configuration;
* Python → targeted tests, lint, or import check;
* API integration → targeted request or mock test;
* Docker → build or targeted container check;
* Kubernetes → manifest validation or targeted resource inspection;
* infrastructure → plan/validate before apply;
* documentation → verify referenced paths, commands, and links.

Do not run expensive full-system tests when a targeted check is sufficient.

If verification fails:

1. Keep the task unchecked.
2. Diagnose the failure.
3. Fix the problem if it is within the approved scope.
4. Re-run verification.
5. Record unresolved issues when they cannot be safely fixed.

## 7. Scope control

Do not silently expand the task.

If implementation reveals a required change outside the approved scope:

* make it only if it is a necessary consequence of the approved task and low-risk;
* otherwise stop and update the plan before proceeding.

Do not perform unrelated cleanup, refactoring, formatting, dependency upgrades, or architectural changes.

## 8. Internet and external information

Internet access is allowed when useful.

Use web access when:

* information may have changed;
* working with current software versions or APIs;
* checking official documentation;
* verifying compatibility;
* researching an unfamiliar error;
* the user explicitly asks to search the internet.

Prefer authoritative sources, especially official documentation.

Do not search the internet when it adds no value.

When external information materially affects the implementation, mention the source or verification briefly in the final summary.

## 9. Tool-output and context discipline

Optimize for context usage.

* Never dump large logs, API responses, datasets, or files into the conversation unless necessary.
* Prefer targeted commands with filters, limits, and selectors.
* For logs, use appropriate `--tail`, time ranges, or filters.
* For Git, inspect targeted diffs and limited history.
* For Kubernetes, query only the relevant resources.
* For large files, inspect structure or targeted sections before reading the entire file.
* Filter and aggregate large API/data responses before passing them to the model.
* Prefer scripts or shell processing for deterministic filtering.
* Do not repeatedly inspect the same unchanged output.
* If the context becomes large, compact or summarize the working state before continuing.

## 10. Data integrity

For projects using external or real-world data:

* Never fabricate missing data.
* Preserve the distinction between observed, forecast, calculated, and unavailable values.
* Treat API failures as failures; do not silently substitute invented or unsupported values.
* Validate external data before using it in calculations or LLM prompts.
* Prefer deterministic processing before sending data to an LLM.

## 11. Plan maintenance

`plan.md` is the current execution state, not a project diary.

Keep it synchronized with actual progress.

Do not append command output, debugging transcripts, or lengthy explanations.

If the plan changes materially:

1. Update `plan.md`.
2. Explain the change briefly.
3. Obtain approval when the change expands the original scope.

When all tasks are verified, mark the plan complete.

## 12. Completion

When the work is complete, respond briefly in Russian with:

* what was changed;
* what was verified;
* any remaining issue or limitation;
* a pointer to `plan.md` when one was used.

Do not claim success if verification failed or was not performed.

## 13. Failure handling

If a command or tool fails:

1. Read the actual error.
2. Determine whether the failure is environmental, configuration-related, or caused by the change.
3. Prefer targeted diagnostics.
4. Do not repeatedly execute the same failing command without changing the hypothesis.
5. Do not hide or overwrite the original failure.
6. If the issue cannot be resolved safely, report the exact blocker and current state.
