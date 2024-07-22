
-- What Online Tools/Certification used to Learn? --

SELECT DevType, LearnCodeCoursesCert AS CoursesCerts, LearnCode AS Resources
FROM   [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
WHERE DevType != 'NA' AND LearnCodeCoursesCert != 'NA'  AND DevType = 'Data or business analyst'

	--  What are the most popular languages? --
  
SELECT TOP 10 DevType, value AS NewLanguage, COUNT(value) AS Total
FROM   [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
CROSS APPLY string_split(LanguageHaveWorkedWith, ';') -- use STRING_SPLIT here --
WHERE DevType != 'NA' AND  value != 'NA' AND DevType = 'Data or business analyst'
GROUP BY value, DevType, LanguageHaveWorkedWith 


	--  What are the most popular databases? –-

SELECT Top 5 DevType, value AS NewDatabase,  COUNT(value) AS Total
FROM   [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
CROSS APPLY string_split(DatabaseHaveWorkedWith, ';') -- use STRING_SPLIT here --
WHERE DevType != 'NA' AND  value != 'NA' AND DevType = 'Data or business analyst'
GROUP BY value, DevType, DatabaseHaveWorkedWith
Order by Total desc, value

	-- Do years of experience affect Compensation, if so, how? –-

SELECT DevType, YearsCode, ISNULL(ConvertedCompYearly, 0) As NewCompensation
 FROM [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
 WHERE DevType = 'Data or Business Analyst' AND YearsCodePro != 'NA' AND Industry != 'NA' and ConvertedCompYearly != 0
 GROUP BY DevType, Industry, ResponseId, YearsCode, ConvertedCompYearly
 ORDER BY ConvertedCompYearly desc
 
   -- Years of experience with Professional degree -- 

 SELECT DevType, EdLevel, YearsCode, ISNULL(ConvertedCompYearly, 0) As NewCompensation
 FROM [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
 WHERE DevType = 'Data or Business Analyst' AND EdLevel = 'Professional degree (JD, MD, Ph.D, Ed.D, etc.)' AND YearsCodePro != 'NA' AND Industry != 'NA' AND ConvertedCompYearly != 0
 GROUP BY DevType, EdLevel, Industry, ResponseId, YearsCode, ConvertedCompYearly
 ORDER BY ConvertedCompYearly desc

  -- Years of experience with Master's degree -- 

 SELECT DevType, EdLevel, YearsCode, ISNULL(ConvertedCompYearly, 0) As NewCompensation
 FROM [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
 WHERE DevType = 'Data or Business Analyst' AND Edlevel = 'Master’s degree (M.A., M.S., M.Eng., MBA, etc.)' AND YearsCodePro != 'NA' AND Industry != 'NA' AND ConvertedCompYearly != 0
 GROUP BY DevType, EdLevel, Industry, ResponseId, YearsCode, ConvertedCompYearly
 ORDER BY ConvertedCompYearly desc

  -- Years of experience with Bachelor's degree -- 

 SELECT DevType, EdLevel, YearsCode, ISNULL(ConvertedCompYearly, 0) As NewCompensation
 FROM [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
 WHERE DevType = 'Data or Business Analyst' AND EdLevel = 'Bachelor’s degree (B.A., B.S., B.Eng., etc.)' AND YearsCodePro != 'NA' AND Industry != 'NA' AND ConvertedCompYearly != 0
 GROUP BY DevType, EdLevel, Industry, ResponseId, YearsCode, ConvertedCompYearly
 ORDER BY ConvertedCompYearly desc

   -- Years of experience with Associates degree -- 

 SELECT DevType, EdLevel, YearsCode, ISNULL(ConvertedCompYearly, 0) As NewCompensation
 FROM [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
 WHERE DevType = 'Data or Business Analyst' AND Edlevel = 'Associate degree (A.A., A.S., etc.)' AND YearsCodePro != 'NA' AND Industry != 'NA' AND ConvertedCompYearly != 0
 GROUP BY DevType, EdLevel, Industry, ResponseId, YearsCode, ConvertedCompYearly
 ORDER BY ConvertedCompYearly desc

 -- Years of experience with some college/university study without earning a degree -- 

 SELECT DevType, EdLevel, YearsCode, ISNULL(ConvertedCompYearly, 0) As NewCompensation
 FROM [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
 WHERE DevType = 'Data or Business Analyst' AND Edlevel = 'Some college/university study without earning a degree' AND YearsCodePro != 'NA' AND Industry != 'NA' AND ConvertedCompYearly != 0
 GROUP BY DevType, EdLevel, Industry, ResponseId, YearsCode, ConvertedCompYearly
 ORDER BY ConvertedCompYearly desc

 
-- What are the top 10 highest paid industries? –-

UPDATE[Stack_Overflow_Survey_2023].[dbo].[survey_results_public] SET ConvertedCompYearly = TRY_CAST(ConvertedCompYearly AS INT) FROM [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
SELECT Top 10 ConvertedCompYearly, Industry, DevType
FROM [Stack_Overflow_Survey_2023].[dbo].[survey_results_public]
WHERE DevType = 'Data or business analyst' and Industry != 'NA' and ConvertedCompYearly!= 0
GROUP BY ConvertedCompYearly, Industry, DevType
ORDER BY ConvertedCompYearly desc

