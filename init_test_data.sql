-- ===============================
--  AUTH DB (auth_db1)
-- ===============================
\c auth_db1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO users (id, name, email, password, role)
VALUES 
    ('11111111-1111-1111-1111-111111111111', 'Ravi Kumar', 'ravi.kumar@example.com', 'hashed_password1', 'customer'),
    ('22222222-2222-2222-2222-222222222222', 'Priya Sharma', 'priya.sharma@example.com', 'hashed_password2', 'admin');

-- ===============================
--  PRODUCT DB (product_db1)
-- ===============================
\c product_db1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO spare_parts (id, name, description, price, stock_quantity)
VALUES 
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Bike Chain', 'Durable bike chain suitable for multiple models', 1500.00, 50),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Brake Pad', 'High performance brake pads', 800.00, 30);

-- ===============================
--  ORDER DB (order_db1)
-- ===============================
\c order_db1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO orders (id, user_id, product_id, quantity, total_price, status)
VALUES
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 2, 3000.00, 'pending'),
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 1, 800.00, 'shipped');

-- ===============================
--  INVENTORY DB (inventory_db1)
-- ===============================
\c inventory_db1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO inventory (id, product_id, quantity_available)
VALUES
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 48),
    ('ffffffff-ffff-ffff-ffff-ffffffffffff', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 29);

-- ===============================
--  INVOICE DB (invoice_db1)
-- ===============================
\c invoice_db1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO invoices (id, order_id, amount, status)
VALUES
    ('99999999-9999-9999-9999-999999999999', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 3000.00, 'unpaid'),
    ('88888888-8888-8888-8888-888888888888', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 800.00, 'paid');
