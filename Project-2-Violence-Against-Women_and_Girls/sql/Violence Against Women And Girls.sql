-- ============================================
-- PROJECT 2: VIOLENCE AGAINST WOMEN ANALYSIS
-- Dataset: DHS Survey - Attitudes Justifying Violence Against Women
-- Author: Buhle Damane
-- Date: November 27, 2025
-- Total Records: ~ 38 077
-- Countries: Multiple (Africa, Asia, South America, North America & Europe)
-- ============================================

-- ============================================
-- SECTION 1: DATA VERIFICATION & EXPLORATION
-- ============================================

-- Query 1: Total Records Count
-- Purpose: Verify all data imported successfully
SELECT COUNT(*) AS total_records
FROM violence_data;

-- Query 2: Countries Covered in Dataset
-- Purpose: Identify which countries are included and sample sizes
SELECT 
    country,
    COUNT(*) AS total_responses,
    COUNT(DISTINCT demographics_question) AS demographic_categories,
    MIN(survey_year) AS earliest_survey,
    MAX(survey_year) AS latest_survey
FROM violence_data
GROUP BY country
ORDER BY total_responses DESC;

-- Query 3: Survey Questions Overview
-- Purpose: Understand what specific questions were asked about violence justification
SELECT 
    question,
    COUNT(*) AS times_asked,
    ROUND(AVG(value_percentage), 2) AS avg_percentage_agreeing,
    ROUND(MIN(value_percentage), 2) AS min_percentage,
    ROUND(MAX(value_percentage), 2) AS max_percentage
FROM violence_data
GROUP BY question
ORDER BY avg_percentage_agreeing DESC;


-- ============================================
-- SECTION 2: GENDER ANALYSIS
-- ============================================

-- Query 4: Male vs Female Attitudes Comparison
-- Purpose: Compare how men and women differ in justifying violence
SELECT 
    gender,
    COUNT(*) AS total_responses,
    ROUND(AVG(value_percentage), 2) AS avg_justification_rate,
    ROUND(MIN(value_percentage), 2) AS min_rate,
    ROUND(MAX(value_percentage), 2) AS max_rate,
    COUNT(DISTINCT country) AS countries_represented
FROM violence_data
GROUP BY gender
ORDER BY avg_justification_rate DESC;

-- Query 5: Gender Differences by Country
-- Purpose: Identify countries with biggest gender gaps in attitudes
SELECT 
    country,
    ROUND(AVG(CASE WHEN gender = 'M' THEN value_percentage END), 2) AS male_avg,
    ROUND(AVG(CASE WHEN gender = 'F' THEN value_percentage END), 2) AS female_avg,
    ROUND(
        AVG(CASE WHEN gender = 'M' THEN value_percentage END) - 
        AVG(CASE WHEN gender = 'F' THEN value_percentage END), 2
    ) AS gender_gap,
    CASE 
        WHEN AVG(CASE WHEN gender = 'M' THEN value_percentage END) > 
             AVG(CASE WHEN gender = 'F' THEN value_percentage END) 
        THEN 'Men more likely to justify'
        ELSE 'Women more likely to justify'
    END AS gap_direction
FROM violence_data
GROUP BY country
HAVING male_avg IS NOT NULL AND female_avg IS NOT NULL
ORDER BY ABS(gender_gap) DESC
LIMIT 15;


-- ============================================
-- SECTION 3: EDUCATION IMPACT ANALYSIS
-- ============================================

-- Query 6: Education Level Impact on Attitudes
-- Purpose: Analyze how education correlates with violence justification
SELECT 
    demographics_response AS education_level,
    COUNT(*) AS total_responses,
    ROUND(AVG(value_percentage), 2) AS avg_justification,
    COUNT(DISTINCT country) AS countries_analyzed,
    CASE 
        WHEN AVG(value_percentage) > 40 THEN 'Critical Level'
        WHEN AVG(value_percentage) BETWEEN 25 AND 40 THEN 'High Concern'
        WHEN AVG(value_percentage) BETWEEN 15 AND 25 THEN 'Moderate Concern'
        ELSE 'Lower Concern'
    END AS concern_level
FROM violence_data
WHERE demographics_question = 'Education'
GROUP BY demographics_response
ORDER BY avg_justification DESC;

-- Query 7: Education Impact by Gender
-- Purpose: See if education's impact differs between men and women
SELECT 
    demographics_response AS education_level,
    gender,
    COUNT(*) AS responses,
    ROUND(AVG(value_percentage), 2) AS avg_justification
FROM violence_data
WHERE demographics_question = 'Education'
GROUP BY demographics_response, gender
ORDER BY education_level, gender;


-- ============================================
-- SECTION 4: DEMOGRAPHIC PATTERNS
-- ============================================

-- Query 8: Age Group Analysis
-- Purpose: Identify which age groups most/least justify violence
SELECT 
    demographics_response AS age_group,
    COUNT(*) AS total_responses,
    ROUND(AVG(value_percentage), 2) AS avg_justification,
    ROUND(MIN(value_percentage), 2) AS min_justification,
    ROUND(MAX(value_percentage), 2) AS max_justification,
    COUNT(DISTINCT country) AS countries
FROM violence_data
WHERE demographics_question = 'Age'
GROUP BY demographics_response
ORDER BY avg_justification DESC;

-- Query 9: Employment Status Impact
-- Purpose: Analyze if employment affects attitudes toward violence
SELECT 
    demographics_response AS employment_status,
    COUNT(*) AS total_responses,
    ROUND(AVG(value_percentage), 2) AS avg_justification,
    COUNT(DISTINCT country) AS countries_analyzed
FROM violence_data
WHERE demographics_question = 'Employment'
GROUP BY demographics_response
ORDER BY avg_justification DESC;

-- Query 10: Urban vs Rural Residence
-- Purpose: Compare attitudes between urban and rural populations
SELECT 
    demographics_response AS residence_type,
    COUNT(*) AS total_responses,
    ROUND(AVG(value_percentage), 2) AS avg_justification,
    ROUND(MIN(value_percentage), 2) AS lowest_rate,
    ROUND(MAX(value_percentage), 2) AS highest_rate,
    COUNT(DISTINCT country) AS countries
FROM violence_data
WHERE demographics_question = 'Residence'
GROUP BY demographics_response
ORDER BY avg_justification DESC;

-- Query 11: Marital Status Analysis
-- Purpose: Examine if marital status correlates with violence justification
SELECT 
    demographics_response AS marital_status,
    COUNT(*) AS total_responses,
    ROUND(AVG(value_percentage), 2) AS avg_justification,
    COUNT(DISTINCT country) AS countries_analyzed
FROM violence_data
WHERE demographics_question = 'Marital status'
GROUP BY demographics_response
ORDER BY avg_justification DESC;


-- ============================================
-- SECTION 5: ADVANCED ANALYSIS
-- ============================================

-- Query 12: Top 20 Worst Country-Demographic Combinations
-- Purpose: Identify specific demographics in specific countries with highest justification rates
-- Uses: Subquery, multiple aggregations
SELECT 
    country,
    demographics_question,
    demographics_response,
    gender,
    ROUND(AVG(value_percentage), 2) AS avg_justification,
    COUNT(*) AS sample_size
FROM violence_data
GROUP BY country, demographics_question, demographics_response, gender
HAVING COUNT(*) >= 3  -- At least 3 responses for reliability
ORDER BY avg_justification DESC
LIMIT 20;

-- Query 13: Violence Justification Reasons - Most to Least Accepted
-- Purpose: Rank specific reasons people use to justify violence
-- Uses: Aggregation, ordering by severity
SELECT 
    CASE 
        WHEN question LIKE '%burns the food%' THEN 'Burns food'
        WHEN question LIKE '%argues with him%' THEN 'Argues with husband'
        WHEN question LIKE '%goes out without telling%' THEN 'Goes out without permission'
        WHEN question LIKE '%neglects the children%' THEN 'Neglects children'
        WHEN question LIKE '%refuses to have sex%' THEN 'Refuses sex'
        WHEN question LIKE '%at least one specific reason%' THEN 'At least one reason'
        ELSE 'Other'
    END AS violence_reason,
    COUNT(*) AS times_measured,
    ROUND(AVG(value_percentage), 2) AS avg_acceptance_rate,
    ROUND(MIN(value_percentage), 2) AS min_acceptance,
    ROUND(MAX(value_percentage), 2) AS max_acceptance,
    COUNT(DISTINCT country) AS countries_covered
FROM violence_data
GROUP BY violence_reason
ORDER BY avg_acceptance_rate DESC;

-- Query 14: Countries with Most Critical Levels (Above 50% justification)
-- Purpose: Flag countries needing urgent intervention
-- Uses: HAVING clause for filtering aggregated data
SELECT 
    country,
    COUNT(*) AS total_measurements,
    ROUND(AVG(value_percentage), 2) AS overall_avg_justification,
    ROUND(MAX(value_percentage), 2) AS highest_recorded,
    COUNT(DISTINCT demographics_question) AS demographics_covered
FROM violence_data
GROUP BY country
HAVING AVG(value_percentage) > 50
ORDER BY overall_avg_justification DESC;

-- Query 15: Comprehensive Country Ranking with Risk Classification
-- Purpose: Create a complete country ranking with actionable risk levels
-- Uses: CTE (Common Table Expression), CASE statement, complex classification
WITH country_summary AS (
    SELECT 
        country,
        ROUND(AVG(value_percentage), 2) AS avg_justification,
        ROUND(MAX(value_percentage), 2) AS max_justification,
        COUNT(*) AS total_responses,
        COUNT(DISTINCT demographics_question) AS demographics_covered,
        ROUND(AVG(CASE WHEN gender = 'M' THEN value_percentage END), 2) AS male_avg,
        ROUND(AVG(CASE WHEN gender = 'F' THEN value_percentage END), 2) AS female_avg
    FROM violence_data
    GROUP BY country
)
SELECT 
    country,
    avg_justification,
    max_justification,
    total_responses,
    male_avg,
    female_avg,
    ROUND(male_avg - female_avg, 2) AS gender_gap,
    CASE 
        WHEN avg_justification >= 50 THEN 'CRITICAL - Urgent Intervention Needed'
        WHEN avg_justification >= 35 THEN 'SEVERE - High Priority'
        WHEN avg_justification >= 20 THEN 'MODERATE - Attention Required'
        WHEN avg_justification >= 10 THEN 'LOW-MODERATE - Monitor'
        ELSE 'LOW - Positive Progress'
    END AS risk_classification,
    CASE 
        WHEN demographics_covered >= 4 THEN 'Comprehensive data'
        WHEN demographics_covered >= 2 THEN 'Moderate data'
        ELSE 'Limited data'
    END AS data_quality
FROM country_summary
ORDER BY avg_justification DESC;


-- Query 16: Education Impact Across Countries (Advanced CTE)
-- Purpose: Show education's protective effect country by country
-- Uses: Multiple CTEs, complex joins, analytical ranking
WITH no_education AS (
    SELECT 
        country,
        ROUND(AVG(value_percentage), 2) AS no_edu_avg
    FROM violence_data
    WHERE demographics_question = 'Education' 
    AND demographics_response LIKE '%No education%'
    GROUP BY country
),
higher_education AS (
    SELECT 
        country,
        ROUND(AVG(value_percentage), 2) AS higher_edu_avg
    FROM violence_data
    WHERE demographics_question = 'Education' 
    AND demographics_response LIKE '%Higher%'
    GROUP BY country
)
SELECT 
    n.country,
    n.no_edu_avg AS no_education_acceptance,
    h.higher_edu_avg AS higher_education_acceptance,
    ROUND(n.no_edu_avg - h.higher_edu_avg, 2) AS education_impact,
    CASE 
        WHEN (n.no_edu_avg - h.higher_edu_avg) > 30 THEN 'Very Strong Impact'
        WHEN (n.no_edu_avg - h.higher_edu_avg) > 20 THEN 'Strong Impact'
        WHEN (n.no_edu_avg - h.higher_edu_avg) > 10 THEN 'Moderate Impact'
        WHEN (n.no_edu_avg - h.higher_edu_avg) > 0 THEN 'Slight Impact'
        ELSE 'Minimal/Negative Impact'
    END AS impact_level
FROM no_education n
INNER JOIN higher_education h ON n.country = h.country
ORDER BY education_impact DESC;


-- ============================================
-- END OF ANALYSIS
-- ============================================