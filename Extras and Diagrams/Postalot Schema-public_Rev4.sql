--public Schema
--Current username is hmzqodiswhfmef
--Find and replace all occurrences of username above when running script on new DB

-- SCHEMA: public

-- DROP SCHEMA public ;

--CREATE SCHEMA public
--    AUTHORIZATION hmzqodiswhfmef;

-- SEQUENCE: public.user_userid_seq

-- DROP SEQUENCE public."user_userid_seq";

CREATE SEQUENCE public."user_userid_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."user_userid_seq"
    OWNER TO hmzqodiswhfmef;
-- Table: public.user

-- DROP TABLE public."user";

CREATE TABLE public."user"
(
    "id" integer NOT NULL DEFAULT nextval('public
."user_userid_seq"'::regclass),
    "username" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "firstname" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "lastname" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "email" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "password" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "isactive" boolean NOT NULL,
    "joineddate" date NOT NULL,
    CONSTRAINT "user_PK" PRIMARY KEY ("id"),
    CONSTRAINT "email_Unique" UNIQUE ("email"),
    CONSTRAINT "username_Unique" UNIQUE ("username")
)

TABLESPACE pg_default;

ALTER TABLE public."user"
    OWNER to hmzqodiswhfmef;

-- SEQUENCE: public.User_Login_seq

-- DROP SEQUENCE public."User_Login_seq";

CREATE SEQUENCE public."User_Login_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."User_Login_seq"
    OWNER TO hmzqodiswhfmef;
-- Table: public.userlogin

-- DROP TABLE public."userlogin";

CREATE TABLE public."userlogin"
(
    "id" integer NOT NULL DEFAULT nextval('public
."User_Login_seq"'::regclass),
    "username" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "email" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "passwordhash" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "isactive" boolean NOT NULL,
    CONSTRAINT "userlogin_PK" PRIMARY KEY ("id"),
    CONSTRAINT "userlogin_email_Unique" UNIQUE ("email"),
    CONSTRAINT "userlogin_username_Unique" UNIQUE ("username")
)

TABLESPACE pg_default;

ALTER TABLE public."userlogin"
    OWNER to hmzqodiswhfmef;

-- SEQUENCE: public.photo_ID_seq

-- DROP SEQUENCE public."photo_ID_seq";

CREATE SEQUENCE public."photo_ID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."photo_ID_seq"
    OWNER TO hmzqodiswhfmef;

-- Table: public.photo

-- DROP TABLE public."photo";

CREATE TABLE public."photo"
(
    "id" integer NOT NULL DEFAULT nextval('public
."photo_ID_seq"'::regclass),
    "userid" integer NOT NULL,
    "storageurl" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "isactive" boolean NOT NULL,
    "posteddate" date NOT NULL,
    CONSTRAINT "photo_PK" PRIMARY KEY ("id"),
    CONSTRAINT "photo_user_FK" FOREIGN KEY ("userid")
        REFERENCES public
    ."user" ("id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."photo"
    OWNER to hmzqodiswhfmef;

-- SEQUENCE: public.album_ID_seq

-- DROP SEQUENCE public."album_ID_seq";

CREATE SEQUENCE public."album_ID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."album_ID_seq"
    OWNER TO hmzqodiswhfmef;

-- Table: public.album

-- DROP TABLE public."album";

CREATE TABLE public."album"
(
    "id" integer NOT NULL DEFAULT nextval('public
."album_ID_seq"'::regclass),
    "userid" integer NOT NULL,
    "albumName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "isactive" boolean NOT NULL,
    "CreatedDate" date NOT NULL,
    CONSTRAINT "album_PK" PRIMARY KEY ("id"),
    CONSTRAINT "album_user_FK" FOREIGN KEY ("userid")
        REFERENCES public
    ."user" ("id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."album"
    OWNER to hmzqodiswhfmef;

-- SEQUENCE: public.metadata_ID_seq

-- DROP SEQUENCE public."metadata_ID_seq";

CREATE SEQUENCE public."metadata_ID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

-- Table: public.metadata

-- DROP TABLE public."metadata";

CREATE TABLE public."metadata"
(
    "metadataid" integer NOT NULL DEFAULT nextval('public
."metadata_ID_seq"'::regclass),
    "photoid" integer NOT NULL,
    "geolocation" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "capturedate" date NOT NULL,
    "tagstring" character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT "metadata_PK" PRIMARY KEY ("metadataid"),
    CONSTRAINT "photo_metadata_FK" FOREIGN KEY ("photoid")
        REFERENCES public
    ."photo" ("id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."metadata"
    OWNER to hmzqodiswhfmef;

-- SEQUENCE: public.ShareRelationship_UserID_seq

-- DROP SEQUENCE public."ShareRelationship_UserID_seq";

CREATE SEQUENCE public."ShareRelationship_UserID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."ShareRelationship_UserID_seq"
    OWNER TO hmzqodiswhfmef;

-- Table: public.sharerelationship

-- DROP TABLE public."sharerelationship";

CREATE TABLE public."sharerelationship"
(
    "id" integer NOT NULL DEFAULT nextval('public
."ShareRelationship_UserID_seq"'::regclass),
    "userid" integer NOT NULL,
    "isactive" boolean NOT NULL,
    CONSTRAINT "sharerelationship_PK" PRIMARY KEY ("id"),
    CONSTRAINT "sharerelationship_id_FK" FOREIGN KEY ("userid")
        REFERENCES public
    ."user" ("id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."sharerelationship"
    OWNER to hmzqodiswhfmef;

-- Table: public.photosharerelationship

-- DROP TABLE public."photosharerelationship";

CREATE TABLE public."photosharerelationship"
(
    "sharerelationshipid" integer NOT NULL,
    "photoid" integer NOT NULL,
    CONSTRAINT "photosharerelationship_pkey" PRIMARY KEY ("sharerelationshipid"),
    CONSTRAINT "photosharerelationship_id_FK" FOREIGN KEY ("photoid")
        REFERENCES public
    ."photo" ("id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "photosharerelationship_sharerelationship_FK" FOREIGN KEY ("sharerelationshipid")
        REFERENCES public
    ."sharerelationship" ("id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."photosharerelationship"
    OWNER to hmzqodiswhfmef;

-- Table: public.albumsharerelationship

-- DROP TABLE public."albumsharerelationship";

CREATE TABLE public."albumsharerelationship"
(
    "sharerelationshipid" integer NOT NULL,
    "albumid" integer NOT NULL,
    CONSTRAINT "albumsharerelationship_PK" PRIMARY KEY ("sharerelationshipid"),
    CONSTRAINT "albumid_id_FK" FOREIGN KEY ("sharerelationshipid")
        REFERENCES public
    ."sharerelationship" ("id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "photosharerelationship_id_FK" FOREIGN KEY ("albumid")
        REFERENCES public
    ."album" ("id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public."albumsharerelationship"
    OWNER to hmzqodiswhfmef;