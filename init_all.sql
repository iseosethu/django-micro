-- =========================================
-- STEP 1: CREATE DATABASES
-- =========================================
DROP DATABASE IF EXISTS auth_db1;
DROP DATABASE IF EXISTS product_db1;
DROP DATABASE IF EXISTS order_db1;
DROP DATABASE IF EXISTS inventory_db1;
DROP DATABASE IF EXISTS invoice_db1;

CREATE DATABASE auth_db1;
CREATE DATABASE product_db1;
CREATE DATABASE order_db1;
CREATE DATABASE inventory_db1;
CREATE DATABASE invoice_db1;

-- =========================================
-- STEP 2: CREATE TABLES + INSERT DATA
-- =========================================

-- 2.1 AUTH_DB1
\c auth_db1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(150) NOT NULL
);

INSERT INTO users (id, name, email, password)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice Johnson', 'alice.johnson@test.com', 'securePass1'),
('22222222-2222-2222-2222-222222222222', 'Bob Smith', 'bob.smith@test.com', 'securePass2');

-- 2.2 PRODUCT_DB1
\c product_db1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE spare_parts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL
);

INSERT INTO spare_parts (id, name, description, price)
VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Brake Pad', 'High-quality brake pad for motorcycles', 1500.00),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Engine Oil', 'Synthetic engine oil 1L', 800.00);

-- 2.3 ORDER_DB1
\c order_db1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    product_id UUID NOT NULL,
    quantity INT NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending'
);

INSERT INTO orders (id, user_id, product_id, quantity, status)
VALUES
('c1111111-1111-1111-1111-111111111111', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 2, 'Pending'),
('c2222222-2222-2222-2222-222222222222', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 1, 'Shipped');

-- 2.4 INVENTORY_DB1
\c inventory_db1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE inventory (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    product_id UUID NOT NULL,
    stock INT NOT NULL
);

INSERT INTO inventory (id, product_id, stock)
VALUES
('d1111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 50),
('d2222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 30);

-- 2.5 INVOICE_DB1
\c invoice_db1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE invoices (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    order_id UUID NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'Unpaid'
);

INSERT INTO invoices (id, order_id, amount, status)
VALUES
('e1111111-1111-1111-1111-111111111111', 'c1111111-1111-1111-1111-111111111111', 3000.00, 'Unpaid'),
('e2222222-2222-2222-2222-222222222222', 'c2222222-2222-2222-2222-222222222222', 800.00, 'Paid');