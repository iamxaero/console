# Open-Meteo Reference

Use this file when implementing or debugging weather and marine API integrations.

## Weather API

Endpoint:

`https://api.open-meteo.com/v1/forecast`

Timezone:

`Europe/Lisbon`

### Supported current parameters

* `temperature_2m` — °C
* `wind_speed_10m` — km/h
* `wind_direction_10m` — degrees
* `wind_gusts_10m` — km/h
* `precipitation` — mm
* `relative_humidity_2m` — %
* `apparent_temperature` — °C
* `weather_code` — WMO code

### Supported hourly parameters

The project currently uses:

* `temperature_2m`
* `relative_humidity_2m`
* `wind_speed_10m`
* `wind_direction_10m`
* `wind_gusts_10m`
* `precipitation`
* `weather_code`
* `apparent_temperature`

### Supported daily parameters

* `weather_code`
* `temperature_2m_max`
* `temperature_2m_min`
* `wind_speed_10m_max`

Do not assume that a parameter is supported because it exists in another Open-Meteo API.

---

## Marine API

Endpoint:

`https://marine-api.open-meteo.com/v1/marine`

Timezone:

`Europe/Lisbon`

### Project wave parameters

* `wave_height` — m
* `wave_direction` — degrees
* `wave_period` — seconds
* `swell_wave_height` — m
* `swell_wave_period` — seconds
* `swell_wave_direction` — degrees
* `wind_wave_height` — m
* `wind_wave_direction` — degrees

### Important

`water_temperature` is not supported by the current project integration.

Do not add unsupported parameters without verifying the current API documentation.

---

## Tides

The project does not use a `tidal-api.open-meteo.com` endpoint.

Current tide calculation is implemented in:

`src/services/tides.py::calc_tide_data()`

Do not introduce or assume an Open-Meteo tidal endpoint without verification.

---

## Known invalid parameters

The following parameters were previously confirmed to cause API errors in the project integration:

* `water_temperature`
* `wavelength`
* `mean_wave_direction`
* `mean_wave_period`
* `tide_height`

Before using any of these, verify the current API documentation and the project's implementation.

---

## Data integrity

Never infer missing API fields from similarly named fields.

For every external field:

1. Verify that the API supports it.
2. Verify its unit.
3. Verify its semantic meaning.
4. Validate the returned value.
5. Preserve unavailable values as unavailable.

When API behavior may have changed, consult the current official Open-Meteo documentation instead of relying solely on this reference.
