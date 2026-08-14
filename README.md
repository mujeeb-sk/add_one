# add_one

A minimal PostgreSQL extension that increments an integer by one. Intended as a learning template for writing C-based PostgreSQL extensions with PGXS.

## Requirements

- PostgreSQL 13+ (with headers/dev tools)
- `pg_config` on your `PATH`

## Build & Install

```bash
make
sudo make install
```

## Usage

```sql
CREATE EXTENSION add_one;

SELECT add_one(41);  -- → 42
SELECT add_one(-1);  -- → 0
SELECT add_one(NULL); -- → NULL  (STRICT)
```

## Run Tests

```bash
make installcheck
```

Requires a running PostgreSQL server. Results are written to `results/` and compared against `test/expected/`.

## Files

| File | Purpose |
|------|---------|
| `add_one.c` | C implementation |
| `add_one.control` | Extension metadata |
| `add_one--1.0.sql` | SQL install script |
| `Makefile` | PGXS build rules |
| `test/sql/add_one.sql` | Regression test input |
| `test/expected/add_one.out` | Expected test output |
