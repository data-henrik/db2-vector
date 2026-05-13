-- drop existing table, if any, and create vector table for 24 dimensions
drop table v_random24;
create table v_random24(id int not null unique, v vector(24, float32) not null);

-- insert the data in chunks due to log space restrictions
insert into v_random24 (id,v) 
WITH random_numbers (id, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24) AS (
    SELECT
        1 AS id,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        SYSIBM.SYSDUMMY1
    UNION ALL
    SELECT
        id + 1,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        random_numbers
    WHERE
        id < 100000
)
SELECT
    id , vector('[' || r1 || ',' || r2 || ',' || r3 || ',' || r4 || ',' || r5 || ',' || r6 || ',' || r7 || ',' || r8 || ',' || r9 || ',' || r10 || ',' || r11 || ',' || r12 || ',' || r13 || ',' || r14 || ',' || r15 || ',' || r16 || ',' || r17 || ',' || r18 || ',' || r19 || ',' || r20 || ',' || r21 || ',' || r22 || ',' || r23 || ',' || r24 || ']', 24, float32) 
FROM
    random_numbers;

insert into v_random24 (id,v) 
WITH random_numbers (id, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24) AS (
    SELECT
        100001 AS id,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        SYSIBM.SYSDUMMY1
    UNION ALL
    SELECT
        id + 1,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        random_numbers
    WHERE
        id < 200000
)
SELECT
    id , vector('[' || r1 || ',' || r2 || ',' || r3 || ',' || r4 || ',' || r5 || ',' || r6 || ',' || r7 || ',' || r8 || ',' || r9 || ',' || r10 || ',' || r11 || ',' || r12 || ',' || r13 || ',' || r14 || ',' || r15 || ',' || r16 || ',' || r17 || ',' || r18 || ',' || r19 || ',' || r20 || ',' || r21 || ',' || r22 || ',' || r23 || ',' || r24 || ']', 24, float32) 
FROM
    random_numbers;

insert into v_random24 (id,v) 
WITH random_numbers (id, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24) AS (
    SELECT
        200001 AS id,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        SYSIBM.SYSDUMMY1
    UNION ALL
    SELECT
        id + 1,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        random_numbers
    WHERE
        id < 300000
)
SELECT
    id , vector('[' || r1 || ',' || r2 || ',' || r3 || ',' || r4 || ',' || r5 || ',' || r6 || ',' || r7 || ',' || r8 || ',' || r9 || ',' || r10 || ',' || r11 || ',' || r12 || ',' || r13 || ',' || r14 || ',' || r15 || ',' || r16 || ',' || r17 || ',' || r18 || ',' || r19 || ',' || r20 || ',' || r21 || ',' || r22 || ',' || r23 || ',' || r24 || ']', 24, float32) 
FROM
    random_numbers;

insert into v_random24 (id,v) 
WITH random_numbers (id, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24) AS (
    SELECT
        300001 AS id,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        SYSIBM.SYSDUMMY1
    UNION ALL
    SELECT
        id + 1,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        random_numbers
    WHERE
        id < 400000
)
SELECT
    id , vector('[' || r1 || ',' || r2 || ',' || r3 || ',' || r4 || ',' || r5 || ',' || r6 || ',' || r7 || ',' || r8 || ',' || r9 || ',' || r10 || ',' || r11 || ',' || r12 || ',' || r13 || ',' || r14 || ',' || r15 || ',' || r16 || ',' || r17 || ',' || r18 || ',' || r19 || ',' || r20 || ',' || r21 || ',' || r22 || ',' || r23 || ',' || r24 || ']', 24, float32) 
FROM
    random_numbers;

insert into v_random24 (id,v) 
WITH random_numbers (id, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24) AS (
    SELECT
        400001 AS id,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        SYSIBM.SYSDUMMY1
    UNION ALL
    SELECT
        id + 1,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        random_numbers
    WHERE
        id < 500000
)
SELECT
    id , vector('[' || r1 || ',' || r2 || ',' || r3 || ',' || r4 || ',' || r5 || ',' || r6 || ',' || r7 || ',' || r8 || ',' || r9 || ',' || r10 || ',' || r11 || ',' || r12 || ',' || r13 || ',' || r14 || ',' || r15 || ',' || r16 || ',' || r17 || ',' || r18 || ',' || r19 || ',' || r20 || ',' || r21 || ',' || r22 || ',' || r23 || ',' || r24 || ']', 24, float32) 
FROM
    random_numbers;

insert into v_random24 (id,v) 
WITH random_numbers (id, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24) AS (
    SELECT
        500001 AS id,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        SYSIBM.SYSDUMMY1
    UNION ALL
    SELECT
        id + 1,
        (RAND() * 32) - 16 as r1,
        (RAND() * 32) - 16 as r2,
        (RAND() * 32) - 16 as r3,
        (RAND() * 32) - 16 as r4,
        (RAND() * 32) - 16 as r5,
        (RAND() * 32) - 16 as r6,
        (RAND() * 32) - 16 as r7,
        (RAND() * 32) - 16 as r8,
        (RAND() * 32) - 16 as r9,
        (RAND() * 32) - 16 as r10,
        (RAND() * 32) - 16 as r11,
        (RAND() * 32) - 16 as r12,
        (RAND() * 32) - 16 as r13,
        (RAND() * 32) - 16 as r14,
        (RAND() * 32) - 16 as r15,
        (RAND() * 32) - 16 as r16,
        (RAND() * 32) - 16 as r17,
        (RAND() * 32) - 16 as r18,
        (RAND() * 32) - 16 as r19,
        (RAND() * 32) - 16 as r20,
        (RAND() * 32) - 16 as r21,
        (RAND() * 32) - 16 as r22,
        (RAND() * 32) - 16 as r23,
        (RAND() * 32) - 16 as r24
    FROM
        random_numbers
    WHERE
        id < 600000
)
SELECT
    id , vector('[' || r1 || ',' || r2 || ',' || r3 || ',' || r4 || ',' || r5 || ',' || r6 || ',' || r7 || ',' || r8 || ',' || r9 || ',' || r10 || ',' || r11 || ',' || r12 || ',' || r13 || ',' || r14 || ',' || r15 || ',' || r16 || ',' || r17 || ',' || r18 || ',' || r19 || ',' || r20 || ',' || r21 || ',' || r22 || ',' || r23 || ',' || r24 || ']', 24, float32) 
FROM
    random_numbers;        

create vector index v_random24_index on v_random24(v) with distance euclidean;

runstats on table v_random24 and indexes all;

