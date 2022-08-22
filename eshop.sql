-- Table: public.cart

-- DROP TABLE IF EXISTS public.cart;

CREATE TABLE IF NOT EXISTS public.cart
(
    user_id bigint NOT NULL,
    CONSTRAINT cart_pkey1 PRIMARY KEY (user_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cart
    OWNER to postgres;
	
----------------------------------------------------

-- Table: public.discount

-- DROP TABLE IF EXISTS public.discount;

CREATE TABLE IF NOT EXISTS public.discount
(
    id character varying COLLATE pg_catalog."default" NOT NULL,
    status bigint,
    CONSTRAINT discount_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.discount
    OWNER to postgres;
	
------------------------------------------------------

-- Table: public.order_main

-- DROP TABLE IF EXISTS public.order_main;

CREATE TABLE IF NOT EXISTS public.order_main
(
    order_id bigint NOT NULL,
    buyer_address character varying(255) COLLATE pg_catalog."default",
    buyer_email character varying(255) COLLATE pg_catalog."default",
    buyer_name character varying(255) COLLATE pg_catalog."default",
    buyer_phone character varying(255) COLLATE pg_catalog."default",
    create_time timestamp without time zone,
    order_amount numeric(19,2) NOT NULL,
    order_status integer NOT NULL DEFAULT 0,
    update_time timestamp without time zone,
    CONSTRAINT order_main_pkey PRIMARY KEY (order_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.order_main
    OWNER to postgres;
	
------------------------------------------------------

-- Table: public.product_category

-- DROP TABLE IF EXISTS public.product_category;

CREATE TABLE IF NOT EXISTS public.product_category
(
    category_id integer NOT NULL,
    category_name character varying(255) COLLATE pg_catalog."default",
    category_type integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    CONSTRAINT product_category_pkey PRIMARY KEY (category_id),
    CONSTRAINT uk_6kq6iveuim6wd90cxo5bksumw UNIQUE (category_type)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product_category
    OWNER to postgres;
	
--------------------------------------------------------

-- Table: public.product_in_order

-- DROP TABLE IF EXISTS public.product_in_order;

CREATE TABLE IF NOT EXISTS public.product_in_order
(
    id bigint NOT NULL,
    category_type integer NOT NULL,
    count integer,
    product_description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    product_icon character varying(255) COLLATE pg_catalog."default",
    product_id character varying(255) COLLATE pg_catalog."default",
    product_name character varying(255) COLLATE pg_catalog."default",
    product_price numeric(19,2) NOT NULL,
    product_stock integer,
    cart_user_id bigint,
    order_id bigint,
    CONSTRAINT product_in_order_pkey PRIMARY KEY (id),
    CONSTRAINT fkt0sfj3ffasrift1c4lv3ra85e FOREIGN KEY (order_id)
        REFERENCES public.order_main (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_cart_fkey FOREIGN KEY (cart_user_id)
        REFERENCES public.cart (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT product_in_order_count_check CHECK (count >= 1),
    CONSTRAINT product_in_order_product_stock_check CHECK (product_stock >= 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product_in_order
    OWNER to postgres;
	
------------------------------------------------------------

-- Table: public.product_info

-- DROP TABLE IF EXISTS public.product_info;

CREATE TABLE IF NOT EXISTS public.product_info
(
    product_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    category_type integer DEFAULT 0,
    create_time timestamp without time zone,
    product_description character varying(255) COLLATE pg_catalog."default",
    product_icon character varying(255) COLLATE pg_catalog."default",
    product_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    product_price numeric(19,2) NOT NULL,
    product_status integer DEFAULT 0,
    product_stock integer NOT NULL,
    update_time timestamp without time zone,
    CONSTRAINT product_info_pkey PRIMARY KEY (product_id),
    CONSTRAINT product_info_product_stock_check CHECK (product_stock >= 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product_info
    OWNER to postgres;
	
-----------------------------------------------------------------

-- Table: public.tokens



ALTER TABLE IF EXISTS public.tokens
    OWNER to postgres;
	
--------------------------------------------------------------------------

-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id bigint NOT NULL,
    active boolean NOT NULL,
    address character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    name character varying(255) COLLATE pg_catalog."default",
    password character varying(255) COLLATE pg_catalog."default",
    phone character varying(255) COLLATE pg_catalog."default",
    role character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT uk_sx468g52bpetvlad2j9y0lptc UNIQUE (email)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;
	
---------------------------------------------------------------------------

-- Table: public.wishlist

-- DROP TABLE IF EXISTS public.wishlist;

CREATE TABLE IF NOT EXISTS public.wishlist
(
    id bigint NOT NULL,
    created_date timestamp without time zone,
    user_id bigint,
    product_id character varying COLLATE pg_catalog."default",
    CONSTRAINT wishlist_pkey PRIMARY KEY (id),
    CONSTRAINT product_wish_fkey FOREIGN KEY (product_id)
        REFERENCES public.product_info (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "user_wish_Fkey" FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.wishlist
    OWNER to postgres;
	
---------------------------------------------------------------------------------------------------






--Product_Info


INSERT INTO "public"."product_category" VALUES (987456321, 'Home', 0, '2022-08-14 23:03:26', '2022-08-16 00:03:26');
INSERT INTO "public"."product_category" VALUES (987456322, 'Furnishings', 1, '2022-08-14 23:03:26', '2022-08-16 00:03:26');
INSERT INTO "public"."product_category" VALUES (987456323, 'Wall Accents', 2, '2022-08-14 23:03:26', '2022-08-16 00:03:26');
INSERT INTO "public"."product_category" VALUES (987456324, 'Decor', 3, '2022-08-14 23:03:26', '2022-08-16 00:03:26');


--Product


INSERT INTO "public"."product_info" VALUES ('HM001', 0, '2022-08-14 23:03:26', 'Plant stand, light brown stained', 'https://www.ikea.com/in/en/images/products/askholmen-plant-stand-light-brown-stained__0237654_pe376921_s5.jpg?f=xl', 'PLANT STAND', 2340.00, 0, 60, '2022-08-20 00:03:26');
INSERT INTO "public"."product_info" VALUES ('HM002', 0, '2022-08-14 23:03:26', 'Tealight holder, 10 cm (4 ")', 'https://www.ikea.com/in/en/images/products/paerlband-tealight-holder__0985134_pe816514_s5.jpg?f=xl', 'TEALIGHT HOLDER', 499.00, 0, 60, '2022-08-20 00:03:26');
INSERT INTO "public"."product_info" VALUES ('HM003', 0, '2022-08-14 23:03:26', 'Shelving unit, black-brown/glass, 51x175 cm (20 1/8x68 7/8 ")
', 'https://www.ikea.com/in/en/images/products/vittsjoe-shelving-unit-black-brown-glass__0644374_pe702640_s5.jpg?f=xl', 'SHELVING UNIT', 3990.00, 0, 60, '2022-08-20 00:03:26');

INSERT INTO "public"."product_info" VALUES ('FR001', 1, '2022-08-14 23:03:26', 'Wall clock, grey-pink, 25 cm (9 ¾ ")', 'https://www.ikea.com/in/en/images/products/bondtolvan-wall-clock-grey-pink__1038511_pe839710_s5.jpg?f=xl
', 'CLOCK', 999.00, 0, 60, '2022-08-20 00:03:26');
INSERT INTO "public"."product_info" VALUES ('FR002', 1, '2022-08-14 23:03:26','2 seat sofa, Knisa medium blue', 'https://www.ikea.com/in/en/images/products/glostad-2-seat-sofa-knisa-medium-blue__0950900_pe800740_s5.jpg?f=xl', '2 SEAT SOFA', 8990.00, 0, 60, '2022-08-20 00:03:26');
INSERT INTO "public"."product_info" VALUES ('FR003', 1, '2022-08-14 23:03:26', 'Coffee table, black-brown/glass, 75 cm (29 1/2 ")', 'https://www.ikea.com/in/en/images/products/vittsjoe-coffee-table-black-brown-glass__0135348_pe292039_s5.jpg?f=xl
', 'COFFEE TABLE', 3990.00, 0, 60, '2022-08-20 00:03:26');


INSERT INTO "public"."product_info" VALUES ('WC001', 2, '2022-08-14 23:03:26', 'Frame with poster, set of 8, little things', 'https://www.ikea.com/in/en/images/products/knoppaeng-frame-with-poster-set-of-8-little-things__0995551_pe821746_s5.jpg?f=xl', 'FRAME WITH POSTER', 3490.00, 0, 60, '2022-08-20 00:03:26');
INSERT INTO "public"."product_info" VALUES ('WC002', 2, '2022-08-14 23:03:26', ' Hanging tapestry, birds in tree, 30x40 cm (11 ¾x15 ¾ ")', 'https://www.ikea.com/in/en/images/products/palhult-hanging-tapestry-birds-in-tree__1110577_pe870522_s5.jpg?f=xl', 'HANGING TAPESTRY', 1290.00, 0, 60, '2022-08-20 00:03:26');
INSERT INTO "public"."product_info" VALUES ('WC003', 2, '2022-08-14 23:03:26', ' Mirror, sedge, 63 cm (24 ¾ ")', 'https://www.ikea.com/in/en/images/products/vrigstad-mirror-sedge__1113889_pe871579_s5.jpg?f=xl' 'WALL MIRROR', 2990.00, 0, 60, '2022-08-20 00:03:26');




INSERT INTO "public"."product_info" VALUES ('DR001', 3, '2022-08-14 23:03:26', 'Tealight holder, gold-colour, 9 cm (3 ").Decor', 'https://www.ikea.com/in/en/images/products/aromatisk-tealight-holder-gold-colour__1063167_pe851267_s5.jpg?f=xl', 'AROMATISK', 299.00, 0, 60, '2022-08-20 00:03:26');
INSERT INTO "public"."product_info" VALUES ('DR002', 3, '2022-08-14 23:03:26', 'Decoration, butterfly, 17 cm (6 ¾ ")', 'https://www.ikea.com/in/en/images/products/sjaelfull-decoration-butterfly__1030742_pe836345_s5.jpg?f=xl
', 'BUTTERFLY DECOR', 399.00, 0, 60, '2022-08-20 00:03:26');
INSERT INTO "public"."product_info" VALUES ('DR003', 3, '2022-08-14 23:03:26', 'Artifi potted plant w pot, set of 3, in/outdoor herbs, 5 cm (2 ")', 'https://www.ikea.com/in/en/images/products/fejka-artifi-potted-plant-w-pot-set-of-3-in-outdoor-herbs__1034044_pe840155_s5.jpg?f=xl', 'ARTIFICIAL PLANT',199.00, 0, 60, '2022-08-20 00:03:26');




------------------------------------------------------------------------------------------------------------------------

--Users

INSERT INTO "public"."users" VALUES (2147483645, true, 'Plot 1, panjagutta, Hyderabad', 'bhargavi@eshop.com', 'Bhargavi', '$2a$10$LiBwO43TpKU0sZgCxNkWJueq2lqxoUBsX2Wclzk8JQ3Ejb9MWu2Xy', '1234567890', 'ROLE_MANAGER');




CREATE SEQUENCE IF NOT EXISTS public.hibernate_sequence
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.hibernate_sequence
    OWNER TO postgres;