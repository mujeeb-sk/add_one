CREATE EXTENSION add_one;

-- Basic functionality
SELECT add_one(0);
SELECT add_one(1);
SELECT add_one(-1);

-- NULL handling: STRICT means NULL in → NULL out, C code never called
SELECT add_one(NULL);

-- Boundary: largest safe input (INT_MAX - 1)
SELECT add_one(2147483646);

-- Overflow: INT_MAX + 1 raises an error (PostgreSQL traps signed integer overflow)
SELECT add_one(2147483647);
