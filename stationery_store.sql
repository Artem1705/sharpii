--
-- PostgreSQL database dump
--

\restrict zeYZQpokcbVy9pr34mVNdVvfcYuR2SOceqGGFzbb1Gc8LDAvTyZtxmeQpIVKUPJ

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-28 03:03:02

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

--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    group_id integer NOT NULL,
    group_name character varying(100) NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_group_id_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 219
-- Name: groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_group_id_seq OWNED BY public.groups.group_id;


--
-- TOC entry 226 (class 1259 OID 16422)
-- Name: incoming_invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incoming_invoice (
    invoice_id integer NOT NULL,
    supplier_id integer,
    invoice_date date NOT NULL,
    total_sum numeric(10,2)
);


ALTER TABLE public.incoming_invoice OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16421)
-- Name: incoming_invoice_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incoming_invoice_invoice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incoming_invoice_invoice_id_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 225
-- Name: incoming_invoice_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incoming_invoice_invoice_id_seq OWNED BY public.incoming_invoice.invoice_id;


--
-- TOC entry 228 (class 1259 OID 16436)
-- Name: incoming_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incoming_items (
    item_id integer NOT NULL,
    invoice_id integer,
    product_id integer,
    quantity integer,
    price numeric(10,2)
);


ALTER TABLE public.incoming_items OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16435)
-- Name: incoming_items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incoming_items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incoming_items_item_id_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 227
-- Name: incoming_items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incoming_items_item_id_seq OWNED BY public.incoming_items.item_id;


--
-- TOC entry 230 (class 1259 OID 16454)
-- Name: outgoing_invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outgoing_invoice (
    out_invoice_id integer NOT NULL,
    invoice_date date NOT NULL
);


ALTER TABLE public.outgoing_invoice OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16453)
-- Name: outgoing_invoice_out_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.outgoing_invoice_out_invoice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.outgoing_invoice_out_invoice_id_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 229
-- Name: outgoing_invoice_out_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.outgoing_invoice_out_invoice_id_seq OWNED BY public.outgoing_invoice.out_invoice_id;


--
-- TOC entry 232 (class 1259 OID 16463)
-- Name: outgoing_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outgoing_items (
    out_item_id integer NOT NULL,
    out_invoice_id integer,
    product_id integer,
    quantity integer,
    price numeric(10,2)
);


ALTER TABLE public.outgoing_items OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16462)
-- Name: outgoing_items_out_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.outgoing_items_out_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.outgoing_items_out_item_id_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 231
-- Name: outgoing_items_out_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.outgoing_items_out_item_id_seq OWNED BY public.outgoing_items.out_item_id;


--
-- TOC entry 234 (class 1259 OID 16481)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    invoice_id integer,
    payment_date date,
    amount numeric(10,2)
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16480)
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_payment_id_seq OWNER TO postgres;

--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 233
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_payment_id_seq OWNED BY public.payments.payment_id;


--
-- TOC entry 222 (class 1259 OID 16399)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(150) NOT NULL,
    group_id integer,
    unit character varying(20),
    price numeric(10,2)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16398)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 224 (class 1259 OID 16413)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplier_id integer NOT NULL,
    supplier_name character varying(150) NOT NULL,
    phone character varying(30)
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16412)
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suppliers_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 223
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_supplier_id_seq OWNED BY public.suppliers.supplier_id;


--
-- TOC entry 4790 (class 2604 OID 16393)
-- Name: groups group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN group_id SET DEFAULT nextval('public.groups_group_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 16425)
-- Name: incoming_invoice invoice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_invoice ALTER COLUMN invoice_id SET DEFAULT nextval('public.incoming_invoice_invoice_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 16439)
-- Name: incoming_items item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_items ALTER COLUMN item_id SET DEFAULT nextval('public.incoming_items_item_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 16457)
-- Name: outgoing_invoice out_invoice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_invoice ALTER COLUMN out_invoice_id SET DEFAULT nextval('public.outgoing_invoice_out_invoice_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 16466)
-- Name: outgoing_items out_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_items ALTER COLUMN out_item_id SET DEFAULT nextval('public.outgoing_items_out_item_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 16484)
-- Name: payments payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN payment_id SET DEFAULT nextval('public.payments_payment_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16402)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16416)
-- Name: suppliers supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('public.suppliers_supplier_id_seq'::regclass);


--
-- TOC entry 4969 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (group_id, group_name) FROM stdin;
1	Ручки
2	Тетради
\.


--
-- TOC entry 4975 (class 0 OID 16422)
-- Dependencies: 226
-- Data for Name: incoming_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incoming_invoice (invoice_id, supplier_id, invoice_date, total_sum) FROM stdin;
8	1	2026-05-28	1000.00
10	1	2026-05-21	70.00
12	1	2026-04-30	453433.00
7	1	2026-05-28	2140.00
11	1	2026-04-30	245430.00
\.


--
-- TOC entry 4977 (class 0 OID 16436)
-- Dependencies: 228
-- Data for Name: incoming_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incoming_items (item_id, invoice_id, product_id, quantity, price) FROM stdin;
4	10	2	342	100.00
5	7	1	10	100.00
6	7	1	10	100.00
7	7	1	1	140.00
8	11	1	54	4545.00
\.


--
-- TOC entry 4979 (class 0 OID 16454)
-- Dependencies: 230
-- Data for Name: outgoing_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outgoing_invoice (out_invoice_id, invoice_date) FROM stdin;
\.


--
-- TOC entry 4981 (class 0 OID 16463)
-- Dependencies: 232
-- Data for Name: outgoing_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outgoing_items (out_item_id, out_invoice_id, product_id, quantity, price) FROM stdin;
\.


--
-- TOC entry 4983 (class 0 OID 16481)
-- Dependencies: 234
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payment_id, invoice_id, payment_date, amount) FROM stdin;
3	7	2026-05-28	1000.00
4	7	2026-05-28	500.00
\.


--
-- TOC entry 4971 (class 0 OID 16399)
-- Dependencies: 222
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, group_id, unit, price) FROM stdin;
1	Синяя ручка	1	шт	50.00
2	Тетрадь 48л	2	шт	120.00
\.


--
-- TOC entry 4973 (class 0 OID 16413)
-- Dependencies: 224
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplier_id, supplier_name, phone) FROM stdin;
1	ООО КанцМир	+799999999
\.


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 219
-- Name: groups_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_group_id_seq', 2, true);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 225
-- Name: incoming_invoice_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incoming_invoice_invoice_id_seq', 12, true);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 227
-- Name: incoming_items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incoming_items_item_id_seq', 8, true);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 229
-- Name: outgoing_invoice_out_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outgoing_invoice_out_invoice_id_seq', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 231
-- Name: outgoing_items_out_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outgoing_items_out_item_id_seq', 1, false);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 233
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_payment_id_seq', 4, true);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 2, true);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 223
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_supplier_id_seq', 1, true);


--
-- TOC entry 4799 (class 2606 OID 16397)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);


--
-- TOC entry 4805 (class 2606 OID 16429)
-- Name: incoming_invoice incoming_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_invoice
    ADD CONSTRAINT incoming_invoice_pkey PRIMARY KEY (invoice_id);


--
-- TOC entry 4807 (class 2606 OID 16442)
-- Name: incoming_items incoming_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_items
    ADD CONSTRAINT incoming_items_pkey PRIMARY KEY (item_id);


--
-- TOC entry 4809 (class 2606 OID 16461)
-- Name: outgoing_invoice outgoing_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_invoice
    ADD CONSTRAINT outgoing_invoice_pkey PRIMARY KEY (out_invoice_id);


--
-- TOC entry 4811 (class 2606 OID 16469)
-- Name: outgoing_items outgoing_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_items
    ADD CONSTRAINT outgoing_items_pkey PRIMARY KEY (out_item_id);


--
-- TOC entry 4813 (class 2606 OID 16487)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 4801 (class 2606 OID 16406)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4803 (class 2606 OID 16420)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 4815 (class 2606 OID 16430)
-- Name: incoming_invoice incoming_invoice_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_invoice
    ADD CONSTRAINT incoming_invoice_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);


--
-- TOC entry 4816 (class 2606 OID 16443)
-- Name: incoming_items incoming_items_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_items
    ADD CONSTRAINT incoming_items_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.incoming_invoice(invoice_id);


--
-- TOC entry 4817 (class 2606 OID 16448)
-- Name: incoming_items incoming_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incoming_items
    ADD CONSTRAINT incoming_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4818 (class 2606 OID 16470)
-- Name: outgoing_items outgoing_items_out_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_items
    ADD CONSTRAINT outgoing_items_out_invoice_id_fkey FOREIGN KEY (out_invoice_id) REFERENCES public.outgoing_invoice(out_invoice_id);


--
-- TOC entry 4819 (class 2606 OID 16475)
-- Name: outgoing_items outgoing_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outgoing_items
    ADD CONSTRAINT outgoing_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4820 (class 2606 OID 16488)
-- Name: payments payments_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.incoming_invoice(invoice_id);


--
-- TOC entry 4814 (class 2606 OID 16407)
-- Name: products products_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(group_id);


-- Completed on 2026-05-28 03:03:03

--
-- PostgreSQL database dump complete
--

\unrestrict zeYZQpokcbVy9pr34mVNdVvfcYuR2SOceqGGFzbb1Gc8LDAvTyZtxmeQpIVKUPJ

