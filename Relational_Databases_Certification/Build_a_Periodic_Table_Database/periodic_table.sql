--
-- PostgreSQL database dump for periodic_table
--

-- Drop and recreate the database
DROP DATABASE IF EXISTS periodic_table;
CREATE DATABASE periodic_table WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
ALTER DATABASE periodic_table OWNER TO freecodecamp;

\connect periodic_table

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

-- ==========================================
-- Table: elements
-- ==========================================
CREATE TABLE public.elements (
    atomic_number integer NOT NULL,
    symbol character varying(2) NOT NULL,
    name character varying(40) NOT NULL
);
ALTER TABLE public.elements OWNER TO freecodecamp;

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (atomic_number);

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_symbol_key UNIQUE (symbol);

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_name_key UNIQUE (name);


-- ==========================================
-- Table: types
-- ==========================================
CREATE TABLE public.types (
    type_id integer NOT NULL,
    type character varying(20) NOT NULL
);
ALTER TABLE public.types OWNER TO freecodecamp;

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


-- ==========================================
-- Table: properties
-- ==========================================
CREATE TABLE public.properties (
    atomic_number integer NOT NULL,
    atomic_mass decimal NOT NULL,
    melting_point_celsius decimal NOT NULL,
    boiling_point_celsius decimal NOT NULL,
    type_id integer NOT NULL
);
ALTER TABLE public.properties OWNER TO freecodecamp;

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (atomic_number);

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_atomic_number_fkey FOREIGN KEY (atomic_number) REFERENCES public.elements(atomic_number);

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(type_id);


-- ==========================================
-- Data: types
-- ==========================================
INSERT INTO public.types (type_id, type) VALUES (1, 'nonmetal');
INSERT INTO public.types (type_id, type) VALUES (2, 'metal');
INSERT INTO public.types (type_id, type) VALUES (3, 'metalloid');


-- ==========================================
-- Data: elements
-- ==========================================
INSERT INTO public.elements (atomic_number, symbol, name) VALUES (1, 'H', 'Hydrogen');
INSERT INTO public.elements (atomic_number, symbol, name) VALUES (2, 'He', 'Helium');
INSERT INTO public.elements (atomic_number, symbol, name) VALUES (3, 'Li', 'Lithium');
INSERT INTO public.elements (atomic_number, symbol, name) VALUES (4, 'Be', 'Beryllium');
INSERT INTO public.elements (atomic_number, symbol, name) VALUES (5, 'B', 'Boron');
INSERT INTO public.elements (atomic_number, symbol, name) VALUES (6, 'C', 'Carbon');
INSERT INTO public.elements (atomic_number, symbol, name) VALUES (7, 'N', 'Nitrogen');
INSERT INTO public.elements (atomic_number, symbol, name) VALUES (8, 'O', 'Oxygen');
INSERT INTO public.elements (atomic_number, symbol, name) VALUES (9, 'F', 'Fluorine');
INSERT INTO public.elements (atomic_number, symbol, name) VALUES (10, 'Ne', 'Neon');


-- ==========================================
-- Data: properties
-- ==========================================
INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (1,  1.008,   -259.1, -252.9, 1);
INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (2,  4.0026,  -272.2, -269,   1);
INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (3,  6.94,     180.5,  1342,   2);
INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (4,  9.0122,  1287,    2470,   2);
INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (5,  10.81,   2075,    4000,   3);
INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (6,  12.011,  3550,    4027,   1);
INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (7,  14.007,  -210.1, -195.8,  1);
INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (8,  15.999,  -218.3, -182.9,  1);
INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (9,  18.998,  -220,   -188.1,  1);
INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (10, 20.18,   -248.6, -246.1,  1);
-- Database dump for periodic table
