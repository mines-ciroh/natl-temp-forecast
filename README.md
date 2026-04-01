# National Water Temperature Forecast Notebook

This Jupyter Notebook generates weekly water temperature forecasts for a large sample of rivers nationally. As configured, the emphasis is on smaller rivers to minimize data processing. If data are not already downloaded, the notebook will spend some time processing preliminary data; however, prepared data will be available in Releases.

## General Information

Warning: this is an experimental stream water temperature forecast for the upcoming week. Results are not guaranteed in any capacity. Typical errors are approximately 2.5 C (4 F); any given prediction may have considerably higher errors. For example, in the southern Rocky Mountains during the first forecast run (April 2026), the model, while it did predict high temperature anomalies, was unable to fully account for the unseasonal loss of snowpack and therefore underpredicted temperatures by several degrees.

These data and related items of information have not been formally disseminated by NOAA, and do not represent any agency determination, view, or policy. This research is funded by the NOAA Cooperative Institute for Research to Operations in Hydrology.

The code used to generate these forecasts is available on GitHub at https://github.com/mines-ciroh/natl-temp-forecast (requires support for ecCodes, for which Linux is recommended). Additionally, required preliminary data for the 913 default forecast sites are available on the GitHub Releases page, so the only data retrieval required is the GFS forecast download. Actual weekly forecasts are made available on CUAHSI HydroShare at http://www.hydroshare.org/resource/b8852529788a437a8d697e9b0435b99a.

## Usage

1. `git clone https://github.com/mines-ciroh/natl-temp-forecast`, or equivalent.
1. `pip install -r requirements.txt`.
2. If using the prepared data, download `InputData.zip` from Releases and unzip it in the same directory as the notebook.
3. Launch Jupyter and open `forecast.ipynb`.
4. Run the notebook.

## Output Variables

Forecast outputs contain the following columns:

- date: The date. YYYY-MM-DD format.
- tmax: Daily maximum air temperature (GFS forecast) (deg C).
- id: Site ID (HUC-12).
- prediction: Predicted daily mean stream water temperature (deg C).
- seasonal: Predicted day-of-year (seasonal) mean stream water temperature (deg C).
- anomaly: Predicted daily departure (anomaly) from seasonal mean stream water teperature (deg C).
- area: Watershed area in square meters.
- lat: Prediction point latitude in decimal degrees north.
- lon: Prediction point longitude in decimal degrees east.
