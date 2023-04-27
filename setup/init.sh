#!/bin/bash
set -e
#!/bin/bash

psql -U ${POSTGRES_USER} <<-END
CREATE ROLE ${DB_ANON_ROLE} WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

GRANT pg_read_all_data, pg_write_all_data TO ${DB_ANON_ROLE};

END

psql -U ${POSTGRES_USER} <<-END
CREATE ROLE api_reader WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

GRANT pg_read_all_data TO api_reader ;

END



for filename in /setup/schemas/*; do
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f $filename
done



psql -U "$POSTGRES_USER" -c "\copy indicator from '/setup/csvdata/indicators.csv' delimiter ';' csv header"
psql -U "$POSTGRES_USER" -c "\copy location from '/setup/csvdata/locations.csv' delimiter ';' csv header"
psql -U "$POSTGRES_USER" -c "\copy unit from '/setup/csvdata/unit.csv' delimiter ',' csv header"
psql -U "$POSTGRES_USER" -c "\copy maintable from '/setup/csvdata/maintable.csv' delimiter ',' csv header"
psql -U "$POSTGRES_USER" -c "\copy okved from '/setup/csvdata/okved.csv' delimiter ';' csv header"
psql -U "$POSTGRES_USER" -c "\copy scenario from '/setup/csvdata/scen.csv' delimiter ';' csv header"

for filename in /setup/sql_funcs/*; do
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f $filename
done



