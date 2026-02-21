SELECT 
    COUNT(*) AS total_records,
    ROUND(AVG(temp_avg), 2) AS mean_temp,
    ROUND(MIN(temp_min), 2) AS absolute_min,
    ROUND(MAX(temp_max), 2) AS absolute_max,
    ROUND(AVG(humidity_avg), 2) AS mean_humidity,
    ROUND(SUM(rainfall_mm), 2) AS total_rainfall,
    ROUND(AVG(wind_speed_avg), 2) AS mean_wind_speed,
    MIN(date) AS date_from,
    MAX(date) AS date_to
FROM climate_data;



SELECT 
    month,
    month_name,
    ROUND(AVG(temp_avg), 2) AS avg_temp,
    ROUND(AVG(temp_min), 2) AS avg_min_temp,
    ROUND(AVG(temp_max), 2) AS avg_max_temp,
    ROUND(AVG(humidity_avg), 2) AS avg_humidity,
    ROUND(SUM(rainfall_mm), 2) AS total_rainfall,
    ROUND(AVG(rainfall_mm), 2) AS avg_daily_rainfall,
    COUNT(*) AS record_count
FROM climate_data
GROUP BY month, month_name
ORDER BY month;


SELECT 
    year,
    ROUND(AVG(temp_avg), 2) AS avg_temp,
    ROUND(MIN(temp_min), 2) AS min_temp,
    ROUND(MAX(temp_max), 2) AS max_temp,
    ROUND(AVG(humidity_avg), 2) AS avg_humidity,
    ROUND(SUM(rainfall_mm), 2) AS total_rainfall,
    COUNT(*) AS record_count
FROM climate_data
GROUP BY year
ORDER BY year;



SELECT 
    season,
    ROUND(AVG(temp_avg), 2) AS avg_temp,
    ROUND(MIN(temp_min), 2) AS min_temp,
    ROUND(MAX(temp_max), 2) AS max_temp,
    ROUND(STDDEV(temp_avg), 2) AS temp_std_dev,
    ROUND(AVG(humidity_avg), 2) AS avg_humidity,
    ROUND(SUM(rainfall_mm), 2) AS total_rainfall,
    ROUND(AVG(rainfall_mm), 2) AS avg_daily_rainfall,
    COUNT(*) AS total_days
FROM climate_data
GROUP BY season
ORDER BY avg_temp DESC;






-- Hottest days
SELECT date, station_id, temp_max, temp_avg, 'Hottest' AS event_type
FROM climate_data
ORDER BY temp_max DESC
LIMIT 10;

-- Coldest days
SELECT date, station_id, temp_min, temp_avg, 'Coldest' AS event_type
FROM climate_data
ORDER BY temp_min ASC
LIMIT 10;

-- Wettest days
SELECT date, station_id, rainfall_mm, 'Wettest' AS event_type
FROM climate_data
ORDER BY rainfall_mm DESC
LIMIT 10;



SELECT 
    date,
    station_id,
    temp_min,
    temp_max,
    temp_range,
    ROUND(temp_range, 2) AS daily_swing,
    season,
    month_name
FROM climate_data
ORDER BY temp_range DESC
LIMIT 20;




SELECT 
    month_name,
    month,
    COUNT(*) AS total_days,
    SUM(CASE WHEN rainfall_mm > 0 THEN 1 ELSE 0 END) AS rainy_days,
    ROUND(SUM(CASE WHEN rainfall_mm > 0 THEN 1 ELSE 0 END) / COUNT(*) * 100, 1) AS rainy_day_pct,
    ROUND(AVG(CASE WHEN rainfall_mm > 0 THEN rainfall_mm END), 2) AS avg_rainfall_on_rainy_days,
    ROUND(MAX(rainfall_mm), 2) AS max_daily_rainfall
FROM climate_data
GROUP BY month, month_name
ORDER BY month;


SET SESSION wait_timeout = 600;
SET SESSION interactive_timeout = 600;


SELECT 
    date,
    station_id,
    temp_avg,
    ROUND(AVG(temp_avg) OVER (
        PARTITION BY station_id
        ORDER BY date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS temp_7day_moving_avg,
    rainfall_mm,
    ROUND(AVG(rainfall_mm) OVER (
        PARTITION BY station_id
        ORDER BY date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS rainfall_7day_moving_avg
FROM climate_data
WHERE station_id = 96001
ORDER BY date;


WITH monthly_avg AS (
    SELECT 
        year,
        month,
        month_name,
        ROUND(AVG(temp_avg), 2) AS avg_temp
    FROM climate_data
    GROUP BY year, month, month_name
)
SELECT 
    year,
    month,
    month_name,
    avg_temp,
    LAG(avg_temp) OVER (ORDER BY year, month) AS prev_month_temp,
    ROUND(avg_temp - LAG(avg_temp) OVER (ORDER BY year, month), 2) AS month_over_month_change
FROM monthly_avg
ORDER BY year, month;



SELECT 
    year,
    quarter,
    ROUND(AVG(temp_avg), 2) AS avg_temp,
    ROUND(SUM(rainfall_mm), 2) AS total_rainfall,
    ROUND(AVG(humidity_avg), 2) AS avg_humidity,
    LAG(ROUND(AVG(temp_avg), 2)) OVER (PARTITION BY quarter ORDER BY year) AS prev_year_temp,
    ROUND(AVG(temp_avg) - LAG(AVG(temp_avg)) OVER (PARTITION BY quarter ORDER BY year), 2) AS yoy_temp_change
FROM climate_data
GROUP BY year, quarter
ORDER BY year, quarter;



SELECT 
    CASE 
        WHEN temp_avg >= 30 AND rainfall_mm = 0 THEN 'Hot & Dry'
        WHEN temp_avg >= 30 AND rainfall_mm > 0 THEN 'Hot & Wet'
        WHEN temp_avg < 26 AND rainfall_mm = 0 THEN 'Cool & Dry'
        WHEN temp_avg < 26 AND rainfall_mm > 0 THEN 'Cool & Wet'
        ELSE 'Moderate'
    END AS climate_type,
    COUNT(*) AS day_count,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM climate_data) * 100, 2) AS percentage,
    ROUND(AVG(temp_avg), 2) AS avg_temp,
    ROUND(AVG(humidity_avg), 2) AS avg_humidity
FROM climate_data
GROUP BY climate_type
ORDER BY day_count DESC;



SELECT 
    station_id,
    COUNT(*) AS total_records,
    ROUND(AVG(temp_avg), 2) AS avg_temp,
    ROUND(MIN(temp_min), 2) AS absolute_min,
    ROUND(MAX(temp_max), 2) AS absolute_max,
    ROUND(AVG(humidity_avg), 2) AS avg_humidity,
    ROUND(SUM(rainfall_mm), 2) AS total_rainfall,
    ROUND(AVG(wind_speed_avg), 2) AS avg_wind_speed
FROM climate_data
GROUP BY station_id
ORDER BY avg_temp DESC;
