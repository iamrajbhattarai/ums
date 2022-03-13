--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

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
-- Name: postgis; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: utilities_boundary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_boundary (
    id bigint NOT NULL,
    area double precision NOT NULL,
    name character varying(50) NOT NULL,
    geom public.geometry(MultiPolygon,4326) NOT NULL
);


ALTER TABLE public.utilities_boundary OWNER TO postgres;

--
-- Name: utilities_boundary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_boundary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_boundary_id_seq OWNER TO postgres;

--
-- Name: utilities_boundary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_boundary_id_seq OWNED BY public.utilities_boundary.id;


--
-- Name: utilities_building; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_building (
    id bigint NOT NULL,
    block character varying(50) NOT NULL,
    names character varying(150) NOT NULL,
    area double precision NOT NULL,
    geom public.geometry(MultiPolygon,4326) NOT NULL
);


ALTER TABLE public.utilities_building OWNER TO postgres;

--
-- Name: utilities_building_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_building_id_seq OWNER TO postgres;

--
-- Name: utilities_building_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_building_id_seq OWNED BY public.utilities_building.id;


--
-- Name: utilities_drainage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_drainage (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    geom public.geometry(MultiLineString,4326) NOT NULL
);


ALTER TABLE public.utilities_drainage OWNER TO postgres;

--
-- Name: utilities_drainage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_drainage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_drainage_id_seq OWNER TO postgres;

--
-- Name: utilities_drainage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_drainage_id_seq OWNED BY public.utilities_drainage.id;


--
-- Name: utilities_electricpole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_electricpole (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    geom public.geometry(Point,4326) NOT NULL
);


ALTER TABLE public.utilities_electricpole OWNER TO postgres;

--
-- Name: utilities_electricpole_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_electricpole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_electricpole_id_seq OWNER TO postgres;

--
-- Name: utilities_electricpole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_electricpole_id_seq OWNED BY public.utilities_electricpole.id;


--
-- Name: utilities_fountain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_fountain (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    geom public.geometry(MultiPolygon,4326) NOT NULL
);


ALTER TABLE public.utilities_fountain OWNER TO postgres;

--
-- Name: utilities_fountain_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_fountain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_fountain_id_seq OWNER TO postgres;

--
-- Name: utilities_fountain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_fountain_id_seq OWNED BY public.utilities_fountain.id;


--
-- Name: utilities_ground; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_ground (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    area double precision NOT NULL,
    geom public.geometry(MultiPolygon,4326) NOT NULL
);


ALTER TABLE public.utilities_ground OWNER TO postgres;

--
-- Name: utilities_ground_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_ground_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_ground_id_seq OWNER TO postgres;

--
-- Name: utilities_ground_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_ground_id_seq OWNED BY public.utilities_ground.id;


--
-- Name: utilities_road; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_road (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    geom public.geometry(Polygon,4326) NOT NULL
);


ALTER TABLE public.utilities_road OWNER TO postgres;

--
-- Name: utilities_road_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_road_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_road_id_seq OWNER TO postgres;

--
-- Name: utilities_road_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_road_id_seq OWNED BY public.utilities_road.id;


--
-- Name: utilities_septictank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_septictank (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    area double precision NOT NULL,
    geom public.geometry(MultiPolygon,4326) NOT NULL
);


ALTER TABLE public.utilities_septictank OWNER TO postgres;

--
-- Name: utilities_septictank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_septictank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_septictank_id_seq OWNER TO postgres;

--
-- Name: utilities_septictank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_septictank_id_seq OWNED BY public.utilities_septictank.id;


--
-- Name: utilities_sewerline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_sewerline (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    geom public.geometry(MultiLineString,4326) NOT NULL
);


ALTER TABLE public.utilities_sewerline OWNER TO postgres;

--
-- Name: utilities_sewerline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_sewerline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_sewerline_id_seq OWNER TO postgres;

--
-- Name: utilities_sewerline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_sewerline_id_seq OWNED BY public.utilities_sewerline.id;


--
-- Name: utilities_streetlamp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_streetlamp (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    geom public.geometry(Point,4326) NOT NULL
);


ALTER TABLE public.utilities_streetlamp OWNER TO postgres;

--
-- Name: utilities_streetlamp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_streetlamp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_streetlamp_id_seq OWNER TO postgres;

--
-- Name: utilities_streetlamp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_streetlamp_id_seq OWNED BY public.utilities_streetlamp.id;


--
-- Name: utilities_transmissionline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_transmissionline (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    geom public.geometry(MultiLineString,4326) NOT NULL
);


ALTER TABLE public.utilities_transmissionline OWNER TO postgres;

--
-- Name: utilities_transmissionline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_transmissionline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_transmissionline_id_seq OWNER TO postgres;

--
-- Name: utilities_transmissionline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_transmissionline_id_seq OWNED BY public.utilities_transmissionline.id;


--
-- Name: utilities_waterbody; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilities_waterbody (
    id bigint NOT NULL,
    wbtype character varying(100) NOT NULL,
    area double precision NOT NULL,
    geom public.geometry(MultiPolygon,4326) NOT NULL
);


ALTER TABLE public.utilities_waterbody OWNER TO postgres;

--
-- Name: utilities_waterbody_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilities_waterbody_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilities_waterbody_id_seq OWNER TO postgres;

--
-- Name: utilities_waterbody_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilities_waterbody_id_seq OWNED BY public.utilities_waterbody.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: utilities_boundary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_boundary ALTER COLUMN id SET DEFAULT nextval('public.utilities_boundary_id_seq'::regclass);


--
-- Name: utilities_building id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_building ALTER COLUMN id SET DEFAULT nextval('public.utilities_building_id_seq'::regclass);


--
-- Name: utilities_drainage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_drainage ALTER COLUMN id SET DEFAULT nextval('public.utilities_drainage_id_seq'::regclass);


--
-- Name: utilities_electricpole id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_electricpole ALTER COLUMN id SET DEFAULT nextval('public.utilities_electricpole_id_seq'::regclass);


--
-- Name: utilities_fountain id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_fountain ALTER COLUMN id SET DEFAULT nextval('public.utilities_fountain_id_seq'::regclass);


--
-- Name: utilities_ground id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_ground ALTER COLUMN id SET DEFAULT nextval('public.utilities_ground_id_seq'::regclass);


--
-- Name: utilities_road id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_road ALTER COLUMN id SET DEFAULT nextval('public.utilities_road_id_seq'::regclass);


--
-- Name: utilities_septictank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_septictank ALTER COLUMN id SET DEFAULT nextval('public.utilities_septictank_id_seq'::regclass);


--
-- Name: utilities_sewerline id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_sewerline ALTER COLUMN id SET DEFAULT nextval('public.utilities_sewerline_id_seq'::regclass);


--
-- Name: utilities_streetlamp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_streetlamp ALTER COLUMN id SET DEFAULT nextval('public.utilities_streetlamp_id_seq'::regclass);


--
-- Name: utilities_transmissionline id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_transmissionline ALTER COLUMN id SET DEFAULT nextval('public.utilities_transmissionline_id_seq'::regclass);


--
-- Name: utilities_waterbody id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_waterbody ALTER COLUMN id SET DEFAULT nextval('public.utilities_waterbody_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add building	7	add_building
26	Can change building	7	change_building
27	Can delete building	7	delete_building
28	Can view building	7	view_building
29	Can add boundary	8	add_boundary
30	Can change boundary	8	change_boundary
31	Can delete boundary	8	delete_boundary
32	Can view boundary	8	view_boundary
33	Can add road	9	add_road
34	Can change road	9	change_road
35	Can delete road	9	delete_road
36	Can view road	9	view_road
37	Can add ground	10	add_ground
38	Can change ground	10	change_ground
39	Can delete ground	10	delete_ground
40	Can view ground	10	view_ground
41	Can add fountain	11	add_fountain
42	Can change fountain	11	change_fountain
43	Can delete fountain	11	delete_fountain
44	Can view fountain	11	view_fountain
45	Can add septic tank	12	add_septictank
46	Can change septic tank	12	change_septictank
47	Can delete septic tank	12	delete_septictank
48	Can view septic tank	12	view_septictank
49	Can add water body	13	add_waterbody
50	Can change water body	13	change_waterbody
51	Can delete water body	13	delete_waterbody
52	Can view water body	13	view_waterbody
53	Can add drainage	14	add_drainage
54	Can change drainage	14	change_drainage
55	Can delete drainage	14	delete_drainage
56	Can view drainage	14	view_drainage
57	Can add sewerline	15	add_sewerline
58	Can change sewerline	15	change_sewerline
59	Can delete sewerline	15	delete_sewerline
60	Can view sewerline	15	view_sewerline
61	Can add transmission line	16	add_transmissionline
62	Can change transmission line	16	change_transmissionline
63	Can delete transmission line	16	delete_transmissionline
64	Can view transmission line	16	view_transmissionline
65	Can add street lamp	17	add_streetlamp
66	Can change street lamp	17	change_streetlamp
67	Can delete street lamp	17	delete_streetlamp
68	Can view street lamp	17	view_streetlamp
69	Can add electric pole	18	add_electricpole
70	Can change electric pole	18	change_electricpole
71	Can delete electric pole	18	delete_electricpole
72	Can view electric pole	18	view_electricpole
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$ROrrgjuTjtKH2C9NkhfFHA$sYRsjQVBXUQ7bkEd/kpR43R4SYgZ2oa6IdBMSk5ebYA=	2022-03-13 05:53:06.050307+00	t	admin			raj.naxa@gmail.com	t	t	2022-03-13 05:36:43.813809+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	utilities	building
8	utilities	boundary
9	utilities	road
10	utilities	ground
11	utilities	fountain
12	utilities	septictank
13	utilities	waterbody
14	utilities	drainage
15	utilities	sewerline
16	utilities	transmissionline
17	utilities	streetlamp
18	utilities	electricpole
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-13 05:33:53.850834+00
2	auth	0001_initial	2022-03-13 05:33:54.024936+00
3	admin	0001_initial	2022-03-13 05:33:54.071049+00
4	admin	0002_logentry_remove_auto_add	2022-03-13 05:33:54.083155+00
5	admin	0003_logentry_add_action_flag_choices	2022-03-13 05:33:54.098995+00
6	contenttypes	0002_remove_content_type_name	2022-03-13 05:33:54.123831+00
7	auth	0002_alter_permission_name_max_length	2022-03-13 05:33:54.138948+00
8	auth	0003_alter_user_email_max_length	2022-03-13 05:33:54.152081+00
9	auth	0004_alter_user_username_opts	2022-03-13 05:33:54.165773+00
10	auth	0005_alter_user_last_login_null	2022-03-13 05:33:54.18083+00
11	auth	0006_require_contenttypes_0002	2022-03-13 05:33:54.1861+00
12	auth	0007_alter_validators_add_error_messages	2022-03-13 05:33:54.202254+00
13	auth	0008_alter_user_username_max_length	2022-03-13 05:33:54.227967+00
14	auth	0009_alter_user_last_name_max_length	2022-03-13 05:33:54.243243+00
15	auth	0010_alter_group_name_max_length	2022-03-13 05:33:54.26173+00
16	auth	0011_update_proxy_permissions	2022-03-13 05:33:54.278153+00
17	auth	0012_alter_user_first_name_max_length	2022-03-13 05:33:54.293935+00
18	sessions	0001_initial	2022-03-13 05:33:54.331005+00
19	utilities	0001_initial	2022-03-13 05:33:54.358145+00
20	utilities	0002_delete_buildings	2022-03-13 05:33:54.365641+00
21	utilities	0003_initial	2022-03-13 05:33:54.390917+00
22	utilities	0004_rename_name_building_names	2022-03-13 05:33:54.398025+00
23	utilities	0005_alter_building_geom	2022-03-13 05:33:54.420296+00
24	utilities	0006_delete_building	2022-03-13 05:33:54.427217+00
25	utilities	0007_initial	2022-03-13 05:33:54.452708+00
26	utilities	0008_boundary	2022-03-13 05:33:54.476856+00
27	utilities	0009_road	2022-03-13 05:33:54.502128+00
28	utilities	0010_ground	2022-03-13 05:33:54.528709+00
29	utilities	0011_fountain	2022-03-13 05:33:54.553691+00
30	utilities	0012_septictank	2022-03-13 05:33:54.57837+00
31	utilities	0013_waterbody	2022-03-13 05:33:54.604297+00
32	utilities	0014_drainage	2022-03-13 05:33:54.629695+00
33	utilities	0015_sewerline_alter_drainage_geom	2022-03-13 05:33:54.670699+00
34	utilities	0016_alter_sewerline_geom	2022-03-13 05:33:54.692063+00
35	utilities	0017_transmissionline	2022-03-13 05:33:54.719297+00
36	utilities	0018_streetlamp	2022-03-13 05:33:54.746018+00
37	utilities	0019_electricpole	2022-03-13 05:33:54.771663+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
872o43hbd9jime5a9132rf9fxpuz05de	.eJxVjDsOwjAQBe_iGln-O1DS5wzWrr2LA8iR4qRC3B0ipYD2zcx7iQTbWtPWaUlTERehxel3Q8gPajsod2i3Wea5rcuEclfkQbsc50LP6-H-HVTo9VtbBdFZ5zQYMJFBxWxLyeTJFhqUVo4B2WmMxgweOSJx0OfASrMPwYr3B-SbN-0:1nTHAA:PF6wlPcdzwBIr9k-JLyEgsO2K8B3aUXbFvNRC5Ur7rA	2022-03-27 05:53:06.058476+00
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: utilities_boundary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_boundary (id, area, name, geom) FROM stdin;
1	156647	Boundary	0106000020E6100000010000000103000000010000000E010000AE532EB972625540FA4FF227E09E3B4035D403B07262554061F262FFDF9E3B40EE68C86973625540DF7A77F1DD9E3B403B62D675736255403F33E3CEDD9E3B407439054E72625540E647CDB1D89E3B40BC5375767262554057C4DA13D89E3B405D9A00637462554010BA79B7CE9E3B4090C46D2677625540C54A2E99CF9E3B40D638C12A776255405489BFEBCA9E3B40B6B17CC77D625540C2C49559D09E3B407ACE64C07E62554012432C32CD9E3B408B707C557F6255408C200AA4CC9E3B404B14A3D57F62554032DF6511CC9E3B4045BEEE448162554073777B77C99E3B40A95A3984816255400E9A201EC99E3B40CD524B4982625540DD467CB6C89E3B406F0083E583625540F47C5083C79E3B40540116428562554049EA164BC39E3B40662A0C6A8662554021EC5491BE9E3B401F83CFCD8662554027EABB57BD9E3B4049DD43D0866255402F11B54ABD9E3B40DB3860168762554078D985B1BD9E3B40726FC56488625540A6A536B8BC9E3B400344F9F688625540F74CA47ABD9E3B40B800A9618A625540F04CC2B2B59E3B40664A86E58A6255408E8071AEB29E3B4023CB1ABD8B6255407CF89154B09E3B4084C6592B8C62554092812748AF9E3B409EDC07DF8C625540F89AF397AC9E3B407758D1F98D625540F70DCCDAAB9E3B403B38BE738F625540559F53B2A69E3B40A0EF974190625540CC1094F4A19E3B40ECB187749062554001CBE4A49F9E3B40424B5E9090625540D86385619E9E3B4039CA081192625540AE0B3DBE909E3B40B927BB499262554007A4FE278B9E3B40E5BB3606936255408DB5861D869E3B4006570E3C93625540871CE066829E3B4025A22458936255405F3537297F9E3B40C7AB514893625540613A9397779E3B40DD7AD46593625540B53C0DE36A9E3B406A4985C193625540E4F7219A679E3B40E128345D93625540A50B2994629E3B406EA6B09B926255403C719032619E3B4040D4F96B936255402D16FF3D4B9E3B40ED035159936255406BB6D1AA3E9E3B405F90CDF9936255407D9786C13E9E3B40CCBFE7639462554053A589C1389E3B401C27E00E956255407C1B3D9A2F9E3B404D868A3C956255405FB70DB32D9E3B4095AF0ADE95625540B5C64A9C2A9E3B40CDCA6A12966255403200FED5289E3B40FAF19C2396625540E9C42079259E3B4005A229A596625540434089191F9E3B40BBC65DDB96625540B8A751511C9E3B40B543D20F9762554090A5B2A41A9E3B40A997C2D697625540B358D07E159E3B40E4C294BD9862554039BFDD30119E3B40C1A39562996255407063531E0E9E3B402E01ED8F99625540ACC038600C9E3B40FF95F1C899625540E1F2AAF50A9E3B40FF38711D9A62554056532836099E3B4066E840B69A625540FE673AEC069E3B40814CE10C9B6255409E5D124E059E3B409AEA3B5B9862554085DE327A029E3B4098359D9F9862554002A26BEFFE9D3B401386BBAB986255401F98C308FD9D3B4035E3C49E9862554003321722FB9D3B40841AFC9E9762554073A1BDF0F29D3B409E466D59966255408AEEB9F5F59D3B409814D6E695625540557132BCF69D3B40865771F7946255406C0973FAF59D3B406933C8329462554097E8AAFBED9D3B4080E1FADA956255403374A8A4EA9D3B40CB19EE6C95625540AEBF8216E89D3B403D904D199562554025F8F1BFE69D3B4045014B3F94625540AE8C0B5DE49D3B40CCCBB4CF93625540228E3774E49D3B40D0966E4293625540B8123964E49D3B40FF7FA36192625540E5ADD1E8E49D3B4075D5EF2D926255408015EA7AE59D3B4008433D23926255402DD3D872E59D3B4082014AEB91625540418D949FE69D3B409C69CBC1916255405DADBFF2E79D3B40AAD88DE89162554047F68E7DE99D3B404FB2CD0F926255402DAD9A0BEB9D3B40A8B6407592625540964C2887EE9D3B40F232A0B18F62554038EE17C7F29D3B401743B1039062554032B6D14AF69D3B40CBD2B62C8D625540F2F069D6F99D3B40273EE1B58C6255405201993CFA9D3B40FD5A0C348C625540798884A1FA9D3B40ABC299328A625540CDD4FFEEFB9D3B407919D52A8A625540D4F718A7FB9D3B4050D63C8288625540BAD077D4F29D3B40A1173CB98962554018315FA0EE9D3B40E6FA803E8962554065445A8BED9D3B405C7673C1876255405F954771ED9D3B409C5A71D28662554018472935ED9D3B4002B89F4185625540A397C910ED9D3B40970CAA1A8462554083962E1AEF9D3B4025739BAE816255403A518855F49D3B40C501BCD97F6255400836E5E7F89D3B40987A73B57E6255406D90CA9FFF9D3B40818DD21C7D625540A7CFDA2E089E3B40955DD8257D6255400D92DE9B0A9E3B40BC1948BF7B625540A29BC659109E3B40521C1EB17A62554004A6EA09179E3B40C1BAA99A7A625540E82DA717189E3B40CB925F9F77625540A5E58CF9109E3B40C08314E67562554087EC9047139E3B40E70E4C287462554063D96A53129E3B402B4FDCCF71625540375617F00F9E3B40CBED10886E6255401ED51F380D9E3B40A290B6686C62554049E78973089E3B4089BB52266A625540A62F8D6D019E3B407F64742768625540372AA5BDFB9D3B40A82264D76362554033D7FCABF89D3B4007A47BD5636255406C0B7F55F59D3B40C1898FEE6262554085E25285F59D3B40D148891860625540D01380A8F79D3B401972B6FB5D6255404A53EAE5F29D3B402AFBC3FF5A62554015B5E934EF9D3B409A87C56F5B625540CB3D08ECF39D3B405D97DEA65A625540BB1242D4F49D3B40C7F87C925A625540BC7CC6F2F49D3B408795EDCF5862554058993AD6F69D3B40F1FBE3D256625540FE2A049EF09D3B40A8EE2F285562554067B9B519ED9D3B4043C5C3A253625540175657FEF19D3B40111B451E54625540E4790F74F39D3B406F3671A25462554010EFEE17F49D3B4031AE358D55625540E63C1CD6F69D3B400C68DB4D55625540D8E3F248F79D3B40D7620B745462554036BABB41F89D3B4032CD014653625540853B6421FA9D3B407B86B47A51625540A0274030FC9D3B403E150ADF4F6255400ADE21B2FE9D3B40A3BE3E154E6255403631BE20FB9D3B406D8370DC4D625540AADED26BF99D3B4043C02A1A4D625540709EAC66F99D3B40DA29CB0E4D62554039497E6DF99D3B40FA5B6AC24B62554008E8D572F79D3B4059EFD4FF4A625540994D6216F79D3B40DACEC3B74A625540D4AC02A2F09D3B40CD69EC47496255409FEB7ECDF19D3B40126420AB486255405510490AF19D3B40989A295848625540A1E6B872F09D3B40CC787A33476255406EF2DC5CEC9D3B404EDEB24F46625540E16D06E9EC9D3B40C2BD023D466255406C8D6E14ED9D3B40871D0D2C4662554035013961ED9D3B4087D6C71A46625540BFB4F497EE9D3B40518FFAC845625540A192B823EF9D3B404E185B9F456255406B730C22EF9D3B400DB31DA044625540FEF6667AEE9D3B40C9431D8643625540E00F77EFED9D3B4038CB6AFB41625540DF652B36ED9D3B406F1C7F653E625540BB948A70EB9D3B40854192FE3D625540C91DC831EB9D3B40B950C9F23D62554093176B79E99D3B404F52A7B43D625540DDED5EDDE39D3B40F1C93C9C3D62554009D7D5AAE39D3B40E270BB833D62554073327899E39D3B40A86F97903C6255403044B40DE39D3B407B04FE093B6255409ADA2F36E29D3B40B76E759A3A625540A9FDB4E2E19D3B40BB2B747D3A625540033EAB1DE19D3B40B2F24A7C3A6255409E4EEB57E09D3B40A4293B9F3A625540D40D10B4DE9D3B40F89B71713A6255406C1BD092DC9D3B4013D6956039625540447F0586D09D3B40A185260C35625540E998619AD19D3B40E22EF2A1356255407D02D7A8DA9D3B40F0043EAD35625540A763F19ADB9D3B40A4C7B9B235625540557530C6DC9D3B408AB78F81356255402E51171FDE9D3B40A7C33AA0336255403DA8D9E1E99D3B40A362561E33625540C638617EEC9D3B404CE8A28D326255402F5A92A9EF9D3B406569E14D32625540FEDE6538F39D3B4031009D8A33625540AFFABFA5F99D3B405078540934625540AD72DBD2FB9D3B4081C30FF334625540D097D732009E3B409AEC5430356255404DC0F005029E3B400464CA5935625540718B71FD039E3B40BD8D1C253662554099AD1398129E3B40F14CE45936625540D5B55FC9159E3B40D69C2F8736625540F9127081179E3B405A7D80A83662554021BF3670189E3B409CA088C73662554008414D20199E3B40CA9835C437625540C787D94D1D9E3B40E931B8D438625540C6E1C27C219E3B40BFA39B0C39625540BFD25A61229E3B40CEE2E57439625540F4EEF659249E3B40899CDBC739625540A344D8CA259E3B40E96D27233A6255405973B727279E3B4057A614643A6255400F019DE8279E3B405695808E3A625540C7051CF9279E3B40B4291E023B625540E17E6000299E3B40D17556F23C62554008C799BE2B9E3B409F593EC43F62554024A3FFD82F9E3B401F1E723C40625540DB1BEB83309E3B40264F84874062554037353AF4309E3B403A326B094162554063481FDC319E3B404AE707C641625540BF1930AC359E3B40D012CC0C426255404BD0BFC3369E3B409725DD9642625540B4D6662F389E3B40F6C7D597466255407067B9FF3F9E3B4086A9DF0F47625540B1DDFEE8409E3B40B0DA3512486255404D7D9696429E3B40921BD67249625540D3078CE7449E3B4057573ADA4A62554088B2CB49479E3B40B8CC06C24B625540EF34A801499E3B4055E8CD304D6255404C5B812B4B9E3B406D2347A44D625540E79609F14B9E3B40C75C5E154E625540D928C5E34C9E3B4084EAEE834E625540AA0BC8DC4D9E3B400F6840E64E62554011B9EE1C4F9E3B400723F63B4F6255400F107584509E3B40CC8D9BD34F62554044F42A83539E3B406D357FB7506255408ADB22BF579E3B40D3D6715C516255402186EF975A9E3B403252EAAF51625540F223954E5C9E3B408E546764536255404AED0393659E3B407CAB9E7B536255408A6A2262669E3B408EBCB480536255408BFB8458679E3B40B63F4F785362554001950E1C689E3B4036D8787951625540B423AACA7E9E3B40FFB9A579516255409507C712809E3B40D5026987516255406F431B2A819E3B409149D3FB5162554066AA1C328A9E3B400B3C7429526255400F7ADB098E9E3B40A5F79B495262554041895500919E3B40D4B04C57526255408E37686E919E3B40FCAE4EB852625540E63B05AD929E3B401B83B820536255405788CBF1939E3B4069F5CA90536255409E70255A959E3B4065D7A7385462554032615F28989E3B4091FBBD89546255401A4F7C9A999E3B4015C60A0E55625540162A22E09C9E3B40A2B7C42A5662554099D45FE4A29E3B40D4C8E58556625540B73D8D60A49E3B40C90137DE566255406A0E29A8A59E3B40119A2840576255408A7484CBA69E3B4079F12B99576255406B700DA8A79E3B407290CEA757625540601961C7A79E3B403D73380C59625540C57486E0A99E3B4094DB39E65A625540D5501B44AD9E3B40508ABECA5B625540803B8D2BAF9E3B400CCE42D45B6255400DD7594DAF9E3B40D8F918385C62554026E4E888B09E3B405A445E795D6255409A2E81BFB59E3B407590DC5B5E625540DB8A1E66BA9E3B40FC1878AC5E6255405220E6B2BB9E3B40546FC4BA5F625540603BF774BF9E3B40F51E159E6062554005AA337EC19E3B40E752CE7C616255405765A57FC39E3B4051DBE7EC61625540718FBA91C49E3B40F3A2E50165625540B5B24300CD9E3B405AEED196666255403A079D0BD29E3B40350F297367625540E72DA9A8D49E3B409478F3CB68625540056EF2EBD89E3B400E513F9E6A625540D4516FD7DC9E3B4017B36C336C6255404EC21CDFDF9E3B40F28885976D62554012E87144E29E3B406C8888CC6E62554072660900E49E3B404B5CBA3A6F62554010A19732E49E3B4040AC435B7362554087991E43E49E3B40AE532EB972625540FA4FF227E09E3B40
\.


--
-- Data for Name: utilities_building; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_building (id, block, names, area, geom) FROM stdin;
1	11	Teachers Training Block	985.482999999999947	0106000020E610000001000000010300000002000000170000002B972736706255404E2A0DE1949E3B40310E2F3E706255405145054C909E3B40229889C270625540177C7459909E3B404063D4DA70625540ACCDB251819E3B403090885770625540DC583F45819E3B407C32505E70625540234E24B07C9E3B40D53809AA6C625540EB19F6587C9E3B40CF9BD55D6C625540E8BEA1517D9E3B40DE6901596C625540053855F0809E3B4003F8A51C6C6255400E3300EC809E3B406E6A6FD56B625540167AA8E5819E3B40602061CF6B6255406E753ABE859E3B40DEF10D186C6255409FF836BF869E3B40B76313516C62554001C736C4869E3B409A6B6C4C6C625540F5E6762F8A9E3B404B673A0E6C625540C61A002B8A9E3B4056D303C76B6255400C60A8248B9E3B4054546FC16B625540413C09F98E9E3B40892B1C0A6C6255406EC005FA8F9E3B40741A84446C625540C3A324FF8F9E3B4046C67A3D6C6255404EDD3799939E3B40EEC342856C6255408799AAA1949E3B402B972736706255404E2A0DE1949E3B4005000000FB5641EF6E625540BFC87A65819E3B40FC09E2E26E625540A1AE29F38F9E3B40A6814FFD6D6255404C91C9D18F9E3B40A24011146E6255405CBD3448819E3B40FB5641EF6E625540BFC87A65819E3B40
2	12	Pharmacy Block	984.482999999999947	0106000020E61000000100000001030000000200000018000000F36FB2E5706255409980D665799E3B4017B2A7ED706255408AA9FFC1749E3B40A4A635727162554000B293C8749E3B40E3716D8C71625540086DFABD659E3B40BE39F40671625540F72E49AF659E3B4030F5720F71625540C9322A11619E3B40B29906616D625540D90309CE609E3B4065800F176D625540478442C7619E3B403E8F69106D6255403BF33D69659E3B40FAE4F1D56C625540CD3A1E62659E3B40AA42078A6C625540F0BE1F5C669E3B404B4F7E826C6255408B4A262D6A9E3B40D7ACD6CA6C62554021E477336B9E3B40C18DAB056D6255401E090C396B9E3B404E601F006D625540EB49B69F6E9E3B408D7D4AC56C6255407E24229A6E9E3B405A2EB1796C62554072C2E7926F9E3B409EA118736C62554071750D69739E3B40A39F45BB6C6255401805416E749E3B406CF58FF76C6255403E94F473749E3B401BD58AEF6C625540CD725C0F789E3B4092DA9C366D625540CE20A922799E3B403BBA0F5F6F6255402F5B034A799E3B40F36FB2E5706255409980D665799E3B4005000000363245AB6F62554048E5EEE3659E3B4086A50A8D6F6255408615CC48749E3B407BA3C8A56E625540F2022449749E3B40BCE66BCA6E62554087FA70D2659E3B40363245AB6F62554048E5EEE3659E3B40
3	10	Classroom Block	1023.48000000000002	0106000020E61000000200000001030000000100000004000000E0699282716255406E77AA95989E3B40EB30B682716255406A61AE95989E3B40306A958271625540D16E7892989E3B40E0699282716255406E77AA95989E3B4001030000000200000017000000E0699282716255406E77AA95989E3B40343372C96D625540C2AF632D989E3B406F01127B6D6255404D04E853999E3B40129ED27F6D625540C6393FC49C9E3B40973B022F6D625540015FBAF09C9E3B40214F6BF36C625540E2E584EC9D9E3B40756B66EC6C625540D5CA29BEA19E3B40A04F6A3A6D6255400B9DCC91A29E3B40F954DB746D625540BBC6469CA29E3B404D9466766D625540AD97D215A69E3B400CE040256D62554089156922A69E3B408E117CE96C62554091562325A79E3B40862D98E86C6255400CE401FBAA9E3B4005A64E2F6D6255402C9063EEAB9E3B40DB8039656D6255405151B000AC9E3B4074DB765A6D6255400BEEF79AAF9E3B407C41D4A16D62554011DD1683B09E3B406916185C71625540D9CAACDEB09E3B409E8A1B5D716255408DB2CC5EAC9E3B4004BD42F37162554071235756AC9E3B4023E6F9F971625540FFE1B7299D9E3B40B701527E716255406A1F7E1C9D9E3B40E0699282716255406E77AA95989E3B4005000000968C180970625540C0E5EA0AAA9E3B40E80349226F625540F3387C04AA9E3B40916639256F625540B962C04E9F9E3B408F519815706255405E23DE4E9F9E3B40968C180970625540C0E5EA0AAA9E3B40
4	03	Library	982.586999999999989	0106000020E61000000100000001030000000100000014000000BA5EEC7C75625540F0A026AC799E3B4013FE37FE756255408589188F7B9E3B4035D40B1D77625540015937A77B9E3B4050AC97A4776255404EEF8ADA799E3B40391E995B78625540698DEEE9799E3B400EF0569C786255403D04C1DB7A9E3B409FE02A1B7962554013A1F8F37A9E3B40E6C66E6F79625540996A20017A9E3B4040EC44C07A625540BF47731D7A9E3B402DDFE6DC7A6255400D960B34699E3B40640D31C578625540DC71FF06699E3B402776E54378625540D7B20D24679E3B40CEBBAD2F776255409D74D30C679E3B40F7F921A876625540C9DB7FD9689E3B4084719A997562554044DFBFC2689E3B40417D918675625540DE7B30FC739E3B40716CB24275625540DE15DCE2749E3B405522913F756255403F3C5ABB769E3B4041F31E8075625540BD9C79AC779E3B40BA5EEC7C75625540F0A026AC799E3B40
5	04	C.V.Raman Auditorium	875.504999999999995	0106000020E610000001000000010300000001000000120000007BC9BDCE7F62554049B28C4D959E3B4099E45887806255407D18125D959E3B40EF55B99E80625540050931D68D9E3B40D5F2F94C7F625540B16FCBB98D9E3B40DF838FD17E6255406015D1EC8B9E3B40C91B80E47E625540705536C1809E3B4045EFF25C7E625540AB86E7C67E9E3B4070C1B7B67B62554092BB89A67E9E3B405B85679A7B6255407CB81D598F9E3B40CD57A9127B6255406D467526919E3B40FE0A530F7B62554086D7431E939E3B40963FE0967B62554013DA9218959E3B40F94D46157C625540F0A93323959E3B40663C58BB7E6255407113375C959E3B40B76016437F625540E64ADF8E939E3B40C6684EC37F625540A112A799939E3B40608A71C07F6255408CCFE349959E3B407BC9BDCE7F62554049B28C4D959E3B40
6	23A	Automobile Workshop (KU-TTC)	722.825000000000045	0106000020E610000001000000010300000001000000090000006ECC3376686255402CE25312CC9E3B40A02C805A6B6255406172E349CC9E3B40984C73646B625540BB1F4C6CC69E3B404BDC8BD86B625540C0AC6EE3C49E3B40D5B724E36B625540A0ECA729BF9E3B400B3C8A736B625540E1D3FE86BD9E3B405F2B127E6B62554038C5A700B59E3B40774D3A9168625540317D14E1B49E3B406ECC3376686255402CE25312CC9E3B40
7	02	Administration	399.399000000000001	0106000020E6100000010000000103000000010000001200000010BDFE39756255400CB33FA29E9E3B40A4C3958B76625540EB874FC29E9E3B403D0AF5CD766255407F2401B89F9E3B40E93B2F087762554037CC88BD9F9E3B403BB9544D77625540F2CEABCAA09E3B40B4223DE077625540818DE2CDA09E3B40E87E5825786255409EB59DD89F9E3B4017D1D391786255406D1BEBE29F9E3B40C40CDACC78625540422A22F99E9E3B402C45AA537962554026B1EF059F9E3B40F05DA78E79625540EBAD2DF89F9E3B409D09571A7A62554013A5EC03A09E3B40EE9D73587A62554062BCB31E9F9E3B4082884B7D7A625540776F33229F9E3B4028C16F867A6255407124E04E989E3B4008A604307862554017218E1C989E3B406E406944756255409BAEAFDD979E3B4010BDFE39756255400CB33FA29E9E3B40
8	09	Geomatics Engineeering& Computer Engineerinng/Science	959.995000000000005	0106000020E610000001000000010300000002000000180000001A9390BB7C625540AAAC22CCC39E3B404FD52F9A7D625540B559F484C29E3B40D8E1E4AD7D6255404A3A0D26C39E3B409CCE0E117E625540900D3287C39E3B40C29A170D7F625540463F6E08C29E3B40F3B086357F625540C48997C4C09E3B40780A45137F6255405BECB4B9BF9E3B4068C7BCF17F62554057D2EA99BE9E3B404F53FE0F8062554047868663BF9E3B4022D7086B8062554041EA84C6BF9E3B409AEB2152816255403810AC72BE9E3B40E785E08D81625540F85A8CF4BC9E3B400B82FC7E8162554068747EF3BB9E3B4004FE016182625540A1E070A4BA9E3B40C75ECC78826255409C04CA1CB99E3B401C26E77A80625540447099FAAD9E3B40D7AEA5D97F62554068C8522AAF9E3B40E37F5E8C7F625540C0BE5978AD9E3B40597265BC7B62554032FEFBC3B39E3B40DA26E0E37B625540DC3B4A47B59E3B4087832B3A7B6255401339AA7BB69E3B40AA445D487C6255404D44855CC39E3B405F2943497C625540DB432053C39E3B401A9390BB7C625540AAAC22CCC39E3B4005000000F185C62480625540563A3B7DB79E3B4058FA63667D6255402C0BD40BBC9E3B404241AD117D625540CC9D0A2DB99E3B40E20953DB7F62554062266CC3B49E3B40F185C62480625540563A3B7DB79E3B40
9	08	Engineering Block, High Voltage and Turbine Testing Lab	932.067999999999984	0106000020E6100000010000000103000000020000001800000079B8532885625540662A9778AF9E3B404FA2CA3985625540835D8111AF9E3B4065E31C6B85625540564F9979AF9E3B40D4AEF3D585625540B6CC181EAF9E3B40441A395D866255407470A1F8AB9E3B40CFDCD842866255407A493B7EAA9E3B40EFCF3713866255403EFBF915AA9E3B400C1E6A908662554007BA6F2CA79E3B40E8C001C086625540AEED4295A79E3B40D96E4B2B876255405F6D5A3DA79E3B4055347BB687625540ADFE6D0DA49E3B406890BB9A8762554046327F97A29E3B40F64E0B6C8762554064566432A29E3B408C5BA4F487625540679FA4119F9E3B405E197CD98762554056C313B69D9E3B402AED758384625540B089999C989E3B40B014C11984625540EF65D0FA9A9E3B40F7D4CCA883625540F18C78079A9E3B4066E62976816255408AB027ECA69E3B40431FBBE6816255400F59E2DEA79E3B40213C107F816255406B0F4844AA9E3B409C980F4E846255409B8E1B73B29E3B40BB522EB6846255402BE7571AB29E3B4079B8532885625540662A9778AF9E3B4005000000CF65A7BF85625540617D8B27A19E3B404A9C482B846255404E14DB60AA9E3B405C38FF7083625540192106B3A89E3B40107496038562554036D0A78A9F9E3B40CF65A7BF85625540617D8B27A19E3B40
10	07	Single-Storied Science Block	885.211999999999989	0106000020E6100000010000000103000000020000001700000069D7A94489625540EAF64229969E3B40F5C4694A89625540821F6880929E3B403493569089625540FDC2DA85929E3B40F53366DB89625540C806888F919E3B40A95574E189625540C1DFE2B48D9E3B4085FAAA988962554053CF08AD8C9E3B40F6BD3E5C896255401F095BA98C9E3B4039D543638962554019519945899E3B40EA0FB09F89625540C1164749899E3B405E7265EA89625540AF68994C889E3B40F6343BF289625540E57DD582849E3B40A6C57FAA896255409C3C9F79839E3B407B60F36189625540C256EE70839E3B4055874B6889625540CEF1CAE57F9E3B40E78AEC1D89625540EB8E65D37E9E3B403DAF2077856255404325D748809E3B4084723970856255401672C321839E3B4081B7AAFA8462554037833825839E3B4079DEF7508562554005A0C10C959E3B4059CF1B6485625540B21C311F959E3B400C981F588662554096EB7890959E3B40D6B34AF98862554008B8351A979E3B4069D7A94489625540EAF64229969E3B4005000000FC0EECBA87625540E6CC4ACB839E3B40925CB89887625540321EEC0D929E3B4050E507BA866255404482BD12929E3B403B1B69DE8662554081958AAA839E3B40FC0EECBA87625540E6CC4ACB839E3B40
11	06	Double-Storied Science Block	893.811000000000035	0106000020E610000001000000010300000002000000180000003A9A00B08462554009A11F9B7C9E3B40F7ADC1108862554088226013789E3B404681422F8862554036F6CBA7769E3B402AF642B587625540874FA190739E3B409B8903E7876255402C9D502D739E3B4075583606886255400E3508B8719E3B40FDFC1F8787625540F24D5B876E9E3B403A928E1E87625540E44F741B6E9E3B4076219CED866255403FE77F796E9E3B400C05F9778662554089C49D856B9E3B40ED010AA98662554048D7F7276B9E3B407D6A54C98662554026141AB3699E3B40A893AB498662554019803371669E3B4041147FE1856255407071BC0B669E3B403895C7B18562554026F17768669E3B40AA987E3485625540D7A31336639E3B409833FCD2846255406CECF3DB629E3B4082E8965882625540CF56836F699E3B4081E68BED81625540DE54958B6A9E3B409C18404B826255405F5130FE6C9E3B4064F01CD881625540EBC62ADF6D9E3B4062D1BFDC836255406780490B7B9E3B407A988B4F84625540763B302B7A9E3B403A9A00B08462554009A11F9B7C9E3B40060000009365AC3086625540927D722B769E3B40241E687585625540FD51537C779E3B402456F3908362554006FA0DFC6A9E3B40C8BD478E83625540884C90EE6A9E3B409E92EA5084625540E68C0277699E3B409365AC3086625540927D722B769E3B40
12	-	Turbine Testing Lab	325.418000000000006	0106000020E610000001000000010300000001000000060000003AFD55E886625540C7D1CF94B79E3B4093A0D117886255400705A922BA9E3B4011A758748B625540CBD1C7C5A69E3B4017A5193C8A6255409CB0462AA49E3B409F044DE88662554037651394B79E3B403AFD55E886625540C7D1CF94B79E3B40
13	-	High Voltage Lab	175.441000000000003	0106000020E6100000010000000103000000010000000700000011A758748B625540CBD1C7C5A69E3B4012508FA48862554080E96D85B79E3B40C1C221DA8862554008B2E2FFB79E3B405F4C30E2886255409DA221C8B79E3B40E7908B6B89625540B9AC63EAB89E3B40DA5ED63E8C625540B6D83C5DA89E3B4011A758748B625540CBD1C7C5A69E3B40
14	25	Hydraulics Lab	444.310999999999979	0106000020E61000000100000001030000000100000005000000CA1EC1CC8C625540C0CACCCE729E3B40626D5A7D8F6255406CE08C5B729E3B4055BB6F508F625540F110DA62629E3B4089F073928C625540A5097CB5629E3B40CA1EC1CC8C625540C0CACCCE729E3B40
15	34	Aquatic Ecology Centre	422.220000000000027	0106000020E6100000010000000103000000020000001A000000EFEF2A768B62554063098A63609E3B408085052F8C62554010AC73415E9E3B40582E97CE8C6255404EDA0A6F5E9E3B403ED88C568D625540B02D2EE85C9E3B40C69300678D6255408BCA46795A9E3B406D9A03F78C625540171D5E97589E3B40DEB166558C625540E07E1769589E3B4068F37EBB8B625540FED273C6559E3B401FFF3FC98B625540E1DEA069539E3B4018186E5A8B6255404EDABE8C519E3B40AECAB8AC8A625540F403974A519E3B40520A95278A62554093FC95DD529E3B4035EE78188A6255405DF1A819559E3B405C948D5E89625540657B3163579E3B409B7BA4BE886255400E49932D579E3B4025AD803988625540752192C0589E3B40C0C23829886255400743FA285B9E3B40D050EF268862554027ED7C2B5B9E3B4095A40A9888625540136FDC055D9E3B40E6A1E833896255407E0109425D9E3B40A2A318D2896255400B7A66DE5F9E3B40BD3209C18962554097143F10629E3B40AC2606318A62554049EA27F2639E3B40AAFED9DF8A625540B367C62C649E3B4081561B678B62554036F0C39D629E3B40EFEF2A768B62554063098A63609E3B400A000000BF7E45308B625540BE1EA696579E3B407CE4F4C88B625540A2F6AA1C5A9E3B402694A8BB8B6255401223E73E5C9E3B40865ACAF88A625540FE2E1B8E5E9E3B40AB89905F8A625540DFEFFB355E9E3B40C0B79D5C8A625540A4FCC1295E9E3B40E3DC99CD896255401D8DBAD85B9E3B409A43DAE1896255402717719F599E3B40E675199D8A625540E99A0158579E3B40BF7E45308B625540BE1EA696579E3B40
16	-	Shed Block	322.083000000000027	0106000020E610000001000000010300000001000000050000002908B398876255409D3D85CE519E3B400EBE1AA38862554095347CDC529E3B40E9B950DE8A62554037877BA7369E3B40E4FC96D5896255407D550E98359E3B402908B398876255409D3D85CE519E3B40
17	-	-	105.613	0106000020E6100000010000000103000000010000000600000030F8AF308B625540AC0495B9509E3B408A58F14C8D625540FC31C770529E3B401B1BA49C8D6255408DA01BB84D9E3B406E2A45718B6255409FF65B2E4C9E3B40AC3D79328B62554038759B9B509E3B4030F8AF308B625540AC0495B9509E3B40
18	-	-	166.683999999999997	0106000020E61000000100000001030000000100000008000000C12966BB8A62554048CD0306479E3B40258E9A4F8B625540F9A45C4C479E3B40BF4A77338B625540DEBDE24C4B9E3B4085E307318D625540CDF1F2F34B9E3B409F77636C8D625540AC2394A1459E3B40BEE3F3718D625540B3A348DA449E3B402DFC3DD28A625540ED26ABF5439E3B40C12966BB8A62554048CD0306479E3B40
19	35	Tissue Culture Lab and Green House	115.067999999999998	0106000020E610000001000000010300000001000000060000007AFC67E58B6255402D09D80A439E3B406D01B5EE8C62554089452E7A439E3B405B81EE4D8D62554012F32494389E3B40DCC8134A8C62554019CFD115389E3B400048A3E98B6255401F5B6E06439E3B407AFC67E58B6255402D09D80A439E3B40
20	17	Girls Hostel	860.988000000000056	0106000020E6100000010000000103000000020000000D000000AD15CB7E866255402F1BC717449E3B4077CE00A68762554030D77420409E3B402EB14AAC87625540CC3025953D9E3B4042FB041B886255407C9D2E1B3C9E3B40B7DF112988625540B420878E319E3B40CA315D8A87625540C59833422F9E3B409E5F58838262554037E6FEDA2E9E3B40E51726DE81625540B4B99B0B319E3B40A1E8F3C6816255402E01A2513F9E3B4043D56F6983625540D04AA966459E3B40E03D185685625540762E0E8F459E3B40DC30D0C485625540C2EF1F15449E3B40AD15CB7E866255402F1BC717449E3B400D0000005A8ACB4884625540928EDB54419E3B4012B0D9E5836255403DB8B050419E3B40EC0F30FE8262554032DE5EEB3D9E3B405949190C83625540984D1157359E3B4076CDE58F8362554082153E51359E3B40E4E6D69283625540FE2CFA80339E3B4079214C698662554012FAA7D1339E3B407119B9668662554039C5F286359E3B40758FDEE686625540EF9B5895359E3B40B0A8E1DF86625540920073803A9E3B4012D80B4F856255400B86CDCF3F9E3B40AEAF604C846255400C4502B53F9E3B405A8ACB4884625540928EDB54419E3B40
21	15	Family Staff Quarter	1058.18000000000006	0106000020E6100000010000000103000000010000004C0000003A67591F80625540DDC56026289E3B409855C5C680625540DAA975EB259E3B405D78AF17816255402754E3FA259E3B40538E13ED8162554045C695FC229E3B40836331EE81625540D74C12AC219E3B4020E0DB788262554082A8C5CF1F9E3B40784C2952846255403A6205FE1F9E3B4050EA2189846255408496BCF0209E3B407913C3328662554078777D13219E3B40194C9077866255403C44FF2B209E3B40FFE6541688625540E3E7C74C209E3B401E6DAB498862554074C5BC4B209E3B4076241494886255405BA75565219E3B4062A0D568886255406A1DC6FF219E3B40B8EBC1EF88625540C9924D02249E3B401E405E1E89625540E63E026A239E3B4081D7F3798962554066B574D0249E3B40029D7C9B896255400E35AF63249E3B403C6EC3E589625540ACE54794259E3B40D5F9517D8A62554045FF109D259E3B40D56AD27C8A62554028B34B33269E3B4078AD8BEB8A6255403C9DF83F269E3B407BE852EB8A62554095085B2C279E3B40EDDAE33F8D625540D118DD3F279E3B407AB310408D6255406E278061269E3B40FF46A6C38D6255403A12065D269E3B40382347C38D6255406068C5CE259E3B407053713E8E6255405BD8EEC5259E3B403736D18D8E625540DF1FCCAA249E3B4020FA9F968E625540E5FADE8E249E3B4093B56DB28E62554079ED31EC249E3B402D9C06E18E625540460AE857249E3B4011EAB30F8F6255406DC194AB239E3B40AD36D83B8F625540B709CE4C249E3B40B85CC4EC9062554027DA857E1E9E3B404F258FC2906255402F5E7CE01D9E3B40C563721C916255403E51BCA31C9E3B40D0AB3A05916255404C18D14D1C9E3B404CA50B6291625540C64E960F1B9E3B40CE4BB161916255406EEE1750199E3B404AF60E7F916255405BD0514B199E3B40AE26397F9162554075CCDFB3189E3B40EC44F27F9162554027817261189E3B403311812F90625540779FE65C189E3B40791F7C3090625540A2D9C053199E3B40E904CECC8F625540705DDE911A9E3B40E090ADA88F625540ED14E7FD199E3B40C109DD198F6255407F07B1D81B9E3B4019A83D468F62554083AE8F731C9E3B40D0F47BB68E62554071B7215B1E9E3B40FDD8B78C8E625540F76084BF1D9E3B40C9AFF0FC8D625540BF447FAD1F9E3B408EB42E2B8E6255403AFEB54F209E3B407C8442D38D6255403CE25EA3219E3B40940883448D6255403BBB238A219E3B40C48158448D6255404BD2F6AC209E3B402235EC828C6255404CCC6FAE209E3B40992B1C838C6255404DCD3385219E3B401387C9B58B6255405EED1A85219E3B402DBE4DB88B6255409BC8D9AC209E3B40722838F48A62554086F4FDA2209E3B40551010F38A62554028301978219E3B4021C0426C8A625540BB371F86219E3B403762972E89625540BB75F5CF1C9E3B403603E40D8962554038F6BD2E1D9E3B40ED4CBDB7886255408074980C1C9E3B40FF59CC058862554039B0B6001C9E3B40F7AD4006886255403B039FAC1B9E3B401EC36B078462554088DB4A501B9E3B40BD2662C68262554046C44F331B9E3B405EC9DBC582625540A3FC90941B9E3B401F3BA31682625540A78FA1771B9E3B40A9B898B981625540DAA1A7E01C9E3B40DD6A929A816255403F9A446D1C9E3B40783DE72F7F625540DE2F08D8249E3B403A67591F80625540DDC56026289E3B40
22	-	Faculty Project Lab	130.560000000000002	0106000020E61000000100000001030000000100000005000000123543B0906255408FCD1A546B9E3B406E527232926255409831F13F6B9E3B4062929E4D92625540191C9A15639E3B40A14160BC90625540CBB6A1D4629E3B40123543B0906255408FCD1A546B9E3B40
23	-	Chemical Lab	188.683999999999997	0106000020E610000001000000010300000001000000070000002A7E19D092625540AFBB9BC1759E3B407C0224D092625540BC29DEBA759E3B40377212FA926255401A17CEBD759E3B40A01087FF9262554007E329AA6C9E3B40B9171EF8906255409ADB45846C9E3B4000E345EE90625540AEEE1C99759E3B402A7E19D092625540AFBB9BC1759E3B40
24	-	Chemical Lab	113.149000000000001	0106000020E61000000100000001030000000100000006000000FC7E07B091625540DD54857E809E3B405E4791C99262554047926EAE809E3B40AE4146F09262554025D3DDD9769E3B4089DC52CE916255407C6597A3769E3B402A35F8AA9162554074CE4E7E809E3B40FC7E07B091625540DD54857E809E3B40
25	-	-	17.8292999999999999	0106000020E61000000100000001030000000100000006000000C7BFA6479162554060FF09C9619E3B408CA7BA06926255404EA01DE5619E3B409CAEE808926255403F7AD2875F9E3B40F31A984991625540950C257F5F9E3B403BA6DF4491625540CECAE7BE619E3B40C7BFA6479162554060FF09C9619E3B40
26	32A	Family Staff Quarter	255.175999999999988	0106000020E610000001000000010300000001000000050000005FC9BF2690625540AEBF981BF89D3B40022BE9C39162554023328D2FFE9D3B4061C2C7EF936255400693E723F79D3B40624E943E9262554053F501D3F09D3B405FC9BF2690625540AEBF981BF89D3B40
27	-	Akua	69.555800000000005	0106000020E610000001000000010300000001000000060000008DC3BA978D625540A40F6C58FA9D3B406ADA4AE18D6255407FC6B01AFD9D3B404715301C90625540B1C47337FA9D3B40065B40D98F62554023E98599F79D3B40E97FAB928D625540CD873558FA9D3B408DC3BA978D625540A40F6C58FA9D3B40
28	-	Laundary	75.9478000000000009	0106000020E61000000200000001030000000100000004000000B93B911A9A625540332844B0069E3B40A644BB1B9A6255401B924BA4069E3B4081130D1A9A6255403D3148AF069E3B40B93B911A9A625540332844B0069E3B400103000000010000000500000081130D1A9A6255403D3148AF069E3B408DE4330399625540E29CA49B049E3B40A2DB063C9862554089C99A110A9E3B400AC0C9449962554023699B210C9E3B4081130D1A9A6255403D3148AF069E3B40
29	-	Laundary	115.730999999999995	0106000020E6100000010000000103000000010000000600000071F840209662554007E4177E119E3B403A297A429762554076585E07149E3B40CF442A80986255403DC666BA0C9E3B403CE88C6397625540229E5E350A9E3B40314F021F96625540B7E77180119E3B4071F840209662554007E4177E119E3B40
30	-	-	31.5065999999999988	0106000020E6100000010000000103000000010000000B000000F7A8CB12946255408EB2466A0D9E3B40523E5B5A9462554018027DE50D9E3B406C31DB8394625540F391B8B20C9E3B40167167C194625540A04F750D0D9E3B4050B3BF3E95625540EEF454C9099E3B403DECD56495625540B5DA70A2089E3B40D1A0880D95625540C8FA9026089E3B40689A7CE794625540F9607041099E3B4074AC56AD94625540C3DAD4DE089E3B40650FCF1294625540C32145660D9E3B40F7A8CB12946255408EB2466A0D9E3B40
31	14	Exam Block	671.134999999999991	0106000020E610000001000000010300000001000000150000006AC844647D625540D61F716A179E3B402D71C7637D625540F41A42EA1B9E3B40F7096B2C7F625540A75414271C9E3B40C71FB5BF80625540E640E8AE169E3B40D4D9B5C680625540F627C5CA0E9E3B40C916A63B82625540108765F8099E3B404556045D846255404DBD4F160A9E3B40D84F2EF2856255404139EB64049E3B40585054F6856255402B19B676FC9D3B40934F0A7B85625540CE1DC2A8FA9D3B407D4CE69284625540218D5FE2FD9D3B4091BB95B78462554069E62062FE9D3B409C59DFA484625540636D9D8A029E3B409436B9C3836255405489667A059E3B404E5462A882625540D27B776E059E3B40411947258262554012322890039E3B40A5E515037F625540C07BBEA20E9E3B4090D05A797F625540CD8E7764109E3B405FF641737F6255401FAE6697149E3B40116FBF8E7E62554013450983179E3B406AC844647D625540D61F716A179E3B40
32	-	Moter-BIke Shed	103.453999999999994	0106000020E61000000100000001030000000100000006000000BE9B2D2B78625540547A6322239E3B40812AB55E79625540EF017B7F239E3B402472079779625540476B461D1B9E3B4021B97B6378625540CDE330C51A9E3B40478EC12978625540BE455627239E3B40BE9B2D2B78625540547A6322239E3B40
33	32	Family Staff Quarter	308.697000000000003	0106000020E6100000010000000103000000010000000A000000D04D682F73625540AA6C2ADF209E3B407CCF31A9746255409A7C16EF209E3B4051AC27AF746255408AE19A361F9E3B403E1259147562554091A3DE3A1F9E3B40BE6E1B1575625540E028A6FB209E3B403EB0F2CF76625540E533643E219E3B40B250BAE476625540A0349CAB189E3B40ABE4233B736255405FB6075C189E3B4021702F2D7362554027080FD7209E3B40D04D682F73625540AA6C2ADF209E3B40
34	31A	Girls Hostel	308.153999999999996	0106000020E610000002000000010300000001000000040000002C42A9696F62554052835529229E3B40912D9F6A6F6255404E00FA29229E3B408B34A06A6F6255400D4C6E29229E3B402C42A9696F62554052835529229E3B40010300000001000000110000008B34A06A6F6255400D4C6E29229E3B400D5456AD706255400293D149229E3B40EEAD7BB770625540D7A33B42229E3B40B329B2B770625540C09A2202229E3B40867E46497162554012475C10229E3B40CFAC5053716255406FD12D10229E3B40A2429B547162554074A4B281209E3B4031E1F46E71625540E3D8C976209E3B4000FFD3867162554017E845C4129E3B40BFCD7955716255408100229E129E3B4061FBF05571625540613CEB11129E3B40ACA6BF71706255400A1046F8119E3B40724A996D70625540CE4027B8129E3B4018114E3C70625540FD3A52AA129E3B40F49F9E387062554016F4E25A149E3B401EE0C2846F62554008F64847149E3B408B34A06A6F6255400D4C6E29229E3B40
35	31B	International Students' Hostel	194.602000000000004	0106000020E6100000010000000103000000010000000C00000057D61A626C6255402356677C1C9E3B403E735C206D6255409C1BDC7D1C9E3B401F8886346D625540790AA6751C9E3B403AD10B336D6255402CD320331E9E3B40600F70206E625540CBBF92531E9E3B40BEF375336E6255406A026C1E149E3B40C66798A36D6255401A965408149E3B40DE608AA16D6255401F427837129E3B40CEFD736B6C62554054732307129E3B40F0FCC95C6C6255408FEBF1F6199E3B40F5BDBC606C625540918E93761C9E3B4057D61A626C6255402356677C1C9E3B40
36	31C	Classroom and Faculty Block-SOE	296.543000000000006	0106000020E6100000010000000103000000010000000A0000003DA41E316B6255409BA660870B9E3B40D0DD68ED69625540ED09AD590B9E3B404A3054E76962554014AD36360D9E3B4052023231696255403409872A0D9E3B4021CA450C69625540F719F83A1B9E3B40E34837566A625540668A2A7C1B9E3B40CB86125F6A625540BAC18188199E3B4036B0F3096B625540A968EC96199E3B4054878A346B625540A4BB81860B9E3B403DA41E316B6255409BA660870B9E3B40
37	31D	Girls Hostel (KU-TTc)	231.399000000000001	0106000020E610000002000000010300000001000000040000002BFE4BB1676255406BB6D055059E3B40B310CBB067625540FB778654059E3B40CFDFC8B067625540A5F6C955059E3B402BFE4BB1676255406BB6D055059E3B4001030000000100000009000000CFDFC8B067625540A5F6C955059E3B405494CD586662554071541544059E3B4056CBDC5166625540CF8B9014079E3B40D82C6C8C656255408141CC03079E3B406DA2E574656255404F16C352119E3B40CFE6808E666255407F27A96C119E3B40D829EA906662554047BE9AA50F9E3B4002B3B29E67625540CB7536C40F9E3B40CFDFC8B067625540A5F6C955059E3B40
38	31E	Boys Hostel (KU-TTC)	238.306999999999988	0106000020E61000000100000001030000000100000009000000BB22714360625540852836470D9E3B40F1FFF8596162554035A4406D0D9E3B40F0A5DB5561625540F78B63170F9E3B40D009AB6C6262554090A9C32C0F9E3B401F71E48A62625540699365C2049E3B401A2AF8C56162554079B3DCA7049E3B4059AAD5C861625540A72D38DE029E3B40DEA131686062554070EDADB1029E3B40BB22714360625540852836470D9E3B40
39	-	Mess	416.411000000000001	0106000020E6100000010000000103000000010000000A000000B73FC4EE6B625540CA49D5AC399E3B40316B9BF96D6255406EFEFDE7389E3B40B0B984546D6255409FAFC5B1259E3B405FC04F426B62554099DE7B8F269E3B4032628C756B6255401784D26D2C9E3B40FA004D4A6B625540478FA2812C9E3B40251458796B62554081311DCE319E3B408F524DA96B625540C71F1BBE319E3B40020E08EF6B625540588919AB399E3B40B73FC4EE6B625540CA49D5AC399E3B40
40	-	Mess	47.7088999999999999	0106000020E6100000010000000103000000010000000B000000C6DAA6EA6D625540491C6EE5349E3B40F86EAC216E625540607CC29E399E3B40EC7FF1F56E6255401DB9334A399E3B401BA5DCC56E625540EBB7FC53339E3B40B305D06B6E625540B2BC3D6E339E3B40A638D26F6E62554092C5A701349E3B4058FD27586E6255400E37AF10349E3B404211C05C6E62554048941C9D349E3B40C949FDEA6D625540AD7E6AD4349E3B404CF708EA6D625540BA9FF9D3349E3B40C6DAA6EA6D625540491C6EE5349E3B40
41	18	Boys Hostel	959.288000000000011	0106000020E61000000100000001030000000200000015000000FFB7696459625540DE8B8F3F2B9E3B40A85D75A8596255405F0BD9592A9E3B40741A2E5A5A6255401D49DE642A9E3B40484C79D95A625540872EC8AB289E3B40651697365B625540C6C2C4B6289E3B4073C424FB5B625540C93A121B269E3B40EDFA3DFD5B625540E4451BD1249E3B405DFAF17F5C6255402619BE10239E3B40705DD4905C6255407BF0BE97189E3B40E1F29B8A5A625540E3998AED109E3B40A173949257625540D80FDEA5109E3B405E23BC6C55625540BF2DB5E4179E3B40D8F4AE57556255403FF4C872229E3B408E7AC5D055625540BE923B47249E3B4039CFEBCF5562554008595896259E3B40CA8FE98956625540EC3F4951289E3B402B747AE956625540D4440653289E3B405AB1A56357625540329891242A9E3B40259E9315586255406E691F322A9E3B40AE9FBC54586255404354B3282B9E3B40FFB7696459625540DE8B8F3F2B9E3B40130000006B37FD765B625540EEC5AF7D1A9E3B4072B349655B625540B61B2F361F9E3B40C2C7B5F45A6255405DFED3421F9E3B40A1C295FA5A625540C897E143219E3B402A80F1245B6255402D160C0C229E3B409112A0F4596255403CDB7B1A269E3B404B8B671258625540318538AF259E3B40B25C150757625540C0067799219E3B406BB2AA3857625540E1EF88BD209E3B409791F53B57625540AC6ED3D21E9E3B40B9455AC356625540CD44F7B91E9E3B40C00079C7566255406D48CAEA199E3B404BBF4A3E5862554021382429159E3B40AC2734C958625540FC3DA73A159E3B40F6319BC258625540B93C2509179E3B40ED5C588B59625540E35C9805179E3B405D5265935962554054D4743F159E3B40A87AC52E5A6255404BD5BA43159E3B406B37FD765B625540EEC5AF7D1A9E3B40
42	20	Social House	295.201000000000022	0106000020E6100000010000000103000000010000000500000059378F8A54625540E2B5E732199E3B40E4761EC9506255406171D1CD189E3B409224D7BF50625540FCFEC883209E3B40C7E1CD7854625540E7F112FB209E3B4059378F8A54625540E2B5E732199E3B40
43	36	National Technology Innovation Center-NTIC	1725.32999999999993	0106000020E6100000010000000103000000010000000F000000AED946513E6255401842E67C039E3B4063CD39553E6255406B608946069E3B407C2A8D583E625540A4140A44069E3B405B869EA0406255406F590211079E3B40D9955A9D40625540FE6181E60A9E3B4071EEB0B443625540D65D08480B9E3B40BDAF54B543625540D951BD870A9E3B405035E8F8446255409E2186DD0A9E3B4084E8FE6345625540C239571CF49D3B404A1064273C62554060EDAAD5F19D3B40138F0C083C6255408B262E4DFB9D3B40F65041243F6255402C8EBB3EFB9D3B40E6100B203F625540B995A930009E3B409B96205C3E625540078B1B51009E3B40AED946513E6255401842E67C039E3B40
44	33	Warehouse/West Wing Students Hall	904.336000000000013	0106000020E6100000010000000103000000010000000500000016854B3A37625540FC2DDBA40A9E3B409EA81A903C62554057E54C86239E3B403FDA04D13E625540566ED1631D9E3B40BE77357B39625540440C6182049E3B4016854B3A37625540FC2DDBA40A9E3B40
45	-	Guard House	129.942000000000007	0106000020E610000001000000010300000001000000060000009701C98734625540DD1C5542FB9D3B400183EDBA3562554029CDBE05019E3B40B41DCA25376255406B248B7BFD9D3B402E5CD3E43562554002426E71F79D3B409DFB6D87346255407CC49733FB9D3B409701C98734625540DD1C5542FB9D3B40
46	21	Multi Purpose Hall	2347.96000000000004	0106000020E61000000100000001030000000100000020000000CB4BAA205C625540C0A94A44989E3B409D6E65215C625540598BBC4C989E3B405E0FAA135D62554076394657989E3B40F300E7195D62554000B019AA949E3B401B598E825D62554007E6089A949E3B402A903F8A5E625540A53BC46A989E3B40B936693E5F625540AF6AA991989E3B4064948A435F625540362B8BB39A9E3B4062D846D45F6255407851A6129D9E3B40FF40F39662625540DB4942319D9E3B4062A6752663625540ED28640E9B9E3B405A66D92B63625540E0A09BAF989E3B4038014BE0636255403B793ABD989E3B405E2DA0ED646255401630D829959E3B402327335366625540E312EA32959E3B40D6362460666255408712BC30879E3B4069A694F66462554083A64432879E3B40496392F1636255401B54A55D839E3B4072C76A44636255405EC45756839E3B40743F724663625540A99B7504819E3B40C5279CB162625540F36037C67E9E3B40BF50E5D65F62554058FB537F7E9E3B40CEA872495F625540476E9DAE809E3B40F74961575F62554075CADEFB829E3B40EB2A729E5E625540173F0EEC829E3B4080FCCF905D625540770E4396869E3B40886DC3195D625540C28D9B90869E3B40F6B1CE275D62554022775C1E839E3B402C88C93B5C6255407F995AF6829E3B40666775305C6255401AAB535D869E3B4061C7971F5C625540F2829D5C869E3B40CB4BAA205C625540C0A94A44989E3B40
47	23B	Mechanical Workshop (KU-TTC)	586.409999999999968	0106000020E61000000200000001030000000100000009000000262C5EEC62625540B953AFF3BD9E3B40B2FC5ED165625540AFE5EF12BE9E3B4046FED4DB65625540F2DC9B2BB69E3B4086F0F2FF656255401E22C85AB59E3B403FE1ED0E66625540AD90D29FB19E3B402EBB7BE565625540D2E3B6C5B09E3B405113C6E565625540FF810B7BAA9E3B4033612FFC6262554039E1A87FAA9E3B40262C5EEC62625540B953AFF3BD9E3B4001030000000100000004000000D95C76E8626255402B2885F3BD9E3B40657454EC62625540E6F1A2FFBD9E3B40262C5EEC62625540B953AFF3BD9E3B40D95C76E8626255402B2885F3BD9E3B40
48	-	Electrical Control House	339.24799999999999	0106000020E6100000010000000103000000010000000C000000592495D758625540FA014AD3A39E3B407DDEB19C596255400083177CA89E3B4045AA5A255A6255406BC96E72A79E3B40F064F6295A6255401AD5A18DA79E3B401C1209F35A62554095072F70AC9E3B401ACE144F5C62554069A5B7CBA99E3B405F9CCE065A6255401BC13A019C9E3B40E1394A9D576255400A828A75A19E3B4076BC059D57625540EEE28B7FA19E3B403E28813558625540F3398916A59E3B4092FE2C7858625540DC4D9191A49E3B40592495D758625540FA014AD3A39E3B40
49	24	KU Fast Food Cafe	121.012	0106000020E61000000100000001030000000100000012000000991E1FC572625540E07E2B83529E3B405BE4F835736255407ADFD8B0549E3B40C4697C82736255404C02C3F9539E3B40AEC3F01874625540D72B62B8539E3B40907A62517462554005525FE0519E3B40548A3E70746255402C8B558E519E3B40623261F374625540FE948ECD519E3B4076C3C678756255407B779772509E3B40324441907562554008987C424E9E3B40E89FFD30756255401E91376D4C9E3B4014B9929074625540303787194C9E3B409D72820E7462554068E0BE6F4D9E3B40C3D303F9736255401EB6F74B4F9E3B404945DDD77362554010C5B3994F9E3B40E138FC4B73625540FEC3D5D64F9E3B4020823C0E7362554017DA4FC6519E3B400EDE30C572625540638BC082529E3B40991E1FC572625540E07E2B83529E3B40
50	24	KU Fast Food Cafe	252.314999999999998	0106000020E61000000100000001030000000100000020000000157DA6AC74625540C23330BE549E3B40A38C79E9746255406C38873A549E3B408E272F1D75625540014AB7C9539E3B40547EFE0A76625540E1E742C5519E3B4075BC98E575625540447210DF509E3B40F4A29908766255403395929F4D9E3B407C626BED756255403ADA901D4D9E3B403C6CFD6A756255404F9BB6AD4A9E3B40C5A7D22375625540AA4131A24A9E3B409782677D74625540A1A5F9384A9E3B40A5826C6A74625540A12AFE654A9E3B4051E808C473625540CE0A95254C9E3B40F9D934A3736255403214E47D4C9E3B405EAC014073625540546C2A8D4E9E3B40BF6D7C187362554026543A5F4F9E3B406B40300473625540D888BD13509E3B4015B4FCCA726255402E127310529E3B401609FDD172625540B2CCBC61529E3B40991E1FC572625540E07E2B83529E3B407CC857DD726255403C7EDDFA529E3B40535EC2FF72625540DA01F1A4539E3B4094C5572673625540176F9C63549E3B405BE4F835736255407ADFD8B0549E3B40887B38447362554048C3C08E549E3B40B8F9784973625540746F689A549E3B404287AF5073625540051824AC549E3B40C4FB555F73625540205D74E6549E3B40703958B17362554089FF6EBB549E3B40961F9D07746255404C3D4794549E3B40A0B1846374625540350C4669549E3B4064091E9674625540139BD04F549E3B40157DA6AC74625540C23330BE549E3B40
51	28A	Balaram Tara Energy Block For Department of Mechanical Engineering	309.684000000000026	0106000020E610000001000000010300000001000000080000005B1AAAA65F62554080B6526BB59E3B40919598246062554066A3A270B59E3B407C5FE42260625540F8D06A71B79E3B406F18ACB761625540AED27D82B79E3B40DC5DBBA961625540A1C35D2BA89E3B4081ED75A45F62554013D39225A89E3B4087BA2AA25F625540AC24226BB59E3B405B1AAAA65F62554080B6526BB59E3B40
52	28B	Lab Block For Department Of Environment Science and Engineering	337.908000000000015	0106000020E6100000010000000103000000010000000A000000A8DE5BE9906255400C351000519E3B40BA314EE9906255406D7BDE04519E3B400DA3FD7C92625540D4C46E7C519E3B4005797DF89262554060654AC3409E3B4042B78B63916255401B640C3C409E3B401EB4395B916255402C357D16429E3B404168DAD790625540766FDEDA419E3B405B677C7890625540869966D84E9E3B40D8FF2BFA90625540753AF3134F9E3B40A8DE5BE9906255400C351000519E3B40
53	01	Main Square	559.436000000000035	0106000020E61000000100000001030000000200000025000000AED020FB77625540848C1B18989E3B40115BB3FD77625540459AC593969E3B40CD97BA707A625540DD887FC8969E3B40B87F5E767A625540E992BB93969E3B40CAF56D967A625540C659F454959E3B40D19ED5E57A625540D5988C6A919E3B408A14EA117B62554022DA21DF8D9E3B409F63FC247B6255405B6FE39B8A9E3B401491182A7B625540D9848C65899E3B40D70701267B62554058CEFEFE869E3B405823A4157B6255404923F450849E3B4071566E057B625540300DAA78829E3B40AD6477E87A625540556FB262809E3B40996337C87A625540B8E4EAAF7E9E3B4009B7289D7A625540981BE2947C9E3B4072D4712579625540554E4A757C9E3B4044D8FC1B7862554091CEF75E7C9E3B402F58F220786255409D572FF6799E3B405DE9609D77625540C26D97E8799E3B40AF866F9177625540564D4F107A9E3B40F5825C8D7762554001DC4A6B7C9E3B4008BCF991756255404E734E287C9E3B408C850A6A75625540C1E0CF3D7D9E3B40D864674575625540E6837F527E9E3B40EC043D23756255408BAE28D47F9E3B404306D30E756255405930BDF2809E3B40E30B26FE74625540F3820210829E3B4005CA5AE9746255409802B88D839E3B40EC5528C874625540A57F5C99879E3B40D32200C47462554081B733F68A9E3B40CB6D4510756255407CD027BA919E3B405CAD821B75625540C9C484A2929E3B40C1673E3075625540579D88AD939E3B401E6A8A6575625540AD97EB5B969E3B403620F45377625540A55E7F85969E3B407D936151776255405750D509989E3B40AED020FB77625540848C1B18989E3B400F000000B1F5E8297A6255402317F6E77E9E3B4044A11B647A625540AC1DF278829E3B40761627817A62554088425BA5859E3B4039A0CF897A625540DA1AC4D8889E3B40EE0C96797A62554079AE070B8D9E3B40E2A067527A625540B552B454909E3B40640469027A62554046E9B289949E3B40A5F258DB756255404DEF4D30949E3B40725C64A47562554053CF2EE0909E3B40F97CCE7F75625540996277778C9E3B4002296F83756255408356FF66879E3B40379077A7756255404BD26AB5839E3B400148EACD75625540F4E081E5809E3B40F43ACD057662554019DB91677E9E3B40B1F5E8297A6255402317F6E77E9E3B40
\.


--
-- Data for Name: utilities_drainage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_drainage (id, name, geom) FROM stdin;
1	Drain	0105000020E61000000A0000000102000000350000002C785FBC66625540D491BC161A9E3B40B1432FFC656255403A714492189E3B40D66F8E8265625540A7FF95B9179E3B40A331343C6462554077D410BD159E3B40FD649B7563625540C266059B149E3B406B03B2C762625540FD5F7A9E139E3B401225A50462625540E11B637F129E3B407769599460625540A82EF4CB109E3B409936656560625540DA8581A1109E3B407F9D453660625540BCDE7781109E3B403A790CFB5F625540819CACAE109E3B400C9DD5BF5F625540B3A1A9EE109E3B4048B3BE8E5F6255403E9AAE22119E3B403B18514E5F625540F26D2286119E3B40C35332005F6255405D031C25129E3B40327791C95E625540F0A322E9129E3B40161BA98D5E625540FD6E0CEF139E3B402B336E6B5E6255406BD5DA83149E3B4093F4AD2E5E6255403582BB89159E3B402915EBF65D6255403A07DBA4169E3B40093098E75D625540BC326C24179E3B40AAC475DA5D625540693461AF1A9E3B40B36043D05D6255404E8C1D6B1D9E3B40DFD1B0A95D6255402CC5111F219E3B4063E8B4615D625540942B7471249E3B40E045B9DB5C62554063B537BE279E3B40D7F8CB595C62554040F8C01B2A9E3B401D11E4D55B6255403315CA7E2B9E3B40339DCD385B625540883EB4BD2C9E3B40853E065F5A6255402F4818AC2D9E3B4092C4D547596255407A207D082E9E3B40907C8DA757625540E1B50E472E9E3B4094D6912B56625540DD22FF262E9E3B4041157954546255401B151C0F2E9E3B400F337B17536255405518B1E92D9E3B40C29FF6CE516255404C88A56F2D9E3B40B04F0FFB50625540E6D5DA492D9E3B4070DE9F525062554019ACA2002D9E3B4072FFCFD44F625540171EFC2E2C9E3B406819CE0B4F6255401954CF872A9E3B40188353264E625540F22E55A3289E3B406A2542BB4C625540CF39D4D0259E3B40D3AD5ABD4B6255408806E2E4229E3B4085E76C9E4A625540094930231F9E3B40886D44B449625540FE7452CC1C9E3B401FDE6242486255406BFB1F601B9E3B408F584EC6466255409844890B1A9E3B4081BCE9A7456255405969489F199E3B40443A1C4A45625540091C2B3F199E3B400BFC0DB2446255403A79E188199E3B4069492A2244625540C73A12231A9E3B40C5AE28DF43625540207E4B401A9E3B40551F98A643625540435E14A61A9E3B4001020000002400000011C5A64B7C625540B36B847C249E3B40590F16367C6255405A0FFE61259E3B40057388277C6255400129A1F7259E3B40F792B81D7C6255407FF85427269E3B4026D555117C6255400CC4D448269E3B4073927E017C62554062B93666269E3B409C8233DF7B625540FBD8C464269E3B402EFBE2AE7B6255402977B758269E3B40DF668E3E7B625540EE35EE33269E3B40CA5D32367A625540FAC763E1259E3B40F3EDA64F79625540889DC9A2259E3B406D731F57786255405911D361259E3B40ED66A28B766255401D5887FE249E3B403B370F0376625540692943F2249E3B40CD7B81707562554088AADAD8249E3B4077CB84F37462554003F2C3C6249E3B40C8A2267A74625540AD1C6BAE249E3B408708F4EE736255407797EC97249E3B402EBC737E7362554055700875249E3B402220110B73625540D040CD65249E3B40CA2E768072625540450D4102249E3B406B5491BC71625540D5AC3FB7239E3B40EE4B48F7706255408FAF8188239E3B40D523F86C706255409ECBA065239E3B40A8275EDE6F625540966D0233239E3B406842306F6F6255405F954106239E3B4053427A1C6F62554000D0856E229E3B40E6DA7ED26E62554058644A27229E3B404024A5E86D6255401860072B219E3B40BF8DF9026D625540EDD0EE28209E3B403B3C25BB6B625540CE2196DF1E9E3B40787C3559696255404116E7801C9E3B40B388E00D686255406DB7785E1B9E3B40EC1FB50867625540046B09061A9E3B40D6E3DDDA666255406FF4C7FD199E3B402C785FBC66625540D491BC161A9E3B40010200000013000000A649C6A37C6255403A36BD70369E3B40767415AF7C625540C6499E0A359E3B40AF45DBB87C62554038C0A320349E3B4023F1B6CC7C6255404390AA6A2F9E3B40885520DB7C625540261729472D9E3B402B82F6E67C6255407579FDDD2B9E3B40C49256EE7C625540D69B1B8A299E3B4054F406077D625540EA92A4F3269E3B4008133C1A7D6255406F4EEC2E269E3B40C9FD924D7D6255402170660D259E3B406047FEC67D62554025B9C95D239E3B40E1650E1F7E625540E934FA28229E3B400926FC7F7E6255401A30B1D7209E3B4065A789447F625540625435251E9E3B402671AC0180625540BAF010931B9E3B40CC2EFE85806255403EAED4B2199E3B400252A10181625540FFCC5A1D189E3B4048062394816255403460A615169E3B40E33C1D03826255403F7DD882149E3B4001020000001100000044D704D177625540E890B3603A9E3B40AC8F75467762554049CC14663A9E3B40652CD8B57662554060CB3C663A9E3B40A2306ECC756255405D5BCC5A3A9E3B4080CB43DE74625540DA1DF9573A9E3B40D2392A3773625540FE16CC673A9E3B409B01E13172625540BDFE54793A9E3B40CEFFD6BF716255409877F07C3A9E3B40B8847D1871625540ABACAD893A9E3B405FCB84BA6F625540FD4D73C53A9E3B40CEB0A0086F625540716764063B9E3B40F7C3C0376E625540747748373B9E3B40290E357F6D625540B1C0605C3B9E3B408C593A2A6C625540F70154993B9E3B40CD1338246B62554015B435DB3B9E3B40852C479C6A625540D6A7BCF83B9E3B4033F0B6456A625540DDDA08133C9E3B4001020000001300000033F0B6456A625540DDDA08133C9E3B406C0FFE236A625540925B9C4F389E3B402482EE066A625540BBCF2B75359E3B40C11AEBF369625540E5E91CE0339E3B40FA460CE76962554005F9F97A329E3B400FCC95DB696255404F21CF43319E3B40BE1185CE696255408D7981F72F9E3B400139DBA66962554065B4E9042D9E3B4029C3CA816962554038D733522A9E3B40CF92CA64696255405C944CB8289E3B40B9EF8C44696255404D4331F6269E3B40F89AB51D69625540BE1EF894259E3B4099D4E19E686255401A6761A6229E3B404B999A5968625540E1BBADCE209E3B4085B8F21A68625540CD183B601F9E3B40924048C367625540CB20D7BB1D9E3B40BBE5EA2667625540169632471B9E3B40C77746CA66625540EB59D6321A9E3B402C785FBC66625540D491BC161A9E3B400102000000AC00000066C15CC073625540C611A504989E3B40427A3CC37362554013CD7348979E3B40010D92C2736255400287E914969E3B40FF8148C473625540384368BA949E3B407F856EC473625540E0D3ED3E919E3B4056ADC0C3736255403AE289ED8F9E3B40297529C473625540D1A04C638E9E3B40D4BC03C37362554011AC06038B9E3B404A692AC673625540BC15286F879E3B408A113BCD7362554041B0AFB6839E3B40958156CE73625540B31A7128819E3B40FACFD2CE736255405FADF2A97F9E3B40E0EAA4CF73625540953F72237D9E3B40EA1B18D0736255406C02FFC07B9E3B406B3959D0736255404DF9A1F87A9E3B400697C6D073625540DEB31BA8799E3B4017E21BD17362554077C3A7A1789E3B40DC22B6C873625540D4945D42779E3B400D566AC9736255400FC2E017759E3B40BF6FD1C973625540DC58A1DA739E3B407A0489CA736255400367BCA5719E3B404CA02ECB736255404D4624A86F9E3B407F71A8CB73625540D9384C316E9E3B40B01D81CC73625540472792966B9E3B4006DA22CD736255406DD8E3A4699E3B4093ECD8CD7362554038CFA074679E3B4011CA5FCE73625540E9CAA0D5659E3B402FB605D0736255405C16AF70639E3B400E671BD17362554048AD2AA5629E3B40344E2ED273625540BA35BF08629E3B40EAD87DDC73625540909EDE22619E3B404C9138E673625540F4E15276609E3B40FEDB4AED73625540D89DA814609E3B407A9DE0F4736255406C2F51DC5F9E3B403B7F46077462554044EEB0065F9E3B40EF63AB2C746255408AC0F2D15D9E3B40E99E134A746255405ABDF6A35C9E3B40A670986274625540BF251FE95B9E3B40A4EA997674625540F1F537615B9E3B40037A2893746255405ACFC7AE5A9E3B402DD307AD74625540E56A89255A9E3B40A7BCAABD7462554055CC16B1599E3B40292812D874625540E7BA6230599E3B40763656FC74625540A9CF0E98589E3B40EAEFCE1D7562554076D7751C589E3B403C4EB94575625540393A5E9D579E3B40F8197C79756255409D9B1A0C579E3B40C7576FE57562554017D098FE559E3B407D187254766255401FD0DD3D559E3B401407C89C7662554096F0B9CF549E3B40640323FF76625540C549BF72549E3B40C4FA4A3077625540A8A9813A549E3B40BDDEC481776255407CBA690E549E3B406B43C43E78625540E54F4FFD539E3B403366C7A77862554053E92306549E3B4061F208E3786255405CF444FC539E3B4007E1ED1F79625540CC12E31D549E3B40273C8463796255409137D04F549E3B40344D51A57962554087E5B69F549E3B4012C200EE796255404AAE81FC549E3B4076C83B307A625540E2CC7663559E3B407849858A7A625540C63C8206569E3B40024E3AB67A625540E3B79381569E3B40C86DFAF57A6255405D63252E579E3B4053D318427B62554041C56008589E3B40A6051C617B62554070539D69589E3B4067893CA17B625540216EFB59599E3B406E0565C87B6255406F4CA7F8599E3B40DDE883DA7B62554014BF93595A9E3B407FDB22097C62554051168A625B9E3B40B51AF51C7C625540E71D2FE15B9E3B40732D214C7C625540DD54691F5D9E3B400072135E7C625540173847C05D9E3B400DBFB1707C625540C7292B675E9E3B4092ED237B7C625540F7DCCDC45E9E3B400618088A7C625540D11BC5F45F9E3B408C5A58997C6255409105DBFD609E3B4043BDD0A47C62554013AB59C5619E3B407E8537B07C62554007B3A4B1629E3B4098FED5BB7C62554003EAC3B5639E3B40D2BCEEC47C625540C6ABC373649E3B40735FE6E77C6255402BB9F82D669E3B40B5AD74F77C625540084C9275679E3B40269299097D6255405AAD0AA6689E3B40F61EAE3F7D625540D0F7BD1D6A9E3B4058729D7B7D625540168683906B9E3B4019D66BC27D625540FDA946EF6C9E3B402FAAE0097E62554093F544286E9E3B40ABDC56497E625540A2D0D34D6F9E3B40170CCA6B7E6255408A3568FC6F9E3B4027E52A997E6255402C48AED7709E3B401A96D2B67E625540D8572458719E3B40706A2BE07E62554092CFD225729E3B40D7390C157F625540DC49751C739E3B407825533B7F6255400E60C6FC739E3B408D1C235B7F6255404DA69AB0749E3B402E1142707F6255400E7B8637759E3B40E2A061967F625540F2ED2D46769E3B40EE6538C17F6255409BD92D35779E3B4046DE41F17F625540BE5E393C789E3B40A4E18B0A80625540B28C93E9789E3B40D95C51488062554005C461CE7A9E3B40AD24688580625540319FA3D87C9E3B4046669FC780625540BEE7B90E7F9E3B4035B0E7F280625540108CC080809E3B40B5DF7F29816255408A7B7C53829E3B40BFFC2E3D816255406C65233A839E3B408A8C795481625540FD0DC061849E3B402D770F7081625540B9A9DDBF859E3B408DC2938381625540846FAF07889E3B40222E518B8162554094CF2066899E3B403BC21B8E81625540CEB6CE268A9E3B4074E5808A81625540BB8F7AD08A9E3B40AF90DA798162554099E593FD8C9E3B40DE43437681625540BF7851A58D9E3B405862C14281625540D31A3536919E3B406FC2B52F81625540D90CC287929E3B40E755D2008162554048FAF22F949E3B40E274D3B580625540CED66BD6969E3B405609FDA680625540CC74A75C979E3B40A2CB167880625540C7F51E90989E3B406A8AAE2F806255403267D06A9A9E3B4029264EDE7F625540729D3D339C9E3B40FF510D9B7F62554022EC609C9D9E3B4098F06F407F625540C037E7479F9E3B402A7E43DC7E625540E14AA5E7A09E3B401C9BC0827E62554062C4A01AA29E3B403A9C12547E62554000B7B7BAA29E3B4088AE7DD37D62554033651712A49E3B40B2938A987D625540B8B883AFA49E3B400BBF5B227D6255407692A0B0A59E3B40870E17C37C6255400451E37FA69E3B4094B1175D7C6255405DC9C95DA79E3B40022A50067C62554095F6CE05A89E3B4018D41DB17B62554054F8CEA6A89E3B4090644B5F7B62554016732E25A99E3B4021C39E137B62554092310F9AA99E3B405B3C4EAE7A625540CCC18936AA9E3B4086C2F36C7A62554059B4799BAA9E3B40590D93047A625540485A09E8AA9E3B406F7B3C9279625540C54A5323AB9E3B40D70679F5786255407F51EF66AB9E3B40DE00FD4B786255402609788DAB9E3B40EE8456A77762554033E88C92AB9E3B409A6A8C0177625540C2404758AB9E3B40AB9B664476625540610EC88CAA9E3B4065FCFAB67562554010E644B3A99E3B4072A17834756255406533F5B6A89E3B404B794CEE7462554051E98236A89E3B404B5B36AE74625540B4587867A79E3B406F56D37874625540BF479D71A69E3B4024AC0B64746255402E0890D5A59E3B4064300A5574625540E8EF123BA59E3B4044AA4D4B74625540797E45C7A49E3B40F481194974625540FA602132A49E3B409B159651746255409D21B1BCA39E3B40A74F6466746255404F74E212A39E3B40FDF57B7274625540902D14CEA29E3B40DBF1718274625540FA34A48CA29E3B40CA25209E7462554047C9BD65A29E3B40FDA9FFC37462554061F13B29A29E3B40BE3800EC74625540CE70E010A29E3B40033E520E75625540B3514F0AA29E3B4014D2922275625540631E2807A29E3B405AA03825756255409AFA5A4BA19E3B4074545E277562554031AA0B5BA09E3B404F39182A75625540A5B19B879F9E3B406CF89A2A756255401E04C6ED9E9E3B40DF170E27756255409049D8379D9E3B4003CE72217562554094D630E4999E3B40A239CE2575625540C9499912989E3B4066C15CC073625540C611A504989E3B4001020000000800000066C15CC073625540C611A504989E3B40ABFE87D472625540127E3805989E3B405FEAA2D272625540767CE0CB9C9E3B40FA8B9ECE726255405CF4B885A19E3B40789702CD7262554093005677A59E3B40472E2BC172625540C1E58B79A99E3B407BB41AB0726255407F315603AD9E3B409B458A967262554098FC3C4EAF9E3B400102000000020000009B458A967262554098FC3C4EAF9E3B40617855A572625540EA76756EAF9E3B400102000000550000009B458A967262554098FC3C4EAF9E3B408595466B7262554098449138B19E3B40DC07903272625540D1510B5DB39E3B40509346007262554087DEFB5EB59E3B40E05582C4716255407C0884E3B69E3B405289958A71625540D0CB4D5BB89E3B4092A326387162554002C14522BA9E3B40A57724BE70625540537E7E60BC9E3B40C2B49C147062554053F9909DC09E3B4076C0BCE46F62554090D39C2AC29E3B40FABEDFC26F625540F946FD1BC39E3B40EFFB999B6F62554042199B45C39E3B404A2D93616F625540BF4D9045C39E3B4053FDD92D6F625540B9351200C39E3B40A55B6C046F6255401CE01F86C29E3B40436A3BF06E625540B8921044C29E3B400949A5DD6E6255406BD8EDE7C19E3B40BF037FD26E6255406C874C87C19E3B402AF492C76E62554063AC0617C09E3B40C50066BB6E6255406131DA89BE9E3B4047A3C8B26E625540D70C798FBD9E3B40B5938DAE6E6255406A034B16BD9E3B40C600F49F6E6255405FA35445BC9E3B400567028C6E62554001C21D64BB9E3B40A7C288786E62554025CD2159BA9E3B402438C9686E6255407C8930B1B99E3B4095A0D24E6E625540E6980EC7B89E3B40380D722E6E62554020083DB5B79E3B4023FEA40C6E6255400B10CCB9B69E3B40B70247E76D625540B4E796B4B59E3B40EE2201D06D62554016B7B909B59E3B409BDC70B36D625540D8C2953EB49E3B40C28179586D625540801560C1B19E3B4022477E206D625540BBAF8434B09E3B40A0E583E76C62554020715E71AE9E3B406E3EB8A66C62554051FCDC9DAC9E3B40D41928766C6255405D079FBEAA9E3B409457A32F6C625540525179FAA79E3B40D91AD40C6C6255404F506B98A69E3B402EAEC7EB6B6255404F84866AA59E3B40FE5218AD6B625540FD2CC7C0A39E3B400D93FE7F6B625540572EB0D5A29E3B40DFCA40366B6255406290EB82A19E3B4057B210F76A62554086889A70A09E3B40E2C4F0D16A6255408BFCE8A99F9E3B400ADB0E936A6255405B8D15D69D9E3B40D7E7104C6A625540E4DF8DA09B9E3B401FB56F276A6255401E54D5449A9E3B40BC654BED6962554057FCD483979E3B405265B2C369625540B1321452959E3B404C056DB569625540F71D2D44929E3B404EB845BB69625540D2029B59909E3B4015A260D169625540BAEE517F8D9E3B401CB354E869625540E49A7DA18B9E3B40E7BDA1F6696255400BBED7B2889E3B40470947166A625540729DAF34859E3B40186602296A625540F6CBB107819E3B401008E5436A6255406CD92F2F7D9E3B40D8BE86606A6255401410B944799E3B403EF0DB886A6255406675D129739E3B408E29CE9F6A6255401121E3A66F9E3B40766D64856A62554058F15B546C9E3B40756F6C6F6A625540D28E0B12699E3B40883658686A6255402F33C9D0669E3B4083332C6E6A625540224F5D40659E3B40069D1C6D6A6255408429B2C9639E3B40E6096B876A625540E59004F2619E3B404A6CBDAD6A6255406F9875325F9E3B40A3130ADF6A625540F8447FC35C9E3B400CD844FE6A625540B925D06B5A9E3B40B3C89C0F6B62554035606635589E3B40271BD21B6B625540B0FCDDC0559E3B4097F7CA286B625540FE4DCD29549E3B400216C52E6B6255409415836C529E3B40F483E3316B625540BD822EDF509E3B408A4C5A286B6255406FC38C344F9E3B4097E120166B62554088CB985C4D9E3B4022D03AFD6A625540AB074DE74A9E3B40AFADB6DF6A625540649E1AB6489E3B4048F70CB06A625540438A9F40459E3B40BBE0DF866A625540C7C78B19429E3B4084A596746A625540C5D880FD409E3B4096D467606A6255403D3A8C553F9E3B40EED3005B6A625540995512483E9E3B4033F0B6456A625540DDDA08133C9E3B40010200000048000000B44224E2736255403267E9F8C09E3B409FD2A007746255403599C943C09E3B40E659689E746255406CCFC80ABE9E3B4035B0AB1F75625540D2EFA942BC9E3B407D369E5D75625540AD8C3F75BB9E3B40FDE96DDF75625540653CED16BA9E3B40E3DD625376625540B6AC0025B99E3B40346760A876625540A2642AA5B89E3B40A708682A77625540539BFE13B89E3B40DE4E00BE77625540209EB18BB79E3B4098F3308078625540DFA6C24DB79E3B40D1E4A258796255403696E156B79E3B40428020067A6255409D4DA894B79E3B4051917F877A625540114C1386B79E3B405F0093897A62554008E53FBAB79E3B4002EC08937A6255405FE067CDB89E3B40C48AD49A7A62554030E6B5AFB99E3B407471399F7A625540E9C09256BA9E3B40191040A37A625540B6DA58BDBA9E3B40031152AE7A625540C8199B99BC9E3B402285F7A37A625540819A6D34BD9E3B40FF13AF6E7A625540103ED3B3BE9E3B409ADACC3D7A6255406AD850FCBF9E3B409B0E3D0A7A6255409679A01CC19E3B4075F103D479625540A92CC00FC29E3B40E94C948F7962554074BF36DDC29E3B40E05B7F4679625540BC1D6A82C39E3B400C21B4EA78625540771CE856C49E3B40DCB8D1587862554033F02D4DC59E3B40F7069AB977625540B363CF12C69E3B40EF9A7D317762554031D262C8C69E3B40817A24B5766255402CAD7A8BC79E3B4046BDC6377662554063DB792EC89E3B40B207A8DE75625540DC91B6C6C89E3B40D540889D75625540C80C2630C99E3B40C5A71853756255406470D6B4C99E3B408BAA641575625540F943FE0FCA9E3B40958C0CE67462554006D10E32CA9E3B4024F625A7746255404DA37C5FCA9E3B40F852C55A7462554026318A87CA9E3B405000221D7462554046AFBEA4CA9E3B40C1781CB573625540B316D3C6CA9E3B408EC20E4F73625540A9AED0F9CA9E3B40550F23D17262554063191AF1CA9E3B40CBAC2B6472625540C77A75CECA9E3B40FB1F1A2872625540F231E2B1CA9E3B40C21684E771625540CAB7209BCA9E3B40555C619B7162554038ECA56DCA9E3B40FF44C05671625540C5917633CA9E3B40ABB73B20716255403E76B30ACA9E3B4036B4D3F770625540A29A5CF3C99E3B403BB83AC17062554097DFA2E2C99E3B404232BA9670625540F736D8E0C99E3B40C508C27770625540419C4ECCC99E3B402F3CA74470625540DC30AB97C99E3B4076529743706255403664ADB7C99E3B40998EDE3D7062554000747CD5C99E3B4077A2533A706255408227B4B1CA9E3B4009C8744070625540FB9469C0CB9E3B40DC75324370625540AC06FD9DCC9E3B408B19DF59706255409E1F6AB9CD9E3B404288696870625540A804597ACE9E3B40628D9E8770625540E6621578CF9E3B4085CE51A070625540D5CA6C2DD09E3B4019B428D270625540EBFAE713D19E3B40403DAA0A71625540135AB512D29E3B40C54A4A61716255402F7BE65AD39E3B40ED963B9271625540D05ED4FCD39E3B401BFF18DF71625540720B6ED8D49E3B40E427F436726255405DC39E00D69E3B40E4F781967262554054BC385DD79E3B405064AB9972625540F49F8A68D79E3B40
\.


--
-- Data for Name: utilities_electricpole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_electricpole (id, name, geom) FROM stdin;
1	Electric Pole	0101000020E6100000DA1979D67A6255409FA5CE31199E3B40
2	Electric Pole	0101000020E6100000B3AD15C67B625540E10B0579129E3B40
3	Electric Pole	0101000020E61000005AA245EF7C62554060C21ACF0C9E3B40
4	Electric Pole	0101000020E6100000AC5016A97D6255409B6AAE86359E3B40
5	Electric Pole	0101000020E6100000B094A6497D625540BC71CE0F569E3B40
6	Electric Pole	0101000020E61000005E85939E86625540DE8CDAD2609E3B40
7	Electric Pole	0101000020E6100000CB0E4C1596625540FB5AFA85179E3B40
8	Electric Pole	0101000020E6100000B04232BA956255409B578C7D1F9E3B40
9	Electric Pole	0101000020E610000036193D1A956255405AD6EB16299E3B40
10	Electric Pole	0101000020E61000006428A59A93625540F67D15D1379E3B40
11	Electric Pole	0101000020E61000005E389DCC8B62554019E30B5C809E3B40
12	Electric Pole	0101000020E6100000808DD4AA8A6255402CE0DAC9979E3B40
13	Electric Pole	0101000020E6100000694F3AAA8D6255402A323977A89E3B40
14	Electric Pole	0101000020E61000001A9106D88862554011BA4005BB9E3B40
15	Electric Pole	0101000020E61000000F8476816E6255402834737CCB9E3B40
16	Electric Pole	0101000020E6100000C61737667262554060AA84B1DE9E3B40
17	Electric Pole	0101000020E61000002FC3EC69726255400D08F5A1D99E3B40
18	Electric Pole	0101000020E6100000C3401FB87B625540CEB831FC779E3B40
19	Electric Pole	0101000020E610000019CB403A6C625540F1C16DA1B19E3B40
20	Electric Pole	0101000020E61000000F8476816E6255402834737CCB9E3B40
21	Electric Pole	0101000020E61000000F8476816E6255402834737CCB9E3B40
22	Electric Pole	0101000020E6100000DE6480756A625540695A6C759A9E3B40
23	Electric Pole	0101000020E610000029E76E1C6B625540C1DCA7717C9E3B40
24	Electric Pole	0101000020E6100000736026F16A62554025314551619E3B40
25	Electric Pole	0101000020E6100000FDAC95AC6A625540F831F9A3429E3B40
26	Electric Pole	0101000020E610000078D2DC326A62554080563B3A229E3B40
27	Electric Pole	0101000020E610000051443B2E6E62554090E46588279E3B40
28	Electric Pole	0101000020E610000017BF11576362554057E0E3D8179E3B40
29	Electric Pole	0101000020E6100000F33155645D625540E56B80E60C9E3B40
30	Electric Pole	0101000020E61000000A73A14F40625540EAFD54E71C9E3B40
31	Electric Pole	0101000020E610000060777C795562554061E7C6879C9E3B40
32	Electric Pole	0101000020E610000093E459F258625540FEB443849A9E3B40
33	Electric Pole	0101000020E6100000F33155645D625540E56B80E60C9E3B40
34	Electric Pole	0101000020E6100000F33155645D625540E56B80E60C9E3B40
35	Electric Pole	0101000020E610000017BF11576362554057E0E3D8179E3B40
36	Electric Pole	0101000020E6100000E1BC4A95506255409B64B93B0B9E3B40
37	Electric Pole	0101000020E610000045DBB7C86162554096BBE80DA09E3B40
38	Electric Pole	0101000020E610000060143905686255403ECD3E1BD29E3B40
39	Electric Pole	0101000020E61000000EC042CF716255407B1FF0EF5D9E3B40
40	Electric Pole	0101000020E61000003485E57174625540B51EA67F789E3B40
41	Electric Pole	0101000020E6100000F06D763F74625540B80C3B84959E3B40
\.


--
-- Data for Name: utilities_fountain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_fountain (id, name, geom) FROM stdin;
1	Fountain	0106000020E61000000200000001030000000100000004000000430D0A9374625540305E0B4A5B9E3B40602C0F0B75625540496FBD875C9E3B40D9A4F10A75625540744E58865C9E3B40430D0A9374625540305E0B4A5B9E3B4001030000000100000030000000D9A4F10A75625540744E58865C9E3B4027386F0B75625540ED90A3875C9E3B401B5C890F75625540EACF4AA85D9E3B408C795F2575625540FC711AC05F9E3B407313C12E756255407176DE9E609E3B4035EBA77C756255406A488E94619E3B40EFB587B47562554007AB6C53629E3B40E913F41F76625540101D5A48639E3B40EA555177766255407EA9F0DB639E3B40282D5BF17662554014DF577D649E3B406FED4156776255400BFDBDD9649E3B40456B6BCE776255404814E10A659E3B4045BCB762786255409A3F3035659E3B40DB8C7BE6786255403953A2FA649E3B4045ED2269796255403AAD06BC649E3B405D8F41497A625540A1A800AD639E3B409656C4BC7A625540A9B774B9629E3B40759FA7317B625540A325D779619E3B4035FA30A27B625540B6D3F70D609E3B40BFB4A6007C625540EE24AA775E9E3B40987791247C625540850134C75D9E3B40DC22F9457C625540F80D503D5D9E3B4032A80E0A7C625540C7B952925B9E3B407E81DFD67B625540CABCA4905A9E3B403AF079877B6255404B50B72F599E3B40C3E8CF307B625540E74A8BF3579E3B408C51CCD17A6255402C5F3F90599E3B4026F65CA17A62554033B5C6E9589E3B4060B4AE367A625540D294E2DF579E3B40C5E466D879625540F2FC2F2C579E3B40FB910E6B796255408E9B0F88569E3B40D7D88BEA7862554015845107569E3B405270258478625540D3A279D4559E3B403E8EBF47786255402B9BF5C8559E3B40B814E0DB77625540C5A802E0559E3B40A04B4EA4776255405682E2EB559E3B40FA37843D776255407FA67040569E3B402D140CEE76625540DE48C490569E3B40CE0A779476625540F7826C15579E3B4085379444766255402DFBC4AA579E3B40E8E6AE1B766255402C094E06589E3B40A63AECE375625540069CA684589E3B4070FF45B0756255406A122A26599E3B401B57E58675625540928CE999599E3B402E8E25537562554057B027695A9E3B40CA153F027562554070FB9AD05B9E3B406DE4C60175625540A1B47A175C9E3B40D9A4F10A75625540744E58865C9E3B40
2	Fountain	0106000020E61000000100000001030000000100000054000000430D0A9374625540305E0B4A5B9E3B4060AADCD2746255409E0AFCF25B9E3B40D9A4F10A75625540744E58865C9E3B406DE4C60175625540A1B47A175C9E3B40CA153F027562554070FB9AD05B9E3B40F53FB00E7562554037E352995B9E3B401A8BF02775625540FB3221295B9E3B40403CFC36756255404AA247E65A9E3B40C309C73C756255405F598BCC5A9E3B4086926E427562554076C46BB35A9E3B40E199874875625540E5E953985A9E3B408206FF4C75625540E5877B845A9E3B402E8E25537562554057B027695A9E3B40798E995C75625540762D4C435A9E3B404B2F836C75625540F34A92035A9E3B40F983157075625540319F44F5599E3B40F111F07575625540E446D3DD599E3B40D7B86B7D75625540E98EDBBF599E3B401B57E58675625540928CE999599E3B405F29DE897562554008429991599E3B4073AA378F756255402143A282599E3B401B6ED8947562554008EDE372599E3B40379CAC9675625540F641C66D599E3B400B728C99756255406FDCBB65599E3B401D2D419B756255401A2BF660599E3B4078A60BA375625540FDE72A4B599E3B40DA53E9AF75625540194F5027599E3B40D2E9BAD275625540240A6ABA589E3B40A63AECE375625540069CA684589E3B40931AA40D766255403B631F26589E3B4066A3C126766255406F2885ED579E3B40A7AD384876625540C9C2F5A3579E3B40D09B6E6676625540D44F7B6B579E3B40FC797F8D766255401DB1BD1F579E3B402D140CEE76625540DE48C490569E3B4073C7B851776255401AABD12F569E3B40A04B4EA4776255405682E2EB559E3B40991F16D77762554027A108E1559E3B4067F5F10F78625540693FE2D4559E3B409A5BC24E78625540BFCF4BCA559E3B40D04D907978625540EB09AAD1559E3B408CAEC8C578625540BFB810F5559E3B408E0B4EEF78625540B2E9150C569E3B40F350972479625540E7CD7741569E3B408CBD1A4D79625540A7F10D6A569E3B4095FCD16C79625540BB2EB58A569E3B40ACBECA8079625540B26AAFA8569E3B405CC0B1BD79625540C4761904579E3B40240459CA796255408E961717579E3B40C5E466D879625540F2FC2F2C579E3B409424A4E279625540DC0FB43F579E3B40F21FC3F77962554059B6F567579E3B40BCCF5C0A7A625540676F698B579E3B401E92C1497A62554028AA300F589E3B40D21377817A625540DADF5A99589E3B40704BCCD07A625540EFFD45F7569E3B40F3A74FAB7A625540AB47228F569E3B40DE7A77687A6255400FFC2905569E3B4035E577107A6255405C06884F559E3B408208629579625540009DA9CD549E3B405641C257796255408069317D549E3B409CA66FF578625540E4B9913B549E3B403366C7A77862554053E92306549E3B400FC939797862554038873501549E3B406B43C43E78625540E54F4FFD539E3B40D802E51478625540CEC394FA539E3B40F42ECBED77625540733180F6539E3B406A3D00D677625540975B8601549E3B40B51C00B5776255403462C013549E3B40C7BC1B87776255406C40632B549E3B402DE4715B776255402B148E42549E3B40E4187B2577625540413FB266549E3B400475A6C2766255404AC3EDD8549E3B40E7AA327B7662554030872A30559E3B40B29F3941766255407FF7D878559E3B40440CA3DA75625540E3E12636569E3B407BE7E474756255400060E546579E3B40C419D92F756255401F422AFB579E3B401685890575625540578B398B589E3B4069CFCDC374625540F383BBAC599E3B401D3C67B274625540ACE2BB1F5A9E3B40D69835A37462554037F63D785A9E3B40A0F1618774625540F0C38E255B9E3B40430D0A9374625540305E0B4A5B9E3B40
3	Fountain	0106000020E61000000100000001030000000100000008000000FF9EF72B786255400B55E5CE559E3B4041CCCF2D786255408080D9CF559E3B409A5BC24E78625540BFCF4BCA559E3B40F1CFC5707862554094A726D0559E3B40CC56CC98786255405BABBADE559E3B403F41939D78625540EE370F05549E3B400951A027786255408043CDFB539E3B40FF9EF72B786255400B55E5CE559E3B40
4	Fountain	0106000020E61000000100000001030000000100000007000000D2E9BAD275625540240A6ABA589E3B40A63AECE375625540069CA684589E3B404FB39AF6756255403A25525A589E3B405AFCB22E7662554029FFBDDB579E3B40440CA3DA75625540E3E12636569E3B40C9DB7F81756255409CCE1A25579E3B40D2E9BAD275625540240A6ABA589E3B40
5	Fountain	0106000020E61000000100000001030000000100000006000000704BCCD07A625540EFFD45F7569E3B40D21377817A625540DADF5A99589E3B40EF67ACA77A625540260077FF589E3B408C51CCD17A6255402C5F3F90599E3B40C3E8CF307B625540E74A8BF3579E3B40704BCCD07A625540EFFD45F7569E3B40
6	Fountain	0106000020E61000000100000001030000000100000054000000D9A4F10A75625540744E58865C9E3B40D6C9BE6A7562554070A7980D5E9E3B4068EDEC8475625540E8F7F8685E9E3B40C05F41A575625540CE0BD0D95E9E3B407A2E9BCF7562554010906B715F9E3B40FD1BF9EA7562554031D001B95F9E3B4088C73B2C766255400077DC5A609E3B40A3A96B5D766255405FEAD9D4609E3B402858E598766255401EA9E538619E3B404F207CF176625540438EEACD619E3B405ACFAE8777625540F4B66264629E3B406AFD64FF7762554007F3D596629E3B403346E831786255406B392FAA629E3B4084CBA98B78625540FE3D0197629E3B40D90B9AC87862554075ACFB89629E3B40C9B8E37479625540363A0504629E3B403F39160C7A62554018D51E24619E3B408AD174957A625540396861EF5F9E3B400BE8F9107B625540D200A9695E9E3B400DCB68777B625540EDA788A25C9E3B403DF8E0777B625540BFEDA85B5C9E3B400FE495177B62554023D8D2835A9E3B408C51CCD17A6255402C5F3F90599E3B40E8CF5CB37A62554058FD0426599E3B40D21377817A625540DADF5A99589E3B401E92C1497A62554028AA300F589E3B402253A8197A62554078BC34AB579E3B40C1CD39E479625540443FB942579E3B400006DCDE7962554011D67E38579E3B40BD82E9D97962554044E0102F579E3B406D423BD4796255403779ED25579E3B40234B44C17962554035307609579E3B40CE9EC6B8796255405283B7FC569E3B4019495EB1796255400E1F99F1569E3B4070F5AA8F79625540A68803BF569E3B40CAEB69827962554056981EAB569E3B401F6B537479625540EB3EF995569E3B4095FCD16C79625540BB2EB58A569E3B408DD9356979625540E3BAFD86569E3B40A2C4A065796255406E8A4D83569E3B405BFB886279625540CD591E80569E3B400320305F796255408E2AAC7C569E3B40DA9457587962554006D29F75569E3B4012616A5579625540FE789C72569E3B40B3F89B527962554072D4B86F569E3B405055CC49796255407502BE66569E3B408B4C373C796255408CB32259569E3B40E6543FFD7862554056A40D1A569E3B408E0B4EEF78625540B2E9150C569E3B40ED058FEA786255401D467409569E3B4091C8DCE2786255403EEC2F05569E3B40C54BFBD8786255408A82B5FF559E3B40D22B9ED27862554003482EFC559E3B4074FD03CF786255402B002FFA559E3B40E08ED1C978625540F45F4DF7559E3B40823046BD7862554061E71CF1559E3B408F1ACAB5786255406AF6A2ED559E3B40E3CDCD9678625540E3BD3EDF559E3B407D6B028578625540B1F4FAD6559E3B40D04D907978625540070AAAD1559E3B40B2A2446F78625540CD927ED0559E3B403626585B78625540C017B2CC559E3B409A5BC24E78625540BFCF4BCA559E3B40E09C37327862554020671BCF559E3B406F7AEE0978625540BE362BD6559E3B4044127AAA77625540ECEE90EA559E3B40FC127567776255400071F01D569E3B40E281334D77625540B3473734569E3B40ECE39F447762554085D48E3C569E3B4092EE411E77625540E914E061569E3B409DA480FB7662554041F5AD83569E3B403A5739F076625540C602918E569E3B4012807BDC766255406D03C7AA569E3B40FC797F8D766255401DB1BD1F579E3B409F933A7F7662554063E9673B579E3B407F24306C76625540B990B860579E3B40031976F47562554067352D5F589E3B40A63AECE375625540069CA684589E3B406F9E27BB756255405A1C2304599E3B401B57E58675625540928CE999599E3B40522F836C75625540F34A92035A9E3B40CA153F027562554070FB9AD05B9E3B406DE4C60175625540A1B47A175C9E3B40D9A4F10A75625540744E58865C9E3B40
7	Fountain	0106000020E6100000010000000103000000010000000A0000000DCB68777B625540EDA788A25C9E3B40DC22F9457C625540140E503D5D9E3B4032A80E0A7C625540C7B952925B9E3B403AF079877B6255404B50B72F599E3B40C3E8CF307B625540E74A8BF3579E3B408C51CCD17A6255402C5F3F90599E3B400FE495177B62554023D8D2835A9E3B40657FE74E7B625540689CE2925B9E3B403DF8E0777B625540BFEDA85B5C9E3B400DCB68777B625540EDA788A25C9E3B40
8	Fountain	0106000020E6100000010000000103000000010000001C00000069842B8078625540667672F95E9E3B407359D0957862554071F887E95E9E3B40BCE656B878625540E409EDC65E9E3B4017A418E178625540E5D280745E9E3B406E04F90979625540D88506FE5D9E3B4029E8ED267962554012BDBB435D9E3B409AE879347962554029E6EFA35C9E3B408D60213779625540A2F521E65B9E3B40E576812B79625540DFF061495B9E3B40B53614197962554055852CBD5A9E3B40A11876F2786255401ABFB0215A9E3B4061AE96C378625540126BF0B5599E3B40E9EDF97E7862554030A5F276599E3B404127C83F78625540737CB993599E3B4074EDD907786255409F65B9E7599E3B4033A20FD6776255404B2B19895A9E3B40317CDEBE776255400AEFE9235B9E3B4072C888B37762554010AD829D5B9E3B4041B5D3AD7762554091699F235C9E3B403060CDB1776255408A3352BD5C9E3B408364EBBB77625540297D6B3E5D9E3B40B84803D177625540A2625BD45D9E3B400053ACF3776255401AAC6D545E9E3B40EF00311D7862554070FD21B35E9E3B40AEF4BB3C78625540834E67E35E9E3B40F1889B5F786255408D293EF25E9E3B40094EB681786255404A43AEFA5E9E3B4069842B8078625540667672F95E9E3B40
9	Fountain	0106000020E6100000020000000103000000010000000400000021310B4278625540040B72245E9E3B40A5D0F6437862554045BF57265E9E3B40130685437862554015369C255E9E3B4021310B4278625540040B72245E9E3B400103000000010000001A000000130685437862554015369C255E9E3B40A3DD225A786255407E4D75375E9E3B40A9319F7A78625540C93213425E9E3B4046BDD598786255401ADF4E2B5E9E3B4056D7FABC78625540FCFF25FB5D9E3B40805682E2786255404AC8C68E5D9E3B401FBC0FFA786255407DF81F0C5D9E3B40B63C850179625540187189915C9E3B4026C2230279625540776685F05B9E3B40E129E7FC78625540DABEF08A5B9E3B4078817FEE786255409FFA06285B9E3B40D4CBAEE378625540ED53CBF45A9E3B40443197D478625540258C88AD5A9E3B40D88F2BBE7862554014A17F765A9E3B408453A0A078625540C6FD2E4B5A9E3B4026853B79786255404135E3335A9E3B40ECE2695278625540AD6FAA3A5A9E3B40148AA22A7862554050CFAD6E5A9E3B40F38DCC0A78625540BB8510D15A9E3B405F23ADEC776255406BA1DD5A5B9E3B402F9DF6DE776255407C6439245C9E3B40428082E577625540D58272E35C9E3B408327F90378625540BE9344895D9E3B4096C09E1C78625540A6DA2ADE5D9E3B40E291FD36786255403A1CF6105E9E3B40130685437862554015369C255E9E3B40
10	Fountain	0106000020E6100000010000000103000000010000000E00000000DE1E0F766255404805F921639E3B40E913F41F76625540101D5A48639E3B4074EA4F31766255400746AD65639E3B40A022F442766255408AB57A83639E3B4020CFB956766255403C9AE1A4639E3B40954F007476625540C65E56D6639E3B402F3C24C2766255402633477E619E3B408BBDF9BE766255406FD5F378619E3B403CEBF9B17662554072F81563619E3B40B55FC6A07662554091962646619E3B402858E598766255401EA9E538619E3B40FEC4838B76625540735C6322619E3B40D1170C6A76625540EF5117EA609E3B4000DE1E0F766255404805F921639E3B40
11	Fountain	0106000020E6100000010000000103000000010000000E0000004CC2696A7A625540D6E11767639E3B40A199F8187A625540E3AF2907619E3B405E462D0A7A62554010E4F226619E3B40A05287E579625540F020385D619E3B404572DDBD79625540DB76F497619E3B40BD32AE0A7A625540D691ACF8639E3B404CD832147A625540BDFA29ED639E3B407E8D5F1C7A625540CE4E47E3639E3B4037EC2E2A7A625540470D94D2639E3B404AB190317A62554002CAA6C9639E3B4022EF85417A62554052955AB6639E3B405D8F41497A625540A1A800AD639E3B40AF638D617A625540E794C679639E3B404CC2696A7A625540D6E11767639E3B40
12	Fountain	0106000020E610000001000000010300000001000000E50000001322F04E716255406DDD64B6389E3B40B655344571625540DE4BCA41389E3B40E0743D3A71625540C91C30ED379E3B40C207282571625540F1BB2898379E3B40D98CE80E7162554097EA194F379E3B404E8290DC706255408436DA00379E3B4057272EB4706255403A7A1AE3369E3B40E415277D70625540BE23C0CC369E3B409DEBCA6F70625540E0F82FCC369E3B40731C5F4A70625540C39BCBDE369E3B40CD708B2B70625540D0784821379E3B405C9F0F2170625540CF5B3936379E3B40495F190F706255409302C470379E3B40F7CC34067062554088C7249C379E3B40480C98FC6F62554065F938CE379E3B40217E27F36F625540B6511BFF379E3B40F013A7ED6F625540AFDA641E389E3B406528BDE46F62554001504A49389E3B401C69DBDB6F6255404D6A926A389E3B40BABBBED26F6255402351728D389E3B40E8B41ECC6F625540F9586BAC389E3B40145C66C66F6255405B18EACD389E3B40CD1BB2006F625540782C5015399E3B40E0538CF46E6255403747EA1D399E3B40EC7FF1F56E6255401DB9334A399E3B40F86EAC216E625540607CC29E399E3B40581FC21D6E6255405E9AB448399E3B40643FD1F36D625540CB6ECE4B399E3B403BADADF26D62554042C899EA389E3B40546E6E436D625540271F942C399E3B4063262DCC6C625540F0E77959399E3B40B73FC4EE6B625540CA49D5AC399E3B4068CF55306B625540F636E0DF399E3B40DA1CD2136A625540A1B12E243A9E3B4077A97E296A625540910572743C9E3B403A8ED0296B62554042C4FF323C9E3B401DB4F3536C625540E1079BDD3B9E3B40B420E3696C6255407C3118413C9E3B408A874A896C625540E945C59D3C9E3B40BA69CAAC6C625540600132EC3C9E3B408E25F9C66C625540ED61C3133D9E3B40437F4AED6C62554074273F3E3D9E3B40CAB8CDF86C625540FEF7A5FC3D9E3B409B86B70D6D62554016AD87FD3D9E3B400D110D2A6D625540E378B9FE3D9E3B40746CC0586D625540CB6904D33D9E3B404D6FD5506D625540510EA0373D9E3B404DB609716D6255404B1EE7083D9E3B400AD358A76D6255402CAE05A53C9E3B40A57C89C96D625540AABC3B1C3C9E3B4005DFD2D96D625540B683F7A23B9E3B406B8F445F6E625540052C7D6A3B9E3B40E170C2FA6E625540AF2290423B9E3B40768C3E376F625540037516363B9E3B40C6A05F726F625540E9BC871A3B9E3B40FF6609A56F6255404FECA1083B9E3B40126DF3BC6F625540EADA3A033B9E3B404C07AEC56F625540F036BB533B9E3B4001FF56D76F625540DD59D7B73B9E3B40FD9A2CF86F625540EF77D93F3C9E3B4005C3D12670625540734DE2C23C9E3B40255DB14A70625540CD1473E43C9E3B40E3BE565F7062554085330FE93C9E3B402A02506870625540522BD9EF3C9E3B40778EFB6770625540FD2B33533D9E3B40A2CF077970625540CD66BD603D9E3B404D81EB8B70625540863C89613D9E3B408A8933AD706255407D5FF0623D9E3B402D766FCF706255409BF45A543D9E3B40813FA6D17062554068C070D73C9E3B40C74C9EDB70625540CF5B6CC13C9E3B40085423EA706255402C3D929B3C9E3B40E0B3F9FE706255408B28936F3C9E3B4005108B16716255405DD7133A3C9E3B4045556C2B71625540BEF342013C9E3B40B65C814071625540E47A8D8B3B9E3B4044961151716255404661101C3B9E3B40BFF2375B71625540474E90CF3A9E3B40F394E17871625540E62821C63A9E3B40A190C5AF716255404B5208C23A9E3B407A566CCD71625540D8F8E5CC3A9E3B40C25EB9DA7162554007B127073B9E3B404ABF16E87162554045B32E2E3B9E3B402A8BEFFA716255407754CC3B3B9E3B40D69FB205726255409B27DE453B9E3B40C47A701A726255403121B7363B9E3B4033B69E227262554010DE6A1D3B9E3B407503213172625540C230C5FA3A9E3B4075EFB03F72625540264119C83A9E3B40A10319CC72625540F7B65FB43A9E3B408D5B930673625540031EA2B33A9E3B408E3200767362554044065DB13A9E3B40B4490A78736255406EECD3CD3A9E3B40546B6B8773625540FB1F753B3B9E3B40BFE2199573625540909F908A3B9E3B403CEDE8AE73625540B3D1FDDE3B9E3B4003EFABC173625540430C3F063C9E3B4012B1AEDF73625540185D5F2C3C9E3B4099F70A0474625540B75ABD423C9E3B40A078BF37746255403E11BA493C9E3B4022F4416574625540DC8C00323C9E3B403831377C746255400F261F163C9E3B40078F2B9E746255403D973DD43B9E3B4083830EC274625540ECCA5F6A3B9E3B40FAAF92DC746255401FEEACE93A9E3B40C250B6E674625540424A61A03A9E3B4015BD3768756255400301BCB73A9E3B4037E3DC6F7562554059011DDA3A9E3B40CF547F75756255404D9B66F83A9E3B402450827E756255401FEEA0153B9E3B40852339897562554082C51E2E3B9E3B409792529475625540FA3734383B9E3B40EB32759F7562554004A478373B9E3B4053E89AA875625540EE33D62B3B9E3B40620692B975625540436C800E3B9E3B40A29DE3C675625540E1E6C7DD3A9E3B407025B9CA75625540F72DAEB83A9E3B40DFFF49E1766255407A4572D43A9E3B4039C067E776625540A55D23E93A9E3B40D112C0EF766255401A11EF033B9E3B406F2EC8F676625540E22FDB133B9E3B408AC22CFF76625540B2DA3A203B9E3B40D77C980777625540FFD530243B9E3B40140473177762554052DDDB243B9E3B40AE9B50277762554089E2EB213B9E3B403177AD337762554044EB1D133B9E3B403948D34177625540FB95AAF73A9E3B40D1F5074C77625540B2940DDE3A9E3B407A18485277625540347848CA3A9E3B409729C4B577625540F23327D53A9E3B40562F3BBA7762554063FDEB313C9E3B403A0E7FBE776255405564F14A3C9E3B40348B90C5776255403971B4713C9E3B40261FE7D277625540EE8BBEA03C9E3B40EDD217E677625540337F6DCE3C9E3B4082CF67FD77625540DBF2D8E53C9E3B4037710E097862554081E628F33C9E3B40608F901A78625540BC7883FD3C9E3B40FD43A22B7862554019BDA4043D9E3B40F377283D7862554098A1300A3D9E3B404842D35178625540CEB578113D9E3B40CEFFCE4B78625540E5A553B3419E3B40AECF893B78625540E0DB299D479E3B40D122CA3678625540EAC8378E4A9E3B401C67363B786255404863D7944B9E3B402ECE853D786255406D5F53104C9E3B40EC937A8A78625540CA0292154C9E3B4091C0348C7862554032DFA567479E3B40540825C178625540EEFAD44D479E3B408DAB1B1179625540E97A2229479E3B408FE08D38796255401508C00E479E3B40753AB96E79625540D7BBEED4469E3B405BF355BA79625540417BFA83469E3B408CB4F5167A625540F0EDAA07469E3B40696CAA8C7A625540CB7D3D24459E3B40B4E1A1F17A6255409E3E0B1A449E3B4091A4A9547B625540AAF29BB1429E3B40EEE9E39E7B6255404EA7295C419E3B4060AAC7E47B625540500F74D63F9E3B405CB269157C6255404385CB2F3E9E3B40AF2C6A4A7C6255401F939FE63A9E3B40C1E1474C7C62554067A39CB03A9E3B40F1A4209D7C6255405F14D6CB3A9E3B403DA16AB07C6255408651800F399E3B4087C35E4A7C625540931CCCF7389E3B40793C23477C625540FED32ACF379E3B4092F2E3347C625540015FAE1F369E3B4084EAF8037C6255400113C723349E3B4097B7AEC37B62554056BF5261329E3B40653AE05D7B625540228A3670309E3B40D26F831D7B6255407BFC126D2F9E3B4054F99ACF7A6255404D2764792E9E3B40412D2C917A6255404E667ED62D9E3B4071BCBE587A625540F61A10642D9E3B40E6A2B2157A62554040CC3AE42C9E3B400C94C5BF79625540DF4665602C9E3B40D01E74637962554007E423F92B9E3B405B2B72CE78625540F61BE8952B9E3B40C023C2D978625540A24E8CC8279E3B40AF582D8878625540A7B9AFB6279E3B405E44A17F78625540A8B1E0952B9E3B40F561566578625540DC5A42E0359E3B4010C7B65678625540D275A5E1359E3B4013B7DE4E786255406A6D4DD9359E3B40E7B0DC3B78625540E9B672B8359E3B405911921D786255405F6723A3359E3B40E159FBFD776255404A4EDCC1359E3B40984C9BE1776255402C5FCC10369E3B406CE971C8776255403C9AF38F369E3B40AC2F69C2776255404A77E70B379E3B40D05EC0C577625540B61FA068389E3B403BE74B1677625540172E4271389E3B40F90B6FDF74625540EDB26973389E3B4010B700DB74625540195A315F389E3B40067171CA7462554086665702389E3B402B7C9AB674625540361A4E89379E3B401D495C97746255406C45DE3F379E3B403BCE336F746255409E0004DE369E3B4072B9595474625540B935D1B4369E3B400004802874625540B118F8B2369E3B409EB45DF173625540945CAABC369E3B40458655C6736255405C5C0117379E3B40ED34E09773625540A3383A81379E3B405CBE487373625540A4FDFD37389E3B404357096A7362554003ABBA83389E3B40A3080509736255401602A98B389E3B40BAEC6FDD72625540431F848B389E3B40EE69F0BF7262554088B44385389E3B40C0503DBD72625540CD48BE83389E3B40D4C37FBA726255403576646E389E3B40F18955B872625540FE230F55389E3B40A1489AB67262554067501E42389E3B4059B153B4726255403842D026389E3B40D1E75CB2726255405461B314389E3B405411CFAD726255406D44AE03389E3B40D61278A9726255406308E0F5379E3B40CEB08AA472625540314EA8EF379E3B40AB71BBA072625540047E7DEB379E3B40D660719B726255405BD27BEA379E3B401A9CE19372625540B27873EC379E3B400025488C7262554018C122EF379E3B40F66AA3867262554010A368F5379E3B406839B57E72625540F4C01A07389E3B40AA54DA7972625540A630F01D389E3B405B83897672625540F916D736389E3B40544A357372625540DF8DBF53389E3B405F4C02727262554031393C6A389E3B400F550970726255404A22E288389E3B401322F04E716255406DDD64B6389E3B40
13	Fountain	0106000020E610000002000000010300000001000000200000004B0B838D78625540FCD746B5459E3B400C2104037962554046019474459E3B40D557529B7962554079BBBCDF449E3B408C00B3287A6255406EF846EB439E3B4055A1E0727A62554059C4224E439E3B40A26348EA7A625540E7C07DBD419E3B404CB6DD537B62554048BB25E63F9E3B4094A718967B625540813A250D3E9E3B40B919FDC17B6255405E9020063C9E3B40A9D2C1CD7B62554000D713BF3A9E3B40E4AFA8497B625540890EE1B43A9E3B40A546C9477B62554028C6E4EC3A9E3B40CD8B14347B625540953E5C9E3B9E3B407BDAE6127B62554079D53F493C9E3B40233EB9E77A625540FA2FA8CF3C9E3B40023954BA7A625540116CE2213D9E3B40225E888C7A625540C1C1156E3D9E3B40DCB8BB667A625540371E8F943D9E3B40E79176377A6255404D3797A03D9E3B4089884AFF796255406B5433903D9E3B409AA0ADCF79625540D0881B5A3D9E3B40B0CD5F9879625540B2B599ED3C9E3B4024927F6879625540D6A1585D3C9E3B400D421C4B79625540E00534E13B9E3B4064F8AB37796255407AB0F3543B9E3B40FD2E992479625540A34E4DC03A9E3B409D4AB920796255403B67885C3A9E3B40707DB8AC78625540C65B074E3A9E3B4041194A9B78625540B0F6ADD5409E3B407AB9F5947862554044D30C54429E3B40AA26B09178625540FE7CCBED439E3B404B0B838D78625540FCD746B5459E3B4001030000000100000004000000EB2C758D786255408A722FBB459E3B404B0B838D78625540FCD746B5459E3B40A36DB98C78625540D8DAB5B5459E3B40EB2C758D786255408A722FBB459E3B40
14	Fountain	0106000020E610000002000000010300000001000000040000004229D8B0786255404F1D9D89389E3B40DACDD9B0786255409415E488389E3B40F526B8B0786255405B23E388389E3B404229D8B0786255404F1D9D89389E3B4001030000000100000020000000DACDD9B0786255409415E488389E3B4089EFF52279625540A931198C389E3B401242C125796255404F3C5E6F389E3B4037E7E33679625540C3B90ADB379E3B40EE7B884B7962554027DE1B62379E3B40DE356362796255400BD97CF4369E3B40E663158479625540B3861094369E3B40D87043D27962554081F60EE3359E3B40D4A04D107A625540978A92A9359E3B4029844D587A6255403F0B96A0359E3B40B9987F8E7A625540468EBECF359E3B401888F9D47A625540BEDCE43E369E3B40F3AFED057B625540A98337DD369E3B408F2AFC2E7B6255403C663883379E3B40B3B5AD427B625540AEDB5228389E3B40D93BA8507B62554006A23BE9389E3B40A2D7C4D07B625540A5FBA902399E3B40A4CCC0C77B62554066F2BAB5379E3B40D86F13AF7B625540E8BC1850369E3B4000AB419A7B625540253DA267359E3B40C2F5C7737B625540217E925D349E3B405D37022B7B6255401B10C9A9329E3B40B2CD37CC7A625540B6161E11319E3B4045BBA4777A6255404E161D05309E3B403B024B0A7A6255407AF315042F9E3B40956F2885796255405D7124362E9E3B4037CF0F1E7962554045EF9FC92D9E3B40ECBFAEEC78625540F5517FAB2D9E3B402F1075D8786255405370A3A62D9E3B40CD8ED1CA786255409C1B23D22D9E3B40A3A49EBB786255409FBB0BCC339E3B40DACDD9B0786255409415E488389E3B40
15	Fountain	0106000020E6100000010000000103000000010000006000000099C274087A625540A4CE84BA3B9E3B400CC161137A6255401D9E06D73B9E3B40F7CD24227A6255404F19B0EF3B9E3B4010A66A317A62554012D5F0F53B9E3B40ACF7E33C7A6255403650D2F43B9E3B408E4DAD4A7A625540AF5691E03B9E3B40BCDE1B577A6255401E09DCCD3B9E3B40F6A15F597A625540359D25C93B9E3B402C8FDB607A625540738437C63B9E3B4088A11C687A62554089E8EBC53B9E3B4054E6896F7A625540F9726EC43B9E3B40F8FC877A7A625540052DE1BB3B9E3B40D96A39867A62554000548BAB3B9E3B40496049917A625540BAD6F58D3B9E3B409BF2559A7A6255401B11166D3B9E3B406E02D9A07A6255405F114F4E3B9E3B40BF2E9DA37A6255404FCBFD393B9E3B40B61D6CA47A62554037619D333B9E3B40BE8AB4A87A62554018A7B0303B9E3B40C8D335AF7A6255407AB1F1243B9E3B401DDB43B87A62554095AC4B133B9E3B409172C6C27A62554057F2AEF23A9E3B40BAD73ACA7A6255401F90ECC63A9E3B405D13FCCF7A6255409B8D199F3A9E3B40F2FBCFD07A6255401433C06C3A9E3B405CABF0CF7A6255403FDAA4423A9E3B40B40CC0D57A625540F0FB0C2C3A9E3B40084BFFDD7A62554040DDB8FE399E3B40D706F7DF7A6255401D396FD4399E3B40E0E6C1E07A625540673D6CB9399E3B40867893E07A6255408F785D9B399E3B40D8C2D9DE7A625540DC92B66B399E3B4032DEAFDC7A625540D3B3FA51399E3B4082499BD87A625540AD70C439399E3B40F8B130D47A625540AAFB2321399E3B40AB0D28D47A6255400288E0FB389E3B403D5E4BD47A625540964B50D2389E3B40C33586D37A6255409A973EBC389E3B40558934D27A625540C14225A2389E3B4034ECDACF7A625540C8D49378389E3B406E15E1CB7A625540D61EC662389E3B400443E7C57A6255401490AC45389E3B404144E4BD7A625540F12E182C389E3B402419D8B37A6255406DFB0816389E3B40AB83F1AA7A625540128A150D389E3B401BC5BCA87A62554097624CEC379E3B400CAE32A37A625540333E39D3379E3B407452839A7A625540CD0737B9379E3B40766044927A625540D41E6EA2379E3B408692EF887A62554006D5F28F379E3B405E16687D7A625540D24D4B7F379E3B40A8C4B8727A625540A97AD87F379E3B404A5E99687A62554002B86B80379E3B408BB1A1617A6255406AE0186E379E3B40BC00B4587A6255402107B059379E3B4061C9C74D7A625540C315354D379E3B40311D3F447A6255400742CB45379E3B4007E30D357A62554003182949379E3B40C0D1A6227A62554086DCCD53379E3B405CB382157A625540EE5AE670379E3B40375FDB0B7A625540FF5FAF6B379E3B408B41C2FC796255405C6AB172379E3B40DE96E6EF7962554066A52480379E3B40233832E17962554007B5F799379E3B40A583F2D479625540B11708CF379E3B40D8E0BFCB7962554016CD04F6379E3B40696038BD796255405C113608389E3B40FDDF0CB57962554037E84D1E389E3B402A27AFAB7962554021ABFB49389E3B4075E8B4A2796255400DE11B88389E3B4043C8BB9F796255401B73DDB8389E3B4027B06C9F796255400FD40BDD389E3B401EB8A09D79625540377EDDF2389E3B40DA46E39679625540480A0B13399E3B40B383D98E7962554046423045399E3B40DA23728D79625540E2A4F77B399E3B40BF4A048E79625540C8533E9B399E3B40B2E9F28F796255403A8617C8399E3B40195CFD9579625540895753F3399E3B40EE3C1C9B7962554083D0FE133A9E3B405778699A7962554099F8FB3C3A9E3B4044605C9B796255405C8EE9713A9E3B406EC46FA17962554029DAADB43A9E3B403557EBA879625540B77CF4D83A9E3B409DE0EDAE79625540DE7B36003B9E3B40C02567BB79625540ED99691D3B9E3B40C01F7AC57962554049AD752B3B9E3B4028E66FC7796255409BAA8B453B9E3B40F31162CC79625540E1D202683B9E3B40F7B98ED279625540ACAE1A7C3B9E3B40EC82A2E17962554045FC639B3B9E3B404F49FBE67962554034FC5AA73B9E3B409B8E0BEF796255400FAA4FB13B9E3B403F50F7FC7962554065F54EB83B9E3B405F28A8087A62554075349AB93B9E3B4099C274087A625540A4CE84BA3B9E3B40
16	Fountain	0106000020E61000000100000001030000000100000025000000780E48F079625540044B2C0C3B9E3B4034888CF0796255408AE3C80C3B9E3B40ED8A3FFD79625540DA3051263B9E3B40B8F1580C7A625540AA4FFE3E3B9E3B40CAAEE8227A6255400437FA533B9E3B405378C8377A6255400721005B3B9E3B40A6E6ED4A7A62554082F330523B9E3B4021ADCF607A625540434C473E3B9E3B405FF4A7727A625540DB87FD263B9E3B400B1872837A625540B9B2D2FA3A9E3B40445832917A6255403B0D61CF3A9E3B4071DA50997A6255407CBF2AAF3A9E3B408DA2E0A37A625540F1F4077F3A9E3B407572B1AC7A6255401D52D83E3A9E3B40EFE3BDB07A6255408935EE0B3A9E3B40FC6F71B37A6255409DB55BD8399E3B4056900DB57A62554042A3AA90399E3B4012F895B37A625540F69F7E4E399E3B405E599BAD7A625540F3F682FF389E3B401EDE8EA67A625540BE98E9C1389E3B4040BD3C9B7A6255403E91BE8A389E3B4037609A8B7A62554018BEF947389E3B409CC3AE757A62554082CEC312389E3B405C1443687A6255405E3890FC379E3B40EAAF0E517A62554048F48CE6379E3B40C429B5367A625540DD907AD8379E3B40C54C53117A625540F32BEEE6379E3B40D14C32F1796255405017E020389E3B40829A40D7796255400FACBC7C389E3B40977CFCC97962554068797DBF389E3B40A6E079BD7962554044148C2D399E3B405E2F4AB87962554084F2F38B399E3B40E1307ABC796255407273680B3A9E3B40AC254BC47962554057A3E05F3A9E3B40745B52D3796255408AC4D7AF3A9E3B4068055EE379625540C7719AEA3A9E3B40780E48F079625540044B2C0C3B9E3B40
\.


--
-- Data for Name: utilities_ground; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_ground (id, name, area, geom) FROM stdin;
1	Basketball Court	534.581000000000017	0106000020E610000001000000010300000001000000060000001E318DC352625540CF618FDC359E3B4010784CB152625540A4229E39489E3B4016334D7E556255407FE60CC0489E3B406521049F556255402536630A369E3B40A5AB1CC352625540BF4178D9359E3B401E318DC352625540CF618FDC359E3B40
2	Football Ground	8416.1200000000008	0106000020E6100000010000000103000000010000002200000094AE18B157625540A12A2E7B759E3B403F0A4BB7636255400111CC89749E3B402EE0DC6D636255409D73B1D2329E3B40D9C430D15B625540E58B1A76339E3B40A1000F255B6255406DD82C37349E3B40ED3291AE5A625540819064B4349E3B40DCDF0BFD596255401FAE1E2F359E3B40EA17460B59625540577EEF2E359E3B40423CF6CA5762554053795AF9349E3B40D6BD17F156625540BA8DCADA349E3B40AF5918D8566255406604805F429E3B40A403578B56625540DFAA1AB94D9E3B400DCFCB3B56625540A677C3B7559E3B4088A2D28C566255400C78F0155A9E3B40CB5EC30A5762554030A899B9619E3B4010785A4B57625540F01795A5669E3B405C045768576255403D7F9CD86A9E3B405386B069576255400BD12CF86A9E3B40D8E8426A57625540F9D0610D6B9E3B402F31386B57625540CF5247226B9E3B40F58FF86C57625540B0635C516B9E3B40B4495E6E57625540C0BFEC766B9E3B404653F96F576255403D3C16A26B9E3B40637758715762554026CEF6DF6B9E3B4015CFB173576255404663EE496C9E3B40E7470175576255401E7851826C9E3B400E093D765762554070E90FB06C9E3B40D1666A7757625540122588EC6C9E3B40E221777857625540F7EACE186D9E3B40CD5C71785762554042FB2A336D9E3B408C19267A576255405B05186D6D9E3B40ABB5729657625540CE1EA85E729E3B40F915C6AF576255404E642657759E3B4094AE18B157625540A12A2E7B759E3B40
\.


--
-- Data for Name: utilities_road; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_road (id, name, geom) FROM stdin;
1	Road	0103000020E610000004000000200200004CDCCE7772625540AF0EAB06DF9E3B40ED8404B0726255403E0066FFDF9E3B40D4C859B772625540E3589EEADF9E3B409A302C5473625540083F7A2EDE9E3B405FB8C539726255409D4B1FB0D89E3B4050888A33716255400DDDE373D49E3B40B556A7CE7062554005B67C77D29E3B407A5D48567062554097F44CCDCF9E3B40D0DA3D3570625540D42DBA44CE9E3B4056ED852370625540EA50C85ACC9E3B40055D54437062554010835759CC9E3B400DE64B52706255405373E2ACCB9E3B401CF4FC9C7062554020CA6AA6CB9E3B408C8C191971625540F4410FB2CB9E3B402D791CAD71625540AD3C97EFCB9E3B401487987A726255403673644CCC9E3B4042224137736255409AE8769CCC9E3B4037775E8E73625540E741CEC9CC9E3B4026C3C3F473625540D20AFFFACC9E3B40CBD2713574625540FA765D17CD9E3B40011DFD8C746255400E3FDC1DCD9E3B407B136CE174625540DCFD53EBCC9E3B40A5FF1352756255406D79F38CCC9E3B407DE720CA756255402BA40015CC9E3B40A8D2E34C76625540975C4058CB9E3B408CA524B9766255404A3B4D4ECA9E3B40A62BDBF176625540F419F80FCA9E3B40BC43516E7762554059943591C99E3B40D38E7DF777625540FCA65D10C99E3B4023679752786255405425E1C8C89E3B40845BC06A796255403A87979CC89E3B403AB131FE796255406F309BA3C89E3B4015909FED7A6255407E75BAC1C89E3B407B1978F27B625540D9CDB9D0C89E3B406F44D6C47C625540233489B9C89E3B40CBDD33477D625540EE7C7E96C89E3B405DCF23B77D625540AEE3761BC89E3B402370204B7E625540842B5A51C79E3B40262BE94C7F6255402A9F7FAFC59E3B40631B33D97F6255409E91F9B0C49E3B40A56E551580625540BB3B2654C49E3B404989EC38806255401424092EC49E3B40F006D57A80625540A1AF12FDC39E3B4086037BD78062554003EEA9BDC39E3B40C56538F9806255406388230FC59E3B4093777E1182625540076C9898C39E3B40BB8E8500836255407435823EC29E3B40DA2D4013856255401330D0FDBE9E3B409AB0B11B8662554063BB4776BD9E3B40E7F6B6C6866255408A210F7FBC9E3B401453F01D876255408E05F912BD9E3B408BC8DE2F88625540B1BF274ABC9E3B403966C0FC876255402392223FBA9E3B40AB6F880188625540CC4CA5F2B99E3B409993E9F086625540FD2C4AA7B79E3B407EB7ECB986625540DDA59B86B89E3B406710F371866255400EB60306B99E3B40F08958E385625540C6C77918BA9E3B409161234E8462554036F29DDCBC9E3B40B92DAE9F83625540212FCF19BE9E3B40CD90EE168262554048D4BC8CC09E3B40EFA4EA0F826255405A8CF355C09E3B405DAC6FF782625540D1D2ADE8BE9E3B403664B4858562554048D5F061BA9E3B409D1BEC9D86625540DCEA9938B89E3B40EB8A5ED386625540CF39276BB79E3B403751154287625540577E1AF0B49E3B40B2B0E83788625540B5BB7760AF9E3B40A5ADF01588625540F530EE1EAF9E3B405428695F8862554049CBDD5AAD9E3B40D3C3052E89625540F4E3AC7BA89E3B40AFF1BC5389625540725E61C3A89E3B403DCBB1258A62554023ABC5FDA39E3B40221F6F508A6255401C7BF50CA39E3B40A5A69AA98A62554084AA147EA19E3B40C38C5DE58A625540B9EA56D39F9E3B40B27A3A148B6255408782ED599F9E3B40129AA04B8B625540986F6E1D9F9E3B40EFDBA9688B625540D4D15D189F9E3B404AE3F2D28B625540D470A45C9F9E3B40A6FC0F148D625540467BEB2AA09E3B40F6FC66B78D6255402C98D893A09E3B40295B9AFC8D625540FC167269A09E3B40117E081D8E6255405C859338A09E3B40DB6FC06C8E62554082D223469F9E3B400A0562B38E625540CAA013A99D9E3B400E9D697E906255402242962C939E3B40AAE2168690625540369E15A58E9E3B4017A5CA97906255401F9E5A33849E3B4028248E9690625540ABC6760A849E3B40C804649290625540C77B1BE4839E3B406A5A17DC8F6255404C86353A7F9E3B40ECCFB1E48F62554061A8E793789E3B401A4313EA8F625540878A3767759E3B4047E9BD06906255408BC085D6729E3B40D949520F90625540F56EF6AD709E3B40403D79119062554014D7F8246E9E3B40D474A91590625540ED862CDC6B9E3B40D80FCA009062554058708000689E3B40EDC9AAE58F6255404D537919659E3B40F66DDCBD8F625540D00F9D50629E3B40A18FC15C8F625540D345E3AC5F9E3B40B6EEED368F625540CFF55A1E5F9E3B408E9D74118F625540673B58D25E9E3B40A3B98DEC8E6255405B6B486D5E9E3B40D68FABAE8E62554080BA06E45B9E3B40B3F072798E625540DA39D8AC599E3B407621AD4E8E625540A2556F2D589E3B40BCEEF3138E6255400B25F6D1559E3B409B0E18E78D625540AE89E206539E3B40A638F4E88D625540F86107D6509E3B4007C0E7058E625540528A42864E9E3B409D9F84328E625540D2BD304F4C9E3B40E466F3568E62554079C7BD7A4A9E3B40F4884B5C8E625540044569D5469E3B4011FDE66B8E62554058215D8D459E3B40A3AB3E958E625540CB3FB688459E3B40C73AECB48E625540985690F5419E3B4006D8F1CF8E625540C33C6BD1409E3B40D3D37FF88E625540289B01BC3F9E3B404DB499588F62554078C89C193E9E3B406A5A73D68F625540F4E2509C3C9E3B401EF135A690625540BEF11EAE3A9E3B40851F4E049162554085E026E1399E3B40EF95AE6B916255406B98B749389E3B40A94158EB916255402C503A14359E3B4087EEFB3F926255409525AF20329E3B400F70B06B926255406DE0E6542E9E3B40128281789262554097AA56372C9E3B40229CEEE5926255408DD9F16B299E3B40BDEA464D936255402E9A36E7269E3B4046A980AA93625540CB4B0E62249E3B40750BC6B693625540ACB17DD9219E3B40F5DA2DB293625540905D37501F9E3B405CD4A936936255402DB0ACCC199E3B401E42728B92625540F47F5DD7149E3B40D4D030B891625540616D265C0F9E3B407A00933E9162554017CA6D950B9E3B406538BF5C91625540AAD118D5079E3B4000D1355A916255402B803FE8059E3B40C28D161B91625540A474F771039E3B40C8CABB889062554097D37C54009E3B40986D473090625540505E038EFE9D3B40D65C9BF68E6255409D464608FE9D3B40E05396B28E62554069FEB0ADFE9D3B409A5D75528D625540B4D1AF32FE9D3B4046D587D48A6255402DB70E2EFD9D3B402F87C35188625540367686FAFB9D3B40441F9FF387625540BEEBD747FA9D3B40F6385AF4876255408DD2816BF99D3B403408AF0E8862554089D31835F89D3B4064FBC95F88625540601BDFB7F69D3B40C3E5FC7F88625540D5BE9537F59D3B40E7ED926D8862554056EB2CBAF39D3B408BF1636C886255404618B788F29D3B4070A566B4886255405B632C6EF19D3B40581AA270896255409C4280FCED9D3B40E6FA803E8962554065445A8BED9D3B4083CA7EEE8862554012D3E085ED9D3B40765206CF88625540B70DCA37EE9D3B40808BC26D88625540DD6B8B32F09D3B40BFDE1501886255408521E75EF29D3B405ACBB6E3876255408FD44CDAF39D3B405834B475876255406AD54599F79D3B4035235F428762554079AA0BC8F99D3B4000C8610B876255405A2E5F9FFD9D3B40D5D56BD9866255407D8EA4D6009E3B40FC6C96AB8662554013C9E7D1039E3B409E96BCA7866255408484D4DD039E3B404DEB6A788662554094BE05D2059E3B403694054386625540CC2F551F079E3B40EF7326D185625540261042CB089E3B400251C07C85625540F0E94D300A9E3B40A93CEF238562554081DE1F7D0B9E3B4065BCCFBD84625540D76C4A910C9E3B40D750045A84625540A5D0838D0D9E3B401ED24A208462554073D2ADD30C9E3B40616D65A5836255400802AA660E9E3B40F06C40AF8262554012189D650E9E3B40BEEC56F28162554035BF6CCB109E3B4059F8CBF081625540321C63B4119E3B40F4E628ED8162554013B992D9139E3B40B754EA0D8262554085C5F586149E3B400AA0631D81625540AD38130F189E3B40D23BDED9806255408D3966E9189E3B409CCD668B80625540E143F0F0199E3B40374D0D2B80625540F4B9185F1B9E3B40994122E47F62554008577D401C9E3B4095F0B2997F62554015AC014D1D9E3B406D5B78467F625540CE6E5D601E9E3B40DAB602C27E62554085D3FA37209E3B40137749237E6255408BF33B66229E3B40BBD4AF657D6255401DA7722F259E3B40831C11247D62554057E5064B269E3B40320DA9017C625540724AB27A269E3B40E085E9BD7962554039580EE2259E3B40D533416678625540D00E605B259E3B400DBFE3A375625540C9B89DA7249E3B4044F4158B74625540577FCF91249E3B408CC7320D74625540003BD17F249E3B4032881895726255402ABD1348249E3B40B908DDD171625540FD237EC5239E3B4026D933BC7062554049FD0A87239E3B40930C7B686F62554024C98500239E3B402B7BFED86E6255404ED64178229E3B40ADE6F3796D6255402448511E219E3B4084D19D0C6C625540DC9CF2B91F9E3B404EB46CFD6A625540DC750F9E1E9E3B4026FC87BB67625540992994611B9E3B40C19EF2BB6662554098116A6E1A9E3B4070262D9766625540F668B2081A9E3B407B4A165466625540EB54AE95199E3B409A0174EF65625540103328E9189E3B408DE83067656255400AE167E9179E3B408ABA4D4664625540A9D25236169E3B40B0B2E3BF62625540C6A155EA139E3B40C363C1F6616255402BC169BB129E3B406B0E3C54616255409E60CB0D129E3B4021A755AE606255402D1F8B6E119E3B403A790CFB5F625540819CACAE109E3B40949FC1885F625540070FA833109E3B409CA539195F6255401E8B7F1E0F9E3B4052C4FD9A5E625540290333D00C9E3B403DBA9B315E625540D40E79CA099E3B401B42969F5D625540655837A1059E3B40A07768345D6255409AE12F13029E3B405D18F29E5C625540FC1CECABFC9D3B409D604B3D5C625540732E077EF89D3B4024F62FD65B62554016496270F59D3B4076B1E1915B6255406463CCC6F39D3B409A87C56F5B625540CB3D08ECF39D3B40960F13125B625540EF965658F49D3B405AB445615B625540D2C4EA0AF69D3B40A08503AE5B6255409283235DF89D3B40D870E3025C6255403284DA09FB9D3B4067FD54465C625540C4D71D60FE9D3B40F52F6DD45C6255407417932D049E3B40AEC6861B5D625540FE6C9185069E3B400E49347C5D62554086884A150A9E3B40537101C65D62554042F32BE50B9E3B402F00E1F95D625540FBD1D80B0D9E3B404831C8185E62554098D770BB0D9E3B4051A0CA4C5E625540B9D455620F9E3B406854D84F5E625540F9311F5D0F9E3B407E220E265E625540FA45E091109E3B404CC7E21A5E62554073731222129E3B404144616E5E625540933A5C93129E3B40F8B2D69A5E6255409A847E30139E3B4058CD5AAB5E625540B9B45D9A139E3B4002E87CB35E625540EDF6DBF4139E3B406DB627B35E625540E4110359149E3B40DFDCBA9A5E625540C79F3FF8149E3B401F75F1875E62554091EEB692159E3B400453F56B5E625540811D2D13179E3B40232DDC255E625540D84AC2111A9E3B4037728FEF5D62554071A77A6E1C9E3B407AA50FE55D625540634A098E1D9E3B40EFB75BE35D6255406DFC8D481E9E3B40C9F23FD85D625540DC957EB51F9E3B4063DE55C05D62554078370062219E3B40AEEB83B15D6255400FC32F80229E3B40C9776D945D625540E2A029E9239E3B40F71D576F5D6255404D01F434259E3B4005944D345D6255405295CCEC269E3B40513A82D25C6255404253B712299E3B4029D45B945C625540BDFB87162A9E3B40B96AD3825C62554073C1F8632A9E3B403887CB655C6255408556EDCE2A9E3B40123FE5445C625540B798AF252B9E3B404F6D9E065C6255404C863AD42B9E3B40A61925BA5B62554046E24A7F2C9E3B4020CAA36C5B625540D223440E2D9E3B409E828D195B62554034F9FB902D9E3B400B2221A25A625540119B2F1C2E9E3B40963CAA455A62554095116B682E9E3B408FEFDBDC59625540A8CC1DAC2E9E3B407301AC8659625540B71391DC2E9E3B40ADA1F5F4586255409ADD72E82E9E3B406065E56358625540DD8056E82E9E3B4066F92199576255405F928BE72E9E3B4043E8A3E856625540B4C714D62E9E3B40220B5F675662554038139CC62E9E3B4069CBEBC255625540513755C72E9E3B4001D035165562554060D372C22E9E3B40CD8BA87754625540B3C690C02E9E3B40B18077F0536255409068019A2E9E3B403ACC298D53625540D1BB917A2E9E3B40D9223C2A53625540EB0E96712E9E3B403726A390526255402038FC4B2E9E3B4023A52223526255402A061A222E9E3B40EF16834551625540D2893DD82D9E3B401B7BFC8850625540B91965032E9E3B4073917E045062554036674FE62D9E3B40958EB0BA4E625540484002F42C9E3B40CFD9A2FD4D62554094C61B1C2D9E3B40F6BC580D4D6255402D815D022E9E3B40152324D74B62554091B235D12D9E3B4037F3FC0C4B62554008AEB1332D9E3B402A450A9449625540A2015C272C9E3B408C4FC8A8486255403B0DFF1A2B9E3B40F65EC96C47625540EAC824DB299E3B40095E844246625540F76D4CDF269E3B402BB57DDF4362554098243669219E3B400E2828A442625540FF71BEA81E9E3B409B89D36A4162554004C2D5D41A9E3B40E6580BA14062554067A5E272179E3B40249CA7C73F62554085A135E8139E3B4005229D353E625540766B09B30E9E3B40BC14710B3D62554078B294480A9E3B408C54E9283C625540DF4797E9069E3B4086E0C7593B6255409E3DFE02039E3B400E8C4F5B3A6255405CDE2C1EFE9D3B40C5AC956739625540839E0FD0F99D3B40531A63E6386255401CAA4778F79D3B40DE86274E386255406711AAAAF49D3B40967C6BCE3762554001DB7BCEF29D3B4028E6F34537625540A893154CF19D3B408032741A366255409FC7CBC2EF9D3B4094C759E434625540C83D7D3BEF9D3B40959A5DB233625540A7A5A35EEF9D3B4088A81BCA326255408BF92415F09D3B4045E8A28D326255402F5A92A9EF9D3B4084E55A6532625540886E09E9F19D3B40117405F2326255402C05EFE4F19D3B40D56A54DC33625540C92EE512F29D3B40CB5D63F2346255405052C160F29D3B40A32B76F2356255400B32B7BFF29D3B4086BDD19E36625540B02965B5F39D3B40643F7A7D3762554005FDE857F69D3B40112549A738625540A8DF4086FA9D3B401828E87039625540A01BE828FE9D3B408000A03B3A62554036DEFDC2019E3B40EDEB7BFC3A62554013A4870E059E3B406D2D7E673B6255403F9B91C2069E3B403C2D861C3C625540A338566B099E3B402B2DF3A33C625540A86CEE7D0B9E3B4044A522D53D6255404EA1F184109E3B4080D05A3C3E625540AE3FFA1D129E3B40FF6EFBE93E625540F43A385F159E3B406B543CEB3F625540C8E8E2A3199E3B40A8FA3EDB40625540236C73071D9E3B40A43F6BEA416255405DBE7DCC209E3B4029879512446255405CED570D269E3B4016472B7E45625540348F2D96299E3B4064AF436D4662554053DA08692B9E3B4045D834BB47625540F30DB2C72C9E3B4010C0B3A849625540A844254D2E9E3B40CDB96EE24A6255409821F0A22F9E3B404610DB304B625540E0DDC211309E3B40E6D66CB54B625540BF4AD534319E3B4098555C464C625540349E91AD329E3B4030E5DAF94C625540DEC256B9349E3B403BCE4F564D62554042ECACC1359E3B40E2E361F34D625540142B0A81379E3B40DF4265C24E6255404CE216AD399E3B401EE448464F625540A3C079263B9E3B40C74510A14F6255401E36FE4D3C9E3B400F52A9155062554080CCBBC63D9E3B40C717B749506255406E1A70853E9E3B401C09BA9B5062554090A5C8AB3F9E3B40941B5D04516255401936D730419E3B400979B34D51625540E7E8F839429E3B40EA000993516255401AC01E8A439E3B4016B41BF951625540483E65D3459E3B40FA84233752625540E0499F43479E3B40AAC41F7F5262554053F13591489E3B408118B5EC5262554016A38F494A9E3B40CD31533E53625540940ACE644B9E3B40EBA61FA7536255403CB6AC754C9E3B401C5E9A0254625540AB43E5514D9E3B407B46626A54625540443EAB424E9E3B40CB5853CE54625540E17E83BF4F9E3B404FF47C0255625540D2980273509E3B40F82DBE425562554003B83396519E3B40FA8A0672556255404124BBD8529E3B4065B096AA55625540FB661218559E3B409FA032C555625540741E4713569E3B406797F4DF55625540928315AB579E3B409643240E56625540F5660C8C5A9E3B40D4A26D31566255404EB372B05C9E3B40CDF9864C56625540711898755E9E3B40F55F3476566255407FD23D05619E3B406126BA9556625540DCE023D4629E3B4022E307B4566255405B544854659E3B406F6C60D056625540E86D99F6679E3B40256011E8566255405798FFC76A9E3B401B24C5F456625540D16FC6B16D9E3B4082144409576255408D6F335C719E3B4038682914576255401B21F669749E3B40BCABD90A576255408BD9FA117A9E3B4093EC4F09576255401977AFE07B9E3B408C86A5DA57625540D12F6BAD7B9E3B4020B19CBD57625540F9521FD0769E3B409B6E8D9A57625540592D0E15739E3B400E05FA85576255404B90AA826F9E3B404653F96F576255403D3C16A26B9E3B40D327F96757625540EA7003CB6A9E3B4055AEE263576255404BA268336A9E3B401767186157625540770EEECB699E3B400ADC6C5F57625540B4ACFD8D699E3B408491685F5762554063885E8D699E3B404AEA3C5D5762554099E8DE3C699E3B400D6DB65A57625540756E36DF689E3B40FC5F66585762554006E97089689E3B40C807C75457625540B3491803689E3B40723F7C5457625540D9CF42F8679E3B405CE3E65057625540547E5C73679E3B402A04724B57625540079251A6669E3B40935C4E3957625540B020082D659E3B40CB5EC30A5762554030A899B9619E3B40EEADC6E756625540342F103B5F9E3B405A3AA99E5662554071B74D4A5B9E3B40DCE95C6756625540E7E9618E579E3B4006CFCB3B56625540A677C3B7559E3B40F239372D56625540FAF47BE1549E3B40FA2D03F8556255400DB64AA6529E3B403C3621BF556255402BFD18C7509E3B40F4303B6D5562554023DFFC3A4F9E3B404A757D825462554012C47E404C9E3B40E6A1490B546255401D32E9EE4A9E3B4023CDF1BE53625540FB931177499E3B40FFC441A2536255404B9F95D1489E3B40F09A257A53625540349D38BE489E3B40A23C816253625540271D7AAD489E3B40AC921A5C53625540987200A7489E3B40ADBC2A56536255404613E99D489E3B40F940B64953625540E6F55A86489E3B404C57ED39536255408A1B3C53489E3B409F45BCDD526255402A0AF341489E3B4010784CB152625540A4229E39489E3B40127B04B25262554058C77D80479E3B4005C8E4B25262554040F5D49E469E3B40A898459F526255400E750B51469E3B4037616091526255405AE3B8FE459E3B4023E3838552625540173441C5459E3B401AC0CA49526255408EFB7E43449E3B401168B4D351625540CC7AAE4B429E3B407305912D516255400B9E684F3F9E3B40BFB77E78506255400BDAB5DD3C9E3B40928562F84F6255403243FE2D3B9E3B40C369AF9C4F625540E0FFD80C3A9E3B408C9FE02D4F6255406A713CC7389E3B409E7A36994E625540DD883D10379E3B409B6B59F54D62554072E79C5E359E3B40516165BE4D625540CBCC967D349E3B401F03418E4D62554025120840339E3B4005C5F4604D6255404DCE93F8319E3B409A818B5A4D625540408BFF3E319E3B401E3AFB754D625540501FCA63309E3B4034A5CFA44D62554040908ADE2F9E3B401EAB4FF24D6255403575B6A52F9E3B402644BD8F4E625540D08B59A72F9E3B4000775CFB4F62554033AAD60A309E3B40A21095DB50625540C591BF0F309E3B40B067EB335162554005D26C04309E3B40EFF2DC2952625540EEC2F366309E3B4039A0FDBF52625540D87ABB87309E3B40D50727445362554092C78AA0309E3B403D5581F2536255401267C6D4309E3B40D289884654625540822EC2EE309E3B400FDA27D65462554002A1740A319E3B40B10AB957556255401E41E703319E3B408EB6D7BC55625540DD47B5FA309E3B40EBE19F50566255407A9FECF4309E3B408D8E063457625540DB3D2610319E3B40E9B59F1258625540F0308E21319E3B403664F0DB5862554070EA051A319E3B404DC79D455962554048187D22319E3B4067EBBFAA5962554073B012F5309E3B40D5D4790F5A625540569AD1BA309E3B40F05B1B685A625540B94FA171309E3B40BDECA2E65A62554030F7FA05309E3B40503C683F5B625540AA37BA922F9E3B40748D94AC5B625540A1990DEF2E9E3B40655D2C085C625540AA37A8562E9E3B40E3A19E5B5C62554078947CAB2D9E3B4037B0B7AC5C62554080E98DDA2C9E3B40D991A1DD5C6255406E9555322C9E3B409BD0380F5D625540E431DD832B9E3B40C3697B9D5D625540AA7CB9DC289E3B40F8A984065E625540571F1358269E3B4024A07F3C5E625540E74D805B249E3B4071B0586D5E625540D9202F22219E3B40A03E42AD5E625540581D230E1D9E3B40B996CFE15E625540A35BAB1C199E3B4097ACBC085F625540E6441BD8179E3B40DF7FAA2F5F6255401AB041B2169E3B40268B4F675F62554094D22FBA159E3B400F9AB1A85F62554088EB93E0149E3B4033F3DEC55F6255402FCE1997149E3B40765F861D60625540D4218AFF139E3B40EE156E6C60625540098AC4C6139E3B404755A1B96062554080F412E8139E3B40996E89FB60625540F6D1ED17149E3B4031E7F242616255407511136B149E3B40243E43A461625540DBFDDAE8149E3B408EA68D606262554028C576D1159E3B40C13C531F63625540432652D0169E3B40E1120206646255406726E920189E3B40531CE86864625540AFFF519E189E3B4054999F0E66625540E662CBE71B9E3B406ADB6A386762554065480A39209E3B40928C25E067625540FA051DCB239E3B40C2A2BF61686255409DE4CF14279E3B40FACCEDE36862554020E1F8322D9E3B4038395C39696255409F81BFBE349E3B4096D3D9A769625540859C74F1409E3B4082DB3C066A6255408ECDA9BE499E3B405785D44B6A625540FE81F93B509E3B40103EC54E6A6255401BC7A1A6549E3B40E9E8E1306A62554063A58D60599E3B4033282BFC69625540947A6CC85C9E3B409D876FA869625540A80F608E619E3B409572418E696255406D6E6D70659E3B4039D1F99569625540B024EF95679E3B4055E006B169625540BC95D8DA6F9E3B4056DC95A769625540A0BB31A4759E3B40DFF8947269625540A575DA907E9E3B40F4E696286962554020A59307889E3B40160C73F268625540E8519AC48D9E3B40818E32DF68625540389EBCF6929E3B400F53CE08696255402DC08CDC969E3B40F74AA34F696255401B118C779A9E3B409FAF5CC6696255409F1FB7C59D9E3B40874D17786B625540C8FF2BF6A79E3B405F16A6106C625540D8000AB3AD9E3B40F79CC3CB6C6255401ADD74A9B39E3B4022743F846D625540E93A0260B99E3B406A8ACCD36D6255404FBD6CC6BC9E3B407707B3FB6D62554090DFE6A8C09E3B400E6AAF126E62554023C9F02BC39E3B40AAA92A2F6E625540A7AEA0C4C69E3B40C9CA86546E6255406616DC2BC99E3B40D5F197726E6255404FF26EF4CA9E3B405F7D809D6E62554015254D09CD9E3B404653E6AE6E625540033BA1A8CE9E3B40A39AF4BE6E625540C4B9EB27D09E3B404791C7D86E625540DA658545D09E3B40DE24651F6F6255400F6B7696D09E3B4022518E656F625540CA346580D19E3B4062B6745C7062554099AA35B5D59E3B401AFAA4FC706255403932D978D89E3B40C2BC11A9716255407A9BD673DB9E3B404CDCCE7772625540AF0EAB06DF9E3B40D90000002FE7E14970625540E996F5DEC89E3B40416708A8706255402A24FFCAC49E3B4040FAC02171625540F69134EEC09E3B40E5A3716771625540F2D238E5BE9E3B401D4E51D071625540B2595460BC9E3B400D0C665872625540FC15A0B8B99E3B405F02D0FA72625540051A4FFBB69E3B4096855277736255407263E56EB59E3B40767EDFE873625540CE2A9D1BB49E3B400C69E7D674625540C91E3BC3B19E3B403D97C98A7562554063601E79B09E3B40D585643B766255404A94FD3BAF9E3B40F844FFE9766255408F651E58AE9E3B40AB2C2D71776255401F50B011AE9E3B40D60FE22278625540379A2609AE9E3B4040D3C20779625540EB2254ABAD9E3B40F1708DBB7962554005D1095EAD9E3B407158678E7A625540B2969FEBAC9E3B40FC8463C17A625540E606F5CFAC9E3B40C9AC69657B62554071ACC710AC9E3B4085F7CCE77B62554028E5685EAB9E3B40277918A27C62554046DC8FFFA99E3B40984712607D625540A3D6C682A89E3B40E6FC429D7D625540E1C77004A89E3B4033E196037E625540F6EA73DBA69E3B40A479A4797E6255403DA8DD8FA59E3B4054474D0D7F62554038D756D5A39E3B404CF867B07F625540B4FEE692A19E3B405D4B8016806255409F8A4B2BA09E3B40B8637D7C806255407085F54B9E9E3B404031FFE780625540D07761D89B9E3B404131CC58816255408A5BFCA8989E3B40C52C2193816255403342664E969E3B407E81E7C2816255408C339257949E3B405354B516826255402975E8CC909E3B40F704284182625540C4AD912F8D9E3B40720C4E4E82625540BF5FF0108C9E3B40507A9B4B82625540ACB580C2899E3B409455C64882625540B8D38156879E3B40171EA92A826255402B1398D1849E3B40F8EB610282625540EDD10E3F829E3B40A1F5608B8162554061C19A5A7E9E3B40C9B1A5FE8062554052B469257A9E3B40EBC8BC5F80625540D2AFD843769E3B4067520BB57F6255408AE5FF9A729E3B407F1880A87E625540413C40B16D9E3B406EDF260E7E625540A616556F6A9E3B406A2314A07D6255402AC37C7A679E3B4076654B717D6255409703E3FD649E3B40250D4C427D6255405DB0C5A3619E3B40B9C596027D6255408DA5B2665D9E3B402640C7D17C62554022FF91F15A9E3B400BB735B67C62554068B85E645A9E3B40DBCE48767C6255409D270D9E589E3B408371DE337C6255405949BA5F579E3B40B097AEEB7B625540F8603C4E569E3B400F0E1A987B625540CECA5669559E3B4095210A4A7B6255402D5BBEB5549E3B40B7206FF57A625540AE04F3C7539E3B405EB0DAD07A6255402E8CF96B539E3B40D71F86B47A62554035499199529E3B40E095D1897A625540BF9B5593519E3B403DE62D577A625540E74884F64F9E3B40380DFA537A625540D27BDFC44E9E3B402E2A96707A6255408B8876DC4C9E3B4011C52FF87A625540CD5104A24A9E3B4024FFC8337B625540E16FD5D1499E3B409E379BA77B62554065431EF9479E3B40FCC43FF47B625540652067B5469E3B4059073A157C62554052154B03469E3B40E45C6B3C7C625540F2439A0F459E3B40024BA5737C625540D77A4C97439E3B40435DA8BE7C62554078D07D55419E3B40226384DD7C6255409BFA4116409E3B40943FB6F97C625540159CD6AA3E9E3B40661BAA167D6255400B09125B3C9E3B400B06F23E7D625540E5A16D5F399E3B408108A4517D6255406D439BCB379E3B4023D93B617D625540CB726740369E3B403A8952617D625540A215E3E2349E3B40E5925C747D6255405EF12161329E3B407F55AA827D625540EA49ABC02F9E3B4064D40CA77D625540DB7616472C9E3B40BC5E34B47D625540D25E2E772A9E3B408EF70ED17D6255401D94F6BF289E3B4069F0D2F97D62554056658880279E3B40DD13865F7E6255403B7D75F5249E3B409572E2AA7E6255403F48884F239E3B408BFB28D87E6255407D164CD4229E3B40E8C6EE157F62554010CF09FB219E3B40E5F4F8A17F6255403F380545209E3B4044024CF97F625540CF0F69231F9E3B40D0E8B95D80625540CCE7CEAB1D9E3B40F7A82ED980625540FA40F5C71B9E3B404404ED8281625540DE90F472199E3B40EFA8180F82625540F3A2FA0C189E3B403936A7C383625540AA227F6D189E3B40D2797CC3846255407304D71C159E3B40FFC80ECB84625540EEBAE527129E3B40F95314F4856255404BCD62AF0C9E3B403B34EC53866255407D6094B90A9E3B40F2F11CC586625540D2024333089E3B4093AB4D2A876255407831F5F9049E3B400790084387625540884AFC3B049E3B40C05BD86A87625540238FD60F039E3B40ABEC09BD876255401F1C8CF7FE9D3B40E1F2EC4488625540901BC9DAFD9D3B408578C8B98A625540F5465316FF9D3B40318E5CB98A625540353D051EFF9D3B403FE219BD8A6255404071F01BFF9D3B4097867B4D8C62554051151FB1FF9D3B407060308E8D6255401613C618009E3B40BBA2F7858E625540F2079D97009E3B4008BA38B18F6255402A5073EC009E3B40A4CF88D88F6255406D1920FA009E3B402366160390625540B2E30030019E3B40DC748523906255407CA07465019E3B4086D3D750906255407DFFC051029E3B4004B39E87906255404AB2C806049E3B40851620CB90625540BECFBBA2069E3B40CAA894AC90625540A29B776D0A9E3B401482FD9B90625540FF15CC800D9E3B40292B1BE29062554068133442109E3B404BF6287691625540C7A52134139E3B407F505EF59162554057D26F82169E3B40C456924F92625540ADC28489199E3B40539E1693926255402ADCBECB1C9E3B400E9584B3926255403E6133A81E9E3B40F7BACAB3926255407736D215239E3B40BA0B6C8192625540A0B21359269E3B407BC5F9E191625540DBA41A7E2A9E3B4062F6FDBF916255407C163E4F2D9E3B40B242B28B916255409C73C396319E3B405551E62C916255409F77E0CB349E3B407082F59C90625540BC9A5783379E3B404BEB71268F6255407850A7D83A9E3B40561DC19D8E625540D2D5DAD23C9E3B4067E820188E625540FBAF04C23F9E3B40FA6783DB8D62554022CDC200439E3B40C7E020CE8D62554037D11D9F459E3B40CA1212CE8D625540FE2571B2459E3B4008BA44DF8D625540804F067F4A9E3B40CD2627E08D625540D10835A64A9E3B40062E24AC8D6255406D29634A4E9E3B40502D09738D62554096E88EF9519E3B4011F73C878D6255404C868EAB549E3B40604F220B8E625540DAA2A142589E3B4044DA31378E62554004D1AD815A9E3B40A1C65E7E8E625540B59188265D9E3B40155499A58E625540F8F6CFA05E9E3B40B9F65E028F625540ECC5092D609E3B4016DE98498F625540F1884A2E629E3B40D66D2E688F6255407C8AB570639E3B40D855617E8F625540911EEB6E669E3B40B465A0928F62554006447FD46C9E3B401928359A8F6255404DF38D78729E3B40A877304A8F6255407C76F9A6769E3B4001B669248F62554027797B1E789E3B4040F9D0228F625540C98BA10F799E3B40AE27761B8F6255400525EE867F9E3B40100138258F625540FE441916809E3B40A98B4FD38F625540BA1641A5849E3B40C32221D58F6255409AA8F0BF849E3B40621CECC68F625540B08A3B878D9E3B405704AEBE8F625540F0142964929E3B40776227B38F62554056F090A7929E3B4004997F478F62554097B9271D959E3B40605F47938E6255404BB01C3B999E3B4097E29AD58D6255409D5E5B909D9E3B40D92B8FAC8D6255404FE31FD29D9E3B400AE9CA758C6255402824800D9D9E3B400513AC238B6255400C9E91379C9E3B400A2AF2738A6255406F4462339E9E3B407679C8268A62554095E76F329F9E3B40E71F22DB89625540D56D86EFA09E3B403E9FCF7A896255407C0F30C5A29E3B40AE5C6EF98762554014FB8C49AB9E3B40FDB1B18286625540EB3592ACB39E3B40EBD9900686625540C436D330B69E3B40EB40D3D48462554009E4451FB89E3B403218FF91836255402F59DB7CBA9E3B401D41279C82625540B6F3E564BC9E3B402C60263682625540D3103554BD9E3B4023721FEE81625540BBD5A1ECBD9E3B40B9558CA1816255403DC5288DBE9E3B40DC2965658162554085F6C3DEBE9E3B40985DBB908062554002E9FD34C09E3B401661D02B80625540EBB740ECC09E3B4036E738ED7F625540F8A27563C19E3B40DBDB54A97E62554037805DE5C39E3B404155F3457E6255404EB88BA9C49E3B402AB8C7CA7D62554095D9A95CC59E3B40A9F939F67C625540D45D1E2CC69E3B403BC5508C7C625540F39F5D69C69E3B403D7F9E467C6255402E059F61C69E3B407EA451F47B62554024068D5CC69E3B407B7153897B625540B9D43749C69E3B406E83014D7B6255405E7FA534C69E3B4094B42A107B6255404CC62CF1C59E3B4019E0CEEB7A625540B55E2AA0C59E3B40CF4987CC7A625540A915F613C59E3B40EC6EFECC7A625540DA52BF87C49E3B405337FEC97A625540E5206F17C49E3B40F75CE9167A6255404052B954C19E3B4004961A9479625540B644F713C39E3B407A70E01A786255403B3A609CC59E3B405B7FBC59766255407F808C1EC89E3B40D1448BB3756255408F729639C99E3B4021D6D007756255405B42466DCA9E3B400F86407F74625540FA1410BECA9E3B400A9AE08673625540C292511CCB9E3B4012B7402673625540530AEC45CB9E3B40C092BE63726255401A00DBD8CA9E3B4019F6B3B571625540E7346689CA9E3B40E57EEF5F71625540AB1D0449CA9E3B40E226EE3B70625540B0A063B4C99E3B402FE7E14970625540E996F5DEC89E3B409D00000083823F49766255403064519E529E3B4087B81A1F756255406308C4D9549E3B40ED20DBA974625540BD9D3B42569E3B4079B53D7B74625540A4E11CD3569E3B4042391E3D74625540D015EBCE579E3B4024E76AFF736255407FC6CFF4589E3B4040627DBB736255409AD9F4AE5A9E3B4088482A7673625540C8FFF7DC5C9E3B402DAED04373625540FD5623F25E9E3B4002E72D2573625540EB53C28C619E3B406699D80E736255404AB86E55659E3B40D900BA0B736255400B474DAE679E3B4033155B06736255403E68261C6E9E3B403BBAE00573625540EA687F51719E3B402B7291F0726255400C7B62A5789E3B404F9793F372625540DBE45D637E9E3B40BCC4FCF4726255409A36C014819E3B404C2C23F6726255408132B802879E3B40E0B9A4E672625540C4C15F33969E3B404593F3E872625540DC83DC95999E3B40C2D8BDE772625540D298A1A5A39E3B40DAFA3AE672625540420B3EB6A59E3B4015EDA1DE726255401BF10932A89E3B40F61ED6D6726255403A67665DAA9E3B40D392DAC77262554022756150AD9E3B40121D479C72625540E661ABFCAF9E3B408F2CA28972625540F1FE89F2B09E3B401E8B3A52726255404237D660B39E3B40E6A4082A72625540377117EAB49E3B40E8D70605726255402BC8AF1BB69E3B405EF48FE5716255407527A602B79E3B40A67D14BB716255406115E111B89E3B40B699317F716255402188BB60B99E3B4090F45542716255402A5E7FA4BA9E3B40D0C12DDC706255402B3BC8A1BC9E3B40FCC23C43706255408AACA2E1BF9E3B40D4651FE16F625540E814EFAFC29E3B4028F05EBD6F625540C638AF13C49E3B40D24DFE776F625540BCFC22FCC59E3B409098735E6F625540D0BFF6AFC69E3B406406A93A6F625540CE4A5505C79E3B40B1F84D1E6F6255409861A418C79E3B40D3D6AF016F625540432E1A0BC79E3B40E670BAE76E625540428018DEC69E3B40EF1EDCE16E6255400FB4E481C69E3B408DAC05DA6E625540DF88FB24C59E3B4067E013B16E625540B22B3C65C09E3B402C8CA5AB6E625540EE85E666BE9E3B40947BA89C6E6255408EC510FCBC9E3B406058B1736E6255400927C5CCBA9E3B40C3D434516E625540416E144DB99E3B40994A69116E625540486E2A5BB79E3B40F05384946D6255402816C2FFB39E3B401D38554D6D625540BD9EEA03B29E3B40920A9CEE6C625540B4CB5A92AF9E3B40916A979E6C625540276FF221AD9E3B40D6EC63536C6255405D109551AA9E3B408D991EE86B625540F3049256A69E3B40FD8904C16B625540E95EA4F8A49E3B40E927ED7C6B62554067CE2F56A39E3B40501BEB0F6B6255400815D593A19E3B4032594A896A625540F90470B29E9E3B40BAA0E13E6A6255406DD445469C9E3B40751D17096A6255402C29B3449A9E3B40EA13B8BD696255406DD8256B979E3B40C1E7BF98696255401EB2C963959E3B40416BA88C6962554095311687939E3B40126E848E6962554091B3014E919E3B40091DB19D696255400F05FBC38E9E3B40512DD6B869625540924BA8E98B9E3B407F174EF86962554092BA04DB839E3B40FC9FD8186A6255403269B8D07E9E3B4070028F3E6A62554013C337B7789E3B40D2CC6B4F6A6255401D6FD435769E3B40DCDA65646A625540197CF217739E3B407F12416C6A625540F9F6952D709E3B404CCB6A476A6255408180BA436A9E3B40959267396A625540854469FD679E3B40586CD2396A625540FF2C36C7659E3B409EE2CF5B6A625540EE7CFA85619E3B403BBB618C6A62554042C56AD85E9E3B40E1B351BC6A6255402B4425365C9E3B40F61266E06A625540643EF874599E3B409251CEF96A62554055340186569E3B40D826D9036B62554083DF20A5549E3B4048375B0F6B62554080F64F51519E3B408BA0620A6B62554080BB9D504E9E3B4035A0E8D66A625540E1518D9C4A9E3B40E33E224A6A625540F70B56F03F9E3B4015CB04E369625540DCB09EEE349E3B40E1C8F2C06962554072D05F87319E3B403323465A69625540435B78B4299E3B40A6C5302069625540375D3ACF269E3B40B281DBC368625540A6167C13249E3B4067DE4D366862554092B70CC4209E3B400756276268625540F01E1D5B209E3B40ED6A180969625540633B9A171F9E3B4050996DB4696255404CB0E4461F9E3B40ADECA64B6A625540B08F8DF71F9E3B40B7700DA56A625540AFF898A0209E3B40FB71B5C66A625540B244C25F229E3B406654F0676C6255407F702652249E3B40C8EC2FF76C62554037EA89D1229E3B40A0C0AB506D62554043718B61239E3B40E2C046C66D625540A74B6D2F249E3B40C6DD3C896E625540E56BFC03259E3B40C2D4EB9C6F625540569DEF8C259E3B40A481247070625540D36BEBC5259E3B402D7712C57162554061D37233269E3B4078B55FA472625540C4A0F16E269E3B40B6CDED8E736255404D9AB4E1269E3B40F02074C97562554093D3740D279E3B4069CCC06878625540F336E460279E3B40A5DB4ED679625540E59DF6C5279E3B4092C7407E7B625540899C8AF8289E3B40DC0DBE607C625540FFC402A1299E3B4015F3E0B57C625540661BF2DE2A9E3B406224B8EB7C6255400FB3F9BA2B9E3B4023BA94FE7C6255405396E5072C9E3B402F60A8037D625540AD6262AC2C9E3B40178B67FA7C6255408D42B04C2E9E3B40934BCAF47C625540B136039D2F9E3B408781AAED7C625540E76C7761319E3B40BE729EE17C6255406535EDA5339E3B407A3AE8C37C6255409C462F2F379E3B40BF6B3AA27C625540F784266D3A9E3B4007DE24887C625540081D5C513C9E3B4062F08A797C625540F1B4E69E3D9E3B40496077687C6255402EB406A93E9E3B40A2085A587C62554002C6A55C3F9E3B405F38F3417C6255400C82E950409E3B4004ED5E347C6255407F2427D0409E3B4022DCD2127C625540972B3CC8419E3B40401DE4F97B6255406DADE889429E3B40F06491D47B62554043B79595439E3B4005D020BD7B625540FAAB0C2C449E3B4018F979AB7B625540B2B3AC90449E3B404CE1CA917B6255406937C903459E3B40138386577B6255400779CB17469E3B40B19D48297B625540FF3D33EA469E3B40031CFB017B6255404915CD82479E3B407AAE06CD7A6255406B2AE84A489E3B409002C2997A625540356F1513499E3B4032534B847A6255404EBA0263499E3B40E917CE367A6255405AD9A9964A9E3B406BC9E7F07962554018DC09544B9E3B40436DCDA679625540D54E1D404C9E3B40CA8C9E7379625540527228B64C9E3B40743B894979625540FEF0040D4D9E3B4001E1A71C79625540FEF1CC6A4D9E3B40FE67F1E478625540C3EC0CDF4D9E3B40BC334E5E78625540465397BD4E9E3B40C29E08F877625540C445B47D4F9E3B40A3112197776255401131DE6F509E3B401B242931776255402863504C519E3B40CB440FCE766255404F0B9FF3519E3B4083823F49766255403064519E529E3B4074000000642BABD874625540D6A5BDFFA19E3B4009032A07756255404317B5F2A19E3B407B74103875625540625E82F6A19E3B40FAFE933875625540F1B8B313A19E3B4010BDFE39756255400CB33FA29E9E3B40B24F2809756255401B8EE19C9E9E3B40266C13767462554090712A859E9E3B4002DC0F3F74625540DB615C559E9E3B40EE977F2A74625540172CCA299E9E3B40A918B6FC736255406FDC68BC9D9E3B40F5659ADE73625540EC838B449D9E3B405BE942C8736255403D0AC2D49C9E3B4019F37EB573625540D72D462D9C9E3B4071E16AB1736255404533C3BE9B9E3B40CF2E29AF736255404F3B5886999E3B401A2FB8AF73625540A0B3524E929E3B4079E5ADB073625540906DFA9F8E9E3B40F87DFBAC736255409521CD028B9E3B408B6FCCAA7362554011E079FD869E3B40444CE8B3736255407CBBDE0B839E3B40FEC40DAC73625540365FD186809E3B40E504BCAC73625540C548A76E7E9E3B403E2091AD736255403B77ECDE7B9E3B4058DD5FAE73625540C53EC962799E3B40516A0AAF73625540B056FF55779E3B4090371FB073625540D0A24402749E3B40E3DF33B1736255402D53FAAE709E3B40EF11BBB273625540CD913DFB6B9E3B40AE1FE8B3736255401DA6DE5C689E3B4001C5C8B47362554065139CA9659E3B4007F53FB5736255401DEFDA3A649E3B40D97A41C17362554057CE2F06629E3B40662B2FD27362554036DA6B8E609E3B4087DEA6E873625540D544DE8E5F9E3B404D687A0E74625540A70AC3EB5D9E3B40D442E53974625540A4F2FB475C9E3B4077EC606A74625540D85B1B1C5B9E3B40229A349E746255404C4CDFD0599E3B40408E71E8746255402BDEA29E589E3B4083E5B83375625540A08AA783579E3B40BD475988756255406D5ACBA0569E3B40C7A1FBCC75625540091BCEE8559E3B402DD45A3676625540B8335D26559E3B406BED4A7776625540490089AE549E3B405534DFF576625540877EB61D549E3B4083C6B67077625540530C32BB539E3B40C19C171C786255402C11E87F539E3B406FD877AB786255406A86F68B539E3B40EB2439FD78625540471836C4539E3B40C1014446796255405E1777F6539E3B408309C2AE796255403C321B6C549E3B40001D6D1B7A625540FB1DEBFC549E3B40879E62C17A625540C11D7753569E3B40126E6E467B62554014897ADC579E3B407071E2A97B6255405B9AA746599E3B406D3B74F77B625540F5527EA05A9E3B405CC00FF87B62554016277AA55A9E3B4088E884067C625540E10696085B9E3B40694551157C6255405B8D7C735B9E3B40408BC02C7C625540A039880F5C9E3B403D9C42427C6255408B4B37B45C9E3B404FB8C15E7C625540AF26AA745D9E3B403A812A807C6255405A1884805E9E3B40DCE449967C625540BDE10326609E3B403FC304A27C6255400D65D4E6609E3B405C9D1DCF7C62554031FD4A2F649E3B40A14469F67C6255401A5B2D28669E3B4090874F187D625540D0073191689E3B408ED2C7887D625540142554706B9E3B40990C9B197E625540DA85792A6E9E3B40AF73EC287F625540A78EB236739E3B40404CB9CA7F6255407E67840B779E3B40DA7F2B2B8062554021E5B039799E3B406ADE35A48062554054EDA5507D9E3B40B86B6CD8806255401822060F7F9E3B4091368C368162554011B8B333829E3B403A9CA07881625540490E9660859E3B4038CEE98C816255409858C04C879E3B407ED2FB9D8162554066B0F4408A9E3B40BE41588681625540910210A08D9E3B40DF972955816255405A5DBE07919E3B4023F361468162554074A4B10D929E3B40667A47F880625540AE74B413959E3B40B953D6A380625540B051C9E4979E3B40F3B0F95480625540019CCBE9999E3B403FFD0C258062554082D38B029B9E3B40035D6AF07F625540A54CB9359C9E3B4091880D807F6255405E023C899E9E3B40A07408227F625540C11AF823A09E3B40F8C28EB17E6255405106A4C6A19E3B4020777E527E6255407E83D703A39E3B40A5DDB0AF7D6255404F4A9AB6A49E3B406C2BFDE07C6255400E93727FA69E3B40ADBC3B407C6255405172F0D5A79E3B401E9F7E767B625540144E723DA99E3B4003FE24077B625540F8D46CE9A99E3B40C91CB4727A6255404296B0CEAA9E3B403A84E4D9796255409FA8E251AB9E3B40D1FA0B0879625540BC0318B0AB9E3B40BB5D484D786255400FCAE9EFAB9E3B400A907072776255403D4C6FE1AB9E3B40D90035B0766255401DB05A6DAB9E3B4043D4BF0176625540F0D9A598AA9E3B4077732781756255404E3E3ED8A99E3B406583EA1F756255404A0F781CA99E3B406396FEC674625540F0CD4327A89E3B40377B7080746255407E548435A79E3B4021AEE2557462554009198736A69E3B4018676A457462554083DDF27BA59E3B40ED77C53674625540F4B2DB76A49E3B40B271814074625540949D1A86A39E3B4061B2C64D746255403AEDB30FA39E3B4008D17D6874625540641F0B88A29E3B400E8B428E74625540E5E2C33BA29E3B40D8F796AE74625540502D951DA29E3B40642BABD874625540D6A5BDFFA19E3B40
\.


--
-- Data for Name: utilities_septictank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_septictank (id, name, area, geom) FROM stdin;
1	Septic Tank	9.66554000000000002	0106000020E61000000100000001030000000100000005000000FBD70CC96A62554023F7C4DC669E3B40DF957D1D6B625540433A4FF6669E3B40E57477266B62554057D76618649E3B4033B906D26A625540C394DCFE639E3B40FBD70CC96A62554023F7C4DC669E3B40
2	Septic Tank	20.4494000000000007	0106000020E61000000100000001030000000100000005000000E64404AC8F6255403F73C8F82C9E3B405A6E87009062554005F9A5562D9E3B40417C1D7790625540A06538C5279E3B4092569A229062554005E55A67279E3B40E64404AC8F6255403F73C8F82C9E3B40
3	Septic Tank	22.1375999999999991	0106000020E610000001000000010300000001000000050000007666CCAA906255407FB2E1992D9E3B4005C666079162554092F35BE12D9E3B4059632F5391625540E4407119289E3B405A0895F690625540AB03F7D1279E3B407666CCAA906255407FB2E1992D9E3B40
4	Septic Tank	36.5319000000000003	0106000020E61000000100000001030000000100000005000000B38F8ED48F62554013B9139A409E3B408B8A99A690625540A3255FF7409E3B407650BEE690625540214899B43C9E3B406D5DB31490625540B7E24D573C9E3B40B38F8ED48F62554013B9139A409E3B40
5	Septic Tank	7.29098000000000024	0106000020E610000001000000010300000001000000050000003A0A17B98F625540072468825A9E3B4088A2022390625540C83F9DAB5A9E3B404912E42E90625540C4C643F5589E3B40A07BF8C48F62554001AC0ECC589E3B403A0A17B98F625540072468825A9E3B40
6	Septic Tank	3.79768000000000017	0106000020E610000002000000010300000001000000040000003278EC0E90625540D863CB63679E3B4012C0281190625540A330E567679E3B406D313711906255406C352E66679E3B403278EC0E90625540D863CB63679E3B40010300000001000000050000006D313711906255406C352E66679E3B40DA07215B90625540171B21B3679E3B406A455D669062554030AA0A63669E3B402EF2291B906255404328CF37669E3B406D313711906255406C352E66679E3B40
7	Septic Tank	11.1789000000000005	0106000020E6100000010000000103000000010000000500000052600BA8896255403ADEC2A7799E3B40A2253B028A6255401C455547799E3B405258C2CB89625540F0C3E463769E3B403C95927189625540305B52C4769E3B4052600BA8896255403ADEC2A7799E3B40
8	Septic Tank	5.64109999999999978	0106000020E610000002000000010300000001000000040000008DE97A358C6255400E2E2429A69E3B40E73078358C625540CDA1582CA69E3B404789D9358C62554023B1E92AA69E3B408DE97A358C6255400E2E2429A69E3B40010300000001000000050000004789D9358C62554023B1E92AA69E3B40B3E7276E8C625540B3AEC638A79E3B409C32BCC28C625540DD087925A69E3B40603910778C6255403B741735A59E3B404789D9358C62554023B1E92AA69E3B40
9	Septic Tank	35.2822999999999993	0106000020E61000000100000001030000000100000005000000710C0F4F6F62554010B30ED9589E3B40AAB8A44870625540337B97EB589E3B403305E64D7062554095284E62559E3B40F9B210526F625540A11DAD4F559E3B40710C0F4F6F62554010B30ED9589E3B40
10	Septic Tank	1.32173000000000007	0106000020E61000000100000001030000000100000006000000BE9A94696C625540E4D9DE70959E3B404CD33DA16C625540E9E40372959E3B40F892BEA16C625540109095DA949E3B406F00BF696C62554019E16CD9949E3B4052F1E9686C625540303B706E959E3B40BE9A94696C625540E4D9DE70959E3B40
11	Septic Tank	9.90113999999999983	0106000020E610000002000000010300000001000000050000009DF08EAA646255403CA077B9A79E3B409C516342656255405D40F9B7A79E3B404CE9E84465625540E5296113A69E3B403ECAD0AA64625540EA4DE81CA69E3B409DF08EAA646255403CA077B9A79E3B400103000000010000000400000024488EAA64625540E81A97BDA79E3B409DF08EAA646255403CA077B9A79E3B40C20052A86462554004437DB9A79E3B4024488EAA64625540E81A97BDA79E3B40
12	Septic Tank	76.5653999999999968	0106000020E6100000020000000103000000010000000400000074AFAC365D6255403A0AD4CBAD9E3B40208EE5385D6255405974EFD3AD9E3B403057EC385D62554056BCF5CBAD9E3B4074AFAC365D6255403A0AD4CBAD9E3B40010300000001000000050000003057EC385D62554056BCF5CBAD9E3B40A788E1205F6255407F8685E8AD9E3B40BB2B43245F625540654CF8EEA99E3B40CA71403C5D625540795E65E2A99E3B403057EC385D62554056BCF5CBAD9E3B40
13	Septic Tank	74.7513000000000005	0106000020E61000000100000001030000000100000006000000252CF07854625540A36D58267B9E3B407294B0F2556255405B984E427B9E3B4051C1ABFD55625540AF34A648769E3B40536F77805462554007FF9444769E3B4022A690755462554048FC33267B9E3B40252CF07854625540A36D58267B9E3B40
14	Septic Tank	3.07703000000000015	0106000020E6100000010000000103000000010000002500000054098835526255409BC09D722D9E3B401F53DC3C526255402396A4702D9E3B40DC7CFB435262554020392A6A2D9E3B403621AE4A52625540270D615F2D9E3B40F626C05052625540A3F79C502D9E3B403E56025652625540D5D3503E2D9E3B40D5C74B5A5262554005F50A292D9E3B405E237B5D526255406ED370112D9E3B40A5A2775F526255405A053AF82C9E3B405DD231605262554038AB2ADE2C9E3B40400AA45F5262554078790DC42C9E3B403199D25D526255408490ADAA2C9E3B4094A3CB5A526255406B50D0922C9E3B4061B5A6565262554068592F7D2C9E3B40F90A84515262554073E8726A2C9E3B4065968B4B5262554049BA2C5B2C9E3B40A3C8EB44526255400D9ED34F2C9E3B406128D83D52625540CBD8BF482C9E3B4035C1873652625540827728462C9E3B408777332F52625540F9A121482C9E3B40D74D142852625540E0FE9B4E2C9E3B408BA9612152625540BD2A65592C9E3B40D2A34F1B52625540244029682C9E3B4091740D1652625540D763757A2C9E3B40EC02C411526255408A42BB8F2C9E3B405CA7940E52625540056455A72C9E3B400028980C52625540FD318CC02C9E3B403AF8DD0B526255401F8C9BDA2C9E3B4042C06B0C52625540DFBDB8F42C9E3B403C313D0E52625540D3A6180E2D9E3B40CA2644115262554008E7F5252D9E3B40F71469155262554028DE963B2D9E3B405FBF8B1A52625540394F534E2D9E3B40FA338420526255407E7D995D2D9E3B40C301242752625540F399F2682D9E3B401AA2372E52625540355F06702D9E3B4054098835526255409BC09D722D9E3B40
15	Septic Tank	17.4255999999999993	0106000020E610000001000000010300000001000000050000004464CC575F62554067A14C7C029E3B404FB210456062554047484B7E029E3B400CD0604560625540D326ADA5009E3B40FE851C585F625540B880AEA3009E3B404464CC575F62554067A14C7C029E3B40
16	Septic Tank	1.78512000000000004	0106000020E6100000010000000103000000010000000500000069E128816B62554002BDA5FA0C9E3B40857CD6C86B625540AE5BABFD0C9E3B40A5B85EC96B6255401BC66C5D0C9E3B40EC1DB1816B625540A727675A0C9E3B4069E128816B62554002BDA5FA0C9E3B40
17	Septic Tank	1.70945999999999998	0106000020E6100000010000000103000000010000002500000044C4D0D36E625540F636F58A129E3B40704347D96E625540639D7C89129E3B40E42896DE6E6255404B79A884129E3B408D2A94E36E625540EB599E7C129E3B4085731AE86E62554042C89C71129E3B4026D205EC6E6255408D60F963129E3B40D4C937EF6E62554082381E54129E3B40058097F16E625540EEA58642129E3B40B97D12F36E6255407A7FBB2F129E3B40EE3E9DF36E62554091F44E1C129E3B40638C33F36E625540981BD808129E3B403B9CD8F16E625540575BEEF5119E3B4020F996EF6E6255400CD124E4119E3B402C3080EC6E6255400CD805D4119E3B407348ACE86E625540E7D50EC6119E3B400C0839E46E625540416AACBA119E3B40910C49DF6E625540F22237B2119E3B40D5BD02DA6E62554066CAF0AC119E3B401A238FD46E625540256802AB119E3B40F6A318CF6E625540B9017BAC119E3B4089BEC9C96E625540D0254FB1119E3B40EDBCCBC46E625540144559B9119E3B40F57345C06E625540BDD65AC4119E3B4054155ABC6E625540563EFED1119E3B40A61D28B96E6255406166D9E1119E3B406F67C8B66E625540F5F870F3119E3B40B4694DB56E6255404D1F3C06129E3B4071A8C2B46E62554036AAA819129E3B40F45A2CB56E6255402F831F2D129E3B400F4B87B66E62554070430940129E3B401CEEC8B86E625540D8CDD251129E3B4010B7DFBB6E625540D8C6F161129E3B40C99EB3BF6E62554019C9E86F129E3B4036DF26C46E625540BE344B7B129E3B40B2DA16C96E6255402A7CC083129E3B407B295DCE6E625540B5D40689129E3B4044C4D0D36E625540F636F58A129E3B40
18	Septic Tank	12.9550000000000001	0106000020E61000000100000001030000000100000005000000B348B62D8B625540E62D93EF749E3B401F7F339C8B6255405CB170ED749E3B4001830D9B8B6255409328E9FA719E3B40874F902C8B6255408EA50BFD719E3B40B348B62D8B625540E62D93EF749E3B40
19	Septic Tank	1.59698999999999991	0106000020E610000001000000010300000001000000050000003E5DD24F8E625540E741B8307E9E3B4089ED9F7E8E625540B95EC92D7E9E3B4026808A7D8E625540FE5445527D9E3B403DF0BC4E8E625540483834557D9E3B403E5DD24F8E625540E741B8307E9E3B40
20	Hume Pipe	0	0106000020E6100000010000000103000000010000000500000031C73A149362554032FB89BA859E3B407B825B219362554050E872A1859E3B401C4E66149362554059BE4287859E3B40D3924507936255401FD159A0859E3B4031C73A149362554032FB89BA859E3B40
\.


--
-- Data for Name: utilities_sewerline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_sewerline (id, name, geom) FROM stdin;
1	Sewer Line	0105000020E61000000100000001020000000600000030D528C380625540BFAD19CB129E3B407060F7AF81625540CEFAA419149E3B40D82632A77D62554089E0BCEF229E3B40A7E16DA97F625540C409062C299E3B402BE83EE98F625540C982CC182A9E3B40B7C24AEA8F625540EDDB380C2A9E3B40
2	Sewer Line	0105000020E61000000100000001020000000200000049A94E4490625540AEF8F0272A9E3B4078B39FD790625540C540862E2A9E3B40
3	Sewer Line	0105000020E61000000100000001020000000200000060CCB0859062554026AE7D893C9E3B406CCB3EDE90625540578A97C12D9E3B40
4	Sewer Line	0105000020E610000001000000010200000002000000C6985EF78F625540BE23AADF589E3B403E839131906255403FD463C3409E3B40
5	Sewer Line	0105000020E610000001000000010200000002000000ED1388469062554089BABD50669E3B409A646CEE8F62554055DF27975A9E3B40
6	Sewer Line	0105000020E610000001000000010200000008000000E2654F3690625540DF64CC8C679E3B403B1A554F90625540AD80EAD06B9E3B40D28D093E9362554055972FF26B9E3B405402082B9362554037ADDFC6719E3B40AB3EF823936255401556B6C8769E3B40FFC3C6249362554069642A757C9E3B40FBF5D90693625540B4913B5D859E3B40DB7C4607936255403A2FE59F859E3B40
7	Sewer Line	0105000020E6100000010000000102000000020000002D9C06E18E625540460AE857249E3B40BEC24AEA8F62554009DC380C2A9E3B40
8	Sewer Line	0105000020E610000001000000010200000002000000DEEFD9238862554054599779359E3B40BEC24AEA8F62554009DC380C2A9E3B40
9	Sewer Line	0105000020E610000001000000010200000002000000ACF84F3E8D62554099EF2DCA599E3B403D02A2BD8F625540571ACBDA599E3B40
10	Sewer Line	0105000020E61000000100000001020000000200000093476FC48C625540C621AF82709E3B403C137D9B8B625540C09F3E19739E3B40
11	Sewer Line	0105000020E6100000010000000102000000030000001B5FB1E3876255408A7FBDBD749E3B40966C607589625540B773536E739E3B40B5EE069E896255407469CA94769E3B40
12	Sewer Line	0105000020E610000001000000010200000002000000E53ED5E4896255403D6F43B8779E3B405F8F2D2D8B625540709CA690739E3B40
13	Sewer Line	0105000020E610000001000000010200000015000000825610987A62554091D0111A7A9E3B402500DA8D7A62554065B854897B9E3B405271578C7A62554045F875FD7B9E3B401821B17C7E625540EC040E6A7C9E3B40D8E331677F62554071919757809E3B40BD58D07480625540D51B11A9809E3B407CFEB0D2806255401A49DFAB829E3B4031F38B1481625540889A15E6859E3B407181BD2C81625540103D8130899E3B40E22CBE3F81625540D806EDA58A9E3B40DC56AF838262554070DC828F8A9E3B40BA1A18B0826255409CFB19E9899E3B4095DEC20D83625540FDDFBEDF869E3B4090C98C0784625540AD247CBC829E3B40219DED1085625540D360851A809E3B4000F43C7B85625540C828B0647F9E3B40DD9FFC898662554008EEA3617E9E3B4080A1BE79886255408A3800407D9E3B408A94080A89625540541B9C2D7C9E3B400EAB8A7F89625540C16A6C89799E3B40E3768C9A8962554066758FF0789E3B40
14	Sewer Line	0105000020E61000000100000001020000000200000028C3D86788625540E9B7221C7F9E3B4080A1BE79886255408A3800407D9E3B40
15	Sewer Line	0105000020E610000001000000010200000009000000C9D7FD6489625540AAB517D3829E3B4011CF57D88962554079C49D0F829E3B40FEB14D338A6255400475F0E2809E3B408264C5BA8A625540F6F53D9F7D9E3B4095B3B2178B625540CEF4A8217A9E3B406DA518528B6255408A400693779E3B40CC8368768B6255403EAD4421769E3B4087DA81848B62554049D21949759E3B40E75D638B8B625540E631F0ED749E3B40
16	Sewer Line	0105000020E610000001000000010200000008000000253DED9B8B62554027567D1A749E3B40670061D08C625540D2354AB7739E3B40601F59F98D62554000E8B99B739E3B40622BC2868E6255408DDA5D1E779E3B40A413A315906255404C481F227E9E3B40455B150391625540EF45D78E849E3B40F26F953F92625540E1AEB56B859E3B40DB7C4607936255403A2FE59F859E3B40
17	Sewer Line	0105000020E610000001000000010200000002000000E7A11EFF8B625540A16669D2A79E3B40732683588C625540290CC0D6A69E3B40
18	Sewer Line	0105000020E61000000100000001020000000D000000CB958F807A625540E6A9838D9C9E3B40229301CD7C6255403451B6D69B9E3B4012C9F6B37E625540F32E9D7A9A9E3B406AD0366D7F625540E8BCFD81999E3B40C2D9F82B80625540E9CD1759979E3B404E761A988062554050182126969E3B4052CD88E280625540B3CC9693949E3B40092C45F780625540574DE7D4939E3B40A5E7F5188162554028EC104C929E3B40FF5A232F81625540B4C1408C909E3B4005F0224D816255401A55CBDB8E9E3B408E83A96C81625540BEEB1C7F8C9E3B409A3F818381625540E5AE46A08A9E3B40
19	Sewer Line	0105000020E61000000100000001020000000200000051E8C2D27B6255400D44C0997E9E3B4059AF3F4E7C6255407F48EC337C9E3B40
20	Sewer Line	0105000020E6100000010000000102000000020000002B443FD872625540751804E4529E3B404686144E706255405FF7E0C1559E3B40
21	Sewer Line	0105000020E61000000100000001020000000200000096304D456F6255400BE304E4569E3B40C7EF18266B6255401748D0AA649E3B40
22	Sewer Line	0105000020E6100000010000000102000000020000008711F3136D62554014401D87639E3B40F2F14C056C62554098FDF9C6619E3B40
23	Sewer Line	0105000020E610000001000000010200000007000000845E86986C625540FDC7CE997C9E3B40CBD0B12A6C625540329DDE83799E3B40B2623BC66B62554075B623FE759E3B40AD00918A6B625540E524F819729E3B40B8141F316B625540E485B0336C9E3B407BCE22096B625540ED17A1F8689E3B4074411EDC6A625540EEBBD9E5669E3B40
24	Sewer Line	0105000020E610000001000000010200000002000000C767E2F16C6255404595E281779E3B40062456C66B6255405ABCFDFD759E3B40
25	Sewer Line	0105000020E6100000010000000102000000060000003CA8EC057162554003AC2B75989E3B40572E280271625540515FC9ED979E3B4040B116126F625540A97ED7C4979E3B405707F6CE6D6255400624278F979E3B4017855BC86D625540FE07F567959E3B403327FEA06C6255401E27062B959E3B40
26	Sewer Line	0105000020E6100000010000000102000000030000001754B51370625540CE8D75DD949E3B40CE6BED1070625540F0DC9B7D959E3B40DC2D5DC86D625540A515FB67959E3B40
27	Sewer Line	0105000020E6100000010000000102000000040000001468889068625540CEB2F385B69E3B405292418066625540E9C89437B69E3B404F741B966662554089FB0E1AA79E3B404406CA4365625540DC4D98C8A69E3B40
28	Sewer Line	0105000020E610000001000000010200000002000000ECE66EF364625540F3F22172AA9E3B40523B19FC6462554065EEEEB6A79E3B40
29	Sewer Line	0105000020E610000001000000010200000006000000CE4055AB64625540746632EDA69E3B401307F08661625540769DEF02A69E3B40A3FBEED65F625540425AD538A69E3B40CBB871555F6255405904372EA89E3B40D681793F5F625540AFC22736AA9E3B40C4C5F1245F625540F4F86E33AA9E3B40
30	Sewer Line	0105000020E610000001000000010200000002000000C4C5F1245F625540F4F86E33AA9E3B400A4EBDA45F625540B8E36F40AA9E3B40
31	Sewer Line	0105000020E6100000010000000102000000060000001BC9A1325C625540EDC24EB3859E3B4005A28EC85B62554093BCC128839E3B40DDA1A3425B625540ADCFE54C809E3B409E67CE7358625540622C0EA27C9E3B403C54428C5662554029A9B3B87A9E3B40B60341F555625540D8FF4D2B7A9E3B40
32	Sewer Line	0105000020E6100000010000000102000000050000009D836D9C5862554059A7A1349F9E3B407B47AE0856625540D82C3063959E3B40FF1B6F3055625540C778BD358B9E3B4070785B1F55625540678B0E907F9E3B4002A84B1F55625540E5D4A8327B9E3B40
33	Sewer Line	0105000020E61000000100000001020000000700000049CED83973625540B79D3C25199E3B4064E5CFAC72625540910538AD169E3B4085386A7D72625540B91E2E3A149E3B40B1791345726255407DE6BCB6119E3B4045BB3A4A71625540E861A87B109E3B40F77F920670625540FF63EF3D109E3B405A7B74E96E6255408D39E9C8119E3B40
34	Sewer Line	0105000020E6100000010000000102000000020000001E6ABAB66F6255407F07BB4C149E3B405A7B74E96E6255408D39E9C8119E3B40
35	Sewer Line	0105000020E610000001000000010200000002000000AE85EAA36C6255403565F00F129E3B409A6E59BC6B625540259224FD0C9E3B40
36	Sewer Line	0105000020E610000001000000010200000007000000C2065685696255405019ED2F0D9E3B409EC40CF268625540720836A5069E3B4026246ED0676255406C4CA367039E3B401D2CEEEB6562554020F097E2019E3B407C71E52A636255400CA95384009E3B40F2739B9E606255401F31E598009E3B40E89A5D4560625540B32E99B8009E3B40
37	Sewer Line	0105000020E6100000010000000102000000080000001512FC5566625540CEA2B200069E3B40E5B5EC4365625540B99B4FBD039E3B405672A8706462554059ECC73F029E3B40C6171696636255404C08396A019E3B40B79D8C5C62625540D854EB2C019E3B40C7E0B34E61625540F0B48921019E3B405C87D28560625540AE6144EA009E3B40E89A5D4560625540B32E99B8009E3B40
38	Sewer Line	0105000020E6100000010000000102000000020000006486FB7B606255400DC72DB4029E3B40E89A5D4560625540B32E99B8009E3B40
39	Sewer Line	0105000020E610000001000000010200000002000000ABAEC736546255402B3CCFF2209E3B40A3C8EB44526255400D9ED34F2C9E3B40
40	Sewer Line	0105000020E610000001000000010200000002000000EE42D6C355625540E69D3115249E3B40A3C8EB44526255400D9ED34F2C9E3B40
\.


--
-- Data for Name: utilities_streetlamp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_streetlamp (id, name, geom) FROM stdin;
1	Street Lamp	0101000020E6100000DC719BAB7B625540ACCCA941299E3B40
2	Street Lamp	0101000020E61000005DB600237462554090A83E0B689E3B40
3	Street Lamp	0101000020E6100000F4E15216746255409B8B74E67E9E3B40
4	Street Lamp	0101000020E6100000746B55F373625540667D7B87979E3B40
5	Street Lamp	0101000020E61000004D6101E67A625540F730A026A99E3B40
6	Street Lamp	0101000020E6100000B8F85E377E625540F75AC323A29E3B40
7	Street Lamp	0101000020E61000005F3702A780625540564747A17F9E3B40
8	Street Lamp	0101000020E6100000E8F31928816255406A0D4039839E3B40
9	Street Lamp	0101000020E61000008D765DC17F6255405C7948CD779E3B40
10	Street Lamp	0101000020E6100000AFC134046A625540DA3907F0929E3B40
11	Street Lamp	0101000020E610000089A274876A625540B0F297E1769E3B40
12	Street Lamp	0101000020E6100000CB87F6D16A625540F43B000F609E3B40
13	Street Lamp	0101000020E6100000391333FF856255408E425EF4999E3B40
14	Street Lamp	0101000020E6100000D7FC35018A625540A106F4E9999E3B40
\.


--
-- Data for Name: utilities_transmissionline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_transmissionline (id, name, geom) FROM stdin;
1	Transmission Line	0105000020E6100000010000000102000000050000006428A59A93625540F67D15D1379E3B4036193D1A956255405AD6EB16299E3B40B04232BA956255409B578C7D1F9E3B40CB0E4C1596625540FB5AFA85179E3B40A997C2D6976255409758D07E159E3B40
2	Transmission Line	0105000020E61000000D0000000102000000040000005AA245EF7C62554060C21ACF0C9E3B40B3AD15C67B625540FD0B0579129E3B40DA1979D67A6255409FA5CE31199E3B40AC5016A97D6255407E6AAE86359E3B400102000000050000000A73A14F40625540EAFD54E71C9E3B40E1BC4A95506255409B64B93B0B9E3B40F33155645D625540016C80E60C9E3B401EBF11576362554057E0E3D8179E3B4078D2DC326A62554080563B3A229E3B4001020000000300000078D2DC326A62554080563B3A229E3B4004AD95AC6A6255401432F9A3429E3B40736026F16A62554025314551619E3B40010200000003000000AC5016A97D6255407E6AAE86359E3B4051443B2E6E62554090E46588279E3B4078D2DC326A62554080563B3A229E3B40010200000004000000AC5016A97D6255407E6AAE86359E3B40B094A6497D625540BC71CE0F569E3B405E85939E86625540DE8CDAD2609E3B405E389DCC8B62554019E30B5C809E3B40010200000005000000736026F16A62554025314551619E3B400EC042CF71625540971FF0EF5D9E3B403485E57174625540D11EA67F789E3B40F76D763F74625540B80C3B84959E3B406E406944756255409BAEAFDD979E3B40010200000003000000736026F16A62554025314551619E3B4029E76E1C6B625540C1DCA7717C9E3B40DE6480756A625540695A6C759A9E3B40010200000002000000C3401FB87B625540CEB831FC779E3B405E389DCC8B62554019E30B5C809E3B400102000000050000005E389DCC8B62554019E30B5C809E3B40808DD4AA8A6255402CE0DAC9979E3B40694F3AAA8D6255402A323977A89E3B401A9106D88862554011BA4005BB9E3B40726FC56488625540A6A536B8BC9E3B40010200000006000000DE6480756A625540695A6C759A9E3B4045DBB7C86162554096BBE80DA09E3B4093E459F258625540FEB443849A9E3B4060777C79556255407DE7C6879C9E3B40F33221EA52625540C304ECE87C9E3B40623FFD3E5262554099FB8505769E3B400102000000030000000F8476816E6255402834737CCB9E3B4020CB403A6C625540F1C16DA1B19E3B40DE6480756A625540695A6C759A9E3B4001020000000200000060143905686255403ECD3E1BD29E3B400F8476816E6255402834737CCB9E3B40010200000003000000C6173766726255407CAA84B1DE9E3B402FC3EC69726255402908F5A1D99E3B400F8476816E6255402834737CCB9E3B40
3	Transmission Line	0105000020E6100000010000000102000000020000000A73A14F40625540EAFD54E71C9E3B40D0C45CE73D625540DDD72A22199E3B40
4	Transmission Line	0105000020E6100000010000000102000000020000000A73A14F40625540EAFD54E71C9E3B4012EA2D3C426255400C6BA1190B9E3B40
5	Transmission Line	0105000020E6100000010000000102000000020000000A73A14F40625540EAFD54E71C9E3B40B41DCA25376255406B248B7BFD9D3B40
6	Transmission Line	0105000020E610000001000000010200000002000000F33155645D625540E56B80E60C9E3B403A0C62755B625540BD177F66149E3B40
7	Transmission Line	0105000020E610000001000000010200000002000000E1BC4A95506255409B64B93B0B9E3B40E4761EC9506255406171D1CD189E3B40
8	Transmission Line	0105000020E61000000100000001020000000200000017BF11576362554057E0E3D8179E3B407BB545CF61625540C985B2200F9E3B40
9	Transmission Line	0105000020E61000000100000001020000000200000017BF11576362554057E0E3D8179E3B402C1E63E3656255405074EC5C119E3B40
10	Transmission Line	0105000020E61000000100000001020000000200000078D2DC326A62554080563B3A229E3B40E8A555BC69625540EF5AC25D1B9E3B40
11	Transmission Line	0105000020E61000000100000001020000000200000078D2DC326A62554080563B3A229E3B401BD86E9F6D6255404D1BF1411E9E3B40
12	Transmission Line	0105000020E61000000100000001020000000200000051443B2E6E62554090E46588279E3B4084442A0F70625540C9C0F139229E3B40
13	Transmission Line	0105000020E61000000100000001020000000200000051443B2E6E62554090E46588279E3B404C770E3A74625540F76867EA209E3B40
14	Transmission Line	0105000020E610000001000000010200000002000000DA1979D67A6255409FA5CE31199E3B402472079779625540476B461D1B9E3B40
15	Transmission Line	0105000020E61000000100000001020000000200000004AD95AC6A625540F831F9A3429E3B4010CA701E6C6255401F7FE29A399E3B40
16	Transmission Line	0105000020E61000000100000001020000000200000004AD95AC6A625540F831F9A3429E3B4088A9F7616E62554020F62585399E3B40
17	Transmission Line	0105000020E6100000010000000102000000020000005AA245EF7C62554060C21ACF0C9E3B4034A8EADA816255408194EA96049E3B40
18	Transmission Line	0105000020E610000001000000010200000002000000DA1979D67A6255409FA5CE31199E3B405BE30A647D625540CC96777E199E3B40
19	Transmission Line	0105000020E610000001000000010200000002000000AC5016A97D6255407E6AAE86359E3B406F18D4CF81625540B9DC75DB399E3B40
20	Transmission Line	0105000020E610000001000000010200000002000000AC5016A97D6255407E6AAE86359E3B40346B5FB67F625540FBFA53B3269E3B40
21	Transmission Line	0105000020E6100000010000000102000000020000005E85939E86625540DE8CDAD2609E3B40E6A1E833896255407E0109425D9E3B40
22	Transmission Line	0105000020E6100000010000000102000000020000005E85939E86625540DE8CDAD2609E3B40382DF7178862554088B97C4F529E3B40
23	Transmission Line	0105000020E6100000010000000102000000020000005E85939E86625540DE8CDAD2609E3B4051B62F5A8562554075F5492C649E3B40
24	Transmission Line	0105000020E6100000010000000102000000020000006428A59A93625540F67D15D1379E3B407709D6419262554020D84986409E3B40
25	Transmission Line	0105000020E6100000010000000102000000020000005E389DCC8B62554019E30B5C809E3B4072CB9EB39162554099B607157E9E3B40
26	Transmission Line	0105000020E6100000010000000102000000020000005E389DCC8B62554019E30B5C809E3B400EB8BC7791625540319AAAA4759E3B40
27	Transmission Line	0105000020E6100000010000000102000000020000005E85939E86625540DE8CDAD2609E3B40E5F648B28C625540639CB07F6B9E3B40
28	Transmission Line	0105000020E6100000010000000102000000020000005E389DCC8B62554019E30B5C809E3B40001E0661916255401D4DE04A6B9E3B40
29	Transmission Line	0105000020E610000001000000010200000002000000F8A663A8916255407900D9FA629E3B40624A36AB916255403C1BABD7619E3B40
30	Transmission Line	0105000020E610000001000000010200000002000000808DD4AA8A6255402CE0DAC9979E3B408DDD994889625540CD58ACA7939E3B40
31	Transmission Line	0105000020E610000001000000010200000002000000808DD4AA8A6255402CE0DAC9979E3B408436AAC087625540A3775642A09E3B40
32	Transmission Line	0105000020E610000001000000010200000002000000694F3AAA8D6255402A323977A89E3B40EC09CA168C62554075ABD847A99E3B40
33	Transmission Line	0105000020E610000001000000010200000002000000694F3AAA8D6255402A323977A89E3B40B7BB202A8B62554097C01E27A69E3B40
34	Transmission Line	0105000020E6100000010000000102000000020000001A9106D88862554011BA4005BB9E3B405B0B7A2E88625540E41825A0B99E3B40
35	Transmission Line	0105000020E6100000010000000102000000020000001A9106D88862554011BA4005BB9E3B40615D77028962554018EC560CB89E3B40
36	Transmission Line	0105000020E6100000010000000102000000020000001A9106D88862554011BA4005BB9E3B4004FE016182625540A1E070A4BA9E3B40
37	Transmission Line	0105000020E61000000100000001020000000200000060143905686255403ECD3E1BD29E3B409677173364625540A4107701BE9E3B40
38	Transmission Line	0105000020E6100000010000000102000000020000000F8476816E6255402834737CCB9E3B40C573BC5E6B6255405067AECAC99E3B40
39	Transmission Line	0105000020E61000000100000001020000000200000060143905686255403ECD3E1BD29E3B407C5FE42260625540F8D06A71B79E3B40
40	Transmission Line	0105000020E61000000100000001020000000200000093E459F258625540FEB443849A9E3B40D4C0303B596255404658A4CD9D9E3B40
41	Transmission Line	0105000020E61000000100000001020000000200000093E459F258625540FEB443849A9E3B4082BF7F205C625540C939D27D959E3B40
42	Transmission Line	0105000020E61000000100000001020000000200000019CB403A6C625540F1C16DA1B19E3B4074DB765A6D6255400BEEF79AAF9E3B40
43	Transmission Line	0105000020E610000001000000010200000002000000736026F16A62554025314551619E3B4065800F176D625540478442C7619E3B40
44	Transmission Line	0105000020E61000000100000001020000000200000029E76E1C6B625540C1DCA7717C9E3B40CF9BD55D6C625540E8BEA1517D9E3B40
45	Transmission Line	0105000020E61000000100000001020000000200000045DBB7C86162554096BBE80DA09E3B400B1527D261625540542EBC289D9E3B40
46	Transmission Line	0105000020E610000001000000010200000002000000C3401FB87B625540CEB831FC779E3B406C2003C57A62554046D24950779E3B40
47	Transmission Line	0105000020E610000001000000010200000002000000C3401FB87B625540CEB831FC779E3B40F10DCA427C625540180539AD7E9E3B40
48	Transmission Line	0105000020E610000001000000010200000002000000CB0E4C1596625540FB5AFA85179E3B40167167C194625540A04F750D0D9E3B40
49	Transmission Line	0105000020E610000001000000010200000002000000CB0E4C1596625540FB5AFA85179E3B40B090747C96625540A1DB5C4C129E3B40
50	Transmission Line	0105000020E610000001000000010200000002000000CB0E4C1596625540FB5AFA85179E3B400AC0C9449962554023699B210C9E3B40
51	Transmission Line	0105000020E6100000010000000102000000020000006428A59A93625540F67D15D1379E3B407CEDDEB28F625540F1012CB4229E3B40
52	Transmission Line	0105000020E6100000010000000102000000020000000EC042CF71625540971FF0EF5D9E3B405BE4F835736255407ADFD8B0549E3B40
53	Transmission Line	0105000020E6100000010000000102000000020000003485E57174625540D11EA67F789E3B4041F31E8075625540BD9C79AC779E3B40
54	Transmission Line	0105000020E6100000010000000102000000020000006428A59A93625540F67D15D1379E3B40D68B82308D6255404C1930F23B9E3B40
55	Transmission Line	0105000020E6100000010000000102000000020000006428A59A93625540F67D15D1379E3B409F77636C8D625540AC2394A1459E3B40
56	Transmission Line	0105000020E6100000010000000102000000020000006428A59A93625540F67D15D1379E3B406281E6238D625540F34881624D9E3B40
\.


--
-- Data for Name: utilities_waterbody; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilities_waterbody (id, wbtype, area, geom) FROM stdin;
1	Swimming Pool Area	997.692999999999984	0106000020E6100000010000000103000000010000002D00000075FC6E595B625540A99DE697909E3B4004FBC86C5B625540980F6797909E3B400D1BA8675B6255408FCCB9ED8E9E3B40C83D0D565B6255401D5B9214899E3B4091F8D94E5B62554097312BF8869E3B40BAFDD4515B62554056DFB4FE839E3B4023945AC25A625540D5D7C764829E3B40228ABC715A625540E6D0D3C1809E3B40B159B6355A625540D0AEF2EE7F9E3B4046E375E659625540865F503D7F9E3B4099B6639359625540A001BE117F9E3B405EF6A14B596255400DD5DAEA7E9E3B40253A35CA58625540F04A24C67E9E3B40352F07565862554062F582EC7E9E3B407C8CEAD357625540417483967F9E3B406415E36E576255404473A146809E3B409E659AF75662554074DB85F5819E3B400C6D7786566255404E928CD1839E3B4042ECE95E56625540DD6EB3CC849E3B4017544033566255401DD99B8D869E3B406C2620135662554008608559889E3B402024560856625540F1C4AECB899E3B40DD58300D56625540A2F28D5C8B9E3B401C0E791656625540295F63668C9E3B403E64352A566255407F2FC1A78D9E3B40BEDDCE4A566255407581B2FD8E9E3B4015C471645662554051848BDA8F9E3B40D8205F9656625540156EE6E9909E3B4092C700D4566255407F368BF6919E3B4022BE821C576255402A49F0EA929E3B404A6BC75E5762554081450DAC939E3B402D51B2C85762554059B6F8BE949E3B40EA2DD51A58625540F4DDB05A959E3B40FB429079586255409C07D4B2959E3B4077DB13EC58625540E136BFEB959E3B40954A9528596255409551C5DC959E3B40A7DEF076596255403866F89F959E3B40F40EA2D3596255404E71A20F959E3B40A809A8065A6255405EED9291949E3B403BE0C5395A625540D77578F7939E3B409717EE645A62554029C5FD44939E3B405A2F8BA35A625540001DD2D7919E3B40A91759C85A625540AF64BA9D909E3B40250B7B505B6255407E833198909E3B4075FC6E595B625540A99DE697909E3B40
2	Swimming Pool	605.874000000000024	0106000020E6100000010000000103000000010000005E00000043464084586255403CFA80D2939E3B40B4B4728958625540FE9B04D9939E3B40DE82518C586255402E9F56DB939E3B40F3C9158E58625540D2CDACDC939E3B40A093B78F586255400E25F2DD939E3B40F3C7069258625540BA61F3DF939E3B407322FDC158625540681DBFF6939E3B4003555300596255400603690D949E3B404C53C24B5962554082068BF2939E3B40B6B96E9259625540E630537D939E3B407B077BC15962554042DD1D0B939E3B40A12DCCED59625540D4C9C080929E3B40E1CEC10D5A6255405BA8DEF6919E3B40C4D11D2F5A6255403F81E615919E3B40CCDCDC495A625540B8D7950C909E3B40FA0BF14D5A6255400B6567388F9E3B40F984A7495A625540232701C98E9E3B40E7590B3F5A62554010DED6098E9E3B408AA3C92F5A62554009515A778D9E3B408678A81F5A62554018ECD0DC8C9E3B40E4DA540F5A62554052DF917D8C9E3B40326D58025A625540200876448C9E3B401EF02FE8596255401C79159F8B9E3B40B1E2ACD9596255408533472A8B9E3B4035163DD35962554008F9D9CC8A9E3B4022C426D459625540D86F4D748A9E3B40E14033D959625540C1ACA3CE899E3B40C2627DE35962554003080F4E899E3B403A34DCF059625540F70A0FEC889E3B4008067A005A625540ED74F48A889E3B40876D710F5A625540F7FA9F3E889E3B4043134F295A62554075380895879E3B400E784F455A6255406A95DFC9869E3B4048D5B14D5A625540AB75A27E869E3B40BD5EC45A5A625540A32EF2EE859E3B404DDB17615A6255406609F95E859E3B40D2B2685F5A62554033D704B5849E3B40764BE5515A625540CE2C02AC839E3B405B9A4B455A6255405BB57F04839E3B40B28634515A62554080D4BFE5829E3B407CE6BB575A62554003FBF6C1829E3B405B2EB35F5A6255408EFBCB83829E3B408106935F5A625540D9DF1544829E3B40BC49105B5A625540B9663004829E3B406D9819515A6255408100E4D4819E3B40C4AD19495A6255402080B4B7819E3B404751033C5A6255401408B8A2819E3B401C9E98315A625540D3644296819E3B4023E571245A62554081A18094819E3B40D57DE5155A625540DF521CA1819E3B40C0DF480B5A6255406AF77BAD819E3B40169352EA5962554035F2EE4B819E3B4096B9AABD59625540CB9DE3E9809E3B40F16A4685596255404BC72B94809E3B40B636063F59625540F1C5E651809E3B403A4368E25862554029A56044809E3B403E22318A58625540C124E353809E3B404DBF5F515862554027515D7E809E3B407318A02958625540EB00F9AF809E3B403A9E20EA5762554013638F4D819E3B40FBAB748C5762554078DA517D829E3B4094FF373D5762554093F8DDA0839E3B40B4F2E5F5566255409422C8D8849E3B404F3D31CB566255405C7E6BDF859E3B40AE8CF7A1566255404DB69789879E3B40E52B4592566255407691288A889E3B40FDE8C9885662554013626DA3899E3B40FDB2AC8856625540ADF40A188B9E3B4042E8F79156625540ED39D9108C9E3B400613BF9F56625540A6A5D90D8D9E3B40BD11A7B656625540619A2BE38D9E3B40CD91F6D1566255402917B9D48E9E3B40FE408AED56625540634D27768F9E3B407FCA880057625540C95682D38F9E3B40766CD4FC56625540F0FA67F38F9E3B40096A9CF3566255405E475436909E3B4090C69EF15662554027F6F06F909E3B403E53EAF556625540C41D06AD909E3B40093D46FA566255408990E0D6909E3B40EECBC20657625540871D75F7909E3B40A759D00E57625540915F9E04919E3B40E3166C1A57625540DB4DC01E919E3B40648D8422576255401DC2171F919E3B40617AB53257625540A0AAC61F919E3B4003981F4B57625540B79D57FA909E3B40ED13A8665762554015BA4765919E3B4094D57ED2576255406FDE2197929E3B40A01A751D58625540CF55CB4D939E3B40034F496958625540A6033ABC939E3B40396DF66E586255408F1C58C1939E3B4074FD9F7058625540E64873C2939E3B40C7B0CA7658625540B251EBC7939E3B409CF8847D58625540ABFBCFCD939E3B4043464084586255403CFA80D2939E3B40
3	Baby Swimming Pool	41.3913000000000011	0106000020E610000002000000010300000001000000040000000BB462225A625540D22854568C9E3B405ADDB3225A6255407443305A8C9E3B40568397225A6255408D624A568C9E3B400BB462225A625540D22854568C9E3B4001030000000100000040000000568397225A6255408D624A568C9E3B40799EFB515A625540D8DC844D8C9E3B4080CB76515A625540AB7A9E1E8C9E3B4022F7825B5A62554092D3AD348C9E3B40F3A2EC665A6255402612FD458C9E3B4043270B775A625540EFFF4D5C8C9E3B40E34B8D895A62554054BF4E6A8C9E3B40C1B91D9F5A62554078F06D728C9E3B40D0446EB75A6255400D940A6B8C9E3B407C2012CD5A625540070E545C8C9E3B40C42F52E25A62554094A2913B8C9E3B4038173AEE5A625540406C051E8C9E3B408F8F0CF65A6255406F831E0B8C9E3B40B10AF5F55A62554057E7C2268C9E3B40CEFA8E255B62554090EBBF1C8C9E3B4070AB95265B625540375204B38B9E3B4096A15E145B6255401B953FB28B9E3B404A4ECA145B625540DD99D1958B9E3B408A884A1A5B625540F87ECC768B9E3B40DA1394225B625540DCD0733D8B9E3B40674787295B6255401D8E71008B9E3B40469C7E2C5B62554028DE08B08A9E3B40BDAA222E5B625540AC975B588A9E3B408DEB892A5B625540341DC0FA899E3B40CB64C71E5B62554065B7DC86899E3B40A966330D5B6255402D6FF82B899E3B40433A5E195B62554011944525899E3B40857B5E155B625540ACFF8C81889E3B400AF3A0E55A62554038E59193889E3B40BFBD62E65A62554052BF3ABC889E3B40AC6327CD5A6255409F15C792889E3B405543B6CC5A625540FEC3F171889E3B402EB946CC5A6255402FD6DC4B889E3B401A5326C85A62554041BDA430889E3B400B9E34C15A625540C70F4F17889E3B40467530B75A62554021A4D5F7879E3B408A47CFAE5A625540424D74E7879E3B400EB29BA15A625540136EE4E3879E3B409ABD50985A625540233182E8879E3B403B0B88915A62554086AB8FF3879E3B401D6CBC895A6255401FA42E05889E3B404B1AE5825A625540B3C96B21889E3B4090C49A7B5A62554059D69058889E3B407B4DA2795A625540D6B1456A889E3B406A5694785A62554094910C77889E3B40B6E901715A625540B6555982889E3B40CE4B9E625A625540C4BEC491889E3B40DA0506575A625540BE7850A6889E3B40888F29475A6255402285B4C9889E3B40292F2E435A625540917C8FD7889E3B40AB3FF2425A6255403CB97FB8889E3B40CCBBCF125A625540293052C2889E3B409B2C10155A625540323BB26A899E3B4023B1801D5A6255402F890C69899E3B40E05D28145A625540E250369F899E3B40EDE0E10C5A62554027EC99D8899E3B400BE284065A625540F42F14308A9E3B407CFBA2075A6255406692D7758A9E3B40D3BD6B095A625540DD9409BE8A9E3B40D8BD400E5A625540FF5FC1028B9E3B40A74DBD165A6255405C9D74588B9E3B408A71EC2A5A625540C17D72AD8B9E3B4038C0DE1D5A625540DF0F1AB08B9E3B40568397225A6255408D624A568C9E3B40
4	Pond	200.867999999999995	0106000020E6100000010000000103000000010000002F000000DC605C9E7762554029947665BD9E3B402E3FA2C7776255400166B94DBD9E3B40435208F977625540B3483E66BD9E3B408D75532C786255404082FE61BD9E3B40FB86C056786255403A45E836BD9E3B4057F7E17C7862554091EDBCCEBC9E3B40C40E289A7862554077AC863CBC9E3B400940AFAD786255407E5A077DBB9E3B4057F04FAE786255409DB4F0BFBA9E3B40E5A6A59D786255409444063FBA9E3B40BEF9D992786255406FE941FBB99E3B40F363706B786255408AEBCC83B99E3B40BA68C13778625540AA574A32B99E3B40517DE503786255407236A915B99E3B40E525C2BF776255407921CA12B99E3B400D14AD8177625540AE38FB14B99E3B402677C23E776255406E19A038B99E3B40E7C4C6DC76625540C4CE1BB4B99E3B40626AEF8276625540A89C8C38BA9E3B407A11DC157662554081413DE0BA9E3B405D73D6CC756255408F786973BB9E3B401E7BB79875625540EC5E6AE9BB9E3B40C006CD4E756255405A8477E0BC9E3B4013E0113575625540BF679961BD9E3B404A249F1B756255403036E236BE9E3B40D5AE560175625540C305455EBF9E3B40DC1969F6746255407869AC38C09E3B4032B52DF97462554052FD17EFC09E3B40045A99FF74625540AE1B8751C19E3B40E0E4CA07756255405141FE99C19E3B40B14A6B1375625540CAC192D0C19E3B40332E252975625540C2C9960DC29E3B4043567E3A756255407C365C26C29E3B40F3C2EF59756255402B96B433C29E3B40E88E5C7D7562554055F13133C29E3B40C59D4CA975625540E2E4001BC29E3B40C87F16D875625540EB79E9F6C19E3B401387781876625540AB877AA1C19E3B40FE1AF15376625540DAD4475BC19E3B401B49E2A176625540119E62F2C09E3B409866CEE576625540927B046BC09E3B409BD5F81077625540C2D09DE8BF9E3B4082CD452877625540D15D377CBF9E3B405ADC4D4977625540972C15BABE9E3B40B23E495F77625540305E6944BE9E3B403811927C7762554084ADFEAEBD9E3B40DC605C9E7762554029947665BD9E3B40
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);


--
-- Name: utilities_boundary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_boundary_id_seq', 1, true);


--
-- Name: utilities_building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_building_id_seq', 53, true);


--
-- Name: utilities_drainage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_drainage_id_seq', 1, true);


--
-- Name: utilities_electricpole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_electricpole_id_seq', 41, true);


--
-- Name: utilities_fountain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_fountain_id_seq', 16, true);


--
-- Name: utilities_ground_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_ground_id_seq', 2, true);


--
-- Name: utilities_road_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_road_id_seq', 1, true);


--
-- Name: utilities_septictank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_septictank_id_seq', 20, true);


--
-- Name: utilities_sewerline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_sewerline_id_seq', 40, true);


--
-- Name: utilities_streetlamp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_streetlamp_id_seq', 14, true);


--
-- Name: utilities_transmissionline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_transmissionline_id_seq', 56, true);


--
-- Name: utilities_waterbody_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilities_waterbody_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: utilities_boundary utilities_boundary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_boundary
    ADD CONSTRAINT utilities_boundary_pkey PRIMARY KEY (id);


--
-- Name: utilities_building utilities_building_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_building
    ADD CONSTRAINT utilities_building_pkey PRIMARY KEY (id);


--
-- Name: utilities_drainage utilities_drainage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_drainage
    ADD CONSTRAINT utilities_drainage_pkey PRIMARY KEY (id);


--
-- Name: utilities_electricpole utilities_electricpole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_electricpole
    ADD CONSTRAINT utilities_electricpole_pkey PRIMARY KEY (id);


--
-- Name: utilities_fountain utilities_fountain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_fountain
    ADD CONSTRAINT utilities_fountain_pkey PRIMARY KEY (id);


--
-- Name: utilities_ground utilities_ground_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_ground
    ADD CONSTRAINT utilities_ground_pkey PRIMARY KEY (id);


--
-- Name: utilities_road utilities_road_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_road
    ADD CONSTRAINT utilities_road_pkey PRIMARY KEY (id);


--
-- Name: utilities_septictank utilities_septictank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_septictank
    ADD CONSTRAINT utilities_septictank_pkey PRIMARY KEY (id);


--
-- Name: utilities_sewerline utilities_sewerline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_sewerline
    ADD CONSTRAINT utilities_sewerline_pkey PRIMARY KEY (id);


--
-- Name: utilities_streetlamp utilities_streetlamp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_streetlamp
    ADD CONSTRAINT utilities_streetlamp_pkey PRIMARY KEY (id);


--
-- Name: utilities_transmissionline utilities_transmissionline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_transmissionline
    ADD CONSTRAINT utilities_transmissionline_pkey PRIMARY KEY (id);


--
-- Name: utilities_waterbody utilities_waterbody_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilities_waterbody
    ADD CONSTRAINT utilities_waterbody_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: utilities_boundary_geom_87648dc5_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_boundary_geom_87648dc5_id ON public.utilities_boundary USING gist (geom);


--
-- Name: utilities_building_geom_86de2065_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_building_geom_86de2065_id ON public.utilities_building USING gist (geom);


--
-- Name: utilities_drainage_geom_f048d497_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_drainage_geom_f048d497_id ON public.utilities_drainage USING gist (geom);


--
-- Name: utilities_electricpole_geom_222aff66_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_electricpole_geom_222aff66_id ON public.utilities_electricpole USING gist (geom);


--
-- Name: utilities_fountain_geom_3609b304_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_fountain_geom_3609b304_id ON public.utilities_fountain USING gist (geom);


--
-- Name: utilities_ground_geom_b5f63f82_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_ground_geom_b5f63f82_id ON public.utilities_ground USING gist (geom);


--
-- Name: utilities_road_geom_58a4d80d_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_road_geom_58a4d80d_id ON public.utilities_road USING gist (geom);


--
-- Name: utilities_septictank_geom_7ccc75bc_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_septictank_geom_7ccc75bc_id ON public.utilities_septictank USING gist (geom);


--
-- Name: utilities_sewerline_geom_08150bf1_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_sewerline_geom_08150bf1_id ON public.utilities_sewerline USING gist (geom);


--
-- Name: utilities_streetlamp_geom_1b3979a8_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_streetlamp_geom_1b3979a8_id ON public.utilities_streetlamp USING gist (geom);


--
-- Name: utilities_transmissionline_geom_3b8c4add_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_transmissionline_geom_3b8c4add_id ON public.utilities_transmissionline USING gist (geom);


--
-- Name: utilities_waterbody_geom_3c6cf456_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX utilities_waterbody_geom_3c6cf456_id ON public.utilities_waterbody USING gist (geom);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
