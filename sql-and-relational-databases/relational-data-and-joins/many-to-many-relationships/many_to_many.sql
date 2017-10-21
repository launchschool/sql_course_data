ALTER TABLE IF EXISTS ONLY public.books_categories DROP CONSTRAINT IF EXISTS books_categories_category_id_fkey;
ALTER TABLE IF EXISTS ONLY public.books_categories DROP CONSTRAINT IF EXISTS books_categories_book_id_fkey;
ALTER TABLE IF EXISTS ONLY public.categories DROP CONSTRAINT IF EXISTS categories_pkey;
ALTER TABLE IF EXISTS ONLY public.books DROP CONSTRAINT IF EXISTS books_pkey;
ALTER TABLE IF EXISTS public.categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.books ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.categories_id_seq;
DROP TABLE IF EXISTS public.categories;
DROP SEQUENCE IF EXISTS public.books_id_seq;
DROP TABLE IF EXISTS public.books_categories;
DROP TABLE IF EXISTS public.books;


CREATE TABLE books (
    id integer NOT NULL,
    title character varying(32) NOT NULL,
    author character varying(32) NOT NULL
);

CREATE TABLE books_categories (
    book_id integer,
    category_id integer
);

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(32) NOT NULL
);

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);

INSERT INTO books VALUES (1, 'A Tale of Two Cities', 'Charles Dickens');
INSERT INTO books VALUES (2, 'Harry Potter', 'J. K. Rowling');
INSERT INTO books VALUES (3, 'Einstein: His Life and Universe', 'Walter Isaacson');


INSERT INTO books_categories VALUES (1, 2);
INSERT INTO books_categories VALUES (1, 4);
INSERT INTO books_categories VALUES (2, 2);
INSERT INTO books_categories VALUES (2, 3);
INSERT INTO books_categories VALUES (3, 1);
INSERT INTO books_categories VALUES (3, 5);
INSERT INTO books_categories VALUES (3, 6);

SELECT pg_catalog.setval('books_id_seq', 3, true);


INSERT INTO categories VALUES (1, 'Nonfiction');
INSERT INTO categories VALUES (2, 'Fiction');
INSERT INTO categories VALUES (3, 'Fantasy');
INSERT INTO categories VALUES (4, 'Classics');
INSERT INTO categories VALUES (5, 'Biography');
INSERT INTO categories VALUES (6, 'Physics');

SELECT pg_catalog.setval('categories_id_seq', 6, true);



ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);

ALTER TABLE ONLY books_categories
    ADD CONSTRAINT books_categories_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id);

ALTER TABLE ONLY books_categories
    ADD CONSTRAINT books_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES categories(id);