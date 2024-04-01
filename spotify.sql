use practise;
select *from dbo.[spotify-data];


--no of songs

select count([name]) from dbo.[spotify-data];

--average duration of song

SELECT AVG(CAST(duration_ms AS BIGINT)) AS average_duration_ms
FROM dbo.[spotify-data];

--no of unique artist

select distinct count([artists]) from dbo.[spotify-data];

--top 10 popular song

select top 10  [name],max([popularity]) as  max_popularity from dbo.[spotify-data] 
group by [name] order by [max_popularity] desc;

--no of songs released in each year

select count([release_date]) as no_of_songs,[year] from dbo.[spotify-data]
group by [year] order by no_of_songs ;

--no of years having least no of relesed song
select [year], count([release_date]) as no_of_songs,[year] from 
dbo.[spotify-data]group by [year] order by [no_of_songs] asc ;

--top 5 artist by Their popular song

select top 5 [artists],max([popularity]) as max_popular from dbo.[spotify-data]
group by [artists] order by [max_popular] desc;

--highest average tempo of the song

select 5 [name],avg([tempo]) as avg_tempo 
from dbo.[spotify-data]
group by [name] order by [avg_tempo] desc;

--highest avg tempo  year

select top 1 [year],max([tempo]) as max_tempo from dbo.[spotify-data]
group by [year] order by [max_tempo] desc;

--10 danceable song released in 2020

select top 10 [name],[danceability]
from dbo.[spotify-data]
where [year] = 2020
order by[danceability] desc;

--popular song by explict

select top 10 [name],[popularity] from dbo.[spotify-data]
where [explicit]=1
order by [popularity] desc;

--popular song by energy
select top 10 [name],[energy] 
from dbo.[spotify-data]
order by [energy] desc;

--no of songs by major/minor
select [mode],count([name]) as no_of_songs
from dbo.[spotify-data] group by [mode];