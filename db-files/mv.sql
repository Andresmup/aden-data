CREATE MATERIALIZED VIEW mv_category AS
SELECT * FROM category;

CREATE MATERIALIZED VIEW mv_product AS
SELECT * FROM product;

CREATE MATERIALIZED VIEW mv_customer AS
SELECT * FROM customer;

CREATE MATERIALIZED VIEW mv_users AS
SELECT * FROM users;

CREATE MATERIALIZED VIEW mv_sale_order AS
SELECT * FROM sale_order;

CREATE MATERIALIZED VIEW mv_invoice AS
SELECT * FROM invoice;

CREATE MATERIALIZED VIEW mv_payment AS
SELECT * FROM payment;