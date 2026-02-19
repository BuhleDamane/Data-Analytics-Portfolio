# Project 2 — Violence Against Women and Girls Analysis

---

### Contact & Links

- 📧 **Email:** [your.email@gmail.com]
- 💼 **LinkedIn:** [linkedin.com/in/yourprofile]
- 🔗 **Project Link:** [github.com/yourusername/project-2-vawg]

---

## What Data Is Being Analyzed?

**Dataset:** Violence Against Women and Girls
**Source:** Kaggle
**Tool Used:** MySQL Workbench + Power BI
**Coverage:** 70 countries | Years: 2000 – 2017

---

## Summary

This dataset captures survey responses from 70 countries on a deeply serious subject: whether people — both men and women — believe a husband is justified in using violence against his wife under specific circumstances. Those circumstances range from burning food, to going out without permission, to refusing sex, to arguing with him. The percentage of respondents who agreed that any of these scenarios justifies violence is recorded as the Value column.

The dataset covers 25,477 records across 70 countries, with Africa making up 55.7% of the data, Asia at 27.1%, and the rest distributed across Europe, North America, and South America. Western and high-income nations are largely absent — a limitation worth acknowledging upfront, because it means the findings skew toward lower-income, predominantly non-Western contexts.

My analysis was structured across 16 SQL queries divided into 5 sections: data verification and geographic scope, attitude and justification patterns, demographic drivers of justification, high-risk identification, and advanced country-level risk classification. The findings are confronting in places. I have tried to present them honestly rather than soften them.

---

## Visualizations

---

### Visualization 1 — Country Risk Classification Map

![Visualization 1](images/viz1.png)

**What is shown here:**
A world map with all 70 surveyed countries shaded according to their overall risk classification: SEVERE (above 35% average justification), MODERATE (22–35%), LOW-MODERATE (10–22%), and LOW (below 10%).

**What this supports:**
This is the single most important visual in the project because it communicates the entire risk landscape in one image. Africa is dominated by darker shades — SEVERE and MODERATE — while the Americas and Europe sit almost entirely in the LOW category. Six countries fall into the SEVERE classification: Timor-Leste, Chad, Congo DR, Guinea, Afghanistan, and Mali. Five of those six are African. What this map also reveals, and what I think is underappreciated, is that the Americas — despite contributing only 12.85% of the total dataset — account for 31.25% of countries in the LOW progress category. Something is working differently there, and that deserves further investigation. This map makes you want to ask why, which is exactly what a good visualization should do.

---

### Visualization 2 — Female vs Male Justification Rates: Top 15 Gender Gap Countries

![Visualization 2](images/viz2.png)

**What is shown here:**
A side-by-side bar chart showing female and male average justification rates for the 15 countries with the largest gender gap, ordered by the size of that gap.

**What this supports:**
This is the finding that I keep coming back to, because it challenges the assumption most people bring to this topic. In 88.57% of surveyed countries, women justify violence against themselves at a higher rate than men do. In Eritrea, men show 0% justification — and women show 46.19%. In Morocco, the same: 0% for men, 45.21% for women. That gap is not explained by the data alone. It points to something cultural — a pattern of women internalizing the belief that violence against them is, under certain circumstances, acceptable. This chart makes that pattern undeniable. It is one of the most important things this dataset has to say, and I did not want to bury it in a table.

---

### Visualization 3 — Education Level vs Average Justification Rate

![Visualization 3](images/viz3.png)

**What is shown here:**
A descending bar chart showing average violence justification rates across four education levels: No Education (21.33%), Primary (19.74%), Secondary (15.68%), and Higher Education (7.99%).

**What this supports:**
This visualization confirms education as the strongest demographic protective factor in the dataset. The relationship is clean and consistent — every step up in education corresponds to a measurable drop in justification rate. The difference between no education and higher education is 13.34 percentage points, which at population scale is enormous. What this chart also does is raise a follow-up question: if higher education brings justification down to 7.99%, why is there still almost 8% left? The answer is that cultural conditioning runs deeper than formal education alone, and that is where interventions beyond schooling become necessary. This chart supports investment in education strongly, but honestly, not absolutely.

---

### Visualization 4 — Education Impact by Country (No Education vs Higher Education)

![Visualization 4](images/viz4.png)

**What is shown here:**
A ranked chart comparing each country's justification rate among people with no education against those with higher education, showing the gap (impact) between the two. Countries with the largest impact sit at the top; countries with negative impact (where educated people justify violence more) sit at the bottom.

**What this supports and where it gets complicated:**
Kenya (32.3% impact) and Tanzania (31.38%) sit at the top — education in those countries is a genuinely transformative tool. But at the bottom of this chart are five countries — Kyrgyz Republic, Armenia, Moldova, Ukraine, and Timor-Leste — where educated people justify violence *more* than uneducated people. That is the finding that surprised me most. My reading is that in those countries, particularly Kyrgyz Republic with a -20.38% impact, the education system itself may be reinforcing patriarchal values rather than challenging them. That is a very different problem from lack of education access, and it requires a very different solution. This chart shows that education is powerful but not universal, and context matters enormously.

---

## Conclusion

Violence justification is not a fringe attitude in the countries surveyed — it is widespread, gendered, and deeply tied to demographic factors like education, residence, and employment type. The most alarming pattern is not the countries with the highest rates, but the consistency with which women justify violence against themselves more than men do. That points to a cultural conditioning problem that policy alone cannot solve. Education helps significantly in most places, but not everywhere — and where it does not help, the education system itself needs to be examined.

---

### 📂 Where to Find Everything

- **SQL Queries & Scripts** → `sql/` folder
- **Power BI Dashboard File** → `powerbi/` folder
- **Full Analysis Report** (every query explained in detail) → `analysis/full_analysis.docx`
- **Executive Summary** (two-page overview written for recruiters) → `analysis/executive_summary.docx`

---

*Thank you for reading. Feel free to reach out via the contact details at the top of this page — I am always open to discussion, feedback, and opportunities.*
