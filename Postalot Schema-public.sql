--public Schema
--Current Username is hmzqodiswhfmef
--Find and replace all occurrences of username above when running script on new DB

-- SCHEMA: public

-- DROP SCHEMA public ;

--CREATE SCHEMA public
--    AUTHORIZATION hmzqodiswhfmef;

-- SEQUENCE: public.AlbumShareRelationship_AlbumID_seq

-- DROP SEQUENCE public."AlbumShareRelationship_AlbumID_seq";

CREATE SEQUENCE public."AlbumShareRelationship_AlbumID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."AlbumShareRelationship_AlbumID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.AlbumShareRelationship_ShareRelationshipID_seq

-- DROP SEQUENCE public."AlbumShareRelationship_ShareRelationshipID_seq";

CREATE SEQUENCE public."AlbumShareRelationship_ShareRelationshipID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."AlbumShareRelationship_ShareRelationshipID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.Album_AlbumID_seq

-- DROP SEQUENCE public."Album_AlbumID_seq";

CREATE SEQUENCE public."Album_AlbumID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."Album_AlbumID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.Album_UserID_seq

-- DROP SEQUENCE public."Album_UserID_seq";

CREATE SEQUENCE public."Album_UserID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."Album_UserID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.Metadata_MetadataID_seq

-- DROP SEQUENCE public."Metadata_MetadataID_seq";

CREATE SEQUENCE public."Metadata_MetadataID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."Metadata_MetadataID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.Metadata_PhotoID_seq

-- DROP SEQUENCE public."Metadata_PhotoID_seq";

CREATE SEQUENCE public."Metadata_PhotoID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."Metadata_PhotoID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.PhotoShareRelationship_PhotoID_seq

-- DROP SEQUENCE public."PhotoShareRelationship_PhotoID_seq";

CREATE SEQUENCE public."PhotoShareRelationship_PhotoID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."PhotoShareRelationship_PhotoID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.PhotoShareRelationship_PhotoShareRelationship_seq

-- DROP SEQUENCE public."PhotoShareRelationship_PhotoShareRelationship_seq";

CREATE SEQUENCE public."PhotoShareRelationship_PhotoShareRelationship_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."PhotoShareRelationship_PhotoShareRelationship_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.Photo_PhotoID_seq

-- DROP SEQUENCE public."Photo_PhotoID_seq";

CREATE SEQUENCE public."Photo_PhotoID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."Photo_PhotoID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.Photo_UserID_seq

-- DROP SEQUENCE public."Photo_UserID_seq";

CREATE SEQUENCE public."Photo_UserID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."Photo_UserID_seq"
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

-- SEQUENCE: public.UserLogin_UserLoginID_seq

-- DROP SEQUENCE public."UserLogin_UserLoginID_seq";

CREATE SEQUENCE public."UserLogin_UserLoginID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."UserLogin_UserLoginID_seq"
    OWNER TO hmzqodiswhfmef;

-- SEQUENCE: public.User_UserID_seq

-- DROP SEQUENCE public."User_UserID_seq";

CREATE SEQUENCE public."User_UserID_seq"
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."User_UserID_seq"
    OWNER TO hmzqodiswhfmef;

-- Table: public.User

-- DROP TABLE public."User";

CREATE TABLE public."User"
(
    "UserID" integer NOT NULL DEFAULT nextval('public
."User_UserID_seq"'::regclass),
    "Username" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "FirstName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "LastName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Email" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "IsActive" boolean NOT NULL,
    "JoinedDate" date NOT NULL,
    CONSTRAINT "User_PK" PRIMARY KEY ("UserID"),
    CONSTRAINT "Email_Unique" UNIQUE ("Email"),
    CONSTRAINT "Username_Unique" UNIQUE ("Username")
)

TABLESPACE pg_default;

ALTER TABLE public."User"
    OWNER to hmzqodiswhfmef;

-- Table: public.UserLogin

-- DROP TABLE public."UserLogin";

CREATE TABLE public."UserLogin"
(
    "UserLoginID" integer NOT NULL DEFAULT nextval('public
."UserLogin_UserLoginID_seq"'::regclass),
    "Username" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Email" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "PasswordHash" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "IsActive" boolean NOT NULL,
    CONSTRAINT "UserLogin_PK" PRIMARY KEY ("UserLoginID"),
    CONSTRAINT "UserLogin_Email_Unique" UNIQUE ("Email"),
    CONSTRAINT "UserLogin_Username_Unique" UNIQUE ("Username")
)

TABLESPACE pg_default;

ALTER TABLE public."UserLogin"
    OWNER to hmzqodiswhfmef;

-- Table: public.Photo

-- DROP TABLE public."Photo";

CREATE TABLE public."Photo"
(
    "PhotoID" integer NOT NULL DEFAULT nextval('public
."Photo_PhotoID_seq"'::regclass),
    "UserID" integer NOT NULL DEFAULT nextval('public
."Photo_UserID_seq"'::regclass),
    "StorageURL" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "IsActive" boolean NOT NULL,
    "PostedDate" date NOT NULL,
    CONSTRAINT "Photo_PK" PRIMARY KEY ("PhotoID"),
    CONSTRAINT "Photo_User_FK" FOREIGN KEY ("PhotoID")
        REFERENCES public
    ."User" ("UserID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."Photo"
    OWNER to hmzqodiswhfmef;

-- Table: public.Album

-- DROP TABLE public."Album";

CREATE TABLE public."Album"
(
    "AlbumID" integer NOT NULL DEFAULT nextval('public
."Album_AlbumID_seq"'::regclass),
    "UserID" integer NOT NULL DEFAULT nextval('public
."Album_UserID_seq"'::regclass),
    "AlbumName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "IsActive" boolean NOT NULL,
    "CreatedDate" date NOT NULL,
    CONSTRAINT "Album_PK" PRIMARY KEY ("AlbumID"),
    CONSTRAINT "Album_User_FK" FOREIGN KEY ("AlbumID")
        REFERENCES public
    ."User" ("UserID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Album"
    OWNER to hmzqodiswhfmef;

-- Table: public.Metadata

-- DROP TABLE public."Metadata";

CREATE TABLE public."Metadata"
(
    "MetadataID" integer NOT NULL DEFAULT nextval('public
."Metadata_MetadataID_seq"'::regclass),
    "PhotoID" integer NOT NULL DEFAULT nextval('public
."Metadata_PhotoID_seq"'::regclass),
    "GeoLocation" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "CaptureDate" date NOT NULL,
    "TagString" character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT "Metadata_PK" PRIMARY KEY ("MetadataID"),
    CONSTRAINT "Photo_Metadata_FK" FOREIGN KEY ("MetadataID")
        REFERENCES public
    ."Photo" ("PhotoID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public."Metadata"
    OWNER to hmzqodiswhfmef;

-- Table: public.ShareRelationship

-- DROP TABLE public."ShareRelationship";

CREATE TABLE public."ShareRelationship"
(
    "ShareRelationshipID" integer NOT NULL DEFAULT nextval('public
."ShareRelationship_ShareRelationshipID_seq"'::regclass),
    "UserID" integer NOT NULL DEFAULT nextval('public
."ShareRelationship_UserID_seq"'::regclass),
    "IsActive" boolean NOT NULL,
    CONSTRAINT "ShareRelationship_PK" PRIMARY KEY ("ShareRelationshipID"),
    CONSTRAINT "ShareRelationship_UserID_FK" FOREIGN KEY ("ShareRelationshipID")
        REFERENCES public
    ."User" ("UserID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."ShareRelationship"
    OWNER to hmzqodiswhfmef;

-- Table: public.PhotoShareRelationship

-- DROP TABLE public."PhotoShareRelationship";

CREATE TABLE public."PhotoShareRelationship"
(
    "PhotoShareRelationship" integer NOT NULL DEFAULT nextval('public
."PhotoShareRelationship_PhotoShareRelationship_seq"'::regclass),
    "PhotoID" integer NOT NULL DEFAULT nextval('public
."PhotoShareRelationship_PhotoID_seq"'::regclass),
    CONSTRAINT "PhotoShareRelationship_pkey" PRIMARY KEY ("PhotoShareRelationship"),
    CONSTRAINT "PhotoShareRelationship_PhotoID_FK" FOREIGN KEY ("PhotoID")
        REFERENCES public
    ."Photo" ("PhotoID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "PhotoShareRelationship_ShareRelationship_FK" FOREIGN KEY ("PhotoShareRelationship")
        REFERENCES public
    ."ShareRelationship" ("ShareRelationshipID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."PhotoShareRelationship"
    OWNER to hmzqodiswhfmef;

-- Table: public.AlbumShareRelationship

-- DROP TABLE public."AlbumShareRelationship";

CREATE TABLE public."AlbumShareRelationship"
(
    "ShareRelationshipID" integer NOT NULL DEFAULT nextval('public
."AlbumShareRelationship_ShareRelationshipID_seq"'::regclass),
    "AlbumID" integer NOT NULL DEFAULT nextval('public
."AlbumShareRelationship_AlbumID_seq"'::regclass),
    CONSTRAINT "AlbumShareRelationshipID_PK" PRIMARY KEY ("ShareRelationshipID"),
    CONSTRAINT "AlbumShareRelationshipID_ShareRelationshipID_FK" FOREIGN KEY ("ShareRelationshipID")
        REFERENCES public
    ."ShareRelationship" ("ShareRelationshipID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "PhotoShareRelationship_AlbumID_FK" FOREIGN KEY ("AlbumID")
        REFERENCES public
    ."Album" ("AlbumID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public."AlbumShareRelationship"
    OWNER to hmzqodiswhfmef;