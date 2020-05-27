
#!/usr/bin/env bash
# requires that psql client is installed and PGPASSWORD var exists in ~/.pqpass

echo "Installing postgis extension"
psql -h $DBHOST -d $DBNAME -U $DBUSER -w -p 5432 -c "CREATE EXTENSION IF NOT EXISTS postgis;"

echo "Running gnaf db restore from pg_dump file"
/usr/bin/pg_restore -Fc -h $DBHOST -d $DBNAME -w -p 5432 -U $DBUSER ../gnaf-dump-files/gnaf-202005.dmp

echo "Running gnaf admin boundary db restore from pg_dump file"
/usr/bin/pg_restore -Fc -h $DBHOST -d $DBNAME -w -p 5432 -U $DBUSER ../gnaf-dump-files/admin-bdys-202005.dmp


