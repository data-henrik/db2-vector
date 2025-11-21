--- return a vector value from lat/long input by composing string and casting that into a vector data type
CREATE or replace FUNCTION LATLNGVEC (LAT FLOAT(32), LNG FLOAT(32)) \
     RETURNS VECTOR(2,FLOAT32) \
     LANGUAGE SQL \
     CONTAINS SQL \
     NO EXTERNAL ACTION \
     DETERMINISTIC \
     RETURN VECTOR(varchar('['||lat||','||lng||']'),2,float32) 


--- compute distance in km for two lat/long points
--- see https://en.wikipedia.org/wiki/Haversine_formula
CREATE or replace FUNCTION haversine(Lat1 REAL, Lng1 REAL, Lat2 REAL, Lng2 REAL) \
RETURNS decimal(10,4) LANGUAGE SQL CONTAINS SQL NO EXTERNAL ACTION DETERMINISTIC \
RETURN \
    DECIMAL(2 * 6335 \
        * asin(sqrt( \
            pow(sin((radians(Lat2) - radians(Lat1)) / 2), 2) \
            + cos(radians(Lat1)) \
            * cos(radians(Lat2)) \
            * pow(sin((radians(Lng2) - radians(Lng1)) / 2), 2) \
        )),10,2)

--- turn a vector value with lat/long info into a decimal (the lat or long info)
--- pass in the vector and either 0 or 1 for the position
create or replace function vec2dec(vec vector(2,float32), pos int) \
returns decimal(10,6) language sql contains sql no external action deterministic \
return \
decode(pos, 1,substr(vector_serialize(vec),2,10),substr(vector_serialize(vec),13,10) )
