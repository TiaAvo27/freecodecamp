--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    belong_universe text,
    age_in_millionsof_years integer,
    distance_from_earth numeric,
    is_spherical boolean,
    has_life boolean,
    universe_id integer,
    CONSTRAINT galaxy_is_spherical_check CHECK ((is_spherical = ANY (ARRAY[true, false]))),
    CONSTRAINT galaxy_is_spherical_check1 CHECK ((is_spherical = ANY (ARRAY[true, false])))
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    belong_universe text,
    age_in_millionsof_years integer,
    distance_from_earth numeric,
    is_spherical boolean,
    has_life boolean,
    universe_id integer,
    CONSTRAINT moon_has_life_check CHECK ((has_life = ANY (ARRAY[true, false]))),
    CONSTRAINT moon_is_spherical_check CHECK ((is_spherical = ANY (ARRAY[true, false])))
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    belong_universe text,
    age_in_millionsof_years integer,
    distance_from_earth numeric,
    is_spherical boolean,
    has_life boolean,
    universe_id integer,
    CONSTRAINT planet_has_life_check CHECK ((has_life = ANY (ARRAY[true, false]))),
    CONSTRAINT planet_is_spherical_check CHECK ((is_spherical = ANY (ARRAY[true, false])))
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    belong_universe text,
    age_in_millionsof_years integer,
    distance_from_earth numeric,
    is_spherical boolean,
    has_life boolean,
    universe_id integer,
    CONSTRAINT star_is_spherical_check CHECK ((is_spherical = ANY (ARRAY[true, false]))),
    CONSTRAINT star_is_spherical_check1 CHECK ((is_spherical = ANY (ARRAY[true, false])))
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: universe_junc; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_junc (
    universe_junc_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millionsof_years integer
);


ALTER TABLE public.universe_junc OWNER TO freecodecamp;

--
-- Name: universe_junc_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_junc_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_junc_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_junc_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_junc_universe_id_seq OWNED BY public.universe_junc.universe_junc_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe_junc universe_junc_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_junc ALTER COLUMN universe_junc_id SET DEFAULT nextval('public.universe_junc_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, 'Via Lattea', 'nostro', 50000, 0.027, false, true, NULL);
INSERT INTO public.galaxy VALUES (8, 'Nana Ellittca del cane maggiore', 'nostro', 60000, 0.025, false, false, NULL);
INSERT INTO public.galaxy VALUES (9, 'Nana ellittica del Saggitario', 'nostro', 4000, 0.081, false, false, NULL);
INSERT INTO public.galaxy VALUES (10, 'Ursa Major II', 'nostro', 3500, 0.098, false, false, NULL);
INSERT INTO public.galaxy VALUES (11, 'Grande nube di Magellano', 'nostro', 4500, 0.163, false, false, NULL);
INSERT INTO public.galaxy VALUES (12, 'Nana del Boote', 'nostro', 7000, 0.197, false, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'lunaire', 'nostro', 5, 0.5, true, false, NULL);
INSERT INTO public.moon VALUES (2, 'selene', 'nostro', 6, 0.6, true, false, NULL);
INSERT INTO public.moon VALUES (3, 'titan', 'nostro', 8, 0.456, false, false, NULL);
INSERT INTO public.moon VALUES (4, 'Helene', 'nostro', 8, 0.5465, false, false, NULL);
INSERT INTO public.moon VALUES (5, 'Atlas', 'nostro', 99, 0.65, false, false, NULL);
INSERT INTO public.moon VALUES (6, 'pheobe', 'nostro', 79, 0.8486, false, false, NULL);
INSERT INTO public.moon VALUES (7, 'Lapetus', 'nostro', 63, 0.8796, false, false, NULL);
INSERT INTO public.moon VALUES (8, 'Hyperion', 'nostro', 96, 0.546, false, true, NULL);
INSERT INTO public.moon VALUES (9, 'Janus', 'nostro', 45, 0.98, true, false, NULL);
INSERT INTO public.moon VALUES (10, 'rhea', 'nostro', 12, 0.79, true, false, NULL);
INSERT INTO public.moon VALUES (11, 'Dione', 'nostro', 365, 0.98, true, false, NULL);
INSERT INTO public.moon VALUES (12, 'Thethys', 'nostro', 9, 1, false, true, NULL);
INSERT INTO public.moon VALUES (13, 'mimas', 'nostro', 8, 2, false, true, NULL);
INSERT INTO public.moon VALUES (14, 'enceladus', 'nostro', 7, 47, false, true, NULL);
INSERT INTO public.moon VALUES (15, 'Pandora', 'nostro', 5, 8, true, false, NULL);
INSERT INTO public.moon VALUES (16, 'Calypso', 'nostro', 4, 6, true, false, NULL);
INSERT INTO public.moon VALUES (17, 'Epimetheus', 'nostro', 3, 2, false, true, NULL);
INSERT INTO public.moon VALUES (18, 'Anthe', 'nostro', 3, 5, false, true, NULL);
INSERT INTO public.moon VALUES (19, 'Pallene', 'nostro', 4, 8, false, true, NULL);
INSERT INTO public.moon VALUES (20, 'Telesto', 'nostro', 5, 9, false, true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terra', 'nostro', 2500, 0, true, true, NULL);
INSERT INTO public.planet VALUES (2, 'Mercurio', 'nostro', 6000, 0.0025, true, false, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'nostro', 4000, 0.0081, true, false, NULL);
INSERT INTO public.planet VALUES (4, 'Plutone', 'nostro', 3500, 0.0098, true, false, NULL);
INSERT INTO public.planet VALUES (5, 'Saturno', 'nostro', 4500, 0.00163, true, false, NULL);
INSERT INTO public.planet VALUES (6, 'Venere', 'nostro', 7000, 0.00197, true, false, NULL);
INSERT INTO public.planet VALUES (7, 'Nettuno', 'nostro', 4100, 0.0004, true, false, NULL);
INSERT INTO public.planet VALUES (8, 'Marte', 'nostro', 4800, 0.0026, true, false, NULL);
INSERT INTO public.planet VALUES (9, 'Urano', 'nostro', 7800, 0.0078, true, false, NULL);
INSERT INTO public.planet VALUES (10, 'Wonderland', 'fiabe', 8, 0.000005, true, true, NULL);
INSERT INTO public.planet VALUES (11, 'Candyland', 'film', 5, 0, true, true, NULL);
INSERT INTO public.planet VALUES (12, 'Zombieland', 'film', 5, 0, false, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Ariete', 'nostro', 50000, 0.027, false, true, NULL);
INSERT INTO public.star VALUES (4, 'Andromeda', 'nostro', 60000, 0.025, false, false, NULL);
INSERT INTO public.star VALUES (5, 'Bilancia', 'nostro', 4000, 0.081, false, false, NULL);
INSERT INTO public.star VALUES (6, 'Capricorno', 'nostro', 3500, 0.098, false, false, NULL);
INSERT INTO public.star VALUES (7, 'Centauro', 'nostro', 4500, 0.163, false, false, NULL);
INSERT INTO public.star VALUES (8, 'Ercole', 'nostro', 7000, 0.197, false, false, NULL);


--
-- Data for Name: universe_junc; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_junc VALUES (1, 'mattia', 27);
INSERT INTO public.universe_junc VALUES (2, 'marco', 58);
INSERT INTO public.universe_junc VALUES (3, 'nicolo', 25);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 18, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: universe_junc_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_junc_universe_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_universe_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_universe_id_key UNIQUE (universe_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_universe_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_universe_id_key UNIQUE (universe_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_universe_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_universe_id_key UNIQUE (universe_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star star_universe_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_universe_id_key UNIQUE (universe_id);


--
-- Name: universe_junc universe_junc_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_junc
    ADD CONSTRAINT universe_junc_name_key UNIQUE (name);


--
-- Name: universe_junc universe_junc_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_junc
    ADD CONSTRAINT universe_junc_pkey PRIMARY KEY (universe_junc_id);


--
-- Name: moon moon_universe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_universe_id_fkey FOREIGN KEY (universe_id) REFERENCES public.planet(universe_id);


--
-- Name: star star_universe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_universe_id_fkey FOREIGN KEY (universe_id) REFERENCES public.galaxy(universe_id);


--
-- PostgreSQL database dump complete
--

