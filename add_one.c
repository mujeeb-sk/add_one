#include "postgres.h"       /* core PostgreSQL declaration - always first*/
#include "fmgr.h"           /* function manager: PG_FUNCTION_ARGS, macros, etc. */

/*
 * Every loadable module must contain this. It stamps the compiled .so with
 * the server version + ABI info so Postgres refuses to load a mismatched
 * build instead of crashing. Declare it exactly once per module.
 */
PG_MODULE_MAGIC;

/*
 * Version-1 calling convention metadata. This generates the glue that lets
 * the server call our C function. Needed once per exposed function.
 */
PG_FUNCTION_INFO_V1(add_one);

/*
 * The function itself.
 *
 * Notice the signature is NOT (int a). All V1 functions take PG_FUNCTION_ARGS
 * (a hidden FunctionCallInfo struct) and return a Datum — Postgres's generic
 * "any value" type. You pull arguments out and push results back through
 * macros that handle the Datum <-> C type conversion.
 */
Datum
add_one(PG_FUNCTION_ARGS) {
    int32 arg = PG_GETARG_INT32(0);     /* reads the 1st argument as int32 */

    /* Check for integer overflow before incrementing */
    if (arg == PG_INT32_MAX) {
        ereport(ERROR,
                (errcode(ERRCODE_NUMERIC_VALUE_OUT_OF_RANGE),
                 errmsg("integer out of range")));
    }

    PG_RETURN_INT32(arg + 1);       /* wrap the int32 result back into a Datum */
}