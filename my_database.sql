--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: reeseglasscock
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.projects OWNER TO reeseglasscock;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: reeseglasscock
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO reeseglasscock;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reeseglasscock
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: reeseglasscock
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name character varying,
    project_id integer
);


ALTER TABLE public.volunteers OWNER TO reeseglasscock;

--
-- Name: volunteer_id_seq; Type: SEQUENCE; Schema: public; Owner: reeseglasscock
--

CREATE SEQUENCE public.volunteer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteer_id_seq OWNER TO reeseglasscock;

--
-- Name: volunteer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reeseglasscock
--

ALTER SEQUENCE public.volunteer_id_seq OWNED BY public.volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: reeseglasscock
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: reeseglasscock
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteer_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: reeseglasscock
--

COPY public.projects (id, title) FROM stdin;
33	Taco Truck
34	Taco Bell
35	Carls Junior
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: reeseglasscock
--

COPY public.volunteers (id, name, project_id) FROM stdin;
18	Paul	35
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reeseglasscock
--

SELECT pg_catalog.setval('public.project_id_seq', 35, true);


--
-- Name: volunteer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reeseglasscock
--

SELECT pg_catalog.setval('public.volunteer_id_seq', 18, true);


--
-- Name: projects project_pkey; Type: CONSTRAINT; Schema: public; Owner: reeseglasscock
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteer_pkey; Type: CONSTRAINT; Schema: public; Owner: reeseglasscock
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteer_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

