GRANT USAGE ON SCHEMA public TO anonymous;
CREATE ROLE anonymous;
GRANT ALL ON TABLE post TO anonymous;
GRANT ALL ON TABLE post_id_seq TO anonymous;