# Project 2 — Violence Against Women and Girls Analysis

## Contact & Links
* 📧 Email: ziziphodamane@gmail.com
* 💼 LinkedIn: [Buhle Damane](https://linkedin.com/in/buhle-damane)
* 🌐 Portfolio: [strong-marigold-ded066.netlify.app](https://strong-marigold-ded066.netlify.app)

---

## What Data Is Being Analyzed?

| Detail | Info |
|--------|------|
| **Dataset** | Violence Against Women and Girls |
| **Source** | Kaggle |
| **Tools Used** | MySQL Workbench + Power BI |
| **Coverage** | 70 countries · Years: 2000–2017 |
| **Total Records** | 25,477 |

---

## Summary

This dataset captures survey responses from 70 countries on a deeply serious subject: whether people — both men and women — believe a husband is justified in using violence against his wife under specific circumstances. Those circumstances range from burning food, to going out without permission, to refusing sex, to arguing with him. The percentage of respondents who agreed that any of these scenarios justifies violence is recorded as the `Value` column.

The dataset covers **25,477 records across 70 countries**, with Africa making up 55.7% of the data, Asia at 27.1%, and the rest distributed across Europe, North America, and South America. Western and high-income nations are largely absent — a limitation worth acknowledging upfront, because it means the findings skew toward lower-income, predominantly non-Western contexts.

My analysis was structured across **16 SQL queries divided into 5 sections**: data verification and geographic scope, attitude and justification patterns, demographic drivers of justification, high-risk identification, and advanced country-level risk classification. The findings are confronting in places. I have tried to present them honestly rather than soften them.

---

## Power BI Dashboard

### Page 1 — The Big Picture

<img width="913" height="568" alt="The big picture" src="https://github.com/user-attachments/assets/d43fe083-4678-476d-a209-748e9b0473bf" />


An overview page showing 3 key metrics at a glance — **70 countries analyzed**, a **17.55% global average justification rate**, and **12.60K survey responses**. Includes a Top 10 Highest Risk Countries bar chart and a Key Findings summary panel.

---

### Page 2 — Who Is At Risk?

<img width="913" height="568" alt="Who Is At Risk" src="https://github.com/user-attachments/assets/893dcbbe-9a5a-481c-9be4-c8e6c30d9cc5" />


A deep dive into demographic risk factors. Key panels include:
- **Rural vs Urban**: Rural populations show **47% higher** violence justification rates than urban (21% vs 14%)
- **Employment Type**: Informal "employed for kind" workers show the highest risk at 22%
- **Age Groups**: Minimal variation across 15–24, 25–34, and 35–49 age bands
- **Marital Status**: Widowed/divorced/separated respondents show the highest rates
- **Women Justify More Across ALL Demographics**: A striking grouped bar chart showing females consistently outpacing males across every demographic category

---

### Page 3 — Education's Power

<img width="913" height="568" alt="educations power" src="https://github.com/user-attachments/assets/f451717c-c5ee-466f-961b-c77c2bfbbb90" />


Education emerges as the **single strongest protective factor** in the dataset:
- No Education → **21.3%** justification rate
- Primary → **19.8%**
- Secondary → **15.7%**
- Higher Education → **8.0%**

That is a **62% reduction** from no education to higher education. The right panel shows that the gender gap persists at every education level — women justify violence more than men even among highly educated respondents.

---

### Page 4 — Why People Justify Violence

<img width="913" height="568" alt="why people justify violence" src="https://github.com/user-attachments/assets/cacf7333-72bb-49ff-8dcf-5eed0b0d46a1" />


> ⚠️ **Content Warning**: This page displays survey responses about justifications for violence. These are reported attitudes, not endorsements.

Ranked by acceptance rate:
1. At least one reason — **30%**
2. If she neglects the children — **21%**
3. Goes out without permission — **18%**
4. Argues with partner — **17%**
5. Refuses sex — **12%**
6. If she burns the food — **8%**

Women accept every justification reason at a higher rate than men. The "Critical Hotspots" table identifies country-reason combinations where acceptance exceeds 50%, concentrated in Afghanistan, Congo DR, Timor-Leste, Chad, Mali, and Guinea.

---

## Key Findings

### 🌍 Geographic Risk
Six countries fall into the **SEVERE** classification (above 35% average justification): **Timor-Leste, Chad, Congo DR, Guinea, Afghanistan, and Mali** — five of the six are African. The Americas, despite contributing only 12.85% of total data, account for 31.25% of countries in the LOW category.

### 👩 The Gender Paradox
In **88.57% of surveyed countries**, women justify violence against themselves at a *higher rate* than men. In Eritrea and Morocco, men show 0% justification — while women in those same countries show 46% and 45% respectively. This points to deeply internalized cultural conditioning, not a data anomaly.

### 📚 Education Impact
Education is the strongest demographic protective factor identified. The relationship is clean and consistent — every step up in education level corresponds to a measurable drop in justification rate. However, in 5 countries (Kyrgyz Republic, Armenia, Moldova, Ukraine, Timor-Leste), educated people justify violence *more* than uneducated people — suggesting those education systems may be reinforcing patriarchal values rather than challenging them.

### 🏘️ Rural vs Urban
Rural residents show a **6.67 percentage point** higher justification rate than urban residents — likely reflecting differences in education access, economic opportunity, and exposure to rights advocacy.

---

## Conclusion

Violence justification is not a fringe attitude in the countries surveyed — it is widespread, gendered, and deeply tied to demographic factors like education, residence, and employment type. The most alarming pattern is not the countries with the highest rates, but the **consistency with which women justify violence against themselves more than men do**. That points to a cultural conditioning problem that policy alone cannot solve. Education helps significantly in most places, but not everywhere — and where it does not help, the education system itself needs to be examined.

---

## 📂 Where to Find Everything

| Folder | Contents |
|--------|----------|
| `sql/` | All 16 SQL Queries & Scripts |
| `Power BI/` | Power BI Dashboard File (.pbix) |
| `excel/` | Excel workbooks and supporting spreadsheet files |
| `analysis/` | Full Analysis Report & Executive Summary (.docx files) |

---

*Thank you for reading. Feel free to reach out via the contact details at the top of this page — I am always open to discussion, feedback, and opportunities.*
