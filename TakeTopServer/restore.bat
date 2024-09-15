set PGPASSWORD=zxckkllzly
echo on
..\pgsetup\postgresql\bin\pg_restore.exe -h 127.0.0.1 -p 5432 -U postgres -w -d taketopdecmpdb -v ..\database\TakeTopAppDBBackup.bak