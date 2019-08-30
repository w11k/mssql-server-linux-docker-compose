#!/bin/bash

if [ -f "/var/opt/mssql/initalized_lock" ]; then
  echo "$0: Skipping database initialization"
  exit 0
fi

until /opt/mssql-tools/bin/sqlcmd -U sa -P $SA_PASSWORD -Q 'SELECT 1;' &>/dev/null; do
  echo "$0: SQLServer not started..."
  sleep 1
done

echo "$0: Initializing database"

for filename in /var/opt/mssql/initdb/*.sql; do

  echo "exec $filename"
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i $filename -r 0 -b
  exitCode=$?

  if [ "$exitCode" != 0 ]; then
    kill -9 $(pgrep sqlservr)
    exit 1
  fi

done

touch /var/opt/mssql/initalized_lock
