--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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
-- Name: admin_texts; Type: TABLE; Schema: public; Owner: closegap-api
--

CREATE TABLE public.admin_texts (
    id bigint NOT NULL,
    field character varying NOT NULL,
    text text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admin_texts OWNER TO "closegap-api";

--
-- Name: admin_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: closegap-api
--

CREATE SEQUENCE public.admin_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_texts_id_seq OWNER TO "closegap-api";

--
-- Name: admin_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: closegap-api
--

ALTER SEQUENCE public.admin_texts_id_seq OWNED BY public.admin_texts.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: closegap-api
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "closegap-api";

--
-- Name: check_ins; Type: TABLE; Schema: public; Owner: closegap-api
--

CREATE TABLE public.check_ins (
    id bigint NOT NULL,
    student_id bigint,
    feeling character varying NOT NULL,
    body_sensations character varying[] NOT NULL,
    talk_to_adult boolean DEFAULT false,
    fuel integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint,
    has_eaten boolean,
    has_slept boolean,
    hurt_or_sick boolean,
    ok_at_home boolean,
    bullied_at_school boolean,
    followed_up_id bigint,
    intervention character varying
);


ALTER TABLE public.check_ins OWNER TO "closegap-api";

--
-- Name: check_ins_id_seq; Type: SEQUENCE; Schema: public; Owner: closegap-api
--

CREATE SEQUENCE public.check_ins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.check_ins_id_seq OWNER TO "closegap-api";

--
-- Name: check_ins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: closegap-api
--

ALTER SEQUENCE public.check_ins_id_seq OWNED BY public.check_ins.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: closegap-api
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "closegap-api";

--
-- Name: students; Type: TABLE; Schema: public; Owner: closegap-api
--

CREATE TABLE public.students (
    id bigint NOT NULL,
    user_id bigint,
    first_name character varying NOT NULL,
    middle_name character varying,
    last_name character varying NOT NULL,
    birthdate date NOT NULL,
    homeroom_teacher character varying NOT NULL,
    grade character varying NOT NULL,
    gender character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    school_name character varying
);


ALTER TABLE public.students OWNER TO "closegap-api";

--
-- Name: students_caregivers; Type: TABLE; Schema: public; Owner: closegap-api
--

CREATE TABLE public.students_caregivers (
    id bigint NOT NULL,
    user_id bigint,
    student_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.students_caregivers OWNER TO "closegap-api";

--
-- Name: students_caregivers_id_seq; Type: SEQUENCE; Schema: public; Owner: closegap-api
--

CREATE SEQUENCE public.students_caregivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_caregivers_id_seq OWNER TO "closegap-api";

--
-- Name: students_caregivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: closegap-api
--

ALTER SEQUENCE public.students_caregivers_id_seq OWNED BY public.students_caregivers.id;


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: closegap-api
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO "closegap-api";

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: closegap-api
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: closegap-api
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    provider character varying DEFAULT 'email'::character varying NOT NULL,
    uid character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    allow_password_change boolean DEFAULT false,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    name character varying,
    nickname character varying,
    image character varying,
    email character varying,
    tokens json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying,
    last_name character varying,
    role character varying,
    phone_number character varying,
    accepted_terms boolean,
    birthdate timestamp without time zone,
    student_id bigint,
    change_password_on_next_login boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO "closegap-api";

--
-- Name: students_views; Type: VIEW; Schema: public; Owner: closegap-api
--

CREATE VIEW public.students_views AS
 SELECT students.id,
    students.first_name,
    students.middle_name,
    students.last_name,
    students.birthdate,
    students.homeroom_teacher,
    students.grade,
    students.gender,
    students.school_name,
    students.user_id AS owner_user_id,
    students.user_id AS owner_id,
    students.updated_at,
    ( SELECT row_to_json(latest_check_in.*) AS row_to_json
           FROM ( SELECT check_ins.id,
                    check_ins.user_id,
                    check_ins.student_id,
                        CASE check_ins.fuel
                            WHEN 0 THEN 'red'::text
                            WHEN 1 THEN 'blue'::text
                            WHEN 2 THEN 'yellow'::text
                            WHEN 3 THEN 'green'::text
                            ELSE NULL::text
                        END AS fuel,
                    check_ins.talk_to_adult,
                    check_ins.body_sensations,
                    check_ins.has_eaten,
                    check_ins.has_slept,
                    check_ins.hurt_or_sick,
                    check_ins.ok_at_home,
                    check_ins.bullied_at_school,
                    check_ins.followed_up_id,
                    check_ins.intervention,
                    check_ins.created_at,
                    ( SELECT concat(users_1.first_name, ' ', users_1.last_name) AS concat
                           FROM public.users users_1
                          WHERE (users_1.id = check_ins.followed_up_id)) AS follower_full_name
                   FROM public.check_ins
                  WHERE (check_ins.student_id = students.id)
                  ORDER BY check_ins.created_at DESC
                 LIMIT 1) latest_check_in) AS latest_check_in,
    concat(users.first_name, ' ', users.last_name) AS owner_full_name,
    users.role AS owner_role,
    ( SELECT users_1.email
           FROM public.users users_1
          WHERE (users_1.student_id = students.id)) AS email
   FROM (public.students
     JOIN public.users ON ((students.user_id = users.id)))
UNION ALL
 SELECT students.id,
    students.first_name,
    students.middle_name,
    students.last_name,
    students.birthdate,
    students.homeroom_teacher,
    students.grade,
    students.gender,
    students.school_name,
    students_caregivers.user_id AS owner_user_id,
    students.user_id AS owner_id,
    students.updated_at,
    ( SELECT row_to_json(latest_check_in.*) AS row_to_json
           FROM ( SELECT check_ins.id,
                    check_ins.user_id,
                    check_ins.student_id,
                    check_ins.feeling,
                        CASE check_ins.fuel
                            WHEN 0 THEN 'red'::text
                            WHEN 1 THEN 'blue'::text
                            WHEN 2 THEN 'yellow'::text
                            WHEN 3 THEN 'green'::text
                            ELSE NULL::text
                        END AS fuel,
                    check_ins.talk_to_adult,
                    check_ins.body_sensations,
                    check_ins.has_eaten,
                    check_ins.has_slept,
                    check_ins.hurt_or_sick,
                    check_ins.ok_at_home,
                    check_ins.bullied_at_school,
                    check_ins.followed_up_id,
                    check_ins.intervention,
                    check_ins.created_at,
                    ( SELECT concat(users_1.first_name, ' ', users_1.last_name) AS concat
                           FROM public.users users_1
                          WHERE (users_1.id = check_ins.followed_up_id)) AS follower_full_name
                   FROM public.check_ins
                  WHERE (check_ins.student_id = students.id)
                  ORDER BY check_ins.created_at DESC
                 LIMIT 1) latest_check_in) AS latest_check_in,
    concat(users.first_name, ' ', users.last_name) AS owner_full_name,
    users.role AS owner_role,
    ( SELECT users_1.email
           FROM public.users users_1
          WHERE (users_1.student_id = students.id)) AS email
   FROM ((public.students
     JOIN public.students_caregivers ON ((students.id = students_caregivers.student_id)))
     JOIN public.users ON ((students.user_id = users.id)));


ALTER TABLE public.students_views OWNER TO "closegap-api";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: closegap-api
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "closegap-api";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: closegap-api
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admin_texts id; Type: DEFAULT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.admin_texts ALTER COLUMN id SET DEFAULT nextval('public.admin_texts_id_seq'::regclass);


--
-- Name: check_ins id; Type: DEFAULT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.check_ins ALTER COLUMN id SET DEFAULT nextval('public.check_ins_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: students_caregivers id; Type: DEFAULT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.students_caregivers ALTER COLUMN id SET DEFAULT nextval('public.students_caregivers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admin_texts; Type: TABLE DATA; Schema: public; Owner: closegap-api
--

COPY public.admin_texts (id, field, text, created_at, updated_at) FROM stdin;
1	student_user_welcome_title	Welcome Student	2020-10-01 04:31:50.984452	2020-10-01 04:31:50.984452
2	student_user_welcome_subject	Welcome Student	2020-10-01 04:31:50.986451	2020-10-01 04:31:50.986451
3	student_user_welcome_description	    You have been subscribed to our system. please click on the link below to change your password\n	2020-10-01 04:31:50.987851	2020-10-01 04:31:50.987851
4	student_user_welcome_link_text	Create my password	2020-10-01 04:31:50.989354	2020-10-01 04:31:50.989354
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: closegap-api
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-10-01 04:31:40.679091	2020-10-01 04:31:40.679091
\.


--
-- Data for Name: check_ins; Type: TABLE DATA; Schema: public; Owner: closegap-api
--

COPY public.check_ins (id, student_id, feeling, body_sensations, talk_to_adult, fuel, created_at, updated_at, user_id, has_eaten, has_slept, hurt_or_sick, ok_at_home, bullied_at_school, followed_up_id, intervention) FROM stdin;
1	1	sad	{stuck-or-frozen,tired-or-weak,empty}	t	0	2020-10-01 04:31:50.947562	2020-10-01 04:31:50.947562	1	\N	\N	\N	\N	\N	\N	\N
2	2	tired	{spacey-or-zoned-out,light-or-empty,sleepy}	t	1	2020-10-01 04:31:50.951891	2020-10-01 04:31:50.951891	1	\N	\N	\N	\N	\N	\N	\N
3	3	tired	{nothing-or-numb,heavy-or-full,fuzzy-or-unclear}	f	1	2020-10-01 04:31:50.954885	2020-10-01 04:31:50.954885	1	\N	\N	\N	\N	\N	\N	\N
4	4	silly	{comfy-or-at-ease,warm}	f	2	2020-10-01 04:31:50.957874	2020-10-01 04:31:50.957874	1	\N	\N	\N	\N	\N	\N	\N
5	5	happy	{awake,heart-flutters,energetic}	f	3	2020-10-01 04:31:50.960978	2020-10-01 04:31:50.960978	1	\N	\N	\N	\N	\N	\N	\N
6	6	happy	{warm,awake}	t	1	2020-09-23 07:00:00	2020-10-01 04:31:50.96393	1	\N	\N	\N	\N	\N	\N	\N
7	7	upset	{heavy-chest-or-heart,sick-to-my-stomache,shakey-or-fidgety,hot-or-sweaty}	f	3	2020-10-01 04:31:50.967049	2020-10-01 04:31:50.967049	2	\N	\N	\N	\N	\N	\N	\N
8	1	happy	{warm,awake}	t	1	2020-09-23 07:00:00	2020-10-01 04:31:50.969807	1	\N	\N	\N	\N	\N	\N	\N
9	1	tired	{nothing-or-numb,heavy-or-full,fuzzy-or-unclear}	f	1	2020-10-01 04:31:50.972612	2020-10-01 04:31:50.972612	1	\N	\N	\N	\N	\N	\N	\N
10	1	silly	{comfy-or-at-ease,warm}	f	2	2020-10-01 04:31:50.975242	2020-10-01 04:31:50.975242	1	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: closegap-api
--

COPY public.schema_migrations (version) FROM stdin;
20190312195037
20190312215055
20190314160820
20190319183354
20190325162036
20190330180049
20190606154400
20190807191115
20190808182348
20190812193013
20190812193737
20190813202059
20190813205412
20190813222627
20190813224925
20190819215957
20190820133036
20190822141236
20190828120218
20190828142109
20191105201340
20191209204754
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: closegap-api
--

COPY public.students (id, user_id, first_name, middle_name, last_name, birthdate, homeroom_teacher, grade, gender, created_at, updated_at, school_name) FROM stdin;
8	1	Ipsum8	Lorem8	Dolor8	2000-05-02	Amet8	8st	other	2020-10-01 04:31:50.927534	2020-10-01 04:31:50.927534	some school name
2	1	Ipsum2	Lorem2	Dolor2	2008-09-04	Amet2	2nd	female	2020-10-01 04:31:50.91377	2020-10-01 04:31:50.95297	some school name
3	1	Ipsum3	Lorem3	Dolor3	2006-03-25	Amet3	3rd	male	2020-10-01 04:31:50.916451	2020-10-01 04:31:50.955899	some school name
4	1	Ipsum4	Lorem4	Dolor4	2005-05-02	Amet4	4th	other	2020-10-01 04:31:50.919054	2020-10-01 04:31:50.958944	some school name
5	1	Ipsum5	Lorem5	Dolor5	2003-03-08	Amet5	5th	male	2020-10-01 04:31:50.921167	2020-10-01 04:31:50.962011	some school name
6	1	Ipsum6	Lorem6	Dolor6	2002-07-23	Amet6	6th	female	2020-10-01 04:31:50.923323	2020-10-01 04:31:50.965061	some school name
7	2	Ipsum7	Lorem7	Dolor7	2001-11-15	Amet7	7th	other	2020-10-01 04:31:50.925388	2020-10-01 04:31:50.967905	some school name
1	1	Ipsum1	Lorem1	Dolor1	2010-11-14	Amet1	1st	male	2020-10-01 04:31:50.910186	2020-10-01 04:31:50.976185	some school name
\.


--
-- Data for Name: students_caregivers; Type: TABLE DATA; Schema: public; Owner: closegap-api
--

COPY public.students_caregivers (id, user_id, student_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: closegap-api
--

COPY public.users (id, provider, uid, encrypted_password, reset_password_token, reset_password_sent_at, allow_password_change, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, name, nickname, image, email, tokens, created_at, updated_at, first_name, last_name, role, phone_number, accepted_terms, birthdate, student_id, change_password_on_next_login) FROM stdin;
1	email	foo1@bar.com	$2a$11$iiQXqqTVtE2oDtaw/KbZuuFgWYPkmOaGvI2YagZGcwzHiROlFMuGC	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	foo1@bar.com	{}	2020-10-01 04:31:50.596206	2020-10-01 04:31:50.596206	John	\N	\N	\N	\N	\N	\N	f
2	email	foo2@bar.com	$2a$11$otPNG8JMQuw2DamwaUS/7ufmk.3LmfZtTPcBaV3A.tnTJIwJ6Iidi	\N	\N	f	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	foo2@bar.com	{}	2020-10-01 04:31:50.883133	2020-10-01 04:31:50.883133	Mary	\N	\N	\N	\N	\N	\N	f
\.


--
-- Name: admin_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: closegap-api
--

SELECT pg_catalog.setval('public.admin_texts_id_seq', 4, true);


--
-- Name: check_ins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: closegap-api
--

SELECT pg_catalog.setval('public.check_ins_id_seq', 10, true);


--
-- Name: students_caregivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: closegap-api
--

SELECT pg_catalog.setval('public.students_caregivers_id_seq', 1, false);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: closegap-api
--

SELECT pg_catalog.setval('public.students_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: closegap-api
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: admin_texts admin_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.admin_texts
    ADD CONSTRAINT admin_texts_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: check_ins check_ins_pkey; Type: CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.check_ins
    ADD CONSTRAINT check_ins_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: students_caregivers students_caregivers_pkey; Type: CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.students_caregivers
    ADD CONSTRAINT students_caregivers_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_check_ins_on_followed_up_id; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE INDEX index_check_ins_on_followed_up_id ON public.check_ins USING btree (followed_up_id);


--
-- Name: index_check_ins_on_student_id; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE INDEX index_check_ins_on_student_id ON public.check_ins USING btree (student_id);


--
-- Name: index_check_ins_on_user_id; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE INDEX index_check_ins_on_user_id ON public.check_ins USING btree (user_id);


--
-- Name: index_students_caregivers_on_student_id; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE INDEX index_students_caregivers_on_student_id ON public.students_caregivers USING btree (student_id);


--
-- Name: index_students_caregivers_on_user_id; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE INDEX index_students_caregivers_on_user_id ON public.students_caregivers USING btree (user_id);


--
-- Name: index_students_caregivers_on_user_id_and_student_id; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE UNIQUE INDEX index_students_caregivers_on_user_id_and_student_id ON public.students_caregivers USING btree (user_id, student_id);


--
-- Name: index_students_on_user_id; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE INDEX index_students_on_user_id ON public.students USING btree (user_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_student_id; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE INDEX index_users_on_student_id ON public.users USING btree (student_id);


--
-- Name: index_users_on_uid_and_provider; Type: INDEX; Schema: public; Owner: closegap-api
--

CREATE UNIQUE INDEX index_users_on_uid_and_provider ON public.users USING btree (uid, provider);


--
-- Name: students fk_rails_148c9e88f4; Type: FK CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT fk_rails_148c9e88f4 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users fk_rails_59eb2cd051; Type: FK CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_59eb2cd051 FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: check_ins fk_rails_772facc9bc; Type: FK CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.check_ins
    ADD CONSTRAINT fk_rails_772facc9bc FOREIGN KEY (followed_up_id) REFERENCES public.users(id);


--
-- Name: check_ins fk_rails_b15c016c97; Type: FK CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.check_ins
    ADD CONSTRAINT fk_rails_b15c016c97 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: students_caregivers fk_rails_b1de17c559; Type: FK CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.students_caregivers
    ADD CONSTRAINT fk_rails_b1de17c559 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: students_caregivers fk_rails_d335bc9d60; Type: FK CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.students_caregivers
    ADD CONSTRAINT fk_rails_d335bc9d60 FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- Name: check_ins fk_rails_e70677f00c; Type: FK CONSTRAINT; Schema: public; Owner: closegap-api
--

ALTER TABLE ONLY public.check_ins
    ADD CONSTRAINT fk_rails_e70677f00c FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

