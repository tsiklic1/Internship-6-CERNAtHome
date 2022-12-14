PGDMP                          z            CERNAtHomeDB    15.1    15.1 I    Y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            [           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            \           1262    17620    CERNAtHomeDB    DATABASE     ?   CREATE DATABASE "CERNAtHomeDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "CERNAtHomeDB";
                postgres    false            ?            1259    17703    acceleratorprojects    TABLE     ?   CREATE TABLE public.acceleratorprojects (
    id integer NOT NULL,
    acceleratorid integer NOT NULL,
    projectid integer NOT NULL
);
 '   DROP TABLE public.acceleratorprojects;
       public         heap    postgres    false            ?            1259    17702    acceleratorprojects_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.acceleratorprojects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.acceleratorprojects_id_seq;
       public          postgres    false    227            ]           0    0    acceleratorprojects_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.acceleratorprojects_id_seq OWNED BY public.acceleratorprojects.id;
          public          postgres    false    226            ?            1259    17622    accelerators    TABLE     r   CREATE TABLE public.accelerators (
    acceleratorid integer NOT NULL,
    name character varying(40) NOT NULL
);
     DROP TABLE public.accelerators;
       public         heap    postgres    false            ?            1259    17621    accelerators_acceleratorid_seq    SEQUENCE     ?   CREATE SEQUENCE public.accelerators_acceleratorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.accelerators_acceleratorid_seq;
       public          postgres    false    215            ^           0    0    accelerators_acceleratorid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.accelerators_acceleratorid_seq OWNED BY public.accelerators.acceleratorid;
          public          postgres    false    214            ?            1259    17649 	   countries    TABLE     4  CREATE TABLE public.countries (
    countryid integer NOT NULL,
    name character varying(40) NOT NULL,
    population integer,
    pppcapitaincents bigint,
    CONSTRAINT countries_population_check CHECK ((population > 0)),
    CONSTRAINT countries_pppcapitaincents_check CHECK ((pppcapitaincents > 0))
);
    DROP TABLE public.countries;
       public         heap    postgres    false            ?            1259    17648    countries_countryid_seq    SEQUENCE     ?   CREATE SEQUENCE public.countries_countryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.countries_countryid_seq;
       public          postgres    false    221            _           0    0    countries_countryid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.countries_countryid_seq OWNED BY public.countries.countryid;
          public          postgres    false    220            ?            1259    17739    hotels    TABLE     ?   CREATE TABLE public.hotels (
    hotelid integer NOT NULL,
    capacity integer NOT NULL,
    city character varying(40) NOT NULL,
    CONSTRAINT hotels_capacity_check CHECK ((capacity > 0))
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            ?            1259    17738    hotels_hotelid_seq    SEQUENCE     ?   CREATE SEQUENCE public.hotels_hotelid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hotels_hotelid_seq;
       public          postgres    false    229            `           0    0    hotels_hotelid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hotels_hotelid_seq OWNED BY public.hotels.hotelid;
          public          postgres    false    228            ?            1259    17629    projects    TABLE     j   CREATE TABLE public.projects (
    projectid integer NOT NULL,
    name character varying(40) NOT NULL
);
    DROP TABLE public.projects;
       public         heap    postgres    false            ?            1259    17628    projects_projectid_seq    SEQUENCE     ?   CREATE SEQUENCE public.projects_projectid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.projects_projectid_seq;
       public          postgres    false    217            a           0    0    projects_projectid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.projects_projectid_seq OWNED BY public.projects.projectid;
          public          postgres    false    216            ?            1259    17636    researchpapers    TABLE     2  CREATE TABLE public.researchpapers (
    researchpaperid integer NOT NULL,
    title character varying(50) NOT NULL,
    publishedat timestamp without time zone,
    numberofcitations integer,
    projectid integer,
    CONSTRAINT researchpapers_numberofcitations_check CHECK ((numberofcitations >= 0))
);
 "   DROP TABLE public.researchpapers;
       public         heap    postgres    false            ?            1259    17635 "   researchpapers_researchpaperid_seq    SEQUENCE     ?   CREATE SEQUENCE public.researchpapers_researchpaperid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.researchpapers_researchpaperid_seq;
       public          postgres    false    219            b           0    0 "   researchpapers_researchpaperid_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.researchpapers_researchpaperid_seq OWNED BY public.researchpapers.researchpaperid;
          public          postgres    false    218            ?            1259    17658 
   scientists    TABLE       CREATE TABLE public.scientists (
    scientistid integer NOT NULL,
    firstname character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    dateofbirth timestamp without time zone NOT NULL,
    sex character varying(20),
    profession character varying(30),
    countryid integer,
    hotelid integer NOT NULL,
    CONSTRAINT scientists_profession_check CHECK (((profession)::text = ANY ((ARRAY['programer'::character varying, 'fizičar'::character varying, 'inženjer'::character varying, 'znanstvenik materijala'::character varying])::text[]))),
    CONSTRAINT scientists_sex_check CHECK (((sex)::text = ANY ((ARRAY['MUŠKI'::character varying, 'ŽENSKI'::character varying, 'NEPOZNATO'::character varying, 'OSTALO'::character varying])::text[])))
);
    DROP TABLE public.scientists;
       public         heap    postgres    false            ?            1259    17657    scientists_scientistid_seq    SEQUENCE     ?   CREATE SEQUENCE public.scientists_scientistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.scientists_scientistid_seq;
       public          postgres    false    223            c           0    0    scientists_scientistid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.scientists_scientistid_seq OWNED BY public.scientists.scientistid;
          public          postgres    false    222            ?            1259    17679    scientistspapers    TABLE     x   CREATE TABLE public.scientistspapers (
    id integer NOT NULL,
    scientistid integer,
    researchpaperid integer
);
 $   DROP TABLE public.scientistspapers;
       public         heap    postgres    false            ?            1259    17678    scientistspapers_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.scientistspapers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.scientistspapers_id_seq;
       public          postgres    false    225            d           0    0    scientistspapers_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.scientistspapers_id_seq OWNED BY public.scientistspapers.id;
          public          postgres    false    224            ?           2604    17706    acceleratorprojects id    DEFAULT     ?   ALTER TABLE ONLY public.acceleratorprojects ALTER COLUMN id SET DEFAULT nextval('public.acceleratorprojects_id_seq'::regclass);
 E   ALTER TABLE public.acceleratorprojects ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            ?           2604    17625    accelerators acceleratorid    DEFAULT     ?   ALTER TABLE ONLY public.accelerators ALTER COLUMN acceleratorid SET DEFAULT nextval('public.accelerators_acceleratorid_seq'::regclass);
 I   ALTER TABLE public.accelerators ALTER COLUMN acceleratorid DROP DEFAULT;
       public          postgres    false    215    214    215            ?           2604    17652    countries countryid    DEFAULT     z   ALTER TABLE ONLY public.countries ALTER COLUMN countryid SET DEFAULT nextval('public.countries_countryid_seq'::regclass);
 B   ALTER TABLE public.countries ALTER COLUMN countryid DROP DEFAULT;
       public          postgres    false    221    220    221            ?           2604    17742    hotels hotelid    DEFAULT     p   ALTER TABLE ONLY public.hotels ALTER COLUMN hotelid SET DEFAULT nextval('public.hotels_hotelid_seq'::regclass);
 =   ALTER TABLE public.hotels ALTER COLUMN hotelid DROP DEFAULT;
       public          postgres    false    228    229    229            ?           2604    17632    projects projectid    DEFAULT     x   ALTER TABLE ONLY public.projects ALTER COLUMN projectid SET DEFAULT nextval('public.projects_projectid_seq'::regclass);
 A   ALTER TABLE public.projects ALTER COLUMN projectid DROP DEFAULT;
       public          postgres    false    217    216    217            ?           2604    17639    researchpapers researchpaperid    DEFAULT     ?   ALTER TABLE ONLY public.researchpapers ALTER COLUMN researchpaperid SET DEFAULT nextval('public.researchpapers_researchpaperid_seq'::regclass);
 M   ALTER TABLE public.researchpapers ALTER COLUMN researchpaperid DROP DEFAULT;
       public          postgres    false    218    219    219            ?           2604    17661    scientists scientistid    DEFAULT     ?   ALTER TABLE ONLY public.scientists ALTER COLUMN scientistid SET DEFAULT nextval('public.scientists_scientistid_seq'::regclass);
 E   ALTER TABLE public.scientists ALTER COLUMN scientistid DROP DEFAULT;
       public          postgres    false    222    223    223            ?           2604    17682    scientistspapers id    DEFAULT     z   ALTER TABLE ONLY public.scientistspapers ALTER COLUMN id SET DEFAULT nextval('public.scientistspapers_id_seq'::regclass);
 B   ALTER TABLE public.scientistspapers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            T          0    17703    acceleratorprojects 
   TABLE DATA           K   COPY public.acceleratorprojects (id, acceleratorid, projectid) FROM stdin;
    public          postgres    false    227   ?[       H          0    17622    accelerators 
   TABLE DATA           ;   COPY public.accelerators (acceleratorid, name) FROM stdin;
    public          postgres    false    215   ?\       N          0    17649 	   countries 
   TABLE DATA           R   COPY public.countries (countryid, name, population, pppcapitaincents) FROM stdin;
    public          postgres    false    221   ?\       V          0    17739    hotels 
   TABLE DATA           9   COPY public.hotels (hotelid, capacity, city) FROM stdin;
    public          postgres    false    229   .^       J          0    17629    projects 
   TABLE DATA           3   COPY public.projects (projectid, name) FROM stdin;
    public          postgres    false    217   ?^       L          0    17636    researchpapers 
   TABLE DATA           k   COPY public.researchpapers (researchpaperid, title, publishedat, numberofcitations, projectid) FROM stdin;
    public          postgres    false    219   ?_       P          0    17658 
   scientists 
   TABLE DATA           x   COPY public.scientists (scientistid, firstname, lastname, dateofbirth, sex, profession, countryid, hotelid) FROM stdin;
    public          postgres    false    223   <q       R          0    17679    scientistspapers 
   TABLE DATA           L   COPY public.scientistspapers (id, scientistid, researchpaperid) FROM stdin;
    public          postgres    false    225   7w       e           0    0    acceleratorprojects_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.acceleratorprojects_id_seq', 1, false);
          public          postgres    false    226            f           0    0    accelerators_acceleratorid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.accelerators_acceleratorid_seq', 1, false);
          public          postgres    false    214            g           0    0    countries_countryid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.countries_countryid_seq', 1, false);
          public          postgres    false    220            h           0    0    hotels_hotelid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hotels_hotelid_seq', 1, false);
          public          postgres    false    228            i           0    0    projects_projectid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.projects_projectid_seq', 1, false);
          public          postgres    false    216            j           0    0 "   researchpapers_researchpaperid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.researchpapers_researchpaperid_seq', 1, false);
          public          postgres    false    218            k           0    0    scientists_scientistid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.scientists_scientistid_seq', 1, false);
          public          postgres    false    222            l           0    0    scientistspapers_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.scientistspapers_id_seq', 3, true);
          public          postgres    false    224            ?           2606    17708 ,   acceleratorprojects acceleratorprojects_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.acceleratorprojects
    ADD CONSTRAINT acceleratorprojects_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.acceleratorprojects DROP CONSTRAINT acceleratorprojects_pkey;
       public            postgres    false    227            ?           2606    17627    accelerators accelerators_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_pkey PRIMARY KEY (acceleratorid);
 H   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_pkey;
       public            postgres    false    215            ?           2606    17656    countries countries_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (countryid);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    221            ?           2606    17745    hotels hotels_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotelid);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    229            ?           2606    17634    projects projects_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (projectid);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    217            ?           2606    17642 "   researchpapers researchpapers_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.researchpapers
    ADD CONSTRAINT researchpapers_pkey PRIMARY KEY (researchpaperid);
 L   ALTER TABLE ONLY public.researchpapers DROP CONSTRAINT researchpapers_pkey;
       public            postgres    false    219            ?           2606    17665    scientists scientists_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_pkey PRIMARY KEY (scientistid);
 D   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_pkey;
       public            postgres    false    223            ?           2606    17684 &   scientistspapers scientistspapers_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.scientistspapers
    ADD CONSTRAINT scientistspapers_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.scientistspapers DROP CONSTRAINT scientistspapers_pkey;
       public            postgres    false    225            ?           2606    17720 "   accelerators uniqueacceleratorname 
   CONSTRAINT     ]   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT uniqueacceleratorname UNIQUE (name);
 L   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT uniqueacceleratorname;
       public            postgres    false    215            ?           2606    17767 0   acceleratorprojects uniqueacceleratorprojectpair 
   CONSTRAINT        ALTER TABLE ONLY public.acceleratorprojects
    ADD CONSTRAINT uniqueacceleratorprojectpair UNIQUE (acceleratorid, projectid);
 Z   ALTER TABLE ONLY public.acceleratorprojects DROP CONSTRAINT uniqueacceleratorprojectpair;
       public            postgres    false    227    227            ?           2606    17726    countries uniquecountryname 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT uniquecountryname UNIQUE (name);
 E   ALTER TABLE ONLY public.countries DROP CONSTRAINT uniquecountryname;
       public            postgres    false    221            ?           2606    17722    projects uniqueprojectname 
   CONSTRAINT     U   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT uniqueprojectname UNIQUE (name);
 D   ALTER TABLE ONLY public.projects DROP CONSTRAINT uniqueprojectname;
       public            postgres    false    217            ?           2606    17763 %   scientistspapers uniquescientistpaper 
   CONSTRAINT     x   ALTER TABLE ONLY public.scientistspapers
    ADD CONSTRAINT uniquescientistpaper UNIQUE (scientistid, researchpaperid);
 O   ALTER TABLE ONLY public.scientistspapers DROP CONSTRAINT uniquescientistpaper;
       public            postgres    false    225    225            ?           2606    17728    researchpapers uniquetitle 
   CONSTRAINT     V   ALTER TABLE ONLY public.researchpapers
    ADD CONSTRAINT uniquetitle UNIQUE (title);
 D   ALTER TABLE ONLY public.researchpapers DROP CONSTRAINT uniquetitle;
       public            postgres    false    219            ?           2606    17709 :   acceleratorprojects acceleratorprojects_acceleratorid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorprojects
    ADD CONSTRAINT acceleratorprojects_acceleratorid_fkey FOREIGN KEY (acceleratorid) REFERENCES public.accelerators(acceleratorid);
 d   ALTER TABLE ONLY public.acceleratorprojects DROP CONSTRAINT acceleratorprojects_acceleratorid_fkey;
       public          postgres    false    215    3223    227            ?           2606    17714 6   acceleratorprojects acceleratorprojects_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorprojects
    ADD CONSTRAINT acceleratorprojects_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid);
 `   ALTER TABLE ONLY public.acceleratorprojects DROP CONSTRAINT acceleratorprojects_projectid_fkey;
       public          postgres    false    3227    227    217            ?           2606    17643 ,   researchpapers researchpapers_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.researchpapers
    ADD CONSTRAINT researchpapers_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid);
 V   ALTER TABLE ONLY public.researchpapers DROP CONSTRAINT researchpapers_projectid_fkey;
       public          postgres    false    219    3227    217            ?           2606    17666 $   scientists scientists_countryid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid);
 N   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_countryid_fkey;
       public          postgres    false    221    3235    223            ?           2606    17756 "   scientists scientists_hotelid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_hotelid_fkey FOREIGN KEY (hotelid) REFERENCES public.hotels(hotelid);
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_hotelid_fkey;
       public          postgres    false    229    3249    223            ?           2606    17690 6   scientistspapers scientistspapers_researchpaperid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientistspapers
    ADD CONSTRAINT scientistspapers_researchpaperid_fkey FOREIGN KEY (researchpaperid) REFERENCES public.researchpapers(researchpaperid);
 `   ALTER TABLE ONLY public.scientistspapers DROP CONSTRAINT scientistspapers_researchpaperid_fkey;
       public          postgres    false    225    3231    219            ?           2606    17685 2   scientistspapers scientistspapers_scientistid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientistspapers
    ADD CONSTRAINT scientistspapers_scientistid_fkey FOREIGN KEY (scientistid) REFERENCES public.scientists(scientistid);
 \   ALTER TABLE ONLY public.scientistspapers DROP CONSTRAINT scientistspapers_scientistid_fkey;
       public          postgres    false    225    3239    223            T   ?   x?PɑEA:K0S??:??}? 5l?ce~??扏?p??𲰁ӑ?C*\!?ϒUqd"5?C??ٚ7҉????g??????Ei?E??P???@R?Jq?_??.Z;r??:iZ?T??"]G??:?P?ɮ
?6??#o??.h??	????ޡ?Ֆ?}???]?-e??[?#?X-?b???%~ ?N 4V      H   P   x?3???p?2????KL6?2?Vp??/.I-?2??s?r??fq?q????9r?s????)W?%g ?E?y\1z\\\ /??      N   >  x???jAE??_?/0]Ϯ?Z!`??$d?MK????0??D_?r/jw?=}??u??T?FS?*ꍽ?????????b [V???<????6:??B?S?Sx??L??D?f???E??<.cYFF?r˜`??Q???c???k߮Y+???7??48ܧ???۴???8:+92????9	???|?0v?????????Bj?-Րٙ
VxZ?}\?.???\???븍??j??- ??sM
|?={`f?-Y?K5?Z?????+?
3??????^P?y[?t??Z????'X?????????????c)???&h?      V   ?   x?E???0D??Ǡ?NcgeaBbb@,EP	e(*?O????O?=?N???D?Ć˴?_R?HPK[??㼶??6?`?2?l?C9? }?9?X??܈l{??k?s\??ZO	R,?n?k??
???9?{??? ?K????????mD<      J   ?   x??͎?@E?uݧ?	???K?dV?8qaܔt	jK???????l??ܺ?z?p?3?1{z0?̼?kP?(???t???(??????z???n?P??ee?aK;?T?Rj???^?`??Β???3:HLRy%???s??r?"xAY#5xI'$ZWT??z{;m??5?m???2???>      L      x?}Zɒ??=???~?6???#ɡ?lY#???dU?å?duO???2?%?8bBӒ??˗/???????չ??z,ʹy???????S:	?@??9???8??S???_??Ō??aďó?Ώq??%/Ծ
? ???y?O??_Ǧ???u.?{=??L??E_??T??x_*OE??v}6|ľ???/Z?%?????,????x??˽???:?S?O?3S]>Gܡm???0?U?????Ly?)?>?7sy/.m}.?????t}\??)k???/8E??A??L\<??)?S?ͭǊd??ous?ps??????#??<Az?)?~ ?<?f?????Ϸv???????_*?=?????h睊???0Ӱ?ha?ȋN*??on8ߟ"?Xw?5?-ƹ?6e?)rZ\??K?R?c???$???Rާq?&?B?q?뺚?K1??7?⶟??#?MpR????V?|??,Zv????qo?og
?3??x-??2??&C???????)?????{???J?q?T??????/??\w?????F?8??"?????
!?@%??W_?ǡo&鎮??C5???Ef???4 o???quؙV?C????Y??R??Y ??̙?i??.+y?n??g????`?U?I??/?p?i?z?mh?|o?	
???G?ѣ??WiZ~e?p???^??G??CX[??@??kpl_?L?~??p??ޙ?
??4????h????????C ?ëhg?Ef? n?sq?0|Խ?OX[????c3 ??|?I?L?ȅȪ=?R?2|;qˋ?)???2?g?X?? ϊ??????cB1??`D?B^???y_3 ?f2v??e	?????H??? L????&?n?????Ls?^?\?#?0?C?
??0?@hf?:??N(?p?8?E$D9?ϩfU?????8?硅	??G???u?LtMF?N?C*^z	??iӝQ?ןd?=????3I???Q?????~Y6??????:=+????d?43????a??T|g?*'ԈB??'ŕ?W2B???[?W. ?XqH7???5J`y??۹?Q??`?uTx9??????с?[?&P???y??y^?7??q?}??i??D:??????xz.?d?/?????@q? ?:?@????J ]ǆc?U??3?P
????????C??A?#??G?~???XT??9??|??7?3????????5p?k/Ì{?TA?%???榒	Nr??Ho)??-<?iC?'?';?D??0?m??Z????????o܂̟g?FY?REe??u??5dB.?KPP gVT?)@L>~?????2?????_((.Oc.??3L? ???Jfu?׋`٣kz ??$1?rh3?U??hۗ??\??s??ؘe90 g?5,lR)B???w ??SKPR,?	??f??֠???l??PbB?ı??r*μ?f@??K^4]~\tLcC,2?3$tl??????f????.	Js>5bЪp9~}?g?1???O?U???$?~oC?t -N??)?? 
{3?L????E???ا??$:L??2?tJ????[??}.Ar?E???)??rv??,(x]?O??ݿ?	?';L????˸?@??OI????????煪VJ?
?pIҭW[#E???8݇??z-??v?0MO ??????????{W?TuBž?3eK?]?V5????C4q?^?O???c)?(?D)嬖y?J????????o?]?v?#O???:d??fj??k?)?2S???_??v??I?ɱ?N???h??????L?9[???5*҄?
	1?;?%?0?y"??6?M螉?^??`?ΗƗ???????ԙ?????z&??^u(	???rX>??}G?b???Y??R???˟ L2'vFt??? ??????Ŗ?W?j3?(Q"???C??S?p????RtMU???1B?-1???????????????D??d'Tْ?????u~???O%??????#??O?~6?fġl??	eV?????????J??Ҵ{R\<l?DfK???Hg???E_X=?fRA?d??|I-:7?c?Q?5A?q??>?I??2~BHn?Ҋ??ܺE
?b?#
N0???~xc??-^???ꩭ?ls?t?幘^2tď3?????x??-?F?<p??R?_ѬX??԰6W9??]??P??????ȹ??$??n??؈?[5?ah'?9	?????:??c;?ִ?.??;?۠?d:??)n@#.???}/z?? ߴ[?r?]??t???????Asӳ??h?l?K1?}??0?+??z???p??ɄQ??:??b?%&?Ʀ??y\?u????E?[9?mq6??#HB??=$???L?/=An??!I?:??9ի/??ɞ"1?)UY?9i?s???? "?-?dm?LG+Jn4??????h?? ??d?"??a?`?????̦\?F\?xT?C?G?X?M???r@m?????Qt?d?ʵ&9?zR+/?L?:si,l|??G?a?.7F+H`@?s?L??B?r?&z???ъg߰????ƭ??-?{??t??.=T??U{i???㘳Y
??k????$???? ?dDl?O*v=^HOߔrYq?Hq???+R|ig??? #>??
B???p???,	-??0J????Dk嗞G?ʹ?????
?kcB?????SX?j?UY?@?hu????????n????:}*?kQɄ?"#_DV	?y@&k(??PȒv??e??+?*d??]?oӀX:??W?w?MXI??????z?U?1?e???(m?Nx?q?"?P???s6I?UJ??cU???C??8I??*?Q????d?Q???Z?OBN?ODH}3?q"??ȳ??;+y,??cYE?Q,???0trəSr?Jd?l???Y??0? `amjUK???TK?79kM?r?:"???j?FC?Z???"Q?'υ????
y???7?SJi1~??y??F'֮h?ʣ?/w\ݧ?l7?eR4?ge???ʺ쮓|{????Q?^??T?X?۫?h??M:? '??IoH}?dnđo~?kӜE?ȆY??b?ھ??5.?9???C?!8	?????"?8??5??R7??ⵍ),??]fr???dD?6?$Q?.??uyQ????-!???ZiBL3Nm?%tέ\???t?????kUx?????0?????~?i??%?D???g?j?ndk??c,?Z?
_???9C[??.?x
gJ?$#?
rK???,
M?_?Gw(?%Q?:??5?!?7n??T?l4??n?iT?jck???H?#?v@?eb&?Ŭ?*???e[?????-??Qbu?]??2!X???e?*u']47?E?;?r??K??՚?i??s%?]????n?????"?4Bh?R'ɢ%?d??Ke?i,??U?0?3?ɜT?n)4?ܙ?m?,?Rʧ?j??????;???H?<<??q?S]I1?J??	????à??q?ݧ?q?t]??Hw????(׮??,????-F~??QJ??T??*i??????8갶ES?X??:Yλk[??F??g??.C??!?"??iPn?????f,?ͼ Ihb?????????Q??W??LE?-?)???X??-?8?$?"ڊ	.?'????Bw?3???	\lu??`??B???A???f?Ԁ???5????JR1?8?\Z?N????在L?ɾ?j?r???)(aJ?U?O??L%?e???1%2@????^??Aq?"?H??H?y?????b	&kO?K????I?RW$iK?B???I̑Zo????YѸA???K	y? CSDD?	Sl?????PT?A$aȐIa?,9?d#L???x5?YU?EK?]5?}?
????o)???6??
????J?|?????]U<????n?jV??/~bu?te}??????F??e??e?mv?b??Z??3J?c?s??????B?00ۇ?o\!k??̕?4U
{?????$?֏M??V????i걽????޹???d?i~6??????~{??ŮX??#??????n	??l?9??Ck????]_V߭&0?f=??/μ?&l7?.?%F????ύ;?XfT? ?  [z?9?i???A?̌?c?F????uЖ????6?oz?r?@?*Wq?y,/ų[w??=?C?$.?e?B?#?;??i??V??>?^??We?????D,t&	???}?s???? ާ??,غ/?x???ԑ???ѹ?v25?9???Wa_??3oyBKފ?'?d??/???_????f$*ݝ?/?k{????f?Xe?hd?V??l???Ѧ??T??<?^?JMv/??EIn?!L?ff?Kdo?y??f??ȱ{?	?>Gb?t??E4ìخ)?????b-?y? _$?????pq???E?kBF??????v%_"ґ	g?????H??/L?7??(ieU?EL?I58??ˬ)%HilO#?Ī? ??>?js?M?R?P?`}??????r|?rhP?????t:?Jd"(      P   ?  x??WKr?F\??B???f??N-ɡ~e?qٕ͐?c?3?h??C$??^??C?%?JU.??y?~????K:???????B??0?Eb/k?|?~???.ͭ??/?)
I????w??f2???W?@?D????ʫ???@??jf4?\U??0M8j???????oW?J?? Fԥ??*SVz??fH9?6????~ATAi?Щ?~I?j63?????0?E??Q4R???ҁ?
X?,?	?Y/?7???EAF???N4]h?v?k.X?(?E??go.??????_I;??? ?UkzS7??R??n????\??F??킎??/??6G?s???I???ڨ????4mH??;?	?A???M??z=?u?ʑr?6?;???
-??]?po??X>??è?Xr0%?4?*??[??
?ȳ?F?4@?e9?;7־???3(????.nK?90?U5^b?z???a´?v?'?(?r?u?:TY:l?ŏ;?u?QF????F???*Vs????]iJ?(??z????Q??X??S?.??ֶ5?QA#???\mZ?m?7??˸?"??jK??xZU??????L,J??JMhh??j?$?z<?|?? )?BY0?q?_???^??a??d?h?K:T?Қ???;??Xi4k???sD?????`?)???.ٕm?zk?????x?VK?dGŐ???;?J?UӴ???;WY2!EF}l???Pvo?ץ???"ej?̈́W???C?әC???w?C??k]]ƭ???iY@>???d??NO<??1wY?t??j̢?]????v?v??U\љ???C﮹?!+?*????l?.?i x??	?f?6?/?}?????&??vHI??7Smg???&?1??j?6????y????8H?????.^F?/)d?p?)Va???ϡ????ﱫ7?S?s٤?)q???b,??.lƲ-?n?M??`.?%i???Np?d???z ?s3??e?,?mLv???ɂ?+????ht???u??`IB*?n?h??M??2??I??`?Ė????? ?L9?ʖ?fp??K????Vٺ?????檁??*?g3?}T???q?????3???????U?%J?}????p?e6p1?Q?[?,???N??m?'2??C???????D/mmgq??}k??<?? Na?p??2?j?u???wx,?????u???l?^zyu9?A??Q??5???ϴ???@>??K'?|????W?t?/~$j?U?y.qo?????EiOl^?'+?6I?2qc?/K㬩?{ ϖ?V?!d?:?)?fF?????????m??????(I#=??6؞#?9???ye鏗?Y:B???y|ԜN???r??_???f?w???+t?Nn????!???$?3IJ?a	5?ٱ?????J@???>}?r????ku!^?pL>???杻Q̓A_?	{???????q;p???v6??j^?C??ҐNh8??۱???i?4]Q??g?J?q???;[?|A ??cN??]??r??5???v?(      R   v
  x?-?׍$1D?[?dH?\6?8?^q?;????Hi}k|c?????m?????O????]?}???\?kc|+??ۘ???hc}S??Nֶq??g????9???????6?^???9????{???}ڌ/?7?L??5];???$?z߸Zx??ԛ6?.7?fG?N[?S??&kt䘫?ص?????h?0[??7猆&Z??|s??w?\-?]rN?@a??Mx??????~???쇖g??LΖg얶6?ᅫGD??t?^J??6?k?t??YE??Ԁ??6?q?h=^???ڥ?e??mi??G;?????!?m"?c?????~??|{??1?????L?M?k?? ???v?ȍ?|??[?K???JV?????.????-O???ݭ?{?]m?M۽8l???#?3۳?#V{??س??)?no????^{?IW?e;A}?Ǿh??a???W	???'????S?b?JI?D?U?˃A?^ݙy??u???qyh6?Z?TC`?0?\?"?d?@y??`کh?\?[.ҩ|?t˿?H?C@???S????????ZB??q2Kz?|?o??֓XؖYX?Z????I???_??Bk?_$-?˩?????N?!ՙ;?'??p?=?????>?͗?.?>A??G????9b?Za^̽?@>0I??aAS?!m? #tj}???'iK( ?'??m?B{?(?b??4?)?45Q?¦&?D?T?nF??G;
??l>?o?&?+:(??M:d?y?~?r#J?t2?L[??ǧ?Vg?}Rg???f?.5?Vm????pF?R???0
?]??????= ?<?G?6????R\`V,I?ER??gR7?x???C????Yu??<!T+??-]? ;?'O???ŦL=??SǿkU?~hrS?[?G1?&?4?Tq??L?[۸d?e??ً??-p?UH???^?0r%%?^N?YЦ???????_??? ?J?ba
?TP? ??)O?¬GJ?v??<ЕxBXsV?N?w??N?4?Ȅˎ㤜nyRE&?rB?(i?|????.?_??L%?????x?????*?`p???HnBքq?{???Jn%?ԉ??j?????̴?!????8??p{0p#H'?$?? ?fB?0ڤ_'???^?S??g?%??P?goU?)?/S????!q9nHa7??v????????q????(h
?(??:}?????<??*?
?<a?*=\????YHw?^j?{?ޛ??EV@?>?F?8?;??p?f?C?' ???i[?????z???c?Jp?p?'?_'?3?RS?s?W??)?.pi??<]??3??ԫ?:Y??7	??Z????8??%N:????MIa?[?????k*K('K,^S,??<?fwo??q8w?5܆(?kcD??FHF??.?^R???p??Ң?o4???I???h͠0?{?`?ɝ9?3???_MZ???j?N??&??q?m?????Rc?0?a?y7?kUj?1)X|L~ܻ5߫?1?YLsٮ(??`j?%?ឞ?????%Kɳ??H6?x??4?F?4?P?W?״?ӧ<?¼??Eq?<Jr?M??!?2????W5?v>?'Iu? 2>{W?q??????t?Ǩ???P/W?;?P???׮$,?v:?1?v?]g??4L???iK??Eл?]??????8^?c%?U?X???j?????Z?z:?YD\?\ݨʥM?F̹nJq?u?H?}R?>_/?#????o???ʗX??E?W?Y4?????,?*Fp_???>7??'z9N-N??^vKr\??,-Ab?k_?CɊm??+??F??Xn?JEu??]oTF+?1????8ݻ1?i.b?Tz??F??LF??MO??.?S??L?m??n7?;???N?Eʯ??j???w???,k??N?tةn???ڈq??}E?$?M??\??]&??{??2??{ʉz??")?F?S?5#~?'?" ?^<?$?"???~???p?^>???T?Yǈ1"7D?????U??x?|5J!?_?g??P8M38=o?	?K??a}u??j??%??3?a??Dd?U???Ս:6??C? = ?.?m???.?z??L???????U?LF?B?R?]???{1V8?#?_꾏sn/??[?(???s?u????;.??? @?ؚo??b̼?b)qh????;??y?????j"?r,A??0 }r??G????XL?o+??{?4??W?R?W"?!v?Z)???1x?.y?!?????㳤??G??IE?)??,bO\?|?":??G???????;?$ d??Cl2JPx?I??n?$?,_?S?!???T)??9}?+%Q??y4?f??F)/?hrOs4?dϥ?O*|⾤??F??`?
u*?Z??N?{?T?????n?Z?~W?????V???o??e??D5?쭍??R0?G%??2)}yI??<?	???a?Iy\vS?????P????????D????e?t偁EɎ\?R??Z???n?t???gUqR?!`?s7n???u???~vJ??????R??y?????? xJ?dǩ??)???<?z?<ˑ???=k._???pO???q?o{????G?7~<)???o??? ???f??,!??.a??$?ǫ??????@???[T?^y-?؄?R?w??x?[d?@o?F?g
?<???????)K?^Hw??k??Ay?     