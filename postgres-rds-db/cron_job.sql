CREATE EXTENSION pg_cron;

SELECT cron.schedule('0 0 * * *', 'refresh materialized view mv_category;');

SELECT cron.schedule('1 0 * * *', 'refresh materialized view mv_product;');

SELECT cron.schedule('2 0 * * *', 'refresh materialized view mv_customer;');

SELECT cron.schedule('3 0 * * *', 'refresh materialized view mv_users;');

SELECT cron.schedule('4 0 * * *', 'refresh materialized view mv_sale_order;');

SELECT cron.schedule('5 0 * * *', 'refresh materialized view mv_invoice;');

SELECT cron.schedule('6 0 * * *', 'refresh materialized view mv_payment;');