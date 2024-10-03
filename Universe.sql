--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    type character varying(10),
    explored boolean DEFAULT false,
    number_of_stars numeric(30,3)
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
    planet_id integer,
    name character varying(30),
    is_spherical boolean DEFAULT true NOT NULL,
    orbit_type text
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
-- Name: other_objects; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_objects (
    name character varying(30) NOT NULL,
    solar_gravity boolean NOT NULL,
    valuable boolean,
    other_objects_id integer NOT NULL
);


ALTER TABLE public.other_objects OWNER TO freecodecamp;

--
-- Name: other_objects_other_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_objects_other_objects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_objects_other_objects_id_seq OWNER TO freecodecamp;

--
-- Name: other_objects_other_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_objects_other_objects_id_seq OWNED BY public.other_objects.other_objects_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    colonized boolean DEFAULT false,
    explored boolean DEFAULT false,
    name character varying(30),
    goldilocks_zone boolean DEFAULT false,
    size_in_number_of_earths integer,
    number_of_moons integer
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_planets integer,
    type_of_star character varying(30),
    distance_from_earth_in_lightyears numeric(20,2)
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other_objects other_objects_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_objects ALTER COLUMN other_objects_id SET DEFAULT nextval('public.other_objects_other_objects_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', false, NULL);
INSERT INTO public.galaxy VALUES (3, 'Ursa Major III', 'dwarf', false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Draco II', 'dwarf', false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Segue 1', 'dwarf', false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Virgo I', 'spheroid', false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', true, NULL);
INSERT INTO public.moon VALUES (2, 5, 'Ganymede', true, NULL);
INSERT INTO public.moon VALUES (3, 5, 'Callisto', true, NULL);
INSERT INTO public.moon VALUES (4, 5, 'IO', true, NULL);
INSERT INTO public.moon VALUES (5, 5, 'Europa', true, NULL);
INSERT INTO public.moon VALUES (6, 5, 'Amalthea', true, NULL);
INSERT INTO public.moon VALUES (7, 5, 'Himalia', true, NULL);
INSERT INTO public.moon VALUES (8, 5, 'Elara', true, NULL);
INSERT INTO public.moon VALUES (9, 5, 'Pasiphae', true, NULL);
INSERT INTO public.moon VALUES (10, 5, 'Sinope', true, NULL);
INSERT INTO public.moon VALUES (11, 5, 'Lysithea', true, NULL);
INSERT INTO public.moon VALUES (12, 5, 'Carme', true, NULL);
INSERT INTO public.moon VALUES (13, 5, 'Ananke', true, NULL);
INSERT INTO public.moon VALUES (14, 5, 'Leda', true, NULL);
INSERT INTO public.moon VALUES (15, 5, 'Thebe', true, NULL);
INSERT INTO public.moon VALUES (16, 5, 'Adrastea', true, NULL);
INSERT INTO public.moon VALUES (17, 5, 'Metis', true, NULL);
INSERT INTO public.moon VALUES (18, 5, 'Callirrhoe', true, NULL);
INSERT INTO public.moon VALUES (19, 5, 'Themisto', true, NULL);
INSERT INTO public.moon VALUES (20, 5, 'Megaclite', true, NULL);
INSERT INTO public.moon VALUES (21, 5, 'Taygete', true, NULL);


--
-- Data for Name: other_objects; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_objects VALUES ('433 Eros', true, NULL, 1);
INSERT INTO public.other_objects VALUES ('Oumuamua', false, NULL, 2);
INSERT INTO public.other_objects VALUES ('Apophis', true, NULL, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, false, false, 'Earth', true, NULL, NULL);
INSERT INTO public.planet VALUES (2, 1, false, false, 'Mercury', false, NULL, NULL);
INSERT INTO public.planet VALUES (3, 1, false, false, 'Venus', false, NULL, NULL);
INSERT INTO public.planet VALUES (4, 1, false, false, 'Mars', true, NULL, NULL);
INSERT INTO public.planet VALUES (5, 1, false, false, 'Jupiter', false, NULL, NULL);
INSERT INTO public.planet VALUES (6, 1, false, false, 'Saturn', false, NULL, NULL);
INSERT INTO public.planet VALUES (7, 1, false, false, 'Uranus', false, NULL, NULL);
INSERT INTO public.planet VALUES (8, 1, false, false, 'Neptune', false, NULL, NULL);
INSERT INTO public.planet VALUES (9, 4, false, false, 'Centauri b', true, NULL, NULL);
INSERT INTO public.planet VALUES (10, 4, false, false, 'Centauri c', true, NULL, NULL);
INSERT INTO public.planet VALUES (11, 4, false, false, 'Centauri d', true, NULL, NULL);
INSERT INTO public.planet VALUES (12, 3, false, false, 'Wolf a', false, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 8, 'yellow dwarf', NULL);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 0, 'binary system', NULL);
INSERT INTO public.star VALUES (3, 1, 'Wolf 359', 2, 'red dwarf', NULL);
INSERT INTO public.star VALUES (4, 1, 'Proxima Centauri', 5, 'red dwarf', NULL);
INSERT INTO public.star VALUES (5, 1, 'Procyon', NULL, 'binary system', NULL);
INSERT INTO public.star VALUES (6, 2, 'Ross 248', NULL, 'red dwarf', NULL);
INSERT INTO public.star VALUES (7, 1, 'Lacaille 9352', NULL, 'red dwarf', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: other_objects_other_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_objects_other_objects_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_objects other_objects_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_objects
    ADD CONSTRAINT other_objects_name_key UNIQUE (name);


--
-- Name: other_objects other_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_objects
    ADD CONSTRAINT other_objects_pkey PRIMARY KEY (other_objects_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id_constraint; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_constraint FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id_constraint; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_constraint FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id_constraint; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_constraint FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

