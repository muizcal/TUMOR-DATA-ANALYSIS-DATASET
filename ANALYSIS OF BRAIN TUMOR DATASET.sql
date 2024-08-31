select *
from BrainTumorDataSet.dbo.brain_tumor_dataset


---  Data Exploration
select 
CASE 
        WHEN Grade = 'I' THEN 'Low'
        WHEN Grade = 'II' THEN 'Medium'
        WHEN Grade IN ('III', 'IV') THEN 'High'
        ELSE 'Unknown'
END AS tumor_grade
from BrainTumorDataSet.dbo.brain_tumor_dataset

--- Tumor Distribution by Type

SELECT [Tumor Type], COUNT(*) AS count
from BrainTumorDataSet.dbo.brain_tumor_dataset
GROUP BY [Tumor Type];

-- Average Tumor Size by Location
SELECT location, CEILING(AVG(CAST([Size (cm)] AS FLOAT))) AS average_size
FROM BrainTumorDataSet.dbo.brain_tumor_dataset
GROUP BY location;

-- Age Distribution by Tumor Grade
SELECT [Tumor Type], CEILING(AVG(CAST([Patient Age] AS FLOAT))) AS AVEARGE_PATIENT_AGE
FROM BrainTumorDataSet.dbo.brain_tumor_dataset
GROUP BY [Tumor Type];

-- Patients with Advanced Tumor Grades
SELECT *
FROM BrainTumorDataSet.dbo.brain_tumor_dataset
WHERE 
    CASE 
        WHEN Grade IN ('I', 'II') THEN 'Low'
        WHEN  Grade = 'III' THEN 'Medium'
        WHEN  Grade IN ('IV', 'V') THEN 'High'
        ELSE 'Unknown'
    END = 'High';


	-- Tumors of a Specific Size
SELECT *
FROM BrainTumorDataSet.dbo.brain_tumor_dataset
WHERE ceiling([Size (cm)]) >=7;

-- Summary of Brain Tumor Data Analysis

--The analysis of the brain tumor dataset focused on several key aspects to gain insights into the distribution, severity, and demographics of patients affected by this condition.

--1. Tumor of a Specific Type
   --The dataset was filtered to examine tumors of a specific type, highlighting the prevalence and characteristics unique to this subset. The data provided insights into the common locations, sizes, and distribution patterns associated with this tumor type.

--2. Patients with Advanced Tumor Grades
  -- A critical area of the analysis involved identifying patients with advanced tumor grades. These patients were categorized based on tumor severity, with particular attention paid to grades III and IV, which are indicative of more aggressive and advanced stages of the disease. The analysis provided valuable information on the proportion of patients affected by these higher grades.

--3. Age Distribution by Tumor Grade
   --Age distribution was examined across different tumor grades to understand how the severity of the tumor correlates with patient age. This analysis revealed potential trends, such as whether younger or older patients are more likely to present with advanced grades, providing insights into age-related risks.

--4. Tumor Distribution by Type
   --The distribution of tumors by type was analyzed to understand the prevalence of various tumor types within the dataset. This helped in identifying the most common tumor types and their characteristics, aiding in the identification of patterns that could be crucial for diagnosis and treatment planning.

--5. Data Exploration
   -- A comprehensive exploration of the dataset was conducted to identify any anomalies, outliers, or significant trends. This phase of the analysis ensured that the data was thoroughly understood and any critical patterns were highlighted. The exploration also helped in identifying potential areas for further research and analysis.

--	Conclusion

--The analysis provided a detailed overview of the brain tumor dataset, with a focus on specific tumor types, advanced tumor grades, age-related distribution, and overall tumor distribution. These findings contribute to a deeper understanding of brain tumor characteristics and can support medical professionals in making informed decisions regarding diagnosis, treatment, and patient management.
