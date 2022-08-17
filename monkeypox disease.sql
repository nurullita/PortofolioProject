create database Disease;

use Disease;

----preview the 1st table
select * from dbo.Monkey_Pox;

----count total country
select count(country) as total_country
from dbo.Monkey_Pox;

-----total confirmed cases
select sum(Confirmed_Cases) as cases
from dbo.Monkey_Pox;

----country with the highest confirmed cases
select country, confirmed_cases
from dbo.Monkey_Pox
order by Confirmed_Cases desc;

----show the 10 country with the highest confirmed cases
select top 10 country, confirmed_cases
from dbo.Monkey_Pox
order by Confirmed_Cases desc;

----country with the highest suspected cases
select country, suspected_cases
from dbo.Monkey_Pox
order by suspected_cases desc;

----showing the 10 country with the highest suspected cases
select top 10 country, suspected_cases
from dbo.Monkey_Pox
order by suspected_cases desc;

-----showing hospitalized cases
select country, Hospitalized
from dbo.Monkey_Pox
order by Hospitalized desc;

-----showing only 10 hospitalized cases
select top 10 country, Hospitalized
from dbo.Monkey_Pox
order by Hospitalized desc;

----showing ratio of total cases and total people being hospitalized
select country, Confirmed_Cases, Hospitalized
from dbo.Monkey_Pox
order by Confirmed_Cases desc;

-----only 10 total cases and total people being hospitalized
select top 10 country, Confirmed_Cases, Hospitalized
from dbo.Monkey_Pox
order by Confirmed_Cases desc;

----travel history
select country, Confirmed_Cases, travel_history_yes, travel_history_no
from dbo.Monkey_Pox
order by Travel_History_Yes desc;

---10 travel history
select top 10 country, Confirmed_Cases, travel_history_yes, travel_history_no
from dbo.Monkey_Pox
order by Travel_History_Yes desc;


----preview the 2nd table
select * from dbo.Worldwide_Case_Detection_Timeline;

EXEC sp_help 'dbo.Worldwide_Case_Detection_Timeline'

----count symptoms
select distinct Symptoms, count(Symptoms) as total
from dbo.Worldwide_Case_Detection_Timeline
where Symptoms !=' '
group by Symptoms
order by total desc;

----select 5 symptoms
select distinct top 5 Symptoms, count(Symptoms) as total
from dbo.Worldwide_Case_Detection_Timeline
where Symptoms !=' '
group by Symptoms
order by total desc;

----symptoms in every country
select distinct dbo.Monkey_Pox.Country, dbo.Worldwide_Case_Detection_Timeline.Symptoms
from dbo.Monkey_Pox
inner join dbo.Worldwide_Case_Detection_Timeline
on dbo.Monkey_Pox.Country = dbo.Worldwide_Case_Detection_Timeline.Country
where dbo.Worldwide_Case_Detection_Timeline.Symptoms != ' '
order by dbo.Monkey_Pox.Country;

-----looking for total isolated patients in every country
select country, count(dbo.Worldwide_Case_Detection_Timeline.[Isolated (Y/N/NA)]) as total
from dbo.Worldwide_Case_Detection_Timeline
where dbo.Worldwide_Case_Detection_Timeline.[Isolated (Y/N/NA)] != ' '
group by Country
order by total desc;

---looking for ratio hospitalized and isolated patients
select dbo.Monkey_Pox.Country, dbo.Monkey_Pox.Hospitalized, count(dbo.Worldwide_Case_Detection_Timeline.[Isolated (Y/N/NA)]) as total_isolated
from dbo.Monkey_Pox
inner join dbo.Worldwide_Case_Detection_Timeline
on dbo.Monkey_Pox.Country = dbo.Worldwide_Case_Detection_Timeline.Country
where dbo.Worldwide_Case_Detection_Timeline.[Isolated (Y/N/NA)] != ' '
group by dbo.Monkey_Pox.Country, dbo.Monkey_Pox.Hospitalized
order by total_isolated desc;

----preview table the 3rd table
select * from dbo.Daily_Cases

----case detection timeline from April to August in 5 highest contaminated country
select month(date) as months, United_States, Spain, Germany, England, France
from dbo.Daily_Cases
where month(date) in(4,5,6,7,8)

----looking for total cases every month in every country
select month(date) as month, sum(United_States) as US, sum(Spain) as Spain, sum(Germany) as Germany, sum(England) as England, sum(France) as France
from dbo.Daily_Cases
where month(date) in(4,5,6,7,8)
group by month(date);