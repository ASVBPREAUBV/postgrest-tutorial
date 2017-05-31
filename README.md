# PostgREST Tutorial
PostgREST Doku:
	https://postgrest.com/en/v0.4/admin.html

This repo ist just a small personal project to remember postgrest configs.

1. Download bin/build or hombrew postgREST
2. Put bin in $PATH or run locally with 

        ./progrest [args]
3. Run postgresDB in a container (not recommended for production)

        docker run --name postgres  -e POSTGRES_PASSWORD=db_admin_pw -e POSTGRES_DB=tutorial -d -p 5432:5432 postgres

4. Start postgREST -> Should run on http://localhost:3000/
        
        ./postgrest sample.conf

5. Create a User anonymous in the DB
6. start swaggerUI
     
        docker run -p 80:8080 swaggerapi/swagger-ui

7. go to http://localhost/ an insert http://localhost:3000/ in swagger to load SwaggerConfig

