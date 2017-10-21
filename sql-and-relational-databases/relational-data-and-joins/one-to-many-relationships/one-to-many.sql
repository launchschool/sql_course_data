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

ALTER TABLE ONLY public.calls DROP CONSTRAINT calls_contact_id_fkey;
ALTER TABLE ONLY public.contacts DROP CONSTRAINT contacts_pkey;
ALTER TABLE ONLY public.calls DROP CONSTRAINT calls_pkey;
ALTER TABLE public.contacts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.calls ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.contacts_id_seq;
DROP TABLE public.contacts;
DROP SEQUENCE public.calls_id_seq;
DROP TABLE public.calls;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: jimb
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO jimb;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: jimb
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: calls; Type: TABLE; Schema: public; Owner: jimb; Tablespace: 
--

CREATE TABLE calls (
    id integer NOT NULL,
    "when" timestamp without time zone NOT NULL,
    duration integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE calls OWNER TO jimb;

--
-- Name: calls_id_seq; Type: SEQUENCE; Schema: public; Owner: jimb
--

CREATE SEQUENCE calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE calls_id_seq OWNER TO jimb;

--
-- Name: calls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jimb
--

ALTER SEQUENCE calls_id_seq OWNED BY calls.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: jimb; Tablespace: 
--

CREATE TABLE contacts (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    number character varying(10) NOT NULL
);


ALTER TABLE contacts OWNER TO jimb;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: jimb
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contacts_id_seq OWNER TO jimb;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jimb
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jimb
--

ALTER TABLE ONLY calls ALTER COLUMN id SET DEFAULT nextval('calls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jimb
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Data for Name: calls; Type: TABLE DATA; Schema: public; Owner: jimb
--

INSERT INTO calls VALUES (1, '2016-01-02 04:59:00', 1821, 6);
INSERT INTO calls VALUES (2, '2016-01-08 15:30:00', 350, 17);
INSERT INTO calls VALUES (3, '2016-01-11 11:06:00', 111, 25);
INSERT INTO calls VALUES (4, '2016-01-13 18:13:00', 2521, 25);
INSERT INTO calls VALUES (5, '2016-01-17 09:43:00', 982, 17);


--
-- Name: calls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jimb
--

SELECT pg_catalog.setval('calls_id_seq', 5, true);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: jimb
--

INSERT INTO contacts VALUES (6, 'William', 'Swift', '7204890809');
INSERT INTO contacts VALUES (17, 'Yuan', 'Ku', '2195677796');
INSERT INTO contacts VALUES (25, 'Tamila', 'Chichigov', '5702700921');


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jimb
--

SELECT pg_catalog.setval('contacts_id_seq', 25, true);


--
-- Name: calls_pkey; Type: CONSTRAINT; Schema: public; Owner: jimb; Tablespace: 
--

ALTER TABLE ONLY calls
    ADD CONSTRAINT calls_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: jimb; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: calls_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jimb
--

ALTER TABLE ONLY calls
    ADD CONSTRAINT calls_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES contacts(id);


--
-- PostgreSQL database dump complete
--

