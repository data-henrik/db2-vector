--- find neighboring cities for Munich, Germany
select name, country, vector_distance((select coord from cities where name='Munich'),coord,euclidean) as distance from cities order by distance limit 20;

--- find neighboring cities for San Jose, California, USA
select name, country, vector_distance((select coord from cities where name='San Jose' and country='United States'),coord,euclidean) as distance from cities order by distance limit 30;

--- find neighboring cities for Markham, Ontaria, Canada
select name, country, vector_distance((select coord from cities where name='Markham' and country='Canada'),coord,euclidean) as distance from cities order by distance limit 30;

--- find neighboring cities for Helgoland, Germany, identified by geo coordinates (lat/long)
select name, country, vector_distance(latlngvec(54.179,7.882),coord,euclidean) as distance from cities order by distance limit 20;

--- direct distance between Munich and Friedrichshafen
values haversine((select lat from cities where name='Munich'),(select long from cities where name='Munich'),(select lat from cities where name='Friedrichshafen'),(select long from cities where name='Friedrichshafen'));


-- some experiment to combine vector distance with actual distance in kilometers
select name,country, haversine(vec2dec(coord,0), vec2dec(coord,1), vec2dec(coord2,0), vec2dec(coord2,1)) from (select loc2.*, lag (loc2.coord) over (order by num) as coord2 from (select rownumber() over() as num, loc.* from (with loc(name,country,coord,distance) as (values('Helgoland','Germany',vector('[54.179,7.882]',2,float32),0) union all (select name, country, coord, vector_distance(latlngvec(54.179,7.882),coord,euclidean) as distance from cities order by distance limit 15)) select * from loc order by distance) loc) loc2) loc3
