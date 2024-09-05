# POSTGRES RDS DB

## Connect remote db
```sh
psql postgresql://postgres:<password>@db-aden.cfkaw4w629sl.us-east-1.rds.amazonaws.com:5432
```

## Create database
```sql
-- Create database
CREATE DATABASE db_aden;
```

## Create Schema
```sh
psql db_aden <../db-files/schema.sql -h db-aden.cfkaw4w629sl.us-east-1.rds.amazonaws.com -U postgres
```

## Insert fake data
```sh
psql db_aden <../db-files/data.sql -h db-aden.cfkaw4w629sl.us-east-1.rds.amazonaws.com -U postgres
```

## Create mv from tables
```sh
psql db_aden <../db-files/mv.sql -h db-aden.cfkaw4w629sl.us-east-1.rds.amazonaws.com -U postgres
```

## Create bi user and grant access
```sh
psql db_aden <../db-files/bi_user.sql -h db-aden.cfkaw4w629sl.us-east-1.rds.amazonaws.com -U postgres
```

## Check parameter group config
```sql
-- Check cron.database_name
\connect db_aden
select name, setting from pg_settings where name like 'cron.%';
```

## Schedule materialized view refresh using cron job
```sh
psql db_aden <cron_job.sql -h db-aden.cfkaw4w629sl.us-east-1.rds.amazonaws.com -U postgres
```

## Check cron jobs
```sql
-- Check cron jobs
\connect db_aden
select * from cron.job;
```
## Activate/desactivate cron job
```sql
-- Delete cron job
\connect db_aden
update cron.job set active = <false/true> where jobid = <jobid>;
```

## Delete cron job
```sql
-- Delete cron job
\connect db_aden
SELECT cron.unschedule(<jobid>);
```