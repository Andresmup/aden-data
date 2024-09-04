TRUNCATE PAYMENT CASCADE;

\copy CATEGORY (name, description) FROM '../fake-data/df_category.csv' DELIMITER ',' CSV HEADER;

\copy PRODUCT (name, price, category_id) FROM '../fake-data/df_product.csv' DELIMITER ',' CSV HEADER;

\copy CUSTOMER (name, phone, address, country) FROM '../fake-data/df_customer.csv' DELIMITER ',' CSV HEADER;

\copy USERS (name, email, role) FROM '../fake-data/df_users.csv' DELIMITER ',' CSV HEADER;

\copy SALE_ORDER (order_date, status, total_amount, customer_id, user_id) FROM '../fake-data/df_sales_order.csv' DELIMITER ',' CSV HEADER;

\copy INVOICE (invoice_date, total_amount, due_date, status_invoice, order_id, product_id) FROM '../fake-data/df_invoice.csv' DELIMITER ',' CSV HEADER;

\copy PAYMENT (payment_date, amount, method, status_payment, payment_installment, invoice_id) FROM '../fake-data/df_payment.csv' DELIMITER ',' CSV HEADER;