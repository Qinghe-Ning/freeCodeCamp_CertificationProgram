--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    diameter_km numeric(8,2),
    is_potentially_hazardous boolean DEFAULT false,
    composition text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth numeric(12,2),
    age_in_millions_of_years integer,
    is_spherical boolean DEFAULT true,
    description text
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer,
    is_spherical boolean DEFAULT true,
    orbital_period_days numeric(8,2),
    discovery_year integer
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true,
    orbital_period_days numeric(10,2),
    mass_earth numeric(8,4)
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(20) NOT NULL,
    mass numeric(8,4),
    has_planets boolean DEFAULT false,
    age_in_millions_of_years integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 939.40, false, 'Rock and ice, dwarf planet in asteroid belt.');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 525.40, false, 'Basaltic rock, differentiated interior.');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1, 512.00, false, 'Carbonaceous chondrite.');
INSERT INTO public.asteroid VALUES (4, 'Apophis', 1, 0.37, true, 'Stony, near-Earth asteroid.');
INSERT INTO public.asteroid VALUES (5, 'Bennu', 1, 0.49, true, 'Carbonaceous, target of OSIRIS-REx mission.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0.03, 13600, true, 'Our home galaxy, containing the Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.54, 10000, true, 'Nearest major galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2.73, 8000, true, 'Third largest galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 53.50, 13200, false, 'Supergiant elliptical galaxy in Virgo Cluster.');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular', 0.16, 1100, false, 'Satellite galaxy of the Milky Way.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 29.30, 12500, true, 'Unbarred spiral galaxy with a prominent dust lane.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, 27.32, -600);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, 0.32, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, 1.26, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 4, 1821, true, 1.77, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 1560, true, 3.55, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 2634, true, 7.15, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 2410, true, 16.69, 1610);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 2575, true, 15.95, 1655);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 763, true, 4.52, 1672);
INSERT INTO public.moon VALUES (10, 'Iapetus', 5, 734, true, 79.33, 1671);
INSERT INTO public.moon VALUES (11, 'Dione', 5, 561, true, 2.74, 1684);
INSERT INTO public.moon VALUES (12, 'Tethys', 5, 531, true, 1.89, 1684);
INSERT INTO public.moon VALUES (13, 'Enceladus', 5, 252, true, 1.37, 1789);
INSERT INTO public.moon VALUES (14, 'Mimas', 5, 198, true, 0.94, 1789);
INSERT INTO public.moon VALUES (15, 'Triton', 1, 1353, true, -5.88, 1846);
INSERT INTO public.moon VALUES (16, 'Oberon', 4, 761, true, 13.46, 1787);
INSERT INTO public.moon VALUES (17, 'Titania', 4, 788, true, 8.71, 1787);
INSERT INTO public.moon VALUES (18, 'Umbriel', 4, 584, true, 4.14, 1851);
INSERT INTO public.moon VALUES (19, 'Ariel', 4, 578, true, 2.52, 1851);
INSERT INTO public.moon VALUES (20, 'Miranda', 4, 235, true, 1.41, 1948);
INSERT INTO public.moon VALUES (21, 'Charon', 3, 606, true, 6.39, 1978);
INSERT INTO public.moon VALUES (22, 'Nix', 3, 25, false, 24.85, 2005);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', true, true, 365.25, 1.0000);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', false, true, 687.00, 0.1070);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', false, true, 225.00, 0.8150);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 'Gas Giant', false, true, 4333.00, 317.8000);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 'Gas Giant', false, true, 10759.00, 95.1600);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 2, 'Terrestrial', false, true, 11.20, 1.2700);
INSERT INTO public.planet VALUES (7, 'TRAPPIST-1e', 6, 'Terrestrial', false, true, 6.10, 0.7720);
INSERT INTO public.planet VALUES (8, 'TRAPPIST-1f', 6, 'Terrestrial', false, true, 9.20, 0.9340);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1g', 6, 'Terrestrial', false, true, 12.40, 1.1480);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 5, 'Super-Earth', false, true, 384.80, 5.0000);
INSERT INTO public.planet VALUES (11, '51 Pegasi b', 7, 'Hot Jupiter', false, true, 4.23, 150.0000);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 7, 'Hot Jupiter', false, true, 3.52, 219.0000);
INSERT INTO public.planet VALUES (13, 'GJ 1214 b', 3, 'Ocean planet', false, true, 1.58, 6.5500);
INSERT INTO public.planet VALUES (14, 'PSR B1257+12 A', 4, 'Pulsar planet', false, true, 25.26, 0.0200);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.0000, true, 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5.5Ve', 0.1221, true, 4850);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 'A1V', 2.0630, false, 242);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'M1-M2Ia-Iab', 16.5000, false, 10);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A0Va', 2.1350, true, 455);
INSERT INTO public.star VALUES (6, 'TRAPPIST-1', 1, 'M8V', 0.0890, true, 7600);
INSERT INTO public.star VALUES (7, 'Andromeda V1', 2, 'F8V', 1.1200, true, 6200);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

