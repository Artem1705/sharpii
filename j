--
-- Создание таблиц и связей (без данных)
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';
SET default_table_access_method = heap;

-- Таблица groups
CREATE TABLE public.groups (
    group_id integer NOT NULL,
    group_name character varying(100) NOT NULL
);
ALTER TABLE public.groups OWNER TO postgres;

-- Таблица suppliers
CREATE TABLE public.suppliers (
    supplier_id integer NOT NULL,
    supplier_name character varying(150) NOT NULL,
    phone character varying(30)
);
ALTER TABLE public.suppliers OWNER TO postgres;

-- Таблица products
CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(150) NOT NULL,
    group_id integer,
    unit character varying(20),
    price numeric(10,2)
);
ALTER TABLE public.products OWNER TO postgres;

-- Таблица incoming_invoice
CREATE TABLE public.incoming_invoice (
    invoice_id integer NOT NULL,
    supplier_id integer,
    invoice_date date NOT NULL,
    total_sum numeric(10,2)
);
ALTER TABLE public.incoming_invoice OWNER TO postgres;

-- Таблица incoming_items
CREATE TABLE public.incoming_items (
    item_id integer NOT NULL,
    invoice_id integer,
    product_id integer,
    quantity integer,
    price numeric(10,2)
);
ALTER TABLE public.incoming_items OWNER TO postgres;

-- Таблица outgoing_invoice
CREATE TABLE public.outgoing_invoice (
    out_invoice_id integer NOT NULL,
    invoice_date date NOT NULL
);
ALTER TABLE public.outgoing_invoice OWNER TO postgres;

-- Таблица outgoing_items
CREATE TABLE public.outgoing_items (
    out_item_id integer NOT NULL,
    out_invoice_id integer,
    product_id integer,
    quantity integer,
    price numeric(10,2)
);
ALTER TABLE public.outgoing_items OWNER TO postgres;

-- Таблица payments
CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    invoice_id integer,
    payment_date date,
    amount numeric(10,2)
);
ALTER TABLE public.payments OWNER TO postgres;

-- Последовательности и привязка к столбцам
CREATE SEQUENCE public.groups_group_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.groups_group_id_seq OWNER TO postgres;
ALTER SEQUENCE public.groups_group_id_seq OWNED BY public.groups.group_id;
ALTER TABLE ONLY public.groups ALTER COLUMN group_id SET DEFAULT nextval('public.groups_group_id_seq'::regclass);

CREATE SEQUENCE public.suppliers_supplier_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.suppliers_supplier_id_seq OWNER TO postgres;
ALTER SEQUENCE public.suppliers_supplier_id_seq OWNED BY public.suppliers.supplier_id;
ALTER TABLE ONLY public.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('public.suppliers_supplier_id_seq'::regclass);

CREATE SEQUENCE public.products_product_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;
ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);

CREATE SEQUENCE public.incoming_invoice_invoice_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.incoming_invoice_invoice_id_seq OWNER TO postgres;
ALTER SEQUENCE public.incoming_invoice_invoice_id_seq OWNED BY public.incoming_invoice.invoice_id;
ALTER TABLE ONLY public.incoming_invoice ALTER COLUMN invoice_id SET DEFAULT nextval('public.incoming_invoice_invoice_id_seq'::regclass);

CREATE SEQUENCE public.incoming_items_item_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.incoming_items_item_id_seq OWNER TO postgres;
ALTER SEQUENCE public.incoming_items_item_id_seq OWNED BY public.incoming_items.item_id;
ALTER TABLE ONLY public.incoming_items ALTER COLUMN item_id SET DEFAULT nextval('public.incoming_items_item_id_seq'::regclass);

CREATE SEQUENCE public.outgoing_invoice_out_invoice_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.outgoing_invoice_out_invoice_id_seq OWNER TO postgres;
ALTER SEQUENCE public.outgoing_invoice_out_invoice_id_seq OWNED BY public.outgoing_invoice.out_invoice_id;
ALTER TABLE ONLY public.outgoing_invoice ALTER COLUMN out_invoice_id SET DEFAULT nextval('public.outgoing_invoice_out_invoice_id_seq'::regclass);

CREATE SEQUENCE public.outgoing_items_out_item_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.outgoing_items_out_item_id_seq OWNER TO postgres;
ALTER SEQUENCE public.outgoing_items_out_item_id_seq OWNED BY public.outgoing_items.out_item_id;
ALTER TABLE ONLY public.outgoing_items ALTER COLUMN out_item_id SET DEFAULT nextval('public.outgoing_items_out_item_id_seq'::regclass);

CREATE SEQUENCE public.payments_payment_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.payments_payment_id_seq OWNER TO postgres;
ALTER SEQUENCE public.payments_payment_id_seq OWNED BY public.payments.payment_id;
ALTER TABLE ONLY public.payments ALTER COLUMN payment_id SET DEFAULT nextval('public.payments_payment_id_seq'::regclass);

-- Первичные ключи
ALTER TABLE ONLY public.groups ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);
ALTER TABLE ONLY public.suppliers ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);
ALTER TABLE ONLY public.products ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
ALTER TABLE ONLY public.incoming_invoice ADD CONSTRAINT incoming_invoice_pkey PRIMARY KEY (invoice_id);
ALTER TABLE ONLY public.incoming_items ADD CONSTRAINT incoming_items_pkey PRIMARY KEY (item_id);
ALTER TABLE ONLY public.outgoing_invoice ADD CONSTRAINT outgoing_invoice_pkey PRIMARY KEY (out_invoice_id);
ALTER TABLE ONLY public.outgoing_items ADD CONSTRAINT outgoing_items_pkey PRIMARY KEY (out_item_id);
ALTER TABLE ONLY public.payments ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);

-- Внешние ключи
ALTER TABLE ONLY public.incoming_invoice
    ADD CONSTRAINT incoming_invoice_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);

ALTER TABLE ONLY public.incoming_items
    ADD CONSTRAINT incoming_items_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.incoming_invoice(invoice_id);

ALTER TABLE ONLY public.incoming_items
    ADD CONSTRAINT incoming_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);

ALTER TABLE ONLY public.outgoing_items
    ADD CONSTRAINT outgoing_items_out_invoice_id_fkey FOREIGN KEY (out_invoice_id) REFERENCES public.outgoing_invoice(out_invoice_id);

ALTER TABLE ONLY public.outgoing_items
    ADD CONSTRAINT outgoing_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.incoming_invoice(invoice_id);

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(group_id);
