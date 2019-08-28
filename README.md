docker-compose.yml which creates the mssql-server-linux docker image and automatically executes provided .sql files.
*Heavily inspired by https://github.com/shanegenschaw/mssql-server-linux*

**Usage:**
1. Clone this repo
2. Place .sql files in dev/db/
3. Run ```docker-compose up```
4. The .sql files will be automatically executed in alphanumerical order

To remove the create db image use 
```docker-compose down```
