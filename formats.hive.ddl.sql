USE instacart;

CREATE EXTERNAL TABLE products_parquet (
  product_id    INT,
  product_name  STRING,
  aisle_id      INT,
  department_id INT
)
STORED AS PARQUET
LOCATION '/user/cloudera/instacart/products_parquet/'
;

CREATE EXTERNAL TABLE products_avro (
  product_id    INT,
  product_name  STRING,
  aisle_id      INT,
  department_id INT
)
STORED AS AVRO
LOCATION '/user/cloudera/instacart/products_avro/'
;

CREATE EXTERNAL TABLE orders_parquet (
  order_id               INT    ,
  user_id                INT    ,
  eval_set               STRING ,
  order_number           INT    ,
  order_dow              TINYINT,
  order_hour_of_day      TINYINT,
  days_since_prior_order DOUBLE
)
STORED AS PARQUET
LOCATION '/user/cloudera/instacart/orders_parquet/'
;

CREATE EXTERNAL TABLE orders_avro (
  order_id               INT    ,
  user_id                INT    ,
  eval_set               STRING ,
  order_number           INT    ,
  order_dow              TINYINT,
  order_hour_of_day      TINYINT,
  days_since_prior_order DOUBLE
)
STORED AS AVRO
LOCATION '/user/cloudera/instacart/orders_avro/'
;

CREATE EXTERNAL TABLE order_products__prior_parquet (
  order_id          INT,
  product_id        INT,
  add_to_cart_order INT,
  reordered         TINYINT
)
STORED AS PARQUET
LOCATION '/user/cloudera/instacart/order_products__prior_parquet/'
;

CREATE EXTERNAL TABLE order_products__prior_avro (
  order_id          INT,
  product_id        INT,
  add_to_cart_order INT,
  reordered         TINYINT
)
STORED AS AVRO
LOCATION '/user/cloudera/instacart/order_products__prior_avro/'
;