-- Cantidad total de ventas completadas
SELECT COUNT(*) AS total_sales
FROM SALE_ORDER
WHERE status = 'completado';

-- Productos con mayor demanda
SELECT P.name AS product_name, COUNT(I.product_id) AS quantity_sold
FROM INVOICE I
JOIN PRODUCT P ON I.product_id = P.product_id
JOIN SALE_ORDER S ON I.order_id = S.order_id
WHERE S.status = 'completado'
GROUP BY P.name
ORDER BY quantity_sold DESC;

-- Ingresos totales facturado
SELECT SUM(total_amount) AS total_invoiced
FROM INVOICE;

-- Montos agrupados por estado de pago
SELECT status_payment, SUM(amount) AS total_paid
FROM PAYMENT
GROUP BY status_payment;

-- Monto total ventas vs monto total dinero ingresado por pagos 
SELECT 
    (SELECT SUM(total_amount) 
     FROM SALE_ORDER 
     WHERE status = 'completado') AS total_sales_amount,
    (SELECT SUM(amount) 
     FROM PAYMENT 
     WHERE status_payment = 'pagado') AS total_paid_amount;

-- Usuarios con mayor cantidad de ventas
SELECT 
    U.user_id,
    U.name AS user_name,
    COUNT(SO.order_id) AS total_sales
FROM 
    SALE_ORDER SO
JOIN 
    USERS U ON SO.user_id = U.user_id
GROUP BY 
    U.user_id, U.name
ORDER BY 
    total_sales DESC;

-- Desglose detallado facturas
SELECT 
    SO.order_id,
    SO.order_date,
    SO.status AS order_status,
    SO.total_amount AS order_total,
    C.name AS customer_name,
    U.name AS user_name,
    I.invoice_id,
    I.invoice_date,
    I.total_amount AS invoice_total,
    I.due_date,
    I.status_invoice AS invoice_status,
    P.name AS product_name,
    P.price AS product_price
FROM 
    SALE_ORDER SO
JOIN 
    CUSTOMER C ON SO.customer_id = C.customer_id
JOIN 
    USERS U ON SO.user_id = U.user_id
JOIN 
    INVOICE I ON SO.order_id = I.order_id
JOIN 
    PRODUCT P ON I.product_id = P.product_id
ORDER BY 
    SO.order_date DESC, I.invoice_date DESC;