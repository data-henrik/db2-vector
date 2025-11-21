drop table if exists cities;

---create table with few columns to store lat/long info for cities
create table if not exists cities(name varchar(60), country varchar(30), lat float(32), long float(32), coord vector(2,float32));
