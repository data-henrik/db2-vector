-- drop existing table and (re)create
drop table v_random;
create table v_random(id int not null unique, v vector(3, float32) not null);
-- important: vector column needs to be NOT NULL for index to work

-- create some random data and insert into the table
-- (repeated and in small batches to not run out of log space)

insert into v_random (id,v) 
WITH random_numbers (id, r1, r2, r3) AS (
    SELECT
        1 AS id,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3
    FROM
        SYSIBM.SYSDUMMY1
    UNION ALL
    SELECT
        id + 1,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3
    FROM
        random_numbers
    WHERE
        id < 100000
)
SELECT
    id , vector('[' || r1 || ',' || r2 || ',' || r3 ||  ']',   3, float32) 
FROM
    random_numbers;

insert into v_random (id,v) 
WITH random_numbers (id, r1, r2, r3) AS (
    SELECT
        100001 AS id,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3
    FROM
        SYSIBM.SYSDUMMY1
    UNION ALL
    SELECT
        id + 1,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3
    FROM
        random_numbers
    WHERE
        id < 200000
)
SELECT
    id , vector('[' || r1 || ',' || r2 || ',' || r3 ||  ']',   3, float32) 
FROM
    random_numbers;

insert into v_random (id,v) 
WITH random_numbers (id, r1, r2, r3) AS (
    SELECT
        200001 AS id,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3
    FROM
        SYSIBM.SYSDUMMY1
    UNION ALL
    SELECT
        id + 1,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3
    FROM
        random_numbers
    WHERE
        id < 300000
)
SELECT
    id , vector('[' || r1 || ',' || r2 || ',' || r3 ||  ']',   3, float32) 
FROM
    random_numbers;

-- create the vector index
create vector index v_random_index on v_random(v) with distance euclidean;
-- finally, update the statistics
runstats on table v_random and indexes all;
