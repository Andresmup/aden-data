DROP TABLE IF EXISTS PAYMENT; 
DROP TABLE IF EXISTS INVOICE; 
DROP TABLE IF EXISTS SALE_ORDER; 
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS CATEGORY; 
DROP TABLE IF EXISTS CUSTOMER; 
DROP TABLE IF EXISTS USERS; 


CREATE TABLE CATEGORY (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE PRODUCT (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
);

CREATE TABLE CUSTOMER (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    country VARCHAR(100)
);

CREATE TABLE USERS (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(100) NOT NULL
);

CREATE TABLE SALE_ORDER (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('completado', 'pendiente', 'cancelado')),
    total_amount DECIMAL(10, 2) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id)
);

CREATE TABLE INVOICE (
    invoice_id SERIAL PRIMARY KEY,
    invoice_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    due_date DATE,
    status_invoice VARCHAR(50) NOT NULL CHECK (status_invoice IN ('pagado', 'pendiente', 'expirado')),
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES SALE_ORDER(order_id),
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

CREATE TABLE PAYMENT (
    payment_id SERIAL PRIMARY KEY,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    method VARCHAR(50) NOT NULL,
    status_payment VARCHAR(50) NOT NULL CHECK (status_payment IN ('pagado', 'pendiente', 'fallido')),
    payment_installment INT,
    invoice_id INT,
    FOREIGN KEY (invoice_id) REFERENCES INVOICE(invoice_id)
);