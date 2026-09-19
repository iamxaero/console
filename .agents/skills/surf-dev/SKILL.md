---

name: surf-dev
description: >
Develop and maintain the Surf Portugal Bot using Python, aiogram, Open-Meteo,
Ollama, and the project's existing architecture. Use for Python changes,
tests, debugging, refactoring, and project-specific implementation.
-------------------------------------------------------------------

# Surf Portugal Bot Development

## 1. Before changing code

1. Read the relevant existing files.
2. Check imports and call sites before changing interfaces.
3. Check `plan.md` when one exists.
4. Identify the existing implementation and source of truth.
5. Make the smallest change that solves the task.

For non-trivial work, follow the `master` workflow.

Do not duplicate `master` approval or planning rules here.

## 2. Project stack

* Python 3.12+
* `uv`
* `aiogram` 3.x
* `pydantic` v2
* `pydantic-settings`
* `httpx`
* SQLite
* Ollama / compatible LLM API
* Docker
* Timezone: `Europe/Lisbon`

Current services are predominantly synchronous (`httpx.Client`). Do not convert them to async unless explicitly requested or required by the task.

The bot layer is asynchronous (`aiogram`).

## 3. Project structure

```text
surf/
├── main.py
├── config/
│   └── spots.py
├── src/
│   ├── config/
│   │   └── settings.py
│   ├── models/
│   │   └── data.py
│   ├── services/
│   │   ├── weather.py
│   │   ├── tides.py
│   │   ├── forecast.py
│   │   ├── ipma.py
│   │   ├── portuguese_sources.py
│   │   └── recommendation.py
│   ├── bot/
│   │   └── main.py
│   └── ai/
│       ├── health.py
│       └── client.py
├── tests/
├── scripts/
├── Dockerfile
└── plan.md
```

Verify the actual repository structure before relying on this map.

## 4. Configuration

* Do not hardcode credentials, tokens, URLs, models, or environment-specific values when configuration already exists.
* Use `.env` through `pydantic-settings`.
* Reuse existing configuration objects and naming conventions.
* Do not introduce a second configuration mechanism without a clear reason.

## 5. Weather and marine

When modifying weather, marine, wave, swell, wind, or tide functionality:

1. Load the `wather` skill.
2. Follow its source priority and data-integrity rules.
3. Do not independently choose endpoints, parameters, units, or fallback sources.
4. Keep weather API details out of this skill.

## 6. Surf domain rules

* Wave direction means the direction waves come **from**.
* Match swell direction against the surf spot's exposure.
* Use the existing spot definitions in `config/spots.py`.
* Do not change surf-level thresholds without checking existing business logic and tests.
* Preserve the meaning of existing spot coordinates, exposure, and metadata.

## 7. LLM integration

* Configuration comes from `OLLAMA_BASE_URL` and `OLLAMA_MODEL`.
* Send validated and normalized data to the LLM.
* Do not send large raw API responses when Python can filter or aggregate them first.
* Keep prompts compact and deterministic where practical.
* Do not add extra LLM calls without understanding the existing call architecture.
* If an existing heuristic fallback is part of the application behavior, preserve it when the LLM is unavailable.
* Never use the LLM as a source of factual weather or marine data.

## 8. Testing

Use `pytest`.

* Reuse existing fixtures in `conftest.py`.
* Mock external HTTP requests in unit tests.
* Test API failures and malformed responses.
* Test important boundary conditions in surf calculations.
* Update tests when behavior changes.
* Do not weaken or remove tests merely to make them pass.
* Prefer targeted tests during development; run the broader suite when appropriate.
* Existing project coverage target: >60%.

## 9. Code quality

* Use `from __future__ import annotations`.
* Use type hints for new or modified code.
* Follow existing naming and module conventions.
* Prefer simple functions and explicit data flow.
* Avoid unnecessary abstractions.
* Avoid unrelated refactoring.
* Preserve backward compatibility unless a breaking change is explicitly requested.

## 10. Context discipline

* Read only files relevant to the current task.
* Do not dump complete API responses, logs, databases, or large files into context.
* Use targeted searches and file sections.
* Process large JSON/CSV responses with Python before presenting them to the LLM.
* Do not repeatedly inspect unchanged files or command output.
* Prefer deterministic scripts for repetitive data processing.

## 11. Verification

After implementation:

1. Run the smallest relevant verification.
2. Run targeted tests.
3. Check affected imports and configuration.
4. Run broader tests when the change warrants them.
5. Report actual verification results.

Never claim a change works without verification.

## 12. Documentation

Keep detailed API parameters, endpoint examples, response schemas, and source-specific facts in `references/`.

Keep this `SKILL.md` focused on development rules and workflow.
