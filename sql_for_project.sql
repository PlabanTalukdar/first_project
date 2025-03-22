--select everything

select *
from project


--student and family's information
--using cte

with familyinformation as 
(
select id, full_name, age, gender, location, family_size, mother_education,
father_education, mother_job, father_job, guardian
from project
)

select *
from familyinformation

--using temp_table
create table #familyinformation 
(
id int, full_name varchar(50), age int, gender varchar(50), location varchar(50), family_size int,
mother_education varchar(50), father_education varchar(50), mother_job varchar(50), father_job varchar(50),
guardian varchar(50)
)

insert into #familyinformation

select id, full_name, age, gender, location, family_size, mother_education,
father_education, mother_job, father_job, guardian
from project


select *
from #familyinformation

--find null values and delete it (if can't find, then clearing that statement and checking other)

select *
from #familyinformation
where location is null

delete
from #familyinformation
where location is null

--there is no null value except location

--order by age and gender

select *
from #familyinformation
order by age, gender



--checking the age and gender and compare them

select gender, age,  count(age) total
from #familyinformation
group by age, gender
order by age, gender

--group by location and compare with gender

select gender, location, count(location) as totalnumber
from #familyinformation
group by location, gender
order by location, gender

--check family_size 

select *,
case 
when family_size<=2 then 'Small Family'
when family_size>=3 and family_size<=4 then 'Medium Family'
else 'Large Family'
end as family_condition
from #familyinformation
order by family_size

--removing data where family_size is 0 but student has atleast one parent

delete 
from #familyinformation
where family_size=0

--order by education

select *
from #familyinformation
order by mother_education, father_education

--comparing location and education

select location, mother_education, count(mother_education) as total_mother_educated
from #familyinformation
group by location, mother_education
order by location

select location, father_education, count(father_education) as total_father_educated
from #familyinformation
group by location, father_education
order by location
 


--combining same type of value

select mother_education, father_education
from #familyinformation
update #familyinformation
set mother_education='Honors'
where mother_education='Hons'
update #familyinformation
set mother_education='Non_Educated'
where mother_education='None'
update #familyinformation
set mother_education='Non_Educated'
where mother_education='Non-Educated'
update #familyinformation
set father_education='Honors'
where father_education='Hons'
update #familyinformation
set father_education='Non_Educated'
where father_education='None'
update #familyinformation
set father_education='Non_Educated'
where father_education='Non-Educated'


--comparing job with location and education

select location, mother_education, count(mother_job) as total_job_doing_by_mother
from #familyinformation
where mother_job=1
group by location, mother_education
order by location

select location, father_education, count(father_job) as total_job_doing_by_mother
from #familyinformation
where father_job=1
group by location, father_education
order by location

--checking guardian and compare with student's gender and location

select guardian, count(guardian) as total_guardian
from #familyinformation
group by guardian
order by total_guardian desc

select gender, location, guardian, count(guardian) as total_guardian
from #familyinformation
group by gender, location, guardian
order by location, total_guardian 

--As this is a large table, I have made this short as I am a beginner and this is my first portfolio project.
--Any kind of suggestion will be accepted.






