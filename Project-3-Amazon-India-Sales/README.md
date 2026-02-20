# Project 3 — Amazon India Sales Analysis

---

### Contact & Links

- 📧 **Email:** ziziphodamane@gmail.com
- 💼 **LinkedIn:** [Buhle Damane](https://www.linkedin.com/in/buhle-damane)
- 🌐 **Portfolio:** [strong-marigold-ded066.netlify.app](https://strong-marigold-ded066.netlify.app/)

---

## What Data Is Being Analyzed?

**Dataset:** Amazon India Sales Data
**Source:** Kaggle
**Tool Used:** MySQL Workbench + Tableau
**Coverage:** 120,378 orders | Multiple product categories | 48 states across India

---

## Summary

This dataset captures real sales data from Amazon's Indian marketplace — orders, revenue, product categories, shipping methods, customer segments, geographic distribution, and fulfilment channels. It is a commercial dataset, and I treated it as one: every query was written to answer a business question, not just to demonstrate a SQL technique.

The analysis spans 16 queries covering five areas: overall business performance, product and category analysis, geographic performance, customer segmentation, and operational efficiency. The headline numbers are strong — ₹78.6 million in total revenue, over 109,000 orders shipped, and 48 states served. But the number that drove most of my analytical attention was the 14.21% cancellation rate. At this scale, that is not a rounding error. It is a measurable and addressable revenue leak, and understanding where it comes from is arguably the most commercially valuable thing this analysis does.

The Tableau dashboard brings the written findings to life visually — turning query outputs into charts, maps, and KPI panels that a business stakeholder could act on without reading a single line of SQL.

---

## Visualizations

---

### Visualization 1 — Executive KPI Summary Panel

<img width="828" height="568" alt="KPI Summary Panel" src="https://github.com/user-attachments/assets/23b38d77-7de5-4259-9f4e-91497884cb26" />


**What is shown here:**
A top-level KPI banner displaying the four most important business metrics at a glance: Total Orders (120,378), Total Revenue (₹78.6M), Cancellation Rate (14.21%), and Average Order Value (₹609.36).

**What this supports:**
Every business analysis needs an entry point — a set of numbers that tells you immediately whether the business is healthy or struggling. This panel does that job. Revenue and order volume are strong, which confirms the business has real scale and demand. But placing the cancellation rate right alongside those numbers is a deliberate choice. It forces the reader to hold two things at once: the business is large, and it is losing a meaningful percentage of its potential revenue before orders are even fulfilled. The 14.21% rate is the tension in this entire analysis, and this panel is where that tension first surfaces.

---

### Visualization 2 — Revenue by Product Category

<img width="913" height="568" alt="revenue by category" src="https://github.com/user-attachments/assets/5be0b770-a8f3-43db-875d-5e05cb4119ba" />


**What is shown here:**
A bar chart breaking down total shipped revenue by product category. The Set category dominates at 49.87%, followed by Kurta at 27.13% and Western Dress at 14.19%.

**What this supports:**
This visualization makes a concentration risk argument that numbers alone do not communicate as clearly. Three categories — Set, Kurta, and Western Dress — generate approximately 91% of all revenue. The business is not diversified; it is built on a narrow product foundation. That is not inherently a problem, but it means any disruption to stock availability, pricing, or demand in those three categories would be felt immediately and severely across the entire business. This chart also highlights the gap between the top performers and everything else — Ethnic Dress, Blouse, Saree, and Dupatta are visible but barely. The visual makes the strategic case for either investing in those underperformers or rationalising them out entirely.

---

### Visualization 3 — Geographic Revenue & Cancellation Rate Map of India

<img width="913" height="568" alt="visualization three" src="https://github.com/user-attachments/assets/68b6bc68-e5ba-4b8a-b012-9fa53f723056" />


**What is shown here:**
A map of India with states shaded by revenue — darker states indicate higher revenue. Maharashtra and Karnataka lead in revenue; Kerala and Andhra Pradesh lead in cancellations.

**What this supports:**
This is where the analysis gets strategically interesting. The states generating the most revenue are not necessarily the states with the best operational performance. Maharashtra, the top revenue state at ₹13.34M, has a manageable 13.32% cancellation rate. But Kerala sits at 17.84% — meaning nearly 1 in 5 orders never completes. The map makes this tension geographic and therefore actionable — it tells a logistics or operations team exactly where to focus. Improving fulfilment in high-cancellation states does not require finding new customers; it requires serving existing ones better.

---

### Visualization 4 — Monthly Revenue Trend with Cancellation Overlay

<img width="913" height="568" alt="visualization four" src="https://github.com/user-attachments/assets/4244d818-9bc7-4214-b414-6845b83c65b1" />


**What is shown here:**
A dual-axis line chart showing monthly revenue alongside cancellation volume across the dataset period. April 2022 peaks at ₹28.84M in revenue and 7,137 cancellations. Revenue declines through May and June, while cancellations decline proportionally.

**What this supports:**
Seasonality and operational capacity are the two things this chart is really about. April is the clear peak — highest revenue, highest orders, and also highest cancellations. That last point is not a coincidence. When demand spikes, fulfilment systems come under pressure, and cancellations rise as a result. The chart also shows something subtler: as order volume declines in May and June, average order value actually increases. Fewer customers, but they are spending more per transaction. That suggests a shift in the customer mix during lower-demand periods — possibly fewer casual or low-value buyers, leaving a core of higher-intent purchasers. Understanding that seasonal dynamic would allow the business to plan inventory, staffing, and fulfilment capacity far more precisely around the April peak.

---

## Conclusion

This analysis confirms that the Amazon India operation is commercially strong but operationally uneven. Revenue scale is real, product concentration is a strategic consideration worth monitoring, geographic performance varies significantly by state, and the cancellation rate sits as the single biggest lever available for improving revenue without acquiring new customers. The Tableau dashboard was built to make all of these findings accessible to a business audience — not just analysts, but anyone who needs to make decisions based on this data.

---

### 📂 Where to Find Everything

- **SQL Queries & Scripts** → `sql/` folder
- **Tableau Workbook** → `tableau/` folder
- **Full Analysis Report** → `analysis/full_analysis.docx`
- **Executive Summary** → `analysis/executive_summary.docx`

---

*Thank you for reading. Feel free to reach out via the contact details at the top of this page — I am always open to discussion, feedback, and opportunities.*
