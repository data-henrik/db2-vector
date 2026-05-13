SELECT id, 
    VECTOR_DISTANCE(
        v,
        vector('[-1.02,0.95, 1.55]',3,float32),
        EUCLIDEAN
    ) AS DISTANCE
FROM 
    v_random
ORDER BY 
    DISTANCE ASC
FETCH approx FIRST 200 ROWS ONLY;
