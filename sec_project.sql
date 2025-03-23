--select everything

select *
from secpro

--academic information

create table #acainfo
(
id int, full_name varchar(50), age int, gender varchar(50), location varchar(50), studytime int, tutoring int,
school_type varchar(50), attendance int, extra_curricular_activities int, english int, math int,
science int, social_science int, art_culture int, stu_group varchar(50))

insert into #acainfo
select id, full_name, age, gender, location, studytime, tutoring, school_type, attendance, extra_curricular_activities,
english, math, science, social_science, art_culture, stu_group
from secpro

select *
from #acainfo

--checking null values and deleting them

select *
from #acainfo
where stu_group is null

delete
from #acainfo
where location is null

--here '0' isn't counted as null and found null value at location only

--order by studytime 

select *
from #acainfo
order by studytime desc

--order by tutoring

select *
from #acainfo
order by tutoring desc

--order and group by school_type and compare with gender and location

select *
from #acainfo
order by school_type

select school_type, location, count(school_type) as total_school
from #acainfo
group by school_type, location
order by school_type, location

select school_type, gender, count(school_type) as total_school
from #acainfo
group by school_type, gender
order by school_type, gender

--checking attendence

alter table #acainfo
add academic_report varchar(50)

select academic_report
from #acainfo
update #acainfo
set academic_report= case
when attendance>=30 and attendance<50 then 'Irregular'
when attendance>=50 and attendance<80 then 'Needs improvement on attendance'
else 'Regular' 
end 
where id>=1

--exam report 

alter table #acainfo
add average float, grade varchar(50)

select average 
from #acainfo
update #acainfo
set average= (math+english+science+social_science+art_culture)/5 
where id>=1

select grade 
from #acainfo
update #acainfo
set grade= case
when average<40 then 'F'
when average>=40 and average<50 then 'D'
when average>=50 and average<60 then 'C'
when average>=60 and average<70 then 'B'
when average>=70 and average<80 then 'A'
else 'A+'
end
where id>=1

select *
from #acainfo


--checking ece and students group comparing with location and gender

select gender, location, count(extra_curricular_activities) as ece_number
from #acainfo
group by gender, location
order by gender, location

select location,gender, stu_group, count(stu_group) as total_stu_group
from #acainfo
group by stu_group, gender, location
order by location, stu_group, gender


--deleting the unused column

alter table #acainfo
drop column age, tutoring

select *
from #acainfo

--And that's it. As a beginner, I have used easier commands to do the works. Willing to learn more and apply it on projects.
--Any kind of suggestion will be accepted. Thank you.





