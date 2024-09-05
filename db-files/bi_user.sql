CREATE ROLE bi_user LOGIN PASSWORD 'mypassword';

\connect db_aden

GRANT SELECT ON mv_category TO bi_user;

GRANT SELECT ON mv_product TO bi_user;

GRANT SELECT ON mv_customer TO bi_user;

GRANT SELECT ON mv_users TO bi_user;

GRANT SELECT ON mv_sale_order TO bi_user;

GRANT SELECT ON mv_invoice TO bi_user;

GRANT SELECT ON mv_payment TO bi_user;