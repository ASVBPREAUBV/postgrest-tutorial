# PostgREST Tutorial
PostgREST Doku:
	https://postgrest.com/en/v0.4/admin.html

This repo is no real tutorial just to remember the initialisation process for my own configs.
But i think if you are totally new to postgREST i might help.

## Initialisation
1. Download bin/build or hombrew postgREST
2. Put bin in $PATH or run locally with 

        ./progrest [args]
3. Run postgresDB in a container (not recommended for production)

        docker run --name postgres  -e POSTGRES_PASSWORD=db_admin_pw -e POSTGRES_DB=tutorial -d -p 5432:5432 postgres

4. Start postgREST -> Should run on http://localhost:3000/ but you should have no access
        
        ./postgrest sample.conf

5. Create a User anonymous in the DB
6. start swaggerUI
     
        docker run -p 80:8080 swaggerapi/swagger-ui

7. go to http://localhost/ an insert http://localhost:3000/ in swagger to load SwaggerConfig

The empty database is now running and exposing the public schema to the anonymous user.

## Starting with a simple model

1. Create a sample table with anonymous access for our blog
        
        #Create the Table
        CREATE TABLE public.post
        (   
            id SERIAL PRIMARY KEY NOT NULL,
            created TIMESTAMP DEFAULT now() NOT NULL,
            title TEXT,
            content TEXT
        );
        # automatically increment posts id
        CREATE UNIQUE INDEX post_id_uindex ON public.post (id);
        
2. Create the Role anonymous
    
        CREATE ROLE anonymous;

3. Grant anonymous access to our table
    
        GRANT ALL ON TABLE post TO anonymous;
        GRANT ALL ON TABLE post_id_seq TO anonymous;

4. All done. you should be able to GET,POST,UPDATE,PATCH on localhost:3000/posts now
    
## Enable basic Auth by DB
[Follow the steps on the docs here](https://postgrest.com/en/v0.4/auth.html#sql-user-management)

## Use psql to create data

    psql -f db/post_init.sql --host=localhost --port=5432 --username=postgres 
