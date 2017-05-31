CREATE TABLE public.post
  (
      id SERIAL PRIMARY KEY NOT NULL,
      created TIMESTAMP DEFAULT now() NOT NULL,
      title TEXT,
      content TEXT
  );
CREATE UNIQUE INDEX post_id_uindex ON public.post (id);