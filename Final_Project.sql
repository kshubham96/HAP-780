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
select * from unclean
---Remove all the patients that are below the age of 19 (as they have different obesity levels)
select * from dbo.unclean  where Age <= 19 ---410 rows 
select * into dbo.rawdata from dbo.unclean where Age> 19
select * from dbo.rawdata where Age <= '19'--none
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
select min(Age) as Min_Age from rawdata--19
select max(Age) as Max_Age from rawdata--61
select avg(Age) as Avg_Age from rawdata--24.31


--data modeification. 


----binarize required attribute


--family_history_with_overweight
select count(family_history_with_overweight) as freq_no from rawdata where family_history_with_overweight = 'no'--250
select count(family_history_with_overweight) as freq_yes from rawdata where family_history_with_overweight = 'yes'--1451

UPDATE rawdata SET family_history_with_overweight = REPLACE(family_history_with_overweight, 'no','0')
UPDATE rawdata SET family_history_with_overweight = REPLACE(family_history_with_overweight, 'yes','1')

select count(family_history_with_overweight) as freq_0 from rawdata where family_history_with_overweight = '0'--250
select count(family_history_with_overweight) as freq_1 from rawdata where family_history_with_overweight = '1'--1451

--high_cal_intake
select count(high_cal_intake) as freq_no from rawdata where high_cal_intake = 'no'--195
select count(high_cal_intake) as freq_yes from rawdata where high_cal_intake = 'yes'--1506

UPDATE rawdata SET high_cal_intake = REPLACE(high_cal_intake, 'no','0')
UPDATE rawdata SET high_cal_intake = REPLACE(high_cal_intake, 'yes','1')

select count(high_cal_intake) as freq_0 from rawdata where high_cal_intake = '0'--195
select count(high_cal_intake) as freq_1 from rawdata where high_cal_intake = '1'--1506

--smoke
select count(smoke) as freq_no from rawdata where smoke = 'no'--1660
select count(smoke) as freq_yes from rawdata where smoke = 'yes'--41

UPDATE rawdata SET smoke = REPLACE(smoke, 'no','0')
UPDATE rawdata SET smoke = REPLACE(smoke, 'yes','1')

select count(smoke) as freq_0 from rawdata where smoke = '0'--1660
select count(smoke) as freq_1 from rawdata where smoke = '1'--41

--cal_monitor
select count(cal_monitor) as freq_no from rawdata where cal_monitor = 'no'--1651
select count(cal_monitor) as freq_yes from rawdata where cal_monitor = 'yes'--50

UPDATE rawdata SET cal_monitor = REPLACE(cal_monitor, 'no','0')
UPDATE rawdata SET cal_monitor = REPLACE(cal_monitor, 'yes','1')

select count(cal_monitor) as freq_0 from rawdata where cal_monitor = '0'--1651
select count(cal_monitor) as freq_1 from rawdata where cal_monitor = '1'--50

--phy_activity
select count(phy_activity) as freq_0 from rawdata where phy_activity = '0'-----625
select count(phy_activity) as freq_1 from rawdata where phy_activity = '1'-----611
select count(phy_activity) as freq_2 from rawdata where phy_activity = '2'-----380
select count(phy_activity) as freq_3 from rawdata where phy_activity = '3'-----85

UPDATE rawdata SET phy_activity = REPLACE(phy_activity, '0','0')
UPDATE rawdata SET phy_activity = REPLACE(phy_activity, '1','0')
UPDATE rawdata SET phy_activity = REPLACE(phy_activity, '2','1')
UPDATE rawdata SET phy_activity = REPLACE(phy_activity, '3','1')

select count(phy_activity) as freq_0 from rawdata where phy_activity = '0'------1236
select count(phy_activity) as freq_1 from rawdata where phy_activity = '1'----465

---alcohol_intake
select count(alcohol_intake) as freq_no from rawdata where alcohol_intake = 'no'--467
select count(alcohol_intake) as freq_Sometimes from rawdata where alcohol_intake = 'Sometimes'--1181
select count(alcohol_intake) as freq_Frequently from rawdata where alcohol_intake = 'Frequently'---52
select count(alcohol_intake) as freq_Always from rawdata where alcohol_intake = 'Always'--1 

UPDATE rawdata SET  alcohol_intake = REPLACE(alcohol_intake, 'no','0')
UPDATE rawdata SET  alcohol_intake = REPLACE(alcohol_intake, 'Sometimes','1')
UPDATE rawdata SET  alcohol_intake = REPLACE(alcohol_intake, 'Frequently','1')
UPDATE rawdata SET  alcohol_intake = REPLACE(alcohol_intake, 'Always','1')

select count(alcohol_intake) as freq_0 from rawdata where alcohol_intake = '0'--467
select count(alcohol_intake) as freq_1 from rawdata where alcohol_intake = '1'--1234


--food_btw_meals
select count(food_btw_meals) as freq_Sometimes from rawdata where food_btw_meals = 'Sometimes'--1432
select count(food_btw_meals) as freq_no from rawdata where food_btw_meals = 'no'--47
select count(food_btw_meals) as freq_Frequently from rawdata where food_btw_meals = 'Frequently'--183
select count(food_btw_meals) as freq_Always from rawdata where food_btw_meals = 'Always'---39

UPDATE rawdata SET  food_btw_meals = REPLACE(food_btw_meals, 'no','0')
UPDATE rawdata SET  food_btw_meals = REPLACE(food_btw_meals, 'Sometimes','1')
UPDATE rawdata SET  food_btw_meals = REPLACE(food_btw_meals, 'Frequently','1')
UPDATE rawdata SET  food_btw_meals = REPLACE(food_btw_meals, 'Always','1')

select count(food_btw_meals) as freq_0 from rawdata where food_btw_meals = '0'--47
select count(food_btw_meals) as freq_1 from rawdata where food_btw_meals = '1'--1654

--veg_intake
select count(veg_intake) as freq_1 from rawdata where veg_intake = '1'----73
select count(veg_intake) as freq_2 from rawdata where veg_intake = '2'---808
select count(veg_intake) as freq_3 from rawdata where veg_intake = '3'---820

UPDATE rawdata SET  veg_intake = REPLACE(veg_intake, '1','0')
UPDATE rawdata SET  veg_intake = REPLACE(veg_intake, '2','1')
UPDATE rawdata SET  veg_intake = REPLACE(veg_intake, '3','1')

select count(veg_intake) as freq_0 from rawdata where veg_intake = '0'--73
select count(veg_intake) as freq_1 from rawdata where veg_intake = '1'--1628

--num_meals
select count(num_meals) as freq_1 from rawdata where num_meals = '1'----255
select count(num_meals) as freq_2 from rawdata where num_meals = '2'----143
select count(num_meals) as freq_3 from rawdata where num_meals = '3'----1207
select count(num_meals) as freq_4 from rawdata where num_meals = '4'----96

UPDATE rawdata SET  num_meals = REPLACE(num_meals, '1','0')
UPDATE rawdata SET  num_meals = REPLACE(num_meals, '2','0')
UPDATE rawdata SET  num_meals = REPLACE(num_meals, '3','1')
UPDATE rawdata SET  num_meals = REPLACE(num_meals, '4','1')

select count(num_meals) as freq_0 from rawdata where num_meals = '0'----398
select count(num_meals) as freq_1 from rawdata where num_meals = '1'----1303

--water_intake
select count(water_intake) as freq_1 from rawdata where water_intake = '1'--374
select count(water_intake) as freq_2 from rawdata where water_intake = '2'--881
select count(water_intake) as freq_3 from rawdata where water_intake = '3'--446

UPDATE rawdata SET  water_intake = REPLACE(water_intake, '1','0')
UPDATE rawdata SET  water_intake = REPLACE(water_intake, '2','1')
UPDATE rawdata SET  water_intake = REPLACE(water_intake, '3','1')

select count(water_intake) as freq_0 from rawdata where water_intake = '0'--374
select count(water_intake) as freq_1 from rawdata where water_intake = '1'--1327

--round off height weight and BMI two 2 decimal plaves 
UPDATE rawdata SET  Height = Round(Height, 2)
UPDATE rawdata SET  Weight = Round(Weight, 2)

--calculate BMI
ALTER TABLE dbo.rawdata ADD BMI AS round((Weight /(Height * Height)), 2) PERSISTED;
select * from rawdata

--drop unwanted columns 

ALTER TABLE dbo.rawdata DROP COLUMN NObeyesdad;
ALTER TABLE dbo.rawdata DROP COLUMN transport;

select * from rawdata

--adding obesity levels
SELECT subject_id, Height, Weight, BMI, 
  CASE 
	WHEN BMI <= 18  THEN 'Underweight'
    WHEN BMI between 18 and 25 THEN 'Normal' 
    WHEN BMI between 25 and 29.9 THEN 'Overweight'
	WHEN BMI > 29.9 THEN 'Obese'
  END as obesity_level into #BMI_table
FROM rawdata

--display tables. 
select * from #BMI_table
select * from rawdata 



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
b.obesity_level

select * from #joined_tab


---File to export in weka for classification model
select * into dbo.weka_file from #joined_tab
select * from weka_file

--File to export to weka for testing the data set
select * into dbo.test from #joined_tab
select * from test
Alter table dbo.test drop column BMI
ALter table dbo.test drop column Height
ALter table dbo.test drop column Weight
ALter table dbo.test drop column subject_id


select count(obesity_level) from weka_file where obesity_level = 'Obese'--880
select count(obesity_level) from weka_file where obesity_level = 'Normal'---229
select count(obesity_level) from weka_file where obesity_level = 'Underweight'--122
select count(obesity_level) from weka_file where obesity_level = 'Overweight'--480

---files to export 
select * from weka_file
select * from test

