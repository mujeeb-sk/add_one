-- SQL run by CREATE EXTENSION. Filename must be <extension_name>--<version>.sql
-- Guard against someone \i-ing this file directly in psql, which would be a mistake.
\echo Use "CREATE EXTENSION add_one" to load this file. \quit

-- Declare the SQL-level function and bind it to the C symbol in the .so.
-- '$libdir/add_one' = the shared library, 'add_one' = the C function name.
-- STRICT: if any argument is NULL, return NULL without calling our C code.
CREATE FUNCTION add_one(integer) RETURNS integer
    AS '$libdir/add_one', 'add_one'
    LANGUAGE C STRICT IMMUTABLE;