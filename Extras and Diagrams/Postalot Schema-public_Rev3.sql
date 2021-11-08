--public Schema
--Current username is hmzqodiswhfmef
--Find and replace all occurrences of username above when running script on new DB

-- SCHEMA: public

-- DROP SCHEMA public ;

-- CREATE SCHEMA public
--     AUTHORIZATION hmzqodiswhfmef;

-- SEQUENCE: public.albumShareRelationship_id_seq

-- DROP SEQUENCE public."albumShareRelationship_id_seq";

CREATE SEQUENCE public."albumShareRelationship_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."albumShareRelationship_id_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.albumShareRelationship_ShareRelationshipID_seq

-- DROP SEQUENCE public."albumShareRelationship_ShareRelationshipID_seq";

CREATE SEQUENCE public."albumShareRelationship_ShareRelationshipID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."albumShareRelationship_ShareRelationshipID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.album_id_seq

-- DROP SEQUENCE public."album_id_seq";

CREATE SEQUENCE public."album_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."album_id_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.album_id_seq

-- DROP SEQUENCE public."album_id_seq";

CREATE SEQUENCE public."album_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."album_id_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.metadata_id_seq

-- DROP SEQUENCE public."metadata_id_seq";

CREATE SEQUENCE public."metadata_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."metadata_id_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.metadata_id_seq

-- DROP SEQUENCE public."metadata_id_seq";

CREATE SEQUENCE public."metadata_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."metadata_id_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.photoShareRelationship_id_seq

-- DROP SEQUENCE public."photoShareRelationship_id_seq";

CREATE SEQUENCE public."photoShareRelationship_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."photoShareRelationship_id_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.photoShareRelationship_photoShareRelationship_seq

-- DROP SEQUENCE public."photoShareRelationship_photoShareRelationship_seq";

CREATE SEQUENCE public."photoShareRelationship_photoShareRelationship_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."photoShareRelationship_photoShareRelationship_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.photo_id_seq

-- DROP SEQUENCE public."photo_id_seq";

CREATE SEQUENCE public."photo_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."photo_id_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.photo_id_seq

-- DROP SEQUENCE public."photo_id_seq";

CREATE SEQUENCE public."photo_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."photo_id_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.ShareRelationship_ShareRelationshipID_seq

-- DROP SEQUENCE public."ShareRelationship_ShareRelationshipID_seq";

CREATE SEQUENCE public."ShareRelationship_ShareRelationshipID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."ShareRelationship_ShareRelationshipID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.ShareRelationship_id_seq

-- DROP SEQUENCE public."ShareRelationship_id_seq";

CREATE SEQUENCE public."ShareRelationship_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."ShareRelationship_id_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.userLogin_id_seq

-- DROP SEQUENCE public."userLogin_id_seq";

CREATE SEQUENCE public."userLogin_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."userLogin_id_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.user_id_seq

-- DROP SEQUENCE public."user_id_seq";

CREATE SEQUENCE public."user_id_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."user_id_seq"
    OWNER TO hmzqodiswhfmef;

-- Table: public.user

-- DROP TABLE public."user";

CREATE TABLE public."user"
(
    "id" integer NOT NULL DEFAULT nextval('public
."user_id_seq"'::regclass),
    "username" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "firstname" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "lastname" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "email" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "isactive" boolean NOT NULL,
    "joineddate" date NOT NULL,
    CONSTRAINT "user_PK" PRIMARY KEY ("id"),
    CONSTRAINT "email_Unique" UNIQUE ("email"),
    CONSTRAINT "username_Unique" UNIQUE ("username")
)

TABLESPACE pg_default;

ALTER TABLE public."user"
    OWNER to hmzqodiswhfmef;

-- Table: public.userLogin

-- DROP TABLE public."userLogin";

CREATE TABLE public."userLogin"
(
    "id" integer NOT NULL DEFAULT nextval('public
."userLogin_id_seq"'::regclass),
    "username" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "email" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "passwordhash" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "isactive" boolean NOT NULL,
    CONSTRAINT "userLogin_PK" PRIMARY KEY ("id"),
    CONSTRAINT "userLogin_email_Unique" UNIQUE ("email"),
    CONSTRAINT "userLogin_username_Unique" UNIQUE ("username")
)

TABLESPACE pg_default;

ALTER TABLE public."userLogin"
    OWNER to hmzqodiswhfmef;

-- Table: public.photo

-- DROP TABLE public."photo";

CREATE TABLE public."photo"
(
    "id" integer NOT NULL DEFAULT nextval('public
."photo_id_seq"'::regclass),
    "id" integer NOT NULL,
    "storageurl" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "isactive" boolean NOT NULL,
    "posteddate" date NOT NULL,
    CONSTRAINT "photo_PK" PRIMARY KEY ("id"),
    CONSTRAINT "photo_user_FK" FOREIGN KEY ("id")
        REFERENCES public
    ."user" ("id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."photo"
    OWNER to hmzqodiswhfmef;

-- Table: public.album

-- DROP TABLE public."album";

CREATE TABLE public."album"
(
    "id" integer NOT NULL DEFAULT nextval('public
."album_id_seq"'::regclass),
    "id" integer NOT NULL,
    "albumName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "isactive" boolean NOT NULL,
    "createddate" date NOT NULL,
    CONSTRAINT "album_PK" PRIMARY KEY ("id"),
    CONSTRAINT "album_user_FK" FOREIGN KEY ("id")
        REFERENCES public
    ."user" ("id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."album"
    OWNER to hmzqodiswhfmef;

-- Table: public.metadata

-- DROP TABLE public."metadata";

CREATE TABLE public."metadata"
(
    "id" integer NOT NULL DEFAULT nextval('public
."metadata_id_seq"'::regclass),
    "id" integer NOT NULL,
    "GeoLocation" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "CaptureDate" date NOT NULL,
    "TagString" character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT "metadata_PK" PRIMARY KEY ("id"),
    CONSTRAINT "photo_metadata_FK" FOREIGN KEY ("id")
        REFERENCES public
    ."photo" ("id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."metadata"
    OWNER to hmzqodiswhfmef;

-- Table: public.ShareRelationship

-- DROP TABLE public."ShareRelationship";

CREATE TABLE public."ShareRelationship"
(
    "id" integer NOT NULL DEFAULT nextval('public
."ShareRelationship_ShareRelationshipID_seq"'::regclass),
    "id" integer NOT NULL,
    "isactive" boolean NOT NULL,
    CONSTRAINT "ShareRelationship_PK" PRIMARY KEY ("id"),
    CONSTRAINT "ShareRelationship_id_FK" FOREIGN KEY ("id")
        REFERENCES public
    ."user" ("id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."ShareRelationship"
    OWNER to hmzqodiswhfmef;

-- Table: public.photoShareRelationship

-- DROP TABLE public."photoShareRelationship";

CREATE TABLE public."photoShareRelationship"
(
    "id" integer NOT NULL DEFAULT nextval('public
."photoShareRelationship_photoShareRelationship_seq"'::regclass),
    "id" integer NOT NULL,
    CONSTRAINT "photoShareRelationship_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "photoShareRelationship_id_FK" FOREIGN KEY ("id")
        REFERENCES public
    ."photo" ("id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "photoShareRelationship_ShareRelationship_FK" FOREIGN KEY ("id")
        REFERENCES public
    ."ShareRelationship" ("id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."photoShareRelationship"
    OWNER to hmzqodiswhfmef;

-- Table: public.albumShareRelationship

-- DROP TABLE public."albumShareRelationship";

CREATE TABLE public."albumShareRelationship"
(
    "id" integer NOT NULL DEFAULT nextval('public
."albumShareRelationship_ShareRelationshipID_seq"'::regclass),
    "id" integer NOT NULL,
    CONSTRAINT "albumShareRelationshipID_PK" PRIMARY KEY ("id"),
    CONSTRAINT "albumShareRelationshipID_ShareRelationshipID_FK" FOREIGN KEY ("id")
        REFERENCES public
    ."ShareRelationship" ("id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "photoShareRelationship_id_FK" FOREIGN KEY ("id")
        REFERENCES public
    ."album" ("id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public."albumShareRelationship"
    OWNER to hmzqodiswhfmef;