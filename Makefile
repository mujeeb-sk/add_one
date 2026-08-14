# PGXS Makefile - the standard build system for out-of-tree extensions.

MODULES = add_one			# builds add_one.c -> add_one.so
EXTENSION = add_one			# the .control file base name
DATA = add_one--1.0.sql		# SQL scripts to install
REGRESS = add_one			# regression test names (under test/sql/)
REGRESS_OPTS = --inputdir=test	# look for sql/ and expected/ under test/

# Ask the installed server where its build infrastructure lives, then
# include it. pg_config must be on your PATH (or set PG_CONFIG explicitly).
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)