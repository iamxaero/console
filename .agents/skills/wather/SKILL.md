---

name: wather
description: >
Handle weather, marine, wave, swell, wind, tide, and surf forecast data for
the Surf Portugal Bot. Use for API integration, data validation, forecast
analysis, source selection, and weather-related debugging.
----------------------------------------------------------

# Weather and Marine Data

## 1. Critical rule: real data only

**Never fabricate weather or oceanographic data.**

Do not:

* invent values;
* guess missing values;
* silently estimate or interpolate missing observations;
* replace unavailable API values with plausible numbers;
* present derived values as direct measurements.

This applies to:

* air and water temperature;
* wind speed and direction;
* wind gusts;
* pressure;
* humidity;
* precipitation;
* wave height, period, and direction;
* swell;
* wind waves;
* tides;
* any other meteorological or oceanographic value.

If a required value cannot be obtained from an appropriate working source, mark it as unavailable.

## 2. Source selection

Use the project's configured source priority.

Current source priority:

1. Open-Meteo — primary weather and marine forecast data.
2. IH WFS — buoy/station registry and contextual Datawell information.
3. IH OGC API — tide-gauge observations where supported.
4. IPMA — only where the current integration is verified and supported.
5. MONICAN — reference/web source only unless an approved API becomes available.

Do not start with known unsupported or dead endpoints.

Read `references/sources.md` for current endpoints, parameters, limitations, and source status.

When current API behavior may have changed, verify the official source documentation before modifying the integration.

## 3. Forecast vs observation

Always preserve the data type.

Use explicit categories:

* `OBSERVATION` — directly measured by a station, buoy, or tide gauge.
* `FORECAST` — numerical/model forecast.
* `HISTORICAL` — previously recorded data.
* `CALCULATED` — derived from real source data.
* `UNAVAILABLE` — required data could not be obtained.

Never represent:

* forecast as observation;
* calculated values as measurements;
* interpolated values as direct observations.

When exposing data to the user or another service, preserve source and timestamp whenever available.

## 4. Freshness

For requests involving:

* current;
* now;
* today;
* latest;

query the appropriate live source.

Do not use values from:

* previous conversation messages;
* previous sessions;
* model memory;
* stale cached output,

when live data is required.

For historical requests, query or retrieve data corresponding to the requested period and verify its timestamp.

## 5. Geographic accuracy

For a specific surf spot:

* use the spot's actual `latitude` and `longitude`;
* do not substitute generic Portugal coordinates;
* use the existing spot definition as the source of truth.

For buoy/station selection:

* identify the relevant station;
* calculate geographic distance when necessary;
* prefer the appropriate nearby station rather than an arbitrary station.

Use haversine distance for geographic proximity when required.

## 6. API request validation

Before using external data, verify:

1. endpoint;
2. request coordinates;
3. requested parameters;
4. timestamp/timezone;
5. returned units;
6. response structure;
7. number and coverage of requested records;
8. required fields are actually present.

Never assume that a similarly named parameter is supported.

## 7. API failures

If the required source cannot be queried or does not provide the required data:

```text
Data unavailable — <source> could not be queried.
```

If the reason is known, report it briefly.

Examples:

* HTTP error;
* timeout;
* DNS failure;
* invalid parameter;
* missing field;
* malformed response;
* insufficient data.

Do not silently switch to fabricated or unsupported replacement data.

A fallback to another **approved real source** is allowed only when that fallback preserves the intended data semantics.

## 8. Data integrity in code

When implementing or modifying data collection:

* keep endpoints and configuration centralized;
* preserve source identifiers;
* preserve timestamps;
* preserve station/buoy identifiers where applicable;
* preserve units;
* explicitly distinguish forecast and observation;
* validate external responses;
* represent missing values explicitly;
* do not silently replace missing values.

Do not log secrets or unnecessary full API responses.

Store raw API responses only when required by the existing architecture or explicitly requested.

## 9. Calculated values

Derived values are allowed when all required inputs come from real validated data.

Example:

```text
wave_power = f(Hs, Tp)
```

is valid when `Hs` and `Tp` were actually obtained from a source.

If any required input is missing:

```text
result = UNAVAILABLE
```

Do not invent an input merely to complete a calculation.

Always distinguish calculated output from source measurements.

## 10. LLM usage

The LLM is not a weather-data source.

Before sending data to an LLM:

1. retrieve real source data;
2. validate it;
3. normalize units and structure;
4. distinguish forecast/observation/calculated values;
5. send only the relevant data.

The LLM may interpret or summarize validated data, but must not fill missing fields with invented values.

## 11. Context discipline

Weather APIs can return large JSON payloads.

Do not send complete raw responses to the LLM when only a subset is required.

Prefer:

```text
API
 ↓
Python validation/filtering
 ↓
normalized compact data
 ↓
LLM
```

instead of:

```text
API
 ↓
large raw JSON
 ↓
LLM
```

Use targeted fields, time ranges, and locations.

## 12. Verification

For weather/marine code changes:

* verify request parameters;
* test representative responses;
* test API failure handling;
* test missing fields;
* test timestamp/timezone handling;
* test units;
* test observation vs forecast classification;
* test calculated values with missing inputs.

Do not mark the implementation complete until the relevant verification passes.

## 13. Reference documentation

Current endpoint URLs, supported parameters, known failures, and source-specific details are maintained in:

`references/sources.md`

Do not duplicate the entire API reference here.
