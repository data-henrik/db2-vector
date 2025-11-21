# run Db2 with the import command
# pick the right columns out of the source CSV, skip the header, and insert into the cities table
db2 "import from worldcities.csv of del method P(1,5,3,4) skipcount 1 insert into cities (name, country, lat, long)"
