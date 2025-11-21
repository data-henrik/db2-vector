# Db2 vector for GEO search

See my blog post [Db2 vector for GEO search](https://data-henrik.de/2025/11/db2-vector-geo-search/) for details.

Files to create the table, import data, fill the vector column, and query the data are available.

### Summary

You can use the Db2 VECTOR data type to store latitude/longitude information, then use VECTOR_DISTANCE to find nearby locations to the specified centerpoint.

- Create a table:
  ```sql
  create table if not exists cities(
    name varchar(60),
    country varchar(30),
    lat float(32),
    long float(32),
    coord vector(2,float32)
  );
  ```

- Insert data (see files and blog post)
- Search for nearby data
  ```SQL
  select name, 
       country, 
       vector_distance((select coord 
                        from cities 
                        where name='Friedrichshafen'),
                        coord,
                        euclidean) as distance 
  from cities 
  order by distance 
  limit 20;
  ```

It is possible to create additional [helper functions](functions.sql), e.g., to compute the distance in kilometers, or for easy access to vector components.

