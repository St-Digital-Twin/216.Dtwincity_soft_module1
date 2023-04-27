CREATE FUNCTION getallinds() RETURNS SETOF indicator AS $$
  SELECT * FROM indicator;
$$ LANGUAGE SQL IMMUTABLE;


CREATE FUNCTION add_them(a integer, b integer)
RETURNS integer AS $$
 SELECT a + b;
$$ LANGUAGE SQL IMMUTABLE;