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
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    galaxy_type_id integer,
    age_millions_of_years integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO postgres;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO postgres;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    planet_id integer NOT NULL,
    orbit_days integer NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    star_id integer NOT NULL,
    age_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 1, 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy', 1, 10000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A nearby spiral galaxy', 1, 12000, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A giant elliptical galaxy', 2, 13000, true);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'A dwarf irregular galaxy', 3, 13000, true);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'A nearby dwarf galaxy', 3, 7000, true);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'A galaxy with spiral arms');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'A rounded galaxy with little gas');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'A galaxy with no regular shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths natural satellite', 3, 27, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A small moon of Mars', 4, 1, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 'A small moon of Mars', 4, 3, true);
INSERT INTO public.moon VALUES (4, 'Io', 'A volcanic moon of Jupiter', 5, 2, true);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon of Jupiter', 5, 4, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System', 5, 7, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter', 5, 17, true);
INSERT INTO public.moon VALUES (8, 'Titan', 'A large moon of Saturn', 6, 16, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'An icy moon of Saturn', 6, 1, true);
INSERT INTO public.moon VALUES (10, 'Rhea', 'A moon of Saturn', 6, 5, true);
INSERT INTO public.moon VALUES (11, 'Iapetus', 'A distant moon of Saturn', 6, 79, true);
INSERT INTO public.moon VALUES (12, 'Dione', 'A moon of Saturn', 6, 3, true);
INSERT INTO public.moon VALUES (13, 'Tethys', 'A small icy moon of Saturn', 6, 2, true);
INSERT INTO public.moon VALUES (14, 'Mimas', 'A small moon with a huge crater', 6, 1, true);
INSERT INTO public.moon VALUES (15, 'Titania', 'The largest moon of Uranus', 7, 9, true);
INSERT INTO public.moon VALUES (16, 'Oberon', 'A moon of Uranus', 7, 13, true);
INSERT INTO public.moon VALUES (17, 'Ariel', 'A moon of Uranus', 7, 3, true);
INSERT INTO public.moon VALUES (18, 'Miranda', 'A small moon of Uranus', 7, 1, true);
INSERT INTO public.moon VALUES (19, 'Triton', 'The largest moon of Neptune', 8, 6, true);
INSERT INTO public.moon VALUES (20, 'Nereid', 'A moon of Neptune', 8, 360, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in the Solar System', 1, 4500, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun', 1, 4500, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet', 1, 4540, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet', 1, 4500, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System', 1, 4600, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 'A gas giant famous for its rings', 1, 4500, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a tilted axis', 1, 4500, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest known major planet', 1, 4500, false, true);
INSERT INTO public.planet VALUES (9, 'Aurora', 'A fictional planet around Sirius', 2, 2000, false, true);
INSERT INTO public.planet VALUES (10, 'Titania Prime', 'A fictional planet around Betelgeuse', 3, 500, false, true);
INSERT INTO public.planet VALUES (11, 'Centauri Prime', 'A fictional planet around Proxima Centauri', 4, 3000, false, true);
INSERT INTO public.planet VALUES (12, 'Vega Prime', 'A fictional planet around Vega', 6, 4000, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system', 1, 1.00, true);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', 1, 2.02, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A famous red supergiant', 1, 16.50, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'The closest known star to the Sun', 1, 0.12, true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'A star in the Alpha Centauri system', 1, 1.10, true);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the constellation Lyra', 2, 2.14, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: TABLE galaxy; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.galaxy TO freecodecamp;


--
-- Name: SEQUENCE galaxy_galaxy_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.galaxy_galaxy_id_seq TO freecodecamp;


--
-- Name: TABLE galaxy_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.galaxy_type TO freecodecamp;


--
-- Name: SEQUENCE galaxy_type_galaxy_type_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.galaxy_type_galaxy_type_id_seq TO freecodecamp;


--
-- Name: TABLE moon; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.moon TO freecodecamp;


--
-- Name: SEQUENCE moon_moon_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.moon_moon_id_seq TO freecodecamp;


--
-- Name: TABLE planet; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.planet TO freecodecamp;


--
-- Name: SEQUENCE planet_planet_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.planet_planet_id_seq TO freecodecamp;


--
-- Name: TABLE star; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.star TO freecodecamp;


--
-- Name: SEQUENCE star_star_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.star_star_id_seq TO freecodecamp;


--
-- PostgreSQL database dump complete
--