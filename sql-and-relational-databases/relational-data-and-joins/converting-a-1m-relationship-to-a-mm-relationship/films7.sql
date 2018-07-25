--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.films DROP CONSTRAINT films_director_id_fkey;
ALTER TABLE ONLY public.films DROP CONSTRAINT title_unique;
ALTER TABLE ONLY public.directors DROP CONSTRAINT directors_pkey;
ALTER TABLE public.directors ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.films;
DROP SEQUENCE public.directors_id_seq;
DROP TABLE public.directors;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: directors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE directors (
    id integer NOT NULL,
    name text NOT NULL,
    CONSTRAINT valid_name CHECK (((length(name) >= 1) AND ("position"(name, ' '::text) > 0)))
);


--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE directors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE directors_id_seq OWNED BY directors.id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE films (
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    duration integer NOT NULL,
    director_id integer NOT NULL,
    CONSTRAINT title_length CHECK ((length((title)::text) >= 1)),
    CONSTRAINT year_range CHECK (((year >= 1900) AND (year <= 2100)))
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY directors ALTER COLUMN id SET DEFAULT nextval('directors_id_seq'::regclass);


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO directors VALUES (1, 'John McTiernan');
INSERT INTO directors VALUES (2, 'Michael Curtiz');
INSERT INTO directors VALUES (3, 'Francis Ford Coppola');
INSERT INTO directors VALUES (4, 'Michael Anderson');
INSERT INTO directors VALUES (5, 'Tomas Alfredson');
INSERT INTO directors VALUES (6, 'Mike Nichols');
INSERT INTO directors VALUES (7, 'Sidney Lumet');
INSERT INTO directors VALUES (8, 'Penelope Spheeris');


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('directors_id_seq', 8, true);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO films VALUES ('Die Hard', 1988, 'action', 132, 1);
INSERT INTO films VALUES ('Casablanca', 1942, 'drama', 102, 2);
INSERT INTO films VALUES ('The Conversation', 1974, 'thriller', 113, 3);
INSERT INTO films VALUES ('1984', 1956, 'scifi', 90, 4);
INSERT INTO films VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 127, 5);
INSERT INTO films VALUES ('The Birdcage', 1996, 'comedy', 118, 6);
INSERT INTO films VALUES ('The Godfather', 1972, 'crime', 175, 3);
INSERT INTO films VALUES ('12 Angry Men', 1957, 'drama', 96, 7);
INSERT INTO films VALUES ('Wayne''s World', 1992, 'comedy', 95, 8);
INSERT INTO films VALUES ('Let the Right One In', 2008, 'horror', 114, 4);
--
-- Name: directors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: title_unique; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY films
    ADD CONSTRAINT title_unique UNIQUE (title);


--
-- Name: films_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_director_id_fkey FOREIGN KEY (director_id) REFERENCES directors(id);


--
-- PostgreSQL database dump complete
--

