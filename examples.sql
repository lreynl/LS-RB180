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
-- Name: films; Type: TABLE; Schema: public; Owner: LER
--

CREATE TABLE public.films (
    title character varying(255),
    year integer,
    genre character varying(100),
    director character varying(50),
    duration integer
);


ALTER TABLE public.films OWNER TO "LER";

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
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: LER
--

INSERT INTO public.films VALUES ('Die Hard', 1988, 'action', 'John McTiernan', 132);
INSERT INTO public.films VALUES ('Casablanca', 1942, 'drama', 'Michael Curtiz', 102);
INSERT INTO public.films VALUES ('The Conversation', 1974, 'thriller', 'Francis Ford Coppola', 113);
INSERT INTO public.films VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90);
INSERT INTO public.films VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127);
INSERT INTO public.films VALUES ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);


--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: LER
--

INSERT INTO public.weather VALUES ('2016-03-07', 29, 32, 0.000);
INSERT INTO public.weather VALUES ('2016-03-08', 23, 31, 0.000);
INSERT INTO public.weather VALUES ('2016-03-09', 17, 28, 0.000);
INSERT INTO public.weather VALUES ('2016-03-01', 34, 43, 0.118);
INSERT INTO public.weather VALUES ('2016-03-02', 32, 44, 0.118);
INSERT INTO public.weather VALUES ('2016-03-03', 31, 47, 0.157);
INSERT INTO public.weather VALUES ('2016-03-04', 33, 42, 0.079);
INSERT INTO public.weather VALUES ('2016-03-05', 39, 46, 0.276);
INSERT INTO public.weather VALUES ('2016-03-06', 32, 43, 0.079);


--
-- PostgreSQL database dump complete
--

