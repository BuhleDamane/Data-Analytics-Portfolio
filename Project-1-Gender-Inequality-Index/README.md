# Project 1 — Gender Inequality Index Analysis

---

### Contact & Links

- 📧 **Email:** ziziphodamane@gmail.com
- 💼 **LinkedIn:** [Buhle Damane](https://www.linkedin.com/in/buhle-damane)
- 🌐 **Portfolio:** [strong-marigold-ded066.netlify.app](https://strong-marigold-ded066.netlify.app/)

---

## What Data Is Being Analyzed?

**Dataset:** Gender Inequality Index (GII)
**Source:** Kaggle
**Tool Used:** MySQL Workbench + Microsoft Excel
**Coverage:** 194 countries | Years: 1990 – 2021 (31 years of data)

---

## Summary

The Gender Inequality Index measures the gap between men and women across three dimensions: reproductive health, educational attainment, and labour market participation. A score closer to 0 means near-equal; a score closer to 1 means severe inequality. This dataset covers 194 countries over 31 years, making it one of the most comprehensive looks at global gender equality progress available.

My analysis was structured across 7 SQL queries, each designed to answer a specific question: which countries are the worst and best performers, which continents lag behind, how much has the world improved over time, which countries improved the most, and how does human development level relate to gender inequality?

The short answer to that last question: almost perfectly. Every country in the lowest-inequality group had a High Human Development rating. Every country in the highest-inequality group had a Low or Medium one. That relationship is the backbone of this entire analysis.

---

## Visualizations

---

### Visualization 1 — Top 10 Most Unequal vs Most Equal Countries (2021)


<img width="913" height="568" alt="top10Unequal vs top10equal" src="https://github.com/user-attachments/assets/82efba96-d8e6-4045-ae10-647321bfc678" />



**What is shown here:**
This chart places the 10 most unequal countries and the 10 most equal countries side by side, using their 2021 GII scores. The higher the bar, the worse the inequality.

**What this supports:**
This visualization directly supports one of my strongest findings: the divide between the most and least equal countries is not gradual — it is a cliff. Countries like Papua New Guinea, Niger, and Mali sit at the extreme high end, while Denmark, Norway, and Switzerland sit at the extreme low end with almost no gap between men and women. What also stands out is the geographic pattern — 9 of the 10 most unequal countries are African, while 9 of the 10 most equal are European. That is not a coincidence. It reflects structural differences in education access, economic opportunity, and institutional investment that go back decades. This chart makes that argument visually, instantly.

---

### Visualization 2 — Global GII Trend: 1990, 2000, 2010, 2021


<img width="913" height="568" alt="Global Trend" src="https://github.com/user-attachments/assets/b1ed923b-7753-482b-abf3-1e7e6c4b1121" />


**What is shown here:**
A line graph tracking the global average GII score at 10-year intervals across the full 31-year period of the dataset.

**What this supports:**
This is the most hopeful visual in the project. The line moves consistently downward — from 0.488 in 1990 to 0.322 in 2021, a 34% reduction. What I find particularly interesting is that the steepest drop occurred between 2000 and 2010, suggesting that decade saw the most concentrated global progress, possibly driven by international development initiatives and increased investment in girls' education globally. The decline continues into 2021, which confirms the trend is not a fluke. That said, 0.322 is still far from 0 — which means the work is far from done. This chart tells both a story of progress and a reminder of how far there is still to go.

---

### Visualization 3 — Average GII by Continent (2021)


<img width="913" height="568" alt="Average By Continent" src="https://github.com/user-attachments/assets/bcf28337-c1e0-457c-b7ef-51868d728788" />


**What is shown here:**
A bar chart ranking all five continents from highest to lowest average GII score in 2021. Africa sits at the top (worst), Europe at the bottom (best).

**What this supports:**
This visualization confirms that gender inequality is not just a country-level problem — it is a regional one. Africa as a whole averages significantly higher inequality than any other continent, which aligns with the country-level findings in Visualization 1. Europe, unsurprisingly, performs best. What is worth noting here is Asia's position in the middle — which reflects enormous internal variation. Singapore is among the world's most equal countries, while other Asian nations perform far worse. A continental average can mask that variation, which is why the country-level analysis matters alongside this one. I included both to make sure neither the big picture nor the detail gets lost.

---

### Visualization 4 — Countries with the Greatest GII Improvement (1990–2021)


<img width="913" height="568" alt="Biggest Improvements" src="https://github.com/user-attachments/assets/506366c6-0a19-46d0-a9cf-2e7aa79eb950" />


**What is shown here:**
A horizontal bar chart showing the top 10 countries with the highest percentage improvement in GII score between 1990 and 2021, led by the United Arab Emirates at 92.6%.

**What this supports:**
This is the finding I find most compelling from a policy perspective. The UAE improved by 92.6% in a single generation. That is not a gradual drift — that is a deliberate transformation driven by policy. Turkey, Chile, Morocco, and Tunisia also appear here, representing Asia, South America, and Africa respectively. The geographic diversity of this list tells me that rapid improvement is not the exclusive territory of wealthy or already-developed nations. It is achievable anywhere with the right institutional commitment. This chart also slightly challenges the narrative from Visualization 1 — because some of the countries that have improved the most started from a very high inequality baseline, which means starting badly does not mean staying that way.

---

## Conclusion

This project confirmed that gender inequality and human development are deeply intertwined — you cannot separate one from the other. The most unequal countries are almost universally the least developed, and the most equal countries are almost universally the most developed. Progress is real and measurable over 31 years, but it is uneven, and Africa in particular requires targeted intervention at a continental scale.

---

### 📂 Where to Find Everything

- **SQL Queries & Scripts** → `sql/` folder
- **Excel Workbook & Charts** → `excel/` folder
- **Full Analysis Report** → `analysis/full_analysis.docx`
- **Executive Summary** → `analysis/executive_summary.docx`

---

*Thank you for reading. Feel free to reach out via the contact details at the top of this page — I am always open to discussion, feedback, and opportunities.*
