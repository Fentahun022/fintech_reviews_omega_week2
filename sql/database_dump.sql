--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 17.2 (Ubuntu 17.2-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: banks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks (
    bank_id integer NOT NULL,
    bank_name character varying(100) NOT NULL
);


ALTER TABLE public.banks OWNER TO postgres;

--
-- Name: TABLE banks; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.banks IS 'Stores unique information about the mobile banking applications.';


--
-- Name: banks_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banks_bank_id_seq OWNER TO postgres;

--
-- Name: banks_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_bank_id_seq OWNED BY public.banks.bank_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    review_id character varying(255) NOT NULL,
    bank_id integer NOT NULL,
    review_text text,
    rating integer NOT NULL,
    review_date date NOT NULL,
    sentiment_label character varying(20),
    sentiment_score numeric(10,9),
    themes character varying(500)
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: COLUMN reviews.review_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reviews.review_text IS 'The original, unprocessed user review text.';


--
-- Name: banks bank_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks ALTER COLUMN bank_id SET DEFAULT nextval('public.banks_bank_id_seq'::regclass);


--
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks (bank_id, bank_name) FROM stdin;
1	Commercial Bank of Ethiopia
2	Bank of Abyssinia
3	Dashen Bank
4	Enat Bank
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (review_id, bank_id, review_text, rating, review_date, sentiment_label, sentiment_score, themes) FROM stdin;
54f070b9-895f-40e8-be18-acb16f8af7fa	1	Best Mobile Banking app ever	5	2025-06-04	POSITIVE	0.999729455	General Feedback
9af95d2a-e42c-45ff-a4c9-5c38765df4a4	1	it was good app but it have some issues like it doesnt give me the right amount that I have in the bank and have some issues in transferring	2	2025-06-04	NEGATIVE	0.998119295	Bugs & Reliability
fce00cda-d71a-486e-a4c2-7479ab7793bc	1	best app of finance	5	2025-06-04	POSITIVE	0.999650359	General Feedback
2470d199-834a-4134-a0f9-8c684ba75491	1	Engida Kebede Fetera	5	2025-06-03	POSITIVE	0.839673877	General Feedback
428e5117-387f-4c9d-b095-3230e3f83a8a	1	it is not safety	1	2025-06-03	NEGATIVE	0.999786794	General Feedback
2f605bab-a62d-4298-bb1d-0b749bc666c4	1	it is like a childish app make it better the worst I have ever seen	1	2025-06-02	NEGATIVE	0.999795854	General Feedback
90395621-bcb9-4c87-9742-57faa8e345c1	1	It's a problem solver application, go ahead CBE, I love so much.	5	2025-06-02	POSITIVE	0.999716580	Bugs & Reliability
a6a00b41-127d-4dda-b175-e65b9879dec7	1	It's good but try to make it facilitate for your client	4	2025-06-02	POSITIVE	0.949177027	General Feedback
50ffac9d-437d-4d26-af4f-b6b0153d55fd	1	this app has developed in a very good ways but there are some comments I need to make 1- preventing the screenshot likely not good for someone like me coz I need to make screenshot for quicker evidence. 2-it would be good if you make us to access recent transaction histories for 30 days coz we don't have to go to the Bank's in person to see old transactions or add colander category so user can easily access old transactions through colanders.	5	2025-05-31	POSITIVE	0.998049974	Account Access Issues, Feature Requests, Transaction Performance
8bf4df47-c266-4152-9790-4217143b3a91	1	Recently there is big problem when sending to safaricom, telebir, and even to cbebirr wallet could anybody who is responsible fix it, it's very frustrating it's been 5 days and my money hasn't been returned it takes it out of my account but doesn't send it to my mpesa update- they have just corrected it and sent me back the money but still I'm afraid now to send again	2	2025-05-31	NEGATIVE	0.998747706	Bugs & Reliability, Feature Requests, Transaction Performance
66bc4eed-2004-41ea-89cd-5bed26921bc1	1	it,s good app and time manager 👍	5	2025-05-30	POSITIVE	0.999840498	General Feedback
17190f44-a419-45dc-be9d-68b80c5360a2	1	malkaamuu Jiidhaa Namoo	5	2025-05-30	POSITIVE	0.988781333	General Feedback
34cf56c4-74b9-4bec-b474-0d533f8aff49	1	lower system everything	3	2025-05-30	NEUTRAL	0.999347508	General Feedback
b99da78e-335f-40cb-bae6-26b71fa7c68c	1	Keep it up My CBE	5	2025-05-29	POSITIVE	0.999610484	General Feedback
ea23b98c-f4c7-4fdc-b64f-d8097e5efd1a	1	I was using this app for the last two years with no problems. It stopped working about 3 months ago. when I tried to transfer funds it gives me error "can't do this transaction. inactive account."	4	2025-05-27	POSITIVE	0.999441206	Bugs & Reliability, Transaction Performance
22c85c1d-46f6-4288-aab9-b615c040e6bb	1	i like everything of this app	5	2025-05-27	POSITIVE	0.999690890	General Feedback
fe899c01-b28c-4e6a-b221-a14759e3a97e	1	CBE is the best financial application and and very dimple to use. I would like to say thank you so much for the developer of application. I really appreciate this app.	5	2025-05-26	POSITIVE	0.998279214	General Feedback
fe6bf4b0-6bbd-4d88-b5b2-fa31f19ac63f	1	thankyou every one	5	2025-05-25	POSITIVE	0.999846101	General Feedback
52aa3e01-9c6a-499d-aa48-b85b82d34781	1	this app is absolutely fantastic I love it and I enjoying to it ,let us support this foundation together .	5	2025-05-25	POSITIVE	0.999884725	Customer Support
9e6b8e08-8acf-4e1f-a179-a5a703ff2ebc	1	The CBE app has been highly unreliable in recent weeks. It frequently fails to work properly on both Ethio Telecom and Safaricom networks, whether using Wi-Fi or mobile data. This week, the system was down entirely for extended periods, making it very difficult to access banking services. The app only functions intermittently, and the lack of consistency is frustrating. I hope the issues are addressed soon, and that any non-technical influences are removed from such essential services.	2	2025-05-25	NEGATIVE	0.999761760	Account Access Issues, Bugs & Reliability, User Interface & Experience
8bc7721c-3d11-4a15-a787-fdb0c266a9f4	1	it is smart app but it has stoped after some period of time on my device with out any reason .	5	2025-05-25	POSITIVE	0.996104479	General Feedback
d3266f1c-8cb9-4766-a90e-47c2532a2b42	1	amazing app I am used this app for one year	4	2025-05-24	POSITIVE	0.999140859	General Feedback
5864d26a-c52e-4755-86e5-3bfbf9f1d814	1	i love it 😍😘	5	2025-05-24	POSITIVE	0.999879956	General Feedback
f49a91cf-b302-4977-a99d-c545b7213dad	1	It makes life easy!👌	5	2025-05-24	POSITIVE	0.999648690	User Interface & Experience
893a61e9-9eeb-4972-9a46-1eb810d54520	1	its not fast	1	2025-05-24	NEGATIVE	0.994980872	Transaction Performance
85e5a705-1f69-439d-be61-5b0cd73237e2	1	it is sooo good	5	2025-05-24	POSITIVE	0.999873519	General Feedback
dad4e463-c5b1-47bc-a193-84741470825e	1	accessible to using	5	2025-05-23	POSITIVE	0.999116838	General Feedback
382b6807-a1f4-48e7-98fe-d22eeb1edd4d	1	I like it	4	2025-05-23	POSITIVE	0.999859333	General Feedback
a68dfd3a-aaa3-48bc-84b8-842311de1b8c	1	why you change default network?	5	2025-05-23	POSITIVE	0.996235788	General Feedback
c2af9859-2af3-409d-8df2-57b98b6d29e1	1	nice fast app	5	2025-05-23	POSITIVE	0.999833345	Transaction Performance
3589e146-296a-4c7c-9c8d-8f1593190cbe	1	how to I get my money	5	2025-05-23	POSITIVE	0.993409157	General Feedback
7dc48c33-245c-4920-9cf7-4b3d40d00064	1	Very bad, can't even load they need to improve their services.	1	2025-05-22	NEGATIVE	0.999749243	General Feedback
e207b071-24a5-447f-b6b3-0eb287986a88	1	Very good app, but please make it reliable . it crashes sometimes .	4	2025-05-22	POSITIVE	0.987854064	Bugs & Reliability
d3187592-0b15-407a-a9a0-bffbd13bc2fd	1	very busy I don't know why... I prefer 889	3	2025-05-22	NEUTRAL	0.999193847	General Feedback
5c907c9f-8bd3-4703-9505-744e632c595c	1	Sometimes it has a nasty lag for several hour fix that , the rest is 👌	4	2025-05-22	POSITIVE	0.997622788	App Speed & Performance, Bugs & Reliability
f5386dd0-124d-4a3e-964e-75f475130af9	1	the most boring Mobil banking application in ethiopia.Please use alternative private banks mobile banking apps	1	2025-05-22	NEGATIVE	0.998620272	General Feedback
310cffb5-629d-4f32-b55c-aff448ddad2d	1	user-friendly apps.because this app is easy.	5	2025-05-22	POSITIVE	0.661859274	User Interface & Experience
b9c8ce60-4060-438b-a0e8-c8faf314b7a4	1	Very good app,	5	2025-05-22	POSITIVE	0.999867558	General Feedback
34d6492b-f6e7-42ed-851a-348ab215c36a	1	sync problem may 22 2025 but the date stack on may 8 2025 help pls	5	2025-05-22	POSITIVE	0.992516816	Bugs & Reliability, Customer Support
51d29cb1-86f9-45cb-8c16-04c431d7d213	1	ይህ መተግበሪያ በጣም ጥሩ ነው. this app is very nice	5	2025-05-22	POSITIVE	0.999702036	General Feedback
23ee51ec-56a4-4b30-987a-2c854badda8d	1	I hate this app 😒	1	2025-05-22	NEGATIVE	0.999690771	General Feedback
392ef1b2-7904-4874-99c5-45d7d98344ac	1	its not working over safari network	1	2025-05-22	NEGATIVE	0.999137759	Bugs & Reliability
832328c2-cdd0-465b-b6eb-e519f7ffa59d	1	it doesn't work	1	2025-05-21	NEGATIVE	0.999781311	Bugs & Reliability
39f74545-07ff-415e-a401-2266fe41e7df	1	This app is good, and we are using it well	1	2025-05-21	NEGATIVE	0.999849081	General Feedback
05e70242-c8ac-4cee-8b41-22da134c5837	1	very nice 👌 app for android phone	5	2025-05-21	POSITIVE	0.999648333	General Feedback
ca0ab815-f3f0-4620-9660-bfb79f818314	1	easy to use helpful in my life	5	2025-05-21	POSITIVE	0.998114467	Customer Support, User Interface & Experience
da58ef58-30bf-41a7-b705-66e5ae261011	1	the best mobile banking app	5	2025-05-21	POSITIVE	0.999827862	General Feedback
30cfce0b-7504-425f-89a9-8091ffa24920	1	this app is very useful app,it saves time,and it is secure	4	2025-05-21	POSITIVE	0.998025775	Security Concerns
c0595f27-7901-4d8b-8363-ea3601854094	1	it's a good application 👍	5	2025-05-21	POSITIVE	0.999866128	General Feedback
26fd7f14-c17f-4081-8910-45f2008ca145	1	the screenshot and the reffresh options are so annoying that makes transaction so delaying activity !	2	2025-05-21	NEGATIVE	0.999751389	Feature Requests, Transaction Performance
9eff9bee-1e05-4f68-ae9a-2de67b8564bc	1	it is reliable and easy to use.	5	2025-05-20	POSITIVE	0.999838948	Bugs & Reliability, User Interface & Experience
cdad77fa-fadb-494d-970c-d816e2f6a83d	1	the most annoying mobile banking app I've ever seen	1	2025-05-20	NEGATIVE	0.999420881	General Feedback
0869bd94-48d8-4a25-8aa3-d2dd8522ac1d	1	Cbe mobile banking	5	2025-05-20	POSITIVE	0.830428302	General Feedback
5be1f935-aaad-4981-8f31-02d880bb987f	1	i can't make Screenshout in this app, please made modification	5	2025-05-20	POSITIVE	0.997391701	General Feedback
ba4b588c-3388-4ee1-8cca-4eae702a81e5	1	Best app I loved it	5	2025-05-19	POSITIVE	0.999849796	General Feedback
7b6c801d-4f97-44bd-b59f-252cde7c0515	1	Amazing applicatiom sometimes doesnt work!	5	2025-05-18	POSITIVE	0.644879222	Bugs & Reliability
2fe903d9-41fe-4ec3-9a2d-fd0acfe57725	1	well satisfied with this beautiful app	5	2025-05-18	POSITIVE	0.999858856	General Feedback
67398692-d12e-4229-9f88-67f25f1a7336	1	Great impact but why Developer option turnoff if you fix 🙏 🙏 🙏	5	2025-05-17	POSITIVE	0.985985518	Bugs & Reliability, Feature Requests
539ea673-656c-44ce-b226-f61677fd6e31	1	always disappointing ! especially the iOS one !! some similar local applications are extremely superior to this application!! Really disappointing!	1	2025-05-17	NEGATIVE	0.999620199	General Feedback
23ffabb6-3005-403f-a16b-10e24aab5f7e	1	woxe harimo ribiso	5	2025-05-17	POSITIVE	0.937437296	General Feedback
d4b852bb-683b-41ea-85ba-6ed38bed539c	1	Good ,easy to use	5	2025-05-16	POSITIVE	0.999843478	User Interface & Experience
7fbce453-198b-401e-ab72-5f778309cd92	1	Please kindly ask to update the app and allow us to screenshot, it's convenient and efficient as long as you add security to the access there is no reason to block us from screenshooting our screen.	2	2025-05-14	NEGATIVE	0.985861421	Account Access Issues, App Speed & Performance, Feature Requests, Security Concerns
336d7230-c7c0-4aa9-9d43-17ddfbffbca1	1	I have using the CBE mobile banking app. and overall i appreciate its Feuteres However i.ve Notticed that when i turn on the Developer options on my divice the App.Stop Functioning prorerly It.Would Be Great If You could look into This issue as l often need to access Developer setting for Otter Application ThankYou For Your attention to This Matter	4	2025-05-13	POSITIVE	0.947411835	Account Access Issues, Bugs & Reliability, Feature Requests, User Interface & Experience
91f3ee87-fb66-4106-809a-fee5c30761cb	1	customer service is bad nothing is good about this bank	1	2025-05-13	NEGATIVE	0.999661326	Customer Support
150068b3-36ed-489b-8ad7-b8121c0d8662	1	It is Amazing Mobile Banking App....But why the screenshot of the receipt doesnt work	5	2025-05-13	POSITIVE	0.992915154	Bugs & Reliability
0ee61e87-0b46-405b-9ac6-219eea2399a0	1	fast and simple easy to use 👌	5	2025-05-12	POSITIVE	0.999436319	Transaction Performance, User Interface & Experience
a878dd26-bc46-4da6-8a6e-99794c921510	1	The fastest transferring app I ever had its so reliable	5	2025-05-11	POSITIVE	0.984442770	Bugs & Reliability
1c69ba75-de9a-4dd4-9e84-e19d985c0d4d	1	Funds transferred from the same bank do not reflect in the account, even though a confirmation text message was received.	3	2025-05-11	NEUTRAL	0.999070883	General Feedback
955c6dc7-0841-4c20-8796-35504174788b	1	it's easy and fast	5	2025-05-10	POSITIVE	0.999568403	Transaction Performance, User Interface & Experience
552dc072-e6aa-4360-a85c-161ffa4d575e	1	This app don't have self activation only you have to look near cbe branch that's disgusting	1	2025-05-10	NEGATIVE	0.996043801	User Interface & Experience
719d06b2-b929-4dfa-98e8-8e24cff1bc13	1	hello dearest CBE office personnel make some benefits for those using interest free accounts thanks for your help	5	2025-05-09	POSITIVE	0.999572217	Customer Support
bd9d8254-264a-428c-8d48-2449e2260108	1	wow best application ever	5	2025-05-09	POSITIVE	0.999798477	General Feedback
f569e45d-b7d5-4c40-bc43-18ac0e13965a	1	Am sorry but what does developer mode do to the application ? hack it ? are you sure you are developer or are you stupid, doesnt makes sense,	1	2025-05-08	NEGATIVE	0.999699354	Security Concerns
7327f7dd-510f-4054-9541-8157e0ae9b18	1	the pride of Ethiopian bank 🏦	5	2025-05-08	POSITIVE	0.999661326	General Feedback
a41ead51-812c-49bc-bd00-d7fc843231f5	1	why the app telling me to turn of developer options please fix it.	1	2025-05-07	NEGATIVE	0.999099493	Bugs & Reliability, Feature Requests
50a257eb-6cc7-4d7a-ae9b-be97bc94ff99	1	i am very happy . i have small prob. after i transfer i cant put the transfer cashe bil to my dic.	5	2025-05-07	POSITIVE	0.997692704	Transaction Performance
684fd27d-fb21-4f26-a3a2-2df5c05d35b8	1	All service of Mobile Banking	5	2025-05-06	POSITIVE	0.892425299	General Feedback
6e27f7ac-d2f5-456f-b269-1082a276c3d7	1	i miss the old one i couldn't send my mony to other bank..	1	2025-05-06	NEGATIVE	0.995843232	Transaction Performance
02a8488a-1993-4582-a072-3364f04647f6	1	the app is recently crushing each time you open and try to make transfers...it used to be good. take lessons from the Dashen Super app or ethiotelecom. it is not befitting of your experience and glory. inv3st in making it more friendly and convenient. I am considering leaving CBE for good.	2	2025-05-06	NEGATIVE	0.998441041	General Feedback
4bd0f0c6-843e-4e4c-ad02-d735c1578c9e	1	good but these week not oky	4	2025-05-06	POSITIVE	0.955415606	General Feedback
c1bb53ca-ef9c-427f-a7a9-d4bb1ec232b9	1	well designed! Fixing bugs & two step verification with biometric... simply it's great!	5	2025-05-06	POSITIVE	0.999699235	Account Access Issues, Bugs & Reliability, Feature Requests
bde45d03-32a2-40cd-aaf9-4b8e0df51a5e	1	If any developer is reading this please fix the screenshot functionality or at least the download button should work flawlessly without me touching it twenty times.	1	2025-05-05	NEGATIVE	0.997522414	Bugs & Reliability
951e60b0-c44a-447f-ac25-7e2be26ff3de	1	it's a great job.but one more thing, it hasn't been placed for transfer to other banks on face like mobile charge card place	5	2025-05-05	POSITIVE	0.945492685	Transaction Performance
e8c16e1b-4452-4b87-bc72-398427914c25	1	CBE mobilr bankg	5	2025-05-05	POSITIVE	0.870305300	General Feedback
a5013e04-9ee0-4cf7-8b1e-b357a0743a84	1	it's very low quality application	1	2025-05-04	NEGATIVE	0.999659419	General Feedback
44df75ec-64ad-4129-a70f-3b5512f595a9	1	Very Amazing Apps	5	2025-05-04	POSITIVE	0.999877453	General Feedback
ed713db5-3620-4a87-bb2e-f242e03a9336	1	wow simple life	5	2025-05-04	POSITIVE	0.999707639	User Interface & Experience
0c2ecaea-7fc2-461b-9dcb-5c2d938dab18	1	Why stacked sometimes	5	2025-05-03	POSITIVE	0.994105220	General Feedback
783ea957-ec2a-4eaf-a1d8-398a95b1fb1d	1	okay 👍 but sometimes busy	1	2025-05-03	NEGATIVE	0.648782849	General Feedback
beae4fab-d673-4120-ba42-ea1bf94a737f	1	the worst commercial company that fails to do even the most normal things again and and again.	1	2025-05-03	NEGATIVE	0.999799073	General Feedback
1559b547-36e5-4b58-8507-b44cc1801331	1	Very good app. but disappointed by general cessation of system.	5	2025-05-02	POSITIVE	0.998118818	General Feedback
9a11d82f-54b8-43ea-856c-1283ccb62f20	1	Good and fast	5	2025-05-02	POSITIVE	0.999856114	Transaction Performance
77d6154d-7008-47ba-8d70-2493451352a3	1	Best the best fast	5	2025-05-02	POSITIVE	0.999842763	Transaction Performance
7dcbcd69-baa0-4c8c-a3a2-4a2cf0d959d1	1	fast and reliable	5	2025-05-02	POSITIVE	0.999859571	Bugs & Reliability, Transaction Performance
7e817bb8-d23e-4f3f-a5fb-b7c76ddc2126	1	Best app but there is some problem I can't send money to telebirr or mpesa so if you can add that it could be use full	4	2025-05-02	POSITIVE	0.998280883	Bugs & Reliability, Feature Requests, Transaction Performance
28e615dd-6a83-4cbe-b483-ad5aa59dffbc	1	its good and simple to use	5	2025-05-02	POSITIVE	0.999861002	User Interface & Experience
a038badc-107b-4d0d-9099-ae58366c24fa	1	worest app like that bank for security and network access	1	2025-05-02	NEGATIVE	0.992729604	Account Access Issues, Security Concerns
d2564215-9555-4556-8378-518439ca55a6	1	it's the best app i	5	2025-05-02	POSITIVE	0.999834418	General Feedback
8e47f061-c03d-477d-83d7-9e9ef8fbd85f	1	not bad not good	1	2025-05-02	NEGATIVE	0.971535087	General Feedback
6c7d83e4-3225-4811-8f2e-eb376a6188a9	1	its very nice	5	2025-05-02	POSITIVE	0.999852657	General Feedback
926c79cf-a45f-452c-b00e-472621ded600	1	do not work this week	3	2025-04-30	NEUTRAL	0.997760296	Bugs & Reliability
8096ea90-64d7-4416-9558-1f7b7ca73cde	1	It crashes frequently	4	2025-04-30	POSITIVE	0.999325633	Bugs & Reliability
ddcde4c3-479f-47e2-b8bd-3b5265ee7487	1	I can simply describe this app as "Making all your work easier".	5	2025-04-28	POSITIVE	0.500085950	Bugs & Reliability
563d2717-eaf3-4fc6-9aa4-b75ab6324985	1	it's very good 👍 app	5	2025-04-27	POSITIVE	0.999872804	General Feedback
0725f956-965a-48c8-a159-baa447a8ae37	1	I need support you	5	2025-04-27	POSITIVE	0.988144398	Customer Support
9948e178-3bb4-4237-8edd-14b17684304a	1	the worst Mobile banking i have ever seen in my life	1	2025-04-26	NEGATIVE	0.999780715	General Feedback
9476aec1-1fc5-4e8c-9d21-129ce40d64d7	1	i like the app	5	2025-04-26	POSITIVE	0.999439895	General Feedback
a9f52719-956c-4f13-8971-908587f75eec	1	to other bank is bad	1	2025-04-25	NEGATIVE	0.999714911	General Feedback
9c95b8ea-a536-45fa-9795-53b69d7acd64	1	its good but add more features such like. bank statement showing	5	2025-04-24	POSITIVE	0.988166451	Feature Requests
ccbafb4f-13f1-4276-af0e-24faf4c27402	1	it is so nice	5	2025-04-24	POSITIVE	0.999871492	General Feedback
51e311f1-6242-413f-91e1-5facc62e4b1f	1	my first frequent experience of cbe app is critical-time failure such as suspending payment on air for 2-5 days with zero explanation, deducting from sender account without depositing to the receiver act. Another fatal error by the banking company as a whole (not the app itself though) is forced-banking with corporations without consent of employers-users of the corresponding corporations	2	2025-04-21	NEGATIVE	0.999507308	Bugs & Reliability, Transaction Performance
24eba239-d651-4f46-807b-020d3ccb0701	1	wow, amazing app	5	2025-04-21	POSITIVE	0.999851346	General Feedback
70095df2-033a-493a-bc9e-82ea1ebec8b7	1	Actually it is inactive	4	2025-04-19	POSITIVE	0.999648333	General Feedback
38887ac1-2782-426a-af99-23739cb6d450	1	slow, only one account is used	2	2025-04-19	NEGATIVE	0.999724805	App Speed & Performance, Transaction Performance
a13ac39b-03e1-4466-8838-479e91847813	1	always CBE is the leading Commercial Bank💪💪💪	5	2025-04-18	POSITIVE	0.999212146	General Feedback
e923b362-5908-4d8b-abd6-8571f772aa49	1	i like it	5	2025-04-18	POSITIVE	0.999859333	General Feedback
ad5ea4f1-47f8-4ae1-928c-6fece7daaed1	1	why removing screenshot feature why?	1	2025-04-18	NEGATIVE	0.998114705	Feature Requests
0d591a9b-0f94-4fbb-8e85-4aa0dfd5be4d	1	nice apps where network is good in connection	5	2025-04-18	POSITIVE	0.999492526	General Feedback
66b05081-b1eb-4744-90a9-33106e7017ec	1	i can't take screenshot	1	2025-04-18	NEGATIVE	0.989789426	General Feedback
9028e8f6-0f93-4631-8540-a1d39ecb40ee	1	every update was made the system better and better until the March 19th, 2025 update, not allowing us to screenshot. you guys didn't understand how much it's a really quick and significant thing. You add extra steps to us, which makes the process draw back	3	2025-04-18	NEUTRAL	0.985299587	Feature Requests, Transaction Performance
c0b3f973-9042-41c6-9528-ad3f6342976b	1	Fast and Reliable	5	2025-04-18	POSITIVE	0.999859571	Bugs & Reliability, Transaction Performance
d8fbd17a-2089-4c37-9a97-de8c61f92160	1	The best application I have ever seen in Ethiopia banking industry.	5	2025-04-17	POSITIVE	0.999744833	General Feedback
94976316-142f-4814-9ef5-5e37bb139daa	1	because sometimes it doesn't working it load too much	3	2025-04-17	NEUTRAL	0.991193235	General Feedback
56b44694-2246-482a-be60-6e656324f3ed	1	Absolutely the best app! It works flawlessly, anytime and anywhere.	5	2025-04-17	POSITIVE	0.999876022	Bugs & Reliability
2a76a4cd-b2c9-4c07-b339-dd5422a6bf27	1	very nice app ever!!!	5	2025-04-16	POSITIVE	0.999827087	General Feedback
2c1bcf08-e5fe-43b8-aabf-0a1afefeb5aa	1	the best app	5	2025-04-16	POSITIVE	0.999846935	General Feedback
e5b9e2a5-2477-4f9c-bb71-2f2e0d6771f1	1	Biometric security for mobile banking is not available	5	2025-04-16	POSITIVE	0.999634027	Feature Requests, Security Concerns
fe37446d-b91c-40e6-b94e-ddc1f12b051e	1	it's special apps	5	2025-04-15	POSITIVE	0.999541640	General Feedback
ab453d8e-ab8c-4e04-9391-617dda3e4074	1	In the updated version of the app, it takes more time to download the receipt.	3	2025-04-15	NEUTRAL	0.998755217	General Feedback
901c9804-9dcb-44d0-a314-ee76f296bc94	1	ለምንድነው ትራንዛክሽን ትንሽ ብቻ የሚያሳየው ?	3	2025-04-14	NEUTRAL	0.964762032	General Feedback
ae57ff29-717d-4873-a3b5-6269e209751d	1	very interesting app i am using every day fantastic	5	2025-04-14	POSITIVE	0.999844313	General Feedback
1d6fba2c-a4fc-4568-9883-b15faf80a6d3	1	Can't scan/recognize other banks' Interoperable QR Codes	1	2025-04-13	NEGATIVE	0.997388542	General Feedback
2127ac2c-ea02-41f4-82aa-c19dd51a87ee	1	"This mobile banking app is fast and user-friendly, but the only issue I encountered is that I can't access my bank statement within the app. I kindly request that this feature be added, similar to what is offered by other private bank mobile banking apps.	4	2025-04-13	POSITIVE	0.996672511	Account Access Issues, Bugs & Reliability, Feature Requests, Transaction Performance
13fe10ac-c719-49da-a87a-e2b7dbb6bbed	1	why did this app is not screenshot	5	2025-04-12	POSITIVE	0.998949349	General Feedback
e9bdadab-f8c4-4c3d-aa8c-e634155fb890	1	it so good app	5	2025-04-12	POSITIVE	0.999868631	General Feedback
aef9a457-a8d2-4ec7-9157-163aba9347f4	1	the best app	3	2025-04-12	NEUTRAL	0.999846935	General Feedback
2cf0a2a1-a1bb-4356-ae1e-c874e69629be	1	less network, specially to make fee for utility purpose	1	2025-04-11	NEGATIVE	0.991015255	Transaction Performance
84e606a3-9b0d-40b9-a29d-fd18bc563992	1	simply for used	4	2025-04-11	POSITIVE	0.991800487	General Feedback
45da0198-d068-4670-9878-d18380ac1722	1	wow keep up	5	2025-04-10	POSITIVE	0.999853969	General Feedback
b3117b0e-bdc6-40f4-874e-f61fc5dd50f5	1	its great app but when updating we can't take screen shot please try to fix it	3	2025-04-10	NEUTRAL	0.993449032	Bugs & Reliability
a5c338ae-275b-44ab-ba2b-e1e556878e0b	1	everything is easy thank you cebe	5	2025-04-10	POSITIVE	0.999839664	User Interface & Experience
e6a4541d-d9d5-464f-9f46-127ea2284787	1	but this app says can't sync	5	2025-04-09	POSITIVE	0.998836577	General Feedback
ceae0bd1-8990-45f6-82ef-c0833ca786d7	1	work on screen shot system	4	2025-04-08	POSITIVE	0.590266883	Bugs & Reliability
39ddf219-7297-4858-8b7a-4016e3bde7f0	1	very very nice aplication	1	2025-04-08	NEGATIVE	0.999829292	General Feedback
d5af7182-07fc-4a84-b818-c7aecf287b92	1	wonder full and it is easy to use	5	2025-04-08	POSITIVE	0.999614239	User Interface & Experience
325bdd8a-e83c-4522-986c-c30c73e3d90a	1	easy and reliable	2	2025-04-08	NEGATIVE	0.999858499	Bugs & Reliability, User Interface & Experience
7a1963a3-f0e5-4a5d-adae-cd179627881e	1	it is Very Useful app 👍	5	2025-04-07	POSITIVE	0.999347746	General Feedback
cd39c8c2-5c5c-4cae-871a-e75ef2dea336	1	I like it.	5	2025-04-07	POSITIVE	0.999869466	General Feedback
9ddd6d35-e396-47c6-865a-461a18e52230	1	it is good but it doesn't allow screen shot	4	2025-04-06	POSITIVE	0.672314584	General Feedback
64ca201d-446a-478e-8fd8-5edb48d7df99	1	the best one	5	2025-04-06	POSITIVE	0.999837160	General Feedback
46fc17b3-ab19-461c-8636-ad995b4485bf	1	You need to copy many things from other bank apps like Amole(Dashen)	2	2025-04-06	NEGATIVE	0.997815609	General Feedback
65a31e10-ca83-46cb-a3de-7b8884218999	1	bring back the screenshot feature.	1	2025-04-05	NEGATIVE	0.994291663	Feature Requests
229077d8-3e5b-478f-9980-0c17db814741	1	best app to experience him that to smooth transaction among the customers	1	2025-04-05	NEGATIVE	0.998514235	Transaction Performance
fff7e46e-23f5-4824-ad13-75ce3242da2a	1	nice app suitable to use it. the only weak side is it need data connections and hoping will be fixed to offline i gave 4 rate	4	2025-04-05	POSITIVE	0.955145359	General Feedback
f7ad3437-2b37-4c45-a9c6-191b08271d2e	1	easy to use	5	2025-04-05	POSITIVE	0.998854280	User Interface & Experience
c0caedf3-4a0b-4c32-94f8-d6a3bb6d3f17	1	Good job to the CBE team on this mobile app! It's designed in a way that's simple and intuitive to navigate, which is great for everyone. It effectively handles the essential banking tasks I need to perform regularly. It's a practical and reliable tool that makes everyday banking much more convenient. Thank you for this useful application.	5	2025-04-04	POSITIVE	0.999808252	Bugs & Reliability, User Interface & Experience
7bc85bf3-f4c1-416c-95bb-cf88068a6b72	1	ለኔ በጣም ምርጥ ነው ግን screenshot ማረግ ቢቻል ምርጥ ነበር	5	2025-04-04	POSITIVE	0.881923258	General Feedback
06e420aa-153d-45ed-b2e5-d779c12141aa	1	before it was smooth and good. this time after the new update in 2025 i can not make screenshot of my recite. even the downlod button is very delayed in putting my recite in my gallery for simple proof. please fix this i am unable to show proof of payment to my clients. thankyou.	3	2025-04-04	NEUTRAL	0.997351170	Account Access Issues, Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
76e52fea-7473-4299-b016-2b4a1aa05906	1	best banking App	4	2025-04-03	POSITIVE	0.999736488	General Feedback
d5748aa6-7b8c-4a9e-8806-ecfe363c217b	1	this app is very necessary app many people found it	5	2025-04-03	POSITIVE	0.998069227	General Feedback
6bb2ee24-e0a9-4f85-ae15-e32fad756186	1	cbe very active Bank I'm using CBE app very very satisfaction	5	2025-04-03	POSITIVE	0.989459753	General Feedback
5ea1fad2-c7cd-43c7-b325-1c3f62032fcd	1	It made life alot easier. I cant even imagine having to make all those transactions in person. So this app was crucial for me. Very good app. well done.	5	2025-04-03	POSITIVE	0.999740064	Transaction Performance
4b5e7079-1248-49e2-a4f2-bbe0a403bba8	1	I Like it	5	2025-04-02	POSITIVE	0.999859333	General Feedback
e1026d09-65d7-41c7-97e7-3a072beee79f	1	I don't understand the reason, why I need to disable developer options to access the app, it has no security risks nor does it hinder the app's functionalities. This goes out to the dev, I hope your life is filled with inconveniences.	1	2025-04-02	NEGATIVE	0.998598039	Account Access Issues, Feature Requests, Security Concerns
e58659bb-7908-4aa3-bdc5-be9357d9b50e	1	easy to use	5	2025-04-02	POSITIVE	0.998854280	User Interface & Experience
5fd9c2e9-96d9-4fa0-b70b-d1a3de41bafa	1	very good app and stars faction with work	5	2025-04-02	POSITIVE	0.999858856	Bugs & Reliability
293b031b-1863-4523-bc4a-cdc68ba44a3f	1	It is excelent	5	2025-04-01	POSITIVE	0.999888182	General Feedback
5addc9b7-03d8-48d2-a74a-afecb6cc5de0	1	በየወሩ አፕደት እየጠየቀኝ ነው ለነገሩ ብር ስሌለኝ ይሆናል እና ምን ለማለት ፈልገ መሰላቹ ወላህ ቼግሮኛል 🥺🥺🥺	3	2025-04-01	NEUTRAL	0.955828369	General Feedback
5b2da8dd-b749-4e65-875b-e9f0f16baeb7	1	very interesting app	5	2025-04-01	POSITIVE	0.999796808	General Feedback
bd55d9e2-4a60-48ba-8006-44e07d974079	1	i like it	5	2025-04-01	POSITIVE	0.999859333	General Feedback
7dbbe46f-fd92-430c-89af-efc40cd4b980	1	wow.......cbe.....keep it up.....!!!!!!	5	2025-04-01	POSITIVE	0.998596966	General Feedback
4d350aed-c16f-4f6c-a70f-2a9c33896aad	1	ጊዜን ቆጣቢ እና ህይወትን ቀለል ከሚያደርጉ ኢትዬጲያ ካሉ ፋይናንስ አፕልኬሽኖች ሁሉ ይሄ ይለያል	5	2025-04-01	POSITIVE	0.951026678	General Feedback
0d57028f-d5d5-46af-be80-b30e6c0ebb63	1	the most useful	5	2025-04-01	POSITIVE	0.999722302	General Feedback
1c2bdc31-563b-4a1b-b318-02af57442ad0	1	I am more satisfied in this app . More sure you have to secure.	4	2025-04-01	POSITIVE	0.978784382	Security Concerns
26591776-dd62-4671-9d4e-e481ba5df9a4	1	Easy to use	5	2025-04-01	POSITIVE	0.998854280	User Interface & Experience
13003c33-c77b-4786-aad5-49077c6fcee8	1	very good, but sometimes NUR CBE comes without my consent. even if I choose locked, it appears	4	2025-04-01	POSITIVE	0.971825600	General Feedback
fa099e0a-0307-4579-bd01-bbf0655d5573	1	always we relay on	5	2025-04-01	POSITIVE	0.997183263	General Feedback
42b5a10f-6e06-4f71-98f0-bd8bf4c9133f	1	I'm lucky to have this🙏 thank you CBE.	5	2025-04-01	POSITIVE	0.999818385	General Feedback
af37bc79-002c-4d3d-a4d6-e7d758e32636	1	it's need more improvement like Tellbirr.	4	2025-04-01	POSITIVE	0.999363124	General Feedback
3622c470-9200-4cab-8183-63dc3a67b4e3	1	a very nice app.👍👍👍	5	2025-04-01	POSITIVE	0.999863744	General Feedback
ebc087cb-987a-4c88-be6a-a54efdbf2ecc	1	safe easy & fast	5	2025-04-01	POSITIVE	0.999350607	Security Concerns, Transaction Performance, User Interface & Experience
88ccbe0d-c8f0-422b-a692-18a44d07c0e1	1	it's good app	5	2025-04-01	POSITIVE	0.999868989	General Feedback
7894c0af-08f2-4e6f-8034-fd8b72e784d6	1	It is veary useful app but screen shout was impossible .solve this problem	5	2025-04-01	POSITIVE	0.995859087	Bugs & Reliability
42da0475-00f3-4431-805c-0ff35c500103	1	እጅግ በጣም ጥሩ አፕ	5	2025-04-01	POSITIVE	0.861633003	General Feedback
cb135a05-7b66-434d-9181-c23d5c7d9e23	1	በጣም ሃሪፍ ነው ግን ብር በሚተላለፍበት ወቅት ተቀንሷል ይላል እላፊ መልክቱ ይደርሳል ግን አይቀንስም	5	2025-04-01	POSITIVE	0.952843368	General Feedback
e22738d0-c7a2-4dff-a684-a29672cca142	1	Dear cbe this app is not comparable with 21century and pls try to solve it.💀💀💀	1	2025-04-01	NEGATIVE	0.999539018	General Feedback
1197e3a2-f9e4-439b-9893-1c82e3e23621	1	best transaction method of financial	5	2025-04-01	POSITIVE	0.999597251	Transaction Performance
d1a344d7-ae11-4752-960c-05c1fddb5b52	1	#CBE is Now going to on the right Pathway/track/!! Thank you CBE one step ahead on payment platform app!!	5	2025-04-01	POSITIVE	0.999536872	Transaction Performance
ea74a6f2-d8ab-438e-a386-f2dee8d6f603	1	It literarily don't work at all	4	2025-04-01	POSITIVE	0.999507546	Bugs & Reliability
43b3f185-c628-4daa-896d-8b3e629f5809	1	good give us plus	5	2025-04-01	POSITIVE	0.999871612	General Feedback
e86dc853-b071-4ba1-8326-6cb96f6fc354	1	Very good application. However, I have one functionality recommendation. What if you let the app transfer money to any telebirr account as for MPESA? By the way, I am not the only one to ask this. Thank you!	4	2025-04-01	POSITIVE	0.979377687	Transaction Performance
7a680c7a-6fdc-41e9-b751-4de7d7d5a586	1	before update it was able to screenshot while after update I can't able to screenshot the transfere details	4	2025-04-01	POSITIVE	0.985217154	Feature Requests
3c3f6d93-93b9-45d5-94c8-e2a99c962179	1	it is good app. But you have integrate cbe with cbe birr. to allow cardless withdrawal directly from our accout!	4	2025-03-31	POSITIVE	0.915197790	Feature Requests
38326d80-7315-4120-ab6d-63f3b1c4df98	1	great when it works	5	2025-03-31	POSITIVE	0.999869347	Bugs & Reliability
117f3f1a-7d6b-4b72-9ca8-64dde3c8c500	1	the app is very good, but why screenshots is impossible?	5	2025-03-31	POSITIVE	0.986167848	General Feedback
3ec5c74f-2d0c-4062-91fb-e7abbaea3ac6	1	excellent match application	5	2025-03-31	POSITIVE	0.999845386	General Feedback
1e1d4fb5-8c70-476d-b2ff-61c89287f9e0	1	The Best app😍😍😍	5	2025-03-31	POSITIVE	0.999846935	General Feedback
8c89fe6d-7d41-449f-8448-50847ff76c5f	1	easy to use and user friendly	5	2025-03-31	POSITIVE	0.997917950	User Interface & Experience
8b6f3b5e-94b2-4b69-a31e-9ffa05a80222	1	አሪፍ ነው በተለይ የአሻራ ደህነቱ መረጋገጡ ተመችቶኛል	3	2025-03-31	NEUTRAL	0.920040667	General Feedback
a7541548-6ac8-429f-853c-9b91828e5aa2	1	ጥሩ ነው አንዳንዴ ስታክ ቢያደርግም	4	2025-03-31	POSITIVE	0.883213103	General Feedback
157c5302-a95d-4dd1-af53-e4b63e04ae74	1	CBE very good apps	5	2025-03-31	POSITIVE	0.999839425	General Feedback
04ce887a-453f-4cc9-824c-8132c050ce15	1	This application fast, secure and more convenient. Thanks CBE	5	2025-03-31	POSITIVE	0.997882307	Security Concerns, Transaction Performance
e46feb79-7fb0-461d-9393-6ee1c91953b5	1	Why didn't you display cash transactions and bank statement in the mobile banking app?	4	2025-03-31	POSITIVE	0.997619569	Feature Requests, Transaction Performance
7ac1f4b1-cd05-44ee-ae8a-30a6ecc3f074	1	our legitimate bank	4	2025-03-31	POSITIVE	0.995416164	General Feedback
be1c3285-c021-4961-9b2a-942bce6e853c	1	Ever and never seen this kind of app I proud my CBE	5	2025-03-31	POSITIVE	0.995219648	General Feedback
915d7435-0de7-4cfb-914c-f09c3e5f04e2	1	very good and safe for me!	5	2025-03-31	POSITIVE	0.999876976	Security Concerns
96ad15a7-6cdd-4148-9cca-ff10e1991adb	1	it is best bank	5	2025-03-31	POSITIVE	0.999776781	General Feedback
d6af9aa1-6bc2-4e40-b82e-7ab2abe15644	1	very good, but sometimes....	4	2025-03-31	POSITIVE	0.999656916	General Feedback
c11c24de-7864-439c-b0de-7237c6f4db0c	1	ከአንድ መስሪያ ቤት ወይም ድርጅት ወይም ግለሰብ በርከት ላለ ሰው ሲላክ የላኪውን መስሪያ ቤት ወይም ድርጅት ወይም ግለሰብ እንዲያሳይ አታደርጉም ? ግለሰብ ለግለሰብ ወይም ለድርጅት ሲከፍል ያሳያል ።	5	2025-03-31	POSITIVE	0.972727358	General Feedback
1465fb12-3a72-4a98-887d-8ac39d65bfb9	1	its so good app	5	2024-10-20	POSITIVE	0.999864221	General Feedback
8a4f0ca3-ed40-487b-a012-690b1aa5365c	1	Why not allowed to pay for fuel?	4	2025-03-31	POSITIVE	0.997495592	General Feedback
6a7c4ac4-a6d2-4572-9f45-2f51f8172007	1	Really! this app is more simple to use at any time in every where also it's transaction quality between the users within the transaction receipt as abank that means this app is our bank on hand in mobile frankly I proud on this bank digital. I have no word to wrote ...... but it's have weakness on poor connection.	5	2025-03-31	POSITIVE	0.996279657	Transaction Performance, User Interface & Experience
1e5fc90a-d0bc-486b-b776-3ae80dfe3564	1	Good and easy to use	5	2025-03-31	POSITIVE	0.999865651	User Interface & Experience
f3d195b8-3df3-488a-86a5-48e0816ab83f	1	nice app and fast money transfer	5	2025-03-31	POSITIVE	0.999432147	Transaction Performance
2f822449-ab5d-49ef-b800-f8bbab01790b	1	bek betam kelal	5	2025-03-31	POSITIVE	0.932547808	General Feedback
cd1eb576-a4df-4b28-bf5f-56022df97d8b	1	ምርጥ አፕ ነው ተመችቶኛል❤❤	3	2025-03-31	NEUTRAL	0.861633003	General Feedback
6af02b24-8db3-424d-8c28-536448217610	1	Recently app keeps closing and the notification after says this app has a bug. Can you make an update please	4	2025-03-31	POSITIVE	0.996840596	Bugs & Reliability, Feature Requests
a05936eb-cb9f-438b-8d36-649f1e35e3a7	1	very good, keep it up	5	2025-03-31	POSITIVE	0.999870181	General Feedback
ade45eda-95cf-4a41-b4cc-a35d09fc9a27	1	there is some issue the process it delay	3	2025-03-31	NEUTRAL	0.995757163	Bugs & Reliability, Transaction Performance
91d848e7-aa95-443a-ac90-7327bffbaa80	1	what an amazing application in Ethiopian Banking industry which is very interested one!	5	2025-03-31	POSITIVE	0.999757230	General Feedback
4cbf8829-1b31-4b79-a56c-58aec5365742	1	it is very good app	5	2025-03-30	POSITIVE	0.999869943	General Feedback
70af3d1e-b55c-434c-b0b8-8a0dab48964f	1	It is very excellent anddynamic plus user friend all in one bank apps of the era. I loved it.	5	2025-03-30	POSITIVE	0.999854326	General Feedback
799b52c2-cc95-46df-aba2-c96edf264401	1	Very God thanks	5	2025-03-30	POSITIVE	0.999330521	General Feedback
f12f3056-b2af-4dc5-a4f8-077223308e30	1	The sum is good.	3	2025-03-30	NEUTRAL	0.999858975	General Feedback
969108d4-30ce-4089-a92c-2dbb90e7c041	1	best of bests	5	2025-03-30	POSITIVE	0.999694824	General Feedback
da0517a4-eccc-4fb8-8974-b1a3e5b135e6	1	am happy thank you CBE🫡	5	2025-03-30	POSITIVE	0.999847412	General Feedback
4ddb61d6-6512-4e02-ad93-1abc3b784872	1	it's very nice 👍.	5	2025-03-30	POSITIVE	0.999860883	General Feedback
6cf09afc-f13c-462f-9183-c33863284a68	1	The history sometimes misses transactions, tranfer to cbe birr debited but not really transferred, We need to really cop up with the world for real. The hacks and security problems, invest on and solve them.	3	2025-03-30	NEUTRAL	0.995271146	Bugs & Reliability, Security Concerns, Transaction Performance
d3afe77f-b964-469e-a25a-9dc549fb3cfa	1	halan garidhaa cbe	5	2025-03-30	POSITIVE	0.976089954	General Feedback
8362e65a-05cf-45c0-96b3-c87ad47b9a2f	1	best apps for useing	5	2025-03-30	POSITIVE	0.998952389	General Feedback
9fa18c05-08ba-43d5-a9b0-63c6ae87b3a2	1	Good apps ...But fix the screenshot its not easy like before ......	5	2025-03-29	POSITIVE	0.947035134	Bugs & Reliability, User Interface & Experience
27e17729-08e9-43aa-b77a-c1dd0cb394e4	1	l love it	5	2025-03-29	POSITIVE	0.999872208	General Feedback
d3125729-3da0-4331-9052-dfbb2850b136	1	I am not exaggerating when I say that this application is one of the biggest players in the banking industry. It has simplified a lot of things for the user, even if the bank is in his pocket. But my opinion is (1), when we transfer money, there is a word limit on the (Note) at the end. Why can't we write our reason briefly? I don't understand why it is limited. On the other hand, there is no limit on the bank. Could you explain this? (2), when we pay for water, why is the code not mentioned	5	2025-03-29	POSITIVE	0.984495878	Transaction Performance
060dd246-45a4-4e73-b059-992324c188eb	1	in this update why screenshoot is disabled now it's not working	1	2025-03-28	NEGATIVE	0.999631524	Bugs & Reliability, Feature Requests
e2535fda-029f-4ff9-ad71-decf822e225a	1	realy I donot seen like this application ! fast ,safe ande confortable	5	2025-03-28	POSITIVE	0.959073782	Security Concerns, Transaction Performance
bb4c6ba4-c74f-452b-9012-880c7cf5fa05	1	Excellent but needed upgrading!	5	2025-03-28	POSITIVE	0.926374674	General Feedback
34c8ed96-d00f-4805-ac0d-7dc14704790b	1	goods app!! pleace update this apps??	4	2025-03-28	POSITIVE	0.984563053	Feature Requests
19f55fb5-6f4a-40aa-a1ea-b9e4fa7eabc7	1	The latest update prevents taking screenshots, which is really annoying! please allow us to take screenshots! we need it for evidence (particularly, in case of transfer failure!).	1	2025-03-27	NEGATIVE	0.997244716	Feature Requests, Transaction Performance
73f5af9d-deb1-4bda-8119-e7e8efbd9737	1	Fantastic app! I appreciate it very much	5	2025-03-27	POSITIVE	0.999874592	General Feedback
1345710a-a286-45a4-b8e5-77f53f186de2	1	Doesn't work properly. It crashes some many times. commercial bank of Ethiopia not only the application but also sending money to own CBE birr doesn't get your money in your bank account. forcefully you must wait 3-5 days to get your money back to your account. walk up CBE the world is going to decentralized finance.	1	2025-03-26	NEGATIVE	0.999572694	Bugs & Reliability
66f5fb67-df7b-4274-aba4-d2c99ae38b1c	1	It crashes multiple times everytime you launch it. Fix it. Edit: crash fixed but screenshots has been disabled. I don't know who thought this was a good idea.	1	2025-03-26	NEGATIVE	0.999531150	Bugs & Reliability
fa50a30f-d398-4c2d-b0d1-f94eea8a1349	1	why why u remove screen shoot😡😡	2	2025-03-26	NEGATIVE	0.999226570	General Feedback
eb098c76-248b-4755-a15f-08a4e6f019cd	1	I fails mid transaction, No screenshot, download don't work, link shared not working bring back the old app this is usless	1	2025-03-26	NEGATIVE	0.999296784	Bugs & Reliability, Transaction Performance
d98d7575-0d00-41d0-bf08-c733b6b9ad84	1	very nice one	5	2025-03-26	POSITIVE	0.999856114	General Feedback
0f99bd26-2bc3-4d0f-a813-f636ac631065	1	problem solver and the best fast app	5	2025-03-25	POSITIVE	0.999776185	Bugs & Reliability, Transaction Performance
dde8e620-2686-4797-a908-777b413fe102	1	ምርጥ አፕሊከሽን ነው ገንዘብ ለመላክም ሆነ ለማንኛውም ነገር ተመችቶኛል በዚው ቀጥሉበት	5	2025-03-25	POSITIVE	0.944585383	General Feedback
f8522da0-c097-437e-9926-77b8b595c95d	1	Please bring back the screenshot option. The screenshot download option takes like 15 second appear in gallery and most people don't know about it.	3	2025-03-25	NEUTRAL	0.995722771	Feature Requests
969b2955-eda5-421b-b086-2aff885c8fbe	1	you must added dark mode options ❗	3	2025-03-25	NEUTRAL	0.986368120	Feature Requests
745162ad-44bc-4883-9ca7-257d0c3903b1	1	ممتاز جدا جدا	5	2025-03-24	POSITIVE	0.860805511	General Feedback
b0e36e7c-bd4d-4e3b-b64d-7b152f182395	1	very nice and convenient app	5	2025-03-24	POSITIVE	0.999826729	General Feedback
265ad3b6-caf0-4359-b484-8415ddc178f2	1	there are to many bugs app keeps crashi ng and the update file seems to keep getting worse	2	2025-03-24	NEGATIVE	0.999790251	Bugs & Reliability, Feature Requests
55fcc279-e571-493b-9de1-5abe1c7f00d4	1	Great experience so far but why this app ain't working while developer mode is on?	4	2025-03-24	POSITIVE	0.996714115	General Feedback
d7022918-8907-4667-b975-7ccf6a6dd252	1	why did the screen shot stopped ?????	3	2025-03-24	NEUTRAL	0.999007761	General Feedback
07da55e1-0830-4332-b629-3bff9fcc530b	1	it's genuine app..	5	2025-03-24	POSITIVE	0.999855518	General Feedback
064d85e7-3139-487b-9bd1-e92324287d49	1	it's a very good application but sometimes it takes a long time to synchronize	4	2025-03-23	POSITIVE	0.990075052	General Feedback
e63525d9-41ef-46a2-adb6-e23920b85582	1	it's very good	5	2025-03-23	POSITIVE	0.999847054	General Feedback
090bc8fe-3ffa-44f0-b90f-af5404253c80	1	to getting money	5	2025-03-23	POSITIVE	0.859529197	General Feedback
4ac5c134-1684-4e1c-87e0-94be9c62cdcb	1	some times it is difficult to get reciepts for the payment made	1	2025-03-23	NEGATIVE	0.999337018	Transaction Performance, User Interface & Experience
5edb76f2-5936-4b72-9a95-1000ffb48772	1	this app is best	1	2025-03-23	NEGATIVE	0.998983920	General Feedback
2454d502-1137-4853-a1db-e15b4c4e6809	1	it's very useful	5	2025-03-23	POSITIVE	0.999798357	General Feedback
5284a9d0-020e-4351-b428-590effe7000a	1	best app and update more features *****	5	2025-03-23	POSITIVE	0.999544322	Feature Requests
a1ee7495-fa71-4be5-857c-a168af3bfbc4	1	best app for this vast digital finanical word	5	2025-03-23	POSITIVE	0.993187308	General Feedback
bdecbc24-561c-4f86-9ebb-cbc5418bee21	1	this app is my favorite application	5	2025-03-23	POSITIVE	0.998567700	General Feedback
038494c8-d40a-481f-ae34-eef827147664	1	Hooo I love this application	5	2025-03-22	POSITIVE	0.999851704	General Feedback
9801defb-1233-473f-bdfb-6442a0c89ab0	1	The app protects me from screenshot after update. Please make revision on the app.	4	2025-03-22	POSITIVE	0.952551305	Feature Requests
881d8902-e141-463f-9dc6-12d8338ec43c	1	Screenshot or slip not working	2	2025-03-22	NEGATIVE	0.999714673	Bugs & Reliability
69db284a-5d0e-40a7-a7e0-14b8aa446a23	1	thank you for help	5	2025-03-22	POSITIVE	0.999822319	Customer Support
f107c5a1-1a11-4e79-a9e1-d4e7bdfc0fd1	1	I'm sad guys what are you doing? Why did you add the screenshot restriction to the app? You just made it worse it was a great value to us. You need to rethink it. i will change the 1 star rating when you resolve the issue.	1	2025-03-22	NEGATIVE	0.999365866	Bugs & Reliability, Customer Support, Feature Requests
22c381dc-28fa-4209-a631-23986b7c357a	1	Thise is helpfull and have good and easy for mobile money usage in ethiopia	5	2025-03-22	POSITIVE	0.996585488	User Interface & Experience
24550474-adc1-4385-8743-0fe8f1864540	1	Old version was very friendly to use. Now we can't see the #Reason The #transaction history (very limited) and now it crash every time it's opened. More over, the last update prevents us from taking #screenshots. Thanks for the developers as they are getting more stupid than ever.	1	2025-03-21	NEGATIVE	0.998621345	Bugs & Reliability, Feature Requests, Transaction Performance
3c2c522f-ed63-4ee4-9375-8c2dddd10540	1	Since last week this app has started not working. It simply log in without network but can't sync. Please fix it.	5	2025-03-21	POSITIVE	0.999341071	Bugs & Reliability
886b8882-6269-4710-9796-2f97a0062b29	1	What an absolutely terrible update. No screenshots and you still have this stupid restriction on developer options. WHAT ABOUT THOSE OF US WHO ARE ACTUALLY DEVELOPERS!!!!!! At this point telebirr just wins the game 100%. CBE. Do. Better!	1	2025-03-21	NEGATIVE	0.943087518	Feature Requests
d45d0cce-d1e3-4ab2-bff1-5dc9f39ffc0f	1	Wow its my in	5	2025-03-21	POSITIVE	0.999341309	General Feedback
4b831c55-3e93-470c-b16e-31d6c0b407f4	1	In the lasted update you removed the capability to screenshot transactions.	3	2025-03-21	NEUTRAL	0.998357356	Feature Requests, Transaction Performance
7a29f006-ac47-438b-8eef-42f5109354ac	1	how do you disable screenshots on a banking app you are very unserious people	1	2025-03-21	NEGATIVE	0.997620523	General Feedback
4e4a28f0-b032-4eb9-a6bf-5b383475c447	1	no screenshot and biometrics on this version wtfk?	3	2025-03-21	NEUTRAL	0.999478877	General Feedback
c95fbb26-5cba-4ea5-aa0d-b3cdb196fd41	1	Not Good, too lame to use	1	2025-03-21	NEGATIVE	0.999597728	General Feedback
d8e41bf7-af0f-4515-b606-f85d228e79e4	1	ረዘም ላለ ግዜ እየተጠቀምኩት ነው ይህን መተግበሪያ ጥሩ ነው ነገር ግን አንዳንድ ችግሮች አሉበት 1ኛ የከፈልኩበትን ደረሰኝ በግዜው ከልወሰድኩ ከሰላሳ ትራንዛክሽን በኅላ መልሼ ከዚህ በፊት የተገበያየውበትን ማግኘት አልችልም ልክ እንደ ሌሎች ባንኮች ምሳሌ (አቢሲኒያ አዋሽ..) ሌላው ብር ለመላክ አስቤ እልካለው ግን አካውንቴ ላይ ለተወሰነ ደቂቃ ከአካውንት ሰይቀንስ ይቆይና ያልገባ መስሎኝ ድጋሜ እልካለው ሁለት ግዜ ሰው ጋ ይገባና ሌላ ችግር ውስጥ መግባት ይህኛው በጣም ትኩረት ሊሰጠው የሚገባ ጉዳይ ነው ሌሎችንም ስህተቶችን ማንሳት ይቻላል ዋናውን ላንሳ ብዬ ነው እንጂ developerሮች በርቱ በየ ግዜው የሚሰጣችሁን feedback ተቀበሉ አሻሽሉት	3	2025-03-20	NEUTRAL	0.967701674	General Feedback
a1592110-21bf-4533-9d12-20224150e92d	1	CBE app is great	5	2025-03-20	POSITIVE	0.999706447	General Feedback
32cdf18e-490a-4816-a552-ef9a5589735b	1	its good and saving time	5	2025-03-20	POSITIVE	0.999865294	General Feedback
c61286fb-631a-440c-96fd-1dc5d09bc76e	1	this new update(Mar 19,2025) is great in fixing bugs, stability and smooth experience I'll give u that but it came with a big shortcoming which is not allowing to take screenshot. I can't screenshot neither my balance nor the transaction or anything within the app, i understand it's for security reasons but please bring that back, allow us to take screenshot we need that. Thanks.	4	2025-03-20	POSITIVE	0.998244643	Bugs & Reliability, Feature Requests, Security Concerns, Transaction Performance
20a09b8b-5079-467b-b449-42c6a2463dc5	1	what went wrong, I couldn't take a screenshot.	3	2025-03-20	NEUTRAL	0.999525189	General Feedback
e17a4ea8-0adc-4130-b75d-8ff9d262ffba	1	App is crushing recently. Please update.	4	2025-03-20	POSITIVE	0.996463478	Feature Requests
a6834374-59bc-40f8-a36a-dc28930ece81	1	It is good but why screenshot is forbidden	4	2025-03-20	POSITIVE	0.910075307	General Feedback
cbae8db5-455f-45a9-a45b-a41eafbd59d0	1	Taking away the screenshot of the receipt is just silly. Worse is tbe download button putting a copy of the screenshot - which you prevented to be taken - in tbe downloads folder where we cant attach directly from Whatsapp. Millions of people use the screenshot as proof of payment / transfer yet you make that harder for everyone? I have every user contacts the developer or manager who made this awful decision.	1	2025-03-20	NEGATIVE	0.999713004	Customer Support, Transaction Performance
b9606055-ec45-4883-b192-fcbc2aa530b7	1	very good app	5	2025-03-20	POSITIVE	0.999867558	General Feedback
e575b527-d6fd-426a-979f-46189ef72d30	1	New update version 5.0.9 keeps crashing it needs maintenance	3	2025-03-19	NEUTRAL	0.998588860	Bugs & Reliability, Feature Requests
6a802057-ea8e-4daf-817e-feee05e03d55	1	the update is unneeded	1	2025-03-19	NEGATIVE	0.997623742	Feature Requests
7d68d33b-b337-4119-a381-9ad93f9ddd8b	1	as if the update of march 19 i can't take a screenshot in the app. i can just save it as file and that is so annoying. i used to save all screenshot in my gallery in one folder now with the extra steps added i have to save the file go to file and then screenshot it. the solution is to allow the screenshot to be save in to gallery automatically. i wish you give this review attention and resolve the issue shortly.	2	2025-03-19	NEGATIVE	0.999533176	Bugs & Reliability, Customer Support, Feature Requests
04016fba-959a-42fc-ae43-5b359b795831	1	it is good app but when I make inter bank transaction It can't display The receiver account number and name of receiver and also receiver bank	4	2025-03-19	POSITIVE	0.893497646	Transaction Performance
e35dc475-0573-466a-943f-d9aa3aa4045b	1	It was nice but now it dose not opened the transactions	5	2025-03-18	POSITIVE	0.997056842	Transaction Performance
2c7a85fa-0220-4809-8b3f-6ad0d1927188	1	simple to use	5	2025-03-17	POSITIVE	0.997062266	User Interface & Experience
22d167ee-92a5-4d54-8310-d7595322ced2	1	The apps is good to use	5	2025-03-17	POSITIVE	0.999810755	General Feedback
7ce53652-e205-4421-9fb4-36864ff34060	1	It's best app but Please add(included) payment of water bill	4	2025-03-17	POSITIVE	0.877090573	Feature Requests, Transaction Performance
eee09632-0155-4a1d-8b6d-e53917e70b2e	1	the app has a bug and it keeps crashing 😑 please provide an update and fix the issue thank you....	3	2025-03-17	NEUTRAL	0.980418324	Bugs & Reliability, Feature Requests
04e5e4b6-928a-4514-be68-f44a8ae410e1	1	This is my favorite App	5	2025-03-17	POSITIVE	0.998533368	General Feedback
5d522938-51b9-4ca3-8044-725020e5cea3	1	CBE i like	5	2025-03-16	POSITIVE	0.999595940	General Feedback
12ee1dcb-db00-4fbb-8266-ff46001ceca5	1	1.we can't get mobile Token on CBE App or any other online. This is need to improve 2.internet banking is always say authenticate error after some weeks this is need to improve.	4	2025-03-16	POSITIVE	0.998772919	Account Access Issues, Bugs & Reliability
4cb6f2f9-9ef1-4904-8cd0-b6afe949f955	1	excellent app for account transaction specially for bussiness customers and a good method to pay bills and different personal payment.	5	2025-03-15	POSITIVE	0.999469101	Transaction Performance
1b39f225-3e5e-4184-af6f-c817f8e5d331	1	የሚገርም አፕ ተመችቶኛል 🙏❤	5	2025-03-14	POSITIVE	0.833725393	General Feedback
2f71cb3c-96a2-445b-99c8-9f3a4bb2977e	1	The app has brought a new problem. When i open the app, it closes itself then i have to open it again. Please fix this issue if it's your problem	3	2025-03-14	NEUTRAL	0.999167204	Bugs & Reliability
f42c7cf8-f953-4c16-9356-fa6d129a95cd	1	በጣም ጥሩ አፕልኬሽን ነው	2	2025-03-14	NEGATIVE	0.861633003	General Feedback
53fa1ec7-c03c-4c93-84b2-073813a8bb95	1	In my view, I can't give any conclusion because it's the starting of an online banking in my country. However, the commercial bank of ethiopia must rebuild this app and also need to make more access to changing the system. Keep continuing ethiopia 🇪🇹 🇪🇹🇪🇹🇪🇹	5	2025-03-14	POSITIVE	0.997405708	Account Access Issues
59bdac2d-88c9-4c25-93cd-bba54169d234	1	Very attractive and user-friendly	5	2025-03-13	POSITIVE	0.999504685	General Feedback
1eedb08d-fbfc-44bd-a579-001b1e3aa11d	1	My special app and my proud bank of Ethiopia.	5	2025-03-13	POSITIVE	0.999779999	General Feedback
a6a2de22-6e1e-4fbe-8d3e-9ce75d7e0f6e	1	The app need update it always crash	1	2025-03-13	NEGATIVE	0.997951686	Bugs & Reliability, Feature Requests
8b6e8fe8-8503-4abb-9898-6c7a340b41c8	1	It is very comfortable and simple to use!!! But whay standing order is not work?	5	2025-03-13	POSITIVE	0.618418753	Bugs & Reliability, User Interface & Experience
f7a2ec07-d568-489b-86b9-d4ad903398b6	1	One of the best apps I have used ,	5	2025-03-13	POSITIVE	0.999808252	General Feedback
0aafdbde-9e66-47df-8083-45d77411764b	1	I am appreciate this app	5	2025-03-13	POSITIVE	0.999800146	General Feedback
cbac1f3c-447c-4a2f-a604-e34caf1accf6	1	I'm very happy using this app. Thanks to developers.	5	2025-03-12	POSITIVE	0.999838948	General Feedback
61d62e31-99bb-4cc6-918e-846bd05a7924	1	CBE birr app is my best choice.	5	2025-03-12	POSITIVE	0.992366970	General Feedback
cd8cae0b-6e75-4a03-b64b-034388a78229	1	Unstatisfied with the new update keeps crashing every now and then and even though i haven't reached the max txn per day still refuses to transfer...probably going to change my bank if it's not fixed asap	1	2025-03-10	NEGATIVE	0.999268472	Feature Requests, Transaction Performance
71d860e5-b89c-447e-a8eb-96c7c40cc4a1	1	It is one of the disappointed Bank you don't suppose to include Ethiopian on your name you don't deserve it.	1	2025-03-10	NEGATIVE	0.999173462	General Feedback
008d79b5-cfd3-4a31-849a-6d77040a3822	1	Simple and easy to use	5	2025-03-10	POSITIVE	0.999731839	User Interface & Experience
fd5b4630-c3f5-4e72-be7b-968e67a60913	1	it's not good app	5	2025-03-10	POSITIVE	0.999803483	General Feedback
420ab521-b373-4976-abed-9677ad0c2c38	1	I have been using CBE App for long, but recently it has started crashing repeatedly and even my phone is reporting that the app has bugs and tells me to wait the developer to fix these bugs.	1	2025-03-09	NEGATIVE	0.999710619	Bugs & Reliability
92f598df-c60e-40f3-845e-567b2cf1133d	1	The great app CBE	5	2025-03-09	POSITIVE	0.993746519	General Feedback
9fe40f98-1c09-489a-bbca-7bd95949839e	1	Why it asks me Update repeatedly as soon as I download it !!	1	2025-03-09	NEGATIVE	0.995996714	Feature Requests
0a2ddc29-b02c-4d06-82e9-65a8572a4ff0	1	Commercial Bnk Rate this	5	2025-03-08	POSITIVE	0.963792920	General Feedback
c5e0a264-b7e8-4eec-914f-4567c6096ff5	1	It is good for many aspect. If I can get transactions report with time duration(periodically)	3	2025-03-07	NEUTRAL	0.999204099	Transaction Performance
036e446f-59fa-4d11-81c1-5c3ad5ba85a4	1	its so excellent app	5	2025-03-07	POSITIVE	0.999862313	General Feedback
d1dfb39d-929f-4da0-b5b5-f36df3083c96	1	Due to connection problem	1	2025-03-07	NEGATIVE	0.995950818	Bugs & Reliability
5a2dc88b-0fa0-47fe-aa34-90f9e2e37763	1	Best performing app	5	2025-03-07	POSITIVE	0.999596655	General Feedback
b26b8fe7-db4e-40f4-9868-fb51ee5f2c5d	1	I love it	5	2025-03-06	POSITIVE	0.999879956	General Feedback
6e3e7a73-a02f-4733-92de-aed3d39894ab	1	Best banck in Ethiopia	5	2025-03-06	POSITIVE	0.999021888	General Feedback
2c4be739-53d6-4753-90f9-62f82f9b695f	1	Two step verification update is fake (meaningless). Why because the app gives you an option of to use pin while requesting two step verification step. 🔐 This updated app is not differ than the previous one in case of security & safegaurding users.👹👹💀💀 The other features of the app are best and easy to use it.⭐️⭐️⭐️⭐️⭐️	1	2025-03-06	NEGATIVE	0.973563075	Account Access Issues, Feature Requests, Security Concerns, User Interface & Experience
08289ab9-0bf7-4a31-b441-1ec31d908934	1	Why don't install	5	2025-03-05	POSITIVE	0.998905420	General Feedback
ab5549d4-87a2-4fe3-af5c-6ea04fa8e0ae	1	I'm glad to use it.	5	2025-03-05	POSITIVE	0.999655485	General Feedback
c9161083-9293-48ca-a78e-3d27cdb2e355	1	Very good thank you	5	2025-03-04	POSITIVE	0.999854445	General Feedback
e3d47ba9-1710-42e0-b7b3-fdbefff233e6	1	it's not working good	5	2025-03-04	POSITIVE	0.999778926	Bugs & Reliability
483ce49d-a0ff-4a8b-8d8e-64f6cbcfad97	1	I love it	5	2025-03-04	POSITIVE	0.999879956	General Feedback
a8b533b0-0538-43b4-8c46-8a386ae02524	1	I have been a customer of the Commercial Bank of Ethiopia for many years	5	2025-03-03	POSITIVE	0.842241466	General Feedback
e50f1cb8-5d12-4457-9989-a46e8d7968bb	1	We need this app to work properly, and it looks like an outdated	2	2025-03-03	NEGATIVE	0.999803722	Bugs & Reliability, User Interface & Experience
27b78a28-7888-4577-a4e5-bca86913ba26	1	The app crashes too many times. It's a buggy app	1	2025-03-03	NEGATIVE	0.999726832	Bugs & Reliability
0340b07e-17e4-47dd-82de-fb3f73c0106c	1	Verry good it is easy to use anything	5	2025-03-01	POSITIVE	0.999584734	User Interface & Experience
75871dc7-da73-4e2e-87d8-1dbb50cfd6e9	1	So slow with Internet	1	2025-03-01	NEGATIVE	0.999055207	App Speed & Performance, Transaction Performance
6868a587-b491-4c40-bbd8-067d59a798c9	1	I phone app is not working	2	2025-03-01	NEGATIVE	0.999759018	Bugs & Reliability
b2b41603-795d-4a0c-8016-2d74348cfa1b	1	Sometimes it dosent work	4	2025-03-01	POSITIVE	0.783625245	Bugs & Reliability
70edc12f-a86f-4df6-8894-e7718f60d16a	1	It's very useful Apps	5	2025-03-01	POSITIVE	0.999657393	General Feedback
bed5d43e-3800-4f97-b19d-759ac561ec21	1	It is better app	5	2025-03-01	POSITIVE	0.977239490	General Feedback
afd66c62-ea2b-43bd-a5e4-3754a7ea9be7	1	Good work very important	5	2025-03-01	POSITIVE	0.999860048	Bugs & Reliability
06c72dd3-2b7e-4b6f-8b8b-96c9e7eff0b1	1	It is exlent app it is helful	5	2025-02-28	POSITIVE	0.769862354	General Feedback
9702fd84-2cb6-49ef-9636-07ef5adc29db	1	Best app I like	5	2025-02-28	POSITIVE	0.999688625	General Feedback
e0545a8d-abaf-43a8-bced-8f149ff7d9ae	1	It don't work	1	2025-02-28	NEGATIVE	0.999772608	Bugs & Reliability
3bf462e8-0934-4cd1-a184-44a2f069f085	1	It's a shame,it can't performe well,you guys can't even fix a bug, It's getting unusable, shame shame shame 😡	1	2025-02-28	NEGATIVE	0.999152780	Bugs & Reliability
d5335ec2-898a-46a1-a30d-a059a62d74a7	1	Easy to Use and Effecent System.	5	2025-02-28	POSITIVE	0.944872797	User Interface & Experience
a0fed93d-9104-4ef1-ac46-1e73bb2895e8	1	የሞባይል ባንኪንጋችሁ ግብይትን ቀለል ያደርጋል	5	2025-02-28	POSITIVE	0.883213103	General Feedback
d0bfc857-7254-421b-97b4-96ba0df9df7a	1	It is good but i can not install the app why? And the other one is it is better to show the earliest transactions for instanse before 30 days ago	3	2025-02-27	NEUTRAL	0.994843483	Transaction Performance
84d87c3c-abc1-4d31-8986-5a1483092b46	1	Sometimes it does not.work	3	2025-02-27	NEUTRAL	0.990379930	Bugs & Reliability
dadb6d19-58d3-4d86-99be-2d320bb89351	1	I have been using the App since it is first released and it has been nice, but the latest Update are very worse the app crashes frequently and drains battery highly.	3	2025-02-27	NEUTRAL	0.999701440	Bugs & Reliability, Feature Requests
0f597ce8-4462-4394-a66e-689cc2b15c61	1	Commercial bank and it's mobile banking is very good	5	2025-02-27	POSITIVE	0.999827325	General Feedback
2d32682b-0278-4c8d-8cfe-a0fdfe1cd011	1	Good very good	5	2025-02-27	POSITIVE	0.999847770	General Feedback
30972deb-09c0-4d13-a631-9ee7b29a16ec	1	Friendly mobile banking application	5	2025-02-27	POSITIVE	0.998765945	General Feedback
f10e4860-2268-4231-b2e4-4fd1e61c9e2c	1	I love it	5	2025-02-27	POSITIVE	0.999879956	General Feedback
7ab7c81d-e47e-404e-94b1-a8b6cda4bb02	1	1 star because I have to visit my bank for new installation of the app and reactivation takes about 45 to 60 minutes with there long queue and system failures. Learn from telebire app and give options to customers to apt out of this ridiculous security feature. Second why is there no customization in the settings for displaying which account I want displayed in the first section rather that slide to my main account every time. You are making us pay a monthly subscription. Bare minimum is not it	1	2025-02-26	NEGATIVE	0.999330759	Feature Requests, Security Concerns
9e530b33-efd5-42b0-8137-013afdf1d56a	1	Recently it is not working please check it	2	2025-02-26	NEGATIVE	0.999083519	Bugs & Reliability
dfb1830a-cb2a-4b1d-82ca-ca02526edcc0	1	It is a user friendly excellent app.	5	2025-02-26	POSITIVE	0.999838471	User Interface & Experience
489bd911-85a6-4204-80e0-8482397e55fe	1	Simple and efficient	5	2025-02-26	POSITIVE	0.999866366	App Speed & Performance, User Interface & Experience
4d718e53-7242-4d91-b710-3fa61c3c2837	1	It is Better to use and Save time. I truly appreciate the Bank System.	5	2025-02-25	POSITIVE	0.999414325	General Feedback
10c465bd-78ce-49e5-81a5-98c534f84d9a	1	Simple and secure app	5	2025-02-25	POSITIVE	0.999154925	Security Concerns, User Interface & Experience
aadce885-262f-4782-94c3-120bb3edf8b2	1	Crashing frequently every time I try to log in.. it's so annoying	1	2025-02-25	NEGATIVE	0.999456346	General Feedback
0532bb6b-619e-4979-8ec3-c8bf772cbbf4	1	FIX THE BUG! so frustrating	3	2025-02-25	NEUTRAL	0.999360859	Bugs & Reliability
fe580bf3-58da-4281-b9b4-98f1d67c97f9	1	Something is wrong with the new update,it keep closing itself and i couldn't made an important transaction.	3	2025-01-30	NEUTRAL	0.999677181	Feature Requests, Transaction Performance
ca46f7bb-1093-4dd7-9f46-d5cf4af0d68b	1	The latest updates crushes repeatedly on my Redmi Note 12 pro plus. If you could correct the issue.	1	2025-01-30	NEGATIVE	0.999481618	Bugs & Reliability, Feature Requests
ceca6531-d52e-4f24-b61a-1f804b5897b2	1	The app is full of bugs here and there, perhaps it's from the backend side idk. For instance the transaction history you see on top is one made a couple of months ago and you have to refresh until you reach the top. it's just so bizarre. And you can't even search for a transaction you made. Someone with a lot of transactions will find it annoying. Even simple things like localising dates to Amharic dates are now correctly implemented.	2	2025-02-25	NEGATIVE	0.995282948	Bugs & Reliability, Transaction Performance, User Interface & Experience
2d7e3e51-4b7e-45db-8ca8-1a48e8e8dea8	1	My device install up updated all data access all function but can't support transaction i. e first login password works but can't conformation last transaction password	5	2025-02-24	POSITIVE	0.997616172	Account Access Issues, Bugs & Reliability, Customer Support, Transaction Performance
11f055a9-a348-4b3c-b9eb-2cffe85d0142	1	Constantly crashing after new update	1	2025-02-24	NEGATIVE	0.998208880	Feature Requests
b602eef0-6f1f-4f6d-927f-f627825e1601	1	Ani Addunyaa Eebbisaa Tolasaa ti. Magaalaa Mandii keessaa dukkaana qorichaa dhuunfaan qaba. Appilikeeshiniin kun hojii koo kana naaf saffisiisuu keessatti qooda ol’aanaa qaba. Akka ‘mobile banking’ ‘busy’ waan hin ta’u. Namoonni hundumtuu Appii kana akka fayyadaman cimseen gorsa. Galatoomaa!💪🙏❤️	5	2025-02-24	POSITIVE	0.996209860	General Feedback
e583247b-27d0-4bf8-9344-8b706a735948	1	Great UX, simple to use yet has all necessary features.	4	2025-02-24	POSITIVE	0.990747452	Feature Requests, User Interface & Experience
cf0d5638-e97b-41c0-94e4-fc8df1716ec4	1	Nice 👍 this is app	5	2025-02-23	POSITIVE	0.999792397	General Feedback
af7af830-29cf-430c-8653-59c26a7e2860	1	Why can't we use this app with Developer Mode turned on, when other big international banks apps allow it?	1	2025-02-22	NEGATIVE	0.997962356	General Feedback
f0bc4e18-661e-4be4-8000-1eabedee9992	1	It is Good application	4	2025-02-22	POSITIVE	0.999868155	General Feedback
5b5d96ec-32b7-4537-a04b-86250d90e656	1	Guys after the last update it's crushing a lot like alot look in to it	3	2025-02-22	NEUTRAL	0.951268137	Feature Requests, User Interface & Experience
c5eae2fc-c358-45aa-9463-233695d78d3e	1	The best app	5	2025-02-22	POSITIVE	0.999846935	General Feedback
740fb067-e350-45c7-875f-46fcd30507d6	1	This is agood app	5	2025-02-22	POSITIVE	0.974009275	General Feedback
014172c7-1372-4b50-9cfa-536ee7aa5967	1	It have a bug it keeps shut down when I open the app. Without any notification. Please fix the bug.	3	2025-02-22	NEUTRAL	0.999548495	Bugs & Reliability, Feature Requests
ec0b4d76-e531-4ab6-9313-ada4794ba81c	1	Very best and fast money transferring app	5	2025-02-22	POSITIVE	0.999132931	Transaction Performance
5a8ace99-795e-46e3-8301-a9519d73a1e3	1	Why is it so hard to use this app why don't you make it simple like other apps sometimes it doesn't function right	1	2025-02-22	NEGATIVE	0.999384761	User Interface & Experience
837d8d5c-1016-4af8-8c85-e09b5a890db1	1	Very best app	5	2025-02-22	POSITIVE	0.999817789	General Feedback
900c1b34-82ab-4f2b-b0b3-8039caaa80d2	1	couldnt update the app	1	2025-02-22	NEGATIVE	0.995849848	Feature Requests
74dd155c-0735-475a-8c88-be5c401156cf	1	ምርጥ አፕ ነው ሌላ ማለት አይቻልም ፡ግ	5	2025-02-22	POSITIVE	0.923957765	General Feedback
5609bfae-d0a0-4436-ab7b-b9091f75a8c2	1	Too much commission and service charges, not fair at all this is stealing	1	2025-02-21	NEGATIVE	0.999596298	Transaction Performance
7f353d83-5d1f-4425-9c9f-61540dd869bc	1	Not work some tumes	5	2025-02-21	POSITIVE	0.999315977	Bugs & Reliability
cac1d4f1-c064-49e3-9a5f-71792a39dbf0	1	It is easy and user friendly	5	2025-02-21	POSITIVE	0.998678148	User Interface & Experience
5a8264e5-3245-42fe-87a7-1f623a0c887e	1	When I open the app it turns off keep says (app has a bug ) the app needs update	2	2025-02-21	NEGATIVE	0.998843908	Bugs & Reliability, Feature Requests
764b9487-9657-483d-a3e7-1f9da24edbf6	1	Solve unwanted time and the time to losses cbe office	5	2025-02-21	POSITIVE	0.996820688	General Feedback
01860374-334f-457b-8194-6bf6cf96a0bf	1	I faced a big problem with this due to Developer mode problem How can you help me pls?	5	2025-02-21	POSITIVE	0.999622464	Bugs & Reliability, Customer Support
e5e20443-5602-4d7d-a034-56a5d9410e36	1	utilizes too much power & Crashes often	3	2025-02-20	NEUTRAL	0.996391475	Bugs & Reliability
d3d315b5-29d7-46c7-9acf-3f0ebd6b33ca	1	Most effective so far.	5	2025-02-20	POSITIVE	0.999697685	General Feedback
f5e627b5-b3d8-44cf-b787-76298c1540e6	1	Not working normally	1	2025-02-20	NEGATIVE	0.999599636	Bugs & Reliability
d0264aed-7cc3-48ce-9c45-26423c8cc2e8	1	this is the simplest bookeeping system or method. I like it .	5	2025-02-19	POSITIVE	0.995793104	General Feedback
8e2a4606-618d-4015-8e95-ca95f9b1c738	1	These days the App is Crashing immediately after Login please check	5	2025-02-19	POSITIVE	0.993334174	Account Access Issues
9f97c058-82f5-435c-b621-41b0cd39a557	1	I gave it 5🌟 BC this app deserves. Thank you for your services. Appreciated.	5	2025-02-19	POSITIVE	0.999518871	General Feedback
1ddb5630-6d4c-4011-b8aa-f099c8631ed9	1	fantastic and best	5	2025-02-18	POSITIVE	0.999878049	General Feedback
7b6b3e2a-4a84-4854-acb1-ee4446e79c4b	1	It lags before showing the transaction and you have to use the one in the sms message , why doesn't it work on the app it just says loading	1	2025-02-18	NEGATIVE	0.999329686	App Speed & Performance, Bugs & Reliability, Transaction Performance
43915708-7014-4ce0-9341-3e62433c93e6	1	Very amazing application	5	2025-02-18	POSITIVE	0.999873042	General Feedback
f6927879-3f55-41ed-97d6-8151e9db57b6	1	Easy and fantastic to use	5	2025-02-18	POSITIVE	0.999881148	User Interface & Experience
04bbba46-ddef-4898-a795-2cc23b21be90	1	The way its menu arranged to use is easy to use.	5	2025-02-17	POSITIVE	0.971800923	User Interface & Experience
6ebbe8ff-2886-498f-8291-167c9a0e32ca	1	Its not bad, but there are plenty of errors .	2	2025-02-17	NEGATIVE	0.998222768	Bugs & Reliability
5c5b1f07-c05e-4328-9cd7-53248465fdce	1	Waw fantastic Aplication	5	2025-02-16	POSITIVE	0.999481261	General Feedback
ab21c795-e564-414b-aa77-30e3856a44c8	1	I am satisfied by this Ap Thank you	5	2025-02-16	POSITIVE	0.999827087	General Feedback
7c0779ca-b373-4515-8bec-f9f041af81ca	1	Best of the best application for ever	5	2025-02-16	POSITIVE	0.999823034	General Feedback
b5780993-64c6-4635-a240-2139f9f08a33	1	This app is better	5	2025-02-15	POSITIVE	0.913149953	General Feedback
925e2ee2-7de6-4763-ad2c-da57a1fd44b5	1	Not worek recipient !!	1	2025-01-29	NEGATIVE	0.695060194	General Feedback
a987dece-61d1-45de-bc4d-b2dee0a505e2	1	it's not working properly	1	2025-01-24	NEGATIVE	0.999779284	Bugs & Reliability
819e2d48-a165-4d45-b2e0-523df4b26610	1	I liked it	5	2024-07-20	POSITIVE	0.999826491	General Feedback
c55fa126-6810-4210-9182-d97108bde183	1	It's very good in reminding the account numbers you have been used, but Need to show recipient history whenever you want to present it.or it has to have a search on options for a spesfic time you want to look for receipts with out going for account details at bank. if you lost your receipt without downloading it and need to look sometime a while you can't get in simple search on the app.	1	2025-02-15	NEGATIVE	0.995888650	Feature Requests, User Interface & Experience
ab0c8a25-dfd9-4cef-9a15-4e9bb6745521	1	It is good app	5	2025-02-15	POSITIVE	0.999865294	General Feedback
363ab94a-cdf5-461c-a44f-066b1b441035	1	It crashes a lot; it doesn't work at all sometimes. By far, it is the worst mobile banking app I have ever used.	1	2025-02-15	NEGATIVE	0.999801219	Bugs & Reliability
05061efd-53c5-491c-9596-4aa92cb658ee	1	a good apps to save my money &withdraw my money to service	5	2025-02-13	POSITIVE	0.993314207	General Feedback
2f5c6bed-6807-43ed-8a54-1c6b32f65f64	1	It's easy and good	5	2025-02-13	POSITIVE	0.999872804	User Interface & Experience
e44bcc1a-b7ef-48fb-8772-69f4d85a6563	1	It is best app	5	2025-02-13	POSITIVE	0.999731362	General Feedback
b99fafb5-3b2b-4742-89a6-18989bbed019	1	It is not functioning most of the time	3	2025-02-13	NEUTRAL	0.999746621	General Feedback
5cec3ba9-ab48-49cb-af6b-156f7f8a419f	1	It sends unwanted welcome notification every time you login. There is no way that you can disable this.	3	2025-02-13	NEUTRAL	0.994973660	Account Access Issues, Feature Requests
fd7c8e4c-e446-421a-9f7d-93703f0832dc	1	This app now not open what's problem? Please solve it	1	2025-02-13	NEGATIVE	0.998407662	Bugs & Reliability
4b681c5b-7348-4359-a314-3cacb83cf7c1	1	በቅርቡ ችግር ተፈጥሯል ፣ Developer Option ካልተዘጋ አይሰራም፣ Developer Option ከተዘጋ ደግሞ ስልካችን ፍጥነት ለመታዘዝ ይዘገያል ፣ ከዚህ አማራጭ ሌላ ብትጠቀሙ ባይ ነኝ :: Android ላይ	1	2025-02-12	NEGATIVE	0.962716401	Feature Requests
d7d71a94-c30b-4d88-9f01-863f0cd00ce2	1	Very nice i'm happy	5	2025-02-11	POSITIVE	0.999859333	General Feedback
0a1ab240-3715-4978-823d-b035231affd1	1	It used to be better in the previous. But after the recent update it keeps crashing as soon as it logs in.. it needs to be fixed.	1	2025-02-11	NEGATIVE	0.999185622	Feature Requests
bca5b5fe-03d7-4e89-9252-99e6470d4e0b	1	Can't even load our transaction history!!	1	2025-02-11	NEGATIVE	0.999442756	Transaction Performance
59be8218-24d0-42be-8305-35850afc7a3a	1	I am happy of this app	5	2025-02-11	POSITIVE	0.999865055	General Feedback
7beaedd4-3e2b-4b50-9e5f-f9ccdfadfb54	1	Great app, but try to include an access to water bill payment for places other than Adis Ababa & try top the app not to be inactive while developer option setting in Samsung phones is activated	4	2025-02-11	POSITIVE	0.707820058	Account Access Issues, Feature Requests, Transaction Performance
2d576156-0836-4d76-bbf7-23ff0b05239c	1	Very good app	5	2025-02-10	POSITIVE	0.999867558	General Feedback
9fe63693-8e5e-4c86-9d29-ff31afd057bf	1	this app is very useful but sometimes when you want to see specific transactions it didn't work so that way i gave you 3	3	2025-02-10	NEUTRAL	0.993136764	Bugs & Reliability, Transaction Performance
0fd4bbac-b83a-4469-9d89-cacd7fcf805e	1	It is stop working !	1	2025-02-10	NEGATIVE	0.999601066	General Feedback
3457fb0a-b95d-407b-9e24-da4df548d5ed	1	It's not bad 👍	2	2025-02-10	NEGATIVE	0.999767959	General Feedback
87593ee3-aee9-4417-8728-71470df245d8	1	It shut down without warning	1	2025-02-10	NEGATIVE	0.985458255	General Feedback
7bd04179-a5c3-44b7-807c-e19a6126858c	1	Best app of the bank.But,when it needs apdate,customer must be notified in my point of view.Otherwise,customers saying "Mobile banking is not working today" is bad moto.	5	2025-02-10	POSITIVE	0.998743474	Bugs & Reliability, Feature Requests
5b485192-40ab-4904-b329-bf6959d3a669	1	I use this app all the time on my business but sometimes it is difficult to use in rural areas. because there is not enough network. so what if you prepared it for the public to use offline?	3	2025-02-09	NEUTRAL	0.999372661	User Interface & Experience
4e74ea0e-2d2b-4451-bd39-a246c2e00d45	1	This app is very interesting and simple to use.	5	2025-02-09	POSITIVE	0.999654412	User Interface & Experience
372f2c5a-61f8-493e-906a-44a47462272f	1	Add customer service please other than calling 951. Why would you have a mobile app but not an online text-based customer service? Why? Disappointing And I will never use the top-up feature again, I have been trying to recharge my safaricom balance but your app would say time out and then credit my account but never recharge my balance, why? Where is my money? Do you expect me to call 951 at midnight?	2	2025-02-08	NEGATIVE	0.999203503	Customer Support, Feature Requests
0db96f48-7feb-4442-91b8-c4664fc74eb2	1	Smart and easy to use, i like this app	5	2025-02-08	POSITIVE	0.999848366	User Interface & Experience
b26f366b-e64d-4685-93b2-0d7ed7809d92	1	በፊት ጥሩነበር አሁን ምኑን ነካችሁት ተበላሽቷል አይሰራም	1	2025-02-08	NEGATIVE	0.920040667	General Feedback
2707a14e-3b2e-4d48-aa2a-d48194b588e4	1	The best app I love it	5	2025-02-08	POSITIVE	0.999871731	General Feedback
8ca2ce27-a66a-41a9-99ca-314fe4955122	1	Is not useful	3	2025-02-08	NEUTRAL	0.999798715	General Feedback
b9083532-5ae7-4dcc-a8a3-532d19af6484	1	Its good service	4	2025-02-07	POSITIVE	0.999849796	General Feedback
f58f4cbb-2513-49e5-be3e-6cb1f855749a	1	Recent transactions doesn't load properly sometimes . And also when transferring to someone sometimes it says failed and but already transferred which might cause to double transfer	1	2025-02-07	NEGATIVE	0.999156117	Transaction Performance
92a1eb3a-4db5-4cf3-8cdb-3e26574c5084	1	It used to work properly, but not anymore. I used to use the app from abroad; but these days, it kept saying "unable to connect" when I tried to check my balance and do transactions.	1	2025-02-07	NEGATIVE	0.999176085	Account Access Issues, Bugs & Reliability, Transaction Performance
b8752798-e57d-4ced-a9d7-25560007b9cd	1	Awash birr pro	1	2025-02-07	NEGATIVE	0.996338248	General Feedback
5b22ac5c-f607-4b9d-a5fc-9084cd1fafc7	1	It is a very important application.	5	2025-02-07	POSITIVE	0.999725878	General Feedback
508b5082-0273-4428-b34f-4e1d94d6cf24	1	It crashes frequently	2	2025-02-07	NEGATIVE	0.999325633	Bugs & Reliability
d41b6464-9c04-48c8-9345-2a8fc139c6c6	1	አፕሊኬሽኑ ብዙ ግዜ ወደኋላ ይመልሳል	3	2025-02-07	NEUTRAL	0.883213103	General Feedback
2d6928f3-f1c4-4ae2-93b1-3674f29e6664	1	To save my time best app to me i like this app tnx cbe !!!	5	2025-02-07	POSITIVE	0.987518132	General Feedback
250188b6-f133-4a32-93c2-18ea38d3aa4f	1	Cbe is the leader bank in Ethiopia by digital payment system	5	2025-01-24	POSITIVE	0.995962322	Transaction Performance
f68dfec8-de69-4cb1-8aa6-b3ca85530e10	1	It is a shame not to appreciate the recent system improvements that the Commercial Bank of Ethiopia has been making, and I have no doubt that it will be different from this, InshaAllah. Another thing I would like to comment on is that the current method for transferring money to Telebir can own be sent to the person. So, it is possible to send money directly from the Commercial Bank to other banks. If you make it possible to transfer money directly to anyone, I would be very grateful.thank you	5	2025-02-06	POSITIVE	0.978348434	Transaction Performance
465ab783-c634-4610-9444-54bf89069e55	1	App keeps on crashing after the latest update. Failures are frequent.	3	2025-02-05	NEUTRAL	0.999378324	Feature Requests
1d1c4fce-9742-4049-9099-3a71117043a0	1	I don't need to update this app	5	2025-02-05	POSITIVE	0.877161086	Feature Requests
4b23017e-96ae-4ce1-81ca-cfd9c8ee0ff7	1	Good work !! Thank you !	5	2025-02-05	POSITIVE	0.999863505	Bugs & Reliability
383e78d1-2bf5-4c7f-86df-aa70f1979b5a	1	Application Baay'ee Gaariidha . Hojii Keenya Salphisuu fi Yeroo Nuuf Qusachuu Keeysatti .... Waan Jajjabeeyfamuu Qabuudha !!!	5	2025-02-05	POSITIVE	0.989982307	General Feedback
61be2e8e-e425-430a-97ab-2c6683e84c65	1	After the new update I'm struggling to use this app,it suddenly crush or close automatically pls fix this problem	1	2025-02-05	NEGATIVE	0.999667168	Bugs & Reliability, Feature Requests
570f3d43-08bc-4cac-b79c-546d56a81db6	1	Very fast and easy to use	5	2025-02-05	POSITIVE	0.999538302	Transaction Performance, User Interface & Experience
b3dc7d08-47fc-4aed-9a52-054b6a02476c	1	It is best application	5	2025-02-04	POSITIVE	0.999606192	General Feedback
45187c54-acd9-4df7-92ca-0cfe39801913	1	This apps amazing	5	2025-02-04	POSITIVE	0.999875188	General Feedback
50adf1c2-94a2-4bc9-a3fc-44052c9be7a1	1	Very good app	5	2025-02-04	POSITIVE	0.999867558	General Feedback
6a8aba7d-890d-44b7-900d-66c0a08d6504	1	This App. Is just a Meaningful Application for our country..	5	2025-02-04	POSITIVE	0.999041855	General Feedback
517a66cd-a7ee-4e97-a052-7e2661eccfa0	1	This App Is Best and Fantastic Because easy to use, It has Best security Specially Two Specific Authentication so this security is not path unauthorized person to Our account History. Thankyou CBE For We give this service	5	2025-02-04	POSITIVE	0.999584138	Security Concerns, User Interface & Experience
d0dd6d8a-73d7-446f-86a3-3229adedfc90	1	The app is crashing several times it's really annoying and sometimes it's says failed during different operations ?????? Please fix it!?	1	2025-02-04	NEGATIVE	0.999722183	Bugs & Reliability, Transaction Performance
5bfce72e-2a03-4a7d-8698-346d28757c7f	1	ሰሞኑን እያሰቸገረ ነው እንጂ ቀላል እና ፈጣን	3	2025-02-04	NEUTRAL	0.920040667	General Feedback
d7eb8b8b-78b3-43ee-8266-5e11ae53d889	1	New update new version not working	1	2025-02-03	NEGATIVE	0.999659538	Bugs & Reliability, Feature Requests
4a10d13c-13e4-4fd1-9a21-35e03d17e682	1	that is good	5	2025-02-03	POSITIVE	0.999836445	General Feedback
450ce12c-bed9-4b5d-8339-ead9eb35562e	1	I have seen lots of great updates right here, especially the 2FA using the biometric security technique, I suggest you work on minimising app crashing due to the accumulation of cache, very little cache crash it.	4	2025-02-03	POSITIVE	0.725206792	Bugs & Reliability, Feature Requests, Security Concerns
9453fad4-1a06-49cd-aee5-9a9617aeedc5	1	The Best mobile banking app in Ethiopia. Thanks CBE	5	2025-02-03	POSITIVE	0.999808729	General Feedback
ff702b3e-6144-4d31-80b3-681c1cc35b09	1	Too poor comparing to other countries.	1	2025-02-03	NEGATIVE	0.999605954	General Feedback
9130aa11-a865-4b7a-bd60-68233b231996	1	it is not working	5	2025-02-02	POSITIVE	0.999772131	Bugs & Reliability
98e5150a-6896-4269-8d10-4b5bb70277dd	1	It is good	5	2025-02-02	POSITIVE	0.999849439	General Feedback
6ed9ec61-2681-458f-a55b-3aeaace967ef	1	I updated to the new version a while ago and it keeps crashing, maybe you can fix it.	3	2025-02-02	NEUTRAL	0.993289769	Bugs & Reliability, Feature Requests
8054ae23-1ce5-48b1-ab3a-0a2738618323	1	Simple good app	4	2025-02-02	POSITIVE	0.999864340	User Interface & Experience
a56cbcfb-a914-47f1-96bb-6c5bdc6c842f	1	After the last two update, I am facing the worst experience with this app.	1	2025-02-02	NEGATIVE	0.999782383	Feature Requests
0c1a5ab9-05f3-4985-a977-c6cb25941f11	1	Now it's crashing like crazy. It doesn't even open after a recent update.	1	2025-02-01	NEGATIVE	0.999583423	Feature Requests
af35ddee-86f1-4f7c-a7e1-716db040d01e	1	This app is so incredible	5	2025-02-01	POSITIVE	0.999872684	General Feedback
8861aa71-7fea-4f4b-b7b5-fcac8b2fa47a	1	Mobail banking is the letest tecnologi	5	2025-02-01	POSITIVE	0.994038343	General Feedback
e7a61ab6-7b4c-4a1b-b1c0-9101de53045a	1	Easy to use	5	2025-02-01	POSITIVE	0.998854280	User Interface & Experience
bea26a19-61a3-47a7-bdbe-693b66c97489	1	without any reason it shows white screen and can't make transfers. Then when I went to branch then they reply go to the branch where you open your account.	1	2025-02-01	NEGATIVE	0.996890604	Transaction Performance
3a927026-f73f-47b2-a0f3-d81e491db58c	1	It used to be the best bank app in Ethiopia. But now using it is a terrible experience. For every transaction it shows an error message. Making a simple payment requires 5 to 6 trials to complete.	1	2025-01-31	NEGATIVE	0.997072339	Bugs & Reliability, Transaction Performance, User Interface & Experience
afc034b9-09a9-4faa-a5c0-ec828f9ec3e9	1	it does not connect	1	2025-01-31	NEGATIVE	0.999790490	General Feedback
28e57e74-1644-4c38-9eb5-468761ccd5df	1	The worst I had to flight back to fix my app it need you to go back every 4 month not reliable for foreigners	1	2025-01-31	NEGATIVE	0.999755204	Bugs & Reliability
4dfc2ba0-14dd-4cbf-a3f7-641e8e3feb25	1	This should run for worst app of the year	1	2025-01-31	NEGATIVE	0.999799311	General Feedback
11b639f5-5322-42cf-846b-874180db2376	1	It is nice app!	4	2025-01-31	POSITIVE	0.999844790	General Feedback
32a7fdf9-34c0-426f-a831-1e73d082d4a3	1	Very nice app	5	2025-01-31	POSITIVE	0.999856234	General Feedback
dbc1d960-e33c-4267-abdd-08fb7bc07f9f	1	It's easy to use, but there is some problems sometimes when update the app in the network areas...	4	2025-01-31	POSITIVE	0.995782733	Bugs & Reliability, Feature Requests, User Interface & Experience
1745045d-944d-40aa-b9bc-6dff21b161c4	1	No manage beneficiary for my app	1	2025-01-30	NEGATIVE	0.999631405	General Feedback
41fe66fb-7ddd-43e9-b3d7-a6961a8cd946	1	Its good but we need an option of choosing a specific period to get a historique of transactions. For example when i want to check my previous transactions i only get few transactions. Thank you.	2	2025-01-30	NEGATIVE	0.852045894	Feature Requests, Transaction Performance
2951a615-d507-425f-a840-32e5f70d2c62	1	Very good mobile app	5	2025-01-30	POSITIVE	0.999862909	General Feedback
8fbd641c-bf53-4a50-bf06-ecebeac3b6fe	1	I’ve been using the CBE mobile banking app, and overall, I appreciate its features. However, I’ve noticed that when I turn on the developer options on my device, the app stops functioning properly. It would be great if you could look into this issue, as I often need to access developer settings for other applications. Thank you for your attention to this matter!	1	2025-01-29	NEGATIVE	0.988647401	Account Access Issues, Bugs & Reliability, Feature Requests, User Interface & Experience
bc834a6a-65b6-4174-b852-414f67112753	1	I like the app	5	2025-01-29	POSITIVE	0.999439895	General Feedback
af63b54d-cd73-4ffb-b7a7-b4bb896ed970	1	If you are living outside of Ethiopia you better not deposit large money into your mobile account. It can kick you off any time for some small reasons and the only way you can recover is either to go to the bank in person or you need to have access to your phone which is impossible if you are living outside Ethiopia. The only option you will be left with is, you can't use your money. At least it would be better if you can recover your account using email or other verification ...	1	2025-01-29	NEGATIVE	0.999418139	Account Access Issues, Feature Requests
7bc47f11-e193-4ef0-8a4b-edc773200baa	1	Updating the app is must everytime they release it even to reload the transaction.	2	2025-01-29	NEGATIVE	0.995369256	Transaction Performance
e3187f72-45b7-40d4-811d-ad24f0cd02d1	1	These app is beast But the new update is great	5	2025-01-29	POSITIVE	0.999266088	Feature Requests
83806bdd-4051-4eef-b209-54d96a1abcc9	1	It's easy and user friendly!	5	2025-01-29	POSITIVE	0.998850107	User Interface & Experience
053494cb-1c64-44ca-96e0-ed65c88a92b5	1	I love it	4	2025-01-29	POSITIVE	0.999879956	General Feedback
9ba23d45-2315-4e21-a45a-55f5586ade4c	1	It is helpful to save time and energy	5	2025-01-28	POSITIVE	0.998818099	Customer Support
e9f3ae7b-ae12-46ea-9313-c8ca8c98ca7a	1	DIGITAL LEADER BANK IN ETHIOPIA CBE	5	2025-01-28	POSITIVE	0.973424911	General Feedback
b1cbe052-977b-44d2-8170-5e1250e9ae17	1	Turning off the developers' options :( This is getting out of hand. We don't need to go through that...	1	2025-01-28	NEGATIVE	0.995292306	Feature Requests
71acf825-78d8-4b84-b56d-96a614705eff	1	I don't have an idea why our country soft wares needs some beroucracy?? How many peoples knew that about developer options N why is the new app forceing to disable that?? in my side i didn't get the apps as of b4.	1	2025-01-28	NEGATIVE	0.999245644	Feature Requests
9274ffc0-38f1-4458-bd1f-8acfb71e298d	1	BEST APP EVER,BUT WHEN CBE BE INTEGRATED WITH INTERNATIONAL TRANSFER	5	2025-01-28	POSITIVE	0.998670101	Transaction Performance
e5520d55-b5bb-452b-b9aa-d18ae578cb78	1	Where ever you go no one is like cbe mobile banking.it's absolutely perfect	5	2025-01-28	POSITIVE	0.999834538	General Feedback
b7d364cd-7421-45f7-aea9-f482c7da1b0a	1	Does"nt give you a list of beneficieries.	2	2025-01-27	NEGATIVE	0.996082127	General Feedback
ec1e30eb-30b8-4a67-b2b2-7c06ef6053da	1	trasaction history needs to be more,	2	2025-01-27	NEGATIVE	0.996639371	Feature Requests
e3be726b-1178-4257-a59c-303a9b8c69d1	1	This app is more helpful and best	5	2025-01-27	POSITIVE	0.998884618	Customer Support
fb578c32-e621-43c0-bd23-3ecbceecc834	1	I like it more the app cbe thank you !	5	2025-01-27	POSITIVE	0.999739230	General Feedback
9b911e0b-c278-45de-bdab-260003fef35b	1	I like it	4	2025-01-27	POSITIVE	0.999859333	General Feedback
ab018fca-5d9f-4f0a-85c5-faafa23cb362	1	Alert The device developer Mode is turned on. Please turn off Developer Mode from device settings and try again to use this app OK What is this ?	1	2025-01-27	NEGATIVE	0.996811569	General Feedback
02e9bd71-8d14-44dd-bf6d-5d18df428160	1	Correct your order of incoming and outgoing birr	3	2025-01-27	NEUTRAL	0.890808284	General Feedback
dc3ded2e-c5b6-4241-a149-30ee55d49add	1	The apk doesn't work when the phones developer option is turned on. It always asks me to turn off the developer options to open the apk. Please fix it as it is unnecessary.	4	2025-01-26	POSITIVE	0.999358833	Bugs & Reliability, Feature Requests
f7bf567e-c8a9-4409-9c99-bb92521e0a9c	1	Wow amazing app	4	2025-01-26	POSITIVE	0.999851346	General Feedback
d4f5d09d-af50-4123-9f32-56bb8c7f528b	1	Why on earth is CBE telling me to turn off developer mode? As the name clearly states, it's for developers, not for CBE to dictate. There are countless financial apps out there that work just fine without demanding such an unnecessary restriction. If your app can’t handle developer mode, that’s a you problem. Fix your code instead of disabling features that have absolutely nothing to do with you.	2	2025-01-25	NEGATIVE	0.987571120	Bugs & Reliability, Feature Requests
891b28c9-d503-4b90-9b24-4681c571285e	1	It keeps asking for an update recursively since the last update. What is going on??	2	2025-01-25	NEGATIVE	0.998496413	Feature Requests
05c8fd51-5e69-4b91-a753-617628737a2a	1	I donot want to update.	5	2025-01-25	POSITIVE	0.620053828	Feature Requests
d7c2a09c-2daa-4da2-88a2-139a0fa01864	1	The qr code scans must be backed to see the transfer is done and to use it easily	2	2025-01-25	NEGATIVE	0.989365220	Transaction Performance
8505c39e-19c3-474c-9de9-5533ad7c863d	1	አፕልኬሽኑ የተላከልኝን ብር ቶሎ አያሳይም ። ከ 24 ሰዓት በላይ ይቆያል። ይህ ለቢዝነስ በጣም አስቸጋሪ ሆኖብኛል። መፍትሔ አላችሁ ? This application is too slow & inactive to notify & record transactions, & hence I faced difficulty using it for businesses. would you fix it?	1	2025-01-25	NEGATIVE	0.999669433	App Speed & Performance, Bugs & Reliability, Transaction Performance
bcd74e8b-adc5-4fec-a735-fcb5a92ba9a8	1	Nice app thanks cbe	5	2025-01-25	POSITIVE	0.999825299	General Feedback
3d338bcc-ed29-498c-b545-03329b2eaa6b	1	I like it	5	2025-01-25	POSITIVE	0.999859333	General Feedback
f11972b3-7548-4568-8187-2f6e6c0aa9c4	1	It is very nice to use	5	2025-01-25	POSITIVE	0.999810755	General Feedback
61c64219-c4de-4bbd-80a0-fe07f67651c7	1	the "developer mode" need to be fixed, it sucks	2	2025-01-25	NEGATIVE	0.999621034	General Feedback
a45f3a97-9fcb-4518-ad56-872c13276a8e	1	The app is simply trash, the only thing that's keeping them afloat is that the woods for the other Ethiopian banks is even trashier	1	2025-01-25	NEGATIVE	0.999790609	General Feedback
43d21b46-5e4c-48d1-b80b-da772c1a56c5	1	It very important app	5	2025-01-25	POSITIVE	0.999713838	General Feedback
032b6f34-3e55-4c2d-9738-174a4159c28b	1	This app after update they ask verification .why they restricted for update?	5	2025-01-24	POSITIVE	0.992791414	Account Access Issues, Feature Requests
d07b84af-f1c5-48f6-87f0-ef6eb1892e64	1	Best and ease to use	5	2025-01-24	POSITIVE	0.999796569	General Feedback
897c616a-8c8b-4e70-a55b-ebf9ef9156f0	1	thank you very much and we are very very happy with your service🥰	5	2025-01-24	POSITIVE	0.999858141	General Feedback
e2e74a4e-3297-490f-8827-73450a291c77	1	Make an option to send statement by email	1	2025-01-24	NEGATIVE	0.949392378	Feature Requests, Transaction Performance
3b2847fd-89c6-410b-8a98-8289abd637fc	1	It is simple and very accurate system	1	2025-01-24	NEGATIVE	0.999847412	User Interface & Experience
c41d38ef-aca3-48c2-9dad-47de206b0b5f	1	I am happy for using CBE. How ever, i am happy we can not send money to other tele birr by this app. why???	5	2025-01-24	POSITIVE	0.993509948	Transaction Performance
67f8ae7f-ebb3-4297-9673-8555750732c2	1	Why developer option is off ? Please remove this feature.	4	2025-01-24	POSITIVE	0.999210954	Feature Requests
b5a70ad7-acd2-439d-90c4-d5f0d8b00a53	1	Reminding me to update and pay every month	5	2025-01-23	POSITIVE	0.934161842	Feature Requests
019ae460-a702-49f0-93f4-b30394466e10	1	its excellent app	5	2025-01-23	POSITIVE	0.999842167	General Feedback
53135b4c-9329-446f-9dc7-5802857a3276	1	After a recent update, this app stopped working with a message " the developer turned off advanced ... etc.	3	2025-01-23	NEUTRAL	0.999394894	Feature Requests
01a5105d-0e69-4a38-a1d9-687f5e1cc15b	1	እብድ ባነክ፣ ይሄ ዝምብሎ Update ብቻ የሚለውን እና Update የማያደርገውን ሲስተማችሁን አስተካክሉት። አናዳጆች!	1	2025-01-23	NEGATIVE	0.870898008	Feature Requests
7b844f4c-f475-4cf1-9a9f-a1112069e081	1	I am students of accounting and finance when i graduate i wish to do in CBE thanks	5	2025-01-23	POSITIVE	0.998768151	Feature Requests
0a301613-8eae-40db-8bee-7ff908cecff5	1	wow . what i can say thank you.	5	2025-01-23	POSITIVE	0.999868035	General Feedback
79ad3d28-7c26-42dd-80ae-8ebe18aedb84	1	very inconvenience to use. unreliable and needs upgrades!!!	1	2025-01-23	NEGATIVE	0.999612510	Feature Requests
ba4d07e6-fa92-4580-8729-49ac6e04eb14	1	Good I like it .	5	2025-01-22	POSITIVE	0.999854803	General Feedback
63c555b7-8085-4800-ab5c-a2ec9e78aa40	1	The worst bank in Ethiopia!	1	2025-01-22	NEGATIVE	0.999776423	General Feedback
22043d5a-6216-4ff1-a7e7-9477ab53fc07	1	Annoying app Very poor	1	2025-01-22	NEGATIVE	0.999780953	General Feedback
4b5ef801-2cbb-4284-990b-de2842b6fbd0	1	I have been accessing my CBE from abroad very easily without problems .Good job, guy.	2	2025-01-22	NEGATIVE	0.998929322	Bugs & Reliability
f737b140-2f6c-46ea-a315-de4c6a38fcd0	1	Why force-disable Developer Options in the latest update? I get that it's a security precaution, but it's overkill. Plenty of other financial apps do not require it and it's sometimes necessary for debugging/experimental reasons	1	2025-01-21	NEGATIVE	0.998829424	Feature Requests, Security Concerns
3b344d18-c5ce-464e-8f21-5a7669318023	1	በጣም ምርጥ እና ላጠቃቀም ቀላል አፕ ነው ደስ ብሎኛል	4	2025-01-20	POSITIVE	0.932232678	General Feedback
50586362-4d76-4096-8d5e-0ac6d3da1c19	1	The app resets without customer interaction or confirmation, which is concerning. Please improve the user experience to ensure better control and transparency for customers.	5	2025-01-20	POSITIVE	0.988817811	General Feedback
2b11be33-976b-4d4d-aa29-c8451816dad1	1	It was very convenient and cool to use, but for some reason it hasn't been working for me lately.	1	2025-01-20	NEGATIVE	0.911289454	General Feedback
6f6598fc-e9d6-4581-af09-8828fff195f5	1	Breaks after a week	1	2025-01-19	NEGATIVE	0.953212559	General Feedback
9aefdf2a-5477-4d05-9b01-e1ef87cc0636	1	Good work keep it uo.	5	2025-01-19	POSITIVE	0.999825895	Bugs & Reliability
ee437536-bdb0-4402-9709-9fee8f2ac632	1	Jest i like this app esy and fast	4	2025-01-19	POSITIVE	0.997852802	Transaction Performance
bd57e368-5a8a-4075-b660-892eea17e51c	1	Reliable & Simplified Service🎉💜🙏🙏	5	2025-01-18	POSITIVE	0.995893121	Bugs & Reliability
fc48ba4b-864b-4c2d-9b46-0d44229078f2	1	This application is an unreliable application. Please do not use it. Hackers will enter through the application and take the certificate from CBE.	1	2025-01-18	NEGATIVE	0.999354780	General Feedback
3b3a3a86-d459-4c30-9210-0351e79b7948	1	Please make it active it is delaying in low connection thanks.	5	2025-01-18	POSITIVE	0.837719321	General Feedback
67cce88c-2152-4403-a2a5-6217c5491d56	1	Best app for adroid user	5	2025-01-18	POSITIVE	0.995593011	General Feedback
a5235a26-e24a-4a89-8bac-781a53c486df	1	Excellent condition security code used	5	2025-01-18	POSITIVE	0.999072194	Security Concerns
7e6d9a3a-a905-40c0-b033-8b37713166a0	1	Yeah its very important in our daily life	5	2025-01-17	POSITIVE	0.999648094	General Feedback
f423cc55-c473-4ef3-a222-50582b9732ba	1	The new update is seems force enable developer options on setting. And please fix the problem on iphones it only works for few days every time it get maintained at branches	1	2025-01-17	NEGATIVE	0.780774593	Bugs & Reliability, Feature Requests
a01eaaa4-aeb0-433b-8d24-29a2b0664a8d	1	Kedir nuri jemal	5	2025-01-16	POSITIVE	0.944541991	General Feedback
e3dd449e-a029-489b-b638-671cf5941c96	1	The great app and banking system 🤩	5	2025-01-16	POSITIVE	0.999558151	General Feedback
1d0bc549-8483-4bac-9bb2-ab6b7270e93a	1	Money transfer options is not giving correct input, and there is no way of knowing whether the money was successfully transferred.	2	2025-01-16	NEGATIVE	0.999773562	Feature Requests, Transaction Performance
66d8bef0-d703-4c2c-b31a-b89cca24c7d7	1	i enabled two step verification..when i press Authenticate it says Authentication failed.	5	2025-01-15	POSITIVE	0.999661207	Account Access Issues, Transaction Performance
d32c4f80-7bce-498a-a8a5-8bfa0c7c999c	1	Very much helpful	5	2025-01-15	POSITIVE	0.999814928	Customer Support
5ef6a05b-79c7-4463-a6a6-7378324dc432	1	Please add mini statement	2	2025-01-15	NEGATIVE	0.967776000	Feature Requests
36ebe71d-4b89-4c37-a9b4-4a2f8ca98cc7	1	It simplify every step.	5	2025-01-15	POSITIVE	0.997772872	General Feedback
a758e3db-da2a-45d0-b5dd-42aa410ae057	1	It's good app	5	2025-01-15	POSITIVE	0.999868989	General Feedback
3289daee-86fb-4cf6-a5d6-8447e89251b7	1	Keep up guys you're always trustful service giver. I appereciated so much.	5	2025-01-14	POSITIVE	0.999688745	General Feedback
a27d5fd7-7ae2-4161-a5de-a78bc8c9ae19	1	Very best app	5	2025-01-14	POSITIVE	0.999817789	General Feedback
3f0b172a-ca59-4f31-84a4-26194bfd7467	1	ከድር ሁሴን አብደላ	5	2025-01-13	POSITIVE	0.833725393	General Feedback
dc9659e4-344d-4aa7-8d9f-84b01fa327fd	1	This app is the worst the current release doesn't work when developers mode is on and the transaction errors make you transfer money twice with errors	1	2025-01-13	NEGATIVE	0.999697328	Bugs & Reliability, Transaction Performance
23889ebf-d1e2-47c0-9faf-b585f6643c6b	1	Baayyee gaariidha Garuu App keessan altokko tokko isa ati tokko ergitu irra deebi'ee ergaa isa nu sirreessaa	4	2025-01-12	POSITIVE	0.991395295	General Feedback
683fb7b2-479d-4939-bc48-ff3fe9c6a6cc	1	It is Nice, but some times details of credited amount not shown from whom sent.	4	2025-01-12	POSITIVE	0.932277858	General Feedback
1fd24c69-b752-4039-b0a1-b1d6390a0813	1	I am facing difficulties related to network issues, while I have a good internet connection.	1	2025-01-11	NEGATIVE	0.972421408	Bugs & Reliability
2ccd2dcc-b2f7-4e68-ad28-025e1958c691	1	Simple and easy to use	5	2025-01-11	POSITIVE	0.999731839	User Interface & Experience
6564b1db-c8bc-49fc-a0c7-fa7869c36053	1	How to make developer mode off	5	2025-01-11	POSITIVE	0.998837650	General Feedback
36089a28-25eb-4d25-9356-2b72eeed396e	1	Alert The device developer Mode is turned on. You can't use this app, Please turn off Developer Mode and try again. OK Why reason?	1	2025-01-11	NEGATIVE	0.997497499	General Feedback
794975bb-3542-45b3-b897-062e63a034d5	1	I am leul	5	2025-01-10	POSITIVE	0.733094156	General Feedback
3dff55bc-ef70-4ac4-92e6-ae58c59ef2ef	1	አሪፍና ምቹ ተመችቶኛል ለኔ	5	2025-01-10	POSITIVE	0.861633003	General Feedback
76d77b3c-6014-4fd2-bf34-fda73b89e58e	1	የራሱ የሆነ ኪቦርድ ቢኖረው _ እና ትራንዛክሽን ሂስትሪው ቢስተካከል እና ገቢ እና ወጪ ላይ ቀኑን አስከነ ሰአቱ በስነ ስርአቱ ቢያስቀምጥ አሪፍ ይመስለኛል	3	2025-01-10	NEUTRAL	0.966805518	General Feedback
c355400a-782e-41ea-a9d2-1ccd3314cec6	1	aqf WWE the ga	2	2025-01-09	NEGATIVE	0.755267382	General Feedback
af508583-cc81-4a47-8b2b-31aa7f82505c	1	Good cbe app but it frequently need update , after you update you will go to the Bank officer for verification . But my question is why not verify own self .	2	2025-01-09	NEGATIVE	0.968505621	Account Access Issues, Feature Requests
7cf04049-9c12-43a9-b6e2-cf5e3559e96e	1	Best and easy to use	5	2025-01-09	POSITIVE	0.999779165	User Interface & Experience
5ccbd3c4-b837-4ec5-b57c-8ab86f3cf3ac	1	First this app was pretty good and well connection while transferring money, but now there's no such a worst mob app ever while transferring money it corrupts due to the network and took the amount of money you were transferring from your account then after seconds interruptions it's shows that the money is transferred (this case happens especially to telebirrr wallet) then after you report the issue to the CBE customer service they refund your money to your CBE account after 3-5 days.	2	2025-01-09	NEGATIVE	0.997286320	Bugs & Reliability, Customer Support
4dc8d1dd-5a21-4f32-952d-e7e79e1babd4	1	It nice but some connection limitation	3	2025-01-08	NEUTRAL	0.840727389	General Feedback
9c21e91a-b755-462f-9ec8-fe0d0776b019	1	It's bestv forever!!	4	2025-01-08	POSITIVE	0.999858618	General Feedback
00f17467-b42e-445e-9097-25e1737a5b44	1	It is good app but not have statment 1 week 1 month only 2 days and it is not order by time	5	2025-01-08	POSITIVE	0.972741187	General Feedback
e98773b0-df50-4e6f-a338-157fd1456eef	1	this app is very good	5	2025-01-08	POSITIVE	0.999862313	General Feedback
2af72650-8b2c-4561-823a-3a22371a089c	1	It fast and satisfied	5	2025-01-08	POSITIVE	0.999780476	Transaction Performance
c963a0c5-6ca9-46ab-a6c8-3123c71790e7	1	Best app for the bank	5	2025-01-08	POSITIVE	0.999404550	General Feedback
6be261d5-1b55-42bb-ad21-7b4450cfce5c	1	Good challenge good.	5	2025-01-08	POSITIVE	0.999848008	General Feedback
f2a9f4a6-929f-42bd-9860-230d77863412	1	It is good	4	2025-01-07	POSITIVE	0.999849439	General Feedback
66a651f7-4641-4e53-a167-9de60490d306	1	Best app I was but the message updated and it refused to work for me	5	2025-01-07	POSITIVE	0.999494076	Bugs & Reliability
d660101f-b2b2-4e1e-b983-16f31047ec6a	1	Very nice app	5	2025-01-07	POSITIVE	0.999856234	General Feedback
fbb2aea4-69b0-4cd6-818f-482900f00854	1	It is good	5	2025-01-07	POSITIVE	0.999849439	General Feedback
4bc03794-d0da-4f2e-9fc0-f461b2a56482	1	Why do i have to close the developer option to use it. After the update it's not even working unless I close the developer option	1	2025-01-07	NEGATIVE	0.999772131	Feature Requests
f4caef66-e65f-418a-8b9c-9b4abf3ee6cf	1	Atractive and easy to use	5	2025-01-07	POSITIVE	0.976210833	User Interface & Experience
e148507c-9bda-4b6e-8cbe-e6e3f9c7f784	1	You can not track your transaction history with correct date, time and order	1	2025-01-07	NEGATIVE	0.998526335	Transaction Performance
bbce62bd-53cf-4b47-a881-ae046b166f99	1	Keep saying "unable to connect" after a normal phone update. Please update the app to match latest phone "updates"	1	2025-01-07	NEGATIVE	0.998902798	Account Access Issues, Feature Requests
23c822a9-1ada-473b-88a2-a681026f8d56	1	Sufiyan ahmade umara	5	2025-01-07	POSITIVE	0.796581745	General Feedback
6543220e-db98-4bae-a9ff-1da434d62c9f	1	It's simple and easy to use	1	2025-01-06	NEGATIVE	0.999755561	User Interface & Experience
37e4c957-c42e-402e-b694-fe7b6a00e9cf	1	I like this app	5	2025-01-06	POSITIVE	0.999651670	General Feedback
ab89242c-8903-423b-98c9-1396073ffb7c	1	good app I like it	4	2025-01-06	POSITIVE	0.999867797	General Feedback
11a69d93-c7af-4563-9e3d-8e8310947881	1	i,ts not working, not good	1	2025-01-06	NEGATIVE	0.999791682	Bugs & Reliability
dbabc753-6e70-4c1e-8d6d-0be35348b973	1	Thank you free 2 years	4	2025-01-06	POSITIVE	0.999668360	General Feedback
6030f40b-1c2f-4d3e-97e4-848f50a683ec	1	Please Add A dark theme😭😭	1	2025-01-06	NEGATIVE	0.995804846	Feature Requests
9f3023a8-b8f0-4186-9762-110a68ff948c	1	I don't understand the reason why this app asks me to turn off my developer options whenever I try to log into the app 🙄 This issue immediately needs to be fixed. Why would I sacrifice my phone's performance to use only this app? It's ridiculous 😒	2	2025-01-06	NEGATIVE	0.999762475	App Speed & Performance, Bugs & Reliability, Feature Requests
2be0bf63-b5e5-4699-836d-4750189ee9ef	1	Teaching 12 years	5	2025-01-06	POSITIVE	0.987835586	General Feedback
4022d58a-0ea3-464d-8264-999d45974d10	1	I have been using it for a years and it is beautiful in i the time have been using it	1	2025-01-06	NEGATIVE	0.999762595	General Feedback
cc3ff3aa-aaae-473e-8a47-c148dc5ba3f2	1	Flexible & easy service	4	2025-01-05	POSITIVE	0.999736607	User Interface & Experience
48493c64-d590-4a08-a8ab-aa23656eab0f	1	Not functional when i need a transactions	1	2025-01-05	NEGATIVE	0.999677896	Transaction Performance
188300b3-0dce-4b4c-9726-4728c7289229	1	The banks logo, the hidden accounts data are not seen. It is saying it saying unconnected and hence does not sync.	2	2025-01-05	NEGATIVE	0.999617338	General Feedback
eb3ebaea-104a-4f3c-84a6-f97b06d8acde	1	𝕓𝕖𝕥𝕒𝕞 𝕒𝕣𝕚𝕗𝕖 𝕟𝕖𝕨	4	2025-01-05	POSITIVE	0.833725393	General Feedback
3e9ab011-1feb-4217-a6e2-14826f3643ab	1	Is not working for last update	1	2025-01-05	NEGATIVE	0.998909116	Bugs & Reliability, Feature Requests
4cadf0a6-b517-4f26-9289-d6371580390f	1	Why is it asking me for developer option	1	2025-01-05	NEGATIVE	0.997990370	Feature Requests
9705c519-6ff9-4ddb-befd-8df8213a081f	1	We need more update soon! once I updated it, it authomatically stop working😭	1	2025-01-05	NEGATIVE	0.999793112	Feature Requests
658fc2ea-1348-4070-aedd-4a75a93287fa	1	Very slagish to operate, needs upgraded.	2	2025-01-05	NEGATIVE	0.998323500	Feature Requests
1ff2fcd8-ea82-4ae1-b584-6021bc428acd	1	Eas for use	5	2025-01-04	POSITIVE	0.687873006	General Feedback
80ede30a-861a-4313-b3d5-1ec43973e7e6	1	It is good	4	2025-01-04	POSITIVE	0.999849439	General Feedback
40004ee4-5c95-4af5-b957-f2d9bf0dc617	1	It nice apps	2	2025-01-04	NEGATIVE	0.999864697	General Feedback
b313ec79-8bdd-4a58-a4d0-2423fdd8f0bd	1	It gives service great	5	2025-01-04	POSITIVE	0.999842882	General Feedback
8b2022ad-a69b-4e38-abca-3dd6953dba6b	1	በጣም አሪፍ መገልጊያ ነው 👍	5	2025-01-04	POSITIVE	0.861633003	General Feedback
4ffdf641-b931-4c0d-a1e3-24d15bf9be18	1	Why did this application stopped working at the moment	1	2025-01-04	NEGATIVE	0.999742448	General Feedback
aaf40634-d81f-4553-9c8b-71b6ea121d5d	1	The worst update seen in the bank industry for mobile banking. If you're unable to make it smooth and reliable at the same time , return it to previous version. It shows that you don't have the best expertise like other banks in the country.	1	2025-01-04	NEGATIVE	0.999743402	Account Access Issues, Bugs & Reliability, Feature Requests
7a6263d4-f6eb-4062-aa00-4f766ec8a80b	1	It's a very good fast service provider but at the moment the system is denying me	5	2025-01-04	POSITIVE	0.994601488	Transaction Performance
715a6b70-2322-4677-8116-50df8147adb8	1	Wuu fican lkn wali cilad ba haysata sodee ku xaliya wuxu I lahay the developer mode is turned muxu ka wada	5	2025-01-04	POSITIVE	0.998598993	General Feedback
f68e421c-9dd6-4ba3-9ee5-b70155f85316	1	It is fine	5	2025-01-04	POSITIVE	0.999864578	General Feedback
efaad365-3668-4f68-bafb-5f63af178113	1	It's good nice job	5	2025-01-03	POSITIVE	0.999859929	General Feedback
d5717cd9-1fa1-439a-8c9f-fb3e30b39177	1	Very good app forever	5	2025-01-03	POSITIVE	0.999876499	General Feedback
00bc7a96-4ece-4bfc-9f0f-a1702ffbdc41	1	Thank u for the easy operating service .It made life simple and accurate.Keep it up!!!	4	2025-01-03	POSITIVE	0.999824941	User Interface & Experience
7d96d357-c0ba-4243-ad28-1014813ebd6b	1	This App The Best One	5	2025-01-03	POSITIVE	0.999837995	General Feedback
081a1121-66a1-4711-97b7-ae79e235e941	1	It's not working	1	2025-01-03	NEGATIVE	0.999785721	Bugs & Reliability
7363290a-7a2c-4987-9e28-fafa62bc87d5	1	How i can divice developer mood off	5	2025-01-03	POSITIVE	0.996946275	General Feedback
a2d81115-bc95-426e-af67-83115f1dcbff	1	Sand me naw	2	2025-01-03	NEGATIVE	0.997702658	General Feedback
03563efc-3ef2-4845-857d-fcd58fcb3d19	1	Wat is problem	5	2025-01-03	POSITIVE	0.998581886	Bugs & Reliability
c91078cd-9bb8-4161-a0b6-6519aab60340	1	The best app	5	2025-01-03	POSITIVE	0.999846935	General Feedback
c68370d6-9cb7-4476-8102-12b5eed0c1de	1	What's your problem with developer option ???	1	2025-01-02	NEGATIVE	0.999119699	Bugs & Reliability, Feature Requests
e4040683-ca5c-42da-b4d5-52047c23ad3b	1	i can't access this app without turning off the developer option mode 🤬👎	1	2025-01-02	NEGATIVE	0.974927783	Account Access Issues, Feature Requests
e064c5aa-b740-4530-8e55-0e6457ffd36e	1	Always their is a mal function	1	2025-01-02	NEGATIVE	0.999675512	General Feedback
72a611ed-2ac8-4e60-8a65-3597de9cb36c	1	2041 Habib tahir	5	2025-01-02	POSITIVE	0.994579911	General Feedback
195578a4-9302-48a6-8c38-616d0507f614	1	It slow and unused app	1	2025-01-02	NEGATIVE	0.999658227	App Speed & Performance, Transaction Performance
d766c067-435c-40f2-a149-4142f238f1f9	1	No speed to reload	5	2025-01-02	POSITIVE	0.999594748	App Speed & Performance
6e21e9cd-31a4-41da-a622-74c66214dd28	1	Thanks for your	5	2025-01-02	POSITIVE	0.999719918	General Feedback
1a58b1f4-8f8a-483f-bc11-e183e901e32d	1	I am proud	5	2025-01-02	POSITIVE	0.999874353	General Feedback
a86141d2-eadc-4626-a8f5-27c8ca282f5d	1	Its not opening	5	2025-01-02	POSITIVE	0.999655008	General Feedback
375f0635-b8f5-4839-9a91-ff9ab4db3f49	1	Very nice and fast app	5	2025-01-01	POSITIVE	0.999873996	Transaction Performance
354ef6a7-8eac-49d6-88dc-66366b799e03	1	Simple bug fix, would help if current exchange rate is displayed on the app.	4	2025-01-01	POSITIVE	0.998555362	Bugs & Reliability, Customer Support, User Interface & Experience
d9238914-4aec-4c54-9e9a-d161f0fa5ea0	1	The not allowing the app while "developer options" is on needs to be fixed! Why the hell is an app telling me what to do with my own OS??? This is an unnecessary fix that needs to be fixed!!!	1	2025-01-01	NEGATIVE	0.999802172	Bugs & Reliability, Feature Requests
27531fa4-3867-457e-a7c5-05ad1c75fa9b	1	The recent update automatically turns the developers option on, and when one starts the app, a message pops up saying the app does not work with the developers option on. So, one has to go to the settings and manually turn the developers option off. Otherwise the app doesn't work.	3	2025-01-01	NEUTRAL	0.999764740	Bugs & Reliability, Feature Requests
2d63da6e-7e36-404e-8189-50a755c8df5c	1	Very useful app	2	2025-01-01	NEGATIVE	0.999578536	General Feedback
4ce35306-8de5-42fd-a726-f9d1badf8c97	1	I like it for overall services	4	2025-01-01	POSITIVE	0.999709308	General Feedback
2a403c28-26c5-4cfa-8450-8918921d6541	1	When after updating the app it asked me to turn off developer mode how do i do that	4	2025-01-01	POSITIVE	0.998258889	General Feedback
c6c9a85a-6acb-45cc-b292-d43ab9d2c813	1	Excellent!!!Keep it up!!!	5	2025-01-01	POSITIVE	0.999870181	General Feedback
2ae64964-cf5f-432a-9a1b-59d5c1b2b55f	1	Thats good for me	4	2025-01-01	POSITIVE	0.999849796	General Feedback
d96a3943-68af-456a-a88d-cded0647c8b3	1	Working doing fastly	5	2025-01-01	POSITIVE	0.996116042	General Feedback
c4b33ad8-56eb-47b9-87de-587fb6abf0c4	1	The poorest app	4	2025-01-01	POSITIVE	0.999740779	General Feedback
df6a85c2-2e6a-4509-aced-e0b11f4c9590	1	The inconvenience of this app is that it requires developer options to be turned off. This hinders my ability to customize my phone as some of the customization can only be done in the developer options. Also, it didn't have this requirement before, so why now? And please return it how it was because this should not be an issue. Also, when a transaction is completed before it used to allow me to save the image of the completed transaction, now it doesn't, so please fix that also.	1	2025-01-01	NEGATIVE	0.999555528	Bugs & Reliability, Feature Requests, Transaction Performance
b0841002-f40a-41fe-8fce-0c7151318285	1	Difficult to update	1	2024-12-27	NEGATIVE	0.999727905	Feature Requests, User Interface & Experience
1d98cac2-1f12-476d-b62e-b6ed14f78902	1	Worst update ever. It asked to disable the developer's option which they don't have any authority over. Most useless update ever. I wish I could give it a 0 star if it was possible. Why do you care about my phone's settings? Stupid developers. Should Switch to other banks.	1	2025-01-01	NEGATIVE	0.999821246	Feature Requests
5b9f529b-46d1-4c57-a2fe-05203fe52678	1	Wow wonderful app thank you so much.	4	2025-01-01	POSITIVE	0.999877572	General Feedback
28740e6e-a5f8-4042-beaa-1970944a23c0	1	I appreciate you	5	2025-01-01	POSITIVE	0.999801934	General Feedback
959ea133-0850-45c9-a276-9d7178d8d9aa	1	It ask me your developer mode is on and its not working for me???	1	2025-01-01	NEGATIVE	0.999671102	Bugs & Reliability
4e7d932f-7cd5-4365-8e95-876309a1f463	1	The last update is useless!!	1	2024-12-31	NEGATIVE	0.999790132	Feature Requests
88391319-07c8-4a70-b7e3-466e5c93bf0d	1	It is varey good	5	2024-12-31	POSITIVE	0.999866366	General Feedback
0c464711-ffb6-4f08-83f8-c7374188cc1f	1	Hi Hi Hi	5	2024-12-31	POSITIVE	0.997654617	General Feedback
c1505cdd-aafe-452f-8682-d133a955d1ae	1	Batam arf new	5	2024-12-31	POSITIVE	0.987433255	General Feedback
ac8a3973-158a-459b-a496-78e1fbcfdbda	1	I like you this App..	5	2024-12-31	POSITIVE	0.999680161	General Feedback
34f51ac8-8d76-425d-ae4a-6f2a5122499d	1	Its good app	1	2024-12-31	NEGATIVE	0.999861360	General Feedback
ae63035a-230e-4435-91b4-bb81de78ddec	1	It is and better than *889#.	5	2024-12-31	POSITIVE	0.999701917	General Feedback
7a6d48fd-1775-478b-b8f7-bbbb87a72d2e	1	The update isn't working	1	2024-12-31	NEGATIVE	0.999733746	Feature Requests
94f056c3-e60f-4733-8b2c-81f4eed6ca5d	1	No text, no update.....	1	2024-12-31	NEGATIVE	0.997238994	Feature Requests
64adc7dc-c597-43ab-b4d4-9e022042bf7b	1	As an app developer, I rely on Developer Mode to build and test apps, but this app blocks access entirely if it's enabled. This restriction is unnecessary and makes it impossible for developers to use the service. Instead of outright blocking, consider implementing enhanced security measures that don't alienate professionals who need this setting. Please reconsider this policy.	2	2024-12-31	NEGATIVE	0.998393238	Account Access Issues, Security Concerns
5855b22a-dc63-4641-919c-418cfc11c263	1	It's really helpful	1	2024-12-31	NEGATIVE	0.999818981	Customer Support
178f05d1-f858-4726-8f93-fe1cf75cd6b4	1	No work on my device	5	2024-12-31	POSITIVE	0.999717414	Bugs & Reliability
90a37655-2dac-40c6-b35a-51e5fb1edde8	1	not convinet in slow Nw	5	2024-12-31	POSITIVE	0.984528363	App Speed & Performance, Transaction Performance
49001049-a071-487b-8c1c-96069b42a36b	1	Weak update ! . b/c it stops when I want to set two step verification on. And it is only applicable if developer options are on. Why ??? Please tell me the reason 🙏	1	2024-12-31	NEGATIVE	0.999667645	Account Access Issues, Feature Requests
79c904d3-9ad2-441b-bd09-85a7d6416fee	1	Why I not used on these devices	5	2024-12-30	POSITIVE	0.994003594	General Feedback
d859ad97-e222-4ce6-9828-7f5c0a00d5ac	1	Very very good	5	2024-12-30	POSITIVE	0.999862194	General Feedback
7fd7422e-41c2-43a6-9619-282ec56d4852	1	Apdates went to dismiss the developer option	2	2024-12-30	NEGATIVE	0.999779284	Feature Requests
f094df40-0abc-4506-93eb-050c49d3576e	1	Best Mobile-Banking app! Moreover, I will rate 5 stars as soon as you add "account statement display" menu in it. Hopefully waiting, Thank you in advance!	4	2024-12-30	POSITIVE	0.999237418	Feature Requests
b0ec88c2-6c7a-4a16-abda-d657d917290b	1	Even it is a problem to update the app. Fix the issue first	1	2024-12-30	NEGATIVE	0.999527097	Bugs & Reliability, Feature Requests
f6f0289e-3003-4556-81d9-27f96964036c	1	The review page keeps loading, and even sync is completed. The history page always shows old/unknown transactions. ...... Edited: I guess the loading page means it expires and needs to go to the nearest bank and ask for an extension for another 3 years. Upgrade to 3 stars .	3	2024-12-30	NEUTRAL	0.992974162	App Speed & Performance, Feature Requests, Transaction Performance
9c1b2132-c774-4891-a2ad-755fa0e9ca7b	1	Simple, Easy platform	5	2024-12-30	POSITIVE	0.998719573	User Interface & Experience
9f43fafe-1377-46e8-a1ba-21c2ced7aa7a	1	Pure & secure I like it	5	2024-12-30	POSITIVE	0.999813497	Security Concerns
5f442fc8-de1b-442e-951e-f5c5ef87dd96	1	More than 10years	5	2024-12-30	POSITIVE	0.973398685	General Feedback
253960c1-c27b-457f-946c-3c4579eab761	1	13 years ecxepiranes	5	2024-12-29	POSITIVE	0.744920731	General Feedback
173defcc-4fc1-4c0b-ac40-3c7d37990c97	1	Best app from any others app	5	2024-12-29	POSITIVE	0.997552693	General Feedback
53024ed2-13ed-4fc9-afde-46cf45c6bb87	1	It's very Simple and useful for customer and also easier from other options of this Bank but its hard sometimes when the net work is bussy and inquiry some add update from the Branch technical stuff when you want this application for critical case the application was inquiring you un wanted update	5	2024-12-29	POSITIVE	0.993236601	Bugs & Reliability, Feature Requests, User Interface & Experience
ef2cde11-affa-40c3-a305-bdcd65b78556	1	Abraham hailu ara	5	2024-12-29	POSITIVE	0.988411605	General Feedback
dd49b4fe-5da0-401d-8474-2c40622a504e	1	This app is best if you add fingerprint or facial authentication instead of the current one.	5	2024-12-29	POSITIVE	0.989019215	Feature Requests
fb917064-a363-4877-a9de-762412ac422b	1	I like this application	4	2024-12-29	POSITIVE	0.999590814	General Feedback
5a3f4a9e-6351-442e-9156-d0d72939c6ee	1	I love it	5	2024-12-29	POSITIVE	0.999879956	General Feedback
0fec601e-cd4a-4669-9a18-81034a289a96	1	Best quality servic	5	2024-12-29	POSITIVE	0.999802768	General Feedback
672dc96a-d259-40a0-ae1a-e6b2091c861d	1	your service is very very nice	5	2024-12-29	POSITIVE	0.999854445	General Feedback
a3c46069-0130-4c39-ba51-702a000342c3	1	the worst app i have ever seen	1	2024-12-28	NEGATIVE	0.999790370	General Feedback
d570455b-ad32-4187-b0de-4ecd6ac9548d	1	it is best uplication Which i real on	5	2024-12-28	POSITIVE	0.997271597	General Feedback
6c0d060b-fe75-4e81-bcd6-9123e9e079d3	1	Why we can't make a transfer with foreign banks?	1	2024-12-28	NEGATIVE	0.997967899	Transaction Performance
ac2fe504-6a85-4d59-8d6a-45f4a594c4fc	1	The worst update	1	2024-12-28	NEGATIVE	0.999789178	Feature Requests
ff9edc65-ca57-459a-bdb7-9c68c5e95218	1	looks great but it has no option for accessing our transaction history....for some days back ...this makes our work bad	5	2024-12-27	POSITIVE	0.999768317	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
e14118b4-d265-46ee-9718-7fe62c6b745f	1	Everything is good except that it's asking me for update too much even though I updated the app many times and still mentioning that "it is critical update" so pls fix that	4	2024-12-27	POSITIVE	0.839031279	Bugs & Reliability, Feature Requests
4140dfd9-e1f7-4fa1-a4e0-ce256db85900	1	You should be boa b/c the app active by self so please 🙏 arrange now and for activation service l was pay 20 birr this is unfair	1	2024-12-27	NEGATIVE	0.999764740	General Feedback
6d028150-a951-4b42-879d-61e58465d0a7	1	simplest app. that i have ever used..	5	2024-12-27	POSITIVE	0.728079915	General Feedback
ed4ea82e-ed5a-434b-8c36-019f14bd83b1	1	This app is the best, easy and more clear to use including its features to understand so i liked it 100% because the app made the life of customers easy. Thanks cbe and the app.	5	2024-12-27	POSITIVE	0.999693632	Feature Requests, User Interface & Experience
a5245f21-bc3b-4461-85b9-22518a7ad632	1	After the update the system the requirement for minimal is not fair	2	2024-12-26	NEGATIVE	0.999625564	Feature Requests
c73bdd4f-5a64-48e9-b73a-49bf4b488795	1	It's so good	5	2024-12-26	POSITIVE	0.999845266	General Feedback
d79b3716-979f-4e31-8048-bb561ac139b5	1	its the best and fast	5	2024-12-26	POSITIVE	0.999862552	Transaction Performance
20099210-85d3-4f35-8cc4-ac78c89af8e9	1	Good and the Great	5	2024-12-25	POSITIVE	0.999860644	General Feedback
a32aef44-10e7-4fed-9468-64c66f1bf59f	1	Wow wow wow cbe; gud job, keep it up.	5	2024-12-25	POSITIVE	0.999392271	General Feedback
268636f6-8960-4046-9b09-45d09b859472	1	Not used fully amount	1	2024-12-25	NEGATIVE	0.999546230	General Feedback
706cf802-6cff-4806-9c77-7a78f4f0375f	1	ተጨማሪ ፒን የጣትአሻራ መጨመሩ በጣምጥሩነው ስጠብቀው የነበረ ፊውቸርነው👍	5	2024-12-25	POSITIVE	0.923957765	General Feedback
f0792216-a158-4832-9ec3-2cc2557408c8	1	Good commercial bank of ethiopia	5	2024-12-25	POSITIVE	0.999592245	General Feedback
dd47f254-22ee-4fcd-8070-803dbeccf2d8	1	I used for long time its best app	5	2024-12-24	POSITIVE	0.995696306	General Feedback
4f40d8bc-2175-4246-948a-32a5e88ab9d2	1	Very good and easy to use.	5	2024-12-24	POSITIVE	0.999878645	User Interface & Experience
d682d9cd-23be-4aec-b954-1c858352e2f2	1	I have very happiness by this service thank you cbe	5	2024-12-24	POSITIVE	0.999868751	General Feedback
cf45344c-195c-4b1e-b601-0291c424f064	1	This app is not working properly	5	2024-12-24	POSITIVE	0.999796689	Bugs & Reliability
d1d75a94-ba72-4c97-a6ae-2ff1868ec599	1	CBE my device don't work	1	2024-12-23	NEGATIVE	0.999734104	Bugs & Reliability
b03a33b6-82b2-44aa-ab87-415ca5453bae	1	Its good enough to transaction	4	2024-12-23	POSITIVE	0.999849439	Transaction Performance
7af3ba76-19bf-4c30-bf56-f8ead47d52c6	1	I love it its simple to use	5	2024-12-23	POSITIVE	0.999857187	User Interface & Experience
d7818aca-53fc-4251-aa6e-654a3809f747	1	Lot of errors.	1	2024-12-22	NEGATIVE	0.999311328	Bugs & Reliability
f1fc06b0-7565-4f23-8a90-0274bfe38fed	1	Good but it needs good network.	5	2024-12-22	POSITIVE	0.967178941	Feature Requests
b8445655-e55b-4891-b3a7-7b943b6b32f6	1	Thank you CBE.	5	2024-12-22	POSITIVE	0.999751151	General Feedback
6f35853b-2c58-46b8-9ec5-df98afe83458	1	Simplest and good way of using Internet banking it very interesting app	5	2024-12-21	POSITIVE	0.997535586	General Feedback
90ab7d79-f4b7-4e8b-b8aa-c0ff2853817c	1	very good for security	5	2024-12-21	POSITIVE	0.999795973	Security Concerns
a5b4eff3-71e5-48db-96ee-6eecad1c061a	1	ወደሌላ ባንክ ሲላክ የሚቆርጠው በጣም ብዙነው	2	2024-12-21	NEGATIVE	0.904695213	General Feedback
3970066d-87b2-4397-b1fa-0f31ba891a6f	1	Try to fix ur night time network setup	4	2024-12-20	POSITIVE	0.999411464	Bugs & Reliability
36401b7e-a380-4a44-97e0-541144415536	1	App Baayyee Bareedaadha.	3	2024-12-20	NEUTRAL	0.981672347	General Feedback
def5f9f2-e4f9-45ec-b9a9-adc305e96b3c	1	Its Good works great	5	2024-12-20	POSITIVE	0.999869704	Bugs & Reliability
e0325351-894e-4bde-8f70-84496b33647c	1	This is the worst update ever, the older version was better. It has so much bug.	1	2024-12-20	NEGATIVE	0.999788105	Bugs & Reliability, Feature Requests
f1b939da-e5ae-4845-bbfc-3fe7d8cbb4cf	1	Best mobile banking app in Ethiopia	5	2024-12-20	POSITIVE	0.999621630	General Feedback
8717b1cd-fa42-4252-b463-b6f7912c42bf	1	Deserve 5 star	5	2024-12-20	POSITIVE	0.773586512	General Feedback
c9d281f8-df7f-413d-9362-59c8b7e1ff7d	1	It doesnt work	5	2024-12-20	POSITIVE	0.999631405	Bugs & Reliability
87c06dfd-7b5e-4f4b-85a7-58aa16548c1b	1	The most worst update. It even doesn't let you know ur balance. It doesn't respond quickly.	1	2024-12-20	NEGATIVE	0.999752820	Feature Requests
3cfb8758-f050-42e6-ae79-ba637527da9e	1	In the previous, I gave 4 🌟 for this app based on my evaluation. This app was without biometric security and may be exposed to cheaters unexpectedly. It is solved now. You can add verification security on the setting app. But there is something problem still with verification. It must prevent logging in without correct input fingerprint.	5	2024-12-20	POSITIVE	0.997912705	Account Access Issues, Bugs & Reliability, Feature Requests, Security Concerns
227a6420-7901-475f-8771-23be0074ec31	1	it is the best	5	2024-12-20	POSITIVE	0.999860287	General Feedback
e521a1f7-9877-48c5-a4e0-2e0fdbadedd6	1	This is a good appp	5	2024-12-19	POSITIVE	0.999857068	General Feedback
049576cf-6d13-49c7-89c6-4bacdb609c53	1	Before the new version, the app was fast and merits 4 ⭐. However, following the upgrade, the app is slow and takes time to reload. Apps are useless without speed, so make them work.	1	2024-12-19	NEGATIVE	0.999607742	App Speed & Performance, Bugs & Reliability, Feature Requests, Transaction Performance
d227bc92-2c15-45cd-b6fa-b5419453a66a	1	The bank you relays on	5	2024-12-18	POSITIVE	0.965144753	General Feedback
ab66fddf-c4d6-438e-b62e-41f1ffac4515	1	very good app	5	2024-12-18	POSITIVE	0.999867558	General Feedback
020a791b-1bad-4fc3-be0c-ee1bb89835fb	1	This app fast and fact every solution thanks	5	2024-12-18	POSITIVE	0.999545753	Transaction Performance
1935bfa4-b117-43e7-a90a-cfde277e9de3	1	It stuck many time i can't transfer my own money the time i need it must be update but if the stucking prevent it is great app	3	2024-12-18	NEUTRAL	0.520721376	Feature Requests, Transaction Performance
7e71ae10-bce6-4199-8142-946837c3afd7	1	Easy to use and fast.	4	2024-12-18	POSITIVE	0.999430716	Transaction Performance, User Interface & Experience
945cd41a-5672-4ece-b33c-990ef7c19abf	1	it is ni ce	5	2024-12-18	POSITIVE	0.956671536	General Feedback
06266aea-d4cd-4e2c-bc19-1b09e075f778	1	It is very nice app	5	2024-12-18	POSITIVE	0.999860168	General Feedback
bfd5e329-f367-4e67-82d9-9a9de254da12	1	It might be fake be aware (it’s not working)	1	2024-12-17	NEGATIVE	0.998933971	Bugs & Reliability
914d2205-0738-45d5-b831-31b245666e6e	1	It Made Life Simple	5	2024-12-17	POSITIVE	0.999785125	User Interface & Experience
62f13946-2e5f-46b7-a431-dba9e2c58fed	1	It's easy and convenient 🙌	5	2024-12-17	POSITIVE	0.999101758	User Interface & Experience
6e63dede-15df-44dd-9829-26e0e95c498d	1	This bank is one of worst bank stealing poor peoples money 😭	1	2024-12-17	NEGATIVE	0.999526620	General Feedback
a6538ad3-ef58-41d3-91b9-912a0469cf6e	1	So amazing app I've ever seen	4	2024-12-17	POSITIVE	0.999851227	General Feedback
7968d681-0361-4c73-b6b5-a82654fb8707	1	Very convenient and user-friendly app. I love it	4	2024-12-17	POSITIVE	0.999582112	General Feedback
c1a99e84-c5e9-4d2e-998f-2a58cba9cff1	1	My experience with this app has been outstanding so far,but sometimes it has a hard time connecting with network and makes it hard to make transactions. Apart from that it's amazing.	4	2024-12-17	POSITIVE	0.994293869	Transaction Performance
da85a698-2d9b-46fe-b8b2-d1641687d0da	1	Even if i had a balance of >0 i couldn't Even transfer any of my balance starting from 0-10257.	1	2024-12-17	NEGATIVE	0.998701811	Transaction Performance
188ea4e1-661b-4b1e-be07-ef1dc11d91b9	1	Best Application Mobile Bank	5	2024-12-17	POSITIVE	0.999540925	General Feedback
3b10ed6c-261b-4c47-8b1b-bae997d1ccf8	1	It is keeping to say" this app is rooted you can't use it "what is the problem	1	2024-12-17	NEGATIVE	0.983732283	Bugs & Reliability
ea78e674-4d8f-4ecd-b798-774bea0b73fa	1	is this the latest CBE app	5	2024-12-17	POSITIVE	0.988097608	General Feedback
95598803-52d9-4ebc-a60b-686a6c841832	1	iI can not see the receipt, why?	5	2024-12-17	POSITIVE	0.999445498	General Feedback
8759ea31-d51a-451e-b61d-d99f10155ae1	1	How to play sirra critical	5	2024-12-16	POSITIVE	0.810228825	General Feedback
a6eba9bf-c815-4aa5-a8f3-3bf7279f0619	1	It's very good app for transactions, to give you 5star one more thing you need to do is include bank statement showing methods. And one more thing after you take your commission why you take 5birr monthly without my confirmation?	4	2024-12-16	POSITIVE	0.984687150	Feature Requests, Transaction Performance
1d8e1dfe-75f6-4893-bd31-802cc42dc764	1	It's excellent 👌 app	5	2024-12-16	POSITIVE	0.999868393	General Feedback
db89f4f6-7d11-481a-b2c7-206b46aed510	1	Please Add the Biometric system on the app	5	2024-12-15	POSITIVE	0.824033141	Feature Requests
fa3329a8-baf4-4c01-92e4-9c2db579d420	1	So cool app	5	2024-12-15	POSITIVE	0.999845386	General Feedback
e328e00c-1abe-4c88-a68a-afcb4ffd746b	1	I am so disappointed because the application doesn't clearly show how many birr it will charge for every transaction rather than just deducted the money , as a user we should have the right to know the amount of money that is going to be deducted. It is a very deceptive tactic , it should be improved immediately.	1	2024-12-15	NEGATIVE	0.998320758	Transaction Performance
0b9383f8-0d75-418c-9acc-19d50f2d764a	1	Transfer to telebirr fee above 10 birr	1	2024-12-15	NEGATIVE	0.971549630	Transaction Performance
be08d652-f6c4-41a2-9023-793cd2c669c0	1	Convenient and safe to use! Better to show more transaction history 👍	5	2024-12-14	POSITIVE	0.993257880	Security Concerns, Transaction Performance
3e1022d5-e117-4d8c-a5fc-96d809e080ed	1	Best application for ever Thank you very much indeed for your understanding me	5	2024-12-14	POSITIVE	0.999827325	General Feedback
9ef004fa-5296-4575-a381-6ec21ceea363	1	It takes ur money out of no where!!!!	1	2024-12-14	NEGATIVE	0.998212337	General Feedback
1be677f1-eab2-4096-906f-d863df8eabc3	1	Best & easy app!	5	2024-12-14	POSITIVE	0.999423504	User Interface & Experience
1d9bd50b-86c4-4672-b68f-c5cbdb9c34c3	1	Good service for me because it saves my time. There's no need to go to the brunch to transfer the money my bank is going to anywhere with so I can do anything on my mobile banking.thanks for your service.	5	2024-12-13	POSITIVE	0.998820126	Transaction Performance
711acbd4-2150-4446-bbf7-b729ea54da28	1	Awesome and very simple to use, love it👍🏽	5	2024-12-13	POSITIVE	0.999878526	User Interface & Experience
d9ebd9db-e5b2-484c-9738-3ee9f51c6346	1	CBE. is most fantastic and mor action app bee used every parson. CEB. Is my dream a yeat com. for every population if you need highly educated to see about CEB USEED APP of CEB Wallet With all transactions in All world bank to bee exchange raet More information ⬇️With CBE Mobile app you can perform banking tasks anywhere at anytime! Commercial Bank of Ethiopia Mobile Banking The Official app of CBE for Android CBE Android Mobile application gives you access to your account on your Android phone.	5	2024-12-12	POSITIVE	0.930206954	Account Access Issues, Transaction Performance
d13074c4-1e4c-4f1e-98a5-8122e988b746	1	የ 1 ወር transaction ቢያሳይ አሪፍ ነው እንዲያሳይ አድርጉልን	4	2024-12-12	POSITIVE	0.934353709	Transaction Performance
c1b43dbf-d2eb-4cc0-bb51-02cea012631d	1	It's good but it is very busy occasionally.	3	2024-12-12	NEUTRAL	0.825999737	General Feedback
bb6e36be-c097-4b35-94d7-19be6dbfbac4	1	I love it	5	2024-12-11	POSITIVE	0.999879956	General Feedback
9771d289-ff76-4674-9407-9cd0b9d6f361	1	CBE is great app	5	2024-12-09	POSITIVE	0.999798119	General Feedback
0cb52d49-3c3c-423f-ba9a-f9a8f528174c	1	Its weak application	1	2024-12-09	NEGATIVE	0.999685645	General Feedback
19095382-c2b9-47f2-8ccb-a57acf049c8c	1	Vary excellent but update balance not seen at time transaction.	4	2024-12-09	POSITIVE	0.557150185	Feature Requests, Transaction Performance
b6987c14-c0d0-4909-91fe-e4c10a493f28	1	Why it havent cbbirr	5	2024-12-08	POSITIVE	0.997946084	General Feedback
ce6d81c3-1604-43f2-b09e-0459c1fabfa2	1	Its not work as expectations	1	2024-12-07	NEGATIVE	0.996784329	Bugs & Reliability
87180dd1-0e14-4229-b926-334f818990fb	1	Not that much good!	1	2024-12-07	NEGATIVE	0.999798715	General Feedback
397d1e57-933a-4b1c-b67f-61a2920ad8e8	1	Great app convenient for making payments and transactions. Tnxs CBE 👏👏👏	5	2024-12-06	POSITIVE	0.997346640	Transaction Performance
77504781-9e9c-4942-89b3-231ab2ccec79	1	My all time best application	5	2024-12-06	POSITIVE	0.999824345	General Feedback
c2867a6d-36a9-44ac-9f88-81bc56a36125	1	2 Year Exprianced on this app	5	2024-12-06	POSITIVE	0.987575352	General Feedback
a551166d-b8b0-436d-afae-adeab77000e3	1	It's professional app ilike this app	5	2024-12-06	POSITIVE	0.962332249	General Feedback
910d6228-2477-4bb4-aa36-569f26213dae	1	It is very good, it is very useful, it is a problem solver	5	2024-12-06	POSITIVE	0.999536395	Bugs & Reliability
b2fa77f7-1611-40fc-a11a-934703b3d390	1	Superb app. Serves better than I expected in a remote and hardly Internet connection covered areas while in the field work. Thanks team	5	2024-12-03	POSITIVE	0.995970488	Bugs & Reliability
74755f93-0111-47db-a0c6-a982b89f325d	1	The best mobile banking in the world. I love it, thank you!!!! But try to have more servers, sometimes it is busy.	4	2024-10-21	POSITIVE	0.985696018	General Feedback
5a6a775f-c55f-45c1-a4fc-3b85d078f000	1	I’ve noticed two key issues with your app: 1. Username Visibility: The app doesn’t display the username, making verification difficult. Please add this feature. 2. Transaction History: Transaction history gets deleted if the app is reinstalled. This data should remain accessible unless manually deleted by the user. A "Load More" option for older transactions would also be helpful. These issues have caused inconvenience. Fixing them would greatly improve the user experience. Thank you.	5	2024-12-01	POSITIVE	0.996934056	Account Access Issues, Bugs & Reliability, Customer Support, Feature Requests, Transaction Performance, User Interface & Experience
429bbeed-e1cf-42bb-bf1d-ec9718794871	1	I want to download	5	2024-11-30	POSITIVE	0.981948376	General Feedback
f55261b4-82ab-47cd-9833-6604b6dde2a9	1	This app is just sweet	5	2024-11-30	POSITIVE	0.999819219	General Feedback
b435a4f3-66ae-4d52-acd5-927ea766cc53	1	It is the best application that makes life easier and provides fast service	5	2024-11-30	POSITIVE	0.999810278	Transaction Performance
5f6118ab-be34-4195-b8e9-c6fbd62f4628	1	Fast and reliable	4	2024-11-30	POSITIVE	0.999859571	Bugs & Reliability, Transaction Performance
4cfb2b5e-7bb4-495c-b3b7-adca97dd63bb	1	the good app	5	2024-11-29	POSITIVE	0.999867320	General Feedback
0685fa8c-fc6b-4bbe-9fc1-c6cf22a4974b	1	Self transfer has a problem. Doesn't tell weather trasfered or not after the process,ie ignors the final issuance of reciept .....	2	2024-11-28	NEGATIVE	0.998749256	Bugs & Reliability, Transaction Performance
66af7467-3bc5-44f3-85dc-9b96373ca4e4	1	Best for users	5	2024-11-28	POSITIVE	0.999620199	General Feedback
9df3535a-24d4-424a-b43e-6db4e553d06f	1	I like it	5	2024-11-27	POSITIVE	0.999859333	General Feedback
e57cd23a-dd7c-4634-b9d2-2d4340dd943e	1	1.I have to log out and wait for more minutes to make another transfer . 2. I get charged for a not satisfactory transfer amount. 3.On some days I see some transactions with different amount of transfers which I don't do . 4.I can not transfer more than 20K. and charger for every transfer is not fair 5.And l wish to know "For Ethiopians where exactly is there country to live in"	1	2024-11-26	NEGATIVE	0.999270022	Feature Requests, Transaction Performance
2cfdeed5-458d-452f-9a5a-ee79293c5337	1	Agriculture in genral	5	2024-11-26	POSITIVE	0.989987314	General Feedback
15e34927-5b11-4224-b0f9-2fecf9a4a7b9	1	Pretty straightforward, does what it's supposed to do. Wish it had beefier/ more detailed recent transactions though.	4	2024-11-25	POSITIVE	0.990659595	Feature Requests, Transaction Performance
c1491da4-1767-4c1c-9a79-e9db5df0e354	1	ስግብግብ , Unfair (Tele + CBE )😫	2	2024-11-23	NEGATIVE	0.999502659	General Feedback
3b19a5f6-7ac0-4691-a92f-c0c1195bed47	1	The system is slow	5	2024-11-22	POSITIVE	0.999798834	App Speed & Performance, Transaction Performance
5ec5ea02-8a52-427b-8b03-043e2555ce3c	1	This works fine !! Nice !!! But I was wondering can I see my statement from the app?	4	2024-11-21	POSITIVE	0.990622818	Bugs & Reliability, Feature Requests
1fc55a72-1e18-4cd4-99e2-58101570a5bb	1	USE ENGLISH LANGUAGE.	5	2024-11-20	POSITIVE	0.992319047	General Feedback
1a0a3d1f-a6b5-4e95-a6de-d23bfe81be34	1	It used to work fine but nowadays if u try to use it after midnight it doesn't always work either with Wi-Fi or data and sometimes we gotta pay things before the dead line and boom it doesn't work	3	2024-11-20	NEUTRAL	0.999756277	Bugs & Reliability
3bf8dc59-195c-40ae-97ae-da6118256fe7	1	I like this app! it's easy to use and quite flexible. it's nice 👍	5	2024-11-19	POSITIVE	0.999868393	User Interface & Experience
9671aee2-4125-46b5-9a1d-bbeef265f13a	1	From my over thirty five years custemer of the Commercial Bank of Ethiopia I find it to dependable bank.	5	2024-11-19	POSITIVE	0.804757357	General Feedback
fcdeabce-726a-47f2-8eb8-20874d73e8f5	1	Its good bank in ethiopia	4	2024-11-19	POSITIVE	0.999745071	General Feedback
3ecd5842-2bc4-4e7c-a341-65ee3af72e1d	1	The best banking and application	5	2024-11-18	POSITIVE	0.999859571	General Feedback
7f95c0fc-e54d-40af-b9a1-1d4f0264b34f	1	feature to add beneficiary account from older version isn't available on this one, and the greeting notification that pops out during every log in is boring.	1	2024-11-17	NEGATIVE	0.998903036	Feature Requests
88741c0b-ef29-4b04-9b39-e4742aac32a4	1	Problems seen account banning without my permission	2	2024-11-17	NEGATIVE	0.999082565	Bugs & Reliability
e519b023-d0a0-40b2-ac7d-851ed9121e0c	1	I like this app. It is very helpfull. The draw back is it doesn't order transactions accordingly and it stops responding without any notification.	3	2024-11-16	NEUTRAL	0.957842648	Feature Requests, Transaction Performance
94faec60-b58b-4444-be0f-84c603d60816	1	በጣም የሚያስጠላ ሲስተም ነው ኣሻሽሉ	2	2024-11-16	NEGATIVE	0.883213103	General Feedback
7299b42d-d25c-4fac-8c49-86e11455550f	1	Sometimes, it is very difficult to open	1	2024-11-15	NEGATIVE	0.999403715	User Interface & Experience
ad434fe9-4de4-4180-95b4-34cbb2ded71a	1	It is easy;comfortable and smart latest advanced digitaluzed application of CBE!!!!!!!	5	2024-11-15	POSITIVE	0.997265458	User Interface & Experience
f5aaf369-aa4a-4d92-afac-1f0b9ebc62fa	1	ሲስተሙ ምንም አይሰራም ያአቸግራል 😔😔 ብስታካከል መላካም ነው	1	2024-11-14	NEGATIVE	0.920040667	General Feedback
5f15ce0a-afb7-41e7-886a-260274580fd3	1	One of the best	5	2024-11-14	POSITIVE	0.999864101	General Feedback
76179a40-4be8-4004-8b0c-b66b72fa85dc	1	Best app to use money transfer	5	2024-11-13	POSITIVE	0.977408111	Transaction Performance
eb858ab7-5229-4360-8876-4ae795af280c	1	Best in ethiopia	5	2024-11-13	POSITIVE	0.999779999	General Feedback
cdff6ea4-fbfa-4d4f-b1bf-d0a5b92a247e	1	It is very easy to use and preferable overall I really liked this app	4	2024-11-13	POSITIVE	0.999598920	User Interface & Experience
1a235ce1-12e5-4997-9fea-19cfa204969b	1	fantastic and very helpful	5	2024-11-12	POSITIVE	0.999876738	Customer Support
09c186cc-592c-4cb5-9b75-93df4c5e8b53	1	It s nice	5	2024-11-12	POSITIVE	0.999858618	General Feedback
1de4c361-dd8f-4cfc-9de2-cf3ce740db69	1	I really love this App It's amazing 🙏	5	2024-11-11	POSITIVE	0.999884248	General Feedback
d511ced1-d71b-466e-84e2-6169dcc99949	1	The 'unsubscribe' button in the CBE Android app is misplaced. It should be at the middle of the menu or somewhere else rather than at the end. The end is usually for a 'log out" and I inadvertently touched ''unsubscribe" many times. This could lead to customers accidentally unsubscribing from the service.	4	2024-11-11	POSITIVE	0.999749482	General Feedback
4353571d-bb6f-43bb-9bfe-bd9c818fa4df	1	Very good service	5	2024-11-11	POSITIVE	0.999864817	General Feedback
6e386e05-1059-4a16-8f95-9d8e2f3b5b14	1	bast mobile banking in Ethiopia	2	2024-10-20	NEGATIVE	0.997422934	General Feedback
e5a4dc5c-55ce-4abd-998d-cbb96f24d7c6	1	hello,all ethiopian to east africa and all over the world.i am from ethiopia.i wos have disegned new digital transaction system in ethiopia.this our money transaction to be active when we need all our transaction to any where.this is also exellent way to connect by digital transaction with global country.......like china...us...italy....phli....etc through the world...we have been lucky by making a great digital connection system to develop our CBE birr with global transaction...in ethiopia...	5	2024-11-10	POSITIVE	0.937859178	Transaction Performance
f6114f87-55b5-42ac-9090-9d8f93e01174	1	Best app in ethiopia	5	2024-11-10	POSITIVE	0.999491811	General Feedback
95cf0ae8-6ba5-4f67-b7d4-2d856b9766c1	1	The best application and easy my life	5	2024-11-10	POSITIVE	0.999865413	User Interface & Experience
6f1d0ae9-b754-446c-86cc-b7ff10c71a06	1	Amazing it's easy to use	5	2024-11-09	POSITIVE	0.999875307	User Interface & Experience
b09ba8ba-e9ac-47ff-bbc2-46c2e0a8634a	1	Very great job	4	2024-11-09	POSITIVE	0.999870300	General Feedback
b8c3e7a5-1402-462a-b3ea-f6903b7b33e6	1	I have no experiance about this	5	2024-11-09	POSITIVE	0.995685935	General Feedback
372474a5-067b-4135-8852-9b61b38bdfc5	1	It is good but not sufficient !!	5	2024-11-09	POSITIVE	0.995851040	General Feedback
682e1471-d28c-4908-b374-bf6d91876ead	1	1. Statement is limited with one screen display. There should be access to see my transactions of at least 6 months before. 2. Sometimes debit/credit is not shown on the account details.......	2	2024-11-09	NEGATIVE	0.995306790	Account Access Issues, Feature Requests, Transaction Performance
2763e48a-64da-441d-bb9b-01c07dcc768b	1	The Commercial Bank of Ethiopia (CBE) is a pillar of financial strength and stability in Ethiopia. As the largest and most established bank in the country, it fosters economic growth, promotes financial inclusion, and supports businesses of all sizes. CBE’s mobile banking app enhances convenience by enabling millions to access banking services anytime, anywhere. Keep up Good work❤.	5	2024-11-09	POSITIVE	0.999747574	Account Access Issues, Bugs & Reliability, Customer Support
44f1d851-88eb-4d2b-b3d4-2027d2eb6056	1	I am unable to open or use the application	2	2024-11-08	NEGATIVE	0.999731839	Account Access Issues
9ccba907-94d1-44d3-8e75-83a47f468ac3	1	I like this application and your Banking systems	5	2024-11-07	POSITIVE	0.999494553	General Feedback
91a4595f-a5f0-4d4d-bc3e-42744696742f	1	Wow fast network	5	2024-11-07	POSITIVE	0.999574482	Transaction Performance
ce14ff34-1dd4-4b5a-b63c-cb5260ddc4e5	1	It's so intermittent.	2	2024-11-07	NEGATIVE	0.989832759	General Feedback
e492b508-22f9-49e4-a3bf-e7e07c484c84	1	ሰላም የኢት ንግድ ባንክ አፑ በጣም አሪፍ ነው ግን የተላላክነውን ሂስትሪ ላይ በካላንደር እንድወጣልን ስርች ማድረጊያ ጨምሩበት	5	2024-11-07	POSITIVE	0.958290517	General Feedback
f5e3afcd-766b-45d3-afd6-8ac1a5d0821a	1	Super convenient and accessible	5	2024-11-06	POSITIVE	0.999629378	General Feedback
262f7cf2-ad72-4925-a109-f8d13ec6444f	1	you brought new feature which is standing order, but it doest have option to delete/edit amount	4	2024-11-06	POSITIVE	0.996631682	Feature Requests
849365bd-d325-4df3-9bd6-e659f4ab7ced	1	I like this app but it's done not work so fix it please!!!	1	2024-11-06	NEGATIVE	0.997734785	Bugs & Reliability
69a5a799-b305-4bb4-901c-8453194b40ec	1	just do it	5	2024-11-06	POSITIVE	0.999190629	General Feedback
515a8eb8-bd93-4a34-98e5-54b7536528d2	1	Easy and accessible easily	5	2024-11-05	POSITIVE	0.999840140	User Interface & Experience
4b6e793f-5689-4f08-b202-2b9d39d318bc	1	Very nice app ግን አንዳንዴ በጣም ይንቀረፈፋል ማሻሻል አለባችሁ ፍጥነት ያስፈልጋል	4	2024-11-05	POSITIVE	0.999349535	General Feedback
0b712dcd-62f3-427b-b7c2-eea363f7fda2	1	Very great application	5	2024-11-04	POSITIVE	0.999871373	General Feedback
a3fecffb-9902-428a-ad02-31e2063e5165	1	It shows a limited number of transaction history. And it does show transactions history in the order of arrival	1	2024-11-04	NEGATIVE	0.976821959	Transaction Performance
a93a4dd2-2d69-4c50-b7e4-4d7dc8e0adbd	1	Good and better app compared to other bank's, but the remard/naration is ommited when we make a screenshoot, so better to include the remark.	5	2024-11-04	POSITIVE	0.998384714	General Feedback
45d36b7b-00e6-43f4-b89d-3aa6e864e554	1	the best service	5	2024-11-04	POSITIVE	0.999863982	General Feedback
a3973baf-0798-4be2-88a8-74b64f197e6b	1	Very nice applications. Very useful app.	5	2024-11-02	POSITIVE	0.999823630	General Feedback
f3512434-f8cf-4a22-947b-93173e05b9cf	1	I am using. The Ap it is amazing	5	2024-11-02	POSITIVE	0.999871373	General Feedback
c2bcbc2f-34e3-4662-be95-3c684fccdd52	1	Good luck tanks 😍	5	2024-11-02	POSITIVE	0.999400020	General Feedback
e8e198b6-1b95-461c-97b2-eab5cacadc15	1	Loved it! Exceptionally easy, friendly interface with no adds and complicated extensions app!	5	2024-10-31	POSITIVE	0.999175966	Feature Requests, User Interface & Experience
78baeb62-d743-4d96-99bb-c9729c587544	1	Keep the good work	5	2024-10-30	POSITIVE	0.999865294	Bugs & Reliability
5fbde5f8-b2d1-4aa5-87ee-430fb56a5b68	1	Working very good yet than the other methods I know before	5	2024-10-30	POSITIVE	0.999713600	General Feedback
776e9073-b93c-44d0-a377-9b19eb9f6d65	1	This app is very interesting, fast transaction and preferable system!	5	2024-10-30	POSITIVE	0.999565423	Transaction Performance
e429a393-e021-45d6-800d-151561034644	1	Avery good app designed by CBE makes life easier.	4	2024-10-30	POSITIVE	0.999360740	General Feedback
4aabca6a-9660-497e-930f-b082728356a6	1	Best ethiopian bank	5	2024-10-28	POSITIVE	0.999719083	General Feedback
c48790e0-c47d-4df4-8b84-f6746b3f63b6	1	The leading bank in Ethiopia.	5	2024-10-27	POSITIVE	0.999499798	General Feedback
6544c352-76ca-4c24-97d9-64a126d3b97c	1	Very efficient app	5	2024-10-27	POSITIVE	0.999834895	App Speed & Performance
439d8217-1101-4ffb-9977-e2c0799bd9eb	1	It's better for using Wherever we are .	5	2024-10-24	POSITIVE	0.997108281	General Feedback
717effb9-1a57-446e-b68a-ea6adc78f377	1	ብርለማስተላፍ ፈልጌ አልሰራልኝም ለምን?	4	2024-10-24	POSITIVE	0.966195762	General Feedback
e981ea82-df04-4853-a39e-86078f1b1f88	1	I get it fast	5	2024-10-24	POSITIVE	0.998701692	Transaction Performance
6b14e72f-8214-44c3-afbf-35bf29bb78a8	1	I liked this app	5	2024-10-24	POSITIVE	0.999584854	General Feedback
4502d687-ea43-4c6e-a1fa-c41edd5f6447	1	ፒን ቁጥር ካስገባሁ በኋላ የሚመጣው ስከሪን ተቀማጭ ባላነሴን አያሳይም!	1	2024-10-23	NEGATIVE	0.989283085	General Feedback
f005b87c-2002-4b27-aa7f-914bca2cb8a1	1	Amazing for saving time	5	2024-10-22	POSITIVE	0.999873281	General Feedback
d9c3d296-ebaf-4e0c-8f48-487b1ed211bc	1	App is not working	1	2024-10-19	NEGATIVE	0.999746740	Bugs & Reliability
d477ddf4-777d-492a-8123-96bd2a9337bd	1	Very good for transaction	5	2024-10-19	POSITIVE	0.999824584	Transaction Performance
074bc6f5-2710-4d1d-b3b4-e17bc1ff1fd2	1	ጥሩ ነው በዚሁ ቀጥሉበት።	2	2024-10-19	NEGATIVE	0.883213103	General Feedback
e9f24064-e390-4190-bc6f-768aede1662e	1	This good mobile banking app ever used but it says this device is rooted. You cannot run this app on this device	1	2024-10-18	NEGATIVE	0.969990194	General Feedback
f7929faa-33ee-4720-844e-7cd35ce139d0	1	try to update it	1	2024-10-18	NEGATIVE	0.998536587	Feature Requests
43629a07-3939-4061-bda0-022dedd75e2f	1	Fantastic, It has supersonic speed.	5	2024-10-18	POSITIVE	0.999871731	App Speed & Performance
0cce8d36-a7ee-4e34-9014-6a5e43691cee	1	Nice &simple app	4	2024-10-18	POSITIVE	0.999783933	User Interface & Experience
06ace934-4707-41a1-a9c3-65660afb10f3	1	Such a great app😘	5	2024-10-16	POSITIVE	0.999796569	General Feedback
f6bd7e63-ed19-4a2d-aef6-72532b0d62bc	1	It is a service that is not expected from such a large institution. I saw that your work is very complicated. The user does not understand well your application. In general, you have many problems. This application is not convenient for the end user. For instance I can't access my account from abroad what I depsited amount and transfer from my account to any any one .It is a shame.	1	2024-10-16	NEGATIVE	0.999553621	Account Access Issues, Bugs & Reliability, Transaction Performance
1bc57954-bd14-433d-804c-b1567fbb100c	1	Cannot access with no reason,	1	2024-10-16	NEGATIVE	0.999554574	Account Access Issues
87ce9f6e-a160-4d05-8d51-e220d693718e	1	I like the app, easy to use, if possible please add some more features like calculator. Simply add one more icon with calculator function, so the users can easily do some calculation without closing the app.	4	2024-10-15	POSITIVE	0.986952305	Feature Requests, User Interface & Experience
d2a6eb7c-014b-468e-bbf9-0fc943d82b6b	1	It was good because of its wide area usage possibility but has so many problem with transaction daily information and availability duration	3	2024-10-15	NEUTRAL	0.992476285	Bugs & Reliability, Transaction Performance
36866234-1772-417c-9eb0-e538bbf6934e	1	easy to use	5	2024-10-15	POSITIVE	0.998854280	User Interface & Experience
e910ff80-236a-4d76-b85c-64116fe6c3f1	1	It is good	4	2024-10-15	POSITIVE	0.999849439	General Feedback
22ce1ca3-0566-4ef4-9b01-70e64efac3e8	1	It's not secure enough,you don't have biometric option	1	2024-10-14	NEGATIVE	0.999780834	Feature Requests, Security Concerns
3694901c-9b50-4116-ada6-7a418597cd2f	1	-The app only shows a limited record amount of transaction (20) - it crashes again and again	1	2024-10-14	NEGATIVE	0.998893440	Bugs & Reliability, Transaction Performance
20e29c31-ae8b-464a-a6eb-8b05ed61f8f6	1	I need money	3	2024-10-13	NEUTRAL	0.999100804	General Feedback
aa6bfbb6-af4c-44f7-bb51-b91178866fe3	1	That was good app😍	5	2024-10-13	POSITIVE	0.999848962	General Feedback
8cb8cebc-2da5-4582-ab23-f7664ed66b73	1	Fast and easy to use, simple app at all!👌	4	2024-10-13	POSITIVE	0.996820331	Transaction Performance, User Interface & Experience
8a4ed498-a12e-4049-a224-4a6bc0ebb25f	1	Best application ever	5	2024-10-13	POSITIVE	0.999824464	General Feedback
09fa47be-d3e4-4861-a422-738d32fedb6d	1	It is an amazing App I like its features	5	2024-10-13	POSITIVE	0.999880195	Feature Requests
2bf3dfe6-590d-44a5-912a-318411778f0b	1	Please bring back the reason of transfer/reference format on the receipt. Pls pls, for those of us who have multiple transactions,it's very important to trace the receipts by looking at the references.	3	2024-10-13	NEUTRAL	0.991813540	Transaction Performance
3ffd7c47-e515-4bd3-859c-1ff13bed296c	1	No have all monthly statement,	2	2024-10-12	NEGATIVE	0.970148683	Feature Requests
d75213b2-0d8e-4133-a243-5cec857e4260	1	I love this app it is fast and suitable for use.	5	2024-10-11	POSITIVE	0.999820769	Transaction Performance
ee4136aa-94e6-415a-bd86-775a95d36867	1	Wow Ethio Tele 🤯🤣🤣🤣🤣	3	2024-10-11	NEUTRAL	0.998984277	General Feedback
e15dbd4e-681d-4670-9e08-a4913ddf44f5	1	I find this app user friendly and reliable.	5	2024-10-11	POSITIVE	0.999335825	Bugs & Reliability, User Interface & Experience
42fc2232-12d0-4441-b149-c12267ed5ff2	1	It's good ,but in the history list, it doesn't show a reason for transactions.	4	2024-10-11	POSITIVE	0.996531188	Transaction Performance
05373320-5899-4027-8113-b248839d7650	1	This app is not set up for diaspora users. It works fine until you needed a new verification code, or you change your cell phone and try to use the app on the new phone. You will not be able to get the verification key that it is asking for just for changing your phone. It requires you to go the nearest branch to get the verification key. For me this will be travelling to Ethiopia from USA just to get this code. Even my sister - a joint aact holder & has my Power of Attorney, could not help me.	1	2024-10-11	NEGATIVE	0.991349041	Account Access Issues, Bugs & Reliability, Customer Support
6c3c3b61-f11a-49ad-a15b-994b8b2f7c81	1	Which is very important!	5	2024-10-10	POSITIVE	0.999841094	General Feedback
2fdedb8d-ec5c-468b-8f97-fa04985599ff	1	please send me your details please	5	2024-10-10	POSITIVE	0.997369766	Transaction Performance
a6b6df5d-1fb1-4bc0-9a95-6ba6260ba2f2	1	No one like cbe	5	2024-10-09	POSITIVE	0.930025637	General Feedback
07fb6e41-4e2f-4fba-b7c4-68b0f9498625	1	Its good for digital marketing	5	2024-10-09	POSITIVE	0.999048650	General Feedback
3aaa2833-20ee-4918-89f1-ac52b1575fd0	1	too nice app my time savaing	5	2024-10-07	POSITIVE	0.986521780	General Feedback
53db1f9d-a213-486a-9951-6a60a4c8493e	1	This app is so strong💪	2	2024-10-07	NEGATIVE	0.999844790	General Feedback
c9fda4de-83b8-4481-948d-ca8bedff9a3a	1	ይህ አፕሊኬሽን ብዙ አገልግሎት እየሰጠ ይገኛል ሆኖም በየጊዜው አዳዲስ አሰራሮችን ከማደስ አንፃር ሲታይ ይቀረዋል አሁን ላይ ሂሳብ አያሳየኝም ምን ላድርግ	5	2024-10-06	POSITIVE	0.960071802	General Feedback
70a23795-060d-456f-84b7-3d66a99f180b	1	One of the best banking apps.	5	2024-10-06	POSITIVE	0.999843240	General Feedback
9bcb27ab-4978-4544-bf79-b028c32473ed	1	Unexpected apps becouse this is bad unfortunately error	1	2024-10-06	NEGATIVE	0.998813629	Bugs & Reliability
5d27a366-40a9-4aa1-be56-dac4e65ddcb8	1	One of the fastest app ever used.	5	2024-10-06	POSITIVE	0.998983204	General Feedback
97894088-deca-4008-8256-380f0a8f79e0	1	My best bank	5	2024-10-05	POSITIVE	0.999528766	General Feedback
73a8ee1a-a92d-47fb-b4fa-ce57d01ddfa5	1	Your app is so amazing	5	2024-10-05	POSITIVE	0.999870539	General Feedback
517806d0-f7ac-4a69-b36c-40ad5a3d5050	1	Discount service fee	2	2024-10-05	NEGATIVE	0.745289624	Transaction Performance
10711cc7-a0d7-4b6b-9c0d-78bc2632e266	1	My choice bank Comertial bank of Ethiopia	5	2024-10-05	POSITIVE	0.954100490	General Feedback
848a97c1-f39c-4a5d-b501-ff2248107555	1	This app is very active and past	5	2024-10-04	POSITIVE	0.988308430	General Feedback
892154d3-2e20-4e07-9a90-864fef8bc9cf	1	CBE is a great way to use it.	4	2024-10-04	POSITIVE	0.998491049	General Feedback
68e68820-3a82-4739-a978-e0ae0e315869	1	The app very nice but it stuck by now. What is the reason?	5	2024-10-04	POSITIVE	0.998080134	Transaction Performance
19f6a033-d215-4f72-af67-db711827fbbb	1	It's reliable, fast,and easy to use	5	2024-10-04	POSITIVE	0.999380589	Bugs & Reliability, Transaction Performance, User Interface & Experience
733acc47-6407-40c2-b221-bf7f517842f2	1	The app is okay!	5	2024-10-04	POSITIVE	0.999750674	General Feedback
231b76e9-95b1-4cb7-9d37-52141966dbfb	1	There is problem on application to transfer money and adjust please.	3	2024-10-04	NEUTRAL	0.997931480	Bugs & Reliability, Transaction Performance
a91f1e95-eae2-408f-90a7-7e703a4e86a1	1	It make my life easy my time my energey	5	2024-10-04	POSITIVE	0.998714685	User Interface & Experience
499e5a13-b73d-4951-a305-60c203e4f394	1	Am happy for the service	4	2024-10-03	POSITIVE	0.999861717	General Feedback
5e58e3cb-8bfd-41a2-aaa4-97dc2a458692	1	Good application commercial bank of Ethiopia	5	2024-10-03	POSITIVE	0.999554694	General Feedback
4ffc3c87-b1a5-4aeb-ab36-4e8a0291e454	1	It is my best apps ever. Thank you CBE!	5	2024-10-03	POSITIVE	0.999866247	General Feedback
0a28b3f7-3e10-4e0c-b4e8-ff3d57b2565e	1	Its very good application specialy with 4G Network Conection. However The Service Payment is Expensive. Do It Please Justified With Our Economy Label	3	2024-10-03	NEUTRAL	0.983725131	Transaction Performance
5a1b6d2e-69d5-4702-ae9a-9b6c9e0e56d3	1	App is not working for days now.	1	2024-10-03	NEGATIVE	0.997184575	Bugs & Reliability
a39cd20b-3933-42b3-a6e2-0add166893d7	1	Tnx for the team	5	2024-10-02	POSITIVE	0.983264983	General Feedback
2a972e0b-4975-4550-96d8-d722fdf7e316	1	Interesting application any updates should have to included timely	5	2024-10-02	POSITIVE	0.944032669	Feature Requests
6eea2eed-e9b9-43e8-8fcb-71c74315f246	1	Excellent appn that is easy to use it, the bank we trust and rely CBE. Thank you Abdi Farah	5	2024-10-01	POSITIVE	0.999279797	Security Concerns, User Interface & Experience
105ee875-c8b4-4a4f-bd33-6ebf9125b6c5	1	Double PIN request is extremely worthful. Keep working on security. I rate *****.	5	2024-09-30	POSITIVE	0.999620676	Security Concerns
5bd794d8-1113-4f15-9abf-83f174ecf007	1	IAM satisfied for the application.	5	2024-09-30	POSITIVE	0.986400902	General Feedback
42589757-0aa2-429e-9409-aa0fa71ea00b	1	It is excelent	5	2024-09-29	POSITIVE	0.999888182	General Feedback
a267002f-0b93-4823-9b4e-50eb3b2289b7	1	The increase in the amount of the Daily Exchange should be increased to 6,000,000 ETB instead of 600,000 ETB.	4	2024-09-28	POSITIVE	0.998736084	General Feedback
7cbb0d03-3030-416c-92ba-e4642b048565	1	It's the best appks	5	2024-09-28	POSITIVE	0.999852180	General Feedback
3ba2439b-0d74-4a8a-95f1-32dc02aa7ced	1	Fast and Easy to Use. By far the best mobile banking application in 🇪🇹	5	2024-09-27	POSITIVE	0.999782383	Transaction Performance, User Interface & Experience
8494b83b-0a1a-436c-9c79-db4ffeebe16b	1	It's time consuming up for using electronic money every were	5	2024-09-27	POSITIVE	0.995453477	General Feedback
79eab664-5680-498e-adf1-6dbe2177240c	1	Very special app	1	2024-09-27	NEGATIVE	0.999715984	General Feedback
864fa851-6aed-40ee-bb8d-3d658cb40866	1	It's esay and very fast to use and sync.	5	2024-09-26	POSITIVE	0.997651041	Transaction Performance
1b513f08-7353-425e-a6cf-ea0e4031d85f	1	This app sometimes 🛑	1	2024-09-26	NEGATIVE	0.912066758	General Feedback
b23745cc-c61b-4dd5-b8e5-b0e955de6410	1	Verification code website	5	2024-09-26	POSITIVE	0.905318022	Account Access Issues
ea63a284-d064-4152-a908-5da1d3fda023	1	I loved it	5	2024-09-26	POSITIVE	0.999880910	General Feedback
52792d5c-3ddc-4c37-aa0b-d8f19a0bad83	1	The best way..i like it#1👍	5	2024-09-26	POSITIVE	0.999646306	General Feedback
15672270-ce3f-4f6b-89b8-dde365d8e63e	1	I like it but can bring for us to link with PayPal please	5	2024-09-26	POSITIVE	0.926839352	General Feedback
dc888cdf-abc9-4477-941f-4793defa35da	1	please add the fingerprint security. All most the app is very good app.	5	2024-09-26	POSITIVE	0.999707639	Feature Requests, Security Concerns
8aede617-b09a-4974-9853-ef6b5848c7a6	1	I have been using this app for log time since It come to existence and its its marvelous app and usually enjoy its function and simplicity. I know pay everything with this app and make my transaction all by this app. Great Job by CBE.	4	2024-09-25	POSITIVE	0.998889506	Transaction Performance
f096d458-7da6-4801-9cb0-83392b854dec	1	It's good but it must add some especial item like statement or transaction list place	5	2024-09-25	POSITIVE	0.983569562	Feature Requests, Transaction Performance
bf8ec588-167f-446c-8511-7887d4254143	1	This best app	5	2024-09-25	POSITIVE	0.999852300	General Feedback
26972a23-4aea-4def-a8c5-03c4a6a8f045	1	fast and easy	5	2024-09-25	POSITIVE	0.999488950	Transaction Performance, User Interface & Experience
8b1a2f9a-30ac-4618-be7c-cc6e94b144ab	1	trust to use	5	2024-09-25	POSITIVE	0.999602973	Security Concerns
f6ad29dd-9bd1-4571-ae68-38dd7e518f82	1	It the bast app in mobile money to trasfer to receive payment use it !	5	2024-09-25	POSITIVE	0.924589097	Transaction Performance
144b93d2-a87a-40a0-91e1-baf22cacb8e2	1	It is an interesting app	3	2024-09-24	NEUTRAL	0.999748170	General Feedback
4ebbbfa2-08a5-47e8-8f3f-7fa4218eca0a	1	not working well	1	2024-09-24	NEGATIVE	0.999786675	Bugs & Reliability
b3664971-f61e-4219-a4c3-11220bc1fb90	1	I like it.	5	2024-09-24	POSITIVE	0.999869466	General Feedback
dacdfc0f-98e4-4e1c-9446-a5ae5e4cc8eb	1	Its eassy to use	5	2024-09-23	POSITIVE	0.951185942	General Feedback
1374d924-0f5b-4071-9c09-2dd6f486cff8	1	It is very, for more experience please upgrade it	5	2024-09-23	POSITIVE	0.981059372	General Feedback
f22b328f-a6c1-4268-bdff-eff35d62423b	1	failed to give receipt or confirm payment	2	2024-09-23	NEGATIVE	0.999740422	Transaction Performance
3d282f0f-fd61-4fdd-944c-0017fe5ad57a	1	Faster and convertible,,,,,CBE App👍👍	5	2024-09-23	POSITIVE	0.807421565	General Feedback
aac42fc0-47a3-43c9-b361-f2e38c2b1ae9	1	አብዛውን ጊዜ ያስቸግራል	5	2024-09-23	POSITIVE	0.833725393	General Feedback
cc748574-6fe5-413d-aca2-1bc6979a2279	1	Very good App	5	2024-02-13	POSITIVE	0.999867558	General Feedback
5a38da87-cafd-494c-9dfe-9a180377269e	1	Sulxan nuree muhammad godinaa harargee lixaa anaa buqa dhintuu zone	5	2024-09-21	POSITIVE	0.984395385	General Feedback
d4057ca5-16ea-4d80-92f8-cc9a8bac4961	1	Yes we can	3	2024-09-21	NEUTRAL	0.999778211	General Feedback
1662a0e5-3ad4-4813-8216-badc3645aa5a	1	At g CA	5	2024-09-20	POSITIVE	0.736600399	General Feedback
9f3ac2bf-046c-4e02-9704-fd8171c6df35	1	Has not show recent exact information. Some transactions are included and others excluded. Bad experiance. Always I got in truble by thinking the correct balance.	1	2024-09-19	NEGATIVE	0.999469697	Transaction Performance
650f944d-5921-44cf-9297-9210fd44dc60	1	Taju Mohammed Belda	5	2024-09-18	POSITIVE	0.979838014	General Feedback
27773e65-f4fd-4cb1-b10b-7ab6d93843be	1	Very bad application not working properly every time	1	2024-09-18	NEGATIVE	0.999795973	Bugs & Reliability
1c98387d-fc7e-4087-8098-a26bad253316	1	It's safe ever	5	2024-09-18	POSITIVE	0.999618173	Security Concerns
5293a77b-b1d9-42e3-ab48-7ed7df0d9f04	1	It's ask me update then i was going to my branch they updated my mobile banking but still not working!"	1	2024-09-18	NEGATIVE	0.999290943	Bugs & Reliability, Feature Requests
7f57ede4-e02c-4fdf-b303-95c7a5410f65	1	Nice mobile banking	5	2024-09-17	POSITIVE	0.999705613	General Feedback
fabefcd8-ab37-4e72-a49f-1c1b8ef8fdef	1	It ask KYC for the 3rd time in one moths what wrong with your system. If this thing keep going most of your customers start using other banks including My family and friends.	1	2024-09-17	NEGATIVE	0.999475420	General Feedback
5d4992da-a2ef-4a02-84f9-2e4b4c751027	1	It's true and is my favorite Banks	5	2024-09-16	POSITIVE	0.999860525	General Feedback
517a1452-a079-45eb-91eb-b8516df1f5a3	1	It is great app	5	2024-09-16	POSITIVE	0.999858379	General Feedback
a390e30c-38e0-477f-a66e-4f2bbe2e78c2	1	This service is qulity and very easy to use by any place any time also i could have save my time. Just i can say fantastic.	5	2024-09-16	POSITIVE	0.625382304	User Interface & Experience
42f4a54c-d50f-4b74-99f7-0edbe69fe74a	1	How can I trust a bank that doesn't have a cyber crime reporting mechanism. I recently traveled out of the country. After a week I got a text message stating that more than 1000bir withdrawn from my account without my knowledge. When I tried to download the receipt, it doesn't even work. I only know it was transfered to a Wegagen bank account via a POS machine. Please be carefull and take a lesson from me. 😡😡😡	1	2024-09-16	NEGATIVE	0.999108732	Bugs & Reliability, Security Concerns
a435f558-7196-4789-964f-fc9ff4f3f923	1	Very nice work	5	2024-09-15	POSITIVE	0.999864221	Bugs & Reliability
46bec6f5-1514-47fa-a6d5-a401701876af	1	Very good simple and easy app thank you very much Ethiopian commercial Bank 👍👍 🏧	5	2024-09-15	POSITIVE	0.999820650	User Interface & Experience
9c8c855a-7fd4-4bbf-9d04-337d935f2e23	1	it is good app . but i had some essue's lately, they app don't show Transaction history properly in order of date of withdrawal . You should fix that in the next Update.	3	2024-09-14	NEUTRAL	0.995930374	Bugs & Reliability, Feature Requests, Transaction Performance
85d92955-e741-413b-8a6f-4c77da65ab35	1	It is great and fast app to transfer money	5	2024-09-14	POSITIVE	0.999275029	Transaction Performance
b7e449b9-ce66-40c0-b355-cccfa93dfbc6	1	Best up Ever.	5	2024-09-14	POSITIVE	0.999854922	General Feedback
397b9b33-4c08-4651-a0bc-d5d6988b3e9c	1	Error free, user friendly best app🙏	4	2024-09-14	POSITIVE	0.557583749	Bugs & Reliability, User Interface & Experience
c3739029-ab5f-4272-92d6-7a301c78fc48	1	I really like this app as it is being updated from time to time and includes multiple payment options. In particular, giving a receipt makes it even more preferable. However, when it is refreshed, it does not show the history of credit and deposit in order and, I am of the opinion that it is better if the recent history is fixed respectively according to the transaction date in the future because there is a problem of confusion.	3	2024-09-12	NEUTRAL	0.927534997	Bugs & Reliability, Feature Requests, Transaction Performance
14630eb8-2f09-4895-90c2-ad30674082c7	1	This application is very nice mobile banking agent and various transactions can be used download and use	4	2024-09-12	POSITIVE	0.998009980	Customer Support, Transaction Performance
d892a58f-d222-48a4-b952-9281cfe668c8	1	Way to go!	5	2024-09-12	POSITIVE	0.999790847	General Feedback
6e47ad53-4426-4bb5-be30-425563ac15ab	1	If there was a lesser rating I'd have given it to this app! What's with all this service charges? With the amount they're charging for everything I'm afraid we'll be paying to even look in their direction.	1	2024-09-12	NEGATIVE	0.999318242	Transaction Performance, User Interface & Experience
0b4bb7ff-bd9c-49eb-8a0b-3de5d0da6adb	1	I hate apps and all management of cbe	1	2024-09-12	NEGATIVE	0.999479234	General Feedback
82c729b0-422b-42b2-ab5d-0ba8744c8f16	1	The fast and easy to use app there is nothing to deny aboutt that... but it has a serious issue on showing transaction history like if i send or receive money i ll find the transaction history after a day. When the sms message is not working at some days the issue get worse like we dont have an idea how much money we have received. I dont this this issue is hard to fix for you hope you will fix it on the next update....the app deserve 4stars tbh but i just want you to see this seriously thankyou	1	2024-09-11	NEGATIVE	0.981439769	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
a2098887-36b7-490c-b125-b90b7ab90fe0	1	Updet every time	5	2024-09-11	POSITIVE	0.972406089	General Feedback
4df1ef33-2596-4a62-a554-961d6a170f0c	1	When I enter values in the Amount and Remark fields and click the Continue button, I encounter an error. However, the transaction still deducts the specified amount. It is essential to test this error handling functionality.	4	2024-09-11	POSITIVE	0.989499986	Bugs & Reliability, Transaction Performance
e97a06a4-31d7-4eaf-8a34-e7b58a66aa8a	1	backward banking app	2	2024-09-11	NEGATIVE	0.997527301	General Feedback
fa982fc5-7be0-461a-a78d-c3732df6ac89	1	What a trash app! Trash! Trash! Trash! Whenever you want to use the app after once you uninstall it, or receive it from someone else, it will ask you for a new verification. Again, after you clear the cache and data, you will be required to ask a verification code from the nearby bank physically too! What a shame! Never use this app! Your account pass code is unsecure in this app. STOP using this app! I Do!	1	2024-09-10	NEGATIVE	0.999693751	Account Access Issues, Transaction Performance
a776d3d2-678b-4413-812f-81f8144ca56d	1	Not working out of Ethiopia this week mine is	1	2024-09-10	NEGATIVE	0.995984316	Bugs & Reliability
fec4e8ee-f3a4-4d38-80c9-2830df9f864d	1	Easy and safe to use	3	2024-09-10	NEUTRAL	0.999723017	Security Concerns, User Interface & Experience
5d06ff3c-589d-44bd-b57e-4d7b1ec7bac8	1	its very fast and active app	1	2024-08-03	NEGATIVE	0.998604000	Transaction Performance
ef4a0aa4-dc9d-4d96-9d38-643f80c39f62	1	I was looking for this application and finally succeeded. It's wonderful application to receive and send money with the speed of light. Thank you so much CBE. I wish you all CBE staffs happy new year. May this year be the year of peace and prosperity for all and everyone. HAPPY ETHIOPIAN NEW YEAR!!! #2017 E.C.🐦	5	2024-09-09	POSITIVE	0.999825895	App Speed & Performance, Feature Requests, Transaction Performance
6b86b404-f31a-4a78-a4c5-3d5eeba65eb7	1	this app is very good app	5	2024-09-09	POSITIVE	0.999857545	General Feedback
93f18a6f-387b-42fb-af34-1d0b88df6e82	1	The app only shows 25 transaction. The most frustrating it ever. Other banks gives you months of transactions ans statement. What a joke	1	2024-09-09	NEGATIVE	0.998511255	Feature Requests, Transaction Performance
c9a56c9d-0d11-43ea-8952-160c1254a38e	1	it's not best like abyssinya mobile bank. This not show the transaction and didn't get notification , SMS text.	3	2024-09-09	NEUTRAL	0.997605801	Feature Requests, Transaction Performance
625e79df-20d4-4b5c-9594-19619c38db3c	1	Easy to use and private.	5	2024-09-09	POSITIVE	0.998844266	User Interface & Experience
1529a428-de76-424d-b1a5-46dbccaf0363	1	please fix the recent transaction page, it's not showing recent transactions	4	2024-09-08	POSITIVE	0.999422431	Bugs & Reliability, Transaction Performance
46cdae8d-78e2-457d-9118-59233932d317	1	Why can't we transfer funds directly to another's person telebirr wallet	5	2024-09-08	POSITIVE	0.998868883	Transaction Performance
399ed8d4-4011-4f0d-a44d-e746122f7898	1	this app is so smart	5	2024-09-08	POSITIVE	0.999835730	General Feedback
a521f60d-8416-4c7a-8861-e023f5453fe5	1	Our best app	5	2024-09-07	POSITIVE	0.999811351	General Feedback
3f8e7608-65de-4a35-b2ff-84d456fe4d60	1	It is a good app overall but you need to improve some features like the recent transactions section which doesn't accurately show recent transactions.	3	2024-09-07	NEUTRAL	0.992108166	Feature Requests, Transaction Performance
f6ba25c4-7a01-43a4-b277-839d5de43519	1	It need some listed improvements below. 1. Try to desplay at lst one month transaction 2. Try to solve weekend transaction display error 3. "Failed" message after few processing	3	2024-09-07	NEUTRAL	0.999513030	Bugs & Reliability, Transaction Performance
12750621-45bb-4765-a2e4-b4bcb3d02f07	1	Very easy and interesting	5	2024-09-07	POSITIVE	0.999858260	User Interface & Experience
4c1f5a4a-fcfe-4808-9788-b67bc84471b0	1	It's the worst! I just transfer from my cbe account in to my tele birr account for urgent case but unfortunately it holds. And there customer service workers told me it will be returned in to my cbe account after 3 or 5 working days if its not credited in to my telebirr account. How's that working? This bank is a pioneer in from the country. It's really annoying this happens for second time. Please amend your network services. Am totally annoyed by cbe.	1	2024-09-07	NEGATIVE	0.999776661	Customer Support, Transaction Performance
e6bb24b9-4709-4a5c-9b14-5b47d9c6b79d	1	I loved digital bankink(Internet banking of CBE)	5	2024-09-07	POSITIVE	0.996319413	General Feedback
adb905e7-837c-4e92-b263-af561f070b3b	1	Good application to use especially it helps me while I buy and sell goods. Thanks	1	2024-09-07	NEGATIVE	0.999783933	Customer Support
8e26a489-e288-4339-87ca-2edc71f609c8	1	It is very friendly and easy to use.	5	2024-09-06	POSITIVE	0.999834299	User Interface & Experience
5e62b276-ee81-46e7-9576-83cd95bc1fd6	1	User friendly application.	5	2024-09-06	POSITIVE	0.987147391	User Interface & Experience
6eb129fd-97e1-45e2-84b1-a11a126f9a25	1	I have never such a disgusting app in my life , i swear it doesn't even work properly	1	2024-09-05	NEGATIVE	0.999763310	Bugs & Reliability
52eb6e86-7fd2-4f02-b461-9bec2568e419	1	Very good app but why all the theme is just Islamic?	5	2024-09-04	POSITIVE	0.961392939	General Feedback
8f3d5e7e-3c4e-4b11-bf42-7b56780c55c5	1	It donsnt show the new amount after there is a deposit	3	2024-09-04	NEUTRAL	0.978115022	General Feedback
164cee7d-96ce-4f42-b1a5-f5985b5b8482	1	i use this application many time it works perfectly 10Q	5	2024-09-04	POSITIVE	0.984816611	Bugs & Reliability
8542d4c5-ec4e-4720-9a82-df371badc73d	1	The CBE mobile banking app is a time-saver, but it needs several improvements, like adding fingerprint authentication. It's risky when people see me entering my PIN. Additionally, the fees are unreasonable. You could learn from Tele Birr, which adjusts fees based on the transaction amount. However, the CBEMB app charges a flat 10 birr fee for amounts between 5 and 1000 birr, which I think is unfair.	2	2024-09-04	NEGATIVE	0.998902440	Feature Requests, Transaction Performance
ffa393b8-788f-47d0-a996-4fab6dafdad8	1	Nice to meet you my bank	5	2024-09-03	POSITIVE	0.999601901	General Feedback
a41d4e45-28fb-44d2-a155-b99406e885ef	1	Fast service and reliable it works from everywhere across the globe love it	5	2024-09-03	POSITIVE	0.999866486	Bugs & Reliability, Transaction Performance
eeca77d3-a35d-4b87-80e3-bd8b6b441432	1	Very convenient and easy to use	4	2024-09-03	POSITIVE	0.999509573	User Interface & Experience
d6b63ad6-35e0-4b21-b088-d4efe490d5b1	1	I used to mobile bsnking	5	2024-09-03	POSITIVE	0.990014553	General Feedback
e085fdbe-5b50-4d66-91b0-3ed10ef0665e	1	It is very comfortable!	5	2024-09-02	POSITIVE	0.999862313	General Feedback
493fa625-9713-41c5-b919-10d50c9c2b00	1	It is the best app I like it	4	2024-09-02	POSITIVE	0.999846220	General Feedback
bd947aa8-bc85-4d54-ac5f-6920346b59c3	1	Good at all	5	2024-09-02	POSITIVE	0.999844313	General Feedback
71c4a027-0884-491c-9023-58aec1553a21	1	The app doesn't have 1. mini statement service In my opinion, I don't have to go to cbe branch to get mini statements and transactions I have done and pay for it.why? 2. Recent transaction The app doesn't store numerous or enough recent transactions, even it doesn't store what stored properly sometimes.	1	2024-09-02	NEGATIVE	0.997609973	Feature Requests, Transaction Performance
10b43bd7-287c-4b73-a9e5-34bfd6950de9	1	It's Great App 💪🏼wow which i like it z most👌🏼 but please add biometric authentication	5	2024-09-01	POSITIVE	0.999182522	Feature Requests
effdf88b-4964-496d-9c04-f86b529db315	1	I can't describe enough how helpful it was. It's best version than ever mobile banking services.	1	2024-09-01	NEGATIVE	0.999111474	Customer Support
730cccc1-d1c1-4bed-ad22-797e98f32fd0	1	Thank you, everyone	5	2024-08-31	POSITIVE	0.999855757	General Feedback
83430735-41b7-478a-b307-1472bd4a47c4	1	It says you are debited 20birr but it transfers another 10 birr with it I don't understand if it's under their rules	1	2024-08-29	NEGATIVE	0.995933831	Transaction Performance
95451f43-803f-410d-bdf3-8ec85a564127	1	This is the best transaction app	5	2024-08-29	POSITIVE	0.999640942	Transaction Performance
97d83663-2b99-491b-97a3-0703e8bb699c	1	በጣም ጥሩ ነው እናመሰግናለይ ኑራችን ቀላል ስለዳረገቹልን	5	2024-08-29	POSITIVE	0.920040667	General Feedback
b2d096d3-50f3-4f26-9fdf-9f08f5b8bf47	1	It functions to the most part until you need it. The most common flaw is when you send money to another bank account. It shows error but the money is actually gone. I paid twice at least 4 times because of this.	2	2024-08-29	NEGATIVE	0.998916745	Bugs & Reliability, Transaction Performance
cc46e4c6-cc4a-4898-8821-31866a719b87	1	Best mobile banking application,it makes it easy for any of my financial transactions	5	2024-08-28	POSITIVE	0.998369277	Transaction Performance, User Interface & Experience
81e1797d-c158-4dbe-ab30-fe1050150c06	1	This app is update not yet	5	2024-08-28	POSITIVE	0.996203959	Feature Requests
47af15ff-7988-4730-90ad-4dbc817c3ed3	1	CBE birr app	5	2024-08-28	POSITIVE	0.661762536	General Feedback
566dd3ab-3b7f-45f6-b635-190c635e5b80	1	መጣም በጣም ተመችቶኛል በተላይ ነፃ ብድር ቢኖረው	5	2024-08-28	POSITIVE	0.920040667	General Feedback
27b3f9e9-8a49-4372-aa11-8714cd8beb5e	1	It's a best application to exchange our money in a best speed and time saving way	1	2024-08-27	NEGATIVE	0.999499679	App Speed & Performance
4a58e7df-ee14-446f-b61e-49b212559209	1	How can I link with my CBEbirr wallet.	5	2024-08-27	POSITIVE	0.995787799	General Feedback
0c86faec-dcd8-434d-9042-0e936b5ad131	1	Exchange rate is not applicable or not functional,what is the reason ?	5	2024-08-27	POSITIVE	0.999694467	General Feedback
88b12cef-d37e-495a-95c3-6affe5c63b10	1	I used for more than two years although needs improvements...	5	2024-08-27	POSITIVE	0.988341987	Feature Requests
a7721fe5-89e1-42e9-a487-283e7095a6eb	1	Still needs development on several features.... For example - bank statements available online. The text feature of available balance and debited/credited notifications is very old school and involves too much digital trail. App doesn't always work, could be due to network issues in Ethiopia though. Another major issue is an error message is displayed when transferring from CBE to other banks. Ive almost lost a few thousands doing this once. Always cross check your balances.	1	2024-08-27	NEGATIVE	0.999477565	Bugs & Reliability, Feature Requests
7ab6777c-9bbb-43f0-a12b-312dd6a235a3	1	Good service at Baburehama branch	5	2024-08-27	POSITIVE	0.999500990	General Feedback
9a9898ce-1039-4c67-8533-0ff577c69ba0	1	First and best Online banking in Ethiopia	5	2024-08-26	POSITIVE	0.999754965	General Feedback
3a8db957-a214-495f-9d0e-ed8c692f495e	1	Best application! You have to upgrade additional services like help to withdraw card less amount from ATM machine.	5	2024-08-26	POSITIVE	0.922533810	Customer Support
49324219-5681-48b7-8884-8ec9ea6c6496	1	It's good app	5	2024-08-26	POSITIVE	0.999868989	General Feedback
ecfd0745-69a6-404f-a2b4-f124f50f020b	1	It is best easy to use fast and trustworthy	5	2024-08-25	POSITIVE	0.980881929	Transaction Performance, User Interface & Experience
c0704460-00b9-4ba9-85a6-5643a4bb84bd	1	Some transaction is not going to be processed accordingly. Which going to take 3-5days which is not completely right. since this bank has mass of customers. However, It should be considered as the money can be needed for emergency purposes.	2	2024-08-25	NEGATIVE	0.998584747	Transaction Performance
aa6e2e38-ad5a-473e-85c2-a7e12564128d	1	The Best Mobile Banking App In Ethiopia	5	2024-08-25	POSITIVE	0.999767959	General Feedback
227c05f4-f142-4a08-8665-9f823e222e7c	1	This app has several issues based on my experience. Below are the problems that I encountered: 1. The app frequently crashes. 2. It only shows a limited transaction record history (25 transactions). 3. You can't access the transaction records after 8:00 pm and on Sundays. 4. It displays a "payment failed" message. It would be greatly appreciated if you could address these issues	1	2024-08-25	NEGATIVE	0.999138594	Account Access Issues, Bugs & Reliability, Transaction Performance
eda1934e-59cb-46fb-a470-e68a7543de89	1	it is not well functional. It always sluggish and poor application.	1	2024-08-24	NEGATIVE	0.999824464	General Feedback
11bcc821-0619-435a-a9ce-630c9530ab36	1	በጣም ምቹና ቀልጣፋ አፓ ነው	5	2024-08-23	POSITIVE	0.883213103	General Feedback
54a6e2f8-6faa-4a6a-9a80-16bb98cac0fc	1	A useless application that doesn't work.	1	2024-08-23	NEGATIVE	0.999817193	Bugs & Reliability
2673b9c2-4b8e-44a4-8313-5ca42c11be6a	1	Can not synchronize	1	2024-08-22	NEGATIVE	0.999775350	General Feedback
04f9fa97-af1f-447f-84d0-4bc61217dd8e	1	Amazing,fast andvaluable application for 🇪🇹 citizens	5	2024-08-21	POSITIVE	0.999842167	Transaction Performance
5074f7bf-fe9c-4e25-9300-63a16dc475e4	1	It's very suitable app for using	5	2024-08-21	POSITIVE	0.999291420	General Feedback
9b73facb-1aa0-4adf-b330-95bd49dfd936	1	App needs lots of updates to accomodate more demographic for Ethiopians leaving overseas. - Ability to use user name and password to use the application. People leaving over seas if they lose their phone, they can't have access to the application again unless u got to Ethiopia and activated it on the new phone! That's rediocoulus. - This application seems like it's a transfer application, not a bank application. I should be able to do more things such as viewing bank statements and more....	3	2024-08-21	NEUTRAL	0.998806238	Account Access Issues, Feature Requests, Transaction Performance
068cfc2d-3c82-44ed-a35c-69d6a50ad5bb	1	Some time network problems	5	2024-08-21	POSITIVE	0.998739421	Bugs & Reliability
30009916-ef3d-4cc1-bb29-f45fc489b2c0	1	It is help full ilike it	5	2024-08-20	POSITIVE	0.996714950	Customer Support
ca2c93e4-3557-44ea-add9-6f9a3b2adeee	1	Why don't work	5	2024-08-20	POSITIVE	0.999389529	Bugs & Reliability
9974f373-28f4-43bb-9195-2c73042b5aa1	1	Very best app	5	2024-08-19	POSITIVE	0.999817789	General Feedback
9cf26fe1-f320-4577-8ac9-3d16f693d3dc	1	Absolutely terrible App	1	2024-08-19	NEGATIVE	0.998920202	General Feedback
059c7802-0af7-4056-9f11-90404dd047ed	1	From all commercial banks in Ethiopia this app is very easy to use and the fastest one From other banks Mobile banking app.	4	2024-08-18	POSITIVE	0.998766541	User Interface & Experience
06af2412-d00a-4792-a6f4-4a2e5ad66341	1	Recently I have been struggling accessing Cbe app with safaricom network... why???	4	2024-08-18	POSITIVE	0.999333084	General Feedback
8780aae9-8d5f-4b53-970e-44bd3f18ae46	1	It is good application	3	2024-08-17	NEUTRAL	0.999868155	General Feedback
78808a68-81fe-4034-b002-1526629aff84	1	No proper transaction is being recorded or presented on your the UI, the main features of the app is not working properly yet they have so many service in the app	1	2024-08-17	NEGATIVE	0.999653459	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
dda08bf1-6534-4f5e-af6c-02c9131bf512	1	በጣም አሪፍ እና ለአጠቃቀም ቀላል ነው	4	2024-08-17	POSITIVE	0.904695213	General Feedback
9c0a8ad4-fbe8-4dbf-b1cb-c3eef6cbe8f3	1	it was good but it has some error by connection......	5	2024-08-02	POSITIVE	0.997291505	Bugs & Reliability
931bf768-9dca-4605-9b4d-cbea3cefaf08	1	There is no option even to check your transactions. And is not users friendly.	2	2024-08-16	NEGATIVE	0.999712527	Feature Requests, Transaction Performance, User Interface & Experience
52299c1a-bfab-4302-8f8d-5d12407635e7	1	Thanks to the number of branches. Mobile banking is not very satisfactory.	1	2024-08-14	NEGATIVE	0.999679446	General Feedback
f097b726-3514-4fc5-91b5-fc8570bdd484	1	መቼም ይሻላል 889ከመዛግ በርቱ	5	2024-08-14	POSITIVE	0.861633003	General Feedback
d181a321-7fd5-4af4-a57c-692375c21d3a	1	it is not good it's like eka eka chewata	1	2024-08-14	NEGATIVE	0.999775827	General Feedback
da10703c-6d07-47eb-b008-226c84bf5f49	1	I like it this app	5	2024-08-13	POSITIVE	0.999745667	General Feedback
97b69294-9d16-4a64-9d89-d5c32f56948c	1	It is good and best app	5	2024-08-13	POSITIVE	0.999874353	General Feedback
42d599f2-eb46-42c1-9e09-2e34d32fb81f	1	Good aps 4ever,	5	2024-08-13	POSITIVE	0.999839783	General Feedback
8b8dbe7f-d505-43d2-af5b-6c3ac44ea6d5	1	To Day not working why	2	2024-08-12	NEGATIVE	0.999708116	Bugs & Reliability
55f809d9-aa65-46d2-ac79-7d44ceec9567	1	It is good app	4	2024-08-11	POSITIVE	0.999865294	General Feedback
07ddd6b6-2b1a-4180-a420-22bd52f91954	1	ለምንድነው ብር ከተላላክን በኋላ Transaction history የማያሳየን ?	1	2024-08-11	NEGATIVE	0.970748544	Transaction Performance
443e4eb3-6e93-417a-9ec1-8ee59507aa05	1	Ooo best app	5	2024-08-11	POSITIVE	0.999317169	General Feedback
5f7bc82f-6de0-4c4d-9e1f-b84362cbfb8a	1	Very fast and simple transfer app	5	2024-08-11	POSITIVE	0.995305479	Transaction Performance, User Interface & Experience
fe5db140-c043-4043-b730-ba8a93fd43e9	1	The app only work on working hour from 8 am-5pm it dont work at night or early in the morning, why do we need it then...try to fix it.	1	2024-08-10	NEGATIVE	0.998954415	Bugs & Reliability
231dd317-bcf2-40a9-bd8b-c86129191901	1	ITS So easy and fast ✔✔✔✔✔✔✔	5	2024-08-10	POSITIVE	0.998582125	Transaction Performance, User Interface & Experience
1d1c9c00-47be-4b0d-908d-11076bcadac7	1	The app is simple, fast, and convenient to use.	4	2024-08-10	POSITIVE	0.995145857	Transaction Performance, User Interface & Experience
2f7783cc-af89-468c-a31e-96a98c066983	1	Simple and well built	5	2024-08-10	POSITIVE	0.999855518	User Interface & Experience
1f6feadd-457d-4377-b5a1-138de09b8cee	1	I can't change my pin.😢	4	2024-08-10	POSITIVE	0.993884504	General Feedback
41d8c1fe-12db-4c9b-bbbf-8f1c1b3cdc09	1	My account number All contact	5	2024-08-09	POSITIVE	0.526780665	Customer Support
5c59dc04-2e54-4167-bcd8-cd4b09afd26f	1	Best up i love it	5	2024-08-09	POSITIVE	0.999866724	General Feedback
d151b6af-e148-4802-873d-22f51ddcc975	1	Very nice and attractive application	5	2024-08-09	POSITIVE	0.999876618	General Feedback
af30cc05-9337-4504-a22d-27f6ff4a7044	1	It's game changer application	5	2024-08-09	POSITIVE	0.502408803	General Feedback
af16e571-1b17-4134-8f1b-f59c36c2d2ef	1	This has so many bugs and doesn't update transaction logs in time, to make it worse it shows error message when you send money but deducts from account at same time but never lets you know that the transaction was successful. And it has very annoying greeting notification.	2	2024-08-09	NEGATIVE	0.998412967	Bugs & Reliability, Feature Requests, Transaction Performance
07d63f1b-b658-479e-8d42-af90f1f0c312	1	So simple to use and Easier than even MB	5	2024-08-09	POSITIVE	0.994645238	User Interface & Experience
98ebbf73-5549-4d14-944d-71ec002e7d19	1	Best app i really like it	5	2024-08-09	POSITIVE	0.999791205	General Feedback
afa0bb79-5f42-4425-a3af-89fd292c6eb2	1	Wow Nice App	5	2024-08-09	POSITIVE	0.999832749	General Feedback
432a8685-0851-4bc3-a2e0-a3ac170ebdd6	1	Wow absolutely best app	5	2024-08-09	POSITIVE	0.999841213	General Feedback
7a41dd76-685e-4cf3-aa7e-2af0802ffbea	1	Not wotking properly & shows payment failed but already sent z found . this is so bad for country bank app😂	1	2024-08-08	NEGATIVE	0.999792993	Transaction Performance
7901307f-49a6-4f5e-be91-06f1d3bb0209	1	በጣም አስደሳች ነው ግን transfer to own Tellbire የሚለው ላይ transfer ot other Tellbire የሚል ቢጨመር	5	2024-08-08	POSITIVE	0.991968930	Transaction Performance
f1e09147-0187-4164-8185-073079db4f4e	1	Best mobile app ever	5	2024-08-08	POSITIVE	0.999780595	General Feedback
aceb4075-9f4c-4c33-aff0-bba4cd892f94	1	very very best	5	2024-08-08	POSITIVE	0.999843359	General Feedback
4228378a-fc06-4d86-9c50-5d6f65202bfd	1	That's is really good 👍 I like CBE	5	2024-08-08	POSITIVE	0.999860764	General Feedback
0e973ff8-a007-4b25-b77b-eb225dfb2e7a	1	አንደኛ ነው ፈጣን ምቹ ቀላል ሳልነካው አልውልም #1ኛነው	5	2024-08-07	POSITIVE	0.923957765	General Feedback
a8c6ef50-f3a1-48b1-9d74-1dcb0f4dbd0d	1	Very poor and very disgusting	1	2024-08-06	NEGATIVE	0.999786556	General Feedback
6c0e7b22-a865-49d6-b64b-1dc3e5632f56	1	Ok Bankii daladalaa Itoophayaa Anii noor mobile banking barbadaa	3	2024-08-06	NEUTRAL	0.983239949	General Feedback
d47adc79-98ba-4dd0-ab7a-6175e50839ff	1	ለአጠቃቀም ቀላል የሆነ አሪፍ አፕ ነዉ።	5	2024-08-06	POSITIVE	0.920040667	General Feedback
282cd244-439b-4bb7-a235-94409263df6e	1	Best app for using and time saving	5	2024-08-06	POSITIVE	0.998132408	General Feedback
40734eb7-337d-4f0a-99eb-552fb1b5b5dc	1	So very important app very useful.	5	2024-08-06	POSITIVE	0.998357356	General Feedback
130cdc3f-0818-47d2-b126-d4c919854c38	1	Nice app but became inactive after being zippad &released ,plse solve such silly problem	5	2024-08-05	POSITIVE	0.997588754	Bugs & Reliability
85bd7bb0-391c-4434-ae93-1eddf10feb8f	1	Always says can't synchronize, while I have active internet access	1	2024-08-05	NEGATIVE	0.996930063	Account Access Issues
118fa67d-4437-43a6-a6b7-42831fd4e920	1	This app is exceptionally fantastic!! Keep updating it!!	5	2024-08-05	POSITIVE	0.999862075	General Feedback
a3bedd08-4af1-46b4-ad46-b28fbcf3edb4	1	It is my choice	5	2024-08-05	POSITIVE	0.999537230	General Feedback
999b1ba6-8e0f-44dc-b99a-308e82d73931	1	Download our app:	5	2024-08-04	POSITIVE	0.933899343	General Feedback
d9c083fe-e101-42df-b929-ebe2578fbc17	1	my mobile banking account app blocked please open Borana Zone yabello	5	2024-08-04	POSITIVE	0.994955838	General Feedback
ec1b95cc-51f7-4cac-a6b4-89338b6dd67a	1	Good app but it not allowed me to link my ac with walet	4	2024-08-03	POSITIVE	0.918276072	General Feedback
338d80d4-ed05-4809-b1c5-d784ea70c1db	1	This app is smart and simple to use.	5	2024-08-03	POSITIVE	0.999802649	User Interface & Experience
08efb129-4003-44f8-8d98-83e583d0d0c9	1	Dobuony bandak jock	5	2024-08-03	POSITIVE	0.990628541	General Feedback
54adc53c-8524-4223-8042-348cf239bcb3	1	Ow 🤞🤞🤞 cbe app mobanking	4	2024-08-02	POSITIVE	0.979102671	General Feedback
d258d22b-3f50-4409-b9a1-52fa3a8e3c2b	1	Very nice application please add additional language commercial bank of Ethiopia back bone of Ethiopian economy	5	2024-08-02	POSITIVE	0.998902440	Feature Requests
ae2f61c8-45d9-44e7-bc7d-cf7f1935ccb8	1	It is really nice application helped me a lot.	5	2024-08-02	POSITIVE	0.999713719	General Feedback
2d05a8b6-641e-43e8-bab8-fb25d68c8ebd	1	I have one year experience.	5	2024-08-02	POSITIVE	0.567027092	General Feedback
812b0948-73ad-4ea3-8ce5-0087f42b7da6	1	Easy to use and also fast	5	2024-08-01	POSITIVE	0.999565661	Transaction Performance, User Interface & Experience
7b7fdbe7-1364-407b-87d5-e58e8e9cd43a	1	All those service interruptions... , When you update it stops working and to start using an new appliance you need to go to the bank to activate it... uff...	1	2024-08-01	NEGATIVE	0.999347627	Feature Requests
d05f4fe9-add8-415f-a32f-53aa83edb947	1	Revolutionized ethiopian banking industry to another level I was amazed how it made contact my family easily	5	2024-08-01	POSITIVE	0.999269307	Customer Support
1a90499e-d237-4b99-b9b8-6ee42af37406	1	It's not appropriate for Play store	1	2024-08-01	NEGATIVE	0.999787271	General Feedback
d8de35ea-aeec-4d98-8c61-98782a599feb	1	Fast and easy but there is delayance in refreshing	5	2024-08-01	POSITIVE	0.998716116	Transaction Performance, User Interface & Experience
78a64523-a169-4295-9ddc-841dc47ec8d4	1	Not opening the account, very late	2	2024-08-01	NEGATIVE	0.997431338	General Feedback
6d92474b-3c5d-4dec-817e-d0006ddf8a8d	1	Poor app please upgrade it Example add transfering to telebirr agent	1	2024-08-01	NEGATIVE	0.999611318	Customer Support, Feature Requests
a2f99d38-7463-4bfc-84cb-3361e7322c93	1	Why not access in galaxy s7 edge??	5	2024-07-31	POSITIVE	0.999268234	Account Access Issues
5cd6a94d-f54b-4410-a619-696f47d70203	1	Hamza kamal and	3	2024-07-31	NEUTRAL	0.964377940	General Feedback
85ebf07f-69aa-4d85-b5a9-6c615b7601bb	1	very good app	5	2024-07-30	POSITIVE	0.999867558	General Feedback
35b7068a-1c8f-43ad-a21e-e2bb40aae061	1	why dont u referesh ???	5	2024-07-30	POSITIVE	0.997554719	General Feedback
19e98efc-7d85-4f2b-8cd5-d4882da64169	1	Commercial bankof ETheiopia	5	2024-07-29	POSITIVE	0.965765715	General Feedback
cef2267b-898d-4d7a-ad16-6e40faf3e445	1	Nice app and always use.	5	2024-07-29	POSITIVE	0.999791801	General Feedback
a00f87c6-7241-41ec-9a60-964929e1f013	1	Great mobile banking app	5	2024-07-29	POSITIVE	0.999607146	General Feedback
7b8f32d3-2c55-4f5e-af5d-c99076a08ed7	1	appu በጣም ቀላል ላጠቃቀም ምቹ ሆኖ አጊቼዋለው እንደአስተያየት ሚስጥር ቁጥር ስናስገባ 4 digit ያለው ቁጥር ነው ምናስገባው በተጨማሪ በአሻራ እና በ ፌስ ስካን በማድረግ ብትጨምሩ	5	2024-07-28	POSITIVE	0.955338120	General Feedback
3a5da162-8d55-4722-9a7f-4f5c0583d325	1	Very nice but network plm	5	2024-07-28	POSITIVE	0.789911032	General Feedback
86958e40-cea0-4c2a-8760-1ce16144dd98	1	Very very limited service	3	2024-07-28	NEUTRAL	0.999560297	General Feedback
504ed9bb-6cd7-4a2f-b4ed-63227422b4ff	1	Make it like telebirr, internet service fee free	3	2024-07-28	NEUTRAL	0.987825215	Transaction Performance
d9a89aef-80c7-4280-ad98-d05b3776237f	1	Thank very much	5	2024-07-28	POSITIVE	0.999816000	General Feedback
ad618f16-8b3e-4891-8f9c-aa1e016c6a30	1	Cbe mobile banking is very active. Thank you!	5	2024-07-27	POSITIVE	0.999836326	General Feedback
e6547c85-afc4-4604-9b78-ec6709f9647e	1	ምርጥ አፕልኬሽን ጊዜንም ገንዘብም የሚቆጥብ	5	2024-07-27	POSITIVE	0.883213103	General Feedback
8793bd94-26fd-4a7a-a744-764b626b132c	1	Very simple and fast	5	2024-07-27	POSITIVE	0.999798238	Transaction Performance, User Interface & Experience
95b731db-9c6b-4ec8-9bcb-58ceeba06452	1	Its the bast application in my country	5	2024-07-27	POSITIVE	0.999437988	General Feedback
5daa3768-2732-4299-b00d-2cd8b8ce3e18	1	የመተግበሪያው የይለፍ ቃል በተጨማሪ የጣት አሻራ ቢኖረው።	4	2024-07-26	POSITIVE	0.923957765	General Feedback
024a434b-bab5-4561-ae23-bbf9ba5fd7b6	1	its a disaster really	1	2024-07-26	NEGATIVE	0.999800265	General Feedback
170df244-c518-4be5-85f6-213fe4f1904b	1	It is not fast	1	2024-07-25	NEGATIVE	0.997206986	Transaction Performance
2a376427-481d-4c73-b739-6d41dcd631a9	1	Good application and Best for use	5	2024-07-25	POSITIVE	0.999814451	General Feedback
8c86ce12-fc4f-4210-a767-024d02601e8d	1	I like this app	5	2024-07-24	POSITIVE	0.999651670	General Feedback
264b6d44-62f0-4fdb-8b44-669665ba0e38	1	Nice app considering what is out in the market in Ethiopian banking it can be better regarding no. Of recent transaction to display	5	2024-07-24	POSITIVE	0.963395119	Transaction Performance
3f66937c-4fd2-45f9-993d-c30b12ffff5b	1	No safaricom network	1	2024-07-23	NEGATIVE	0.998711109	General Feedback
d47305b9-e292-45d8-a8e4-4797104c9770	1	like Commercial Bank Ethiopia	5	2024-07-23	POSITIVE	0.852113962	General Feedback
9f31ea3a-9715-456c-b497-4cbfb0801430	1	its not working properly boring app ever	1	2024-07-23	NEGATIVE	0.999745667	Bugs & Reliability
dbe36261-9bd5-41c0-a28b-f24fdad0fb1c	1	Very nice app	5	2024-07-23	POSITIVE	0.999856234	General Feedback
baa894dd-0dbc-49cb-a8b2-b9b29980f8d5	1	በጣም አሪፍ ሁሌ የሚተማመኑበት ባንክ ነው	5	2024-07-23	POSITIVE	0.904695213	General Feedback
0c3df594-893b-42cd-9070-4800ed13a7bb	1	It's fast and secure	5	2024-07-22	POSITIVE	0.999814689	Security Concerns, Transaction Performance
c1784b27-7aaf-4e69-a727-fcddc09b2259	1	Muluken mekonen abrbe	5	2024-07-22	POSITIVE	0.937232018	General Feedback
65febdf9-3754-4266-afd0-e418ac8795fd	1	Jafer Ahmed umer	5	2024-07-22	POSITIVE	0.761537492	General Feedback
4272547b-46c1-4228-b86d-9cf12618f81f	1	Very fast and efficient application.	5	2024-07-22	POSITIVE	0.999838591	App Speed & Performance, Transaction Performance
babd67ef-99bc-4fe4-aa1a-47e9537210fb	1	it's good work	5	2024-07-21	POSITIVE	0.999847174	Bugs & Reliability
1a5a9f24-ca2b-4048-8d6c-b0376fb4da6c	1	I like this app	5	2024-07-21	POSITIVE	0.999651670	General Feedback
a1f469dd-0f37-4218-ad12-ce6a44f98b66	1	This is very helpfull app. It workes for me even whil i am abroud. Good job CBE !!!	5	2024-07-21	POSITIVE	0.998415589	General Feedback
980958b0-5370-4ac5-96e4-a1874dba395c	1	ገቢ እና ወጪን ይዘላል.. አስተካክሉት	2	2024-07-21	NEGATIVE	0.923099339	General Feedback
b9d08831-9be2-483d-8aa3-eabe9e00e3c9	1	Please protect my security and protect my rewards because some body tries hack me!!	5	2024-07-20	POSITIVE	0.990803003	Security Concerns
d376c675-37fc-4faa-a0f8-c0a00edec8c0	1	I like this apps	5	2024-07-19	POSITIVE	0.999674082	General Feedback
973283c8-248e-4cec-8bfd-ca12fb1073a8	1	It was verified and important apps but some customer service officer did know how to verifying	5	2024-07-19	POSITIVE	0.607922673	Customer Support
d534ceba-f6ba-417e-a67d-26ac1e543e65	1	I have not seen anything like it in the Ethiopian banking industry. It is very easy to use, fast, and offers a wide range of services. However, I would like to suggest a future modification: currently, the app only displays transactions for one month. It would be beneficial if it could show transactions for more than one month, including yearly transactions. Please consider this request. Thank you, Commercial Bank of Ethiopia, for this innovative app.	5	2024-07-19	POSITIVE	0.987070382	Transaction Performance, User Interface & Experience
21ae54ee-3598-4ae4-a3ab-d18405de4c78	1	Why app don't work	5	2024-07-19	POSITIVE	0.999246001	Bugs & Reliability
eb410dd8-8701-41c4-bc65-f7602e1217c3	1	This app is very good. But, Sometimes it doesn't work properly by the problem of network.	4	2024-07-19	POSITIVE	0.997556090	Bugs & Reliability
78b56051-9731-42da-b727-55bb05c0838a	1	It's Nice app ever!!!	5	2024-07-19	POSITIVE	0.999811351	General Feedback
8aed9fc6-49c1-4862-b448-0d6dfcc016b2	1	Bareeda Garuu maaliifi haqaadeema nagahee duraa	5	2024-07-19	POSITIVE	0.994095206	General Feedback
e8132bf1-9bb2-4050-9f44-dddf0473c36d	1	I am Delighted to being the member of this leading Bank!	5	2024-07-18	POSITIVE	0.999878526	General Feedback
9abf762d-b011-4e2a-854a-248f4b5a5cf0	1	Maliif bakka jalqaba account bananne malee Hojiin egalchiisuun hin dandaamu?	5	2024-07-18	POSITIVE	0.991363287	General Feedback
950d2533-ea67-4331-a2d3-81fef9356412	1	No 1 banking application in Ethiopia	5	2024-07-17	POSITIVE	0.877618611	General Feedback
c2f462d6-5ec2-4c69-b0b2-1435be8252d8	1	Wenderfull I loved it so much!!!!!	5	2024-07-17	POSITIVE	0.999843955	General Feedback
a56c1bf9-d768-49a4-87ec-c2786aaa899a	1	It's good app for me	1	2024-07-16	NEGATIVE	0.999861956	General Feedback
4d5aec05-e96d-4c67-a2be-fae27744c608	1	Good service but need imrove mostly bcause some times no work	4	2024-07-16	POSITIVE	0.940773368	Bugs & Reliability
b6e1e51e-bcad-41aa-bd1f-231daab2a300	1	ABDISA MOHAMMED I can get 4hf my friend how are you feeling I hope my friend is coming up with you tomorrow at the same place you can get it done before the election results I think we need to we can do it together my friend how are things going for my friend	1	2024-07-15	NEGATIVE	0.989897728	General Feedback
746392fb-56d0-4bab-affd-50881f5e300b	1	Very poor, not connect properly, deduct money with out report	1	2024-07-15	NEGATIVE	0.999811471	General Feedback
04a30653-2673-4f32-8b2c-114c312c0a3e	1	Yesterday, system hackers have taken money out of my CBE account due to problems related with the CBE BIRR SMS and internet banking systems.You must further increase security of the system.I am willing to give further details if necessary. System hackers have unlocked the programning of cash transfer, I understood.	1	2024-07-15	NEGATIVE	0.888113558	Bugs & Reliability, Security Concerns, Transaction Performance
5c139d7f-3152-4e35-b319-6ccb28bb0cdb	1	It good.but there gambler's in using mobile banking I lose 5000birr.	5	2024-07-14	POSITIVE	0.997348189	General Feedback
97b04fa2-fb61-47b1-ba02-d97afe0a65a2	1	"get your verification code from your nearest branch" ia the first amazing dialogue your face, when you try to setup your CBE App. It is a way back system that requires you to go physically. You should have sent a verification codes either via phone number or email address. You better change this analogue system to the digital one! 😀	2	2024-07-13	NEGATIVE	0.994610429	Account Access Issues
90861e2f-14ec-43a7-a836-285ad6e99583	1	unable to access my account in the US.	1	2024-07-13	NEGATIVE	0.999797881	Account Access Issues
7446a95f-8bd9-40a0-98dc-cf751f5c8265	1	It is easy to use.	5	2024-07-13	POSITIVE	0.999345362	User Interface & Experience
f692e7d7-eeb9-413a-95e1-4e06558a7b1b	1	about inactive solutions want be!!!	1	2024-07-13	NEGATIVE	0.995563269	General Feedback
cee638ff-4f01-436e-ac4a-5c96985d2fe6	1	አረ ወጪ ገቢዬን በስርአት አሳዪኝ 🙏🙏🙏 ሂሳቦች ብሎ የሚያመጣው የተዘበራረቀ	3	2024-07-12	NEUTRAL	0.932232678	General Feedback
f4086a18-4d8d-4233-8b73-95b4cae1c849	1	Its easy and comfortable thanks	5	2024-07-12	POSITIVE	0.999870181	User Interface & Experience
ba01ca22-a889-4b83-9abc-10239f2115c0	1	it a great app and it really made ma day	5	2024-07-11	POSITIVE	0.999787867	General Feedback
66e5368c-41ee-47c0-aad5-f38bc26f25a0	1	its goid app	5	2024-07-11	POSITIVE	0.934706748	General Feedback
2143e060-1339-4352-94bc-ac4a2aa29a25	1	Best application for transition	5	2024-07-11	POSITIVE	0.999447525	General Feedback
48c95df2-6dc5-4ecf-b0fe-fa8d67d6a550	1	I like all service	1	2024-07-10	NEGATIVE	0.999650240	General Feedback
3fddc7ae-e343-4e4b-95dc-55391697d9b7	1	ከፒን ይልቅ በአሻራ እንዲከፈት ማረግ አለባቹሁ።	1	2024-07-10	NEGATIVE	0.920040667	General Feedback
077eecef-6133-4b94-bd1b-4431fe021fe0	1	Good app compared with other bank app	5	2024-07-10	POSITIVE	0.999624848	General Feedback
5e450738-69d8-4a3e-ab70-1f531e091d9f	1	Proud to be CBE's Customer	5	2024-07-10	POSITIVE	0.999865770	General Feedback
0b800f92-778f-4e8c-8ab4-928c9453e5af	1	Very interesting application and very useful .	5	2024-07-09	POSITIVE	0.999872684	General Feedback
ed0dccaf-504e-4fb8-b6ee-f240ea59a153	1	Too best to did	5	2024-07-08	POSITIVE	0.974347174	General Feedback
69936c31-268e-400b-aef1-8fc52cdd52ec	1	Very good app, but why we don't see the statements?	4	2024-07-08	POSITIVE	0.675876319	Feature Requests
73dbd944-956a-4128-ac97-8d0d9c0e1101	1	Good and comfortable	5	2024-07-07	POSITIVE	0.999859810	General Feedback
4aa81cd1-d7ea-4102-b181-172aefdf787b	1	ሃሪፈ አብሌኬሺን ሰለሆነ ይጠቀሙ	5	2024-07-07	POSITIVE	0.861633003	General Feedback
715f6783-5f1f-4f89-aaf1-7ca1b91ab9eb	1	Very faster than ussd mode	5	2024-07-06	POSITIVE	0.998830020	General Feedback
41064219-5dec-4181-9239-a4bcccebe7f8	1	could not see balance and account to account t not working	3	2024-07-06	NEUTRAL	0.999393702	Bugs & Reliability
cfabf7fe-5489-4a45-a7d3-88158af74255	1	A life Time	2	2024-07-06	NEGATIVE	0.998806596	General Feedback
ee1efa6b-adb9-4ba4-9a1b-b3a94c063235	1	It is stable and safe.	5	2024-07-06	POSITIVE	0.999832153	Bugs & Reliability, Security Concerns
d870cada-6c54-44e0-ab11-a30489dcb1a9	1	I don't agreed what you are doing on my account regarding of commission payment of this apk. bcz I'm paying for transfer to other so why commission pyt is necessary or tell us and we can go to other banks if your users more bigger than you think 🙄 Is it 5birr is balance pls diminish it	1	2024-07-05	NEGATIVE	0.999396801	Transaction Performance
5e8337d7-6900-40b4-8982-49535595813e	1	this is good app	5	2024-07-05	POSITIVE	0.999861598	General Feedback
2dc330a0-bc21-4bdf-a6dd-60d5d94a04d6	1	It is really a great app.	5	2024-07-05	POSITIVE	0.999856830	General Feedback
0c10be4a-3631-4353-8160-e02fb09e3ec4	1	Very stupid service bank	1	2024-07-05	NEGATIVE	0.999767840	General Feedback
bab2e29a-a968-4a9f-b921-2de12359af33	1	Splendid, fast and accurate service	5	2024-07-05	POSITIVE	0.999877095	Transaction Performance
6c28b0c6-ddaf-4763-8abb-b0555db2ed21	1	the best one❤	5	2024-07-04	POSITIVE	0.999837160	General Feedback
a2de2cf7-b953-4e62-bc11-ebb7fec28248	1	Its very nice app	5	2024-07-04	POSITIVE	0.999856353	General Feedback
2107cfaf-eccb-4529-a183-082bacb8b1e9	1	CBE The Ethiopian Nations Bank.	5	2024-07-04	POSITIVE	0.985297740	General Feedback
53a69daf-0e98-4403-b108-c5563412c388	1	Perfect & good too work at	5	2024-07-03	POSITIVE	0.999835968	Bugs & Reliability
8ffc9848-15f7-49ca-a5f1-069a8fdac814	1	Fast and user friendly app	5	2024-07-03	POSITIVE	0.999084830	Transaction Performance, User Interface & Experience
8020a5fc-a3eb-4f4e-ad75-962b7e1c71a1	1	Really great banking app	5	2024-07-03	POSITIVE	0.999807656	General Feedback
a50476f0-7979-4194-85bb-3687f3f28de4	1	That is the trusted bank In Ethiopia 🇪🇹	5	2024-07-02	POSITIVE	0.998920202	General Feedback
2e59e125-a727-45ee-a63b-476fea472321	1	Very nice app i never seen such flexible	3	2024-07-02	NEUTRAL	0.999734938	General Feedback
0a660d39-0aa9-4ee4-a673-eed8a44ac5df	1	no network for today why	1	2024-07-02	NEGATIVE	0.999438107	General Feedback
ce51505a-bc18-4bb4-985b-69282db6deb1	1	Poor application. Let me list down if you could update the main features. It say error while the money has already sent. We can't get the transaction record (it has limited date) or somtimes the listed record transactions and the details are not the same while we enter to see further details. So if you can, try to see telebirr application and how much simple it is then try to update frequently.	1	2024-07-02	NEGATIVE	0.999649882	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
aa7a7922-0fc5-4bbf-b79c-7a71814e0e40	1	Easy and fast to use this apps. Only you have to add to transfer others telebirr! Thanks CBE	5	2024-07-01	POSITIVE	0.994216681	Feature Requests, Transaction Performance, User Interface & Experience
78640cfd-0a8f-4e01-b8d9-ce2436f889f0	1	Easy to use and well functioning with limited Internet access. Fantastic app.	5	2024-07-01	POSITIVE	0.996076643	Account Access Issues, User Interface & Experience
7c58e5b1-e348-4bbb-b994-8ea7a3961809	1	CBE mobail Banking is very good.	5	2024-07-01	POSITIVE	0.999852180	General Feedback
f100a66a-d4a2-4c98-9786-e050fd9bb75c	1	It is a good app	4	2024-07-01	POSITIVE	0.999864340	General Feedback
db27168e-db19-4a9e-bc07-a3b60da60b63	1	It's essentially for an easy life.	3	2024-07-01	NEUTRAL	0.948891163	User Interface & Experience
c061a4fe-fffc-4b10-a653-6792d3ecf0e0	1	It's the best in Ethiopia	5	2024-06-30	POSITIVE	0.999863505	General Feedback
d084ca00-015b-4a9e-92a8-a7c11fb028bd	1	Very good app & constant ever	5	2024-06-30	POSITIVE	0.999853373	General Feedback
82039186-e2a9-4e96-9a42-823937c61cf1	1	The best one	5	2024-06-30	POSITIVE	0.999837160	General Feedback
4d5ecbd3-2463-4314-ae61-efd23b6501aa	1	The screen shot doesn't work.	2	2024-06-30	NEGATIVE	0.999796689	Bugs & Reliability
5ef463a1-bf5a-432b-a225-963e8ae5618d	1	It is greatly helpful if upgraded to work offline like *889#.	5	2024-06-30	POSITIVE	0.993212342	Bugs & Reliability, Customer Support
413b5185-40f7-4acf-b23a-466f9f3315e6	1	i am tesfalegn	4	2024-06-29	POSITIVE	0.769372046	General Feedback
c9ba6512-6b54-4022-a8aa-4ec1335c6c24	1	Taliilaa gutaa Dhugoo xiqii	5	2024-06-29	POSITIVE	0.982524216	General Feedback
79870020-2f02-4635-ba0e-769d68530f6b	1	Wow amazing to this app	5	2024-06-28	POSITIVE	0.999850631	General Feedback
b2b21a89-0076-440c-a4e8-dd204ffaac52	1	This is a scammer bank how could you guys take 53 bir for 20k transfer illegal!!! Not deserve 2 star even	1	2024-06-28	NEGATIVE	0.999211431	Transaction Performance
b5999de4-7fdf-4ea1-b005-2b293d983f09	1	Its good aplication make it easy my money transfer and make it more secure	5	2024-06-27	POSITIVE	0.997943223	Security Concerns, Transaction Performance, User Interface & Experience
8a354352-2105-4fe9-8520-2a42025568db	1	It is best, recommend you guys to use.	5	2024-06-27	POSITIVE	0.999405861	General Feedback
ad895cf8-21c3-470d-bb5c-fb9cd9300cf7	1	Woow its good app for All banking service	5	2024-06-27	POSITIVE	0.992842317	General Feedback
7b6ceadc-9ddb-4e4c-9dbb-837288949a8f	1	Muhammad Kadire Mahamad	5	2024-06-26	POSITIVE	0.947390556	General Feedback
9748a9d6-a6c8-4454-842e-14df289ad90c	1	I says thanks	1	2024-06-26	NEGATIVE	0.999805033	General Feedback
bb33b8a7-24fd-4e9b-9c78-09de5220fb71	1	Really satisfying app	5	2024-06-26	POSITIVE	0.999865651	General Feedback
bb741a01-14e1-4725-b20b-3dbab92d7d91	1	The Best Mobile Banking App	5	2024-06-26	POSITIVE	0.999827862	General Feedback
3a714e33-9586-4395-8a93-9c78e782f708	1	The app is very nice to use but why you guys are cutting 10birr for each transaction to telebirr? Please, consider all market segments, there are students and labour workers. We all are not that rich 10birr+ service fee to be cut. CBE please, consider these thing.	3	2024-06-25	NEUTRAL	0.993488789	Transaction Performance
37a733e7-9c7c-4f1f-8c22-15f37a585f5b	1	Good job. Invest and invent more!	5	2024-06-25	POSITIVE	0.999867797	General Feedback
8e93bf80-2d2c-4ced-8127-e93c28c07076	1	Nice one of and to be able skills in a good time for me and the first half of all time taking	5	2024-06-25	POSITIVE	0.999867201	General Feedback
3911766e-4b18-4967-9f00-c97f9b1155fa	1	couldn't view receipt & can not get help, no telephone contacts. etches	2	2024-06-25	NEGATIVE	0.995409071	Customer Support
0b87c262-544c-49b8-b3f0-a782d9aa69b7	1	I didn't like the topup system writings of phone number part	3	2024-06-24	NEUTRAL	0.998149991	General Feedback
f3430d6e-c082-4c6f-bbe7-33bf148b1ccf	1	Nice app !!but not tomuch	4	2024-06-24	POSITIVE	0.926315546	General Feedback
85d2138b-1e11-4e01-892f-8646781f9a43	1	More or less it is Good Application.Go Ahead.	5	2024-06-24	POSITIVE	0.999605238	General Feedback
ff701e35-e3c8-47df-af4d-5cb05a026ad3	1	Best App but it doesn't show me the debited birr and the right balance	5	2024-05-30	POSITIVE	0.996763349	General Feedback
2fe2542d-d86d-44cf-9602-5ed2c192f1aa	1	Something else to eat it	3	2024-05-30	NEUTRAL	0.997750103	General Feedback
4a9f70ce-5669-4e74-805d-d60b3b94c53f	1	very good app but the transaction and deposit day some times wrong!	5	2024-05-30	POSITIVE	0.998180151	Transaction Performance
b0e8053d-1718-43cf-ae6f-d8871975055a	1	ጥሩ ነው ነገር ግን አብዛኛውን ጊዜ Transaction History አይመዘግብም አልፎ አልፎ አንዳንድ ቢያስቀምጥ እንኳ Order/በቅድምተከተል አይቀመጥም በተጨማሪ Message ያልደረም ከሆነ በጠም አስቸጋሪ ከመሆኑም በላይ በስራችን ላይ ጫና እያደረሰብን ነው ከደንበኞች በቀላሉ መገበያየት አስቻጋሪ ነው እና ይህ ይስተካከል እንላለን !!	2	2024-06-23	NEGATIVE	0.934754789	Transaction Performance
12704c1c-c501-458d-bc2b-f4b77b148b41	1	I dont know when it works and dont but its not working more than working	1	2024-06-22	NEGATIVE	0.999312401	Bugs & Reliability
6d7df08a-250e-4ed0-b671-f43463e0ab58	1	Cbe mobile app number one	5	2024-06-21	POSITIVE	0.988145947	General Feedback
6288ab36-97a4-440e-9ba5-1f60dde32c0a	1	It nice app,but it's not working using wifi ,if you can try to fix .	5	2024-06-21	POSITIVE	0.874314487	Bugs & Reliability
48d897e5-54fc-4a9d-bc28-8913d64f11ee	1	Fast an easy to use	5	2024-06-21	POSITIVE	0.999399185	Transaction Performance, User Interface & Experience
cf1b33eb-e77b-416d-afb9-43d91d1e88fe	1	እ. ብ. ጥ. ነው	5	2024-06-20	POSITIVE	0.948600829	General Feedback
f21e3ade-476a-4de1-b31c-5a5b94e12717	1	Keep walking with technology	5	2024-06-19	POSITIVE	0.999684811	General Feedback
d7498759-061c-4603-a763-b44208ecf483	1	ፈጣን እና ምቹ	5	2024-06-19	POSITIVE	0.833725393	General Feedback
b50222c5-1792-40f4-9173-18695406b097	1	CBE mobile banking now becoming the best.	5	2024-06-19	POSITIVE	0.999601424	General Feedback
aa4132a3-1c7d-4d9d-9d00-c7a87f1f3127	1	What a nice app for business man thanks CBE	5	2024-06-18	POSITIVE	0.999759138	General Feedback
52c230e0-a6ef-4c79-b92c-f5b6cef065cd	1	There is a glitch regarding the transaction history. Recent transaction history are browsed almost after a day. Which makes it very inconvenient for the users.	2	2024-06-16	NEGATIVE	0.998352647	Bugs & Reliability, Transaction Performance
2c36d38c-3ab9-4877-bb4f-0c339837a996	1	It is user friendly app	5	2024-06-16	POSITIVE	0.994658172	User Interface & Experience
d1e8dee7-4a1c-486d-b05c-68f0fc744621	1	Very good application	5	2024-06-15	POSITIVE	0.999868751	General Feedback
36e6a118-1ac5-4362-819f-b546a771db8a	1	One of the poorest app for 2 main reasons 1-works only with internet connection 2-Even with best internet acess, it usally says failed synchronization .	1	2024-06-15	NEGATIVE	0.999754488	Bugs & Reliability, Transaction Performance
ddce33f4-e264-4374-8206-106e112cc880	1	Wow this App 👏 👌	5	2024-06-15	POSITIVE	0.999583781	General Feedback
c5942c37-93d2-4bcd-9677-ce57cd34cfd8	1	Fast and secure	5	2024-06-14	POSITIVE	0.999838829	Security Concerns, Transaction Performance
3005d334-b43d-4542-aad8-b0ed54a3e25b	1	Fast, user-friendly, easy-to-use	5	2024-06-14	POSITIVE	0.973986745	Transaction Performance, User Interface & Experience
a5766bb4-fba8-47b5-bb80-b6291bc7a26d	1	It's not so much fast	1	2024-06-14	NEGATIVE	0.999778926	Transaction Performance
77719e8b-9e23-41a5-b212-6625b94ca492	1	app bayyee si'atafi baredadha	5	2024-06-13	POSITIVE	0.781543195	General Feedback
dcef3a10-c370-45bc-8aea-1c4e0073ed75	1	ከሃገር ውጭ ላለው ዜጋ በምን አይነት መልኩ አካውንት ሊከፍት ይችላል	5	2024-06-13	POSITIVE	0.936667919	General Feedback
151069cb-49a3-4d22-b156-c71fac0692ed	1	Really very comfortable application!	5	2024-06-13	POSITIVE	0.999798238	General Feedback
476bcde6-a7c3-4f20-b7f2-4cd30d47dbe3	1	Great and simple to use.	5	2024-06-12	POSITIVE	0.999879241	User Interface & Experience
6c5f60df-7df5-4fe3-94da-55a2b76a8ac3	1	The worst app	1	2024-06-12	NEGATIVE	0.999796927	General Feedback
0d1201bc-a6b4-458e-91c7-616ec9cf7a79	1	It was ok but resently it has become unuseable to say the list. It does not sincronise and I have not been able to make use of it.	1	2024-06-10	NEGATIVE	0.995366693	General Feedback
a871ca50-e87e-44c3-ae4c-198683a50eb9	1	Improve the transaction history it misleading when you don't update the transaction correctly, and make it record the monthly Fee that deducted from our account, at this point the messages are more reliable	3	2024-06-08	NEUTRAL	0.994345069	Bugs & Reliability, Feature Requests, Transaction Performance
296257f0-8a67-43c6-baa3-37bf56d00598	1	This so good! But some time it's not work.!	3	2024-06-08	NEUTRAL	0.991242170	Bugs & Reliability
56fbda3e-786a-4d7f-86e5-1909464c4bdd	1	It's the worst app ever	1	2024-06-08	NEGATIVE	0.999796450	General Feedback
832266cf-1213-4614-a216-35f6b5039575	1	lelisa sabsibe photo	5	2024-06-07	POSITIVE	0.810191512	General Feedback
87b56567-f201-46b8-9948-1fbc9ea91aa6	1	I S I N J A A L A T A M T O T A	5	2024-06-06	POSITIVE	0.647720158	General Feedback
5126275a-49a1-4b3e-abae-b43a6afab7b6	1	Fast and reliable service	5	2024-06-05	POSITIVE	0.999779999	Bugs & Reliability, Transaction Performance
1fea5a12-2c83-43be-9146-69f73bce0047	1	fast and very easy to use.	5	2024-06-05	POSITIVE	0.999647379	Transaction Performance, User Interface & Experience
a9bb3cf9-4831-4468-ade1-dfa3333e7dd3	1	አንጋፋውና የአገሪቱ ዋልታ የኢትዮጵያ ንግድ ባንክ ችግሮቹን እየፈቻ ወደፊት እንደሚገሰግስ ባለሙሉ ቸስፋ ነኝ ክብር ለሚገባው ክብር እንስጥ	5	2024-06-05	POSITIVE	0.958290517	General Feedback
d3643483-db6c-4fee-82f5-9e51139de8a4	1	Recent transactions are all mixed up Rtgs doesn't show up for confirmation or in texts	1	2024-06-04	NEGATIVE	0.999543607	Transaction Performance
2bf0d3ef-d035-4cb6-aa57-4bbc3486f5f3	1	Jamsi for make	5	2024-06-04	POSITIVE	0.892008245	General Feedback
c1055227-acde-4757-8a37-e4f8b621ec6c	1	Nice but please active always.	4	2024-06-03	POSITIVE	0.999749839	General Feedback
6d383345-3500-40f0-93a8-a5985f5e38c8	1	Nuradin mahamad abdala	4	2024-06-03	POSITIVE	0.968999803	General Feedback
1d9e2361-54c6-4813-be26-a3a5d8ff764b	1	Its good i like it	5	2024-06-03	POSITIVE	0.999848843	General Feedback
ed0bac68-2b18-4983-adb9-d8799662094a	1	Best apk ever	5	2024-06-02	POSITIVE	0.999841332	General Feedback
3d495514-cd0d-40f5-b3e7-bbfe295b0059	1	This application is very useful and incredible especially by it's speed.	5	2024-05-31	POSITIVE	0.999877453	App Speed & Performance
295d504c-6d2f-49d8-ab38-b2fc6b4f0e37	1	it said "None available"	1	2024-05-31	NEGATIVE	0.998932898	General Feedback
526f011d-b8bf-4f22-b5c9-064f4db91049	1	it's very good and fast application sometimes there is a little bit of congestion,fix it.	5	2024-05-31	POSITIVE	0.998535991	Bugs & Reliability, Transaction Performance
8eccbde1-2b1b-4626-8def-09bcd35b0d5c	1	If It fails, you become the richest person over night. 😊	5	2024-05-30	POSITIVE	0.935742021	General Feedback
d4efaecb-2afe-48b6-98bb-5cae57967825	1	This app is more relable and good to use .	4	2024-05-30	POSITIVE	0.995661795	General Feedback
62cee09c-e419-4ce0-ad0c-54c8af7d91fc	1	very fast and secured app for my money	5	2024-05-29	POSITIVE	0.990083039	Transaction Performance
108cd3ef-c814-453f-9c61-a99125c629a3	1	Best and easy	5	2024-05-29	POSITIVE	0.999844193	User Interface & Experience
297a1d51-10e4-4da9-a638-c1db5e7f16fc	1	Shek Usmail Ahmad	5	2024-05-28	POSITIVE	0.913401961	General Feedback
05a1c5c2-11c1-4c17-92c3-b42703565be5	1	Easy to use and a lot of functionalities! Keep your eyes on two things: 1. The transactions shown in the Recent section are messed up (every time I refresh it it shows different output of order and messed transaction list) 2. What if we can transfer to other Telebirr number Finally the transaction fee for transfers made other than CBE acc is expensive.	4	2024-05-28	POSITIVE	0.999255955	Transaction Performance, User Interface & Experience
b0bae522-4373-4192-841f-61ff6544088a	1	ይህ አፕ በጣም አጋዥ ስራን ሚያፋጥን ነው ግን ያለፈውን ሙሉ ታሪክ አያሳይም	5	2024-05-26	POSITIVE	0.948979199	General Feedback
f3fd9007-1ae7-4d94-a233-896eff79b9b3	1	the app not fast enough	5	2024-05-26	POSITIVE	0.999007165	Transaction Performance
8283b997-51ed-480c-9806-7ce5d5b2995b	1	It make's life simple and easy keep it up!	5	2024-05-25	POSITIVE	0.999857903	User Interface & Experience
bb2c2583-a6c5-4e1f-a10b-ff7104c63411	1	I wish your help	5	2024-05-25	POSITIVE	0.528645158	Customer Support, Feature Requests
76182fb2-b8ad-4ee6-a036-b10a6fcd195c	1	Bad and bad application	1	2024-05-24	NEGATIVE	0.999783576	General Feedback
05f252db-f76d-4b6b-928b-9a0428af5f2c	1	Yaaa ,a nice app	5	2024-05-24	POSITIVE	0.999541998	General Feedback
53821851-0ba0-4d57-aca0-415a06966cb1	1	Daily internal account to account transfer must be amended since its internal transactions	4	2024-05-24	POSITIVE	0.985699236	Transaction Performance
6aa3b96a-1a30-4ef3-be81-f318b3557b48	1	Very Good Service	5	2024-05-24	POSITIVE	0.999864817	General Feedback
adaf4294-222f-4d4d-ab37-a20b2837cffd	1	Why is it not working well it is not even showing me the money I have	5	2024-05-23	POSITIVE	0.999791682	Bugs & Reliability
06046afa-43be-46c5-a1a8-a41ef17bff61	1	This app is not working other bank	2	2024-05-22	NEGATIVE	0.999547303	Bugs & Reliability
cf7dec08-7e06-43d5-8262-058c3e2f0691	1	Applicationu arf new gn andande yaschegiral ahuninm hizbu benante bedemb eskireka mesrat new plus be meskot yemiseru serategnoch ke lela bank sinetsatser le dembegna kibir yelachewm endefelegut new yemiaerut +telebirr only own telebirr bicha bayhon le leloch yeminilikibet amarach bifeter...Thanks	4	2024-05-22	POSITIVE	0.962106884	General Feedback
67aea06f-8132-4d8e-98c4-58aba268e80b	1	there is no statement or transaction history its basic thing	5	2024-05-21	POSITIVE	0.999464691	Feature Requests, Transaction Performance
ebd1406c-b076-4682-971d-ef1880a736a0	1	Is excellent i ever seen	5	2024-05-21	POSITIVE	0.999875665	General Feedback
6cef62f3-8d9d-4ecc-855c-60cfb8bc7346	1	Best financial app	5	2024-05-20	POSITIVE	0.999714077	General Feedback
0c4cc5a6-a66c-4706-916e-0dd0ae42f8f4	1	Can got 0 ⭐ Please ! this App is completely Scam Becouse I made payment in other bank option in the App but the APP (-) mY BALANCE BUT NO successful notification to get screen shoot, no SMS and no Transaction history and I alerdy lost my mony becous my clint also does not get the mony i sent! I pay but I didn't got mony! stey away frim CBE	1	2024-05-19	NEGATIVE	0.999365985	Feature Requests, Transaction Performance
6c751c93-2de4-47bf-9b34-8e3ed43ead15	1	It is nice app, but I couldn't see back transactions, it is restricted for recent transactions only.	3	2024-05-19	NEUTRAL	0.864239693	Transaction Performance
c7e4ddb9-83e8-4ce8-9d26-fbbcff59718b	1	I like this application and It's very useful	1	2024-05-19	NEGATIVE	0.999823749	General Feedback
11fa586b-16bc-4fb3-b99b-74aeb4139f72	1	The app is functional with some failures, need much work on the user experience.	3	2024-05-19	NEUTRAL	0.986299098	Bugs & Reliability
91323cb3-0dc5-49e1-a417-ccbc2e0aff18	1	I am a business man i use this app long time, but it is very poor there is no filter to search the transactions of one Acc. If want to now how many times i send or receive.	1	2024-05-19	NEGATIVE	0.998658657	Transaction Performance
16e652b3-2da6-47d2-8de4-83cdcbdce14a	1	The app doesn't support amharic characters For writing payment reason. It suppose to support writing in amharic(geez) alphabet	2	2024-05-18	NEGATIVE	0.999320865	Customer Support, Transaction Performance
ddaf6f30-7010-4d7b-89c1-cceb2a6915a0	1	It is a good app. It only requires the account holder to use it regularly. It will be better if you make it available every time the user needs it whether he uses it regularly or not. Why is it closed?	5	2024-05-18	POSITIVE	0.995802581	Feature Requests
2099b341-2d62-475b-aa31-0047a62f0a81	1	Simple, fast and secure	5	2024-05-17	POSITIVE	0.999781430	Security Concerns, Transaction Performance, User Interface & Experience
d882ad7e-cb0f-4921-bb98-daf6275a2d98	1	It is helpful app which can be used easily but one important thing, when you send or receive a money it does not appear the hour and the minutes. You don't know if it is afternoon or morning. It is better the receipt to have date and time.	4	2024-05-17	POSITIVE	0.992667615	Customer Support, Transaction Performance
97513cf9-2d7f-487d-9aed-ea3b55ed42fe	1	I Like the Apps	5	2024-05-17	POSITIVE	0.999478757	General Feedback
013a7efd-d834-4143-b89e-09cdc5b461cf	1	Very good apps. Thus help other for thier problem.	5	2024-05-17	POSITIVE	0.998161614	Bugs & Reliability, Customer Support
1e4c9ffb-6bf3-4381-af3e-f7f3faaacd2b	1	It's very interesting	4	2024-05-17	POSITIVE	0.999881268	General Feedback
7adf2d4c-1215-4ce6-a5d3-42a3b7bf7877	1	Cbe provides a greatest mobile banking service in Ethiopia.	4	2024-05-17	POSITIVE	0.999565303	General Feedback
bd4fc90a-a24f-4d6c-a6eb-3a0258faa30b	1	Bast app I know I don't forget this app in my bank account	5	2024-05-16	POSITIVE	0.999166727	General Feedback
b01b33df-f52a-4f3f-9271-02d9bfc8c0b1	1	Short and Great app	5	2024-05-15	POSITIVE	0.998877943	General Feedback
9a6fe90d-3dd9-4c49-9faa-51d87ccd117e	1	Ilove this app easy use	5	2024-05-15	POSITIVE	0.855781496	User Interface & Experience
b9b2a892-624c-49f1-a807-9c88220a6098	1	Recent service fee change is ridiculous. Plus making transfer to other banks and Telebirr wallet is even crazier. You suppose to be an exemplary institution, but you are doing the opposite.	2	2024-05-14	NEGATIVE	0.991095304	Transaction Performance
6e43d68e-2f22-429e-b6f2-259f0d849b21	1	Hulem yemitemamenibet bank new	5	2024-05-14	POSITIVE	0.568940520	General Feedback
6350fa8a-0699-439b-beb2-87ca85064da5	1	Best of best apk	5	2024-05-13	POSITIVE	0.999712527	General Feedback
17d9b739-4293-4fc3-ba2c-cfb2be184a69	1	Best App but how can i use more two or more CBE app in one app.	5	2024-05-13	POSITIVE	0.991833091	General Feedback
cea2316a-6008-45b8-88cf-97283cfa3b51	1	This app have no fingerprints unlock and have problem with safaricom topup	1	2024-05-13	NEGATIVE	0.999094129	Bugs & Reliability, Feature Requests
422b4547-c045-47ca-aec9-84191286a6d7	1	Amazing, very friendly and awesome application. Only one drwaback is that you are not willy to make it active after blocking the mobile banking via 951. I am not still using once blocked. You send me to the branch banks but they don't have enough skill to help.	5	2024-05-12	POSITIVE	0.777181804	Customer Support, Transaction Performance
8a9453e3-602f-4509-8582-102d4fc66dcf	1	Good app but it fail to send on time the commission money is unnecessary and also their are some bug like recent transaction page don't show the recent one ...... Try to improve it's back system as a bank system people want it in different situations so it has to work every time as could as possible if you don't get it when you want why we use mobile banking not branch service as I conclusion personally I like the bank because it is CBE but not their digital banking system Thanks	2	2024-05-12	NEGATIVE	0.997878432	Bugs & Reliability, Transaction Performance
c1a8fb10-1ce3-486b-97fe-16c1366658ca	1	Amazing App. But sometimes the app won't show the account balance. It says "no accounts available"	5	2024-05-12	POSITIVE	0.989594698	General Feedback
d5acb304-6696-4449-9e2e-0f65df9bfdbc	1	አሪፍ ነው አፑ ግን አዘምኑት ከ ፒን ውጪ የጣት አሻራ ቢኖረው አሪፍ ነው	5	2024-05-12	POSITIVE	0.951026678	General Feedback
1305b654-d1c5-4d0e-b43b-8220a966d8cc	1	Best prgresive app, and good fetures	5	2024-05-12	POSITIVE	0.999345243	General Feedback
c8b96e00-5aae-41d5-8bd3-943e52d7ef2a	1	I am comfortable	5	2024-05-11	POSITIVE	0.999862909	General Feedback
d26e3692-2643-4ba9-9900-a480e8b1b59c	1	It's fantastic app	4	2024-05-11	POSITIVE	0.999877095	General Feedback
67219e87-9532-4540-a1fc-7dda3729346b	1	One of the best bank	5	2024-05-11	POSITIVE	0.999859095	General Feedback
b107e855-4cf2-4eee-89be-b83093ab7802	1	This app is very nice, it eases complicated services. The only thing the developer to modify is the app doesn't show recent credit as soon as the credit seen by text message	5	2024-05-10	POSITIVE	0.868905663	General Feedback
f77f8833-643c-414b-b7c8-2edc1e361120	1	Good content but some times sent money but on pending	4	2024-05-10	POSITIVE	0.895777404	Transaction Performance
f2dc8749-0618-4233-8488-f8b24b9e1a2a	1	It is a very weak app it does not even show transaction history. If there are 3 transactions in a day it shows two and does not show the rest.	1	2024-05-09	NEGATIVE	0.999781668	Transaction Performance
240e6026-c48b-4bfb-886d-5a438e696569	1	It is very important apk.	5	2024-05-09	POSITIVE	0.998975158	General Feedback
1ad5f823-b56d-4544-89fd-d6f8841e1581	1	It is amazing app	5	2024-05-09	POSITIVE	0.999878407	General Feedback
e021adde-d38d-4abe-9653-fd325d820896	1	Itis excellent application i ever seen i Ethiopia! But if biometric is added it more usable ! Thank you!	5	2024-05-09	POSITIVE	0.999639273	Feature Requests
799e768c-d7fc-4185-84e3-2be527adcc1b	1	Very huge and amazing banking sistem	5	2024-05-09	POSITIVE	0.999842286	General Feedback
02c731c0-ac37-4812-9fc4-bba66703bd21	1	CBE juneydi alii	5	2024-05-08	POSITIVE	0.965205431	General Feedback
9ebfb30b-89ef-4e58-8ef1-a4fc35c7267b	1	When pressing the download screen shot it downloads it two times please fix it	3	2024-05-08	NEUTRAL	0.974973202	Bugs & Reliability
971aa03b-ca4d-4977-ada2-e7b6d1a852b9	1	It is gode	5	2024-05-08	POSITIVE	0.511824250	General Feedback
720e9d52-e940-4bd5-9e2f-8343b9214cf5	1	Asitemamagn yebank agar	5	2024-05-08	POSITIVE	0.847843468	General Feedback
2393882f-e4eb-4d6e-8174-5e8d2274f731	1	Try to make simple more and more to fit with the need of customer's And try to make secure even if the customer use the app incorrectly ok thank you	5	2024-05-07	POSITIVE	0.984220624	Security Concerns, User Interface & Experience
e65e1463-59c1-4fa2-99c8-8c7b8d54fb8d	1	I Was a customor of comricial bank of ethiopia	5	2024-05-07	POSITIVE	0.846727073	General Feedback
bd1bb661-6de0-4182-8240-7d4e09b62cb1	1	𝑻𝒉𝒊𝒔 𝒂𝒑𝒑𝒍𝒊𝒄𝒂𝒕𝒊𝒐𝒏 𝒊𝒔 𝒗𝒆𝒓𝒚 𝒈𝒐𝒐𝒅	4	2024-05-07	POSITIVE	0.883213103	General Feedback
5e03e6f2-b737-42f4-9ea5-7fa73d35acbb	1	It is very best app	5	2024-05-06	POSITIVE	0.999817550	General Feedback
7777c382-1a7e-4f8b-8679-e9b1fce18a36	1	Poor Bank Poor banking system Poor app	1	2024-05-06	NEGATIVE	0.999774277	General Feedback
0a821c1b-11ff-47c7-b74b-7698073306a7	1	Amazing app I ever see in this territory	5	2024-05-05	POSITIVE	0.999861956	General Feedback
e3882c1f-6826-435c-8198-2e6bee4e1046	1	Very good 😊 but it have errors	3	2024-05-05	NEUTRAL	0.972603142	Bugs & Reliability
be60a565-b04f-426a-8989-1fdff9182b9e	1	Ana taanan 0 turee oso jiraate	1	2024-05-05	NEGATIVE	0.982027411	General Feedback
63007d6d-3888-4a97-b812-a0735f5ea839	1	CBE Mobile banking app is very easy, simple and full of technology. I thank the innovator of this system🙏🙏🙏🙏	5	2024-05-04	POSITIVE	0.999713123	User Interface & Experience
84136ce4-6156-4c8a-b133-9abcb9b9a15c	1	how to use?	1	2024-05-04	NEGATIVE	0.996614635	General Feedback
0ff573dd-e1db-40cd-baf7-3769eccc7421	1	Ayalew Asefa weledemichel /አያሌው አሰፋ ወ/ሚካኤል	1	2024-05-04	NEGATIVE	0.932632327	General Feedback
7b2869a7-8d43-4406-b828-d573f8462af7	1	Cbe ye mafia leba yhehinu nachew hidden fee ykortalu transfer lay ye wsha ljoch	1	2024-05-03	NEGATIVE	0.990518272	Transaction Performance
0d6a561d-7a0e-4400-afbb-7fd0cb4e24c5	1	አንዳንዴ የቀሪ ሒሳብ ዝርዝር አያሳይም ከዛ ውጪ i love it .😍. !	5	2024-05-03	POSITIVE	0.999861360	General Feedback
f348329d-5a3f-4793-a15b-6c87d66c0ed8	1	It is nice app & simple to use it	4	2024-05-03	POSITIVE	0.999563515	User Interface & Experience
aa5c22c1-c369-4f77-ac07-5cfee6541c99	1	Excellent app thanks CBE	5	2024-05-02	POSITIVE	0.999828935	General Feedback
9757be96-192f-41b4-b635-0967a292902d	1	It is a very nice and easy app to use. There is only one thing i would like you to add. If you could transfer from your account to another person's telebirr account, it only works to your own phone number	5	2024-05-02	POSITIVE	0.968558550	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
a1c9f531-c107-41d1-929b-03f68d1e3cf5	1	Amazing app !!	5	2024-05-02	POSITIVE	0.999871492	General Feedback
7cd13b23-72e8-4d2b-a108-f022d85bf81d	1	Nice application but not work properly on iphone	5	2024-05-02	POSITIVE	0.993548214	Bugs & Reliability
a2d1ceab-0605-4cfe-b814-4a12459ad8e1	1	Good and easily application thanks	5	2024-05-01	POSITIVE	0.999865055	General Feedback
374817ec-0c03-4186-a8b2-16656e5ec6a8	1	Unable to use the app for around a month! (It cames with an error message "None available" everytime I try to transfer). What a Worst app!!!	1	2024-05-01	NEGATIVE	0.999823868	Account Access Issues, Bugs & Reliability, Transaction Performance
2b902d0a-e2d6-4281-a071-c7141a032cfe	1	this updated version is ANNOYING!! Doesn't work at all!! 😡👺🤬😾	1	2024-05-01	NEGATIVE	0.999807537	Bugs & Reliability
f0c86431-7be8-4865-bef7-fc876d10126f	1	have no option for transaction export	1	2024-05-01	NEGATIVE	0.998234749	Feature Requests, Transaction Performance
3850aec5-5904-4850-b764-a3589cf62f8a	1	it is good	5	2024-05-01	POSITIVE	0.999849439	General Feedback
b0e9b66c-27bc-4950-bfb3-e2903315936c	1	Great !!! I am happy for this app.	5	2024-05-01	POSITIVE	0.999868751	General Feedback
df634f9c-94e6-4007-9bab-db84c8a930ea	1	hey cbe. we love to use Commercial Bank of Ethiopia but we can't transfer money to international by using the CBE app by using SWIFT	1	2024-05-01	NEGATIVE	0.956306279	Transaction Performance
87472748-f1c4-4ad4-9161-34d220b02d1d	1	Terrible application. every time when I have transactions, say an error while the transaction is already done, doesn't show the recent updates balances and transaction.	1	2024-04-30	NEGATIVE	0.999789417	Bugs & Reliability, Feature Requests, Transaction Performance
32c841de-4d73-40a8-b6bf-9ecf103c4bf1	1	I'm satisfied with this app.❤❤	5	2024-04-30	POSITIVE	0.999579489	General Feedback
89dbc5f9-9850-464f-843a-d6505d36c90a	1	Its better app	5	2024-04-29	POSITIVE	0.982473254	General Feedback
a46b70a5-aa3d-423d-b7e4-6724fd989d7d	1	- It is best application , but you have to integret the tele- birr service to any mobile service number by titening the security tunnels rather than own mobile service number only	3	2024-04-29	NEUTRAL	0.998311043	Security Concerns
9b12b5f1-67cc-48ec-9205-e0c785ad445e	1	It's best and easy to use I like how it works	5	2024-04-28	POSITIVE	0.999847412	Bugs & Reliability, User Interface & Experience
3a82abc6-251e-4b7d-9ebb-daaf2f6975cb	1	It's easy to use and safe	4	2024-04-28	POSITIVE	0.999737084	Security Concerns, User Interface & Experience
abc45dae-f21f-4ebf-a437-c4fbd43c018d	1	wow serane yakelale	5	2024-04-27	POSITIVE	0.998122394	General Feedback
9a5ec7f7-0d6f-4c55-9e16-964b7e921aaf	1	ንግጽ ባንድ በጣም ጥሩ አስተማማኝ ነው	5	2024-04-27	POSITIVE	0.904695213	General Feedback
f675596f-ea7a-4fe6-9957-8223d3a9c507	1	It is not that hard to list the number of transactions in their order	1	2024-04-27	NEGATIVE	0.964142084	Transaction Performance
4da6650e-5e1a-40a9-8e7f-1caa7070c3cb	1	It's very nice app	3	2024-04-26	NEUTRAL	0.999863148	General Feedback
f624464c-4b12-4b0d-a25b-9f61e99a5d11	1	Very poor application it doesn't work in all smart phones☺️☺️☺️	1	2024-04-26	NEGATIVE	0.999800146	Bugs & Reliability
1999f499-c2a9-45e3-a270-234187476680	1	Not work properly.	1	2024-04-26	NEGATIVE	0.999794900	Bugs & Reliability
19bde35a-a03c-488f-8dab-0889dd8b257a	1	It's the best mobile banking application ever!	4	2024-04-26	POSITIVE	0.999808609	General Feedback
0eae116e-5fd1-452b-b062-f7f498f5dbbe	1	To be honest It's a great app	5	2024-04-25	POSITIVE	0.999839187	General Feedback
a8e29573-910d-4878-8d56-18f68da899be	1	best Ethiopian bank	5	2024-04-25	POSITIVE	0.999719083	General Feedback
199241e2-195f-4520-b2f9-e23cc904bbf4	1	Really thank for your service	5	2024-04-25	POSITIVE	0.999827385	General Feedback
b3e91b5a-8d00-4493-b681-97dd75e75ba9	1	I like this app very much, commercial bank of Ethiopia became one of the banks that I Can Always Rely on.	5	2024-04-25	POSITIVE	0.995529592	General Feedback
7fcb416b-6f14-44da-9282-b819d25516fb	1	I am interested	5	2024-04-24	POSITIVE	0.999824703	General Feedback
84f8cebb-a292-4b72-9c11-f63e55ab6a6a	1	I am happy using this app	5	2024-04-24	POSITIVE	0.999840379	General Feedback
e3cd3a03-fc60-4110-b940-b6aace4aa6aa	1	Bad App and Bad institution It Can not show a transaction list Correctly It shows a very Messed up Transaction position Before Leaving the Country i beg them Please, I am going to leave the country, please make internet banking active for me, but they told me that the application will work anywhere, And Now it did not work after I left the country, it made me unable to move my money.	1	2024-04-23	NEGATIVE	0.999656677	Account Access Issues, Bugs & Reliability, Transaction Performance
515d45f6-bfe9-4c83-8971-66b06a65f03f	1	I am unable to use mobile banking for around a month. It says "None available" when I try to transfer or buy airtime.	1	2024-04-22	NEGATIVE	0.999337733	Account Access Issues, Transaction Performance
e437ac3f-0f7b-4d9c-99ff-2f7dd866f51b	1	It don't work The application is Doesn't work	4	2024-04-22	POSITIVE	0.999757946	Bugs & Reliability
f11a574c-0736-462e-9a85-be8f52b17549	1	Stupid thief app	1	2024-04-22	NEGATIVE	0.999745071	General Feedback
a8ddcff8-2de5-4d08-baa0-b3bfde5a4715	1	It's good app but one thing shoukd be add on history sort by option	5	2024-04-21	POSITIVE	0.714386940	Feature Requests
93c35ba0-3ea8-4e66-9246-8ffe6a2cb3b0	1	Best app except ballance update is slow	4	2024-04-21	POSITIVE	0.992466509	App Speed & Performance, Feature Requests, Transaction Performance
19002c2c-0beb-4ed9-ae0b-71aac7351251	1	good at using CBE to family and friends and consider it as the fastest and trusted Bank	5	2024-04-21	POSITIVE	0.999698639	General Feedback
8cef9522-d1f9-47e8-afc7-dc90b8c0fb7d	1	Worest apk even it doesn't show recent transactions, resending issues. The account will be reduced without showing the money I sent.	1	2024-04-21	NEGATIVE	0.997552454	Bugs & Reliability, Transaction Performance
42fb71f3-1e6c-41b6-9372-988afeb01c3f	1	best app i hope the transaction list be recorded more than 5 months	5	2024-04-21	POSITIVE	0.934501708	Transaction Performance
60c8d1dc-6ccf-46b1-91e9-6b0ac3afe7ce	1	Thank you ok	5	2024-04-21	POSITIVE	0.999858379	General Feedback
bcb4b459-4d01-4269-96bd-e6bfbdb11fee	1	v.good app !	4	2024-04-20	POSITIVE	0.999178231	General Feedback
b2661a63-35c8-4500-84da-3207d7036abf	1	One of the fastest mobile banking app in Ethiopia thank you CBE 🙏	5	2024-04-20	POSITIVE	0.999561727	General Feedback
d6b99c76-da7a-438d-92d7-b03b546d58be	1	Wow this Mobllie banking transfer app is amazing and easy to access and use for the mobile credit transaction keep going!!!	1	2024-04-20	NEGATIVE	0.999582350	Account Access Issues, Transaction Performance, User Interface & Experience
b4a57e5a-c769-45ac-aa26-cee4ec8194a6	1	Its good But if its give as our profile its more interesting	5	2024-04-20	POSITIVE	0.993671179	General Feedback
9de92a1a-a734-4b91-9d6d-8f5bd1580794	1	በጣም ምርጥ app እና በጣም ቀልጣፋ system አለው ብዙ ስራዎቼን አቅልሎኛል ጊዜዬን እንድጠቀም የምፈልገውን እቃ ካለሁበት ቦታ ሆኜ እንድገዛ እረድቶኛል	4	2024-04-20	POSITIVE	0.962063849	General Feedback
b4a130a7-5e1e-4501-8ca1-c1d122733e75	1	Nice.....it is providing services exceptionally quickly. thanks 👂	4	2024-04-20	POSITIVE	0.999837637	General Feedback
3a202ce3-aa14-4070-93e3-fe50b346ea6d	1	Very nice work	3	2024-04-19	NEUTRAL	0.999864221	Bugs & Reliability
27e78e9d-51e3-497c-8fb5-d65febe86680	1	When I tray to open the app it says "The device is Rooted" haw can i solve it?	1	2024-04-18	NEGATIVE	0.998747349	General Feedback
638d66c0-c956-4474-aa6c-4dd435ddf992	1	fast and short step app.	5	2024-04-18	POSITIVE	0.878654599	Transaction Performance
9fec9311-2dd0-40f0-8289-82d9e4856d85	1	God jab CBE	5	2024-04-17	POSITIVE	0.995020270	General Feedback
5fce623a-2128-4173-8dc3-e92fa6971697	1	The bank workers is the wrost ever but the app is best i aporeciate the developers	5	2024-04-16	POSITIVE	0.634472072	General Feedback
73e05f2b-a7bd-4d89-bdf8-4943603f02bf	1	It's very bad. It deserves 0 stars. It doesn't show some transactions,it misplace transactions,it misplace dates,it shows nonsense errors and so more. I just rate it to 2 stars for helping me a lot.	2	2024-04-14	NEGATIVE	0.993539035	Bugs & Reliability
5a42fccc-84f2-4e50-a35e-13c4a7efcca1	1	It is good but not fast	1	2024-04-14	NEGATIVE	0.999695897	Transaction Performance
4e83856f-6004-4bb0-8efa-0124d3fa47c6	1	That's good,but it deserves security l.	4	2024-04-14	POSITIVE	0.996411622	Security Concerns
98355af7-7363-4d1a-9d22-940eea9c5270	1	Nice app I like it too	5	2024-04-14	POSITIVE	0.999837875	General Feedback
084e02bf-125a-417f-a258-92e8f56e17ec	1	Am happy for this application	5	2024-04-13	POSITIVE	0.999812901	General Feedback
d77013e8-f597-42df-8138-772138690386	1	One of the most useless app in the country. Doesn't work almost 99 percent of the time.	1	2024-04-13	NEGATIVE	0.999743760	Bugs & Reliability
40226eb2-6bd8-4b2d-8606-8a3c73231a99	1	It is hard to open	1	2024-04-13	NEGATIVE	0.999784291	General Feedback
8ea4967d-b9dc-497e-9eb1-6ad89c5c15ca	1	an amazing app fast and secure	5	2024-04-13	POSITIVE	0.999864697	Security Concerns, Transaction Performance
092e76ac-cf68-421d-be63-5e9e146b5d66	1	Of LLC do my go of	5	2024-04-13	POSITIVE	0.989998996	General Feedback
2dcc12c1-55a3-4fa3-ad88-f22cdaffec25	1	It is more secure and reliable app, I recommend for every customer	5	2024-04-13	POSITIVE	0.999407411	Bugs & Reliability, Security Concerns
5baba955-0598-4a8e-8994-01683f18c62b	1	It is a very convenient app to use.	4	2024-04-13	POSITIVE	0.993689299	General Feedback
baa7a4e3-1d89-4f3c-89cc-80306729eb54	1	Worriest ever app i have faced	1	2024-04-13	NEGATIVE	0.994944632	General Feedback
89b18e33-dc9b-4aeb-865d-de1256dd26fc	1	But today it's not working	5	2024-04-13	POSITIVE	0.999629498	Bugs & Reliability
6c6a6222-2d6f-42dd-9e90-655c0cfdcd7b	1	እንዲህ አይነት ቀላል፣ ያማረ እና ለአጠቃቀም ምቹ መሆኑ እንድንወደው አድርጎናል።	4	2024-04-12	POSITIVE	0.948979199	General Feedback
3ea6f6ab-8b91-4bd0-b2b9-48e07e896e14	1	Poor application most times it says error while sending then it actually sent money so u have to double check if its an error or it sent cash. recent transaction don't update as fast sometimes it even misplaces date and bring forth a transaction done a day or 2 back at the top.the only thing remotely good is the UI interface	1	2024-04-12	NEGATIVE	0.999505520	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
82707630-a71f-4c75-a7c4-2e6587dcb07a	1	Why are we unable to transfer more than 10,000 to another bank?	4	2024-04-11	POSITIVE	0.999465883	Account Access Issues, Transaction Performance
4e979389-614e-46ee-b267-c7dacf75c488	1	My favorite app	5	2024-04-11	POSITIVE	0.998334587	General Feedback
7a95bf5f-4ce5-4c54-8df3-68b992c867f0	1	it is good app	5	2024-04-11	POSITIVE	0.999865294	General Feedback
f8009f58-de55-449c-9e65-f3999e1de19b	1	Diroo Abaraa Fataee	5	2024-04-10	POSITIVE	0.956740379	General Feedback
e2610343-7fe6-4d2a-99c0-5dfe4163b2bd	1	ገንዘብ በላኩኝ ቁጥር 10 ብር ይቆርጣል። Even ከ 10 ብር በታች ልኬ 10 ብር ይቆረጣል። ይህ ደሞ ህጋዊ አሰራር አይመስለኝምና የባንክ አገልግሎትም እንድቀይር እያስገደደኝ ነው። ይሄንን ጎጂ ተግባር ብታቆሙ የተሻለ ነው።	1	2024-04-10	NEGATIVE	0.971559823	General Feedback
ac3f2838-6648-4bb7-9a95-342f130a8e95	1	It's good, but not too much	3	2024-04-09	NEUTRAL	0.931316078	General Feedback
ed218dda-3b9d-4b87-858d-a504d9ed921a	1	this app really helped me a lot	5	2024-04-09	POSITIVE	0.999078989	General Feedback
74ab455f-c8e5-444b-a0da-5bbdced6bae7	1	it's very good app	5	2024-04-09	POSITIVE	0.999872804	General Feedback
0eec07d2-f78f-4ba5-9377-36644cfffd7f	1	Very nice app and simple	5	2024-04-09	POSITIVE	0.999861240	User Interface & Experience
ba32a74d-777c-44a3-8c6b-261cbea26029	1	Smoth and fast	3	2024-04-07	NEUTRAL	0.722922504	Transaction Performance
1f1b24fd-75b0-4794-b3d6-921c8fdcb163	1	Very nice application. Well updated!!!!	5	2024-04-07	POSITIVE	0.999843240	General Feedback
e6a1decc-833a-4fef-9712-a030372b5f62	1	Im very interesting in this app	5	2024-04-06	POSITIVE	0.999555528	General Feedback
687a5d30-9382-49ce-b3c0-c8605de58f35	1	is My account so please help me Please please	5	2024-04-06	POSITIVE	0.956699252	Customer Support
0a547ccc-b23c-49c7-b292-81b8a050da5f	1	The best experience ever I have seen. Keep it up.	5	2024-04-06	POSITIVE	0.999844551	General Feedback
6bda1ed4-f839-4914-b069-74fd60a670df	1	Same what nework problems	5	2024-04-06	POSITIVE	0.998457313	Bugs & Reliability
fee3ea54-0b73-4134-8753-047f5a9489be	1	Its good but it dosnt show updated statment	3	2024-04-05	NEUTRAL	0.981301546	General Feedback
274a4865-a240-4662-8f88-06a2e3657b2b	1	please include transfer to its own telebirr Merchant account for the trader. We cannot transfer money from our CBE account to our telebirr Merchant account, all transfer from our account considered as payment.	4	2024-04-05	POSITIVE	0.997923076	Transaction Performance
9c9043ba-a57d-4d4f-9eee-cf86d35547a7	1	Excellent easy to interact swift time saving. I really enjoy using this app didn't really expect it to be so W⁰ºo0W	5	2024-04-05	POSITIVE	0.997998416	User Interface & Experience
f49769d0-9062-41e0-9936-f86639cf2001	1	Not active as needed	1	2024-04-05	NEGATIVE	0.999775708	General Feedback
2432995e-4e85-4a4a-818c-35c08f8fc211	1	Include Fayda National ID payment	5	2024-04-04	POSITIVE	0.943054259	Transaction Performance
abb9cf5a-0782-4c81-b416-302a26e9ef48	1	It is easy and simple to use it.	5	2024-04-04	POSITIVE	0.998318195	User Interface & Experience
37efb233-2d47-43bd-b5cd-ebd2b9ba5810	1	Excellence and facilitant spp	5	2024-04-04	POSITIVE	0.999587595	General Feedback
652dce45-d175-43d9-8e5a-aec8c744ca08	1	CBE is the best bank in the country	5	2024-04-03	POSITIVE	0.999812305	General Feedback
1d918c28-0f0a-4f3a-8c88-1f749df37d98	1	I am happy with the application.	5	2024-04-03	POSITIVE	0.999864697	General Feedback
f2933d72-9984-43b6-baca-d0091c186d1d	1	One of the best apps	5	2024-04-03	POSITIVE	0.999861121	General Feedback
c980a7be-5583-4b76-a792-28c40e17b60a	1	Recently it is not performing well after the system modification works	4	2024-04-02	POSITIVE	0.999736369	Bugs & Reliability
37fd1492-7fcb-4742-85eb-a58b2dfd998e	1	If you make 2 transfers with the same amount, it will ask to verify, but no option to do so.	3	2024-04-01	NEUTRAL	0.997423887	Feature Requests, Transaction Performance
23311b1f-6d49-4384-a14f-370d142dded2	1	CBE is the best money transaction app ever that I have seen in Ethiopia	5	2024-04-01	POSITIVE	0.999471128	Transaction Performance
4dcfdb8f-8e51-493f-bf42-82295d7df853	1	Easy to use ,clear and pricise, fast confortable for all customers. Kip it up cbe	5	2024-04-01	POSITIVE	0.838406324	Transaction Performance, User Interface & Experience
d7c7384b-2796-445b-b02f-b435a670526b	1	ምንም ነገር እየሰራልን አይደለም ችግራችሁ ከመሰለፍ ገላገለን ብለን ሳንጨርስ ሊሰራልን አልቻለም እባካችሁን ሲስተማችሁን አስተካክሉልን	3	2024-03-31	NEUTRAL	0.952843368	General Feedback
70751865-f73b-41fd-b19d-6fdfd4720e67	1	This app is smart app for me. For making it more the best, I suggest that it is good if the transactions list were up to 2 or 3 months or even more.	5	2024-03-31	POSITIVE	0.998557866	Transaction Performance
f2f87407-b65f-470b-ab37-8cb81d808b43	1	This app is very halpful	5	2024-03-31	POSITIVE	0.996512830	General Feedback
a910c2c0-e4ef-4c75-a275-d55b0f188c8b	1	I'm excited you	5	2024-03-30	POSITIVE	0.999853492	General Feedback
322ede81-c264-4412-b7be-6885d4f4e6c4	1	Birr selala bederegn nw	4	2024-03-30	POSITIVE	0.951652229	General Feedback
31bf47cd-b783-4f12-a55b-0ac45e0c2580	1	Always says INACTIVE, sometimes doesn't sync, other times says go to the nearest branch and when I go they take forever. How come I am not allowed to see all transactions?Mobile banking is for saving time and efficiency. Non is takingplace. Why should I be forced to use my account everyday? I should be able to use it whenever.	1	2024-03-30	NEGATIVE	0.997672141	General Feedback
30289ced-7b85-40b7-9caf-8fc14183ee6b	1	👉it can not download the receipt when we transferred what is the reason? please we need the receipt so that come on to solution!	1	2024-03-30	NEGATIVE	0.997989416	General Feedback
bb19489d-3564-4fac-a3da-3e83969522d4	1	Fast and secure	5	2024-03-30	POSITIVE	0.999838829	Security Concerns, Transaction Performance
54ad2348-14a3-4da0-8e55-4e846f98ac6f	1	Wow easy and fast platform	5	2024-03-29	POSITIVE	0.999756753	Transaction Performance, User Interface & Experience
7587c9a8-ae85-446d-a022-813338d8efa3	1	Very very good	5	2024-03-29	POSITIVE	0.999862194	General Feedback
b15f554d-b1ca-4357-aef9-5f12b99b09fd	1	INDIVIGUALL TELEBIRR ACCOUNT IS NOT AVAILAVLE WHY	2	2024-03-29	NEGATIVE	0.999608338	General Feedback
09de4192-583d-4f15-8018-671523fc2f81	1	Nice app. But i know woman who got robbed her phone and they tranfered all money that she got because they got her password from her phone. Please do not save the password localy in the phone. Make a post request to validate the password or use oauth methods. That is much safer you can look at apps like paypal,payooneer ...	3	2024-03-26	NEUTRAL	0.996645153	Account Access Issues, User Interface & Experience
cb397d1e-4cc8-4969-a6d9-f888d9032525	1	Useless hackable bank!	1	2024-03-26	NEGATIVE	0.999786317	General Feedback
11b1e849-b1c2-4499-aba9-d3683eb05dac	1	it doesn't generate financial statements. it is good to allow us to generate our transaction in PDF file	2	2024-03-26	NEGATIVE	0.992269874	Feature Requests, Transaction Performance
aa460369-b5db-42fb-8eea-4d41949294b4	1	Very nice app thanks for the create	5	2024-03-26	POSITIVE	0.999845147	General Feedback
31bbe6dd-6272-4dbe-afed-57369f608f15	1	Please help me to use cbe android on this device.	5	2024-03-25	POSITIVE	0.991817713	Customer Support
d225d1cd-58e1-4cbb-8003-a24af1ebd462	1	The password should be stronger, including letters, numbers, and special characters.	1	2024-03-24	NEGATIVE	0.995966434	Account Access Issues
df1878fc-327c-407e-aca9-7ff4db87a1e1	1	Best app ever I enjoyed	5	2024-03-23	POSITIVE	0.999830604	General Feedback
084e90f2-0ee0-4cce-8b16-bd4d58fff1b5	1	Easy way to use	5	2024-03-23	POSITIVE	0.993449986	User Interface & Experience
f62e6afa-3471-452c-8855-d57612757b1c	1	1- Always mixes up sequence of transaction history and also takea very long to update those 2- doesnt generate the reciept page when you transfer to other banks, mostly displays an error image. 3- struggles to work in places with 2G connection. Generally its a good app since the USSD is a nightmare we will be ok with this.	2	2024-03-23	NEGATIVE	0.854913175	Bugs & Reliability, Feature Requests, Transaction Performance
5f30f4a8-b69f-4f52-aaa3-65175adf7ce8	1	𝚙𝚎𝚘𝚙𝚕𝚎 𝚌𝚊𝚗 𝚎𝚊𝚜𝚕𝚢 𝚊𝚌𝚝𝚒𝚟𝚊𝚝𝚎 𝚝𝚑𝚎𝚒𝚛 𝚌𝚞𝚛𝚛𝚎𝚗𝚌𝚒𝚎𝚜,𝚊𝚗𝚍 𝚖𝚘𝚜𝚝 𝚘𝚏 𝚝𝚑𝚎 𝚜𝚢𝚜𝚝𝚎𝚖𝚜 𝚜𝚖𝚘𝚘𝚝𝚑𝚕𝚢 𝚒𝚗𝚝𝚎𝚛 𝚊𝚌𝚝 𝚋𝚢 𝚊𝚌𝚌𝚘𝚞𝚗𝚝𝚜 𝚝𝚑𝚊𝚝 𝚏𝚘𝚠𝚗𝚍 𝚒𝚗 𝚝𝚑𝚎 𝚍𝚎𝚟𝚒𝚌𝚎 𝚊𝚜 𝚌𝚞𝚜𝚝𝚘𝚖𝚎𝚛𝚜 𝚗𝚎𝚎𝚍𝚎𝚍.	5	2024-03-22	POSITIVE	0.960627854	General Feedback
8295163a-670a-4620-97fe-b30dd1f72cea	1	Very nice app	5	2024-03-22	POSITIVE	0.999856234	General Feedback
4f68cf43-9ccb-493e-9945-072925b565d1	1	Good to have this app on my phone.	5	2024-03-21	POSITIVE	0.999354780	General Feedback
d72a6162-4495-4769-b777-756f837a19b6	1	The best app	5	2024-03-20	POSITIVE	0.999846935	General Feedback
1c259243-3eb1-495e-a6b7-0c09add6a755	1	Open mobile banking	5	2024-03-20	POSITIVE	0.993733466	General Feedback
c280a765-8c7d-402c-ac01-6bfb071881a3	1	It stacked and not opened	1	2024-03-20	NEGATIVE	0.999654651	General Feedback
12bc4780-61f0-4fd4-b8bf-8fb85b4b1cdd	1	Betam michu kelal nw	5	2024-03-20	POSITIVE	0.784820259	General Feedback
e266d089-3e94-439f-8190-aee3e850d9c6	1	Need better Work on system	5	2024-03-20	POSITIVE	0.999030113	Bugs & Reliability
84ed7f3c-6d11-42b4-bd43-36656ebc55d9	1	It's a very interesting app to have a safe money transaction. Appreciate it	4	2024-03-19	POSITIVE	0.999642730	Security Concerns, Transaction Performance
175e9e6c-3ed2-4cbb-900b-3d49a2f72216	1	It's good app	5	2024-03-19	POSITIVE	0.999868989	General Feedback
619ce438-1fe0-4b12-9aea-bb7405147652	1	it is so use full!!	5	2024-03-19	POSITIVE	0.989740491	General Feedback
ca57b441-8337-464f-83ce-3340ea289f58	1	This app is verry interesting app ever almost add free and when comparing with other compitant banks app this app more great it work on less data best RTOS👌👌👌	5	2024-03-18	POSITIVE	0.846830547	Bugs & Reliability, Feature Requests
c8c4dcf5-dfde-4528-b0b2-04906d8ed08f	1	Best solution for easy life !	4	2024-03-18	POSITIVE	0.999391556	User Interface & Experience
cfadc07b-2a67-45fa-a14c-cb31f0c3e5a0	1	Dowelled frome Google appe stor	4	2024-03-18	POSITIVE	0.994098783	General Feedback
543d8c1f-fa28-4fb5-a08a-b2b47c3a1074	1	Nice app i like it	5	2024-03-18	POSITIVE	0.999855280	General Feedback
cb6db084-78f1-4e03-9a16-f61130552bf0	1	It doesn't work smoothly	1	2024-03-18	NEGATIVE	0.999773800	Bugs & Reliability
4c4ecba8-2dd2-49a8-9412-949ce4fffb9e	1	This good app	5	2024-03-17	POSITIVE	0.999870300	General Feedback
68ae1495-71a5-45b5-8e25-aa4f36d5e404	1	easy and excellent app	5	2024-03-17	POSITIVE	0.999857068	User Interface & Experience
a78f8983-f993-45dc-a04a-4e5e7b64eb06	1	Beter than all others I have account with commercial bank of Ethiopia this chance is a higher profile gift to up grading the livelihood of the poor ones as well as the government revenue	4	2024-03-17	POSITIVE	0.999005377	General Feedback
354d50f5-e420-4a2d-9d0d-fb51db9fc4a6	1	The security is very weak and cyber attacks will always happen. Adjust the security	1	2024-03-17	NEGATIVE	0.996948063	Security Concerns
74d0c95a-d703-43e9-a6ae-17ad460c22b1	1	Amazing apps are Ethiopian bank	5	2024-03-16	POSITIVE	0.999738395	General Feedback
63ba7c07-ae7b-40f9-92a7-3dc3b6795403	1	Betam harif app new	5	2024-03-16	POSITIVE	0.965884209	General Feedback
570c98b8-b765-495b-9a96-1bb2aafc58a9	1	Commercial bank of Ethiopia experiances their best service to the customer handling and excellent offer they give and relialble bank that best describes them	5	2024-03-16	POSITIVE	0.999369681	General Feedback
7c941015-1668-4551-a680-d5579acf32e7	1	always network error why ....	1	2024-03-16	NEGATIVE	0.999507427	Bugs & Reliability
5f0d1f8e-2b41-46ac-af51-5c729f5dbde0	1	Always crush its stupid app	1	2024-03-16	NEGATIVE	0.999774992	General Feedback
af0a4d1d-b254-4967-b163-aa40f6b51b6d	1	This Great app for me I like to rate this with 5 star solid.B/c It works well overall. So hello everyone enjoy the apps	5	2024-03-16	POSITIVE	0.999826610	Bugs & Reliability
f26bf646-0ec8-4f7d-93d6-1b16cabdf437	1	Add pagination instead of loading all txns at once. Simple	4	2024-03-16	POSITIVE	0.746755540	App Speed & Performance, Feature Requests, User Interface & Experience
3d159eec-abcd-4c9e-9a0e-185813443984	1	It is a very good facility	5	2024-03-16	POSITIVE	0.999879837	General Feedback
0b25c884-b152-4eda-a04d-397cb6c35e2f	1	I'm having trouble with the application, I can't see my balance or send money using the application. This is very disappointing as I have been experiencing this for a while.	1	2024-03-16	NEGATIVE	0.999774039	Transaction Performance
b2000ee2-e879-45ec-97bc-c8d0b68d6b98	1	Yohanes and zefan	1	2024-03-15	NEGATIVE	0.993989229	General Feedback
b8b863ba-3a22-48ce-b462-fd7e829e5ee4	1	Gorgeous app i really like this app.	5	2024-03-15	POSITIVE	0.999851346	General Feedback
63cb01c8-16a5-4e27-ad8a-e485acd46d7d	1	Good app and easy to use	5	2024-03-15	POSITIVE	0.999832630	User Interface & Experience
9d2a4f01-e19c-4b49-9e7a-14bd995bcc7a	1	Better and easy to use it	5	2024-03-15	POSITIVE	0.999462545	User Interface & Experience
b7fe5829-fd93-45c8-ac5e-ece289ccbf0f	1	This is my first time to use this app. You have done great work. I Appreciate your effort ,do more to make this app more effective.	5	2024-03-15	POSITIVE	0.999712050	Bugs & Reliability
a91753e5-de44-474e-8c77-387e9c7c2825	1	እጅግ በጣም ያማረ የኮመርሺያል አስተላላፊ መተግበርያ ሁኖ አግኝቸዋለሁ። እናመሠግናለን	5	2024-03-14	POSITIVE	0.936667919	General Feedback
d1152c87-b7f1-4fd4-991b-2bef638dda0f	1	It's Well !!	3	2024-03-14	NEUTRAL	0.999851584	General Feedback
3b75ad1e-11eb-46f7-8751-3ff3317c1bb6	1	This app is a good app	5	2024-03-14	POSITIVE	0.999851227	General Feedback
2f82ae63-c948-4e12-b424-568b7d1f8451	1	Actually I do not used it yet.	5	2024-03-14	POSITIVE	0.994897425	General Feedback
3f8a852c-fb74-4efb-a2e6-a2f320c6519a	1	It is not working, informs its synced but, when you request for transaction he doesnt process it	1	2024-03-14	NEGATIVE	0.999093533	Bugs & Reliability, Transaction Performance
a9be2334-1777-43d7-92e2-5f6a4649ceb5	1	It's full of crashing features, can't sync real time need 3,4 touching doesn't work many times. In fact it's not working now I'm afraid if I uninstalled it I will be forced to go to the branch to activate it again so here I'm stuck with the app unable to access my money	1	2024-03-14	NEGATIVE	0.999369204	Account Access Issues, Bugs & Reliability, Feature Requests, Transaction Performance
a5526e99-1b75-4c4e-a3fd-11100055d7fe	1	I like very much	5	2024-03-13	POSITIVE	0.999859571	General Feedback
11bcb890-7b67-4f9d-96e0-377150f8ce76	1	After the recent update, the app crashs on its own and is glitchy	1	2024-03-13	NEGATIVE	0.999734461	Bugs & Reliability, Feature Requests
5d8658c6-3088-4088-adc6-6f3c6a5a2088	1	Abdurezak Abdljalil Side	5	2024-03-12	POSITIVE	0.766161680	General Feedback
7c77a5cc-7c6b-4469-861a-4d2f8d2a70c9	1	The best service cbe ever gave us	5	2024-03-12	POSITIVE	0.999714077	General Feedback
92c10ad3-15dd-49cb-ac3d-55aeb4761e3b	1	This app have not working please more approve it.	5	2024-03-12	POSITIVE	0.998472393	Bugs & Reliability
518a5b4c-0d4e-407d-b2fe-09edb7a00fab	1	my phone is camon 20 pro but it can't install on phone it is so bored 😴😴😴	1	2024-03-12	NEGATIVE	0.998899460	General Feedback
c6632ce0-0cd2-41f7-b63f-697334ccfe72	1	We're going to stop using not only this apk additional to stop all CBE services. bcz of when to use the apk it doesn't work properly/ doesn't sync /.... + started from last 2 months they're cut 5 birr without our permission for commission. + Cut 10 birr from us when transfer to telebirr... Uuuu CBE'jobs	1	2024-03-12	NEGATIVE	0.999713123	Bugs & Reliability, Transaction Performance
76596c2d-5d09-474c-b188-38c07d1803a7	1	Accountant and computer senice	5	2024-03-12	POSITIVE	0.972516239	General Feedback
685087bf-b46c-4a3e-bc8b-9c7bf26487c1	1	It's too smooth and easy to use version😎	5	2024-03-12	POSITIVE	0.909530222	User Interface & Experience
679091ba-00d4-4458-8c5b-40cafd43ba91	1	Best and easy to use but the limitations is the when someone want to send birr from cbe to tele birr the transfer fee is higher and this is not correct	2	2024-03-11	NEGATIVE	0.999389172	Transaction Performance, User Interface & Experience
31f3d4cc-d03b-442b-93f3-eb731ad41a10	1	Best for save time	5	2024-03-11	POSITIVE	0.991396487	General Feedback
6b32ddc8-b02a-4d0e-b43d-ce7723933a85	1	The new version get worse I can't even check my balance let alone doing other stuff.	2	2024-03-11	NEGATIVE	0.999731839	Feature Requests
e0870b75-e1ac-4b1e-b5a8-99dfecca3e34	1	It's fast,very good App...	5	2024-03-11	POSITIVE	0.999721587	Transaction Performance
479044e6-5b69-4ce9-8a34-c90bd76ca0d1	1	The new one is not working on my phone disliked it	1	2024-03-11	NEGATIVE	0.999021888	Bugs & Reliability
db028533-8ae4-4d2f-9b16-9be4aec7ddc3	1	Better than the previous version. The update is good 👍	5	2024-03-11	POSITIVE	0.999834538	Feature Requests
30529a6d-53b3-4961-a680-194c521e8315	1	C. Cc x. M x x. S sx. ## xc c c b_.4.m. C c. Exx xn2 Dodds s 7. 33f N.gn Cd 7 y n bbe4. Mrn4	5	2024-03-11	POSITIVE	0.997647226	General Feedback
d2b2d770-736d-46b1-a78c-f83ab2604f55	1	Very good app	5	2024-03-10	POSITIVE	0.999867558	General Feedback
2664e62d-98b6-4640-bf88-5eb3450c135c	1	Add statement request through email and others.	3	2024-03-10	NEUTRAL	0.967051148	Feature Requests
4d833b79-4615-4272-84e8-df113ed21545	1	Got worse after the update. Now it doesn't do anything after logging in.	1	2024-03-10	NEGATIVE	0.999684215	Feature Requests
49d91d55-75ab-456a-8e45-41c1178c4134	1	It simply isn't working. Example: I can't access my account statement in order to find out how much I sent to Mr X or Y over the last six months or so. Nor is your FAQ section helpful. I suggest that you review the efficacy of your app.	1	2024-03-09	NEGATIVE	0.999787390	Account Access Issues, Customer Support, Feature Requests
6917d8ae-df12-4dfb-bc1d-b6410720db27	1	Applicationiin kun akka ati barbaaddetti hin hoojjatu maali rakkoon isaa	5	2024-03-09	POSITIVE	0.987517178	General Feedback
c4c8af8c-6532-494a-aaac-7bae37d8e33d	1	No customer service help and it's in general doesn't fill out the global app's estandard. It was felt.	1	2024-03-09	NEGATIVE	0.999162316	Customer Support
8de8ea97-b237-47e2-9d05-f5959bb990cb	1	በጣም አስቸጋሪ ሁኔታ ውስጥ ገብተናል በንግድ ባንክ የተለያዩ አማራጮች ብንጠቀምም የፍጥነት ሁኔታው አሁንም ሊሻሻል አልቻለም!	4	2024-03-09	POSITIVE	0.976990879	General Feedback
eceac747-e111-4141-9466-0046745e49e7	1	The application get stacked the whole day ( March 9, 2024); it is a big head ache on daily work	1	2024-03-09	NEGATIVE	0.998541117	Bugs & Reliability
521e4b03-c834-4cfe-80c9-ceef796ca199	1	The seystem is not good an commmercial bank it so poor and it not good.at all	1	2024-03-09	NEGATIVE	0.999806225	General Feedback
358440a3-5da9-4a96-b78b-60dc5336806d	1	I can't transfer to telebirr and takes time to scan	1	2024-03-09	NEGATIVE	0.999158382	App Speed & Performance, Transaction Performance
2e9f58c0-a3e4-493a-9efe-3390028378f8	1	nice application to tract the money I have on commercial bank ethiopia	5	2024-03-09	POSITIVE	0.993779361	General Feedback
9a949461-1208-43ab-9b32-8d48cf9e5ed6	1	new paiment must raisec	5	2024-03-09	POSITIVE	0.519635856	General Feedback
f74b67dd-4158-4f33-925b-0e19e96ee8f8	1	You deserve less than 1 star	1	2024-03-09	NEGATIVE	0.998911023	General Feedback
85c0d2de-c2f2-417b-9285-1d70198ac680	1	Nice but sometimes, all little....	5	2024-03-09	POSITIVE	0.689295888	General Feedback
aaaba471-100a-4a21-98a2-75960ed61f06	1	Doesn't work when a lot of people are using CBE services and usually on weekends. Customer service not helpful or doesn't even respond.	1	2024-03-09	NEGATIVE	0.999205768	Bugs & Reliability, Customer Support
d0042412-a771-4b06-a51a-c433be7a9692	1	Easy to use	5	2024-03-09	POSITIVE	0.998854280	User Interface & Experience
6d8eb630-ec50-4045-8a61-eb32bba9b476	1	Sometimes it work , and sometimes it doesn't fix that up	1	2024-03-09	NEGATIVE	0.997619569	Bugs & Reliability
09386f7e-0d05-4ed9-b8d3-fa8505e05b78	1	It is easy to use and good applicarion .thanks to cbe	5	2024-03-09	POSITIVE	0.999865890	User Interface & Experience
78746c49-2979-4b2f-8b61-81f5d0571d11	1	የሞተ አፕ ተበላሽቷል	1	2024-03-09	NEGATIVE	0.833725393	General Feedback
2f62e041-3e77-454f-815d-c7423cc574b8	1	Sometimes it brings a contradicting notifications. First I saw an internet poll form. After I filled it, another message comes that advises users not fill any forms sent or bank did not send such documents. Sometimes the app gets stack without any prior notices. It happened quite numerical times with me. Otherwise great app. I think a followup maintenance and improvements needed	3	2024-03-09	NEUTRAL	0.802190185	Bugs & Reliability, Feature Requests, Transaction Performance
5009753f-f5fb-458a-9848-b817379f34d6	1	Worst app ever	1	2024-03-09	NEGATIVE	0.999780357	General Feedback
34f5780e-9c96-4734-a12a-bbb07cc10e00	1	1.Very unstable, continuously crashes. 2.There is an incredible amount of balance and transaction synchronization errors. 3.Have tries to make a transfer of 60k since yesterday still not able to due to errors popups with no message to explain error. For a bank, that is quite embarrassing and dangerous.	1	2024-03-09	NEGATIVE	0.998407543	Bugs & Reliability, Transaction Performance
3308c66f-ca91-4201-b91c-afb8f8b30313	1	በሽተኛ አፕ ነው ሲፍለግ አይሰራም	1	2024-03-09	NEGATIVE	0.883213103	General Feedback
3994c273-1869-48dd-b20a-91c58243eb82	1	It's nice app	5	2024-03-09	POSITIVE	0.999863982	General Feedback
17a749f5-a158-422e-8919-1adf096f1d65	1	Always have network issue Even my network work fine	2	2024-03-09	NEGATIVE	0.708087265	Bugs & Reliability
3faafda5-93fd-4b08-951c-c2188fa69765	1	This app worse 😭	1	2024-03-09	NEGATIVE	0.999672771	General Feedback
ed46333c-c86b-4b10-9246-e324ab74b512	1	Brachewen enkuan mawetat atchlum	1	2024-03-09	NEGATIVE	0.977895856	General Feedback
0b3b00ca-16b6-4c4f-b6c2-43a1c2525fcb	1	most of the time its not working	2	2024-03-09	NEGATIVE	0.998342395	Bugs & Reliability
64d4e737-be6b-4bae-bdb1-2bb79ee5cd6d	1	It's the best app but it doesn't respond quickly	3	2024-03-09	NEUTRAL	0.987777174	General Feedback
8e64ef8a-b519-4484-9a4e-1cc109cdf117	1	Optional It doesn't work for me. What i can do?	5	2024-03-09	POSITIVE	0.999354303	Bugs & Reliability
63bb0813-bdf9-462f-add3-b2a5291cb73c	1	App Kun baay'ee bareedadha! Natti tole jira!	5	2024-03-09	POSITIVE	0.949915648	General Feedback
99af5845-4ac3-4960-a1df-66af252dca05	1	It is very good. I enjoy using it.	5	2024-03-09	POSITIVE	0.999877930	General Feedback
2af85397-08f7-490a-afdd-d5bc16568d44	1	Very smart financial apps	5	2024-03-08	POSITIVE	0.999825060	General Feedback
c19b7525-3c7d-435d-998c-36c86e0f4065	1	The best app.	3	2024-03-08	NEUTRAL	0.999853611	General Feedback
159e21be-10ae-4ecc-bf3f-6ac05dcce338	1	This is not working without Ethiopia Not downloaded	5	2024-03-08	POSITIVE	0.983307481	Bugs & Reliability
18864795-b622-4df1-b736-80caeb6faf98	1	Is wired appp	1	2024-03-08	NEGATIVE	0.739623904	General Feedback
e1829b7a-1792-4ae9-9696-c168fc133aea	1	Modern Digital Application	5	2024-03-08	POSITIVE	0.998747945	User Interface & Experience
9d6d216c-d898-471d-a6d6-27013bd6e593	1	Paving the way for simple life.	5	2024-03-07	POSITIVE	0.998971820	User Interface & Experience
7fc592a5-8ad0-48e4-8bb1-16fba23779fa	1	Very Very good news	5	2024-02-23	POSITIVE	0.999878883	General Feedback
28aff45c-655b-45f9-aefa-1d13d4ec2949	1	very poor, it doesn't load while searching for extended time	1	2024-03-07	NEGATIVE	0.999117434	General Feedback
9eccf9f7-74dc-4022-bbd7-2b9a19f78ffb	1	Excellent App and easy to use.	4	2024-03-07	POSITIVE	0.999843359	User Interface & Experience
4c204c8e-d613-46cc-900b-bf70818bf2cf	1	Best ever banking app	5	2024-03-06	POSITIVE	0.999747217	General Feedback
8637fab1-44c4-4b1d-930d-138fad9cd7ec	1	The app got dumber in the last update. Poorly organized, redundant item across different categories. I wrote this review with my phone barred from calls because I couldn't settle my bill from your old "utilities" or the newly added "utility" tab.	1	2024-03-06	NEGATIVE	0.999812663	Feature Requests
39e0de29-9174-46bd-9e3d-0a3de9b278c2	1	yes do it	5	2024-03-06	POSITIVE	0.999644637	General Feedback
649ab36c-4388-4f70-af17-40bfe0db703e	1	The app has good flexibility for day to day activities and stuff but it takes unessential amount of money for no valid reason which is very disappointing	3	2024-03-06	NEUTRAL	0.999348819	General Feedback
2f356c0b-47ba-4f93-a4b4-ea8f7b8a8f52	1	Good app and smooth services.	5	2024-03-05	POSITIVE	0.999845743	General Feedback
a9d5aab4-636f-4392-8bc6-ccad890de66e	1	Pay for Beneficiary and sharing success reports are not working on the latest update.	2	2024-03-05	NEGATIVE	0.999609411	Bugs & Reliability, Feature Requests
d9e23f61-8b29-4746-9248-980cced2ed39	1	Full transaction statment	2	2024-03-05	NEGATIVE	0.956745863	Transaction Performance
57e134b9-4e3c-4138-b29a-895b6cb327ea	1	Easy to use, and effective!	5	2024-03-05	POSITIVE	0.999831200	User Interface & Experience
4369c394-d276-4294-8d74-eeca7c712972	1	The worst app ever made! I transfered money to abyssinia bank account, deducted the money from my cbe account but never made it through to my abyssinia account! I hate this app and bank! Idk why they are making me wait a whole week to return my money! Even there call center 951 doesn't work! Shame!	1	2024-03-05	NEGATIVE	0.999790251	Bugs & Reliability, Customer Support
ca74ed69-5b27-4abd-9667-5a6b5c77eedc	1	very nice app	5	2024-03-04	POSITIVE	0.999856234	General Feedback
9827549e-e103-44d9-91c9-2a1212b529b7	1	Very nice, but requires paid network.	3	2024-03-04	NEUTRAL	0.852818191	General Feedback
c10aa155-d1d0-4908-b5d6-c8a975f7d25d	1	Adding fingerprint access would greatly improve the experience.	4	2024-03-04	POSITIVE	0.993444800	Account Access Issues, Feature Requests
f82e500c-344c-4784-ba7d-25c3e0b59cc7	1	i tried to transfer 20k to other bank the transaction failed but it deducted from my balance and the other day i tried to transfer 15k to telebirr then it failed again also deducted from balance i dont even know how to trust it after now	1	2024-03-03	NEGATIVE	0.999476016	Security Concerns, Transaction Performance
5cb81499-23d6-465e-ad52-4ae943c3e6f2	1	Really good app to transfer money and receive	2	2024-03-03	NEGATIVE	0.999755085	Transaction Performance
ea42016e-c614-44e2-8a34-2fb9c26a022e	1	It is nice, but sometimes it doesn't sync fast	5	2024-03-03	POSITIVE	0.994202197	Transaction Performance
68dbb28c-5e44-4881-99cb-57ecd71910ab	1	Easy Fast and siitable	5	2024-03-03	POSITIVE	0.998576641	Transaction Performance, User Interface & Experience
fdde5157-c028-4e34-a10a-e58d15d055b2	1	CBE banks are deducting 5 birr from customers' accounts every month without authorization, and their customer service is subpar. Therefore, I will rate them 1 star.	1	2024-03-03	NEGATIVE	0.997339666	Customer Support
f4da78be-e41b-4f61-a595-f11d25e5f63c	1	It is nice to save time	5	2024-03-02	POSITIVE	0.999815285	General Feedback
ec1114ba-7d70-46ed-be12-a04f9b1ca006	1	effective and efficient app.	5	2024-03-02	POSITIVE	0.999866724	App Speed & Performance
cb8e01c2-ead4-4e68-a43f-8ab356702284	1	If we can get a chance to win	5	2024-03-02	POSITIVE	0.999313951	General Feedback
c13d91ae-3c48-4c07-a24e-59bee7f7d49d	1	Sometimes the app doesn't not working	4	2024-03-02	POSITIVE	0.999714315	Bugs & Reliability
38564b5d-279b-4b8e-a26f-dad9c3673851	1	It is great Mobile banking app ever, for Uncolonized state. [Mama Ethiopia].	5	2024-03-02	POSITIVE	0.999266922	General Feedback
34d628c4-5482-44f2-8a18-0358b6a9fea6	1	Please add new future more and more ,no update is available for it still and I cannot access statement means this future is not available... Am waiting please	5	2024-03-02	POSITIVE	0.998734415	Account Access Issues, Feature Requests
b0ab87a3-bfc6-4cf8-b60c-d6f5bdd095af	1	I really appreciate your M B perfectly on top of the century	5	2024-03-02	POSITIVE	0.999870896	General Feedback
da5638a9-6fbe-4796-8476-ab3810c4bd90	1	I am really appreciate this app	5	2024-03-01	POSITIVE	0.999810278	General Feedback
8320333b-3f15-4239-9bcd-ab46632284d2	1	This app is good but the only difficulty with the app is it needs high speed network which makes it challenging to access it in some places	3	2024-03-01	NEUTRAL	0.985920489	Account Access Issues, App Speed & Performance, Feature Requests
01ea59f4-8fcb-4363-8535-4fd2783ffba2	1	Thanks for commercial bank of Ethiopia	5	2024-03-01	POSITIVE	0.999503613	General Feedback
ed64ca21-c8e0-4057-b620-11e4bb6fb4dd	1	It is good and Okay thanks	5	2024-02-29	POSITIVE	0.999851108	General Feedback
884514b3-83ce-4fa1-9dde-22b86805d29b	1	Why the latest update didn't work on Wifi very well?	5	2024-02-29	POSITIVE	0.999688268	Bugs & Reliability, Feature Requests
ec726979-6a9c-40e4-9642-0246346ab1ee	1	The most important banking application.	5	2024-02-29	POSITIVE	0.993218124	General Feedback
e0c9ffa7-8ad5-42fe-a419-3bc3fa4e2d9c	1	One of a kind	5	2024-02-29	POSITIVE	0.999471843	General Feedback
6668351a-3484-4fc6-ac85-47c7a9ccd2c3	1	Easy and fast 👌	5	2024-02-28	POSITIVE	0.999558389	Transaction Performance, User Interface & Experience
216ce1ef-ab3c-4650-8a4f-75f288eb339b	1	Best app to my needs. keep up the good job	5	2024-02-28	POSITIVE	0.999601901	Feature Requests
cb523374-a496-4ca1-bdb1-bd713d72f65c	1	It has a problem of synchronization. Please fix it.	1	2024-02-28	NEGATIVE	0.999465287	Bugs & Reliability
f4179034-198c-4a66-92c7-a8e03519a0d8	1	have network issue its just rotate	3	2024-02-28	NEUTRAL	0.987056911	Bugs & Reliability
51125739-058e-4793-905a-381bd4b38d23	1	Very useful application which really helps me to use even while I was outside of the country. Thanks.	5	2024-02-28	POSITIVE	0.999773324	Customer Support
cf4e1335-0e7b-4842-8f67-5ee6bc405b59	1	i believe that the updated mobile application will answer many of the users question and it is recommended that iphone users use the one downloaded from the app store rather than the one downloaded from the play store.	5	2024-02-27	POSITIVE	0.865061820	General Feedback
394c681b-dbca-4ebf-9954-f34705dc4488	1	All are wel and i have one quastion where arr merjed account	5	2024-02-27	POSITIVE	0.979926169	General Feedback
07e2c6e2-15e4-4008-b937-6bd82fd9d10d	1	Very Good service	5	2024-02-27	POSITIVE	0.999864817	General Feedback
051f48dd-8f62-4260-84ab-3d6a372dc89b	1	Whats wrong the app following the new update? I can't even see my balance now. I used old app for more than three years from Europe and every thing was perfect. Now you it looks like the app is not stable. Thank you for spoiling it.	5	2024-02-27	POSITIVE	0.995294034	Bugs & Reliability, Feature Requests, User Interface & Experience
f0235136-29d9-42d6-a480-070acbe48e1a	1	Wow cbe keep up the good work, the interface is very attractive,the processing speed is good(needs to put some effort),canceling or aborting any proceeding task seems impossible(of course the payment process should not be interrupted...i do agree)...all in all, I'm hoping this will be resolved soon by the updates...	4	2024-02-27	POSITIVE	0.998468459	App Speed & Performance, Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
507bc14e-8137-4284-b858-30e9a2a617d7	1	Please add an option transfer to other tellebirr wallet	5	2024-02-27	POSITIVE	0.987932384	Feature Requests, Transaction Performance
e031dbe7-1454-42e3-9e2c-fe6d71c53192	1	Saffisaan baay'ee fooyyee qaba	5	2024-02-27	POSITIVE	0.963588119	General Feedback
afec8624-ca24-4914-8fbb-8ef1fd6a7b8a	1	Good app but no chance for money withdrawal option for cardless	4	2024-02-27	POSITIVE	0.903610945	Feature Requests
4ea3e12f-8639-40c7-adfb-5a24d45ec563	1	Excellent app which transfers money to another immediately with out waiting that is amazing keep it up....	5	2024-02-27	POSITIVE	0.999808848	Transaction Performance
69a63fc4-2e0c-4392-9865-523594d8a075	1	Very weak and slow to sync and show the balance, pls improve it	1	2024-02-27	NEGATIVE	0.997408569	App Speed & Performance, Transaction Performance
82483d8f-f6e6-4860-aea0-cf368b3b78ac	1	Very very much tanks CBE birr	5	2024-02-27	POSITIVE	0.839661181	General Feedback
67978669-89c6-4b2f-9768-b62888d37592	1	waw its grate app	4	2024-02-26	POSITIVE	0.983865440	General Feedback
bccf2319-7fc0-4b90-b5ce-149dc53d4a51	1	It's great. በጣም ቀላል ፣ምቹ ፣አስተማማኝ ፣ቀልጣፋ አገልግሎት ። ባሉበት ቦታ ሆነው የሚገለገልበት ባንክ ። መስተካከል ያለበት :- sort by date transaction list and print monthly statement	5	2024-02-26	POSITIVE	0.999745429	Feature Requests, Transaction Performance
b363fa4b-72df-4323-98cb-9d2e7ada2c09	1	Very nice app	5	2024-02-26	POSITIVE	0.999856234	General Feedback
d337e4b7-2ffb-4bcd-a0ea-01985ba547e2	1	Nice one app	5	2024-02-26	POSITIVE	0.999826133	General Feedback
7ce65e33-6f3d-4dca-969e-adf95d8244bf	1	Best Application Thanks so much commercial Bank of Ethiopia	5	2024-02-26	POSITIVE	0.999544799	General Feedback
b6efefbd-ed74-4d7d-aba9-e89c1990f7df	1	It's good and perfect app	1	2024-02-26	NEGATIVE	0.999878287	General Feedback
ba9ad73f-77db-4dc6-b226-0bc4089ff01d	1	Nice app ever	5	2024-02-26	POSITIVE	0.999838471	General Feedback
879e1627-a46c-48f7-915a-045609310f93	1	It would be nice to have an offline option.	3	2024-02-26	NEUTRAL	0.906264603	Feature Requests
10550768-9192-4f3f-9e21-5749e3c40cc0	1	what abaot my mobile banking code? I'm forgetting my password	5	2024-02-25	POSITIVE	0.999627113	Account Access Issues
3bb62467-9545-4351-990d-97176febcc74	1	Smart cbe noor	5	2024-02-25	POSITIVE	0.998441994	General Feedback
bc33cffd-ce8c-4895-b88f-3202372c97f6	1	Transaction report not showing properly	1	2024-02-25	NEGATIVE	0.999790847	Transaction Performance
63b740a9-63fa-44bc-a6b9-00702212ec74	1	መዘመን የማይችል ድንክ ባንክ። በቃ ሁሉንም ነገር እጅግ በተንዛዛ አካሔድ ለመስራት የሚፈልግ፣ ከቢዝነስ ይልቅ ፖለቲካ ያጠቃው Backward ! Even ጥቃቅን ችግሮችን ለማስተካከል ብዙ ጊዜን የሚያቃጥል ባንክ ፤ Online ማስተካከያዎች የሌሉት እና ህንፃ ብቻ...!	1	2024-02-25	NEGATIVE	0.992220342	General Feedback
ac2c87e8-0254-46dd-8ece-e23e84171ffa	1	I really don't like it 😕	1	2024-02-25	NEGATIVE	0.998527169	General Feedback
bc3e5c1a-be1e-4fa4-94af-cc5cd97a976a	1	Wana nachu serayen akelelachu yemechachu	5	2024-02-25	POSITIVE	0.983554542	General Feedback
2990238c-38a3-4d8b-bc14-263ee1124854	1	It simple to use but sometimes doesn't work	3	2024-02-25	NEUTRAL	0.999349058	Bugs & Reliability, User Interface & Experience
677370cb-5395-475a-a66e-30a6b7c72bdf	1	what a great app is	5	2024-02-24	POSITIVE	0.999834418	General Feedback
778ca377-3d70-4636-8730-54fdae45f81c	1	Thanks allot I brishye this app	4	2024-02-24	POSITIVE	0.998397291	General Feedback
d2bd0ebb-a27a-4079-8ae1-50d49bbab8f7	1	It is great app	3	2024-02-24	NEUTRAL	0.999858379	General Feedback
3664c4cb-56f3-4f54-bba1-b961b8758e59	1	aad ayuu udadaalayaa bangigu laakin lacagaha khidmada ah hadaayo macaamiisha	5	2024-02-24	POSITIVE	0.993814707	General Feedback
3f413e1e-d40d-4ebf-87e1-7b81996bf950	1	Cool keep going	5	2024-02-24	POSITIVE	0.999870658	General Feedback
09b5fd1c-9c76-4a70-9ba8-97a13a2f8370	1	Good service all 3rd gneration	5	2024-02-24	POSITIVE	0.999688745	General Feedback
0726566f-0601-4a8f-a12d-9feb9d959b8e	1	هلا احصن برانامج	5	2024-02-24	POSITIVE	0.709861457	General Feedback
ee3767b2-6a80-4d2d-96ab-89002db15480	1	Good app for me	5	2024-02-24	POSITIVE	0.999842048	General Feedback
b43319f0-e75d-4779-933c-3f5c40318219	1	When you try to search for a help (chat, hotline, email, phone) you see the bottom "Help" which redirectes you to !!!Donations to various charity organisations. Please dear CBE IT department , when user searches for help it is to get assistance not to give money. What you named help other banks call "Charity" "Donate" etc. And yes users need HELP. Not everyone has opportunity to run 5 times per day to the branch and try to find why the money he transferred is disappeared.	1	2024-02-24	NEGATIVE	0.995198905	Customer Support
e4807a5e-2efe-4fff-bbec-9dd7e0a7ef48	1	Fast and good app🙏	3	2024-02-24	NEUTRAL	0.999871850	Transaction Performance
feeb5bf7-9397-4e41-8abc-005a06ef0b74	1	Maashaa Allah waan gaariidha.	5	2024-02-24	POSITIVE	0.978356659	General Feedback
5f505baf-8136-4e89-87e0-6dbcfb586f7f	1	አፑ እኔ ስልክ ላይ አልከፍት ወይም ኢንስቴል አላደርግ አለኝ፡፡ምን ላርገው	1	2024-02-24	NEGATIVE	0.951026678	General Feedback
c73fbead-0477-45c3-b83c-dd37655c9973	1	I love sis app yeppp	5	2024-02-23	POSITIVE	0.999537826	General Feedback
e89ced35-1377-4b12-bfb3-f36b615367b3	1	Very simple and friendly	5	2024-02-23	POSITIVE	0.999869108	User Interface & Experience
523078e8-7c0d-45be-a74b-5f2504152edd	1	It is busy more time why is it?	3	2024-02-23	NEUTRAL	0.999244213	General Feedback
ae47b476-0dae-4148-9c43-05424cc06b0e	1	Nice the new update fix some bugs	5	2024-02-23	POSITIVE	0.990737736	Bugs & Reliability, Feature Requests
f8cd8891-76d3-4d74-9e2b-1bf9e7b4c7c7	1	Very good takes	5	2024-02-23	POSITIVE	0.999872565	General Feedback
2035a67d-f15d-457b-a5b1-3ec11ec24832	1	Highest Neonatal Bank Don't like Only Contacts	5	2024-02-23	POSITIVE	0.885604680	Customer Support
e5aed626-e204-4868-b145-06e57afa9405	1	it's great & useful app	4	2024-02-23	POSITIVE	0.999776900	General Feedback
ff9cecd5-cc2f-4b37-848b-2040016bc2f8	1	Banking with CBE anywhere anytime.	5	2024-02-23	POSITIVE	0.961000919	General Feedback
3ba27c34-ee22-4573-9f6a-86be8b8d2232	1	Very fast and manageable	4	2024-02-23	POSITIVE	0.999808967	Transaction Performance
72a86b73-7b51-4a43-8cd4-27d83b610fbc	1	ከዚ የበለጠ መዘመን አለባችሁ እንደ ቀደምትነታችሁ	5	2024-02-23	POSITIVE	0.904695213	General Feedback
d9c6117e-8d0b-4920-88b5-28094974c906	1	It doesn't update quickly and display balances please improve so we can rely on the online payments.	2	2024-02-23	NEGATIVE	0.994954646	Feature Requests, Transaction Performance
c178118d-caa4-4ea1-a535-f817f2d49152	1	Nice app keep it up	3	2024-02-23	NEUTRAL	0.999849916	General Feedback
308dcbb0-6649-4033-bc04-f4d9d43f3520	1	This app is helpfull but the only problem i am facing is I lost all my previous transaction and list of contacts(acc numbers those were saved in the app) when i updated the latest one. And how can i restor it pls	4	2024-02-23	POSITIVE	0.999623895	Bugs & Reliability, Transaction Performance
c643e07d-633e-414f-bcbc-347ca6132135	1	It is simple to use but network problems sometimes face	5	2024-02-23	POSITIVE	0.998397410	Bugs & Reliability, User Interface & Experience
84a313b0-bec6-4d71-a82b-d0e535f53e67	1	The best app !!	5	2024-02-23	POSITIVE	0.999862552	General Feedback
60cafd81-e63d-4337-886f-b99973dd5d46	1	The Best app of banking sector	5	2024-02-23	POSITIVE	0.999845386	General Feedback
faa3b14e-0147-4028-a51f-867fd5b94d30	1	Transaction respondes with non available message	1	2024-02-23	NEGATIVE	0.991984963	Transaction Performance
1e93d9c2-53d0-4ce9-b4ab-c70538ec7743	1	Please, still now, I am not accepting codes for activation of my account. help	5	2024-02-22	POSITIVE	0.996737063	Customer Support
ef0dd85c-0252-43c1-bb3f-300d7e197e74	1	The app is so good	5	2024-02-22	POSITIVE	0.999862194	General Feedback
a1838536-30ae-419d-a5aa-a856b63638ee	1	Unable to connect server eyale nw eskahun alkefetem	3	2024-02-22	NEUTRAL	0.999667287	Account Access Issues
e2f9954f-3557-4b5f-8e5b-8537673fcaa5	1	Fast and easy to use if there is no network problem	5	2024-02-22	POSITIVE	0.997527897	Bugs & Reliability, Transaction Performance, User Interface & Experience
b1bee10a-eda4-4d69-ac9d-3ddd886cabfb	1	It's good but, sometimes it says none Avelable	5	2024-02-22	POSITIVE	0.969508588	General Feedback
6c825630-a961-4b03-85ba-14aa65bea6ca	1	Good app for usurers	5	2024-02-21	POSITIVE	0.999369681	General Feedback
a4d39c82-0b5b-41f5-a777-54fe197e595d	1	It's good,but sometimes it's not work.	5	2024-02-21	POSITIVE	0.706410527	Bugs & Reliability
919e7cd3-e950-4c75-9c12-3348acedabb6	1	Good, but we expect more from you... (Please add fingerprint) like cbebirr	3	2024-02-21	NEUTRAL	0.612006783	Feature Requests
53817d94-a510-4947-ab53-a289d80213b3	1	Good but sometimes it has network glitch	3	2024-02-21	NEUTRAL	0.984767020	Bugs & Reliability
9282bb1d-7fd2-4620-9aeb-f7da1c360dbc	1	It's progress very well Thanks	5	2024-02-21	POSITIVE	0.999855161	General Feedback
91a06ac2-e8fb-44be-944d-997d29583005	1	need more work.	3	2024-02-20	NEUTRAL	0.998224437	Bugs & Reliability
bc59e140-9442-4224-a122-3699a78d26c8	1	Jibrili jamal musaa	3	2024-02-20	NEUTRAL	0.828285635	General Feedback
ee7d6dcc-e79c-4529-9ada-cffbf2b5e807	1	The best mobile app.	5	2024-02-20	POSITIVE	0.999842525	General Feedback
0ec1f681-cbe3-4527-aa5e-84758f564754	1	This app is very bad.it not work so fast	1	2024-02-20	NEGATIVE	0.999264538	Bugs & Reliability, Transaction Performance
95472d84-2b93-402c-82e0-4c759cdb1300	1	It is the most irritating banking app ever you should update it, it is very irritating tbh.	1	2024-02-20	NEGATIVE	0.999693751	Feature Requests
266cd9f6-2e18-4c77-8b0a-21cd520d7d94	1	I like this App!	5	2024-02-20	POSITIVE	0.999757111	General Feedback
2821bd56-30b0-4e5e-b4b8-34eac71bb65e	1	It was good but now I can't get the same access	5	2024-02-20	POSITIVE	0.977723300	Account Access Issues
5d8f4283-4126-44ee-87c0-63eb19a65210	1	Very best apps	5	2024-02-19	POSITIVE	0.999860168	General Feedback
fc46fa63-e474-4b5d-b06b-5bf0a7b08c6c	1	This is quite good than before, and well updated, specifically reciept after transaction is well organized. But still, the statement is limited. Work on this how to link with our email to control transactions.	3	2024-02-19	NEUTRAL	0.974089026	Bugs & Reliability, Feature Requests, Transaction Performance
b77f0fc8-cde9-44bc-93c2-764aea4c64fe	1	Good keep it up	5	2024-02-19	POSITIVE	0.999856830	General Feedback
9443fe14-00ff-4ff0-b6d1-fa75c2c1383b	1	All transactions history has to be shown .	3	2024-02-19	NEUTRAL	0.978099763	Transaction Performance
2d586d5a-6fbb-4115-8e7d-4a3deb6f9074	1	Gadisa Dino Abdi CBE MOBIEL BANKING	5	2024-02-19	POSITIVE	0.857638180	General Feedback
99dfec76-69f5-4d9b-9d81-7d2da4677440	1	የመስመር ቁጥሬ የተረሳ ስለሆነ አስታውሰኝ	5	2024-02-19	POSITIVE	0.883213103	General Feedback
acefcda7-1bd4-4fcf-b927-e4aa718bd61e	1	Muhammed sani seid	5	2024-02-19	POSITIVE	0.956759155	General Feedback
f5835856-43c2-4dd5-ae06-68460084c1cb	1	Woow i like it	5	2024-02-19	POSITIVE	0.997885168	General Feedback
8b645a97-15b9-4f52-9f51-49571499cbfd	1	It is my great and urget issue ,ie there must be personal account lock by using mobile app due to some times staffs and other bodies are accesseing by pertending customer signature .hence Personal post no debit have to be applicabe inorder to protect customer account from any suspected actions takes place	1	2024-02-18	NEGATIVE	0.728245556	Account Access Issues, Bugs & Reliability
f722eb07-1572-49ea-a03a-06ad81d89151	1	Why my app speed quality is low	3	2024-02-18	NEUTRAL	0.999745309	App Speed & Performance
26cc5e21-ad06-4603-bd93-ec6764d0b41d	1	it's very good app	4	2024-02-18	POSITIVE	0.999872804	General Feedback
c789f7f9-f60a-4b48-88c2-9f34d5fdcf01	1	This app is very simple, fast and easy	5	2024-02-18	POSITIVE	0.998695552	Transaction Performance, User Interface & Experience
75f574a8-05c5-4d9d-b19d-676cbfd66341	1	Not working very well	1	2024-02-18	NEGATIVE	0.999786317	Bugs & Reliability
ee03b2ad-a8e9-4422-9b4e-91c63617aafb	1	Not that much	3	2024-02-17	NEUTRAL	0.999695778	General Feedback
8e34dafb-ccce-47ee-808f-c96a96214058	1	Very good app.	5	2024-02-17	POSITIVE	0.999866962	General Feedback
1bb01e7e-18b6-4fb4-8f7a-7f54602dc602	1	App kana hedduun jaalladhe,warri kana hojjettan galata guddaa nu biraa qabdu.	5	2024-02-17	POSITIVE	0.990997910	General Feedback
d3ac4b0c-f431-4f90-8737-dd2cd0aaa3ab	1	The APP is very fast that is good	4	2024-02-16	POSITIVE	0.999861002	Transaction Performance
e404001e-6c46-4166-964e-157c91fc46d4	1	1. Still no biometric sign in option 2. Annoying welcome notification 3. Not able to share payment receipts just from the app 4. Different interface from one mobile device to the other one. 5. In general, the app requires overhaul to cope with other mobile banking services of banks.	1	2024-02-16	NEGATIVE	0.997391105	Feature Requests, Transaction Performance, User Interface & Experience
8a16f7d2-0739-4955-82f2-b2021ad94e88	1	It's good but i can't send money for other tell birr account i don't like this ....	4	2024-02-16	POSITIVE	0.989445269	Transaction Performance
d76ff66a-17e3-4d04-bd55-d61418fdac16	1	It's a quiet good and smoothly accessible app which allows users to transfer and deposit but it would have been very great if there was a chance for topping up or Adding balance to your account.	3	2024-02-16	NEUTRAL	0.998700976	Transaction Performance
dfe585cf-4ab6-4f7f-bff8-b5039106c95b	1	Best app. Easy to use, free from virus, and interesting features contained.	5	2024-02-16	POSITIVE	0.999591529	Feature Requests, User Interface & Experience
b333563d-8288-4263-9e92-890057438d43	1	Nice app but the transaction history is not accurate and it doesn't sync at times.	3	2024-02-16	NEUTRAL	0.999350846	Transaction Performance
08ddfdaa-f445-405f-9844-9a3ac4baad62	1	Very active app. Good Technology !	5	2024-02-15	POSITIVE	0.999866724	General Feedback
6a598bc0-206e-48f3-87b5-24d36c74870f	1	This app is one of the best mobile banking in 🇪🇹	5	2024-02-15	POSITIVE	0.999745905	General Feedback
175c2965-63cd-4514-8b46-0615e7a4cfd4	1	Keepup Very Good!	5	2024-02-15	POSITIVE	0.999860406	General Feedback
c7efcec3-572c-4894-82e9-e1bc69868014	1	the latest update was best❤❤	5	2024-02-15	POSITIVE	0.998675525	Feature Requests
0eb14e85-c915-479e-b62a-e0f800e8b6b4	1	Fast and easy	5	2024-02-15	POSITIVE	0.999488950	Transaction Performance, User Interface & Experience
b7b4d1d6-1695-4cc2-9363-6120c2e25409	1	it's really frustrating 😕 it works on it's own terms 😒	1	2024-02-15	NEGATIVE	0.994444907	Bugs & Reliability
f824577e-70a6-4863-84ad-17e493a412c3	1	It is good.	5	2024-02-15	POSITIVE	0.999852538	General Feedback
5d8dc3b0-2278-4692-ac0b-c71b5bccc2a9	1	its fast & good app so 10q	3	2024-02-15	NEUTRAL	0.999446213	Transaction Performance
1535c38e-0377-4af9-b9bb-ece368d573ef	1	Good ,easy and reliable	5	2024-02-15	POSITIVE	0.999861002	Bugs & Reliability, User Interface & Experience
a964a0bc-122a-4940-8b80-f747722e8d5e	1	It is easy and fast app	4	2024-02-14	POSITIVE	0.999264181	Transaction Performance, User Interface & Experience
fcc5da69-63d8-4c13-a069-92921ea89edc	1	The New realese is just WOW every feature is very importat and mostly the verification was an important feature. Thank you CBE APP Developer team👍	4	2024-02-14	POSITIVE	0.993926704	Account Access Issues, Feature Requests
3de39d3d-a6f5-4d98-8510-7fec46db71cf	1	Best app Galaatooma appiin kun bareedadha	5	2024-02-14	POSITIVE	0.988803804	General Feedback
5075ec66-aaed-4031-a4a8-c3a1b899e10e	1	Everything is good. Specially its simplicity. But it is better if there were transaction feature for more than one account in separate	4	2024-02-14	POSITIVE	0.970198750	Feature Requests, Transaction Performance
6c537bf9-639b-4fff-9524-38619708dcfa	1	This version is annoying . all the accounts i have been transfered are removed . No suggustion :-( :-( :-(	1	2024-02-14	NEGATIVE	0.999450982	General Feedback
7585a5cb-d8f2-4a78-a12e-bce5d96f4262	1	Good application it's useful to make life easy	5	2024-02-14	POSITIVE	0.999771297	User Interface & Experience
6adcb01e-03a9-48e0-a7b3-91d585b09b2f	1	It's been long time since i stepped on a door of a bank. I send, receive a mony, pay my utilities and do all the finantial stuffs. I loved it!! But I think the security should be more. stronger. Like making the code 6 degits. Thank You!	4	2024-02-14	POSITIVE	0.977717280	Security Concerns, Transaction Performance
e340dbfe-53d3-4e05-ba8a-61fb56e150c0	1	Trasaction Reports are not full, the list only shows the last 10 transactions, I need to see every transaction I made , and make a contact us page on your app too, other than that it's a good app	3	2024-02-14	NEUTRAL	0.968936920	Customer Support, Transaction Performance
d8d00885-ae90-4500-8097-45d76c5853c8	1	i said Wow for this app	5	2024-02-14	POSITIVE	0.999482274	General Feedback
a43488b1-a2cb-4070-bade-b470881f3d8e	1	Best of all mobile bank	5	2024-02-14	POSITIVE	0.999614239	General Feedback
378a4f72-c15d-48ff-8703-b88c47009a97	1	Well done really . especially what you done recently is amazing.	5	2024-02-14	POSITIVE	0.999873161	General Feedback
433c312e-1906-47f9-9cc6-325100b9a54d	1	This application is so easy and Comfortable to use I love it !!!!	5	2024-02-14	POSITIVE	0.999834180	User Interface & Experience
87a37209-776c-4e04-ae75-ffeb46323145	1	Best performance was seen recently.	5	2024-02-14	POSITIVE	0.999727309	App Speed & Performance
8760ab86-1a7f-44bd-a318-510535e93838	1	wow!!! so much nice app!!!	5	2024-02-14	POSITIVE	0.999842763	General Feedback
a0542ae7-0123-4255-a1e8-2a03a24c964c	1	Easy to use. Love it.	5	2024-02-14	POSITIVE	0.999880791	User Interface & Experience
1f50906d-8017-4740-b8de-aa6f4e89c42a	1	Very problematic... doesn't work when needed	2	2024-02-14	NEGATIVE	0.999668837	Bugs & Reliability
70427f67-9f21-4709-a621-e46962bf9b57	1	Best financial apk	5	2024-02-14	POSITIVE	0.999577224	General Feedback
3c51f4b4-002a-4247-ada2-d8e887df9e88	1	i need a way to register online without going to branch n you have to provide that service.... your services are something like you are still living in the 20th century.	1	2024-02-13	NEGATIVE	0.995254874	Account Access Issues
25eefb0e-fd99-4fb9-9876-626bf0a19e93	1	It is very used application	5	2024-02-13	POSITIVE	0.998317480	General Feedback
e44cc838-37f6-4aea-8a20-f0c8059e19b2	1	Too many bugs e.g the sync never works I have to go frequently to get fixes	2	2024-02-13	NEGATIVE	0.999440014	Bugs & Reliability
da129193-d86f-4ff6-b148-92457f4042ac	1	Nice and easy to use	4	2024-02-13	POSITIVE	0.999868989	User Interface & Experience
40c26557-7c7d-4961-b57b-d315e331a435	1	It is perfect!	5	2024-02-13	POSITIVE	0.999868870	General Feedback
ec1d3cf1-7aa2-4563-b9d0-fda8e08f5d7b	1	You are doing good .	5	2024-02-13	POSITIVE	0.999845266	General Feedback
7712c2e3-1c6d-446a-ae04-d471806276f9	1	This app doesn't run on rooted devices 😥	4	2024-02-13	POSITIVE	0.987242699	General Feedback
1ac43333-a854-49c0-b8b3-a575ed760df8	1	Please fix the error popping up after a successful transfer to other bank. It appears as if the transfer is not successful.	4	2024-02-13	POSITIVE	0.999601543	Bugs & Reliability, Transaction Performance
2ef47a89-022b-4aaf-b6f8-879f877f26a9	1	Not good enough	1	2024-02-13	NEGATIVE	0.999783099	General Feedback
b0352c0f-8045-42ac-832e-eb4fb1d81ade	1	I like and satisfy by using commercial bank of Ethiopia thanks	5	2024-02-13	POSITIVE	0.999643803	General Feedback
c7b666e4-d56c-4b77-8731-5dc9ec5a5639	1	Could you please add a finger print option	5	2024-02-13	POSITIVE	0.991972804	Feature Requests
bd1e44b1-1e72-4ce1-9f55-f5d205641856	1	That's so wonderful and secure	3	2024-02-13	NEUTRAL	0.999879122	Security Concerns
93de3545-9bd3-4e25-81a7-d9db53eee1d6	1	It would be best design if you guys include the fingerprint option	5	2024-02-13	POSITIVE	0.996477187	Feature Requests, User Interface & Experience
f55b2778-cc7b-44e5-a903-c9e4d9a92b42	1	The latest update is creating a lot of problems. For instance, I had to reopen the app like 10 times to fix the "NetWork error" issue.	3	2024-02-13	NEUTRAL	0.999462664	Bugs & Reliability, Feature Requests
27b6749d-7a24-4c23-8ea6-e2689468a811	1	The new update is horrible. Unreliable. I can't send money nor check my balance. Set your priorities straight, CBE	1	2024-02-13	NEGATIVE	0.999755561	Feature Requests, Transaction Performance
19178262-098b-4da5-9673-790ca4bdad29	1	Best banking system	5	2024-02-13	POSITIVE	0.999794543	General Feedback
d65fbe33-729c-4767-8898-3c40025ed0f4	1	አሁን ያለው ጥሩ ሆኖ እያለ፣ ያለ ATM ካርድ ATM Machine መጠቀም የሚያስችል ቢሆን የበለጠ ተመራጭ ያደርጋል።	4	2024-02-13	POSITIVE	0.974014699	General Feedback
af9e7628-ad31-4d8a-b286-a70e44265c94	1	The new updated version crush several times it need to be fixed asap	4	2024-02-13	POSITIVE	0.997170866	General Feedback
0f0baf6e-a36d-4956-b2ff-1dd881c6c5e7	1	It's nice app but some times it's not tell us the right balance specially on Saturday and Sunday	3	2024-02-13	NEUTRAL	0.996475518	General Feedback
2f9e6966-ccfa-43a3-8ff5-5bf3efdd1644	1	Its fast, easy to use and interactive app!	5	2024-02-13	POSITIVE	0.998985231	Transaction Performance, User Interface & Experience
72f716b3-0275-49f9-a66f-ba93d58a3ad6	1	The best one	5	2024-02-12	POSITIVE	0.999837160	General Feedback
b739cc85-7557-4861-b5bf-9f1b01019e50	1	Best of best app I love it	5	2024-02-12	POSITIVE	0.999830961	General Feedback
c4911ff3-6362-4c77-b918-fa2ed982f2b5	1	The new version is amazing	5	2024-02-12	POSITIVE	0.999883294	Feature Requests
0031336e-a135-4c6e-9cdd-78e3e5b9de08	1	Wow ahun temechegn beteley degmo deresegn view maletachn atm mazezachn nice cbe	5	2024-02-12	POSITIVE	0.706870675	General Feedback
aa4c4185-7a3c-439f-b20f-a4ef5cdfecdd	1	It's very good app and It's best than any banks app. but the only problem I got is the financial status display is limited, it's shows very few transactions	3	2024-02-12	NEUTRAL	0.954514980	Bugs & Reliability, Transaction Performance
bc5ce9dc-2828-443a-9090-097bf6ae705d	1	I really appreciate CBE app's move toward excellence. The receipt option included in CBE app's is very nice.	5	2024-02-12	POSITIVE	0.999750435	Feature Requests
ac6861fe-1a58-4161-b63a-709b972a9110	1	The Updated version of the app is awesome. Really Enjoyable to got sealed Receipts with barcode.🙏🙏	5	2024-02-12	POSITIVE	0.999818146	General Feedback
7df41b74-93ed-4339-9c5d-af384cc45e1e	1	It has limitation yet improve	3	2024-02-12	NEUTRAL	0.764387667	General Feedback
3ead1964-b3e4-4361-b8f8-80e518558212	1	It just keeps getting worse. You no longer have the frequently sent accounts log which was the best feature of this app.	3	2024-02-12	NEUTRAL	0.999192536	Feature Requests
19a5015b-f091-49f8-8558-45a5fbf66cc3	1	Worst update ever 👎 👎	1	2024-02-12	NEGATIVE	0.999783337	Feature Requests
68c21716-6a7b-4317-83f2-266d8f3d591f	1	Still you roll a same problem with the new updates. When we do mobile transfer after we write short Reason and finish it says Error by writing the amount to transfer and your commission. It do the same thing again and again. Finally the person who receive the money got three times...there is no such thing in other private banks. Only the giant Commercial Bank of Ethiopia have this problem always. Why why why ? Is it difficult for you to get solutions ?	1	2024-02-12	NEGATIVE	0.999109209	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
be1933e5-a5c7-495c-b797-6c4b7f21379b	1	Dear CBE Team Please include the international card balance details in the CBE app.	5	2024-02-12	POSITIVE	0.992124736	General Feedback
8aaddd57-1c37-4d3a-beda-f90fdb6c93eb	1	Commercial bank of Ethiopia is Our best best bank alwayes found where we go. I love my bank.	5	2024-02-12	POSITIVE	0.999832988	General Feedback
2be7f7aa-dc3b-4afb-b305-2c0cf589250e	1	Urgent fix the app is not working	1	2024-02-12	NEGATIVE	0.999770701	Bugs & Reliability
efbd9ce2-4ede-4b41-9dec-d1e0bc03b3df	1	Maybe the only nun crushing banking app in ET??	4	2024-02-12	POSITIVE	0.998245358	General Feedback
3e15651b-e0ed-48e6-8f0d-7efce3f9c3f6	1	The worest apps specially when you in emergecy. Really annoig app sorry to say this but I have too.	1	2024-02-11	NEGATIVE	0.982728302	General Feedback
5d743aa8-6442-4fa3-825e-105bcfd3a6c5	1	What's new in the latest update? Is it an in-app notification that cannot be opened?	3	2024-02-11	NEUTRAL	0.999595821	Feature Requests
fed33d17-880a-43b4-bcad-67753a267b79	1	Good of good	5	2024-02-11	POSITIVE	0.999845743	General Feedback
cff4bd5d-2d37-4d97-b044-b0ef2e28ac7f	1	Good update 👍👍 Scanning Qr code for receipt and receive money via qr code is good. But please make the CBEBirr app work easly like this it's not working on android version under 8.	5	2024-02-11	POSITIVE	0.997546613	Bugs & Reliability, Feature Requests, Transaction Performance
713eee56-6579-4cef-bf59-ff28441dd291	1	what the app!!! i really really like this app. the best thing CBE done.	5	2024-02-11	POSITIVE	0.999734938	General Feedback
0ff1fb89-4e71-497d-a8d2-3fe6bffc84a8	1	I love it	5	2024-02-11	POSITIVE	0.999879956	General Feedback
7a68bd21-4954-48c2-b8d1-086c930053c2	1	I like it this version	5	2024-02-11	POSITIVE	0.999837518	General Feedback
2265328b-528c-489a-bc2c-33426d41758d	1	Excellent Application that's easy for use.	5	2024-02-11	POSITIVE	0.999822199	User Interface & Experience
3d4fae0d-efc2-4f0c-a573-f126bc403dec	1	Too fast also make transaction easily and secure but i have question in visa replacement and new	5	2024-02-11	POSITIVE	0.978879094	Security Concerns, Transaction Performance
7874fd04-84fa-4c03-a3d6-df74eaeeb318	1	This app make me easy my life	5	2024-02-11	POSITIVE	0.997969925	User Interface & Experience
0d19f75d-a740-4924-af97-f1a89ee066c4	1	Best Banking system	5	2024-02-11	POSITIVE	0.999794543	General Feedback
1174da5d-489b-48c9-a604-2a851c5e4fe0	1	The balance history presents absurdly. Make it either from recent to old or from old to present. It is messed up and vague.	1	2024-02-08	NEGATIVE	0.999650955	General Feedback
a77cd516-689f-4f01-8902-c3e075e3237e	1	I am X employee after retirement I use the bank's digital service. What I experienced on employees assigned their knowledge to handle responsible tasks but thinking not knowing what will underestimate their post but they pretend to take risk where they will fail to handle and reveal inefficient operation. Anyhow the fact to learn modern technology effecting need to dare risks with strict follow system developed with good performance and personality.	5	2024-02-11	POSITIVE	0.742062032	App Speed & Performance, User Interface & Experience
eb59a6be-c410-4bcf-8f83-e7ad454ff332	1	I love it	5	2024-02-11	POSITIVE	0.999879956	General Feedback
5aaa5334-96e3-403e-8d05-565bf65e17ca	1	Continuous updates of the app makes it easy, fast, and secure to use. I feel safe and secured to use this app. Thanks CBE🙏	5	2024-02-11	POSITIVE	0.999530315	Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
a51b666b-2685-4907-84b3-5e7abc3873f8	1	It gives fast service!	1	2024-02-11	NEGATIVE	0.999730885	Transaction Performance
c6900cf0-574c-4c77-8a84-6f88e3959b00	1	Better and good technology	5	2024-02-11	POSITIVE	0.999873519	General Feedback
71b5d55e-58d1-4619-b42a-fcf18d5fb561	1	5 Star bank good	5	2024-02-11	POSITIVE	0.999803483	General Feedback
dd2078d1-fe7d-4eff-8e89-98e739acf471	1	The new updated version is very satisfaying	5	2024-02-11	POSITIVE	0.998888552	General Feedback
f22c8eed-75c5-47f4-8304-4a4bc32f9cd6	1	After updating the latest version, the app is no longer able to synchronize. Urgent fixation needed.	1	2024-02-11	NEGATIVE	0.999550760	General Feedback
cf537cd6-b521-41e2-b380-fc6165ebefc6	1	After I installed the app, when I tried to send money before, it would bring me the people I sent, but now this thing is gone, so why is the suggestion left? Other than that, it is a great application that is easy to use and accessible	3	2024-02-11	NEUTRAL	0.996750832	Feature Requests, Transaction Performance, User Interface & Experience
b7b199f1-2a66-45cf-b473-8c4831248824	1	Improved performance with the new version.	5	2024-02-11	POSITIVE	0.999728739	App Speed & Performance, Feature Requests
e4b75120-bbe9-4471-a723-6a128c0def4c	1	Updating isn't working	2	2024-02-11	NEGATIVE	0.999670148	General Feedback
dbf7039c-6d93-4286-b250-a78b48ffb8ae	1	Fayis Ateyib Asmani	4	2024-02-11	POSITIVE	0.810461402	General Feedback
f41cefa8-39d9-4edf-9e29-376b4b2c9382	1	This app is help as more and more	5	2024-02-11	POSITIVE	0.929154336	Customer Support
0028747c-dad4-4893-9141-3098c62b99fe	1	After the new update it is not working at all it doesnot sync and all form of transfer is not working	1	2024-02-11	NEGATIVE	0.999769509	Bugs & Reliability, Feature Requests, Transaction Performance
c88c438d-963f-4bcd-9b64-37722e639e11	1	Preferable and No #1 mobile banking appn!!just wow... 🙏	4	2024-02-11	POSITIVE	0.997277439	General Feedback
7c5c1012-8974-469a-b3c6-1383e5ef004c	1	The weirdest bank ever. Weird customer service weird network.....	1	2024-02-11	NEGATIVE	0.997601926	Customer Support
d1863629-bfdc-4edd-bd69-f43607905258	1	Yeroo tokkoo tokkoo app kuni hin hojatu rakkoo qaba.	1	2024-02-11	NEGATIVE	0.993311882	General Feedback
f1d8a8ae-b76a-407d-972a-71a603bf02ba	1	I'm good man	5	2024-02-11	POSITIVE	0.999845982	General Feedback
aef9c032-4759-4bd3-b0a4-db27ec737201	1	This app makes me upset. When they update the app they are updating bug not the functionality of the system.	1	2024-02-11	NEGATIVE	0.999619484	Bugs & Reliability, Feature Requests
cf06cc97-10da-42ae-a779-7a5eb67bfc4b	1	በጣም ቀፋፊ እና አስጠሊታ ባንክ እና app ነው። ሰው urgent ችግር ቢገጥመው እንዴት ሊሆን ነው ቆይ?	1	2024-02-11	NEGATIVE	0.977258801	General Feedback
83c3d3f0-392e-4e09-bd34-8b1c67f1abf3	1	Network error becha nw milw,wede branch mehede alben endatlu becha??	2	2024-02-11	NEGATIVE	0.998461127	Bugs & Reliability
e94d5016-df5e-4cef-88b2-eb03f193f810	1	Why is the app malfunctioning after the update??? It was just fine before the update...🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔	1	2024-02-11	NEGATIVE	0.998666763	Feature Requests
d93ce07c-3c67-40db-b65b-a5c52b185d50	1	The app stops working	1	2024-02-11	NEGATIVE	0.999688983	General Feedback
79e9e10b-1761-4b9f-aec1-7bcd4b71c590	1	Since I updated the app its not working	2	2024-02-11	NEGATIVE	0.999741852	Bugs & Reliability
12cd33b4-8dcc-48aa-8a5f-a3553fc59184	1	This version is not working well the old version works with out any problem. Please make adjustment in thjs version.	1	2024-02-11	NEGATIVE	0.999436677	Bugs & Reliability
459d069e-1037-4f7f-8131-764fcc035390	1	To transfer 10br to telebirr you charge 10br, not just for 10 birr, the same for 1 birr too. what a rubbish	1	2024-02-11	NEGATIVE	0.999717057	Transaction Performance
392d0a4a-7451-4abb-a470-169375141dcd	1	It says "Network error!" after update @feb 11, 24	3	2024-02-11	NEUTRAL	0.999653459	Bugs & Reliability, Feature Requests
57584a8b-56b0-45ea-8b50-404faef930bd	1	It is good	5	2024-02-10	POSITIVE	0.999849439	General Feedback
8047c2cd-cafb-47b4-ac08-dce66773e5c7	1	Every fill is a chance to rize	5	2024-02-10	POSITIVE	0.998916745	General Feedback
aec5d01d-b376-4476-bc53-803d48ce3288	1	The leading bank	5	2024-02-10	POSITIVE	0.999466121	General Feedback
1bb5cafa-691f-4582-a788-f905aa368fd7	1	Quick transaction and no delays Sometimes ithasa glitch butost of the time great. And the glitch is out side working hours it said transaction failure while your balance is reduced So if you haven't noticed you repeat the same process and your balance gets reduced every time.	4	2024-02-10	POSITIVE	0.984012365	Bugs & Reliability, Transaction Performance
48791a52-ec77-41a4-bc8f-935e94ce31b6	1	CBE is an example of poor service quality.	1	2024-02-09	NEGATIVE	0.999776185	General Feedback
8c3d2fdd-3c8a-4502-839a-d868cd779cf8	1	it is more useful we are free from matter due to availability of this app	5	2024-02-09	POSITIVE	0.586932778	General Feedback
1d0c6060-3181-44bc-8df7-4677c8a708e5	1	Wow Its amazing	5	2024-02-09	POSITIVE	0.999860168	General Feedback
9d94020b-cdbd-47ce-9a0d-ed7f7cf3ba90	1	Bast of one	5	2024-02-09	POSITIVE	0.999642253	General Feedback
5bc5c4f2-3624-485d-ab88-d018384de6f1	1	Always there is a problem on your mobile banking service why don't you update your system	1	2024-02-09	NEGATIVE	0.999173820	Bugs & Reliability, Feature Requests
26e84053-91bb-40f5-aa4d-308db42261a7	1	Smart app I love it 👍	5	2024-02-09	POSITIVE	0.999878407	General Feedback
b63640a9-e009-4d5c-bf59-e69ed846db89	1	Very god active app i liked it	4	2024-02-08	POSITIVE	0.998606503	General Feedback
3e40e41e-5c6c-41cc-a4bc-6b76ba47d2aa	1	ምድረ ገፋፊ በ እያንዳንዱ transfer ብር የሚግጡ ሌቦች	1	2024-02-08	NEGATIVE	0.960119367	Transaction Performance
badc693b-0fec-4565-8e9f-5a4520d04bbf	1	Best app ever	5	2022-11-06	POSITIVE	0.999749005	General Feedback
e7d75b48-4c1e-463d-becf-076cce4fd2e1	1	Why mb app not download	5	2024-02-08	POSITIVE	0.995570719	General Feedback
f25a5286-79c9-4f0b-8c9e-19db2b07c048	1	Easy and safe app	5	2024-02-07	POSITIVE	0.999373019	Security Concerns, User Interface & Experience
32a85186-659b-4734-b469-376b64d47c18	1	ከእሁድ ውጪ በጣም ጥሩ ነው።እሁድ እሁድ ግን ከባንኩ ሰራተኞች እኩል አይሰራም። ይሁን እሱንስ ማን አየበት😂	4	2024-02-07	POSITIVE	0.959342539	General Feedback
9f6ddede-affd-4025-b5ce-7bbf693fa8fe	1	Nice app except sometimes the sync is not working!	4	2024-02-07	POSITIVE	0.641734183	Bugs & Reliability
11028da1-0a28-4ae6-95aa-795ab1800db2	1	የተረገመ app አይሰራም Guys ወይ ንግድ ባንክ 😓	1	2024-02-07	NEGATIVE	0.968366921	General Feedback
7f1a9b31-d760-4d1e-bcef-3105d937ca4f	1	I dont think so	3	2024-02-07	NEUTRAL	0.990539908	General Feedback
53fb7502-b8ba-4e10-a7b9-2271227c5ff3	1	Bad, it's not working for me since one week	1	2024-02-07	NEGATIVE	0.998232841	Bugs & Reliability
8bb9d676-ec7f-49a1-80c2-1f7dcabc2be4	1	Easy and goood app	5	2024-02-07	POSITIVE	0.984087527	User Interface & Experience
a7342f1e-1bab-4ca7-bfdf-3ec627fa426d	1	Very poor app ?! What the heck happened in this app ???😭😭	1	2024-02-07	NEGATIVE	0.999788940	General Feedback
327ca05e-788e-4521-9f78-dc28a1896387	1	It is not working properly ....!!!!	1	2024-02-07	NEGATIVE	0.999787033	Bugs & Reliability
77aaa2b7-670b-448a-bdc2-6ea17ac44d4e	1	It's best👍. But it stops while changing simcard.	5	2024-02-06	POSITIVE	0.980841100	General Feedback
4c83ce35-dfb4-43c4-9560-ee2d78cffedb	1	good app thank u	5	2024-02-06	POSITIVE	0.999848604	General Feedback
3f71bc58-410c-4e98-9583-4e3ca89923ec	1	good app and very inspiring	5	2024-02-06	POSITIVE	0.999881268	General Feedback
dc39ff94-3516-4fcc-b653-f4990c19545d	1	it is good but sometime not working	5	2024-02-06	POSITIVE	0.985004187	Bugs & Reliability
3d3e4dbb-101d-468e-be03-6eb7ca7e22d5	1	My 1st choce	5	2024-02-06	POSITIVE	0.977944553	General Feedback
c2ea5012-e955-442a-83e4-196d87c5b2dc	1	It is so bad to fast buy	1	2024-02-05	NEGATIVE	0.999815404	Transaction Performance
fa6920f7-8dd0-404e-901c-e6fda566f42a	1	U'r good but sometimes your network was unstable	5	2024-02-05	POSITIVE	0.998084068	General Feedback
e8725ff9-5205-4de7-aa04-aa63f6533fda	1	Nice app but when i forget my password to reset it must be uninstall the existing and add the new one ,so this not good	5	2024-02-05	POSITIVE	0.999610364	Account Access Issues, Feature Requests
2c248319-b164-4a05-aa8b-5fb54eb95b77	1	The biggest bank in Ethiopia, still couldn't figure out a simple bank statement and transaction history. ዝፍዝፍ ሁላ	1	2024-02-04	NEGATIVE	0.998005450	Feature Requests, Transaction Performance, User Interface & Experience
c0270400-30af-4af8-a24e-0fc3c35119fc	1	It is great	5	2024-02-04	POSITIVE	0.999880195	General Feedback
a2d75045-b772-45bd-9b95-caaa26b7381e	1	Need learn more	2	2024-02-04	NEGATIVE	0.765541613	General Feedback
2589d4bd-8fd2-4a2c-8268-b39429536dc6	1	Stupid mind always creat bad app!!	1	2024-02-04	NEGATIVE	0.999757826	General Feedback
b3ef50b8-b701-4df7-9cbc-7146986684c0	1	Simplify business interesting app	5	2024-02-04	POSITIVE	0.998989522	General Feedback
d933ebc7-0413-44f5-a045-27d346998fcc	1	Arif app new	4	2024-02-04	POSITIVE	0.520398796	General Feedback
82519b85-b1a2-4414-aee6-256be4ba804d	1	Ariff new But its need More comparability	5	2024-02-03	POSITIVE	0.997478783	General Feedback
408749ba-c1f7-406a-8109-00d223da8049	1	Makes everything easy!	5	2024-02-03	POSITIVE	0.999715507	User Interface & Experience
55ae0112-b4d8-4d47-a69f-7526c584ada6	1	It make my life easy	5	2024-02-03	POSITIVE	0.999154925	User Interface & Experience
74c90d33-b98d-42b8-8f9c-235cf245bbe1	1	Use for me	5	2024-02-03	POSITIVE	0.957957089	General Feedback
2c25d231-51d7-4b6c-bac7-ece14278c7c1	1	Needs urgent fix, account balance os not showing and says none available when trying to send money.Your customer service line is also non functional, they pick up the phone and say nothing.It is unacceptable from such a huge bank.We deserve better after you tax us for sending our own money through your platform.	1	2024-02-03	NEGATIVE	0.999754369	Bugs & Reliability, Customer Support, Feature Requests, Transaction Performance
f2139af1-3275-43e2-9d39-3a41a2f68aa3	1	This app history is not showing ordered form of transactions, and also after a sending transaction is made, sms is not being sent	1	2024-02-03	NEGATIVE	0.998995960	Transaction Performance
5e2c0af1-c898-408d-9bde-218281b0dd49	1	It's so convenient, so much improved, you get a message right after you send it.	5	2024-02-03	POSITIVE	0.797020495	Transaction Performance
b9f35ffb-8ef5-46f7-abcf-a6adde638679	1	I'm CBE costumer for more than ten years And mobile banking almost three years I have to say CBE is the leading app so far	5	2024-02-03	POSITIVE	0.989580333	General Feedback
537fe7ed-215a-4d15-a584-4732f7cd70e9	1	Very good app	5	2024-02-02	POSITIVE	0.999867558	General Feedback
23ccaebd-75f8-4c7a-9e44-507c3d559dce	1	Too difficult to sign in.	4	2024-02-02	POSITIVE	0.999786437	User Interface & Experience
c5f3612b-4b30-4157-896e-14766dff5517	1	Easy and fast	5	2024-02-02	POSITIVE	0.999558389	Transaction Performance, User Interface & Experience
0f508722-4164-4c61-a747-926160a4bcd4	1	the best banking app	5	2024-02-02	POSITIVE	0.999837875	General Feedback
1443340c-f42a-47cd-a896-f7114233054a	1	100 % Awesome love it	5	2024-02-02	POSITIVE	0.999885678	General Feedback
dfc6791e-2bb3-4cf6-b6eb-ac87cbd683ea	1	Very poor app. I had to make 8 transfers of the same amount as the app did confirm success of the first or second or third etc. transfers. I had to pay etb 13 birr 8 times each for service charge.	1	2024-02-02	NEGATIVE	0.999583066	Transaction Performance
3c43a92b-bc59-45f4-851b-7d819e81760a	1	The best bank!!!	5	2024-02-02	POSITIVE	0.999873400	General Feedback
d2c0e384-1185-4ec0-ae6d-cb342ee27fd4	1	It has very good function.the challenge with it is : it asks a varification key every time you install even for same device.	3	2024-02-01	NEUTRAL	0.998790920	General Feedback
1ad82e9f-b0cf-4b8b-aa1b-c902f6db4311	1	fast and simple	5	2024-01-31	POSITIVE	0.999739230	Transaction Performance, User Interface & Experience
f540210d-ace1-43f8-bb26-2f3ba2ca4aa8	1	Easy and simple.	5	2024-01-31	POSITIVE	0.999663711	User Interface & Experience
21ff1087-7f90-4985-93fa-06dae222e733	1	It's not working, it doesn't display my balance and it doesn't send or recieve any money	1	2024-01-31	NEGATIVE	0.999345958	Bugs & Reliability, Transaction Performance
df9bd627-7109-40de-ab90-aa5f41fdddbf	1	It is nice app	5	2024-01-31	POSITIVE	0.999847889	General Feedback
20c70db2-69df-401d-94ab-2bdae45de785	1	አፑ ምንም አይነት አፕዴት አልቀበል ብሎኝ የተወሰነ ምርጫዎች የሉትም። ለምሳሌ own telebirr....* የሚለው ምርጫ ባዶ ነው	1	2024-01-31	NEGATIVE	0.957943618	General Feedback
3173d9d1-e49c-4bd6-8aa6-80d45fa687d4	1	Dark mode ❌, why? 🧐	2	2024-01-30	NEGATIVE	0.998986900	Feature Requests
dd9867f7-59a1-4002-9aa2-ab8abe5af35e	1	Urgent fix required for the app!	1	2024-01-30	NEGATIVE	0.971598864	Bugs & Reliability
dad48850-5042-40f9-99e7-9a91647e9bf4	1	Am very satisfied by your apply	5	2024-01-30	POSITIVE	0.998887360	General Feedback
8aca5f51-6344-44ff-9a96-def6964ce942	1	I like it thanks	4	2024-01-29	POSITIVE	0.999826252	General Feedback
c6885d9c-77de-419d-b12d-22d3c45421d3	1	It is good app for me ,easy to use i prefare it.	5	2024-01-29	POSITIVE	0.999618292	User Interface & Experience
86624654-2c69-498f-922e-e77e8073032b	1	It takes 10 birr when you send monet to telebirr. No matter how much the amont is.	1	2024-01-29	NEGATIVE	0.998072863	Transaction Performance
d8650ea8-2d8f-4b41-9070-0d4c311e4ceb	1	Very nice app.....tnx cbe	1	2024-01-29	NEGATIVE	0.999512672	General Feedback
c228a357-ce6c-4eec-a833-beef94ffd802	1	A spectacular app, cutting-edge technology, thanks for your service.	5	2024-01-29	POSITIVE	0.999620676	General Feedback
a138c9ca-fdc1-472d-a553-2b7bbdd19a42	1	It perfect and good app for me	5	2024-01-28	POSITIVE	0.999876142	General Feedback
41522cd3-db5e-41f2-8907-77eb27a6c852	1	The best online service anywhere in the world working very fast Zero problem thanks CBE!!	5	2024-01-27	POSITIVE	0.999744236	Bugs & Reliability, Transaction Performance
77a9c9c3-b552-44d2-bf22-d3ef086a0fd6	1	Is the best	5	2024-01-27	POSITIVE	0.999841809	General Feedback
56af61e2-1c7f-4af4-87a0-7ae3127697a0	1	It's nice and favorable	5	2024-01-27	POSITIVE	0.999856949	General Feedback
b96dc7b5-ee14-47da-8ffe-58ac0feb298c	1	Shall we stop using the mobile banking app.what is your intention with putting 10 birr charge on every transaction. How can u manage on charging 10 birr on 5 birr transaction it's not fair. Upgrade your inconsiderate system.	1	2024-01-27	NEGATIVE	0.999591887	Transaction Performance
ec8390c8-2d6d-43e5-97fb-f3e980186027	1	It is a good app. But it is better to add the following features in the next version, 1) Add ATM withdrawal option 2) Password reset option 4) Finger print option 3) E-receipt	4	2024-01-26	POSITIVE	0.602565229	Account Access Issues, Feature Requests
69a03413-328c-42e0-8bca-a2f765ac110c	1	Best application that make community life easy	5	2024-01-26	POSITIVE	0.999726832	User Interface & Experience
25f81aa7-f9f9-4823-b093-d7bcdba39f24	1	Why this app was miss some transuctions	5	2024-01-26	POSITIVE	0.999531031	General Feedback
b8c0eead-461f-4294-89bc-c701005e828c	1	Yes it is what I need Thnks	5	2024-01-25	POSITIVE	0.997958422	General Feedback
1112cd3e-279d-4121-add8-d3a17c65c570	1	For the last two weeks the app is not working. Please address the issue as quickly as possible. Urgent action is needed!!	1	2024-01-25	NEGATIVE	0.991572499	Bugs & Reliability
2dc529ca-e6c3-4414-a5d7-92c9aa53da48	1	በጣም ፈጣን ነው የበለጠ አሻሽሉት	5	2024-01-25	POSITIVE	0.883213103	General Feedback
e675f7dc-831f-48f5-ba46-663d958e5263	1	Very good and simple for use	3	2024-01-25	NEUTRAL	0.999871135	User Interface & Experience
d57eb3a1-d1cd-4590-9596-59feaab11a04	1	The app is broken, I can't see my balance or use any of the services ,when I try to transfer or do any thing else, error message "none available "appears. Please fix this problem.	1	2024-01-24	NEGATIVE	0.999781787	Bugs & Reliability, Transaction Performance
d1f42380-eb1d-4623-91d3-89f47ccd506f	1	The app that I use didn't transfer money to my telebirr account. There's no where to be found "Transfer to Telebirr". Only transfer to Telebirr agent is available and it require short code. It turns to be boring app ever.	1	2024-01-24	NEGATIVE	0.999739707	Customer Support, Transaction Performance
3426eea9-57df-47ec-af40-c042cff7070c	1	İs app is so hassle for use	1	2024-01-24	NEGATIVE	0.999209642	General Feedback
a7e16fa6-9fde-4ee0-9ed4-10f14383ffaa	1	The new version is useless it doesn't work at all, very disappointing.	1	2024-01-24	NEGATIVE	0.999721229	Bugs & Reliability, Feature Requests
9bbfc8a7-96c7-4b3c-b5c4-5c79d06d9180	1	Its not working	1	2024-01-24	NEGATIVE	0.999759853	Bugs & Reliability
6779eafd-77cf-4ef5-94a6-8616125fcffb	1	Fast and reliable app .	5	2024-01-23	POSITIVE	0.999783099	Bugs & Reliability, Transaction Performance
40a28735-d570-4b2f-980d-510451fc540c	1	Good but do more on it	4	2024-01-23	POSITIVE	0.999518871	General Feedback
fb1f4d55-5ffb-40d0-ae19-d23d6d6761db	1	I'm so happy in these Apps	5	2024-01-22	POSITIVE	0.999871016	General Feedback
b342e853-77b1-412e-a0e8-6aad8c92b77d	1	It's good app.	5	2024-01-20	POSITIVE	0.999867797	General Feedback
819f009a-8ad2-401f-80a6-de1672949e39	1	It is easy to use and simplify everything	4	2024-01-20	POSITIVE	0.998800278	User Interface & Experience
8801a511-052d-45b3-a9d0-b7f752b92166	1	Please check this application best	5	2024-01-19	POSITIVE	0.997268677	General Feedback
8f0b5946-b68b-4caf-b25b-eba36194198e	1	Can't sync any more. I think it needs some updates	1	2024-01-19	NEGATIVE	0.999496698	Feature Requests
6c2b7167-8631-4d4c-a675-d2e449246f00	1	waw very nice app	5	2024-01-19	POSITIVE	0.999773443	General Feedback
793136fa-9773-4445-9103-12159b298529	1	Not Best app	1	2024-01-19	NEGATIVE	0.994714558	General Feedback
2c74a4c6-c943-4bb6-9ff9-aff1800eb642	1	it stops raining why?	1	2024-01-19	NEGATIVE	0.989978313	General Feedback
9aed8ef1-a7d7-4946-8b49-1096d9489293	1	M-pesa lay genzab leke 100 ber belabegn	5	2024-01-18	POSITIVE	0.954914629	General Feedback
bbf41cf7-45eb-4474-ad7b-4e021144dda3	1	1. It is good, flexible, simple and easy. But it can't serve offiline and didn't compliment with the ussd *889# 2. Checking Account balance is off and hidden under transfer.	4	2024-01-17	POSITIVE	0.993824124	Transaction Performance, User Interface & Experience
289730bc-4984-4d26-8d2a-d2f71c513a03	1	It says non available always disappointing	1	2024-01-16	NEGATIVE	0.992140710	General Feedback
04607922-dcb7-4903-b84f-320494c0672a	1	Tha best one	1	2024-01-16	NEGATIVE	0.999654293	General Feedback
724b1452-6530-4c33-8a03-968c5b200ad1	1	This Application is super fast and Amazing performance. Thanks CBE	5	2024-01-15	POSITIVE	0.999869466	App Speed & Performance, Transaction Performance
bad5b5b7-0413-4c04-b3bb-1c3f007b89bb	1	Wonderful mobile Banking application	5	2024-01-15	POSITIVE	0.999848366	General Feedback
d95cef6a-e667-497d-b497-3fbbabc68861	1	Most of the things work just fine. But the transaction history doesn't work properly/right.	2	2024-01-15	NEGATIVE	0.999026299	Bugs & Reliability, Transaction Performance
4ff05e83-b5d6-4e2e-8ef5-d2ef52f35f3b	1	If Zero and negative rating is allowed the TCB bank's this application and *889# & +951 deserves -100. I am calling the bank TCB b/s they shouldn't allowed to use Ethiopia for Trash bank). "None Available" for all service b/s of their management uncalculated, illogical & greedious decision of service charges which wasn't stayed morethan 5 days. Why should I go to Addis Ababa just I opened my account in Addis I while I am living in Dire in the current era where all things are digitally connected?	1	2024-01-14	NEGATIVE	0.998908162	Transaction Performance
09654a6a-8905-40ce-997d-8c40004e9c7c	1	Very stable and easy to use it's way better than any other bank apps	4	2024-01-14	POSITIVE	0.999671936	Bugs & Reliability, User Interface & Experience
7604838a-f219-44e7-89d3-ea68226f546f	1	Very good app	5	2024-01-14	POSITIVE	0.999867558	General Feedback
e5dfba9e-4290-4926-9983-924ccfbde51e	1	Why verification online or sms?	1	2024-01-13	NEGATIVE	0.995714843	Account Access Issues
97763f96-938b-4127-a844-e5aadf53071c	1	It is fast and secure.	5	2024-01-12	POSITIVE	0.999701798	Security Concerns, Transaction Performance
6eacd6e6-1cca-4d9a-b348-e808826b6a68	1	I haven't been seen on it any problems before but here i faced some obstacles to enter to my account it says me "no account available" so help me and solve this problem.	4	2024-01-11	POSITIVE	0.999525905	Bugs & Reliability, Customer Support
7395b05a-c33e-47ea-9128-f687201f49de	1	Always eventough I have enough balance I cant make bill payment saying insuffcient balance. I always have to ask other for adding me more extra money. If it is your marketing stategy to make people deposite more, thats not a strategy....its theft ለዛውም የማይረባ ብር ለመለቃቀም ብላችሁ	1	2024-01-11	NEGATIVE	0.995288849	Transaction Performance
e1d8c77a-481a-453e-b331-2eb514115b69	1	I can not use the app after I reinstall it while I am abroad. It requested me to get security key from nearedt CBE branch. There is no CBE branch overseas. Due to this reason I can not acess my acount using the app!!! CBE should resolve this for diaspora customers.	3	2024-01-11	NEUTRAL	0.993250012	Customer Support, Security Concerns
bc51783e-d5e4-476d-bdd2-4bd5640fb161	1	It was better if it showed at least the last 20 transactions, and one good thing is you can search people from history by their name.	3	2024-01-11	NEUTRAL	0.999256074	Transaction Performance
bec7821a-1b8f-4ef8-b0e9-3030acdc9128	1	the worst app and bank in Ethiopia ever. Yoy have to come to their branch to start your mobile banking and have way too high transaction fee and hidden cost for every transaction.	1	2024-01-11	NEGATIVE	0.999785125	Transaction Performance
e495c367-7ee5-49db-a71e-67af49762a7f	1	Thank to God	5	2024-01-10	POSITIVE	0.999818146	General Feedback
10282eea-0882-4b10-b22d-f398a25fc85f	1	I love this application it is easy to use and fast . i recomed that it may use with out network if it is possible	5	2024-01-10	POSITIVE	0.999359787	Transaction Performance, User Interface & Experience
57d9c99a-2ed9-409d-abf0-349de10a814c	1	Its good app	5	2024-01-09	POSITIVE	0.999861360	General Feedback
3d017b89-2608-4c90-8464-db388b9f9f22	1	እጅግ ፈጣን እጅግ ቀላል	5	2024-01-08	POSITIVE	0.861633003	General Feedback
9aa49331-4781-487c-b57a-fc3d2d0c8cad	1	Why it says critical update repeatdly and when I updated asks similar question	2	2024-01-08	NEGATIVE	0.997910917	Feature Requests
53ba07c4-3a5d-4cbf-a15c-30f59e679b14	1	The most comfortable app... fast booom 🥰🥰	5	2024-01-07	POSITIVE	0.994469881	Transaction Performance
0919d800-f4be-49a1-a2e5-f23f0f6af82f	1	my rooted send me	5	2024-01-06	POSITIVE	0.988437712	Transaction Performance
02a36c22-2ab5-4ef7-a8ad-66a12282b331	1	Best app ever.	5	2024-01-06	POSITIVE	0.999779880	General Feedback
221b30dd-d982-4b87-908d-39dd71e4c9cc	1	No way to give negative feedback. toughen up!	5	2024-01-06	POSITIVE	0.999475420	General Feedback
a5469ad1-9ac8-4246-96b3-4f0f28abd590	1	For late some times but more is good work	2	2024-01-06	NEGATIVE	0.998999178	Bugs & Reliability
023bdd95-f9e4-46fa-8023-e75f2c97ce02	1	Thanks for your help	5	2024-01-06	POSITIVE	0.999606669	Customer Support
bbbb2d1e-2c51-4560-826e-42a67bcb1b18	1	Gena salgeba new verification miteyikegn keyet endametaw new??	1	2024-01-06	NEGATIVE	0.996108592	Account Access Issues
3de4dfc3-b2ae-4523-ac55-7db01b69690e	1	It should be more secure if some one knows my pin which is very short 4 digit number can be cheated its worisome to use it	1	2024-01-06	NEGATIVE	0.998948872	Security Concerns
eb203629-2e18-4201-a144-45285dcb8c60	1	I found this app so useful. I'm a 17 years old and I used CBE for almost 2 and half years now I got this app so I don't go to any branch instead I use this app.	5	2024-01-06	POSITIVE	0.956034482	General Feedback
d61383a1-2c90-452d-aa1d-d100fb2273a8	1	Mobile banking is very important.	5	2024-01-06	POSITIVE	0.997864783	General Feedback
02492b13-0a08-4fcb-a89d-4b6fe9f43ec3	1	Not working my application 20 days olmost I'm not in ethiophia now 😢	1	2024-01-06	NEGATIVE	0.993963659	Bugs & Reliability
bded273e-750b-4dfe-a45a-2a8a3a3a96b1	1	Woow nice app. I think the new update is very nice because after i update it, It didnt ask me to go to branch for authorization.	5	2024-01-05	POSITIVE	0.982105732	Feature Requests
721743bc-83c1-4a24-abf7-2644ecf2def1	1	This app is not worthy to be trusted with handling large amount of money. Becareful with this kind of badly developed app.	2	2024-01-05	NEGATIVE	0.999811828	General Feedback
19b55702-2147-4f03-875f-5753976e4ff3	1	So easy. Faster!	4	2024-01-05	POSITIVE	0.998583555	User Interface & Experience
e74d2162-5103-4a3d-b5e0-e885e6b6ea64	1	Up date it	2	2024-01-05	NEGATIVE	0.999788702	General Feedback
144f4396-64aa-4f45-8751-30b8ed612857	1	wow it's amazing platform for sure. Speedy and fast transaction that everyone enjoy to it.	5	2024-01-05	POSITIVE	0.999868035	Transaction Performance
8ec66254-2cb9-464c-93fb-0e366269156b	1	I have no words to appreciate, thanks. It simplifies our daily life.	5	2024-01-04	POSITIVE	0.994316399	General Feedback
cd26fa1c-3f59-4180-aafd-e97c106e1c08	1	Worst app in the world 🌎	1	2024-01-03	NEGATIVE	0.999779165	General Feedback
b7c99c93-75fd-4310-b353-ade24931fa5c	1	ሙሠማ ኸሊል 100	1	2024-01-03	NEGATIVE	0.896281719	General Feedback
a02dd13c-7363-4b7e-a812-1531a47b0c09	1	If you want change your phone device or if your app suddenly deleted you must go to Bank branch and pay CBE mobile banking activation payment again and again. this is not appropriate. additionally customer service at branch is disgusting	1	2024-01-03	NEGATIVE	0.999752820	Customer Support, Transaction Performance
98243e38-bea6-4def-b90f-95d521643a86	1	Totally no response when calling on 951.	2	2024-01-03	NEGATIVE	0.999561608	Customer Support
53fb8457-6843-4cd9-b96b-73cc3f3f5cd6	1	It's very hubs new	5	2024-01-03	POSITIVE	0.998822033	General Feedback
88ee0e32-cba4-4ff1-912e-a85bab76d3c1	1	What is this "none available" nonsense? The Mobile banking doesn't work either. I even went to a nearby bank to get it fixed but they don't even know what to do. This is so frustrating.	1	2024-01-03	NEGATIVE	0.999658585	Bugs & Reliability
d998c52c-2d63-470d-af4b-a597f07e26a6	1	INTERNET BANKING methba	5	2024-01-03	POSITIVE	0.587657034	General Feedback
fd67923b-07ef-44f5-bdaa-45602c7b5293	1	More secured application	5	2024-01-02	POSITIVE	0.987352252	General Feedback
38b62d2d-33b1-4c21-a522-623a18739d3b	1	The app didn't function	1	2024-01-02	NEGATIVE	0.999750316	General Feedback
c6b3f8e6-5faf-4dd3-ad89-73265910becf	1	nice app for me to use	5	2024-01-02	POSITIVE	0.999480188	General Feedback
385ca65f-db18-4acd-bd08-d30c88c48bb2	1	App is don't show balance	1	2024-01-01	NEGATIVE	0.999650598	General Feedback
5a5be617-f9e2-4274-b808-3c75aa7eac4a	1	why can't sync all day while there is Internet pls fix it ASAP	1	2024-01-01	NEGATIVE	0.997791290	Bugs & Reliability
63a7f93b-0d35-4ce4-bdc8-fa09333b16b0	1	Pleas give me loan	5	2023-12-31	POSITIVE	0.970987082	Feature Requests
51c496b0-5e69-4353-b26f-69dcf1c1c273	1	Fast and user friendly	5	2023-12-31	POSITIVE	0.999061406	Transaction Performance, User Interface & Experience
3a863781-ad89-406b-abc3-78428355d32a	1	Very help full	5	2023-12-31	POSITIVE	0.994971395	Customer Support
ff4e3086-a2b6-41c6-a6b3-d3c81cc368fb	1	The home page is bad	3	2023-12-30	NEUTRAL	0.999812543	General Feedback
ded17f4b-27cd-4473-99c6-a5230d4c5639	1	It has every solution for every Ethiopians	5	2023-12-30	POSITIVE	0.962083519	General Feedback
6ece9ebd-f7d5-4be4-9803-3c9e8db1676e	1	I love it it is perfect I am proud of my bank	5	2023-12-30	POSITIVE	0.999884725	General Feedback
9598ad5c-8eab-45db-bd83-6948131821da	1	I like the app it's simple and transparent	5	2023-12-30	POSITIVE	0.995304704	User Interface & Experience
14e8af1d-0edc-4949-ac55-202c128d7d90	1	It is light, excellent app.	4	2023-12-30	POSITIVE	0.999842763	General Feedback
48047041-884e-4319-851f-df4faba172a1	1	Amazing ande best app	5	2023-12-29	POSITIVE	0.999850869	General Feedback
c6c7aa2e-82fa-4419-b522-67cff0351f55	1	It is the worst of all mobile banking apps	1	2023-12-29	NEGATIVE	0.999800146	General Feedback
27f94255-ec29-4ce3-830b-c616f6ffb65c	1	The most stupidly incredible bank i didn't known how a system get so stupid	1	2023-12-29	NEGATIVE	0.977560639	General Feedback
d225f8c2-1108-4df3-96f0-b6876e5eb691	1	Horrible app ever	1	2023-12-29	NEGATIVE	0.999537230	General Feedback
fba58de0-5273-4127-9928-b4714248643c	1	The app is absolutely amazing with seamless functionalities. I never face any hurdles while using it. It deserves 5 stars!	5	2023-12-28	POSITIVE	0.999854445	General Feedback
7f5f11f5-b028-45c2-8925-a5e306cc79ff	1	It is very good up and it is to transfer money and pay for other things	3	2023-12-28	NEUTRAL	0.999854088	Transaction Performance
6c4b6a92-b17d-457d-945f-e72ff0153280	1	take To Use Option	5	2023-12-28	POSITIVE	0.886538744	Feature Requests
ba2a44bc-2c16-482b-9ec7-a86fab54fcbe	1	I'm always using the Apps safely.Thanks.	5	2023-12-27	POSITIVE	0.999850869	General Feedback
e24a3eab-b48e-4b0e-aee6-18b565df7001	1	The app close automatically when trying to request ATM replacement	3	2023-12-27	NEUTRAL	0.994948268	General Feedback
00e6d9d8-1001-4f9b-aa55-be3c2e663623	1	Unrealeble in many ways; double payment more than 5 times; frequent interruptions; and don't produce receipt more often. CBE - pls come up with a better version as we move more and more to e-payement.	3	2023-12-27	NEUTRAL	0.997781575	Transaction Performance
080004c3-262f-4fe4-b83c-c2419c5c70dc	1	The update made on the app. each time is good .but the recently added "standing instruction "menu doesnt contain a reverse/deletion mechanism if one wants to stop it.	3	2023-12-27	NEUTRAL	0.987774074	Feature Requests
98ea2aa0-addd-4e2c-ad61-c90948a2b6b8	1	Please stop taking 5 birr from each transaction we made it is very unfair and Ethswitch has to be legally stopped this action ... Very shameful,	1	2023-12-27	NEGATIVE	0.999456823	Transaction Performance
1effe13b-8276-4312-a5d0-ada6dd20fab2	1	Amazing platform, reliable and convincing mobile banking	5	2023-12-27	POSITIVE	0.999851584	Bugs & Reliability
e9797e69-9294-4068-b793-c58dfff348c9	1	I have been using this app for one year.It Is an amazing application,I have never been used such like app in my life.It is very interactive ,compatiable with any android phones,easy to be used by any one irrespective of any level of education and very realiable to realized digital banking system all over the globe.I Wish all banking sectors will update their mobile banking system based on this app. CBE is My bank and I Proud of it Shumet Mamo Sassie	5	2023-12-26	POSITIVE	0.996308506	Feature Requests, User Interface & Experience
9b341221-1506-43b6-9476-9eab4ef84ff8	1	URGENT FIX REQUIRED!!! The app does not work anymore! Account balance is not displayed. Trying to use any service on the app shows error "None available". What is the point of an internet/mobile banking app if you cannot carry out banking services from your fingertips? I also don't want to reinstall because CBE activation code can only be recieved in the bank, which sounds very ridiculous. These days, banks send OTP to email, so customers can manage their account anywhere in the world.	1	2023-12-26	NEGATIVE	0.999647617	Account Access Issues, Bugs & Reliability, Transaction Performance
ba60f73c-3dde-4683-9cc5-1b200d8e27e5	1	Excellent. But, the service charge is insane 😭	5	2023-12-26	POSITIVE	0.875388384	Transaction Performance
fc9e0165-680f-45b7-aec1-edcf127fe4a4	1	From these week App is not functional	5	2023-12-26	POSITIVE	0.999693274	General Feedback
17f0c2a8-a63d-4647-9e22-aad7e5777387	1	Overall good but there are times when it does not sync	3	2023-12-25	NEUTRAL	0.887864649	General Feedback
7cf3116a-9ee4-4975-b147-0ffbbede33d3	1	It is a nice app	5	2023-12-24	POSITIVE	0.999847293	General Feedback
7cc7cc69-b75d-4fc4-b802-a8a3a4541492	1	Why is problem non available	2	2023-12-24	NEGATIVE	0.999533296	Bugs & Reliability
96b8aab7-5715-4109-82d1-91e41064bb0f	1	Thanks for all	5	2023-12-23	POSITIVE	0.999737918	General Feedback
a13600c7-49ba-4a43-ae25-1cbf21305265	1	How can to add two account	5	2023-12-23	POSITIVE	0.654623747	Feature Requests
7294a3f6-6cba-4a3b-b5d8-0cd7324eb165	1	USSD *889# ሆደን አቁስሎት ነበር ይህን አፕ ካስከፈትኩ ወድህ 889 ሞክሬው አላውቅም። ይሄ በጣም አሪፍ ነው።	5	2023-12-23	POSITIVE	0.967463970	General Feedback
270e2a2c-ed46-4eea-b04f-f7e54df7a344	1	It's very especial app but it may have security problem b/c if I change sim card it work	5	2023-12-23	POSITIVE	0.993672132	Bugs & Reliability, Security Concerns
43b7c715-c37f-49ef-8025-557a5045360b	1	I am first-time to use this app.	5	2023-12-23	POSITIVE	0.983623624	General Feedback
4af4e0da-cef6-4dce-bdb6-044abcbabb7b	1	I like it, it is easy to use!	5	2023-12-23	POSITIVE	0.999784768	User Interface & Experience
a62b7727-bfb0-438e-bf4a-078608d93e88	1	አፑን በጫንኩ በሳምቱ አቆመ ወደ ባንኩ ብመላለስም ለ3 ጊዜ ፎርም ሙላ ከማለት ውጭ መፍትሄ የለም።	1	2023-12-22	NEGATIVE	0.957020819	General Feedback
dde25a0a-684b-4484-93c8-876be6f12d96	1	First of all may almighty God bless the leader and mother of Africa Ethiopia and the people as well. Congratulations to ECB for sharing very interested and helpful application and more early to use Thanks	5	2023-12-22	POSITIVE	0.999777138	Customer Support
c9332c1a-064c-4d45-b78c-08c1ca646e32	1	unbelivable good start	5	2023-12-22	POSITIVE	0.999819338	General Feedback
b6c7abf1-3b35-4c5e-a36f-4079d01789b6	1	The best way to get rid of my life thank you so much ❤️	5	2023-12-22	POSITIVE	0.999565780	General Feedback
20a5383f-28f1-492e-9db2-22dea3c12c70	1	It is fine	5	2023-12-21	POSITIVE	0.999864578	General Feedback
b1e416e5-ab2e-4b7e-8923-614ea0900efb	1	I dont know why but the app is sudenly stop woking please update it	1	2023-12-20	NEGATIVE	0.999368727	Feature Requests
ec3c8fae-35e9-4b6c-8aa7-8a1d0db35b78	1	this application helps us in the fastest way and we can save our time and it is very good because it gives us complete quick response.	5	2023-12-20	POSITIVE	0.999815285	Customer Support, Transaction Performance
0e31b59d-ff5d-45ce-b165-fc85ee8cb3e4	1	So nice and easy to use	5	2023-12-19	POSITIVE	0.999876738	User Interface & Experience
66f46b7e-a552-487f-a343-cf38afd593d6	1	I found this app helpful and interesting.	5	2023-12-19	POSITIVE	0.999467552	Customer Support
dd98b876-b4e7-47c3-b90b-e139ebdf4ea4	1	It is fast and secure.	5	2023-12-19	POSITIVE	0.999701798	Security Concerns, Transaction Performance
cae53f16-7de2-42e4-be25-db4f92c1297b	1	I Wana to update this app ,because when I try to open it ,it's close up immediately	2	2023-12-18	NEGATIVE	0.992249727	Feature Requests
63d41d3c-fdfe-4f5e-b6f3-38d41e69f3d1	1	ease to acces	4	2023-12-18	POSITIVE	0.999681950	General Feedback
fca116f8-9165-4153-a82c-7093b3868995	1	Love this app	5	2023-12-16	POSITIVE	0.999866843	General Feedback
48bc082d-efd3-434f-805c-321c6e46e2ee	1	Extremely frustrating, correct balance is never displayed.	1	2023-12-16	NEGATIVE	0.996439159	General Feedback
bbe3e5b3-9305-4a68-b21e-83b272610e7a	1	The CBE Mobile Banking App has truly exceeded my expectations. It offers a seamless and reliable banking experience right at my fingertips. From checking my account balance to transferring funds, the app performs flawlessly every time. It's impressive.	5	2023-12-16	POSITIVE	0.999833107	Bugs & Reliability
25b8e847-d078-49d1-8474-dd0f48f78b8a	1	best and simple service	5	2023-12-15	POSITIVE	0.999795735	User Interface & Experience
ca2280a0-4b3a-4c6a-b83b-6478653c2552	1	This app is amazing but it stopped working so can you fix the problem	2	2023-12-14	NEGATIVE	0.998606026	Bugs & Reliability
de455704-cef1-49de-b1a7-238b54464222	1	It's cool but I'm not satisfied	1	2023-12-14	NEGATIVE	0.997960091	General Feedback
40b021e4-a5c2-4e43-bc72-c3a8976e179e	1	Best app.. with no complications.	5	2023-12-14	POSITIVE	0.998205900	General Feedback
8722efbf-336d-40a0-83fa-98555dafd8f2	1	I have started using these apps since 2020, and I have experienced a suitable way to do digital money exchange and a simple way of transferring cash.	5	2023-12-14	POSITIVE	0.914997876	User Interface & Experience
5abc44de-26d1-4715-b838-60d01583c3f6	1	It's simple, fast, easy to use and very pleasant. For me, it is a pleasant application of my bank that I always trust.	5	2023-12-14	POSITIVE	0.999870300	Security Concerns, Transaction Performance, User Interface & Experience
0da46255-e83e-4566-8605-add4af1cdf45	1	Won't update my account balance, severely out of sync. When I checked at the ATM it was a completely different number. General cbe problem, but the transactions take 10 days to post from a POS transaction. Makes t extremely difficult to use.	1	2023-12-14	NEGATIVE	0.937401891	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
fccb73d6-bfc9-4e4c-b00c-60decac24d3a	1	Can we see our past transaction record more than recent on this app ??? Please it should have this option .If so tell me how if not please update thIs app soon to accommodate this to obtain as this bank deserves more and more capacity and update every day even every minutes as it represents the golden brand ETHIOPIAN!!!	1	2023-12-14	NEGATIVE	0.984302998	Feature Requests, Transaction Performance
808368c4-8178-4d98-8bac-a5ae40d47c3d	1	Its not update balance immediately	4	2023-12-13	POSITIVE	0.993687809	Feature Requests
68fdfac9-e755-4fc5-939b-c391daf4bfd3	1	Best app ever	5	2023-12-13	POSITIVE	0.999749005	General Feedback
2c43836f-56fe-4750-b2d3-3c01eb01f0d2	1	ሂወትን ቀለል የሚያረግ ለኔ ሁሉም ነገሬ ነው cbe	5	2023-12-13	POSITIVE	0.566318393	General Feedback
10662438-c61a-44ce-9392-203ebdf09bd2	1	It's very nice app, the connection is good as well. But It only allow water bill payment for addis abeba why is that	4	2023-12-13	POSITIVE	0.870255411	Transaction Performance
8462b9e5-b56c-4583-a2d2-d38c8880ee6e	1	It's good but not very good	5	2023-12-13	POSITIVE	0.981216490	General Feedback
73ac293f-742e-49b8-a141-275a4d164cbf	1	Wow good work 🤝	4	2023-12-13	POSITIVE	0.999865770	Bugs & Reliability
a491ade5-7085-4f45-a7ee-29ef03a48b65	1	It's very important for me	5	2023-12-12	POSITIVE	0.999750912	General Feedback
c74d33e7-4176-4159-bd6c-9acb5d80cc0d	1	No words to explain abt this app, it's amazing	5	2023-12-12	POSITIVE	0.996572614	General Feedback
a0cc4e1e-05d5-4667-862b-f74adf6e029c	1	Very good app	5	2023-12-12	POSITIVE	0.999867558	General Feedback
5d1159cc-6d8a-4e87-aace-d95503caca40	1	The transaction no orders	1	2023-12-12	NEGATIVE	0.998169541	Transaction Performance
b74db358-7e32-4d5c-aaa8-b593d8cc0e4c	1	my fav app in the history	5	2023-12-11	POSITIVE	0.995773494	General Feedback
ce71bc53-deea-4faa-baf2-5f445a4b2827	1	It's a beautiful app. But especially when transferring from one account to another, if a receipt is prepared stating the name of the sender and the name of the recipient and the amount of the money. Also, if people make a mistake when making a transfer, it would be nice to have a system where the mistake can be reversed.	5	2023-12-11	POSITIVE	0.980033100	Transaction Performance
8ce9db84-a4a5-4827-9a5c-53f0d511e068	1	It's very good app but sometimes the network is very poor	5	2023-12-11	POSITIVE	0.998561203	General Feedback
b793e325-d28f-4518-b1f2-9ae55dcdfdfa	1	Yes we Love this prowsser	3	2023-12-11	NEUTRAL	0.999853134	General Feedback
f87d187d-6803-4bcc-8ce4-5f000d7e86e6	1	It is fantastic	5	2023-12-11	POSITIVE	0.999880552	General Feedback
4ea1ca1e-8244-4ee6-a2a1-562842f99904	1	Very good APP	5	2022-06-27	POSITIVE	0.999867558	General Feedback
23a5c63c-bad7-43f2-bcfc-00be1b67d01a	1	it's great app when ever!	5	2023-12-10	POSITIVE	0.999853611	General Feedback
b6d29bc5-9ced-466a-b674-bb8f0371a86e	1	it is not working well	1	2023-12-10	NEGATIVE	0.999776781	Bugs & Reliability
6f1b4206-92be-49b9-83ad-919a8842ecfd	1	Good app continou!	1	2023-12-10	NEGATIVE	0.999801457	General Feedback
17710983-c7e1-4782-90bd-e8c4f8a9de27	1	Poor. Sent my money several time also when refresh i can see it statments and it deduct from my acount.	1	2023-12-10	NEGATIVE	0.999175966	General Feedback
a872b836-ff5c-42f0-bb0b-7dcdb0d40451	1	Very nice and well designed! 🙏	5	2023-12-09	POSITIVE	0.999875426	General Feedback
56ee8903-d4f8-4958-92b7-cdeeb3db3154	1	It is not working when I transfer money to another my bank account. So I wish this all functions be avail. Thanks.	5	2023-12-09	POSITIVE	0.995839119	Bugs & Reliability, Feature Requests, Transaction Performance
f528479d-489d-4a88-bc09-4da54566f84e	1	Why it cannot generate key for customers by itself? The main reason the bank suggested this application is to reduce crowded customers from cbe bank branches. The hell your IT department is doing? Why they cannot improve this problem? I don't want to go to Branch bank, they don't know nothing about this application. They're so dumbest person I ever seen. Please try make it simple and very useful application. Don't paint bad color on the legacy of this bank.	1	2023-12-08	NEGATIVE	0.993365705	Bugs & Reliability, User Interface & Experience
b99c9a55-798f-436b-a3d4-47c442260358	1	help me to get the money.n may	2	2023-12-08	NEGATIVE	0.995452583	Customer Support
73cf9b6e-f385-4fdc-afdd-edd73a10e4ff	1	Good applications its very very	5	2023-12-08	POSITIVE	0.999863982	General Feedback
8fe92642-3e9f-4084-917e-ccde722135a7	1	I can't downloaded the recipts which is very important one's, please fix it	2	2023-12-08	NEGATIVE	0.994380057	Bugs & Reliability
a1d0374f-69a6-4cff-a80a-00f6a2586d01	1	This is the best mobile banking app i had ever seen in ethiopia.	5	2023-12-07	POSITIVE	0.999707878	General Feedback
30c6214b-48f6-461f-8a7c-271cd2b05b3b	1	ከንግድ ባንክ ወደ ቴሌብር 1000 ብር ላኩኝ ከዛ 10 ብር ተቆረጠብኝ። ይሄ እኮ ዘረፋ ነው።	1	2023-12-07	NEGATIVE	0.951541722	General Feedback
7ded1882-9022-473b-96ad-3086bf25aabf	1	Nuriye ali yimam	5	2023-12-07	POSITIVE	0.937238634	General Feedback
2fa4175b-aaf7-49b3-b778-59776ea45aa2	1	Difficult to get transaction statement and receipt of single transaction.	2	2023-12-06	NEGATIVE	0.999680042	Feature Requests, Transaction Performance, User Interface & Experience
025adec1-4951-4b47-b1e7-62e025724a9d	1	I like it's	5	2023-12-06	POSITIVE	0.999857783	General Feedback
dab1af23-d1fe-470e-a612-966d9e2bfc08	1	በጣም ምርጥ አፕ ነው። ግን በአፑ ውስጥ የተወሰነ ያልተሟሉ ጉድለቶች አሉበት ከነዚህም መሀከል "የማብራት ሀይል ክፍያ መክፈያ ቦታ ላገኝ አልቸልኩበት እንጂ	5	2023-12-06	POSITIVE	0.960929513	General Feedback
da05c997-9663-4027-b757-d5cd20dabeac	1	Don't use CBE! They start to debated a customer balance without their allow, bad bank!	1	2023-12-05	NEGATIVE	0.968160570	General Feedback
b47e082f-ed9d-46b7-83a3-0562d4102332	1	I really love this app	5	2023-12-05	POSITIVE	0.999857664	General Feedback
717595b8-bf3e-44a6-9b22-facde95a856f	1	It is not active for banking	2	2023-12-05	NEGATIVE	0.999694824	General Feedback
2a65acb9-b938-4f16-b1a0-387ee51ace78	1	Easy and familiar app	5	2023-12-05	POSITIVE	0.998846769	User Interface & Experience
b6af2e68-38e4-42f9-ae4f-edd753eae83d	1	It is very funny and useless app. They developed the app either with lack of necessary technological knowledge or purposely to manipulate their customers. A huge shame for such kinda influential company.👎👎	1	2023-12-05	NEGATIVE	0.999139071	General Feedback
f373c21f-b64e-4ee7-a4bd-f38c541a3471	1	Good app! Really helped me a lot!	5	2023-12-05	POSITIVE	0.999861240	General Feedback
52ad2589-6965-40b1-b228-0269f147d09c	1	Amazing app it's simple to use	5	2023-12-04	POSITIVE	0.999859333	User Interface & Experience
d16d1ed4-9b1c-4faa-9695-cba2aa6064a3	1	Commission paid 5 birr that alot even if I didn't do any transactions they still cut 5 birr soon I will run out money because of this o regret using this. I'm student I don't make money they have to consider what they doing not just that after first time using it they will take/cut 50 birr for fee that unreasonable. DONT USE THIS APP !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! I HAVE SCREENSHOT FOR EVIDENCE DONT REPLY ME THIS IS accusations	1	2023-12-03	NEGATIVE	0.997108638	Transaction Performance
f4a2e962-0c5a-4e88-95ea-a0520fed1a5c	1	I used it for the past 2 years. I live outside of Ethiopia, so it was very convenient to deposit or transfer money to and from my account. However, recently i kept getting "None available" message and not even able to see my balance or pull out people previous account information. So i uninstall and installed it, now it is asking me a key code whice you normally get it from ur bank. As i said,I live outside of Ethio, so unable to use this app anymore.	2	2023-12-03	NEGATIVE	0.998704314	Account Access Issues, Transaction Performance
256ac5eb-69aa-4d34-91a7-698ade223cad	1	It works for me very well. Thanks!	5	2023-12-03	POSITIVE	0.999867320	Bugs & Reliability
bd788450-3514-4663-a95b-1db864a7f570	1	Very useful but after update it's not working properly also transaction history don't display Cleary so pls fix these two things	3	2023-12-03	NEUTRAL	0.999133170	Bugs & Reliability, Feature Requests, Transaction Performance
7190bdfa-fddb-440c-8eae-522df6464ae6	1	Why is this not working on Sunday, specifically now. I'm disappointed about this. This is not expected from a large organization like CBE😡😡	1	2023-12-03	NEGATIVE	0.999651194	Bugs & Reliability
26eeeb25-afef-406b-8ad4-4f9fd204fbb2	1	The best mobile banking app!!!	5	2023-12-02	POSITIVE	0.999838829	General Feedback
b1fdbb00-02e9-4fb1-8244-1e64fe077189	1	10Q for Developers. Is nice app!!	5	2023-12-02	POSITIVE	0.999627590	General Feedback
c7a04f61-ae9e-4b72-85b8-49654f94e277	1	It is good but modify it in away that shows 15 days statement	4	2023-12-02	POSITIVE	0.542246640	Feature Requests
e7df7781-6137-4ff0-a3a1-b2b3b99e15ee	1	It is broken after the last update!!!	2	2023-12-01	NEGATIVE	0.999662876	Bugs & Reliability, Feature Requests
1c220daa-f387-4057-8a89-1e0a06abf570	1	not responsive most of the time.	2	2023-12-01	NEGATIVE	0.999805510	App Speed & Performance
fcd605ec-1874-4aa9-a699-3404a64e6db7	1	I love this App. It is important and helpful on every day activities. Thank you	5	2023-12-01	POSITIVE	0.999861956	Customer Support
2884fd3a-20f9-438f-83dd-0edaf998d321	1	በጣም ምርጥ ነው	5	2023-12-01	POSITIVE	0.833725393	General Feedback
92f3db8f-ae21-4760-b41f-aa6119d1de83	1	It the best one 💯	5	2023-12-01	POSITIVE	0.999844432	General Feedback
9cdfc99e-60d0-4d11-830b-9fe4a783a2d8	1	Thanks for your service	5	2023-12-01	POSITIVE	0.999716222	General Feedback
ac678ce0-1ac6-4205-9c4e-0c0be7f84d7e	1	To.much bug multiple crash you can't even see your statements	1	2023-12-01	NEGATIVE	0.999505639	Bugs & Reliability, Feature Requests
fb4254e4-0283-4b08-b5ec-06b53d4b7d98	1	I need help	5	2023-11-30	POSITIVE	0.994935572	Customer Support
7fb4078a-8914-4d60-bfcf-3087cb53e7ee	1	Nice service CBE Bank	5	2023-11-29	POSITIVE	0.997551620	General Feedback
ceef512c-1158-43b5-ae10-3c16b71d8d5a	1	Is very weird app really	1	2023-11-29	NEGATIVE	0.992426515	General Feedback
1f91be3b-4286-4622-904c-85b372030d50	1	It is best app	5	2023-11-29	POSITIVE	0.999731362	General Feedback
052ec0a1-99e9-4be9-97b6-6d83f1b44149	1	Update for iPhone	5	2023-11-29	POSITIVE	0.686794519	Feature Requests
3f3ac1b8-55cb-434d-af25-16726230e102	1	በጣም ሀሪፍ እና ምቹ ነው ግን Recenet transaction አያሳይም .. ከድርጅት ጋር ለምንሰራ ሰዎች ደረሰኝ ያስፈልገናል ። ቶሎ መፍትሔ ቢያገኝ እና ቢስተካከል ጥሩ ነው	3	2023-11-26	NEUTRAL	0.821375132	Transaction Performance
6dc34313-4774-4b88-96a7-08f51d5aa930	1	The previous version was better.if our wifi is weak this app is not working even by vpn.Learn from other banks,how to make simple and easy	2	2023-11-26	NEGATIVE	0.998170137	Bugs & Reliability, User Interface & Experience
27eb7f34-6f3f-4a49-bfac-b7ac9737429a	1	Well fine Well developed Fast	5	2023-11-26	POSITIVE	0.999855042	Transaction Performance
731d21ae-d08d-4e1b-b1cd-119a400a8630	1	Only limited transaction are shown.. the time of the transaction is not shown.	1	2023-11-26	NEGATIVE	0.993596554	Transaction Performance
26b8e250-e834-4a56-ba12-e8aa3facefea	1	This app as much as good it was, it fails you in the middle of critical time . With the good reputation this bank has this app should've been something us customers should reply on. But I am very disappointed.	1	2023-11-26	NEGATIVE	0.999425173	General Feedback
95e54f27-a0f7-4070-b640-7882fa008434	1	Fails bu tcharges. Bad App	3	2023-11-25	NEUTRAL	0.999755800	General Feedback
73d02ae4-4017-4f09-bd76-79c9a5221a5a	1	It is good	1	2023-11-25	NEGATIVE	0.999849439	General Feedback
8a89eb35-eb6e-4fbd-ba2c-dde61fe7c665	1	i like it	5	2023-11-25	POSITIVE	0.999859333	General Feedback
deab9537-d901-46e8-a24f-122940b08b3c	1	absolutely magnificent app!!!	5	2023-11-25	POSITIVE	0.999873757	General Feedback
69fdc4aa-e0ab-403e-9303-64bd6b5b036a	1	Kechalachu atawrdut wey aysera mnm tkm yelewmm	1	2023-11-25	NEGATIVE	0.992942989	General Feedback
7b5172c5-df5c-4cf2-95b0-403413adca96	1	Wow amazing app for all!❤️	5	2023-11-25	POSITIVE	0.999836802	General Feedback
4ab3360d-b3c6-4462-af0c-0dc1e8efaca0	1	It's very well to use	5	2023-11-25	POSITIVE	0.999844670	General Feedback
85f80b4c-4e34-487d-a9b3-855d8dccec5e	1	Good job, try your best. You can do anything you need.	5	2023-11-24	POSITIVE	0.999602735	General Feedback
58e56214-b611-47b2-8a78-ab533c0271cf	1	Its good app	5	2023-11-24	POSITIVE	0.999861360	General Feedback
59cddf42-4881-4fda-993d-cba80dc6fea6	1	Worst bank worst app	1	2023-11-24	NEGATIVE	0.999787509	General Feedback
65748331-5b11-4f85-85ff-8c0b17f4f5e9	1	Its the best app	5	2023-11-24	POSITIVE	0.999847531	General Feedback
9ad84019-9b4f-4ea4-aa40-3c8dd805f749	1	Best app i have seen.	5	2023-11-24	POSITIVE	0.999203622	General Feedback
5eedfd8f-e9de-4143-a8cf-959ed2cd8e97	1	Very good but same time deos'n work properly	5	2023-11-23	POSITIVE	0.996749759	Bugs & Reliability
d13b527c-844c-4a24-9888-13da3a0506d3	1	Nice and easy application.	5	2023-11-23	POSITIVE	0.999864697	User Interface & Experience
c8be1099-bd82-4f88-a6a4-98516e5a1bee	1	Shame to see one of the biggest bank in east africa. Have this app 1 .you try to send money.. it will fail on the way you try again and your money have been sent Twice. Then you have to ask the Receiver to send the money back to you. 2. Try to refresh to see your recent transaction and it will show old transaction. Clearly they don't care . You can get your statement easily via telebirr. But cbe you have to go to branch and beg sometimes Bribe the managers to get your own bank statement . Shame	1	2023-11-23	NEGATIVE	0.999474108	Feature Requests, Transaction Performance
f8df043b-8849-4b1f-be43-6c23b746a06d	1	Its nice app because of it includes mult payment methods in their. Thanks CBE	5	2023-11-21	POSITIVE	0.994853437	Transaction Performance
54b5aab4-c7c6-4731-ac3c-2eacc32a847c	1	Great application. But when it opened after Minimization it doesn't ask for pin. I mean it directly opens which is not safe. Anyone who has the phone can transfer or do other activities. please Update the app in to new level.	3	2023-11-21	NEUTRAL	0.996368170	Feature Requests, Security Concerns, Transaction Performance
5602915b-9b8f-4a12-bc46-a751616968db	1	I am interested with this app.	5	2023-11-21	POSITIVE	0.998882949	General Feedback
355e456b-d53a-4b15-b222-0ffcacc550c6	1	Great app, but the only problem, i encounter with it is that branches are not willing to open it for you, every branch will try to send you else where	5	2023-11-21	POSITIVE	0.994102180	Bugs & Reliability, Transaction Performance
5014ece0-1e8c-492c-9392-af59b6e95a06	1	Noting working app	1	2023-11-21	NEGATIVE	0.998847127	General Feedback
2cc0b20e-7663-4c85-872f-2fb54768bbc8	1	Please include full Bank statement access through this app	2	2023-11-20	NEGATIVE	0.844932675	Account Access Issues, Feature Requests
fe2cd29b-a724-406a-8e5d-42cd1b98b095	1	Best to be Best as your Age of Surveillance Old.	3	2023-11-20	NEUTRAL	0.996960342	General Feedback
78acd1b4-05a2-4a51-83e2-653f038e1f9e	1	Very Very good appa I am really	5	2023-11-19	POSITIVE	0.999866486	General Feedback
dd3f5678-c49f-4e95-94b2-21ed11d381e3	1	I like the other one except for one reason, but it would be cool if the account message is saved quickly	5	2023-11-19	POSITIVE	0.996259928	General Feedback
bee00063-e810-4c04-9cae-a14ea4733977	1	Best mobile banking app ever	4	2023-11-19	POSITIVE	0.999729455	General Feedback
79d81ab4-0b0d-4e6d-b25c-77be31d1de38	1	The app was working properly, but in the last two days, it showed not available while I am in a good network area with both wifi or data. Please fix it. With regards	3	2023-11-19	NEUTRAL	0.999131978	Bugs & Reliability
02e644a8-cf80-4bc3-92dd-0620f7cf531a	1	Some times facing delayed cynching	4	2023-11-19	POSITIVE	0.994106531	General Feedback
7471c8e5-1277-4faa-b990-ebe2b0d38611	1	Wow it's bast	5	2023-11-19	POSITIVE	0.999788225	General Feedback
ad090765-a201-4af0-aec8-f6000295070e	1	Very interesting app.	5	2023-11-18	POSITIVE	0.999818742	General Feedback
8092df6b-0e33-46d8-8790-d672027ccae7	1	Good but currently not update, the status	4	2023-11-18	POSITIVE	0.853509068	Feature Requests
b1e623ab-a0ae-4e9b-8c0b-642e4fed9900	1	በጣም አስፈላጊ እና ምርጥ አፕ ነው የኢትዮጵያ ንግድ ባንክ ሁሌም የሚተማመኑበት ባንክ	5	2023-11-17	POSITIVE	0.948979199	General Feedback
9370dd17-22d1-4619-a279-da2f66a9b749	1	It is the best	5	2023-11-17	POSITIVE	0.999860287	General Feedback
142d9687-e9d3-4e51-9528-f425ac24e633	1	The app doesn't let you have the pdf form receipt.	1	2023-11-17	NEGATIVE	0.996326625	General Feedback
cd9b19a7-f634-40e1-bd6f-9748f02a8347	1	How to conected In my phone application previous used	5	2023-11-16	POSITIVE	0.997528851	General Feedback
9f85039b-06f2-4b78-8a70-14576cc580e5	1	Its so flexible, easy and fast. More perfect if adding another acc. is possible Or interchangeabily within different account for those who use multiple acc.	4	2023-11-16	POSITIVE	0.999485850	Transaction Performance, User Interface & Experience
c1973c4f-db96-4c07-8d5c-1b5200f75ea1	1	It is light to use	5	2023-11-16	POSITIVE	0.999231100	General Feedback
1e77c8a1-f489-4aa3-966c-14452b8b94bd	1	This app taking 10 birr for every transaction, This is not fair,🤬	1	2023-11-16	NEGATIVE	0.999741137	Transaction Performance
28e4d35f-b294-4105-82b1-bd6e40947e89	1	በጣም ተመችቶኛል። እድሜ የዛሬ 15 አመት በኢትዮጵያ እንደጀመር ሀሰብ በማፍለቅ እንዲጀመር ላደረጉት የዛኔ የኢንሳ ባለሙያ ለአሁኑ ጠቅላይ ሚኒስተራችን ክቡር አብይ አህመድ የከበረ አድናቆት አለኝ።	5	2023-11-15	POSITIVE	0.961626768	General Feedback
e123cde9-8138-48b1-9005-d665086f4c94	1	Why I go to the nearest bank to be activated! It must be fully automated like telebirr and Mpessa!	1	2023-11-15	NEGATIVE	0.998103976	General Feedback
26ff7b0f-2096-4388-b658-cd709ca1f613	1	Will ask her about the election of acaunt	5	2023-11-15	POSITIVE	0.994690597	General Feedback
9e431fc9-0e3b-4f04-8286-c1853eeb35cf	1	Fsntastic,convenient and fast	5	2023-11-15	POSITIVE	0.998685896	Transaction Performance
0bf25188-1576-42d5-a584-539fc5f24f0c	1	Good up to use esealy	5	2023-11-15	POSITIVE	0.999676466	General Feedback
d7775460-cf63-463b-af75-4dda0938c072	1	It is really the best one I love it Thank you	5	2023-11-15	POSITIVE	0.999868989	General Feedback
3f1c2b52-001a-40c2-8baf-e3a4f727c839	1	no service how?	5	2023-11-15	POSITIVE	0.999587953	General Feedback
60472947-946e-4ce5-8e71-b1043f9df3d7	1	worst app I didn't even see my latest statement 😒	1	2023-11-14	NEGATIVE	0.999811709	Feature Requests
a4050aae-8e2c-4d89-8b04-94c785bfcc4c	1	it's nice think u	5	2023-11-14	POSITIVE	0.999837756	General Feedback
c781eab9-f7f1-471d-83a2-246a1b2cedf8	1	Exchange rate to day	1	2023-11-14	NEGATIVE	0.730283439	General Feedback
99234a36-2a9f-4336-b464-39472d11e773	1	It getting worst everyday, it actually doesn't work this days.	1	2023-11-14	NEGATIVE	0.999208033	Bugs & Reliability
ceb5538b-2738-43e6-b6c0-f938f708d2ec	1	GOOD NOT BAD SOME TIMS NATWORK PROBLEM	3	2023-11-14	NEUTRAL	0.996664941	Bugs & Reliability
24979ea3-5e05-449b-984f-3511005c2185	1	Keep it up!!	5	2023-11-14	POSITIVE	0.999840736	General Feedback
00a90183-4a4d-4f97-b5b3-83d8d973521c	1	I can't update the app on my mobile	3	2023-11-14	NEUTRAL	0.992191851	Feature Requests
5817bed2-98c4-4e04-9f42-d52ed499315e	1	We need double Applications commercial bank of Ethiopia one place	5	2023-11-14	POSITIVE	0.994119167	General Feedback
426d5610-ca61-453d-820c-8de3258bf653	1	Good for everything	5	2023-11-14	POSITIVE	0.999850273	General Feedback
4b079e37-071c-406f-9f6c-f6712433fd61	1	i assume for user this apps are well.	3	2023-11-14	NEUTRAL	0.993720889	General Feedback
b5839957-6423-4e8f-b8ae-0cc194f372bc	1	This app is very great and it is healping in a very great manner.	5	2023-11-13	POSITIVE	0.999784052	General Feedback
fbbd8d19-3040-4d5c-b63f-a0d109a7a27b	1	Wow i don't have word to experience	5	2023-11-13	POSITIVE	0.836141646	General Feedback
3af96bb7-c606-4a15-9c02-156c049bd8f7	1	በቀልጣፋ አገልግሎት የሚያረካ	5	2023-11-13	POSITIVE	0.833725393	General Feedback
9f20cf3f-dd87-43a0-9a9d-9007b59867f0	1	The previous varsion of this application is good, yet recently it required verification code that unable to get online. So, is it realy fair to go to branc of bank to fill it? please improve such problem. Untill that i will going to uninstall this application. Good bye!!	1	2023-11-13	NEGATIVE	0.996277988	Account Access Issues, Bugs & Reliability
0d439d79-271b-4aff-a1ac-64b990366c29	1	This online application good my life support all of us to get	5	2023-11-13	POSITIVE	0.999195158	Customer Support
340d185b-b0fd-4506-87ec-8f4a25aece29	1	App bareeda haala salpaan taheen fayiidaa nuuf kennaa jira garuu mallaaqa yeroo gara baankii biraa erginuu hammi murachuutti jirtan xiqqo nibaayitee silaa xiqqo gadi buustan gaariidha je'een yaada isinis mallaqa keenyaan waan fayyadamaa jirtaniif.	4	2023-11-12	POSITIVE	0.995080590	General Feedback
f689d3d1-6239-4030-bcc1-4900fc565cda	1	This app is not weerk	5	2023-11-12	POSITIVE	0.886923194	General Feedback
f60ec39f-c179-476f-aa51-2339d5538837	1	It a best	4	2023-11-12	POSITIVE	0.999852300	General Feedback
f4a93056-cd6f-4356-a2c5-2a23d34a6786	1	Best Banking app of the time!	5	2023-11-12	POSITIVE	0.999705374	General Feedback
e6acf7dd-8b01-4e2a-aaea-e255b2eeeabb	1	It's nice app, if u can add biometric security futute	5	2023-11-11	POSITIVE	0.999607980	Feature Requests, Security Concerns
e3247250-71db-4f7b-87db-8c0fdc6ae5a2	1	I am extremely disappointed with this App. Every time I try to change my PIN, I receive an error message saying "unable to connect to server." Additionally, my transaction processes always fail. As a well-known company, I expected better service from CBE.	1	2023-11-11	NEGATIVE	0.999731958	Account Access Issues, Bugs & Reliability, Transaction Performance
9af67dd6-4dfb-4550-b640-33803cea0a28	1	I like it	5	2023-11-10	POSITIVE	0.999859333	General Feedback
95a18c81-c591-4de3-a080-63600e368c65	1	Mn alabat transaction fee keknsachulng bemilw nw	5	2023-11-10	POSITIVE	0.980212986	Transaction Performance
7534f268-8972-4aac-8879-5499d6e8a947	1	good app have more opotion	5	2023-11-10	POSITIVE	0.997870326	General Feedback
4d79b85a-0fc9-4fc1-8171-fa9490b30486	1	twhey the service expires they do not notify you they just stop the service.	1	2023-11-10	NEGATIVE	0.996871173	General Feedback
5c471dfc-b93d-4e1c-a6b7-2adab834c570	1	It's easy to be used loveable app👍	5	2023-11-09	POSITIVE	0.998714209	User Interface & Experience
702fe404-0da7-4449-aac5-3ecbc2625071	1	I like all about this app, but ,it is better if we can use two factor authentication	5	2023-11-09	POSITIVE	0.987515688	General Feedback
177eeeda-ded6-4906-8432-9dea8c301a1c	1	Except sometime break down it is good relatively and commission fee should be free to spread digitalization	5	2023-10-26	POSITIVE	0.774848640	Transaction Performance
bee08070-089b-46b4-b80e-85bafa9b69e8	1	Why someone has to go to branch for verification and activation? I can't help my self unless i am in ethiopia.	2	2023-11-09	NEGATIVE	0.995853543	Account Access Issues, Customer Support
727f5d56-d22b-46f8-876c-9fc6a4b5f94e	1	It's very good i like it,	5	2023-11-08	POSITIVE	0.999862671	General Feedback
033d819e-4b4d-40db-be0d-38eedad850f4	1	Best app since I was using it	1	2023-11-08	NEGATIVE	0.998968244	General Feedback
2e8b6294-189a-4fde-9daa-5f6fa1014da0	1	Please help me,this apps do with mobile data	5	2023-11-08	POSITIVE	0.681664407	Customer Support
a37a3a78-c9a3-44c0-8829-06ec57372b72	1	best servis app	5	2023-11-07	POSITIVE	0.999433458	General Feedback
58a6ee00-0939-4676-a4b7-79740d6e721f	1	Best mobile Bank	5	2023-11-07	POSITIVE	0.999683380	General Feedback
4066d304-6fc1-4dd4-891d-c69e99b3dc3c	1	They are giving good services❤	5	2023-11-06	POSITIVE	0.999843836	General Feedback
326fa83d-f8da-49d3-b727-f02e45d8024e	1	Keep it up...i love it	5	2023-11-06	POSITIVE	0.999880910	General Feedback
038c8f97-183a-40fc-9b0d-b7334e7f90f9	1	Good app i like it	5	2023-11-05	POSITIVE	0.999867797	General Feedback
fd37c51b-c874-4782-8b3f-4c08fc71225b	1	Its fantastics app but some time the transaction be very slow	4	2023-11-05	POSITIVE	0.994530261	App Speed & Performance, Transaction Performance
635ecc7d-338b-4383-b4b8-36b7c1861160	1	The app is not opening.	5	2023-11-05	POSITIVE	0.999676347	General Feedback
4088a026-65b2-4209-9648-45bb3ae7c77a	1	It's fast and flexible	5	2023-11-04	POSITIVE	0.999865770	Transaction Performance
67f2d562-c194-47d9-ac79-546f0c2c0f0e	1	Is the best	5	2023-11-04	POSITIVE	0.999841809	General Feedback
6f9ffe30-220e-426d-a0ea-1cc9f390a51c	1	It delays some times..	5	2023-11-03	POSITIVE	0.998705387	Transaction Performance
1b62a18f-7981-4e05-8469-be31b75f543e	1	Thanks CBE i love this apps	5	2023-11-03	POSITIVE	0.999853969	General Feedback
06b9eb88-9e34-434d-8ea2-3446523cd772	1	CONGRATULATIONS!!!! YOU GOT ⭐	5	2023-11-03	POSITIVE	0.999816835	General Feedback
31aac975-5a7a-4922-b112-dce6dd025013	1	I love the app 🤩	4	2023-11-03	POSITIVE	0.999842763	General Feedback
57b0f2e3-5315-4898-8cde-c14782ed8c47	1	Best app that constitutes all in one.	5	2023-11-03	POSITIVE	0.999443233	General Feedback
74c6e345-294c-413a-96f7-144415d8a71f	1	This app is amazing	5	2023-11-03	POSITIVE	0.999871850	General Feedback
2b3499bb-5122-46f6-99d9-ac4a1f9ef5cb	1	This is a good app that lead everyone to enjoy and feel access easily	5	2023-11-03	POSITIVE	0.999864817	Account Access Issues, User Interface & Experience
5ca7bb3f-a817-48d7-b538-88c2d5c7790f	1	It has speed than the others	5	2023-11-01	POSITIVE	0.999414682	App Speed & Performance
0a126cce-319c-48c0-8989-f51ce885b036	1	It is simple app	5	2023-11-01	POSITIVE	0.996018112	User Interface & Experience
47cedd08-3149-4330-ad42-7814ec2c3f30	1	this application is very good very one useful service is available from yosuu what you want very nice thank you	5	2023-11-01	POSITIVE	0.999713600	General Feedback
036315ca-91be-4baa-b337-5664c2f26af5	1	Improvements needed on areas: 1- to enable creating multiple accounts within the same CBE app 2- to have an access to multiple accounts with one ID number 3- maximise transaction pages for better references 4- increase security options from sms to email address	3	2023-11-01	NEUTRAL	0.740960002	Account Access Issues, Feature Requests, Security Concerns, Transaction Performance
225344ac-514b-4f56-a93f-52d0fcca473d	1	አፕሊኬሽኑ ተጠቃሚ ስለሆነ በጣም ወድጄዋለሁ ወዳጃዊ እና ግብይቶችን በጣም ቀላል ያደርገዋል, በተለይም ለንግድ ጉዳዮች. ግን፣ በእነዚህ ጥቂት ቀናት ፊት ለፊት ገጥሞኝ ነበር። እሱን ለመክፈት ችግሮች ። ለማራገፍ እና ለማደስ ሞከርኩ። መተግበሪያውን ይጫኑ እና በአቅራቢያው ባለው cbe ያረጋግጡ መሃል. ግን አሁንም ሁሉንም ተግባራት መጠቀም አልተሳካም. ይላል። 'ምንም አይገኝም' ማንኛውም ጥቆማ እባክዎ!	5	2023-11-01	POSITIVE	0.820387423	General Feedback
1e1bbd3f-3f1a-4477-a59b-d931aead60c4	1	The Security is too short	5	2023-10-31	POSITIVE	0.999637127	Security Concerns
464a9bde-5e4a-40c4-88e0-142f59afcaa9	1	Great app, but it lacks a lot of features....	3	2023-10-31	NEUTRAL	0.999374568	Feature Requests
23e84632-5652-45d0-b851-6ad69afb1409	1	It's good app and upgrade day to day thanks i given five star okay ❤️	5	2023-10-30	POSITIVE	0.999814689	General Feedback
7f2af8f2-cd47-45af-b3e9-5a2dd4fa429c	1	It is a wonderful application.i think the best mobile banking among others.	5	2023-10-30	POSITIVE	0.999856830	General Feedback
f54f543d-b1f8-448d-9306-e2a08961bf6a	1	Nice app new pls dear make it perfect 🥰	5	2023-10-29	POSITIVE	0.999840260	General Feedback
dd5a7998-1171-4271-8971-5691f121204f	1	Going to bank to get verification code won't solve security issue it's just annoying.	1	2023-10-29	NEGATIVE	0.999251783	Account Access Issues, Bugs & Reliability, Security Concerns
e284b693-1138-4e66-8611-5824688fcda3	1	I like it	5	2023-10-29	POSITIVE	0.999859333	General Feedback
c8877d09-c176-4d02-b4c2-bcf052832c93	1	The app is helpfull. But it has issues on weekends, sunday. It not syncing updates and complete transaction.	3	2023-10-29	NEUTRAL	0.997820258	Bugs & Reliability, Feature Requests, Transaction Performance
0a8f32a0-ed8c-474b-9457-0d3d778a054f	1	Thank you for your service	1	2023-10-28	NEGATIVE	0.999816477	General Feedback
c8d1e852-4bf0-4c2b-9a8e-3401beda2c74	1	But currently stopped working	4	2023-10-28	POSITIVE	0.998978853	General Feedback
6222bd8b-aa00-4625-bf4c-38fe6c68ee7f	1	This app doesn't provides additional and latest features such as Banking service including standing order and ATM registration whatsoever.	1	2023-10-28	NEGATIVE	0.998133123	Feature Requests
c711126c-9023-4c55-aedb-618fac8d5445	1	It's not working	1	2023-10-28	NEGATIVE	0.999785721	Bugs & Reliability
f58357c5-eda0-4610-b2a6-73f5144c051d	1	Des yemil sikay	5	2023-10-28	POSITIVE	0.938325226	General Feedback
c82e3b1f-61e5-45c7-902f-8bbe11dee6e6	1	Not working after last update please fix the problem	1	2023-10-27	NEGATIVE	0.999614120	Bugs & Reliability, Feature Requests
1ffa8f40-40a5-4c23-9a08-0f04c3c1b923	1	Iam so happy	5	2023-10-27	POSITIVE	0.999878407	General Feedback
ae5ae05f-b873-4ac5-b9cb-6bf4b4dcf906	1	Recently it is not working, can you fix it. Don't make your customer frasturatwd	1	2023-10-27	NEGATIVE	0.999599040	Bugs & Reliability
dc3c0207-b1cc-4a03-9c62-8a966225ed4b	1	Fix it unsatisfied with the system	2	2023-10-26	NEGATIVE	0.998260319	Bugs & Reliability
328343ea-ec7d-45dc-a87e-3c75848817e6	1	God experience I had in the CBE utilization and benefits for the last 10 years.	5	2023-10-15	POSITIVE	0.961327791	General Feedback
5ac4e6e0-9b3c-48ea-88ad-6b56388a9c5e	1	I'm actually forced to review this app again, it used to work fine on any network but after the last update it doesn't work on a wifi network, what if i don't have a data on my sim card and i needed an urgent transaction be made, it really makes me angry that you guys would update it to this dictatorship, please fix this	3	2023-10-26	NEUTRAL	0.999428451	Bugs & Reliability, Feature Requests, Transaction Performance
f8f86753-0984-47ac-872b-cf099325de81	1	It's the best app comper another local banks 🙏🙏Tnks cbe developers	5	2023-10-25	POSITIVE	0.999782860	General Feedback
b8f46da4-3d37-4fcb-9a84-25cb400bef52	1	Better than the other Bank's application	5	2023-10-25	POSITIVE	0.999159694	General Feedback
f63666fc-8794-45ff-9484-da09cefa21e2	1	Very poor app i have ever seen Cbe needs to work on improving this app. Atleast refresh needs to work	1	2023-10-25	NEGATIVE	0.999698758	Bugs & Reliability, Feature Requests
3385bedf-4b09-4eeb-b363-5a8ca9dd6077	1	It used tobe good before you make a system upgrade but now it is one of the worst mobile apps I use	1	2023-10-25	NEGATIVE	0.999787748	General Feedback
0aed795b-005b-461a-b224-5c6b7f70ba7f	1	I'm satisfied with this application	5	2023-10-24	POSITIVE	0.999172330	General Feedback
40f0efd7-37d9-44f9-9e3e-9f0a2a0780b9	1	I like this app because it makes everything possible	5	2023-10-24	POSITIVE	0.999761403	General Feedback
b047caab-80be-45f0-8a09-4423bf4eb4ae	1	I like it	5	2023-10-23	POSITIVE	0.999859333	General Feedback
fb456319-247f-4e56-ba93-b871d8cecb99	1	Best and user friendly app	5	2023-10-23	POSITIVE	0.999680638	User Interface & Experience
5ec2e73e-f27b-4b42-b96e-715fa3499cb8	1	The app Is very good but the amharic language option doesn't work properly like you select amharic option and go to transfer sub option it automaticaly changes to engilsh .so it's good if you work on it.thanks!!!	4	2023-10-23	POSITIVE	0.951442540	Bugs & Reliability, Feature Requests, Transaction Performance
023f9307-e03c-4c29-9c44-01b922f21b90	1	አፓችሁ እንደኔ ይቀረዋል እንደ ቴሌ ብር ማድረግ አለባችሁ ካሽ በ ኢቲኤም ያለ ካርድ ማውጫ ጨምሩበት ሌሎች ያላቸው ጥሩ ነገሮችን ኮርጁ በዳታ ያለ ብር ዳታ በማብራት ብቻ ያለ ሳንቲም እንዲሰራ ቀል አርጉት	3	2023-10-23	NEUTRAL	0.962749183	General Feedback
e2bc4802-9532-49c0-b64a-165422661132	1	Not dependable recently	1	2023-10-23	NEGATIVE	0.997964859	General Feedback
a3837d71-7e3c-498f-9877-df0aac7e79dc	1	Best application for ever	5	2023-10-22	POSITIVE	0.999694705	General Feedback
3236d2e3-b2ae-4621-a6f6-2247cdc83a0f	1	Not active always	3	2023-10-21	NEUTRAL	0.999668956	General Feedback
7d71a1c7-2248-4330-8288-7a3c60509063	1	This application is a best	5	2023-10-21	POSITIVE	0.999734938	General Feedback
4c19fd7a-0979-4a48-91af-b1ef4aa826e5	1	Very good and developed by our customers	5	2023-10-20	POSITIVE	0.999874830	General Feedback
0a19f3dd-49fa-4730-9cec-dbe804d25509	1	በጣም ቆንጆ አፕ ነው። mini statement በpdf ማውጣት እንዲችል ብታደርጉ?	5	2023-10-20	POSITIVE	0.987048328	Feature Requests
182b486e-a565-4e48-9553-2e0b0de51a60	1	Nothing is working after update	1	2023-10-20	NEGATIVE	0.999710739	Feature Requests
a7ce6192-0030-4b75-819a-f59ffdb887de	1	It is so good	5	2023-10-20	POSITIVE	0.999855757	General Feedback
2f0e77de-f277-4d05-89b9-e75288cb8f15	1	cbe birr tranfer yelewm yene leyla update yaltederege selk lay ale mn malet nw	1	2023-10-19	NEGATIVE	0.964247286	Feature Requests
e682ce2a-a344-4c56-8118-5bc914a48845	1	It looks good	5	2023-10-18	POSITIVE	0.999852657	User Interface & Experience
03548115-cfa5-4e4e-a985-9610512326c7	1	It doesn't work when I turn it on with data, it only works with wifi so it's really bothering me.	2	2023-10-18	NEGATIVE	0.999435484	Bugs & Reliability
7646828d-e474-4b45-bc1e-516ddea59a59	1	Very great app.	5	2023-10-18	POSITIVE	0.999865055	General Feedback
6964ad78-8d63-442e-89bc-33fb2b7f8505	1	amazing app, hello everyone what i recommend you is use this app and save your time	5	2023-10-18	POSITIVE	0.999372423	General Feedback
57f680b1-d5b1-4df0-b09d-f14e863165e4	1	It's amazing really	5	2023-10-18	POSITIVE	0.999879599	General Feedback
1cc8a9fe-deeb-4475-8973-9506f0ea233a	1	Good app but needs to add or update mini and long statements of account movement like EBIR APP	4	2023-10-17	POSITIVE	0.983362615	Feature Requests
9d643178-b404-4c08-8d2c-f91e2e87f432	1	All most Good, but need improvement	4	2023-10-17	POSITIVE	0.867020428	General Feedback
12a31970-30b5-4393-9785-f915f8dc32c1	1	Fast transaction really	5	2023-10-17	POSITIVE	0.999017239	Transaction Performance
4750f955-4d5d-4eeb-a024-ae9540dcb68d	1	There is a difference in the options for instance i haven't banking, like standing order how can i develop?	5	2023-10-17	POSITIVE	0.977590144	Feature Requests
cc3bc498-b00f-417f-ac68-1e4efe536e19	1	I like it !🥰	5	2023-10-17	POSITIVE	0.999882460	General Feedback
b88c724f-b8ba-42db-8772-b8a84f1dd0d6	1	Very easy to use!	5	2023-10-17	POSITIVE	0.999281466	User Interface & Experience
f91280ee-d51e-46f5-89b9-85daf8f4a070	1	The most Excellent one from all apps of Commercial banks in Ethiopia !!!	5	2023-10-17	POSITIVE	0.999836206	General Feedback
086fcf0f-497c-49d8-a685-9a7b88dab4a6	1	Thanks for service 🙏 and helping people's	5	2023-10-16	POSITIVE	0.999805272	General Feedback
b32fe86d-ac2f-41ac-be80-2f248667db22	1	I cannot comment whenever your system got stopped and your app is not good enough	1	2023-10-16	NEGATIVE	0.999778092	General Feedback
44a9651d-d5a3-442b-b2c4-618a0044dc15	1	Non avaliable how to work cbe mobile banking	4	2023-10-16	POSITIVE	0.998053312	Bugs & Reliability
0adaedd0-3070-4d34-9916-4416664ec581	1	It is very good to send recieve m9ney transfer	5	2023-10-16	POSITIVE	0.999776781	Transaction Performance
7129ef3a-b70b-4587-ae45-13b65e7304e8	1	Betam connection eyaschegeren nw	1	2023-10-16	NEGATIVE	0.963667274	General Feedback
2cf1507c-6c8e-49ba-85d8-7c5f3fe730c0	1	Hard app to rely on for business transactions. As it shows error message while the money is transferred resulting in sending money multiple times. Plus transaction details gets updated after days of the actual transaction.	2	2023-10-16	NEGATIVE	0.982659578	Bugs & Reliability, Transaction Performance
53ec5921-8bdb-481c-821a-a5edc48a6d44	1	Good application and helpful	5	2023-10-15	POSITIVE	0.999853730	Customer Support
4429d4c4-2a76-428d-9e9f-a1d39c4fa295	1	This application is excellent useful for people especially for me	5	2023-10-15	POSITIVE	0.999540806	General Feedback
2bef5749-c8d8-458e-875f-62b189d164a5	1	Good keep it up	5	2023-10-15	POSITIVE	0.999856830	General Feedback
8b9eb5b2-7404-4670-95ec-4aea964702aa	1	It's amazing application	5	2023-09-05	POSITIVE	0.999880195	General Feedback
11014120-e48b-475d-a581-b37086eee454	1	This is the only bank that charges money for transferring from cbe to cbe acount i hope that u reconsider this idea plz	3	2023-10-15	NEUTRAL	0.995446265	Transaction Performance
555c7565-edc8-4301-957e-a0f931931746	1	It is easy to use I prefer	5	2023-10-15	POSITIVE	0.999126732	User Interface & Experience
902fe23c-0ba4-426c-8582-52e126ca74a1	1	This a very fine application I have ever used-fast , and perfect always active . Tks	5	2023-10-15	POSITIVE	0.999743998	Transaction Performance
0eb6e97f-2333-4a89-b7e4-b142a56e6c42	1	Most of the time it doesn't work.	1	2023-10-15	NEGATIVE	0.999644518	Bugs & Reliability
03caf689-2cba-4d0d-a975-d36c69d3be66	1	The App was working fine until the last update Now nothing is working I can't view my balance transfer money send money to my Owen telebirr account view my transaction details the app has become useless please fix it.	1	2023-10-15	NEGATIVE	0.999738038	Bugs & Reliability, Feature Requests, Transaction Performance
6c2b0da6-b20a-4ab7-8e71-984abe13b908	1	እናመሰግናለን ድካማችንን በእጥፍ ቀንሳችሁታል ይበል ይበጅ ይቀጥሉበት ወደፊት ከዚህም በበለጥ ቴክኖሎጂ እንጠብቃችኋል በርቱልን!!!!	5	2023-10-14	POSITIVE	0.965799928	General Feedback
99f3294d-3814-4652-923b-2186edfa8273	1	Great app and you should add a way to transfer from beneficiaries, to prevent manual typing.	4	2023-10-14	POSITIVE	0.989861488	Feature Requests, Transaction Performance
62abc6bc-30d0-4924-b6e9-25faec90eca0	1	ያበደ አፕ ነው ግን አንዳንዴ ቶሎ አይገባም ያልገባ መስሎን ስንደግመው ሁለቴ ይቆርጥብናል ቢስተካከል	5	2023-10-14	POSITIVE	0.951026678	General Feedback
9ec56549-23c7-4efa-9b65-9324b7f42ad4	1	Waww very good app I like it!!	5	2023-10-14	POSITIVE	0.999852419	General Feedback
fa428f3d-0edb-4e45-950f-066395b056ad	1	grate application, simple and fast. just 2 comments. 1, on recently transaction list please make the very recent first. it lists randomly. 2, put a copy icon next to account number so that we can copy instantly.	5	2023-10-14	POSITIVE	0.718905628	Transaction Performance, User Interface & Experience
0ea17640-3cfd-4ac8-af9c-25ea64d866dc	1	Very nice application	5	2023-10-13	POSITIVE	0.999854088	General Feedback
e82326f8-8b1f-4ece-994b-655c3a1dad71	1	I couldn't see my balance from mobile banking. It doesn't show any thing how can I fix it? please	1	2023-10-13	NEGATIVE	0.999395728	Bugs & Reliability
35d5d914-be32-48c9-9362-c384bf386e98	1	Nothing is working after the last update. Please fix it. With the previous version, when transfering money, it shows error message while the transfer is already made. It is causing unnecessary double transfers.	3	2023-10-12	NEUTRAL	0.999756515	Bugs & Reliability, Feature Requests, Transaction Performance
f1acf035-8484-47bc-b321-b0645e4b9e5c	1	Best ever app wow	5	2023-10-12	POSITIVE	0.999785841	General Feedback
163413d5-1633-4e92-863c-5cbc37329c8e	1	Its not functional with my device whats wrong?	1	2023-10-12	NEGATIVE	0.999764025	General Feedback
cecba9a0-e432-406f-b784-ffc8573bccd9	1	I am prayed too	5	2023-10-10	POSITIVE	0.596302629	General Feedback
a7f22c6e-1cad-4d68-b02c-b95265435b19	1	it shows only very recent transactions I have made only, which is very disappointing!	1	2023-10-10	NEGATIVE	0.999513507	Transaction Performance
7bd775c4-2e81-4555-a96b-68e1c0f63364	1	easy and fast 10q	5	2023-10-09	POSITIVE	0.993790329	Transaction Performance, User Interface & Experience
1e73cbaa-849a-4e2e-bfaf-0f9ee393d476	1	Very very Good	5	2023-10-09	POSITIVE	0.999862194	General Feedback
32efe1dd-7d5c-4ac5-8da3-aa9c4d284197	1	connection not good	4	2023-10-09	POSITIVE	0.999586046	General Feedback
2b32e062-995e-4daa-903d-ff1c402289bf	1	Really Best Mobile Bank	5	2023-10-08	POSITIVE	0.999768198	General Feedback
c1a936ec-31e1-41ab-a4bc-354c1758c3bc	1	The best app,I loved it.	5	2023-10-08	POSITIVE	0.999821603	General Feedback
1eec1ad9-f6ce-4374-bf75-ecf163f6bca3	1	It's really nice 👍	5	2023-10-07	POSITIVE	0.999868155	General Feedback
260d65ee-e1e5-4efd-ac8b-f2ffa37b890c	1	The best app	5	2023-10-07	POSITIVE	0.999846935	General Feedback
401697c6-aa6a-442f-aaa8-d4cbd1f8ba29	1	Good to pay	5	2023-10-06	POSITIVE	0.999845982	General Feedback
d9343723-2b30-4e0f-921b-c71e9d0c5acb	1	Tax & treasury accountant	5	2023-10-06	POSITIVE	0.905946374	General Feedback
9467504d-3544-4fe8-8de9-efab4aa2cec4	1	Some what good app	3	2023-10-06	NEUTRAL	0.999840498	General Feedback
d52af544-45fd-490b-8275-1315b55618e7	1	update ይደረግ መጀመሪያ የተሞሉ እና አሁን የሚሞሉ Mobile banking ልዩነት አላቸው ይህ ቢስተካከል ጥሩ ነው በተረፈ👍	5	2023-10-06	POSITIVE	0.953512788	Feature Requests
98b3d255-b0e1-4fed-aea3-6c007fe4cf86	1	It's the best beginning, as CBE is back-bone of our economy, it needs more accessibility with security. So, it will be better when biometric screening system installed to this app to advance the security.	4	2023-10-05	POSITIVE	0.980603397	Feature Requests, Security Concerns
1eb2ce2f-7eb1-4d27-9582-97ecab7034f4	1	Why not support stong psaawod	5	2023-10-05	POSITIVE	0.999377310	Customer Support
a99cfdad-a3dc-489f-bc8a-0b358af7ce17	1	it's a great app but if you can add more authentication methods like finger print and face id it will be very nice.	5	2023-10-05	POSITIVE	0.999575078	Feature Requests
80868e0d-5501-4e3e-bae8-2b538055dfd2	1	It says none avaliable and stopped	1	2023-10-04	NEGATIVE	0.999678493	General Feedback
242f5cbc-b7f6-4831-9507-d9b11d14998f	1	Best of all time	5	2023-10-04	POSITIVE	0.999836445	General Feedback
bbda7c4c-aaef-4941-8e39-c35f5104aef2	1	Its very nice app	5	2023-10-03	POSITIVE	0.999856353	General Feedback
4dabe59b-6f27-4cf7-bd74-dcbb1738eb17	1	ለአጠቃቀም እጅግ በጣም ቀላል ተደርጎ ስለ ተዘጋጀ ከልብ እያመሰገንኩኝ የምስጢር ቁጥሩ(password ) ከ ጣትአሻራ(fingerprint) ጋር የተያያዘ ተደርጎ ቢሰራ የተሸለ ይሆናል	5	2023-10-03	POSITIVE	0.959501386	Account Access Issues, Feature Requests
a80a9443-f880-402b-ba34-23110b06b875	1	It is disappointing that You can not set it up yourself unless you visit a branch.	1	2023-10-02	NEGATIVE	0.999370754	General Feedback
9ed5e213-217f-4442-9603-018db95a10d9	1	Wherever you are, CBE is there for you! Excellent job, keep it up!	5	2023-10-01	POSITIVE	0.999837995	General Feedback
3f1ec271-729b-4701-a5c3-4a71e3a9bfe0	1	Nice app &simple to use but still it needs some improvement	5	2023-09-30	POSITIVE	0.990868211	Feature Requests, User Interface & Experience
35f9f4e8-746a-4f9d-bb64-2a4c2e5e87cd	1	Nice application Good job for commercial bank of ethiopia	5	2023-09-30	POSITIVE	0.999322295	General Feedback
b72d6b2f-0d65-430c-9bb8-1953ec8c9bc6	1	I will use this app	5	2023-09-05	POSITIVE	0.996212840	General Feedback
ac0a9db1-e22d-4b36-9762-f0964ee05f97	1	It's a fast and responsive app. But for those of us who want detailed transaction info, and statement going back a long time, it's lacking.	4	2023-09-30	POSITIVE	0.996089458	App Speed & Performance, Feature Requests, Transaction Performance
87b30dbc-0538-4e56-875e-0a4c8eb960ff	1	It is good app ,except that it only shows recent transactions.It need further improvements to include such features & other genuine prevention on security breach.	5	2023-09-29	POSITIVE	0.996034086	Feature Requests, Security Concerns
4ad29bd9-ac34-4479-83d5-bd8f04dd14ef	1	After I update latest app I can't use any feature on it. I can't see my amount, I can't transfer and all services are not working	2	2023-09-29	NEGATIVE	0.999298096	Bugs & Reliability, Feature Requests, Transaction Performance
c907d8c0-e976-479d-91e5-820f7fdd6150	1	This application is very important very smart	5	2023-09-29	POSITIVE	0.999819338	General Feedback
be7a8a10-6356-40cf-96a5-8fe41373d8af	1	My Favorite Bank❤	5	2023-09-28	POSITIVE	0.997042954	General Feedback
15aab9a3-2ba5-4baf-ade6-53476856cd9d	1	It's very nice app	4	2023-09-27	POSITIVE	0.999863148	General Feedback
be29a579-a660-44ce-8bd3-39431a5c2fbc	1	Commercial Bank of	2	2023-09-26	NEGATIVE	0.696568608	General Feedback
c333012f-0c3f-4d65-b5fe-5e36a2a5e9f0	1	I like this application very	5	2023-09-26	POSITIVE	0.999752343	General Feedback
8a0c2a59-0096-4662-9be9-d998a81d82ab	1	How To use again	1	2023-09-26	NEGATIVE	0.984428763	General Feedback
0f2b3933-c90c-4d61-8c6a-34b08a68ce7f	1	Eventhough its a good app in many things,the main problem I faced from this app:It does not have an option or afeature that gives u achance to transfer money from the account to another telebirr wallet as other banks do.rather it says:transfer to your own telebirr wallet..why only to own telebirr wallet?	1	2023-09-26	NEGATIVE	0.996204317	Bugs & Reliability, Feature Requests, Transaction Performance
fbd61609-33ff-432c-a541-e370e1d1658f	1	This is a good app	4	2023-09-24	POSITIVE	0.999859929	General Feedback
7ad52bd2-b58f-464c-93d8-d34bce0622cb	1	It is good but you can upgrade more	4	2023-09-24	POSITIVE	0.998715878	General Feedback
3e2769f7-09f9-41d7-84f7-e47786138e1e	1	It used to be awosome but since yesterday I can't use the app. It will accept my password and say "syce finished" but it does not allow me to access any service.	5	2023-09-23	POSITIVE	0.997862160	Account Access Issues
feb62bc7-de2e-4216-a6ff-b02a5db22843	1	What an awful app... Doesn't tell you it charges you for transferring money to another bank.. useless... Hard to use and glitches. Barely works	1	2023-09-23	NEGATIVE	0.999807775	Bugs & Reliability, Transaction Performance, User Interface & Experience
b8baf251-25f9-402f-bca4-8cf7dd11ec24	1	Easy but lagging all the time	3	2023-09-22	NEUTRAL	0.998812199	User Interface & Experience
cb975109-3133-4e62-a267-b8f036d7d358	1	Very good application. I can see my balance and many more. Thanks	5	2023-09-22	POSITIVE	0.999869466	General Feedback
f8b60945-bac0-4389-8b28-de50a92c3b45	1	I like this app it's very convenient to use.	4	2023-09-21	POSITIVE	0.998198569	General Feedback
321ea145-cb3d-4eef-9d47-82d465f1ede7	1	V. Good app.	5	2023-09-21	POSITIVE	0.995738864	General Feedback
10e6331d-7d76-4ea1-a773-9970a8d89f88	1	I can't see my bank activity for different months when I open the app. Only most recent	2	2023-09-21	NEGATIVE	0.982760549	General Feedback
9bed31cb-8b75-4579-afcf-15a2dc854502	1	I don't have any word to describe this cbe app i really love it,just it's important thank u	5	2023-09-21	POSITIVE	0.999224544	General Feedback
9dd71980-c7a8-48ab-880e-7ccda50d4d11	1	Really I like this app because it makes me a user to get service easily, moreover it saves the time for customers. Thank you CBE!.	5	2023-09-20	POSITIVE	0.999524951	General Feedback
c1d79361-ed2d-4d71-b5d6-53e8af7e06db	1	Some time it works good and Some time it doesn't work at all	1	2023-09-20	NEGATIVE	0.960291803	Bugs & Reliability
b7fe65bd-96c4-4e01-9ec0-35124f6d4a5a	1	What a helpful and latest app!	5	2023-09-19	POSITIVE	0.999516606	Customer Support
0382e4d1-5d6c-4eba-8c58-296ae36c3246	1	After the latest update the app and the USSD code stops functioning please release a new update to fix the issue	1	2023-09-19	NEGATIVE	0.998874009	Bugs & Reliability, Feature Requests
bb25ca07-fab8-4800-bdf2-ea67779f8f00	1	ቫሪፋይ ለማድረግ የግድ ወደ ቅርንጫ መሄድ ብዙ አስላጊ አይደለም ግን የተሻለ ደህንነት አለው የምትሉትን ሲስተም ብትጠቀሙ እና ሰውን ከእንግልት ብታድኑ እላለሁ በተረፈ አሪፍ ነው	4	2023-09-18	POSITIVE	0.961383104	General Feedback
e9d9f261-5aac-4601-93f2-36483678c151	1	This app is good, but sometimes, it doesn't show you the bank statement very well	5	2023-09-17	POSITIVE	0.955959439	Feature Requests
d19d610f-cf16-4f6b-bbfc-c8dd42b76352	1	I can't show me even my account	1	2023-09-16	NEGATIVE	0.999690413	General Feedback
9c896db9-bf3b-4386-ba4c-a52ee1a53398	1	Intersting and real app	5	2023-09-16	POSITIVE	0.997695863	General Feedback
4030ffa3-98eb-4709-be8f-9e3c0b3b0527	1	This app is more easyer and faster than other bank app. Am always satisfied wiht the app.	5	2023-09-16	POSITIVE	0.968943596	General Feedback
5e13c4b4-7dbc-4666-bdf4-d8463e07ed59	1	Accounts only displays the first 14 transactions; it would be preferable if we could see all transactions, especially if we could search by transaction number.	4	2023-09-16	POSITIVE	0.996544778	Transaction Performance
9d9f252c-a9d1-46d9-9928-e1a141e5bb4a	1	Great App Tnxs CBE	5	2023-09-15	POSITIVE	0.994498432	General Feedback
6d321cf0-37d0-4fb0-93a1-abd419bb6cf7	1	Very nice app	5	2023-09-15	POSITIVE	0.999856234	General Feedback
868628e5-7d1a-4272-b0b2-64766a909d8d	1	Can you guys please add the mini bank statement please please please	5	2023-09-15	POSITIVE	0.867458403	Feature Requests
19b34d11-8bf9-4f23-b111-f51728d2e072	1	i like it	5	2023-09-14	POSITIVE	0.999859333	General Feedback
a721bbde-0702-483c-903b-57c92eb02b03	1	Download it And used it , it's Used full app	5	2023-09-14	POSITIVE	0.786603034	General Feedback
2636d39e-67ff-4db7-bdba-9f65102d9a81	1	Does not work i can not update	1	2023-09-13	NEGATIVE	0.999407291	Bugs & Reliability, Feature Requests
af5e325a-4580-43e5-8fa2-c57cbab8e6c0	1	After the update the app is not functioning , we expected to make physical involvement to decrease but not,work on that to make the system reliable.	1	2023-09-13	NEGATIVE	0.994892240	Bugs & Reliability, Feature Requests
915b79d3-2474-4609-b555-4de06a92ff2e	1	አጋዥ ፣ፈጣን ነው።	5	2023-09-13	POSITIVE	0.883213103	General Feedback
b26a3ff1-b841-4f15-a7a4-7e75e87d2c6d	1	Easy and secured	5	2023-09-05	POSITIVE	0.999787509	User Interface & Experience
4a9e0bb2-6ffb-4119-bff3-3e9d40acf23c	1	I like it 👍	5	2022-02-12	POSITIVE	0.999859333	General Feedback
7f892961-74e3-46d6-bda2-d52ce7816cbd	1	Most of the time response time using msg is to slow many of wrongly transfer more than ones. I wish it is instant.	4	2023-09-13	POSITIVE	0.997279763	App Speed & Performance, Customer Support, Feature Requests, Transaction Performance
36a43245-6cfc-4816-803b-e2e80f693910	1	Good way to pay	4	2023-09-12	POSITIVE	0.999848008	General Feedback
0160a813-1b36-4ee0-aef9-2e8c2aff28d8	1	Gaaridha Kanarra fooyyessaa	5	2023-09-11	POSITIVE	0.972098589	General Feedback
976bf8fb-f8ce-412f-965e-51d1c0203e8f	1	It is good useful app thank you	5	2023-09-11	POSITIVE	0.999827504	General Feedback
03e01a0a-b708-418a-9ec6-a3df6db274fe	1	Cbe mobile banking ussd didn't work fast if you need an emergency in nomads you didn't send any one even if you need to send in your home(urbun) with using ussd is so equal	1	2023-09-11	NEGATIVE	0.993726373	Bugs & Reliability, Transaction Performance
544cf531-5360-4c9e-80ee-a232bf954823	1	I really love this app,it is amazing. It is more flexible than any other banks app. The only and main problem that I encountered with this app is,if it is uninstalled from this devices, I have to go to the bank and mostly the specific barank the account is opened to reconfigur again. This is very unpractical in most cases,since people are traveling and very busy in their day to day activities. Kindly consider to change this option.	5	2023-09-11	POSITIVE	0.525423229	Bugs & Reliability, Feature Requests
52e6f3b7-5d55-409b-bd05-985c5085c60a	1	Every time the network doesn't work the network is no good Network need Improvement.	1	2023-09-11	NEGATIVE	0.999305248	Bugs & Reliability
83b6e81d-1ffb-4955-b3bd-5847554d32bd	1	Its best app but not fastest and more time this not functional For me	5	2023-09-11	POSITIVE	0.983129323	General Feedback
b548812d-57ea-4afb-a0c3-7ac7a61d36d3	1	በጣም ጥሩ app new	5	2023-09-10	POSITIVE	0.761147618	General Feedback
babd31aa-29e2-46ea-b68a-86394b14832f	1	This app is the best	5	2023-09-10	POSITIVE	0.999816239	General Feedback
db231ba5-0660-4276-ae80-a72a72822e34	1	ቶሎ ቶሎ ገንዘብ በናወታበትም ለመላክ በጣም ጥሩ ነው	5	2023-09-10	POSITIVE	0.923957765	General Feedback
fae5a186-f569-437d-a52c-e2fe0fa66a95	1	This application works effectively!	5	2023-09-09	POSITIVE	0.999848008	Bugs & Reliability
610479f2-cabf-4c78-a851-9f42db16b0e4	1	It's very incredible application good job	5	2023-09-09	POSITIVE	0.999868870	General Feedback
ea4f66c3-0c7f-4981-bf02-60ea9235bed3	1	Just wish it has a dark mode.	4	2023-09-09	POSITIVE	0.998120010	Feature Requests
062f7ccb-a716-4384-b9b7-681664b4aff7	1	best, simple, efficient ...... 👏👏👏👏👏👏	5	2023-09-09	POSITIVE	0.999564946	App Speed & Performance, User Interface & Experience
ed59ca6e-c0fa-405f-9da4-8d54d208eaef	1	The last update was useless	1	2023-09-09	NEGATIVE	0.999765098	Feature Requests
96cc4a25-ef79-45a8-8725-dcc6e04c040c	1	The most horrible app	1	2023-09-09	NEGATIVE	0.998852849	General Feedback
87a754f3-4212-42b3-975e-b9ae9e41cec5	1	This App make's my life easier. thank you!!!	5	2023-09-09	POSITIVE	0.999647856	General Feedback
9abe9304-c906-445f-b453-6a6ae4bfd7da	1	The best app	5	2023-09-09	POSITIVE	0.999846935	General Feedback
2445259c-5996-4ffb-aac5-48bf3acbc9a6	1	Best app ever!	5	2023-09-09	POSITIVE	0.999778092	General Feedback
bc17d02a-2d92-4931-9bff-4aae5436d63c	1	App. With a good performance	4	2023-09-09	POSITIVE	0.999849439	App Speed & Performance
ce478df2-265c-42aa-9ae5-a5fe1e741a9b	1	Easy and fast	5	2023-09-08	POSITIVE	0.999558389	Transaction Performance, User Interface & Experience
7d364620-e480-4ade-b367-b0290b854098	1	please Show us more transaction history	2	2023-09-08	NEGATIVE	0.752382576	Transaction Performance
da33d67c-ebe2-4b02-98ed-ec8f86b90385	1	Best ever app I love it	5	2023-09-08	POSITIVE	0.999854326	General Feedback
031bc8c1-1369-4476-b49c-6e174ac921be	1	It doesn't show your bank information anymore.	2	2023-09-08	NEGATIVE	0.999309540	General Feedback
1b83dd0b-d4b9-45ac-a9fc-414fe1f11853	1	It is so easy to use nice app	5	2023-09-07	POSITIVE	0.999340355	User Interface & Experience
e1067239-25d7-4f3f-9765-c61cb91b6ac8	1	It doesn't work on my phone it says your device is rooted you can't use it Please tell me What should i do	1	2023-09-07	NEGATIVE	0.999688625	Bugs & Reliability
d9ea8d9b-d39a-4cbe-911d-337877023e50	1	Please roll back the update. Everything stops working after recent update	1	2023-09-07	NEGATIVE	0.998286426	Feature Requests
8f6abfaf-1587-4af0-aa9d-13aeba7d7079	1	Better mobile banking app than other local banks, it pay a lot of utilities	5	2023-09-07	POSITIVE	0.986075103	General Feedback
f62a2110-5a91-4613-8243-836a3dc5b57b	1	I like this app	5	2023-09-07	POSITIVE	0.999651670	General Feedback
07d7d575-1157-41e4-be40-7d666c741e02	1	It is perfect it helps me more ......	5	2023-09-07	POSITIVE	0.999880195	Customer Support
404600b3-5d31-4de2-9b30-9f8b24eb98ca	1	Its fine between Cbe to cbe and telebirr.	4	2023-09-06	POSITIVE	0.997913301	General Feedback
5e92db82-30e8-4561-affc-96de3f716215	1	App Betam tiru new neger gin lemin hisab meteyekiya yelewum	5	2023-09-06	POSITIVE	0.985018313	General Feedback
b1a92885-60fd-4f22-a214-fce481ecfc6a	1	Since Yesterday New Update, It doesn't show my amount and doesn't task anything at all ! I hope to fix this issues sooner than later!	1	2023-09-06	NEGATIVE	0.996102929	Bugs & Reliability, Feature Requests
3a9be3ca-7e36-4f38-9fa6-009ccaeaae8f	1	Its good digital fainanc	5	2023-09-06	POSITIVE	0.999788344	General Feedback
8a43a952-72bd-4fb3-9b1d-a34baa74d7aa	1	It is most popular app in our company	5	2023-09-06	POSITIVE	0.999556839	General Feedback
8ce4a0fd-4871-47e9-b8dd-9a595bc535d8	1	Its wonderful app but there something to be correct CBEbirr and other CBE apps need to be integrated in one app.	5	2023-09-06	POSITIVE	0.922661662	General Feedback
60dc2c21-e128-4ad2-a97f-ae35467b9fca	1	Easy, fast and friendly.	5	2023-09-06	POSITIVE	0.999763906	Transaction Performance, User Interface & Experience
60fe4a5b-83b9-44c0-b543-62d11d1bd140	1	Ver bad app.የአገልግሎት ጊዜ ሳያበቃ መስራት አቆመብኝ.	1	2023-09-06	NEGATIVE	0.997738838	General Feedback
f3e693f4-fcc5-45d4-a758-976ac86f3188	1	Print it on apps	5	2023-09-06	POSITIVE	0.688556731	General Feedback
450bbbfe-4762-4efb-856e-70e9b4760998	1	The application used to work just fine a few month's before however recently it is not wornking properly and dosen't show any recent transaction.	3	2023-09-05	NEUTRAL	0.999393582	Bugs & Reliability, Transaction Performance
4aad2eae-316e-4d0b-8d80-5aa34c4a9264	1	The new update has a gleach and is none responsive.	1	2023-09-05	NEGATIVE	0.999800265	App Speed & Performance, Feature Requests
57a4ab4c-af68-473d-b9ed-c401bca79c7a	1	The best app of CBE which i prefer	5	2023-09-05	POSITIVE	0.999731004	General Feedback
ae621e20-ddba-42fa-8849-20415b220aba	1	As CBE is the main commercial bank in the country, we expect more on the development of the app regarding login security . Finger print login option should include on the next update release. Because most people have smart phones on this day.	3	2023-09-05	NEUTRAL	0.994531214	Account Access Issues, Feature Requests, Security Concerns
b9e42e8c-27ef-4edf-8532-d109f8230dd8	1	I like this version	5	2023-09-05	POSITIVE	0.999831557	General Feedback
86587e5c-c551-40b1-9bf5-9a612e001299	1	CBE mobile banking is unique which is I always prefer every where !!	5	2023-09-04	POSITIVE	0.998604596	General Feedback
e7b6a097-5f9a-4b79-b37f-9eb8345ee093	1	not bad except illogicality of persenel.	2	2023-09-04	NEGATIVE	0.904064059	General Feedback
a662acd2-c894-4fbe-a5f7-091bf2fd1be0	1	In fact, it's a good app to make our daily life easier! However, I have encountered several times issues with this app. 1. It's not always working with network error, even though the network is good on my phone. 2. It happened to me several times that when I transfer money to someone's account, I doubled the transfer! Or in another word, my money sent two times. If I wanted to send 10,000, I found that sent 20,000 because of the APP error. I hope this will be fixed soon.	1	2023-09-04	NEGATIVE	0.993352532	Bugs & Reliability, Transaction Performance
e5082d78-2978-49cb-a822-e026804c8739	1	Good and excellent service application	5	2023-09-04	POSITIVE	0.999869823	General Feedback
e47293f5-10a8-4c39-9c6b-d84876361eef	1	Best service and better than other bank.	5	2023-09-03	POSITIVE	0.999699831	General Feedback
81e8f621-408b-4861-9387-a65af3d240a5	1	This app is a good app. The best mobile banking app. It is easy and convenient to use. So I gave it 5 stars.	5	2023-09-03	POSITIVE	0.999820054	User Interface & Experience
202c47ed-13c3-48ad-9913-b1a5d76a0b53	1	I can't access my recent transaction history	1	2023-09-02	NEGATIVE	0.999306083	Account Access Issues, Transaction Performance
5e05f9c0-447f-4823-8c56-a88bf765187c	1	በጣም አሪፍ አፕ ነው!!😘😘	5	2023-09-02	POSITIVE	0.990988672	General Feedback
5dafdbc3-8bce-4bf5-8819-717b89d32660	1	The worst app to ever exist	1	2023-09-01	NEGATIVE	0.999789059	General Feedback
d57ee705-8961-4189-a8e5-357661297d07	1	At the biggning the app was normal and very handy. Now It's so slow and i can't even load my transactions properly. Not only the app all your customer services are declining so it's better to correct what you have done wrong. Thanks!	1	2023-09-01	NEGATIVE	0.997926116	App Speed & Performance, Customer Support, Transaction Performance
91aae55d-2d65-48e8-a8ba-7c93fb21bcb1	1	Mahamd muussaa uruu wadaay Asabot	5	2023-09-01	POSITIVE	0.990038633	General Feedback
c0e16524-14ed-4912-bf16-8f9cfec479eb	1	Very good App	5	2023-08-31	POSITIVE	0.999867558	General Feedback
340cb739-1e9e-46d2-805f-7c3ee1ef3247	1	Easy and fast, timable	5	2023-08-30	POSITIVE	0.997076154	Transaction Performance, User Interface & Experience
73fb67f7-ee9e-4658-abd7-4b680ae2f4e2	1	I like it	5	2023-08-30	POSITIVE	0.999859333	General Feedback
f4235f5b-fba6-4dea-b497-f675be5d4cdb	1	Best Appi forever ♾️	5	2023-08-29	POSITIVE	0.999816358	General Feedback
cfdf99f6-6f12-4c8d-92a6-5695a3da83f4	1	Thank you batam innamasagginalen	5	2023-08-29	POSITIVE	0.970083177	General Feedback
c300f3cc-c644-47db-ba37-ee141972b80f	1	Very interested in	5	2023-08-29	POSITIVE	0.999625802	General Feedback
41093cd9-fa33-4cda-8667-e7925734f185	1	Excellent application appreciated!!!!	5	2023-08-28	POSITIVE	0.999823630	General Feedback
9f74b97a-bf3f-4e6c-997c-d987e9b2ec1d	1	I like it and that is exceptional	4	2023-08-28	POSITIVE	0.999888539	General Feedback
e0ce6fb7-745a-4679-88d0-688e80efd168	1	Very very slow app i have no idea	3	2023-08-28	NEUTRAL	0.999647975	App Speed & Performance, Transaction Performance
1e09df71-fa05-4752-aff4-f88978ecb4b9	1	Tanks it's very good and useful	5	2023-08-27	POSITIVE	0.999811947	General Feedback
8d7b677c-e0e4-4728-b8c3-fa3c58f754f1	1	When your app is convenient for us blind people, why are the bank employees advising us that we can't do it? Please do some conscious work and at least help your employees not to be under the machine.	5	2023-08-27	POSITIVE	0.996106803	Bugs & Reliability, Customer Support
c6f9e270-22c9-4562-b78f-b7d1ac706d21	1	An able to use it since January. Thanks	1	2023-08-27	NEGATIVE	0.999768913	General Feedback
839bc1b0-7a7b-44a3-a978-0aad7bb57f4e	1	The worst Banking app in Ethiopia, I'm transferring money twice what's the fuxk? Even you will not get back the double payment if you tell the bank	1	2023-08-27	NEGATIVE	0.999756873	Transaction Performance
acedfbfd-21fd-48f5-ae64-f709f5e49cc0	1	The fact that i have to go to bank and fill out a form everytime i need to login on a new device is crazy	1	2023-08-26	NEGATIVE	0.999008358	Account Access Issues
c7149640-60b1-47c3-b398-ece72a23b5c1	1	CBE we always relay on it	5	2023-08-24	POSITIVE	0.997029305	General Feedback
4b61f6be-0cab-4e85-8ebb-7fa98251d7a3	1	Very nice app	5	2023-08-24	POSITIVE	0.999856234	General Feedback
3920df8e-f45f-4987-9dcf-45652816e38d	1	It cannot activated online without going branch.	2	2023-08-24	NEGATIVE	0.997976840	General Feedback
37ff845b-5249-4e7d-b4bc-5a42fdfbe47f	1	I'm very happy I get this service	5	2023-08-24	POSITIVE	0.999801695	General Feedback
f71f6348-5998-41e4-ba89-0491362d800a	1	I like this app	5	2023-08-23	POSITIVE	0.999651670	General Feedback
f88e3d81-614c-46b0-b4ed-54a08a4c45d5	1	Don't work properly!	1	2023-08-23	NEGATIVE	0.999798119	Bugs & Reliability
5e740ac4-5a54-41de-ae80-46e64abccee3	1	Cbe is the worest bank in Ethiopia..period!	1	2023-08-23	NEGATIVE	0.691312134	General Feedback
8856c627-a476-4b29-aa2f-0dd5604d0ce1	1	Others services remain good.But Some Futures, like finance is not found in this app.so what might be the reason?	5	2023-08-23	POSITIVE	0.996013880	General Feedback
a4399d61-ae04-46c1-9834-eb4d46059445	1	The best mobile app in Ethiopia	5	2023-08-23	POSITIVE	0.999800146	General Feedback
958d7afa-2b57-4366-b46e-8d857dab9f8d	1	It's the simplest way money transaction	5	2023-08-23	POSITIVE	0.978139579	Transaction Performance
78a57b21-1baa-4ac0-a0aa-66cc347fe1a0	1	Góod and easy app	3	2023-08-23	NEUTRAL	0.999861836	User Interface & Experience
27afee93-a27a-466f-93a8-4237a924ef9c	1	Thank you for this app	5	2023-08-23	POSITIVE	0.999820411	General Feedback
255b5c36-f9f6-4914-a96a-710286ce6501	1	Effective services app	1	2023-08-21	NEGATIVE	0.999697924	General Feedback
153556e7-aee1-488c-b63d-b1c5995c9188	1	Unable to update	2	2023-08-20	NEGATIVE	0.999526381	Account Access Issues, Feature Requests
69559939-9f75-472a-9fd5-a5be75856209	1	Good in all	5	2023-08-18	POSITIVE	0.999833107	General Feedback
2e1591df-5f9d-40b1-a355-a88a45119960	2	It is ok	5	2024-09-01	POSITIVE	0.999849677	General Feedback
00013aa2-1699-4a8d-a796-cb5ab3d8cc37	1	It is very simple app to use&fast	5	2023-08-18	POSITIVE	0.922606528	Transaction Performance, User Interface & Experience
94516188-e026-4d9b-9680-5f0d3be1b412	1	It is the amazing app	5	2023-08-16	POSITIVE	0.999881625	General Feedback
aabc19e0-1adf-4889-8ad9-f366b7a8b12e	1	Nice app ever	4	2023-08-15	POSITIVE	0.999838471	General Feedback
52609c49-ee8a-419c-ae59-6dccd34d76e9	1	The best app	5	2023-08-14	POSITIVE	0.999846935	General Feedback
3064c8ea-cf0e-4e73-afe8-31340c577294	1	I excuted an order just once but this app has doubled it on it's own on my last order.With that I had to pay extra 100OETB unnecessarily. A bit of annoying 🙄	1	2023-08-14	NEGATIVE	0.998704672	General Feedback
c9c491bc-1098-471f-b399-6b6e4936fefc	1	ለCBE developing crue ማስተላለፍ የምፈልገው መልክት app'አችሁ ጥሩ ሆኖ ሳለ ለምንድነው ሁሉንም አገልግሎት በአንድ app merge የማታረጉት. እዚጋ cbe birr ale ሌላ ደሞ አዲሱ CBE merchant app አለ ነዳጅ app አለ እያለ ሌላም 7+ app በCBE ስር አለ... አሁን ሰው cbe birr መጠቀም ቢፈልግ ግዴታ ወደ cbe birr ብር አስገብቶ ወይም ወደ merchant app አስገብቶ ምናምን ነው...ይሄ ሁላ ቀርቶ የናንተ best የሆነ app አላችሁ CBE Mobile banking app..Which is one of the best app in Ethiopia...It's easy, the UI is very nice...ግን ገንዘቡ ከአንዱ ወደ አንዱ ከማስተላለፍ ሁሉንም አገልግሎቶች ወደ አንድ merge ተደረገው ብናይ ወደ mobile banking app ጥሩ ነው::	4	2023-08-13	POSITIVE	0.998552859	User Interface & Experience
fc93639e-64d6-44f5-879f-4c28a713a18e	1	የሲስተም ችግር በብዛት ይታያል። Its becoming unreliable payment system	3	2023-08-12	NEUTRAL	0.999202311	Transaction Performance
cc4bf455-5144-4854-98a5-8b1cceb1a59e	1	Very good app and user friendly	4	2023-08-12	POSITIVE	0.999853373	User Interface & Experience
e20593a4-b0a3-4f06-93bb-7fa177fd6c18	1	this app is very good	5	2023-08-11	POSITIVE	0.999862313	General Feedback
e6c7037c-9169-4360-8805-abf6adf7908c	1	With each update the app is getting slower and slower, specially when requesting transaction history. And I wish the logging process could be done easily. When someone changes a phone, it makes it mandatory to consult the branch and that makes it not to be self assisted. Hope you could fix it. Please add an option of transferring to other TeleBirr numbers other than the "Own telebirr" option. It id very limiting now a days	4	2023-08-11	POSITIVE	0.993143201	Bugs & Reliability, Feature Requests, Transaction Performance
fb6feb12-da42-4cfd-97fe-46ade01e3a60	1	Why cant i see my bank statements.or past tramsactions beyond a few.	3	2023-08-10	NEUTRAL	0.996000350	General Feedback
5d4d43a7-0244-4471-a380-b995d04bfb31	1	Ok im using ? Thise app how can i get online payment?	5	2023-08-09	POSITIVE	0.994737566	Transaction Performance
ec38ad5d-ee1e-431b-afd1-e92d9b15acfb	1	It is very easy to use rather than the ussd	5	2023-08-08	POSITIVE	0.565640211	User Interface & Experience
8440bb92-6ec2-4b52-8bd0-c2e94f5d4d75	1	Exceptional app for Ethiopia	5	2023-08-08	POSITIVE	0.999372900	General Feedback
9fc17aec-aaa0-4809-bb0c-d59c400fccd3	1	It's very nice	5	2023-08-08	POSITIVE	0.999863148	General Feedback
4e2900b1-9c65-4dd7-be7f-4421d351af91	1	Thus app is so easy and very importance to us	5	2023-08-08	POSITIVE	0.999754846	User Interface & Experience
3405572e-fd7b-43a3-8706-2ee9f8d6b928	1	Water bill only on Addis ababa	4	2023-08-08	POSITIVE	0.962884009	General Feedback
16637ee4-1feb-4d8d-9c0c-3fe0bdcccf6e	1	It's very nice	5	2023-08-07	POSITIVE	0.999863148	General Feedback
c4a34304-3ad9-4acf-852d-a2d2894aa1a9	1	Thanks very much	5	2023-08-07	POSITIVE	0.999810636	General Feedback
d8177ba2-0c1b-4dfa-866d-e4d31e0fc711	1	I like the app because it is fast for transaction. But still you have to work on it like user full name, bank statement pdf pin at the end of the app. You have to add that features on it. Thank you.	3	2023-08-06	NEUTRAL	0.962598503	Bugs & Reliability, Feature Requests, Transaction Performance
4b2d9c48-9ac5-4f13-a4d4-001f801eec87	1	100% Made My Life Easier	5	2023-08-06	POSITIVE	0.998146296	General Feedback
004fd91f-b746-4c0a-b9f0-5d9f3b2142d1	1	It's the best app fast and clear service good job	4	2023-08-06	POSITIVE	0.999795496	Transaction Performance
d6cd8634-4b74-4cbf-ac24-859c665b9f37	1	hulem yemntemamenbet bank 😆😂😂	1	2023-08-05	NEGATIVE	0.659088492	General Feedback
c371db44-45d6-4367-bff4-2d6db5f19ea4	1	Very easy to use and fast	5	2023-08-05	POSITIVE	0.999565661	Transaction Performance, User Interface & Experience
378ca5a8-9d23-4703-9e41-ebd8618080c1	1	It is nis	5	2023-08-04	POSITIVE	0.988575637	General Feedback
4bfb46b5-9f75-4921-8378-08262932b189	1	I've been using this app for quite some time now and recently I've been seeing some unusual bugs, like saying error repository report, not syncing when I transfer to another account but then when I try it again, sent complete but has sent to that account twice... deducted twice...this needs to fixed ASAP...	2	2023-08-03	NEGATIVE	0.999319673	Bugs & Reliability, Feature Requests, Transaction Performance
e95618c7-c8a2-49f3-85ea-0987a9075cd4	1	One of best bank applcation in ethiopia so far	5	2023-08-03	POSITIVE	0.999601305	General Feedback
fba51cd4-e66e-48a3-8893-94d8f49db5ee	1	The best all times	5	2023-08-02	POSITIVE	0.999860764	General Feedback
e4e3b52e-852f-40d2-96d9-fe7958494104	1	really it's good app🥰🥰🥰	5	2023-08-02	POSITIVE	0.999866486	General Feedback
f0b82caf-b58d-47f9-858c-396f0725b561	1	The app never opens in Android	1	2023-08-02	NEGATIVE	0.999783099	General Feedback
106ca8f0-5edb-47d4-89b9-f1218ef6c6e9	1	Fantastic system but frontline staff need customer service training.	4	2023-08-02	POSITIVE	0.987767458	Customer Support
6ea78d33-ffec-4a27-ad7a-17718a383198	1	Although it is a great, quick, and simple tool to use for a variety of financial transaction purposes, an upgrade of biometrics and a six-digit pin code option should be introduced for increased security. More importantly, it would be great if it could provide an online cash receipt voucher for printout.	4	2023-08-01	POSITIVE	0.990862131	Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
c7269c80-eace-449b-9af4-a11cfa840ca2	1	Very good .	5	2023-08-01	POSITIVE	0.999847531	General Feedback
7e68628b-3313-4f42-974e-40dabe44a96b	1	I am proud 👏	5	2023-07-30	POSITIVE	0.999874353	General Feedback
66b91466-51bd-434e-bf5a-9080acc9ac06	1	ዋው ምርጥ አፕ ነው❤️❤️❤️	5	2023-07-29	POSITIVE	0.861633003	General Feedback
b37198f3-e7ae-4582-ad48-6d1f6aa5a8e6	1	BalanceDear Customer your Account 1********8778 has been debited with ETB 6000. Your Current Balance is ETB 14800000.1. Thank you for Banking with CBE!	5	2023-07-04	POSITIVE	0.996206999	General Feedback
d4477f8c-1c55-4e8a-9ea3-717f381518b5	1	The application for transaction any where and time important however on process transaction intruption after some minut deducted the amount so happened double payment . So please improved ! To transact reliable show correctly on time of transaction.	2	2023-07-29	NEGATIVE	0.974115372	Bugs & Reliability, Transaction Performance
1012927d-292b-4de8-89fe-8d741dd304ec	1	ጊዜና ኑሮን የሚያቀል ሁሉንም በስልኬ ላይ ወድጄዋለው ።	5	2023-07-29	POSITIVE	0.923957765	General Feedback
937fa935-277c-4b99-b6d0-3b81c89d6807	1	Worst app ever🤮🤮	1	2023-07-28	NEGATIVE	0.999780357	General Feedback
41d65b0c-89be-43c7-8ddf-95f74c051166	1	I like it CBE app but the login pass code is doesn't give u comfort cause it's weak n it's only 4 digits	4	2023-07-26	POSITIVE	0.998924911	Account Access Issues
71538491-75ba-44c4-a8f5-27a3e3e886fb	1	The UI is stone aged	1	2023-07-26	NEGATIVE	0.997797847	User Interface & Experience
f3c73066-2af0-410b-b20b-6ba0a5235916	1	I feel good, it is time and energy saving and also the first platform to digitalization of the financial issue. I want to remanid the developers to make more accessible and add more feature to it!	5	2023-07-26	POSITIVE	0.998876154	Bugs & Reliability, Feature Requests, User Interface & Experience
ee824440-97f0-4073-8041-a3364e275c84	1	It was so amazing	5	2023-07-26	POSITIVE	0.999881625	General Feedback
c629e0eb-f7a3-44e9-b584-bb034844e113	1	Fingerprint lock not working	1	2023-07-26	NEGATIVE	0.999687433	Account Access Issues, Bugs & Reliability, Feature Requests
0d11a938-35ae-4d97-a8ad-26d2a16ebd05	1	Desirable to transfer money properly	5	2023-07-24	POSITIVE	0.997174144	Transaction Performance
546f92f4-9b13-4445-8e81-3df2be55d78c	1	It is a very basic app. Banks nowadays offer many services through their app. I suggest you add the abilty to get statements, the ability to freeze the card if stolen or when traveling. The abilty to use the card while traveling. I have noticed that if Ieave Ethiopia it is not possible to pay my bills back home. So in general the app is very helpful and eased the burden of carrying money arroubd in Ethiopia, please improve it further.	4	2023-07-24	POSITIVE	0.991291165	Bugs & Reliability, Customer Support, Feature Requests
a41940a0-5d6e-4c1e-94d5-e7b4e7a4b5fe	1	Its good app	3	2023-07-24	NEUTRAL	0.999861360	General Feedback
f3d23cee-d67c-4ed2-a221-1d6e92a2d295	1	Arif now silke	5	2023-07-23	POSITIVE	0.992914557	General Feedback
350c6e48-00aa-4219-a3da-1f895e0d1160	1	I have one complain, why it require verification code every time when i change my phone or reinstalled the app, as you know that code i can get it only from the branch. I know that it demanded for security reason but this method could be changed by otp sms text then i enter my own PIN and log in. couldn't you send us otp (One time password)? For instance like Dashen Bank. i waste my time and money to get verification code. You seriously think about it.	1	2023-07-23	NEGATIVE	0.994739830	Account Access Issues, Security Concerns, Transaction Performance
bf52da5b-c790-4357-ae1f-3c4010a6ce7c	1	Solomon ayele jima	1	2023-07-22	NEGATIVE	0.960525572	General Feedback
772406bb-dc1c-4823-a3db-5fe64ed215d4	1	This app is helpful and interesting but if you add printing Receipts it become more interesting thank you in advance.	5	2023-07-22	POSITIVE	0.993398905	Customer Support, Feature Requests
033cf0d1-fbe9-4c47-ba6f-c179c8436c9b	1	Very use full	5	2023-07-22	POSITIVE	0.993804216	General Feedback
74260822-0672-4758-831d-1b20e1201cf9	1	Just BAD. please improve it.	1	2023-07-22	NEGATIVE	0.998841107	General Feedback
7a49e570-77e6-45d6-b222-b27d4605c52c	1	Good Good service	5	2023-07-22	POSITIVE	0.999851584	General Feedback
9100aa5d-9d54-4885-918b-5e8688962495	1	It is bad and the app made my phone to behave bad	1	2023-07-21	NEGATIVE	0.999811947	General Feedback
591c8529-23f6-4f07-980c-dc93bff20edb	1	Please include a mechanism to sort out a statement for a transaction with a single person or enterprise, on ur cbe birr or mobile banking	3	2023-07-21	NEUTRAL	0.989570022	Feature Requests, Transaction Performance
7091d753-e746-443e-b708-8c288b0dcb6c	1	I couldn't install the app it stuck you gotta fix it	1	2023-07-20	NEGATIVE	0.998922467	Bugs & Reliability, Transaction Performance
390fe074-26bf-447a-a7c4-d799fe6073df	1	Relatively good app, but we need electronic receipt or advice in PDF format to be printed for every transaction or payment we made (AWSA, EEU,IMMIGRATION FOR PASSPORT, ...) think about it.	5	2023-07-20	POSITIVE	0.842852652	Transaction Performance
99d896a6-d967-4658-9ee0-32621ecd0ace	1	Am happy to use this app, because it's very nice to use .	1	2023-07-20	NEGATIVE	0.999833822	General Feedback
9e70353b-449f-4365-939d-1b97df1f5d5d	1	No Hawassa water bill payment	5	2023-07-20	POSITIVE	0.997716427	Transaction Performance
48d05f2a-6c4c-45b2-9461-5fd14e531106	1	በጣም አሪፍ አፕሊኬሽን ነው መስተካከል ያለበት ነገር ገንዘብ ለማስተላለፍ ተጨማሪ ማረጋገጫ እስቴፕ ቢኖረው ፤ ምክንያቱም በኔትወርክ ምክንያት አልተላከም ብሎ እንደገና ስትሞክር በኃላ ግን ሁለት ጊዜ መላኩን ይነግርሃል !!! ከዚያ የፈሠሠ ውሃ አይታፈስም ይላል ያገሬ ሠው ።	4	2023-07-19	POSITIVE	0.512873352	General Feedback
78f96aaf-0b88-440e-a4db-47534e60db6a	1	Best of all banks, easy to use app	5	2023-07-16	POSITIVE	0.997720182	User Interface & Experience
0549ef70-1b7d-49f2-89d9-43352ad18670	1	The worst app I have ever seen I hate it.	1	2023-07-16	NEGATIVE	0.999787152	General Feedback
383a6845-98b7-4d0f-9e95-d99be6a0e147	1	You guys really need to improve the app. I know there are lots of users, more than any other bank. But still look at telebirr. There is an issue of receiving text when money is deposited. Buying airline ticket is a Hussle. The app in its current state doesn't represent the giant CBE!!	1	2023-07-14	NEGATIVE	0.997840881	Bugs & Reliability, User Interface & Experience
2e2860ad-a613-486f-aaf6-50f173daa411	1	It just disturbs if you left it open. Bad user experience	2	2023-07-11	NEGATIVE	0.999729097	General Feedback
6ecc3811-269b-4f48-b001-bc52287bf408	1	Short and precise app.	5	2023-07-08	POSITIVE	0.994060099	General Feedback
00ec9a23-cdc5-4eb1-a074-56db739bee43	1	It is a great app what i always prefer.but there are some shortcomings like all account wide statements are not seen and the receipt should contain the banks legal stamp after we completw the transactions. Continue.....!	4	2023-07-07	POSITIVE	0.996059954	Feature Requests, Transaction Performance
fec3535f-06f2-4845-aa3a-59e62d0c5f03	1	One of a kind app! Just wow!!	5	2023-07-06	POSITIVE	0.999744833	General Feedback
83694b3f-660c-429d-b7c5-fb6ab2ab0a2a	1	It does its job well	5	2023-07-06	POSITIVE	0.999832749	General Feedback
95843cd4-ed7d-4d3f-9b75-064c015c9906	1	It is azgizm app	5	2023-07-04	POSITIVE	0.932075024	General Feedback
54b5ec8f-dc0a-4048-83ed-78110641d08b	1	The app was like very wonderful and easy to use but currently some problem is faced me which is after login does not show me account balance and account number.how can i solve this problem??	5	2023-07-03	POSITIVE	0.999103367	Account Access Issues, Bugs & Reliability, User Interface & Experience
abfa44a8-dce5-4c34-8544-3610f7863bf4	1	It's not consistent. Now you can use , tomorrow you can't. Until then you don't know when's goin to be fixed 😕	3	2023-07-03	NEUTRAL	0.999702513	General Feedback
18237926-7e2d-4f64-8bd9-fcc540ee3513	1	It simply expires with in short period of time. And also it optionally sends multiple times.	3	2023-07-03	NEUTRAL	0.957777083	General Feedback
9d7f968d-55bc-434c-ad35-255b1159bbaa	1	When ever I wanted to transfer an amount or use some other service it keeps saying non available I tried to update it still the same	1	2023-07-01	NEGATIVE	0.999447763	Feature Requests, Transaction Performance
6551e543-6e45-4c5b-a265-955532bb2e19	1	It's easy for the customer	4	2023-07-01	POSITIVE	0.962062955	User Interface & Experience
1470ff4b-3645-4694-bdc1-49d94ffbfb45	1	The app stop to show me the balance, but it synchronized while refreshing in contrary all of the services are not available . No online care available , amazing millions of customer waiting physical contact for routine solution .	1	2023-07-01	NEGATIVE	0.990354657	Customer Support
fdb4f079-3fb6-46b7-8b5d-8d2ad774c9dc	1	0 star if possible, this bank is one of the most dumbest and most crowded banks I have ever seen. Plus, it is taking more than a month just to confirm the validity of the National ID I provided to open my account, so my account is still frozen for more than a month prior to it's creation and I can't use it. Never ever think about creating account using this bank. Anything that belongs to Ethiopian Government is in its poorest quality. Use modern banks like Awash bank or Abyssinia bank instead.	1	2023-06-30	NEGATIVE	0.999536753	User Interface & Experience
bccfdb29-b6ca-4ff7-9e1c-3ebae52abccb	1	Pleas update this app is not working	2	2023-06-30	NEGATIVE	0.999748647	Bugs & Reliability, Feature Requests
74ef0422-622e-4362-9068-4533d82ff4eb	1	Difficult to transfer	2	2023-06-29	NEGATIVE	0.999255598	Transaction Performance, User Interface & Experience
3270ee53-e2bd-4756-8577-4bf15ae5e57c	1	Except for the transaction sometimes not reaching destination,it is a good app	4	2023-06-29	POSITIVE	0.998615026	Transaction Performance
0130d275-f094-4530-9696-3c9f40b6277e	1	Great!! a simple yet amazingly performant app!	5	2023-06-27	POSITIVE	0.999861479	User Interface & Experience
c4772086-729d-42b9-8d61-5280036253c5	1	It is Very easy to use.	5	2023-06-24	POSITIVE	0.999398470	User Interface & Experience
bf99ce68-da6a-4076-a8ea-bfa1fbdf75d6	1	በዚህ መተግበሪያ መጠቀም ከጀመርኩ ቆይቻለሁ። አጠቃቀሙ ቀላልና ቀልጣፋ ነው።	5	2023-06-18	POSITIVE	0.944585383	General Feedback
f2911879-846c-49e3-982b-11731e2df9b5	1	No update available doesn't,'t show balance, no transfer available useless and a waste of time	1	2023-06-17	NEGATIVE	0.999375761	Feature Requests, Transaction Performance
122976cb-5f11-41b8-a809-02891e73c147	1	Great Mobile Banking Apps from great bank💞💞💞💞💞💞💞💞	5	2023-06-16	POSITIVE	0.999171972	General Feedback
0f58f26c-b026-4d8e-95d5-a6919897a7eb	1	It does not show recent transactions changes quickly	1	2023-06-15	NEGATIVE	0.991836965	Transaction Performance
9437a6d0-05bb-4684-8805-fb8ce9635640	1	It is not working. The previous was better.	1	2023-06-15	NEGATIVE	0.999688268	Bugs & Reliability
67283598-30fe-4e52-abd0-2c76a5b68587	1	Makes everything easy	5	2023-06-14	POSITIVE	0.999556124	User Interface & Experience
ffa4ed2d-558d-4801-9b6f-59b3d6a690d8	1	It's really but the pin code is short please update to lon pin or password & fingerprint Please update to new version and put the long password	5	2023-06-13	POSITIVE	0.997115850	Account Access Issues, Feature Requests
f3aeba3e-d693-4bc7-86c5-2f12e0f8aa64	1	At List we need to cheack our transction back to one year	5	2023-06-11	POSITIVE	0.999156117	General Feedback
f38c340b-2075-4b46-8b95-6488ff46cb95	1	this app is user friendly much easier and more interactive...I just like it.	5	2023-06-10	POSITIVE	0.999587119	User Interface & Experience
769de229-360c-4cb8-922c-027bac840594	1	I hope this bank have excellent Mobile app but please do on service...	4	2023-06-09	POSITIVE	0.989810109	General Feedback
bd86c5a1-88e0-49c7-8660-46a8084af6c5	1	በጣም የምወደው ባንክ	5	2023-06-08	POSITIVE	0.833725393	General Feedback
d20939ad-edfa-4940-87a0-42390551a420	1	Very satisfying and reliable Mobile banking app	5	2023-06-08	POSITIVE	0.999863863	Bugs & Reliability
5d9954dc-8fe9-4954-8202-871efb936e52	1	It makes my payment issue easy	5	2023-06-07	POSITIVE	0.974761128	Bugs & Reliability, Transaction Performance, User Interface & Experience
26b3d20f-2874-4889-9763-f4d367ddf274	1	i am a fan	5	2023-06-07	POSITIVE	0.999705493	General Feedback
0f8a284e-f66f-4210-a55e-0c972cc12849	1	Wonderful App. Thank you👏	5	2023-06-06	POSITIVE	0.999877810	General Feedback
73ebf292-0671-4ae1-bd1a-5b14cc2ccbc2	1	The app is so nice, but credit & debit must be in service requirements.	4	2023-06-06	POSITIVE	0.974020898	General Feedback
59894bb8-4856-407e-b5fe-2740471786bd	1	Excellent apps and very friendly	5	2023-06-06	POSITIVE	0.999879241	General Feedback
e6e9c63c-25e0-4df4-bf79-142536d808e9	1	I like the application very much because it is user friendly and makes transactions easiest, especially for business matters. But, these few days I faced difficulties of opening it. I tried to uninstall and re install the app, and re verified at the nearest cbe center. But still failed to use all the functions. It says 'none available'. Any suggestions please!	3	2023-06-05	NEUTRAL	0.999543607	Feature Requests, Transaction Performance, User Interface & Experience
b132407d-d0a2-4f02-8535-3565514604cb	1	Best app for CBE in Ethiopia.	5	2023-06-05	POSITIVE	0.998310566	General Feedback
3a361cb2-c4ad-40d7-833c-3d16cd730a1e	1	It is best and fast	5	2023-06-05	POSITIVE	0.999861479	Transaction Performance
a8a875b3-0d46-44df-90f5-c5a38d2044aa	1	Very nice app.	5	2023-06-05	POSITIVE	0.999861717	General Feedback
02d727b4-f0ff-4a99-93db-114370eac2e0	1	It is preferred app	5	2023-06-03	POSITIVE	0.997623384	General Feedback
83babb88-d572-436d-8aa0-d97adadddc41	1	It is easy and user friendly. To Use more MB add getting receipt and biometric authentication is mandatory like Telebirr.	5	2023-06-03	POSITIVE	0.975960314	Feature Requests, User Interface & Experience
8cbe5d2e-960c-45e3-ab83-7e6812edcc2c	1	Eventhough,this's the biggest bank in Ethiopia there is a deep problem on it's application. NO NETWORK everytime 😔	2	2023-06-01	NEGATIVE	0.999521494	Bugs & Reliability
0678f5f5-6cab-4b5d-b2cd-35f6d3738f28	1	We need update How to updated the app	3	2023-03-23	NEUTRAL	0.996639252	Feature Requests
2fa90a53-7e0d-4354-949e-b4c8cb889cb0	1	this app has bugs all over it!! you cant see your balance,transfer money inaddition shows error msg "none available". fix this!!	2	2023-05-31	NEGATIVE	0.999798834	Bugs & Reliability, Transaction Performance
2d4f37a0-00f1-454b-900d-1340e0cac14a	1	The app is not working, it repeatedly show notify "can't sync"	1	2023-05-29	NEGATIVE	0.993823886	Bugs & Reliability
3075b2ab-3259-4869-a5ac-87d70212240c	1	The app is always buggy, you've to fix: 1. Transfer history. 2. The double(duplicate) transfer issue which everyone faces, were it gives our error and I've to transfer for a second time thinking it didn't work and both transferred transfers go through.	3	2023-05-29	NEUTRAL	0.999552190	Bugs & Reliability, Transaction Performance
4c721254-7355-41cc-bd1c-6674d33795eb	1	It is amazing app	5	2023-05-27	POSITIVE	0.999878407	General Feedback
99427ede-a945-4af2-bdf5-d8304fe4f57b	1	This app is not working now. I installed it, but it is not opening.	5	2023-05-27	POSITIVE	0.999508023	Bugs & Reliability
96a2b4d0-6575-4787-ad74-66ac53425f98	1	Such a fantastic app	5	2023-05-27	POSITIVE	0.999862790	General Feedback
0464af42-7df5-4ea0-bbaa-69b4b53ecee7	1	I like it	5	2023-05-26	POSITIVE	0.999859333	General Feedback
99a06bbd-7587-4484-8a13-5c0e0a7790c6	1	I liked it	5	2023-05-26	POSITIVE	0.999826491	General Feedback
a516181e-1b3d-4aad-9fc8-4ae5549dba55	1	Open my mobile banking us	5	2023-05-26	POSITIVE	0.513878107	General Feedback
a394a633-7be8-436e-97e6-7c66926b3f76	1	Why is the Beneficiary menu removed in this update? I'm using S9+ and running android 10...	3	2023-05-26	NEUTRAL	0.999324083	Feature Requests
9acdce0b-f2d8-4c66-a754-7ec268b0306c	1	I like your Apps CBE but sometimes I face a problem like transaction mistake.	3	2023-05-25	NEUTRAL	0.999061525	Bugs & Reliability, Transaction Performance
aff2ec84-1179-4c94-ab8e-58585c48d270	1	Why doesn't it show your previous bank balances alongside the transactions! It should show previous balances too! Only shows recent transaction, it must show old transactions as well! It would be great if you could print your bank statement from the app	1	2023-05-25	NEGATIVE	0.991323709	Feature Requests, Transaction Performance
10a3147b-b7ed-4a56-94d0-f67293f63e31	1	Easy to use and convenient	5	2023-05-25	POSITIVE	0.998866081	User Interface & Experience
e5c5465e-84c5-4e51-bf40-28bd4d568561	1	I have been using this app. for long period of time but after my phone's motherboard was damaged and replaced it with a new one. it says "your device is rooted" whenever I have installed the app. again want to use it again as before. what shall I do?	4	2023-05-23	POSITIVE	0.961284935	General Feedback
0790562b-6dd1-459b-9d93-9e41e282ab64	1	It is a great app so far specially the speed is good. But it is important to know who send you money, so you should also show the sender's name if the receiver is in the sender's beneficiary list, because it shows the nick name of the receiver not the sender's name. Thank you.	5	2023-05-23	POSITIVE	0.563003182	App Speed & Performance, Transaction Performance
53ecde7f-6d36-4f33-a338-3695cbdb1282	1	Seems very Good	3	2023-05-20	NEUTRAL	0.999857187	General Feedback
c2f873d7-5ba3-41c2-90d4-60756ae9dbdc	1	Appkan waan ku haystaa si fiican buu noo caawiyaa badanaa	5	2023-05-19	POSITIVE	0.995288134	General Feedback
2cdcdbc2-bbfc-41cc-ab47-f24dc90e8135	1	Good improvement👍 number one app with in the bank industry.	5	2023-05-18	POSITIVE	0.994197607	General Feedback
b8e2fcd3-783b-4f79-8435-d5ea252857bd	1	Very excellent application Portable,easy and fast	5	2023-05-18	POSITIVE	0.999610960	Transaction Performance, User Interface & Experience
99a4d1e3-5621-4376-a043-8e22e572a21e	1	best safe app	5	2023-05-18	POSITIVE	0.999503732	Security Concerns
8b1ec1d0-1537-4c1c-ab99-ebb54aca5e40	1	How can I use this app?	5	2023-05-16	POSITIVE	0.998497486	General Feedback
81d44d9b-5f6b-446d-915d-14504f005f41	1	It's good I like this app semtime sistem problem	4	2023-05-15	POSITIVE	0.998853564	Bugs & Reliability
0f997498-04c4-43b7-8196-d80a85154c68	1	Very poor app from a huge bank.	2	2023-05-13	NEGATIVE	0.999808490	General Feedback
88128b4a-d607-4fd4-b2f0-f70f43360461	1	Good mobile banking app	4	2023-05-13	POSITIVE	0.999787271	General Feedback
fe3cda3b-f6e0-4132-bfd8-56dae4803960	1	The latest update makes the system crash.	1	2023-05-13	NEGATIVE	0.999773443	Bugs & Reliability, Feature Requests
55bad4bf-a1bf-4797-8bca-4d6aff4a2cfb	1	It is very nice app. I recommend all to use it.	5	2023-05-12	POSITIVE	0.999828935	General Feedback
c07392a1-704b-4ae0-9004-80ce4fbc77e0	1	I believe this app is fantastic	3	2023-05-12	NEUTRAL	0.999850154	General Feedback
ceaa4dff-e719-427d-b170-06ce12467af4	1	one of two	5	2023-05-11	POSITIVE	0.992929280	General Feedback
97cc8fdf-be3f-4f1b-b36e-24632bb0feb7	1	Thank you app google manager its very useful!!! Thank you!!	2	2023-05-10	NEGATIVE	0.999679685	General Feedback
38938a29-b6a0-4958-860b-fd09952a9c17	1	It's good but a bit late and stack a lot	5	2023-05-10	POSITIVE	0.832082510	General Feedback
f7568661-602a-449c-b9bd-5ed557343156	1	For yesterday onward the app is not working for me, it only say None available?! I don't know the meaning of that????	1	2023-05-10	NEGATIVE	0.999547660	Bugs & Reliability
790ee2eb-92aa-4ee8-a8d6-e7af3dd1f5a3	1	I really Like it	5	2023-05-09	POSITIVE	0.999854684	General Feedback
ee38a8d8-bb00-4308-a166-3f70197bb782	1	Good but needs improvement. It should retain my settings. For example, I turned off the cbe- Noor option, but everytime I open the app, it defaults back to the previous setting.	4	2023-05-06	POSITIVE	0.981847107	Feature Requests
299c8322-9f2f-48b5-9347-875d75733822	1	Very poor application	5	2023-05-06	POSITIVE	0.999811232	General Feedback
373c1a70-1921-44bf-ad48-9078cfbca466	1	COMERCIAL banks good	5	2023-05-05	POSITIVE	0.999844074	General Feedback
36e694ef-13e2-45a4-9294-194d1033ed2f	1	This app, Provides speedless service. We must compete in a competitive world. It improves your service.	1	2023-05-05	NEGATIVE	0.998758078	General Feedback
29793206-cbba-446f-8293-df7d9dcd9e48	1	it is app so perfect	1	2023-05-04	NEGATIVE	0.999820650	General Feedback
dce2a05d-bdbf-4547-b881-c3bf1f931336	1	Its very good app	5	2023-05-04	POSITIVE	0.999861598	General Feedback
aa758328-ba40-4a69-83e6-104ff21bf114	1	For me, It helped me a lot!	5	2023-05-04	POSITIVE	0.999761164	General Feedback
2eb041b7-96a2-44d4-934f-8a51a577b37a	1	It is a user friendly and helpful app. It has greatly helped my day to day activities. However, it requires improvement on the weekly transaction limitations and it sometimes crashes.	4	2023-05-02	POSITIVE	0.917536914	Bugs & Reliability, Customer Support, Transaction Performance, User Interface & Experience
23bc3352-13d5-4da5-9134-97b2b60d3203	1	I prefer this app	5	2023-02-21	POSITIVE	0.998943865	General Feedback
2d334dc0-a996-4263-b2f7-5a884dd0d889	1	After updating the app the transaction only lasted for only a week and it's not very useful when reviewing your oldest debits.	1	2023-05-02	NEGATIVE	0.999778330	Transaction Performance
c4c42ee3-3ea7-4659-bbb0-e69809c443e7	1	The latest update is full of bug until that it was great.	2	2023-05-01	NEGATIVE	0.996111691	Bugs & Reliability, Feature Requests
a6b0db1d-ec83-4ec0-9b52-2b0d7106ec85	1	It was good to work but It doesn't open for me, although i went twice the bank they have not found any solution.	2	2023-04-30	NEGATIVE	0.996228993	Bugs & Reliability
7b64c8b5-4e15-4707-84f3-42d06c3ede3e	1	Application is very important for us thanks	5	2023-04-30	POSITIVE	0.999770939	General Feedback
d8ceb6b2-9765-4571-9c1a-a84f51defaac	1	It is better, but active the transifer of money to own CBE account.	5	2023-04-29	POSITIVE	0.992281735	General Feedback
22ee1ab5-91ec-473b-ba35-41f9b6fed795	1	Well-done everyone who participate in the creation of this lovely financial app since it gives most important service for daily activity	5	2023-04-28	POSITIVE	0.999609649	General Feedback
9318e922-41bd-438c-86ab-9faa2e88b876	1	Its marvelous app	5	2023-04-27	POSITIVE	0.999868512	General Feedback
849978bf-1725-4d5c-9705-83b407fc7cc6	1	Doesn't link with nedaj app	1	2023-04-26	NEGATIVE	0.997974813	General Feedback
aa0f36d0-cfc6-45f8-ba80-224082043bf2	1	super application and fast transfer easy your money really I appreciated and injured for is services	5	2023-04-26	POSITIVE	0.887365460	Transaction Performance, User Interface & Experience
fa7b2b4a-34de-4c6b-b287-b0b61ca54e2b	1	Very useful supportive app in our day to day a activities or business	1	2023-04-25	NEGATIVE	0.999093056	General Feedback
1ad664cd-2d3b-42ba-bcdf-2e24207bfc49	1	I've experienced the best and simple mobile banking I ever had. The latest version is good 👍	5	2023-04-23	POSITIVE	0.999825180	User Interface & Experience
655ed062-4463-448c-bde9-67fc3b12456e	1	አፑ በጣም ምርጥ ነው*** ስጠቀምበት ነበር ከፋሲካ በዓል ቀደም ብሎ ከነበሩት ቀናት ጀምሮ ግን ልጠቀምበት አልቻልኩም። ከእናንተ ነው ወይስ ከባንኩ ሲስተም ፈጣን እርማት ይደረግ።	3	2023-04-22	NEUTRAL	0.961045623	General Feedback
4d1b2ec6-928a-4b7e-b875-7e04148ed8b5	1	It is easier to send money to friends and families	5	2023-04-21	POSITIVE	0.696587861	Transaction Performance
f5d7c0ae-58ed-4f2a-9746-1b7b0b854fe6	1	I love it tank's	5	2023-04-20	POSITIVE	0.999870420	General Feedback
00d3c07d-bfef-4827-8fe1-fb10075d16d8	1	This app is best and safe secure	4	2023-04-20	POSITIVE	0.999658823	Security Concerns
d8e77f9e-52ad-46af-b6c0-2fc915bc39c2	1	This app is good for daily transction systems	3	2023-04-20	NEUTRAL	0.996667325	General Feedback
68cfc573-3f6e-4f12-a02e-a6b1c832cde5	1	It have some bugs get stuck time to time but very easy to use I like it	3	2023-04-20	NEUTRAL	0.998327434	Bugs & Reliability, Transaction Performance, User Interface & Experience
08176e57-5ef5-4991-8f52-e557206fbb97	1	After few month stop working. If you don't know why update? Keep it as usual old version.	1	2023-04-18	NEGATIVE	0.997286677	Feature Requests
1f0c4bba-124d-4084-8004-6de38fd7ddea	1	This app is very useful because it is easy to use for everything.	5	2023-04-17	POSITIVE	0.998054981	User Interface & Experience
f4b5ed4e-fd5a-458d-afa3-57cfd0d33a6d	1	The last update was good for sharing and downloading but it worsens for the history option. You have to fix it for at least 1-month history view.	4	2023-04-16	POSITIVE	0.999468744	Bugs & Reliability, Feature Requests
316ff682-0b19-4bdb-8cb3-ad4c88077444	1	Good app thanks	5	2023-04-14	POSITIVE	0.999842763	General Feedback
f4b3f8db-9541-436f-b856-7a0851c6d78d	1	It's good but recently it's not showing My Recent Transactions so do something about it	3	2023-04-14	NEUTRAL	0.994159698	Transaction Performance
a3ef95fc-c819-4900-9d9e-b6c012d1baba	1	The app is not working, it doesn't show your balance, or you can not make any payments	2	2023-04-14	NEGATIVE	0.999456346	Bugs & Reliability, Transaction Performance
4e6ee8c0-5e0f-4f01-b53b-634fbb1a20c0	1	It's good and easy but it has no security features like finger print or pin code for payment and log in. Not safe app	2	2023-04-14	NEGATIVE	0.999345124	Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
5a2a3a60-65cb-4333-b523-d03d797deb50	1	An easy and very fast transactions compared to dailing *889#. I like this app.	4	2023-04-14	POSITIVE	0.999128163	Transaction Performance, User Interface & Experience
99fb9650-22f6-41d9-9360-88daec5940b7	1	it is best of best application !!	5	2023-04-13	POSITIVE	0.999434650	General Feedback
0fcd01fb-5a65-4a9e-8405-7c1c44b2c505	1	Please try to work on this app. It is not user-friendly and high-end. And say this while comparing with others both within and out of the country. Please try to include more features and functionality	1	2023-04-12	NEGATIVE	0.922794580	Bugs & Reliability, Feature Requests
3e15ee1e-efc9-46d6-b032-750657ec49a2	1	Th app is great. But you can't make the same amount of payment with the same reason more that once. It will show an error but sometimes it transfer with the error. It should be fixed on the next update.	4	2023-04-11	POSITIVE	0.994694412	Bugs & Reliability, Feature Requests, Transaction Performance
9310e983-a70d-4635-88a7-0620636f91ee	1	its a good aplication	5	2023-04-11	POSITIVE	0.999723852	General Feedback
18bc8c72-c57e-4702-a4a5-352369720bf7	1	It's a wonderful application, I like it	5	2023-04-11	POSITIVE	0.999884605	General Feedback
18435700-2a67-4b90-b5e6-a9b22a5cf4c3	1	ሁሌም የምተማመንበት ባንክ	5	2023-04-09	POSITIVE	0.833725393	General Feedback
9fa25df4-21ad-4e67-82a6-5532047a1ca4	1	Til now it's going perfect for me! according to the available services in Ethiopia right now. But today I couldn't access my account, hope it's just temporary, will wait until midnight	5	2023-04-08	POSITIVE	0.990360498	Account Access Issues
021997a1-8eb4-4b91-8276-21190c039ed1	1	Update sidereg lemn recent transaction yetefal	3	2023-04-08	NEUTRAL	0.992039442	Feature Requests, Transaction Performance
400d44c7-d5fc-4d72-9c64-eac88733e9c2	1	Please improve your system of registration. Even after you took actvation code from branch the process is too difficult to register. Why not response?? 1.Is that adding sufaricom airtime was good improvement. You may did thàt for your bussiness. Coz safari have their own apps to sell airtime. If you want to improve, Màke It to connect with account whith out need of going branch. 2. Even make it digital Mobile banking, mean paper less banking(Authorize customer to get account number at his home	1	2023-04-08	NEGATIVE	0.994326293	Account Access Issues, Customer Support, User Interface & Experience
43a89ac8-7926-4f6a-9d33-0085c1845220	1	The recent update has a bug. "Transfer to other bank option" will force close the app. Please fix it.	1	2023-03-24	NEGATIVE	0.999325871	Bugs & Reliability, Feature Requests, Transaction Performance
a883db4d-8d3f-4e09-b32f-58668b13f4d3	1	ወይ እናንተ፣ ተሻሽሏል ብዬ update አድርጌ ተባላው። ምንድነው የናንተ ነገር? appun upgrade እንደ ማድረግ downgrade ታደርጉታላቹህ። አቦ ምታስተካክሉት ከሆነ አስተካክሉት። transaction detail እንደ መጀመርያው ብዙ እንዲያሳይ ኣድርጉት።	1	2023-04-07	NEGATIVE	0.990772367	Feature Requests, Transaction Performance
ed66aa92-1413-4594-9f60-a39ade348197	1	Easy to use and user ፍሬንድልይ	5	2023-04-07	POSITIVE	0.983468294	User Interface & Experience
44301a5f-822a-4d19-97ab-ef1dbdf3b3d5	1	I wonder this up if it gives the mini statement with narrative details	5	2023-04-07	POSITIVE	0.913248956	Feature Requests
2d4b5302-a639-42e7-955a-73bc0f00a6b3	1	Very challenging to operate taking long time and sending error message. Unfriendly every time!	1	2023-04-07	NEGATIVE	0.996117592	Bugs & Reliability
b1c25a3b-006e-48d7-8c87-9d0928e7b005	1	Money transfer from account number to Bank account number	1	2023-04-07	NEGATIVE	0.966749251	Transaction Performance
42e29ce4-1075-4b61-a758-c21895f8c3ca	1	Says failed even if transaction completed... twice error	3	2023-04-06	NEUTRAL	0.999554098	Bugs & Reliability, Transaction Performance
939747e7-f7ac-43e7-99be-8bcc22f62e7e	1	Fast and Easy to use.	5	2023-04-06	POSITIVE	0.999613822	Transaction Performance, User Interface & Experience
760b42eb-6dbf-4d22-a832-ea387d9bb4c6	1	I am happy with the app & Satisfied !	5	2023-04-06	POSITIVE	0.999843001	General Feedback
9e9b6892-c3ab-4a86-bbd0-8c965126c479	1	I am so happy banking with CBE.	5	2023-04-05	POSITIVE	0.999837399	General Feedback
262cff7f-6120-4abd-bab3-e95deee5a37e	1	Amazing application, better than in person service.keep it up! Please include more option.	5	2023-04-05	POSITIVE	0.999513030	Feature Requests
6a5c01fe-e43b-4923-b5d7-3eec5b99afca	1	This app saves my time.	4	2023-04-05	POSITIVE	0.919026375	General Feedback
4e2c3f50-b669-4d3f-a141-f15d03581d09	1	I like this app doing great 🤙	4	2023-04-05	POSITIVE	0.999848247	General Feedback
5b65e6f5-5f13-46e2-bb26-8274700318e2	1	Not all services are available like transfer to mobile numbers	2	2023-04-04	NEGATIVE	0.995409787	Transaction Performance
597c49e6-655b-4234-ac5e-b5a15bacf517	1	ወደ ቴሌብር ያስተላለፍኩት ብር ሳይደርስ ሒሳቤን ቆርጦት ቀረ። 24 ሰዓት አልፎትም የለም። ምላሽ ካጣሁ CBE NOOR app መጠቀም አቆማለሁ	4	2023-04-04	POSITIVE	0.973191261	General Feedback
d854c62c-d7b3-4311-9f19-d1e667a49a5e	1	Easy to manipulate. Fast and even working with low speed internet connection.	5	2023-04-04	POSITIVE	0.940176249	App Speed & Performance, Transaction Performance, User Interface & Experience
2f2c87df-7501-425d-8e68-bc05216cd340	1	The app was updated 7 days ago. Since then it doesn't show the balance and seems like it is trying to update but the update never show a result even if after the green indicator shows sync finished and all the links for the different transaction say "none available".	1	2023-04-03	NEGATIVE	0.999107540	Feature Requests, Transaction Performance
c8c53a41-576a-4271-b16c-834608565ef9	1	Nice app i really like it	5	2023-04-03	POSITIVE	0.999857306	General Feedback
7e297cbe-3195-4353-b1b8-5df3886b8d8b	1	The app says it failed to transfer the money but it transferred money, so there is a high chance of transferring money twice.	2	2023-04-02	NEGATIVE	0.993673444	Transaction Performance
ba23b994-dfdf-4fa3-b0c4-9c950af89183	1	To say frankly this is amazing App Thanks CBE	5	2023-04-02	POSITIVE	0.999816835	General Feedback
a4111614-297d-4169-880e-c8f054f14a88	1	It is very nice app.	5	2023-03-31	POSITIVE	0.999851346	General Feedback
ae7daf88-0868-439e-8937-a67c39718c32	1	So far so good.	4	2023-03-31	POSITIVE	0.999839902	General Feedback
f6c4af80-532d-49d0-b590-56da2aea2b93	1	I have been using this app for 3 years and it was great. But now it has big problem. I can't pay bills or transfer money. Please fix it!	5	2023-03-31	POSITIVE	0.998612761	Bugs & Reliability, Transaction Performance
65b310ca-e362-4b12-be11-93bedad9558b	1	Doesn't work after update	1	2023-03-31	NEGATIVE	0.999548376	Bugs & Reliability, Feature Requests
5b351664-f0bd-42fb-bd26-625291d85db7	1	Why is this app not showing money transfer to other people?	1	2023-03-31	NEGATIVE	0.999008119	Transaction Performance
d76c8bdf-51a6-47f2-8bb9-142079ab65e4	1	oo my good reach to my gool	5	2023-03-31	POSITIVE	0.996642709	General Feedback
c45dce5e-02d3-465b-9f59-72540ab64e67	1	The most convenient banking app in Ethiopia. The password management system is top class.	5	2023-03-30	POSITIVE	0.997836053	Account Access Issues
7697899e-3e47-4644-aec7-8527cb897d99	1	Not bad app beter than Banke of Abssinya	1	2023-03-30	NEGATIVE	0.990122020	General Feedback
586eba84-5121-40db-9b9f-75754cef93dd	1	WOW the app solves big problems	5	2023-03-29	POSITIVE	0.998031199	Bugs & Reliability
a377633f-4fd3-491d-889b-f0f8e0de2f65	1	አብዛኞቹ ነገሮች ነፍ ግዜ ከሞከርን በውሀላ ነው የሚሰሪው በአካል መከራ በ App መከራ ውይ ውይ	1	2023-03-29	NEGATIVE	0.955194414	General Feedback
08ed51d3-6b54-48be-bd50-5bbd449acb20	1	Nice app so far....	5	2023-03-28	POSITIVE	0.999630213	General Feedback
0168440e-9def-4670-b7f9-32ec7428dcc0	1	I want to yoin yourbank	5	2023-03-27	POSITIVE	0.816392124	General Feedback
83c96032-9c41-4377-8b84-330410653b55	1	Many thanks for z team, specially for IT team, you are the first. Stay safe	4	2023-03-27	POSITIVE	0.999717414	Security Concerns
256b8ea9-1963-4b8b-bb18-422b92ac1dd8	1	ምርጥ App ነው።	4	2023-03-27	POSITIVE	0.897091925	General Feedback
af30a943-ed3e-46d1-b248-2fb1e95545dc	1	I have been using this wonderful app. It is easy to use and user-friendly and perfect user experience app. I just have one suggestion, if you cloud add more info like who(person or company) deposited, and deposit discrimination if any in the recent transaction section of the app. The rest is perfect.	5	2023-03-26	POSITIVE	0.999738753	Feature Requests, Transaction Performance, User Interface & Experience
7044b2e1-727f-46ce-b27a-bae664ba036a	1	Good to save time	5	2023-03-26	POSITIVE	0.999825060	General Feedback
d8b35f9e-aa40-4ec6-81b0-6781a81a07ac	1	Best of best app at all Cbe always relays on	5	2023-03-26	POSITIVE	0.996228695	General Feedback
ed89a211-7846-4603-a822-41223b5eaeef	1	Please Add the fingerprint Biometric System.	5	2023-03-25	POSITIVE	0.925765753	Feature Requests
be9e9ad4-86d4-4003-8f99-b261daa83e25	1	በርቱ ብዝ ቀጥሉ	5	2023-03-25	POSITIVE	0.833725393	General Feedback
77aea237-e0e2-4c54-8385-63d6d30a1b5a	1	Other bank option isnt work	1	2023-03-25	NEGATIVE	0.996409476	Bugs & Reliability, Feature Requests
9a1b94b7-d891-4dab-98fa-e8130fc00ba5	1	Dood systems all people	5	2023-03-25	POSITIVE	0.989465714	General Feedback
7e818042-e310-4e2d-bbcc-f8aabcb973a1	1	Now that I could change b/n accounts easily, I'm much satisfied with this app; and I upgrade my rating to 5 star. However, I wish the app would enable to produce report a history of at least 3 months.	5	2023-03-23	POSITIVE	0.994951487	Feature Requests
848a82cf-a812-4af1-b191-fd762ebe5a81	1	It's not working on Samsung note9	1	2023-03-23	NEGATIVE	0.999714196	Bugs & Reliability
57d89eba-ffcf-4f73-8d51-8059fba754ab	1	The reason I give you one star it's because you always need verification key in bank branch this issue is not good at all,it's better to work like other bank like united bank awash bank they not required authorization by bank branch only app give you verification key not by bank branch	1	2023-03-23	NEGATIVE	0.998324454	Account Access Issues, Bugs & Reliability
8f441e4b-0ead-40b1-a12e-40c876a9bc38	1	Very useful app Help Me to pay my tuition fees in my house Thanks	5	2023-03-23	POSITIVE	0.996072054	Customer Support, Transaction Performance
72c5c550-0e9d-4fd6-981f-84f3516bedaa	1	I've been using this app for over a year. It's user friendly, but my problem with it is that it only tells me any transaction I've made through this app after a day or two. It doesn't show right away so I need you to fix it ASAP please.	4	2023-03-22	POSITIVE	0.998755693	Bugs & Reliability, Transaction Performance, User Interface & Experience
d2d11ed1-321f-4969-855c-8268f4739eba	1	Really it's very good solution to peoples and i am using this application everyday as well as it's important to my business in the activities. More of the application is used for my firemds and my parents as usual as significant. My objectives were so vast i wish the app Will functional every in my life activities and more of saving my time amd easy to use every were. Whenever i was going to working my day today activities if i wants to transfer the money from my own account to others is good..	5	2023-03-22	POSITIVE	0.988852262	Feature Requests, Transaction Performance, User Interface & Experience
ff11332a-b38a-40b2-9e46-64212f7516da	1	Old version is better on showing old transaction list than this one	2	2023-03-22	NEGATIVE	0.998626471	Transaction Performance
801b0d4a-4932-4245-a91d-0a8f05c8e8e1	1	I like it	5	2023-03-22	POSITIVE	0.999859333	General Feedback
98d63de8-2544-4803-abd4-1d2e5559151a	1	I love it	5	2023-03-22	POSITIVE	0.999879956	General Feedback
ad270c60-1d02-4739-9ccd-8acd19993680	1	Please don't make us force update the app it log us out and we need to go in person to the branch to use the app that is hard for people like us who travele a lot from country	1	2023-03-21	NEGATIVE	0.998221934	Feature Requests
0e2c640c-a3f9-4daa-aabb-a33e17904981	1	Please! in the next update add tele birr transfer to other.	5	2023-03-21	POSITIVE	0.978463352	Feature Requests, Transaction Performance
84a99bb4-e3e4-4589-945e-a54861f6bb27	1	Good job kep it up	1	2023-03-21	NEGATIVE	0.999798477	General Feedback
316dc0a4-bc61-48db-82f3-1132078c2de6	1	I use this up it was very convenient and fast to transfer and receive money	5	2023-03-20	POSITIVE	0.984518647	Transaction Performance
4bf3f407-6172-401e-ad28-5ab54e3df5c2	1	baaye gaari dha	4	2023-03-20	POSITIVE	0.983280420	General Feedback
600a14cc-f07f-46bd-9faa-dea06f503365	1	Where can i get verfication code	3	2023-03-20	NEUTRAL	0.998046875	General Feedback
43aa27b3-38c1-474a-a7ab-4a726d82537d	1	I have been using this app for long period of time & I'm very happy. because I'm also use other banks app and nothing can compare this. I know so many people using this app too & we all happier by using this app especially it gives us very helpful recently data for long period of time which is the money we sent and received with very clear info. And its reduced the time which we spend by printing statement on branches. But on this version this future shortened by limited recently data. Whyyy???	2	2023-03-20	NEGATIVE	0.984627187	Customer Support, Feature Requests
1e03bb4d-5eaf-44b7-a1ee-5046c9b5347e	1	it is good app to use. unless the exchange rate section has confused rate specially Suddanesse dinar (SDD) implies high buy rate and low sell rate.	4	2023-03-18	POSITIVE	0.981561720	General Feedback
0db35178-33d7-4729-8c0e-7a6fcf237298	1	ለተቀነሰው ገንዘብ ወዲያውኑ ኖቲፋይ ባለማድረጉ የተጠቃሚ ጌዜ እያባከነ ይገኛልና ብታስተካክሉ።	1	2023-03-18	NEGATIVE	0.944585383	General Feedback
6717add1-3cd5-4ca6-8866-45f6e5d48bab	1	Nice application. Thanks	5	2023-03-17	POSITIVE	0.999855042	General Feedback
b5b679e3-6556-40a7-b0bd-6034f5228a3e	1	Still the best mobile banking app out here beautiful ui very functional , i wish u used the nfc capability of most devices and also smt intesrting with the new rolled out atm cards that has nfc chips in them it would be smt very new tap and pay through ur atm card to a device . All in all i love it	5	2023-03-17	POSITIVE	0.998898149	Feature Requests, User Interface & Experience
92dfa4dc-b362-4b49-8f4c-d1302fd6d335	1	Absolutely The Best Mobile banking i ever seen thank you CBE !!!	5	2023-03-16	POSITIVE	0.999818861	General Feedback
4cf767c3-6bb8-45e8-bd72-8ad21952bae4	1	Perfect App if the following will improved: ==》Sometimes why delay to send text for receiver or sender? ==》Need full statement request option menu at home page ==》Please include Cash Withdrawal mechanism option in your next version	5	2023-03-15	POSITIVE	0.509079158	Feature Requests, Transaction Performance
c6e728fe-28bb-4dd6-9862-51749053df30	1	Simple and Easy app	5	2023-03-15	POSITIVE	0.999232531	User Interface & Experience
a86df6ee-37b2-459e-af94-05a78882f4b9	1	The good thing is its simplicity to undertake the basic functions. Updates with improvements and fixes should have been released by now. Please fix. 5 years after last review… Issues with beneficiary are fixed. However, still unable to track transactions much less to download in appropriate formats. This feature got diminished in the latest update. Please improve and fix.	3	2023-03-15	NEUTRAL	0.992135644	Account Access Issues, Bugs & Reliability, Feature Requests, Transaction Performance
464ee635-ee52-43e8-a70e-2ad60e9d4c9d	1	Not working @ all! 😡😡😡 Older version was much more better!	1	2023-03-15	NEGATIVE	0.999107778	Bugs & Reliability
a1c19a7f-9be5-433b-92a7-88c87d69d6d6	1	Now after the last update has been launched, the app is being somewhat complex. The orders of the transaction is not working correctly. Please have a review on it.	1	2023-03-14	NEGATIVE	0.999765694	Bugs & Reliability, Feature Requests, Transaction Performance
2df0afef-dd57-4e6e-be93-76f84a836635	1	It's not working at abroad for me. It was good in home country. I don't why the reason is! please advice me any one who has an experience.	1	2023-03-14	NEGATIVE	0.579944789	Bugs & Reliability
4faa3223-d2de-47eb-9cb3-e38d713fc723	1	Simple, reliable. And updates regularly. Impressive.	4	2023-03-14	POSITIVE	0.999875665	Bugs & Reliability, Feature Requests, User Interface & Experience
cf924783-d7fe-42a6-9c50-9697c5fcaefd	1	Ni ce app	3	2023-02-21	NEUTRAL	0.880846620	General Feedback
db0aa120-d7ee-483a-8a2e-3c43c573133b	2	The worst app	1	2024-06-10	NEGATIVE	0.999796927	General Feedback
acb76940-bed8-415a-afd0-5396c87fefaa	1	Dear CBE Team, The updated version of CbE application is very interesting and has an additional features which is very nice but still the app doesn't have an option of transferring money into another Telebirr service number rather than own Telebirr account...so please add this feature.	4	2023-03-12	POSITIVE	0.954024553	Feature Requests
24233475-5870-4a5b-9078-1b120762c766	1	Still now i can't even see my current balance..? It has been a while... is it just me or somebody else's problem too..?	2	2023-03-12	NEGATIVE	0.999648094	Bugs & Reliability
da7169d9-a4cb-4884-8b69-bf9c8237023a	1	Transactions history is not being fully shown fix it	2	2023-03-12	NEGATIVE	0.999747336	Bugs & Reliability, Transaction Performance
98d99769-abfe-421f-845b-e9d01ee25ee4	1	the best app, than you so much ,becouse of this app Things so easy	5	2023-03-11	POSITIVE	0.998710513	User Interface & Experience
c80dbe8e-c0fb-44de-8893-291a1fe2b8ac	1	It so good App	5	2023-03-11	POSITIVE	0.999868631	General Feedback
e56cdd65-3e71-4e67-9cf8-77de512f3ce1	1	Almost Impossible to use it aboard.	1	2023-03-11	NEGATIVE	0.999461353	General Feedback
06f37631-ee26-4776-a75d-81d14232370b	1	Good and easy	5	2023-03-11	POSITIVE	0.999857426	User Interface & Experience
78b22403-a349-4449-a86f-cb23894e3c60	1	It's fantastic apps	5	2023-03-11	POSITIVE	0.999880672	General Feedback
08944513-53dd-41d3-9ef8-e04bd683ad40	1	For those who have only one phone but have two bank accounts, it is not possible to administer both accounts in one phone. Please, make your program to allow two accounts in one phone.	4	2023-03-11	POSITIVE	0.998970985	General Feedback
fe581ce0-d9b6-4838-9c32-8d98de12f16e	1	The app is good. However, whenever you changed your phone it requires authorization ID, approaching a branch is mandatory. The password reset option should be available to the user by adding other security details like user name, biometrics, account number, etc.	3	2023-03-10	NEUTRAL	0.961356699	Account Access Issues, Feature Requests, Security Concerns
fa96cd21-0bca-44e5-85f4-5feff72bf19c	1	When ever I change my phone or something happened why would I have to go to the office to get the code this app this not amazing I didn't like it this is big problem u have to change this if I have to go to the bank every time I change phone or anything happened it bad app in this time in this technology.	1	2023-03-10	NEGATIVE	0.998989165	Bugs & Reliability
93b27f97-5f5d-48d4-9b92-99ec73bf06da	1	It's a good update but the system doesn't work a lot of time	3	2023-03-10	NEUTRAL	0.996829808	Bugs & Reliability, Feature Requests
b3243de0-3304-4e7e-bdbe-9d79867e2ad5	1	The recent updated version shows a very short period transactions. Thus it has to be improved and in this regard the previous version was better.	3	2023-03-09	NEUTRAL	0.964101791	Transaction Performance
c87c00a6-8e8e-48d6-ad6a-c616d89df89b	1	በጣም አሪፍ Application ነው።	5	2023-03-09	POSITIVE	0.863712192	General Feedback
e0297061-8846-493c-98d4-eb24901f6489	1	In the next update if it is possible if there is a confirmation requested to confirm the payment again the pin requested before transferring(like telbirr)	4	2023-03-09	POSITIVE	0.997789502	Feature Requests, Transaction Performance
745f8287-af91-4b4f-8889-d227cb44dc7e	1	This version is so slow	1	2023-03-09	NEGATIVE	0.999739707	App Speed & Performance, Transaction Performance
37143416-7a9c-453f-92aa-485e8a5463e0	1	Since the last two weeks I could not see balance. It becomes busy and difficult to check remaining amount.	2	2023-03-09	NEGATIVE	0.999714673	User Interface & Experience
7b4d6adc-0405-4d4e-8402-9b18ea2f8bc4	1	The most recent update is so impressive that Stops stucking,Speedy transaction.Thanks and keep updating.	4	2023-03-09	POSITIVE	0.999652028	Feature Requests, Transaction Performance
87ed61dd-6bf6-4dbe-8fdc-176b3d939453	1	Always rely on	5	2023-03-08	POSITIVE	0.976475596	General Feedback
1014c477-ddae-4227-bb1c-4e49f8b5836b	1	Recent transactions history was loading properly and used to preview older histories too but not anymore and that sucks! So work on transactions history well!	1	2023-03-08	NEGATIVE	0.979226589	App Speed & Performance, Bugs & Reliability, Transaction Performance
38600c46-196b-4839-8ecd-87fb4d14c93f	1	The worst app and bank.	1	2023-03-08	NEGATIVE	0.999801576	General Feedback
f34e6b23-3efa-4e81-9fb8-cba5e7c5198b	1	A very cool app👍🏽👍🏽👍🏽	5	2023-03-08	POSITIVE	0.999862075	General Feedback
7bcfe74c-7682-4a1b-9a7c-5eec919db4e5	1	Excellent app but not CBE	5	2023-03-06	POSITIVE	0.901273131	General Feedback
edfc9677-3313-4248-aeb5-3750d367b331	1	Easy to use,and time saver.	5	2023-03-06	POSITIVE	0.508857667	User Interface & Experience
31109381-2895-4e8b-8ba6-b999ae69bf66	1	Khaatimaa bareeddu nuuf kannee Qabrii teenya Caffee jannataa nuuf Godhee nuhaa gamma chiisu Rabbiin	5	2023-03-05	POSITIVE	0.986444652	General Feedback
20bbe6e7-00b7-4197-8936-d6fd0f03eea7	1	This app is awesome 👍	5	2023-03-05	POSITIVE	0.999860406	General Feedback
8dc4bda4-b918-4d86-9582-804fc25b1e5e	1	It is a very simple and convenient application, if exporting or downloading option included more preferable	3	2023-03-05	NEUTRAL	0.993999958	Feature Requests, User Interface & Experience
bfec953f-00ad-418f-b2e1-dacb825479d7	1	It very nice connection So it is better to releases for us	5	2023-03-04	POSITIVE	0.999052823	General Feedback
ffee11b9-221b-4b35-a5f8-bc5455c9dc96	1	This application is a step for our country. But we need to upgrade and modify it. It Continously get stucks and gives error.	5	2023-03-04	POSITIVE	0.999157071	Bugs & Reliability
b516140e-857b-4cd5-9dc2-68e3d66169db	1	That is good bank but there is something wrong 😕	2	2023-03-04	NEGATIVE	0.995700359	General Feedback
43541170-a0bb-435f-8341-86ccf5cfc04e	1	Wow its ezi to Accse	5	2023-03-04	POSITIVE	0.997096658	General Feedback
fceee3d6-1517-4893-bf2d-2ec553be83e7	1	Better than the other CBE system to send money.	5	2023-03-04	POSITIVE	0.996955037	Transaction Performance
a210f9c7-aa3e-45d2-bc63-664eac064caa	1	I wish the app informs who transferred money when it sends deposits credited to my account as Dashen Bank does.	4	2023-03-03	POSITIVE	0.998941600	Feature Requests
58e410ab-1940-4ca9-a66f-89c4bba4350c	1	Easy to use and confidential	5	2023-03-02	POSITIVE	0.998595417	User Interface & Experience
6c0e288c-92c5-4300-93d4-579c5ad129e1	1	1 Ahmad jihaad	5	2023-03-02	POSITIVE	0.946555734	General Feedback
54ea987f-e246-40bb-8ab1-ff68356c4755	1	Easy to use !	5	2023-02-27	POSITIVE	0.999056399	User Interface & Experience
50af7c0d-4c4e-48e2-8254-e2541fe203e7	1	Like it good work	5	2023-02-27	POSITIVE	0.999869108	Bugs & Reliability
a0f3ff1a-c724-41c8-a9a2-0e59fb9da410	1	Very nice app	1	2023-02-24	NEGATIVE	0.999856234	General Feedback
b1616c1f-92d5-49bb-9928-896639c44d60	1	History section is very bad	2	2023-02-22	NEGATIVE	0.999794543	General Feedback
cc9e02ec-4619-488e-870f-7c0f985c93b6	1	It's a great app, thank you	5	2023-02-21	POSITIVE	0.999867797	General Feedback
f4ac1460-e5f0-465e-b812-0469aac47b32	1	A nice app but it has limitations like sometimes stuk to scroldown, late to updete transactions	4	2023-02-19	POSITIVE	0.994056702	Transaction Performance
ab91dc63-bbf8-4520-a05b-5868e2b9e181	1	It's soo good app	5	2023-02-19	POSITIVE	0.999601305	General Feedback
74ff2d1c-789a-4a51-8cf8-ee4f4a52f7b5	1	The limited transaction listing, only to recent list, makes your app of limited help.	1	2023-02-17	NEGATIVE	0.995643854	Customer Support, Transaction Performance
8b0b8c57-f232-431a-bc51-288406479ed2	1	nice.....kept it up	5	2023-02-16	POSITIVE	0.999827385	General Feedback
5bcd05da-ed2f-4c71-a2d0-a429ee1b9826	1	CBE, Z bank u can always rely on!!!	5	2023-02-15	POSITIVE	0.559065521	General Feedback
6e66b8ec-7ab2-472c-b338-fe02090bf298	1	The Best optional application !	5	2023-02-14	POSITIVE	0.999831200	General Feedback
16a89ffb-1671-45fe-ab7b-d55608a537e7	1	I cannot access the services to transferor to pay my bills	1	2023-02-14	NEGATIVE	0.999511242	Account Access Issues
4d639a12-ed0d-4148-8d22-78426951d83d	1	Perfect but sometimes delays	4	2023-02-14	POSITIVE	0.847514093	Transaction Performance
fc919c50-15a2-4827-8be0-16fe3a10d4ba	1	I'm using this supplication when I'm out of my country this is useful	5	2023-02-13	POSITIVE	0.997909486	General Feedback
ef60d7b7-e642-4540-a265-4417953ec6d4	1	Use this app	5	2023-02-09	POSITIVE	0.902295530	General Feedback
20eb7292-45e8-4997-bb8a-dd30928307c9	1	It is slowwww	1	2023-02-09	NEGATIVE	0.998759747	General Feedback
e70101ab-44a2-4dc8-a40c-e967f31abe53	1	Doesn't sync multiple accounts	1	2023-02-08	NEGATIVE	0.998297870	General Feedback
1a347829-7ac7-444a-8b82-e1a641083e72	1	Please download fastly the apps	5	2023-02-05	POSITIVE	0.980275750	General Feedback
7b6387b8-041e-4156-aece-9656ad6fdf95	1	It is good	5	2023-02-05	POSITIVE	0.999849439	General Feedback
9932f0c8-ed38-4184-b415-aa2e300cddba	1	Nice App!! keep going 👍	5	2023-02-04	POSITIVE	0.999810398	General Feedback
c2eade5c-bfa6-4bc0-8da1-d1f9884eb677	1	It is very good application	5	2023-02-03	POSITIVE	0.999870539	General Feedback
89fae337-7f8f-4021-8a02-9873edcf031d	1	It's to easy to transfer local money thats why.	4	2023-02-03	POSITIVE	0.997293651	Transaction Performance, User Interface & Experience
5e4ac88d-c51e-47ac-8055-c478995ebbc7	1	Nice experience from last 3 years Only problem is that, added beneficiary not working. But overall good experience.	5	2023-02-03	POSITIVE	0.999614477	Bugs & Reliability
55407e31-f37b-4a42-9e11-18be7ada83ee	1	Awesome apps but the new update failed starting from January 31 2023	1	2023-02-02	NEGATIVE	0.997510433	Feature Requests, Transaction Performance
06ddde59-e36b-4909-8e61-7032b31e9ebd	1	የተላከ ገንዘብ መቼ ነዉ ሚለቀቀዉ	5	2023-02-01	POSITIVE	0.883213103	General Feedback
f6c33f02-87f1-485d-9415-92621c967572	1	When trying to open the app from another country it asks for a verification code that can only be obtained from the nearest bank branch. This is not logical if you want Ethiopians from around the world to be able to use the application. Please review this.	1	2023-01-30	NEGATIVE	0.999550164	Account Access Issues
3394123d-4e02-444a-9a68-7ab60d58bde8	1	I always like this banking app	5	2023-01-30	POSITIVE	0.997779787	General Feedback
e0c30660-c11c-49d6-9cb6-ea588d898bc3	1	Why are the messages always come to me very late? I can't even see who has deposed the money it's very annoying. You have to fix this	3	2023-01-29	NEUTRAL	0.999511480	Bugs & Reliability
3933ac15-719f-4050-a1a1-33217bebf895	1	The app is awesome. But there are many things to highlight.For example, When spending money from the account , a confirmation text message must be sent to the account holder. Also the fact that, the PIN is only four digits is not safe enough for security, if it is more than eight digits and includes numbers and symbols, it will be cool.	3	2023-01-29	NEUTRAL	0.884332001	Security Concerns
ac5fd6e6-e367-4eae-8daa-9d4017560fbc	1	I LIKED THIS APP 😊MAY IT WILL NEW UPDATIONS SOON THANKS😊	5	2023-01-29	POSITIVE	0.999166250	General Feedback
a3463769-74ca-4dfe-982a-d1ed4418f3d6	1	በጣም ደስ የሚል ቀለል ያለ	5	2023-01-27	POSITIVE	0.883213103	General Feedback
8187f2c3-461e-4768-9c7b-5f04e001893b	1	The Commercial Bank of Ethiopia application is easy to use. Really recommended.	5	2023-01-27	POSITIVE	0.999473393	User Interface & Experience
b831ff78-1ba8-4ae0-acd8-863098a15d46	1	Recent and Accounts not responding thw previous version was nice. This version UI looks attractive but almost half features not working.	1	2023-01-26	NEGATIVE	0.999265730	Bugs & Reliability, Feature Requests, User Interface & Experience
64a92d7c-71a6-4b90-8a39-7a3615e6bd85	1	1.Money withidirawal from bank into my debit card and credit next in to make Ethiopian My saving bank account number.3rd limete My money withidirawal in to make mobile money wallet plus in to make My Ethiopian saving Bank account number is attached with allow me My money . all my money convert to Ethiopian birr to make. Excuse me my needs seed and received money withidirawal more amended more detail.	5	2023-01-25	POSITIVE	0.990911424	Feature Requests
4bc52252-3bf1-4b9c-ab65-bb7e80251b31	1	i like this app	1	2023-01-25	NEGATIVE	0.999651670	General Feedback
29971f4c-59c8-4c8d-a94f-055e9a52e1c7	1	In the beginning, the ability to capture the history was small, now it's a great job to capture all the transactions and the user can see them, another problem is that if a transaction or transfer is made, the number of the receipt will not be downloaded when saving to avoid it, unless a screenshot is taken, it would be better if you fix this.	5	2023-01-25	POSITIVE	0.988234162	Bugs & Reliability, Transaction Performance
d92c8ce4-361d-44d6-b362-0f5883ed75ec	1	Very best app	5	2023-01-24	POSITIVE	0.999817789	General Feedback
d4ae8497-629d-4cbb-916c-67529831ea4e	1	The app is crashing and freezing in recents' section. But it works fine in other sections very helpful app.	5	2023-01-23	POSITIVE	0.997772634	Bugs & Reliability, Customer Support
42559fd3-7342-42a3-a204-0da3d6d5e7df	1	Its good app to use.	5	2023-01-20	POSITIVE	0.999843597	General Feedback
672e9450-fab6-41bd-ac69-66493526ace2	1	Very good app.	5	2023-01-19	POSITIVE	0.999866962	General Feedback
2fe5e433-98d2-4eaa-ae97-7cd9988165c3	1	Very interesting app in digital economy	5	2023-01-18	POSITIVE	0.999621153	General Feedback
0a2a6cfd-fa25-495a-94dc-d50f3a6b7dfc	1	it securty is good for hackeres	1	2023-01-18	NEGATIVE	0.932931840	General Feedback
b970a9c0-d1c7-4235-aa1d-56cfe1ba76c6	1	Its nice betammm	5	2023-01-18	POSITIVE	0.999725282	General Feedback
d139a4e1-e42e-4bc1-97ed-76b77c5b1836	1	Amazing Apps but if you add other language Like Afaan Oromoo, Afar, Somali it's more than this	3	2023-01-17	NEUTRAL	0.999343932	Feature Requests
2446e1d4-37e7-4e7f-b182-bb862c9ac26c	1	Good, but do not save after sending.	5	2023-01-14	POSITIVE	0.653311253	General Feedback
461f48e7-2d25-40bb-b9a4-e737409609f1	1	Fast and reliable	5	2023-01-13	POSITIVE	0.999859571	Bugs & Reliability, Transaction Performance
137e79de-9adf-43c7-bda6-a0b092f2696c	1	Easy and interesting app	5	2023-01-13	POSITIVE	0.999805391	User Interface & Experience
58f330a4-e818-4dc3-82fa-1411d03378ca	1	since i down loaded this APP nothing any problem happened .it very nice app	5	2023-01-13	POSITIVE	0.999311686	Bugs & Reliability
f655df13-76e6-467e-a1a8-c6ec3308ddb3	1	9/6/17 *** It has not been updated for years and has some bugs 6/8/2020 **** Just updated the app from the link i get through sms. It looks good.	5	2023-01-12	POSITIVE	0.986082971	Bugs & Reliability, User Interface & Experience
c082de79-c904-4d2b-9623-acd3383c2432	1	It's a very nice and simple app but, when checking the transaction details, it's not showing who sent/deposited money into my account. Especially when I receive money from organisations.	4	2023-01-12	POSITIVE	0.994188905	Transaction Performance, User Interface & Experience
7a0e96aa-34a4-4d6d-baa3-a223e0bae4b2	1	I like the app	5	2023-01-11	POSITIVE	0.999439895	General Feedback
e75eb8da-83cc-44e4-92a6-7fb944fccca5	1	Pest mobile banking app	5	2023-01-10	POSITIVE	0.996932864	General Feedback
51b6de3b-0571-4248-acc0-643242f42d47	1	Its so busy when you open the recent transaction option👎👎👎👎	1	2023-01-10	NEGATIVE	0.999056995	Feature Requests, Transaction Performance
6b5d2d4f-5631-4e6f-9db3-1606909f27da	1	ንግድ ባንክ የሞባይል ባንኪንግ አፕ በጣም መልካም ሆኖ አግኝቼዋለሁ ፣ ህይወቴን አቅሎልኛል።	5	2023-01-10	POSITIVE	0.951026678	General Feedback
921ff697-1be2-41e8-823b-5d11487e556f	1	1. It has poor password 2. It doesn't save transaction content that pop-ups during transaction. 3. It is user friendly.	5	2023-01-10	POSITIVE	0.994897306	Account Access Issues, Transaction Performance, User Interface & Experience
9ec3eb42-bf73-4ae8-8757-264dc1d394cd	1	በጣም ምርጥ ማመልከቻ ነው በእውነት በጣም አሪፍ አፕልኬሽን ነው የኢትዮጵያ ንግድ ባንክ ሁሌ ኑርልን🙏🙏🙏🙏	5	2023-01-10	POSITIVE	0.952843368	General Feedback
30ff68e2-04a0-401e-9cfd-bd89b69aff1a	1	easy to access	5	2023-01-09	POSITIVE	0.999658585	Account Access Issues, User Interface & Experience
9a806197-175e-4106-aafa-3dd7e5a2ce1f	1	Easy to understand and use it	5	2023-01-09	POSITIVE	0.999672771	User Interface & Experience
746fb4b6-891e-4f7c-8f1e-7c15372d3430	1	This app is important and simply to use it	5	2023-01-08	POSITIVE	0.998452544	General Feedback
2b552226-f6a3-4bbe-a175-5a3061f1e5fb	1	It makes life easy	5	2023-01-07	POSITIVE	0.999693990	User Interface & Experience
3a42a486-2d17-4c26-aae5-b50e4e021f41	1	Good mobile banking application except some bugs. For instance, when I transfer money from account to account, an error message called 'already existed account' appears. But the money was transferred without any confirmation message. If I was not aware of that, I tried multiple times and sent the money multiple times too.	5	2023-01-06	POSITIVE	0.972843289	Bugs & Reliability, Transaction Performance
179f7b6d-51f8-408f-a1b0-53858bd75b76	1	sometimes it will be busy.by somewhat it is good	4	2023-01-06	POSITIVE	0.999804914	General Feedback
0785e713-24f0-41f8-9401-028ccd61d21e	1	This is the worst App I ever seen. Every time CBE does small patches or updates, the app doesn't work and you have to go to your branch in person to get the update and verification on your phone. It is totally unacceptable. I am living abroad and because of their problems I can't make payments and transfers. I send my representative("ተወካይ") to Addis Ababa Branch with his full-representation paper ("ሙሉ ውክልና") but the staff working at mobile banking services is not willing to fix the problem.	1	2023-01-06	NEGATIVE	0.999795616	Account Access Issues, Bugs & Reliability, Feature Requests, Transaction Performance
9a348ae8-3f63-4e5a-9d8e-ad752091c4d6	1	በጣም ቀላል እና ለመጠቀም ምቹ የሆነ መተግበሪያ ነው።ብዙ ነገር አቃለለልን። I want to thank the developer of this software!(CBE)🙏namaste	4	2023-01-05	POSITIVE	0.998737156	General Feedback
4559c277-b57f-4ffe-b9ff-a9e31c233493	1	This app helped me a lot to pay my kids school payment and my bill.	5	2023-01-05	POSITIVE	0.979796350	Transaction Performance
e8f3bf49-19e2-435b-8d47-9d2e7a023870	1	Best app and simple to use	5	2023-01-04	POSITIVE	0.999532104	User Interface & Experience
ee9730e1-1c47-4f79-80bd-a479405cff6a	1	Keep it up it .this up is very efficient .	5	2023-01-04	POSITIVE	0.999861479	App Speed & Performance
0090c6c7-c81a-4c58-8ad2-f1cb88236e04	1	Foreign transfer provided by this bank is poor but local service is excellent.	5	2023-01-04	POSITIVE	0.999285519	Transaction Performance
738c8295-b994-464f-8165-bdc537656489	1	Over all Nice app, But I do like to point out a little bit of an issue. The transaction history tab needs a lot of work. It is so sluggish to a point it makes the app crash at times.	4	2023-01-04	POSITIVE	0.998951316	Bugs & Reliability, Feature Requests, Transaction Performance
fffe724e-1249-45d0-9ec8-31c1369e91b2	1	It is a very good application. It works better than any other applications i came across. I have seen much progress since the first time i started using it. Still it needs some improvement with connectivity issues.	4	2023-01-03	POSITIVE	0.997767210	Bugs & Reliability, Feature Requests
07e69517-a219-43fd-86f5-2f7a594f86b8	1	I have 6th year job experiance	1	2023-01-03	NEGATIVE	0.962875307	General Feedback
91723454-b297-41a8-8266-8f6fd192639b	1	It's the best app so far	5	2023-01-03	POSITIVE	0.999815285	General Feedback
56146df3-9856-4911-91ea-d52e81aea323	1	Easy for use	5	2023-01-02	POSITIVE	0.979500771	User Interface & Experience
9197b7d5-7226-41b5-a947-606f0432fddf	1	Am happy to use the app.	5	2023-01-02	POSITIVE	0.999819696	General Feedback
8eb07c9c-6e7d-48c0-92de-a13e7e67def7	1	I appreciate CBE for letting us enjoy this wonderful app. However, I would like it even more if you could raise the maximum amount to transfer from 25,000 to other banks.	4	2023-01-02	POSITIVE	0.999669313	Transaction Performance
f806295c-e3b9-402b-ae0e-13a40d68a93a	1	በጣም ምቹ ቀልጣፋና ቀላል 👍	5	2023-01-02	POSITIVE	0.861633003	General Feedback
a91a9b69-5eed-444e-b68d-8f1864468f6d	1	I like it this one is fast and simple to use	5	2023-01-02	POSITIVE	0.999678850	Transaction Performance, User Interface & Experience
ed8622ac-5b82-4f65-9082-e900a5ab323d	1	The best bank app !!!	5	2023-01-01	POSITIVE	0.999803603	General Feedback
ef72f8cd-c36f-4a6b-b368-efbaa17a1fc8	1	The easiest & user friendly mobile banking app so far.	5	2022-12-30	POSITIVE	0.996554732	User Interface & Experience
a737d530-6911-4693-9917-7a0306eee6bb	1	Thanks for this application	5	2022-12-29	POSITIVE	0.999700427	General Feedback
f4536334-6f9f-4766-b44b-e12bfb665da1	1	Sometimes I make transactions twice because of repository failed issue Its annoying The app gets too busy it may also be closed when the recent option is clicked. After making a transaction there is a download option but it says can't save the image. Other than this issues the app is user friendly	4	2022-12-29	POSITIVE	0.993795156	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
088c4c07-c0aa-4e23-92d2-9182fc478052	1	Easy to use	1	2022-12-27	NEGATIVE	0.998854280	User Interface & Experience
d8f69793-6ed4-4a43-8ca3-6755455a0eda	1	this is the only best app	5	2022-12-27	POSITIVE	0.927518666	General Feedback
ce07a18b-e18a-49e5-8388-1b48d50958b3	1	It is easiest app i ever seen 🤷‍♂️🤷‍♂️	5	2022-12-27	POSITIVE	0.992221057	General Feedback
d0f951d9-3cf4-4dbf-82d1-f36c41d22e89	1	Dosn't work in these 3 days	3	2022-12-26	NEUTRAL	0.997298658	Bugs & Reliability
69216b86-4405-4a9b-9552-9e560202dd60	1	I love it	5	2022-12-26	POSITIVE	0.999879956	General Feedback
6c603385-c283-4faa-b859-15877b02786c	1	It is magnificent App	5	2022-12-26	POSITIVE	0.999871016	General Feedback
7d653add-4592-4a78-8f0b-d313df355a74	1	I like it ,it is nice 👌👌👌 but in the*889# its better to be the choice in recently used rather than as it was .	5	2022-12-25	POSITIVE	0.591584861	General Feedback
4e69bc99-3db0-493d-bbe6-86f9503508b7	1	This app is one of the worst app that I used ever u are confused your last recently transaction and when you send money now you get the massage tomorrow or after 3 day	1	2022-12-25	NEGATIVE	0.999686837	Transaction Performance
624d273b-dd78-4c80-92e7-92c837dd4fa6	1	It is a very good application, but, when I open the recent transactions it almost crashes or stops responding. You need to fix this.	3	2022-12-25	NEUTRAL	0.998489261	Bugs & Reliability, Transaction Performance
cf7b3735-7f9c-4dca-a50f-c9969c4b280a	1	The best one from the ather!	5	2022-12-25	POSITIVE	0.999855399	General Feedback
add9d8a1-6c09-43fc-b2d0-6b78a73fdd39	1	እናመሰግናለን ግን ከእንተርኔት ነፃ መሆን ነበረበት	5	2022-12-23	POSITIVE	0.904695213	General Feedback
cd6c4cda-d147-47e5-81c2-cbbaea433fca	1	This app is very helpful because it is easy and user-friendly. It also provides different services and simplifies time to use other options.	5	2022-12-22	POSITIVE	0.996210694	Customer Support, Feature Requests, User Interface & Experience
538f753b-ce20-4090-b5d4-2edf1cbf6c85	1	Easy for life	5	2022-12-21	POSITIVE	0.997000277	User Interface & Experience
6be6a156-1e32-4f64-b06c-cd29691a4566	1	It's the best app for banking I've ever had. It was very effective and provide fast and urgent services but currently it's detororiating.	3	2022-12-19	NEUTRAL	0.988870800	Transaction Performance
e129e53a-9a54-4aec-9f0a-3c67f8828658	1	Very Great to used but don't sale out multiple	5	2022-12-17	POSITIVE	0.938621342	General Feedback
88e7f4bf-cc48-49f3-80f4-6e2901894772	1	The app is great and easy to use. My issue is that, it some times show error message indicating failed transfer transaction, but when I check my balance later it actually made the transaction. This incident happened to me twice.	4	2022-12-16	POSITIVE	0.969620883	Bugs & Reliability, Transaction Performance, User Interface & Experience
aff98f75-9493-429c-9acd-2d062eff709e	1	The app always stuck when i go to recent transactions	1	2022-12-15	NEGATIVE	0.999469459	Transaction Performance
228920a5-a48b-4e75-b7fc-dcae32c14b4e	1	Since I started using this app it. Really helped me a lot. The CBE started some years ago and it is good progress, other foreign banks has money years experience and and the technology is theirs. Yes some inconvenience can occur the bank have to simplify it fast. Keep on going!!!	4	2022-12-15	POSITIVE	0.999015093	Transaction Performance
e9bda52f-e886-4c4b-a370-cf14f1c3198a	1	i apritate your CBE application	5	2022-12-15	POSITIVE	0.897189438	General Feedback
c35e5c78-cbbe-46a6-a8bf-f40207002d99	1	Most of the time 'no sync available'. Been trying to transfer all day,with no luck. Very bad app	1	2022-12-14	NEGATIVE	0.999590218	Transaction Performance
1c5b0e70-3c3e-4570-af10-95a1b77c69d4	1	Nice and excellent	5	2022-12-13	POSITIVE	0.999866486	General Feedback
984260c6-9775-423c-afdc-4cad0afd010b	1	Transfer checking balance utility service	5	2022-12-13	POSITIVE	0.980293751	Transaction Performance
7544d1f2-4ae1-4fd4-a935-cdb7b9b62cfc	1	I love this app, it is easy to use and makes my life easier. Sometimes it says time out but sends money and sends agin. To send for other banks it is almost difficult and for other telbirr customers not totally possible yet. If these issues solved, the app is supper 5 star.	5	2022-12-12	POSITIVE	0.960648358	Bugs & Reliability, Transaction Performance, User Interface & Experience
9dc2076a-7e52-447e-84cb-072673bc9d85	1	It's okay not bad	3	2022-12-12	NEUTRAL	0.999751627	General Feedback
cfb1e981-fef8-45fe-9eb7-c1711c8e59ac	1	It is bad app Always stack	1	2022-12-12	NEGATIVE	0.999808848	General Feedback
0900270f-f8ad-476e-98f0-f61c84eff8fa	1	Wow good app.....easy to use.....	5	2022-12-12	POSITIVE	0.999765217	User Interface & Experience
f19f4bbe-a5f5-44e0-9217-5dbbdcfb27d7	1	Very nice to used online	5	2022-12-12	POSITIVE	0.999717176	General Feedback
001a9906-2fdf-4861-8b40-7873f206dc72	1	To use mobile banking	5	2022-12-11	POSITIVE	0.910043418	General Feedback
a79839d8-8757-4c0d-a636-66cfa15dcaf0	1	ካየኋቸው ሁሉ ምቹ እና ላጠቃቀም ቀላሉ ነው።	5	2022-12-10	POSITIVE	0.923957765	General Feedback
fa211c3e-9410-44bd-b311-20780c96c076	1	Good and simpl for use	1	2022-12-10	NEGATIVE	0.999717534	General Feedback
6185daf8-7a8b-467c-99f8-c4cab133af5e	1	Thank you for your service......great app i am enjoying it.	5	2022-12-09	POSITIVE	0.999876618	General Feedback
b6103798-6b27-4712-b102-dc273489f507	1	Excellent and convenient service...Kudos CBE	5	2022-12-08	POSITIVE	0.999773920	General Feedback
edb54d41-2306-455f-b6a7-5a4a47ab55d5	1	It was good but there are some things missing like 1- can't get more than 10 transection so you add to get last 6 month transection.	3	2022-12-08	NEUTRAL	0.996610224	Feature Requests
1616cff5-1cae-4c0b-8294-d3699110a047	1	The best mobile banking app with an excellent user friendly interface. Bravo.	5	2022-12-07	POSITIVE	0.999841094	User Interface & Experience
41c7e513-ba54-4bca-96fc-a06f50487c07	1	I use a variety of mobile banking applications, but I really enjoy using CBE over those from other banks because it's quick and user-friendly. I greatly appreciate it.	5	2022-12-07	POSITIVE	0.998625159	Transaction Performance
29a3e99f-5c72-4360-90cd-a7f8b97f99ad	1	Excellent app... never had any problem in using it. Very excellent job you are doing CBE. Get going!!!!	5	2022-12-07	POSITIVE	0.999755681	Bugs & Reliability
9fb63c4f-364c-42be-a195-35a8da1563a8	1	A bank you can always trust	5	2022-12-07	POSITIVE	0.999456584	Security Concerns
aba54fff-3e27-4807-b02f-fd6105e5ecf3	1	This app is good but could not merge multiple CBE accounts and fails to download transaction reports after the late update. Why? I am using Samsung M12.	4	2022-12-07	POSITIVE	0.999002755	Feature Requests, Transaction Performance
74968cb1-f525-4327-b658-82eee040c74c	1	Amazing application which is very easy to use? Keep going CBE	5	2022-12-06	POSITIVE	0.998950481	User Interface & Experience
7edb1db9-3516-4eb9-b0d0-268bf319e5cc	1	I like it	5	2022-12-06	POSITIVE	0.999859333	General Feedback
dbf2a7e0-8164-4834-a3b3-0ea61bd91b4e	1	Fantastic and it is upto the expectation!	5	2022-12-05	POSITIVE	0.999729455	General Feedback
59660163-1979-4e51-b9a8-f7e9696f0f47	1	Excellent app.but while I am out of the app it redirect back to login page by it self	4	2022-12-05	POSITIVE	0.766981006	Account Access Issues
9ea7a064-0f37-4aa4-8020-25f64c452571	1	Some of the worst app made by a bank in order to login when changing phone you have to go to a bank manager and the manager always say something new to login you back to the app it's sad there making billions and cant handle to make a better app for it.	1	2022-12-05	NEGATIVE	0.999747694	Account Access Issues
c9087848-b598-47c3-9da1-c86d89fe27b7	1	after I sent money, I couldn't get updated recent transaction.	1	2022-12-04	NEGATIVE	0.997863591	Transaction Performance
f1d88a4b-b3dd-4005-b050-40c8e33f7fed	1	I lv this application	5	2022-12-02	POSITIVE	0.823107898	General Feedback
759646cb-9d6e-4669-9704-52f80b5d96dc	1	It's great app thanks CBE. so mach easy to use and it's secure.	5	2022-12-02	POSITIVE	0.999619365	Security Concerns, User Interface & Experience
d7a1d131-dfe0-4fd4-830e-c5d219dfedd0	1	It stacks in the recent option, can't download the transaction info.	1	2022-12-01	NEGATIVE	0.998847246	Feature Requests, Transaction Performance
46ea7d14-c7ed-4b55-8160-55d4a20e34d6	1	Best of the Best	5	2022-12-01	POSITIVE	0.999840140	General Feedback
f25f6844-5431-45cc-9a50-7afe679587cd	1	ጥሩ ነው ግን በጣም ሃላ ቀር ነው ብዙ ነገር ይቀረዋል በደምብ አሻሸሉ	2	2022-12-01	NEGATIVE	0.948979199	General Feedback
d2f67745-28ad-4452-89bc-e609606126d8	1	Great Services it makes my work easy Thanks	5	2022-12-01	POSITIVE	0.999823749	Bugs & Reliability, User Interface & Experience
f000ac32-9eca-4a36-b776-add51294e776	1	Compatibility issue is resolved now but the app crash many times when asked to show current statements.	4	2022-11-28	POSITIVE	0.999465406	Bugs & Reliability, Feature Requests
0f4a9911-11a7-4ebd-88e6-6492e931136c	1	please include alph password	4	2022-11-27	POSITIVE	0.513866842	Account Access Issues
922a7f0b-3ecf-496c-8d50-4afd8d06417a	1	It's very good and joyful app, keep it the momentum	4	2022-11-26	POSITIVE	0.999886990	General Feedback
e6eee789-02f8-4e1d-ad53-673ab59d47d5	1	My apps can't save or share slip after trx completed	5	2022-11-25	POSITIVE	0.998536944	General Feedback
b3d26b8e-692a-4803-8876-a6accc309b40	1	Our Kings done great things like the legend Commercial Bank of Ethiopia	5	2022-11-25	POSITIVE	0.998513758	General Feedback
f6341731-7793-43ce-965d-525ed3420a09	1	It is Good but gove option to send Confirmation code by email if phone number is lost we can eash update on the website.	5	2022-11-25	POSITIVE	0.975359082	Feature Requests, Transaction Performance
6c0c3ab7-451c-4a28-bf76-1fd4d796a76b	1	The late updates on my account after transfers that occurs sometimes is the only issue the rest of the app is excellent	4	2022-11-24	POSITIVE	0.939367056	Bugs & Reliability, Feature Requests, Transaction Performance
082e0f36-6872-46cd-8d48-8b06a8bc8678	1	It's very important even out of Ethiopian.	5	2022-11-24	POSITIVE	0.999346912	General Feedback
955f8c84-d7d4-4ad8-ba7c-4843fb87fbc9	1	Fast and very latest!!!	5	2022-11-23	POSITIVE	0.999584973	Transaction Performance
3e23614c-e339-4a27-8f2f-f9c1e60e8cdc	1	I have got the application very useful, fast and simple to use. It is great app for self service but I had to go to branch office to activate it. Please try using OTP to activate the app	4	2022-11-23	POSITIVE	0.988483727	Account Access Issues, Transaction Performance, User Interface & Experience
605d0855-0dba-4d5a-9cf0-1184d2471c1c	1	It is Simple and fast mobile banking app. I am really enjoining with it.	5	2022-11-23	POSITIVE	0.999237657	Transaction Performance, User Interface & Experience
ec802a61-2e73-4e06-9b89-b3575a42ecc2	1	A wonderful app! Easy, reliable, secure and fast!	5	2022-11-22	POSITIVE	0.999846816	Bugs & Reliability, Security Concerns, Transaction Performance, User Interface & Experience
7ba0df99-9547-4464-89e7-b2a11dafe947	1	It is good but some issues like -It only allows for own telebir account transfer what about for the others telebir accouts ? If possible please include for the others -please merge CBE banking app with CBE birr app like Awash birr	3	2022-11-20	NEUTRAL	0.990997076	Bugs & Reliability, Transaction Performance
3347de06-e670-407a-8779-01f7aa18f03c	1	A great app that makes life easy.	5	2022-11-18	POSITIVE	0.999765098	User Interface & Experience
6cf05c1f-d887-490e-9adc-90fbd69b78c9	1	Very Good y	5	2022-11-17	POSITIVE	0.999856353	General Feedback
00c3fe7b-dc0f-4d8f-beb1-3c27edd23042	1	the App is one of the BEST things to have in Ethiopia but one of major problems is shows incorrect statements and incorrect available balance, merchants and supermarkets doesn't deduct right away 😑 deductible may come after weeks or month, once u already forgot about it and so many things to work on. please take it seriously Thanks 😊	3	2022-11-16	NEUTRAL	0.918527663	Bugs & Reliability, Feature Requests
49313078-1651-45e0-aea3-56a4e260c754	1	Ibsa abdi nure Ethiopia dire dawa	4	2022-11-16	POSITIVE	0.548325300	General Feedback
c02cda50-771c-4bc9-b34a-3fbf8157ac3e	1	CBE App is Excellent.	5	2022-11-14	POSITIVE	0.999803245	General Feedback
d19c7ff3-9dc4-467c-b6d6-22230af4bd41	1	I like it more	5	2022-11-13	POSITIVE	0.999818027	General Feedback
959eb580-d639-4db5-bc03-02d8d3b80271	1	While Travelling, I couldn't transfer money from my account to another. I had to delete❌ the app and re install and then wait until they give me authorization code.... too complicated.	1	2022-11-13	NEGATIVE	0.999687076	Transaction Performance
0afd738a-cdcd-43eb-8f35-71eaf350ce4c	1	I have list of beneficiaries registered but can not transfer to them. It is throwing 'None available' message.	3	2022-11-11	NEUTRAL	0.999657750	Transaction Performance
5c690624-9e09-44d7-91a0-c73e3071b4ce	1	It was working fine till recently. It suddenly stopped showing me the balance on the front page and all service features are not working. Hope it gets fixed soon.	4	2022-11-10	POSITIVE	0.998344421	Bugs & Reliability, Feature Requests
eaf5540d-7bd4-4ca4-833c-b1e7c8efb77b	1	IT is good	3	2022-11-08	NEUTRAL	0.999849439	General Feedback
61951a14-bc58-427a-9425-a896835d9e30	1	Good application fast	5	2022-11-07	POSITIVE	0.999834776	Transaction Performance
22a97918-4b67-488d-ba5b-4b3e36e939d1	1	I have been using this app for the past 2 years and I never had faced this kind of problem The problem is when you want to transfer it always says error or account pending then you think it didn't work unfortunately when you check your balance again it's already deducted	1	2022-11-04	NEGATIVE	0.996736705	Bugs & Reliability, Transaction Performance
393a67c3-b5f5-48eb-8238-c4a4ebdce52c	1	The worst experience ever, It sends money while showing an error. Such incompetence from a company of this size!	1	2022-11-04	NEGATIVE	0.999803841	Bugs & Reliability
12521b89-4116-45a6-84a2-fd253bc48de3	1	I dont recommend this app Because when you make transfer or any transaction you dont get digtal resipt even if the transaction is done if you fix this the app is good enough	1	2022-11-04	NEGATIVE	0.794289052	Bugs & Reliability, Transaction Performance
1a2a783b-a90f-4a62-8648-5f9da1ce6459	1	Solve sync pb	4	2022-11-04	POSITIVE	0.775489271	General Feedback
296bde10-378f-480f-9089-8bc20e51426b	1	Best app ever	5	2022-11-03	POSITIVE	0.999749005	General Feedback
f32ee2de-6b35-4155-a108-849ad3d6ee64	1	Very late the only app is never seen in my life	1	2022-11-03	NEGATIVE	0.996626258	General Feedback
9334df16-6370-4c0e-aecc-82bcf90fbeef	1	በጣም ጥሩ ነው አዳዲስ አገልግሎቶች ቢጨመሩበት ደግሞ መልካም ነው	5	2022-11-02	POSITIVE	0.932232678	General Feedback
b2597f6b-fd02-46dd-80d2-55e8ae8b886e	1	Clear and easy to use	5	2022-11-02	POSITIVE	0.999825299	User Interface & Experience
b878e30c-e419-46df-8e79-20abdeede8ec	1	So amazing ap !!!!	5	2022-11-02	POSITIVE	0.999874949	General Feedback
16771b61-840b-488e-b3d7-6006d298b3f9	1	As a financial app, the app should be more sensetive for any action. When i do some transaction, it shows error message. But the transaction already done at the back. If you see error messages, it may not be error. Automatically stop doing any action see your balance and wait for your sms.	1	2022-11-01	NEGATIVE	0.995785654	Bugs & Reliability, Transaction Performance
e547d2ae-835d-4bae-9bf1-453cffb9dc5e	1	No problem so far	5	2022-11-01	POSITIVE	0.995124280	Bugs & Reliability
fac47329-a3e8-4a81-9c89-c3a37fa205bc	1	It's very extraordinary app, the user interface is soo awesome, most importantly it's very user friendly. In terms of speed and services its unbelievably fast and flexible. I really appreciate the crews who've been working behind the scene to make this wonderful job alive. Well done !	5	2022-10-31	POSITIVE	0.999850154	App Speed & Performance, Transaction Performance, User Interface & Experience
2991400d-51b7-4644-b4b3-d45330ae778e	1	በጣም አሪፍ ነው	5	2022-10-31	POSITIVE	0.833725393	General Feedback
89ae835f-7bea-4de5-80db-594c071de847	1	You should integrate hijra & ZamZam bank in the other banks	5	2022-10-31	POSITIVE	0.924018919	Feature Requests
ce0939bc-8f5b-47b5-882a-a5ca4ee17602	1	No commente keep working 👍	5	2022-10-27	POSITIVE	0.992085755	General Feedback
eec673de-021e-451e-abb4-e6467ecaf294	1	Easy and time consuming	1	2022-10-24	NEGATIVE	0.895879865	User Interface & Experience
db0c8c91-c0f8-4cef-8b22-0387d195a3fd	1	We need access any where in the world keeps up my Ethiopian banking services	5	2022-10-24	POSITIVE	0.997209370	Account Access Issues
d82351de-59cf-45a7-a3b1-63169c839696	1	Wow very good	5	2022-10-23	POSITIVE	0.999869347	General Feedback
598336b3-f077-420b-8ddf-258916a81fd1	1	It’s really good apps and keep up a good work. Thank you.	5	2022-10-23	POSITIVE	0.999880433	Bugs & Reliability
69ca5e98-00dc-44af-8641-9bdf5e566677	1	Lot of things missing and doesn't update quickly	2	2022-10-23	NEGATIVE	0.998798490	Feature Requests
f89be372-a316-479f-808c-5fe24bea232b	1	Its good but Sometimes it doesn't show me my full transaction and lately we haven't been able to transfer anything	4	2022-10-22	POSITIVE	0.995932519	Transaction Performance
a2117a9f-6a43-4a24-981c-eca0d921fa5b	1	Is not showing my account details	1	2022-10-22	NEGATIVE	0.999738395	General Feedback
de6d560e-d705-402d-9576-0fcdd7209b46	1	You improved the service of this app much better.	5	2022-10-20	POSITIVE	0.989102066	General Feedback
5808f246-0694-4b64-8b2d-70c66e106d71	1	We need the previous Version. This one doesn't work, specially while you are in recents and tries to scroll down. Its just rubbish. YOU BETTER SOLVE IT, OR I will transfer to AWASH.	1	2022-10-19	NEGATIVE	0.999804080	Bugs & Reliability, Transaction Performance
8ce158a7-24be-43cf-9010-cf586ac0e65f	1	I have seen lots of issues on this app one of them is you can't use them in multiple device and you have to go to the place you opened your account in order to get mobile banking even if you change you device you have to go to the branch to activate it, why can't you just make it easy like the others banking system in Ethiopia. You should learn from abbisinia and dashen to be honest	1	2022-10-18	NEGATIVE	0.587268114	Bugs & Reliability, User Interface & Experience
935963cb-0bd9-4e64-a120-845dbc422806	1	With this app i can not share or download transaction data after pay or transfer	3	2022-10-18	NEUTRAL	0.995480776	Transaction Performance
478bb5a5-31b3-4d8d-a74d-67f503e1192e	1	Best app in Ethiopia banking	5	2022-10-16	POSITIVE	0.999398828	General Feedback
a4ecb4d7-8d78-41df-bbf9-288636824315	1	Simple and easy to use.	4	2022-10-14	POSITIVE	0.999762952	User Interface & Experience
a453bfbc-30f5-49f7-ab87-5f9bdf6030ed	1	Nice to me and	5	2022-10-11	POSITIVE	0.999848008	General Feedback
276ea4d4-f0f3-4a83-b7a1-521db9d86d1e	1	Better if we can have an option to save other bank accounts, like we save beneficiaries having CBE accounts. Let's have an option to add beneficiaries with other bank accounts.	4	2022-10-11	POSITIVE	0.999354184	Feature Requests
973c6305-231c-45f2-a55d-3cab15ebbe26	1	Please add "Account Statement" menu starting from date of account opened, instead of recent transactions.	5	2022-10-10	POSITIVE	0.754363060	Feature Requests, Transaction Performance
117dc0ea-922d-4930-bb43-23b5b2ae3fb0	1	Poor app don't use it	1	2022-10-10	NEGATIVE	0.999591291	General Feedback
7e404e45-5ce9-4a63-98f2-a6c610920374	1	Why there is no ussd service for mobile banking.	2	2022-10-08	NEGATIVE	0.998370230	General Feedback
374b31e8-f30f-40ae-90e6-d732e333a6ed	1	It's good, and helped me alot	5	2022-10-07	POSITIVE	0.999854207	General Feedback
e1991106-4d6d-4df9-81a4-2bc13499f58f	1	I really like this app	5	2022-10-07	POSITIVE	0.999637842	General Feedback
bb3d876f-3591-4f8d-8d3e-eb10315c01c3	1	It's easy to use except it sometimes stack to respond.	4	2022-10-07	POSITIVE	0.518603861	User Interface & Experience
77976ffc-b7dd-4859-ad8e-5ff4bf452427	1	Very good Very good	1	2022-10-06	NEGATIVE	0.999861240	General Feedback
857b5f7e-c0d0-4be0-809f-b4b3355b5af4	1	Best app i love it	5	2022-10-06	POSITIVE	0.999848008	General Feedback
264a79eb-f934-4bf9-ac6b-8246464eedb6	1	Most of the time, in the 'Recents' button the app becomes stuck and doesn't show up details of transactions and doesn't even scroll down; should be solved. Second, the app doesn't save the last pop-up screen when a transaction is complete. Third, there is no telebirr transfer to other person option and the app by default lets you to only own telebirr transfer.	4	2022-10-06	POSITIVE	0.999484539	Feature Requests, Transaction Performance
f7396a03-1d36-429b-8396-7b2654df0311	1	My phone said after intalling the app the this divice is rooted you can't use this app how can fix it	4	2022-10-04	POSITIVE	0.999157310	Bugs & Reliability
95fd21d4-1a54-4171-abb9-e5d87c4b7024	1	This is an easy to use app; I wish it could include time of transaction, in addition to the date on the reports	4	2022-10-04	POSITIVE	0.979108632	Feature Requests, Transaction Performance, User Interface & Experience
342ad570-b878-4d09-a74a-39e05cda42e1	1	Its fast and reliable to use. I really liked it.	5	2022-10-04	POSITIVE	0.999847054	Bugs & Reliability, Transaction Performance
715717ee-33ff-40f6-86d2-a503b239b3e1	1	Every thing is good and functional , but the password length is too short and it is also receive only 4 numbers. I wish if the password field receives string	5	2022-10-02	POSITIVE	0.998497128	Account Access Issues, Feature Requests, Transaction Performance
b6e9e6ab-6e72-4b49-b6c1-f9f451a1a08f	1	Your app is very simple to use. But please add search option so that we can easily find our transaction done with an account number.	5	2022-10-01	POSITIVE	0.889395356	Feature Requests, Transaction Performance, User Interface & Experience
1837f5d1-c4f6-4c0e-8238-00dce4fa6003	1	Best app for ethio	5	2022-10-01	POSITIVE	0.999272048	General Feedback
669b3d2a-08dd-49b4-8bdf-6e2430b3c005	1	It is not synchronizing. It was working nicely for me but now not updating my balance. Talked to the bankers but failed to solve it.	3	2022-10-01	NEUTRAL	0.999719799	Transaction Performance
d252ca02-840f-4f12-b2db-c0a7e1c38b8c	1	its good only where mobile data and wifi avelible areas	3	2022-10-01	NEUTRAL	0.776174903	General Feedback
b2308f61-dc9e-4960-b383-1698da1dfa74	1	U are the best as always	5	2022-09-30	POSITIVE	0.999845147	General Feedback
012c4dc4-37ca-4822-bd33-4d272e3a7cd2	1	Super fast app good work	3	2022-09-30	NEUTRAL	0.999847770	Bugs & Reliability, Transaction Performance
01c3ea09-3269-43be-8803-27d3c090e606	1	በጣም አሪፍ App ነው ከባንክ ሰልፍ እና ብር ተሸክሞ ከመዞር ገላግሎኛል ።	5	2022-09-29	POSITIVE	0.952952981	General Feedback
46335135-7df4-4127-b9d0-f0464966b331	1	When I started using the app for the first time I like it. But through time it started annoying me😠 Because it doesn't update the transaction history immediately. I remember one day I transferred 17000 to another account but I can't took screenshots of transportation history. It says repository........! It needs urgent system maintenance ‼️	4	2022-09-28	POSITIVE	0.999050915	Bugs & Reliability, Feature Requests, Transaction Performance
8fca84cf-3409-4996-abf0-81ec708c87ef	1	Nice and smooth	5	2022-09-24	POSITIVE	0.999862313	General Feedback
2cb82abb-b191-4e8f-a140-6cf00b784f0b	1	It is easy and fast app	4	2022-09-22	POSITIVE	0.999264181	Transaction Performance, User Interface & Experience
2663265f-64cd-4433-bcc4-944371610db1	1	Unexpectedly non functional .impossible to perform tasks. Shat shall i do??	5	2022-09-22	POSITIVE	0.999788463	General Feedback
a3a3ae6c-4133-427e-a8a6-dc3a26270c21	1	Intetesting Application for Banking. I use it since 2020.	5	2022-09-21	POSITIVE	0.988629103	General Feedback
6c61bba4-684b-4d2f-a7eb-6fec709bee8f	1	Best and easy application wich i like too. But try to incorporate d/t languages .e.g Afan oromo, somale, etc. to make more easier and convince for these who do not know english and amharic. Just like cbe birr.	5	2022-09-17	POSITIVE	0.913062990	User Interface & Experience
e7f2bdc0-b2b1-4186-b144-c173d8598412	1	It is a good and progressive app through the updates. I think the app should further solve its bugs like 1. It doesn't download or share attachment on android 12 and 11, it used to work on android 10. 2. Sometimes transactions seem like they have failed and there are no records, but the transactions actually have passed this is a very serious issue, because people will try the transaction again which will end up doubling the payment.	4	2022-09-15	POSITIVE	0.713904262	Bugs & Reliability, Feature Requests, Transaction Performance
023f1e6b-8f3d-4269-b956-b9cae7b268fd	1	Its good. But recently i have been having some problems. The app is transferring my money for a second time after i do. It shows the first transfer has failed and i usually do it again. Then after it shows that i have made two transfers. Could you fix this. Thank you	3	2022-09-15	NEUTRAL	0.996929586	Bugs & Reliability, Transaction Performance
223fbb4a-590b-4ff3-aeb5-c9a962371531	1	Good application is nice to same time and effort	5	2022-09-14	POSITIVE	0.999602258	General Feedback
38d72188-0fba-4091-9546-ba6c7b2816fa	1	It's cool app actually but it didn't accept transfer reasons more than once	5	2022-09-14	POSITIVE	0.974745393	Transaction Performance
65bd0ec2-9a3b-4adc-a1ef-35a2ad1784e2	1	በጣም ምቹ መተግበሪያ ነው	5	2022-09-10	POSITIVE	0.861633003	General Feedback
7bdd6b7d-5856-46be-96de-6b15d8f6a650	1	Best in every thing but we can't trarnsfer to other banks with RTGS it costs us 50 cent per 100 birr which means 500 birr for 100,000 birr it's not fair to cost us this much. Even Abyssinia bank has RTGS which only cost 25 birr to transfer as much as we want. So, pls update ur system	2	2022-09-10	NEGATIVE	0.998268604	Feature Requests, Transaction Performance
33d3eff2-856f-456a-8313-26e959cb77e6	1	Nice,easy and saving time. Its the best app	5	2022-09-10	POSITIVE	0.999756992	User Interface & Experience
60fb964b-19fa-4b5e-bcd8-5aa22363cd32	1	Good so far. Much better than other bank apps.	5	2022-09-09	POSITIVE	0.999818742	General Feedback
ab8c365c-03d3-4f75-b05e-59516d0cd2d1	1	It says your device is rooted ,i cannot access this app with my device Which is samsung A21s	1	2022-09-09	NEGATIVE	0.989250541	Account Access Issues
994d7016-3ead-4234-ae00-535b559932e4	1	Best and easy app for use than any other local bank's mobile banking system. But the system doesn't show recent transaction some times, though the transaction has done. Better to do on this and other upgrading facilities.	5	2022-09-08	POSITIVE	0.987603486	Transaction Performance, User Interface & Experience
7fc1bd1e-a975-44c1-af6b-ceb8759c8dae	1	It's the most simple and yet most effective app in Ethiopia. I'm really enjoying the usability of the app.	5	2022-09-06	POSITIVE	0.999801934	User Interface & Experience
bad530eb-9705-41bd-bb7f-653d578d23d3	1	Ft birr metenu bishashal arid new	5	2022-09-05	POSITIVE	0.949557364	General Feedback
3e50015f-431a-48e9-8573-4b6cfc879cf4	1	It is a good app, but when there is no readymade bill for payment, it doesn't tell anything, just say continue. It will be nice if it tells us, the bill is not yet ready for payment.	4	2022-09-05	POSITIVE	0.534175754	Transaction Performance
4096071d-6b55-4963-94bc-a067003db31f	1	Very cool and best app. Keep up the good work.	5	2022-09-05	POSITIVE	0.999874949	Bugs & Reliability
b8716e5e-79e9-4a2c-a293-6be519cb32fa	1	Nice ui, but it fails to update info constantly after the recent update. The transition is not smooth, with 120hz refresh rate its not smooth seems like very old. Need to add more security, whenever someone exits the app and returns from recent tab it just opens, it should have asked to insert pin everytime someone returns back. Fix these things	2	2022-09-04	NEGATIVE	0.997929335	Bugs & Reliability, Feature Requests, Security Concerns, User Interface & Experience
2ff8d099-ee34-44a5-ab29-c242ff8e4cd1	1	There is a problem with the app after the new update I can't share the transaction	3	2022-09-04	NEUTRAL	0.999570549	Bugs & Reliability, Feature Requests, Transaction Performance
faa3a541-6d71-4555-bb6a-f98f8bf4a9da	1	I like it	5	2022-09-03	POSITIVE	0.999859333	General Feedback
d0c0a4e1-fba6-41ef-9b57-430697c1db2e	1	This up is very good only problem is no access of seeing your balance Otherwise it is very easy to you use and its so fast just work on that above mentioned Stay blessed 🙏🙏🙏❤️	5	2022-09-03	POSITIVE	0.997698009	Account Access Issues, Bugs & Reliability, Transaction Performance, User Interface & Experience
e1e5be55-0886-4549-a83f-82ce08e78e3a	1	It is good but the transaction statement couldn't be shared or downloaded.	4	2022-09-01	POSITIVE	0.576229692	Feature Requests, Transaction Performance
7583efa4-6a79-4424-948d-b0cc2a729fde	1	Very good app. But include money transfer from oneself account to others telebirr	5	2022-08-31	POSITIVE	0.614270508	Transaction Performance
fc37fc37-6151-4fdc-8020-3ec486b75a8b	1	Wowww this app is good	5	2022-08-30	POSITIVE	0.999841690	General Feedback
8c680027-5f7d-44a5-939a-03019e08c59c	1	It's the chooser	5	2022-08-29	POSITIVE	0.997658849	General Feedback
81a1f646-9c99-4d13-b086-d4530d26d4de	1	Great Experience 👍 but there is o e thing that highly bother me *the password to login every time you open the app 😒 it ask you a pin instead what I say you can make it to be a fingerprint, because putting password continously so frustrating and also not secure as somebody can see our pin Thank you 😊	4	2022-08-29	POSITIVE	0.999358594	Account Access Issues, Feature Requests, Security Concerns
be9f067b-8066-42de-80df-f11f90c0f274	1	The time it takes for the customer service to solve issues is very impressively bad	1	2022-08-28	NEGATIVE	0.999808609	Bugs & Reliability, Customer Support
276522db-e3b8-4b21-90c7-1dd63d56325d	1	Amazing app it's easy to use	5	2022-08-28	POSITIVE	0.999847412	User Interface & Experience
e6a22aca-9b76-4498-9825-fa97398d9c90	1	To speak frankly the app is good but it is too slow	1	2022-08-27	NEGATIVE	0.997490764	App Speed & Performance, Transaction Performance
024294de-2000-4216-a5d0-f0b652c087d3	1	Cool and functional	5	2022-08-26	POSITIVE	0.999870300	General Feedback
42671987-cf3d-4a24-82fd-0326d041e49a	1	The app is unresponsive the time when the fragments are attached. It is just like shivering. Still, I can't download the transaction history instead it just toasted me can't save. Please consider all this things. But I would recommed you to use a tab layout. This is because, consider I am using latest Samsung 🤔 device, how do you think that your app is running on other damn devices like techno and itel ? It is horrible.	3	2022-08-26	NEUTRAL	0.999225855	Transaction Performance, User Interface & Experience
acb48d9a-6f20-4ef6-acca-cc2142dfcd25	1	Please add the feature used to get reset that will be printed as document after payment done via this app rather the customers uses screen shot.	5	2022-08-26	POSITIVE	0.996337891	Feature Requests, Transaction Performance
f37de19b-1d51-4064-8e8c-984cfe3c6c5e	1	it's very nice app	5	2022-08-26	POSITIVE	0.999863148	General Feedback
64fa8c85-2173-4b79-96d6-3f5f1a990c01	1	Really it is very important and time saving to make transaction trade benefecieries	5	2022-08-25	POSITIVE	0.999378800	Transaction Performance
645eaf5c-c2ab-4cc0-82f2-61abe82caccf	1	Can't download or share transaction summary.	2	2022-08-23	NEGATIVE	0.998796940	Transaction Performance
7681b47b-22c1-44e9-a46e-8bad8d5d3633	1	The app can't sync and functioning at all.	1	2022-08-23	NEGATIVE	0.999741852	General Feedback
ab1a0562-4797-41cf-9c75-51879bfc7fcf	1	Owww it is very apk	5	2022-08-22	POSITIVE	0.946139276	General Feedback
4f4a7ed5-041f-4a80-a888-85d4f469ac76	1	For Easy life	5	2022-08-21	POSITIVE	0.996366501	User Interface & Experience
13c08643-b4e2-4679-8bbd-5b39a3a837f1	1	The problem of this application is ፥ during transfer /tranzaction/pending or dliance problem that means the ricivers can't see the tranzaction at real time	1	2022-08-20	NEGATIVE	0.999199450	Bugs & Reliability, Transaction Performance
6cebe767-3359-42a9-9252-e198bc5d38af	1	Current UI is ok but this version has got so many bugs previous version was working very well now these one crashes a lot now i cant even see my balance whats up with it and too much limitation please hurry and make some changes	5	2022-08-18	POSITIVE	0.992443860	Bugs & Reliability, User Interface & Experience
244a65ac-242f-4281-8fe7-f67cf063e35a	1	Good but you must improve it	5	2022-08-17	POSITIVE	0.997713923	General Feedback
2a7a5fec-0ee2-49a2-853e-55e6f7fd05e8	1	it is nice	4	2022-08-16	POSITIVE	0.999864817	General Feedback
318165c5-c317-4be8-a1fc-af4812ffee47	1	A wonderful Efficient n reliable app!	5	2022-08-14	POSITIVE	0.999884009	App Speed & Performance, Bugs & Reliability
34206a57-8ad9-4f39-9d9b-84c44711602f	1	I was used it is good app.	5	2022-08-12	POSITIVE	0.999776423	General Feedback
17c8966a-46aa-410e-b7c4-78cda7366b8c	1	Good app but when i want to tranfer to other banks there is ZEMZEM BANK and HIJRA BENK . add these banks.	3	2022-08-11	NEUTRAL	0.575634301	Feature Requests
41925d11-1f20-4af0-9b64-6bcc9b9422b5	1	i want to exercise the appl.	4	2022-08-11	POSITIVE	0.962067604	General Feedback
e44ecb6a-e0b1-4bdf-843c-115d1a9aca9e	1	Find it so good and helpful but can't download attachment	5	2022-08-10	POSITIVE	0.640423834	Customer Support
70a4e02b-f2cd-46ef-990b-846c971716a9	1	User friendly app. New of the kind in Ethio	5	2022-08-09	POSITIVE	0.995864987	User Interface & Experience
d6701382-426d-4dd4-98b4-a89d1f0a7b8a	1	This app is simple for uses	3	2022-08-09	NEUTRAL	0.988872707	User Interface & Experience
f66a51d6-db43-4e36-8923-47c03f7bc825	1	Iam very admired	5	2022-08-07	POSITIVE	0.999667525	General Feedback
ab843ac7-bb3a-45f5-b4e8-4c6c315c97a0	1	The application is best based on the online banking system. But sometimes it shows previous balance when logging in and it confuses after making transaction	5	2022-08-07	POSITIVE	0.997799575	Transaction Performance
bdfea7b8-aff5-4f24-974f-dd0e2d19ec83	1	Its have some bugs when iam close the app its redirected to open the ap pls fix it	3	2022-08-07	NEUTRAL	0.999108136	Bugs & Reliability
aa86ea1c-ac51-4a7a-bf5a-50c7c9e6debf	1	It is a good app	5	2022-08-06	POSITIVE	0.999864340	General Feedback
0a70060b-a04f-447d-a942-978428dabd64	1	It's wonderful app Tanks befor.	5	2022-08-05	POSITIVE	0.999811351	General Feedback
ef15b273-7d7a-4e73-81da-c0024f9199ba	1	This one of the best app for my money 😜	5	2022-08-05	POSITIVE	0.999670863	General Feedback
da1dd1e9-48ee-4bf7-a82e-08c817f74670	1	Super confused app	1	2022-08-05	NEGATIVE	0.999312639	General Feedback
5e3d88ca-037c-4f84-8b18-d148fffbec81	1	Great app, it made my daily transactions very easy happy to have it. Kudos!	5	2022-08-04	POSITIVE	0.999834061	Transaction Performance, User Interface & Experience
32fab5d2-7c12-43ca-aa6c-38d8326286e4	1	One of the best apps ever created. Its very beneficial I like it more	5	2022-08-04	POSITIVE	0.999872088	General Feedback
e79190bf-9100-4ee3-8691-6f84139fe72d	1	Best app to transfer money ,, Very fast & update itself immediately	5	2022-08-03	POSITIVE	0.924530149	Feature Requests, Transaction Performance
bdde7000-b28e-4375-9306-fba7eec036df	1	That is good	5	2022-08-03	POSITIVE	0.999836445	General Feedback
388dbaf2-7a3a-481b-93ca-11305d495a3e	1	It very amazing app	4	2022-08-02	POSITIVE	0.999875665	General Feedback
f64d4b4c-b27d-49cf-b0c5-ec9c6a74e745	1	Easy to use and accessable from anywhere in the world 🌎	5	2022-07-31	POSITIVE	0.999531507	User Interface & Experience
8029f41e-3612-42a1-b627-6f8746ac5a5a	1	Its nice app. If its possible please try to add standing order option. We need it just to contribute small money in monthly basis for people in need or for spiritual things.	5	2022-07-29	POSITIVE	0.948660493	Feature Requests
0c1659c3-8368-4c7d-ab45-8ad60b57e5b8	1	Am satisfied with this app	1	2022-07-27	NEGATIVE	0.999309897	General Feedback
b21c3673-cfed-4810-b7a5-90f011a11d65	1	It's good app, couse of shawing the debit & credit amount on time it's sometimes late if not I could have given it 5 star.	4	2022-07-25	POSITIVE	0.997586250	General Feedback
2e5e3031-b3b2-42bb-894c-2a4d4c294ff8	1	Saving money my account bank and my phone number	5	2022-07-24	POSITIVE	0.758006632	General Feedback
423fc93f-eaca-4e1b-b16f-9a66b449bda8	1	Really good app	5	2022-07-24	POSITIVE	0.999864340	General Feedback
ba8f3f90-b154-4b8a-a596-e76b68bacfa4	1	Why it stucks?i cant see my balance and accunt nuber site	5	2022-07-22	POSITIVE	0.999373496	General Feedback
af27a341-ba7e-4364-b203-068ac89a741f	1	Very poor and slow.	1	2022-07-21	NEGATIVE	0.999778688	App Speed & Performance, Transaction Performance
7d9886b8-47c5-4c1b-b9b4-d4aadf1a7e9c	1	It is great	4	2022-07-21	POSITIVE	0.999880195	General Feedback
e65642c2-84b9-42d2-8e51-89d01d981a06	1	It was best app but after updating it doesn't synchronize easily it respond null and become worest app	1	2022-07-17	NEGATIVE	0.997281909	General Feedback
d41ab4b9-9015-4138-a0fa-da1a5de146db	1	So much easy but please add CBE birr into the program.	5	2022-07-16	POSITIVE	0.928912580	Feature Requests, User Interface & Experience
a2cf2769-c101-4c7f-8ba7-5ea80de155b1	1	It is awesome	4	2022-07-15	POSITIVE	0.999872327	General Feedback
df949a71-78c6-4671-949d-dd09925599f4	1	Good but needs further features!	3	2022-07-14	NEUTRAL	0.919470429	Feature Requests
8c477fc9-b845-44c9-9278-768df22d9a4c	1	really good app but sometimes doublicates the transaction.	4	2022-07-12	POSITIVE	0.955756962	Transaction Performance
f478d6d3-cc8d-44e1-a321-a9b1433450d2	1	I like it it's very nice app	3	2022-07-12	NEUTRAL	0.999866724	General Feedback
ca7b43c8-010a-40bd-aae2-b4bc6c5ff09d	1	Really great app!!!	5	2022-07-11	POSITIVE	0.999852896	General Feedback
88a79912-6015-463f-8be6-7174ae849f72	1	Its very important this app	5	2022-07-08	POSITIVE	0.999695063	General Feedback
85cf384e-cb11-4b67-8872-f793525383d8	1	Can't see transaction detail on android 5.0	3	2022-07-07	NEUTRAL	0.981431842	Transaction Performance
b1b614f9-2e58-4f0e-8e28-5c4dab30ca6b	1	The Best banking app I have ever seen in Ethiopian banking industry.	5	2022-07-06	POSITIVE	0.999810517	General Feedback
46fdd704-ae25-4340-9a8e-90e7d5472b2d	1	Best banking app	5	2022-07-05	POSITIVE	0.999736488	General Feedback
38022be7-3af3-47ce-b47a-a0b604b2ed17	1	I love the application	5	2022-07-04	POSITIVE	0.999842286	General Feedback
e54fc0cb-54b0-4d09-a015-94d25be6ef06	1	The most intersting app service that is easy to use and operate. Excellent service.	5	2022-07-04	POSITIVE	0.999653220	User Interface & Experience
6eba15e5-6857-4389-9a6b-18b98f5fdafc	1	So far, it was so good. However, I am very worried since the application is so difficult to update.	5	2022-07-04	POSITIVE	0.980008125	Feature Requests, User Interface & Experience
30a0901d-283d-41cb-8501-28c342cb6882	1	This app is very nice and easy to use! It better to have a small size	4	2022-07-04	POSITIVE	0.996907175	User Interface & Experience
34ece0a0-f7ae-41b1-a307-abb4b47b02c0	1	Faster banking with cbe	5	2022-07-03	POSITIVE	0.997608662	General Feedback
011c77a1-b37c-43e0-acfe-fbac95346387	1	I can't retrieve statements from the mobile app	1	2022-07-03	NEGATIVE	0.999588907	Feature Requests
a547e915-d6eb-4fc9-a1c1-29be7ed5d4d2	1	Perfect app i love it	5	2022-07-02	POSITIVE	0.999880552	General Feedback
3b494a0b-87de-4266-ac51-261c341af0f4	1	The app notification code it's not link phone or email this means if you change phone you can't access your account easily	2	2022-07-02	NEGATIVE	0.998334229	Account Access Issues, Feature Requests
de1b17d6-5467-4b4c-a3fe-0ecf4596a414	1	Where does it store the downoaded transaction detail png?	3	2022-07-01	NEUTRAL	0.999417424	Transaction Performance
4f46190b-fee9-4971-8cba-50fe2aa0ad68	1	CBE customer for more than 14 years	5	2022-07-01	POSITIVE	0.965982914	General Feedback
83fd3e81-878c-46e3-89b7-cb6b3c5f88e3	1	It is good but not update quickly	4	2022-07-01	POSITIVE	0.997667313	Feature Requests
00a30a4d-d1c5-4465-945e-7bfac9f86085	1	Easy to use !	5	2022-07-01	POSITIVE	0.999056399	User Interface & Experience
bcff83f4-22b4-4d4e-8369-3c7a01b5cfdc	1	Most of the times I receive text of my balance the next day.	2	2022-06-30	NEGATIVE	0.991419911	Transaction Performance
5d6bbcc9-1930-4629-aa13-cb4437e8e255	1	Fast and secure banking app I've ever seen	5	2022-06-30	POSITIVE	0.998220384	Security Concerns, Transaction Performance
6e7c1804-ad33-45de-9229-7274cc3284f4	1	V good app	5	2022-06-28	POSITIVE	0.997865736	General Feedback
b321184d-3f09-4122-bac4-4fc3a80abf7d	1	I couldn't using this appa my phone if you fixing problem of apps Thank you	5	2022-06-27	POSITIVE	0.994632363	Bugs & Reliability
f5c87827-ae6f-4f0e-8d5b-b9b4d3d6df8b	1	it has low security system, it require too much space it dose not diserve	2	2022-06-27	NEGATIVE	0.987092137	Security Concerns
21e52b94-30af-4621-8d76-f13489c10efe	1	Very easy and clear to use.	5	2022-06-26	POSITIVE	0.999656081	User Interface & Experience
48d2c1df-3345-4e33-b11c-4715f604c7e2	1	I am Orthodox Christian but why on earth you think only Muslims use interest free accounts. Shame on you	1	2022-06-26	NEGATIVE	0.999143124	General Feedback
a8edb3ca-3f3c-4420-9b81-d3c4775139d9	1	It's cool even though it takes a thousand years to update.	4	2022-06-25	POSITIVE	0.999810874	Feature Requests
c597b8a3-7664-4732-9f35-c0ce40a6891e	1	Broadly speaking, it is good app. But recently I have noticed a problem when trying to see the recent transactions it becomes very slow and sluggish even closes and also have seen this on my friends' phone. So, this should be corrected asap and speed should be core feature	4	2022-06-25	POSITIVE	0.995305598	App Speed & Performance, Bugs & Reliability, Feature Requests, Transaction Performance
0d58d408-9629-4a87-9403-948e05208079	1	Garisalo gamunoa kamunikal dvvjdgvj	5	2022-06-22	POSITIVE	0.912185967	General Feedback
7fc746d8-2b17-46cc-884d-a397e3942a6a	1	Very poor can not updated!	1	2022-06-21	NEGATIVE	0.999756396	General Feedback
3918cb32-f42a-4108-8626-740566df2a0c	1	Its not updating properly ,not working	1	2022-06-21	NEGATIVE	0.999791205	Bugs & Reliability
eec279d0-f52e-4877-8be0-6a704fe31243	1	I like it	5	2022-06-21	POSITIVE	0.999859333	General Feedback
3b0372da-f887-4583-80e4-2c5690aa99f8	1	I love this app	5	2022-06-21	POSITIVE	0.999860883	General Feedback
e2a22047-5449-4efb-ad0e-cabc5f8bbc64	1	It says none available	3	2022-06-20	NEUTRAL	0.999689221	General Feedback
1fca1f79-3196-42da-b628-24b67f9fea9e	1	I cann't speak a word. without emotion It is a nice app,keep it up by updating	5	2022-06-20	POSITIVE	0.999512553	General Feedback
b6005319-3870-4065-891b-eb25f6e64537	1	Nice app proudly made in 🇪🇹ETHIOPIA	5	2022-06-20	POSITIVE	0.999776185	General Feedback
4a5162ed-c2de-47b8-a7f9-25cd041f6fae	1	Up date ስለው አይከፍትም	5	2022-06-20	POSITIVE	0.997231543	General Feedback
70ce0799-c45d-4a62-8ac1-779ee45f05ea	1	It is easy to operat & issential app. I'm using still.	5	2022-06-19	POSITIVE	0.995847940	User Interface & Experience
a9e5a284-bb32-478d-8b91-efc3c4755ea3	1	The App is highly secured one and easy to use.	5	2022-06-19	POSITIVE	0.997920096	User Interface & Experience
3aece504-687c-4d4c-b91a-90a0e0c9fac2	1	The app. Is very efficient though delay in bank to bank transfer service is witnessed.	5	2022-06-19	POSITIVE	0.999295354	App Speed & Performance, Transaction Performance
a4f65a92-146d-4959-902f-92365670f9b1	1	I love last update 🌹	5	2022-06-19	POSITIVE	0.999624610	Feature Requests
574f5358-cac3-4e38-a8dd-7ba115fd5c64	1	It is a great application with full of credibility.	5	2022-06-18	POSITIVE	0.999730408	General Feedback
28a8ca68-9bf7-4f5c-b6b2-471552b7d8cc	1	Good app need some updates	5	2022-06-18	POSITIVE	0.996257663	Feature Requests
81989c93-0cb1-46d4-b5d2-386c95cf49a1	1	Onli add monthly statement page list.	5	2022-06-18	POSITIVE	0.915769994	Feature Requests
c8667026-2c88-474a-bd1d-686f6a35b92f	1	I am satisfied with this app.	5	2022-06-18	POSITIVE	0.999670863	General Feedback
40f8c736-2c8e-4ac3-8a4a-5693d5c75941	1	Better application that helps you to manage your account activities.	5	2022-06-17	POSITIVE	0.963988304	Customer Support
7e16e5bb-6e47-407d-8d0a-d4e042448f66	1	Easy to use and save time I like it	3	2022-06-17	NEUTRAL	0.999132931	User Interface & Experience
f34d621e-da67-4f78-a34b-ef4b109d5726	1	Best of best	5	2022-06-16	POSITIVE	0.999749601	General Feedback
c31cf54b-3ca7-4bbf-bd28-7f2ac700dc95	1	This app makes my job easier.	5	2022-06-15	POSITIVE	0.975053668	General Feedback
6f8f7eb3-d6b2-4dfa-a609-92af0bd55597	1	Usefull and good apps	5	2022-06-15	POSITIVE	0.999831200	General Feedback
f7021162-e2ca-4df7-8801-71d008921a8d	1	Simple&fast app.I like it.	5	2022-06-14	POSITIVE	0.999643087	Transaction Performance, User Interface & Experience
cfe41458-6c1a-49ef-b5ed-0fcea096c5da	1	I can't open it when I change phone horror!	2	2022-06-12	NEGATIVE	0.998276949	General Feedback
7c6ae016-f921-471d-ac79-0cad860929a8	1	It is agood app rather than other bank apps in ethiopia but the transaction limit should be in greater	5	2022-06-11	POSITIVE	0.986684024	Transaction Performance
5a14e4a6-265b-4d69-88cf-7fc101c0c206	1	Amazing app thanks	5	2022-06-11	POSITIVE	0.999859929	General Feedback
c08ba56f-3df1-4a82-82e5-d56a7f0ae133	1	This App.Better For any Person How Use Bank	5	2022-06-10	POSITIVE	0.996999562	General Feedback
6246979a-bfbf-402e-85b8-74780f7c8b51	1	Really it is fast!	4	2022-06-09	POSITIVE	0.999660373	Transaction Performance
23f9e4b7-4926-4710-bca2-fb280f4f49c4	1	Easy to use	4	2022-06-09	POSITIVE	0.998854280	User Interface & Experience
357ee120-4da4-4ab4-8e39-e1c56026767a	1	Easy and simple...i like it	5	2022-06-09	POSITIVE	0.999854207	User Interface & Experience
24edd5be-9ae0-4aa7-9082-d2a6b117fb89	1	Why does it take a day for the app to show a recent withdraw and deposit	3	2022-06-08	NEUTRAL	0.999105871	General Feedback
711135d3-27ac-449f-9636-0c40bb85a81e	1	Very very help me.	5	2022-06-08	POSITIVE	0.507378519	Customer Support
07298fb7-4e26-4d5d-b620-ddba812a67c7	1	Waw I am delighted with this app.	5	2022-06-06	POSITIVE	0.999843478	General Feedback
051a7a9f-4c99-4a11-ab24-100d3535a011	1	Very productive app, i love this app.	5	2022-06-06	POSITIVE	0.999864101	General Feedback
46557095-e0af-4780-88cf-6f368db93d79	1	Best app & latest.	5	2022-06-05	POSITIVE	0.999625802	General Feedback
a101ad54-808d-464d-b36b-ad97599969f8	1	Best App.I have used for many years.	5	2022-06-05	POSITIVE	0.999584377	General Feedback
df07099e-8653-405b-bfb7-1c461887214c	1	Very very bad app so embarrassing	1	2022-06-05	NEGATIVE	0.999795377	General Feedback
2bcc2319-eb1e-4f3d-87f1-26e90018ecb2	1	Very good and easy to use app	1	2022-06-03	NEGATIVE	0.999871731	User Interface & Experience
213a2e71-31fc-4718-b32d-e74ef6cb0396	1	Love this app Couse it makes my life Easier	5	2022-06-02	POSITIVE	0.999594271	General Feedback
3c383139-bb0a-414f-8e6e-ade4dec359d1	1	I love it😍	5	2022-06-02	POSITIVE	0.999879956	General Feedback
cc349107-8267-4c39-ad1f-dc8defcd404d	1	This is an amazing application. It is very easy to use and understand. CBE Thanks for making it.	4	2022-06-02	POSITIVE	0.999835730	User Interface & Experience
908f47f0-733e-4096-befc-9c575142bbf6	1	ጥሩ አፕልኬሽን ነው ። ተጨማሪ የዲጂታል ከረንሲዎችን ማስተናፐድ እንዲችል ቢሆን ደግሞ ጥሩ ነበር።	5	2022-06-02	POSITIVE	0.952843368	General Feedback
ed38fad9-663e-446a-8db6-af0c25f396b7	1	Simple, clear, smart and easy. Download right now and use it.	4	2022-06-01	POSITIVE	0.997416854	User Interface & Experience
858fd447-bb59-40e6-a82d-3111bcfe2bc2	1	I would have given the app 5 stars if the download or share function of the last transaction confirmation is working. I wonder why you desabled it as I repeatedly obliged to screenshot the confirmation. If I were you, enable is as even pdf file to print and file. I hope you will correct by updating it.	4	2022-05-30	POSITIVE	0.996978283	Transaction Performance
ba31c6bc-15b0-4ddb-bedb-3ee62528b641	1	Best Mobile Banking App, easy and Clear to use.	5	2022-05-29	POSITIVE	0.999307632	User Interface & Experience
7c8d42f6-9a01-4c9c-876a-78390f8a0be3	1	Easy beautiful design	5	2022-05-28	POSITIVE	0.999877334	User Interface & Experience
90a81194-ca3f-4a20-b1ff-42606640e6da	1	Very nice App	5	2022-05-27	POSITIVE	0.999856234	General Feedback
69fd1baa-ac5d-4697-af5d-2b68b5bfc4bf	1	It is good application.	1	2022-05-27	NEGATIVE	0.999868631	General Feedback
af6097cc-acc1-42d6-897e-8d6dbe86d1c2	1	The Best And Suitabel And Easy To Use	5	2022-05-26	POSITIVE	0.999824584	User Interface & Experience
c8bf3847-2a73-452b-a6f3-11c676ee8dd8	1	No mobile app like this. Really an amazing	5	2022-05-26	POSITIVE	0.999547541	General Feedback
bd25c988-eeea-401d-b06c-a6c232b09039	1	It was good until I have many transactions then it started to stack and lagg	2	2022-05-26	NEGATIVE	0.765203178	Transaction Performance
9ac363a5-cf0a-4869-b012-e5a2705b2cb6	1	The app overlaps on other apps after closing, please bring some improvements. The rest is best.	5	2022-05-25	POSITIVE	0.997700036	General Feedback
bb8742ae-51ac-4a66-b023-2aa5ea368b17	1	ለመጠቀም በጣም ቀላልና አመቺ ነዉ!	5	2022-05-25	POSITIVE	0.994530380	General Feedback
c4b4e57f-9c53-40eb-bcaa-0a05addd6286	1	Very atractive app	5	2022-05-25	POSITIVE	0.998603761	General Feedback
e61e79a4-1273-48d3-89db-790fd47e72a4	1	I'm blind. I have been using this service since 2008 EC. More or less both versions are accessible to our screen reader, talkback. However, after updating the app, its account tab couldn't display second account which is connected via CBE account. Secondly after transfering money, it shows save and share options but doesn't work.	3	2022-05-23	NEUTRAL	0.999056637	Bugs & Reliability, Feature Requests
8c45f96d-a981-41c9-bf40-24521ee112d2	1	Very disappointing, it doesnt order transaction correctly, it randomly switches the orders everytime you refresh it, it sometimes shows wrong dates. Very unorganized.	1	2022-05-23	NEGATIVE	0.999680996	Transaction Performance
8ac2b373-9c41-42a1-803c-d6ca1f1be42d	1	It performs two transaction with just one request....በጣም ቆሻሻ የሆነ app nw የእዉነት	1	2022-05-23	NEGATIVE	0.981611133	Transaction Performance
bf6b40fa-67e9-4344-beec-2c1fe17fd8f9	1	It's good app.	5	2022-05-22	POSITIVE	0.999867797	General Feedback
f00e4485-d0ec-4db3-babc-157cb608a9ad	1	Can't update or syinc transactions	1	2022-05-22	NEGATIVE	0.997321784	Feature Requests, Transaction Performance
8f03234d-65f6-4169-bb45-635cff03e2f7	1	This is very good app; Thank you developers!	5	2022-05-20	POSITIVE	0.999863863	General Feedback
4c253c04-ee14-475f-9f6c-e6621643efd8	1	Good easy and fast	5	2022-05-20	POSITIVE	0.999858856	Transaction Performance, User Interface & Experience
1af7345c-3aa0-4fb3-b802-aa2e76480f6d	1	አፑን ስጠቀም የመጀመሪያዬ ነው ..... This is one of the most user friendly app that i have ever been using on my phone ..... I wish i could give you not 5* but 55* ...keep it up !!	5	2022-05-20	POSITIVE	0.998183906	Feature Requests, User Interface & Experience
5cc709f5-b42c-4e77-8944-7a4bc34ba593	1	CBE is the best!	5	2022-05-19	POSITIVE	0.999850869	General Feedback
2a162c3e-7fb7-45e4-8b0e-1b2b2f177afe	1	Quick and easy to you it.. I liked it	5	2022-05-18	POSITIVE	0.999840975	Transaction Performance, User Interface & Experience
61d1ceac-b727-485a-a9b4-6dc99ebe7d09	1	It is best app but samtime busy	5	2022-05-16	POSITIVE	0.983873546	General Feedback
21bcde0d-ba7d-433d-8ba9-16670115a3a5	1	Smart app Thanks 👍👍👍	5	2022-05-16	POSITIVE	0.999846816	General Feedback
9275d89d-3e05-4059-8383-e40a646d8b00	1	Very best App	5	2022-05-15	POSITIVE	0.999817789	General Feedback
5a54d122-d4a4-474f-999d-98e3cbd9236f	1	Fast and time saving app.	5	2022-05-14	POSITIVE	0.995749116	Transaction Performance
e79f632f-9c68-43f9-bc99-1b1ccbf37b49	1	Sometimes it's busy the remain is good	4	2022-05-13	POSITIVE	0.990892529	General Feedback
81646b6a-2a6d-4c8a-9b78-a7f66a8d3aeb	1	If I could go lower, I would. Don't trust it when it says transaction failed.	1	2022-05-10	NEGATIVE	0.999770224	Security Concerns, Transaction Performance
b57b1261-6103-4141-8a71-22f407dfff75	1	this is the best ethiopia application to transfer money account to account, bank to bank, pay bills, recharge your mobile card	5	2022-05-09	POSITIVE	0.990775049	Transaction Performance
a1c4e462-bc87-49a5-8086-d3dd22408260	1	I gave 1 star, because to get verification number must go to branch. Now day technology is developing by speed of light. Please make it register and usable without going branch. The i will give 5 star.	1	2022-05-09	NEGATIVE	0.993274212	Account Access Issues, App Speed & Performance
f3c576ec-692e-4533-a057-fd210802c214	1	It is very interesting and useful app, it make easy process of finacial transaction, i like it	5	2022-05-08	POSITIVE	0.999555647	Transaction Performance, User Interface & Experience
a947e89c-d145-4a8b-adb5-cdd19ae87981	1	Useful and synchronized fast.	4	2022-05-08	POSITIVE	0.999663353	Transaction Performance
10cebabe-1e3e-4cf0-9a35-ab53bc3fb521	1	I like the app but sometimes it gives you error message but the transfer was done even no notification so i thought not transferred so i do transfer again so i do double transfer Please improve this	3	2022-05-06	NEUTRAL	0.975978017	Bugs & Reliability, Feature Requests, Transaction Performance
b80fa0bb-6cc3-4baa-b822-890e05b123b1	1	ገንዘብ ከአካውንት ወደ አካውንት የሚያስተላልፉ ሰዎቸን ስም ወይም ስልካቸውን ብናገኝ እንደ ቤተክርስቲያን ደረሰኝ ለመስጠትና ለማመስገን ይረዳናል ።	4	2022-05-05	POSITIVE	0.958290517	General Feedback
ef42cb52-c7cd-418a-b306-62454aa1605a	1	It is best application for banking system. Because it's save time, and make easy all things like, paying for other, transferring mobile charging and etc... But it's good if you add mini statement option like tele birr app, it's make full.	4	2022-05-05	POSITIVE	0.998441637	Feature Requests, User Interface & Experience
347691a0-283e-4e35-8023-f4c1a08df1a0	1	Very easy to use.	5	2022-05-05	POSITIVE	0.999356329	User Interface & Experience
ad6be9b4-6540-41f9-b5f1-42c00fd3e5b5	1	It was good app I like it.	4	2022-05-05	POSITIVE	0.999864697	General Feedback
5333e812-7432-41de-ab78-44d5818edbb5	1	Stopped showing received or deposits recently.	3	2022-05-05	NEUTRAL	0.998815298	General Feedback
8161b8ab-bcd6-4aec-ab1a-32e73bf8e38a	1	Best app to use	5	2022-05-04	POSITIVE	0.998585939	General Feedback
5bdc6a1f-ea14-42f6-b74c-6cec5f82b825	1	Every time it needs to reconfiger by physical presentation. Why online access is not given to the user?	2	2022-05-04	NEGATIVE	0.998289406	Account Access Issues, Feature Requests
d8932a56-d8d5-4e13-88ca-92bccdfb3f33	1	First of all you need to be given a pin from a commercial bank, next you must have your bank book with you in order to be given the pin code. So I never got to use it, I just didn't want it that bad.	1	2022-05-02	NEGATIVE	0.852013528	General Feedback
fc2d5345-5ee3-4d50-87b4-38986d32021b	1	You have to go to the bank branch to activate the app where there is the worst customer service, after the activation the app lags so much that i had to uninstall it to restart it again. Know it asks to go to the bank again to activate it.	1	2022-05-01	NEGATIVE	0.999782860	App Speed & Performance, Customer Support
ae56068e-2bf7-4ec8-8c91-c2c59d62ad68	1	Am a postgraduate student. it has eased my life here .	5	2022-04-29	POSITIVE	0.990806401	General Feedback
2b64282c-06a9-42cc-bce3-5934ea8c2959	1	Really Simple and Secured	5	2022-04-25	POSITIVE	0.999824345	User Interface & Experience
c865f9d1-6ada-4a3d-80f0-647e8883ad47	1	It has simply simplified my life..i love it.	5	2022-04-25	POSITIVE	0.999698162	General Feedback
0e99b8bc-6c41-4a25-8f71-c8b0bf1c89f5	1	very very nice app but it's Not done by simple network	4	2022-04-25	POSITIVE	0.948464096	User Interface & Experience
a4b890b8-d545-4432-b406-b02d0360beab	1	It's the perfect app for online mobile banking	5	2022-04-22	POSITIVE	0.999790490	General Feedback
253357dc-65c1-4c2c-84dc-0ff2db1af935	1	Excellent and simple app than all available apps	5	2022-04-20	POSITIVE	0.999865055	User Interface & Experience
a19e2b19-e334-492a-b05f-fbc3e9ac9933	1	It would be really awesome if it had an export to csv file option on recent transactions.	4	2022-04-20	POSITIVE	0.987172484	Feature Requests, Transaction Performance
1a333b82-b024-45bc-aa5a-c1f8a3267f57	1	Easly And Vergood App Thanks CBE From Shilabo Ethiopia Somali Regional State	5	2022-04-19	POSITIVE	0.731282055	General Feedback
049214dc-136b-4db8-bc31-39ef3f6b6b60	1	Best bank of Ethiopia good	2	2022-04-19	NEGATIVE	0.999811113	General Feedback
4c450481-3616-4b1d-9d3a-5365ddd84e80	1	Immaculately designed for the target group.	4	2022-04-17	POSITIVE	0.999564946	General Feedback
0007ebff-444a-49d0-b875-e13b19f6831c	1	Difficult to link two accounts	2	2022-04-15	NEGATIVE	0.999758422	User Interface & Experience
5f3e7f58-ef47-4e47-acbf-3cdd4161032e	1	That's a good app but it 's more fun if you add features like weekly report download in PDF and that's why I gave you 4⭐.	4	2022-04-15	POSITIVE	0.999222040	Feature Requests
d7e3ed45-7349-41ae-af83-66aad1ef3e82	1	Is very important APP used at a time T, anywhere. Thanks	5	2022-04-13	POSITIVE	0.997767687	General Feedback
50b323c2-50fd-4494-8893-3fc175a900b4	1	Its good to taransfer	4	2022-04-13	POSITIVE	0.999587476	General Feedback
5311605c-0799-4bfd-9805-c5c9b6eaa633	1	Best mobile banking App	5	2022-04-12	POSITIVE	0.999709547	General Feedback
c31f0b86-60b1-4634-b391-7e42e5052036	1	This app makes it easy to make transaction	4	2022-04-12	POSITIVE	0.995773494	Transaction Performance, User Interface & Experience
4118db25-da46-4a7b-b78c-853bb9736359	1	በጣም አሪፍ ሲስትም ነው በርቱ	5	2022-04-09	POSITIVE	0.883213103	General Feedback
404a3e0a-8a26-4ed9-9672-9480686d240e	1	It is very good, it make my life easy !!	4	2022-04-08	POSITIVE	0.999879122	User Interface & Experience
3a5f3147-3ce0-4ca8-ae33-d020ff8c18f8	1	Bdry good app and functional system	5	2022-04-07	POSITIVE	0.999841452	General Feedback
4886d1fd-ef55-470d-82d8-a4bfcd8155d4	1	It's a nice app & works properly.	5	2022-04-07	POSITIVE	0.999852777	Bugs & Reliability
06c30f66-9f12-4609-8ad0-0ed4ce425ffe	1	It app so bad for it can't update review recent send,others thing the service are so poor	1	2022-04-06	NEGATIVE	0.999598444	Feature Requests, Transaction Performance
2d47afe4-ef1b-4517-be95-fba4b443e9ab	1	Fast and accurate	5	2022-04-06	POSITIVE	0.999852538	Transaction Performance
b9b92ac0-b83f-4e9c-871f-6d6c784e4fae	1	Exelent app it's very help full	5	2022-04-06	POSITIVE	0.988425970	Customer Support
c1809d53-92c0-48e7-81f9-0230be6bdfb2	1	I am a biginer, too early to comment	5	2022-04-05	POSITIVE	0.996297896	General Feedback
7d95f9dc-5cf7-4000-b979-bdfdbef0f74f	1	I appreciate the effort you put in this application, but for commercial bank employees, you should include staff who speak the language spoken by the customers, depending on the location of the bank, in particular, the Somali region thank you. ለንግድ ባንክ ሰራተኞች ግን ደንበኞቹ የሚናገሩትን ቋንቋ የሚናገሩ ሰራተኞችን ማካተት አለቦት እንደ ባንኩ አካባቢ በተለይም የሶማሌ ክልል እናመሰግናለን።	3	2022-04-05	NEUTRAL	0.997927904	General Feedback
66fbe9f5-60e3-4979-b8ce-0e88d6c2523e	1	Unreliable,slow app with childish interface. Learn from other banks such as BoA to design your app and try to add more functionality.	1	2022-04-05	NEGATIVE	0.999625802	App Speed & Performance, Feature Requests, Transaction Performance, User Interface & Experience
b7acd697-8052-4fa8-b168-86a5dee9bfb2	1	Really I am happy by this app is to use and time wise insted of go bank I use my phone to transfer money.	5	2022-04-05	POSITIVE	0.998572230	Transaction Performance
0b326643-0210-4551-ae19-eade4e9e7421	1	How do I register what do I need am new customer ?	3	2022-04-04	NEUTRAL	0.998868108	Account Access Issues
195a6a52-fe3e-4abd-b27a-092b78ec9e56	1	Not fun.....not lively Its 2022 and counting u guys suck	1	2022-04-04	NEGATIVE	0.999767482	General Feedback
d33d6ba1-1e59-4ebd-9f4e-fe27013202d3	1	It's good application but sometimes can't work properly!	3	2022-04-03	NEUTRAL	0.998002470	Bugs & Reliability
1ffdffb1-8bcb-4caa-a223-4bc6ec85350c	1	It is a great app, I like it!	5	2022-04-03	POSITIVE	0.999868155	General Feedback
1dfd4c8c-f4a5-42e3-a73c-b3b157623018	1	Not seen money send to agent why?	5	2022-04-02	POSITIVE	0.999068081	Customer Support, Transaction Performance
a30162a6-544c-4e3e-b68c-09d1e908be3a	1	It is very useful app I like it to use	1	2022-04-01	NEGATIVE	0.999337494	General Feedback
6ac757af-7a1a-45e3-8de9-4fc54c29bf9a	1	Have been using it for 2 years, the new update is even better. Best MB app	4	2022-04-01	POSITIVE	0.997039497	Feature Requests
5d4badb6-7184-4c73-b6ae-d790a3b69eb6	1	Wow very good app i like	5	2022-03-31	POSITIVE	0.999862194	General Feedback
a93e1ace-b89c-421a-aba2-3e269f2c58cf	1	Not always good It is helpfull	5	2022-03-29	POSITIVE	0.989078701	General Feedback
33df7e0b-fe28-466e-887e-45b02c19c3ec	1	አንድ ጊዜ ታዞ ሁለቴ ያስተላልፋል አረ አስተካክሉት	4	2022-03-29	POSITIVE	0.920040667	General Feedback
0e642a31-d6fd-482a-afa4-85f5f510a398	1	Very good. App	4	2022-03-29	POSITIVE	0.999864578	General Feedback
b955680e-4685-40cc-a117-3054e3b30bb1	1	The best and secured app thank you!	5	2022-03-28	POSITIVE	0.999861360	General Feedback
1d162438-520e-41ab-99a7-ae632f8eeb1b	1	After everything done it can't save and share the transactions receipt	3	2022-03-28	NEUTRAL	0.997942507	Transaction Performance
f86ccb01-57e6-4b5c-a839-c2fec7680713	1	A must have apps.	5	2022-03-28	POSITIVE	0.965773046	General Feedback
2746c645-156a-4871-ad73-9094918aa153	1	It's good app, it is simple to use. It would be better if there was more recent records on the "recents" toolbar. It is only about 17 deposit and withdrawal recent records displayed to the user while others are deleted automatically.	4	2022-03-28	POSITIVE	0.976285696	User Interface & Experience
b12f7a22-3e3e-4f4b-ba0f-48152ebfadb7	1	I like the apps	5	2022-03-27	POSITIVE	0.999478757	General Feedback
2e65651d-9f69-46a7-83b4-791340d64bfc	1	Fantastic it's nice to using internationally network to developing world-wide.	4	2022-03-27	POSITIVE	0.999817193	General Feedback
7f4c5cbb-79bb-4863-93fb-65ab2404f30f	1	Wow! This is how to make life easier!	5	2022-03-25	POSITIVE	0.999638081	General Feedback
03c0e29f-db34-44a8-adfc-e844c212455e	1	its good app but the main problem of this app is When you change your phone or restore it you should go bank to instill the up again so imagin any time if you want change your phone you should go bank.thats to bad.	1	2022-03-25	NEGATIVE	0.996752024	Bugs & Reliability
6ba7019c-aff0-4f40-a0c2-4d26dadb652f	1	Great and I am happy especially using it from abroad.	5	2022-03-25	POSITIVE	0.999888182	General Feedback
4645aedf-7e1f-44b5-bd6c-2f97f3bdf7a3	1	The app should have FAQ SO THAT THE APP DESCRIBES HOW TO USE SPECIALLY TRANSACTION ISSUES LIKE LIMITATIONS	3	2022-03-24	NEUTRAL	0.998937428	Bugs & Reliability, Transaction Performance
fe4a8621-4451-45b2-a3fe-5d4558ec785c	1	Experience for free of charge payment	5	2022-03-22	POSITIVE	0.854392171	Transaction Performance
bdcb8bb5-f596-48dd-8309-9599f3d935db	1	It's a great app. I've been using this app since the bank launched it. As a long-term user, I would like to point out things that need to be improved. 1. Deleting money transfer history should be the user's choice. 2. There should be an option to download an in-depth transfer history for each transfer activity , just as there is posiblity to download a single time transfer recit. Do that and get 5 star.	3	2022-03-18	NEUTRAL	0.504919112	Feature Requests, Transaction Performance
3e98dd53-cfee-4e49-8309-d3d17673417c	1	Tell us more	5	2022-03-18	POSITIVE	0.994201958	General Feedback
728d5139-77e9-48d0-a9cc-d9a9db6df2e3	1	Useless up for payment purpose	1	2022-03-18	NEGATIVE	0.999790609	Transaction Performance
341e6cbe-9707-43ae-9717-bd6b496fc0d5	1	Easy to use v good	5	2022-03-18	POSITIVE	0.990909874	User Interface & Experience
b97433ef-bc09-4700-8772-46e9980dad3d	1	Its amazing app , i like it specifically updated version is to smart . WOW CBE. But users have to Login without of goingto Bank after first registration . In this app If User was change His phone or uninstall app Hi have to go bank to use again, this is not good :: if this problem was fixed This app wasn't Any - comments. This is my feedback Thanks	5	2022-03-18	POSITIVE	0.966926575	Account Access Issues, Bugs & Reliability
f966c601-d8d2-4be2-a910-04ddb444f860	1	It is very useful app that easer to use	5	2022-03-17	POSITIVE	0.999106109	General Feedback
9f686b7b-e242-4e8a-af5a-3e99f44b08aa	1	Fetching transactions is very slow and makes the whole app stacked.	3	2022-03-16	NEUTRAL	0.999546468	App Speed & Performance, Transaction Performance
550022a5-b569-480b-a8b0-c1322246f373	1	Very nice app	5	2022-03-15	POSITIVE	0.999856234	General Feedback
0422b420-4a5f-42cf-8eb6-2d762084341b	1	Easy to use. I love it !	5	2022-03-15	POSITIVE	0.999878287	User Interface & Experience
3a43b3cc-d351-4642-9d4f-70c79e56fab1	1	It would be more help full if you can login with two of your accounts	3	2022-03-15	NEUTRAL	0.998472512	Account Access Issues, Customer Support
95f13674-8218-4bc3-8fe7-f3626ea5c8af	1	It is easy and safe application	5	2022-03-11	POSITIVE	0.999561012	Security Concerns, User Interface & Experience
e2810ffc-6555-4716-ae74-e09759f64506	1	Deducting 2times the same order starting from march7and 8 it is difficult to use mobile banking	2	2022-03-11	NEGATIVE	0.999457657	User Interface & Experience
69da4ac0-7353-4866-bb62-a6151b741575	1	I am interested in the application.	5	2022-03-10	POSITIVE	0.999428570	General Feedback
fd9facd0-0684-4e1b-9c23-887f6f7cdfbf	1	I am comfertable with the sevice upto this time. But wish the service be applicable without internet connection. If this is possible more custemers benifits.	4	2022-03-10	POSITIVE	0.998390317	Feature Requests
ed721ccb-5802-45ea-9b67-845ec79f1596	1	is the best	1	2022-03-10	NEGATIVE	0.999841809	General Feedback
134a709b-d98d-464c-95c2-41693badc86d	1	I can;t see my account, I can;t send it, it;s just a search, it doesn;t open	1	2022-03-09	NEGATIVE	0.999467909	Transaction Performance
cd104850-6d9e-419e-8567-af25856fcc21	1	easy for life	5	2022-03-08	POSITIVE	0.997000277	User Interface & Experience
4dd0b789-b26c-427c-bb7c-d2a9542cb340	1	Wow makes my Business Smarter and Faster. Thank you for Details.	5	2022-03-08	POSITIVE	0.999868035	General Feedback
9ac36812-00ce-4af7-a85d-9a25dc13b093	1	1. Withdrawal messages are not received regularly 2. Apps need to be more friendly use in terms of operation, 3. Apps lack some advanced security features, Additional comment: 4. Now that we are using modern technology, requirements for Bank Book should fade away with time. Some Branch offices do not entertain customers w/out Bank Book. Thanks and best regards	3	2022-03-08	NEUTRAL	0.999603450	Feature Requests, Security Concerns, User Interface & Experience
a13c419f-d274-480c-a42f-9660056702b9	1	Please improve your transferring systems , ??👍	4	2022-03-07	POSITIVE	0.957200229	General Feedback
952765d1-371d-40ed-ba65-4810791849a9	1	Easy to use	5	2022-03-06	POSITIVE	0.998854280	User Interface & Experience
85c9392f-6a89-4800-b7c6-b7725cf8ffdd	1	I like z app so much	4	2022-03-06	POSITIVE	0.999444187	General Feedback
e7690427-4c9f-4214-9e47-18cad939b073	1	Some time the connection is busy Plz try to solve only these	1	2022-03-05	NEGATIVE	0.998584986	General Feedback
305415c1-c220-443b-a543-e9c6fa1332ca	1	This doesnt even deserve any star. I havent seen any thing like it. Not only that but also the ones working in the bank dont even have a clue what to do about it. They got confused like me and ask me questions that they have to answer wow so much incomptency i have seen today. Wow	1	2022-03-05	NEGATIVE	0.975130975	General Feedback
826ebb04-a4bf-4c82-9cec-abe8897535bd	1	I have use for every purpose. It save me time and the app is a pocket money for me.	5	2022-02-15	POSITIVE	0.985901296	General Feedback
10684c38-c040-4cfd-873c-89fa836f5d01	1	Hi Cbe the updeted app is still not instoled becouse app problem...	1	2022-02-15	NEGATIVE	0.989710987	Bugs & Reliability
73dfb8f6-ee5d-469b-8a1b-80606ca5f721	1	Terrible! I had to use it to pay for my service at Document Authentication & Registration office. I hit confirm it says try again & I hit confirm again & it ends up sending the money twice. Then I had to write a letter to the office to get my money back & it is been more than 2 weeks but I didn't get my money back yet. I talked the issue to my branch they said you are lucky the issue is with a gov't office, they would do their accounting and return your money, but there is nothing they can do.	1	2022-03-05	NEGATIVE	0.999363482	Bugs & Reliability
730c2353-3bed-4e39-adc0-1ed94fdde9f5	1	How can i get akey word of this app.?	5	2022-03-04	POSITIVE	0.998811603	General Feedback
9507b4c3-3ca3-4c9e-aec3-b7d2c22336db	1	This app made simple my life.	5	2022-03-03	POSITIVE	0.999103487	User Interface & Experience
5fc13810-8488-46f8-a84f-180199c3b803	1	Does not work	1	2022-03-03	NEGATIVE	0.999737799	Bugs & Reliability
28487e77-f00b-407b-970f-567b0f2f1d9a	1	I like it	5	2022-03-02	POSITIVE	0.999859333	General Feedback
120c3b69-ab2c-4125-a084-95fd5db13091	1	Make life easy	5	2022-03-02	POSITIVE	0.999527097	User Interface & Experience
8e0df4da-17fd-4693-bd1e-8a753f91f5dd	1	It is good service, but the service charge is not fair. I prefer to get the service in physical or ATM unless otherwise diffulty case happened.	2	2022-03-02	NEGATIVE	0.985763490	Transaction Performance
3a8b9d4b-7f8a-4a46-b151-23c83380bf5c	1	Its hard to trust this application coz while transfering money it transfers two times to the same account after only one transfer click and sometimes it says error but it actualy have transfered the money, so i only use it if it is mandatory unless its better to go to the bank, so it still doesn't solve the problem not to go to the bank, i am sure it have some systematic errors	1	2022-03-01	NEGATIVE	0.999330401	Bugs & Reliability, Security Concerns, Transaction Performance
777b9069-8525-4340-a331-a57e676e3fa2	1	Stops working while u want to use most of the tíme. Please fix the bugs.	4	2022-02-28	POSITIVE	0.999735653	Bugs & Reliability
650fcf94-311f-4ea7-afbb-d53f6f3e4156	1	I don't see any options for outside of the country users.	5	2022-02-27	POSITIVE	0.997761011	Feature Requests
c106ae5f-a139-4fc6-8a91-801d8efa898b	1	ሁሉንም አገልግሎችን በተቀላጠፈና በአመቺ ሁኔታ ለማግኘት የሚያስችል መተግበሪያ ነው።	5	2022-02-27	POSITIVE	0.936667919	General Feedback
ffd37913-fa38-489c-9f5a-b5965253e850	1	Well organized apo	5	2022-02-27	POSITIVE	0.999772012	General Feedback
93a1644c-2245-4728-9fe8-931e8ac8e278	1	ብዙም ፈጣን አደለም ያስበላል ፍጥነቱ ያናደኛል በጣም.... እና ቢስተካከል መልካም ነዉ	3	2022-02-26	NEUTRAL	0.962802112	General Feedback
51e20b44-e51d-4d59-8d1d-e21de515eabd	1	I love it. I can make easy transaction.	4	2022-02-26	POSITIVE	0.999876857	Transaction Performance, User Interface & Experience
2e80f926-40a8-477c-89e0-34bd6eec6f2b	1	በጣም አዛ App	1	2022-02-26	NEGATIVE	0.617980421	General Feedback
e93a2e7d-0e64-4bde-ad0e-2be8b6d32a0d	1	This app is very easy to use and I interest it	5	2022-02-26	POSITIVE	0.999547303	User Interface & Experience
7a25183f-fc40-4471-8a45-2c662658fe17	1	Can't use the application since two weeks. I am outside Ethiopia but not able to transact. It is a disaster	2	2022-02-25	NEGATIVE	0.999511123	General Feedback
d5c1cd9f-ff7c-4d00-a1d2-34149a93b3ce	1	The only best app from cbe's tech	5	2022-02-25	POSITIVE	0.969443500	General Feedback
9faccb61-8ffc-4166-944f-80afb72a120f	1	It doesn't show me my number as well as my amount its always loading and its never stop that.	1	2022-02-23	NEGATIVE	0.724609613	App Speed & Performance
0602610e-96e6-4373-a7a8-30096f6ea7fe	1	This app doesn't work on my Samsung J6.	1	2022-02-23	NEGATIVE	0.999338925	Bugs & Reliability
2af8dbf8-720a-4b88-a589-76cf1437f538	1	Thanks for the update as it eradicates several errors but my concern is that I couldn't download or send the transaction detail after a transfer/yransaction is made.	4	2022-02-23	POSITIVE	0.994943082	Bugs & Reliability, Feature Requests, Transaction Performance
01363738-4d38-4031-a51d-c304d98af8e1	1	Scheme of further security is no doubt good	2	2022-02-22	NEGATIVE	0.998926580	Security Concerns
54a3f6aa-9b61-4af6-8f88-a775dc52c2c6	1	Very interesting application	5	2022-02-20	POSITIVE	0.999819934	General Feedback
e428a58c-c39a-464a-a131-4f91504e50ea	1	Simple and easy to use.	5	2022-02-20	POSITIVE	0.999762952	User Interface & Experience
16f71d0d-9957-41c5-a80f-c1ae56181aa2	1	Very bad application which can not working properly.	1	2022-02-20	NEGATIVE	0.999815285	Bugs & Reliability
99907117-2aa1-4783-877b-82e29b17849f	1	The best app 👌 I love it easy to use	5	2022-02-18	POSITIVE	0.999836802	User Interface & Experience
b7ec0500-8c72-4b99-b956-3751e3923a4b	1	Not working regularly	3	2022-02-18	NEUTRAL	0.999756873	Bugs & Reliability
9616223f-d751-4fad-88e5-899d61d4242e	1	After i update it's very slow and not working good	2	2022-02-18	NEGATIVE	0.999735773	App Speed & Performance, Bugs & Reliability, Feature Requests, Transaction Performance
183b86f0-3c99-4779-a725-e027226f551f	1	Failed to use mobile banking	5	2022-02-18	POSITIVE	0.999759257	Transaction Performance
1e28922d-d049-4fc7-9f4b-706570a79be7	1	Its good. I like it	4	2022-02-17	POSITIVE	0.999857903	General Feedback
9e1bbd26-c72a-4715-93ce-3a919f620077	1	Can't refresh and display balance even. No proper updates maintainance. Update fail many times. Too much lag	1	2022-02-16	NEGATIVE	0.999787033	App Speed & Performance, Feature Requests
468c55c1-1f6f-4a34-95cb-99d9f5e0aad2	1	Very satisfying app	5	2022-02-16	POSITIVE	0.999875665	General Feedback
dc95175f-5736-4f46-af6b-863b5cbe31e4	1	App says phone is rooted while it's actually not after the update. Devs please fix this issue	1	2022-02-16	NEGATIVE	0.918365359	Bugs & Reliability, Feature Requests
42d73205-b6bd-4e3e-ae51-6e36727f9437	1	The best way	5	2022-02-16	POSITIVE	0.999790013	General Feedback
d0a76a5d-49f1-436f-902f-c1f14c2e8548	1	easy to use	5	2022-02-15	POSITIVE	0.998854280	User Interface & Experience
b4ce7a7d-5289-42cf-ac61-a536a8165469	1	It's just very exlent apo	3	2022-02-15	NEUTRAL	0.989142716	General Feedback
91b39220-93e5-4bee-8aec-1b8517e3fb46	1	Very amazing app	5	2022-02-15	POSITIVE	0.999872565	General Feedback
d328f396-f5a1-4216-9858-2eea455b60b2	1	Always....busy Cant sync is common problem	5	2022-02-15	POSITIVE	0.999644279	Bugs & Reliability
31557044-cfde-47a1-b6fc-bb64e396ab2f	1	Such a nice	5	2022-02-15	POSITIVE	0.999859452	General Feedback
01335cd9-1a98-4bf9-9b0e-74d7fc72e088	1	App not down load why	1	2022-02-15	NEGATIVE	0.932392359	General Feedback
0c375f9a-dabd-4087-b095-d4ce33b67bc9	1	Greatest one ever I never see before	5	2022-02-12	POSITIVE	0.999854922	General Feedback
9f00b172-7569-414c-aa16-67110c420c12	1	This update amezed me , its possible to send money across different banks wow . thanks	5	2022-02-15	POSITIVE	0.998768032	Feature Requests, Transaction Performance
b7113f01-c27a-4d10-8446-959a39492f3d	1	It shows Sinc finished but no Money figures shown on the page. I coudn't see or use the money i have in the Bank.	4	2022-02-15	POSITIVE	0.999411464	General Feedback
c7efd797-d986-420e-98a4-364cdd9aeb20	1	it is very fast and simple to use.	5	2022-02-14	POSITIVE	0.999573410	Transaction Performance, User Interface & Experience
ef896073-6084-4b97-90ba-c2a07ae475ac	1	The last one week the App is not working even after updating not working please give some solution	1	2022-02-14	NEGATIVE	0.999628067	Bugs & Reliability
0f8f46b6-2093-4603-a238-00bfa0777f5d	1	Everything is perfect, but the transfer history must show the account owner(sender or the receiver)	5	2022-02-14	POSITIVE	0.961380482	Transaction Performance
db09d055-c331-4e3a-a76c-391dcbfdf075	1	Once you update this application it will stop working even the staff at cbe branch can't fix it.	1	2022-02-14	NEGATIVE	0.999478877	Bugs & Reliability, Feature Requests
a7729276-9f79-43ed-b0d2-19a8b49f9739	1	Very a good	5	2022-02-14	POSITIVE	0.999870062	General Feedback
b990455e-45d5-4894-8d89-f795f049964e	1	Not good enough for transfer funds to hellocash or rays microfinance.	5	2022-02-14	POSITIVE	0.999792874	Transaction Performance
136a422d-fb0f-4b32-b8aa-15c95e7bff8e	1	The app is very helpful	4	2022-02-14	POSITIVE	0.999318957	Customer Support
1e808f02-9410-4579-b062-58e3fea4afe6	1	Thank you for everything	3	2022-02-14	NEUTRAL	0.999849558	General Feedback
b3c6f529-b33e-48fb-ad4e-3e41821bf5cd	1	Wow it is really easier way to communicate business men , even it is more than Front CBE servant.	4	2022-02-14	POSITIVE	0.928139985	General Feedback
fbd3f01c-5b30-42ef-b5cb-a88d71895758	1	good but sometimes system is sometimes hard	3	2022-02-14	NEUTRAL	0.917188942	General Feedback
1f834898-0374-4fe2-9b05-f002e4aee182	1	It is not working still now	1	2022-02-13	NEGATIVE	0.999349654	Bugs & Reliability
83b19a88-3f2f-4473-af00-dff9df62ea02	1	By my self it is very nice i hope you will add another options!!	4	2022-02-13	POSITIVE	0.999830127	Feature Requests
c96aaf4a-7abc-4320-b8a2-4ffaa4e9f542	1	I have a lot of experience ,some of them are:- 1. Being a teacher, 2. Being member of Air Force , 3. Being Sport coach	5	2022-02-13	POSITIVE	0.955909014	General Feedback
4a52202a-7dda-49da-9618-24b6c404c4b4	1	App kana jaaladhe	1	2022-02-13	NEGATIVE	0.969057560	General Feedback
820e100f-c5e0-4573-972b-015c8ced2f8d	1	Easy & Perfect app	5	2022-02-13	POSITIVE	0.999813855	User Interface & Experience
a1df3a9d-7a1a-4474-a43f-82392ef92890	1	ጊዜችንን በአግበቡ ለመጠቀም ምርጥ የሆና አፕ	5	2022-02-13	POSITIVE	0.904695213	General Feedback
2af99f74-4181-4c45-97fd-21864ae8a011	1	Wow, its easy to use	5	2022-02-13	POSITIVE	0.999247789	User Interface & Experience
e874c54c-1fda-4545-8b3b-729ce2feb8db	1	I love this app!!	5	2022-02-13	POSITIVE	0.999869227	General Feedback
584afa11-3343-48f9-9a5e-94cf38d9d1e6	1	The problem that I have seen is some of the branches specially out of Addis Ababa doesn't have a know how about this application to authenticate it	4	2022-02-13	POSITIVE	0.999638915	Account Access Issues, Bugs & Reliability
5921b675-966b-4995-bea7-a24df8f1dbec	1	This app is very useful	3	2022-02-13	NEUTRAL	0.998563826	General Feedback
a4e7ebde-8fc3-47e4-8bec-00caf8e71db9	1	The app is good but it needs some improvment. It is better to enable two accounts within one mobile to work with in a single app by switching out.	3	2022-02-13	NEUTRAL	0.994102061	Bugs & Reliability, Feature Requests
117e0a7f-289c-40ae-ba57-8d693e0d4fda	1	It's recommended to use this any other banking system	5	2022-02-13	POSITIVE	0.944152951	General Feedback
1f0fd6c6-11cd-4df9-92b7-e0cbc09b1a18	1	this a wonderful app, use it and it will help u a lot.	5	2022-02-13	POSITIVE	0.999862552	Customer Support
b0701170-5c4d-40fb-be69-5431981e5df9	1	Good. Keep it up!	4	2022-02-13	POSITIVE	0.999851704	General Feedback
a5ac3aeb-8067-4dbc-b7df-71fd5a58f585	1	Good app. Can you add option to print or save "Recent Transaction page".	5	2022-02-13	POSITIVE	0.999466717	Feature Requests, Transaction Performance
a347fafd-c6d5-4a46-a8cd-1a23375a17af	1	Very good service	5	2022-02-12	POSITIVE	0.999864817	General Feedback
9750931e-2c03-4399-91b5-4ef26b3a62dc	1	It is good App I like fast	4	2022-02-12	POSITIVE	0.999859810	Transaction Performance
777243f8-d89e-43fd-ac19-4318d81cb88a	1	Very simple and satisfying app	5	2022-02-12	POSITIVE	0.999878645	User Interface & Experience
81893531-181f-479d-ad24-aafbbb01c349	1	Good app but not fast	4	2022-02-12	POSITIVE	0.998150885	Transaction Performance
c4f8963d-d961-44b3-bb86-c3dc4b7ed445	1	Excellent application. 1. It lacks currency exchange rate. 2. It says "error" but transfer the birr which biase customers. Please solve the above issues.	4	2022-02-12	POSITIVE	0.976937413	Bugs & Reliability, Transaction Performance
b845cc92-e790-4b5b-8906-2150ec537a0b	1	Easy to use	5	2022-02-12	POSITIVE	0.998854280	User Interface & Experience
f27f5196-30bd-468e-9369-e82c9067fc7a	1	Easy time saver and reliable for modern life !!	5	2022-02-12	POSITIVE	0.999548972	Bugs & Reliability, User Interface & Experience
28d935d8-ed82-4da3-87ea-8b1e23a8a4d9	1	The one leads the ethiopian economy is commercial bank of Ethiopia am very satisfied with this service and customer let be customers I invest in	5	2022-02-12	POSITIVE	0.996398330	General Feedback
e3637736-cd01-460e-8430-6e8b2861d1f4	1	Not working properly. Can not synchronized the current status	1	2022-02-12	NEGATIVE	0.999799669	Bugs & Reliability
8cf548bc-3290-4225-97b6-f29f7c9e4a27	1	I used to do everything with it but now it says can't sync. I can not do anything with it now. I'm having difficulties. Please try to fix it	1	2022-02-12	NEGATIVE	0.999535561	Bugs & Reliability
6664196c-c5a6-49f7-87a2-d1dab17dbfe1	1	Fast and easy to use	5	2022-02-12	POSITIVE	0.999580562	Transaction Performance, User Interface & Experience
7662b86b-0261-48c9-b50f-c5e91af8e5e3	1	It worked fine until I have received an SMS with a link to update the app, it directs me to play store having Open and uninstall options which when I choose open kept bringing me back to the interface of the app I already have.	1	2022-02-12	NEGATIVE	0.565849662	Feature Requests, User Interface & Experience
2277e8ea-9d66-4c2c-9094-bd14034e8548	1	Sometimes there is a problem of synchronization.	4	2022-02-12	POSITIVE	0.998804927	Bugs & Reliability
4e0639d5-0ef4-403e-8327-8b6d166d3658	1	It's good to have this app for easy use	5	2022-02-12	POSITIVE	0.999140620	User Interface & Experience
1754ee08-9884-4cac-ace9-b8db702e18b2	1	Simple and friendly	5	2022-02-12	POSITIVE	0.999862313	User Interface & Experience
385f6c3d-4622-4f1c-9219-1da4b39c727e	1	Nice and easy app	5	2022-02-12	POSITIVE	0.999843836	User Interface & Experience
5eb904ec-a048-4f67-8f3b-d0fa7fc92357	1	It's just good and secured application	5	2022-02-12	POSITIVE	0.999825299	General Feedback
dc39c24e-d3ab-4455-8956-9b59fdc42fee	1	need to be improved	3	2022-02-12	NEUTRAL	0.993545294	General Feedback
f0ac4f21-127f-4c7a-bb36-72e2cbf9a762	1	Very good application. However, recently, it is not working properly. Refusing to transfer money to telebirr and other accounts.	5	2022-02-12	POSITIVE	0.998261750	Bugs & Reliability, Transaction Performance
6325d63b-0fb6-4aa0-a1e6-77b505d2412b	1	Is for work	5	2022-02-12	POSITIVE	0.999471366	Bugs & Reliability
0fdc82f5-9f69-439c-bf0f-81dc0f028239	1	.Sorry.not Tsedeneya But Eden. Thanks.	5	2022-02-12	POSITIVE	0.999393940	General Feedback
b56371c3-108e-46da-8043-9fdbf30b7da9	1	The Bank you always rely on!	5	2022-02-12	POSITIVE	0.998793244	General Feedback
c78324b5-011d-41d9-8b39-b057a454e5aa	1	ጥሩ ነው በርቱ	5	2022-02-12	POSITIVE	0.833725393	General Feedback
29c17c04-103b-4211-a22b-24c5960ecdbf	1	It wouldn't sync usually.	5	2022-02-12	POSITIVE	0.999475062	General Feedback
42aafcb8-113c-4cbd-9532-809773e6a7fd	1	The best of best	5	2022-02-12	POSITIVE	0.999839306	General Feedback
bb3c8614-7e77-49e0-9f06-30402637a87f	1	Really wonderful. Facilitates Hassle free operation.	5	2022-02-12	POSITIVE	0.999508858	General Feedback
b6c038af-5a91-495f-adaa-1f8a7b19121b	1	Makes life simple	5	2022-02-12	POSITIVE	0.999837041	User Interface & Experience
b3d4df58-76aa-46bf-9a26-39424e43f660	1	Thanks for this multiple purpose app	4	2022-02-12	POSITIVE	0.999349892	General Feedback
852eafbb-759e-41b7-a49e-3c7ab4cd6f53	1	It is friendly app	5	2022-02-12	POSITIVE	0.999737680	General Feedback
b2c12dba-83ff-4f07-bad3-e509e4156a38	1	almost every day	5	2022-02-12	POSITIVE	0.997155190	General Feedback
d96523b0-26b4-4302-824c-5d4f0e3786b3	1	The service is very efficient and user friendly.	5	2022-02-12	POSITIVE	0.999667645	App Speed & Performance, User Interface & Experience
3dde8bbe-7d10-405e-a172-9a0edafd6c7e	1	Great app. Pls continue	5	2022-02-12	POSITIVE	0.999764740	General Feedback
c3f8f3bd-6c56-4376-ad69-87f20d740c77	1	it doesn't update status in any network i don't know where it work, please fix this problem it does't work at all	1	2022-02-12	NEGATIVE	0.999671102	Bugs & Reliability, Feature Requests
fc8c5280-6a82-4714-9b15-7f8406df3158	1	It is the best mob.banking app, i ever used.	5	2022-02-12	POSITIVE	0.999752700	General Feedback
7a21d98b-d216-40d9-8c78-9d7ac421f4ba	1	Good app We love it	4	2022-02-12	POSITIVE	0.999881268	General Feedback
696cbfbc-5bbe-4080-8aa6-8eb9ceaf2b93	1	I'm very interested in this app, easily and friendly to use Im so happy of using it, and thank you for update information.	5	2022-02-12	POSITIVE	0.999765933	Feature Requests
62f90182-b6fa-4d75-bbf7-ac728c0b2b32	1	.... nice app	5	2022-02-12	POSITIVE	0.999727547	General Feedback
441d50c4-75c9-4cfc-992b-ca794c617265	1	An interesting digital platform	5	2022-02-12	POSITIVE	0.999833822	General Feedback
3c2d2bc5-e5ef-4922-91f7-92379f7d3378	1	it's very good cbe	5	2022-02-12	POSITIVE	0.999857426	General Feedback
1f05958b-55b7-43b1-92ce-91077f10e425	1	በኮቪድ ምክንያት እንቅስቃሴዬ በተገደበበት በዚህ ወቅት የተለያዩ ክፍያዎቼን ለመፈጸም ቀላል ያደረገልኝ መተግበሪያ (አፕሊኬሽን) ነው።	5	2022-02-12	POSITIVE	0.955828369	General Feedback
c1128c1e-50e3-4fa5-aeaf-ee12159ac82b	1	Do proud of my people in CBE , the developers Great mobile app !!!!	5	2022-02-12	POSITIVE	0.999832869	General Feedback
bad1586c-4f0a-4028-852e-1fac944a9334	1	Until now it is not functional	1	2022-02-12	NEGATIVE	0.999585330	General Feedback
0fc753d6-8464-40d6-bc8a-beba978cd7b4	1	For me it was really comfortable 😌	5	2022-02-12	POSITIVE	0.999816477	General Feedback
6ecf6d59-2446-4043-9302-ab89ea135a22	1	This is an excellent app. However, it did not work offline please work on it.	5	2022-02-12	POSITIVE	0.759715319	Bugs & Reliability
64a3fdef-20c0-4db4-ac6c-6e607af7908b	1	I am using it 1.5 years ago it is so nice.	5	2022-02-12	POSITIVE	0.999784052	General Feedback
dc1b0ba0-5ace-4343-9448-c9c4918c8479	1	It is very nice and professional 👌	5	2022-02-12	POSITIVE	0.999875426	General Feedback
ab8b9cde-eae9-46df-9297-74fd187a0be7	1	i like it	5	2022-02-12	POSITIVE	0.999859333	General Feedback
9ec8e818-79a0-475c-8efe-ad6b4f7920eb	1	tiru nw mizu amarach alew	4	2022-02-12	POSITIVE	0.976131201	General Feedback
70dd9f35-b504-469a-b718-63470f1b7a3a	1	i like the services	1	2022-02-12	NEGATIVE	0.999793947	General Feedback
a6dca8a5-efe7-41f0-aa99-d8dec492e5bb	1	This App ir really helpful and easy. Thank you CBE	1	2022-02-12	NEGATIVE	0.998932302	Customer Support, User Interface & Experience
7c04f3d0-581e-4830-9f0b-ca9f13518b4f	1	Easy to use!	4	2022-02-12	POSITIVE	0.999056399	User Interface & Experience
86b37d3e-0030-4c91-a18a-37dffa8a10e1	1	Please Ethiopian electric opethio all	5	2022-02-12	POSITIVE	0.960540891	General Feedback
bbec6712-a8aa-419d-8633-8b816bed4084	1	Ever loved apps software for transaction timely and with speed. But the activation key process should be improved.	4	2022-02-12	POSITIVE	0.992842197	App Speed & Performance, Transaction Performance
2209ba96-0e63-4485-9fec-839fc23334c3	1	እስካሁን ስጠቀመው ምንም ግራ ያጋባኝ ነገር አላገኘሁበትም፣ በተለው ክፍያዎችን ለመከወን በጣም ተመችቶኛል። ወደ ሌላ ባንክ ለመላክ ግን ቴሌ ብር በጣም ይበልጠዋል።	5	2022-02-12	POSITIVE	0.961383104	General Feedback
8453f4b4-0557-4cd4-a521-59332cf362f1	1	It is fast and saves my time to make payments.	4	2022-02-12	POSITIVE	0.994268775	Transaction Performance
88742a12-e316-4cdf-9e3e-6b092b109d84	1	I am using it for a year. And the app is easy and fast, Use it.	5	2022-02-12	POSITIVE	0.998428345	Transaction Performance, User Interface & Experience
8841d8f3-9c9b-4b00-894c-7f2142a2e4ab	1	ብራንች ድረስ መሄድ ምን አስፈለገ verified ለማድረግ sms መላክ ትችላላችሁ እኮ ሰዎች	1	2022-02-12	NEGATIVE	0.957464814	General Feedback
c0c2b57b-da41-49eb-a934-9cde3389b4bc	1	This is awesome	5	2022-02-12	POSITIVE	0.999866962	General Feedback
337e83f2-358f-494a-a2d1-6cab292bb307	1	Thank you for easing the life and making our business modern ,easy and reachable.	5	2022-02-12	POSITIVE	0.999847531	User Interface & Experience
f31d55e8-76c4-49fc-acd7-f51cf02812c6	1	I got a text message i need to update this app with a link.but nothing here. Are u crazy.	1	2022-02-12	NEGATIVE	0.998839200	Feature Requests
cef7b557-9416-4294-8b19-21bb02591fdb	1	These is the most rediculous app i have ever seen in my life! You ahould just remove it from play store.	1	2022-02-12	NEGATIVE	0.977371097	General Feedback
d15038ce-d76d-4ee5-8865-708d6fff8719	1	it's good and easy app,i like it	4	2022-02-12	POSITIVE	0.999874711	User Interface & Experience
ea29dc1c-fa1b-46b9-9b9c-dc69f2641c47	1	The Most worrying thing of this Application is, while you confirm Transfer and hit ok, it prompted "Connection error" but actually if you see your balance the transfer was already done. This is serious bugg which you need to update and make security amendment's. I personally send twice one day , if the reciepent wasn't kind enough, imagine what will happen. Serious problem which needs Attention.	3	2022-02-12	NEUTRAL	0.999006808	Bugs & Reliability, Feature Requests, Security Concerns, Transaction Performance
6bfb8830-6097-439a-a05a-5e98abb0d469	1	U redirect me here to update the app, but there is no an update rather to open it and the app is not working. Unable to sync, pls go througn it.	4	2022-02-12	POSITIVE	0.999780834	Account Access Issues, Bugs & Reliability, Feature Requests
36e1bf29-9d3c-4335-9e6a-5411421be364	1	Very bad experience	1	2022-02-12	NEGATIVE	0.999803245	General Feedback
a048fb32-f9a0-40ad-a26c-89afcd1a9b55	1	Easy to use everywhere	5	2022-02-12	POSITIVE	0.998461246	User Interface & Experience
46ff57c8-2080-4c39-9fce-e243492cfe65	1	Some buttons get stuck, like the transfer button	2	2022-02-12	NEGATIVE	0.998270392	Transaction Performance
ee418ca6-4cb2-4672-9ca4-067fa680cb8f	1	Sometimes get stack!!!	5	2022-02-11	POSITIVE	0.922967315	General Feedback
4a3599b2-b7b1-45eb-8780-5d04bd7e8c64	1	Verification key sucks after installing again	1	2022-02-11	NEGATIVE	0.999709427	Account Access Issues
43b3ff1d-bed8-4231-b620-3047770190fc	1	Nice app, I live abroad and I was managing transactions using the app since last 4 months. but now after 3 4 days onward, I couldn't access it. pls any one can help me with this?	4	2022-02-11	POSITIVE	0.995064676	Account Access Issues, Customer Support, Transaction Performance
3422035c-2b3d-4ef7-b34f-a81c3d716392	1	Currently not working, but was a great app!	2	2022-02-11	NEGATIVE	0.998558342	Bugs & Reliability
99028139-06b6-4f5d-9211-b313cbd8de91	1	The app is not functioning for me. Please assist.	4	2022-02-11	POSITIVE	0.999609172	General Feedback
76a187c4-bacf-4a56-bc89-6ff562cb5be5	1	It said, always poor network, poor network....... even the network is there. You grilled us!!	1	2022-02-11	NEGATIVE	0.999774516	General Feedback
86f6c315-0dac-40f6-a2a4-4cdefe2ca853	1	WiFi integrated is not worked	1	2022-02-11	NEGATIVE	0.999369562	General Feedback
b0cac2af-7955-42f1-801e-4b34c9ee1d3c	1	WI-FI and Mobile data integration is nope! Other updates not worked on Sysy ...	2	2022-02-11	NEGATIVE	0.999521971	Feature Requests
5c870f7c-c5d0-42a2-8b0a-b39a82502118	1	Its so nice	5	2022-02-11	POSITIVE	0.999856949	General Feedback
4b00a5d7-cd9b-435a-95f8-910eecf3c4c7	1	Best in everything.	4	2022-02-11	POSITIVE	0.999810040	General Feedback
d5b75a3a-9f35-49a2-a5d6-c5cbc5bd6026	1	Though the app is a better enough in its service till now, now we can't access the service as it tells us no network and sync , thus please update it	1	2022-02-11	NEGATIVE	0.988199711	Account Access Issues, Feature Requests
286af118-aa01-4560-9abe-952392bb6cca	1	Some what good,it's so dormant l don't known the reason why	1	2022-02-10	NEGATIVE	0.998211622	General Feedback
9e80832f-cddb-446d-891a-0cc61044cf83	1	I thanks again	5	2022-02-10	POSITIVE	0.999807537	General Feedback
d50ae55b-5d6f-419a-b313-8e71e18e0a28	1	Very good but latley has been some glitchs	5	2022-02-10	POSITIVE	0.918230653	Bugs & Reliability
0ba36563-4038-48e7-a726-04d6c78093a4	1	Disappointing! I lost my phone so I went to a CBE branch to reactivate it (unnecessary imo) waited for 2 hours to receive the verification key for it to be useless and invalid.	1	2022-02-10	NEGATIVE	0.999793708	Account Access Issues, Transaction Performance
ce0b746b-f968-41d5-9f0d-49282405cbce	1	This app is loser app I ever seen.this app is it's not working in verification code.the verification code is not sending!!!😡😡😤	1	2022-02-07	NEGATIVE	0.999682665	Account Access Issues, Bugs & Reliability
0749a211-101f-447a-9e46-546d6a36960b	1	I dont wanna give even one star it's annoying	1	2022-02-07	NEGATIVE	0.999123156	General Feedback
8b89f96f-0ff7-4617-bf74-964ceaa72bb6	1	Currently the app is not working becuase I think they forgot to update it. It always shows'sync failed''. And there is no customer service online. People living abroad are having problems. It is a big shame. It is very annoying and not user friendly, People are using CBE just becuase salary is transferd there. The app is a total failur.	1	2022-02-06	NEGATIVE	0.999728858	Bugs & Reliability, Customer Support, Feature Requests, Transaction Performance, User Interface & Experience
88713eaa-7f93-4ec4-9d66-f22279164f9a	1	Its easy and safe, I like it.	5	2022-02-06	POSITIVE	0.999829054	Security Concerns, User Interface & Experience
905fed0e-17a7-4d8e-ad5d-54cb3c0f8f45	1	Great app, thank you cbe! You make my life easy!	5	2022-02-05	POSITIVE	0.999794066	User Interface & Experience
c9438e6b-2570-4f3c-9c78-77651778c4fd	1	Sometimes it's too annoying 🙄.	4	2022-02-05	POSITIVE	0.999575198	General Feedback
492db2d0-c8d6-4717-855b-1be054104408	1	Good App !!!!	5	2022-02-04	POSITIVE	0.999861836	General Feedback
64b185c2-4952-4ac3-8d15-94ac618cd92a	1	My internate banking is not allowing me to transfer to another bank. While having this app, the application asks me to contact a nearby nmbranch. Don't save your money trysting this application. It is so bad! It doesn't even have help icon included. I dislike this up.	1	2022-02-04	NEGATIVE	0.999723136	Customer Support, Transaction Performance
ee948741-4ed6-4dc2-8d02-0052f78903db	1	System stopped suddenly from working. Very unreliable system which fails when you need it.	2	2022-02-04	NEGATIVE	0.999710143	General Feedback
991bbad0-439e-4593-a182-6bac3a042ce6	1	I like the app	5	2022-02-03	POSITIVE	0.999439895	General Feedback
05233ee5-cc29-4836-ac05-8e3057d82fbb	1	It works perfectly	5	2022-02-03	POSITIVE	0.999862909	Bugs & Reliability
c2364709-b46a-4180-ba22-62e18dfbb5a4	1	It's easy to use and accessable	5	2022-02-03	POSITIVE	0.999351084	User Interface & Experience
45e491a9-51f9-4f8d-b8f8-b7665b5866dd	1	Users should have verified themselves without the need to go in branch.	3	2022-02-02	NEUTRAL	0.884556830	General Feedback
fef5ba34-5d2f-4e77-a145-333cb3870809	1	Well organized and easy access keep it up and also wish all the best......	5	2022-02-02	POSITIVE	0.999756157	Account Access Issues, Feature Requests, User Interface & Experience
2e402c59-5768-4396-8b21-779f098a68e5	1	It is nice have to ATM withdrawal on mobile banking	3	2022-02-01	NEUTRAL	0.874290645	General Feedback
50d960aa-33ba-4cbc-90af-3af6ce0b541c	1	Excllent app fast	5	2022-02-01	POSITIVE	0.966973364	Transaction Performance
44ce9668-828f-4738-b763-53f0c46a909b	1	It's very fast and reliable	4	2022-02-01	POSITIVE	0.999840260	Bugs & Reliability, Transaction Performance
8cb33d9f-6b0a-461d-b7b6-5c3daaf0b6b9	1	Very good up. Would be greate if there is a pdf download feature for transfers	4	2022-01-31	POSITIVE	0.999433935	Feature Requests, Transaction Performance
da938ecc-8662-48e0-968c-b2de86148aea	1	ባንክ ከሚያስተናግዱን የተሰላቹ ባንከሮች እጅግ በጣም በተሻለ መንገድ ይሄ አፕ አገልግሎት ይሰጣል።	5	2022-01-30	POSITIVE	0.951026678	General Feedback
699d6bfa-0149-4efa-a333-4e7c0ca1bafe	1	I really love it	5	2022-01-29	POSITIVE	0.999878883	General Feedback
46af13bb-743c-43b1-91de-c039088b4905	1	They don't deserve even half star The worst bank I ever use it.	1	2022-01-28	NEGATIVE	0.999717772	General Feedback
3006be7f-de56-4562-a1fd-1a6892211197	1	All good except the inability to rotate when rotates my phones.	4	2022-01-24	POSITIVE	0.994987011	General Feedback
161cef3e-900a-4146-b934-d34667ddafd6	1	CBE My# Best aps.	3	2022-01-21	NEUTRAL	0.999197900	General Feedback
01079e2b-4653-44f8-8369-5dafa894cbc6	1	I really loved this app. So much easy and make my transaction's and payment's easy. Great app 👍	4	2022-01-20	POSITIVE	0.999842763	Transaction Performance, User Interface & Experience
c13d5a1e-2ba6-4df9-97ef-0ab1dea079b0	1	It always need to go the branch that you open first time to solve errors.	1	2022-01-19	NEGATIVE	0.965089679	Bugs & Reliability
a31989f1-270f-4510-9a60-ff2378ad8691	1	Very easy to use.	5	2022-01-19	POSITIVE	0.999356329	User Interface & Experience
ec09d67b-30f1-4f50-9d21-e484d4b4c3cf	1	Woow!!it's very good app to done your job and it is help us any deposits‚withdrow and transfer details	5	2022-01-19	POSITIVE	0.998960853	Customer Support, Transaction Performance
e2944b8a-8dc1-4609-9e62-4877603b9a94	1	I too like the service of this app it is the special service for all	5	2022-01-18	POSITIVE	0.951181233	General Feedback
da7796b0-e302-4cee-bd70-57a8ccb8a0a3	1	Adil Ziyaad CBE mobile	1	2022-01-18	NEGATIVE	0.824793935	General Feedback
d051b4c8-d74c-41e2-93f9-19566b668cc5	1	Wenderfull I Love It!!!!!!!!	5	2022-01-17	POSITIVE	0.999879241	General Feedback
6028469c-5c00-4864-a85e-7e158387f160	1	It is good app and really user friendly , but it not possible to start service after the app is uninstalled or device phone is changed. So please make it easy for us, after once you set us the requirements in your office we should have to use it only by install and launch it. We do not have to visit the near by branch office every time for such silly businesses but important things.	3	2022-01-17	NEUTRAL	0.912058413	User Interface & Experience
ed4d240b-4165-4157-8cd3-fd18b719c176	1	Online banking services በጣም ጥሩ ነው። የATM services እንደ አማራጭ ጥሩ የሚባል ነው ነገር ግን በአብዛኛው ማለት ይቻላል አለም ባንክ እና አንፎ ቅርንጫፎች ያሉት ኤቲኤም ማሽኖች ገንዘብህን ይቆርጣሉ ግን ብር አይሰጥህም የተቆረጠውም ገንዘብ ወደ አካውንትህ ከሳምንታት ቦሀላ ይመለሳል፤ ሌላው አብዛኛው CBE Customer service ላይ የሚሰሩ ስራተኞች ፊትለፊት ላይ ቁጭ ይላሉ ነገር ግን ስራ አይሰሩም በጣም ጥቂቶቹ ለደንበኛ አገልግሎት ይሰጣሉ በጣም አሳፋሪው ነር ደግሞ ማናጀሮቻቸውም ብዙ ደንበኞች አግልግሎት ፈልገው ቆመው እርሱም መፍትሄ ከመስጠት ከጀርባ ሆኖ ያዮሃል ይህ ችግር በአብዛኛው የCBE ላይ አለ በተለይ አንፎ ቅርንጫፍ ላይ ይብሳል	3	2022-01-13	NEUTRAL	0.951166749	Customer Support
c40fac8c-ea8c-44d3-afd9-c34b09596740	1	Not working all of a sudden. I do not even know who to call to fix the bug. Disappointed as usual. I believe I need to visit the Branch to get the app fixed. Come on guys! It is not a car we are in 2022 for God sake. .	2	2022-01-13	NEGATIVE	0.999755800	Bugs & Reliability
2888781c-4139-45b5-9773-63c5199a6c37	1	Easy to use, but it is not functional always.	5	2022-01-11	POSITIVE	0.998682439	User Interface & Experience
1282c7c0-c9cb-450d-9e15-afa3d5b9238a	1	It is really amazing app, it makes everything easy ...	5	2022-01-08	POSITIVE	0.999878407	User Interface & Experience
fb21a2da-f1db-41d5-b00a-f28f0fdd1112	1	After updating The app says This Device is rooted. You can't use this app. But my phone is not rooted I don't think it works on Android 11. Please fix it	1	2022-01-07	NEGATIVE	0.997990251	Bugs & Reliability
fc52e886-aa26-41f7-a48f-7a59a627f330	1	Hmmm... I like it	5	2022-01-06	POSITIVE	0.999717653	General Feedback
86fcff7e-e830-444a-a0cd-ec34fedc9c06	1	I can't transfer money from other country .	1	2022-01-05	NEGATIVE	0.992939591	Transaction Performance
c1fa055a-c183-43eb-b25f-151abb3468a5	1	This is the best app l used till now .	1	2022-01-05	NEGATIVE	0.999593437	General Feedback
b3299ba3-7b50-4a43-aa88-6f6a4b8ff0dd	1	በጣም ሀሪፍ ደስስስስስ የሚል	5	2022-01-05	POSITIVE	0.861633003	General Feedback
0cf00468-ff1c-4609-9177-28bb9dbbc3b2	1	Good, only attachement download is not working	4	2022-01-04	POSITIVE	0.999199092	Bugs & Reliability
27cb470c-4230-45ce-bad9-9251190a1d56	1	Great App. I wonder why do I need CBE Birr when this app works pretty good and exceedingly convenient. There were bugs but it seems like they are now addressed.	4	2022-01-04	POSITIVE	0.864309728	Bugs & Reliability
f13cb958-5d86-4ce0-97be-2a54c0b6e7c3	1	Isn't there an IT professional in Ethiopia who can solve the problem of downloading the app? it's been 3 days since I've been trying to download the app. You're losing business, big time. I am so disappointed I don't even have words to express how frustrated I am. Please fix it.	1	2022-01-02	NEGATIVE	0.999706805	Bugs & Reliability
28af5161-3537-470f-8746-90dd92c613f5	1	This app best of the best	5	2021-12-31	POSITIVE	0.999542952	General Feedback
3c18e31d-0e11-4525-abd3-adbe5d83d2d5	1	It was working good from ET and outside the country but after recent update. No more working!	2	2021-12-30	NEGATIVE	0.994622827	Feature Requests
cedd01b3-42f3-4b34-9525-22963a184a8f	1	Nice to see more transactions BUT if u have lots of transaction it lags and becomes slow. May be an option to limit the transaction history to a reasonable amount or by date so it doesnt load all data.	5	2021-12-29	POSITIVE	0.998858213	App Speed & Performance, Feature Requests, Transaction Performance
e7e99ba7-dd9d-49f6-ae8d-eb2683958148	1	Wowww, With my own mistake i was saying it works only Werkamaw Bank. But now i got real point and it works for me also Finfine Bank. I am so happy. I am doing any thing what i want very easly from out of Ethiopia. simply it is really Fantastic very usefull. Thanks our CBE Banking system	5	2021-12-27	POSITIVE	0.999786556	Bugs & Reliability
9d9722b0-1df6-4017-8fc3-b3ca82121e9c	1	So Far so Good. Needs work on showing better transaction history.	5	2021-12-25	POSITIVE	0.869639814	Bugs & Reliability, Feature Requests, Transaction Performance
9b29b7c6-cced-4d30-b53c-cc13c9d729bb	1	It's a good app but I have two suggestions. It would be nice if it had an option to change between our own accounts. The option for downloading and sharing transactions that we have made does not work	4	2021-12-24	POSITIVE	0.999019384	Bugs & Reliability, Feature Requests, Transaction Performance
fcc67ea2-88d8-402c-8ded-51051978e936	1	Good user experience. Your backbend requires more work in terms of availability though.	5	2021-12-24	POSITIVE	0.639929473	Bugs & Reliability
8b134c1e-8b93-4e9b-99c4-a0fe4728eecc	1	Very useful and easy to use.	5	2021-12-22	POSITIVE	0.999833226	User Interface & Experience
8ffe2d7b-b4da-4cf0-a094-3588fd37e0cc	1	It is best to make your financial activities .and please do your best again .	5	2021-12-22	POSITIVE	0.977559805	General Feedback
defb95fc-5b99-45cd-a1d8-ec3d21546950	1	It is very simple to use and have almost all kinda online services. Am very satisfied with this app.	5	2021-12-21	POSITIVE	0.998495579	User Interface & Experience
6cb2c872-4e6f-40bd-bd81-67a0ff4849ea	1	It has improved much since I reviewed last time.	4	2021-12-20	POSITIVE	0.999788702	General Feedback
8be66a83-fe40-4558-bcbd-f60098469171	1	Very best app thanks CBE	5	2021-12-19	POSITIVE	0.999771655	General Feedback
88cf790e-fc79-46a6-99ca-3e1b8a991307	1	The app is working despite limited connectivity. I tried it from USA and satisfied. Keep it up to remain in the fierce competition!	4	2021-12-19	POSITIVE	0.995701730	General Feedback
e841b3cb-35ce-4d49-9985-5ee3e8a6fad7	1	It will be good to show the balance rather than only showing recent transaction.	1	2021-12-19	NEGATIVE	0.998633325	Transaction Performance
7f1f7651-4026-48e8-b0ea-d86f37b3daf2	1	የሚተማመኑበት ባንክ ወረፋ ዜሮ አድርጉ 951 የጥሪ ማዕከላችሁን ለማግኘት በፀሎትም አይሆንም	5	2021-12-18	POSITIVE	0.931095898	General Feedback
649d6383-95f8-448a-a2c9-6d82ce57a364	1	It's best app	5	2021-12-18	POSITIVE	0.999839783	General Feedback
6d0a26a1-0e95-4289-91e6-5beb4c6e57db	1	ምርጥ መተግበሪያ ነው ፣ ብዙ ነገር ነው ሚያቀለው። እንደ ቴሌ እና መብራት ኃይል ወርኃዊ የአገልግሎት ክፍያ ስንከፍል ሒሳብ ከሌለብን 0.0 ቢያሳይ ጥሩ ነበር።	5	2021-12-17	POSITIVE	0.969460845	General Feedback
ad4b2ee6-e292-4ffc-a0ad-65ddc17defa1	1	Great app, it like bank on my hand	5	2021-12-15	POSITIVE	0.999456227	General Feedback
4df86bfe-fbea-47a3-bfce-cb623d16ffcf	1	it is nice app,but it must have an option to add an other cbe account for multi account users	5	2021-12-14	POSITIVE	0.996906221	Feature Requests
90d15e43-ecf7-4d58-a5f6-0894ecf82a8c	1	Nice app well done	5	2021-12-14	POSITIVE	0.999827087	General Feedback
07ffbc2f-9f1d-4d21-8f00-c6ca49cca20d	1	This is very good app 👏 👌 👍	5	2021-12-13	POSITIVE	0.999865055	General Feedback
7fc8657d-fdba-4fd7-a4c0-57f3ed52cf65	1	It's a very good and helpful mobile banking app when compared with other local banking apps. Thank you!	5	2021-12-12	POSITIVE	0.999870181	Customer Support
1f525958-41c0-43a6-bfbe-fde71ec449db	1	Very nice app	5	2021-12-12	POSITIVE	0.999856234	General Feedback
f83d32f4-7158-4319-935c-c1737ec57f2b	1	Unable to connect, pls. Improve the system	5	2021-12-11	POSITIVE	0.999776423	Account Access Issues
cf108b9e-496d-4dfc-8c8c-2f43f5bee59a	1	Easy to use	5	2021-12-09	POSITIVE	0.998854280	User Interface & Experience
a4f9418f-22e3-4f78-8073-a90d3134e3c0	1	Good application but you have to incorporate Paperless bank statement obtaining method and should abolish going to the branch whenever changing a new device and new number for activation.	4	2021-12-07	POSITIVE	0.995718181	Feature Requests
199a27e9-0d80-43f1-bec7-1118545f3cec	1	Transfer to another bank is working just it shows error	1	2021-12-05	NEGATIVE	0.999577701	Bugs & Reliability, Transaction Performance
44e51583-1f9b-45ea-b0ee-8907bb8892fb	1	Better than all banks apps good work CBE	5	2021-12-04	POSITIVE	0.999578059	Bugs & Reliability
384f5eb0-baec-4da0-b743-4171572d25e2	1	Doesn't work. Horrible.	1	2021-12-03	NEGATIVE	0.999795973	Bugs & Reliability
01828a12-ed39-4c5c-8ce2-4bc3f9b1c080	1	Clear and very easy	5	2021-12-02	POSITIVE	0.999826372	User Interface & Experience
395d4bc9-e52f-4135-bf85-b2a4474ffbe2	1	The worst app.... Made me think I was robbed. Please fix or make an update	1	2021-12-01	NEGATIVE	0.999802172	Bugs & Reliability, Feature Requests
8d03c878-3378-4021-b1b6-ed3776441a36	1	Very Good to use	5	2021-11-29	POSITIVE	0.999869466	General Feedback
5b29a3ab-9bf9-4dae-abde-6ae9780de9ad	1	Not working properly	2	2021-11-25	NEGATIVE	0.999784768	Bugs & Reliability
9a35b300-09ff-412c-a365-761e8c422197	1	It's just fine	2	2021-11-25	NEGATIVE	0.999865294	General Feedback
c6b38521-f9b2-41f6-aba8-955940fa7520	1	It is amazing app no more comment	5	2021-11-24	POSITIVE	0.999647141	General Feedback
3efd95df-335f-4ed7-8e43-846f955f9079	1	Good keep it up	5	2021-11-23	POSITIVE	0.999856830	General Feedback
87a60304-4b78-4776-880b-db6964a80c8b	1	Its not working on my mobile	1	2021-11-23	NEGATIVE	0.999388337	Bugs & Reliability
94730c6b-ca7d-4e3d-810f-13acb9183858	1	Best app. I love the simplicity. Keep up the good job.	5	2021-11-22	POSITIVE	0.999872684	General Feedback
4d2d5691-5c09-4302-98b7-f76a1361db6e	1	Easy to use but can not update it?	5	2021-11-21	POSITIVE	0.997651875	Feature Requests, User Interface & Experience
b3f15196-432e-4aad-b6d5-6a3eb7a82aa0	1	I think it's best for us..for the biggest transaction banks..but update it and modernizing throughout technologies.	4	2021-11-20	POSITIVE	0.973979294	Feature Requests, Transaction Performance
ab320d9c-14d9-4cff-b901-04b81af3e016	1	When the connection is good the app also very good	4	2021-11-19	POSITIVE	0.999755800	General Feedback
194eed46-1daa-4752-9e58-34aecee963d1	1	It has been improved tremendosly. I am now comfortable to use it anytime I want. Good job CBE team.	5	2021-11-18	POSITIVE	0.999527335	General Feedback
a310c46c-7213-4803-90e6-5d1709c5e46e	1	It is best app it remove waste of time.	1	2021-11-16	NEGATIVE	0.998132646	General Feedback
dedfdc15-eb90-44df-9bd8-c3b1722f5bed	1	Fast and secure service, exchange money everywhere	5	2021-11-15	POSITIVE	0.970360577	Security Concerns, Transaction Performance
6e0abb61-6809-440e-b9b2-8ca0f2a18da7	1	Its nice app more easy to use it. It shown only Recent history transaction. Please all transaction history.To summarize my transaction with reason. And add traffic penality button. Generally its nice app	5	2021-11-13	POSITIVE	0.990934670	Feature Requests, Transaction Performance, User Interface & Experience
733694f6-8f16-4d09-af17-fef43929ed7c	1	It's not showing the second account and takes long on loading	2	2021-11-12	NEGATIVE	0.999613106	App Speed & Performance
fad22ff0-6f14-4115-9f3a-20663020f4be	1	Yes very good to be with	5	2021-11-08	POSITIVE	0.999865413	General Feedback
5a3adf4f-8cba-4283-a1c8-89b8136fc0d5	1	Great app, fast transactions and seemless experience.	5	2021-11-08	POSITIVE	0.956361234	Transaction Performance
d9c9f4d4-b0a6-4d67-b27e-004080be9505	1	ብዙው ነገሩ ጥሩ ነው። ካየኇቸው ችግሮች መካከል አፕሊኬሽኑ ተዘግቶ ከተወጣ በኇላ ሌላ ነገር ሌላ ቦታ እየተጠቀምን እያለ የን.ባ አፕሊኬሽን ድንገት ራሱ በጣልቃ መጥቶ ፓስወርድ ማስገቢያውን ቦታ ያቀርባል። ሌላው ነገር ፤ የተደረገ የገንዘብ እንቅስቃሴን ለማሳየት መዘግየት ነው። ይሄኛው የባንኩ ሲስተም ችግር ይሁን የአፕሊኬሽኑ ግን አላውቅም።	4	2021-11-07	POSITIVE	0.965765476	General Feedback
46ffc663-04f1-4b20-9225-406610fdc5ec	1	Best app from all Ethiopia banks	5	2021-11-07	POSITIVE	0.999663711	General Feedback
cda6606e-73e8-4b41-8ace-27c1cb2e9121	1	Its a nice app and banking services. I have two questions&/ suggestions, why the beneficiary lists are sometimes not available/ not working? It will better if you allowed to see more than one page transaction statement.	4	2021-11-06	POSITIVE	0.983235478	Bugs & Reliability, Feature Requests, Transaction Performance
92214dfb-c8d4-41c4-b71c-5c599c5ed20c	1	Very nice app, it makes my financial work so easy but i have one problem, that is the app RELAUNCHES itself after I closed it. if you guys could get rid of this it would be a lot better. Thanks!	4	2021-11-05	POSITIVE	0.963070095	Bugs & Reliability, User Interface & Experience
358b047a-17a8-489b-8997-08101650849d	1	Love it, keep up my country	5	2021-11-05	POSITIVE	0.999870896	General Feedback
4dbf9a94-0a05-4461-93db-9fb1a648f5aa	1	I love it.it makes payment easier for me.as i don't like going to banks and wait and waste my time,i found this app very helpful and important . 5⭐	5	2021-11-05	POSITIVE	0.999267519	Customer Support, Transaction Performance
9c9bc8a4-0961-432b-9a23-e504004e279d	1	It's very nice to use this app and no reason to be on the line.	5	2021-11-04	POSITIVE	0.992783427	General Feedback
b237c3b0-b643-48f7-b8ff-2bed22b01595	1	ከፍተኛ እግልትን የሚቀንስ አፖ ነው good app	5	2021-11-04	POSITIVE	0.999084353	General Feedback
a482ba09-34ac-4e5f-8ca3-f439b114ae64	1	Very convenient to sign in and out as well as mobile service is perfect.	5	2021-11-03	POSITIVE	0.999686956	General Feedback
94e8ed41-40fe-4d07-8692-a1191fc1bc72	1	Commercial Bank of Ethipia	5	2021-11-02	POSITIVE	0.767291248	General Feedback
0233113a-764e-42df-8a30-44711c285358	1	Good but I couldn't receive verification key	5	2021-11-01	POSITIVE	0.931218505	Account Access Issues, Transaction Performance
26babf74-8aee-4369-932d-f70916e421db	1	The app is designed well however some actions require assistance and when I called ur bank for assistance, I guess no one cares enough to answer	1	2021-11-01	NEGATIVE	0.976334214	General Feedback
a54ab173-a48b-45ef-9ed3-9eade27cdecd	1	951 call center was not unable to answer the call idlee guys.... My cbe application was stoped working the last 2weeks....please give us the reason	3	2021-11-01	NEUTRAL	0.999543488	Account Access Issues, Customer Support
9b48b9ad-dbb7-423d-8e8f-55767c9c1596	1	The best app in Ethiopia	5	2021-10-30	POSITIVE	0.999797881	General Feedback
474823d4-93c5-4949-a6d3-c4140e3a6660	1	Very simple and easy to use I loved it	5	2021-10-29	POSITIVE	0.999858379	User Interface & Experience
145e6385-ef64-47fe-b21b-63e16aaee0ee	1	Very easy to use	5	2021-10-29	POSITIVE	0.999142289	User Interface & Experience
5fae6ba9-9182-4aed-95b2-e73d6930189c	1	Its really fantastic	5	2021-10-27	POSITIVE	0.999874234	General Feedback
44cc3975-91b9-4c21-96a9-e6b5552dddf6	1	Can not check my account! All I see is a blank screen! What is the problem?It is not user friendĺy!I will have to take my money & try other banķs.This is a waste of time!!!	1	2021-10-27	NEGATIVE	0.999811828	Bugs & Reliability
dac0897d-3dde-4945-9422-9e7d1a1db05a	1	Good God my business	5	2021-10-25	POSITIVE	0.998342872	General Feedback
afbee011-0ce5-4af5-aee3-c169501f64a7	1	Transcation information available only for a very short period of time. Unstable when used for two accounts. It sometimes doesn't show me my second account.	2	2021-10-24	NEGATIVE	0.998755932	General Feedback
c438b21d-ff55-4e75-bddc-2e02fd6e98ee	1	So easy and clear to use the app	5	2021-10-22	POSITIVE	0.996784329	User Interface & Experience
ae4f76c7-eba3-4d61-9d55-8815c6f978c7	1	Very useful, but Please add daily foreign exchange rate. Thank you.	5	2021-10-21	POSITIVE	0.999610960	Feature Requests
2670ef00-c661-4bbf-8e99-2245fd9125a5	1	Great, please include bank statement options.	5	2021-10-21	POSITIVE	0.999587715	Feature Requests
ba28b64f-44b0-46eb-a6fe-e5eb95a1d8b7	1	best app keep the update for new features	4	2021-10-21	POSITIVE	0.998214841	Feature Requests
8ad128c9-484a-4977-81ff-78b3636053ef	1	The bank always rely on CBE.	5	2021-10-18	POSITIVE	0.812767863	General Feedback
f574f4b3-0ffc-4f70-a0e1-350e201c1274	1	Baga nagayan asiin nuu ga'e	1	2021-10-17	NEGATIVE	0.970013082	General Feedback
cf55cdb1-353e-4583-9752-376a18e2fd7a	1	Ilike this app because it is fast and easy	5	2021-10-16	POSITIVE	0.997927189	Transaction Performance, User Interface & Experience
5f9304d1-2655-4f44-b6e5-accf582668c3	1	Best app It's user friendly	5	2021-10-16	POSITIVE	0.999465764	User Interface & Experience
4e68c726-1472-4953-a88d-2647644da21d	1	SAMSUNG Galaxy A21s	5	2021-10-15	POSITIVE	0.809844077	General Feedback
538c3be5-30d7-412a-bb6e-f512314e857d	1	It is a good app but sometimes very poor and i hate your rules about transfering birr only 5 times a week... We have more than 5 problem per week and it is shamefull.	3	2021-10-15	NEUTRAL	0.997039855	Bugs & Reliability
da560d79-26c4-429e-a2c2-07222fd79b0c	1	Nice app but sometimes it deduct two times when i recharge mobile card and Dstv payment	5	2021-10-15	POSITIVE	0.979146123	Transaction Performance
4e6ddf70-0624-48f1-a3fe-645faa56b230	1	Easy and fast but some time it show us error but the trasaction is alrady sent and the error mislead us and we do the trx again. This affect our acount twice	5	2021-10-15	POSITIVE	0.993532896	Bugs & Reliability, Transaction Performance, User Interface & Experience
664fcdcd-285c-429c-bf90-964e96101349	1	Very slow and worst doesn't work good 🙃	1	2021-10-14	NEGATIVE	0.999808848	App Speed & Performance, Bugs & Reliability, Transaction Performance
930cd7bf-7cdf-48a2-ad4b-a588ec750a95	1	What a nice and simple app 😊	5	2021-10-14	POSITIVE	0.999829531	User Interface & Experience
49f3b46c-6b7d-43e5-ab49-4f58f2860633	1	Easy to use	5	2021-10-14	POSITIVE	0.998854280	User Interface & Experience
ca124919-ad05-487e-b7b4-1a1fb27001a4	1	100% perfect number one chosen bank	5	2021-08-19	POSITIVE	0.999791563	General Feedback
25513166-320a-4379-8a9a-1aa4a667e95c	1	Very unsafe! The password is stored in the phone, which is very unsafe. And once you entered the password, there is no timeout nor ask for password while making transaction. Therefore, if you have stolen your phone, you may end-up loosing your money	1	2021-10-13	NEGATIVE	0.999199688	Account Access Issues, Transaction Performance
3e2be9bb-974a-467e-a9c8-c2712e2b075a	1	በሚፈለገው ፍጥነትና ጥራት ለመጠቀም የኔትወርክ ወይም የዳታ ዉስንነት አለበት ይህ ችግር ቢቀረፍ እላለሁኝ በተረፈ ምርጥ አፕ ነው በርቱልን።	4	2021-10-13	POSITIVE	0.959501386	General Feedback
ec019c7e-d8cc-4bb6-b370-237efdf61e0d	1	Thak you for your support specaliy who is leaving on bord. Easy access and outstanding. I would like ro sujest all who was leving on bord like me use this up. Blessings,	5	2021-10-12	POSITIVE	0.999718606	Account Access Issues, Customer Support, User Interface & Experience
7e13f4d8-2c55-4adf-b9eb-0680baa0dcac	1	No working perfectly	1	2021-10-11	NEGATIVE	0.999679208	General Feedback
75c186e2-5d20-4c07-ab82-4ae1f5987910	1	The application is good but sometimes it doesn't respond my issues ie: Transfer,. In addition to this the application don't show my balance instade it only shows transaction history. If possible it's better if z app were able to show z exact balance sheet and fix a problem of not responding, if so I will rate z app ***** by adding z remaining 2 ** 10 Q.	3	2021-10-11	NEUTRAL	0.994474828	Bugs & Reliability, Transaction Performance
4861a32b-3d17-4bb4-b87e-1ec9db720221	1	Great app but it would be nice if it allow cardless transaction On ATM like abyssinya bank has on its mobile app.	4	2021-10-10	POSITIVE	0.972039461	Transaction Performance
9746d2ac-2743-40d9-95bd-dc8f76f9d1c3	1	I wrote that 15 days ago i think. It's better now for the most part. Also please stop showing toasts! There is no way to stop it from showing repeatedly	5	2021-10-09	POSITIVE	0.997546613	General Feedback
f97ed26f-61f8-455f-9253-5617bc395b57	1	Interbank transaction is not functional.	3	2021-10-08	NEUTRAL	0.999768198	Transaction Performance
21e54a16-52c1-4539-a201-9bc1a6674e15	1	I love 💕 it's easy and fast	5	2021-10-08	POSITIVE	0.999881029	Transaction Performance, User Interface & Experience
d948af9f-a20e-40b0-9db9-c28a62071866	1	Good work at all	5	2021-10-07	POSITIVE	0.999854565	Bugs & Reliability
c1d0f40b-a071-4e6e-beb2-c58266f1dde5	1	Very nice app 👌	5	2021-10-06	POSITIVE	0.999856234	General Feedback
9da3b985-31f8-4beb-8cd0-fe2991de8040	1	So simplified and easy to use. I suggest you all to download and use it ASAP.	5	2021-10-06	POSITIVE	0.921404839	User Interface & Experience
c2e0e1d6-ea8f-4de9-8d99-0c4210c10057	1	I looke best application to work in the future	2	2021-10-05	NEGATIVE	0.992123544	Bugs & Reliability
78589050-b47e-4b6e-8701-52bb8f20a56e	1	Can you update please..the utility service does not work	3	2021-09-30	NEUTRAL	0.999791682	Bugs & Reliability, Feature Requests
ddb71d18-78c9-4231-870c-071f1ef778ea	1	What is the verification code ? And how to get it? why?	4	2021-09-30	POSITIVE	0.999403596	Account Access Issues
4a4275c9-e607-48df-986b-e8f1fe652eab	1	It is good.	5	2021-09-29	POSITIVE	0.999852538	General Feedback
8168f447-da85-44d6-915e-169b434ecf3c	1	That so nice	5	2021-09-28	POSITIVE	0.999859333	General Feedback
6d95439b-e805-4d3c-8264-4d7fdd4fe7c1	1	I like it very much..is secured and easy to use..we can easily make a transaction with accounts of the same bank..	4	2021-09-28	POSITIVE	0.999732792	Transaction Performance, User Interface & Experience
3d3ca937-27d7-48cf-b004-bc362b572461	1	Enable to read my accounts fast	5	2021-09-27	POSITIVE	0.997123420	Transaction Performance
ebdece63-2793-4840-80c3-7b5bb983a361	1	I love this app. It's simple to use and syncs fast. The only issue I had was the balance shows only what's on the ledger, there is no way to tell what the actual balance is. I learn about the difference between the two balance types the hard way on an ATM machine. I would love to see that fixed in your next update.	5	2021-09-25	POSITIVE	0.997113943	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
fe5e5014-c2f9-4afe-ae67-a8dc769082c5	1	Very easy to use	5	2021-09-24	POSITIVE	0.999142289	User Interface & Experience
265745f4-1477-4949-a5df-cd35aaad8532	1	Very nice app but please incorporate exchange rate and ATM locater	4	2021-09-23	POSITIVE	0.967708111	General Feedback
158f646e-e2d7-4477-ae3c-0e39daa5e5e6	1	very well apps thanks	5	2021-09-22	POSITIVE	0.999846816	General Feedback
95821b63-7bc0-4246-b588-50357e3701ac	1	It is good app before but now it's not working properly	2	2021-09-21	NEGATIVE	0.998771131	Bugs & Reliability
dcbe4f42-49dc-4624-954b-ba901d42b681	1	I am trying to use now	5	2021-09-21	POSITIVE	0.987883627	General Feedback
d1cbd4f1-17ca-471d-9dda-fd9ffc08f9c9	1	It is a a much better App than other Private Banks. But you have to include the following options; 1. The Bank Statement should be Unlimited. It should allow to see all Transactions by Tracing Back. No Need to Limit it with only one Page Transaction (May be 10Page). 2. You have to Work on transferring Money to other Banks too. You can ask additional payment for it. But the Service will be Essential for Us.	5	2021-09-21	POSITIVE	0.960894287	Bugs & Reliability, Feature Requests, Transaction Performance
23bc4c7f-6d73-4c3a-94d9-0053be3b99fa	1	Keep it up	5	2021-09-16	POSITIVE	0.999809802	General Feedback
b24062f8-0018-44f3-ab0d-57d7c04eab6a	1	It's fast and reliable. You can make transaction from anywhere in the world.	5	2021-09-16	POSITIVE	0.999747574	Bugs & Reliability, Transaction Performance
1eb70be7-5194-4d59-ba79-f384d17fb5b8	1	It's very nice more better from this .	5	2021-09-15	POSITIVE	0.998565853	General Feedback
7ed7b42c-e976-454d-9651-5be2cc9f4fb6	1	It works very well. I have two issues though 1/ it is not possible to transfer accounts in other Banks. 2/ the exoress money sending function dies not work as neither the recipient nor the sender get the secret number but the money will alrwady be sent. I had to go throgh a very lengthy process to get the money back with the transfer fee already deducted. In the end I lost three days plus the transfer fee for teying to send money fast. Other than these issues it does the rest of the job well.	3	2021-09-15	NEUTRAL	0.982461870	Bugs & Reliability, Transaction Performance
485fe2be-e4bb-42c2-8475-73b76354db67	1	The app doesn't have more option. I expected more and convinient features than other local banks mobile app however i found it poor. Pls add option where clients can check statment back dated, ....etc u need to advace the security like disabling screen shots from mobile device. I recommend you to bench mark Wells Fargo app.	1	2021-09-14	NEGATIVE	0.998891890	Feature Requests, Security Concerns
9bbee360-ad07-45a8-a655-e002e66225e7	1	Good But Not perfect	4	2021-09-14	POSITIVE	0.556306183	General Feedback
6c5f43c4-9890-4998-96e5-426db702906e	1	By far the most crucial and progressivly growing financial app. Keep up the good work.from an end user stand point It would also make sense to include push notification for each transaction as well.	4	2021-09-13	POSITIVE	0.999105871	Bugs & Reliability, Feature Requests, Transaction Performance
00a9d099-948d-4305-854b-f8b64823d300	1	Keep good work	5	2021-09-12	POSITIVE	0.999866605	Bugs & Reliability
cc8cf577-cb44-427b-bb20-d1758d0fb5d0	1	Easy and fast	5	2021-09-11	POSITIVE	0.999558389	Transaction Performance, User Interface & Experience
4d32b302-8284-4f41-a6ef-dc7881986548	1	Nice and smooth to use.	5	2021-09-10	POSITIVE	0.999864936	General Feedback
3b38e2a8-43ac-452c-b500-9a07c0679dd1	1	እጅግ በጣም ጥሩ አፕሊኬሽን ነው	5	2021-09-10	POSITIVE	0.883213103	General Feedback
6d386919-1571-4931-b12d-43709ee69e21	1	Not able to get transaction list, it has very few options from what other Banks mobile app offer. It needs improvement.	2	2021-09-10	NEGATIVE	0.999598920	Feature Requests, Transaction Performance
d91265dc-37fe-4ab1-a04e-ccf0b36f32d5	1	Root betederege mobile lay ayseram	3	2021-09-07	NEUTRAL	0.998482287	General Feedback
ff3a716e-3976-4512-bc4f-e2a301b1acfe	1	Good. Saves time!	5	2021-09-07	POSITIVE	0.999833226	General Feedback
36ecbae9-9059-4617-adcf-726ed39c3e63	1	Easy, versatile and secure financial transaction mobile app in Ethiopia.	5	2021-09-07	POSITIVE	0.998716712	Security Concerns, Transaction Performance, User Interface & Experience
9c6ada0b-dcc1-4c90-9083-30088d826ad1	1	Its very slow annoying	1	2021-09-07	NEGATIVE	0.999794543	App Speed & Performance, Transaction Performance
293aa06e-3dc0-4d14-839e-24649aad4191	1	Simple and easy to use	5	2021-09-04	POSITIVE	0.999731839	User Interface & Experience
b56a497e-e3c2-452c-ae85-2a1d8f2f5463	1	Very nice app.	5	2021-09-03	POSITIVE	0.999861717	General Feedback
af380930-069d-4e07-9d40-1282edbd035d	1	I am spending too much time because it gets stuck frequently. I would rather go to pay at the bank than waste my time with this app. Bad app	1	2021-09-03	NEGATIVE	0.999801934	Transaction Performance
2f42c03f-1a02-4963-adc2-9ac46d21eba2	1	It's good app	4	2021-09-03	POSITIVE	0.999868989	General Feedback
92d8200a-895b-4df4-ae00-f5d975ed7a88	1	Can developers present options to see transactions details like locations ( city ) or CBE branches where transactions are initiated or identity who wired transfers rather than simple generic term "transfer" ? This option helps to track cash in flows without going to nearby CBE branch to learn details of a transaction. Apart from this, the app is great and make life easy.	4	2021-09-03	POSITIVE	0.999352157	Customer Support, Feature Requests, Transaction Performance, User Interface & Experience
9bcee423-6536-4fdd-b296-07f822beb60b	1	Unable to save transaction message Please solve asap	4	2021-09-03	POSITIVE	0.999522567	Account Access Issues, Transaction Performance
fdf94fc1-5bfe-4b23-8683-3f3d25766995	1	when are you going to change the CBE Logo	3	2021-09-02	NEUTRAL	0.994241834	General Feedback
f8107efa-afd5-4d5b-8838-b489307728ed	1	Echange rate is not added and all recoginzed banks not included in bank to bank transfer	4	2021-09-01	POSITIVE	0.998741925	Transaction Performance
59953902-ed77-479a-b7a8-474cae733126	1	በጣም አሪፍ መተግበሪያ ነው👏👏👏	5	2021-09-01	POSITIVE	0.861633003	General Feedback
3eb4b2d1-41df-4d5c-8c41-242abbf73d93	1	The best and active app ever	5	2021-08-31	POSITIVE	0.999856234	General Feedback
17a3fc54-ba3b-478b-b496-a93f10fc6142	1	Best, application for use and time saving	5	2021-08-31	POSITIVE	0.999474823	General Feedback
61061186-1067-42e4-adbd-8b8c9e3b2c15	1	Is best app in ethiopia there is avaliable for next time	1	2021-08-31	NEGATIVE	0.997819543	General Feedback
a96f97ce-ef05-4914-a4d7-18c551b286fd	1	Easily manege the money	4	2021-08-31	POSITIVE	0.997051239	General Feedback
3f2761b0-c20c-460b-99be-1d0da40bacad	1	Nice app it's help life runs easly and facilititet busines fast	5	2021-08-31	POSITIVE	0.990274251	Customer Support, Transaction Performance
a03a7344-2841-4673-8ef6-4822031905bb	1	fast & perfect with a good new feuture. thanks & keep it up🙏	5	2021-08-30	POSITIVE	0.999881029	Transaction Performance
94253dbb-96ef-4db2-88be-052dcf3961f1	1	Why it's not found on App Gallery for Huawei users?	2	2021-08-27	NEGATIVE	0.999510765	General Feedback
99ac2fe7-105c-4581-8d74-1524f05f0cbd	1	Poor update, not exactly show the figure on the time!!	1	2021-08-27	NEGATIVE	0.999776304	Feature Requests
aeeca21d-c4d2-451f-b39e-ed4242f86845	1	I couldn't synchronize my current balance.	3	2021-08-26	NEUTRAL	0.999645710	General Feedback
a8a7499b-5231-4199-9a31-6df0ee01b3cd	1	Best mobile banking	5	2021-08-26	POSITIVE	0.999730527	General Feedback
003543e4-7576-491f-bb95-62056a3bd189	1	Freindly app, suitable for many clients.sometimes, synchronization would not be possibe.	3	2021-08-26	NEUTRAL	0.952654719	General Feedback
ea488e22-f61b-4753-b018-857dfcc6728b	1	Fast ,best and saves time.	5	2021-08-25	POSITIVE	0.999660134	Transaction Performance
d3a35af0-4826-4407-8129-967681e22075	1	Perfect & Reliable Service	5	2021-08-25	POSITIVE	0.999860287	Bugs & Reliability
70b101a0-b095-4c7b-b288-9de0a956f0a8	1	Couldn't see any thing.even i can't see my balance.	1	2021-08-25	NEGATIVE	0.998833716	General Feedback
094c3cd2-07a9-48ce-ad88-1384d23adc17	1	Very user friendly App	5	2021-08-24	POSITIVE	0.996707559	User Interface & Experience
9b993599-283e-417d-a6ed-188f9caee05c	1	This one is better than the previous versions. But am unable to send to benficiaries, it was working on the previous versions. While working on the other features please work on this failure too. Thank u!	4	2021-08-24	POSITIVE	0.995913804	Account Access Issues, Bugs & Reliability, Feature Requests, Transaction Performance
bbfe750a-634a-4710-8cc9-000d7f423fe2	1	Was so nice, days ago. But since last week I couldn't transfer and use it, properly. Would you forwarded me any option, please ? Thank you!	2	2021-08-23	NEGATIVE	0.716588378	Feature Requests, Transaction Performance
43d40957-c77e-4e3a-9232-7ee669b7bceb	1	Please add the ability to view all transaction history, and pressing back on sub pages should not display logout confirmation. Plus, self registration should be a thing	3	2021-08-21	NEUTRAL	0.995211303	Feature Requests, Transaction Performance
620e5406-3204-4d64-aaad-c892c51c89d4	1	Exceptionally super boring to use.	1	2021-08-20	NEGATIVE	0.999679089	General Feedback
2a122d27-294f-4479-ab36-6cba3b45bbf7	1	As much as possible good job save and share of transaction not work yet.	4	2021-08-20	POSITIVE	0.966060638	Bugs & Reliability, Transaction Performance
28228c81-3b13-4d3e-bc92-87b72387ac6e	1	It's Child apps Design	1	2021-08-19	NEGATIVE	0.954689682	User Interface & Experience
27747165-256c-4ded-8183-b2db6244099d	1	Horrible can't sync my account	1	2021-08-18	NEGATIVE	0.999635339	General Feedback
5a230aa3-9f2d-4a46-80a1-845d14ec3c05	1	It's amazing app easy to use	5	2021-08-18	POSITIVE	0.999803007	User Interface & Experience
4d200cec-be72-48ba-be29-7d789d6225b4	1	this app is not functional for some phones	1	2021-08-17	NEGATIVE	0.999698400	General Feedback
b0daaae8-1b8a-4e8e-9d17-8b5baa11e36b	1	This app is not compatible for Samsung not	5	2021-08-17	POSITIVE	0.999714196	General Feedback
70d4454c-b924-45fd-a01e-0b47212012f2	1	Not working at all!	1	2021-08-16	NEGATIVE	0.999786198	Bugs & Reliability
386047d4-73c2-474e-aba1-250a3e859f1c	1	How can I get verification Code lol🤔?	3	2021-08-16	NEUTRAL	0.999212742	Account Access Issues
0064dfbd-64d5-44d6-9797-84d6eacf9775	1	Very efficient, good, very good	5	2021-08-14	POSITIVE	0.999868751	App Speed & Performance
e5aa0ce2-820b-4b72-a858-dc1f10b0e466	1	I meed updated	5	2021-08-14	POSITIVE	0.943291366	General Feedback
8b7e824a-3e66-4e1b-9cee-5223bdeef443	1	The last update is not working properly, please fix the bug fast	2	2021-08-13	NEGATIVE	0.999787509	Bugs & Reliability, Feature Requests, Transaction Performance
dc0ec9c7-2456-4945-8f18-b32c0fa81291	1	I uninstalled the app but Now I can't download it	1	2021-08-12	NEGATIVE	0.993649065	General Feedback
9760d41b-a57f-4f0a-a7d6-2ee61ac5df5e	1	Good app...It would be good if Summary of transactions also incorporated .	4	2021-08-12	POSITIVE	0.998823702	Transaction Performance
864abf4f-5861-4a69-85a0-18ea6b8a7b93	1	Genet zewde77@yahoo .come	1	2021-08-11	NEGATIVE	0.505600154	General Feedback
59697350-ed2e-4f45-a159-6c7e4144330e	1	Doesn't work for Samsung A30s!	1	2021-08-11	NEGATIVE	0.999205053	Bugs & Reliability
d27a783a-e7e1-473f-b628-aa723fd8cb58	1	very limited option we could see the previous transactions.	2	2021-08-09	NEGATIVE	0.998604476	Feature Requests, Transaction Performance
b464403b-656f-4810-8163-7fecd6931c31	1	i'm happy this cbe service	5	2021-08-09	POSITIVE	0.999846458	General Feedback
31cba8a6-4da3-429e-8215-43eb41e54058	1	Ir is nice try it	5	2021-08-08	POSITIVE	0.999176323	General Feedback
7151fc46-490d-4047-ae13-be21ad0f2456	1	How it can be explained for those mass customer's	5	2021-08-07	POSITIVE	0.968008399	General Feedback
07c3d41e-b76e-47a3-9390-11cfdf10c0e5	1	Good Interface and user frendly app great work cbe👍🏻	4	2021-08-05	POSITIVE	0.999662042	Bugs & Reliability, User Interface & Experience
af2de5f8-9945-4868-8a5f-6d8434b8f8f6	1	It is not functional after installing error message says "this device is rooted.you can't use this app." i think it is not compatible for android 10	2	2021-08-04	NEGATIVE	0.999726474	Bugs & Reliability
2c3ab83e-8d37-4bb0-92e8-bfb4368be387	1	App's literally broken after the last update. The new interface was great but unusable. I sent E-mail to to Dev. team but no response or acknowledgment of the issue so far. Please resolve it ASAP.	1	2021-08-03	NEGATIVE	0.998892963	Bugs & Reliability, Customer Support, Feature Requests, User Interface & Experience
f6fcf268-1d19-44ba-bc2c-98322022ebdc	1	Good job, but sometimes even with good connection it can't sync.	3	2021-08-02	NEUTRAL	0.986704707	General Feedback
587e2957-42bb-48e5-8cab-eb2e21d2cf1f	1	This is a very good app that every customer should be able to be a bank for him/her self👍👍	5	2021-07-30	POSITIVE	0.999528289	General Feedback
f7f5d24f-c20b-40a7-82f3-f0946ae9906e	1	አማርኛ ምርጫ ላይ እንግሊዘኛ ቃላት ምን ማለት ነው? አሁን ወራቶች መጠረያ ቃል የለንምና ነው ? ያለንን በትክክል ተጠቀሙበት ቋንቋ መግባቢያ እንጂ እውቀት አይደለም!! ስለዚህ አትቀላቅሉ? ሬት አፕ ምን ማለት ነው? ሁለተኛው አስተያየት ያለኝ መተግበርያው ብዙ የሚጎድሉት ነገሮች አሉት። ምሳሌ የሚስጥር ቁጥር አገባቡ ቀላል ነው። ብር ማስተላለፍ ድጋሚ የተለየ ቁጥርና ቢኖረውና ይህም ተቀያያሪ ቢሆን ብዙ አለ ። ለማንኛውም እስኪ አንድ የኮርያ ባንክ ልጠቁምና እዩት። keb hana bank ከዚህ ብዙ ትማራላችው ብዬ አስባለው።	2	2021-07-30	NEGATIVE	0.980201066	General Feedback
cbc2bd86-d0e7-447a-b0fa-b2ae0f7dc47f	1	Very convenient, easy to use. The only reason that made me be a CBE customer.	5	2021-07-30	POSITIVE	0.997968256	User Interface & Experience
2e2d8eb6-2917-4b65-86b4-0c65d045e135	1	በጣም ቆንጆ አፕ ነው	5	2021-07-29	POSITIVE	0.861633003	General Feedback
045a0e4e-57e2-428c-af48-ae7cb6daf50f	1	This is very helpful and functional app. Recently I am facing issues on transfer to other banks. Please address it	5	2021-07-27	POSITIVE	0.998760700	Bugs & Reliability, Customer Support, Transaction Performance
6f1b363d-0c26-46f7-8973-5afccd99174e	1	Good app but sometimes its down	3	2021-07-25	NEUTRAL	0.957410216	General Feedback
322b5930-5d78-496f-a9c5-9ad22f1512ee	1	Awesome app keep up the good work 👏	5	2021-07-22	POSITIVE	0.999879837	Bugs & Reliability
e07de06b-0504-4ac1-a246-81114b556a0d	1	Best of the best	4	2021-07-19	POSITIVE	0.999840140	General Feedback
e087f27d-9ed6-4127-b7ee-16bcea011647	1	this is best but add traffic fine app.	4	2021-07-17	POSITIVE	0.998920679	Feature Requests
bad3eacf-f135-4f8d-952f-b152003ccfd8	1	The application makes my day to day activities very easy and comfotable.	5	2021-07-17	POSITIVE	0.985960484	User Interface & Experience
6e3b018f-1933-4333-b1b9-d1ca9a3a1651	1	My country big bank	5	2021-07-16	POSITIVE	0.982024789	General Feedback
4749cd20-64ff-4cc3-bc0a-2f12fac24c82	1	ለአጠቃቀም ምቹ እና ግልፅ አፕልኬሽን ነው። ከኤቲኤም ሲስተም እጅጉን ይሻላል።	4	2021-07-16	POSITIVE	0.948979199	General Feedback
11dabdaf-573d-4152-9ad5-e2f1af1330ea	1	Arif New Temechtognal	5	2021-07-15	POSITIVE	0.888131976	General Feedback
0df4b50a-2dbf-424b-ad02-e8bea7becd08	1	I like this app	1	2021-07-15	NEGATIVE	0.999651670	General Feedback
a5e1a1a2-7c8b-4821-9a60-36641346dbaa	1	It's good, but why have a limit of 5 on weekly transfer.	4	2021-07-15	POSITIVE	0.736551046	Transaction Performance
cdb8fd0a-d2a6-425e-a38d-b1f7b89a317b	1	It isMore comfortable application!	1	2021-07-14	NEGATIVE	0.999387026	General Feedback
9a0cdda5-39d5-41fb-8b36-37761fe9c381	1	Great app for an Ethiopian perspective	5	2021-07-13	POSITIVE	0.999599040	General Feedback
aede3c2f-b9f0-4879-a95c-8557630c8e35	1	The best app for banking	5	2021-07-12	POSITIVE	0.999771535	General Feedback
27e65fc2-f3a0-45cc-9355-122ed8702f1b	1	Not functional our mobile	1	2021-07-12	NEGATIVE	0.999779522	General Feedback
b4e4e7c5-84b9-4ece-92b1-4c3374b3c119	1	Where can I get the authorization number?	1	2021-04-11	NEGATIVE	0.999390483	General Feedback
8e7ec5d2-05e3-441e-a457-2ebcf8c8252b	1	Starting from the past two weeks, it is not working properly. Did you release any update? If not please investigate the problem and solve it.	3	2021-07-11	NEUTRAL	0.999747694	Bugs & Reliability, Feature Requests
cca0851e-b50d-44be-acfa-569b16fbbef7	1	Simple and user friendly. Thanks it is very helpful.	5	2021-07-10	POSITIVE	0.999809325	Customer Support, User Interface & Experience
e5a1b260-dc9c-4bae-b6a4-f6e9e2815c8c	1	It is very great and helpful app. Easy and helps to save time alot	5	2021-07-09	POSITIVE	0.999700189	Customer Support, User Interface & Experience
073eadbd-6203-4647-8169-de72a326b499	1	Good cbe app	5	2021-07-08	POSITIVE	0.999489188	General Feedback
6682df50-8cb3-449b-9e5a-268a5f171f52	1	It's nice app...!	5	2021-07-08	POSITIVE	0.999856710	General Feedback
d4600b85-4dfd-4543-b331-e2934c0eb7f5	1	It does not work properly	1	2021-07-07	NEGATIVE	0.999774635	Bugs & Reliability
74c45c26-a2ba-4b77-9b40-9732c11807ba	1	So gooood!! Keep Going	4	2021-07-06	POSITIVE	0.887485027	General Feedback
8ec476fe-37fe-4208-ac84-8fd093dffc0a	1	wow nice app thanks	5	2021-06-30	POSITIVE	0.999843001	General Feedback
209cf3cb-9de7-476a-a960-291a8bb86b2d	1	Great GUI, easy to use and convenience.	5	2021-06-29	POSITIVE	0.997718215	User Interface & Experience
a8dbb10b-e66b-4365-b722-17cec134c7c8	1	CBE, please fix this app or you'll be left behind. Considering this was one of the first banking apps in Ethiopia, most bugs should have been fixed by now. But bugs still abound. It worked from outside Ethiopia but not for long. I haven't been able to use it (from outside Ethiopia) for the past 4 weeks. No updates visible. Nothing against the country that I dearly love. But this app is the one-eyed version as far as banking apps go. You know... a one-eyed man is a king...	3	2021-06-28	NEUTRAL	0.996213257	Bugs & Reliability, Feature Requests
751902cc-ce0c-46ca-8148-5afc92312b33	1	It reduces life hassling.	1	2021-06-28	NEGATIVE	0.998994410	General Feedback
963447ff-b30f-4377-960b-e25aeaf52f8c	1	Comfortable and easiest app	5	2021-06-27	POSITIVE	0.999826252	General Feedback
fe92ab4a-fb9c-4e17-90e5-177a79fb4be7	1	Bad...very Bad..taboo .. Need an education	1	2021-06-27	NEGATIVE	0.999757588	General Feedback
e6235cc9-7a79-4dd1-b7c6-7dc8dd40de36	1	It works only on WiFi	2	2021-06-27	NEGATIVE	0.994870305	Bugs & Reliability
fdb03dd0-435a-454c-9415-22d02e4deae3	1	Very good app. Thanks	5	2021-06-26	POSITIVE	0.999863863	General Feedback
0982c2a0-d364-4e37-86a4-aa2ce019595e	1	So far soooo good 👍	5	2021-06-25	POSITIVE	0.999845147	General Feedback
cf3aa807-1d78-4947-8476-a3cb6f1e74f8	1	No account balance shown	2	2021-06-25	NEGATIVE	0.999269187	General Feedback
21d74275-3c66-40a4-bb09-fd9b7b61032e	1	WOW I am so impressed using this App. It is simple to use and helps digital money transaction.	5	2021-06-24	POSITIVE	0.999526024	Customer Support, Transaction Performance, User Interface & Experience
e6fdf36a-bb58-40d2-ae05-fa30e355cc22	1	My phone is not rooted however the app claims that it is. Please fix this bug. Whoever wrote the verification for a rooted OS please please please revisit your code.	1	2021-06-24	NEGATIVE	0.991236806	Account Access Issues, Bugs & Reliability
8de58372-8908-4df4-abaf-0f98909fa013	1	It makes life easy everything is there you are expected only to download this app and use it a bank you can always relay	5	2021-06-24	POSITIVE	0.970931888	User Interface & Experience
eb89912c-30e2-4a9e-9ae1-7c5bf0eeeb88	1	Excellent app! Like it. It's user friendly. And the last updated is also good for adding some privacy.	5	2021-06-21	POSITIVE	0.999739110	Security Concerns, User Interface & Experience
1b55be0a-e613-4570-b256-dab7dc8ee1ea	1	በጣም ተመችቶኛል ሂወቴ ፈጣን አረገልኝ	4	2021-06-20	POSITIVE	0.883213103	General Feedback
9c867937-de89-4d8d-b6de-477661a95ed9	1	What does it mean can't sync	4	2021-06-20	POSITIVE	0.999431431	General Feedback
00996804-4cd3-4379-9f2b-f8d1dbf81399	1	I realy hate this app it simply keep on saying that your device is rooted you can't use this ap when my device is not rooted so you better consult an android developer✌️ so one star is too much....	1	2021-06-19	NEGATIVE	0.999257386	General Feedback
fe8b8418-66f9-4139-b76a-7a8c219706c1	1	Best option for Any CBE account services I have seen yet.	5	2021-06-19	POSITIVE	0.985259175	Feature Requests
470dead9-35ff-4ab8-8a6d-546b9bc14667	1	It's mostly unable to connect to the Internet, very frustrating	1	2021-06-18	NEGATIVE	0.999800146	Account Access Issues
d2de8450-979d-4a8e-b75a-52a5f9fa8873	1	Easy to use	1	2021-06-18	NEGATIVE	0.998854280	User Interface & Experience
0d7291e5-fa96-4820-b800-43f2d2935db2	1	useful update but at the moment its not easy to download or update and that means we can't use the the app at the moment	3	2021-06-17	NEUTRAL	0.998319209	Feature Requests, User Interface & Experience
006f5e69-e653-405a-84ca-0ec234cb4587	1	I like this app	4	2021-06-16	POSITIVE	0.999651670	General Feedback
a7c4f4ee-a79f-4d96-a11c-1a9f358df8e7	1	Only works when it wants!	1	2021-06-15	NEGATIVE	0.915094495	Bugs & Reliability
27d0e7f7-716c-485e-b9c5-fd129ae572e2	1	Why my app not responding	5	2021-06-15	POSITIVE	0.999385476	General Feedback
b85e9cc5-5d49-423c-af6e-00fb804b86c3	1	I need to get the details of my utilities payment without going to the Bank. Thank you!	3	2021-06-13	NEUTRAL	0.999636292	Transaction Performance
9e5f60b9-8adc-46f2-b392-87bed482bfa1	1	Very good app.	5	2021-06-12	POSITIVE	0.999866962	General Feedback
e8bada2d-54ae-4b2d-a4b0-31eb2f53abf8	1	Why you are closed seeing our balance in recently updated version?	1	2021-06-12	NEGATIVE	0.993539751	General Feedback
9bdbaa51-b581-402f-9eb5-b2c69284fda1	1	I need it to active my job	5	2021-06-11	POSITIVE	0.988787830	General Feedback
518e262c-8ee6-4e22-9b96-396c910e0aff	1	Very bad app	5	2021-06-11	POSITIVE	0.999776900	General Feedback
32ff6448-7c24-423e-9d2c-8d68f4522930	1	Is not working	1	2021-06-11	NEGATIVE	0.999780953	Bugs & Reliability
58a5dfd8-7baf-4bf4-b2c5-6dd9de3e4287	1	What an update its amazing Super Fast	5	2021-06-11	POSITIVE	0.999795735	Feature Requests, Transaction Performance
8a28c8f1-7eda-478f-9f83-f386234bb1be	1	I have been used this app from the beginning and like it. On the current updated version it states we can share and save the transaction details. However it can't share or save. The only option I am using is Screenshot. So would you please review it?	4	2021-06-09	POSITIVE	0.962464988	Feature Requests, Transaction Performance
66e9187a-c6e4-4bad-97de-a52ea966a423	1	Wonderful update. I use to take a screenshot of my transactions before but now I can share or download the details. Thank you so much. Keep up!	5	2021-06-09	POSITIVE	0.999845982	Feature Requests, Transaction Performance
13095bf8-297e-4d53-a632-11e2eef09b5e	1	Very good app	5	2021-03-05	POSITIVE	0.999867558	General Feedback
be14f123-3f88-4b36-b119-1c5da58d3223	1	I used this app for a long time , and i like it, its user friendly, not complicated at all, and more over it makes life easier for real. But the now after some times, this app is working better only on wifi, .. its veary hard to use it with mobile data, so please do something	3	2021-06-08	NEUTRAL	0.992516696	User Interface & Experience
5efaf515-0081-4882-a422-1392f621b3a1	1	እኔ ከምንም በላይ ጊዜና ድካሜን ቀንሶልኛል	5	2021-06-07	POSITIVE	0.904695213	General Feedback
3ec3a3fd-9aa3-477f-9518-259ecb9019c1	1	The installed app says this app is rooted you can't open it whats the problem they don't know what they are doing.	1	2021-06-07	NEGATIVE	0.997857511	Bugs & Reliability
66b0aeaa-fb70-432c-95ee-fa52d4b413d7	1	Just updated to version 4.3 but it failed to sync after that. Please do something, I couldn't use it since it is popping "can't sync".	1	2021-06-07	NEGATIVE	0.999665618	Transaction Performance
acc27df9-4c90-497b-9f60-9f8902c2dca9	1	CBE is My Favorite Choice in All Transaction	5	2021-06-07	POSITIVE	0.998528004	Transaction Performance
22590946-228e-445b-990b-c378185a5797	1	Best app but if you add more than ten transaction it will be better	3	2021-06-07	NEUTRAL	0.948437989	Feature Requests, Transaction Performance
100445e3-9987-4469-b9cd-b81e126f0974	1	Very Good App	5	2021-06-06	POSITIVE	0.999867558	General Feedback
7685767f-53b9-46f9-9bf7-05fe3634a0f0	1	Wow very easy and wonderful app	5	2021-06-06	POSITIVE	0.999879718	User Interface & Experience
30b85d5a-f878-4262-a859-1764f9679e01	1	Hey! What a weakly limit restriction you made? Why I cannot withdraw my money at any time when I want? This leads the app to be debris!	1	2021-06-06	NEGATIVE	0.999301434	Transaction Performance
3e428dbb-4fee-4596-9427-22f2d8447c94	1	After I update this app when I try to use it say can't cync. I can't use. What is the problem?	1	2021-06-06	NEGATIVE	0.999411225	Bugs & Reliability, Feature Requests
6c2cb5e0-47da-446e-8e52-bf43939fd2ed	1	It so clear and symple to use, solves problems in our daily financial activities and enrichs us with current exchange informations. It is so lovely.	5	2021-06-06	POSITIVE	0.999858260	Bugs & Reliability
890e3cf0-91aa-4faf-878b-22e32e5a3c90	1	Wonderfully make your lifrle simple	5	2021-06-05	POSITIVE	0.999885798	User Interface & Experience
eccb11fb-ff39-49ef-a303-f32c65f1fd7b	1	It's not working	1	2021-06-05	NEGATIVE	0.999785721	Bugs & Reliability
bddd9642-177c-4b8d-b85b-421b4f593534	1	Bareeda mitti Sireesaa akkaa nuu banamu	5	2021-06-05	POSITIVE	0.985027671	General Feedback
39f984c3-e9ff-42a5-b246-56f2efd42703	1	Its better if you allow to pay for tele wifi payment ..	3	2021-06-05	NEUTRAL	0.996470690	Transaction Performance
e2ddd26d-a78a-4d14-833c-61bd0aebe644	1	Nice app but mostly the txn sorting is not correct, earlier txns come on top but latest ones at below so its better if it has a time stamp besides the date or do something for better txn sorting.	4	2021-06-04	POSITIVE	0.996160388	General Feedback
39cf0379-bf48-4516-8850-2993110850b7	1	It used to work fine, but it's not logging in after the recent forced update.	5	2021-06-04	POSITIVE	0.990939498	Bugs & Reliability, Feature Requests
03c7dd66-837f-4316-9286-fa5e4f8b6a4c	1	After the update I received today, I have tried to conduct transfer to other CBE accounts and it continously brings error messages saying none available. It is also not allowing me to download the transacation picture as is advertised here. Please do something CBE as this app is continuing to frustrate me again and again.	3	2021-06-04	NEUTRAL	0.999549210	Bugs & Reliability, Feature Requests, Transaction Performance
6f8c2c45-b92d-48f5-97ef-6f315110a5fb	1	Thank you for timely response. The app now working really well. Recommendations: please synchronize this app with telebirr.	4	2021-06-04	POSITIVE	0.998934090	Customer Support
dc31ab2a-3205-48fd-b7b9-5b004280bc2a	1	I have been using for more than 3 years. It was good, but after upgrade to new version end up with white screen. What is wrong with that. Thanks.	3	2021-06-04	NEUTRAL	0.994876444	Feature Requests
974d78ad-d63a-4402-adfb-235ba0a048e0	1	When u need to transfer the network stuck.... please fix this things	3	2021-06-04	NEUTRAL	0.998662233	Bugs & Reliability, Transaction Performance
261e8576-2857-4218-9ef7-73ca753f5491	1	Why build a skyscraper when your mobile app is this bad!!!... Priorities !!!!	1	2021-06-04	NEGATIVE	0.999791324	General Feedback
609db4ee-a7e0-4d1a-b9f0-1a7b5e98dc4c	1	Its very easy to use in contrast to other similar apps	5	2021-06-04	POSITIVE	0.998125017	User Interface & Experience
c06245ea-9154-4546-846f-a0ad74e785e8	1	It could be very useful if the app is able to show all the transactions made with out limitations, the current app shows only recent transactions.	3	2021-06-04	NEUTRAL	0.998339534	Transaction Performance
99835587-d927-42fd-bb71-32b1ec336c8e	1	አሁን አሪፍ ሆኗል ገንዘባችንን ፊትለፊት አያሳይብንም እሱ ተመችቶኛል በጣም በርቱ	5	2021-06-04	POSITIVE	0.936667919	General Feedback
2f8e4995-5e12-496b-9ab2-1eb3da8b46b6	1	In the home menu, the updated date of balance is not shown. Moreover, the recent account does not show the withdrawal cash amount.	2	2021-06-04	NEGATIVE	0.994943202	General Feedback
a6d78d5d-0203-4ca1-bb1d-39efe18d72de	1	The up is simple and easy to use so far. And in the future updates i would recommed adding transaction statment in a report manner. Thankbyou CBE.	3	2021-06-04	NEUTRAL	0.991105378	Feature Requests, Transaction Performance, User Interface & Experience
bb43003e-6afd-42ce-a7d8-ed5f017704b5	1	Its a perfect app, Easy to use and works almost everytime	5	2021-06-04	POSITIVE	0.999584258	Bugs & Reliability, User Interface & Experience
cdc5cdf0-d032-4721-b6a6-8180ce76333b	1	Worst app I've ever seen	1	2021-06-03	NEGATIVE	0.999769509	General Feedback
f53c2d1f-35ef-419c-91b7-1a38b8ca211f	1	The best app, that I have used it	5	2021-06-03	POSITIVE	0.999720275	General Feedback
908fa9ec-6911-4bdf-9a76-ae876772c62e	1	I tried to transfer a payment to my friend. The app did not show me any confirmation of a payment I belived as the payment was not sent to my friend so I tried many times. At the end I have found out that my account was out of balance. Its A Crazy And Unreliable App.	1	2021-06-03	NEGATIVE	0.999632478	Transaction Performance
552a6943-36c3-44dd-bdb2-41ea55a38eba	1	A job well done!	5	2021-06-03	POSITIVE	0.999850869	General Feedback
81d38716-e9e3-449b-b828-d26bb13d7ffa	1	Very fantastic application	1	2021-06-03	NEGATIVE	0.999876618	General Feedback
98b090ae-dd80-4148-89da-37779802ed5c	1	It is Good!	4	2021-06-03	POSITIVE	0.999848962	General Feedback
67e946c7-ac44-44ab-b272-3d5c5b5b9ce9	1	what is the application verification key pls??	4	2021-06-02	POSITIVE	0.999185622	Account Access Issues
a6878aca-a24e-400a-b89d-9f7165a2609f	1	I love it u can do what ever you want easily	5	2020-12-21	POSITIVE	0.999834776	General Feedback
23a22ba0-1b9b-4885-ac15-dd7e34e3db8e	1	The interface is good. But can you hide amount of money. It is sensitive. And login pin and keyboard are not really synced	4	2021-06-01	POSITIVE	0.848018050	Account Access Issues, User Interface & Experience
37329de5-de07-4a17-9311-5e7a1abebe8e	1	it's very nice and Thanks	5	2021-06-01	POSITIVE	0.999856234	General Feedback
f7290386-f19d-4f3c-96e8-0ee74a4f1558	1	It is very easy to use specially for paying utilities	5	2021-06-01	POSITIVE	0.948118448	User Interface & Experience
64274692-5357-41ec-8f50-1bd0a12e5f34	1	It very smooth, but it need a QR code payment system	4	2021-05-31	POSITIVE	0.976662159	Transaction Performance
693eb7b1-9a9e-496a-ace1-29cc5f9266ac	1	This application is really bad. It is slow and doesn't work properly. It doesn't show recent activities. Using this app I transfered money to a friend and after showing deduction on my account, the money didn't reach the other end,the activity is not reflected on my recent transactions either. The worst app ever. It doesn't work outside of Ethiopia.	1	2021-05-31	NEGATIVE	0.999806583	App Speed & Performance, Bugs & Reliability, Transaction Performance
24fdfa33-f4f4-40c6-83c7-55be073d55ef	1	A easy and wonderful app to use	5	2021-05-31	POSITIVE	0.999866962	User Interface & Experience
0cde916c-bf7b-42d6-a359-c82df9aa02a8	1	The UI sucks it needs improvement Didnt expect this from a bank as big as this	2	2021-05-30	NEGATIVE	0.995393634	Feature Requests, User Interface & Experience
2a3eb78a-5663-4b71-9311-b959b42f735f	1	The best app wich provides best , releable and fast financial service for cbe users.	5	2021-05-30	POSITIVE	0.999442756	Transaction Performance
7834c299-a405-4099-b9bd-ac5903ac6495	1	Where can i get A verification key	4	2021-05-29	POSITIVE	0.999002874	Account Access Issues
0528449d-3e14-4928-9f41-525b547eccbb	1	Thank you CBE	5	2021-05-29	POSITIVE	0.999755561	General Feedback
eb3c65a6-53a9-4bba-97aa-cce03bc9c9bf	1	How do i get verification code?	1	2021-05-29	NEGATIVE	0.998896837	Account Access Issues
9a21c6b1-f765-4197-8bd2-d10ff0b18632	1	Doesn't work on rooted phone...! Its bad app to use..... You have to develop it again	1	2021-05-28	NEGATIVE	0.999674559	Bugs & Reliability
962e8e7a-040a-4363-84c5-3406d4dd3ab6	1	Nice one It has shown a lot of improvement everytime!!!	5	2021-05-26	POSITIVE	0.999177873	General Feedback
9e09dbfa-3180-4175-b4a3-efcb36c1c621	1	I cant use this app cos it stops syncing after I update the app.	2	2021-05-26	NEGATIVE	0.999099135	Feature Requests
386d1f83-8d05-4a0a-9c81-e34f7cb647e2	1	as part of a secured app it should have request users for update before stop working.	1	2021-05-25	NEGATIVE	0.998013258	Feature Requests
9f6ce19b-5a5a-4c86-b5bc-df360999694b	1	ምቹ እና ለአጠቃቀም ቀላል ነው።	5	2021-05-25	POSITIVE	0.904695213	General Feedback
fc215749-09a5-44fd-8799-71d3ec20a96e	1	ኮድ ጠፍቶብኝ ማግኘት እችላለው	5	2021-05-24	POSITIVE	0.861633003	General Feedback
def3fffa-1b7c-439d-b70c-c8757e604799	1	We can not send transaction more than 5 times per week. It is restricted.	4	2021-05-24	POSITIVE	0.996624827	Transaction Performance
eba33921-93bb-443e-9c52-561d01f7a593	1	Very nice at all	5	2021-05-24	POSITIVE	0.999864936	General Feedback
f4ec1029-7169-46ae-89e3-6ea76810cbf3	1	I like this app	4	2021-05-23	POSITIVE	0.999651670	General Feedback
cba5d141-8c3c-4597-8973-9e4c0cec6724	1	How can i get my authorization code	1	2021-05-20	NEGATIVE	0.999148369	General Feedback
a4011564-0635-42d0-a1fd-2e6c94b9d052	1	Best mobile banking app in Eth	5	2021-05-19	POSITIVE	0.999565184	General Feedback
995f1dae-4bda-4fce-a43c-ad066194611f	1	It makes my life easy. I love it	5	2021-05-19	POSITIVE	0.999879837	User Interface & Experience
17ae0487-03e8-46b7-ae3a-c1b6ae52135b	1	The app. doesnt work🙄🙄Smh	1	2021-05-18	NEGATIVE	0.999462426	Bugs & Reliability
bedd17e8-5c65-4262-935f-abd4f263c998	1	Dear all, if you're an iOS user then the new update doesn't work at all. Those of you who use the Android App and you've been having troubles your user credentials have expired that's why it doesn't even load your balance, so you need to go to your branch and have them fix that!	1	2021-05-18	NEGATIVE	0.999707520	Bugs & Reliability, Feature Requests
db63df73-401c-4a4d-88d6-a43fb49c4eff	1	Where do I find the app verification code	1	2021-05-18	NEGATIVE	0.998921871	Account Access Issues
05261793-bb54-4876-bc1b-11547e475cf5	1	service part is not working	1	2021-05-18	NEGATIVE	0.999757588	Bugs & Reliability
f8a31849-5611-41c7-a130-6c8d6689b64d	1	It is interesting App	5	2021-05-17	POSITIVE	0.999769270	General Feedback
ae463e96-e7e9-485f-b13a-85d31caf80c1	1	this is good for nothing and useless where is the verification code you are always back asholes useless and half	1	2021-05-17	NEGATIVE	0.999802887	Account Access Issues
d9c5afa6-bfda-47a3-9e48-22871ec3a226	1	The best app!!	5	2021-05-16	POSITIVE	0.999862552	General Feedback
e7375149-5548-4209-a5fc-5415cdd8229c	1	it is crashed after updating why and how to fix it	5	2021-05-16	POSITIVE	0.999780595	Bugs & Reliability
d428fc41-1f63-43fb-a4f7-8a6378b7b372	1	What is this this is the worest app i have ever seen they gave me a code but it say it doesn't work and they blocked me	1	2021-05-15	NEGATIVE	0.999638200	Bugs & Reliability
d01a092e-e0ce-4a12-86ae-7823a4574752	1	Verification key not sending	4	2021-05-15	POSITIVE	0.996798337	Account Access Issues
1de25585-fa50-45a8-88c2-eb04556a43cc	1	Difficult to find out verfication code. It took me z whole day	5	2021-05-15	POSITIVE	0.997411191	User Interface & Experience
b52c9b0c-9566-40e0-82ac-c5d863ebdc17	1	I opened an account and unable to download this app. What's wrong? 14.05.21 Two weeks now, and still unable to download app. No one from CBE is reacting. Negative image for an old institute such as CBE.	1	2021-05-14	NEGATIVE	0.999598086	Account Access Issues
e5f59e97-cee4-4af6-8081-b7b2152fdefe	1	It is good app	5	2021-05-14	POSITIVE	0.999865294	General Feedback
800b2d7c-521a-449b-a9e8-00d702221f87	1	Perfect ui But mine is not working now days. Does something happened new? It was working well 3 day back now it say sync failed.. Are u people under mantainance??	1	2021-05-13	NEGATIVE	0.999335706	Bugs & Reliability, Transaction Performance, User Interface & Experience
e231bf06-6511-49b4-8655-a6324001ecfe	1	Best app with smooth experience.	5	2021-05-13	POSITIVE	0.999570429	General Feedback
001333f3-14c3-4fee-a975-3fb67ccf62ee	1	What a shame is this...how comes such a stupid app come from the huge ethiopian proud bank???boring, digesting app I have ever seen before. Asking Authorization /verification after downloading the app what the hell is this?!;:'"	1	2021-05-11	NEGATIVE	0.999805868	Account Access Issues
5ce1213b-04b2-440a-930e-a0457b8ce791	1	this very smart & simple app	5	2021-05-11	POSITIVE	0.999826968	User Interface & Experience
c3d7712d-2ab0-4086-a42e-5900dfb2d1c9	1	Easy to access and transfer	5	2021-05-10	POSITIVE	0.999312997	Account Access Issues, Transaction Performance, User Interface & Experience
cbb8141e-c0b6-4f41-9fdd-ac1d3192e1de	1	Good app !	5	2021-05-10	POSITIVE	0.999859214	General Feedback
c63e5471-0a74-4e8e-be43-cc1f6c1933a8	1	Only works about 1 out of 10 times	1	2021-05-08	NEGATIVE	0.980118752	Bugs & Reliability
61e4d334-c5f9-49c1-9d6a-c0a13bb22366	1	I don't know what to do with this app anymore..after I synconized it, it doesn't show the features or the tools that needed to use for, just it shows my balance.. needed to be fixed asap.	1	2021-05-08	NEGATIVE	0.999331355	Feature Requests
04b08307-9fe8-4599-a09b-681786ed2c1e	1	Really app but net is poor	3	2021-05-07	NEUTRAL	0.997076035	General Feedback
a0c6c550-bc24-4248-b45b-621288717591	1	Worest app i didn't expect this kind of app from u	1	2021-05-07	NEGATIVE	0.709732413	General Feedback
d6b58764-f180-4478-bf3e-87e11c8622dd	1	Well, helpful but still lacks much more	4	2021-05-07	POSITIVE	0.995775759	Customer Support
2e3ed35c-de18-4485-9d8f-3fbcb5b45efa	1	I am new to this app, I downloaded just right now from playstore and i it asked me for Verification code and i don't have it, Someone please help me......To solve the issue.	1	2021-05-05	NEGATIVE	0.998913646	Account Access Issues, Bugs & Reliability, Customer Support
94bb7b97-d503-4edb-843c-11eb763aff43	1	Commercial bank of Ethiopia is the most preferable organised and technician and thinking observation to saving institution and also this institution is my first choose	5	2021-05-04	POSITIVE	0.996500134	General Feedback
172591c9-b9f6-496e-b5a7-9be522de08b6	1	Why is this app not working out of Addis Ababa?	1	2021-05-03	NEGATIVE	0.999638677	Bugs & Reliability
2d206253-53fb-4845-8680-2c10da3cc94a	1	I can't hide my balance on this app like CBE App on iphone	5	2021-05-02	POSITIVE	0.992911875	General Feedback
eff17bdc-2fd8-495a-a476-8b0c0c511738	1	Very good and useful app	5	2021-05-02	POSITIVE	0.999869943	General Feedback
513341fc-8932-4ee5-b1c8-b947f834eb91	1	I have bad experience since I started using this app. I get "none available " error message while there is good internet connection. And I went to my branch two times to activate the app. There should be some way to activate without physically going to the branch. Anyway, it should be improved much from what it is now!!!	1	2021-05-02	NEGATIVE	0.996239424	Bugs & Reliability
b16097fa-97e8-42d2-bab4-93a2b74587e6	1	Idee bashin abrahim	1	2021-05-02	NEGATIVE	0.975410581	General Feedback
1ca3f9e1-f8e1-4165-8947-f7a29369c98e	1	It is not synchronizing with core banking	1	2021-05-01	NEGATIVE	0.999683022	General Feedback
d0d9d09b-ee12-4a61-9ff8-e5cfb924ad89	1	I like this app b/c of it's do life simple	1	2021-05-01	NEGATIVE	0.998156965	User Interface & Experience
e6329e72-6522-465f-a20f-87308b2527e5	1	I have been using it for the last three years and was working perfectly but since this week cannot even show my balance and unable to make payment. Please try to fix it.	2	2021-04-29	NEGATIVE	0.998891890	Account Access Issues, Bugs & Reliability, Transaction Performance
77b93c76-2b96-4e8e-bd90-22089eb62c4c	1	It is good application and expected to move the financial sector forward	5	2021-04-29	POSITIVE	0.999700069	General Feedback
94e01313-2f38-459c-ac1c-1341a188d4d9	1	Good, no bugs yet.	4	2021-04-29	POSITIVE	0.997519791	Bugs & Reliability
6ae4531e-a8dc-4209-9374-9b3eab33aea1	1	Its really good app i have ever have in ethiopia	5	2021-04-27	POSITIVE	0.999819696	General Feedback
4b4d0561-bf47-4e62-8f48-12fe31a1e338	1	Where do i get a verification code?	1	2021-04-27	NEGATIVE	0.999500036	Account Access Issues
c236919b-0666-41ec-8032-328c13239cc6	1	How can I get the verification code to install the app??	3	2021-04-24	NEUTRAL	0.999588668	Account Access Issues
368db3c2-18c1-43fa-af59-f52f2ffc1a75	1	እባካችሁን ሂሳባችንን የምናውቅበት መንገድ ስሩልን🙏	4	2021-04-24	POSITIVE	0.883213103	General Feedback
1e22a8c8-ea2a-4931-ac42-5465d333cfda	1	ወድጄዋለሁ አሪፍ አማራጭ ነው	5	2021-04-22	POSITIVE	0.861633003	General Feedback
1188edc5-9229-4b77-9fde-fed61564e0d4	1	Good, Improve App Always	4	2021-04-22	POSITIVE	0.999799073	General Feedback
aa719188-e488-4e7c-9160-3fe51e090761	1	እጅግ በጣም አሪፍ አፕ ነው ተመችቶኛል ተጠቀሙበት	5	2021-04-22	POSITIVE	0.920040667	General Feedback
59d43578-cf22-4e44-8114-079ea84062a5	1	One limitation of the the app is that it is not functioning with normal mobile data (3G). It needs wifi or stronger signal. How can I fix this issue? Any help.	3	2021-04-21	NEUTRAL	0.999528408	Bugs & Reliability, Customer Support, Feature Requests
3b496079-4f07-41d8-8435-2ef4a5db01a9	1	I cant get authorization code yet	5	2021-04-19	POSITIVE	0.998856902	General Feedback
5bc12181-2b28-48e2-b454-b4b120ad2b26	1	Really I troubled to use this application since last week, I've been using it more than 2 years. I don't know what's wrong with it now. It can't synchronize, even can't see any update in my account. I tried to repair and manage in setting, but not possible. Also you don't have any means of online communication/ chat. Could you please tell me what to do?	4	2021-04-18	POSITIVE	0.999478996	Feature Requests
7fcb7ab5-58bc-4e54-b89f-21bd5919fc56	1	Lately, it is not working	1	2021-04-17	NEGATIVE	0.999688983	Bugs & Reliability
68223986-943f-4c75-809e-6fb4a2126af4	1	Ethiopia commerical bank	5	2021-04-17	POSITIVE	0.983024716	General Feedback
243e323e-6987-4b34-bc0d-28cbd6c6ee6e	1	It made things a lot easier	5	2021-04-16	POSITIVE	0.997760177	General Feedback
3e951843-bfcc-40e8-b429-2cfb85ff55a4	1	Found it easy to check payments for utility services, see payment history. Login is simple and software is easy to use.	5	2021-04-16	POSITIVE	0.991853774	Account Access Issues, Transaction Performance, User Interface & Experience
e351b374-6927-40ec-8c22-2832eb524ccc	1	Very disappointed! It asks for verification code but no way to get it. The verification code should be sent to our mail or phone number. It doesn't give you any clue to get the code. I go to CBE branch & requested them if I can get the code, but they don't even know how to get it.	1	2021-04-15	NEGATIVE	0.999784887	Account Access Issues
91490707-605d-41b0-b138-c10663ab2f37	1	Thanks for making life easy for getting service providers easily... Thanks	5	2021-04-12	POSITIVE	0.999135911	User Interface & Experience
3d5ae2d9-ed29-435f-a9ee-cfbb1d88e4f6	1	It's a gr8 app, that can makes everyone user life very simple.	5	2021-04-12	POSITIVE	0.987898648	User Interface & Experience
31c79c6a-95b0-44a3-aab7-49934ec07f3c	1	It does not oppen	1	2021-04-12	NEGATIVE	0.611310363	General Feedback
21472e16-59ae-45f9-a37d-4cb7363639f2	1	I love it	5	2021-04-12	POSITIVE	0.999879956	General Feedback
a6405b48-41c8-461c-99eb-bfcd7a203a35	1	Nice one cbe	4	2020-10-28	POSITIVE	0.999793112	General Feedback
16a77cdf-6d13-43fe-8ce4-8828dac84c5b	1	Easy to use I found it intuitive to use the app. It would be nice if it includes finger print to access the account.	4	2021-04-10	POSITIVE	0.512552083	Account Access Issues, User Interface & Experience
f97f4cc1-f6ce-44fe-b298-8f4cf82ac9fa	1	Great experience on android and you need some work on iphone connection	5	2021-04-10	POSITIVE	0.986127257	Bugs & Reliability
b6f85eac-984d-4cb2-bd8c-3b65deeda7ee	1	ምርጥ ነው፣ ሰልፍ የለ፣ ቢሮክራሲ የለ፣ ገንዘብ ከፋዩን እባክህ ፈጠን በል አስቸኳይ ነው የለ፣ u're bank is at ur finger tips. መስተካከል ያለበት ነገር ቢኖር፣ time out ይልና አልተላለፈም ይላል፣ ነገር ግን አንዳንዴ time out ቢልም ያስተላልፋል እና ድጋሚ ድጋሚ መሞከር ተጨማሪ ገንዘብ ያስከፍላል፣ ይሄን ጥንቃቄ ማድረግ ይስፈልጋል	3	2021-04-10	NEUTRAL	0.977608144	General Feedback
5a9e0e1a-aadb-43ef-89ef-c2950dd65705	1	It is cool	5	2021-04-09	POSITIVE	0.999865174	General Feedback
33d0e830-2aa8-4536-befb-6756aca2db65	1	I love this App	5	2021-04-09	POSITIVE	0.999860883	General Feedback
fb65ceb6-e567-46b1-b456-757075d8fe98	1	It is very good app tanks	5	2021-04-08	POSITIVE	0.999785483	General Feedback
08d73eda-bfc7-4272-a64f-a445ee3eaa92	1	Tried buying air time, there was network problems but it still withdrew the Money.	1	2021-04-07	NEGATIVE	0.999098420	Bugs & Reliability
ce523aba-4e27-4d74-a476-dfa06bcdab52	1	This is a nice app- very fast and does well what it's designed to do	5	2021-04-05	POSITIVE	0.999838114	Transaction Performance
4e4dc66a-3d0c-4a77-966a-c85fc986a77b	1	I have been using this app for many times. But now stopped. How it is solved?	5	2021-04-04	POSITIVE	0.996769309	General Feedback
54f8459d-402a-4ee8-847e-166e044c0b2b	1	Has a good service with a hope to improve. Much.	3	2021-04-04	NEUTRAL	0.999826849	General Feedback
4e12b8bf-0b4d-4175-ba0b-67a116af5e14	1	Please add RTGS services in your next update.	3	2021-04-03	NEUTRAL	0.950553596	Feature Requests
aa14af39-3fbb-4c28-bff5-bcf9653f68d8	1	It's not loading	1	2021-04-02	NEGATIVE	0.978567243	App Speed & Performance
f0b6e496-f445-49e9-af5c-84406b02b9f6	1	Simple and nice !!! The issue with using mobile app is you can't print/share the transaction slip.Some company/people required the printable file for their record	4	2021-03-31	POSITIVE	0.986874282	Bugs & Reliability, Transaction Performance, User Interface & Experience
dc3c8ea6-d988-493d-a935-99e13ab3e821	1	It is deficult to refresh, no menu for refreshment	3	2021-03-30	NEUTRAL	0.997690439	General Feedback
a63e8ecd-e0f9-481e-a13b-f5ddcb993468	1	Good way at this time.	5	2021-03-28	POSITIVE	0.999835491	General Feedback
049abb21-7954-497a-b5c5-b61f29d13a6b	1	Very nice and easy	5	2021-03-27	POSITIVE	0.999874353	User Interface & Experience
8289f99a-c459-4b82-a9a0-b1450166f3e5	1	Never works abroad	1	2021-03-27	NEGATIVE	0.998831928	Bugs & Reliability
c5907199-4988-4066-b5bb-4a92c1723038	1	Amazing app.l like it!!	5	2021-03-25	POSITIVE	0.999874830	General Feedback
3b75d069-ac5f-4675-abb9-c94f7cda247f	1	It is very user friendly. I would love to see and use simillar type of appplication without internet connection. Thanks.	4	2021-03-25	POSITIVE	0.974737585	User Interface & Experience
335daaad-c941-4609-a38c-d2536bbf153d	1	It makes all personal banking system easy!better it will be best need more updating by adding extra uses!	5	2021-03-25	POSITIVE	0.934699178	User Interface & Experience
4d4544f0-a66d-4c89-a1fe-d767ec5f8d37	1	Very bad experience as it sticks every now and then	1	2021-03-25	NEGATIVE	0.999650359	General Feedback
33d41163-3001-410c-b54c-6be67e069604	1	Intuitive and reliable application! Excellent!	5	2021-03-21	POSITIVE	0.999880672	Bugs & Reliability, User Interface & Experience
729be072-a20d-4b80-a28b-550cafeba6f3	1	Easy to manage	5	2021-03-21	POSITIVE	0.999652386	User Interface & Experience
60767edb-2e39-4594-91d3-c49245ed4859	1	Because it is my Bank	5	2021-03-20	POSITIVE	0.980222762	General Feedback
bf687265-dc0a-449c-afb0-83e3edd76417	1	Excellent to use am happy	5	2021-03-19	POSITIVE	0.999875426	General Feedback
83e2dceb-5588-4226-8299-1fcff050647a	1	ጥሩ እና ቀለል ያለ መተግበሪያ ነው። ጊዜውን ባማከለ ሁኔታ መተግበሪያውን ማዘመኑንም በፍጥነት ስሩ።እናመሰግናለን።	5	2021-03-18	POSITIVE	0.958290517	General Feedback
cdb3947d-96ad-46d1-8ebb-7465d7af86af	1	Easy and reliable app love it	5	2021-03-18	POSITIVE	0.999778092	Bugs & Reliability, User Interface & Experience
a9ee493f-c7b6-4405-aa24-763942f12ad2	1	Great app. Its 100% nice app than previous one.	5	2021-03-16	POSITIVE	0.999831200	General Feedback
f2ee36cc-e6a3-4442-9294-ef8ab0d8c388	1	let me get this straight you have to go to the Bank to get the verification code ? for get it I leave abroad. I am trying to activate my swift account pending for three weeks I try to call the number no body picks up .😡😡😡	1	2021-03-15	NEGATIVE	0.999521971	Account Access Issues, Transaction Performance
5f9288a8-022f-48c1-b66b-dba886708c3d	1	Very bad app. Never use it.	1	2021-03-14	NEGATIVE	0.997784972	General Feedback
fe893b82-a6ea-4b35-bfc3-2e9991de08ba	1	The app is nice. But from the previous version we can transfer amount to the added beneficiaries. On this version not.	3	2021-03-14	NEUTRAL	0.990124583	Transaction Performance
9e80de62-f6d5-42e7-8adc-5cc76dec19a1	1	Thanks for making easy access	5	2021-03-13	POSITIVE	0.999706089	Account Access Issues, User Interface & Experience
255820a5-74c8-48ff-bc80-830a67665858	1	Fantastic I love the simplicity	5	2021-03-12	POSITIVE	0.999884963	General Feedback
4a629737-7ad0-4bf2-a2fd-e1cfa43fb528	1	Next merchant account	5	2021-03-12	POSITIVE	0.939893425	General Feedback
8023ab41-c16e-4223-8171-1f00e8cd594b	1	I can't able to see account balance ,transfer and other services Performance is bad.	3	2021-03-12	NEUTRAL	0.999751151	App Speed & Performance, Transaction Performance
2a4f9ebf-6b07-4923-bb30-3a2cce3e8c3a	1	It has been really helpful. Thank u CBE	5	2021-03-12	POSITIVE	0.999634266	Customer Support
85795d8d-ac04-4ec0-9d98-e280ac5f5654	1	Love it !!!	5	2021-03-09	POSITIVE	0.999883890	General Feedback
8954bac5-2bed-4703-b489-d71790da2029	1	How can i get verification code?	4	2021-03-08	POSITIVE	0.999341190	Account Access Issues
dd734268-4315-48f7-86cd-dba7d85b41e2	1	Great app to manage your account, and the update as a very modern and simplistic GUI and is really great!	5	2021-03-07	POSITIVE	0.999865770	Feature Requests, User Interface & Experience
c3d3cb72-d15b-49f5-bb56-1b5537af0fb3	1	My application was blocked what is the reason?!	5	2021-03-07	POSITIVE	0.999638677	General Feedback
27c859d2-899b-4252-ab8d-0c5d505c341f	1	Totally not working I can't see my balance ot is blank.	1	2021-03-06	NEGATIVE	0.999705970	Bugs & Reliability
df6ea774-f420-4498-82d9-f0501c3168a6	1	Great app. But why limit transaction history? We should be able to view transaction history at least for the past 12 months if not more. Currently it only goes back one or two weeks.	4	2021-03-04	POSITIVE	0.994183123	Transaction Performance
13603719-f5c5-4fe6-b776-56c804033947	1	Good work. I am happy we have mobile banking access. I am sure it will develop more and more.	5	2021-03-04	POSITIVE	0.999825776	Account Access Issues, Bugs & Reliability
b904a2dd-700c-45d8-b762-96171320225a	1	Very interesting but it doesn't support all networks	4	2021-03-02	POSITIVE	0.997291148	Customer Support
8358e5fe-0596-43a6-b940-4ba33f0d18ef	1	l like the app.GREAT	5	2021-03-01	POSITIVE	0.999751270	General Feedback
189c1571-d5ef-4fa0-9af0-365049037865	1	Best bank !	5	2021-02-28	POSITIVE	0.999798238	General Feedback
b6fdacb1-b2d6-476e-9c8b-c24a5562ca3e	1	after i updated the app, Refreshing the home page took forever, now it doesn't load at all	1	2021-02-28	NEGATIVE	0.995066881	General Feedback
99d33a69-656c-4bbf-b81d-70f017fe5b3f	1	I can not activate and it can not syncronized	2	2021-02-28	NEGATIVE	0.999598801	General Feedback
f7d625ef-d283-4143-bab0-b7551570e3f7	1	Good but i cant rich verification key	5	2021-02-28	POSITIVE	0.984391451	Account Access Issues
97cee99f-f15f-4491-a6c4-48575d39b65d	1	Where do I get the verification key the app asking me to start	1	2021-02-28	NEGATIVE	0.998986065	Account Access Issues
c87b6b87-e11b-4d61-b5a0-e82549ae3ad8	1	After money is transferred, it shows failed signal. When trying again, it says failed again but it was actually transferring two times. Damn!	3	2021-02-26	NEUTRAL	0.999154925	Transaction Performance
047bdf00-2789-48ef-abce-c61ce3230de2	1	Best app, I like it, it makes my life easy	5	2021-02-23	POSITIVE	0.999717653	User Interface & Experience
d6566ee3-aaa3-4fb3-87c6-60178b8e5491	1	Commercial Bank of Ethiopia Best Bank of Africa	5	2021-02-17	POSITIVE	0.999553025	General Feedback
424cf305-a017-4911-a806-4322e4813fae	1	How can Iget auth code	3	2021-02-14	NEUTRAL	0.997067153	General Feedback
407c05de-ec87-45a7-bb83-4bf4f8a0b649	1	Imagine being that larget bank in Ethiopia and building this kind of trash for your customers. Its not even showing any information it just login and every activity or transaction only says "none done" what does that even mean? Is this thing even tested before launch.በጣም ነው የምታሳዝኑት ወሬ ብቻ።	1	2021-02-13	NEGATIVE	0.999670506	Account Access Issues, Transaction Performance
61dc1ee6-e4b1-436c-93c9-3b9f8a1b5d10	1	Better than than the previous	5	2021-02-13	POSITIVE	0.999738753	General Feedback
9615f91e-4e99-4d98-b0bd-2528fd95a688	1	The bast app	5	2021-02-12	POSITIVE	0.998450518	General Feedback
2fc9cd3b-97da-4b93-bc0f-175de8acae5c	1	It keeps repeating transfer and makes you lose your money it has done that multiple times	2	2021-02-11	NEGATIVE	0.999263108	Transaction Performance
eaf97f86-d8cf-446a-86fa-2456af80f551	1	Best mobile banking app from all the banks in Ethiopia.	5	2021-02-11	POSITIVE	0.999764740	General Feedback
a73523d9-23f1-4066-9369-d47fca45bddd	1	It says "none available" after installed and subscribed. what is wrong with it?	1	2021-02-09	NEGATIVE	0.999761164	General Feedback
a1ba937b-7a89-4b3e-99b4-b90e0e71ba23	1	Very nice application 👍.	5	2021-02-08	POSITIVE	0.999863386	General Feedback
b8745989-d4a6-48db-a069-da08f0df1b3e	1	I like the new interface but gave me headache!! Most of the time it fails to sync.	2	2021-02-06	NEGATIVE	0.999747694	User Interface & Experience
576c6d83-741a-4f8a-af34-5b793f1c5f29	1	The verfication doesnt sent me until now	1	2021-02-06	NEGATIVE	0.977660418	General Feedback
5556ac17-4d26-4bf3-b259-b6c1b2f6ae2c	1	Wow i like this	5	2021-02-05	POSITIVE	0.999837279	General Feedback
bf0a25f6-921b-4a13-a3b7-3b2b198baa32	1	Much faster and easier to access	5	2021-02-04	POSITIVE	0.999395609	Account Access Issues
3cceab20-cad5-4d06-a30a-cbc86996cf1e	1	Please it needs to be updated or do some improvement The previous version was very good as compared to this one . with this app I can't make any payment . When I try to send payment it always says You have exceeded your weekly number of transaction!!	2	2021-02-04	NEGATIVE	0.987046123	Feature Requests, Transaction Performance
025fe7ef-0394-43b0-8661-62e1806f4ff1	1	I like this app it is better than the previous one!	5	2021-02-04	POSITIVE	0.999710977	General Feedback
3ea99eb9-81d1-41a9-9285-ef30afa63e80	1	Its not working properly .it say (syn error )	2	2021-02-03	NEGATIVE	0.999816716	Bugs & Reliability
8dd569a1-d113-486f-ad3c-00511c0142d9	1	I really luv this app it's makes life get easy	5	2021-02-02	POSITIVE	0.960307121	User Interface & Experience
598aa91d-e0d2-4d1d-b697-af0162cbe3fb	1	Good app for making payments.	5	2021-02-02	POSITIVE	0.999565423	Transaction Performance
ea509f8c-9d0e-436d-8417-33db797bc232	1	It is helpful!	4	2021-02-01	POSITIVE	0.999673247	Customer Support
a3174cbc-f8a5-407a-b95f-036afe3718e0	1	There is problem with sudden system or software failure. And most importantly the history of transaction is too short , at least we must be able to look at monthly statement on the app!!!	3	2021-01-31	NEUTRAL	0.999726713	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
ab5d3131-c6f8-40b4-89c2-6d5da271695a	1	Very good App	5	2021-01-30	POSITIVE	0.999867558	General Feedback
8c697597-a055-4fee-992f-86fb2cd799a7	1	CBE can provide us better version of the app they are the biggest bank in horn of africa yet they dont concer in developing thier system or application	3	2021-01-29	NEUTRAL	0.946385503	General Feedback
09a58845-2328-4f1b-b831-6be06b75bb67	1	Very nice it is easy to use it I like it	5	2021-01-28	POSITIVE	0.999819815	User Interface & Experience
5e5ad3c6-2de9-46c6-b543-ccbfccd5175f	1	Really I like the new update. I rate it ☺️☺️	5	2021-01-28	POSITIVE	0.999677300	Feature Requests
093bd60a-2a81-43e5-b1bd-35ca5a3d38ef	1	Very efficient and easy to use I like it	5	2021-01-25	POSITIVE	0.999866724	App Speed & Performance, User Interface & Experience
2c1fe137-23d1-46ef-afd6-df206299dbf3	1	It doesn't even sync Very bad app it doesn't work anymore	1	2021-01-24	NEGATIVE	0.997278273	Bugs & Reliability
00dd843b-edb6-44d7-92a4-48e50a652264	1	This application is very useful I do like it Thank you so much Ethiopian Commercial Bank really you are the best ❤️👍 Please keep it up	5	2021-01-23	POSITIVE	0.999821603	General Feedback
078cd0ca-0cb2-4b48-b570-bc8efdbe62ec	1	The update looks cleaner and better. Kudos to the app developer. (it took me a while to figure out the update was what was wrong with my app though)	5	2021-01-22	POSITIVE	0.999569714	Feature Requests, User Interface & Experience
c44ca065-246a-4fbe-9742-33102a1e0673	1	It ia taking forever to load once i signed up ans its been 10days. No change. This is not working.	1	2021-01-22	NEGATIVE	0.999793351	Bugs & Reliability
62fdcc41-00ec-497c-85fe-a1ab5d2e62d1	1	Very bad app. It doesn't even tell balances. ብዙ መሻሻል አለበር። I prefer the USSD.	1	2021-01-21	NEGATIVE	0.999791801	General Feedback
0290147b-92b4-4277-a41f-bf58bd92074d	1	Great app.but appears on screen after finish using application.	4	2021-01-21	POSITIVE	0.912693202	General Feedback
7353d94d-67c9-4f5f-99df-db1a332e3b83	1	This version is better than than the previous one and this one didn't find strong internet connection which is its strong side.	5	2021-01-20	POSITIVE	0.986109555	General Feedback
1a7ac3f7-5ea5-4c2c-92a9-218939a2de9d	1	app is a good ideas and good version but this app not download my phone i want to use this app	4	2021-01-20	POSITIVE	0.593474746	General Feedback
f08582d1-5ec1-4916-a1f9-e6dc37d0c356	1	Easy to use but all new customers forced to download this app bc shared app doest work on other phone	2	2021-01-16	NEGATIVE	0.998892248	Bugs & Reliability, User Interface & Experience
98094d2d-490c-41bd-8495-4bc4f488c2d9	1	በጣምአረፍነበር ነገርግንአደገኛነቱምበዛውልክነዉ ለምሳእኔየገጠኝንልንገራቹህ ለአንደሰውአሰርሸመላክፋልጌ እናየብርጠኑንአሰቀምጬ የመጨረሻየይለፍምልክቷተጭኜደረሰኝእድሰጠኝእየተጠባበኩባለሁበትሁለትደቂቃዘግይቶቀጥታበራወጣ ትንቆቶሶሰትግዜ ከሂሳቤተቀነሰ	3	2021-01-16	NEUTRAL	0.923957765	General Feedback
5a377a99-2dad-4ed8-8d86-6432835e7338	1	Good app from the old one but during sign up the old search box doesn't appear in order to activate directly from message	4	2021-01-16	POSITIVE	0.998093307	General Feedback
3d2cf5a6-7927-4157-93d2-3032d67344c3	1	App doesn't work most of the time and refreshing the updates it takes more time	2	2021-01-13	NEGATIVE	0.941133380	Bugs & Reliability, Feature Requests
37b88284-824f-41e1-b910-200e4ccf1e03	1	4266 Mahmad mahmud	5	2021-01-13	POSITIVE	0.513367474	General Feedback
7b54292a-9e9b-4c4c-bc14-902853124b0a	1	It ask application verification key what does it mean	1	2021-01-12	NEGATIVE	0.995523810	Account Access Issues
5959abca-cdf0-4593-b30d-43c86fbcee9d	1	how to add verification	5	2021-01-09	POSITIVE	0.976043403	Account Access Issues, Feature Requests
9cd34966-a58c-4838-aab4-2f8870b9704b	1	The app asks me to write verifcation number where can i get it?	5	2021-01-09	POSITIVE	0.998815179	General Feedback
d5d3ef4d-b099-4187-bafb-110b82f628c6	1	I love the app	5	2021-01-08	POSITIVE	0.999842763	General Feedback
0fdfc1a5-705c-4654-a48e-b5ff7e2225ec	1	I respect your transparency	2	2021-01-06	NEGATIVE	0.999132812	General Feedback
d03d37f9-6503-4b13-8650-f152bfbd1d44	1	It is good for saving time consuming and fast service giving.	4	2021-01-06	POSITIVE	0.999614060	Transaction Performance
657fcf82-faf4-4c23-ac3c-5329af319e3e	1	Better view but less performance Why?🙄	3	2021-01-06	NEUTRAL	0.988594294	App Speed & Performance
07ae8c1a-1852-4ca9-a6ab-a86aab6ffb9d	1	I had very comfortable to used this app. The best app at all !!!	5	2021-01-05	POSITIVE	0.999742806	General Feedback
10723a81-4c9d-4642-863e-50a1ee50d3ab	1	It's not working properly	1	2021-01-04	NEGATIVE	0.999779284	Bugs & Reliability
3cb21b1a-90df-4599-8f4c-569c039229a6	1	Simple for utility	5	2021-01-04	POSITIVE	0.654330909	User Interface & Experience
88ada793-bd87-4052-8eca-dd512919ebbc	1	It doesn't work anymore. It says it synced successfully but doesn't show any thing. It doesn't sync at all	1	2021-01-03	NEGATIVE	0.998538733	Bugs & Reliability
9a673361-2d7c-4b33-bc48-b1df970e2365	1	Some time it is not working	1	2021-01-02	NEGATIVE	0.999559581	Bugs & Reliability
baec1733-3cce-4c00-8c5f-9a13784752c6	1	I love this app. Some improvement I wish to be made is that a menu that helps to Bach delete beneficiaries (delete two or more beneficiaries at once instead of individually). Thank you!	5	2021-01-02	POSITIVE	0.999049842	Customer Support, Feature Requests
1ebafb8c-c659-4a68-bc44-98ec4ac0db59	1	Home page Loading for 5 min on 4G net are you kidding me😬😬	1	2021-01-02	NEGATIVE	0.997264147	App Speed & Performance
27f18960-76b4-4138-ae50-a99bcacf8817	1	It was working perfectly until it stopped displaying my balance.	2	2021-01-02	NEGATIVE	0.984717071	General Feedback
1fa93fa3-ddb4-4d48-be83-938b9040120c	1	The previous version is much better than this one. I used it for more than six years without any problem. But now I'm having a serious trouble with the updated app. I don't know why it takes him forever to refresh and load the home page once you sign in. And if it fails to load, it never recovers. I only see some UI changes. Really disappointed	2	2021-01-01	NEGATIVE	0.999011397	Bugs & Reliability, User Interface & Experience
19320c95-03e8-45e3-bb2e-5b169b48f4be	1	በጣም ብዙ ነገሮችን የሚያቀል መተግበሪያ ነው። እናመሰግናለን	5	2021-01-01	POSITIVE	0.923957765	General Feedback
955ccf36-accb-49a9-bc46-9f53e3038592	1	Very easy to use	5	2021-01-01	POSITIVE	0.999142289	User Interface & Experience
47d262a2-6028-4727-85a3-fdb3b56281d0	1	Sometimes this app becomes iactive.	4	2021-01-01	POSITIVE	0.997131824	General Feedback
0be4f493-ab4b-481f-90f7-a4b433a7a5c4	1	Easy to use, it has got everything you need. The only problem I encountered is it doesn't show all your transactions in history, It just hides some without any reason.	4	2021-01-01	POSITIVE	0.998702168	Bugs & Reliability, Transaction Performance, User Interface & Experience
5e673695-4c35-45c7-90d3-3f7dbd4a349e	1	The activatin code that i got from the bank doesn't work, 😡	1	2020-12-31	NEGATIVE	0.999791086	Bugs & Reliability
3d9078e8-a1f8-4c0e-83f0-c5a120a23481	1	CBE mob app works so well in Ethiopia and internationally too.	5	2020-12-30	POSITIVE	0.999118388	Bugs & Reliability
927c9ea9-c80b-4738-85a9-f547b6079359	1	I get the access from my nearest CBE branch but i still couldn't see my transactions	1	2020-12-28	NEGATIVE	0.996906698	Account Access Issues, Transaction Performance
c776cefc-4373-4e55-b0b4-d57b18d0a685	1	keep it up	5	2020-12-26	POSITIVE	0.999809802	General Feedback
5c10d784-6771-43f1-8b01-2996d1b10c4d	1	How we make athourize	5	2020-12-26	POSITIVE	0.948512018	General Feedback
42711601-57f4-421c-9012-63127594aa60	1	Great App, easy to use!	5	2020-12-23	POSITIVE	0.999625206	User Interface & Experience
62d8f494-dee2-4e27-bbe6-53be80ee75c8	1	how can I get application variation code	3	2020-12-23	NEUTRAL	0.998033106	General Feedback
bada8464-ffac-483d-8e96-0f196854f5cd	1	never update my balance	1	2020-12-22	NEGATIVE	0.990113616	Feature Requests
ab1de326-a015-4e0c-afcc-a840b9323d64	1	Its good ..keep it up	5	2020-12-22	POSITIVE	0.999852777	General Feedback
187225df-4445-4f58-93df-c2c98796856b	1	Intersting & I feel good to use this app. Thanks .	5	2020-12-22	POSITIVE	0.999791205	User Interface & Experience
b17b6c34-5c9e-44fa-8acf-3341e26f4ca9	1	Nice but Account display is not private it's lways front line.	4	2020-12-21	POSITIVE	0.742785096	General Feedback
76ae3cae-0fb9-4a43-bf4a-90d9dcacd0d2	1	what is application verification code	4	2020-12-21	POSITIVE	0.991230369	Account Access Issues
91188037-6457-4fc8-ac0a-c6bedcc16502	1	This isn't safe app	1	2020-12-20	NEGATIVE	0.999770343	Security Concerns
c39dbade-a777-4c7d-acb4-22ae2fe45d58	1	Very good apps	3	2020-12-19	NEUTRAL	0.999875188	General Feedback
e02e18f7-8f72-4f2d-868e-1af0c865175a	1	It is very nice	5	2020-12-19	POSITIVE	0.999865770	General Feedback
86c8e726-2f59-4684-84c4-455234e7ac1c	1	ጥሩ መሻሻል ነው። አንዳንድ ጊዜ ደግሞ አዝግ ነው አይሰራም	3	2020-12-18	NEUTRAL	0.936667919	General Feedback
b85ca134-848d-4310-a622-95e3d0d0b012	1	Better than others	5	2020-12-17	POSITIVE	0.999774158	General Feedback
db6fb404-9a55-43ff-89db-068715217572	1	Better from the former one	5	2020-12-16	POSITIVE	0.996697903	General Feedback
64a863d9-6d94-4cfd-bb96-e6e101a0e153	1	Before years later i used this app and is used to work in mobile data eventhough it doesn't have different features like this version but now it doesn't even sync my balance and even can't use any of the services it says " can't sync " and " none available " 😡🤬😡	1	2020-12-16	NEGATIVE	0.999097109	Bugs & Reliability, Feature Requests
03942b51-89e9-4130-ad8a-b8d9f230e4b2	1	Since I have started using the application, I have saved a lot of time. It is very important application for individuals who want to save their time	5	2020-12-15	POSITIVE	0.996268988	General Feedback
ea58835a-e146-4152-be38-1b859ded9d32	1	No working direct upgrade, you need to go to a branch everytime there is enhancement	1	2020-12-14	NEGATIVE	0.997635722	General Feedback
579dd997-b09b-4f7d-88e5-f5934e0b71c1	1	Sometimes it does not work.	4	2020-12-13	POSITIVE	0.999775350	Bugs & Reliability
a8b8791f-3a31-44ce-95ff-f8ea1714fc3a	1	- Stop showing toasts on errors. It keeps showing up after app is closed - Show paged transaction history. The latest 10 is not enough. - Network error is happening and it's taking money without filling airtime to my phone ...	1	2020-12-13	NEGATIVE	0.999605119	Bugs & Reliability, Transaction Performance
deaae1d5-669b-4fbe-9e38-068ece1f27a2	1	Thanks How to get application verification	5	2020-12-12	POSITIVE	0.998216927	Account Access Issues
4f48e6d7-e743-4583-a760-08e9fd081272	1	The app cannot sync with backend server, keep shown me can't sync	1	2020-12-11	NEGATIVE	0.999683022	General Feedback
fcd8e1f5-9e58-42a5-868e-848c3faaae5b	1	Wow good app	4	2020-12-11	POSITIVE	0.999858975	General Feedback
d0f8ba75-b49f-45fe-8adb-7e561718a439	1	It is not working,not syncing,not perfectly updated	2	2020-12-09	NEGATIVE	0.999690652	Bugs & Reliability
c469ff3f-0746-4cd2-b251-04714d57665c	1	It's a great app	5	2020-12-08	POSITIVE	0.999862790	General Feedback
2490cbc6-a320-4463-955d-cb7a8368e732	1	how can i get the verification code?	1	2020-12-07	NEGATIVE	0.999536395	Account Access Issues
6100b311-eb29-4839-8b84-f60778261abe	1	Good app to operate	5	2020-12-06	POSITIVE	0.999827206	General Feedback
12218bd1-3921-45fe-8ecf-05ac7d7cb4a3	1	I appreciated by this app. But it can't send money to inactive account and pending authorization account. Please develop more. I have long experience( more than 3 years) with former version and ussd *889#. This latter version is better than both. Keep it up!thank you. is there any payment for using cbe mobile bank? Please explain	5	2020-12-06	POSITIVE	0.992771447	Transaction Performance
ed370f80-0772-45a4-93cf-857a0b8607b7	1	Very help fuel	5	2020-12-06	POSITIVE	0.988808095	Customer Support
2fad7168-2970-4631-86a0-65a8c6960003	1	Where i get app verification key?	5	2020-12-05	POSITIVE	0.998450041	Account Access Issues
fe3c0617-114c-4521-a8d8-a9a48125d0fe	1	i lov it	3	2020-12-05	NEUTRAL	0.998885453	General Feedback
e525b939-10de-4204-9707-763ccfa2e8f3	1	Best app and user familiar with more information included	5	2020-12-04	POSITIVE	0.997596204	General Feedback
3e41b16b-63db-463c-9a88-9779374b8e25	1	Well help the people to meet bank	5	2020-12-04	POSITIVE	0.997180104	Customer Support
1374b54f-854a-4f79-8222-7f664e0109a2	1	Like always it is the worst app of all time, even I doubt it's oudated or updated. My phone is not rooted and it says you can't use this app because it's rooted	1	2020-12-04	NEGATIVE	0.999772966	General Feedback
6fc46f71-58d1-4b20-912d-50cbc669d821	1	I've been using the previous app more than a year without any prob. This application is not working more than a month and even they couldn't also fix it.	1	2020-12-04	NEGATIVE	0.999691486	Bugs & Reliability
42160560-bf1f-4c78-b088-8c4b99c50e4e	1	Excellent Application that's appropriate for use.	5	2020-12-03	POSITIVE	0.999854684	General Feedback
51d19562-86e9-402c-bea4-11d503f48987	1	It's not working it only updates I can't even see my balance	2	2020-12-02	NEGATIVE	0.998602927	Bugs & Reliability, Feature Requests
2946f279-7f53-4ddf-9b53-cb7f878d0733	1	Easy and compatible	5	2020-12-02	POSITIVE	0.999805391	User Interface & Experience
fc4efd1d-fb1a-45b8-9153-8a6e6db77c6c	1	Looks grate. Thanks	4	2020-12-02	POSITIVE	0.969172657	User Interface & Experience
9f6ecd88-a214-44e0-aa0b-1f4f3c88bc4e	1	It's doesn't work properly.	1	2020-12-01	NEGATIVE	0.999781787	Bugs & Reliability
dcf2abc5-010e-4ba6-add3-578b849d02b2	1	Its good app but we cant check statements for past months just recent is availavle Ita good to add this function	4	2020-12-01	POSITIVE	0.980452776	Feature Requests
9b110ea3-d4f2-4c59-8b98-ecaa7f3fd11d	1	It's not working please make it something	1	2020-11-30	NEGATIVE	0.999698758	Bugs & Reliability
f14754de-eb17-44ab-83fb-3e10e3e57b8c	1	How to verify it?	3	2020-11-30	NEUTRAL	0.992879570	General Feedback
1e18a359-df04-4ece-b5d2-ce55ad0a9bb9	1	I was trying to activate the app but I do have a problem with the verification code...how can I get the verification code?	3	2020-11-29	NEUTRAL	0.999581277	Account Access Issues, Bugs & Reliability
ac3d7bd5-a215-45a5-9a6f-dd6eb03e1617	1	It couldn't even show me my current balance, disappointing.	1	2020-11-28	NEGATIVE	0.997643292	General Feedback
a1fdcd88-835a-4829-883c-f13515efa759	1	I have been using this App simply for transfer b/c CBE accounts - Ok. But the feature to transfer to non-CBE account simply took my money to unknown account?	3	2020-11-28	NEUTRAL	0.998926461	Feature Requests, Transaction Performance
90cb1a3d-bf6c-4a99-8496-1421ca0005a6	1	Very thoughtful it's making work very simple.	5	2020-11-25	POSITIVE	0.999852419	Bugs & Reliability, User Interface & Experience
2c1957f0-7711-4bc2-82fc-ef1b80af7443	1	Can't update anytime pleas make it better	1	2020-11-21	NEGATIVE	0.996668518	Feature Requests
0f746722-dee5-4ce6-9fa1-73f75c17557f	1	it is good	5	2020-08-14	POSITIVE	0.999849439	General Feedback
38a73116-a4ce-484f-bb0d-4ee4a065f031	1	The new one is better to use easly and so simple to asses ur account	5	2020-11-20	POSITIVE	0.998789728	User Interface & Experience
93d8943d-dafa-4e55-97e0-eeb497e6e204	1	App is Not working from last update.	2	2020-11-20	NEGATIVE	0.997342169	Bugs & Reliability, Feature Requests
70a739cd-7495-45e8-8464-22433c2ccb4c	1	አሪፍ አፕ ነው በጣም ውበት አለው ፈጣን ነው። ችግሮቹ 2 ናቸው የመጀመሪያው recents ብዙ አያሳይም ለነጋዴ የሚሆን አፕ አይደለም በቀን ብዙ transaction ካለ ግማሹ ይደበቃል ሁልቀን እንደተቸገርኩ ነው። ሁለተኛው ችግር ማዘበራረቁ ነው መጨረሻ ላይ የገቡ ብሮች ይደበቃሉ ስንት እንደሆነ የማን እንደሆነ አያሳይም። ችግር እስከሌለው ድረስ recentu በዛ ቢል 30 ቢሆን አሪፍ ነው ስቶሬጅ አይዝም እንደውም ከተቻለ statment የሚል option ኖሮ የሳምንት ድረስ ማሳየት ቢችል በጣም ምርጥ ይሆናል ይሄንን ያክል ከተለፋበት አይቀር ፕሊስ አስተካክሉት	4	2020-11-20	POSITIVE	0.971648157	Feature Requests, Transaction Performance
defc9714-7d99-4bfc-b487-47552a9727ee	1	No eady way to check balance after deposit or withdrawal.	2	2020-11-19	NEGATIVE	0.999263942	General Feedback
ce3f27d2-7474-42fa-8ce7-d0253319b738	1	Beneficiary account is not working!	1	2020-11-16	NEGATIVE	0.999789417	Bugs & Reliability
5846bdaf-ca56-462d-8fd1-5119c69ffd63	1	It's refreshing not working since last update. I already authenticated and signed in to my account but it says no available when I clicked on service.	1	2020-11-16	NEGATIVE	0.991711378	Bugs & Reliability, Feature Requests
4fee7e6f-95fc-486d-b82a-6051847ef799	1	How can I get app verification	4	2020-11-16	POSITIVE	0.998266160	Account Access Issues
4caddc15-3f7b-45f2-a9ad-493fce7b0d96	1	I can't get veritification code	1	2020-11-15	NEGATIVE	0.999571383	General Feedback
f9ad72b6-be2a-4507-ac43-f5906c27332d	1	It ask verification key when i try to open . It leads me which is useless app. I suggest to fix it up...	1	2020-11-14	NEGATIVE	0.999803841	Account Access Issues, Bugs & Reliability
ef1c2ff2-dd39-4c60-80a3-4298d31bfa73	1	You make it easier and faster to use	5	2020-11-14	POSITIVE	0.998519838	General Feedback
17008307-3897-42ef-81e3-423896f030e9	1	It is best and good app, we can use easily, enjoy it.	5	2020-11-12	POSITIVE	0.999844193	General Feedback
a5e8bb6b-b5c5-4670-942d-72c14d494620	1	the new version is amazing. It has all in one and works, Great job CBE.	5	2020-11-11	POSITIVE	0.999849200	Bugs & Reliability, Feature Requests
b6c8fbb9-2d9f-4b14-b62d-7341a7b97f8f	1	The app is not friendly usable . For example, it asks you verification key as soon as you download it. There is no description where or how to get verification key. This is crazy. I never seen any app ask you verification key at the start . confusing app. No more try waste of time.	1	2020-11-11	NEGATIVE	0.999744713	Account Access Issues, User Interface & Experience
4b80158a-6398-4673-a974-8ee24341d32f	1	I like it, it save time and mekes me trustful friend.	3	2020-11-10	NEUTRAL	0.999851465	General Feedback
2a638d32-fa24-4520-b802-61a3e1f3f600	1	This app is good and easy to use UI. But, still need some bug fix such as own account transfer and payment to beneficiaries didn't work. Localization also not yet work like date conversion...	4	2020-11-10	POSITIVE	0.995596230	Bugs & Reliability, Transaction Performance, User Interface & Experience
e24ccf59-5427-4fbe-b103-96f2ee5a17be	1	I'm frustrated by this app.its not even doing a single thing for me.it just keeps saying none available every time I try to use it. Hope the developers bring solutions to this problem. Thanks in advance	1	2020-11-09	NEGATIVE	0.901508629	Bugs & Reliability
20bc0669-71f1-4d8a-8e48-5423ed07e3a6	1	Nice app ! Thinks	5	2020-11-09	POSITIVE	0.999741971	General Feedback
25343d4a-1e8a-41ad-8a14-5b3d9ab4daad	1	Very good improvement	4	2020-11-09	POSITIVE	0.999844432	General Feedback
b32622a0-f34b-48ca-9311-cb099d4561b3	1	The app won't list transactions made via USSD(889), why is that?	4	2020-11-08	POSITIVE	0.999081135	Transaction Performance
864a38de-737f-442e-a823-9f664ad36235	1	not synchronze the network	1	2020-11-07	NEGATIVE	0.999547184	General Feedback
52c22755-53b4-43cf-a386-808739f868d3	1	This app is not dependable and it fail to sync often. By far the sms version is better. Please try to solve it soon.	2	2020-11-07	NEGATIVE	0.999669194	General Feedback
5de6536f-7d90-4d37-b069-48acda91d473	1	It is not work properly	1	2020-11-07	NEGATIVE	0.999785006	Bugs & Reliability
3ec75039-02d7-4a9d-b7a8-5241dceeb5ff	1	Such a bad application and service u are giving us. Never think using cbe for an emergency situation.	1	2020-11-05	NEGATIVE	0.999665499	General Feedback
1dcb4848-76ec-416d-a554-36a7340f3ee1	1	Application UI and new features are better than the previous version. I found a minor bugs though. I couldn't transfer to an account from the beneficiary list, it says None Available; There is still so much to do with the localization; Instead of ሰኔ it says ጁን and more like this; date conversion is missing also. If this minor things are fixed it will be much better.	3	2020-11-05	NEUTRAL	0.999670267	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
35c53b85-6d99-4b66-9239-f5ba34c597fe	1	So far excellent!	5	2020-11-03	POSITIVE	0.999867082	General Feedback
af64aee8-07f5-47b1-99a1-45e8cb99df04	1	Good Application but it stops sametime	5	2020-11-02	POSITIVE	0.775926650	General Feedback
0ebe223e-e4ba-46fe-8496-c77ca44e708e	1	Stop working after 2 days of installation	2	2020-11-02	NEGATIVE	0.999679089	General Feedback
450024d7-e656-4c29-872f-603c1a536fe4	1	Can't use this app after unsubscibing previous phone holders account and reinstalling. While I enter pin and activation code it says failed to authenticate and finally blocks the pin after 3 trials. I have been retried more than 3 times and finally gets stuck. Pls help.	4	2020-11-01	POSITIVE	0.999748766	Account Access Issues, Customer Support, Transaction Performance
4cabad4a-6b89-4059-b576-fda51e0601fd	1	It is a good up with nice interface.....but it doesn't sych.....pls correct it	4	2020-11-01	POSITIVE	0.993967772	User Interface & Experience
2502c251-4e99-4209-8d50-de6b01fa1936	1	if you trouble activating it in the bank with mobile data try the wifi its much faster and works	5	2020-10-31	POSITIVE	0.989242017	Bugs & Reliability
94f5bd93-96e3-4067-a418-af06ec38498e	1	በዚህ አፕሊኬሽን ብዙ አካውንት add ማድረግ ቢቻል ጥሩ ነበር‼️	2	2020-10-31	NEGATIVE	0.939617813	Feature Requests
13549d3b-b317-4d96-b838-2928e7ef7c7f	1	Nice up easy to use	5	2020-10-29	POSITIVE	0.999841452	User Interface & Experience
9a18f01f-3728-45c3-91de-407f6bde74e5	1	Safe and fast thanks	5	2020-10-29	POSITIVE	0.999868631	Security Concerns, Transaction Performance
c6d255e2-3016-47f1-a30a-f5ffa3512b60	1	User friendly & Wonderful app	5	2020-10-28	POSITIVE	0.999875426	User Interface & Experience
98dd0b28-377c-4fc7-8222-1317829e7f9a	1	I wasn't able to try your app because while opening the app it's says your device is rooted. Even if it's a precaution incase of hacking but my device is not rooted. I even disable OEM unlocking but the error is still there.	1	2020-10-27	NEGATIVE	0.996954083	Bugs & Reliability
b614571c-98a6-4569-9dba-0a0c099b883c	1	I am happy with this app introduction; the older version was troublesome. Thank you #CBE!!	5	2020-10-25	POSITIVE	0.989405811	General Feedback
db4c4415-1ee5-4aff-b6f4-6febfe930643	1	The app is not working in android version 10 . Please fix it	1	2020-10-23	NEGATIVE	0.999621868	Bugs & Reliability
b17d3c27-a4f2-4350-9e6e-c45b42e6940e	1	I love the upgrade but what happened to the details of the transactions made?????	5	2020-10-21	POSITIVE	0.998262227	Transaction Performance
a6ea8125-098e-452e-bc5c-299c2556a624	1	First for Humanity and your vision. Thank you for your best service CBE.	5	2020-10-20	POSITIVE	0.999701023	General Feedback
debeb4fd-253e-448c-ad9c-1883e88c04f7	1	If you forgot your password you have to go to the bank which is so tiring, there should be a link on the app that helps you recover your password. And it has huge problem using the app to send money.	1	2020-10-20	NEGATIVE	0.999429047	Account Access Issues, Bugs & Reliability, Customer Support, Transaction Performance
cf802463-2dc7-485f-b178-b0050a15ddf4	1	What is the verifcation key	1	2020-10-20	NEGATIVE	0.795005500	General Feedback
3084e6e9-26c2-4064-b5a2-4053eb01153e	1	Its way better than before	3	2020-10-19	NEUTRAL	0.999653459	General Feedback
810ee67a-87de-43ed-80f6-e3d3bea48996	1	I downloaded the app,but asking for a key. How do I get the App's verification key?	5	2020-10-19	POSITIVE	0.998831093	Account Access Issues
344d43ca-c8e2-4a4b-8e1e-dae1b1fdbc20	1	My experience with this app is very bad. I just downloaded and installed this app and I stuck with the verification code. The app requested me to input the code without sending it. 😢	1	2020-10-19	NEGATIVE	0.999734104	Account Access Issues, Transaction Performance
1525a287-2a62-4084-bba1-cece0a3ac7ab	1	You do good on upgrading the app keep it up👍	4	2020-10-18	POSITIVE	0.998642981	General Feedback
5d55ebff-d79d-42c2-8468-51af9aab8fec	1	In most of the cases the app doesn't work properly. It is more than a week the app was stopped working.	1	2020-10-18	NEGATIVE	0.999745786	Bugs & Reliability
029cf43e-19ac-4fdc-9e55-1fca29111e17	1	It's a good job	5	2020-10-16	POSITIVE	0.999858499	General Feedback
f53b5f79-cea5-4696-b3a9-8266e14f9ae8	1	Tranferring money to CBE wallet is too difficult this time. Please fix it!!	3	2020-10-15	NEUTRAL	0.999454796	Bugs & Reliability, User Interface & Experience
c2868e06-3fc5-4661-a566-2e1841837102	1	But signal is weak	4	2020-10-14	POSITIVE	0.998350382	General Feedback
08187b49-b88f-4698-9f59-0ee43eded7b8	1	Nice platform, thanks.	5	2020-10-13	POSITIVE	0.999854326	General Feedback
8ef73931-8d3e-4fed-8cc7-dd67fc24fd18	1	I love the update . Nice work	5	2020-10-13	POSITIVE	0.999865890	Bugs & Reliability, Feature Requests
351b9001-3038-4f37-bd19-b32a0d0368d0	1	Please Linked My Account.	5	2020-10-12	POSITIVE	0.986793220	General Feedback
f3adb7ae-1895-4d5d-9bc4-246ea41ce2f1	1	Before a time this app is working properly but now busy	5	2020-10-12	POSITIVE	0.997997344	General Feedback
32bf9cb1-5b5a-4b1c-94c5-63b7953312bd	1	The worest app ever	1	2020-10-10	NEGATIVE	0.953590095	General Feedback
4bc91e91-081c-4255-8c88-3b1c335aa6de	1	Good but need more features	3	2020-10-10	NEUTRAL	0.977404714	Feature Requests
c9d6879d-6d1e-4a57-9ea7-fc087253e2b8	1	Nice app with a new features ... Really like it !!!	5	2020-10-09	POSITIVE	0.999853492	Feature Requests
73c760a1-a345-4d44-bb90-78c5d2216a9f	1	Were is verification code	5	2020-10-08	POSITIVE	0.968898535	Account Access Issues
394a8a28-71b1-4739-94a9-c7c242827b65	1	I realy like it	5	2020-10-07	POSITIVE	0.999866247	General Feedback
6c987dcf-5685-4371-9be9-b800bf93b473	1	This app is good. It is better if the bank has app for ussd *889# like cve birr *847# becaus connection in ethiopia is not good and closed for smoll reason.	5	2020-10-05	POSITIVE	0.970125258	General Feedback
a60c8bff-abaf-4275-9e96-a1a1b86e0bca	1	I don't understand what is verification key account number,ATM card code, account name what is it?	1	2020-10-04	NEGATIVE	0.999439657	Account Access Issues
8144c42a-6029-43df-9693-e3e9d5b9e198	1	The application do not show the real account balance on time, which shows fake balance. Its poor and offending Most of the time it shows old balance.	1	2020-10-03	NEGATIVE	0.999738395	General Feedback
c389ec5b-8173-47ce-a629-8cc488c8a90b	1	Was good till internet shutdown by govt	5	2020-10-03	POSITIVE	0.775862157	General Feedback
9c0a985a-4a62-459e-acac-70cb63ea33cf	1	Evry thing ok but it not acitve	5	2020-10-01	POSITIVE	0.955011904	General Feedback
b0eeaaa1-d1a3-4d1a-a172-84d7d283c28e	1	The application is upgraded to it's best. ADD other feature as per customers experience	5	2020-10-01	POSITIVE	0.995855033	Feature Requests
72e2a235-94f7-4064-bcf7-5b6124a9dbd4	1	Very important for more security now the secret pin is only 4 digit but make for better security 6-8 digits pin please Very nice ui design but the top up is not working please Fix the bug	5	2020-09-30	POSITIVE	0.998479664	Bugs & Reliability, Security Concerns, User Interface & Experience
d7ba6879-2ea4-4fcf-9c0c-2871f2704de1	1	Why would I go to the bank to get verification !! I was supposed to enter my pin number	1	2020-09-30	NEGATIVE	0.999307036	Account Access Issues
e9667042-75e4-4e21-9fa0-bd6b84eed423	1	Now it supports most phones. Good job!	5	2020-09-30	POSITIVE	0.999673486	Customer Support
5ea9cebd-d99f-4f92-b9aa-5b9a75e31241	1	It is good and easy to use. But as you changed your phone it needs activation code from bank. So this needs improvement. Always as you changed your phone, you should go to bank branch to get activation	1	2020-09-29	NEGATIVE	0.994182289	Feature Requests, User Interface & Experience
130904bf-173d-4dd2-9e25-6e169121e36d	1	The updated cbe application is perfect	5	2020-09-29	POSITIVE	0.999857903	General Feedback
d1c714cf-f63b-4108-9fd9-173ffdca624b	1	It is very nice app specially for saving time and avoiding needles services .	5	2020-09-29	POSITIVE	0.999087930	General Feedback
e5b78e88-0d92-4499-89d4-f4f82f0ebf87	1	None avialable only	1	2020-09-28	NEGATIVE	0.998685777	General Feedback
a54d5318-de2a-46cf-87f4-9da97357f6d5	1	I am having problem with this updated version . Old version was way better than this one,	1	2020-09-26	NEGATIVE	0.936567247	Bugs & Reliability
65ee8269-4ea1-4efa-bce6-4c2adc56bc56	1	No suficient service	5	2020-09-25	POSITIVE	0.993535519	General Feedback
145d7073-efb5-493c-8190-9d9c4fed7fc0	1	I like cbe app!	5	2020-08-13	POSITIVE	0.995451510	General Feedback
1c371662-1ae6-442f-8134-fa301db86d7b	1	I never want to use this app. I like to type *889#. I just hated to go to the bank to activate the app. It took them 1 minute to do it. Now I just bragging I can recharge my phone with one click. Nice interface keep at it.	5	2020-09-25	POSITIVE	0.647666037	User Interface & Experience
e0823783-3e05-4e15-969e-5c1e73301753	1	It doesn't work and sync when you want to use and transfer money to others. Why CBE is not working to solve the problem.	4	2020-09-23	POSITIVE	0.999729455	Bugs & Reliability, Transaction Performance
e9fbd38a-bcc2-4c77-963c-87d4bb3ef8d4	1	This app is not working....	5	2020-09-22	POSITIVE	0.999791682	Bugs & Reliability
62e9d181-6e39-44a6-afcb-6968693cf9e7	1	How can I get verification code?	3	2020-09-22	NEUTRAL	0.999341190	Account Access Issues
e73f1de7-05ab-4831-8d3e-2b7ab2ff09a4	1	Wow! This last update solved the problem of some system compatibility issues. now it works fine. thanks?	4	2020-09-22	POSITIVE	0.999661446	Bugs & Reliability, Feature Requests
e16a08b2-99c4-464c-919b-2c278e14fe72	1	good app 10 q commercial bank of ETHIOPIA	5	2020-09-21	POSITIVE	0.999327183	General Feedback
50d59584-87c8-4e90-a0d6-6f62b12452cd	1	It is so nice app	4	2020-09-21	POSITIVE	0.999856472	General Feedback
b48515b1-539c-43ce-85a3-ee96ec5eeede	1	It deserves 5 🌟 now.	5	2020-09-18	POSITIVE	0.996216118	General Feedback
cd5f25c9-da45-4d10-bfc7-ffd502df0a7a	1	It has serious synchronisation problem	1	2020-09-18	NEGATIVE	0.997737765	Bugs & Reliability
2582106d-606f-4de2-8364-af68b637e732	1	it is best.	5	2020-09-18	POSITIVE	0.999839306	General Feedback
61231def-90bb-4b29-b3c5-baa6ece4f71b	1	Very simple to use	5	2020-09-18	POSITIVE	0.997626960	User Interface & Experience
4b768f10-ac8f-4e5e-80f3-7af80386f5a8	1	It's fast and simple to use.	4	2020-09-17	POSITIVE	0.999581635	Transaction Performance, User Interface & Experience
a7dd0aec-4dfa-463f-8d09-8e86dff72bb4	1	I have been using old version of this app since 2017 ,this version is very nice.	5	2020-09-17	POSITIVE	0.999407053	General Feedback
1258c170-dfee-4e32-8b57-88caef783992	1	I was able to use the older version with ease. But now it doesn't even open and tells me that it can't be opened on rooted devices. Please fix that.	2	2020-09-17	NEGATIVE	0.999165297	Bugs & Reliability
c6b83fa0-4e39-4108-a7fe-d63c824ddbf8	1	it very interesting and easy to use & this new version is very fast to update the transaction, acct bal ,etc	5	2020-09-16	POSITIVE	0.764407575	Feature Requests, Transaction Performance, User Interface & Experience
ca02d2ff-60b9-486b-81fb-f0ed9fd53c42	1	thank u for ur immidiate action to update the app for all types of android system.	5	2020-09-16	POSITIVE	0.995007515	Feature Requests
07dd5534-ea32-451f-90e0-fea64ca73c95	1	I have been using this app fair smoothly till the last update few days back and now it is a disaster as it repetitively says 'unable to sinc ' and when I uninstalled it and tried to re-install with proper procedure guided from my CBE branch, it again and again fails to accept verification code ...it is quite a disappointment !	1	2020-09-15	NEGATIVE	0.999780238	Account Access Issues, Feature Requests
f5f86a10-3cbe-4a41-8474-b26191062f97	1	I keep getting error pop ups on my screen even after closing the app and when i am using other apps, please fix this bug.	3	2020-09-15	NEUTRAL	0.999474943	Bugs & Reliability
34fd3f4d-4958-4a9f-8d93-b97b2c01c599	1	Good app and friendly to use in its amahric langogue feature.	5	2020-09-14	POSITIVE	0.999667525	Feature Requests
c513d2c8-1489-41b5-b300-7771271f96e3	1	How to get verification code	1	2020-09-14	NEGATIVE	0.967916727	Account Access Issues
b2ada967-9454-4a4a-a02e-c9e3795a7c4c	1	Simple to use	4	2020-09-14	POSITIVE	0.997062266	User Interface & Experience
b361a24d-c39f-4626-b64a-c160240bba31	1	Better with the design. But still it can be improved with a better interface. Good work	5	2020-09-14	POSITIVE	0.999603450	Bugs & Reliability, User Interface & Experience
6a662c60-c425-4705-baa1-40b99d3d4fc9	1	Why the 3.7MB update takes forever to install? At first I thought it was my data conn issue but was not. I have been enjoying the later version until I unable to use due to update installation issue.	1	2020-09-14	NEGATIVE	0.994856000	Account Access Issues, Bugs & Reliability, Feature Requests
905955b5-e7bd-4e47-b1a4-58266a2aef68	1	It asking verification code where could i find it. Please help	5	2020-09-13	POSITIVE	0.992590189	Account Access Issues, Customer Support
942ee73b-e005-48e7-b0f6-7afc4ab500d6	1	Simple and easy to use	5	2020-09-13	POSITIVE	0.999731839	User Interface & Experience
3ed84160-d156-49cf-8c85-1413df53fac8	1	Much better user experience than the old version. Please add more utility payments like DStv.	5	2020-09-13	POSITIVE	0.910642684	Feature Requests, Transaction Performance
1fcf3fba-61b5-47f5-b913-70d4c1279ddd	1	This is what i need a really really love the new app	5	2020-09-13	POSITIVE	0.999138117	General Feedback
138ba491-292c-4a43-8709-bfe8e6449151	1	CBE አሪፍ ነው።	5	2020-09-12	POSITIVE	0.968966007	General Feedback
b5bb32fa-ab10-4fa7-85f4-713754043cf4	1	Ethiopia Oromia USA	5	2020-09-12	POSITIVE	0.980563819	General Feedback
96904a6f-8f61-46b1-b5f3-c9292747a7d0	1	I have been using this app for more than a year it came with best version, but now after the last update it's not working well as before. It can't sync, the connection is not working at all. I can't see recent transactions and make any transfer , all the features are not working, I hope you will come with a better update soon.	2	2020-09-12	NEGATIVE	0.999608696	Bugs & Reliability, Feature Requests, Transaction Performance
73b19087-f6bf-4ac8-8345-323ea1d79e9c	1	Best app. Improved speed	5	2020-09-12	POSITIVE	0.999747574	App Speed & Performance
a7a08d43-394c-42bb-a20f-c06ec39a0c60	1	It's great until few days back but it stop working for me starting Friday it says "can't sycn" please solve the problem.	4	2020-09-12	POSITIVE	0.998394191	Bugs & Reliability
7ab7315b-0df4-4bb4-a0b8-5f18cedde8b9	1	If it shows more transactions, it would be nice. But it's still great app	5	2020-09-12	POSITIVE	0.999796808	Transaction Performance
a6d3de15-8e07-4ee2-91cb-88c37c7518d9	1	Well designed user interface and easy to use! Great app! Good job developers!✔✔✔	5	2020-09-11	POSITIVE	0.999846578	User Interface & Experience
091524f0-4a82-4caf-992a-e6a8ad14164a	1	I have been using the previous version of this app. My android version is 6.0 but unfortunately this new update support android 7.0 or higher. I don't know why you choose to do that. Most famous app here in google play are still support devices starting from version 4.0. considering most of the users to be from Ethiopia I don't think you will target almost all of the customers with the current lowest version support. Please address this issues we are facing.	2	2020-09-11	NEGATIVE	0.997345746	Bugs & Reliability, Customer Support, Feature Requests
ffc98460-c692-4b2b-887f-ec303a305031	1	It asks an authorization key. I can't get it	2	2020-09-10	NEGATIVE	0.998921990	General Feedback
a31158db-206f-4d4a-950e-7a5cc440e601	1	I love this new app!	5	2020-09-10	POSITIVE	0.999864817	General Feedback
4a1d6c34-48e7-43cd-8d91-4a1177fe070a	1	Activation took to much of my time and initial log out was difficult, asking PIN again and again.	3	2020-09-10	NEUTRAL	0.998073101	User Interface & Experience
9130b35c-54df-471d-b984-b8a0fef9cef3	1	The interface of the app is great but it's very difficult to see balance and other functions. It's seems no more functional...	1	2020-09-10	NEGATIVE	0.999443710	User Interface & Experience
32f7582c-f0dd-41a7-afd9-10b599ee61cc	1	CBE mobile banking makes life easy.realy it helps in creating cashless society..please make cbe birr apps active as mobile banking too...your call center is too busy...and not found at all..please take corection action on it	5	2020-09-09	POSITIVE	0.610908508	Customer Support, User Interface & Experience
d55b854f-9673-4173-893e-462cd586ed46	1	I cant pass the authorization key how do i find it? Please reply if u know.	1	2020-09-09	NEGATIVE	0.995525777	General Feedback
4606426c-6afa-4b00-9ba8-8ee9568d6735	1	The updated version of the app is fabulous; easy to use and customer friendly.	5	2020-09-09	POSITIVE	0.999690413	User Interface & Experience
30aa283b-8ebe-4db0-a8a8-f7304d4c3e43	1	Great app, keep it up. we need more service option to make life easy.	5	2020-09-07	POSITIVE	0.991465271	Feature Requests, User Interface & Experience
cf58591f-d6d9-4a93-8ecd-76fa41be9d56	1	It helps a lot,thanks	4	2020-09-07	POSITIVE	0.998759627	Customer Support
b316374e-67a6-4ec6-927c-aaa4fca1a518	1	ወደ ሙባይል የተላከን ገንዘብ መመለሻ የለውም	4	2020-09-06	POSITIVE	0.904695213	General Feedback
c831b7b4-a522-44f7-a66b-a811496d595e	1	Barely works. My balance never updates and I cant transfer money 90% of the time. The old app was so much better.	1	2020-09-06	NEGATIVE	0.998555362	Bugs & Reliability, Feature Requests, Transaction Performance
e1152104-2f63-42b5-9d6c-3d9c0663c411	1	Its so nic app	5	2020-09-05	POSITIVE	0.683143914	General Feedback
60f6ea4f-9a0d-4d52-bca1-0eb21df216c5	1	It only works at the first glance(only after installation and configuration). After that all the transfer options, utilities, top up doesn't work. It just say doesn't sync. Even the balance bord keeps loading and doesn't show the current balance.... Very poor experience ☹️😥.	1	2020-09-05	NEGATIVE	0.999665141	App Speed & Performance, Bugs & Reliability, Feature Requests, Transaction Performance
6e45a4a9-bf2a-4186-ac98-c640933f2b53	1	When App Updates it askes to reregistration from the branches	3	2020-09-04	NEUTRAL	0.994592130	Feature Requests
8f6d7136-f16e-4f33-b450-69249fde1884	1	It asks authorization key I'm cofused with it which is the authorization key	2	2020-09-04	NEGATIVE	0.956420660	General Feedback
581395c9-3d50-487d-ace3-fe0e43121f7d	1	It's sweet app,do more to fix more fitures	5	2020-09-03	POSITIVE	0.967047274	Bugs & Reliability
5a1a3ffc-ae65-42f9-bb9e-3e969f73f677	1	Always 'can't sync' and i can't get solution at the branch office.	1	2020-09-03	NEGATIVE	0.999528885	General Feedback
5c93655e-e7c7-4467-887e-703513adfc36	1	I have been using this app for almost four years now. In the beginning, it was working fine. Sometime later, it gets difficult to create a connection to my account, and could not manage to make and see transactions on my account. After updating it lately, Jul 2020, I was glad this app came with some user interface improvements, and the connection was quite fast. Not longer than two weeks, the app starts to get stuck, and it cannot even show me the UI properly. As a result, I have a useless app on my cell phone, hoping that [you] will soon come with updates.	2	2020-09-03	NEGATIVE	0.999382019	Feature Requests, Transaction Performance, User Interface & Experience
d8726799-c461-46d1-aca8-baca83c3e871	1	It is nice app	5	2020-09-02	POSITIVE	0.999847889	General Feedback
38c1f9f8-9c4a-4f71-8400-9f98003c50a5	1	Can't see the nearest Branch or ATM available	3	2020-09-02	NEUTRAL	0.996296942	General Feedback
ba02e06b-8eef-4c9c-84fa-91939fe7da5d	1	Galatooma gaarii dha	5	2020-09-02	POSITIVE	0.971812189	General Feedback
db87489c-1ed8-408f-a2f9-b2ad8a7e654a	1	I think the old was way better than this. I wish i never updated this app .	1	2020-09-02	NEGATIVE	0.998661518	Feature Requests
6b7e988b-3e6b-4627-943b-dcd900fbbabc	1	really appreciate and useful 👍 app ..and happy if u can use more access to buy air tickets, get loans, ....etc...but honestly so glad to use this app..thanks	5	2020-09-02	POSITIVE	0.999460399	Account Access Issues, Feature Requests
504b915e-4c97-4348-a69c-62b4b1267371	1	It is good but sometime it doesn't work	5	2020-09-01	POSITIVE	0.998211741	Bugs & Reliability
22234259-71f9-4d88-b6a3-718c357a8a6e	1	I love it. Keep up your good work	5	2020-09-01	POSITIVE	0.999876857	Bugs & Reliability
b407cd40-56c2-4de9-b604-68f347eed383	1	I like this App. Very much.	5	2020-09-01	POSITIVE	0.999838471	General Feedback
3f6b7165-956f-4b9c-893d-6e648136c14f	1	The old/previous version was better than this updated version.	1	2020-08-31	NEGATIVE	0.989705145	General Feedback
30abaeb7-16f1-4354-85a7-12f713cf7427	1	The App is very good. What I couldnot see is transfer history beyond one week, such as a month or two months. Is there any way to do that?	4	2020-08-30	POSITIVE	0.997806609	Transaction Performance
10846e4a-9a52-4c73-b215-5f57a9f6bde7	1	It was nice at the previous versions but at the new update it did not work anything!	1	2020-08-29	NEGATIVE	0.999671936	Bugs & Reliability, Feature Requests
f0c5e35a-acbf-41c9-9eb8-00018aea8b7f	1	The app is good..but where I get authorization key.	2	2020-08-29	NEGATIVE	0.558642149	General Feedback
2a22a001-a5bc-4840-b451-50a657ef5c4b	1	Would've given it 5 but sometimes it doesn't work properly. It's been 3 days since it stopped transferring money and buying airtime	4	2020-08-29	POSITIVE	0.999447525	Bugs & Reliability
9fa1bf9a-935e-41a6-b80c-4397e761fd39	1	Love it But Recently the app is unfuctional. Fix bugs	3	2020-08-28	NEUTRAL	0.997650206	Bugs & Reliability
432ddac0-f86e-4ef3-b860-99e523664016	1	User friendly app	5	2020-08-28	POSITIVE	0.991123080	User Interface & Experience
e2055764-ce06-455b-9ff7-72168772c0b6	1	This app is good but i cant download on my LG & samsung s6 phone it says 'its not compatible for this devices' so pls fix this problem guys & make the app to compatible for all phones pls pls...thanks.	2	2020-08-27	NEGATIVE	0.992113352	Bugs & Reliability
e53905df-9020-4e8c-bb66-82a9dde5ff00	1	It is moreover best if it works with differen accounts	5	2020-08-26	POSITIVE	0.996021688	Bugs & Reliability
c7df1d17-de82-4255-813a-c5996d7211df	1	Very much improved from the previous one. I really love it	4	2020-08-26	POSITIVE	0.999877930	General Feedback
c250db11-c2e9-4daf-9753-e68ff4d29b2a	1	Great App! ምርጥ ነው።	5	2020-08-13	POSITIVE	0.999606669	General Feedback
4446351c-4348-4baf-9277-244728bc7228	1	The old version stopped working for me and whenever that happens I had to go to my CBE branch and ask for help to get it reinstalled. I just updated it, and it worked like a charm with an elegant UI and very stable services.	5	2020-08-26	POSITIVE	0.999322057	Bugs & Reliability, Customer Support, User Interface & Experience
94eb502e-d602-43f9-891a-6c7ec5fbde9f	1	Solid app, but it will be good to have a 2 step security authentication before funds activity is comfirmed.	5	2020-08-25	POSITIVE	0.975772083	Security Concerns
064e45aa-e188-44bc-a0a3-7f7dd095a131	1	The app is not compatible with certain devices. For example, with samsung galaxy note edge.	2	2020-08-25	NEGATIVE	0.999648094	General Feedback
62691359-eeb7-47e7-b4bc-c4d750f8eb93	1	The application is not user freindly at all	2	2020-08-25	NEGATIVE	0.995290160	General Feedback
2556bf8f-ca7d-4f90-a92d-3ac81b7c2b33	1	Always sync failed	1	2020-08-25	NEGATIVE	0.999683142	Transaction Performance
cf27ae14-531e-4c6a-84f8-ff617d1c0491	1	It is good	4	2020-08-24	POSITIVE	0.999849439	General Feedback
ef1c27d9-deb2-4a1c-8248-bb4cfdbdfd99	1	Better from previous version but doesn't support to use more than 1 account with one phone no. And also once reinstalling the app. Need authentication and confirmation no from branch. I wish you can make it soon	3	2020-08-24	NEUTRAL	0.978594065	Customer Support, Feature Requests
bfc0e9e0-a8c6-45b6-9871-1e7149d242c5	1	The last update is so nice and interactive. Good job	5	2020-08-24	POSITIVE	0.999854565	Feature Requests
39156d8a-b3d4-4474-be36-442b817af541	1	This is really fantastic app	5	2020-08-24	POSITIVE	0.999865651	General Feedback
5595cb9b-4eac-45d5-99a0-ee36e2a6d9f8	1	Very poor as compared with the previous one.	1	2020-08-23	NEGATIVE	0.999800384	General Feedback
8fc3b91e-0dd5-4386-96e6-25c6da54073d	1	We'll designed user interface and easy to use app. Well done CBE. The last version was just boring and unattractive. This version looks so good that I'm seeing people logging in just to enjoy the view. Keep it up.	5	2020-08-22	POSITIVE	0.993129432	User Interface & Experience
e32440c5-d7a0-44ef-826e-75de643cda80	1	Dear developer, The new update says mybdevice is rooted and I cant use the app, However I amb100% sure that my device is not rooted. Please fix this bug ASAP as this issue iw ibservee on another galaxy S7 edge device	1	2020-08-21	NEGATIVE	0.992883325	Bugs & Reliability, Feature Requests
35dcc4d0-3448-4638-9202-775f516bf6e2	1	Arif app new!	5	2020-08-21	POSITIVE	0.977648795	General Feedback
f5d6ec77-b147-41a8-8655-18eb4f6ff515	1	It's not good	1	2020-08-21	NEGATIVE	0.999792039	General Feedback
52a5c726-3a44-4c55-aa6f-e850832036d3	1	Why it delay?	5	2020-08-21	POSITIVE	0.999263465	Transaction Performance
0ebe384f-2171-4720-97b9-227204cdd5a0	1	As i downloaded the app, I had and issue of the authorization code. I don't even get any notification that provides this code.	1	2020-08-20	NEGATIVE	0.999519229	Bugs & Reliability, Feature Requests
46b713af-0aeb-44f2-8dec-570e1e6f6089	1	How do i get authorization key?	3	2020-08-20	NEUTRAL	0.998010576	General Feedback
bb9eafef-700e-4b2c-b7da-03ae1a14fdbb	1	Good interface, but long waiting for synchronization. U better need to look at the backend infrastructure	4	2020-08-19	POSITIVE	0.995837569	User Interface & Experience
81fb5ae8-33ed-48cc-b667-7fa867b5b64d	1	Its that what i want good app	5	2020-08-19	POSITIVE	0.999382019	General Feedback
c72d2d3a-3137-4547-8e0a-587ce7991a0e	1	still now not not showing my balance but it open	3	2020-08-19	NEUTRAL	0.998880923	General Feedback
b85d66f4-4654-4b2a-9e2a-55cf02f57b74	1	I love this new version but it doesn't update the balance immediately	5	2020-08-19	POSITIVE	0.990622342	Feature Requests
7f071ffb-da8d-4cc3-ba4c-134597e595ce	1	This application has many problems, 1.This application requires physically going to bank to configure it for the first time. 2.It doesn't not have strong authentication policies 3. Unlike other bank applications it does not support username, password and email/phone number authentication 4. Sometimes it does not work	1	2020-08-19	NEGATIVE	0.999611795	Account Access Issues, Bugs & Reliability, Customer Support
c099de33-e463-4092-853a-1ff46b15b035	1	Very reliable and friendly for use!	5	2020-08-18	POSITIVE	0.999865055	Bugs & Reliability
63287d43-c842-40cb-bbea-dfcdfa65e41a	1	Better than pervious,Nice interface and looking. However , *better to include balance after each withdraw/deposit. *include water services ( You show it in the app but not there) *Make it Printable via bluetooth printer *	3	2020-08-18	NEUTRAL	0.987661719	User Interface & Experience
181b804b-3aa2-41a2-a83c-d11228f2b059	1	An amazing best application. U'r now more advanced.	5	2020-08-18	POSITIVE	0.999805510	General Feedback
a0900e29-f112-4cba-938f-032e9e777ac9	1	Most of the time it doesn't work	2	2020-08-18	NEGATIVE	0.999443114	Bugs & Reliability
c03ffd84-a571-46af-b4c0-65e134ebe153	1	How do i get the activation	3	2020-08-18	NEUTRAL	0.990279615	General Feedback
5e35dca2-98fc-445e-9228-12d2a24f2c4b	1	better user interface and very fast 👏👏	4	2020-08-17	POSITIVE	0.999294281	Transaction Performance, User Interface & Experience
88162d8b-6fdf-4077-aa77-8aea9bbd7dfd	1	What a massive improvement from the previous version!	5	2020-08-17	POSITIVE	0.999215603	General Feedback
8119b1cf-752d-4fec-a993-9168effb94cd	1	The new update is fantastic. The CBE app never looked better, faster and interactive. Good Job.	5	2020-08-16	POSITIVE	0.999710977	Feature Requests
f35b9b17-65cd-446d-84f8-dc4a78f19fbd	1	It's good for me	4	2020-08-16	POSITIVE	0.999853134	General Feedback
f4fcc859-e9cd-4c7d-b86b-2c080fda6b79	1	The new app is not compatible with my android phone,what shall I do? Since the previous one worked properly.	1	2020-08-16	NEGATIVE	0.999731719	General Feedback
8a46d7fa-b9f8-4d57-9bb7-32f6307eb622	1	On the previous version i used to have the remaining balance after each transaction, that was so helpful. But know its just the last remaining balance zat u can check. Zats not good	3	2020-08-16	NEUTRAL	0.999717891	Customer Support, Transaction Performance
c4b26529-acf9-40f4-8da8-32636f9929fe	1	This is realy an amazing payment apps i have ever seen. It is easy, beautiful user interface and light.	5	2020-08-15	POSITIVE	0.999867916	Transaction Performance, User Interface & Experience
48dfef53-40cd-4ffc-bfed-f4d8604d847e	1	The update is awesome	5	2020-08-14	POSITIVE	0.999870777	Feature Requests
9f543f62-470c-49e9-ac0e-9fbd7ad604f1	1	Very nice. Fast and easy. I love it.	5	2020-08-14	POSITIVE	0.999879956	Transaction Performance, User Interface & Experience
495031eb-0d44-4081-8f7f-6f70e0bba7ee	1	I'm living in China. Previously it was working even around the beginning of the new updated relased. Currently I can log in but it is not working after that. Is the new version is working out of Ethiopia or not?	5	2020-08-14	POSITIVE	0.998115659	Bugs & Reliability, Feature Requests
318d0da5-8ace-466d-b9e2-425247c679a5	1	This is awesome.	5	2020-08-13	POSITIVE	0.999868989	General Feedback
2bf96f34-6b47-4137-81c4-44b08c722e50	1	Very nice and easy to us better from the previous app	5	2020-08-13	POSITIVE	0.999771655	User Interface & Experience
e98bd4e1-e744-4282-a11f-a6c8667edc6b	1	I like it. Keep it up!	4	2020-08-12	POSITIVE	0.999880552	General Feedback
f8364be6-3b60-4eac-884b-4df746aa5678	1	Very smart app, but it's not compatible for all android version. So, please amend it since almost all users use mobile apparatus that have a version of below 6.	5	2020-08-11	POSITIVE	0.983145833	General Feedback
cc572dc6-bb92-4423-8cd1-a54c0be10bff	1	super fast and I can do everything in one place	5	2020-08-11	POSITIVE	0.999644995	Transaction Performance
abf72a41-b9dc-4fc4-8ab1-567c94e7f8c6	1	Good application Thank so	5	2020-08-11	POSITIVE	0.999852419	General Feedback
39602d93-e784-418e-924d-418d7d5524b0	1	Really I got it helpful It is easy to use It reduces time for transactions	5	2020-08-11	POSITIVE	0.882164836	Customer Support, Transaction Performance, User Interface & Experience
b9c661b6-b05c-4cbe-ab7a-3473d0c0a0d3	1	I like it but it would be better to show not only recent transactions and should add monthly statement	4	2020-08-11	POSITIVE	0.914629638	Feature Requests, Transaction Performance
ceb01a8c-214d-427b-ab08-421ebd362330	1	Now it looks great! We can use ever utilities as simple as it is. Thanks.	4	2020-08-11	POSITIVE	0.999777973	User Interface & Experience
1a33add7-ae33-4ab0-8e29-a008cb532a57	1	Better than the old one but the utility section doesn't seem to respond to any entry. Hope it gets fixed	3	2020-08-11	NEUTRAL	0.999256670	General Feedback
d284cdaa-433e-475f-8b58-a35456a59140	1	The most precious easy to access and secured app love	5	2020-08-11	POSITIVE	0.999137282	Account Access Issues, User Interface & Experience
1825c9ab-f04c-47aa-ba38-f91bf85eb13f	1	Better than the previous one	4	2020-08-10	POSITIVE	0.999740660	General Feedback
5ee75686-d36b-4f7c-84ff-e6182f20a1a3	1	Great app guys! Easy to use and sync automatically update.	5	2020-08-10	POSITIVE	0.999711096	Feature Requests, User Interface & Experience
0d244abd-23e7-4f9c-ada9-77937865a82c	1	The New Update is no1. It deserve 5 stars +. Good job CBE.	5	2020-08-10	POSITIVE	0.722396016	Feature Requests
9627afe5-6eb4-49cb-bdcf-3f32a50ebacb	1	It did not worked for me irrespctive of Internet connection!	1	2020-08-09	NEGATIVE	0.998635590	General Feedback
b0a4821d-9616-4617-9b3b-a4de1ff3a9bc	1	Zigale Kassa Bizuneh	5	2020-08-09	POSITIVE	0.951318026	General Feedback
20b71acf-e723-40be-8fe2-2e06524181a8	1	don't transfer to cebbirr	3	2020-08-09	NEUTRAL	0.925057352	Transaction Performance
59632ace-6e92-4ab3-83d3-1a438caace7f	1	Its amazing feature good CBE	5	2020-08-08	POSITIVE	0.999863505	Feature Requests
f65f0f12-c828-479b-ab3f-ab25df097a5e	1	Is not working on my phone how can i fix that pls help me	1	2020-08-08	NEGATIVE	0.999789655	Bugs & Reliability, Customer Support
f84085d9-52a1-47d6-9802-5f7a97109cb9	1	Wonderful and smart applicable	5	2020-08-08	POSITIVE	0.999871492	General Feedback
639fc43a-d435-46e9-beee-8ef87478761d	1	Its better,but it's not complete. E.g on access to AAWSA payment,can't add another account.	4	2020-08-07	POSITIVE	0.999667525	Account Access Issues, Feature Requests, Transaction Performance
32c21dad-bddb-4f86-ac7b-9d10ffa68cb9	1	Good features. And really very fast..! Amazing from CBE...!!	5	2020-08-07	POSITIVE	0.999881983	Feature Requests, Transaction Performance
5b1a75d1-d57f-4dba-aded-3f5e38381871	1	It's like being in a stone age	1	2020-08-07	NEGATIVE	0.685718000	General Feedback
519ef2db-a253-47df-b6a7-d878927f4e97	1	The old version was bad and difficult to login. but this one is amazing and user friendly.	5	2020-08-07	POSITIVE	0.999553025	Account Access Issues, User Interface & Experience
489e0660-203b-45b5-99db-c9c0be81653e	1	Good improvement it support Amharic font	5	2020-08-07	POSITIVE	0.998727858	Customer Support
5653553e-e7e8-419a-97bc-94ed95015b14	1	Very Nice Application.	5	2020-08-07	POSITIVE	0.999863386	General Feedback
f227b201-b0e7-474d-96db-716dd525a818	1	Much better than the previous, simple and user friendly. 👏	5	2020-08-07	POSITIVE	0.999618053	User Interface & Experience
6f142107-848b-4a90-b7f0-ca531a05ffea	1	It is beter than before	4	2020-08-07	POSITIVE	0.898861587	General Feedback
9692e487-a661-4eec-b034-599ba1045f81	1	wow nice application	5	2020-08-07	POSITIVE	0.999825656	General Feedback
f7dc1969-c547-4878-92de-af6f1af060f2	1	Its really a good app BZW	4	2020-08-07	POSITIVE	0.999821961	General Feedback
ac0230e1-9a6c-40f9-8bb4-94c6dd724c62	1	I see major improvements and I thank you personaly. But the total exiting after usage is non responsive. Try to solve it.	4	2020-08-07	POSITIVE	0.999637723	App Speed & Performance
d05f1089-52a4-443c-b81f-bf3b67940028	1	The frequent changing of the app by the developers and stop of mobile banking app is disturbing and disappointing. Why do this keep happening?	4	2020-08-07	POSITIVE	0.999687791	General Feedback
e062c201-8123-47dc-ac34-c314911e899c	1	Currently it's not working on my phone android 9 and Ram 6gb what's is the solution.	5	2020-08-07	POSITIVE	0.999637127	Bugs & Reliability
39cf2629-79f6-4c60-a5f3-c9f4c33f8916	1	How to get authorization code?	1	2020-08-07	NEGATIVE	0.998321235	General Feedback
f8265960-6fea-4215-83e9-26499c61854d	1	Previous update didnt work but now everything seems to be working,	4	2020-08-06	POSITIVE	0.994082987	Bugs & Reliability, Feature Requests
192ba1b9-60e2-4e68-acc0-ec88e07e3c2d	1	Just great app	5	2020-08-06	POSITIVE	0.999850988	General Feedback
46f7ddd0-3510-4750-bff5-48847e6540f1	1	Great problem solver application. Thank you.	5	2020-08-06	POSITIVE	0.999853492	Bugs & Reliability
ab65c538-7f92-4f45-b8a7-0bcf81ee6b90	1	The new version of the app is awesome!	4	2020-08-06	POSITIVE	0.999838948	Feature Requests
f585675f-8ad1-4f47-bc85-9ca9461dc944	1	how to get autorized key	3	2020-08-06	NEUTRAL	0.992726922	General Feedback
044af429-b7b5-470b-9818-1e45d4071ddc	1	Obviously it is improved, but still it lucks exit interface, please fix it	4	2020-08-06	POSITIVE	0.995753288	Bugs & Reliability, User Interface & Experience
76070796-b827-4920-ac87-578eab29449f	1	The new update is user-friendly, interactive and packed with new features. 5 stars!	5	2020-08-06	POSITIVE	0.998799682	Feature Requests
930ee90a-6eda-44c4-8b49-746525c0cb27	1	Nice application. Very easy to use.	4	2020-08-06	POSITIVE	0.999801099	User Interface & Experience
8d0e80f0-efa9-4cbf-bcc9-dc15aeefb048	1	ዋው ደስ ይላል	5	2020-08-06	POSITIVE	0.833725393	General Feedback
bcaabc22-66fb-47d8-a425-6223b3f11863	1	Good cbe app	5	2020-08-06	POSITIVE	0.999489188	General Feedback
78a14439-0472-409e-a426-b448b19c2e9f	1	The current version is a vast improvement.	4	2020-08-06	POSITIVE	0.998621345	General Feedback
d0c39b36-3c5c-4b91-b473-fc172c7bd293	1	It seems good now.	5	2020-08-06	POSITIVE	0.999844193	General Feedback
6bdace1c-179c-4405-8b6a-16e1304cf687	1	Easy & attractive !	4	2020-08-06	POSITIVE	0.999844074	User Interface & Experience
1132baf4-1d4e-4746-834e-506b36a35e67	1	Make it available to all smart phone. It selects some phone to be down load from play store. It also better to be transfer through xenders . Better from previous one but need some support to be available to all smart phone.	5	2020-08-05	POSITIVE	0.991781056	Customer Support, Transaction Performance
fe05011c-408b-4f94-a20b-4592f267f8ec	1	Awesome!! Better also include AAWSA payment in the utility group as CBE birr payment doesn't show detail about the meter reading and also month of payment.	4	2020-08-04	POSITIVE	0.990204334	Transaction Performance
b04fafbd-df6c-4731-ab57-788e07e6b191	1	Best mobile banking	5	2020-08-04	POSITIVE	0.999730527	General Feedback
451f6ca4-7c22-4ccd-b473-f4914aea59a7	1	Better UI and functionalities . which is best for me.	4	2020-08-04	POSITIVE	0.979291856	User Interface & Experience
4231ac43-6ed6-42b6-9fc6-d456c339dc70	1	Good App, and thousands of time better than the previous App, keep it up...	5	2020-08-03	POSITIVE	0.999805510	General Feedback
d449e369-b08e-4dbf-aefd-5c8ea0f5103b	1	For starters,the app is by far better than the previous one.It has better graphics,fast synchronization and it's easy to use.But what I don't understand is that first why is it so difficult for you guys to add a "forgot pin" link in the login page? Why is it every time a user forgots his/her pin,they had to go to their branch? it's very frustrating and not expected from a banking app of such a giant bank.Secondly,the "Accounts" and "Recents" sub menus at the bottom have exactly the same features	2	2020-08-02	NEGATIVE	0.996593773	Account Access Issues, Feature Requests, Transaction Performance, User Interface & Experience
baa7bd9e-79b8-4af7-9b9c-478091559a88	1	I love it so much for its nice user interface and massive improvement. One much important thing it lacks is that, it synchronizes #ONLY-ONE account per app. For this reason, people (customers) who had >/= 2 accounts for different reasons, are obliged to visit the local CBE branch, which is unadvisable especially during COVID-19 era. I hope you will do your best on it.	4	2020-08-02	POSITIVE	0.843257964	User Interface & Experience
f56cce50-bc83-4d3f-b672-39c3d86316ba	1	The old one was very bad and clumsy. every time I tried to login there was a problem with synchronization, because of that I was close to clear my account from CBE and open a new one in privet bank, as they cares about their customers. In other hand the new one is perfect and shows a little bit reformation in the Headquarter and this makes us to trust this bank again.	4	2020-08-01	POSITIVE	0.996038079	Account Access Issues, Bugs & Reliability, Security Concerns
c9668bb9-91ad-4b66-99f1-b1baaf32f4fd	1	its not working properly	2	2020-08-01	NEGATIVE	0.999790609	Bugs & Reliability
dbcc0100-32ce-4d44-bf89-e31ce8a3da54	1	I am trying it now	5	2020-07-31	POSITIVE	0.996368527	General Feedback
79293336-209d-496f-8805-79557d4704f2	1	The upgread is perfect and loved the new system could be accessed from any branch if u face problem in the application. The other thing if possible to add would be to expand the number of transaction be looked for all transaction back to a month period at list this will help review most transactions if there needs any review. The only problem I saw is that once a phone number is attached to another bank account # you need to provide another phone number to get the service. The rest is excellent	4	2020-07-31	POSITIVE	0.989372313	Bugs & Reliability, Customer Support, Feature Requests, Transaction Performance
683043e5-6944-4997-b0df-b09e30944fd6	1	Not working...now I'm out of Ethiopia. Sync failed...any suggestions or solution	3	2020-07-31	NEUTRAL	0.999790609	Bugs & Reliability, Feature Requests, Transaction Performance
6c701da9-383c-444e-bcca-cdb1d05ef143	1	The new application is good interms of interface but the old one works better faster this one lags you have to work on it	1	2020-07-31	NEGATIVE	0.994542181	App Speed & Performance, Bugs & Reliability, User Interface & Experience
148fd72b-9d14-4634-82f6-6b90b06f994c	1	It is good i like it.	5	2020-07-31	POSITIVE	0.999860644	General Feedback
2dc7b954-0df0-45fc-bb08-b9171fdd3e79	1	I am proud that CBE upgrade this app!!	5	2020-07-31	POSITIVE	0.999140739	General Feedback
1eb06feb-ab0f-4214-acd7-f6ebe5a791dc	1	ቀደም ሲል ኢትዮጵያ በነበረኩበት ጊዜ ሞባይል ባንኪንግ እጠቀም ነበረ። ከዛ ለትምህርት ወደ ሩሲያ ሞስኮ ሔድኩኝ ። እዚህም እያለሁ ላለፋት ሁለት ዓመታት በትክክል ይሠራ ነበረ ። ነገር ግን አሁን አድሱ መተግበሪያ / አፑ ከከፈተ በኋላ እየተሽከረከረ አይከፍትም ። በዚህም የተነሳ ለምፈልገው ነገር ሁሉ መጠቀም አልቻልኩም ። ነገር ግን በየጊዜው ማሻሻያ መደረጉ የሚበረታታ ነው ።	3	2020-07-31	NEUTRAL	0.963773787	General Feedback
569ea962-b2af-4357-983e-e8fd1fc7f8ff	1	Better than the previous apps, you can get the current balance with the acct.numer without too much ado.	5	2020-07-30	POSITIVE	0.998139858	General Feedback
69342eb4-96df-4c4f-b135-cc8f8ac6677e	1	It's a very nice and friendly application	5	2020-07-30	POSITIVE	0.999871492	General Feedback
20b13ffb-509e-467f-b062-fee17600fd4f	1	Does not work properly	1	2020-07-29	NEGATIVE	0.999775350	Bugs & Reliability
ed9161a9-a947-4ef2-9670-b33dded3675f	1	The page has synchronization issues at first entry, the balance display page will sync after entered one of the front icon and get back to the previous page.	3	2020-07-28	NEUTRAL	0.995119333	Bugs & Reliability
cff6e8f6-b9a6-4959-9547-c7ba44430c85	1	I have updated the june 28 version then it is not workings all. Considering the current Covid 19 pandemic you should make the system more friendly to avoid physical visit to the bank . i just don't get it why CBE is always two steep back in making the process more easy .	1	2020-07-28	NEGATIVE	0.995843828	User Interface & Experience
730923e8-3956-45bb-a162-5eb740c04dff	1	Too much slow n not working most of the time. "Processing" "sync failed"... pls some one tell me how i can remove the update n use the pervious version??	1	2020-07-28	NEGATIVE	0.999793231	App Speed & Performance, Bugs & Reliability, Feature Requests, Transaction Performance
60835448-3f2a-4f8f-b2e6-dd0e1c91946b	1	What an amazing updated app... There are many new features zat i wishs before thnaks cbe... Am also cbe staff.	5	2020-07-27	POSITIVE	0.999600351	Feature Requests
d598dead-947a-4720-a409-3d1ed141c337	1	Nice update 👍 . Cheese 🤛👍 IT mans good job.	5	2020-07-27	POSITIVE	0.992323399	Feature Requests
56944fe7-c921-47ba-a4ba-27cebe9e996b	1	Does not work after update	1	2019-03-29	NEGATIVE	0.999697924	Bugs & Reliability, Feature Requests
75349e93-40fd-4119-9c54-682273ec34dc	1	When you refresh your account it's slow and it doesn't tell you the latest update time. This means you don't know whether the figure you see is old or new. This upgrade was actually a downgrade!	1	2020-07-27	NEGATIVE	0.999667645	App Speed & Performance, Feature Requests, Transaction Performance
ab34474e-bf7a-4fdf-9986-8e5dfd4d21e1	1	Mobile topup not working	1	2020-07-27	NEGATIVE	0.999680758	Bugs & Reliability
a15d9d24-2721-4305-b475-337a2a3145cd	1	I am out of Ethiopia I used to this app.It's very nice to use. but now I can't use. Also i tried the new version 4.1 and it doesn't work. I can't check my balance,transfer.... please help me!! how to solve the following problems? => can't sync & => none available	4	2020-07-27	POSITIVE	0.998662710	Bugs & Reliability, Customer Support, Feature Requests, Transaction Performance
46f9fb4f-4304-400c-9745-17d686ae8f8b	1	Well done guys!	5	2020-07-27	POSITIVE	0.999840975	General Feedback
24ffdfc1-a50b-4dd4-a102-370a052442b5	1	It is a nice app compared to the previous one. I appreciate you have included local language but the details in the Amharic section will return to English mode, please fix that problem plus additional local language will increase its usability. Also it would be nice if the terms and conditions agreements, security tips, charge and transfer limits.... are included in the app.	4	2020-07-26	POSITIVE	0.988036394	Bugs & Reliability, Security Concerns, Transaction Performance
49ba33fc-722d-4d01-9861-49d9de0b890c	1	I like the graphics! And, it syncs very easily.	5	2020-07-25	POSITIVE	0.999769866	General Feedback
c83ec4e0-788c-4e10-b7a2-15a6a73dc348	1	The updated app is attractive and is working very well. Forced to revise my previous rating of 2 star to 4 star. Hope it will keep on working! Rated it excellent for the past years. Revised my review after it keeps on crashing in 2019 and installing it for a second time in less than 3 months. Please work on the problems.	4	2020-07-25	POSITIVE	0.999178708	Bugs & Reliability
f51a87f1-f396-415f-a384-fc072351fdad	1	It asks me download authorisation code, and I didn't know it. Please help! I want to use this app now!	5	2020-07-25	POSITIVE	0.987684965	Customer Support
82ff87fc-dc4f-4eef-bbac-f2adada62d47	1	That is good, it would be even better if we can access account satement at a point in time.	5	2020-07-25	POSITIVE	0.987550914	Account Access Issues
811de5bb-8258-43ce-a97e-ae6a8c2b4c55	1	It is greatly improved and user friendly.i really , enjoy and loved it.	5	2020-07-25	POSITIVE	0.999887824	User Interface & Experience
9a9c1e99-baba-42db-9d40-9b940ed3c55b	1	This update is not totally working on my android 10.I try to reinstall and get the authorization key from branch but it always says authentication failed .Is the any one who cam help?	1	2020-07-24	NEGATIVE	0.999763429	Customer Support, Feature Requests, Transaction Performance
098198b0-359c-4237-9b1a-a71d32d1b8ba	1	The previous version was working fine but after update it said that my device was rooted, even though it wasn't, and it didn't work. I had to reinstall the previous one.	1	2020-07-24	NEGATIVE	0.954558015	Bugs & Reliability, Feature Requests
09b4e00f-b525-4d7b-b471-0f8e272e1de1	1	Simetimes not working but as a biginig nice	3	2020-07-24	NEUTRAL	0.997050285	Bugs & Reliability
4995f2d1-33c1-418a-82b3-4dd9b734d88f	1	Good but Not compatable for all android phones	3	2020-07-24	NEUTRAL	0.917585731	General Feedback
7eb8fd59-49e4-4be3-b107-63bad0d04864	1	CBE is coming with the updated technology. I am proud to be a customer and staff of this honored Bank. Please make an improvement on app exit request.( 'Are you sure to exit' yes or no)	5	2020-07-24	POSITIVE	0.990770578	General Feedback
ffa00c1d-6155-4f82-9bf0-f0fc57ca85a4	1	It can't download the application right now BCD of rooting	1	2020-07-23	NEGATIVE	0.998127997	General Feedback
c14afeb0-f5ad-4732-a1bd-36b0fbcf2419	1	Amazing update but topup is not working properly!	5	2020-07-23	POSITIVE	0.999609768	Bugs & Reliability, Feature Requests
04cf5aa1-b878-41a5-9548-3f2a6086037a	1	Fantastic app! Very good job dear developers! Better than the previous one as it is user friendly!	5	2020-07-23	POSITIVE	0.999810874	User Interface & Experience
3ece1c3c-e661-4011-a8ed-a0f9af1b06fa	1	Much better version!	5	2020-07-23	POSITIVE	0.998466372	General Feedback
eac0a865-b3eb-4c04-a37b-dd0b7e93cbbb	1	It cannot start. The old version was working perfectly. I am currently out of Ethiopia and cannot go to the bank to see what is the problem. Now I have no access to my account and with coronavirus travel restrictions, cannot go back to Ethiopia either. Is it possible to get an authorization key so that user can remotely reinstall/register the app?	1	2020-07-23	NEGATIVE	0.946600199	Account Access Issues, Bugs & Reliability
721949e8-d57c-4bc0-80c0-1e10b4ccfd59	1	A Perfect app but try to fix logout problem.	4	2020-07-22	POSITIVE	0.996322393	Bugs & Reliability
0a801366-b153-4b48-a6f0-96a94de489d8	1	It's better than previous	5	2020-07-22	POSITIVE	0.999815643	General Feedback
14c5fadf-0269-439a-a7dc-aaeb5256df0b	1	How can I get authorization key to access my bank account through mobile CBE app? I zipped it due to space issue and when I try to unzip the app it stop working. Now, I have to process all the steps again. How can I do that as I am not currently in Ethiopia to access my account? Please please please support me	2	2020-07-20	NEGATIVE	0.998068273	Account Access Issues, Bugs & Reliability, Customer Support
6df2bfe2-9e4d-4bfb-a537-d4c781e6a1c6	1	Your last update is wonderful ...nice app	4	2020-07-17	POSITIVE	0.999875307	Feature Requests
2c8d9f6e-39b4-4194-b344-f3e2f79b573a	1	Nice feature poor performance..... need upgrades on top up....it doesn't work.	1	2020-07-17	NEGATIVE	0.998257101	App Speed & Performance, Bugs & Reliability, Feature Requests
b5955b32-0781-42b7-953d-8cffb1965d6f	1	I deleted the app and redownloaded it again but I couldn't connect because it asks an authorisation key number....how do I know it	2	2020-07-16	NEGATIVE	0.999574602	General Feedback
67e43f0f-94a6-41a1-900b-94a5a927f8b6	1	Great. Specialy after update	4	2020-07-16	POSITIVE	0.999861002	Feature Requests
2874e948-8ca6-4897-a207-a0e81b561353	1	በጣም ቀላል እና ምቹ መገልገያ ነው። የCBE Birr መገልገያ ተመሳሳይ App ቢኖረው መልካም ነው። 👍	5	2020-07-16	POSITIVE	0.982450247	General Feedback
1ed447d0-40b0-483a-9bd9-7e201b88e934	1	New Update Is A Huge Improvement. Very Nice Interface. Version 4.1 Is The Best Yet. Keep It Up. I Have One Suggestion, Make The App Able To Sync Multiple Accounts Not Just One.	5	2020-07-16	POSITIVE	0.999728143	Feature Requests, User Interface & Experience
b3b073e8-5f17-42ba-9a37-bd05494e29ee	1	Very Good app, but needs some modifications.	4	2020-07-15	POSITIVE	0.936922789	Feature Requests
c8864226-6257-4c40-baa6-e3e01f673df2	1	I Live Out Of Ethiopia I Send My Money to My Cbe Account But I Don Have Mobile Banking how Can I Open Please Help Me	3	2020-07-12	NEUTRAL	0.977446616	Customer Support, Transaction Performance
8148fe69-b7ee-4e78-b2f8-e995e46369ed	1	First time tha i get happy by CBE's achievements. Congrats CBE Simple to use and uptodate. Go on and it will be nice if you add the investment options so that we can invest online too. Good Job	5	2020-07-08	POSITIVE	0.999692798	Feature Requests, User Interface & Experience
bca7ca77-95d8-466d-8d03-e220e5cee66c	1	Please solve problems very soon The app is denied to activate	1	2020-06-30	NEGATIVE	0.999134362	Bugs & Reliability
b8f1112f-bf2e-46b1-9921-2d09a55337e6	1	Improved very much	5	2020-06-30	POSITIVE	0.999848127	General Feedback
aa82524f-7040-45ef-8006-83ea6ab08d0e	1	Nice Improvent in the GUI from CBE but we'll see it the near future if the app has any crashes	4	2020-06-29	POSITIVE	0.936716080	Bugs & Reliability
9a378eec-d02c-498f-9118-23738ee38010	1	what a nice!. user friendly, easy to access, updated, Amharic supported, error solved and well developed app.	5	2020-06-29	POSITIVE	0.999262750	Account Access Issues, Bugs & Reliability, User Interface & Experience
3c4b9679-37bb-4f36-8cfa-205209204434	1	Wonderful app thanks for changing the oldq one, Good Job!	5	2020-06-29	POSITIVE	0.999782264	General Feedback
9dc1fe13-3a91-4f62-9a74-01887d1b53f3	1	Recent update is very good. User interface has been redesigned and it's really awesome. Only downside is that you can't see all of recent transactions, it is limited to some and there is no way to see older transactions. Apart from that CBE has done a good job in revitalizing the old app.	4	2020-06-29	POSITIVE	0.998928010	Feature Requests, Transaction Performance, User Interface & Experience
2c3221d2-3989-4249-9760-10d811cc93c7	1	Good keep it up	5	2020-06-29	POSITIVE	0.999856830	General Feedback
99cabfb1-1901-4b71-846c-81ae4e39736b	1	This ought to be a major update in a while. The graphical user interface has been well improved. However, a very important feature that used to exist in the old versions, which used to allow the user to transfer money within his own accounts in the CBE at ease has to be reinstated back.	3	2020-06-29	NEUTRAL	0.932979584	Feature Requests, Transaction Performance, User Interface & Experience
ad2d3d2d-88e5-422d-91a7-4e80e185a32e	1	Its nice user interface...I hope you fix synchronisation fail problems that is common in before apk. In before apk if you are in middle of try to send the money and unfortunately internet is disconnected or someone is call you , the application say to you synchronisation is fail ..try to restart my phone or off and on internet the application never work again.. I call 951 but never get any support .	4	2020-06-28	POSITIVE	0.998656154	Bugs & Reliability, Customer Support, Transaction Performance, User Interface & Experience
badd717c-d31d-4278-bb60-d9c2b39e34af	1	Better than previous app	5	2020-06-28	POSITIVE	0.999580801	General Feedback
fb4648f3-1fb6-4ea3-b201-4eae36067456	1	Make it USSD not showing pin	5	2020-06-28	POSITIVE	0.998587251	General Feedback
229d3fda-815e-4276-9cdb-f4dbf30f4668	1	It is clear and nice application. Becuase it is more Userfriend app.	5	2020-06-28	POSITIVE	0.997137308	General Feedback
04e71b8f-0d9b-46f2-a9e4-97aaae751702	1	It keeps on crashing after the update.	1	2020-06-27	NEGATIVE	0.988327324	Feature Requests
5cd7d0ca-0b0b-46f8-b959-2c16dd4e1481	1	Thank you for the update. It has been a long long time since the last update, now it seems cool than the old boring one.	5	2020-06-27	POSITIVE	0.759366512	Feature Requests
e80110d4-51d8-476e-b02e-2cf329f58ffa	1	It have improved... I like this version but if I can see all the month statment is best!	5	2020-06-27	POSITIVE	0.999458492	General Feedback
939d455e-2152-4b7f-86d7-08ae01ad42b5	1	It is a very good app; but as a comment, the signs in the app should have their own unique color. For example, the Top up sign should have the color of ethiotelecom.	4	2020-06-27	POSITIVE	0.896889627	General Feedback
aa81e4e5-245f-4a02-b9c4-f5bf0294cdaa	1	Unfortunatly the app stoped working all the time when i try to run it	1	2020-06-27	NEGATIVE	0.998835742	General Feedback
758bc07e-0718-4a88-b89c-84425fd48144	1	Soooooo wonderful application	4	2020-06-27	POSITIVE	0.999863982	General Feedback
bc863e25-6d53-4b3a-984b-99f737fb714a	1	App is not opening after update	5	2020-06-27	POSITIVE	0.996737182	Feature Requests
ede8db17-1518-41c8-b49b-7620e9493c7d	1	It's good app, you need upgrade continuously Thank you	5	2020-06-26	POSITIVE	0.999795854	General Feedback
b0897c1e-fde0-42f2-9805-6eb5a7a8d19e	1	Happy to have ACCOUNT with CBE. Thank you for the new mobile banking app which can help the customer for settlement of their bills.	5	2020-06-26	POSITIVE	0.999786437	Customer Support
3889d897-08e6-40c0-bc2b-185af4a92044	1	I am very proud of my bank. It is such a remarkable application ever.	5	2020-06-26	POSITIVE	0.999882579	General Feedback
3102bbe3-d330-485c-9029-961f65c27f29	1	With your new CBE mobile app version, it is gonna be alright and much interactice I hope. However, using it in weaker internet connection is often tiring... 4 issues... 1. One thing, please allow the use to subscribe or unsubscribe from the service without the subscriber requiring him to come to your office in person.... 2. You may also introduce two-factor authorization, like if someone even has got your pin, 3. Consider includng water billing and 4.update your apps often work on improvements	3	2020-06-26	NEUTRAL	0.991098821	Bugs & Reliability, Feature Requests
5f2922fc-bb12-493c-8f20-3999f039ce3c	1	This one is better than the earlier version. It still needs more to show info	4	2020-06-26	POSITIVE	0.985127747	Feature Requests
2ca4eb1a-f444-4bbd-920b-d361522aea9e	1	It works perfectly for me and has many options......5 star......	5	2020-06-26	POSITIVE	0.999814928	Bugs & Reliability, Feature Requests
29de6abd-73f2-45ee-8080-8ce28abe3458	1	Its very nice!👌	5	2020-06-26	POSITIVE	0.999854565	General Feedback
6acb88c9-1129-4612-b905-0d5a4023c024	1	Not working... it says. Can't Sync...	1	2020-06-26	NEGATIVE	0.999809563	Bugs & Reliability
abf6dec7-a30a-4557-b3ea-76e6f9533930	1	Nice view layout	5	2020-06-25	POSITIVE	0.999855042	User Interface & Experience
8100b2ed-08f8-43b0-aed4-1a8ffe83761a	1	Good look and easy to use.	5	2020-06-25	POSITIVE	0.999867678	User Interface & Experience
8583756a-6584-4e22-bb68-9f433a252eb3	1	Upgraded to user friendly	5	2020-06-25	POSITIVE	0.984495461	User Interface & Experience
999dace7-162a-47cd-825b-235d6130943c	1	ur update is so rubbish.. it crash when u login... and after all this comments you didn't do anything.. you should remove it or replace it with the old working version...or either tell us what to do.	1	2019-04-01	NEGATIVE	0.999800742	Account Access Issues, Bugs & Reliability, Feature Requests
a183f035-d7fd-4db0-ac13-1a33340764dc	1	can you please fix the problem, I'm overseas and can't get to CBE branch for a fix, PLEASE DO SOMETHING!! start by removing it from play store until you figure out what the issue is!	1	2019-03-31	NEGATIVE	0.998467028	Bugs & Reliability
82cdf289-0d46-4649-8f15-4056e1200abd	1	the new app is not integrating with the system... fix it.	1	2019-03-30	NEGATIVE	0.999779165	Bugs & Reliability
dd43b898-78e4-4227-b01b-096f9620458f	1	whre can i get the donload authorization code	1	2019-03-28	NEGATIVE	0.999173701	General Feedback
9dd05bc4-0c56-4190-a97c-aaadd003ebe8	1	Can't log in	3	2019-03-28	NEUTRAL	0.998176217	General Feedback
cbf0ec60-96ac-4ca5-9436-e174c3507ad2	1	after updating the app it never works. Let alone giving a star if there was a negative star, i would have given you negative start. how could a biggest bank in a country doesn't have good app. ለማንኛውም ግን ማፈሪያ ባንክ ነው !!	1	2019-03-26	NEGATIVE	0.999724567	Bugs & Reliability
ff96cfac-a0d2-44ad-846e-0c74887bfe56	1	frequently failed and needs authorization.	2	2019-03-26	NEGATIVE	0.999500513	Feature Requests, Transaction Performance
cdb28783-4222-44b3-9c67-c54ee4e4044a	1	app not working after update if ur not aware of it already care to do something about it?	1	2019-03-26	NEGATIVE	0.999330640	Bugs & Reliability, Feature Requests
2095af40-d9bf-4753-85d3-3d5a9a1a9f8c	1	please do something about the app!! the new update is useless!!!	1	2019-03-25	NEGATIVE	0.999782979	Feature Requests
70a5c0eb-f3f0-47fd-be43-f329e05fc5be	1	ባለፈው ግዜ የተሻለ ሃሳብ ሰጥቼ ነበር፣ አጋጣሚ ሁኖ አሁን ሃሳቤን ቀይሬ አለሁኝ፣ የኮከብ ደረጃም ከ5 ወደ አንድ ለማውረድ ተገድጄ አለሁኝ፣ አፕዴት አድርጎ የተሻሻለ አፕልኬሽን ለዛውም የፋይናንስ እንዴት ክራሽ ልያደርግ ይችላል፣ ከሃገር ውጭ ሁኜ አካውንት ማንቀሳቀስ አስችሎኝ ነበር ክራሽ በማድረጉ እና እንደገና አክትቬሽን ኮድ በመፈለጉ፣ ሃገር ቤት እስክመለስ እንዳልጠቀም አድርጎኛል። ለቀጣይ በተሻለ መልኩ ተሳራላችሁ ብየ ተስፋ አለኝ!!	1	2019-03-25	NEGATIVE	0.780064523	General Feedback
857b4418-cd34-46f6-917f-e3c4a33a376a	1	why this app is trash,cannot open using my pin,please do something with this issue	1	2019-03-24	NEGATIVE	0.998774111	Bugs & Reliability
117c35e1-4525-4cce-8a2e-72b435c8f581	1	I was using this up for while but after I logged out for several weeks and tried it again it failed to log in .. then I Uninstall the and tried it again after reinstall but somehow it needs a verification code form CBE	2	2019-03-22	NEGATIVE	0.999572098	Account Access Issues, Feature Requests, Transaction Performance
26aedc65-f897-4152-b0cc-fad996292685	1	I just update this week it won't open now. Please fix it asap	4	2019-03-21	POSITIVE	0.997276604	Bugs & Reliability, Feature Requests
8f028721-0e9e-4709-8bc6-6167040d5328	1	Best application for me.	4	2019-03-21	POSITIVE	0.999048412	General Feedback
9bf683a7-b0c4-4ada-bde4-27c5d3099a12	1	app is crashing with the new update. please fix it as soon as possible. I am in another country and not able to make transactions. Please, are you reading the reviews? Guys does anyone know if it works by uninstalling and reinstalling without needing to go the bank??	1	2019-03-21	NEGATIVE	0.999602616	Bugs & Reliability, Feature Requests, Transaction Performance
afb389c9-e26f-4da0-93ea-a3967535b34d	1	Version 2 not working correctly	3	2019-03-21	NEUTRAL	0.999800265	Bugs & Reliability
91ab0ccf-e658-4cc9-9229-42471a2c835f	1	The very important App for us.	5	2019-03-20	POSITIVE	0.998983204	General Feedback
b19ea8be-97b4-41e4-b3c5-30c558b14d91	1	its very annoying a company with this size doesn't respond to it's customer.very arrogant and ignorant	1	2019-03-19	NEGATIVE	0.999621272	General Feedback
14999739-b84c-45b5-842a-4a245d2ba3e6	1	Please try to link the updated version.	2	2019-03-19	NEGATIVE	0.988763809	General Feedback
289044be-99c5-4a65-a2b2-4e197b35880c	1	Very Good App but add some Transactions list	3	2019-03-18	NEUTRAL	0.997998893	Feature Requests, Transaction Performance
7765453e-bf14-45ee-ab3a-84b7a0c91c3b	1	crashes after update for v2. please reply for comments asap.	1	2019-03-17	NEGATIVE	0.999655962	Bugs & Reliability, Feature Requests
78cedc79-a705-44f4-ba07-4688a9975c40	1	very very very useful	5	2019-03-17	POSITIVE	0.999827504	General Feedback
169cc767-cfe1-4c8e-b5bd-25991e8c0f04	1	one day it just has stopped in the middle of no where and left me helpless. i was to transfer money to my brother for an urgent school fee.	4	2019-03-17	POSITIVE	0.999242783	Transaction Performance
4dcbc95b-9101-4243-8d8b-d32994118f4b	1	what is going on with this app it's not working at all	1	2019-03-15	NEGATIVE	0.999777615	Bugs & Reliability
53fac8e5-b6ab-44d4-bf53-e89d415b1830	1	With the recent update, I faced a serious problem similar to those mentioned by others. Hence I have to uninstall and reinstall the app...and it is working well now. I strongly suggest if CBE makes a regular check and take a quick corrective actions on reviews made by customers!!!	3	2019-03-14	NEUTRAL	0.996294081	Bugs & Reliability, Feature Requests, Transaction Performance
16d5a157-76af-4d99-89aa-2b7fceb9a02b	1	update NOT Working	1	2019-03-14	NEGATIVE	0.999742925	Bugs & Reliability, Feature Requests
48585917-7874-4fea-a428-ef36b48b2eb4	1	After the recent update the application is getting crashed. Kindly fix the bug soon.	1	2019-03-14	NEGATIVE	0.997223854	Bugs & Reliability, Feature Requests
1e79e142-41e8-486b-b632-48108e5718a6	1	Crashed after update. Pls release fix asap.	1	2019-03-14	NEGATIVE	0.999716341	Bugs & Reliability, Feature Requests
b248dd81-f2e3-4773-9680-c0cba589b51e	1	Absolute trash after an update	1	2019-03-14	NEGATIVE	0.999800026	Feature Requests
27dff553-a18b-4811-8dae-c51edd577d09	1	Crashed after update	1	2019-03-13	NEGATIVE	0.999679565	Feature Requests
37f13d7d-3de6-44f6-8ce1-bfa4560fe1bf	1	App still crushing after entering pin! And still no response from tech support!!!!	1	2019-03-13	NEGATIVE	0.999493241	Customer Support
68030b11-a6b1-44db-8535-ef36118ed8cd	1	sms code did not work	2	2019-03-13	NEGATIVE	0.999776304	Bugs & Reliability
87481693-f815-4be7-a0a9-01f12c1edbc0	1	not working after i update	1	2019-03-12	NEGATIVE	0.999649882	Bugs & Reliability, Feature Requests
d3149198-06fc-44d1-a411-61110d62d3a2	1	It has been a week since it stop working. How it doesn't work after UPDATE? Need attention. CBE, Please correct it!	1	2019-03-12	NEGATIVE	0.996610701	Bugs & Reliability, Feature Requests
953ed6f4-4909-405f-b2aa-5793b74ccf61	1	Crashes after update, shame.	1	2019-03-12	NEGATIVE	0.999749482	Bugs & Reliability, Feature Requests
129e675e-e5dd-44ca-b69a-6083bd61dcce	1	After updating the app stops working.	1	2019-03-11	NEGATIVE	0.999741375	General Feedback
dc977d28-eee4-44ea-9d8a-463391c30e69	1	the app is crashing after update. please fix the problem or let us what to do.	5	2019-03-10	POSITIVE	0.999615908	Bugs & Reliability, Feature Requests
d28961b7-f8d3-43f4-8f74-e6b1cde08875	1	New update is very poor. Immediately crashes after Entering pin.	1	2019-03-10	NEGATIVE	0.999743640	Bugs & Reliability, Feature Requests
fd02123f-568a-40a1-848c-55688c2a4e6e	1	difficult on using occasional time.	1	2019-03-09	NEGATIVE	0.999194205	User Interface & Experience
226a4071-18c0-408f-8fdb-4668cc32bfb3	1	Please don't release update because after update it says unfortunately stoped! what is wrong?ohhh	2	2019-03-09	NEGATIVE	0.999634743	Feature Requests
5303d0d8-df8d-490f-bae7-901ee2732d1a	1	was working fine, but now it crashes after the update and lots of people are complaining about it but you chose to keep silent	1	2019-03-08	NEGATIVE	0.996689320	Bugs & Reliability, Feature Requests
84000685-04c2-4af1-a188-4202f2aaecb5	1	I recently updated this app but it completely stop responding...this is very sad,can't even run my business deals.	1	2019-03-08	NEGATIVE	0.999653935	General Feedback
757ccdd6-5057-4ace-a1e0-feafbf2d767f	1	update doesn't work	1	2019-03-08	NEGATIVE	0.999770582	Bugs & Reliability, Feature Requests
e947eb17-4cc0-4f3b-b6ae-5d95c596a693	1	it is not working totally after update.	1	2019-03-08	NEGATIVE	0.999780118	Bugs & Reliability, Feature Requests
f8812fd4-c13f-4c2c-b72d-b1f549a2f142	1	This app is mot working after the recent update.	1	2019-03-07	NEGATIVE	0.998453140	Feature Requests
6df3fef2-433e-470f-8109-7914a1a55107	1	this update is was not working	1	2019-03-07	NEGATIVE	0.999773562	Bugs & Reliability, Feature Requests
ba85958b-68f1-4699-b0c2-cca1ab966a22	1	crashing crashing and crashing fix it	1	2019-03-07	NEGATIVE	0.994541585	Bugs & Reliability
fbd53fa0-04bf-4363-8e72-22fa3c5eb447	1	Do you even have tech support who reads the review and work on the glitch? the last update is totally unusable. Fix it quickly its a big national brand, it shouldn't have taken this long	1	2019-03-07	NEGATIVE	0.998646557	Bugs & Reliability, Customer Support, Feature Requests
f487171d-bbce-4036-8a18-a6690bd38e40	1	እየፈጩ ፡ ጥሬ ፡ አለ ፡ የሀገሬ ፡ ሰው፡፡ በዩዘር ፡ ለምን ፡ እንድንገባ ፡ አታረጉም ፡ ሰው ፡ ከሌላ ፡ ሀገር ፡ እኮ ፡ እንዳገና ፡ መግባት ፡ ሊያስፈልግ ፡ ይችላል ፡ ስልክ ፡ ቢቀየር ፡ ወይ ፡ አፑ ፡ ቢበላሽ	1	2019-03-07	NEGATIVE	0.964637220	General Feedback
71805d4c-db01-4557-b000-49d4841fa4eb	1	It crashes acfter this update...so what is the meaning of releasing V2...previously it was working....oppss...bad app.	1	2019-03-06	NEGATIVE	0.999768913	Bugs & Reliability, Feature Requests
8113f48a-8d96-4dd2-858c-4aad81a9c343	1	too much beautiful and amazing apps	5	2019-03-06	POSITIVE	0.998911738	General Feedback
f278d08e-4238-4203-a403-59994be65677	1	the app stop working when you update it and it has no solution for the problem	1	2019-03-06	NEGATIVE	0.999790847	Bugs & Reliability, Feature Requests
39b27a45-f895-4849-80f2-54778497bed3	1	app crush after update	1	2019-03-06	NEGATIVE	0.998249829	Feature Requests
762c169f-6c78-4409-85a6-c23b0058361d	1	you're lucky that you've got one star from me, because there is no half star.	1	2019-03-06	NEGATIVE	0.999606073	General Feedback
667433cd-d4b2-4fbf-bf81-a1566a010aab	1	The app keeps on crushing & I can't log in or access my account. Went to the bank for trouble shooting. The customer service was very poor and I told to reinstall the app and enter new activation key. I did and after starting to work for few hours again the prob is there and the app is still crushing and not working. Such poor service is unexpected from a big statd owned bank. You should fix the problem ASAP.	1	2019-03-06	NEGATIVE	0.999604285	Account Access Issues, Bugs & Reliability, Customer Support
36ad7acd-551f-4453-a6bc-59e62874c904	1	Completely and utterly made it unusable after the update. Why would anyone, in their right minds, make something that worked before to a new “updated” rubbish!?	1	2019-03-05	NEGATIVE	0.999250233	Feature Requests
b2e384a3-eabd-4380-bf83-665e8afa6183	1	last update keeps crashing after inserting pin. fix please!	1	2019-03-05	NEGATIVE	0.980674684	Bugs & Reliability, Feature Requests
41eb8076-fb1f-4071-a358-11a21d4f1af9	1	Peoples are complaining. what aren't you responding? Your customer support is lame!	1	2019-03-05	NEGATIVE	0.999813616	Customer Support
82b7003c-aa5b-449e-a2e7-38dced4cdd13	1	The app crashes after the last update. Please fix it.	3	2019-03-05	NEUTRAL	0.999698162	Bugs & Reliability, Feature Requests
585c91bb-fb34-40e5-9fb1-f5565eb0bd40	1	update ከሆነ ቡሀላ ባግባቡ አይሰራም በተቻለ መጠን በፍጥነት አስተካክሉት የመጀመሪያው የተሻለ ነበር	2	2019-03-05	NEGATIVE	0.929867685	Feature Requests
b9d1a4b7-3adf-42a7-9907-c8ad2a49e8fa	1	Latest update is having bugs. The is not opening and crashing after updating.plz fix soon.	1	2019-03-05	NEGATIVE	0.999413967	Bugs & Reliability, Feature Requests
8e125ff7-2480-49b9-a7ee-5e64c6dc5267	1	this update crashes please do something	1	2019-03-05	NEGATIVE	0.998257101	Bugs & Reliability, Feature Requests
27edcec7-5f4e-4bf4-89ec-40c5c52fe89e	1	App crushing after update. I approach the bank to fix it and they told me I need new authentication key for every update. What if I was abroad? Even after I logged in, features like Services, Finance and Banking are not there. It doesn't deserve a single star either.	1	2019-03-05	NEGATIVE	0.999013066	Bugs & Reliability, Feature Requests
40cbd22e-bd46-4876-b17b-712d0dc434e4	1	updated version keeps crashing on Android Oreo, please fix it. UI is also really bad. its functional but could be a lot better.	3	2019-03-05	NEUTRAL	0.999029279	Bugs & Reliability, User Interface & Experience
16ce9b8d-2168-401f-aef4-b8b70bf03dd8	1	App doesn't work.	1	2019-03-04	NEGATIVE	0.999785244	Bugs & Reliability
ab446856-f520-4dbe-aa6b-9b49ce33bcc4	1	Very bad app from the so called largest bank in Ethiopia. It keeps crashing after the new update and the interface is ugly.	2	2019-03-04	NEGATIVE	0.999812424	Feature Requests, User Interface & Experience
b95a2fbd-31b8-4f2a-ac66-883bb978a32f	1	it was good app since last update now doesn't work after updating… what happened? please fix the problem ASAP.	2	2019-03-04	NEGATIVE	0.987212241	Bugs & Reliability, Feature Requests
dd1b2929-45a3-4fba-963b-0bddd13c7e4b	1	this Last update is defective. the app is crashing after I updated it. please do fix it.	2	2019-03-04	NEGATIVE	0.999787629	Bugs & Reliability, Feature Requests
961e47d7-8f59-4c04-8774-281ff37e2826	1	Excellent app, but limited transfer plz make the app to be tranferred large amount. Thanks	5	2019-03-04	POSITIVE	0.996617734	Transaction Performance
00cba800-7e14-434f-9cdf-6b634bf70629	1	App crushing after update to V2. Keeps crushing after accepting pin.	1	2019-03-04	NEGATIVE	0.998232424	Feature Requests
b6cbabad-093c-4ee4-8fe7-ea0d72757d7d	1	It's a good app for android but I can't find it on iPhone apps store pls make it available for iPhone	3	2019-01-10	NEUTRAL	0.948334634	General Feedback
02a070f1-bbd4-4b8d-9bd2-154e9f70ae1c	1	Thank u for the app	4	2018-12-29	POSITIVE	0.999669433	General Feedback
78047e9a-816c-4333-ade2-07fa53d7ecb9	1	To autherize new account it needs uninsrall dis not good fix it	5	2018-12-13	POSITIVE	0.999459445	Bugs & Reliability, Feature Requests
3579c56c-08eb-426e-a493-8fc368c14598	1	It keeps on failing to connect to server at intervals , to solve it, install again and activate	3	2018-12-03	NEUTRAL	0.999731839	General Feedback
094f1e52-28a3-4fe0-ba39-21c69f1eb527	1	needs improvement. can't see who makes the transfers the name should be seen when the detail is selected. also i have different accounts in my name and i can only use my phone for one account only ? mobile banking has become easy ....commercial banks of Ethiopia......you need to keep up!!!	1	2018-11-07	NEGATIVE	0.998216689	Feature Requests, Transaction Performance, User Interface & Experience
3dd34c65-03e9-4540-b87b-e549ffcd4900	1	Thank you download app	5	2018-11-07	POSITIVE	0.999786556	General Feedback
f6589417-35a4-48a7-b9da-8f5dc3b21b2d	1	It is best app for my life	5	2018-10-19	POSITIVE	0.999589622	General Feedback
952a2343-7f17-431b-aa0b-a5e1111567fc	1	It's not enough to have an app. It has to work	1	2018-09-03	NEGATIVE	0.999718487	Bugs & Reliability
41aa3b01-ec18-40ec-8a4f-839108c2a7b4	1	Its good begning	3	2018-09-01	NEUTRAL	0.996217072	General Feedback
a227c5de-943f-4303-bfc5-c7065e1d4994	1	To use this app send massages	5	2018-08-25	POSITIVE	0.936852574	Transaction Performance
5493bd3d-8840-454e-b682-f7453ad0988b	1	Islamic creadit sistem fome	5	2018-08-20	POSITIVE	0.985591173	General Feedback
4c0c6744-7f73-4025-80e4-2366888058a1	1	it is good app	5	2018-08-17	POSITIVE	0.999865294	General Feedback
5ee48241-1661-4768-a1c2-f943a685bcea	1	I haven't money but i'm very happy!!	5	2018-08-06	POSITIVE	0.999882460	General Feedback
89d3e52c-8260-4425-8a24-7435e64515b5	1	Its good and simply to use but internet must be there	5	2018-08-06	POSITIVE	0.947687984	General Feedback
754495a8-6ca0-4056-ab79-c78a1aa2b96c	1	Please remove what you call authentication code and use other simple steps	3	2018-08-02	NEUTRAL	0.999092221	User Interface & Experience
f546e8d1-4bf7-46a1-8d1b-f46e3138d67f	1	to approve the update	5	2018-07-30	POSITIVE	0.997738957	Feature Requests
ef75b201-af7a-414f-a22e-3942ccdb050d	1	Why everything is complicated and difficult to use in ethiopia?your all \napplications are difficult to use I hate your everything	1	2018-07-29	NEGATIVE	0.999699593	User Interface & Experience
7115bea6-9707-459c-acbf-9ed10ac1e2d1	1	It say download the app authorization code&PIN from branch	5	2018-07-17	POSITIVE	0.987715423	General Feedback
6fb37a0d-177d-4621-86c6-ebdf4896df7c	1	I like it	5	2018-05-22	POSITIVE	0.999859333	General Feedback
230bd438-798a-41c9-8a67-afad9f80d990	1	This is very good you can use any place all over the world i like it	5	2018-05-20	POSITIVE	0.999856114	General Feedback
855ddc40-540a-4fce-931c-99f5ee2444c7	1	በ ኣይፎን 11 ኣይሰራም ምክንያቱ ኣፕዴት ይጠይቃል	5	2018-05-13	POSITIVE	0.894316018	General Feedback
cdbd8de1-7d28-4a29-9a00-3de0bdace0af	1	TESFAY. CANADA. B.C.	4	2018-03-19	POSITIVE	0.954490364	General Feedback
d63b48c6-a859-4169-b953-a6bfadef52a2	1	I think i growth  with you by anything  business	5	2018-01-04	POSITIVE	0.999585092	General Feedback
da955803-d2c3-45e9-bdbe-8e3e5f1e2088	1	Add financial news and correct the speed of your network	3	2017-12-07	NEUTRAL	0.997373223	App Speed & Performance, Feature Requests
003c857e-025f-4562-855f-7fc25a981e26	1	How poor is this app it's dead	1	2017-10-31	NEGATIVE	0.999784648	General Feedback
2d10c13e-970d-4c17-a89d-894ed0a848ae	1	So happy with cbe	5	2017-10-13	POSITIVE	0.999863386	General Feedback
cd476f62-b571-4255-bcc6-4b43907ab6ed	1	It was somehow good but need improvement!	2	2017-08-11	NEGATIVE	0.960223794	General Feedback
3ea66fcd-7f29-446e-be44-0177dd3d45c3	1	Good app for major transaction & need to improve with  monthly summary repot	3	2017-08-11	NEUTRAL	0.981126726	Transaction Performance
1134e8c3-b3c2-4133-923a-ecadfe00fb5d	1	Authorization key!?  What does it mean? May it be the Activation Code or the Pin Code I received from one of CBE Branches!? Or a different thing that, I should do another way???????? Every body asks, but no one appeared answering!! What a hell!!!	5	2017-08-09	POSITIVE	0.999640822	General Feedback
5d0270e5-fc40-4a5a-807a-9da6305fb03f	1	Very nice app.i admire how it makes it easy for access	5	2017-07-03	POSITIVE	0.999798834	Account Access Issues, User Interface & Experience
8df6823d-15cf-409a-be40-d1099d7dda27	1	Good to use it	3	2017-06-26	NEUTRAL	0.999856710	General Feedback
3643f93f-3e3c-4fe9-acd7-60772cc98675	1	The blank space to write Ac no is unvisible  please modify to whight color.ነጭ ኣድርጉት	1	2017-06-17	NEGATIVE	0.998732030	General Feedback
dc68e25c-93b8-4de9-8708-9e9d785dffbf	1	This makes me to use the bank services easly	5	2017-06-14	POSITIVE	0.989694595	General Feedback
9473d404-c672-49f4-809e-a0f8f54e6b76	1	Authorization fails problem	5	2017-05-14	POSITIVE	0.999592006	Bugs & Reliability
5ff6b56c-f308-4064-9457-a7953a0216f6	1	this is excellent app  Easy to use  Good work	5	2017-04-21	POSITIVE	0.999696016	Bugs & Reliability, User Interface & Experience
e075c1ae-2e50-48ae-8594-7687ba7145f0	1	Short and precise	5	2017-04-13	POSITIVE	0.999639153	General Feedback
23a71101-287e-46e1-82ea-eab9ed6641b2	1	Sends cash many times with no number of count  dialogue to the same receiver.	4	2017-03-31	POSITIVE	0.998857975	General Feedback
08ab1886-0e36-4dd0-bfb4-ed35cc03ab28	1	So these is very application	3	2017-03-30	NEUTRAL	0.998373032	General Feedback
2287fbff-6fe3-4d21-aeb9-5be5a9b23a31	1	When transaction are made it displays error and made no entry in the transaction list. When i made the second transaction it deduct twice a very serious bug that should be handled soon, i faced twice in a month. After all it is individual's money you are dealing with.	2	2017-03-19	NEGATIVE	0.999325752	Bugs & Reliability, Transaction Performance
0d291342-e0c4-45f7-9346-1d8cd3d0c8c4	1	this app is not functional  in some android smart  phone. eg. android 3.4	1	2017-03-15	NEGATIVE	0.999690652	General Feedback
6edc78c9-ae8e-42b5-90a0-bdb5973a3d8a	1	The Essential app	5	2017-03-06	POSITIVE	0.999496579	General Feedback
4721a97d-170f-49f2-acea-0a4c72f9ca8a	1	I love it	5	2017-01-16	POSITIVE	0.999879956	General Feedback
43ae09e6-4204-4a7d-9bf7-ce5a0c7e5f73	1	Very, very important and helpful	5	2017-01-10	POSITIVE	0.999849677	Customer Support
efe408b2-5c3f-4afa-b412-19a406d3fd23	1	After some times it fails not working for those services insie it except checking balance. When I open to new service the app will close it self.	1	2016-12-08	NEGATIVE	0.999367177	Bugs & Reliability
8c95805d-f3be-42a9-a18f-39188b5a9b87	1	Whos and what is authorization. Code? ?	1	2016-12-07	NEGATIVE	0.997513175	General Feedback
404f821e-b8c4-45ef-a1b7-6252240f8d0f	1	to download and how ican log in my account?	1	2016-11-20	NEGATIVE	0.999128878	General Feedback
6c6f4d61-fa84-467f-aaa5-803b7f57f0d4	1	Most liked bank and trustworthy!	4	2016-10-15	POSITIVE	0.999670744	General Feedback
76ec7b69-7f85-40df-a04c-ec91d1fea6e4	1	I have downloaded and went to CBE and registered my account. It shows only my balance and previous transactions. But when I tried to transfer money to non CBE customer it asks only revipients name, phone number and amount not any other criteria such as branch of sender and recipient. Finally when I press "submit" button it says input valid data. So how can I use it? I filled all the available blank spaces correctly but it doesn' work	1	2016-09-25	NEGATIVE	0.997872829	Bugs & Reliability, Transaction Performance
f7657bbe-2e58-458f-8d76-fb11bd4a2543	1	I thrust commercial bank of Ethiopia my money established it	5	2016-08-29	POSITIVE	0.987874448	General Feedback
a9c3fc33-c501-4013-8572-33b72111f679	1	Kkkk what is this?	1	2016-08-28	NEGATIVE	0.996771872	General Feedback
852fd63a-0e28-4628-b179-62a48b0c28d8	1	I like it saves your time.	3	2016-08-23	NEUTRAL	0.999553621	General Feedback
b620fbee-f3e3-4de6-9cda-c97f095f99f3	1	please allow us to register online without going to branch office	1	2016-08-20	NEGATIVE	0.987007916	Account Access Issues
90d0d398-66d8-42f6-9eb3-dfb05b5d59bc	1	I liked it.	4	2016-07-21	POSITIVE	0.999852180	General Feedback
12f45021-a748-4ec5-9c99-2926b49fa7fa	1	it is not  work	1	2016-07-21	NEGATIVE	0.999699831	Bugs & Reliability
57cbf178-0f3a-49ff-aa99-00d575abf265	1	is not so good but if you trying this is well we want app like barcalys or standerd chtred	4	2016-07-03	POSITIVE	0.985157728	General Feedback
f75f5555-7047-4d1c-b262-f17bb028a8d9	1	The bank has given me an authorization key,but it says invalid	4	2016-06-15	POSITIVE	0.999110997	General Feedback
1d532a66-5c02-4833-a8c6-0f181fd89a7f	1	This mobile app is great if it work properly. It is not working in my mobile (Samsung galaxy core).it  is not self contained and need web to see the full interface which is bad. The graphics(the first page) look very unprofessional.	1	2016-06-15	NEGATIVE	0.997108877	Bugs & Reliability, User Interface & Experience
3f0b841f-7ba5-48f1-934f-efc1479e73d0	1	Where can we get authorization code??  Need help from a developer or any body uses this App.?????	1	2016-06-13	NEGATIVE	0.999671459	Customer Support
292bf2a1-5d4d-4ccf-b42f-ca260f76c428	1	Downloaded and I've to go cbe branch ...not any branch.	2	2016-05-04	NEGATIVE	0.998778999	General Feedback
0ee1274d-0afd-4cb3-a57e-079d92636522	1	I really hate CBR! I'd rather be AIB or OIB customer to get a good service.	1	2016-03-15	NEGATIVE	0.999478519	General Feedback
e2d6ac77-05f0-45bd-91a5-b5d438f731cb	1	It is nice	5	2016-01-26	POSITIVE	0.999864817	General Feedback
a5c20ada-3a33-44bc-bcb2-880e0b5d6262	1	I love it	5	2015-12-26	POSITIVE	0.999879956	General Feedback
8172f031-362c-488f-bd71-09addf2c7942	1	It not installing it takes time why?	3	2015-12-11	NEUTRAL	0.999223948	App Speed & Performance
04300dd0-f8e7-406f-81e0-bb73db0d70a6	1	It works well but some functions are not visible for android 2.1, . . .	4	2015-11-07	POSITIVE	0.980769873	Bugs & Reliability
d1ea4392-33fa-4c5a-96d0-e3c73e95ca9c	1	But like all ethiopians app	5	2015-09-30	POSITIVE	0.990036249	General Feedback
33ea8e63-632a-4c89-9051-7638fab94460	1	I loved it so much....	5	2015-09-30	POSITIVE	0.999874115	General Feedback
4f206da1-ecce-4fce-997d-43bb933f6f3b	1	I like b.c it is must	1	2015-09-26	NEGATIVE	0.998787105	General Feedback
d715b59e-f6ae-49b6-a61e-56f25a69a6f5	1	Makes life simple.	1	2015-09-08	NEGATIVE	0.999845028	User Interface & Experience
a0a29d4e-59c1-4a46-8c2f-3a5794245f21	1	Seems good but needs lil improvements in speed & performance	4	2015-09-02	POSITIVE	0.988097847	App Speed & Performance, Feature Requests
0ec7adb9-cc6d-4832-90eb-baab60494aa2	1	I am always with this efficient Bank.	4	2015-08-13	POSITIVE	0.999837995	App Speed & Performance
3eeed9ab-0ace-4d22-afbb-33a113bbf687	1	Your color choice makes it hard to read the text.  Logo is very blurry.  Try to use better quality vector images.  It seems like the app was designed by a beginner.  Look at some of the major banking apps like Bank of America  etc...  Nice try	1	2015-07-19	NEGATIVE	0.997199297	User Interface & Experience
9956814d-06ba-45dc-878f-381752fe520c	1	I cant use by galaxy s6 edge	5	2015-07-14	POSITIVE	0.555968463	General Feedback
9339afea-0b15-410c-bbff-d61dbe86fb60	1	Ajemamru lay  algebgnem yemn cod  new yemasegbaw ? Plss  help me	1	2015-07-08	NEGATIVE	0.997011065	Customer Support
06c7b9dd-ce40-42d5-b2cf-22750b673955	1	it is easy to work with	5	2015-07-03	POSITIVE	0.999680877	Bugs & Reliability, User Interface & Experience
c6a82f96-9a30-4fab-9948-94b2e9ebeb34	1	It is little bit confusing.	5	2015-06-17	POSITIVE	0.994425654	User Interface & Experience
5ac9c379-5409-4b65-908b-6a16acd716f0	1	Very help full	5	2015-05-13	POSITIVE	0.994971395	Customer Support
95888ced-cf87-44a5-98b8-deaaf48466e5	1	Www bayye gariidha	5	2015-04-28	POSITIVE	0.892661214	General Feedback
7265148e-2261-4780-91c6-1410a7ce4288	1	I Appreciate it app	5	2015-04-06	POSITIVE	0.999830365	General Feedback
e2ad13c4-af98-4bac-a3d2-d8d6ee15d657	1	What is an authorization code???	5	2015-03-19	POSITIVE	0.997315943	General Feedback
f4104a84-51c7-45f9-98c4-78019030e40f	1	first i thank you for this service  .then please tell me what is አውቶራይዜሽን key  please	4	2015-01-26	POSITIVE	0.998150349	General Feedback
9ff4b485-212e-4a1e-80c3-2816a13cbef9	1	What is Authorisation code and where  can I get it!?	1	2015-01-14	NEGATIVE	0.999130666	General Feedback
110855b4-abf6-436c-8fb6-bcd299422364	1	I have authorization key  and activation code already. But when i tried to login ,it always says ,connection failed and try again. What shall i do?	5	2015-01-09	POSITIVE	0.999730170	Account Access Issues, Transaction Performance
c96cd0ba-245f-4af0-a360-f2c0d76b5dc1	1	Happy to have online banking in Ethiopia	5	2015-01-09	POSITIVE	0.999776423	General Feedback
c17614bf-bdab-4fe0-99a4-ddb33225e9ce	1	Now everybody has access	5	2015-01-04	POSITIVE	0.998040020	Account Access Issues
174caf6e-0bc1-4bca-be67-df18acf49ce6	1	so bad how can we know the authorization code?	5	2015-01-03	POSITIVE	0.999769390	General Feedback
c238d59b-d8e8-4510-94e6-36892af79ce0	1	For Samsung S3 it doesn't work properly (isn't compatible ) please fix it.	2	2014-12-19	NEGATIVE	0.999729097	Bugs & Reliability
edb3496a-2844-4a72-ae51-6099e7f63918	1	I want to activate mobile banking with CBE.CBE has sent me the pin and activation code.	5	2014-12-16	POSITIVE	0.962937295	General Feedback
ed41c6c1-a109-464f-b125-2329df740d83	1	My partner to develop!	5	2014-12-04	POSITIVE	0.999692440	General Feedback
c7cb2042-92c4-440b-8757-112ab4c77c55	1	all of you have to go to the bank and fill in forms and get a pin	5	2014-11-29	POSITIVE	0.999091387	General Feedback
4253a221-8e61-450b-9747-a0f0202eb1d3	1	Found it very helpful	4	2014-11-28	POSITIVE	0.999707639	Customer Support
47f95c21-61d0-4e07-b662-667631d5bfd4	1	no one can ever get it work.  Completely unfinished app. please complete all the path.  it is more useful when it is a whole app.. This is a waste of time. guys, Don't download it.  I like the idea though.	2	2014-11-23	NEGATIVE	0.998860478	Bugs & Reliability
dd674c2f-d854-4fee-8069-0360609f66cb	1	I don't like it just because it's limitation it's  not working  abroad and it doesn't give you the authentication numbers and also its only in English why not amharic	1	2014-10-21	NEGATIVE	0.997405231	Bugs & Reliability
5795f2ba-bf9a-4066-8f4e-03496ba4e4a3	1	It's awesome software, but sometimes it completely doesn't work. But still it's nice to start thinking like that as a developing country.....better tomorrow!	4	2014-10-17	POSITIVE	0.999151945	Bugs & Reliability
eab1b2f2-c015-48a8-906b-33d1a5e1fc68	1	it is so nice try to use it.	5	2014-10-15	POSITIVE	0.997332454	General Feedback
b57afd20-1559-457c-821b-af7e4f2f0dba	1	Best apps fore bissneses Man.	5	2014-10-15	POSITIVE	0.991839886	General Feedback
8e87a8a1-5dde-4a82-bd18-359642f04634	1	I cant explain my feeling itso good iliked it thanks	4	2014-10-09	POSITIVE	0.999455631	General Feedback
a2738359-0c2f-4db0-b982-cf6990ceab35	1	All services not available on my phone.	4	2014-09-28	POSITIVE	0.998791873	General Feedback
09e7213d-a6b3-415a-8140-e1f5e8aba014	1	Yes!Yes!Yes! I loved it very much because of they gave me fast service to obtain mobile banking service and ATM service.	5	2014-09-25	POSITIVE	0.999822676	Transaction Performance
b0a24c8e-13bd-4a1c-80f9-af99b67be8de	1	It good  application! Thanks !	3	2014-09-25	NEUTRAL	0.999861956	General Feedback
5f7fb0ea-fc1c-4c62-99e7-30fedee7cbcf	1	Very nice application	4	2014-09-21	POSITIVE	0.999854088	General Feedback
6e67853e-2dc0-4c52-9648-6263f8cd3519	1	I love  this app it's  so cool  and time  saving but poor  method of authorization  key delivery  method	5	2014-09-13	POSITIVE	0.998830378	General Feedback
c5baec01-feaf-4379-9169-4945efd5b4a7	1	It's nice I like it	4	2014-09-11	POSITIVE	0.999866009	General Feedback
bd81776e-be97-4cd7-ac5a-260c13bff6f8	1	Any one pls tell me how to use mobile banking from overseas	5	2014-08-31	POSITIVE	0.986930847	General Feedback
f8da4fc0-6d9b-4823-9a5a-e6215eeebb1f	1	Help me to get an authorization code as soon as possible please!	2	2014-08-27	NEGATIVE	0.951911330	Customer Support
829268ef-6c85-4604-bb98-ab7fdcba11a5	1	After some step it is not functioning!	3	2014-08-26	NEUTRAL	0.999802887	General Feedback
03a06561-ddc0-4c54-9dac-03905ecfeabc	1	But what is download authorization code???	3	2014-08-20	NEUTRAL	0.998273611	General Feedback
7f12878a-c046-4658-ae17-b8b8062ce3c6	1	I love it.	5	2014-08-07	POSITIVE	0.999876738	General Feedback
ca5635ef-3fae-44c4-8b95-2061985dfcf3	1	I what add bot i dot now cod	1	2014-07-31	NEGATIVE	0.995173395	Feature Requests
0f00a91a-134e-4ec5-9a09-6b9c7bd98381	1	It was so cool and I love it	5	2014-07-17	POSITIVE	0.999882936	General Feedback
f117422c-bc08-4887-acef-3b6a0d2bc737	1	CBE is really the bank we rely on.	5	2014-07-15	POSITIVE	0.997635126	General Feedback
194a3793-c3f5-498b-a932-b180eaf61a58	1	It is always good to make services easier. Go CBE.	5	2014-06-10	POSITIVE	0.999170542	General Feedback
8f024f49-5024-4278-ab9c-f8f5364f610e	1	Wow very nice but how con working	5	2014-05-23	POSITIVE	0.934184432	General Feedback
39ce50f1-16df-4ede-af03-7b6a70a59a4a	1	I think it is good for all.	4	2014-05-07	POSITIVE	0.999757349	General Feedback
c2100cff-edf6-443f-b5a4-3d34a39c691d	1	Very good but not i know using	4	2014-04-14	POSITIVE	0.993904531	General Feedback
a385cfc6-f3d7-4d9c-a3a4-baf09b059238	1	I love my cbe	4	2014-04-07	POSITIVE	0.999862552	General Feedback
fc24a05e-4624-49bd-983a-dffc78ab278e	1	Its very bsst app	5	2014-04-06	POSITIVE	0.739216983	General Feedback
dd266ae4-a2b5-4e93-8b2b-0a0888a94867	1	It  is good	4	2014-03-29	POSITIVE	0.999849439	General Feedback
37c4bce2-5656-412a-8f7c-2a5529370dd7	1	Nice to see U leading...	5	2014-03-25	POSITIVE	0.999789655	General Feedback
d3f5cb50-9551-475b-89b7-d370a6dbaa35	1	It says that Once you download the application, you can get Authorization code and PIN from your CBE Branch at any time.  Have downloaded the application and Authorization code should be available at the time of downloading instantly.  Instructions should be clear.  Once we can log in to the system, we can comment more but for now we can only say what I have experienced	3	2014-03-24	NEUTRAL	0.979335189	General Feedback
da1ab234-b7d2-42cd-a2c2-57b6dc22574f	1	Please keep upgrading. We thank you.	1	2014-03-20	NEGATIVE	0.999858975	General Feedback
b026a4d2-9d0b-4ad0-a414-f48e4c525688	1	good application how can I get authorization code for CBE application for used	5	2014-03-18	POSITIVE	0.990932465	General Feedback
92ad4c40-1caa-416c-9a32-0cbd8bcadfcc	1	God is love.	5	2014-03-09	POSITIVE	0.999863267	General Feedback
359c7b1d-a790-46a5-948c-ac6d5492bec5	1	Wish they made ut easier to get the initial codes tho.	5	2014-03-08	POSITIVE	0.999298692	Feature Requests
6debe83b-df5a-418e-9794-1c4f4e03722b	1	Not recive the code	4	2014-03-05	POSITIVE	0.997645676	General Feedback
da6f1ce6-cfef-43d2-9705-ef7b84c41cc2	1	How I get the aut.code?	5	2014-03-04	POSITIVE	0.999106586	General Feedback
f443180f-3620-4f4d-9cfd-dfc88ebb55ff	1	it is very cool app ti me, but unfinished description and guide yet! .	2	2014-03-03	NEGATIVE	0.815472722	General Feedback
dbda27ed-5e0f-496f-b3cc-2b91cce4a1a4	1	God is love	5	2014-02-27	POSITIVE	0.999851346	General Feedback
fedf3bd3-be16-4be8-b0ad-c79f1b03a690	1	Unable to get auth key	4	2014-02-27	POSITIVE	0.999644160	Account Access Issues
ff77591e-52cc-4783-89ea-5018a376d6e8	1	As wr wb	5	2014-02-26	POSITIVE	0.952806890	General Feedback
d2171ee8-4842-41aa-b5d9-61e14b9ce27a	1	Cbe where a good access	1	2014-02-25	NEGATIVE	0.999267876	Account Access Issues
6d46bb5e-f598-4137-9e85-6cb5b23ad41b	1	Really I am more appreciate your work. It is a nice application.	3	2014-02-24	NEUTRAL	0.999830604	Bugs & Reliability
1ec29a9a-32b0-49b4-967f-8f1e7a9c087a	1	The  bank thats realy gives a better service	5	2014-02-24	POSITIVE	0.541920245	General Feedback
1b5a7991-5faa-4597-b1ed-a781bbe7ec57	1	Authorization code i don't know how to get it anyone out there please help	4	2014-02-22	POSITIVE	0.998897552	Customer Support
3307f1db-83f8-48ff-989e-f2549795bcf2	1	can any one explain me how this thing work? currently I am a mobile banking service user and I have installed this app. but whenever I start the app it requests for download authorization key.  where and how can I get this key?  Thanks	1	2014-02-20	NEGATIVE	0.991179883	Bugs & Reliability
d4b55ded-e363-4861-a4f2-b3bf36bbc234	1	It might be good	3	2014-02-19	NEUTRAL	0.999372423	General Feedback
53d33b1a-017d-40a8-892a-f2060f715eda	1	it's ok letst tecnologey.	4	2014-02-17	POSITIVE	0.998866796	General Feedback
3559b91c-fad9-4032-bebe-cf99974b9628	2	Hello, I’m facing a problem with the BOA Mobile app. Every time I enter my phone number and password, the app crashes and shows an error that says “BoaMobile closed because this app has a bug.” I tried updating, reinstalling, and clearing cache, but nothing worked. Please fix this bug in the next update. I really need access to my account. Thank you.	1	2025-06-03	NEGATIVE	0.999409080	Account Access Issues, Bugs & Reliability, Feature Requests
d7f07898-4ba1-47b4-9e8c-a3cc10b1bf0f	2	BoA Mobile good bank	5	2025-06-02	POSITIVE	0.998472869	General Feedback
2ca9480b-ff5f-4b59-952c-5921db83dab2	2	this is worest app 24/7 loading	1	2025-06-01	NEGATIVE	0.987444222	App Speed & Performance
8cd852da-0257-4ca0-9003-314fb464e55a	2	This App is not interest for Android phone Please update it .	1	2025-06-01	NEGATIVE	0.997138381	Feature Requests
d9172c66-a605-4626-acc6-e1dbca0685cd	2	BoA system is confartable	5	2025-06-01	POSITIVE	0.998014212	General Feedback
78c924d7-0a65-415c-9fca-bda9b078a157	2	very nice Abyssinia bank is choice all	5	2025-05-31	POSITIVE	0.999583066	General Feedback
c3f2810d-cf99-4600-90ac-bef47adb9e7a	2	this app, for me , is a waste of time. It doesn't work . I can't even long in, and it really piss me off. FIX THE PROBLEM	1	2025-05-27	NEGATIVE	0.999793589	Bugs & Reliability
76089146-b1c7-47f4-ab9f-44b6a1092225	2	the app crush frequently	1	2025-05-24	NEGATIVE	0.998525083	General Feedback
e244700c-1210-4280-b60b-b75964c982df	2	You guys keeps getting worst	1	2025-05-22	NEGATIVE	0.999707520	General Feedback
2e219268-96fd-400c-8632-0b0d1044f487	2	This app is a joke. It crashes more than it works, takes forever to load, and half the features are just decorative at this point. Can’t log in, can’t transfer money, can’t even check my balance without it bugging out. To the developer: Are you actually trying to make this work, or is this some kind of social experiment to test our patience? Did you build this in your sleep? Because it definitely looks like it. If this is your idea of a functional app, maybe consider a different career path🙏	1	2025-05-21	NEGATIVE	0.999305367	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
8ddf5c9f-f866-4817-ac5e-85c67bfa870e	2	but not opening on android	4	2025-05-19	POSITIVE	0.995222867	General Feedback
f8bb86fb-594a-48ea-be1f-d08ea0882b8e	2	Worst App ever. Totally unreliable. And it didn't work at all for the last 4 months.	1	2025-05-18	NEGATIVE	0.999798477	Bugs & Reliability
b640cc87-df88-4b6b-9b9f-13fe0bdd5dfa	2	this app does no work on Samsung a51, it just gives a preview of the logo	1	2025-05-11	NEGATIVE	0.998689711	Bugs & Reliability
301f6927-9395-4cda-bb77-041a36323875	2	i entered incorrect security question by mistake boa app lock pin forever, why is there no other options? ?? i contacted different branchs more then 4times but they didn't able to solve this issue .	5	2025-05-10	POSITIVE	0.999533296	Account Access Issues, Bugs & Reliability, Feature Requests, Security Concerns
857bb685-6f7e-4db0-af37-eb2f1c1c6fd3	2	liking this application good 👍	5	2025-05-07	POSITIVE	0.999830604	General Feedback
62fa097e-3fd8-4522-a3a3-9b13f17f594d	2	This app future is good, but there is problems with apps to reset and activate it, which is difficult even to the branch staffs, and it takes too long times to active at the branch plus most of the time high expected failure of activation after process at the counter and OTP sent not work	1	2025-05-06	NEGATIVE	0.998921752	Account Access Issues, Bugs & Reliability, User Interface & Experience
e255b972-0d40-4de1-99ff-44dbada62a16	2	it's really good 👍	5	2025-04-23	POSITIVE	0.999847293	General Feedback
dbd9dbf2-47ee-4103-8631-cd0ef79f4344	2	Bad app . it stuck when you open and noting WORKS.	1	2025-04-23	NEGATIVE	0.999519825	Bugs & Reliability, Transaction Performance
8a4d9c01-9e5a-4732-a8ab-9341930b30c8	2	the app isn't working after it asked me the password it starts loading, but it doesn't open	3	2025-04-20	NEUTRAL	0.999723971	Account Access Issues, App Speed & Performance
3271d45f-2900-41b6-878c-669ac563e60a	2	It keeps showing this pop up to turn off developer options even tho it's off! I had to turn on and then off to make it work! This is a horrible experience and needs a fix asap! Plus kinda slow.	1	2025-04-19	NEGATIVE	0.999669909	App Speed & Performance, Bugs & Reliability, Feature Requests, Transaction Performance
497345df-10e9-402a-bb96-88e16f8a803d	2	boa of mobile backing	5	2025-04-09	POSITIVE	0.980626106	General Feedback
f68ed25c-79db-4a9c-85e7-aaccd1671555	2	faster bank of Abissinya	5	2025-04-08	POSITIVE	0.972214282	General Feedback
94ef86ef-6437-4c31-96c5-efeb7f32829f	2	i would have given it a lower if it was possible because it crush so much and it take the bank so long to fix the bug	1	2025-04-08	NEGATIVE	0.999671698	Bugs & Reliability
3b48fff7-6b38-4099-9c7c-cabc1bbbd92b	2	it just doesn't work...so frustrating	1	2025-04-07	NEGATIVE	0.999774158	Bugs & Reliability
b10d3c9a-d5c8-422c-9bca-82a40310fb5c	2	it's not work correctly... you must have update it	1	2025-04-06	NEGATIVE	0.999801338	Bugs & Reliability, Feature Requests
8eed1a6d-6902-45fe-abc4-48dcbae22f85	2	the app gets a considerable improvements like language , QR scanner and unlimited transfers survice. but BOA Please do alot on its fastness and convenient when we login and making a transactions.	5	2025-04-04	POSITIVE	0.929561257	Account Access Issues, Transaction Performance
b3a22053-e2b9-47e6-8083-a2e73a7c6bed	2	after i typed in my password it says successfully logged out ...and goes back to the first page	2	2025-04-04	NEGATIVE	0.585684836	Account Access Issues
53263f41-9dd6-4165-a24a-a41fda4c390c	2	good but they don't update enough don't add new things	3	2025-04-04	NEUTRAL	0.969367862	Feature Requests
6eec96bf-b4c9-4dde-9814-059cf54b3f86	2	it doesn't work period z slowest mobile banking ever i would rather use *815#	1	2025-04-01	NEGATIVE	0.999005854	Bugs & Reliability
1197ad29-5063-4999-888c-589582754caa	2	after activated the application it not allowed to sign , automatically it is turn off In my phone, why ?	1	2025-03-31	NEGATIVE	0.998803258	General Feedback
e9072e9a-76dc-49d1-b423-cb64c4656802	2	this version is not working for me I cannot even buy card. I cannot send money	1	2025-03-30	NEGATIVE	0.999568403	Bugs & Reliability, Transaction Performance
e52a6ccb-dc16-472c-84ef-2969c08a9318	2	It can't actively on initialization, it says incorrect OTP getting the exact OTP	1	2025-03-29	NEGATIVE	0.999205053	Account Access Issues
34f5b18e-0a79-40bb-94b6-4430d08e0c17	2	always problematic hardly works	1	2025-03-26	NEGATIVE	0.999555528	Bugs & Reliability
b96d31a2-9360-43ab-ba3c-a44b324f8288	2	considering the fact the bank is huge this app really bad you could do better	1	2025-03-25	NEGATIVE	0.999741852	General Feedback
1648df61-5880-4d2a-9ec1-c393c9ac474d	2	worst app and Bank ever u be ashamed, scammer	1	2025-03-24	NEGATIVE	0.999795496	General Feedback
6b5a5455-dcd0-4a2a-8cbb-f0deb5706498	2	i have went to the bank so many times because i couldn't make any transaction i can only see my balance nothing else so what is the point of having mobile banking if i can't make any transaction with it please work in that	1	2025-03-21	NEGATIVE	0.998833358	Bugs & Reliability, Transaction Performance
376f374a-f480-46e2-bb4a-90e938ab3a59	2	there is no speed	1	2025-03-19	NEGATIVE	0.999442279	App Speed & Performance
c5cdb617-4335-491d-89ce-9c1aab9b0b2f	2	For anyone who wants to download it, just don't!!!	1	2025-03-19	NEGATIVE	0.999055684	General Feedback
7d475f3a-15b4-4e56-ae4b-1fc451749e61	2	Edit: New bug, app not letting me type in my otp codes. Shameful Why does this app not allow me to use it while having developer options on? Did y'all consider that I might, perhaps, be an actual developer? Why am I expected to toggle the option on and off just to bank (restarting my phone when I do)? Why is the message labled as somthing that will "smoothen" the experience? This is like the most "security consultant" thing to implement in an app. Please invest in actual security, not this mess.	1	2025-03-12	NEGATIVE	0.998353601	Account Access Issues, Bugs & Reliability, Feature Requests, Security Concerns
e68af2d6-0770-4110-b3dd-167bb54cd017	2	Improved to be the best	5	2025-03-11	POSITIVE	0.999857068	General Feedback
0e5e093a-1cf1-4c49-87ed-046888b8afa9	2	Decent, but there problems sometimes it says error When i transfer money but infact it transferred because of this bug i transferred 2 times instead of 1 and also we can't transfer money to others telebirr acc we only can to our self BOE Dev fix this !!!	3	2025-03-11	NEUTRAL	0.997588158	Bugs & Reliability, Transaction Performance
35ea7b31-46fb-47a7-b9c4-8a5e06161abd	2	BoA Greqt Ethiopian bank.	5	2025-03-11	POSITIVE	0.845771790	General Feedback
c9f8ff21-b8d1-400f-bb94-c98399a25ad5	2	The bug is still there,the app crashes every time i try to log in, especially in old phones like my Galaxy A32	1	2025-03-10	NEGATIVE	0.999167442	Bugs & Reliability
df027023-1b65-40e9-b2bf-de6fedc17c5d	2	Almost better compared to cbe where it is not qualified for	4	2025-03-09	POSITIVE	0.974167824	General Feedback
73ce76e4-b7a2-4ed8-b6fd-f9b388bdb4a6	2	what awesome apps. it is very simple to use and more much important apps.	5	2025-03-09	POSITIVE	0.999821484	User Interface & Experience
c292d2f8-1e0d-46ae-97f2-f3215a0bdf50	2	i can't use this app why?	5	2025-03-07	POSITIVE	0.999310136	General Feedback
1962d1c4-e2c2-4ac7-91b6-b0a75ae11d7a	2	Worst mobile banking app I ever experienced I was blaming other apps but comparing with this they're too much better!!!! It clashes it takes much longer time to login while loading in short it's a complete of trash	1	2025-03-06	NEGATIVE	0.999701321	Account Access Issues, App Speed & Performance
7d468428-1ccb-4528-9984-9324db9b9d2b	2	bro the worst app made by human kind!! as a software engineer it make me so sad seeing enterprise as big as BOA make apps like this. it is a disgrace for our country!!	1	2025-03-05	NEGATIVE	0.999813378	General Feedback
ab512ec6-2eaa-496c-b0a9-ee21a2d810be	2	AGA B Girja Miss language of admin Afaan oromo & other Itoophiyaa languages	1	2025-03-04	NEGATIVE	0.996404529	General Feedback
49b877c9-5536-4be5-8674-e3ae975fa0ed	2	I downloaded the app for the first time while reading other customers reviews and as soon as i installed and opened the app it closes back automatically, what unserious bank, now i uninstalled the app immediately	1	2025-03-03	NEGATIVE	0.988918483	General Feedback
529fe570-b1aa-48b7-b349-444b98c1fce7	2	It has good features but sometimes it doesn't work...0	1	2025-03-02	NEGATIVE	0.995671153	Bugs & Reliability, Feature Requests
12f08f68-da19-4974-8086-304a40091d72	2	Very poor proformance	1	2025-03-01	NEGATIVE	0.999804318	General Feedback
b7206c5f-267e-44f1-b044-8f6f9392701d	2	It's not opening. Really frustrating	1	2025-03-01	NEGATIVE	0.999702036	General Feedback
d5e46c35-6bbf-4ce7-b184-cdc4c1e0eab1	2	Verry Amazing App from all IB	5	2025-03-01	POSITIVE	0.999739468	General Feedback
99172a2f-926c-48be-a1b0-3971b984b6b2	2	Not working on this days	1	2025-02-26	NEGATIVE	0.997277319	Bugs & Reliability
781ff61a-6f89-4bb1-a455-9b66400b0cd7	2	Thank you BoA	5	2025-02-23	POSITIVE	0.999839902	General Feedback
cf026bee-94e7-4b9c-8a46-034354f9d171	2	best banking app in the wworld	5	2025-02-22	POSITIVE	0.999572217	General Feedback
9035f28b-9646-4fe9-80e1-6b6926b0289e	2	Nice app and it's easy to use	5	2025-02-21	POSITIVE	0.999751627	User Interface & Experience
25b7eec9-d1ef-41be-8bb3-3fd1b1cb8068	2	please add language in the apps setting(amharic afan oromo, tigniya,and others) sometimes bank to bank transfer is not available through time and even if if it is available not reachable…it is serious issue!	1	2025-02-15	NEGATIVE	0.998705745	Bugs & Reliability, Feature Requests, Transaction Performance
5e94fa10-612f-4422-8183-00d5050e8d98	2	This is help full i like ittttt	5	2025-02-14	POSITIVE	0.997799575	Customer Support
8d82d36e-ff01-40ab-83e7-cdb44af38a8e	2	The is not functional at all?	2	2025-02-12	NEGATIVE	0.999733150	General Feedback
d77a87f6-2a20-4b6b-b7fa-acbb3d19b636	2	Make it easy and convienient to use and perfect for all to high prefrence and choice.	3	2025-02-07	NEUTRAL	0.999723613	User Interface & Experience
63c608e3-85ac-46ab-a948-1ab4a81bd575	2	I have been using this app for two years.It is amazing.	5	2025-02-01	POSITIVE	0.999859571	General Feedback
c3b78417-6822-48b0-8c40-6f5f96d0e2b2	2	Always do update and that is annoying	3	2025-01-27	NEUTRAL	0.999443948	Feature Requests
86e6f672-4fd3-41dd-a49b-21e48aef587d	2	Best app, somehow waiting a few minutes	5	2025-01-23	POSITIVE	0.964091480	General Feedback
7b07593c-a036-477b-b2d4-4e53fdc4c75e	2	I can't dijitalize my atm in the apollo app on my phone	1	2025-01-22	NEGATIVE	0.994603813	General Feedback
06ad47bd-3a6a-45b4-ae10-6dd4170bc254	2	Whenever I try to sign in app close please fixed it out	2	2025-01-21	NEGATIVE	0.997661114	General Feedback
6c01b8b7-76b7-4f56-a822-bdf7674d30a0	2	በጣም የሚያስጠላ አፕ በጣም የወረደ ዜሮ ነው የምሰጠው ዘሮ It's not App it's very slow ehhhh. Why don't you upgrade the app???? It's always zero	1	2025-01-18	NEGATIVE	0.997927666	App Speed & Performance, Transaction Performance
0a72e292-175c-4f96-be54-991436c22c8e	2	Aadan Axmed Barkhadle	5	2025-01-17	POSITIVE	0.612751842	General Feedback
46c41e87-0d7a-491b-8641-2c1acdaddea3	2	Horrible customer service and app crashes Horrible!!	1	2025-01-15	NEGATIVE	0.999791324	Bugs & Reliability, Customer Support
9f4f98fc-8a93-414d-9219-f03dbebaf5b0	2	I love it	5	2025-01-14	POSITIVE	0.999879956	General Feedback
1c339143-79e1-4f37-9ea7-398b7844903b	2	It keeps asking me to turn off developer mode even when dev mode is off. Couldn't use it.	1	2025-01-13	NEGATIVE	0.998579383	General Feedback
5055c357-676d-41eb-824d-48f9e78f41e7	2	Like to much	5	2025-01-11	POSITIVE	0.999798477	General Feedback
0fbb5047-8399-4b6f-b063-ddcdeb3e209c	2	The best of best	5	2025-01-09	POSITIVE	0.999839306	General Feedback
fb9a7444-76cf-4f2d-a8be-72d3009a034c	2	I was using this app for long time it amazing user friendly UI but the i can't found for get pin button in the app	3	2025-01-07	NEUTRAL	0.901659787	User Interface & Experience
9bea391b-234f-439d-a844-47d0c839a89a	2	Fast and suitable for the customers.	5	2025-01-04	POSITIVE	0.999792039	Transaction Performance
cd4d09a6-07d1-44e8-9b1e-d990c3b0b70a	2	Good app and helpful	5	2025-01-03	POSITIVE	0.999856591	Customer Support
a7888312-64d5-44d6-b708-a6d29b168825	2	I will give only one star, because it faced with multiple of problems. 1. The app is not as fast as the other banks App, for e.g like CBE 2. The App asks repeatedly to switch off developer options, even if it is switched off. 3. Bank of Abyssinia's services are interesting, but they ignored the issues on the App service. 4. Most customers gave a complain on the App, but no one accept their complain to fix the issue. 5. Lastly, I will not recommend the App unless the issue has been solved ASAP!!	1	2025-01-03	NEGATIVE	0.996587515	Bugs & Reliability, Feature Requests, Transaction Performance
800bc191-3aec-4666-9f08-4a393dc8501f	2	By assessing this you can tell Abyssinia bank has no idea what mobile banking is ?	1	2025-01-02	NEGATIVE	0.999275982	General Feedback
c194a70d-aa2b-4775-8da5-bf51d1c51d2a	2	It doesn't work at all.	2	2025-01-02	NEGATIVE	0.999777138	Bugs & Reliability
06692c6b-978f-4b52-bb83-6c38a11b2822	2	this app is not available	1	2025-01-02	NEGATIVE	0.999759376	General Feedback
89d3f60c-c554-4f6d-9436-ec9c80e8565f	2	Wow what amazing	5	2024-12-30	POSITIVE	0.999855518	General Feedback
b15954f4-c1d9-4b68-af8d-46e8df7a29fc	2	በጣም መሻሻል አለበት....... ለ ባንኩ ማይመጥን መተግበርያ ነው ::	2	2024-12-30	NEGATIVE	0.970479429	General Feedback
c3a41a6c-cb85-4083-93d4-3bd6a57a339d	2	Lemn embi yilal??	5	2024-12-30	POSITIVE	0.990697145	General Feedback
ea3d98d4-671c-4ac5-ab1d-f4d9177b1947	2	It's useless app downgraded.	1	2024-12-29	NEGATIVE	0.999807060	General Feedback
2d52d1a5-525c-4655-b858-e8d0d2e20bc2	2	Why is not letting me access my account. The whole point of this app is for me to gey access to my account without physically being at the bank. I would give it a zero but a one will suffice to get my point accross.	1	2024-12-27	NEGATIVE	0.765234292	Account Access Issues
6f08a7e9-d374-4337-aa1c-929bc4157b1b	2	When are you going to get rid of this and have a real app that works? By far the worst mobile banking app.	1	2024-12-24	NEGATIVE	0.999793351	Bugs & Reliability
2e488711-7c0b-4546-b00a-bc58f90177dd	2	አይሰራም ሼም ነው፤	1	2024-12-23	NEGATIVE	0.861633003	General Feedback
4081310f-afcd-4c93-a22c-e9bd240129a9	2	Not that much bad	3	2024-12-22	NEUTRAL	0.998815894	General Feedback
6e64d84c-1cec-4122-91d6-049d64f0b1ad	2	The dirtiest application ever seen...	1	2024-12-20	NEGATIVE	0.995487750	General Feedback
c44d86b2-4bea-423b-a3d6-069baf1a492a	2	The forest app ever	1	2024-12-19	NEGATIVE	0.984095454	General Feedback
f467c327-ab9b-4e79-8d97-2e1b573f6c98	2	I love BoA more than anyone but they are cursed when it comed to mobile banking. Even though this ine is hetter it still s*cks! It will ask me to turn off developer options other wise it won't work! I use CBE, Awash birr, tekebirr, Dashen bank and others but non of them asked me this, why only BoA? Please improve your mobile banking, be competitive!	1	2024-12-19	NEGATIVE	0.998649776	Bugs & Reliability, Feature Requests
8b6153b2-b998-4cc2-bae6-a27ff50642c9	2	Bank of abissena	1	2024-12-17	NEGATIVE	0.948011756	General Feedback
b9b684de-8146-46ae-b1fa-8f07272c6fd2	2	Easy and sooo simple to use it, also its easy to stole someones money using the app	3	2024-12-16	NEUTRAL	0.993119240	User Interface & Experience
56e4df5e-cfd9-4c86-b9b7-ec322a07674e	2	The worst banking app ever. Never works!	1	2024-12-14	NEGATIVE	0.999800742	Bugs & Reliability
e4c77ae3-0541-45b5-84da-a02029e99719	2	Poorly functioning app	3	2024-12-13	NEUTRAL	0.999775231	General Feedback
56fe3f96-f2d8-4b8f-9766-8305907650d0	2	Your system is the worst you should do better😡😡😡😡😡😡	2	2024-12-11	NEGATIVE	0.999789178	General Feedback
2795b1e3-ccdc-4b4a-8c25-cd4c6cc0d2ba	2	It has been a while since you guys started giving the mobile app service but still couldn't get it to work. I'm sure you know that it doesn't work already but not sure if you're lazy or incompetent to fix it. You are losing business because of this. Complacency will have consequences.	1	2024-12-10	NEGATIVE	0.999761522	Bugs & Reliability
93bee220-7c85-4d30-ba6f-c8168c201b5a	2	This is the best app; many features are awesome, but it should work without the need to turn off the developer options. I'm tired of having to constantly switch the developer options off and on. I've been expressing my struggles about this. I have precious settings enabled in the developer options, and to open the App Boa app, I have to turn them off. Please help us, Abyssinia Bank. I hope you can provide an update soon.	4	2024-12-08	POSITIVE	0.883911014	Bugs & Reliability, Customer Support, Feature Requests
6fe3a0f0-e9dd-4dcb-81ab-e478b1239d55	2	I’m giving this app one star because there are no options below that. My experience has been incredibly frustrating due to the extremely long loading times, and the app even closes automatically at times. People choose mobile banking for its convenience, but this app is far too time-consuming, making it the worst I’ve used. I hope improvements are made to enhance the user experience.	1	2024-12-07	NEGATIVE	0.999680281	App Speed & Performance, Feature Requests
9815bb8a-2108-49fe-8292-fb360aed8331	2	Very unprofessional and mischievous bank in my opinion. I have had several occasions but recently I used Abyssinia Card to withdraw money and it was deducted from my account but despite reporting several times they said they are processing it but I learned yesterday that since it has been 3 months the bank has decided to include it in their income. How absurd. If you can avoid this bank.	1	2024-12-06	NEGATIVE	0.994106770	General Feedback
f07f9c2b-112a-4fe7-9187-0da7683616bc	2	It doesn't work on my 2 devices A05 and A34 😡	1	2024-12-02	NEGATIVE	0.999681115	Bugs & Reliability
b53d4763-fbf3-4815-93c6-415d6026c863	2	It's better to say I don't use boa rather than pulling your phone out and opening this app	1	2024-12-01	NEGATIVE	0.998175263	General Feedback
709e40a3-94cf-4414-9d03-b83ab5783be2	2	My attention is very important because it will be the most difficult time for me	5	2024-11-30	POSITIVE	0.992617548	User Interface & Experience
2d922abd-f8f3-4666-8a3f-d83060bb7b5d	2	The worest MB app ever!!🙄	1	2024-09-02	NEGATIVE	0.909268558	General Feedback
c150161c-e679-408f-aa76-41f4c9787f9a	2	I have a worst experience while using this mobile application through out the year. Most of the time it fails to "Login" or automatically closed the app. And also it takes so much loading time (5 minutes +) trying to access the internal services. Sometimes also while transferring within and to other bank also fails. So, BOA please fix your app.	1	2024-11-29	NEGATIVE	0.999794662	Account Access Issues, App Speed & Performance, Bugs & Reliability
8c12373b-e19d-494f-8506-a54490d9709b	2	I don't know why but your apps start out great then all of a sudden don't work🤷‍♀️	1	2024-11-28	NEGATIVE	0.998485029	Bugs & Reliability
1756e606-985f-44eb-bab4-95bcf0848416	2	This application is losing major factions on a daily basis. I can count how many times I have used this app; it is completely useless and disappointing if I am not going to use it in times of need then I don't see the point.	1	2024-11-28	NEGATIVE	0.999794424	General Feedback
a49183c0-2f37-4898-a64e-ab1cce218c2d	2	exellent digital transaction of money	5	2024-11-27	POSITIVE	0.994447947	Transaction Performance
5816b056-8f44-4faf-92a4-a28efd01448b	2	The latest update has stopped android 9 phones not to open this App. Never work properly since i started using it.	1	2024-11-26	NEGATIVE	0.999749720	Bugs & Reliability, Feature Requests
bd0a4a80-4971-4156-9418-bef834d65877	2	It needs more improvment	2	2024-11-24	NEGATIVE	0.998616099	Feature Requests
3d00a389-ea31-4ae9-ae70-9014f48845ca	2	Please this app on my android phone	3	2024-11-20	NEUTRAL	0.648866296	General Feedback
d9c98c7f-3df6-466f-a6fc-820cb281fad1	2	Your app doesn't match your bank, the app is disaster, super slow. Please learn something from tele birr app.	1	2024-11-19	NEGATIVE	0.999489546	App Speed & Performance, Transaction Performance
695331e7-0600-4a44-805b-255770e5f33b	2	Fast and reliable	5	2024-11-18	POSITIVE	0.999859571	Bugs & Reliability, Transaction Performance
3d362e0c-4c39-498b-8b61-b52226effacd	2	The worst app update ever. Why would you include the "developer option off" thing here? Why do you care? It is my phone my money, right? That is the reason why I switched to other banks. So either turn it off or everyone will discontinue their business one by one.	1	2024-11-17	NEGATIVE	0.999803364	Feature Requests
f106cb33-9dcb-4a38-a65d-3cbb1a9a790e	2	One of the poorest mobile banking system	1	2024-11-13	NEGATIVE	0.999756634	General Feedback
6446c637-4d71-4aa9-b09c-abcc44110734	2	i find it interesting specially in reciept downloading	1	2024-11-12	NEGATIVE	0.998131454	General Feedback
e086cf56-30a1-4650-b7c7-492dbab0f831	2	This app crashes everytime, please fix it	1	2024-11-12	NEGATIVE	0.999675155	Bugs & Reliability
5d19cf33-a0a2-4263-ae80-c963660bde79	2	አንድ star ራሱ ይበዛበታል። i dont recomend to use this app also the bank	1	2024-11-12	NEGATIVE	0.996403813	General Feedback
316e654c-3526-4bca-8086-60b63895f732	2	I need a support the app is not working	5	2024-11-12	POSITIVE	0.999803483	Bugs & Reliability, Customer Support
553a157d-5f77-4f45-849e-6985fd3f61ca	2	Bast bank of ethiopia	5	2024-11-12	POSITIVE	0.997806132	General Feedback
3bf25c8f-faed-49a0-b64c-feff01ccadfb	2	very slow app. አቢሲኒያን ከሚያክል ባንክ የማይጠበቅ software app. ከቻላችሁ ሙሉ ለሙሉ እንደገና አሰሩት።በጣም ይመራያል ያሳፍራል።ለapp የወጣው ወጭ በሙስና የተበላ ነው የሚመስለው።	1	2024-11-12	NEGATIVE	0.999052703	App Speed & Performance, Transaction Performance
d7d3b979-cd01-4ecf-936f-02cb87adc6b3	2	thank you for your social services like, vertual banking, non touch ATM, Cadrless and withdrwal with out passbook...	5	2024-11-12	POSITIVE	0.960669041	General Feedback
fe160342-c4b4-442c-910c-2ddce8172994	2	The worst App i have never seen like this before	1	2024-11-12	NEGATIVE	0.999774158	General Feedback
10cdcbf6-81ab-4281-8583-665788be8e91	2	This app is not available on all android versions and some times it is not functional.	1	2024-11-08	NEGATIVE	0.999718726	General Feedback
8405e36b-c5ee-4a39-92b8-2bbda678dcf1	2	Bad app vety bad.	1	2024-11-07	NEGATIVE	0.999805868	General Feedback
ac6715ed-80bf-4720-8893-cd6f0340c82c	2	The most useless app, I never expected such an irrelevant app from BOA. big shame!	1	2024-11-04	NEGATIVE	0.999734819	General Feedback
1278f570-8dea-4557-a749-5466685c05e4	2	Professional on banking app	5	2024-11-01	POSITIVE	0.961629629	General Feedback
169b6d5b-b5df-4a42-9168-ce968142da5b	2	Has some nice interface but always freezes or slow to load .App developers please fix this issue.	3	2024-10-27	NEUTRAL	0.993607759	App Speed & Performance, Bugs & Reliability, Transaction Performance, User Interface & Experience
518dfdbb-4c08-469f-aee2-3caba92930ac	2	Please try another because this app doesn't feet the need of this generation	1	2024-10-25	NEGATIVE	0.996269822	General Feedback
9b20307d-6ea1-4920-a74f-b5d6f16390bb	2	What's up I can't log in, what's wrong	5	2024-10-22	POSITIVE	0.996678114	General Feedback
4fe26762-e4bf-4ebd-bbeb-538577f6d724	2	Nice to meet you my proud bank in Ethiopia.. I'm a member of this bank, i need to solve my problem of international receiving money for me from my online digital working service's over the world please? I'm working a lot of international money.But i can't get direct in Ethiopia because of don't knowing the legal ways of getting money in Ethiopia please can I get and direct deposit with BoA please 🙏🙏🙏?	5	2024-10-18	POSITIVE	0.989978075	Bugs & Reliability
03ed7b23-17b8-4ae5-9c2f-29922a888edf	2	Terrible Bank Experience It’s unbelievable that with all the modern technology, this bank still struggles with even basic transactions. The app constantly crashes, services are limited, and every time I try to transfer money or load Telebirr, there’s a huge delay. I have to wait 5 days for failed transactions to be refunded! Even USSD is unreliable. They’ve put me in embarrassing situations countless times, and customer care never fixes anything. I’ve switched banks, and you should too!	1	2024-10-14	NEGATIVE	0.999413967	Bugs & Reliability, Transaction Performance, User Interface & Experience
df4d9c87-1a87-4a1d-8900-581c52470725	2	A painfully slow banking app service. Please don't make it your choice!	1	2024-10-13	NEGATIVE	0.999660850	App Speed & Performance, Transaction Performance
e3dac0d5-d198-42ee-8536-2d6fd0365164	2	Best app to me	5	2024-10-11	POSITIVE	0.997821808	General Feedback
1d49e80a-b12c-4cd5-abd9-b9b2d6612d64	2	If it is possible I would gove0 star	1	2024-10-08	NEGATIVE	0.992819250	General Feedback
d1c75600-5e8d-416b-8627-b3700bc64633	2	Nise mobile bankig	4	2024-10-05	POSITIVE	0.985875547	General Feedback
ac7391a6-712b-424c-970d-6dba1a0dd845	2	Overall good app but performance needs some improvement also sometimes when using instant other bank transfers it refuses causing to be repeated several times to transfer	4	2024-10-04	POSITIVE	0.953279197	App Speed & Performance, Feature Requests, Transaction Performance
ab760759-00d0-43fd-9267-f1d3f34a74e6	2	Just make it work please🤣 this is embarrassing for a bank of your size	1	2024-10-04	NEGATIVE	0.998818099	Bugs & Reliability
3a05c496-6385-4903-b2f5-54f69bdd8ee7	2	Update to the simplest way it requires the developer option on and off why this is	5	2024-10-04	POSITIVE	0.998016357	Feature Requests
94ba00d0-c2e8-4e21-9e71-af2395f2d0ca	2	Stop telling me what to do with my phone, BOA. Why does your newly updated app keep asking me to disable the developer options? I’m not slowing down my phone just to use your God damn app. 🤮🤮🤮🤮	1	2024-10-04	NEGATIVE	0.997853339	Feature Requests
b4f29388-db8b-4ce7-9539-82a8c57b071a	2	I'm living out of country how may I download and use mobile banking? It asks me the Ethiopia phone number and I can't receive text to confirm because I'm out side the country. So please lete know if I can use while I'm outside the country. Thanks	1	2024-10-04	NEGATIVE	0.659739733	Transaction Performance
510eb8c1-9b58-4989-bdd1-674fa63c3d08	2	The worest app ever	1	2024-10-03	NEGATIVE	0.953590095	General Feedback
f242b9c6-0093-4b0d-85c6-fec827999123	2	አሪፍ ነው በርቱልን	5	2024-10-03	POSITIVE	0.833725393	General Feedback
4cbbb09a-77c0-45b2-89e6-784c7186918b	2	Great For Financial company	5	2024-09-30	POSITIVE	0.999870300	General Feedback
1afdfab9-884b-4dd2-9881-a468a0eb567f	2	Very easy to use	5	2024-09-30	POSITIVE	0.999142289	User Interface & Experience
5d940978-07d3-41d9-81b1-74867eb724a3	2	The App's crash always.. Error.....	3	2024-09-27	NEUTRAL	0.999688029	Bugs & Reliability
180bed10-eda6-4491-84cf-93d55ff8d92c	2	This app is incredibly frustrating to use. It’s filled with issues that make it difficult to navigate and complete tasks efficiently. I’ve never encountered such a poorly designed banking application before. It needs significant improvements to enhance user experience. It deserves a vey low rating.	1	2024-09-26	NEGATIVE	0.998426080	Bugs & Reliability, Feature Requests, User Interface & Experience
e03e750f-2744-47c8-9f9b-e54a13cde49a	2	Great UI and seamless UX. I love it!!	5	2024-09-25	POSITIVE	0.999855757	User Interface & Experience
a84791b9-6811-4e81-9461-b4e880dee4d6	2	That's too good application but try to add more alternatives and futures or possibilitys for your customers	3	2024-09-25	NEUTRAL	0.994133651	Feature Requests
f4b63e31-2da1-40e8-acf5-fdb0a6e0b1a0	2	It's easy used to operate program and secured 👍👍	4	2024-09-25	POSITIVE	0.893807828	User Interface & Experience
0382f8e0-e971-4b72-8392-b9aca8d61d7e	2	I bought a mobile card on this app but I didn't receive it and it took my money and I didn't get my money back.	1	2024-09-21	NEGATIVE	0.999474108	Transaction Performance
9a938500-3558-429f-b5aa-f84792f3e442	2	Great app with great services	5	2024-09-19	POSITIVE	0.999822676	General Feedback
a5ea959a-2e3d-442b-ba31-70b22aebb873	2	Yes active user	5	2024-09-17	POSITIVE	0.998392999	General Feedback
432b754e-574b-4686-8f97-7a8f80f3a39d	2	The worest app ever made i would not recommende for no one	1	2024-09-16	NEGATIVE	0.561127901	General Feedback
c33b61e9-53db-4349-9ffb-a0d8a5a59051	2	How many hours should I wait after transferring money to telebirr, please do something about the transfer delay issue I need my money when ever.	1	2024-09-15	NEGATIVE	0.998875439	Bugs & Reliability, Transaction Performance
a8423c57-d734-4ebf-9dda-4f4dd43091ec	2	BOA is unreasonably holding and delaying transactions for more than a day, even transactions within the same bank itself. This is a huge gap that I observed in BOA mobile banking. I didn't experience this kind of challenge while having transactions in other banks' mobile banking platforms. After waiting so long, I called your customer support team and the response they gave me was "it was the system that holds the transaction & will be released on working days". This is not totally fair.	1	2024-09-15	NEGATIVE	0.999420881	Customer Support, Transaction Performance
72e37eb9-220e-4ebb-8068-a846c6c2ec45	2	የእርስዎን ተሞክሮ ይግለጹ (አማራጭ)	5	2024-09-14	POSITIVE	0.861633003	General Feedback
7f00e003-f4e4-49e1-bdd1-16c71454d8ea	2	It's not working. It needs a big update. Can't you update the app quickly?	1	2024-09-14	NEGATIVE	0.999777853	Bugs & Reliability, Feature Requests
15bcf00e-6cb4-4e13-9ded-9b6a1cce2bd8	2	I am Aimohon Joel , It's can be Good for a Better Conversation in Time 🙂	3	2024-09-14	NEUTRAL	0.990702271	General Feedback
a597b94a-ed3c-4fa9-a749-a23d54faa49c	2	Better app than most mobile apps, but why do I have to turn off developer option every time I wanna use the app?? It's annoying.	1	2024-09-13	NEGATIVE	0.999439538	Feature Requests
8f298344-5e64-4ebe-bbcc-c24b6909b563	2	Bes and freindly app	5	2024-09-13	POSITIVE	0.913650990	General Feedback
6bd7e86b-f9b2-4204-925d-33082e883d64	2	It doesn't work.	1	2024-09-12	NEGATIVE	0.999776185	Bugs & Reliability
1e10c54c-f676-477c-9a7b-bb0aba1aeb9e	2	It say "The request was not successful. please check device connectivity or try again" why? One of the bank manager told me it is because of my phone's android version which is 9.1 It is ridiculous! Disappointing	1	2024-09-11	NEGATIVE	0.999775827	Transaction Performance
f736ba52-844f-46ef-9164-1803171f7177	2	How to download or screenshot of payment receipt...what kinda worst app ever 🤮🤮🤢	1	2024-09-11	NEGATIVE	0.999802530	Transaction Performance
d6d25233-fa63-4817-a558-29517149d2ff	2	Yegema app tish🪨	1	2024-09-08	NEGATIVE	0.944506824	General Feedback
07b686cc-bf94-4164-a731-684fa29cfb83	2	This is not an appropriate app, i don't know how boa develops this app, i don't expect this much crazy and un confortable app form BOA, I'm soory!!!	1	2024-09-07	NEGATIVE	0.999741018	General Feedback
83311c04-cd01-496c-b382-2caaa5132819	2	Shockingly bad! Even when it decides to work, it's painfully slow and frustrating. Such a shame that it has become a stain on an extraordinary bank	1	2024-09-06	NEGATIVE	0.999722183	App Speed & Performance, Bugs & Reliability, Transaction Performance
a2fb35e2-3828-4626-bddb-7443e04bf770	2	It crashes frequently. It launches on Android 8.1 but I don't think it actually works on versions less than 10. If so, it shouldn't be available for download by such devices to begin with, like many other finance apps are not. It was so much better three months ago, upgrades should be for the better.	1	2024-09-06	NEGATIVE	0.999326944	Bugs & Reliability
3283f02f-0474-44ec-b7d6-5e90c94d88d4	2	Awesome application. But lately its crashing everytime i opened it.	4	2024-09-05	POSITIVE	0.912768960	General Feedback
46e93d8a-1db7-4de9-af68-14e66a30c6c1	2	እጅም በጣም ደካማ አፕ ነው ሲፈልግ ይከፍታል ሲፈልግ አይከፍትም ከአዋሽ እና ንግድ ባንክ የመሳሰሉ ባንኮች ሲወዳደር ሞባይል ባንኪንግ App እጅግ የሚያበሳጭ ነው ለውጥ ያስፈልጋችኋል	1	2024-09-05	NEGATIVE	0.963925064	General Feedback
ed313595-7211-44a8-9b42-defd7503aebc	2	Nice looking app but a terrible user experience.	1	2024-09-03	NEGATIVE	0.995810270	General Feedback
861dcf64-11ac-4109-9416-dca7c303cdf9	2	Plz fix the Apps ....screenshot lovation hide from glarey share botten not work😔😔	1	2024-08-30	NEGATIVE	0.999665141	Bugs & Reliability
9ecfe32c-ca36-4390-b7c5-73b509e9eb02	2	The worst experience ever	1	2024-08-29	NEGATIVE	0.999792755	General Feedback
8d23e22a-989a-44bb-81bf-3f34c868d3de	2	Hi I have problem with this App BOA mobile I don't know what is wrong with this App I did many times download but it's sam doesn't work if sam like that this app way I have to be customer with them how I know my account and checking save The book is no Not enough alone	1	2024-08-28	NEGATIVE	0.999367893	Bugs & Reliability
a3d2eb8a-821b-4e7a-8811-13e76f876378	2	It is not work for my device	5	2024-08-27	POSITIVE	0.999763668	Bugs & Reliability
8f57afa4-5ed4-4db7-ab84-7b52045fa94e	2	I'm Sick and tiered of enabling and disabling Developer Option Everytime I use this app. maybe you know it maybe you dont, fix it please it's anoying	1	2024-08-26	NEGATIVE	0.999175966	Bugs & Reliability, Feature Requests
a5c6ec4a-ac4e-4ab7-83dd-271c28d11492	2	The worst app ever	1	2024-08-26	NEGATIVE	0.999793470	General Feedback
9fa13def-7ef1-4e33-bbd4-24d4a4c2c1b0	2	I dont recommand it to any one	1	2024-08-23	NEGATIVE	0.985550404	General Feedback
13cb3aad-a536-447c-8e30-2d7eaedcf5e4	2	The application used to work well. But after updates I'm not able to use the forgot password feature, which is blocking me from accessing it as a whole.	1	2024-08-20	NEGATIVE	0.998135090	Account Access Issues, Bugs & Reliability, Feature Requests
e7724869-421f-4e36-be90-104ea76feb33	2	App isn't working	1	2024-08-18	NEGATIVE	0.999569237	General Feedback
7172704c-d6ab-4ee6-8c06-7e540a7d5fc7	2	so far good but always it lugs	3	2024-08-17	NEUTRAL	0.982947052	General Feedback
fd6fe106-f83e-4e61-8f27-3555b7e5a227	2	Don't trust this bank and its service.	1	2024-08-16	NEGATIVE	0.999631166	Security Concerns
bd90f06d-8e5d-498a-b0be-de5110c3c700	2	I can not open and use the application,please help me!	5	2024-08-15	POSITIVE	0.999700904	Customer Support
b9ddd42d-164a-41e5-b5cd-55dd14cfbd8c	2	Mostly not working 😑	1	2024-08-14	NEGATIVE	0.999719203	Bugs & Reliability
6e039674-a668-43a6-8d89-201a4c32000e	2	Despite the enhanced technology you have, the application doesn't work properly, and it asks for the developer option to be turned off, fix that.	3	2024-08-12	NEUTRAL	0.999629498	Bugs & Reliability, Feature Requests
f3cb13b7-59a4-4910-8373-e7a7f3f9d1e9	2	Very poor app b/c highly slow to open the app	1	2024-08-12	NEGATIVE	0.999802291	App Speed & Performance, Transaction Performance
501db4c8-f14f-4810-9590-d4ab79be84a2	2	Wedi Tekle .	5	2024-08-11	POSITIVE	0.842127264	General Feedback
0893e704-f5b8-49d8-b12d-dd7e8924daa6	2	Dura nan fayyadaman ture amma garuu naaf hojjechaa hin jiru maaf?	5	2024-08-11	POSITIVE	0.995648801	General Feedback
aeea13da-3744-4721-95b1-60031b562393	2	ሰላም አቢሲኒያዎች የሞባይል ባንኪንጋችሁ ተጠቃሚ ነኝ አገልግሎቱን ስላስጀመራችሁለን እናመሰግናለን። ነገር ግን አለፎ አልፎ የነበረው የማስፈንጠሪያው በአግባቡ አለመስራት አልፎ አልፎ ወደመስራት ተቀይሯል ድሮ እንደነበራችሁ እናውቃለን ዘንድሮም ብትኖሩልን እንመርጣለን *ከዘመን አንጉደል*	3	2024-08-10	NEUTRAL	0.961605191	General Feedback
ba879c5c-680b-4f62-867c-3f7e8fd1e694	2	Gooood app my dear	5	2024-08-10	POSITIVE	0.900593698	General Feedback
88e2b5f6-040e-452a-9bad-a98caa89cd95	2	Harun tamam galanaa	3	2024-08-09	NEUTRAL	0.941059589	General Feedback
98b97eb6-5299-43f7-a372-45b0a486318b	2	A total disaster of an app. Always offline, never works, it's embarassing. I've lost hope and taken my business to a competitor	1	2024-08-08	NEGATIVE	0.999799430	Bugs & Reliability
56402226-89f9-4f56-9761-e0dfeed5718b	2	so poor app to use can't start up when open the app	1	2024-08-08	NEGATIVE	0.999744475	General Feedback
9151c064-a00f-4efc-ad7a-1f632401b194	2	This app takes too long time to be opened. And even it is not working simply as other banks application. Why this app does not give a digital invoice. Even, I am not able to find where the screeshot is kept after transaction. So, please the developer should fix all these.	1	2024-08-07	NEGATIVE	0.996863484	Bugs & Reliability, Transaction Performance
85a692a1-c9ed-4525-a373-8756f3b9724a	2	Worst app ever, not user friendly, even doesn't serve basic functionality correctly, takes to much time to login and navigate through the app, we expected more from this bank	1	2024-08-07	NEGATIVE	0.999782860	Account Access Issues, User Interface & Experience
45b0b82d-0f4e-423c-b3d2-6241e89b24bb	2	Bad app .	1	2024-08-06	NEGATIVE	0.999791563	General Feedback
c22c687c-b43d-418d-bd9a-c534c12bdee4	2	I mean how could a big financial company like this, be this much irresponsible to release this app? You should be ashamed!	1	2024-08-06	NEGATIVE	0.999444187	General Feedback
5af4e484-25a8-4612-a21f-78d14133c52d	2	Is it necessary to switch off developer options every time to use mobile banking?🤔🤔😡😡😡	1	2024-08-04	NEGATIVE	0.998541236	Feature Requests
d65cb095-4aad-44b5-ace2-de0e6be51444	2	The previous version is better it doesn't work	1	2024-08-04	NEGATIVE	0.999775589	Bugs & Reliability
b42ad5f5-049c-49dc-a13c-39b7414793d0	2	I don't know what is wrong with BOA as a bank in general. It's been going backwards since last year or so. The app is a disaster to use in every possible way. Not stable to log in and very slow to perform transactions, couldn't take a screenshot (or can't even find the pictures even using its save screenshot option). Most of the time, it fails to perform transactions and so on. Simply, it's the worst!	1	2024-08-03	NEGATIVE	0.999819696	App Speed & Performance, Bugs & Reliability, Feature Requests, Transaction Performance
612a0e01-ba70-498b-a331-e93ce6adfce0	2	Take some note from CBE mobile banking app, it's the best banking app currently take some note and improve ur app . Sometimes u have to learn from the bests 🙌	1	2024-08-03	NEGATIVE	0.996557593	General Feedback
9813a786-cefe-4a1b-932e-e920944fadec	2	It's a useless app	1	2024-08-02	NEGATIVE	0.999805868	General Feedback
95b8d5aa-aa79-40a8-b250-6bf68f7b9782	2	It's not working as it was , so much need to improve, it was the best but not anymore	2	2024-08-01	NEGATIVE	0.999145865	Bugs & Reliability
03bcdbc8-adcf-4f5d-b155-1001f6debab5	2	Not yet completely working this App. i don't know when is it will be working properly! Its Sad!!!	1	2024-07-31	NEGATIVE	0.999375403	General Feedback
1d426479-7c59-42d4-b349-7bc3afaf374e	2	The app does not open sometimes it says coonection issue which i dont have and after it opens it has bugs while using its not smooth to work with please improve it	1	2024-07-31	NEGATIVE	0.995302320	Bugs & Reliability
be349d45-280d-4ecf-8d23-71c407bd38c6	2	It's not working totally, what a useless app is it,	1	2024-07-31	NEGATIVE	0.999809921	Bugs & Reliability
758affdf-42d5-466d-a18e-4c4bbeb738fd	2	This app has become the most troubling every day. It doesn't work. I love the bank, and I hate the app	1	2024-07-31	NEGATIVE	0.998794675	Bugs & Reliability
14bb95be-0bf2-43a7-8757-a4a82eeddd80	2	this is so disappointing app 😞	1	2024-07-31	NEGATIVE	0.999804914	General Feedback
4e9b8da6-1754-42e0-ae35-531e8a757183	2	አቢስኒያ የሁሉም ምርጫ	5	2024-07-29	POSITIVE	0.833725393	General Feedback
3caf7a29-584d-4d26-b615-ed88a0be9da6	2	The worst app	1	2024-07-28	NEGATIVE	0.999796927	General Feedback
e960ae7a-6e14-47e3-83d2-2d9b3f666a01	2	it can't even open and only display error messages	1	2024-07-27	NEGATIVE	0.999347270	Bugs & Reliability
5b46e22e-c7a6-4a66-bd2c-5976bd9a46f9	2	To get good quality	5	2024-07-27	POSITIVE	0.999868393	General Feedback
012b929b-0cb1-4f2e-89c3-cae3fcc4b2d3	2	አይሰራም እኮ ምንድን ነው ችግሩ?	1	2024-07-26	NEGATIVE	0.964762032	General Feedback
a185087f-8a27-444a-8646-23f7ab69b205	2	uselss app dont download	1	2024-07-26	NEGATIVE	0.997720301	General Feedback
c8c1d8d1-5304-4e81-a052-f7437a7b341e	2	Is this app fake i try it not working it say please try again later, unable to make transactions what is the purpose of this app . If it is not working delete it	1	2024-07-25	NEGATIVE	0.999631882	Account Access Issues, Bugs & Reliability, Transaction Performance
06f1e24f-10fc-461b-862c-180fb9acf4f4	2	This app didn't work. They have a new version (new app) but still not compatible with my Samsung S8+ , which is v.funny.	1	2024-07-25	NEGATIVE	0.998704672	Bugs & Reliability, Feature Requests
b209e7d6-5e6b-41ca-9658-be1a2a635ccc	2	Corrupted and poor app	1	2024-07-24	NEGATIVE	0.999743998	General Feedback
1920d8a2-4e03-4818-8a69-7c17c565ae75	2	When I try to use the application it says 'developer setting should be off' where is the setting to off this play Still doesn't work for me	3	2024-07-24	NEUTRAL	0.999801219	Bugs & Reliability
d013e7a7-f3ca-47ec-a3e9-84c741e47b7a	2	FIX YOUR Apollo!! You guys where the best 👌	1	2024-07-23	NEGATIVE	0.999800384	Bugs & Reliability
d3a4d1b9-9b82-4760-bd5d-ae4fd3232750	2	Always slow and doesn't work on weekends if you are in a rush or a merchant this app is not for you	1	2024-07-23	NEGATIVE	0.999439657	App Speed & Performance, Bugs & Reliability, Transaction Performance
ec8fcf0d-19d7-446f-bd1e-907f91a67b49	2	It's very difficult to use the user, app,ones dawenload the user can't operate well , no one can help me,	1	2024-07-23	NEGATIVE	0.999691725	Customer Support, User Interface & Experience
f9d522b2-ef61-43ea-bdff-9ccf70b88498	2	Poor application. It turned off by itself	1	2024-07-23	NEGATIVE	0.999744475	General Feedback
b6e1b58d-d5d6-4134-b837-32c4833850ae	2	It usually crashes and the reason it gives is a problem on internet connection although the internet was fine.	1	2024-07-23	NEGATIVE	0.999104321	Bugs & Reliability
3c4112db-f5c6-4d6c-9df2-de29043c5c14	2	we want international mobile banking	1	2024-07-22	NEGATIVE	0.958784819	General Feedback
01c3d316-3dbc-4e5c-9a71-8ed4fecc7233	2	screenshot isn't working, Please modify it	2	2024-07-22	NEGATIVE	0.999608099	General Feedback
ac10c99a-bbe4-4a0c-92c3-14e312356969	2	Naziriet measho 89160437	1	2024-07-22	NEGATIVE	0.986265123	General Feedback
55a9b559-0322-409d-9973-ebd1f7b5595b	2	Ahmed Mohammed husen	3	2024-07-21	NEUTRAL	0.912414968	General Feedback
0b4b949e-9c50-4262-9b4a-fcdd563921ea	2	Is not working both this one and apollo did u make it better pls am gonne stop using this bank because of the mobile banking	1	2024-07-19	NEGATIVE	0.999622226	Bugs & Reliability
e090fd59-6274-4827-8c79-644c6a1f5c73	2	I have experiance	5	2024-07-19	POSITIVE	0.807029903	General Feedback
481a1e89-df8b-43d4-9bf7-aa4a5cd196f5	2	The App is not working on Android 9.1 at all. It shows an error notification and forcefully closes the app. Must be fixed ASAP.	1	2024-07-19	NEGATIVE	0.999773920	Bugs & Reliability, Feature Requests
2a2d15cb-06ba-425c-a417-2f020e552505	2	Crashes very frequently is not stable overall need improvement such a huge bank needs a better app than the current one	1	2024-07-19	NEGATIVE	0.999760091	Bugs & Reliability, Feature Requests
d7ee5d77-4c89-4e81-a79d-000f5e23c3ac	2	The previous application is much better than this one	1	2024-07-18	NEGATIVE	0.999114931	General Feedback
29aa3b3c-e4c7-41c7-bbb1-5d514633c307	2	Worst app. It is wise to invest money and you can make it like CBE app. Even the incon has no image. My app has better UI than yours. So, please invest more and hire professional developer companies and improve it.	1	2024-07-18	NEGATIVE	0.999472797	User Interface & Experience
b1ec9a7a-5962-45c7-ac3a-0043f8a96f9e	2	It is not working at all	1	2024-07-16	NEGATIVE	0.999781191	Bugs & Reliability
95a7177d-a323-4a17-98ad-9f94ea147686	2	The poorest mobile banking survice ever. Only error reports frequently	1	2024-07-16	NEGATIVE	0.999705970	Bugs & Reliability
421ae4df-7a88-426e-b355-1a437f7f8f3f	2	The worst banking app	1	2024-07-15	NEGATIVE	0.999805033	General Feedback
a98b2177-e8cf-4818-aa1b-82a1e80df07b	2	The app is constantly crashing and freezing when to send to BOA customers' accounts.	1	2024-07-15	NEGATIVE	0.998840153	Transaction Performance
b56a3452-b7ca-4299-a268-8bb9e84fb3c5	2	No work app	5	2024-07-15	POSITIVE	0.996898293	Bugs & Reliability
e5d0a231-52e9-4fba-8173-ca61c25de63b	2	Is ok but stop sundenly	5	2024-07-15	POSITIVE	0.930931091	General Feedback
b9471f3a-2e46-4397-a4df-f466c05a21cc	2	Very poor app. Its Always cresh and not compatible	2	2024-07-13	NEGATIVE	0.999818742	General Feedback
3cc9d24d-ace9-45a4-a843-7750c0babd8d	2	It's not functional at all. It keeps saying "error". Unable to activate.	1	2024-07-13	NEGATIVE	0.999812901	Account Access Issues, Bugs & Reliability
3af6db50-c93f-4916-bc9b-8ce248f59a4e	2	I can't believe that Abyssinia develop this kind of trash app it have a lot of issues 👎👎👎	1	2024-07-13	NEGATIVE	0.998873532	Bugs & Reliability
e498340e-1663-4ced-83b2-cc2cd8e4e595	2	The new app is very good	5	2024-07-13	POSITIVE	0.999858975	General Feedback
56e691a9-fdd9-469b-a8b0-d495312cda48	2	It's very good but sometimes isn't work probably	5	2024-07-12	POSITIVE	0.937103212	Bugs & Reliability
e303c5a5-ecd1-4f13-b38c-4b9523bbf321	2	It doesn't work	1	2024-07-12	NEGATIVE	0.999781311	Bugs & Reliability
db0f8d24-804c-4cf2-8a36-f1f68b6bd616	2	This is the most stupid app I've seen, why would I turn off developer mode just because you can't make your app secure, this clearly indicates the app has very poor implementation and unskilled developers.. There are a lot of people who need developer option for different reasons. Please for the sake of the bank, fix this thing... Even the most secure international banking apps don't require it. Not to mention the lag and crashes	1	2024-07-12	NEGATIVE	0.999794066	App Speed & Performance, Bugs & Reliability, Feature Requests, Security Concerns
7bc823fa-4a5e-449b-a505-235522c4c501	2	The worst mobile banking app	1	2024-07-11	NEGATIVE	0.999792397	General Feedback
0c83e05b-6fa5-425f-9f09-a30947722360	2	It is not fast	3	2024-07-11	NEUTRAL	0.997206986	Transaction Performance
94d435e8-8e1a-43e6-8a3c-bd755d66064e	2	The app keeps crashing it stops responding while I'm using it or trying to open the app. Now I have to go to the bank in person to do any banking activities. In short it is the worst mobile banking system in Ethiopia	1	2024-07-11	NEGATIVE	0.999791443	General Feedback
9d157253-6414-46f1-a2f3-0867fbd3f25d	2	Pretty good for a banking app, it still lacks some things with in the ui and with the speed of the app but overall it's a good application. Thank you 5/5👍🏻	5	2024-07-09	POSITIVE	0.999709427	App Speed & Performance, User Interface & Experience
986b160c-cade-4ae5-918e-eddd2802d4d8	2	After update it doesn't work well	2	2024-07-09	NEGATIVE	0.999645233	Bugs & Reliability, Feature Requests
5f80fcab-9967-4c8a-8e42-fe8ecfca0f11	2	Error occurred try again for 5 days tele birr user not found ለራሴ አዝዤ	1	2024-07-08	NEGATIVE	0.998306036	Bugs & Reliability
5921455b-b0e2-4cc1-90a3-92ff67166c47	2	Good but Very slow.	1	2024-07-08	NEGATIVE	0.987754881	App Speed & Performance, Transaction Performance
ecca0ed7-ddf3-4dbe-ba38-145eca8dea76	2	Very good app	5	2024-07-07	POSITIVE	0.999867558	General Feedback
402ea96f-df73-4dab-a929-4c66f64adce7	2	It is so bad apps ,it doesn't work	1	2024-07-06	NEGATIVE	0.999807894	Bugs & Reliability
eb3fc431-4145-4276-990f-496c764b7ea7	2	From now on I will never going to use this app,It is a trash app.No one care about this app from bank I will rate them 0/5.	1	2024-07-06	NEGATIVE	0.998876989	General Feedback
6d67dca3-b643-462f-bfac-f49811eb1473	2	It usually crashes and unable to process also it request to off the developer options	1	2024-07-05	NEGATIVE	0.999689221	Account Access Issues, Bugs & Reliability, Feature Requests
1bdac495-0844-4896-b693-213485aad561	2	I can't believe in this day and age, one of the major banks of the country can't seem to understand that having a working mobile payment option is a **MUST** to survive. I have decided to move my accounts to CBE and Awash because of this. Can't be bothered with this useless app.	1	2024-07-04	NEGATIVE	0.997434556	Feature Requests, Transaction Performance
61368724-0edf-4e9e-89fa-24210bf530ad	2	Is it even working these days? Please check it.	1	2024-07-04	NEGATIVE	0.989270449	General Feedback
53214d92-a487-43cb-b69d-b65294b40823	2	The app is essentially unusable, it asks to disable developer mode even when it is already disabled and crashes, sometimes it only works with wifi and sometimes only with data, or it crashes just because.......	1	2024-07-04	NEGATIVE	0.999209225	Bugs & Reliability
f402174e-b7fe-45b9-9140-7648c19fdd33	2	Please make it functional.	5	2024-07-03	POSITIVE	0.999792039	General Feedback
196ffa19-91c5-4f11-9427-cff840f683e1	2	its best app but its don't working in poor connection area so	5	2024-07-03	POSITIVE	0.970593095	General Feedback
3c94365a-df7a-44a6-a947-4e40d575efdc	2	Please Recover thank you	5	2024-07-02	POSITIVE	0.999731481	General Feedback
c47517ad-7dbb-46ed-864d-4b898aff2b23	2	This app doesn't work	1	2024-06-30	NEGATIVE	0.999792159	Bugs & Reliability
dc201a15-30b2-4d8b-8754-0ecc2db8130b	2	the app used to run fine, but now it takes like forever to even open the main dashboard and sometimes it just crashes on its own. you guys gotta step it up. we need this app to be way faster	1	2024-06-27	NEGATIVE	0.992366254	Bugs & Reliability
d7273bdf-94a5-4b02-89ec-4a863195ea29	2	the underrated app I've ever seen and ur banking system is Soo Idiocracy	1	2024-06-27	NEGATIVE	0.997718453	General Feedback
829d9bb9-e4bc-4e04-90c2-867460eab574	2	It demands to disable developer option.	1	2024-06-27	NEGATIVE	0.999428213	Feature Requests
f0fe277f-65c1-461c-afad-8cd40c6ab368	2	It's been two months now, I cannot do any transaction using this app. It's really disappointing. I am using bank of Abyssinia currently because it's the nearest bank to my work place. The bank is turning to the worst bank in the country day by day. They always respond to customers that they are updating their system all year long, I think that's what they train their customer service operators to do.	1	2024-06-26	NEGATIVE	0.999676228	Bugs & Reliability, Customer Support, Transaction Performance
2b2ff6dc-5482-4582-98ba-2ed17547e409	2	Open Open service	5	2024-06-26	POSITIVE	0.999777019	General Feedback
7200d08f-8524-4b04-b419-4aebdb1630f6	2	አፑ በጣም አስቸጋሪ ሆኗል	1	2024-06-25	NEGATIVE	0.861633003	General Feedback
a390a52e-ca04-40d3-9b31-36f99d60aa99	2	Its not working.	1	2024-06-24	NEGATIVE	0.999785602	Bugs & Reliability
efe89d62-85f0-453d-bc34-e71402cb2f09	2	Riddled with crashes, cant use it anymore. Very frustrating!	1	2024-06-20	NEGATIVE	0.999472916	Bugs & Reliability
c051070a-5552-441b-9c04-ff28664018fe	2	Always error occured. The worst app ever	1	2024-06-20	NEGATIVE	0.999799788	Bugs & Reliability
e2e95eaa-41be-4715-af8d-6cc6f977189b	2	ከዚህ ትልቅ ባንክ የማይጠበቅ ድንዝዝዝዝ ያለ App.... ዛግግግ ነው ያረገኝ 😡😡😡	1	2024-06-20	NEGATIVE	0.960243344	General Feedback
cffa22a2-153f-4c97-8d2a-39b79a5b6e11	2	It's not convenient	1	2024-06-17	NEGATIVE	0.999806702	General Feedback
35179040-fff3-4a61-9e55-e1efe7624022	2	It has become the most unreliable mibile banking app ever.	1	2024-06-16	NEGATIVE	0.999081016	General Feedback
7186cee1-7944-4070-8b9b-2ed1f2bb8c9b	2	አኘልኬሽኑ በሁሉም ነገር ጥሩ ነዉ,ነገር ግን Network በጣም ነዉ እሚያስቸገረው	2	2024-06-13	NEGATIVE	0.920983493	General Feedback
1901236c-37ec-495a-a51a-bc8f471424ce	2	The poorest mobile banking I have seen in the industry. Is not stable to login and post transactions. Is not attractive. Error reports frequently.	5	2024-06-13	POSITIVE	0.999816000	Account Access Issues, Bugs & Reliability, Transaction Performance
3543cc15-6092-4479-80e5-ec6097defe89	2	I like the the bank of Abyssinia is the best first bank of Ethiopia	1	2024-06-11	NEGATIVE	0.999809206	General Feedback
390e85e9-72a5-4a7f-b68c-72f94c586fda	2	The app is not good need a few work	3	2024-06-11	NEUTRAL	0.999753892	Bugs & Reliability
fecff9eb-a424-47c7-9fc8-e4c0898f2be8	2	The worst mob app i have ever seen. Slow, uncomfortable and stupid. It is better to learn from the best app (tele birr). The released updates is even worst.	1	2024-06-11	NEGATIVE	0.999781311	App Speed & Performance, Feature Requests, Transaction Performance
f2fac0e0-abfb-4625-8443-a49953389605	2	Unreliable, expensive service. Most of the time, it is not working. Sometimes, it will take more than a day to complete transactions and charges more for this unworthy service. I will not recommend this bank app to anyone.	1	2024-06-10	NEGATIVE	0.999210477	Bugs & Reliability, Transaction Performance
eb90d966-72f9-44a2-b6b7-40d2b1abcb64	2	You are beutiful	5	2024-06-09	POSITIVE	0.839940310	General Feedback
872e9008-c68d-4d4d-a930-940521f98819	2	The best app	5	2024-06-06	POSITIVE	0.999846935	General Feedback
2eb93931-82c9-4934-a97d-cf26b48f44ae	2	አይሰራም አፑ ለምንድነው	1	2024-06-06	NEGATIVE	0.833725393	General Feedback
3bef74ff-aed8-4675-9cd2-51a6bbdfdf30	2	Developer option to be off really	1	2024-06-06	NEGATIVE	0.990394056	Feature Requests
8c9fa1ff-1764-44a6-b774-e9aac49e48aa	2	Good app boa	5	2024-06-06	POSITIVE	0.999842882	General Feedback
a434370c-550c-4ae9-adcb-7a02aea1c130	2	I'm disappointed with the recent changes to this app. Disabling developer options for functionality seems unnecessary. The previous version offered a more user-friendly experience.	1	2024-06-06	NEGATIVE	0.999768078	Feature Requests
d53f2cd7-9bf3-44e4-8c91-53c11daed082	2	Worest app, it cannot be downloaded	2	2024-06-05	NEGATIVE	0.996936440	General Feedback
fc50f8d9-0d2f-495f-8786-1e4670d229c7	2	slow only some times the wey it is veary nice app	5	2024-06-05	POSITIVE	0.949857652	App Speed & Performance, Transaction Performance
6762bc5b-caea-4127-9115-a0118dc9a3d3	2	The worst mobile banking app	1	2024-06-04	NEGATIVE	0.999792397	General Feedback
6e005c4d-7639-4dd2-9c52-729074435d91	2	It's nice apps	1	2024-06-04	NEGATIVE	0.999875546	General Feedback
0ce9923a-bcad-4b3a-a73d-2af80ed12dcb	2	Wow! what a disgrace for BOA. The app barely works. Too slow and always returns error.	1	2024-06-03	NEGATIVE	0.999787152	App Speed & Performance, Bugs & Reliability, Transaction Performance
89a67fc8-1887-4750-829c-71ee84d59622	2	Excited by your service	5	2024-06-02	POSITIVE	0.999796331	General Feedback
d9506985-4b35-431f-81f7-f9388ddb14d2	2	The worst mobile banking app! It doesn't load (seems like with the perfect WiFi and data connection it still manages to have network issues), when you finally get into the app, it makes it so hard more than it should be to send money.	1	2024-05-31	NEGATIVE	0.999583423	Bugs & Reliability, Transaction Performance
c179b1f8-8bb1-455a-b9fe-9c29d9e71a8c	2	It is Good to save time 👌👌	3	2024-05-31	NEUTRAL	0.999846578	General Feedback
852e921a-9de5-4396-8537-910cf5896d70	2	I'm sorry but what kind of stupid developer thinks the app will be faster if we disable "Developer mode"? I've never seen such degeneracy in my entire life, please get rid of this feature	1	2024-05-30	NEGATIVE	0.999630094	Feature Requests
3f955361-4a28-4185-9b83-bedfcac7b287	2	What is the purpose or point of not allowing to take a screenshot of the recipe after transferring???	1	2024-05-29	NEGATIVE	0.999162674	General Feedback
e63b67b6-01d6-4181-ba54-f6e635067ff1	2	Worst banking app ever	1	2024-05-28	NEGATIVE	0.999789894	General Feedback
f3e8b3d1-1c97-4b9f-9d34-1f6c18b340f1	2	I can't use the app unless I turn off developer mode?? What kind of stupid rule is that?? The worst experience for a banking app!!	1	2024-05-26	NEGATIVE	0.999801338	General Feedback
cdba46f4-4ab0-43ec-8d9a-e695cd895794	2	Sorry to say this compared to other banks mobile app its the worest it need more improvement the app doesn't match the bank standard it need more update its too slow plus it keep saying stop developing option on your phone when no developing setting enabled ??plus when it come to recent transaction nothing to display...	1	2024-05-24	NEGATIVE	0.999431789	App Speed & Performance, Feature Requests, Transaction Performance
1c7fe538-d19f-40ac-9b8b-3e3458f8a26e	2	Very Very nice 👌 👍	5	2024-05-23	POSITIVE	0.999860525	General Feedback
622762e8-14b9-42eb-b807-8960278d8b34	2	What is that disable developer option I have never seen any app commands.	3	2024-05-22	NEUTRAL	0.998886168	Feature Requests
9756a397-2464-40d6-8eab-d269c119aa9e	2	Please fix the app i doesn't belongs to Abbssinya Bank Name	1	2024-05-22	NEGATIVE	0.998264849	Bugs & Reliability
322c12e9-1e9a-4609-b4c0-3ef5f78ff589	2	Playstore need to have some option to give 0 stars because this application right here, deserve exactly that, imagine being one of the biggest banks In the country and can't manage to have good mobile application in the Era of mobile money, you guys are in the brink of collapse you better make it right real quick or you gonna be 10 meters down to the grave. DON'T USE THIS APP, IT'S WASTE OF TIME.	1	2024-05-21	NEGATIVE	0.998460174	Feature Requests, Transaction Performance
42e6b999-2d95-4374-bf40-93c60d08c58f	2	It's good when i've downloaded at first. But now it doesn't work well	2	2024-05-20	NEGATIVE	0.994461954	Bugs & Reliability
d8c26573-6298-42ad-b768-d2981e2ec79b	2	It's just terrible. It kept crashing in middle of transaction. Hell sometimes it won't open. My phone is stock Android (pixel 8) and I don't even know how this happens. Fix it!	1	2024-05-20	NEGATIVE	0.999635458	Bugs & Reliability, Transaction Performance
e1cb88c9-03ce-477d-8001-8d02c35b5410	2	Good but not working top up	5	2024-05-20	POSITIVE	0.964387596	Bugs & Reliability
c7bdb934-1d56-4458-884c-9917d8988cdd	2	በጣም ቀፋፊ አፕ ነው ። ሰርቶ አያውቅም ። በጣም ብዙ ችግር አለበት ከአቢሲኒያ ባንክ የማይጠበቅ አፕ ለምን ደህና ዲቨሎኘር ቀጥራችሁ አፕሊኬሽኑን ድጋሚ አታሰሩትም ?	1	2024-05-20	NEGATIVE	0.977165222	General Feedback
7ab09299-43f9-4a0d-9508-da33dcfef128	2	It is good	5	2024-05-19	POSITIVE	0.999849439	General Feedback
5b6eabc7-30fd-4b72-ba91-8acb7763f48b	2	This app is the most worst app I used in Ethiopia and belive me I know I live in Ethiopia. Being the fincial app It doesn't work when you want it. It makes you wait for cash out code and immediately debit the amount before sending the code I have got to say abysinia bank I didn't expect this from you and I use CBE mobile banking	1	2024-05-18	NEGATIVE	0.999733746	Bugs & Reliability
0a3b1a6e-625e-44de-b24f-799818bef015	2	Poor mobile banking alwayes not working alwayes	1	2024-05-18	NEGATIVE	0.999796093	Bugs & Reliability
1d71b9e5-39e0-4a6b-a6f3-eb0d34c6f007	2	Absolutely the worst mobile banking app.it crashs every time,problem when logging in and and cuts my balance when top up without even recharging	1	2024-05-17	NEGATIVE	0.999798000	Bugs & Reliability
727b69e6-8312-442c-8676-28862f228724	2	Worst app ever	1	2024-05-16	NEGATIVE	0.999780357	General Feedback
7d16d3ef-40cf-4a2d-89ac-c7777240613a	2	Easy and cool app	5	2024-05-16	POSITIVE	0.999842644	User Interface & Experience
b1da4e90-99b5-4ba4-9f21-4d20a34afaae	2	App is so bad network	1	2024-05-16	NEGATIVE	0.999780476	General Feedback
7c7a7f33-9bee-47e4-a0f7-2069f36c33de	2	It's not working for 3days. Come on as a big bank in Ethiopia this is unprofessionallism from boa	1	2024-05-15	NEGATIVE	0.999488831	Bugs & Reliability
a7a625eb-2758-4439-b790-c7f6e62cae95	2	all the time updated but im not satisfy by boa mobile bancking 😡😡😡	1	2024-05-02	NEGATIVE	0.999663353	General Feedback
f0f96f44-de20-40ca-8772-b6a288dd044a	2	It always crashes	1	2024-05-02	NEGATIVE	0.999213815	Bugs & Reliability
663df513-c514-48fe-9c8f-4d9b244a7bef	2	Be careful of using this app to transfer large sums of money. Recently I can't top up my mobile card, can't pay tickets, can't transfer money to Telebirr. The *815# works but what's the use of an app if we're using USSD. It will refund your mobile top up days after failing to top up but I wouldn't want to risk that. I'm a big fan of BoA but I wouldn't recommend this app. 👎	1	2024-05-15	NEGATIVE	0.992086112	Bugs & Reliability, Transaction Performance
3413f38f-a74b-4ab9-b793-4a14bf47b008	2	The worst mobile banking app, doesn't even work for a week properly.	1	2024-05-15	NEGATIVE	0.999810755	Bugs & Reliability
2f6b9362-44be-49f9-acd6-9347b2a4f234	2	77867748 I can't update my mobile banking	1	2024-05-14	NEGATIVE	0.995720446	Feature Requests
123f1456-c770-45aa-b5a7-d5491958f2c0	2	Hate how we're expected to disable 'Developer Options' everytime we open the app. An unnecessary point of friction that's been put in place in the guise of security.	2	2024-05-14	NEGATIVE	0.999773204	Feature Requests, Security Concerns
0a2cdfaa-90f6-42fc-84a8-25c19c9a81c8	2	Build a new app	1	2024-05-13	NEGATIVE	0.946165979	General Feedback
2267893c-a4cc-4618-b016-e0743aea27e2	2	I don't get why this app is developed it is not functional at all !!	1	2024-05-12	NEGATIVE	0.999722064	General Feedback
191b7138-2877-41d6-ac0f-718107b30201	2	This app is trash	1	2024-05-12	NEGATIVE	0.999770939	General Feedback
39957cbc-b356-46a0-b54a-611a7bbc5137	2	It's improved now	3	2024-05-12	NEUTRAL	0.999850273	General Feedback
69e1c5ac-ef38-4405-b62d-61575fe299cb	2	It is really make my life so much easy!	5	2024-05-12	POSITIVE	0.999316454	User Interface & Experience
d2509015-b677-4dbc-ae07-99e399be5ebf	2	My advice for whoever reading is go look for other bank(awash bank is a great example). This bank won't even allow you to access your money when you want. It has bad servers which don't work(respond) on time.	1	2024-05-11	NEGATIVE	0.991803110	Account Access Issues, Bugs & Reliability, User Interface & Experience
8a9379df-644e-4472-bb7e-d315b84aa53b	2	Am not satisfay	2	2024-05-11	NEGATIVE	0.999595463	General Feedback
3980b4ed-4190-4d89-b8ba-e8bdc3789d31	2	Preventing login because I have developer options on is not security. Moved all my money somewhere else because I just didn't wanna deal with it	1	2024-05-11	NEGATIVE	0.999433100	Account Access Issues, Feature Requests, Security Concerns
2ed20bd2-3a87-458d-8757-635f698d0e6d	2	The app has bugs. Signing in is still a challenge. Transfer to another bank is impossible. The app is slow and bland.	3	2024-05-11	NEUTRAL	0.999795139	App Speed & Performance, Bugs & Reliability, Transaction Performance
2f3457f8-3dd9-461e-aeda-9453265796f8	2	Why do u force me to Turn OFF developers option just to use your app its not fair and am not using ur app anymore	1	2024-05-10	NEGATIVE	0.999339044	Feature Requests
6856f9cd-42b9-4ec3-879a-d7893bf12b69	2	Very poor app. It crashes every time, doesn't load properly, and you can't even buy airtime. The programming is subpar. Please take lessons from other online banking apps. I would give it a zero if I could!!	1	2024-05-10	NEGATIVE	0.999793828	Bugs & Reliability
16c88e65-33ea-4f2d-9f64-c5925105274d	2	GOOD HARMONY BANK	5	2024-05-10	POSITIVE	0.999789655	General Feedback
7e7aa7b7-6bcd-4a1f-b3a3-7a65fbb1cea0	2	This app is very simpl for useing	4	2024-05-10	POSITIVE	0.994102657	General Feedback
df95b4c9-3d7c-4d51-ae6b-000f4bb05b20	2	Very laggy un able to make transactions Fix it	1	2024-05-10	NEGATIVE	0.999806345	Bugs & Reliability, Transaction Performance
bd5bf3e9-1b1c-4019-b088-d4a965b8a6b3	2	After recent update the app keeps asking to disable developers options and won't let you use it unless you do.	2	2024-05-10	NEGATIVE	0.974820614	Feature Requests
d80c22c9-edd1-4e95-98c5-862949bb45f6	2	Great UI UX Design !!!	5	2024-05-09	POSITIVE	0.999693513	User Interface & Experience
0b63d4e4-ab7d-48e8-a228-aa6e9153b0a0	2	App is any updates why?	5	2024-05-09	POSITIVE	0.996690035	Feature Requests
f001bc11-3899-462e-8416-919d4f8b575d	2	I am an app developer, I need to keep developer options on... WHY ARE YOU ASKING ME TO TURN DEVELOPER OPTIONS OFF... why is it that Abyssinia is the only damned bank in Ethiopia that just can't seem to buld an app that works... it's not that hard people, just look at CBE... this is simply terrible, borderline unusable!	1	2024-05-09	NEGATIVE	0.999186575	Bugs & Reliability, Feature Requests, User Interface & Experience
680449bd-79a5-4fd7-a4ab-67db9ba11308	2	UGH 🤮🤮🤮 they are super calculative when it CM 2 Mobile-banking or any online stuff. If ur degital!! better chose other bank.	1	2024-05-09	NEGATIVE	0.999406576	General Feedback
d197e711-605a-4bdc-ab1b-31ddbe2b4b33	2	Slow every time	2	2024-05-08	NEGATIVE	0.999620795	App Speed & Performance, Transaction Performance
441a4d3b-2ca8-437d-a583-d210f393aef2	2	It takes a very long time to log in please fix	1	2024-05-08	NEGATIVE	0.998399198	Bugs & Reliability
c20f2730-8f04-4bb5-b0df-0201b263e3e6	2	It's not functional at all	1	2024-05-08	NEGATIVE	0.999789178	General Feedback
91fa4fb9-0eb5-41f3-81b0-c40aea7e51ff	2	What's wrong with App. this days? it doesn't working properly. 1) it's VERY SLOW & doesn't open. it's very Annoying. 2) most of the time it says repeatedly Please try it again or try it later but again and again it doesn't open or work. 3) repeatedly it says something went wrong then it off the screen. I've updated the App. when it needed but nothing changed. 👉PLEASE if it has some issues with the App. Please fix it otherwise I'm going to uninstall it.	2	2024-05-08	NEGATIVE	0.999697924	App Speed & Performance, Bugs & Reliability, Transaction Performance
bc6a63ef-8e5b-4bed-ab4c-842c2f4731c9	2	It doesn't work 😔	1	2024-05-07	NEGATIVE	0.999781311	Bugs & Reliability
cfe884a2-ee43-4d34-9e1a-a49529f5a5c0	2	It crash repeatedly! Try to make it more stable for customers need meet!	2	2024-05-07	NEGATIVE	0.999688625	Bugs & Reliability
6823f630-7cf6-4097-83b4-d771db6c6084	2	After two weeks it require update why?	5	2024-05-07	POSITIVE	0.996528447	Feature Requests
df7e343c-6605-4349-aac9-1082b3e5699b	2	It keeps crashing and hasn't been fixed	1	2024-05-07	NEGATIVE	0.999289870	General Feedback
576b4332-bf4a-4d4b-9f4b-12d293d6f543	2	The application is full of bug, so annoying.	1	2024-05-07	NEGATIVE	0.999766290	Bugs & Reliability
eae7a9f2-f89c-40dc-afe9-97e29649a502	2	Why is the app asking me to remove developer options? Why does it matter what I do with my phone , this is unacceptable! Fix this	3	2024-05-06	NEUTRAL	0.999756277	Bugs & Reliability, Feature Requests
158fd686-a553-4c44-b769-f1a9438fc9a2	2	Worst application relative to other Ethiopia mobile banking app	1	2024-05-06	NEGATIVE	0.999796450	General Feedback
d5d94c22-aaa6-4109-ad5a-fe4ef5bf75d0	2	Worst app ever. Barely works	1	2024-05-02	NEGATIVE	0.999810278	Bugs & Reliability
2bace31c-d24b-4c81-bf20-05e5e8e4748e	2	A little faster than before . Thanks	5	2024-03-05	POSITIVE	0.999690771	General Feedback
005d202c-1b73-435b-b0a4-888e815972f6	2	"I am extremely disappointed with the poor service I have received. It is unacceptable that I cannot make transactions of 30,000 Birr and sometimes my money gets stuck in the air. As a result of your incompetence, I have been forced to change my bank account. This level of service is completely unacceptable and needs to be rectified immediately."	1	2024-05-06	NEGATIVE	0.999744356	Feature Requests, Transaction Performance
63a101fb-cc46-41f6-a9cc-c494cb516a50	2	Doesn't work properly, keeps closing won't activate any account, I wouldn't recommend downloading	1	2024-05-05	NEGATIVE	0.999665141	Bugs & Reliability
4912c5ac-685b-4f39-8a57-ed6332d80b71	2	Pls improve your mobile banking app it's doesn't work constantly after i updated the new version of your app try to improve	1	2024-05-05	NEGATIVE	0.999497056	Bugs & Reliability, Feature Requests
679fec48-ccf8-41f0-8a3a-b5ae9732e149	2	አሁን update የተደረገው App ምንም ነው የማይሰራው መከራችንን እኮ ነው ያሳየን😏😏)	1	2024-05-05	NEGATIVE	0.952655077	Feature Requests
6a6f1313-3312-4fb7-ba80-e6fcf833f5f4	2	Dont even try	1	2024-05-05	NEGATIVE	0.992074847	General Feedback
c7640934-b677-425d-acdf-26fd1560e10e	2	The version 24.04.26 is not opening on any of my devices. I noticed this issue on my friend's Android 9 phone and also on my Samsung Android 12 phone. Even after weekly updates, the newest version is not working properly. Please provide a stable version update, as I prefer the older version of the app from the new one.	1	2024-05-04	NEGATIVE	0.997652948	Bugs & Reliability, Feature Requests
22c234d6-4551-4e15-a32a-4deefd8ad2aa	2	it's good app	5	2024-05-04	POSITIVE	0.999868989	General Feedback
91b391ed-5ae4-49a2-9794-ad8af927449b	2	This app is not working!!	1	2024-05-04	NEGATIVE	0.999782264	Bugs & Reliability
8156750d-9f64-443e-b7c2-8a1a5ba66bc9	2	this app not work why?pleas tell me	2	2024-05-04	NEGATIVE	0.999666929	Bugs & Reliability
e4554668-15d1-4f3b-b7a6-7cfd6fde0d77	2	I am comfortable with your good service	5	2024-05-04	POSITIVE	0.999863982	General Feedback
9326f13f-7a0c-479e-9c70-f0a0603e1d41	2	betam yedadab app	1	2024-05-04	NEGATIVE	0.778093040	General Feedback
3d55cef5-e15e-4e95-a536-26fdecd1c697	2	i like is app boA	4	2024-05-04	POSITIVE	0.938754380	General Feedback
4a8826a7-8188-4a66-ac8d-cb6caa50acba	2	best app from any mobilebanking	5	2024-05-04	POSITIVE	0.999002397	General Feedback
0cd4362a-07c6-439c-811c-a0b6ecba6136	2	It crushes repeatedly	1	2024-05-03	NEGATIVE	0.999424338	General Feedback
538d4305-bead-4891-bbde-4d719e7b8545	2	Very bad app as always bothering any transaction processes.	1	2024-05-03	NEGATIVE	0.999804676	Transaction Performance
4fef53fb-1b5d-4262-b097-1436650e85b4	2	I prefer the earlier version. This updated app crushes during login and says there is bug. Please fix the bug issue.	4	2024-05-03	POSITIVE	0.999313831	Account Access Issues, Bugs & Reliability
34a273e0-e131-497b-8d8d-0884c3c77aa6	2	Soo many bugs on this app I haven't been able to use it since I installed it very bad	1	2024-05-03	NEGATIVE	0.998149157	Bugs & Reliability
6d447e0e-e0a4-4588-a7f7-933707e4154d	2	My #1 choice	5	2024-05-03	POSITIVE	0.990750611	General Feedback
9ce4debf-b6f7-4c00-9dc0-0af0dca50184	2	This application isn't working properly	1	2024-05-03	NEGATIVE	0.999797404	General Feedback
1eb6ebec-e751-4571-9ed5-9852e14ca1fc	2	This is too poorer than the previous app.	1	2024-05-03	NEGATIVE	0.999718010	General Feedback
9adc359d-99de-4161-b0be-3424ce6da2f1	2	cool App Tnxes	5	2024-05-03	POSITIVE	0.999424458	General Feedback
fb543429-2845-474a-aab2-95e54028c607	2	The app keeps crashign again and again, i didn't even get to sign in. Worst update!!	1	2024-05-03	NEGATIVE	0.999801934	Feature Requests
07b87145-49d8-4394-bbf7-73e43dec9ac2	2	Developers/ the company takes too long to update the app, and throughout that process, the app is basically useless. We can't send money or even be able to check our account. They even take it down from the Play Store for a while. This whole process usually takes them 3 to 5 days. This is very disappointing. It is an improvement from the previous version of the app, but they still have a long way to go to compete with the likes of CBE. Transferring to other banks sometimes doesn't work.	2	2024-05-03	NEGATIVE	0.999796450	Bugs & Reliability, Feature Requests, Transaction Performance
a7249a34-f5f8-455e-8f33-7a1acc03ce90	2	Was working ok.but it started not displaying banks list to choose from, and it needs updating every couple of days, annoying	3	2024-05-03	NEUTRAL	0.999032378	Feature Requests
9a4768a8-faca-4f72-92cc-4194d7bce0e3	2	Dear BOA, Are you sure you are upgrading your application. It is becoming worse and worse. Please fix the bug as quickly as possible.	1	2024-05-03	NEGATIVE	0.999725044	Bugs & Reliability
5dc72722-3427-4521-9b83-387ee5a17991	2	Nice one thanks abisiniya	5	2024-05-03	POSITIVE	0.999838710	General Feedback
bb85e30f-03b1-480f-8895-dbbad4672753	2	it doesnt work it crashes	1	2024-05-03	NEGATIVE	0.985218108	Bugs & Reliability
f9b5767d-f81c-47dd-ab84-54e11c138e08	2	It keeps clashing down What a crass stupid app is this... You forced me to update after I transferred money and now I can't open it	1	2024-05-03	NEGATIVE	0.999738395	Feature Requests
dd17878a-6b55-4bb7-9896-74753abaebb4	2	Crash... glitch... crash... blame connection... crash... crash again. Please fix it	1	2024-05-02	NEGATIVE	0.999406457	Bugs & Reliability
eb3a8a93-a465-4992-899f-dbb1bc63fc58	2	So unreliable i had to send money asap but this app either laggs or doesn't work such a lazy work look at how efficient tele birr is and its not even a bank	1	2024-05-02	NEGATIVE	0.998845935	App Speed & Performance, Bugs & Reliability, Transaction Performance, User Interface & Experience
e50a418d-ed60-4b67-ad3b-260b80f8d343	2	Great app than others	5	2024-05-02	POSITIVE	0.999720156	General Feedback
c78f1ddc-5a45-4a99-b001-d1541be9fea4	2	OMG this is like the worst mobile banking app ever. I have many different mobile banking app from different banks but this is the worst so far. It says it has connection issue when I have wifi or data connection and while I'm using other social media apps. It keeps asking me for update once like every week and takes forever to load like I have to wait at least 10 minutes to login and another 10 min to see my balance.	1	2024-05-02	NEGATIVE	0.999766171	Account Access Issues, Bugs & Reliability, Feature Requests
cad446e3-e47d-4b8f-a47e-771cf8771aca	2	I think I remember it worked once upon time...	2	2024-05-02	NEGATIVE	0.945567846	General Feedback
1125c8c6-1f1b-40b7-8e6a-79fafa708e50	2	This app is going to the worest boa app ever😡 It crushes every time login.	1	2024-05-02	NEGATIVE	0.993037164	Account Access Issues
e5daf636-d711-4328-b386-56aa6cf5ecf8	2	The app never worked properly, specially on android 14, do better	1	2024-05-02	NEGATIVE	0.999797761	General Feedback
94e6efe7-5719-4f1f-ab6c-a21f12d1af75	2	Fix the bug.	1	2024-05-02	NEGATIVE	0.994498670	Bugs & Reliability
63308cb6-0ae2-4740-afd6-6ef45c6ec630	2	It keep making me out and crash when i open the app and not working properly	1	2024-05-02	NEGATIVE	0.998597801	Bugs & Reliability
c3c57420-55b1-4d02-956b-cbdc55b33e41	2	After last update, the app keeps crashing, not working. Pls fix it. Mobile transactions become impossible.	1	2024-05-02	NEGATIVE	0.999586523	Bugs & Reliability, Feature Requests, Transaction Performance
e2dc45d6-35a4-4ea3-a578-05b68a986969	2	Very bad app	2	2024-05-02	NEGATIVE	0.999776900	General Feedback
98205344-768d-4132-bc7a-3c86650c6db1	2	I don't know why every time you come up with a new update the app get worst than the oldest, it is taking more time to load, can load money to telebirr, can't pay awach. Please try to fix it.	1	2024-05-02	NEGATIVE	0.999572694	Bugs & Reliability, Feature Requests
94a84a35-5a75-460d-9f34-8ad411fcfdc5	2	The worest mobile banking app	1	2024-05-02	NEGATIVE	0.843271375	General Feedback
872b3daf-6c3e-43e9-a7cf-ba1199c25010	2	It was working good before the last update but after the update it asks to disable developer option. why is that? That means any developer with developer option enabled can't access his account. It crushs a lot of times.	2	2024-05-01	NEGATIVE	0.999320745	Account Access Issues, Feature Requests
03f0fe5d-707c-4c39-9ae8-ece08ca633f1	2	From Ethiopian Internet banking Abbisiniya Internet banking application is the most worst boring and slower app, please fix that	1	2024-05-01	NEGATIVE	0.999599993	Bugs & Reliability
c2fd1b46-bfd0-4f9d-84a0-823e74713dae	2	good App and user friendly.	4	2024-05-01	POSITIVE	0.999849200	User Interface & Experience
aa02275b-6f54-4618-ae63-b085334c35e7	2	Every time needs update & after that it's not working it's too boring	1	2024-05-01	NEGATIVE	0.930103481	Bugs & Reliability, Feature Requests
acb1b255-7efe-4573-8f3e-e0837092894a	2	Mnm beka ayeseram hule endaschegeregn	1	2024-05-01	NEGATIVE	0.947674155	General Feedback
c9655228-c461-424a-855b-b11ae1a8825b	2	What mean disable developer option?	5	2024-05-01	POSITIVE	0.999425411	Feature Requests
3a07b9bf-de50-41a0-a880-d8956c350036	2	Slow login, crashes frequently, annoying app ever. Since you updated this app, it's been extremely unhelpful.	1	2024-05-01	NEGATIVE	0.999590576	Account Access Issues, App Speed & Performance, Bugs & Reliability, Transaction Performance
4cba832b-be6a-42d3-94ff-8446fbcdf1b4	2	why do we need to turn off "developer options" in order to use your app, on the new update??? Are we suppose to not use our device for other purposes just so we can use your app? It is not security it is BS. (fix that and I will update my rating)	1	2024-05-01	NEGATIVE	0.998432577	Bugs & Reliability, Feature Requests, Security Concerns
d465f71e-39dc-4e94-bcbf-06310974347c	2	Annoying it doesn't work totally	1	2024-05-01	NEGATIVE	0.999814093	Bugs & Reliability
f794444c-f120-4790-8bde-9e7a36917a7f	2	The Worst application ever	1	2024-05-01	NEGATIVE	0.999783456	General Feedback
45788b86-8a47-4c62-8fd6-eae87cc7482f	2	The best beautiful app	5	2024-05-01	POSITIVE	0.999869823	General Feedback
f29e5f00-a934-4d73-9406-178808bedfef	2	Keeps crashing everytime what a disaster	1	2024-05-01	NEGATIVE	0.999397278	General Feedback
5f312717-15a3-4f3b-b09f-e80fb12fd5bb	2	It doesn't work anymore	1	2024-05-01	NEGATIVE	0.999621034	Bugs & Reliability
ac808508-e45d-425f-9fd9-49c6eecdb46f	2	The app is terrible, nothing functions properly. Especially since the latest update, it crashes all the time.	1	2024-05-01	NEGATIVE	0.999802768	Bugs & Reliability, Feature Requests
902acd07-730a-4eb7-a139-09ae29e7d800	2	It's good app but the system is not same as CBE bankin mobile When i compare To these apps BOA and CBE, CBE is the best up	1	2024-05-01	NEGATIVE	0.995747268	General Feedback
71de52ad-6768-4693-a021-6b95821d75fe	2	Please focus on the functionality of the app instead of spending money on the advertisements.	1	2024-05-01	NEGATIVE	0.745123148	General Feedback
b4b477f6-5c81-4d01-bff7-90499955e93e	2	Frequently crashing fix it please	1	2024-05-01	NEGATIVE	0.948821664	Bugs & Reliability
2e817e12-5e50-4f61-8d48-42a7abfc3379	2	95% of the time it crashes	1	2024-05-01	NEGATIVE	0.998165071	Bugs & Reliability
87b2c9de-fd0e-42d3-bdba-6ac621720d5b	2	The worst update ever You don't deserve one star;	1	2024-05-01	NEGATIVE	0.999785125	Feature Requests
a1d8f400-cdcd-4bae-8ea3-c18d55ac5967	2	No feature works correctly. Its always buffering and needs probably high data. So its useless 😏😏😏	2	2024-04-30	NEGATIVE	0.999791920	Bugs & Reliability, Feature Requests
5491d730-4219-44e7-804f-3089aa98f554	2	This app is trash, it's not working for the past 3-4 days. I've to go to the bank to send money to other banks. Plus the app keeps crashing since the last update. BOA as a bank is deteriorating! This has to change.	1	2024-04-30	NEGATIVE	0.999563873	Bugs & Reliability, Feature Requests, Transaction Performance
aabe78f9-ca3d-4512-a1bc-68ff67518b8d	2	App needs a lot of work. It continuously crashes and shuts down.	1	2024-04-30	NEGATIVE	0.999461710	Bugs & Reliability, Feature Requests
4df79fbe-9e1b-4639-bb70-55903cf78fa7	2	Not comfortable with this version. Its hard to down it load Developer option is not allowed to use it as usual.	5	2024-04-30	POSITIVE	0.999379277	Feature Requests
52ada943-791a-40f9-95b3-30f8919e1518	2	This app is so annoying as the previous version.	3	2024-04-30	NEUTRAL	0.999773800	General Feedback
9eb34710-ad23-4a4a-81d3-929689a4b1ea	2	Need many improvements	2	2024-04-30	NEGATIVE	0.834504366	General Feedback
045371d6-c181-4cc8-ba8f-389b9884b8c3	2	Great always great!!!	5	2024-04-30	POSITIVE	0.999884605	General Feedback
7408407d-e0b7-4a60-afcc-7408088fbe8c	2	አፑ ቆንጆ ነበር አማርኛ ቋንቋ ቢካተት ሌላው በአሁን ሰዓት ይኼን ስፅፍ እያስቸገረኝ ነው ሲስተሙ	5	2024-04-30	POSITIVE	0.952843368	General Feedback
2fd189ac-a04c-4c92-9029-9576cba36175	2	Such a junk application, its not working at all. Waste of time	1	2024-04-30	NEGATIVE	0.999818623	Bugs & Reliability
c10f6f0d-46bb-44fa-893b-c951985d5f00	2	Hello is this new update cuz it keeps kicking me out!!!!! can't make a transaction fr!	3	2024-04-30	NEUTRAL	0.998949230	Feature Requests, Transaction Performance
bdbcfd9c-7cf2-48d8-9ddc-ae048d9cf9ab	2	you guys keep on releasing unstable app, now it won't login	2	2024-04-30	NEGATIVE	0.984228373	Account Access Issues
68104af7-50d8-4340-b657-d94b6b993573	2	I never ever seen the worst commercial app like this in my life , it does not work anything , i donot know how the IT Team of the bank tested and launch the app. Its annoying !	1	2024-04-30	NEGATIVE	0.999784529	Bugs & Reliability
f5d98801-653a-42db-b567-7ec99f5f76cb	2	The best bank with the worst application and ussd service.	1	2024-04-30	NEGATIVE	0.998409748	General Feedback
cd8d39d0-d8d5-438d-9d87-904ca2c98410	2	The old version is best. This one is so lagging and it's not fast to quick transfer	1	2024-04-30	NEGATIVE	0.897389054	Transaction Performance
78e8871b-9992-401f-a928-98f5bfd7bb16	2	The latest update has a bug it keeps crashing. Please fix it it's so inconvenient to do our business this way. That or we will switch to other banks	3	2024-04-30	NEUTRAL	0.999640703	Bugs & Reliability, Feature Requests
4f276dcb-92ca-4980-973f-a44a3d29e357	2	Amaizing Bank in Etthiopia	5	2024-04-30	POSITIVE	0.592347205	General Feedback
4097be8a-f2a5-4344-b7a2-32eae1930178	2	Good banking app	4	2024-04-29	POSITIVE	0.999841571	General Feedback
a0ffc2f3-5b01-4f69-b9fa-ebca3e358bce	2	It doesn't function properly!! You don't even deserve one star.. please stop playing your dirty game on your customer...	1	2024-04-29	NEGATIVE	0.999798477	General Feedback
a30d6136-ddf5-4633-b3b2-e089233b135b	2	That's a fantastic app! L	2	2024-04-29	NEGATIVE	0.999869466	General Feedback
4f9ed842-9adf-4ef1-93f0-ce5135cd43de	2	The best bank	5	2024-04-29	POSITIVE	0.999857306	General Feedback
91aacf0f-e666-4add-b7ca-4f952bb86899	2	This app has been found useless while I compared with the first version of IB12111...that was very good, you guys what is the matter with you. You are far from the technology and the competetor's digital product through convenience, reliable, easeness _-dashen, cbe, zemen... they are doing well! share their experience and be able to satisfy your esteemed customers including me. unless you will be down soon!	1	2024-04-29	NEGATIVE	0.992356420	Bugs & Reliability
34325ef3-c582-4f8b-b625-dbb0a4741af4	2	This new update really sucks.. Can't even get the chance to put my pin, bugs and everything,please fix it developer	1	2024-04-29	NEGATIVE	0.999725759	Bugs & Reliability, Feature Requests
9bea3d20-802f-4e35-8a86-ff0918d7ad9f	2	I have never seen the worst mobile app like this	5	2024-04-29	POSITIVE	0.999569356	General Feedback
eae27608-c2d3-4acc-93ac-c5f14b993730	2	Very very good app	5	2024-04-29	POSITIVE	0.999872804	General Feedback
adb11a9b-439b-4e8e-93ab-c1a54224c023	2	it keeps crashing	1	2024-04-29	NEGATIVE	0.920182467	General Feedback
97962b52-3681-4d3a-a061-62e0e4f13ba2	2	This app isn't working well on Tecno phone 📱. what is the error??	1	2024-04-29	NEGATIVE	0.999742329	Bugs & Reliability
3bba5202-3fe3-473b-a3d0-8fb851e669ff	2	With every update the app keeps on getting worse,it is filled with bugs	1	2024-04-29	NEGATIVE	0.999780715	Bugs & Reliability, Feature Requests
066e2fbb-0920-481a-80dd-6501275e15f5	2	Not working properly why?????????	1	2024-04-29	NEGATIVE	0.999762237	Bugs & Reliability
0d777606-9d9a-4baf-91be-b21bfb65fa47	2	The update app is the worest one when i compare with past.	1	2024-04-28	NEGATIVE	0.991779387	Feature Requests
c34becbb-d067-410c-aaf9-cec4a6c87c3c	2	It's nice, the stack thing needs update thou	5	2024-04-28	POSITIVE	0.957143962	Feature Requests
54b35b06-8d9f-426d-b60e-8ca7759b37f3	2	This application is relatively good even if some times interpreted.But apolo is difficult application please improve it.	5	2024-04-28	POSITIVE	0.991371512	User Interface & Experience
22099d9b-0b99-4bbc-90bf-ff60acab4e5c	2	The app is not properly working.	3	2024-04-28	NEUTRAL	0.999790370	General Feedback
3e2451bc-4507-498e-b0d2-66d211889072	2	It is always crushing it loged me out all the time	1	2024-04-28	NEGATIVE	0.991296291	General Feedback
cb36493e-3bbd-476c-82a6-88278d2ea490	2	I love boa but the mobile app isn't as good as the older version when the app gets update it gets worse and worse it doesn't even work..fix the issue with that	2	2024-04-28	NEGATIVE	0.999693155	Bugs & Reliability, Feature Requests
15744558-21d7-45fc-9350-705a7961b96e	2	Why Why Why???? it is difficult to make transactions, it takes alot of time to make payments, i thought the update will make it work, but it got worse. please fix it	1	2024-04-28	NEGATIVE	0.999557316	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
a002edef-8a3d-4867-a706-9f538a0674ed	2	the worst app I have ever used, I could've given 5 star if it worked properly even just for logging in and check my accounts. seemed that's impossible	1	2024-04-28	NEGATIVE	0.999793589	General Feedback
67d24140-071f-4876-8eff-bf14116465c2	2	sometime it is not working wel	4	2024-04-27	POSITIVE	0.999658704	Bugs & Reliability
1cf6b86a-b7ee-4e95-8309-984b68a7e0ad	2	Very helpfull app	5	2024-04-27	POSITIVE	0.998947680	General Feedback
d54d6e7a-8acd-45c3-a479-8b7fcc4ce671	2	Very slow response , try to some updates in the application	1	2024-04-27	NEGATIVE	0.999632478	App Speed & Performance, Customer Support, Feature Requests, Transaction Performance
0d298d90-e15e-46e4-96af-20741b8d45ed	2	useless app. bank to bank transactions do not work at all, wallet topups like telebirr take hours to reach. what a shame from a bank this big.	1	2024-04-26	NEGATIVE	0.999806583	Bugs & Reliability, Transaction Performance
95bb8154-b130-4a8c-868d-17aca7aead64	2	Really work very good app l like you BoA	5	2024-04-26	POSITIVE	0.999805868	Bugs & Reliability
c5a32f5e-41c5-490e-91d5-d94884d6aa3b	2	Very old app is disgusting	1	2024-04-25	NEGATIVE	0.999628186	General Feedback
24c412a3-4a40-41fd-acc3-5e8590b4e11b	2	The worst App I have ever seen.	1	2024-04-25	NEGATIVE	0.999791801	General Feedback
30d3f026-6e12-4489-b166-79a8bf9ed9b7	2	I tried it with different phones, it only worked for about a week and then it stopped working. It needs some serious work.	1	2024-04-25	NEGATIVE	0.999510765	Bugs & Reliability, Feature Requests
8707cb4a-9436-4fde-83e5-e08f2a36e035	2	The onky defect is that it is too slow	3	2024-04-25	NEUTRAL	0.999661565	App Speed & Performance, Transaction Performance
4f204bc2-3713-4db3-81a5-dca33fa239b5	2	Sorry to say it is very poor apps I have decided to suspend the BoA account	1	2024-04-25	NEGATIVE	0.999790847	General Feedback
2a81adc8-d244-4af5-b5fe-5f1d6539593c	2	Boa is the best app but Please Clear Instant or Not instant option of send money be for Asked !!!	5	2024-04-24	POSITIVE	0.880310953	Feature Requests, Transaction Performance
7fd70a5c-3336-4c74-b321-622b29e5d371	2	Installed the latest version of this app on my Android 14 device, but it is not working. I have already received the activation key from your branch (via SMS), but couldn't activate it. It is a failed app. I bet you don't have QA testers.	1	2024-04-24	NEGATIVE	0.999738276	Bugs & Reliability, Transaction Performance
3c7477cb-cd09-40b0-828e-9086cba2e596	2	This is not functional at all, it takes forever to make a transaction,please improve it.	1	2024-04-24	NEGATIVE	0.999654531	Transaction Performance
45dd47e8-7308-43f4-85b0-76c8cdd9a4ad	2	I can't update the enable button not open.	1	2024-04-24	NEGATIVE	0.998974323	Feature Requests
d20381f3-dc64-4b48-a98e-5434843b19c5	2	The Bank I always love 😘 and work with them is priceless	5	2024-04-24	POSITIVE	0.999791682	Bugs & Reliability
8a9356ef-09c6-4c47-9daf-dc0991171796	2	It's the best	5	2024-04-24	POSITIVE	0.999854088	General Feedback
e9336bcf-b836-4e42-9d5a-f5999513effa	2	BOA app was one of my favourite back in the days, now I don't if there is an app worsen that this.. very very bad. You need to fix it or remove it.	1	2024-04-24	NEGATIVE	0.999764502	Bugs & Reliability
7c22bdc5-8d1b-4afc-ae5f-2f886a61dd68	2	This app is very wonderful	5	2024-04-24	POSITIVE	0.999883771	General Feedback
9fd2427f-13c9-4771-88e0-bbd4038faec6	2	It is not working at all.	1	2024-04-24	NEGATIVE	0.999782145	Bugs & Reliability
d587332b-4722-427d-aa23-47df325f4f55	2	I've never seen a very worst mobile banking system like this, i lost 37000 birr because of your delay transaction system, i called 8397 and they told me stay for confirmation but, after i changed my mind and waiting for confirmation call to cancel the process they sent it with out my approval, so please don't use the mobile banking system please	1	2024-04-23	NEGATIVE	0.999559462	Transaction Performance
b71cff61-9c89-4dbd-906c-9e430788ffbf	2	In Ethiopia pest Bank	5	2024-04-23	POSITIVE	0.994962931	General Feedback
9b5b9e46-ad43-4331-b612-85d2f5c74935	2	It is not working	1	2024-04-23	NEGATIVE	0.999772131	Bugs & Reliability
2166d4dd-f6d7-4536-9e86-6a5534ffd3c9	2	እጅግ በጣም ጥሩ ነው ።	5	2024-04-23	POSITIVE	0.883213103	General Feedback
7df9c4ae-8892-42c6-bd56-42308119c67f	2	Only problem is often it has connectivity issues.	5	2024-04-23	POSITIVE	0.995984316	Bugs & Reliability
1250c1d5-3316-467b-9c87-d2985dde8866	2	Not bad but please make it lite pls	1	2024-04-23	NEGATIVE	0.999080539	General Feedback
12db3782-541a-4c67-bec1-74bfe38c33f9	2	It says "Something is wrong with your internet banking user, go to your nearest branch" It hasn't been working since April 13.	1	2024-04-22	NEGATIVE	0.999419093	General Feedback
bdb8f64c-bd27-4a33-b37e-6fdcffca58f2	2	በጣም ምርጥ አኘ ነው ቶሎ ይበላሻል	3	2024-04-22	NEUTRAL	0.904695213	General Feedback
d20393e4-09e9-47a9-be92-611ce6c919a6	2	I like this bank by his activity and respect castemers i look like my house	5	2024-04-22	POSITIVE	0.999461114	User Interface & Experience
b7c747f2-a301-48d2-976c-a6f71362e762	2	Bank Of Abyssina	5	2024-04-22	POSITIVE	0.995873630	General Feedback
e558363c-9cf0-4823-b2f3-57fba683a672	2	very fast also nice app i love it	5	2024-04-22	POSITIVE	0.999873400	Transaction Performance
c764a7ee-98a3-4160-9d66-c624520db88b	2	በጣም አስቸጋሪ እና አዳጋች የሆነ አሠራር ነው የሚጠቀመው ግብይት መፈፀም ክፍያው ተቆርጦ ሎክ አካውንት በማለት ያስቀምጣል በሌላ አማራጭ ከከፈሉ በኃላ ተመላሽ እንኳን አያደርግም	1	2024-04-22	NEGATIVE	0.961516321	General Feedback
b12b3e39-f4c6-48bf-86bd-e50202d37452	2	By far the nicest looking app by an Ethiopian Bank. But it's functionality is weak. It is full of Transaction error, Function Error. Kudos, but it needs more backend work.	2	2024-04-22	NEGATIVE	0.999361575	Bugs & Reliability, Feature Requests, Transaction Performance
1c136806-0ba1-4fcb-9ad8-f0f92a596867	2	Not reliable always with some issues	1	2024-04-22	NEGATIVE	0.999591172	Bugs & Reliability
cf142536-5be5-4353-b2e2-359e4b4622ae	2	So BoA, your last application was horrible and buggy. And we thought "finally!! a functional new app with better UI." But It didn't last long, a non existent connection error at login.... Please just fix your app to the simplest functional form and it would be up to your other service standards.	1	2024-04-21	NEGATIVE	0.996240973	Account Access Issues, Bugs & Reliability, User Interface & Experience
0eee74b6-043c-4004-9db6-1f923ecfa564	2	It has good backgroud and simple. But keeps saying no conectivty , login, Close immediately you made it porly not woriking on stable network!!!	1	2024-04-21	NEGATIVE	0.993846834	Account Access Issues, Bugs & Reliability, User Interface & Experience
0064eed9-e5be-4a49-a552-8ad9189579b3	2	It was working fine a couple of days ago, in the utilities section of payment it only provides a few services but that is OK for now but my issue is it has started crashing down these past 2 days	2	2024-04-21	NEGATIVE	0.999379396	Bugs & Reliability, Transaction Performance
40014049-7d72-48ea-90ef-70522c49ca5b	2	This app is awesome, I like the features	5	2024-04-21	POSITIVE	0.999875307	Feature Requests
aaa1abe6-69f5-4150-9072-0b456c58efb8	2	The app is a total waste of time, it glitches, doesn't log in fast, super slow.	1	2024-04-21	NEGATIVE	0.999618649	App Speed & Performance, Bugs & Reliability, Transaction Performance
58aa8781-583c-48f3-a8f5-0830948e334e	2	Very very bad app	1	2024-04-21	NEGATIVE	0.999795973	General Feedback
287a4512-6779-4d7b-ab55-fb237935980b	2	Not work this app ...what is the problem	1	2024-04-20	NEGATIVE	0.999769509	Bugs & Reliability
60c1c945-fc5c-4773-90ef-9be586aba2ce	2	the new updated app exception handling for connection fluctuations is so exhausting which lead users to login repeated times.	1	2024-04-20	NEGATIVE	0.999728501	Account Access Issues
e53757cc-cdb3-4bfa-bd4f-daa65ce976c1	2	Some problem this app,	1	2024-04-20	NEGATIVE	0.998966098	Bugs & Reliability
1e6bf71b-9229-4f39-a910-f1dd68ce5e33	2	It keeps on crashing	1	2024-04-20	NEGATIVE	0.519233584	General Feedback
e77d5a08-ede0-4425-b8aa-7e0b27dd07ba	2	Hey no working	5	2024-04-19	POSITIVE	0.996323705	General Feedback
814106ac-2d4b-409a-b367-f8686985ee7c	2	It's good app tnx for u new update it's very easy to using this app they add some future tnx Abyssinia bank	5	2024-04-18	POSITIVE	0.996093214	Feature Requests, User Interface & Experience
4266eaeb-37b0-4cc4-8b8a-2929e01e4f2f	2	A lot of the app's features have been rearranged but sometimes it works sometimes it doesnt...and that makes it less reliable specially at times of need...pls improve it	2	2024-04-18	NEGATIVE	0.999132812	Bugs & Reliability, Feature Requests
8bf6d9f8-4873-49e7-acd9-307d56f9a5c4	2	Now am confused upgrade or downgrade 🤔	1	2024-04-17	NEGATIVE	0.997997820	General Feedback
deabfb4e-0a4b-403a-9bd8-9e8e3d347e53	2	wow good job BOA	5	2024-04-16	POSITIVE	0.999818146	General Feedback
d3fcf9de-f39e-4b3f-8444-85a190dc8919	2	Vary good app	5	2024-04-15	POSITIVE	0.999814689	General Feedback
daec843b-9c90-4779-9aa3-630128589864	2	Can you please just make it functional. I don't think anyone cares how good it looks if not a single functionality works. Plus it's not even aestheticaly nice. The loading animated icon has white irregular edges because the logo wasn't cut out correctly. The app doesn't work at all. It doesn't even login. It gets stuck on login just showing the logo animation and blames the issue on connectivity. Connectivity is fine and the proof is that this review is posted.	1	2024-04-15	NEGATIVE	0.778335929	Account Access Issues, App Speed & Performance, Bugs & Reliability, Transaction Performance, User Interface & Experience
0a2350d5-b154-4c3f-bd22-587b3d468769	2	add receipt pdf like telebirr	5	2024-04-14	POSITIVE	0.977520168	Feature Requests
b8f8ce61-06de-4839-841c-6f0b8b58159c	2	በጣም ቀለል ያለ እና ምቹ ና አስተማማኝ ነው እርሶም ይጠቀሙበት !!!	1	2024-04-14	NEGATIVE	0.978702188	General Feedback
bd509db9-9cea-4b04-8776-6aaad5914a84	2	The app is not showing my balance or any transaction it is like corrupted showing usd amounts	1	2024-04-13	NEGATIVE	0.999426007	Transaction Performance
be61c9a0-ec42-4cc6-aea6-4fe621e17422	2	it's so slow app please fix it	2	2024-04-13	NEGATIVE	0.999497771	App Speed & Performance, Bugs & Reliability, Transaction Performance
ff073d6c-d03d-4de7-a14b-6cb65ca6479e	2	It crash always	4	2024-04-13	POSITIVE	0.999178827	Bugs & Reliability
516c40dc-9a1e-4bd8-9c73-78272f1f5852	2	The most terrible mobel banking app in the world it is not working ones in a week	1	2024-04-13	NEGATIVE	0.998347998	Bugs & Reliability
563a42d4-d018-4147-a6d9-a62d36a30772	2	Ultimately, the worst mobile banking experience ever left me feeling exasperated and disillusioned.Its a nightmare	1	2024-04-13	NEGATIVE	0.999817193	General Feedback
8bbe29d8-ec75-4ffb-9b2d-fe22c62b1182	2	The updated version of this app is just time wasting. It doesn't work with 2G/3G network.require log in frequently,not fast as much as possible.automatic log out are the bad features of this app	1	2024-04-13	NEGATIVE	0.999743521	Bugs & Reliability, Feature Requests, Transaction Performance
d8fb41a7-5041-4fd1-ac46-cbc37fc46366	2	Why u do that hh	2	2024-04-13	NEGATIVE	0.996059537	General Feedback
e8399bdc-02ee-41d2-8cbb-b1254b842521	2	Abissiniya bank one of the best for giving the future	5	2024-04-12	POSITIVE	0.999803841	General Feedback
71a6f4cf-221a-4aa3-94c3-030aaa61e644	2	This the best mobile banking App BOA mobile banking included all digital banking features and we can access the most companies and sectors with this App. Thanks for giving this services Keep going .	5	2024-04-12	POSITIVE	0.999683261	Account Access Issues, Feature Requests
93f8ce6e-057d-408e-9856-17dd32defbf9	2	This has to be your worst app ever, damm so many bugs and it lags so baddd. Please fix it	1	2024-04-12	NEGATIVE	0.999804080	App Speed & Performance, Bugs & Reliability
1cb67da1-9919-4e19-a07e-2b19e0c5db96	2	Simplify your life by using the Abyssinia app I like it because it is comfortable and safe	5	2024-04-11	POSITIVE	0.999639153	Security Concerns
1ed3134f-975c-4d09-a10c-39430b788de5	2	General, when I considered from other banks, this bank is unique	4	2024-04-11	POSITIVE	0.999671340	General Feedback
ae859e51-2777-443c-a179-539ef541a16b	2	Boa ... The best	5	2024-04-09	POSITIVE	0.999870896	General Feedback
d67ef9a3-b937-48e3-8f65-613348352fbf	2	wow its so attractive	5	2024-04-09	POSITIVE	0.999867678	General Feedback
ea741c0d-6661-46f0-98b1-bcb8e5e95459	2	Yet another useless app	1	2024-04-09	NEGATIVE	0.999792635	General Feedback
e2673e43-b3dc-4964-8e33-93884b595675	2	Keep it up 1ygna bank	5	2024-04-09	POSITIVE	0.998923957	General Feedback
274344c5-ed35-442c-b721-645243fceb5f	2	It closes playing audio app when it is opened . What is the solution?	5	2024-04-06	POSITIVE	0.994924903	General Feedback
4d7d0be8-49b8-4ee8-9ce8-5058080ca462	2	OTP should be inserted manually. not working on my phone	2	2024-04-02	NEGATIVE	0.999447405	Account Access Issues, Bugs & Reliability
03de13ad-33e7-43da-8851-d34985274ab4	2	my device is not auto inserting The OTP, So keyboard should be enabled on the apps OTP login to insert OTP Manually.	3	2024-04-02	NEUTRAL	0.996073604	Account Access Issues
cf11972a-8e08-4ecd-883c-1cfde1376066	2	Worse mobile banking ever 👎👎	1	2024-03-29	NEGATIVE	0.999760568	General Feedback
b4702798-0eb2-488a-817b-295ba878435a	2	What's wrong with app suddenly stoped to open?	1	2024-03-25	NEGATIVE	0.998789370	General Feedback
9f294b45-c788-4b0b-8e0b-716dd47b5ff1	2	Just use other banks if you want a good mobile app. CBE is 40X faster and safe than this app.	1	2024-03-23	NEGATIVE	0.718928099	Security Concerns
881841d6-eb17-46a9-9975-60090151aa37	2	Worst app ever previous version was way better than this version after I activated my mobile banking app it says account not found but I'm their system my IB customer does work fine please fix your bugs and test it before you release it I have visit and report many branches and head quarter but they can't fix the problem	1	2024-03-23	NEGATIVE	0.995432496	Bugs & Reliability
1d01bb8d-f36b-43ca-8cb6-5c818b6358f1	2	Wow! Thanks BoA	5	2024-03-22	POSITIVE	0.999801934	General Feedback
dfbe9aad-91a9-4bc9-8aac-1ecf644d89bc	2	The app doesnot allow to transfer from foreign currency accounts to local currency accounts , it says transaction not allowed , please check it and also it is difficult to activate the app from abroad countries since the otp doesn't reach by sms and it uses email, it doesn't allow manual otp input and the email hardly received , please review your app and make an update !!!	2	2024-03-22	NEGATIVE	0.998469770	Account Access Issues, Feature Requests, Transaction Performance, User Interface & Experience
e4f460a1-24e4-48c8-8a36-477f91417816	2	I have nothing against your service but your App!!!!??? When will it ever work? Why do you keep changing the interface whenever there is an update? The most unreadable annoying app.	1	2024-03-22	NEGATIVE	0.999549091	Bugs & Reliability, Feature Requests, User Interface & Experience
b3b60a0b-92ff-4c64-98f7-83f6e2a6ec70	2	When writing amounts z app cannot insert deceimasl so that one cannot transact amounts involving cents !!! A finnacial app to be released without this feature being checked !!!	3	2024-03-20	NEUTRAL	0.870290101	Feature Requests
6a4d9508-8cf0-4a96-9287-ec9961430f44	2	BOA mobile the best App	5	2024-03-20	POSITIVE	0.999717176	General Feedback
2a694e53-fdeb-4880-b4db-e3d52971f932	2	worst banking app i have ever used. Try to modify it	2	2024-03-19	NEGATIVE	0.999792039	General Feedback
bb41fa2e-2552-494f-a3dd-81da22ebba6c	2	The application is extremely slow.	1	2024-03-16	NEGATIVE	0.999792993	App Speed & Performance, Transaction Performance
fd0910c4-1fae-48fc-96f7-25718e85b3e0	2	I couldn't transfer because of bug's its annoying for a bank app nots acceptable	1	2024-03-15	NEGATIVE	0.999514103	Bugs & Reliability, Transaction Performance
1c4b07f2-e2ce-4531-8d1b-04dd4c2f2351	2	It was a very nice app and was exemplary to other banks, but I am experiencing difficulties in transfering transactions and thinking to leave Abyssinia? What would you advise me. ወጣ ወጣና ሆነእኮ ነገሩ።	5	2024-03-14	POSITIVE	0.991816580	Transaction Performance
0c4e114b-7e89-4b31-beef-f5058c4df092	2	This app is a good app	5	2024-03-14	POSITIVE	0.999851227	General Feedback
115cf06b-885b-44ef-ad13-5f713289e528	2	It's good Rate app	5	2024-03-12	POSITIVE	0.999831319	General Feedback
f855dd9e-3276-46ef-b9ee-22fd47e91e7a	2	Always there a problem with this app it says check your connection while connected 😞	1	2024-03-09	NEGATIVE	0.998983443	Bugs & Reliability
884b7c1c-fb63-4522-ba00-58fcb79902ac	2	It's not fast to use	3	2024-03-08	NEUTRAL	0.972084522	Transaction Performance
8e591a54-f305-4788-a38b-56b2293a2b77	2	The worst mobile banking app like the previous one. How long it would take for BOA to develop a good app?????? Years or decades?	1	2024-03-04	NEGATIVE	0.999807298	General Feedback
4168ab29-8b6c-4b99-ad76-1b805f5085ce	2	Was good at first but now i couldn't reach my apollo account in the mobile banking app	1	2024-03-03	NEGATIVE	0.998384714	General Feedback
ffe4b898-4efa-4a93-bf70-dd405f3edde4	2	I don't know why they roll out new updates without making sure it works! Why???? Do they need to update to a new staff? Perhaps pay for a better network?? Mindenew? I don't know there always a problem with this app.	1	2024-03-02	NEGATIVE	0.999531150	Bugs & Reliability, Feature Requests
a8ba8c98-cc62-44fe-bad9-696bd889855c	2	Best version of boa apps	1	2024-03-02	NEGATIVE	0.999344528	General Feedback
d02b75ee-2f90-4c29-a169-b21045b50827	2	Its amazing and easy to use , but from these two past days it crashes and tells me "there is not enough connectivity" while my internet was good enough , and i can't open it anymore !! Fix this proplem ASAP.	5	2024-03-02	POSITIVE	0.999505401	Bugs & Reliability, User Interface & Experience
e1cf5832-e81e-4e28-80f5-cbb7173dc54b	2	After the recent update the application keeps crashing when I tried to open. Please fix.	1	2024-03-01	NEGATIVE	0.997364819	Bugs & Reliability, Feature Requests
d3b5715a-06dc-4fcd-9d60-09ce43b82375	2	The worse app I have ever seen.	1	2024-03-01	NEGATIVE	0.999780238	General Feedback
1b03a46f-988f-47e6-af06-283aad33e914	2	An excellent app.	5	2024-03-01	POSITIVE	0.999860287	General Feedback
6aba852c-18d6-4a41-a154-74c6184959ad	2	The worst mobile banking app ever!!! I have tried to transfer 25,000 from my BOA account to my CBE and it still hasn't reached my CBE account yet. When I tried contacting customer support they just tell me it's a problem with the system. I have waited 48 hours and I still haven't received my money. Bank of Abyssinia the worst bank and system, I don't recommend this app or bank to anyone.	1	2024-03-01	NEGATIVE	0.999778569	Bugs & Reliability, Customer Support, Transaction Performance
a09ed6dd-5702-421a-a228-245176a00b0d	2	i like this app	5	2024-02-29	POSITIVE	0.999651670	General Feedback
7313638c-9cf3-4059-a8f8-9876ef72fe46	2	More interactive and easy to use mobile app👌	5	2024-02-29	POSITIVE	0.997719586	User Interface & Experience
5bdfc502-8a6a-49e3-a6be-68939e9dd44b	2	Thank you for wasting my time Abyssinia.	1	2024-02-26	NEGATIVE	0.957065701	General Feedback
4c435948-feb8-4692-9f0d-3f864a03abbb	2	Overrated service and recently glitching service system not being able to withdraw funds.	1	2024-02-26	NEGATIVE	0.988934815	General Feedback
c82b872b-22fe-4419-a039-ff981cd2a2eb	2	User friendly at it's best with the best security option.	5	2024-02-24	POSITIVE	0.998851061	Feature Requests, Security Concerns, User Interface & Experience
1fcdba36-6e83-434b-8676-66304e004a60	2	It's a quiet good and smoothly accessible app which allows users to transfer , Airtime Top-up, ATM withdrawal and Utilities payments.	5	2024-02-24	POSITIVE	0.999743760	Transaction Performance
66fafa2a-e28c-44d1-a7ce-dec09bb3c929	2	This app is not efficient and can't be used for people outside Ethiopia. I am not able to enter back my OTP code into the App screen as it gets frozen and nothing can be done. Also the login screen forces to enter a local cell phone in Ethiopia and a PIN number. Those of us who live abroad are left out. The previous application with BoA Authenitcater was working efficiently and I was also able to login using my LapTop. I recommend the Application to use login user name & email instead of Ph#.	1	2024-02-23	NEGATIVE	0.993616700	Account Access Issues, App Speed & Performance
43589a36-e57e-4af7-b61a-3a38d7125587	2	Worst application I ever used	1	2024-02-23	NEGATIVE	0.999787509	General Feedback
f87c9a6f-21e5-44e7-843e-09e97571be0f	2	Wow bank of Abyssinia great job I really like the updated version of Mobile banking specially it allows me to transfer 500000 birr	5	2024-02-23	POSITIVE	0.998595893	Transaction Performance
43551474-c422-4f7c-8dbf-372fb417a4b9	2	It is easy to use and very fast app	5	2024-02-23	POSITIVE	0.999560654	Transaction Performance, User Interface & Experience
209eed3b-53b3-495a-a8cb-02105695ad3d	2	It is better than before and i like it	5	2024-02-22	POSITIVE	0.999854207	General Feedback
e12330e8-0411-444a-90bb-474d8f39f22e	2	It good app	4	2024-02-22	POSITIVE	0.999863267	General Feedback
9b6c0d23-6808-41b9-aa4c-f2c621ce84d2	2	Abyssinian mobile banking the latest one	5	2024-02-22	POSITIVE	0.890664339	General Feedback
f9a519e3-62d8-4821-b055-0394689b74c1	2	The receipt download option is very convenient.	5	2024-02-22	POSITIVE	0.917429388	Feature Requests
d466304b-a933-47cd-b217-92a6a7deff41	2	I used to access my Apollo account through the app before the update but now i can't access my Apollo account through this app and for me this is a step taken backwards!!!!!	3	2024-02-22	NEUTRAL	0.999059737	Account Access Issues, Feature Requests
8c46cbaa-5512-405c-b03f-db69d3c520d2	2	Welcome BoA mobile	5	2024-02-21	POSITIVE	0.999670148	General Feedback
83270146-a02f-4b96-a30e-f056b6b2acc5	2	It is very bad app. not friendly usable. needs extremely strong network. Can't be updated easily.	1	2024-02-21	NEGATIVE	0.999774277	Feature Requests
d38d6dc0-e707-45a4-a932-0b9bf5df67aa	2	Definitly better than the privious version but this one crashes frequently and needed to put to sleep on andrioid version 9	2	2024-02-20	NEGATIVE	0.999393940	Bugs & Reliability
27614b2a-f8e3-48d6-8cb2-9a83c03e36a3	2	Its nice platform when i compare with the previous version! But, when i try to use mobile banking the app states use the updated one! As it orders, i updated BOA from playstore, when i try to use mobile banking on the following day the same thing-update from the playstore!!!!	5	2024-02-20	POSITIVE	0.996588230	Feature Requests
fac41d20-e24e-4451-bf38-58976f6db529	2	Very Fast And attractive App	5	2024-02-20	POSITIVE	0.999848247	Transaction Performance
c1af4031-d14a-4239-b63f-a133902ad0f9	2	It's good app	5	2024-02-20	POSITIVE	0.999868989	General Feedback
e7d9dbf1-9ba4-4164-b56e-9e2e3fbc251d	2	The app got a better features and easy to use.	5	2024-02-20	POSITIVE	0.630258381	Feature Requests, User Interface & Experience
b7b29dd7-9084-40ea-b0b2-0ba7bfc0a95a	2	Thes is nise app	5	2024-02-19	POSITIVE	0.955730617	General Feedback
e8fa4e7f-9f68-4723-8f70-5ee63ac4ba86	2	I have a great experience using this App	5	2024-02-19	POSITIVE	0.999530554	General Feedback
832b99c0-0dd5-46ce-9c81-fa0b789e31cd	2	Best app but after the update the screenshot not working	4	2024-02-19	POSITIVE	0.998665094	Bugs & Reliability, Feature Requests
248376cc-09ca-4121-92f9-f1502ecf7de2	2	It was good and more secured mb app but this new version apk i can't find it on play store will you tell me what i have too do ...please	5	2024-02-19	POSITIVE	0.996130705	Feature Requests
c2cdcdf2-ceef-4f81-bcdb-bf5cd0b166da	2	The best bank!!!	5	2024-02-02	POSITIVE	0.999873400	General Feedback
ec7606a9-f681-4662-89b9-7b253d145629	2	I have a fitayah account, a type of interest free account, and because their system is unable to process anything for people like me I can't see any of my accounts in the account list on any transaction, although I can see it when performing security actions or checking my balance, as such this app is as useless to me as the previous one. Unbelievable	1	2024-02-18	NEGATIVE	0.999789059	Account Access Issues, Security Concerns, Transaction Performance
ed3c77f9-6fd1-4106-8729-bc6319e151f9	2	ግሞች ደህና የነበረውን አግማሙት ኤጭ	1	2024-02-18	NEGATIVE	0.883213103	General Feedback
a27bf9b8-3448-4c95-ab34-51aa1609794a	2	በጣም የሞተና የወረደ አፕ ነው	1	2024-02-17	NEGATIVE	0.883213103	General Feedback
0604040d-6b19-435e-a24c-ad1a55262100	2	Noting! Mnm ayseram	1	2024-02-17	NEGATIVE	0.946794629	General Feedback
2a93c937-639a-4c27-924d-fab5056d31a5	2	It doesn't work	1	2024-02-17	NEGATIVE	0.999781311	Bugs & Reliability
a492c617-efd4-469f-8854-169233ae09c0	2	It doesnt send birr immediately to anything	1	2024-02-17	NEGATIVE	0.989359021	Transaction Performance
e8e30cda-3c44-4a11-93cb-89f93fcc4e95	2	So this updated version is so much better and faster but it doesn't open unless it's directly opened from play store. fix this issue I'd give it 5 if it wasn't for this	3	2024-02-16	NEUTRAL	0.998803973	Bugs & Reliability
389d32d7-fbe5-4789-b687-20dbc48cd905	2	Horrible, your apps are getting worse and worse	1	2024-02-16	NEGATIVE	0.999775350	General Feedback
14339503-d7a7-475c-bd75-f4240eee990c	2	This is terrible app. What the hell is your problem. Passwords can't be entered manually. I'm abroad. I don't have my Ethiopian Sim. I'm receiving the activation code via telegram. But you locked the system not to accept the activation OTP manually. Hence, I can't see my accounts, I can't make transactions etc.... how can you not think of this in advance.... now I'm in a terrible situation. I can't know what is going on with my account. WOULD YOU FIX IT NOW.... NOT TOMORROW or THE DAY AFTER...	1	2024-02-16	NEGATIVE	0.999373615	Account Access Issues, Bugs & Reliability, Transaction Performance
1832f231-343f-479a-b07c-a40643665181	2	I can't use it anymore	3	2024-02-16	NEUTRAL	0.998528242	General Feedback
35f75c34-2ac6-4e26-9411-0b9d47eafcf5	2	update ካረኩት ቡሃላ screenshot አላስቀምጥም ብሏል። ግን screenshot ማንሳት ጀምሯል	4	2024-02-15	POSITIVE	0.944715321	Feature Requests
fed38ae4-068f-426e-83ec-1a7dbfc18e52	2	Very good app its easy to use	5	2024-02-15	POSITIVE	0.999756038	User Interface & Experience
8ae826b2-9de1-4f00-8cb2-1853fe361329	2	Its very slow and fail to load any transaction	2	2024-02-15	NEGATIVE	0.999752939	App Speed & Performance, Transaction Performance
821887b9-da34-47e7-9eab-d9559813d40e	2	Great graphics, but why my music have to stop when I open this app? Make it make sense. But overall, it's good, but also needs too much data just to load this app. We might need a lite version of this.	3	2024-02-15	NEUTRAL	0.996784568	Feature Requests
bc300d34-2687-4974-8b86-e2e1a1f58daa	2	Very good app!!	5	2024-02-14	POSITIVE	0.999870300	General Feedback
90d17798-3207-43ef-a62a-21fd8126aaa1	2	Wow amazing app	5	2024-02-14	POSITIVE	0.999851346	General Feedback
ba55af7b-4023-4862-ba6f-9f2ac3b681b7	2	Was working fine for 2 days then Error the request was not successful please check your connectivity or try again my connection works perfectly i reinstalled the app called support multiple times all of them said it's a system problem be patient it has been a week since then, called again they even dared to say the problem is your phone restart it which i did but still the same other banking apps work perfectly but this my experience with this app, horrible the whole system is bad	1	2024-02-14	NEGATIVE	0.999177158	Bugs & Reliability, Customer Support, Transaction Performance
a9a7f141-8faa-4f42-8499-665d2c965fa7	2	It is good &fast to open!!	5	2024-02-14	POSITIVE	0.999864817	Transaction Performance
ed1e11a1-995e-4255-a461-9d227c04a962	2	It is the worst app that I have ever downloaded. It crushes every time I log in 👎 👎 👎 👎 👎 👎 👎 👎 👎 👎 👎 👎 👎 👎	1	2024-02-14	NEGATIVE	0.999794185	General Feedback
3eb5e2aa-da9c-4879-b7fa-51d605d32cf5	2	The keyboard not Working please fix it	1	2024-02-14	NEGATIVE	0.999493361	Bugs & Reliability
d0445199-84e3-493e-8d94-2c6583616901	2	When we come to use mobile banking app this app is the WOREST one. Who made this app? Why? im almost forget to use it While the app right infront to my phone. I preffered to go branch office rather than to use it. Let alone for transaction or other service for simple purpose to check my balance i used to call for the bank 'call center' rather than to open for this difficult app. It need high speed internet service, it stop service for simple interuption of the network, after transfer the 1/2	1	2024-02-13	NEGATIVE	0.998599827	App Speed & Performance, Customer Support, Transaction Performance, User Interface & Experience
789c7a33-2c9b-4ab7-bad3-126cb2485d6d	2	You should include manual OTP input!	1	2024-02-13	NEGATIVE	0.995128632	Account Access Issues
0392e082-49c5-4493-a4ca-14430e890d1b	2	Worst App it ain't allowing yo activate not even in the nearest branch are able to activate it. I have been client of the bank for 10years. What is this BoA? As we know it being a leading in simplifying banking service this App needs to be fixed. Then we will give it better rate,	1	2024-02-13	NEGATIVE	0.999647141	Feature Requests
9bd678e4-98d3-46a5-add6-9e64d3fb091f	2	እኔ ከሀገር ውጪ ነው ያለሁት I need help please!!! የበፊቱ app አልከፍት ብሎኝ አብዴት ማድረግ አልቻልኩም ከ ፕሌይ ስቶር ላይ እንደ አዲስ ነው ዳውንሎድ የሚጠይቀው እሱንም ሳደርግ በ ኢትዮጵያ ስልክ ቁጥር ነው ኮድ የሚልከው ፣የኢትዮጵያ ቅጥሬ አሁን active አይደለም ምን ማድረግ እችላለው? በምን መንገድ ልትረዱኝ ትችላላችሁ?	1	2024-02-13	NEGATIVE	0.984527588	Customer Support
a3f239e6-b1c6-4910-8d4d-5db544802d31	2	The app does not work well from abroad, there have been continuous upgrades and updates that are very interruptive and non-responsive. Staff do not have the technical capabilities to support whereas the support number and online support are never available.	1	2024-02-12	NEGATIVE	0.995356381	App Speed & Performance, Bugs & Reliability, Customer Support, Feature Requests
27e12500-c856-43d9-a2bb-97c7e02274da	2	App good. how money transfer tele birr agents	1	2024-02-12	NEGATIVE	0.992745340	Customer Support, Transaction Performance
9016c943-3652-41d4-8c06-aa81aa1cbd95	2	BOA Mobile banking is hard to deal with. Very poor app never gets better it keep lagging	1	2024-02-12	NEGATIVE	0.999562085	General Feedback
f72c1c32-6f3b-4b21-8886-5a19520b534d	2	Wow, that's an awesome app	4	2024-02-11	POSITIVE	0.999854803	General Feedback
af1b2b02-4b8b-4253-9a9a-2f136a956ff9	2	This upper is very slow	5	2024-01-31	POSITIVE	0.999571264	App Speed & Performance, Transaction Performance
b5ed4d5f-b0f7-4ef4-9b2f-3b12b1f2f50c	2	I sm a big fan of BOA , but the mobile banking is so trashy( sorry but its the best word to discribe it).... please buy a good server ....it always show blank age after login slecially on sundays it does not work at all...the new update has a good UI but has same respose problem ....	3	2024-02-11	NEUTRAL	0.997313321	Account Access Issues, Bugs & Reliability, Feature Requests, User Interface & Experience
c7c0cd4b-d8f9-4400-b7b3-49f807a318c5	2	Good but app lait	4	2024-02-11	POSITIVE	0.990449965	General Feedback
904805d4-0f4f-4279-b72a-ae0eedd2c661	2	this app doesn't fit the bank	1	2024-02-10	NEGATIVE	0.999797404	General Feedback
cd1656d1-afc8-4a2b-9f3b-91fbfa587b84	2	The updated version is nice one BOA always #1 bank	5	2024-02-10	POSITIVE	0.999059498	General Feedback
5bd5ece1-9221-4e85-9f8e-5595fa3a0755	2	As usual the app is ok, but this time i can't update it normally. It lags at 99% all the time. Hope it's fixable.	4	2024-02-10	POSITIVE	0.992245257	App Speed & Performance, Feature Requests
ffc76c90-7d65-45e7-8c47-a4c5bd029b0e	2	You have made a great application that is easy to use	4	2024-02-08	POSITIVE	0.999462306	User Interface & Experience
7c0961f2-7a44-49cd-b91b-a7edfc129349	2	More easy and secure fast app than previous one	5	2024-02-08	POSITIVE	0.996356368	Security Concerns, Transaction Performance, User Interface & Experience
0b485e1c-324d-43d9-b7aa-9c3f7a788f0f	2	ለምንድን ነው የexit መውጫ የሌለው back back ስንል እንውላለን እንጂ አፑ አይዘጋም	2	2024-02-06	NEGATIVE	0.978579640	General Feedback
c61b8df3-423a-4047-87af-b87171221b5e	2	It's much better now effoyee...	5	2024-02-06	POSITIVE	0.860987246	General Feedback
4fbd4527-b629-488c-8ac7-8546e4e4ee9e	2	What an awesome app! It is supper easy to use with very attractive GUI. But there are some problems to be addressed: (1) It crashes frequently and requires mobile cache to be cleared to relaunch. (2) Automatic OTP input is good. But fix the manual activation option, too. (3) It does not boot fast. (4) There are minor errors during the installation. (5) Color contrast: In the transactions menu, the credit accounts should be in dark green than light green. The debit accounts should be in dark red.	5	2024-02-06	POSITIVE	0.992322922	Account Access Issues, Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
d1f72257-e5c2-4da7-ab88-1bf64322de8a	2	I am having a challenge to use the app. The app does not allow to update the previous app. Neither does it allow to manually insert OTP - BoA please modify the app to allow these features	3	2024-02-06	NEUTRAL	0.998821318	Account Access Issues, Feature Requests
d713bd24-8fc6-48e4-ad53-aeafeda8babc	2	Easy and very nice app to load more than the previouse	5	2024-02-06	POSITIVE	0.999312997	User Interface & Experience
6cab78a7-bc92-43b8-84c8-f997d3c31726	2	I Don't Like It Once U Open It's open did Not Ask U The Pin when u get back Not Safty the Old Version Is More Secured	2	2024-02-06	NEGATIVE	0.993198574	General Feedback
b88feb0d-2419-4bb6-b4b5-0ceda385b47c	2	I like it so much	5	2024-02-06	POSITIVE	0.999870062	General Feedback
d3228d62-7abf-440c-85f4-77f1a1d486c4	2	Best finance app,	5	2024-02-05	POSITIVE	0.999624133	General Feedback
d99c1e28-22e9-488e-b561-861e8282b60a	2	Simple, fast and easy to use. I had bad experience on apollo and the older version of this app is too slow.	5	2024-02-05	POSITIVE	0.998862863	App Speed & Performance, Transaction Performance, User Interface & Experience
769aa7f0-de68-4bd0-ab4b-d6038d9836be	2	Much better and easy to access then the last boa app	5	2024-02-05	POSITIVE	0.989098787	Account Access Issues, User Interface & Experience
681654a7-15e4-4539-ad2f-4adcf5cd12dc	2	Not working properly always loading !	3	2024-02-04	NEUTRAL	0.999804914	App Speed & Performance, Bugs & Reliability
bed82c38-8d93-4c7f-a0e4-6dbe6499b6ab	2	Tnx for updating the app its easy and fadt	5	2024-02-04	POSITIVE	0.977072358	User Interface & Experience
1c271a34-f9ba-4df4-81bb-ae7ac9ef7b76	2	Waw bezu amarache ke fetnet gar yemegerm lewt new	5	2024-02-04	POSITIVE	0.993838489	General Feedback
485190f3-6c28-4ba9-8be3-f589e99fd8a9	2	I think this one is better than the prvious one much faster but try to make it more faster like nib and cbe specially nib bake their app is very nice but the bank is not anyways good job on this one	5	2024-02-04	POSITIVE	0.998899460	General Feedback
8e9bcb5d-012f-4969-bb6f-c5a715e31318	2	One of the weakness in BOA is it's mobile App. I hope this will address some of them, but it is very critical to work on modernizing and ensuring the security of it's mobile banking system in this digitalized world	3	2024-02-04	NEUTRAL	0.995582521	Bugs & Reliability, Security Concerns
b95b5757-59e6-4147-9c90-c5bb787386c6	2	Please add an option to manually input the OTP. I am residing outside of Ethiopia. I encountered difficulty accessing my account following the recent update (change) of your mobile banking app. Unfortunately, I am unable to activate the app on my mobile device. During the activation process, the app prompts for an OTP, which I can receive via Telegram. However, there is no option to manually input the OTP. I kindly request your assistance in resolving this matter and activating my account	3	2024-02-03	NEUTRAL	0.997626603	Account Access Issues, Feature Requests, Transaction Performance
5072a136-5343-4309-b265-14b5b12f9bd3	2	Why the app doesn't allow to update the previous version. In addition to this, when I install the new version and try to activate, the app doesn't allow to write the activation OTP code to the screen. I have received the OTP password from telegram and email. Would you please fix this bug. Thank you	1	2024-02-03	NEGATIVE	0.996991515	Account Access Issues, Bugs & Reliability, Feature Requests
7e629e12-154b-4482-a805-90bf721f5011	2	I don't have words for your great work.. Really Good .what i like the most is the screenshots features is included which gives you the transactions detail ...Great Work...KEEP IT UP !!??	5	2024-02-03	POSITIVE	0.994922340	Bugs & Reliability, Feature Requests, Transaction Performance
000ef73f-978b-4c50-a44a-9c57cbc5c69e	2	A massive improvement from the previous app. More modern and actually works	5	2024-02-03	POSITIVE	0.999755919	Bugs & Reliability, User Interface & Experience
06b0b75a-3c54-4f86-822f-a84022fe260d	2	"The choice for all" It is interesting app,The old one was time spent to open the app. I am with you BoA.	5	2024-02-03	POSITIVE	0.959637761	General Feedback
594ad1b3-589b-43aa-9936-04d0f57eefc4	2	You make the app worse . Asif it is update you make us install it as new then you create us problems	1	2024-02-02	NEGATIVE	0.999764025	Bugs & Reliability, Feature Requests
e1ecdcbc-c4eb-41a0-97c3-35cba42fb8f8	2	BOA App ...በጣም ቀርፋፋና ለመጠቀም ሳስበው ገና የሚደክመኝ አፕ ሆኗል። በጣም ያሳዝናል እንዲህ መሆኑ	1	2024-02-02	NEGATIVE	0.983886778	General Feedback
76e793fe-9df5-4452-890f-cbac3cdf1721	2	not change who I	5	2024-02-02	POSITIVE	0.993423581	General Feedback
3ce53ccb-4a8f-4349-88e0-f446172a28ea	2	🤔 it stucks at 79%	1	2024-01-30	NEGATIVE	0.998534679	General Feedback
b9dc4dd4-f386-4fd5-9b88-3af595606850	2	ምንም የማይ ሰራ አብስያ ባንክ ለደምበኞች ግድ የሌለዉ በትክኖሎጂ ቀዳሚ ግን አብዛኛውዎች የማይ ሰሩ ከ አቲአም ምቹ በአቲአም አንደኛ ናችሁ ሌላ ደምበኞ ሞባይል ባንክ ባል ፀደቀ ሕግ ባልተፃፈ ሕግ የከለከለ ባንክ ነው	1	2024-01-29	NEGATIVE	0.962860584	General Feedback
87182887-0e49-43bc-9151-a60a896e3a50	2	the bank you always accepted Bank of Abyssinia worldwide cyber bank of Ethiopia ⭐️⭐️⭐️⭐️⭐️	5	2024-01-28	POSITIVE	0.946020067	General Feedback
d1db8100-c3db-4123-a13d-b2c111104f34	2	This app is way better than both Apollo and the old mobile banking app. It's super easy to use and loads really fast. If you already have boa mobile banking before, activating it is a piece of cake. Great job on making such an awesome app – keep it up !	5	2024-01-27	POSITIVE	0.999552548	Transaction Performance, User Interface & Experience
762a6e79-bad1-4bc5-9595-65eddfa768c4	2	It is very nice app	4	2024-01-24	POSITIVE	0.999860168	General Feedback
87154fba-12e2-4d6c-a471-dca084f7febf	2	It is really great to see you have solved some of the problems with the previous version. Thank you for taking time to improve.	5	2024-01-24	POSITIVE	0.999812424	Bugs & Reliability
d464302a-7f6f-4dba-9b61-62dea5eab2f1	2	It is not downloading. It stops at 79 % . Why ?	1	2024-01-23	NEGATIVE	0.999322772	General Feedback
f413581f-6ca6-4468-9616-05d5d00fa962	2	Seid Asile Ibrahim	5	2024-01-21	POSITIVE	0.972925425	General Feedback
243b532d-869b-40a5-931c-a7fec1297cf6	2	This is a much better app from BOA, easy to activate with ATM credit info, that helps someone like myself who already forgots previous PIN No or IB password. Apps runs fast unlike the previous versions. I hope you don't ruin it with unnecessary update. Please notify customers to use this app through their SMS.	5	2024-01-18	POSITIVE	0.992431879	Account Access Issues, Customer Support, Feature Requests, Transaction Performance, User Interface & Experience
b5697919-6864-4081-be34-38240941d26f	2	The new version is really nice. Keep it up	4	2024-01-18	POSITIVE	0.999865770	Feature Requests
3d87e290-18b1-465e-8d58-9415ed0c6d14	2	Like I said before, the previous version was horrendous! I'm glad that you took time and decided to develop this awesome app. Well done!	5	2024-01-18	POSITIVE	0.999527931	General Feedback
57c27d13-bb76-473e-becb-fc6217ddd0bd	2	ምን ሆናችው ነው ግን ?በጣም ቀርፋፋ ነው፡ቢያንስ እንኳን እንደ Apollo ቢፈጥን ። I'm more 15years customers in your bank but due your Application i decide to shift for other bank like CBE OR TELEBIRR PLEASE FIX THE SPEED	1	2024-01-18	NEGATIVE	0.992855012	App Speed & Performance, Bugs & Reliability
3f2731c8-a1f4-4e60-9a4b-25c3c3b261cd	2	You've improved from the previous one! Also try to add dark mode.	5	2024-01-17	POSITIVE	0.776027441	Feature Requests
47952a57-6612-4e48-93e5-2c33b47ac246	2	The worst app. Can't even login to my device. Phone : Pexel7a, version : android 13.	1	2024-01-16	NEGATIVE	0.999811113	Account Access Issues
245970d2-c66f-4cbc-84e5-956cf830b91f	2	I think this app is fraudulent. It is not real	1	2024-01-15	NEGATIVE	0.999800742	General Feedback
f7eaa18a-f1ea-4477-b0c8-2832899d5424	2	This new version of the app is really great. Loved it!	5	2024-01-15	POSITIVE	0.999873757	Feature Requests
40773d6f-fb8e-4a39-99c6-161ac77dac44	2	በጣም ደስ የሚል ለውጥ አናመሰግናለን 🇪🇹	5	2024-01-14	POSITIVE	0.883213103	General Feedback
0cf141af-6795-47ab-ab55-1e1b36f33fc0	2	Best application👍Thank you ! Abyssinia bank.	5	2024-01-12	POSITIVE	0.981992364	General Feedback
c975592d-4176-48bd-a62e-a280b39ae58b	2	Absolutely it's fantastic apps this New apps it's fast and good apps	5	2024-01-11	POSITIVE	0.999887705	Transaction Performance
9cafe37d-532c-4b64-be35-3348307a5cc3	2	The best app next to Tele birr in ethiopia	5	2024-01-10	POSITIVE	0.998718977	General Feedback
caf4a80c-85db-4b49-ab9c-a0b55e152317	3	Massive upgrade from the Amole app.	5	2025-05-31	POSITIVE	0.964641988	General Feedback
c25b35d2-35dd-4347-a520-99471d7b1066	3	very good for this app	5	2025-05-31	POSITIVE	0.999813855	General Feedback
5e6ff839-abc2-4b30-a8b4-e0f331da29d1	3	this app better than Amole . but the biometric on new update doesn't work	4	2025-05-31	POSITIVE	0.999607503	Bugs & Reliability, Feature Requests
486d7550-98dd-4b9d-849d-e3f3fbf7c1ed	3	wow to it saff and this app	5	2025-05-30	POSITIVE	0.998571277	General Feedback
be9a4e52-ed77-4953-9e52-17927dd7e138	3	it too slow	3	2025-05-29	NEUTRAL	0.999680161	App Speed & Performance, Transaction Performance
053df9a3-e18d-4cb1-94f6-9cf522255b1c	3	ዳሽን ባንክ ይለያል	4	2025-05-28	POSITIVE	0.833725393	General Feedback
cc215b00-332a-4b1d-93d1-4fad5592f40c	3	real life changer	5	2025-05-28	POSITIVE	0.999778807	General Feedback
115f7455-45c0-483c-b690-0e83dada584b	3	useless app ever loading take long	1	2025-05-27	NEGATIVE	0.999735057	App Speed & Performance
b2962d2d-86b8-43a5-ab14-d9d37ad03165	3	Game changer app! Dashen Bank Super App is fast, secure, and easy to use. The three-click payment makes sending money super quick, and the QR code payment is perfect for cashless shopping. I also love the biometric login and easy airtime and bill payments. Everything I need is in one place. Dashen Bank has really raised the bar for digital banking in Ethiopia. Highly recommended!	5	2025-05-26	POSITIVE	0.999531150	Account Access Issues, Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
37afb22a-56f0-429c-9bab-41e39e524f29	3	very useful App	1	2025-05-26	NEGATIVE	0.999578536	General Feedback
aa332503-7097-479d-89d9-6b762bb9e814	3	Simple, robust features? Yes, please! But the endless loading screen killed the fun—I couldn’t use it for days. Fix the glitch, and I’ll yeet a higher rating!	2	2025-05-26	NEGATIVE	0.996590137	App Speed & Performance, Bugs & Reliability, Feature Requests, User Interface & Experience
46d39a4d-52de-4a73-9146-654d971ffb71	3	it is good but some times says duplicate transaction why?	5	2025-05-24	POSITIVE	0.983663082	Transaction Performance
9a583630-4540-44cb-8488-cf58211da392	3	it is not as good as to the other mobile bank app.	1	2025-05-22	NEGATIVE	0.999786913	General Feedback
bb72bc30-a3bb-468f-ad15-1ca88c7897ae	3	The best of best is now arrived **Empowering Your Financial Freedom** "Experience seamless banking at your fingertips with Dashen Bank. Empowering your financial freedom, anytime, anywhere!" **Innovation Meets Convenience** "Dashen Bank Mobile Banking: Where innovation meets convenience. **Secure and Reliable** "Bank with confidence	5	2025-05-22	POSITIVE	0.999741018	Bugs & Reliability, Security Concerns
a3189851-e82e-45f8-ba42-6b8f32fabd40	4	Not working why???	1	2022-11-26	NEGATIVE	0.999306798	Bugs & Reliability
c8a76cee-dbcc-491e-9aa0-0f8fa423ee1a	3	Nothing is changed in the updated version. You have been collecting comments but where is the feed back you improved in this version. superapp is mot functioning today.	4	2025-05-20	POSITIVE	0.993986249	General Feedback
a36489c7-0091-4e07-897f-78168bcb64b4	3	The best app ever in finance sector	5	2025-05-18	POSITIVE	0.999808967	General Feedback
29d8b281-c802-4996-8dc3-eb99d78a43ed	3	Its good app than other compitators but it confuse when we transfer it needs OTP and PIN most user inter their pin instead of OTP we know the litrecy level of our society so if it is device based i dont know the needs of OTP so please try to fix	3	2025-05-18	NEUTRAL	0.998335779	Account Access Issues, Bugs & Reliability, Feature Requests, Transaction Performance
8ab908fa-9eb8-4b9a-9f76-707e01b53848	3	dashen bank or dashen super app?	1	2025-05-17	NEGATIVE	0.993752539	General Feedback
85c0cebd-10ec-4dd1-9e5b-647b9012acf4	3	Transferring to other bank accounts is a hastle and inconvenient .Get used to seeing " please try again "	2	2025-05-17	NEGATIVE	0.999332964	General Feedback
d8ab69ab-7277-493d-a2d5-0db4fd48635c	3	Dashen bank app is very good, but sometimes it is not working well	5	2025-05-15	POSITIVE	0.998013258	Bugs & Reliability
499d89e8-8b7e-4641-b477-29ab5a5d314a	3	its my choice	5	2025-05-15	POSITIVE	0.996201098	General Feedback
f14bbcf2-d3c7-4eb9-bf61-b8be931c023f	3	awesome app keep going	5	2025-05-14	POSITIVE	0.999850273	General Feedback
39322571-d8e5-42c6-8c9c-9f31706d5e4f	3	It grows ethiopian digital banking step ahead.All fetures in one,simple fast and convince.	5	2025-05-14	POSITIVE	0.998351932	Transaction Performance, User Interface & Experience
a1414451-a015-4553-a023-e2f4c2d8cfb9	3	what a helpful app!!!!	5	2025-05-13	POSITIVE	0.999090195	Customer Support
d61a5b09-39d5-4502-b270-15c6ad04f19c	3	To be honest, best banking and lifestyle app in Ethiopia.	5	2025-05-12	POSITIVE	0.999383450	General Feedback
c3afc51f-9e2b-4b3d-b155-0339a9ce0f20	3	A must have, seamless, all in one digital platform "DB Superapp"! Keep living your motto "Always one step ahead"	5	2025-05-12	POSITIVE	0.996142685	General Feedback
6fbffae4-0ab6-4bc9-a758-204abc102d89	3	This App makes digital banking effortless and convenient. User-friendly interface, secure transactions, and excellent features for managing finances efficiently.	4	2025-05-10	POSITIVE	0.997956038	Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
e1c1214a-8bc1-45db-bc49-3d51dddc6b88	3	Amazing app super easy to use and best design. loved it.	5	2025-05-09	POSITIVE	0.999863029	User Interface & Experience
8d1d472b-2bae-4749-b089-5632108ade02	3	its the best ever	5	2025-05-09	POSITIVE	0.999855280	General Feedback
f2852962-b983-44af-b296-241a3373477f	3	excellent game changer App	5	2025-05-08	POSITIVE	0.999835849	General Feedback
62102c1c-85b0-4965-b033-063c67ac9129	3	I am highly excited by using this application and it is the most favorable as well as preferrable mobile app.	5	2025-05-03	POSITIVE	0.999517679	General Feedback
f4d24779-931e-4cfd-a622-92dfcb654d3d	3	it seems me logging out within minutes	1	2025-05-03	NEGATIVE	0.998220742	General Feedback
157b5f87-506e-46dc-b89b-179653dbd957	3	nice app especially GUI and I have got some error when you send within dashen bank the receipter is not get SMS notification	4	2025-05-03	POSITIVE	0.985798955	Bugs & Reliability, Feature Requests, Transaction Performance
4e018789-e27b-4b7c-b1d4-f79dd0affa68	3	yes i want dashen super open	5	2025-05-02	POSITIVE	0.999435008	General Feedback
0472c5b5-9fd3-49be-80f6-cca83ad918e5	3	faster than this version	5	2025-05-01	POSITIVE	0.999197900	General Feedback
222e6a10-b3df-421c-83ae-1ff05ec40496	3	Best UI mobile banking app, props to design team	5	2025-04-30	POSITIVE	0.998724878	User Interface & Experience
d744a029-1173-4a4b-b7f9-7c294f6fbd5d	3	Dashen bank always one step ahead	5	2025-04-30	POSITIVE	0.999601543	General Feedback
153295c5-2630-4a84-9d1e-18ac73eca0c1	3	dashen super app is secure band very easy	5	2025-04-29	POSITIVE	0.989965141	Security Concerns, User Interface & Experience
185c1487-6efe-4ba5-bbaf-41ea48da9422	3	It is very fast and secured mobile banking app! I like this app!	5	2025-04-29	POSITIVE	0.999593914	Transaction Performance
63989d70-6ec3-44bb-87a8-2dad9286e37a	3	best app I have ever seen	5	2025-04-29	POSITIVE	0.999610245	General Feedback
17d46982-18ec-43a9-85f3-0ff927671f95	3	best of best	5	2025-04-29	POSITIVE	0.999749601	General Feedback
9f0dddc5-58fa-4637-9a98-414044aa8bd0	3	Its slow when i try to see the Recent Transaction and stucked	1	2025-04-28	NEGATIVE	0.999238729	App Speed & Performance, Transaction Performance
1db8f294-b4c5-4389-8b1c-dcdf92f7ce3c	3	wowslnwoooo wowwww amazing !!!!!!!!	5	2025-04-28	POSITIVE	0.999722183	General Feedback
cbfa6f44-6387-46f5-8c57-005106a7f33f	3	why do i have to change a pin number i use my finger print so dummy	1	2025-04-27	NEGATIVE	0.999464691	General Feedback
f0c1bd73-66ab-47e9-9238-2ab86618c796	3	It is one of the best app ever use it and do it	5	2025-04-26	POSITIVE	0.999793112	General Feedback
3cef32ad-b3c0-4784-8594-0dfee471123e	3	It is very slow and it lacks many features to be a super app. High rating is given by their employees, not by the customers.	1	2025-04-25	NEGATIVE	0.999764264	App Speed & Performance, Feature Requests, Transaction Performance
7e450cb8-6117-4fb2-b6fe-a4b889074190	3	Smooth and secure experience transfers, bill payments, and tracking expenses are all effortless. The intuitive design makes banking on the go.	5	2025-04-24	POSITIVE	0.999599993	Security Concerns, Transaction Performance, User Interface & Experience
125057ca-c7fb-4c34-a7d1-a2cbe0d1b369	3	Very easy and Fast.	5	2025-04-24	POSITIVE	0.999548733	Transaction Performance, User Interface & Experience
b7dbd93e-582d-4510-af69-30c206f1a99d	3	Incomparably user-friendly and fast app for mobile banking.	5	2025-04-24	POSITIVE	0.992543817	Transaction Performance
a96e41e8-767a-47e4-831c-2993d37f2906	3	there is nothing super about this app, repeatedly failed transaction and wastes customer valuable time. if you have to do system upgrade do it at a time when there is less traffic demand. your Technical difficulty should not be reflected on customer.	2	2025-04-24	NEGATIVE	0.999012113	Transaction Performance
1115d2b9-b1f0-4fe5-a92c-67aed49141a7	3	This super app is a total game-changer—fast, reliable, and packed with everything I need in one place. It’s seamless and super convenient. Love it!"	5	2025-04-23	POSITIVE	0.999746263	Bugs & Reliability, Transaction Performance
99705962-8067-497e-a116-cd6599ca4bb8	3	All in One ✍️secure ✍️reliable ✍️convenient. Digital banking game changer!!	5	2025-04-23	POSITIVE	0.965372920	Bugs & Reliability, Security Concerns
2d86848c-b71b-4419-871c-42ad60f1abfe	3	it is incredible product.	5	2025-04-23	POSITIVE	0.999886751	General Feedback
e887c287-a3a3-42dc-bd9a-7508531f6f0c	3	I'm really impressed with this app! It’s user-friendly, runs smoothly, and has all the features I need. Makes my tasks so much easier and saves me a lot of time. Highly recommended!	5	2025-04-23	POSITIVE	0.999781787	Feature Requests
7b265fe3-1e03-425b-9b06-41bafe966fc3	3	It's an amazing app, experience it!!	5	2025-04-23	POSITIVE	0.999850750	General Feedback
49c926f1-3b4f-48af-8fab-ce09046e20cc	3	This is the best banking app ever. I recommend everyone to use it.	5	2025-04-23	POSITIVE	0.999759972	General Feedback
aba6145f-bd70-43dd-ae4e-46e73fde8a82	3	It is the best application!!!	5	2025-04-22	POSITIVE	0.999846816	General Feedback
02103d94-84d8-4ca5-aa3d-db0e512c68a7	3	Exceptional digital experience, SupperApp will bring new paradigm shift in the banking business. Bravo Dashen keep it up!!!!	5	2025-04-22	POSITIVE	0.999821961	General Feedback
9dd7083b-d295-42f5-b18f-f11dc02839a7	3	its features are so dynamic	5	2025-04-22	POSITIVE	0.999643087	Feature Requests
e0e5b98d-5942-4c79-8610-4206edfdf353	3	fast &Friendly user Application.	5	2025-04-22	POSITIVE	0.998790801	Transaction Performance
524e7cc6-ccd9-4c2a-8384-968ef8f4040e	3	Fast, Reliable and User Friendly. Keep it Up	5	2025-04-22	POSITIVE	0.999650478	Bugs & Reliability, Transaction Performance, User Interface & Experience
d7f04f13-06de-4c04-b616-a7ecbb6dd8b4	3	#dashen super app is easy to use, secure & fast transaction😍	5	2025-04-22	POSITIVE	0.852393389	Security Concerns, Transaction Performance, User Interface & Experience
872c07eb-b111-4701-b263-c11d17dea1c7	3	i love this app esp 3 click that make e-commerce easier and convinient.	5	2025-04-22	POSITIVE	0.999645710	General Feedback
d41dd3e3-b09b-4d1f-a5a2-0caa9f430e37	3	Dashen Super App contains extended selections for customers and can be easily accessible and also friendly to use.	5	2025-04-22	POSITIVE	0.999036908	General Feedback
be4677cc-1140-4ab6-b785-420638e0d7ba	3	Great for everyday banking and payments on the go	5	2025-04-22	POSITIVE	0.999825537	Transaction Performance
acef4b82-b287-4a31-8dc8-6d701f99f9c4	3	"Dashen Super App'' is impressive with its focus on simplicity, speed, and quality. The user interface is clean and easy to understand. Transactions process quickly, and the overall quality of the app is top-notch. A must-have for Dashen Bank customers. ዳሸን ባንክ አንድ እርምጃ ቀዳሚ።	5	2025-04-22	POSITIVE	0.999172449	App Speed & Performance, Transaction Performance, User Interface & Experience
a7530454-7c62-4c62-9f29-9f3a2e82c705	3	making transactions has never been easier. the new update is just amazing	5	2025-04-22	POSITIVE	0.999831080	Feature Requests, Transaction Performance
cdbc2de4-065b-4230-a34b-c532cf84ae71	3	The app has various usefull functions, which make easy the payment system. Also, it will connect with sellers having reasonable prices.	5	2025-04-22	POSITIVE	0.985206902	Transaction Performance, User Interface & Experience
1ba081f6-d792-4a8e-a001-8613242bee50	3	The app has great user interface with comprehensive payments and E-commerce platforms. And also it includes unique features such as chat Banking and budget.	5	2025-04-22	POSITIVE	0.999298692	Feature Requests, Transaction Performance, User Interface & Experience
7baf1a73-5eb3-4057-b7aa-c94108c67155	3	betam mirt Ena betam le atikakem kelel Yale Ena michu application nw	5	2025-04-22	POSITIVE	0.988624930	General Feedback
f6ad312f-15c3-43bb-b291-f8a8e35e331e	3	It is an amazing application that meets the needs of customers.	5	2025-04-22	POSITIVE	0.999864936	Feature Requests
751bedd2-1517-4cb4-a41c-f02d5f4b2468	3	Effecting payment via the app has created convenience to the recipients in easily confirming the payments received!	5	2025-04-22	POSITIVE	0.973114967	Transaction Performance
3e0e6df3-cb63-4503-8434-e1fb0bb790d1	3	the best Supper App ever	5	2025-04-22	POSITIVE	0.999849796	General Feedback
2bc93d8c-1975-44d3-b7c2-ef3429278f07	3	This is the best app ever, when is it planned to include digital lending and gasification?	5	2025-04-22	POSITIVE	0.996734023	General Feedback
f20f93ab-8f75-40aa-89a6-c450f54a7365	3	A powerful, local solution that rivals any global app. I love how easy it is to explore services and products.	5	2025-04-22	POSITIVE	0.999820530	User Interface & Experience
ff1fe28f-db38-4286-acc3-b3693e528883	3	Dashen bank is my number one choice	5	2025-04-22	POSITIVE	0.999633193	General Feedback
9b5d99cc-8b0e-46d5-a846-ece397be1d99	3	Assefa Genetu = Dashen superup is the latest and inclussive .I am happy with this super up.	5	2025-04-22	POSITIVE	0.999432623	General Feedback
10870471-f38d-4dae-8a2c-ea875933d8ef	3	The App is incredibly user-friendly and brings multiple services into one place. It's fast, intuitive, and makes daily tasks super convenient. A true all-in-one solution!	5	2025-04-21	POSITIVE	0.997755110	Transaction Performance, User Interface & Experience
6098f0f8-c13e-4cd3-a595-25b234b6a05f	3	Proudly made in Ethiopia, this innovation delivers more than promised. The marketplace is a major boost for local commerce	5	2025-04-21	POSITIVE	0.999806941	General Feedback
43630291-4571-4e34-96d8-1d7ba7d174a9	3	it so fanrastic and user friendly app. Bravo Dashen bank thanks.	5	2025-04-21	POSITIVE	0.999042928	User Interface & Experience
328e442a-c92a-42dc-a91c-44d71556a34e	3	one of the best digital platforms I've used! from smooth transactions to a seamless shopping experience, highly recommended.	5	2025-04-21	POSITIVE	0.999766886	Transaction Performance
9937695e-7675-41d4-a60d-2fee72cb4b3c	3	A proudly Ethiopia innovation that delivers beyond expectations. The marketplace feature is a big win for local shoppers bnd sellers	5	2025-04-21	POSITIVE	0.999789178	Feature Requests
9057ebb4-b1dd-4df9-a0d3-9ead5360b9c9	3	Dashen Super App is a game-changer! It’s fast, user-friendly, and packed with features that make everyday banking and transactions super convenient. I love how everything I need from mobile banking to utility payments is all in one place. The interface is clean, and everything works smoothly. Definitely one of the best apps out there. Highly recommended!	5	2025-04-21	POSITIVE	0.999775827	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
dd0238ce-336d-4dac-832c-8d01f44faf0a	3	Easy to use and has many options. It is the best financial app I have ever used.	5	2025-04-21	POSITIVE	0.999754608	Feature Requests, User Interface & Experience
b5161ddf-ce45-46bf-9858-07071bdeeaba	3	Highly impressed! Dash Bank really nailed it with this app. Secure, reliable, and packed with features I use daily	5	2025-04-21	POSITIVE	0.999827385	Bugs & Reliability, Feature Requests, Security Concerns
5145d0cf-0bf3-4b48-9c11-46819cd06bcd	3	One of the best digital platforms I’ve used! From smooth transactions to a seamless shopping experience, Highly recommended	5	2025-04-21	POSITIVE	0.999686956	Transaction Performance
8cd152ac-79ad-4248-8a85-574943011aa6	3	This app has everything I was looking for, dashen is becoming a grandmaster.	5	2025-04-21	POSITIVE	0.998437583	General Feedback
70e43e76-a4ca-4e15-b690-93a34a5bf675	3	The user experience is seamless, and everything just works perfectly right out of the box. I can’t believe how much time and effort it saves me every day.	5	2025-04-21	POSITIVE	0.999762833	Bugs & Reliability
1e865933-282f-4ea1-98f5-98c08d95a40f	3	wawwwww what nice super app !!keep it up dashen bank !!	5	2025-04-21	POSITIVE	0.999135911	General Feedback
650cfa8e-a81f-4f2e-bfbf-8f7fa6996872	3	Dashen SuperApp the ultimate all-in-one solution! From banking and shopping to bill payments, everything you need is right at your fingertips. Life just got a whole lot easier!	5	2025-04-21	POSITIVE	0.998678029	Transaction Performance
31eddf1f-9725-472b-b29a-53377dac71ca	3	It is,really super because of its unique offerings to individuals and businesses.It is a secure UX first app intended to cater comprehensive digital meeds.I am also happy to know that Dashen is considering to make the app more inclusive by lowering the mobile version requirements .	5	2025-04-21	POSITIVE	0.999480307	Security Concerns, User Interface & Experience
876f0ee8-c6e9-437e-9a56-bf00083a0319	3	the very easy, secured, fast and multifunctional dashen supper application I ever seen. dashen really one steps ahead!!!	5	2025-04-21	POSITIVE	0.997410357	Transaction Performance, User Interface & Experience
6c78dd1a-b338-4892-8821-27329e6a37cb	3	One app for everything! I can shop, manage my bank account , and do so much more . Truly a super app	5	2025-04-21	POSITIVE	0.998568296	General Feedback
62ff3224-447a-4021-9b69-69faade17181	3	one of the best digital platforms I’ve used! From smooth transactions to a seamless shopping experie	5	2025-04-21	POSITIVE	0.999357402	Transaction Performance
f1d0d6cf-8d40-4ff9-99d5-3225c4efd6b9	3	Dashen Bank super App is the most suitable, reliable, and fast digital banking system.	5	2025-04-21	POSITIVE	0.998909235	Bugs & Reliability, Transaction Performance
7ec853c5-737f-4ffe-b35b-069674bb88a8	3	This is what we call banking app. As professional I want banking app as simple as this and an app rich of features that align with my lifestyle.	5	2025-04-21	POSITIVE	0.999150038	Feature Requests, User Interface & Experience
65fbea88-9893-412a-adf2-7bde81ea0d0f	3	Super Easy To Use and Fast Transaction.	5	2025-04-21	POSITIVE	0.996877909	Transaction Performance, User Interface & Experience
f3f97b40-b273-44a0-afb9-1d393132be8d	3	I have an incredible experience with Dashen super app, what an amazing platform is it?. keep pioneering in technological advancement 👏👏👏	5	2025-04-21	POSITIVE	0.999626279	General Feedback
4515e0fb-53a8-4310-8734-084b884ed005	3	i can't recommend the Dashen Super App enough! This app is truly a game changer for anyone looking for a seamless and efficient way to manage their daily life. It combines multiple essential services into one easy-to-use platform, saving time and simplifying tasks The user interface is modern, intuitive, and super responsive, making navigation a breeze. Whether it's banking, payment services, or accessing lifestyle features, everything is just a few clicks away!!	5	2025-04-21	POSITIVE	0.995649278	App Speed & Performance, Feature Requests, Transaction Performance, User Interface & Experience
873196ce-c4ce-441c-a522-dd0785ea59f3	3	The app is incredibly handy for managing multiple financial tasks, from bill payments to managing budgets. It’s saved me a lot of time and made banking way more convenient. Definitely worth checking out!	5	2025-04-21	POSITIVE	0.997524917	Transaction Performance
6f49f061-db2b-45e0-9947-743a32c2660f	3	what an App	5	2025-04-21	POSITIVE	0.993823886	General Feedback
06aa9940-e8eb-45b2-91c7-1f13bd1645b6	3	The new e-commerce feature is incredibly amazing and user friendly.	5	2025-04-21	POSITIVE	0.999864817	Feature Requests, User Interface & Experience
05ea16ca-9cbf-4683-9ac7-ea4395cf688b	3	dashen bank supper app is the most easy to use and have high speed,quality and I like features like chat,budget,fuel payment, and security for my opinion this product is techonolgy edge,this international standard thanks for product oweners (dashen bank)	3	2025-04-21	NEUTRAL	0.954801500	App Speed & Performance, Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
134d29fb-1daa-4f59-b21f-11e5fa7be525	3	The Dashen supperapp is a revolutionary advancement in digital banking, combining exceptional usability, an intuitive interface and a seamless user experience. among its standout features are the integration of QR codes, account statement, transaction advise, chat, transaction authentication for limit thresholds, budgeting and different app in a single dashboard. Truly ahead of the curve ..... keep up the excellent work 🤝👏	5	2025-04-21	POSITIVE	0.999748409	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
de603128-030e-4e5b-9bda-38e74813ad2d	3	A proudly Ethiopian innovation that delivers beyond expectations. The marketplace feature is a big win for local shoppers and sellers. Very impressed with the new updates, The e-commerce section is smooth and supports Ethiopian merchants!	5	2025-04-21	POSITIVE	0.999874830	Customer Support, Feature Requests
f37a6b6d-6879-4d35-80ba-64d2c96fa749	3	Very impressed with the new updates, The e-commerce section is smooth and supports Ethiopian merchants.	5	2025-04-21	POSITIVE	0.999815881	Customer Support, Feature Requests
d41af5b1-8acf-4f66-9d54-e14316bf489d	3	Dashen Bank Super App is fast, reliable, and super easy to use. All my banking needs are handled smoothly in one place. Clean design and seamless experience – highly recommended!	5	2025-04-21	POSITIVE	0.999753058	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
ba65f5a6-aa3f-4c38-956e-7077d9756d65	3	Db sup app is A platform or an application that can grasp more satisfactions through fastest mode of operation which means for budget planning, to use QR code(scan, pay, go) chat with staff, acc to acc other bank ft, merchant payment, and easly. I addition to i satisfied and i invite everyone to use those platform!!.	5	2025-04-21	POSITIVE	0.655026793	Transaction Performance
0d377b76-0853-4251-b23e-81fd0cc4d9f5	3	the chat banking and unique and only app that alow money request!!	5	2025-04-21	POSITIVE	0.982268572	General Feedback
e18544eb-d622-47eb-8d7d-ef3bf4df0a10	3	Better and inclusive app!	5	2025-04-21	POSITIVE	0.999285877	General Feedback
867ceac0-2b05-4261-86c0-093b58ea0553	3	It keep my time to pay my bills and I generate my satment easily	5	2025-04-21	POSITIVE	0.996675968	General Feedback
80908e03-2856-4e22-84ed-a70b53d96a41	3	It's an amazing app that is up-to-date with the times, wow wow	5	2025-04-21	POSITIVE	0.999827325	General Feedback
e84b7866-5a17-40c7-affc-1a44702a7227	3	A game-changing Ethiopian innovation—where shopping meets opportunity. The marketplace feature connects buyers and sellers like never before.	5	2025-04-21	POSITIVE	0.998637974	Feature Requests
963f1643-28ff-462c-88a7-bc9146390102	3	Dashen Super App isn’t just an app — it’s an experience. Effortless, powerful, and built for the future	5	2025-04-21	POSITIVE	0.999551475	General Feedback
5b63a17e-0903-47f6-b8da-cb1c7346ad56	3	This Is An Amazing App with Uniqe Quality,Easy And Fast Mobile Banking App.	5	2025-04-21	POSITIVE	0.999625802	Transaction Performance, User Interface & Experience
5b8c94df-b1d3-4948-bcb1-238e80146227	3	Dashen SuperApp is a lifesaver! Banking, shopping, and bills in one super easy app. The new e-commerce feature is awesome and supports local merchants. Fast, secure, and proudly Ethiopian.Download it now—you won’t regret it!	5	2025-04-21	POSITIVE	0.997055292	Customer Support, Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
2a157c0e-b57e-43e8-8207-4ae55e549812	3	Dashen SuperApp blends finance, shopping, and daily services effortlessly. The new e-commerce feature is smooth and supports local merchants—proud to back an Ethiopian-made solution!	5	2025-04-21	POSITIVE	0.999708951	Customer Support, Feature Requests
739b4157-4335-4fe7-9273-07f9427c8dba	3	A solid step forward by Dashen Bank. The SuperApp combines essential banking features with lifestyle services, making everything accessible in one place. The interface is smooth, and transactions are quick and reliable. It’s clear a lot of thought went into the design and functionality. Great job!	5	2025-04-21	POSITIVE	0.999829173	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
369da03b-61ed-424a-abab-7efc142b1038	3	Dashen bank super app is the crucial and convenient app in Ethiopia. there is no other app to compare with Dashen bank super app	5	2025-04-21	POSITIVE	0.981766880	General Feedback
83682450-a7ae-424d-9ea9-15b6fe29de4d	3	All-in-one finance & e-commerce super app! Pay, save, shop seamlessly. Fast, secure. #BankAndShop	5	2025-04-21	POSITIVE	0.967050970	Security Concerns, Transaction Performance
427aa626-93a9-4faf-899a-d519952b4baa	3	it's a hestorical app. in the bank industry.	5	2025-04-21	POSITIVE	0.991591573	General Feedback
86b63f8a-6ca9-487d-beca-ed2f75ca888f	3	A game changer in Ethiopian digital banking fast, secure, and packed with services. Everything you need, all in one powerful app. A true leap toward financial convenience and innovation!	4	2025-04-21	POSITIVE	0.999604285	Security Concerns, Transaction Performance
fdcc34cc-699d-46ba-bcde-69f82e340aa4	3	easy &,simple to use	5	2025-04-21	POSITIVE	0.991526544	User Interface & Experience
ce9b538b-ea95-497b-ba79-45189131f057	3	Banking, but make it smart. Local solutions, all in one place. Smooth, fast, and actually saving time. Feels like the future. Love it!	5	2025-04-21	POSITIVE	0.999871492	Transaction Performance, User Interface & Experience
8697f174-08de-481a-8bbd-9619e90719e6	3	All in one, that is it 👌	5	2025-04-21	POSITIVE	0.991096377	General Feedback
82f5d5da-6678-4f6d-8d35-a5130983c919	3	, Dashen Bank Supper App is multipurpose, convenient, very attractive and Make life easier	5	2025-04-21	POSITIVE	0.998161972	General Feedback
f6f345d9-913f-4923-93af-c3430d22d4ac	3	very easy and flexible app.	5	2025-04-21	POSITIVE	0.999710619	User Interface & Experience
98a21365-53e3-42ef-8481-573c6ef8a181	3	I choose Dashen Bank Super Up since, it is easy to use & it has attractive features !	5	2025-04-21	POSITIVE	0.999450862	Feature Requests, User Interface & Experience
369c76a3-4250-4983-a479-859c8eed7007	3	dashen super app is simple faster and reliable.	5	2025-04-21	POSITIVE	0.999518633	Bugs & Reliability, User Interface & Experience
ffefe136-8fc9-4c3b-a4be-71adf835a4f0	3	Dashen Bank Super App is a game-changer! The user-friendly design, wide range of services, and smooth performance make it incredibly convenient for everyday banking. It’s fast, secure, and truly reflects the bank’s commitment to digital excellence. Highly recommended!	5	2025-04-21	POSITIVE	0.999581158	App Speed & Performance, Security Concerns, Transaction Performance, User Interface & Experience
353f56b2-61a0-4685-82b3-8007b602bdaa	3	The app keeps getting better with every update! Smooth performance, great UI, and top-notch security. Thank you for making banking so convenient!"	5	2025-04-21	POSITIVE	0.999307036	App Speed & Performance, Feature Requests, Security Concerns, User Interface & Experience
31577c85-64e5-4309-88f4-c1806697ca2d	3	this app is the most simply to use and secure safe i love it to use for any bank transaction	5	2025-04-21	POSITIVE	0.996440828	Security Concerns, Transaction Performance
22725963-a873-43c8-a711-f52ec4ce55b2	3	After i download the app recently had a smooth expriance, its user friendly, fast, and everything works as expected. keep up the good work.	5	2025-04-21	POSITIVE	0.999733865	Bugs & Reliability, Transaction Performance, User Interface & Experience
94163742-6825-440b-9f7f-71d8d9d036ed	3	An app with High performance and advanced features!	5	2025-04-21	POSITIVE	0.999583185	App Speed & Performance, Feature Requests
34df06ad-f6e9-46cc-b5f8-34baddb56b9b	3	It is a very user friendly, attractive user interface, full of useful features. I really encourage everyone to give it a try.	5	2025-04-21	POSITIVE	0.999751270	Feature Requests, User Interface & Experience
67218c11-6089-4be4-a26b-801ef1c9df87	3	Good actually , but it have to WORK when developer option is on 🙏	5	2025-04-21	POSITIVE	0.951991558	Bugs & Reliability, Feature Requests
117e220b-de40-4fd8-8d9e-15b95080d3a5	3	All-in-one convenience, From managing accounts to paying bills and shopping online and the chat banking is game changer, this app does it all seamlessly.	5	2025-04-21	POSITIVE	0.995653987	General Feedback
032354de-55bf-4025-989e-d3b8c5b0f7f0	3	I appreciate that Dashen Bank takes lifestyle services into account.	5	2025-04-21	POSITIVE	0.998039305	General Feedback
6974a44c-7969-4c5b-9ba0-3221ec5f0bb1	3	keep it up!	5	2025-04-21	POSITIVE	0.999847770	General Feedback
70756dbd-4ae2-40b8-b814-a6b322d9ea0b	3	amazing app really i loved it .that's why we say dashen bank is one stap ahead. It's the best mobile application that should be on every phone.	5	2025-04-21	POSITIVE	0.999803841	General Feedback
adb74398-cf2d-4c18-aff4-72412cfe8c51	3	very comfortable app keep it	5	2025-04-21	POSITIVE	0.999691367	General Feedback
bcf18a5b-5e9e-43f1-8dfa-d2fb31a8dcd7	3	it has clear detail information about the application so it helps customer how to use the app. and it is very easy to use and also app is secure.	5	2025-04-21	POSITIVE	0.999531627	Customer Support, Security Concerns, User Interface & Experience
43c462b0-3873-429a-ac91-ee72fbf4e070	3	I have been using the Dashen Supper app mobile banking app , and overall, I appreciate its features.However,I’ve noticed that when I turn on the developer options on my device, the app stops functioning properly. It would be great if you could look into this issue, as I often need to access developer settings for other applications . Thank you for your attention to this matter!	5	2025-04-21	POSITIVE	0.698274970	Account Access Issues, Bugs & Reliability, Feature Requests, User Interface & Experience
195107de-6ae9-4adf-bb09-e25c029d6706	3	easiness to use with fast response time	5	2025-04-21	POSITIVE	0.964725912	Customer Support, Transaction Performance
c2ef1fe4-8517-4a83-9f92-165c0e65540a	3	The new mobile banking application is a major upgrade! It’s incredibly user-friendly, with a clean and modern design that makes navigation simple and intuitive. I really appreciate how fast it loads and how smooth the overall experience is. All essential services like balance checks, transfers, and bill payments are eas y to find and use. The added security features give me peace of mind, and the app runs reliably without crashes or glitches. It’s clear a lot of thought went into the user experi	5	2025-04-21	POSITIVE	0.998897910	Bugs & Reliability, Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
d6059960-9967-4be6-a771-000dd2f1743a	3	As an Internal Customer, Dashen Bank SuperApp has greatly simplified my online banking experience. It's easy to use, allowing me to quickly check balances, transfer money and pay Bills. The app's advanced security features are highly secure, ensuring my data is well protected. The Three click, Chat Banking and IPS features have also given me a smarter experience. In deed Dashen Bank is always steping ahead!	5	2025-04-21	POSITIVE	0.998269796	Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
be79dbdd-63db-463c-9abf-a88387d6b07a	3	A truly impressive app — user-friendly and a game-changer in Ethiopian banking. The Dashen Super App stands out as one of the most innovative and convenient digital banking solutions in Ethiopia’s financial history. Smooth navigation, seamless features, and a wide range of services all in one place. Well done!	5	2025-04-21	POSITIVE	0.999791086	Feature Requests, User Interface & Experience
a852af36-a839-4285-b57d-2a0616e9e544	3	dashen bank super up has very fast and convenience and also it has contain more things on one app .I am very interesting to use dashen bank super up	5	2025-04-21	POSITIVE	0.997409046	Transaction Performance
62e4269a-6b6b-44ea-a4ec-07b21d8eda68	3	The Dashen Bank Super App has truly elevated my mobile banking experience. It's fast, user-friendly, and packed with all the essential features. The interface is clean and intuitive, making navigation easy even for first-time users. I also appreciate the added security features that give me peace of mind while banking on the go. Dashen Bank has done an amazing job with this app—it’s reliable, efficient, and always improving. Highly recommended for anyone looking for seamless digital banking!	5	2025-04-21	POSITIVE	0.999800980	App Speed & Performance, Bugs & Reliability, Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
a1a3c20b-aef3-474d-b045-c700d6fae1bc	3	A fantastic product!! keep the good work.	5	2025-04-21	POSITIVE	0.999884248	Bugs & Reliability
8f0e023e-152e-44a6-bba1-627c20d3e298	3	I am very impressed with the Dashen super app. It is user-friendly and operates efficiently. The budget and chatbot features are impressive, and all items can be purchased with just three clicks.	5	2025-04-21	POSITIVE	0.999748170	Feature Requests
23019863-9b22-4d7e-8271-49f6b96b1546	3	The Dashen Super App offers a quick and user-friendly experience, bringing together a variety of services, like budgeting, payments, airtime recharges, and more, all in one convenient platform. Its sleek design and intuitive navigation ensure effortless transactions. It's evident that Dashen Bank has carefully crafted the app to make everyday financial activities easier. A great choice for anyone aiming to streamline their digital routines!	5	2025-04-21	POSITIVE	0.998875201	Transaction Performance, User Interface & Experience
34f021e1-7017-44b8-b630-9d1dc75bf1db	3	Dashen supper App is the most useful app for our customers	5	2025-04-21	POSITIVE	0.998858690	General Feedback
f0c3ab74-087f-43bd-ab00-fe80b34e864a	3	it is the most amazing mobile app	5	2025-04-21	POSITIVE	0.999871731	General Feedback
6a9d5447-10d8-4f6e-abc9-7a3f0ba909f6	3	A Good and fast supper app thanks for dashen bank	5	2025-04-21	POSITIVE	0.999788463	Transaction Performance
02b8cc52-e23d-4b2f-b1e5-576c3560b859	3	Dear Users of the Dashen Bank Super App,I have been using the Dashen Bank Super App for a while now, and I must say—it’s truly a game-changer! The app is incredibly fast and reliable; I’ve never encountered any delays with my transactions. One feature I absolutely love is Chat Banking. It makes everyday tasks like checking my balance or transferring money as simple as sending a quick message. Also, the budgeting tool has been a huge help in tracking my spending and giving me a clearer	5	2025-04-21	POSITIVE	0.998981416	Bugs & Reliability, Customer Support, Feature Requests, Transaction Performance, User Interface & Experience
d5ae9239-54f2-4f66-9050-09c7aa0d84a8	3	Dashen Bank Super Up,use the app and makes your easy,fast,convinent.	5	2025-04-21	POSITIVE	0.988479793	Transaction Performance, User Interface & Experience
0e6b332e-9636-45c6-9467-3826506707f5	3	To join digital world use supper app and make your life easy	5	2025-04-21	POSITIVE	0.987091064	User Interface & Experience
63f87ad6-81fd-41ce-ac38-3fa11b0db062	3	best mobile banking application	5	2025-04-21	POSITIVE	0.999638081	General Feedback
3fcf360a-1a03-42d4-9c5e-7973b8671e68	3	This banking superapp is incredibly well designed. The design and appearance of the app and the overall experience I have when using the app is fantastic. The app is packed with features from banking to e-commerce all in one place.It even has a budget setting option which is super useful for managing my money. Everything runs smoothly and I love how convenient it has made my daily life. Huge Kudos to Dashen Bank. You are truly living up to the motto ''Always one step ahead." Keep it up!	5	2025-04-21	POSITIVE	0.999810755	Feature Requests, User Interface & Experience
9386a998-e31b-4518-b44f-8ddde2d80f82	3	best mobile banking application	5	2025-04-21	POSITIVE	0.999638081	General Feedback
b5a99318-f47b-46ae-8eef-db5c863f7958	3	I was really amazed by the idea of an e-commerce service on a banking app. This is what it means to be one step ahead. Please include all kinds of products in there as soon as possible.	5	2025-04-21	POSITIVE	0.998275042	General Feedback
b88fa79d-d681-4e41-8994-88bd84e50d24	3	this is what we expect to get service Dashen Bank always like his slogan	5	2025-04-21	POSITIVE	0.883536160	General Feedback
5bfe42a8-190a-44b6-8149-bbf58d0cbd08	3	Dashen SupApp is the most contemporary application, offering a great experience by enabling users to perform multiple tasks through a single platform—such as chatting with friends, transferring money, paying bills, and more. It is the first app of its kind in the Ethiopian banking industry, making it a remarkable opportunity for entrepreneurs working in app-based sales and software marketing. Good job, Dashen Bank!	5	2025-04-21	POSITIVE	0.999713957	General Feedback
996483eb-2fa8-4628-8c6f-059c82d9e883	3	Dashen Super App gives me an amazing convenience and makes life easy.	5	2025-04-21	POSITIVE	0.999823272	User Interface & Experience
99157497-80f6-4302-9987-a61fb2d35d8b	3	excellent mobile banking app	5	2025-04-21	POSITIVE	0.999817908	General Feedback
f539096f-c091-4424-9f29-8b1de5bcd809	3	Wow! like his name Super App...	5	2025-04-21	POSITIVE	0.998587370	General Feedback
0e4cf42b-eb22-4a9d-b2f9-e99cfc55dd8b	3	Dashen supper app is the most special. ይምቾቱ ይለያያል!!!!	5	2025-04-21	POSITIVE	0.992695808	General Feedback
8a3f027a-9427-4cd2-901b-6fff9659d994	3	convenient and fast	5	2025-04-21	POSITIVE	0.999617100	Transaction Performance
386c3a7b-275d-436c-a83b-af805c1cc4ac	3	Best- in-class app.	5	2025-04-21	POSITIVE	0.997480929	General Feedback
c8734abd-f137-417a-8c36-defbc982ec26	3	I really like this amazing application and Dashen Supper app that has made my life easier.	5	2025-04-21	POSITIVE	0.999717176	General Feedback
0dbc863f-6b31-45ac-b3b6-cc5aad65786d	3	amazing features, faster and easy to use	5	2025-04-21	POSITIVE	0.999868393	Feature Requests, User Interface & Experience
1351d527-0ebd-4fcb-9c37-ba6361ece17e	3	The Dashen Super App offers a modern, user-friendly experience that leverages the latest technological advancements to deliver a seamless e-commerce platform	5	2025-04-21	POSITIVE	0.998930395	User Interface & Experience
50117391-aa47-4c25-b9fa-bda3a861d922	3	I love it. one of the best mobile banking app in the banking industry	5	2025-04-21	POSITIVE	0.999868393	General Feedback
3f6bead7-080a-4031-8a18-49b6e7997c15	3	I love this app	5	2025-04-21	POSITIVE	0.999860883	General Feedback
4ca0ede2-4259-4cec-a958-71d3a7555715	3	no working for me hulum information asgebiche continue or accept yemilew button ayeseram my phone is Samsung A51	1	2025-04-21	NEGATIVE	0.998054147	General Feedback
1806822b-7539-4ec1-bb6e-52d6a9786ee0	3	waw no idea the best app.	5	2025-04-19	POSITIVE	0.992346406	General Feedback
79fabd48-7d9f-4be6-b0d2-ab35cec736eb	3	fast best app	5	2025-04-19	POSITIVE	0.999737561	Transaction Performance
1d457104-9dca-4518-9217-003ed78f3710	3	nice app ever	5	2025-04-17	POSITIVE	0.999838471	General Feedback
04461449-8fd8-4684-8b12-1bc3aee7f6f2	3	very disappointing app. Closes frequently and unstable in function	2	2025-04-17	NEGATIVE	0.999767721	General Feedback
d5552347-d7f6-4f91-ae8c-c33d16d0a8d3	3	Feature-rich? Absolutely. But the speed? Painfully slow. Seriously, is it communicating with a server on Mars or something?	5	2025-04-16	POSITIVE	0.999377310	App Speed & Performance, Feature Requests, Transaction Performance
e7057ab4-ff08-40bd-8c50-1d67ce4f5058	3	The Dashen Super App delivers a remarkably fast, highly secure, and exceptionally user-friendly experience, establishing it as a leading application in its category.keep it up and stay ahead Dashen Bank.	5	2025-04-14	POSITIVE	0.999668241	Security Concerns, Transaction Performance
71670dbe-1de7-4384-822f-cc47f95185d8	3	So far so good! their in person customer service is amazing 👏	5	2025-04-14	POSITIVE	0.999873877	Customer Support
a7b719d1-4b74-4a60-b7ed-19b62e900168	3	The app is very backward and doesn't always work. If it works three hours out of 24 hours it's great!😥	1	2025-04-14	NEGATIVE	0.988517165	Bugs & Reliability
0096a509-2709-4211-b0f4-626d3d6a8dbb	3	It's bad for the connection and too many days are it that not working	1	2025-04-12	NEGATIVE	0.999684095	Bugs & Reliability
3371e672-aa09-45c0-9ae6-ec3d4e3e827a	3	The app is not working properly, I have been using it.	1	2025-04-10	NEGATIVE	0.999799430	Bugs & Reliability
1048668b-fdd7-488f-bd6b-83f3586915eb	3	it is very good app	5	2025-04-10	POSITIVE	0.999869943	General Feedback
87355423-1404-4beb-b08d-7cad5d4b4f08	3	I had a disappointing experience with Dashen Bank's Super Up service. The app is very slow and takes forever to load during transactions, which is incredibly frustrating. Additionally, it doesn't generate receipts for any transactions, making it difficult to keep track of my expenses. I also reached out to customer support, but the response time was longer than expected. Overall, I was hoping for a better experience, but I find the service lacking and in need of improvement.	2	2025-04-09	NEGATIVE	0.999545157	App Speed & Performance, Customer Support, Transaction Performance, User Interface & Experience
c7cdf3f1-a374-470d-80be-8d7bc00d360f	3	It's slow to send OTP. it's not reliable. It crushed many times. It needs improvement in many ways	1	2025-04-07	NEGATIVE	0.999729455	Account Access Issues, App Speed & Performance, Bugs & Reliability, Feature Requests, Transaction Performance
aa31a976-cb24-4df5-8f7c-6fcb238d9327	3	This is the worst mobile banking experience I’ve ever had. It doesn’t work when you need it, and it randomly updates itself without warning. You can’t make transactions whenever you want. It’s a nightmare for anyone who relies on this as their main banking option, especially those with a lot of money in their account. I’m lucky I’m not one of them, but still, it’s infuriating not being able to access your money when you need it."l	1	2025-04-07	NEGATIVE	0.999761403	Account Access Issues, Bugs & Reliability, Feature Requests, Transaction Performance
c23b473c-4144-4bea-98ae-172df77c97b1	3	I have experienced on using the app of Banks in Ethiopia, this Dashen sup is like old version of the applications for using. I gave 3 star for it's very low speed while login and processing	3	2025-04-07	NEUTRAL	0.998691142	Account Access Issues, App Speed & Performance
cc85c5a4-aa62-4817-b48d-e4fe94daa748	3	proud by dashen bank	5	2025-04-06	POSITIVE	0.999866605	General Feedback
a928485d-6535-4782-8ff5-d4f0d401957a	3	best of best	5	2025-04-05	POSITIVE	0.999749601	General Feedback
4eb71bb5-9546-4eb8-9115-35dbb8ec6a84	3	This app is not working unless you turn off developer mode on your phone. So it takes your rights to just use it.	2	2025-04-04	NEGATIVE	0.999444783	Bugs & Reliability
0712b546-88dd-4f2b-a977-87ccd827841d	3	real super up	5	2025-04-04	POSITIVE	0.999828219	General Feedback
971db897-312b-4560-998a-aaf867c9aba0	3	it's very disappointing fix it as soon as possible not expected from dashin bank fix it	1	2025-04-04	NEGATIVE	0.999361813	Bugs & Reliability
86d03988-70ec-4dfa-a24c-9fb492fd62d7	3	why dashen bank workers hidden my ATM Card 🏧?it's a big problem to me	5	2025-04-04	POSITIVE	0.999374807	Bugs & Reliability
0af7f66d-ac1b-46c8-866a-afbed0f5ed57	3	why does it ask me for both pin and opt even the opt is touch let alone both	2	2025-04-02	NEGATIVE	0.995876908	General Feedback
8cc8db7d-a995-475f-a326-f77644f05262	3	it is best app easy to use	5	2025-04-01	POSITIVE	0.986411035	User Interface & Experience
0849d6e7-3240-430d-9fcf-d6be127a5ac0	3	It is very easy to use and powerful application.	3	2025-04-01	NEUTRAL	0.999765575	User Interface & Experience
f586fd46-d883-4970-8ae3-dfded1df6aa1	3	this apps have a good feature but but some features like developer mode turn off irritate user	3	2025-04-01	NEUTRAL	0.997230589	Feature Requests
b7ba023c-3a56-4fa5-8f30-8fcce982b8ef	3	Excellent UI/UX and beyond Banking services👍👍	5	2025-01-30	POSITIVE	0.999820650	User Interface & Experience
25ffdf6f-8804-4598-b5fc-af32ebbf6ae6	3	Very impressive interface with best security feature and user friendly app.	5	2025-01-15	POSITIVE	0.999798834	Feature Requests, Security Concerns, User Interface & Experience
98ca9bca-5c01-4997-b80a-b8a53481b391	3	This is not only a mobile banking app, it is beyond that. We will access our account easily, we are able to get many information easily here. i.e. exchage rate. We are able to chat with others, we are able to budget, we are able to transfer to other bank and within Dashen. we are able to access many accounts in a single app, we are able to pay bills in QR scan, we are able to make payments and order delivery items here in a single app. #Always one step ahead.	5	2025-03-31	POSITIVE	0.990130126	Account Access Issues, Transaction Performance
1181718c-4e5c-4181-a943-53e579042bd6	3	wallahi very fantastic Bank	5	2025-03-31	POSITIVE	0.999818742	General Feedback
afa8745f-7dad-4bdd-9e5b-0d7c19057f9e	3	Waw, It's amazing app. thank you Dashen Bank.	5	2025-03-31	POSITIVE	0.999869823	General Feedback
1124e4c7-b545-49aa-be67-4284f2b39eeb	3	I’ve been using the Dashen Bank Super App for a while now, and it’s been a game-changer. The app is super fast and reliable—I’ve never had an issue with transactions being delayed. One of my favorite features is the chat banking, which makes it so easy to do things like check my balance or transfer money just by typing a quick message. The budgeting tool is also really useful. It helps me keep track of my spending and gives me a clear picture of where	5	2025-03-28	POSITIVE	0.999173939	Bugs & Reliability, Customer Support, Feature Requests, Transaction Performance, User Interface & Experience
008fc909-9a69-40fd-9eee-cce9d3144fe9	3	Very good app that like it too. B/c it is very fast and easy to use.	5	2025-03-26	POSITIVE	0.999789178	Transaction Performance, User Interface & Experience
122c3323-11c7-4f8e-a842-57272e0b80e3	3	too slow to use.	1	2025-03-26	NEGATIVE	0.999727666	App Speed & Performance, Transaction Performance
c793fb73-c44b-4e4b-99fc-9af551261b68	3	the worst app in the market only good ui	1	2025-03-22	NEGATIVE	0.999772131	User Interface & Experience
d91ffd3d-5e49-4bee-9cea-553bbc87a371	3	በጣም ቅልል ያለ አፕ በርቱልን ለአጠቃቀም ምቹ	5	2025-03-22	POSITIVE	0.920040667	General Feedback
59403fd9-76ed-416f-85c3-f63b3a664bdc	3	thanks for all digital transaction	5	2025-03-21	POSITIVE	0.999455035	Transaction Performance
48ca44ba-ef5d-4023-84c2-20fa95be75d5	3	This app is not supporting smart phones that have old android version and so it is none inclusive. At the same time the amole lite is not working properly and once you reached to maximum otp trail mistakes due to network or other errors like stacks , you will be tied up to make Transactions. Ohh... tired!!!!!	1	2025-03-20	NEGATIVE	0.999758780	Account Access Issues, Bugs & Reliability, Transaction Performance
07855205-ebce-419e-ab28-34d0a7b7373e	3	it's Be Come Busy &not working good	1	2025-03-20	NEGATIVE	0.999611318	Bugs & Reliability
acab324e-1c06-4be4-bfb4-093e0d0db46f	3	I wanted to share some concerns about your Supper App. It appears to be experiencing reliability issues and isn’t performing as expected. I hope this can be addressed soon to improve the user experience. One star 🌟 for now.	1	2025-03-19	NEGATIVE	0.996764064	Bugs & Reliability
043ba0ce-d496-4f1c-bcf7-ae23c275d5a6	3	best ever digital banking sector essay for understanding ,smart and convince for using	5	2025-03-19	POSITIVE	0.999654651	General Feedback
d356a5b4-5cb2-433f-aac3-1e077cea0a90	3	good and latest	5	2025-03-18	POSITIVE	0.999856114	General Feedback
d9e806c8-38ac-4376-8317-16692333e2dd	3	The best App of all	5	2025-03-17	POSITIVE	0.999863386	General Feedback
e814d6c2-d350-4b7b-9b58-b1f387d987ac	3	Worst app ever	1	2025-03-15	NEGATIVE	0.999780357	General Feedback
a02f3622-dc96-4c0a-9509-83f06407c209	3	This app is the most unreliable mobile banking application I have ever used for transaction, it is very late, non-responsive and full of bugs. Its is very disappointing. It is just inconvinient, and not user friendly and compatabke at all !!!!!!	1	2025-03-14	NEGATIVE	0.999577343	App Speed & Performance, Bugs & Reliability, Transaction Performance, User Interface & Experience
b2730fe5-571b-4fcd-8a66-24f872b7b8bb	3	The app is good but it has no USSD option	4	2025-03-13	POSITIVE	0.995234668	Feature Requests
a34ea67e-01a2-487d-b414-b2d41d0572a2	3	I have used many mobile banking and also tellebir and mpesa nothing come close to this app. Well done Dashen indeed one step a head. A lot of cool features that amole hasn't the receipt and the account statement is superb for me. I hope you add more integrated small apps to.	5	2025-03-12	POSITIVE	0.998498082	Feature Requests
3a7cd664-6247-442c-b273-a913dc7cc30b	3	The app is good but it ask update every week so tiring	2	2025-03-11	NEGATIVE	0.995179534	Feature Requests
d797e094-d6fb-4ead-b33a-980b9c5fb93d	3	It good and easy to use	5	2025-03-11	POSITIVE	0.999875069	User Interface & Experience
2407d488-1b89-4b2b-a7be-0fa9822dbaaf	3	በጣም አሪፍ መተግበሪያ ነው ። አመሠግናለሁ ።	5	2025-03-10	POSITIVE	0.920040667	General Feedback
a9b0db48-0dae-4e29-9406-dfc9b52cd466	3	Greately improved since it was released! I really like the budget and expense tegistration feature. For ATM or POS withdrawals, it is not possible to account these expenses, even if it is visible on the transactions window. If that can be worked on, it will be improve so much!!	5	2025-03-10	POSITIVE	0.966667950	Feature Requests, Transaction Performance
9f23d18f-937a-44d7-8e52-9808841d887f	3	Wow Excellent app	5	2025-03-08	POSITIVE	0.999844313	General Feedback
82441d3e-7555-4c97-a5d3-aada8ee43dce	3	Nice app but i experience some issues with others banks transfer it keeps saying account is not exist most of the time.	4	2025-03-08	POSITIVE	0.998352289	Bugs & Reliability, Transaction Performance
7126c191-fb47-4ed3-ace7-3a6784d5a298	3	Add the option to send money to any telebirr account like amole does.	3	2025-03-08	NEUTRAL	0.995681882	Feature Requests, Transaction Performance
98dfa0bb-fbf6-4852-bf93-51e83ef6c1a9	3	no one dashen yichlal	5	2025-03-07	POSITIVE	0.984247208	General Feedback
739dab0d-35eb-44e1-b4a7-245712593631	3	In short ! I'm so proud of this app developers for their highest professional of developing. Thanks	5	2025-03-06	POSITIVE	0.999852300	General Feedback
212c339b-807a-4c89-b5b1-cb9ab844f676	3	The speed is too slow. Need some improvements.	2	2025-03-06	NEGATIVE	0.999793589	App Speed & Performance, Transaction Performance
c7dccd52-ade3-4496-a9d1-f52e3af60664	3	I wish dark mode feature is add as an option but it's good app	5	2025-02-27	POSITIVE	0.999801338	Feature Requests
74f35e55-6ee7-4d01-bc8a-e5b3c92a6b70	3	Super Up is the ultimate digital banking app, living up to its name with speed, efficiency, and innovation. Designed for a seamless experience, it offers lightning-fast transactions, top-tier security, and effortless financial management. With Super Up, banking has never been this smooth, smart, and super!	5	2025-02-26	POSITIVE	0.999526024	App Speed & Performance, Security Concerns, Transaction Performance
ce7153a9-77e9-41b8-9b70-ab9e15ef3fca	3	A lightweight,catchy and smooth app	5	2025-01-15	POSITIVE	0.956616700	General Feedback
759ccebb-dcdd-4f4b-bc9b-7a7453191e52	3	The Dashen Super App is a game-changer in digital banking, offering a seamless and convenient experience. With its user-friendly interface, fast transactions, and a wide range of financial services, it simplifies banking for customers. Features like bill payments, fund transfers, mobile top-ups, and loan applications make it an all-in-one solution. Plus, its security measures ensure safe and reliable Experiance effortless banking	5	2025-02-26	POSITIVE	0.994626105	Bugs & Reliability, Feature Requests, Security Concerns, Transaction Performance, User Interface & Experience
804dc621-491a-4645-abf9-0b5db917406a	3	It has good feature. But, it is Very Slow! difficult to pay or receive. The Speed should be improved, else I didn't recommend.	2	2025-02-24	NEGATIVE	0.997153759	App Speed & Performance, Feature Requests, Transaction Performance, User Interface & Experience
3137ba80-d819-4ee4-bbfd-999fcc02f6f7	3	አፕልኬሽኑ አሪፍ ሆኖ ሳለ ቴሌብር ወደራስ ብቻ ለምን ሆነ እንደ ድሮው ለሰውም መላክ ቢቻል	4	2025-02-22	POSITIVE	0.952843368	General Feedback
347d1005-af56-400b-95e6-b48e96816565	3	Wow amazing app	5	2025-02-21	POSITIVE	0.999851346	General Feedback
cf3081c5-a6d9-4481-80de-c990cf6b9784	3	best platform... Please avoid otp	5	2025-02-21	POSITIVE	0.922895610	Account Access Issues
e13bd7ee-f36d-422a-9341-7e55733d5971	3	Super smart app.	5	2025-02-18	POSITIVE	0.999798477	General Feedback
88d57ce9-5ba3-4d52-aaba-18c92e2cbbc8	3	I don't know what happens but the application is not send verification pass code you should fix that	1	2025-02-16	NEGATIVE	0.997372150	Account Access Issues, Bugs & Reliability, Transaction Performance
30cdf34a-c7e8-4573-b51d-920e576eb5a9	3	This app doesn't work on my phone my phone is Samsung Galaxy s7 android version 9 All other financial apps work like telebirr CBE M_pesa...	1	2025-02-14	NEGATIVE	0.997433722	Bugs & Reliability
62a49d95-3dee-4d62-9b5a-cceff329af48	3	Dashen Super app is secure, very easy to use and has more services uniquely like budgeting, chat, IPS...	5	2025-02-14	POSITIVE	0.956214547	Security Concerns, User Interface & Experience
f4f64316-a28a-464b-aba8-c9279ef1fa1f	3	Amazing and user friendly supper app and looking forward the additional features	5	2025-02-14	POSITIVE	0.999848604	Feature Requests, User Interface & Experience
7a363704-a9b9-4805-99ce-288543537fc5	3	it's amazing app i have seen ever	5	2025-02-13	POSITIVE	0.999857426	General Feedback
15e7f782-ce40-4927-a035-f0f73b2b5631	3	One star deducted for not to able to transfer to telebirr.	4	2025-02-13	POSITIVE	0.990380824	Transaction Performance
40ab34a6-0027-4019-b565-824e578f79c3	3	ጥሩ ነው ግን በደንብ ሊሸሻል ይገባል	4	2025-02-13	POSITIVE	0.904695213	General Feedback
c6d8d045-ccb6-427d-9e8b-3b8937445a28	3	ፍጥነቱ በጣም አሪፍ ነው! እና ቀለል ያለ ነው ! ነገር ግን ተጨማሪ ወደ ቴሌብር ኤጀንት መላኪያ አፕ ቢካተትበት ጥሩ ነው::	4	2025-02-12	POSITIVE	0.916149676	General Feedback
2b6f2fa5-b5ce-4c1c-adc5-b21429979ae7	3	Keep up the good work and pleas add water and electric utility payment	5	2025-02-12	POSITIVE	0.998676121	Bugs & Reliability, Feature Requests, Transaction Performance
d98af23a-58c4-48d9-beaf-b4767f97b769	3	The app missed some important features 1. It does't show recent transactions 2. Transfer to Telebirr limited to own telebirr 3. The statement does't show running balance	2	2025-02-11	NEGATIVE	0.999589145	Feature Requests, Transaction Performance
a18d6971-00fe-4bc1-b303-7c47e6ab410b	3	Simple, Fast and Easy ⭐⭐⭐🎉	4	2025-02-10	POSITIVE	0.999700904	Transaction Performance, User Interface & Experience
9710f0a3-e133-4969-874b-2316715d90b7	3	የሚገርም aplication ነው, ነገር ግን ብር ትራንስፈር ሲደረግ ያለ ፒን መሆኑ risk አለው ሁሉ ጊዜ የ ትራንስፈር መደምደሚያ ፒን መሆን አለበት!!!!!!!!!!!!:: አሱ ቢስተካከል 5 star አስከዛው ግን 4 ሰጥቻለው::	4	2025-02-09	POSITIVE	0.605868399	General Feedback
e0a1d8a1-df15-4a9b-8e99-1b596bd97fb7	3	Baankii daashin baankii hudna galeessa galatoomaa isinii woliin jirra Godina jimmaa magaalaa Aggaaroo irraa Muaz Abamecha Abamilki	5	2025-02-07	POSITIVE	0.996147275	General Feedback
88374fe2-44b0-4122-9f7c-1bd98b21108e	3	It doesn't work	1	2025-02-07	NEGATIVE	0.999781311	Bugs & Reliability
631604e5-d2d7-4cfc-8eed-174a736a28ad	3	#Dashen Super App; Super easy to use, secure, and fast transaction. Love it!	5	2025-02-07	POSITIVE	0.999716341	Security Concerns, Transaction Performance, User Interface & Experience
f1f64244-c9b5-4cbe-9844-7d101beed08c	3	I tried the new Dash Bank Super App today, and it's amazingly easy and fun.I recommend you download and use it. You really like it	5	2025-02-06	POSITIVE	0.999848962	User Interface & Experience
f41b6dcb-0e54-468a-bba2-f5db6c7cb66d	3	Gud app kegza ga mezmn endze new aind ermjh kedme nachu hlam	5	2025-02-06	POSITIVE	0.985221803	General Feedback
da386798-3db3-4e83-96b1-1444618f9e9b	3	Good app, bad security	3	2025-02-06	NEUTRAL	0.890978217	Security Concerns
ede1dfcb-1c62-403f-8d8c-0cebc9f600ca	3	On Transaction page only show sent Transaction. Try to include received transaction.	4	2025-02-06	POSITIVE	0.995695829	Transaction Performance
67026e5c-4628-48b1-90a6-1c33dcec20be	3	I loved it	5	2025-02-05	POSITIVE	0.999880910	General Feedback
6d543e34-b5a0-4314-b1ef-53a6d6e8ad36	3	አሁን ገና አንድ እርምጃ ቀደማችው	5	2025-02-04	POSITIVE	0.883213103	General Feedback
d1c22383-7e9c-4130-923f-b69817109b3b	3	I am so thankful for having this best app Dashen one step ahead	5	2025-02-04	POSITIVE	0.999471128	General Feedback
ea5aac1f-644e-4166-86d6-d8a144d5ad77	3	Not good this app	1	2025-02-04	NEGATIVE	0.999779046	General Feedback
6b838917-bb83-44e6-8ebf-c052a041d168	3	Excellent app ever but it needs improvement on speed and transaction lists	1	2025-02-03	NEGATIVE	0.990936816	App Speed & Performance, Feature Requests, Transaction Performance
5bd1a772-544e-4524-a5bc-aa7b5d86f3fd	3	It does not work functional ,	1	2025-02-02	NEGATIVE	0.999781191	Bugs & Reliability
030ff419-ef33-4724-afcc-3ca530dab0f5	3	all of dashen bank customers use the application it is good to use	5	2025-02-01	POSITIVE	0.995803773	General Feedback
faee3a15-6fa8-46e8-9196-55a9a99e7a7e	3	All good we need more	3	2025-01-31	NEUTRAL	0.999653816	General Feedback
e6ac68ac-bbdb-43ec-9987-081c36a2ca8a	3	Dashen super app is easy to use, fast and robust	5	2025-01-31	POSITIVE	0.999306798	Transaction Performance, User Interface & Experience
173957b9-fba2-4a7e-b9bc-ec34bbe0b52a	3	it was amazing app.....thank you dashen bank....	5	2025-01-30	POSITIVE	0.999860883	General Feedback
d2f0062a-2be2-4fac-81d9-f9dd2a8f9a27	3	Dashen bank super app for easy life.	5	2025-01-30	POSITIVE	0.772307098	User Interface & Experience
88f31adb-275f-4f6c-90d1-94bbdbebe22b	3	Send to oher bank የሚለዉ ዉስጥ ገብተን ወደ addisinternational bank ለመላክ አይሰራም ሁለተኛ ደግሞ ወደ cbe birr ለመላክ account number ይጠይቃል ሞባይል ነበር ነዉ መጠየቅ ያለበት ይመስለኛል	2	2025-01-29	NEGATIVE	0.994586110	Transaction Performance
cf843f50-d9bc-4542-a69d-da3620c76fa5	3	mobile banking to the next level	5	2025-01-28	POSITIVE	0.940987885	General Feedback
567e36a0-fcd9-486a-88aa-11f24f5b1af0	3	The first 3 star review is me	3	2025-01-25	NEUTRAL	0.996776760	General Feedback
d7b6c9eb-fb71-4fb5-bd27-0d4387aea517	3	Is not working	1	2025-01-25	NEGATIVE	0.999780953	Bugs & Reliability
ed4347fd-ddc7-401d-91ae-5fdd82dcf218	3	Fast, reliable and user friendly. Amazing chatting features. Keep it up! Always one step ahead!	5	2025-01-24	POSITIVE	0.999864459	Bugs & Reliability, Feature Requests, Transaction Performance, User Interface & Experience
9b75d0d7-9840-4c6c-bf0f-5d0816e7644c	3	This app is literally the best thing ever The chat banking is so easy just text and it’s done Super smooth, fast, and honestly a life saverIf you haven’t downloaded it yet you’re missing out big time	5	2025-01-23	POSITIVE	0.960885882	Transaction Performance, User Interface & Experience
ee7cd878-3cf8-41b7-b8e9-e30c5db69704	3	I only see white page	2	2025-01-23	NEGATIVE	0.991023898	General Feedback
143ca385-df65-48dc-8339-c870d3fce650	3	Excellent banking app for all your needs! Who needs a physical branch when you can use Dashen Bank Super App Instead! I've never had an issue with anything that Dashen Bank Super App haven't handled swiftly and resolved to my satisfaction and above I don't often write reviews but this is an app/bank that I would highly recommended to everyone 💯 👌👍	5	2025-01-22	POSITIVE	0.999515057	Bugs & Reliability, Feature Requests
4497c57a-d9e7-4447-87d8-37a117332356	3	Fastest and easy to use	5	2025-01-22	POSITIVE	0.999711454	User Interface & Experience
0a6d9811-4c0c-4ac6-9533-0f71215e1a9e	3	Exellent app with exellent banking system and exellent bank ever	5	2025-01-21	POSITIVE	0.957995951	General Feedback
513a636f-9b72-4092-bae7-33352916e8e5	3	Amazing app to use as usual! But why option of transferring to Telebirr and M pesa which was available on Amole app is omitted?? Dasheen is my favourite keep it up.	4	2025-01-20	POSITIVE	0.971175849	Feature Requests
495ede3b-26fc-497e-8409-7717affaf3f6	3	Needs some improvement	5	2025-01-20	POSITIVE	0.998008668	Feature Requests
0c12111e-1b8a-461f-966b-125e58c6075e	3	Amazing super app	5	2025-01-19	POSITIVE	0.999865890	General Feedback
80794c1d-2e9b-4fdf-88e6-c4bee65e5f94	3	I hope it will be better than amole	5	2025-01-18	POSITIVE	0.996970177	General Feedback
33c317d1-6366-4c33-ab00-e35488a26e2a	3	Wly Super App ilove it ❤️ 😍 💖 💕	5	2025-01-18	POSITIVE	0.687765777	General Feedback
c24e4faf-305a-47b2-bf62-94319d984e61	3	Dashen yichalal. Ewnetem one step a head	5	2025-01-17	POSITIVE	0.983262539	General Feedback
40cc8813-3573-4cc3-bbba-3cd722362717	3	It has a Good performance but need more upgrade for more performance like when we login account not be fast balance show other thing looking good. Carry on. Thanks so much for Greatest service	4	2025-01-17	POSITIVE	0.996793330	Account Access Issues, App Speed & Performance, Transaction Performance
42006315-95d0-4ccb-9a5c-a7ac1053d977	3	It is a very wonderful work that has saved its time. That is why it is "Always one step ahead!"	5	2025-01-17	POSITIVE	0.999878049	Bugs & Reliability
b969925e-d6eb-4620-9bb2-6a7868cc4d57	3	“Life-changing!” I can’t imagine going back to traditional banking after using this app. It’s so convenient.	5	2025-01-17	POSITIVE	0.962541521	General Feedback
21885f99-6abd-43d1-8bda-9b9c135a01ed	3	The most good app and easy	5	2025-01-16	POSITIVE	0.999863148	User Interface & Experience
6653632f-1bf6-4a52-8cf4-40b9d21e88f2	3	Excellent and user friendly App. Excellence is what makes you always one step ahead. Dashen Bank, Always One Step Ahead !!	5	2025-01-16	POSITIVE	0.999866009	User Interface & Experience
2a6d4b63-244e-4615-a272-6edd9860e6fb	3	Proud to be dashen family . Shout out to the serial entrepreneur 👏	5	2025-01-16	POSITIVE	0.999869704	General Feedback
ad65cb66-1fe6-451f-bb15-a2fe1bcadd15	3	First ATM in East africa ⭐️⭐️⭐️⭐️⭐️	5	2025-01-16	POSITIVE	0.996080458	General Feedback
0883eae9-8a3c-4c12-9c99-ce6945b4538b	3	Better Move to catch the competition up👍	5	2025-01-16	POSITIVE	0.997310162	General Feedback
8f9c201f-2c2d-4e40-a5ff-adeca0d1f040	3	Great job my home, my bank.	5	2025-01-16	POSITIVE	0.999863744	General Feedback
90d2468b-101a-4006-ae49-d07185b49594	3	Always one step ahead! What a masterpiece.	5	2025-01-16	POSITIVE	0.999870896	General Feedback
b6417689-7817-4d01-9dac-77337118d8a5	3	Great App Well done Dashen Bank	5	2025-01-15	POSITIVE	0.999773562	General Feedback
5fc203ce-67c5-449e-a0a3-afdc1bb0c04d	3	I love it but it has bugs during confirmation of password! So, please make it functional	5	2025-01-15	POSITIVE	0.994668007	Account Access Issues, Bugs & Reliability
c6e938b5-244e-472c-ade8-811e02984c65	3	Always one step forward	5	2025-01-15	POSITIVE	0.999639630	General Feedback
de496d31-86a5-4051-b76d-4e91d882f5f5	3	It's great! But it will be advanced if you include a caption that allow customers to transfer to Telebirr account. Dashen Bank, "ኩሉ ግዜ፡ ሓደ ስጕሚ ቀዳሚ።" (Always one step ahead!)	4	2025-01-15	POSITIVE	0.999660373	Transaction Performance
7340ad46-01ce-4b28-9d5a-680a7ea387b2	3	Small size with vast features and functionalities.	5	2025-01-15	POSITIVE	0.998146176	Feature Requests
11dc9c6e-53cc-4396-a152-dca400b39f11	3	Amazing app 👏 👌 Dashen bank one step a head	5	2025-01-15	POSITIVE	0.999829054	General Feedback
02f78b78-255a-4e0b-9cca-5be6f627903d	3	It has a great application features from the beginning. I'm glad to use it even I haven't used it yet because I haven't activated my account yet. But it's simple, comprehensive, full of information, and fast. በርቱ ዳሸኖች: The super app has impressed me more than I expected.	5	2025-01-15	POSITIVE	0.999498963	Feature Requests, Transaction Performance, User Interface & Experience
cf0ccbab-5c43-4fe3-99ed-655849b5a2fe	3	Dashen Bank Always One Step Ahead!	5	2025-01-15	POSITIVE	0.999688268	General Feedback
a350ad02-f499-4f8a-bb2a-4c1f887e8b71	3	U can't create account	1	2025-01-15	NEGATIVE	0.998442948	General Feedback
a83a5e1d-f26b-4fd1-95ec-6c7d151049f0	3	Really super app... so seamless and with a nice user interface .. we are proud of you dashen bank ...	5	2025-01-15	POSITIVE	0.999861360	User Interface & Experience
d822baf8-da6c-49f0-896b-8e9bdca59098	3	We will see it	2	2025-01-15	NEGATIVE	0.999863029	General Feedback
f86b4755-e62d-4f13-86f5-adf5bdf4105a	3	Always one step a head!	5	2025-01-15	POSITIVE	0.998132288	General Feedback
ac0cc36a-ecb8-4a17-b329-1f66502b5336	3	It is so far so good it has a unique features than telebirr good job Dashen	5	2025-01-15	POSITIVE	0.999828219	Feature Requests
af4b6cdd-64dd-4415-8e6a-0bfcf4edb631	3	Yea , it's a good idea to make it with the bank name, it will help for the bank easily to find the application, and customers can easily downloed and use the product. I wish all the best for Dashen bank initiative.	5	2025-01-15	POSITIVE	0.880051613	Customer Support, Feature Requests
9dca9330-32a2-486a-85f9-287a9dc5cd38	3	This is My Bank!	5	2025-01-15	POSITIVE	0.996809542	General Feedback
39ba91c9-38f6-43c0-bccc-62ca70a7edf9	3	Dashen Bank Always One Step Ahead!	5	2025-01-14	POSITIVE	0.999688268	General Feedback
bdfd757f-9d41-450e-a765-96219cf37841	3	Truly, db => AlwaysOneStepAhead !!	5	2025-01-14	POSITIVE	0.999345601	General Feedback
0a694319-1c5e-4541-9a4c-048c16dcbf4f	3	ALWAYS ONE STEP AHEAD	5	2025-01-14	POSITIVE	0.999769986	General Feedback
e29fbbc4-6bf3-4ee8-82c7-bec09e75ae63	3	oh nice!!! i wish it's very nice app	5	2025-01-14	POSITIVE	0.999634981	Feature Requests
10271bb9-ee08-42d4-9c57-b33258ad1358	3	Really the app looks like amazing. I can't wait to activate in the morning.	5	2025-01-14	POSITIVE	0.999701083	User Interface & Experience
89e162a6-9481-4780-9219-e1ff91ca232e	3	Applause 👏 Dashen Bank. One of the best super app inorder to pay easily and securely. One step a head.	5	2025-01-14	POSITIVE	0.999760926	General Feedback
a3c3a7da-4b63-44b1-9440-72256216045d	3	Wow Dashen Super App 🚀🚀	5	2025-01-14	POSITIVE	0.999432385	General Feedback
65c61ceb-e76c-4142-8672-50399f048fc6	3	All in One	5	2025-01-14	POSITIVE	0.998805165	General Feedback
7bb4cd6c-66c5-4ac6-bae7-4231c6e67f3d	3	The best Banking app I have ever seen	5	2025-01-14	POSITIVE	0.999763429	General Feedback
30ebc149-910a-41be-ac92-fd4e9e002fd1	3	It looks good and simple to use	5	2025-01-14	POSITIVE	0.999818981	User Interface & Experience
a3e9f625-d8f9-47bb-aa87-6ddadf35b89e	3	App That makes Difference!	5	2025-01-14	POSITIVE	0.999833822	General Feedback
871a74e7-f701-4c92-83e1-d6bc659a397d	3	Faster and userfriendly	5	2025-01-14	POSITIVE	0.919928312	General Feedback
cad7278a-410d-4eed-805d-d1a942009cc3	3	Waw Great and innovated,user friendly, always one step ahead	5	2025-01-13	POSITIVE	0.999770582	User Interface & Experience
b92aaec0-99b9-49ac-ae55-03c04a52aec5	3	It's Best waww 🙏	5	2025-01-13	POSITIVE	0.999841452	General Feedback
7ed6c112-916c-44c2-b0ae-af2ff9d8c58f	3	Always one step ahead	5	2025-01-13	POSITIVE	0.999769986	General Feedback
60f2b9c0-9fc9-49d9-97c8-7c1f9aca05fe	3	Like Me, I Hope It Works Better Than Before.	5	2025-01-11	POSITIVE	0.997132421	Bugs & Reliability
55064e22-2912-4959-bc98-f3ad16b56c12	4	Easy app to use	5	2025-06-03	POSITIVE	0.993706286	User Interface & Experience
70cc511a-2d56-450e-94e3-ec98baf07354	4	Today I can't even open the app. Any advice please.	1	2025-05-31	NEGATIVE	0.999407053	General Feedback
43798de2-5456-4d5c-a2ea-ddb3827e1d1d	4	It doesn't work at all. I couldn’t even activate the app because the app couldn't be given permission, its not that i blocked permission, but because the option to enable permission is inactive (can't be turned on or off by default). I was told by the branch to use USSD because the app can't be activated.	1	2025-05-11	NEGATIVE	0.999348342	Bugs & Reliability, Feature Requests
be8719f8-87df-4e82-b98d-dc7292219452	4	The app is barely working , can't do transactions via mobile.	1	2025-05-05	NEGATIVE	0.999554932	Transaction Performance
70ae2cb4-f7b1-4e8d-87b0-c6bd32a946da	4	hi.....i am the custemer of enat bank ......in digital wallet....to link money transaction with global and all over world.....thanks by your good connect with my account.....	2	2025-03-01	NEGATIVE	0.998839676	Transaction Performance
be6c9b30-39b8-48e4-befc-1daeaa8d4604	4	This is the boring app I have ever seen it didn't work if I delete it and install I can't login know	1	2025-02-28	NEGATIVE	0.999771535	Account Access Issues, Bugs & Reliability
c1b124ef-82cc-4954-b677-af6aac4a8032	4	Very good app	5	2025-02-22	POSITIVE	0.999867558	General Feedback
c8575c24-c220-439f-a51c-d626d40b832f	4	The application doesn't work properly after i updated this apk what is the wrong Please ?	2	2024-12-11	NEGATIVE	0.999796689	Bugs & Reliability
dde6570b-5ecf-443d-a02b-0ccb57ae44a6	4	This app isn't functional on my phone at which the problem is found ? Either the App selects some types of phone or sth.	2	2024-12-11	NEGATIVE	0.999558389	Bugs & Reliability
2fe2355a-49d3-4ccb-8b57-59aa7cb8d90f	4	It’s not user-friendly. It’s supposed to be easy to use!	1	2024-12-10	NEGATIVE	0.995281756	User Interface & Experience
f5899ac9-6158-405b-acac-e1a07ea13b97	4	Fast ,simple and Secure mobile banking app	5	2024-09-21	POSITIVE	0.998637736	Security Concerns, Transaction Performance, User Interface & Experience
ca4fd7ae-515b-47f9-8fd2-fa3f0b6a3953	4	Online gambling live	5	2024-09-03	POSITIVE	0.683337808	General Feedback
1dec123f-7ceb-4115-a6cc-ed5c903d545d	4	How can activities my walets phones is not work by app	5	2024-08-08	POSITIVE	0.999118984	Bugs & Reliability
ae2554c0-a8aa-467c-8f41-4e4edfdbd9fc	4	አፑን አሰተካክሉት አትወዳደሱ	2	2024-08-04	NEGATIVE	0.833725393	General Feedback
8423300b-785a-47dc-90be-0ba0b2b162e6	4	Good app easy to use keep it up	5	2024-08-02	POSITIVE	0.999681115	User Interface & Experience
3a46f88d-58b3-4f9e-b0fb-1a9f502e9649	4	App doesn't open!	1	2024-06-20	NEGATIVE	0.999741733	General Feedback
480e7117-1373-4e19-aa29-41d2ba3504bb	4	Its the best app	5	2024-05-28	POSITIVE	0.999847531	General Feedback
4505fe06-8acb-4cf0-bc9b-596a0edb2b28	4	Very nice...easy to use app...👍 for the developers...keep it up!	5	2024-04-30	POSITIVE	0.999845147	User Interface & Experience
2a7e8e85-2c43-4b8b-82cf-23e8529fd0fc	4	እናት ባንክ የሴቶች ምርጫ ነው	5	2024-04-27	POSITIVE	0.883213103	General Feedback
80ed1bac-4654-4865-a552-43e15dbf4f87	4	The app won't open because I wouldn't give it unnecessary permission. Why does it want access to my contacts, camera, mic and etc... this is a bank app!!	1	2024-04-19	NEGATIVE	0.997975528	Account Access Issues, Customer Support
2b16aae5-2d12-4fcd-a079-5dd74caf449b	4	The ussd is way better than this application I don't recommend anyone to download it.	2	2024-04-16	NEGATIVE	0.989781499	General Feedback
0b21436b-295a-4456-891e-ece6d9886177	4	It's very good app	5	2024-04-04	POSITIVE	0.999872804	General Feedback
82e0ca80-a052-4662-bd0a-9bc6784858d2	4	Did the got IT department	1	2024-03-07	NEGATIVE	0.988854051	General Feedback
c0b59938-113b-4754-bd04-4be875b24b48	4	The worst banking app ever existed 🤮🤮	1	2024-02-23	NEGATIVE	0.999803483	General Feedback
d09c8c04-584b-4a7b-99cf-8f54efd51698	4	I personally value the positive changes in the application. Moreover, I hope that incorporating the account holder's address and the bank stamp in the PDF statement format would further improve its quality.	3	2024-02-19	NEUTRAL	0.999516964	Feature Requests
c7e0a657-5764-4a8e-b7a9-db296dd895cc	4	App not working	4	2024-02-09	POSITIVE	0.999728620	Bugs & Reliability
3ec0cd50-2137-4b6a-ace0-3956b5bf5e40	4	I don't know the problem but it dose not even register my phone number!!!	1	2024-02-07	NEGATIVE	0.999429047	Account Access Issues, Bugs & Reliability
5f31cb68-0739-456c-b321-10eaf068d554	4	Worst Bank In Ethiopia! Don't buy any shares please you will regret it!	1	2024-02-04	NEGATIVE	0.999759614	General Feedback
02294732-90a4-4deb-8096-92e19027ea01	4	FIG 1: CONTINENTS, OCEANS AND OCEAN TRENCHES OF THE WORLD         FIG 2:IMPROVED KOPPEN GEOGER  CLASSIFICATION OF OUR WORLD          FIG 3: WORLD CLIMATE REGION      FIG 4:TRADITIONAL CLIMATE  ZONE OF ETHIOPIA	5	2024-02-03	POSITIVE	0.861987412	General Feedback
b2d0d5fb-ba09-4fae-b030-a32c588c9a4c	4	It asks for an update which there is no update	2	2024-01-31	NEGATIVE	0.997870326	Feature Requests
c5c49ab2-f9f8-4068-aa79-96b4124b6df3	4	mother bank of Ethiopia ⭐️⭐️⭐️⭐️⭐️	5	2024-01-10	POSITIVE	0.977237999	General Feedback
dcf22a46-4aba-4ba6-9a50-ea0014412d29	4	The Best mobile Banking ever 👏👏👏	5	2023-12-12	POSITIVE	0.999845147	General Feedback
26ff8084-4677-4467-96de-687abbdb26b2	4	Very easy to use and excellent features!	5	2023-12-08	POSITIVE	0.999884844	Feature Requests, User Interface & Experience
284418a8-c617-4eb1-aad9-7eceefde8e26	4	Asking for update. Says Not working with your updated version.	1	2023-12-01	NEGATIVE	0.999737680	Bugs & Reliability, Feature Requests
7d1703a9-a0e3-4579-9149-525a2e3528a7	4	it dosen't work at night and it need's much to work on it keeps asking to update while i have just installed it.	2	2023-11-22	NEGATIVE	0.997032046	Bugs & Reliability, Feature Requests
e1fe6781-876d-4a2a-88be-6d00c1de5c37	4	This application not functional. I downloaded it from the system and installed it but it says to update. Does it not work when updated? So if it doesn't work then remove it from Google play store. Otherwise, the person who developed this software will see the problem and fix it.	1	2023-11-08	NEGATIVE	0.999546587	Bugs & Reliability, Feature Requests
941ec669-adee-40cb-8723-02cb1e65cc7f	4	the best banke enate bank	5	2023-10-29	POSITIVE	0.999821126	General Feedback
100f9ed8-e22c-46d3-9d4c-8df47ea55449	4	Let me use it before I segest	5	2023-10-09	POSITIVE	0.997563601	General Feedback
00495e83-775e-4c57-a3d7-735eb0463b65	4	This Mobile Banking system is not working properly	1	2023-08-28	NEGATIVE	0.999790967	Bugs & Reliability
94d7fb4d-c16d-4d67-a572-e7cf0fbed74b	4	So bad app its giving me a bad report app cant even open	1	2023-08-21	NEGATIVE	0.999809563	General Feedback
dc9a5647-abfd-43f4-97d0-977580bcf09c	4	How come it asks me to update when I have already installed the latest version? Dear developers Please you gotta work on this. Until you fix this I will give one star because there is no 0 star.	1	2023-08-19	NEGATIVE	0.998471081	Bugs & Reliability, Feature Requests
ba154c1b-23e3-4fdf-b966-040c67ec27d5	4	Asks updating. But it doesn't when i allow to update. Doesn't work?	2	2023-08-18	NEGATIVE	0.999581397	Bugs & Reliability, Feature Requests
f2c1e3f3-57be-4690-a61d-531d33b641f5	4	Enat Bank has come up with nice mobile up. I recommend everyone to try the application.	5	2023-08-14	POSITIVE	0.996263206	General Feedback
aaae3e36-9446-42b9-9425-557bd6ef76e8	4	It always asks to update the app even after updating. It does not open.	1	2023-08-10	NEGATIVE	0.999755681	Feature Requests
f23a9b60-6743-4021-b76c-00c3a24d8cac	4	Asks for update then doesn't work after updating	3	2023-08-07	NEUTRAL	0.999745548	Bugs & Reliability, Feature Requests
02c73bff-76ff-4342-b45e-cfaef8326e91	4	Nice app super easy	5	2023-07-31	POSITIVE	0.999739587	User Interface & Experience
4096aefd-ac49-49ca-9ecb-38190c8ca932	4	Wusha can make better app	1	2023-07-25	NEGATIVE	0.996599734	General Feedback
46754a18-ac83-4831-9f21-e39b18d7a42b	4	Thanks walkay Sifiican ayaad Ugu Jawaabtay Mansha.Allha	5	2023-07-22	POSITIVE	0.997981131	General Feedback
b7904777-c747-423b-b821-af8c9826186f	4	Poor Bank App	1	2023-07-11	NEGATIVE	0.999779522	General Feedback
e5498829-8bbb-43c9-8778-d69472e130d7	4	It good but sometimes it can't resolve the host	4	2023-06-28	POSITIVE	0.996891677	Customer Support
f061e0ca-d50c-437b-bbda-737c41d65295	4	We need the app	1	2023-06-28	NEGATIVE	0.994574249	General Feedback
fd04fd5f-0074-4845-ba65-5465a67e4c8a	4	The app not't work properly	5	2023-06-17	POSITIVE	0.999807298	Bugs & Reliability
ef5372fe-47a6-497f-a265-473b3d5976dc	4	Your app is not reliable. It gets stake or denay accessibility for no reason, sometimes does not desplay full view of reciept	5	2023-06-16	POSITIVE	0.999338806	Bugs & Reliability
27bca012-8e48-4e77-aeb3-92385321c039	4	Best Best Best!	5	2023-06-06	POSITIVE	0.999844790	General Feedback
cff8d4e2-5435-4c1c-9465-a88abc3b8f72	4	Tried to open it but it asks us to update and it fails to update or open..	1	2023-05-26	NEGATIVE	0.999781668	Feature Requests
bee52145-27e4-4fcf-a7d4-5eddbdead014	4	Not working it's bad app	1	2023-05-08	NEGATIVE	0.996461213	Bugs & Reliability
74c86fcc-8437-4771-b69d-4b0af7057e28	4	That like a mother good thanks	5	2023-04-30	POSITIVE	0.999827504	General Feedback
58884bb6-8754-409f-8328-9daeb8fd9606	4	Cool and nice	4	2023-04-21	POSITIVE	0.999865890	General Feedback
b3d123a2-9bce-4337-8d51-20f5f1d519a5	4	Good apps and easy to use I can see all my transaction keep it up !!!	5	2023-04-06	POSITIVE	0.999762475	Transaction Performance, User Interface & Experience
f1b3755f-ba14-41c5-bf97-5e6f44374e4e	4	It is a good option, but it cannot do Mobile Number Register I hope it will be fixed soon. "Who as a mother"	1	2023-04-04	NEGATIVE	0.992093146	Account Access Issues, Feature Requests
54aee7f6-0ec7-4ac0-9f6c-90616d169ff2	4	Betam teru sera nw bertulen	5	2023-04-04	POSITIVE	0.969825447	General Feedback
88b9b5e2-0814-4e7f-bbe4-59fdaf5f9d15	4	Poor app for update	1	2023-03-17	NEGATIVE	0.999761641	Feature Requests
bb4d87ce-89b0-483f-80fd-0f03f5e81613	4	I can say one of the top 5 mobile banking apps in the ethiopian market. Spot on Enat Bank S.C. 🫡	5	2023-02-27	POSITIVE	0.997938812	General Feedback
7d864a38-45b9-444d-9098-f67de4d5799d	4	Nuclear power plant	5	2023-02-13	POSITIVE	0.720184505	General Feedback
8a0a65cf-1938-4873-bbc5-7cb3d4e6a720	4	The app doesn't work	1	2022-12-24	NEGATIVE	0.999788582	Bugs & Reliability
fe4895f0-b68c-40b7-a87a-6caa26f97a3b	4	It Always Request to update application not work	1	2022-12-15	NEGATIVE	0.995930970	Bugs & Reliability, Feature Requests
0e84873f-b736-4826-92d8-244f8922215b	4	It's realy good and easy app keep it up	5	2022-11-25	POSITIVE	0.999880791	User Interface & Experience
6bff99b7-ba13-4e6b-b79b-f386bca3ff6b	4	After new update my mobile banking account become de-activated agian and again. I visted the nearest branch they reset for me but the same day its become de-activated agian with out even using the app at all.	1	2022-10-16	NEGATIVE	0.996925294	Feature Requests
4e3ad602-42ab-404d-9ab6-2994a44d0ee9	4	Great and easy to use app	5	2022-09-06	POSITIVE	0.999857545	User Interface & Experience
f507e056-7d70-410c-bd81-b080b7ca2e12	4	Fast and easy to use app	5	2022-07-14	POSITIVE	0.998995006	Transaction Performance, User Interface & Experience
375142c7-8ac8-4307-a2b1-f6eb95131a14	4	The best mobile banking app in ethiopia	5	2022-05-11	POSITIVE	0.999767959	General Feedback
a30a9aab-f56c-4a03-a91a-57c769cfb01d	4	Best features Highly recommend to use.	4	2022-02-16	POSITIVE	0.999802530	Feature Requests
617a071e-2e37-423f-bca8-bb099b9fa659	4	Really good security paired with options and features other banks just don't make available to you. Can use some more polish in a UI and UX point of view but it's still the best option in my opinion. Overall, highly recommend.	4	2021-02-14	POSITIVE	0.999666810	Feature Requests, Security Concerns, User Interface & Experience
5cb8cc31-ab1e-4be7-aa84-7b29a3d6f99b	4	Elegant look. Very responsive app.	5	2020-08-26	POSITIVE	0.999869943	App Speed & Performance, User Interface & Experience
\.


--
-- Name: banks_bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_bank_id_seq', 4, true);


--
-- Name: banks banks_bank_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_bank_name_key UNIQUE (bank_name);


--
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (bank_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- Name: reviews fk_bank; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_bank FOREIGN KEY (bank_id) REFERENCES public.banks(bank_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

