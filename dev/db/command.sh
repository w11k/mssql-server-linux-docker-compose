#!/bin/bash
# heavily inspired by https://github.com/shanegenschaw/mssql-server-linux
/var/opt/mssql/initdb/initdb.sh &
/opt/mssql/bin/sqlservr
exit $?
