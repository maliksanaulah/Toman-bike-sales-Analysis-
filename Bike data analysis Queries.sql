use bike_data

update bike_share_yr_0
set
temp = ROUND(temp, 2),
  atemp = ROUND(atemp, 2),
  hum = ROUND(hum, 2),
  windspeed = ROUND(windspeed, 2)
  select * from bike_share_yr_1

  update bike_share_yr_1
  set 
  temp = ROUND(temp, 2),
  atemp = ROUND(atemp, 2),
  hum = ROUND(hum, 2),
  windspeed = ROUND(windspeed, 2)


  update cost_table
  set 
  price = ROUND(price,2),
  COGS = ROUND (COGS,2)
  select * from cost_table

-- Combining 2 Tables 

-- Difference between UNION(It remove duplicate row, Return only Distinct rows) and UNION ALL (Doesnot remove Duplicate rows)
select * from bike_share_yr_0
UNION 
Select * from bike_share_yr_1


-- Join Cost_table with union table 

With cte as (
select * from bike_share_yr_0
UNION 
Select * from bike_share_yr_1
)
 
select * from cte a
join cost_table b
on a.yr = b.yr


-- Filter data

With cte as (
select * from bike_share_yr_0
UNION 
Select * from bike_share_yr_1
)
select dteday , season , a.yr , weekday ,hr , rider_type , riders , price,COGS,
riders*price as Revenue , riders*price - COGS as Profit
from cte a
join cost_table b
on a.yr = b.yr

-- Create View on that 
Drop VIEW bike_view;
go
CREATE VIEW bike_view as 
With cte as (
select * from bike_share_yr_0
UNION 
Select * from bike_share_yr_1
)
select dteday , season , a.yr , weekday ,hr , rider_type , riders , price,COGS,
riders*price as Revenue , riders*price - COGS*riders as Profit
from cte a
join cost_table b
on a.yr = b.yr

select * from bike_view






