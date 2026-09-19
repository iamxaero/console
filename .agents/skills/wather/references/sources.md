# Weather and Marine Sources

This file contains current project-specific API information.

When an endpoint, parameter, or service status may have changed, verify against the official provider documentation before modifying the integration.

## 1. Open-Meteo Weather

Endpoint:

`https://api.open-meteo.com/v1/forecast`

Project usage:

* `latitude`
* `longitude`
* `current`
* `hourly`
* `daily`
* `timezone=Europe/Lisbon`

Primary source for weather forecast data.

### Current parameters used by the project

* `temperature_2m` — °C
* `wind_speed_10m` — km/h
* `wind_direction_10m` — °
* `wind_gusts_10m` — km/h
* `precipitation` — mm
* `relative_humidity_2m` — %
* `apparent_temperature` — °C
* `weather_code` — WMO code

### Hourly parameters

* `temperature_2m`
* `relative_humidity_2m`
* `wind_speed_10m`
* `wind_direction_10m`
* `wind_gusts_10m`
* `precipitation`
* `weather_code`
* `apparent_temperature`

### Daily parameters

* `weather_code`
* `temperature_2m_max`
* `temperature_2m_min`
* `wind_speed_10m_max`

---

## 2. Open-Meteo Marine

Endpoint:

`https://marine-api.open-meteo.com/v1/marine`

Project usage:

* `latitude`
* `longitude`
* `hourly`
* `current`
* `timezone=Europe/Lisbon`

### Wave parameters

* `wave_height` — m
* `wave_direction` — °
* `wave_period` — s
* `swell_wave_height` — m
* `swell_wave_period` — s
* `swell_wave_direction` — °
* `wind_wave_height` — m
* `wind_wave_direction` — °

Do not assume unsupported marine parameters are available.

---

## 3. IH WFS

Endpoint:

`https://webgeo4.hidrografico.pt/geoserver/oceanography/ows`

Project usage:

* WFS
* version `2.0.0`
* `GetFeature`
* `oceanography:buoys_datawell`
* GeoJSON output

Purpose:

* buoy/station registry;
* Datawell station context;
* station identification and geographic matching.

Use the nearest relevant buoy when station proximity is required.

---

## 4. IH OGC API

Collection:

`https://ogcapi.hidrografico.pt/collections/tide_obs_nrt`

Purpose:

* near-real-time tide-gauge observations;
* contextual tide information.

Current integration is partial. Verify supported fields and coverage before relying on it.

---

## 5. IPMA

IPMA is not the default source for this project.

Previously tested endpoint:

`api.ipma.pt/open-data/forecast/meteorology/cities/daily/...`

Project status:

* forecast endpoint previously returned `404`;
* observation support is partial.

Do not use this endpoint without re-verifying current availability.

---

## 6. MONICAN

`monican.hidrografico.pt`

Current project status:

* web interface;
* no approved API integration.

Do not treat the web interface as an API.

---

## 7. Unsupported / previously failing endpoints

### Open-Meteo tidal endpoint

Do not assume:

`tidal-api.open-meteo.com`

is a valid project source.

The previous project integration determined that this endpoint was unavailable.

Current tide calculation is implemented in:

`src/services/tides.py::calc_tide_data()`

Verify the current implementation before changing it.

### IH support server

`supportserver1.hidrografico.pt`

Previously required an API key.

Do not use it unless credentials and authorization are explicitly configured.

---

## 8. Source priority

| Priority | Source     | Purpose                                |
| -------- | ---------- | -------------------------------------- |
| 1        | Open-Meteo | Weather and marine forecast            |
| 2        | IH WFS     | Buoy/station registry                  |
| 3        | IH OGC     | Tide observations                      |
| 4        | IPMA       | Verified supported meteorological data |
| 5        | MONICAN    | Reference only                         |

The priority describes the intended project architecture, not permission to substitute semantically different data.

A fallback is valid only when the alternative source provides the required type of data.

## 9. Example location

Peniche test coordinates:

```text
latitude=39.35
longitude=-9.38
timezone=Europe/Lisbon
```

Use actual spot coordinates in production.

Do not use the Peniche coordinates as a generic Portugal location.
