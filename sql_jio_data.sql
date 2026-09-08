USE jio;
CREATE TABLE jio_subscribes (
    subscriber_id TEXT,
    customer_name TEXT,
    mobile_number TEXT,
    mobile_no TEXT,
    alternate_contact TEXT,
    email_id TEXT,
    gender TEXT,
    date_of_birth TEXT,
    age TEXT,
    city TEXT,
    city_2 TEXT,
    state TEXT,
    telecom_circle TEXT,
    circle_code TEXT,
    pincode TEXT,
    plan_name TEXT,
    plan_type TEXT,
    plan_price_inr TEXT,
    recharge_amount TEXT,
    last_recharge_date TEXT,
    activation_date TEXT,
    recharge_channel TEXT,
    validity_days TEXT,
    data_used_gb TEXT,
    data_quota_gb TEXT,
    voice_minutes_used TEXT,
    sms_sent TEXT,
    network_type TEXT,
    device_model TEXT,
    is_jiofiber TEXT,
    monthly_arpu TEXT,
    outstanding_dues TEXT,
    kyc_status TEXT,
    customer_segment TEXT,
    complaint_type TEXT,
    complaints_last_90d TEXT,
    nps_score TEXT,
    churn_flag TEXT,
    last_updated_ts TEXT,
    remarks TEXT
);
select * from jio_subscribes;
SELECT 
    customer_name,
    LEFT(customer_name, 3) AS name_prefix
FROM jio_subscribes;

SELECT 
    department,
    LEFT(TRIM(department), 5) AS department_prefix
FROM jio_subscribes;

SELECT 
    mobile_number,
    RIGHT(mobile_number, 4) AS phone_last_four
FROM jio_subscribes;
SELECT 
    city,
    UPPER(LEFT(TRIM(city), 2)) AS city_code
FROM jio_subscribes;
SELECT 
    status,
    SUBSTRING(status, 2, 3) AS status_extract
FROM employees;

SELECT 
    customer_name,
    SUBSTRING_INDEX(TRIM(customer_name), ' ', 1) AS first_name
FROM jio_subscribes;

SELECT 
    customer_name,
    SUBSTRING(TRIM(customer_name), INSTR(TRIM(customer_name), ' ') + 1) AS last_name
FROM jio_subscribes;

SELECT 
    customer_name,
    SUBSTRING(TRIM(customer_name), 1, INSTR(TRIM(customer_name), ' ') - 1) AS first_name
FROM jio_subscribes
WHERE INSTR(TRIM(customer_name), ' ') > 0;

SELECT 
    customer_name,
    SUBSTRING(
        TRIM(customer_name),
        INSTR(TRIM(customer_name), ' ') + 1
    ) AS last_name
FROM jio_subscribes
WHERE INSTR(TRIM(customer_name), ' ') > 0;
SELECT 
    email_id,
    SUBSTRING_INDEX(email_id, '@', 1) AS email_username
FROM jio_subscribes
WHERE INSTR(email_id, '@') > 0;
SELECT
    email_id,
    LOWER(SUBSTRING_INDEX(email_id, '@', -1)) AS email_domain
FROM jio_subscribes
WHERE INSTR(email_id, '@') > 0;
SELECT
    email_id,
    SUBSTRING_INDEX(email_id, '.', -1) AS top_level_domain
FROM jio_subscribes
WHERE INSTR(email_id, '.') > 0;
SELECT
    mobile_number,
    SUBSTRING(mobile_number, 5, 10) AS local_phone_number
FROM jio_subscribes
WHERE mobile_number LIKE '+91-%';

SELECT
    mobile_number,
    RIGHT(
        REPLACE(REPLACE(mobile_number, ' ', ''), '-', ''),
        10
    ) AS normalized_local_phone
FROM jio_subscribes;

SELECT
    activation_date,
    SUBSTRING(activation_date, 1, 4) AS year,
    SUBSTRING(activation_date, 6, 2) AS month,
    SUBSTRING(activation_date, 9, 2) AS day
FROM jio_subscribes;

SELECT
    activation_date,
    SUBSTRING(activation_date, 1, INSTR(activation_date, '/') - 1) AS day,
    SUBSTRING(
        activation_date,
        INSTR(activation_date, '/') + 1,
        INSTR(SUBSTRING(activation_date, INSTR(activation_date, '/') + 1), '/') - 1
    ) AS month,
    RIGHT(activation_date, 4) AS year
FROM jio_subscribes
WHERE INSTR(activation_date, '/') > 0;

SELECT
    activation_date,
    SUBSTRING_INDEX(TRIM(activation_date), ' ', 1) AS date_token
FROM jio_subscribes
WHERE TRIM(activation_date) <> '';

SELECT
    subscriber_id,
    customer_name,
    city,
    CONCAT(
        LEFT(TRIM(customer_name), 3),
        RIGHT(subscriber_id, 2),
        LEFT(TRIM(city), 2)
    ) AS employee_code
FROM jio_subscribes;

SELECT
    SUBSTRING_INDEX(TRIM(customer_name), ' ', 1) AS first_name,

    SUBSTRING(
        TRIM(customer_name),
        INSTR(TRIM(customer_name), ' ') + 1
    ) AS last_name,

    SUBSTRING_INDEX(email_id, '@', 1) AS email_username,

    LOWER(SUBSTRING_INDEX(email_id, '@', -1)) AS email_domain,

    RIGHT(mobile_number, 4) AS phone_last_four

FROM jio_subscribes
WHERE INSTR(TRIM(customer_name), ' ') > 0
  AND INSTR(email_id, '@') > 0;