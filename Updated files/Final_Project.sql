/****** Script for SelectTopNRows command from SSMS  ******/
 
 Use Project

 ---check data type 
SELECT 
TABLE_CATALOG,
TABLE_SCHEMA,
TABLE_NAME, 
COLUMN_NAME, 
DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS

--look at data
select * from rawdata
--no nulls in the data. 

---Remove decimals from columns 
UPDATE rawdata SET Age = Round(Age, 0) 
UPDATE rawdata SET veg_intake = Round(veg_intake, 0)
UPDATE rawdata SET num_meals = Round(num_meals, 0)
UPDATE rawdata SET water_intake = Round(water_intake, 0)
UPDATE rawdata SET phy_activity = Round(phy_activity, 0)
UPDATE rawdata SET tech_time = Round(tech_time, 0)

Select Age, veg_intake, num_meals, water_intake, phy_activity, tech_time from rawdata


--Age
select min(Age) as Min_Age from rawdata--14
select max(Age) as Max_Age from rawdata--61
select avg(Age) as Avg_Age from rawdata--24.31


--data modeification. 


----binarize required attribute


--family_history_with_overweight
select count(family_history_with_overweight) as freq_no from rawdata where family_history_with_overweight = 'no'--385
select count(family_history_with_overweight) as freq_yes from rawdata where family_history_with_overweight = 'yes'--1726

UPDATE rawdata SET family_history_with_overweight = REPLACE(family_history_with_overweight, 'no','0')
UPDATE rawdata SET family_history_with_overweight = REPLACE(family_history_with_overweight, 'yes','1')

select count(family_history_with_overweight) as freq_0 from rawdata where family_history_with_overweight = '0'--385
select count(family_history_with_overweight) as freq_1 from rawdata where family_history_with_overweight = '1'--1726

--high_cal_intake
select count(high_cal_intake) as freq_no from rawdata where high_cal_intake = 'no'--245
select count(high_cal_intake) as freq_yes from rawdata where high_cal_intake = 'yes'--1866

UPDATE rawdata SET high_cal_intake = REPLACE(high_cal_intake, 'no','0')
UPDATE rawdata SET high_cal_intake = REPLACE(high_cal_intake, 'yes','1')

select count(high_cal_intake) as freq_0 from rawdata where high_cal_intake = '0'--245
select count(high_cal_intake) as freq_1 from rawdata where high_cal_intake = '1'--1866

--smoke
select count(smoke) as freq_no from rawdata where smoke = 'no'--2067
select count(smoke) as freq_yes from rawdata where smoke = 'yes'--44

UPDATE rawdata SET smoke = REPLACE(smoke, 'no','0')
UPDATE rawdata SET smoke = REPLACE(smoke, 'yes','1')

select count(smoke) as freq_0 from rawdata where smoke = '0'--2067
select count(smoke) as freq_1 from rawdata where smoke = '1'--44

--cal_monitor
select count(cal_monitor) as freq_no from rawdata where cal_monitor = 'no'--2015
select count(cal_monitor) as freq_yes from rawdata where cal_monitor = 'yes'--96

UPDATE rawdata SET cal_monitor = REPLACE(cal_monitor, 'no','0')
UPDATE rawdata SET cal_monitor = REPLACE(cal_monitor, 'yes','1')

select count(cal_monitor) as freq_0 from rawdata where cal_monitor = '0'--2015
select count(cal_monitor) as freq_1 from rawdata where cal_monitor = '1'--96

--phy_activity
select count(phy_activity) as freq_0 from rawdata where phy_activity = '0'-----720
select count(phy_activity) as freq_1 from rawdata where phy_activity = '1'-----776
select count(phy_activity) as freq_2 from rawdata where phy_activity = '2'-----496
select count(phy_activity) as freq_3 from rawdata where phy_activity = '3'-----119

UPDATE rawdata SET phy_activity = REPLACE(phy_activity, '0','0')
UPDATE rawdata SET phy_activity = REPLACE(phy_activity, '1','0')
UPDATE rawdata SET phy_activity = REPLACE(phy_activity, '2','1')
UPDATE rawdata SET phy_activity = REPLACE(phy_activity, '3','1')

select count(phy_activity) as freq_0 from rawdata where phy_activity = '0'------1496
select count(phy_activity) as freq_1 from rawdata where phy_activity = '1'----615

---alcohol_intake
select count(alcohol_intake) as freq_no from rawdata where alcohol_intake = 'no'--639
select count(alcohol_intake) as freq_Sometimes from rawdata where alcohol_intake = 'Sometimes'--1401
select count(alcohol_intake) as freq_Frequently from rawdata where alcohol_intake = 'Frequently'---70
select count(alcohol_intake) as freq_Always from rawdata where alcohol_intake = 'Always'--1 

UPDATE rawdata SET  alcohol_intake = REPLACE(alcohol_intake, 'no','0')
UPDATE rawdata SET  alcohol_intake = REPLACE(alcohol_intake, 'Sometimes','1')
UPDATE rawdata SET  alcohol_intake = REPLACE(alcohol_intake, 'Frequently','1')
UPDATE rawdata SET  alcohol_intake = REPLACE(alcohol_intake, 'Always','1')

select count(alcohol_intake) as freq_0 from rawdata where alcohol_intake = '0'--639
select count(alcohol_intake) as freq_1 from rawdata where alcohol_intake = '1'--1472


--food_btw_meals
select count(food_btw_meals) as freq_Sometimes from rawdata where food_btw_meals = 'Sometimes'--1765
select count(food_btw_meals) as freq_no from rawdata where food_btw_meals = 'no'--51
select count(food_btw_meals) as freq_Frequently from rawdata where food_btw_meals = 'Frequently'--242
select count(food_btw_meals) as freq_Always from rawdata where food_btw_meals = 'Always'---53

UPDATE rawdata SET  food_btw_meals = REPLACE(food_btw_meals, 'no','0')
UPDATE rawdata SET  food_btw_meals = REPLACE(food_btw_meals, 'Sometimes','1')
UPDATE rawdata SET  food_btw_meals = REPLACE(food_btw_meals, 'Frequently','1')
UPDATE rawdata SET  food_btw_meals = REPLACE(food_btw_meals, 'Always','1')

select count(food_btw_meals) as freq_0 from rawdata where food_btw_meals = '0'--51
select count(food_btw_meals) as freq_1 from rawdata where food_btw_meals = '1'--2060

--veg_intake
select count(veg_intake) as freq_1 from rawdata where veg_intake = '1'----102
select count(veg_intake) as freq_2 from rawdata where veg_intake = '2'---1013
select count(veg_intake) as freq_3 from rawdata where veg_intake = '3'---996

UPDATE rawdata SET  veg_intake = REPLACE(veg_intake, '1','0')
UPDATE rawdata SET  veg_intake = REPLACE(veg_intake, '2','1')
UPDATE rawdata SET  veg_intake = REPLACE(veg_intake, '3','1')

select count(veg_intake) as freq_0 from rawdata where veg_intake = '0'--102
select count(veg_intake) as freq_1 from rawdata where veg_intake = '1'--2009

--num_meals
select count(num_meals) as freq_1 from rawdata where num_meals = '1'----316
select count(num_meals) as freq_2 from rawdata where num_meals = '2'----176
select count(num_meals) as freq_3 from rawdata where num_meals = '3'----1470
select count(num_meals) as freq_4 from rawdata where num_meals = '4'----492

UPDATE rawdata SET  num_meals = REPLACE(num_meals, '1','0')
UPDATE rawdata SET  num_meals = REPLACE(num_meals, '2','0')
UPDATE rawdata SET  num_meals = REPLACE(num_meals, '3','1')
UPDATE rawdata SET  num_meals = REPLACE(num_meals, '4','1')

select count(num_meals) as freq_0 from rawdata where num_meals = '0'----492
select count(num_meals) as freq_1 from rawdata where num_meals = '1'----1619

--water_intake
select count(water_intake) as freq_1 from rawdata where water_intake = '1'--485
select count(water_intake) as freq_2 from rawdata where water_intake = '2'--1110
select count(water_intake) as freq_3 from rawdata where water_intake = '3'--516

UPDATE rawdata SET  water_intake = REPLACE(water_intake, '1','0')
UPDATE rawdata SET  water_intake = REPLACE(water_intake, '2','1')
UPDATE rawdata SET  water_intake = REPLACE(water_intake, '3','1')

select count(water_intake) as freq_0 from rawdata where water_intake = '0'--485
select count(water_intake) as freq_1 from rawdata where water_intake = '1'--1626

--round off height weight and BMI two 2 decimal plaves 
UPDATE rawdata SET  Height = Round(Height, 2)
UPDATE rawdata SET  Weight = Round(Weight, 2)

--calculate BMI
ALTER TABLE dbo.rawdata ADD BMI AS round((Weight /(Height * Height)), 2) PERSISTED;
select * from rawdata

--drop unwanted columns 
ALTER TABLE dbo.rawdata DROP COLUMN tech_time;
ALTER TABLE dbo.rawdata DROP COLUMN obese_level;
ALTER TABLE dbo.rawdata DROP COLUMN transport;

--adding obesity levels
SELECT subject_id, Height, Weight, BMI, 
  CASE 
	WHEN BMI <= 18  THEN 'Underweight'
    WHEN BMI between 18 and 25 THEN 'Normal' 
    WHEN BMI > 25 THEN 'Obese'
  END as obesity_level into #BMI_table
FROM rawdata

--display tables. 
select * from #BMI_table
select * from rawdata where phy_activity = '1'---615



---join #BMI_tab and rawdata
SELECT a.*, b.obesity_level  into #joined_tab FROM rawdata a
JOIN #BMI_table b
ON a.subject_id = b.subject_id 
group by a.subject_id, a.Gender, a.Age, a.Height, a.Weight, a.family_history_with_overweight, 
a.high_cal_intake, a.veg_intake, a.num_meals, a.food_btw_meals,
a.smoke, a.water_intake, a.cal_monitor, a.phy_activity, a.alcohol_intake, a.BMI,
b.obesity_level 
order by a.subject_id, a.Gender, a.Age, a.Height, a.Weight, a.family_history_with_overweight, 
a.high_cal_intake, a.veg_intake, a.num_meals, a.food_btw_meals,
a.smoke, a.water_intake, a.cal_monitor, a.phy_activity, a.alcohol_intake, a.BMI,
b.obesity_level----(2111 rows affected)

select * from #joined_tab

---File to export in weka for classification model
select * into dbo.weka_file from #joined_tab
select * from weka_file



select count(obesity_level) from weka_file where obesity_level = 'Obese'--1539
select count(obesity_level) from weka_file where obesity_level = 'Normal'---347
select count(obesity_level) from weka_file where obesity_level = 'Underweight'--225

---association file 
select * from #joined_tab

ALTER TABLE #joined_tab DROP COLUMN Gender;
ALTER TABLE #joined_tab DROP COLUMN subject_id;
ALTER TABLE #joined_tab DROP COLUMN Age;
ALTER TABLE #joined_tab DROP COLUMN Height;
ALTER TABLE #joined_tab DROP COLUMN Weight;
ALTER TABLE #joined_tab DROP COLUMN BMI;

select * from #joined_tab where obesity_level = 'Underweight'--225



UPDATE #joined_tab SET obesity_level=0 WHERE obesity_level = 'Underweight'
UPDATE #joined_tab SET obesity_level=0 WHERE obesity_level = 'Normal'
UPDATE #joined_tab SET obesity_level=1 WHERE obesity_level = 'Obese'

select * into dbo.association from #joined_tab

---files to export 
select * from weka_file
select * from association

---file to test the model (2111*0.8 = 1688.8¬1689) 
---so the remaining data would be (2111-1689 = 422)
SELECT * into #test
FROM weka_file  
ORDER BY rand()   
    OFFSET 0 ROWS  
    FETCH NEXT 422 ROWS only

select * from #test

select count(obesity_level) from #test where obesity_level = 'Obese'--159
select count(obesity_level) from #test where obesity_level = 'Normal'---240
select count(obesity_level) from #test where obesity_level = 'Underweight'--23

select * into dbo.test from #test 