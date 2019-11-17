--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2019-11-17 12:04:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 24655)
-- Name: Chullita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Chullita" (
    id integer NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    "fechaNacimiento" date
);


ALTER TABLE public."Chullita" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24653)
-- Name: Chullita_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Chullita_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Chullita_id_seq" OWNER TO postgres;

--
-- TOC entry 2828 (class 0 OID 0)
-- Dependencies: 196
-- Name: Chullita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Chullita_id_seq" OWNED BY public."Chullita".id;


--
-- TOC entry 199 (class 1259 OID 24663)
-- Name: Vida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vida" (
    id integer NOT NULL,
    numero integer,
    "idChullita" integer NOT NULL,
    activo boolean
);


ALTER TABLE public."Vida" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24661)
-- Name: Vida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Vida_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Vida_id_seq" OWNER TO postgres;

--
-- TOC entry 2829 (class 0 OID 0)
-- Dependencies: 198
-- Name: Vida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Vida_id_seq" OWNED BY public."Vida".id;


--
-- TOC entry 2691 (class 2604 OID 24658)
-- Name: Chullita id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chullita" ALTER COLUMN id SET DEFAULT nextval('public."Chullita_id_seq"'::regclass);


--
-- TOC entry 2692 (class 2604 OID 24666)
-- Name: Vida id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vida" ALTER COLUMN id SET DEFAULT nextval('public."Vida_id_seq"'::regclass);


--
-- TOC entry 2820 (class 0 OID 24655)
-- Dependencies: 197
-- Data for Name: Chullita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Chullita" (id, nombre, apellido, "fechaNacimiento") FROM stdin;
2	Doris	Chicaiza	1992-01-01
3	Gutavo	Gu	1990-01-01
1	Lui	Caiza	1990-07-18
\.


--
-- TOC entry 2822 (class 0 OID 24663)
-- Dependencies: 199
-- Data for Name: Vida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Vida" (id, numero, "idChullita", activo) FROM stdin;
2	4	3	\N
3	3	2	\N
4	5	1	t
\.


--
-- TOC entry 2830 (class 0 OID 0)
-- Dependencies: 196
-- Name: Chullita_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Chullita_id_seq"', 4, true);


--
-- TOC entry 2831 (class 0 OID 0)
-- Dependencies: 198
-- Name: Vida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Vida_id_seq"', 4, true);


--
-- TOC entry 2694 (class 2606 OID 24660)
-- Name: Chullita Chullita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chullita"
    ADD CONSTRAINT "Chullita_pkey" PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 24668)
-- Name: Vida Vida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vida"
    ADD CONSTRAINT "Vida_pkey" PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 24669)
-- Name: Vida idChullita; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vida"
    ADD CONSTRAINT "idChullita" FOREIGN KEY ("idChullita") REFERENCES public."Chullita"(id);


-- Completed on 2019-11-17 12:04:56

--
-- PostgreSQL database dump complete
--

