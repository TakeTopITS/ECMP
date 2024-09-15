set PGPASSWORD=liyisong
echo on
pg_restore -h 127.0.0.1 -p 5432 -U postgres -w -d taketopecmpdb -v 20220106.backup