# Project 4 — Indonesia Climate Data Analysis

### Contact & Links

📧 **Email:** ziziphodamane@gmail.com

💼 **LinkedIn:** [Buhle Damane](https://www.linkedin.com/in/buhle-damane)

🌐 **Portfolio:** [strong-marigold-ded066.netlify.app](https://strong-marigold-ded066.netlify.app/)

## What Data Is Being Analyzed?

**Dataset:** Climate Data Daily Indonesia (IDN)
**Source:** Indonesian Meteorological Agency (BMKG)
**Tools Used:** Python (pandas, matplotlib, seaborn) + MySQL Workbench + Tableau
**Coverage:** 588,666 daily observations | 173 weather stations | 11 years (2010–2020)

## Summary

This dataset captures daily climate measurements from 173 weather stations across Indonesia, recording temperature, rainfall, humidity, wind speed, wind direction, and sunshine hours over an eleven year period. Indonesia is the world's largest archipelago nation and one of the most climatically significant countries on earth, sitting at the intersection of the Indian and Pacific Oceans and spanning a vast geographic range. Understanding its climate patterns is not an academic exercise. It has direct implications for agriculture, urban planning, disaster preparedness, and climate adaptation policy.

The analysis spans the complete data pipeline: Python for data cleaning and exploratory analysis, MySQL for structured querying, and Tableau for interactive visualization. The dataset arrived with 370,719 missing values across ten columns and 599 physically impossible measurements, including temperatures exceeding 200°C, humidity readings above 7,000%, and sunshine hours exceeding 24 in a single day. Cleaning that data was the most important work in this project, because no insight built on corrupted measurements is worth anything.

The headline finding is a +0.24°C temperature increase over the eleven year period, modest in isolation but consistent with regional and global warming trends. The wettest month is December, the driest is August, and Indonesia's famous climate stability is confirmed by a remarkably narrow monthly temperature range of less than 0.8°C between the coolest and warmest months. The Tableau dashboard brings these findings to life for any audience, from climate researchers to policy makers to agricultural planners.

## Visualizations

### Visualization 1 — Temperature Distribution

<img width="4165" height="1763" alt="temperature_distribution" src="https://github.com/user-attachments/assets/a610b264-7add-4296-91b0-3a4afe529f0a" />


**What is shown here:**
A histogram and box plot showing how daily average temperatures are distributed across all 588,666 observations. The distribution clusters tightly between 25°C and 30°C with a mean of 26.88°C.

**What this supports:**
Indonesia's tropical stability is the story here. Most countries show wide temperature distributions, cold winters pulling the average down and hot summers pushing it up. Indonesia shows almost none of that variation. The box plot confirms that the middle 50% of all daily temperatures fall within a 1.6°C band, from 26.3°C to 27.9°C. That stability is not just a meteorological curiosity. It is why Indonesia can support year-round agriculture and why temperature anomalies, when they do occur, are so ecologically significant. A country with little natural temperature variation has ecosystems and food systems calibrated to that narrow range. Deviations matter more precisely because they are rare.

### Visualization 2 — Monthly Temperature and Rainfall Patterns

<img width="3572" height="1768" alt="monthly_temperature" src="https://github.com/user-attachments/assets/894cd0c2-b6b9-4d2e-8ffb-8b87c2d86770" />


**What is shown here:**
A dual visualization showing average temperature and average rainfall by month across the full eleven year dataset. Temperature peaks in May (27.25°C) and dips in July (26.47°C). Rainfall peaks in December and drops sharply through July and August.

**What this supports:**
This chart tells the story of Indonesia's two seasons, wet and dry, and how temperature and rainfall move in relation to each other. The counterintuitive finding is that the coolest months are not the driest. July and August are both cool and dry, while the wettest months from November through March sit at moderate temperatures rather than the annual peaks. This matters for agricultural planning. The planting calendar in Indonesia cannot be built on temperature alone. Rainfall is the dominant seasonal signal, and the two variables do not move in lockstep. Any farmer, irrigation planner, or agricultural policy maker looking at this data needs to see both variables together to understand when conditions are genuinely favorable versus merely warm.

### Visualization 3 — Yearly Temperature Trend 2010–2020

<img width="3572" height="1767" alt="yearly_trend" src="https://github.com/user-attachments/assets/402622eb-c84c-4312-9d70-f82fc6cfec5b" />


**What is shown here:**
A line chart showing annual average temperature from 2010 to 2020 with a linear trend line overlaid. The trend shows a +0.24°C increase over the eleven year period.

**What this supports:**
+0.24°C over eleven years is not a dramatic number in isolation, but context matters. Global average temperature has risen approximately 1.1°C since pre-industrial times, meaning Indonesia's measured rate aligns with the broader planetary warming signal rather than sitting as an outlier. What makes this finding credible is the dataset behind it: 588,666 daily observations from 173 stations, cleaned to remove impossible values before any trend calculation was performed. The trend line is not driven by corrupted data or a single anomalous year. It reflects a genuine, measured directional shift across more than a decade of real meteorological records. For a country whose agriculture, water supply, and coastal infrastructure are all sensitive to temperature change, even a modest confirmed trend is a policy-relevant finding.

### Visualization 4 — Correlation Heatmap of Climate Variables

<img width="2617" height="2370" alt="correlation_heatmap" src="https://github.com/user-attachments/assets/c80e2352-c6d7-4acf-886c-e4acd0e25b2d" />


**What is shown here:**
A correlation matrix showing the statistical relationship between all key climate variables including temperature minimum, maximum, and average, humidity, rainfall, sunshine hours, wind speed, and temperature range.

**What this supports:**
The heatmap answers a question that individual charts cannot: how do all the variables relate to each other simultaneously? The strongest relationships in this dataset tell a coherent meteorological story. Temperature range correlates positively with sunshine hours, which makes physical sense because clear sunny days allow temperatures to rise higher during the day and fall further at night. Humidity shows a negative relationship with temperature range for the same reason, since humid cloudy days suppress both the daytime peak and the nighttime floor. These are not surprising findings to a climatologist, but seeing them confirmed cleanly in real data from 173 Indonesian stations validates both the dataset quality and the cleaning process that preceded this analysis. A heatmap built on dirty data would show noise. This one shows signal.

## Conclusion

This analysis confirms that Indonesia's climate is stable, tropical, and showing a measurable warming trend consistent with global patterns. The eleven year dataset reveals clear seasonal structure, a wet season from November through March and a dry season from April through October, with December as the wettest month and August as the driest. Temperature variation between months is remarkably narrow, underscoring the consistency that defines equatorial climates. The +0.24°C warming trend, while modest, is directionally significant for a country whose food security, water resources, and coastal communities are all sensitive to climate shifts.

The technical pipeline behind these findings, Python data cleaning, MySQL querying, and Tableau visualization, represents the complete data analyst workflow. The cleaning stage alone transformed a dataset with 370,719 missing values and 599 impossible measurements into 588,666 reliable, analysis-ready records. Every insight in this project rests on that foundation.

## 📂 Where to Find Everything

**Python Notebook** → `climate_analysis.ipynb`

**SQL Queries** → `sql/` folder

**Tableau Workbook** → `tableau/` folder

**Cleaned Dataset** → `data/climate_data_cleaned.csv`

*Thank you for reading. Feel free to reach out via the contact details at the top of this page. I am always open to discussion, feedback, and opportunities.*
