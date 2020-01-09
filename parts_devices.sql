--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: devices; Type: TABLE; Schema: public; Owner: LER
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.devices OWNER TO "LER";

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: LER
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO "LER";

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LER
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: LER
--

CREATE TABLE public.films (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    director character varying(255) NOT NULL,
    duration integer NOT NULL,
    CONSTRAINT director_name CHECK (((length((director)::text) >= 1) AND ("position"((director)::text, ' '::text) > 0))),
    CONSTRAINT title_length CHECK ((length((title)::text) >= 1)),
    CONSTRAINT year_range CHECK (((year >= 1900) AND (year <= 2100)))
);


ALTER TABLE public.films OWNER TO "LER";

--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: LER
--

CREATE SEQUENCE public.films_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.films_id_seq OWNER TO "LER";

--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LER
--

ALTER SEQUENCE public.films_id_seq OWNED BY public.films.id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: LER
--

CREATE TABLE public.parts (
    id integer NOT NULL,
    part_number integer NOT NULL,
    device_id integer
);


ALTER TABLE public.parts OWNER TO "LER";

--
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: LER
--

CREATE SEQUENCE public.parts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parts_id_seq OWNER TO "LER";

--
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LER
--

ALTER SEQUENCE public.parts_id_seq OWNED BY public.parts.id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: LER
--

CREATE TABLE public.test (
    value integer DEFAULT 0 NOT NULL,
    CONSTRAINT zero CHECK ((value <> 0))
);


ALTER TABLE public.test OWNER TO "LER";

--
-- Name: testing; Type: TABLE; Schema: public; Owner: LER
--

CREATE TABLE public.testing (
    name character varying(50),
    value integer DEFAULT 0 NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.testing OWNER TO "LER";

--
-- Name: testing_id_seq; Type: SEQUENCE; Schema: public; Owner: LER
--

CREATE SEQUENCE public.testing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testing_id_seq OWNER TO "LER";

--
-- Name: testing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LER
--

ALTER SEQUENCE public.testing_id_seq OWNED BY public.testing.id;


--
-- Name: weather; Type: TABLE; Schema: public; Owner: LER
--

CREATE TABLE public.weather (
    date date NOT NULL,
    low integer NOT NULL,
    high integer NOT NULL,
    rainfall numeric(5,3) DEFAULT 0
);


ALTER TABLE public.weather OWNER TO "LER";

--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: LER
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: LER
--

ALTER TABLE ONLY public.films ALTER COLUMN id SET DEFAULT nextval('public.films_id_seq'::regclass);


--
-- Name: parts id; Type: DEFAULT; Schema: public; Owner: LER
--

ALTER TABLE ONLY public.parts ALTER COLUMN id SET DEFAULT nextval('public.parts_id_seq'::regclass);


--
-- Name: testing id; Type: DEFAULT; Schema: public; Owner: LER
--

ALTER TABLE ONLY public.testing ALTER COLUMN id SET DEFAULT nextval('public.testing_id_seq'::regclass);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: LER
--

COPY public.devices (id, name, created_at) FROM stdin;
1	Accelerometer	2020-01-08 20:52:02.379134
2	Gyroscope	2020-01-08 20:52:02.379134
\.


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: LER
--

COPY public.films (id, title, year, genre, director, duration) FROM stdin;
1	Die Hard	1988	action	John McTiernan	132
2	Casablanca	1942	drama	Michael Curtiz	102
3	The Conversation	1974	thriller	Francis Ford Coppola	113
4	1984	1956	scifi	Michael Anderson	90
5	Tinker Tailor Soldier Spy	2011	espionage	Tomas Alfredson	127
6	The Birdcage	1996	comedy	Mike Nichols	118
7	28 Days Later	2002	horror	Danny Boyle	113
8	The Godfather	1972	crime	Francis Ford Coppola	175
9	12 Angry Men	1957	drama	Sidney Lumet	96
10	Interstellar	2014	scifi	Christopher Nolan	169
11	Midnight Special	2016	scifi	Jeff Nicols	111
12	Home Alone	1990	comedy	John Wilden Hughes, Jr.	102
13	Hairspray	1988	comedy	John Waters	92
14	Godzilla	1998	scifi	Roland Emmerich	139
15	Godzilla	2014	scifi	Gareth Edwards	123
16	Wayne's World	1992	comedy	Penelope Spheeris	95
17	Bourne Identity	2002	espionage	Doug Liman	118
\.


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: LER
--

COPY public.parts (id, part_number, device_id) FROM stdin;
1	420	1
2	69	1
3	42	1
4	666	2
5	777	2
6	1111	2
7	1234	2
8	789	2
9	1010	\N
10	555	\N
11	101	\N
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: LER
--

COPY public.test (value) FROM stdin;
\.


--
-- Data for Name: testing; Type: TABLE DATA; Schema: public; Owner: LER
--

COPY public.testing (name, value, id) FROM stdin;
tomato	0	1
\.


--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: LER
--

COPY public.weather (date, low, high, rainfall) FROM stdin;
2016-03-07	29	32	0.000
2016-03-08	23	31	0.000
2016-03-09	17	28	0.000
2016-03-01	34	43	0.118
2016-03-02	32	44	0.118
2016-03-03	31	47	0.157
2016-03-04	33	42	0.079
2016-03-05	39	46	0.276
2016-03-06	32	43	0.079
\.


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LER
--

SELECT pg_catalog.setval('public.devices_id_seq', 2, true);


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LER
--

SELECT pg_catalog.setval('public.films_id_seq', 17, true);


--
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LER
--

SELECT pg_catalog.setval('public.parts_id_seq', 11, true);


--
-- Name: testing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LER
--

SELECT pg_catalog.setval('public.testing_id_seq', 1, true);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: LER
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: LER
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: parts parts_part_number_key; Type: CONSTRAINT; Schema: public; Owner: LER
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_part_number_key UNIQUE (part_number);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: LER
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- Name: testing testing_pkey; Type: CONSTRAINT; Schema: public; Owner: LER
--

ALTER TABLE ONLY public.testing
    ADD CONSTRAINT testing_pkey PRIMARY KEY (id);


--
-- Name: parts parts_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LER
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(id);


--
-- PostgreSQL database dump complete
--

