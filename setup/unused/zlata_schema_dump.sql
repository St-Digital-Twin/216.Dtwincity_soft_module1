--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2023-03-03 14:03:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 252121)
-- Name: zlata; Type: SCHEMA; Schema: -; Owner: postgres2
--

CREATE SCHEMA zlata;


ALTER SCHEMA zlata OWNER TO postgres2;

--
-- TOC entry 380 (class 1255 OID 254987)
-- Name: get_actual_datasets(); Type: FUNCTION; Schema: zlata; Owner: postgres2
--

CREATE FUNCTION zlata.get_actual_datasets(OUT load_num integer, OUT rows numeric, OUT file_name character varying, OUT file_created date, OUT locations character varying, OUT indicators character varying, OUT okved character varying, OUT scenarios character varying, OUT description character varying) RETURNS SETOF record
    LANGUAGE sql
    AS $$
----
SELECT load_num, sum(rows) as rows,  file_name, file_created, locations,indicators, okved, scenarios, description
from zlata.load_logs
inner join  (	
		select  load_num, count(id) as rows from zlata.gold_0
			group by load_num
			union
			select  load_num, count(id) as rows from zlata.gold_1
			group by load_num
			union
			select  load_num, count(id) as rows from zlata.gold_2
			group by load_num
			union
			select  load_num, count(id) as rows from zlata.gold_3
			group by load_num
			union
			select  load_num, count(id) as rows from zlata.gold_4
			group by load_num
			union
			select  load_num, count(id) as rows from zlata.gold_5
			group by load_num
			union
			select  load_num, count(id) as rows from zlata.gold_6
			group by load_num
			union
			select  load_num, count(id) as rows from zlata.gold_7
			group by load_num
			union
			select  load_num, count(id) as rows from zlata.gold_8
			group by load_num
			union
			select  load_num, count(id) as rows from zlata.gold_9
			group by load_num) as l
		
using(load_num)
group by load_logs.load_num
order by rows desc 
---
$$;


ALTER FUNCTION zlata.get_actual_datasets(OUT load_num integer, OUT rows numeric, OUT file_name character varying, OUT file_created date, OUT locations character varying, OUT indicators character varying, OUT okved character varying, OUT scenarios character varying, OUT description character varying) OWNER TO postgres2;

--
-- TOC entry 381 (class 1255 OID 255111)
-- Name: get_data_volume(); Type: FUNCTION; Schema: zlata; Owner: postgres2
--

CREATE FUNCTION zlata.get_data_volume() RETURNS numeric
    LANGUAGE sql
    AS $$
select sum(amount) as data_volume from (    
SELECT  count("Y1999") +  count("Y2000") +  count("Y2001") +  count("Y2002") +  count("Y2003") +  count("Y2004") +  count("Y2005") +  count("Y2006") +  count("Y2007") +  count("Y2008") +  count("Y2009") +  count("Y2010") +  count("Y2011") +  count("Y2012") +  count("Y2013") +  count("Y2014") +  count("Y2015") +  count("Y2016") +  count("Y2017") +  count("Y2018") +  count("Y2019") +  count("Y2020") +  count("Y2021") +  count("Y2022") +  count("Y2023") +  count("Y2024") +  count("Y2025") +  count("Y2026") +  count("Y2027") +  count("Y2028") +  count("Y2029") +  count("Y2030") +  count("Y2031") +  count("Y2032") +  count("Y2033") +  count("Y2034") +  count("Y2035") +  count("Y2036") +  count("Y2037") +  count("Y2038") +  count("Y2039") +  count("Y2040") +  count("Y2041") +  count("Y2042") +  count("Y2043") +  count("Y2044") +  count("Y2045") +  count("Y2046") +  count("Y2047") +  count("Y2048") +  count("Y2049") +  count("Y2050") +  count("Y2051") +  count("Y2052") +  count("Y2053") +  count("Y2054") +  count("Y2055") +  count("Y2056") +  count("Y2057") +  count("Y2058") +  count("Y2059") +  count("Y2060") +  count("Y2061") +  count("Y2062") +  count("Y2063") +  count("Y2064") +  count("Y2065") +  count("Y2066") +  count("Y2067") +  count("Y2068") +  count("Y2069") +  count("Y2070") +  count("Y2071") +  count("Y2072") +  count("Y2073") +  count("Y2074") +  count("Y2075") +  count("Y2076") +  count("Y2077") +  count("Y2078") +  count("Y2079") +  count("Y2080") +  count("Y2081") +  count("Y2082") +  count("Y2083") +  count("Y2084") +  count("Y2085") +  count("Y2086") +  count("Y2087") +  count("Y2088") +  count("Y2089") +  count("Y2090") +  count("Y2091") +  count("Y2092") +  count("Y2093") +  count("Y2094") +  count("Y2095") +  count("Y2096") +  count("Y2097") +  count("Y2098") +  count("Y2099") +  count("Y2100") +  count("Y2101") +  count("Y2102") +  count("Y2103") +  count("Y2104") +  count("Y2105") +  count("Y2106") +  count("Y2107") +  count("Y2108") +  count("Y2109") +  count("Y2110") +  count("Y2111") +  count("Y2112") +  count("Y2113") +  count("Y2114") +  count("Y2115") +  count("Y2116") +  count("Y2117") +  count("Y2118") +  count("Y2119") +  count("Y2120") +  count("Y2121") as amount
 FROM zlata.gold_0
 union
 SELECT  count("Y1999") +  count("Y2000") +  count("Y2001") +  count("Y2002") +  count("Y2003") +  count("Y2004") +  count("Y2005") +  count("Y2006") +  count("Y2007") +  count("Y2008") +  count("Y2009") +  count("Y2010") +  count("Y2011") +  count("Y2012") +  count("Y2013") +  count("Y2014") +  count("Y2015") +  count("Y2016") +  count("Y2017") +  count("Y2018") +  count("Y2019") +  count("Y2020") +  count("Y2021") +  count("Y2022") +  count("Y2023") +  count("Y2024") +  count("Y2025") +  count("Y2026") +  count("Y2027") +  count("Y2028") +  count("Y2029") +  count("Y2030") +  count("Y2031") +  count("Y2032") +  count("Y2033") +  count("Y2034") +  count("Y2035") +  count("Y2036") +  count("Y2037") +  count("Y2038") +  count("Y2039") +  count("Y2040") +  count("Y2041") +  count("Y2042") +  count("Y2043") +  count("Y2044") +  count("Y2045") +  count("Y2046") +  count("Y2047") +  count("Y2048") +  count("Y2049") +  count("Y2050") +  count("Y2051") +  count("Y2052") +  count("Y2053") +  count("Y2054") +  count("Y2055") +  count("Y2056") +  count("Y2057") +  count("Y2058") +  count("Y2059") +  count("Y2060") +  count("Y2061") +  count("Y2062") +  count("Y2063") +  count("Y2064") +  count("Y2065") +  count("Y2066") +  count("Y2067") +  count("Y2068") +  count("Y2069") +  count("Y2070") +  count("Y2071") +  count("Y2072") +  count("Y2073") +  count("Y2074") +  count("Y2075") +  count("Y2076") +  count("Y2077") +  count("Y2078") +  count("Y2079") +  count("Y2080") +  count("Y2081") +  count("Y2082") +  count("Y2083") +  count("Y2084") +  count("Y2085") +  count("Y2086") +  count("Y2087") +  count("Y2088") +  count("Y2089") +  count("Y2090") +  count("Y2091") +  count("Y2092") +  count("Y2093") +  count("Y2094") +  count("Y2095") +  count("Y2096") +  count("Y2097") +  count("Y2098") +  count("Y2099") +  count("Y2100") +  count("Y2101") +  count("Y2102") +  count("Y2103") +  count("Y2104") +  count("Y2105") +  count("Y2106") +  count("Y2107") +  count("Y2108") +  count("Y2109") +  count("Y2110") +  count("Y2111") +  count("Y2112") +  count("Y2113") +  count("Y2114") +  count("Y2115") +  count("Y2116") +  count("Y2117") +  count("Y2118") +  count("Y2119") +  count("Y2120") +  count("Y2121") as amount
 FROM zlata.gold_1
 union
 SELECT  count("Y1999") +  count("Y2000") +  count("Y2001") +  count("Y2002") +  count("Y2003") +  count("Y2004") +  count("Y2005") +  count("Y2006") +  count("Y2007") +  count("Y2008") +  count("Y2009") +  count("Y2010") +  count("Y2011") +  count("Y2012") +  count("Y2013") +  count("Y2014") +  count("Y2015") +  count("Y2016") +  count("Y2017") +  count("Y2018") +  count("Y2019") +  count("Y2020") +  count("Y2021") +  count("Y2022") +  count("Y2023") +  count("Y2024") +  count("Y2025") +  count("Y2026") +  count("Y2027") +  count("Y2028") +  count("Y2029") +  count("Y2030") +  count("Y2031") +  count("Y2032") +  count("Y2033") +  count("Y2034") +  count("Y2035") +  count("Y2036") +  count("Y2037") +  count("Y2038") +  count("Y2039") +  count("Y2040") +  count("Y2041") +  count("Y2042") +  count("Y2043") +  count("Y2044") +  count("Y2045") +  count("Y2046") +  count("Y2047") +  count("Y2048") +  count("Y2049") +  count("Y2050") +  count("Y2051") +  count("Y2052") +  count("Y2053") +  count("Y2054") +  count("Y2055") +  count("Y2056") +  count("Y2057") +  count("Y2058") +  count("Y2059") +  count("Y2060") +  count("Y2061") +  count("Y2062") +  count("Y2063") +  count("Y2064") +  count("Y2065") +  count("Y2066") +  count("Y2067") +  count("Y2068") +  count("Y2069") +  count("Y2070") +  count("Y2071") +  count("Y2072") +  count("Y2073") +  count("Y2074") +  count("Y2075") +  count("Y2076") +  count("Y2077") +  count("Y2078") +  count("Y2079") +  count("Y2080") +  count("Y2081") +  count("Y2082") +  count("Y2083") +  count("Y2084") +  count("Y2085") +  count("Y2086") +  count("Y2087") +  count("Y2088") +  count("Y2089") +  count("Y2090") +  count("Y2091") +  count("Y2092") +  count("Y2093") +  count("Y2094") +  count("Y2095") +  count("Y2096") +  count("Y2097") +  count("Y2098") +  count("Y2099") +  count("Y2100") +  count("Y2101") +  count("Y2102") +  count("Y2103") +  count("Y2104") +  count("Y2105") +  count("Y2106") +  count("Y2107") +  count("Y2108") +  count("Y2109") +  count("Y2110") +  count("Y2111") +  count("Y2112") +  count("Y2113") +  count("Y2114") +  count("Y2115") +  count("Y2116") +  count("Y2117") +  count("Y2118") +  count("Y2119") +  count("Y2120") +  count("Y2121") as amount
 FROM zlata.gold_2
	 union
 SELECT  count("Y1999") +  count("Y2000") +  count("Y2001") +  count("Y2002") +  count("Y2003") +  count("Y2004") +  count("Y2005") +  count("Y2006") +  count("Y2007") +  count("Y2008") +  count("Y2009") +  count("Y2010") +  count("Y2011") +  count("Y2012") +  count("Y2013") +  count("Y2014") +  count("Y2015") +  count("Y2016") +  count("Y2017") +  count("Y2018") +  count("Y2019") +  count("Y2020") +  count("Y2021") +  count("Y2022") +  count("Y2023") +  count("Y2024") +  count("Y2025") +  count("Y2026") +  count("Y2027") +  count("Y2028") +  count("Y2029") +  count("Y2030") +  count("Y2031") +  count("Y2032") +  count("Y2033") +  count("Y2034") +  count("Y2035") +  count("Y2036") +  count("Y2037") +  count("Y2038") +  count("Y2039") +  count("Y2040") +  count("Y2041") +  count("Y2042") +  count("Y2043") +  count("Y2044") +  count("Y2045") +  count("Y2046") +  count("Y2047") +  count("Y2048") +  count("Y2049") +  count("Y2050") +  count("Y2051") +  count("Y2052") +  count("Y2053") +  count("Y2054") +  count("Y2055") +  count("Y2056") +  count("Y2057") +  count("Y2058") +  count("Y2059") +  count("Y2060") +  count("Y2061") +  count("Y2062") +  count("Y2063") +  count("Y2064") +  count("Y2065") +  count("Y2066") +  count("Y2067") +  count("Y2068") +  count("Y2069") +  count("Y2070") +  count("Y2071") +  count("Y2072") +  count("Y2073") +  count("Y2074") +  count("Y2075") +  count("Y2076") +  count("Y2077") +  count("Y2078") +  count("Y2079") +  count("Y2080") +  count("Y2081") +  count("Y2082") +  count("Y2083") +  count("Y2084") +  count("Y2085") +  count("Y2086") +  count("Y2087") +  count("Y2088") +  count("Y2089") +  count("Y2090") +  count("Y2091") +  count("Y2092") +  count("Y2093") +  count("Y2094") +  count("Y2095") +  count("Y2096") +  count("Y2097") +  count("Y2098") +  count("Y2099") +  count("Y2100") +  count("Y2101") +  count("Y2102") +  count("Y2103") +  count("Y2104") +  count("Y2105") +  count("Y2106") +  count("Y2107") +  count("Y2108") +  count("Y2109") +  count("Y2110") +  count("Y2111") +  count("Y2112") +  count("Y2113") +  count("Y2114") +  count("Y2115") +  count("Y2116") +  count("Y2117") +  count("Y2118") +  count("Y2119") +  count("Y2120") +  count("Y2121") as amount
 FROM zlata.gold_3
	 union
 SELECT  count("Y1999") +  count("Y2000") +  count("Y2001") +  count("Y2002") +  count("Y2003") +  count("Y2004") +  count("Y2005") +  count("Y2006") +  count("Y2007") +  count("Y2008") +  count("Y2009") +  count("Y2010") +  count("Y2011") +  count("Y2012") +  count("Y2013") +  count("Y2014") +  count("Y2015") +  count("Y2016") +  count("Y2017") +  count("Y2018") +  count("Y2019") +  count("Y2020") +  count("Y2021") +  count("Y2022") +  count("Y2023") +  count("Y2024") +  count("Y2025") +  count("Y2026") +  count("Y2027") +  count("Y2028") +  count("Y2029") +  count("Y2030") +  count("Y2031") +  count("Y2032") +  count("Y2033") +  count("Y2034") +  count("Y2035") +  count("Y2036") +  count("Y2037") +  count("Y2038") +  count("Y2039") +  count("Y2040") +  count("Y2041") +  count("Y2042") +  count("Y2043") +  count("Y2044") +  count("Y2045") +  count("Y2046") +  count("Y2047") +  count("Y2048") +  count("Y2049") +  count("Y2050") +  count("Y2051") +  count("Y2052") +  count("Y2053") +  count("Y2054") +  count("Y2055") +  count("Y2056") +  count("Y2057") +  count("Y2058") +  count("Y2059") +  count("Y2060") +  count("Y2061") +  count("Y2062") +  count("Y2063") +  count("Y2064") +  count("Y2065") +  count("Y2066") +  count("Y2067") +  count("Y2068") +  count("Y2069") +  count("Y2070") +  count("Y2071") +  count("Y2072") +  count("Y2073") +  count("Y2074") +  count("Y2075") +  count("Y2076") +  count("Y2077") +  count("Y2078") +  count("Y2079") +  count("Y2080") +  count("Y2081") +  count("Y2082") +  count("Y2083") +  count("Y2084") +  count("Y2085") +  count("Y2086") +  count("Y2087") +  count("Y2088") +  count("Y2089") +  count("Y2090") +  count("Y2091") +  count("Y2092") +  count("Y2093") +  count("Y2094") +  count("Y2095") +  count("Y2096") +  count("Y2097") +  count("Y2098") +  count("Y2099") +  count("Y2100") +  count("Y2101") +  count("Y2102") +  count("Y2103") +  count("Y2104") +  count("Y2105") +  count("Y2106") +  count("Y2107") +  count("Y2108") +  count("Y2109") +  count("Y2110") +  count("Y2111") +  count("Y2112") +  count("Y2113") +  count("Y2114") +  count("Y2115") +  count("Y2116") +  count("Y2117") +  count("Y2118") +  count("Y2119") +  count("Y2120") +  count("Y2121") as amount
 FROM zlata.gold_4
	 union
 SELECT  count("Y1999") +  count("Y2000") +  count("Y2001") +  count("Y2002") +  count("Y2003") +  count("Y2004") +  count("Y2005") +  count("Y2006") +  count("Y2007") +  count("Y2008") +  count("Y2009") +  count("Y2010") +  count("Y2011") +  count("Y2012") +  count("Y2013") +  count("Y2014") +  count("Y2015") +  count("Y2016") +  count("Y2017") +  count("Y2018") +  count("Y2019") +  count("Y2020") +  count("Y2021") +  count("Y2022") +  count("Y2023") +  count("Y2024") +  count("Y2025") +  count("Y2026") +  count("Y2027") +  count("Y2028") +  count("Y2029") +  count("Y2030") +  count("Y2031") +  count("Y2032") +  count("Y2033") +  count("Y2034") +  count("Y2035") +  count("Y2036") +  count("Y2037") +  count("Y2038") +  count("Y2039") +  count("Y2040") +  count("Y2041") +  count("Y2042") +  count("Y2043") +  count("Y2044") +  count("Y2045") +  count("Y2046") +  count("Y2047") +  count("Y2048") +  count("Y2049") +  count("Y2050") +  count("Y2051") +  count("Y2052") +  count("Y2053") +  count("Y2054") +  count("Y2055") +  count("Y2056") +  count("Y2057") +  count("Y2058") +  count("Y2059") +  count("Y2060") +  count("Y2061") +  count("Y2062") +  count("Y2063") +  count("Y2064") +  count("Y2065") +  count("Y2066") +  count("Y2067") +  count("Y2068") +  count("Y2069") +  count("Y2070") +  count("Y2071") +  count("Y2072") +  count("Y2073") +  count("Y2074") +  count("Y2075") +  count("Y2076") +  count("Y2077") +  count("Y2078") +  count("Y2079") +  count("Y2080") +  count("Y2081") +  count("Y2082") +  count("Y2083") +  count("Y2084") +  count("Y2085") +  count("Y2086") +  count("Y2087") +  count("Y2088") +  count("Y2089") +  count("Y2090") +  count("Y2091") +  count("Y2092") +  count("Y2093") +  count("Y2094") +  count("Y2095") +  count("Y2096") +  count("Y2097") +  count("Y2098") +  count("Y2099") +  count("Y2100") +  count("Y2101") +  count("Y2102") +  count("Y2103") +  count("Y2104") +  count("Y2105") +  count("Y2106") +  count("Y2107") +  count("Y2108") +  count("Y2109") +  count("Y2110") +  count("Y2111") +  count("Y2112") +  count("Y2113") +  count("Y2114") +  count("Y2115") +  count("Y2116") +  count("Y2117") +  count("Y2118") +  count("Y2119") +  count("Y2120") +  count("Y2121") as amount
 FROM zlata.gold_5
	 union
 SELECT  count("Y1999") +  count("Y2000") +  count("Y2001") +  count("Y2002") +  count("Y2003") +  count("Y2004") +  count("Y2005") +  count("Y2006") +  count("Y2007") +  count("Y2008") +  count("Y2009") +  count("Y2010") +  count("Y2011") +  count("Y2012") +  count("Y2013") +  count("Y2014") +  count("Y2015") +  count("Y2016") +  count("Y2017") +  count("Y2018") +  count("Y2019") +  count("Y2020") +  count("Y2021") +  count("Y2022") +  count("Y2023") +  count("Y2024") +  count("Y2025") +  count("Y2026") +  count("Y2027") +  count("Y2028") +  count("Y2029") +  count("Y2030") +  count("Y2031") +  count("Y2032") +  count("Y2033") +  count("Y2034") +  count("Y2035") +  count("Y2036") +  count("Y2037") +  count("Y2038") +  count("Y2039") +  count("Y2040") +  count("Y2041") +  count("Y2042") +  count("Y2043") +  count("Y2044") +  count("Y2045") +  count("Y2046") +  count("Y2047") +  count("Y2048") +  count("Y2049") +  count("Y2050") +  count("Y2051") +  count("Y2052") +  count("Y2053") +  count("Y2054") +  count("Y2055") +  count("Y2056") +  count("Y2057") +  count("Y2058") +  count("Y2059") +  count("Y2060") +  count("Y2061") +  count("Y2062") +  count("Y2063") +  count("Y2064") +  count("Y2065") +  count("Y2066") +  count("Y2067") +  count("Y2068") +  count("Y2069") +  count("Y2070") +  count("Y2071") +  count("Y2072") +  count("Y2073") +  count("Y2074") +  count("Y2075") +  count("Y2076") +  count("Y2077") +  count("Y2078") +  count("Y2079") +  count("Y2080") +  count("Y2081") +  count("Y2082") +  count("Y2083") +  count("Y2084") +  count("Y2085") +  count("Y2086") +  count("Y2087") +  count("Y2088") +  count("Y2089") +  count("Y2090") +  count("Y2091") +  count("Y2092") +  count("Y2093") +  count("Y2094") +  count("Y2095") +  count("Y2096") +  count("Y2097") +  count("Y2098") +  count("Y2099") +  count("Y2100") +  count("Y2101") +  count("Y2102") +  count("Y2103") +  count("Y2104") +  count("Y2105") +  count("Y2106") +  count("Y2107") +  count("Y2108") +  count("Y2109") +  count("Y2110") +  count("Y2111") +  count("Y2112") +  count("Y2113") +  count("Y2114") +  count("Y2115") +  count("Y2116") +  count("Y2117") +  count("Y2118") +  count("Y2119") +  count("Y2120") +  count("Y2121") as amount
 FROM zlata.gold_6
	 union
 SELECT  count("Y1999") +  count("Y2000") +  count("Y2001") +  count("Y2002") +  count("Y2003") +  count("Y2004") +  count("Y2005") +  count("Y2006") +  count("Y2007") +  count("Y2008") +  count("Y2009") +  count("Y2010") +  count("Y2011") +  count("Y2012") +  count("Y2013") +  count("Y2014") +  count("Y2015") +  count("Y2016") +  count("Y2017") +  count("Y2018") +  count("Y2019") +  count("Y2020") +  count("Y2021") +  count("Y2022") +  count("Y2023") +  count("Y2024") +  count("Y2025") +  count("Y2026") +  count("Y2027") +  count("Y2028") +  count("Y2029") +  count("Y2030") +  count("Y2031") +  count("Y2032") +  count("Y2033") +  count("Y2034") +  count("Y2035") +  count("Y2036") +  count("Y2037") +  count("Y2038") +  count("Y2039") +  count("Y2040") +  count("Y2041") +  count("Y2042") +  count("Y2043") +  count("Y2044") +  count("Y2045") +  count("Y2046") +  count("Y2047") +  count("Y2048") +  count("Y2049") +  count("Y2050") +  count("Y2051") +  count("Y2052") +  count("Y2053") +  count("Y2054") +  count("Y2055") +  count("Y2056") +  count("Y2057") +  count("Y2058") +  count("Y2059") +  count("Y2060") +  count("Y2061") +  count("Y2062") +  count("Y2063") +  count("Y2064") +  count("Y2065") +  count("Y2066") +  count("Y2067") +  count("Y2068") +  count("Y2069") +  count("Y2070") +  count("Y2071") +  count("Y2072") +  count("Y2073") +  count("Y2074") +  count("Y2075") +  count("Y2076") +  count("Y2077") +  count("Y2078") +  count("Y2079") +  count("Y2080") +  count("Y2081") +  count("Y2082") +  count("Y2083") +  count("Y2084") +  count("Y2085") +  count("Y2086") +  count("Y2087") +  count("Y2088") +  count("Y2089") +  count("Y2090") +  count("Y2091") +  count("Y2092") +  count("Y2093") +  count("Y2094") +  count("Y2095") +  count("Y2096") +  count("Y2097") +  count("Y2098") +  count("Y2099") +  count("Y2100") +  count("Y2101") +  count("Y2102") +  count("Y2103") +  count("Y2104") +  count("Y2105") +  count("Y2106") +  count("Y2107") +  count("Y2108") +  count("Y2109") +  count("Y2110") +  count("Y2111") +  count("Y2112") +  count("Y2113") +  count("Y2114") +  count("Y2115") +  count("Y2116") +  count("Y2117") +  count("Y2118") +  count("Y2119") +  count("Y2120") +  count("Y2121") as amount
 FROM zlata.gold_7
	 union
 SELECT  count("Y1999") +  count("Y2000") +  count("Y2001") +  count("Y2002") +  count("Y2003") +  count("Y2004") +  count("Y2005") +  count("Y2006") +  count("Y2007") +  count("Y2008") +  count("Y2009") +  count("Y2010") +  count("Y2011") +  count("Y2012") +  count("Y2013") +  count("Y2014") +  count("Y2015") +  count("Y2016") +  count("Y2017") +  count("Y2018") +  count("Y2019") +  count("Y2020") +  count("Y2021") +  count("Y2022") +  count("Y2023") +  count("Y2024") +  count("Y2025") +  count("Y2026") +  count("Y2027") +  count("Y2028") +  count("Y2029") +  count("Y2030") +  count("Y2031") +  count("Y2032") +  count("Y2033") +  count("Y2034") +  count("Y2035") +  count("Y2036") +  count("Y2037") +  count("Y2038") +  count("Y2039") +  count("Y2040") +  count("Y2041") +  count("Y2042") +  count("Y2043") +  count("Y2044") +  count("Y2045") +  count("Y2046") +  count("Y2047") +  count("Y2048") +  count("Y2049") +  count("Y2050") +  count("Y2051") +  count("Y2052") +  count("Y2053") +  count("Y2054") +  count("Y2055") +  count("Y2056") +  count("Y2057") +  count("Y2058") +  count("Y2059") +  count("Y2060") +  count("Y2061") +  count("Y2062") +  count("Y2063") +  count("Y2064") +  count("Y2065") +  count("Y2066") +  count("Y2067") +  count("Y2068") +  count("Y2069") +  count("Y2070") +  count("Y2071") +  count("Y2072") +  count("Y2073") +  count("Y2074") +  count("Y2075") +  count("Y2076") +  count("Y2077") +  count("Y2078") +  count("Y2079") +  count("Y2080") +  count("Y2081") +  count("Y2082") +  count("Y2083") +  count("Y2084") +  count("Y2085") +  count("Y2086") +  count("Y2087") +  count("Y2088") +  count("Y2089") +  count("Y2090") +  count("Y2091") +  count("Y2092") +  count("Y2093") +  count("Y2094") +  count("Y2095") +  count("Y2096") +  count("Y2097") +  count("Y2098") +  count("Y2099") +  count("Y2100") +  count("Y2101") +  count("Y2102") +  count("Y2103") +  count("Y2104") +  count("Y2105") +  count("Y2106") +  count("Y2107") +  count("Y2108") +  count("Y2109") +  count("Y2110") +  count("Y2111") +  count("Y2112") +  count("Y2113") +  count("Y2114") +  count("Y2115") +  count("Y2116") +  count("Y2117") +  count("Y2118") +  count("Y2119") +  count("Y2120") +  count("Y2121") as amount
 FROM zlata.gold_8
	 union
 SELECT  count("Y1999") +  count("Y2000") +  count("Y2001") +  count("Y2002") +  count("Y2003") +  count("Y2004") +  count("Y2005") +  count("Y2006") +  count("Y2007") +  count("Y2008") +  count("Y2009") +  count("Y2010") +  count("Y2011") +  count("Y2012") +  count("Y2013") +  count("Y2014") +  count("Y2015") +  count("Y2016") +  count("Y2017") +  count("Y2018") +  count("Y2019") +  count("Y2020") +  count("Y2021") +  count("Y2022") +  count("Y2023") +  count("Y2024") +  count("Y2025") +  count("Y2026") +  count("Y2027") +  count("Y2028") +  count("Y2029") +  count("Y2030") +  count("Y2031") +  count("Y2032") +  count("Y2033") +  count("Y2034") +  count("Y2035") +  count("Y2036") +  count("Y2037") +  count("Y2038") +  count("Y2039") +  count("Y2040") +  count("Y2041") +  count("Y2042") +  count("Y2043") +  count("Y2044") +  count("Y2045") +  count("Y2046") +  count("Y2047") +  count("Y2048") +  count("Y2049") +  count("Y2050") +  count("Y2051") +  count("Y2052") +  count("Y2053") +  count("Y2054") +  count("Y2055") +  count("Y2056") +  count("Y2057") +  count("Y2058") +  count("Y2059") +  count("Y2060") +  count("Y2061") +  count("Y2062") +  count("Y2063") +  count("Y2064") +  count("Y2065") +  count("Y2066") +  count("Y2067") +  count("Y2068") +  count("Y2069") +  count("Y2070") +  count("Y2071") +  count("Y2072") +  count("Y2073") +  count("Y2074") +  count("Y2075") +  count("Y2076") +  count("Y2077") +  count("Y2078") +  count("Y2079") +  count("Y2080") +  count("Y2081") +  count("Y2082") +  count("Y2083") +  count("Y2084") +  count("Y2085") +  count("Y2086") +  count("Y2087") +  count("Y2088") +  count("Y2089") +  count("Y2090") +  count("Y2091") +  count("Y2092") +  count("Y2093") +  count("Y2094") +  count("Y2095") +  count("Y2096") +  count("Y2097") +  count("Y2098") +  count("Y2099") +  count("Y2100") +  count("Y2101") +  count("Y2102") +  count("Y2103") +  count("Y2104") +  count("Y2105") +  count("Y2106") +  count("Y2107") +  count("Y2108") +  count("Y2109") +  count("Y2110") +  count("Y2111") +  count("Y2112") +  count("Y2113") +  count("Y2114") +  count("Y2115") +  count("Y2116") +  count("Y2117") +  count("Y2118") +  count("Y2119") +  count("Y2120") +  count("Y2121") as amount
 FROM zlata.gold_9







) as q1
	
$$;


ALTER FUNCTION zlata.get_data_volume() OWNER TO postgres2;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 311 (class 1259 OID 254495)
-- Name: gold_0; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.gold_0 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    load_num integer,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.gold_0 OWNER TO postgres2;

--
-- TOC entry 310 (class 1259 OID 254493)
-- Name: gold_0_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.gold_0_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.gold_0_id_seq OWNER TO postgres2;

--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 310
-- Name: gold_0_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.gold_0_id_seq OWNED BY zlata.gold_0.id;


--
-- TOC entry 313 (class 1259 OID 254511)
-- Name: gold_1; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.gold_1 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    load_num integer,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.gold_1 OWNER TO postgres2;

--
-- TOC entry 312 (class 1259 OID 254509)
-- Name: gold_1_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.gold_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.gold_1_id_seq OWNER TO postgres2;

--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 312
-- Name: gold_1_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.gold_1_id_seq OWNED BY zlata.gold_1.id;


--
-- TOC entry 315 (class 1259 OID 254527)
-- Name: gold_2; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.gold_2 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    load_num integer,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.gold_2 OWNER TO postgres2;

--
-- TOC entry 314 (class 1259 OID 254525)
-- Name: gold_2_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.gold_2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.gold_2_id_seq OWNER TO postgres2;

--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 314
-- Name: gold_2_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.gold_2_id_seq OWNED BY zlata.gold_2.id;


--
-- TOC entry 317 (class 1259 OID 254543)
-- Name: gold_3; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.gold_3 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    load_num integer,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.gold_3 OWNER TO postgres2;

--
-- TOC entry 316 (class 1259 OID 254541)
-- Name: gold_3_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.gold_3_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.gold_3_id_seq OWNER TO postgres2;

--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 316
-- Name: gold_3_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.gold_3_id_seq OWNED BY zlata.gold_3.id;


--
-- TOC entry 319 (class 1259 OID 254559)
-- Name: gold_4; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.gold_4 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    load_num integer,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.gold_4 OWNER TO postgres2;

--
-- TOC entry 318 (class 1259 OID 254557)
-- Name: gold_4_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.gold_4_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.gold_4_id_seq OWNER TO postgres2;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 318
-- Name: gold_4_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.gold_4_id_seq OWNED BY zlata.gold_4.id;


--
-- TOC entry 321 (class 1259 OID 254575)
-- Name: gold_5; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.gold_5 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    load_num integer,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.gold_5 OWNER TO postgres2;

--
-- TOC entry 320 (class 1259 OID 254573)
-- Name: gold_5_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.gold_5_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.gold_5_id_seq OWNER TO postgres2;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 320
-- Name: gold_5_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.gold_5_id_seq OWNED BY zlata.gold_5.id;


--
-- TOC entry 323 (class 1259 OID 254591)
-- Name: gold_6; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.gold_6 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    load_num integer,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.gold_6 OWNER TO postgres2;

--
-- TOC entry 322 (class 1259 OID 254589)
-- Name: gold_6_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.gold_6_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.gold_6_id_seq OWNER TO postgres2;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 322
-- Name: gold_6_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.gold_6_id_seq OWNED BY zlata.gold_6.id;


--
-- TOC entry 325 (class 1259 OID 254607)
-- Name: gold_7; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.gold_7 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    load_num integer,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.gold_7 OWNER TO postgres2;

--
-- TOC entry 324 (class 1259 OID 254605)
-- Name: gold_7_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.gold_7_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.gold_7_id_seq OWNER TO postgres2;

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 324
-- Name: gold_7_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.gold_7_id_seq OWNED BY zlata.gold_7.id;


--
-- TOC entry 327 (class 1259 OID 254623)
-- Name: gold_8; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.gold_8 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    load_num integer,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.gold_8 OWNER TO postgres2;

--
-- TOC entry 326 (class 1259 OID 254621)
-- Name: gold_8_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.gold_8_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.gold_8_id_seq OWNER TO postgres2;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 326
-- Name: gold_8_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.gold_8_id_seq OWNED BY zlata.gold_8.id;


--
-- TOC entry 329 (class 1259 OID 254639)
-- Name: gold_9; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.gold_9 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    load_num integer,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.gold_9 OWNER TO postgres2;

--
-- TOC entry 328 (class 1259 OID 254637)
-- Name: gold_9_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.gold_9_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.gold_9_id_seq OWNER TO postgres2;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 328
-- Name: gold_9_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.gold_9_id_seq OWNED BY zlata.gold_9.id;


--
-- TOC entry 291 (class 1259 OID 253859)
-- Name: load_0; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_0 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    filename character varying,
    load_num integer NOT NULL,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.load_0 OWNER TO postgres2;

--
-- TOC entry 290 (class 1259 OID 253857)
-- Name: load_0_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_0_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_0_id_seq OWNER TO postgres2;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 290
-- Name: load_0_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_0_id_seq OWNED BY zlata.load_0.id;


--
-- TOC entry 293 (class 1259 OID 253873)
-- Name: load_1; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_1 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    filename character varying,
    load_num integer NOT NULL,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.load_1 OWNER TO postgres2;

--
-- TOC entry 292 (class 1259 OID 253871)
-- Name: load_1_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_1_id_seq OWNER TO postgres2;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 292
-- Name: load_1_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_1_id_seq OWNED BY zlata.load_1.id;


--
-- TOC entry 295 (class 1259 OID 253887)
-- Name: load_2; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_2 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    filename character varying,
    load_num integer NOT NULL,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.load_2 OWNER TO postgres2;

--
-- TOC entry 294 (class 1259 OID 253885)
-- Name: load_2_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_2_id_seq OWNER TO postgres2;

--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 294
-- Name: load_2_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_2_id_seq OWNED BY zlata.load_2.id;


--
-- TOC entry 297 (class 1259 OID 253901)
-- Name: load_3; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_3 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    filename character varying,
    load_num integer NOT NULL,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.load_3 OWNER TO postgres2;

--
-- TOC entry 296 (class 1259 OID 253899)
-- Name: load_3_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_3_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_3_id_seq OWNER TO postgres2;

--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 296
-- Name: load_3_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_3_id_seq OWNED BY zlata.load_3.id;


--
-- TOC entry 299 (class 1259 OID 253915)
-- Name: load_4; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_4 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    filename character varying,
    load_num integer NOT NULL,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.load_4 OWNER TO postgres2;

--
-- TOC entry 298 (class 1259 OID 253913)
-- Name: load_4_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_4_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_4_id_seq OWNER TO postgres2;

--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 298
-- Name: load_4_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_4_id_seq OWNED BY zlata.load_4.id;


--
-- TOC entry 301 (class 1259 OID 253929)
-- Name: load_5; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_5 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    filename character varying,
    load_num integer NOT NULL,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.load_5 OWNER TO postgres2;

--
-- TOC entry 300 (class 1259 OID 253927)
-- Name: load_5_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_5_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_5_id_seq OWNER TO postgres2;

--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 300
-- Name: load_5_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_5_id_seq OWNED BY zlata.load_5.id;


--
-- TOC entry 303 (class 1259 OID 253943)
-- Name: load_6; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_6 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    filename character varying,
    load_num integer NOT NULL,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.load_6 OWNER TO postgres2;

--
-- TOC entry 302 (class 1259 OID 253941)
-- Name: load_6_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_6_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_6_id_seq OWNER TO postgres2;

--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 302
-- Name: load_6_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_6_id_seq OWNED BY zlata.load_6.id;


--
-- TOC entry 305 (class 1259 OID 253957)
-- Name: load_7; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_7 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    filename character varying,
    load_num integer NOT NULL,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.load_7 OWNER TO postgres2;

--
-- TOC entry 304 (class 1259 OID 253955)
-- Name: load_7_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_7_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_7_id_seq OWNER TO postgres2;

--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 304
-- Name: load_7_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_7_id_seq OWNED BY zlata.load_7.id;


--
-- TOC entry 307 (class 1259 OID 253971)
-- Name: load_8; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_8 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    filename character varying,
    load_num integer NOT NULL,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.load_8 OWNER TO postgres2;

--
-- TOC entry 306 (class 1259 OID 253969)
-- Name: load_8_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_8_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_8_id_seq OWNER TO postgres2;

--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 306
-- Name: load_8_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_8_id_seq OWNED BY zlata.load_8.id;


--
-- TOC entry 309 (class 1259 OID 253985)
-- Name: load_9; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_9 (
    id integer NOT NULL,
    oktmo character varying NOT NULL,
    indicator character varying NOT NULL,
    okved character varying,
    scenario character varying,
    filename character varying,
    load_num integer NOT NULL,
    "Y1999" real,
    "Y2000" real,
    "Y2001" real,
    "Y2002" real,
    "Y2003" real,
    "Y2004" real,
    "Y2005" real,
    "Y2006" real,
    "Y2007" real,
    "Y2008" real,
    "Y2009" real,
    "Y2010" real,
    "Y2011" real,
    "Y2012" real,
    "Y2013" real,
    "Y2014" real,
    "Y2015" real,
    "Y2016" real,
    "Y2017" real,
    "Y2018" real,
    "Y2019" real,
    "Y2020" real,
    "Y2021" real,
    "Y2022" real,
    "Y2023" real,
    "Y2024" real,
    "Y2025" real,
    "Y2026" real,
    "Y2027" real,
    "Y2028" real,
    "Y2029" real,
    "Y2030" real,
    "Y2031" real,
    "Y2032" real,
    "Y2033" real,
    "Y2034" real,
    "Y2035" real,
    "Y2036" real,
    "Y2037" real,
    "Y2038" real,
    "Y2039" real,
    "Y2040" real,
    "Y2041" real,
    "Y2042" real,
    "Y2043" real,
    "Y2044" real,
    "Y2045" real,
    "Y2046" real,
    "Y2047" real,
    "Y2048" real,
    "Y2049" real,
    "Y2050" real,
    "Y2051" real,
    "Y2052" real,
    "Y2053" real,
    "Y2054" real,
    "Y2055" real,
    "Y2056" real,
    "Y2057" real,
    "Y2058" real,
    "Y2059" real,
    "Y2060" real,
    "Y2061" real,
    "Y2062" real,
    "Y2063" real,
    "Y2064" real,
    "Y2065" real,
    "Y2066" real,
    "Y2067" real,
    "Y2068" real,
    "Y2069" real,
    "Y2070" real,
    "Y2071" real,
    "Y2072" real,
    "Y2073" real,
    "Y2074" real,
    "Y2075" real,
    "Y2076" real,
    "Y2077" real,
    "Y2078" real,
    "Y2079" real,
    "Y2080" real,
    "Y2081" real,
    "Y2082" real,
    "Y2083" real,
    "Y2084" real,
    "Y2085" real,
    "Y2086" real,
    "Y2087" real,
    "Y2088" real,
    "Y2089" real,
    "Y2090" real,
    "Y2091" real,
    "Y2092" real,
    "Y2093" real,
    "Y2094" real,
    "Y2095" real,
    "Y2096" real,
    "Y2097" real,
    "Y2098" real,
    "Y2099" real,
    "Y2100" real,
    "Y2101" real,
    "Y2102" real,
    "Y2103" real,
    "Y2104" real,
    "Y2105" real,
    "Y2106" real,
    "Y2107" real,
    "Y2108" real,
    "Y2109" real,
    "Y2110" real,
    "Y2111" real,
    "Y2112" real,
    "Y2113" real,
    "Y2114" real,
    "Y2115" real,
    "Y2116" real,
    "Y2117" real,
    "Y2118" real,
    "Y2119" real,
    "Y2120" real,
    "Y2121" real
);


ALTER TABLE zlata.load_9 OWNER TO postgres2;

--
-- TOC entry 308 (class 1259 OID 253983)
-- Name: load_9_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_9_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_9_id_seq OWNER TO postgres2;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 308
-- Name: load_9_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_9_id_seq OWNED BY zlata.load_9.id;


--
-- TOC entry 331 (class 1259 OID 254833)
-- Name: load_logs; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.load_logs (
    load_num integer NOT NULL,
    file_name character varying NOT NULL,
    loadtime timestamp without time zone,
    file_created date,
    calc_func_created date,
    years character varying,
    scenarios character varying,
    indicators character varying,
    locations character varying,
    okved character varying,
    description character varying
);


ALTER TABLE zlata.load_logs OWNER TO postgres2;

--
-- TOC entry 330 (class 1259 OID 254831)
-- Name: load_logs_load_num_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.load_logs_load_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.load_logs_load_num_seq OWNER TO postgres2;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 330
-- Name: load_logs_load_num_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.load_logs_load_num_seq OWNED BY zlata.load_logs.load_num;


--
-- TOC entry 289 (class 1259 OID 252323)
-- Name: location; Type: TABLE; Schema: zlata; Owner: postgres2
--

CREATE TABLE zlata.location (
    id integer NOT NULL,
    long_name character varying,
    description character varying,
    oktmo character varying,
    okato character varying,
    long_name_eng character varying,
    stage character varying,
    type character varying,
    agglomeration character varying,
    hide boolean DEFAULT false,
    region character varying,
    actual boolean,
    join_city character varying,
    latitude real,
    longitude real,
    "100city" boolean
);
ALTER TABLE ONLY zlata.location ALTER COLUMN join_city SET STATISTICS 1;


ALTER TABLE zlata.location OWNER TO postgres2;

--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 289
-- Name: COLUMN location.join_city; Type: COMMENT; Schema: zlata; Owner: postgres2
--

COMMENT ON COLUMN zlata.location.join_city IS 'Номер октмо куда вошел муниципалитет';


--
-- TOC entry 288 (class 1259 OID 252321)
-- Name: location_id_seq; Type: SEQUENCE; Schema: zlata; Owner: postgres2
--

CREATE SEQUENCE zlata.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zlata.location_id_seq OWNER TO postgres2;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 288
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: zlata; Owner: postgres2
--

ALTER SEQUENCE zlata.location_id_seq OWNED BY zlata.location.id;


--
-- TOC entry 3182 (class 2604 OID 254498)
-- Name: gold_0 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_0 ALTER COLUMN id SET DEFAULT nextval('zlata.gold_0_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 254514)
-- Name: gold_1 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_1 ALTER COLUMN id SET DEFAULT nextval('zlata.gold_1_id_seq'::regclass);


--
-- TOC entry 3184 (class 2604 OID 254530)
-- Name: gold_2 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_2 ALTER COLUMN id SET DEFAULT nextval('zlata.gold_2_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 254546)
-- Name: gold_3 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_3 ALTER COLUMN id SET DEFAULT nextval('zlata.gold_3_id_seq'::regclass);


--
-- TOC entry 3186 (class 2604 OID 254562)
-- Name: gold_4 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_4 ALTER COLUMN id SET DEFAULT nextval('zlata.gold_4_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 254578)
-- Name: gold_5 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_5 ALTER COLUMN id SET DEFAULT nextval('zlata.gold_5_id_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 254594)
-- Name: gold_6 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_6 ALTER COLUMN id SET DEFAULT nextval('zlata.gold_6_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 254610)
-- Name: gold_7 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_7 ALTER COLUMN id SET DEFAULT nextval('zlata.gold_7_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 254626)
-- Name: gold_8 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_8 ALTER COLUMN id SET DEFAULT nextval('zlata.gold_8_id_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 254642)
-- Name: gold_9 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_9 ALTER COLUMN id SET DEFAULT nextval('zlata.gold_9_id_seq'::regclass);


--
-- TOC entry 3172 (class 2604 OID 253862)
-- Name: load_0 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_0 ALTER COLUMN id SET DEFAULT nextval('zlata.load_0_id_seq'::regclass);


--
-- TOC entry 3173 (class 2604 OID 253876)
-- Name: load_1 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_1 ALTER COLUMN id SET DEFAULT nextval('zlata.load_1_id_seq'::regclass);


--
-- TOC entry 3174 (class 2604 OID 253890)
-- Name: load_2 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_2 ALTER COLUMN id SET DEFAULT nextval('zlata.load_2_id_seq'::regclass);


--
-- TOC entry 3175 (class 2604 OID 253904)
-- Name: load_3 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_3 ALTER COLUMN id SET DEFAULT nextval('zlata.load_3_id_seq'::regclass);


--
-- TOC entry 3176 (class 2604 OID 253918)
-- Name: load_4 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_4 ALTER COLUMN id SET DEFAULT nextval('zlata.load_4_id_seq'::regclass);


--
-- TOC entry 3177 (class 2604 OID 253932)
-- Name: load_5 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_5 ALTER COLUMN id SET DEFAULT nextval('zlata.load_5_id_seq'::regclass);


--
-- TOC entry 3178 (class 2604 OID 253946)
-- Name: load_6 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_6 ALTER COLUMN id SET DEFAULT nextval('zlata.load_6_id_seq'::regclass);


--
-- TOC entry 3179 (class 2604 OID 253960)
-- Name: load_7 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_7 ALTER COLUMN id SET DEFAULT nextval('zlata.load_7_id_seq'::regclass);


--
-- TOC entry 3180 (class 2604 OID 253974)
-- Name: load_8 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_8 ALTER COLUMN id SET DEFAULT nextval('zlata.load_8_id_seq'::regclass);


--
-- TOC entry 3181 (class 2604 OID 253988)
-- Name: load_9 id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_9 ALTER COLUMN id SET DEFAULT nextval('zlata.load_9_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 254836)
-- Name: load_logs load_num; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_logs ALTER COLUMN load_num SET DEFAULT nextval('zlata.load_logs_load_num_seq'::regclass);


--
-- TOC entry 3170 (class 2604 OID 252326)
-- Name: location id; Type: DEFAULT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.location ALTER COLUMN id SET DEFAULT nextval('zlata.location_id_seq'::regclass);


--
-- TOC entry 3249 (class 2606 OID 254503)
-- Name: gold_0 gold0_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_0
    ADD CONSTRAINT gold0_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 254519)
-- Name: gold_1 gold1_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_1
    ADD CONSTRAINT gold1_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 254535)
-- Name: gold_2 gold2_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_2
    ADD CONSTRAINT gold2_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 254551)
-- Name: gold_3 gold3_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_3
    ADD CONSTRAINT gold3_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 254567)
-- Name: gold_4 gold4_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_4
    ADD CONSTRAINT gold4_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 254583)
-- Name: gold_5 gold5_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_5
    ADD CONSTRAINT gold5_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 254599)
-- Name: gold_6 gold6_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_6
    ADD CONSTRAINT gold6_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 254615)
-- Name: gold_7 gold7_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_7
    ADD CONSTRAINT gold7_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 254631)
-- Name: gold_8 gold8_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_8
    ADD CONSTRAINT gold8_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 254647)
-- Name: gold_9 gold9_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_9
    ADD CONSTRAINT gold9_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 254841)
-- Name: load_logs loadlogs_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_logs
    ADD CONSTRAINT loadlogs_pkey PRIMARY KEY (load_num);


--
-- TOC entry 3195 (class 2606 OID 252334)
-- Name: location location_oktmo_key; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.location
    ADD CONSTRAINT location_oktmo_key UNIQUE (oktmo);


--
-- TOC entry 3197 (class 2606 OID 252332)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 254167)
-- Name: load_0 zlata_load0_pk; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_0
    ADD CONSTRAINT zlata_load0_pk PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 254169)
-- Name: load_1 zlata_load1_pk; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_1
    ADD CONSTRAINT zlata_load1_pk PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 254171)
-- Name: load_2 zlata_load2_pk; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_2
    ADD CONSTRAINT zlata_load2_pk PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 254173)
-- Name: load_3 zlata_load3_pk; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_3
    ADD CONSTRAINT zlata_load3_pk PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 254177)
-- Name: load_4 zlata_load4_pk; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_4
    ADD CONSTRAINT zlata_load4_pk PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 254181)
-- Name: load_5 zlata_load5_pk; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_5
    ADD CONSTRAINT zlata_load5_pk PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 254183)
-- Name: load_6 zlata_load6_pk; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_6
    ADD CONSTRAINT zlata_load6_pk PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 254185)
-- Name: load_7 zlata_load7_pk; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_7
    ADD CONSTRAINT zlata_load7_pk PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 254187)
-- Name: load_8 zlata_load8_pk; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_8
    ADD CONSTRAINT zlata_load8_pk PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 254189)
-- Name: load_9 zlata_load9_pk; Type: CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_9
    ADD CONSTRAINT zlata_load9_pk PRIMARY KEY (id);


--
-- TOC entry 3250 (class 1259 OID 254851)
-- Name: ix_gold0_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold0_indicator ON zlata.gold_0 USING btree (indicator);


--
-- TOC entry 3251 (class 1259 OID 254854)
-- Name: ix_gold0_loadnum; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold0_loadnum ON zlata.gold_0 USING btree (load_num);


--
-- TOC entry 3252 (class 1259 OID 254852)
-- Name: ix_gold0_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold0_oktmo ON zlata.gold_0 USING btree (oktmo);


--
-- TOC entry 3253 (class 1259 OID 254853)
-- Name: ix_gold0_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold0_okved ON zlata.gold_0 USING btree (okved);


--
-- TOC entry 3256 (class 1259 OID 254855)
-- Name: ix_gold1_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold1_indicator ON zlata.gold_1 USING btree (indicator);


--
-- TOC entry 3257 (class 1259 OID 254856)
-- Name: ix_gold1_loadnum; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold1_loadnum ON zlata.gold_1 USING btree (load_num);


--
-- TOC entry 3258 (class 1259 OID 254857)
-- Name: ix_gold1_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold1_oktmo ON zlata.gold_1 USING btree (oktmo);


--
-- TOC entry 3259 (class 1259 OID 254858)
-- Name: ix_gold1_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold1_okved ON zlata.gold_1 USING btree (okved);


--
-- TOC entry 3262 (class 1259 OID 254859)
-- Name: ix_gold2_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold2_indicator ON zlata.gold_2 USING btree (indicator);


--
-- TOC entry 3263 (class 1259 OID 254860)
-- Name: ix_gold2_loadnum; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold2_loadnum ON zlata.gold_2 USING btree (load_num);


--
-- TOC entry 3264 (class 1259 OID 254861)
-- Name: ix_gold2_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold2_oktmo ON zlata.gold_2 USING btree (oktmo);


--
-- TOC entry 3265 (class 1259 OID 254862)
-- Name: ix_gold2_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold2_okved ON zlata.gold_2 USING btree (okved);


--
-- TOC entry 3268 (class 1259 OID 254863)
-- Name: ix_gold3_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold3_indicator ON zlata.gold_3 USING btree (indicator);


--
-- TOC entry 3269 (class 1259 OID 254864)
-- Name: ix_gold3_loadnum; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold3_loadnum ON zlata.gold_3 USING btree (load_num);


--
-- TOC entry 3270 (class 1259 OID 254865)
-- Name: ix_gold3_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold3_oktmo ON zlata.gold_3 USING btree (oktmo);


--
-- TOC entry 3271 (class 1259 OID 254866)
-- Name: ix_gold3_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold3_okved ON zlata.gold_3 USING btree (okved);


--
-- TOC entry 3274 (class 1259 OID 254867)
-- Name: ix_gold4_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold4_indicator ON zlata.gold_4 USING btree (indicator);


--
-- TOC entry 3275 (class 1259 OID 254868)
-- Name: ix_gold4_loadnum; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold4_loadnum ON zlata.gold_4 USING btree (load_num);


--
-- TOC entry 3276 (class 1259 OID 254869)
-- Name: ix_gold4_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold4_oktmo ON zlata.gold_4 USING btree (oktmo);


--
-- TOC entry 3277 (class 1259 OID 254870)
-- Name: ix_gold4_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold4_okved ON zlata.gold_4 USING btree (okved);


--
-- TOC entry 3280 (class 1259 OID 254871)
-- Name: ix_gold5_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold5_indicator ON zlata.gold_5 USING btree (indicator);


--
-- TOC entry 3281 (class 1259 OID 254872)
-- Name: ix_gold5_loadnum; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold5_loadnum ON zlata.gold_5 USING btree (load_num);


--
-- TOC entry 3282 (class 1259 OID 254873)
-- Name: ix_gold5_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold5_oktmo ON zlata.gold_5 USING btree (oktmo);


--
-- TOC entry 3283 (class 1259 OID 254874)
-- Name: ix_gold5_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold5_okved ON zlata.gold_5 USING btree (okved);


--
-- TOC entry 3286 (class 1259 OID 254875)
-- Name: ix_gold6_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold6_indicator ON zlata.gold_6 USING btree (indicator);


--
-- TOC entry 3287 (class 1259 OID 254876)
-- Name: ix_gold6_loadnum; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold6_loadnum ON zlata.gold_6 USING btree (load_num);


--
-- TOC entry 3288 (class 1259 OID 254877)
-- Name: ix_gold6_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold6_oktmo ON zlata.gold_6 USING btree (oktmo);


--
-- TOC entry 3289 (class 1259 OID 254878)
-- Name: ix_gold6_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold6_okved ON zlata.gold_6 USING btree (okved);


--
-- TOC entry 3292 (class 1259 OID 254879)
-- Name: ix_gold7_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold7_indicator ON zlata.gold_7 USING btree (indicator);


--
-- TOC entry 3293 (class 1259 OID 254880)
-- Name: ix_gold7_loadnum; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold7_loadnum ON zlata.gold_7 USING btree (load_num);


--
-- TOC entry 3294 (class 1259 OID 254881)
-- Name: ix_gold7_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold7_oktmo ON zlata.gold_7 USING btree (oktmo);


--
-- TOC entry 3295 (class 1259 OID 254882)
-- Name: ix_gold7_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold7_okved ON zlata.gold_7 USING btree (okved);


--
-- TOC entry 3298 (class 1259 OID 254883)
-- Name: ix_gold8_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold8_indicator ON zlata.gold_8 USING btree (indicator);


--
-- TOC entry 3299 (class 1259 OID 254884)
-- Name: ix_gold8_loadnum; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold8_loadnum ON zlata.gold_8 USING btree (load_num);


--
-- TOC entry 3300 (class 1259 OID 254885)
-- Name: ix_gold8_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold8_oktmo ON zlata.gold_8 USING btree (oktmo);


--
-- TOC entry 3301 (class 1259 OID 254886)
-- Name: ix_gold8_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold8_okved ON zlata.gold_8 USING btree (okved);


--
-- TOC entry 3304 (class 1259 OID 254887)
-- Name: ix_gold9_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold9_indicator ON zlata.gold_9 USING btree (indicator);


--
-- TOC entry 3305 (class 1259 OID 254888)
-- Name: ix_gold9_loadnum; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold9_loadnum ON zlata.gold_9 USING btree (load_num);


--
-- TOC entry 3306 (class 1259 OID 254889)
-- Name: ix_gold9_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold9_oktmo ON zlata.gold_9 USING btree (oktmo);


--
-- TOC entry 3307 (class 1259 OID 254890)
-- Name: ix_gold9_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_gold9_okved ON zlata.gold_9 USING btree (okved);


--
-- TOC entry 3198 (class 1259 OID 254334)
-- Name: ix_load0_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load0_indicator ON zlata.load_0 USING btree (indicator);


--
-- TOC entry 3199 (class 1259 OID 254333)
-- Name: ix_load0_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load0_oktmo ON zlata.load_0 USING btree (oktmo);


--
-- TOC entry 3200 (class 1259 OID 254335)
-- Name: ix_load0_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load0_okved ON zlata.load_0 USING btree (okved);


--
-- TOC entry 3203 (class 1259 OID 254337)
-- Name: ix_load1_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load1_indicator ON zlata.load_1 USING btree (indicator);


--
-- TOC entry 3204 (class 1259 OID 254336)
-- Name: ix_load1_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load1_oktmo ON zlata.load_1 USING btree (oktmo);


--
-- TOC entry 3205 (class 1259 OID 254338)
-- Name: ix_load1_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load1_okved ON zlata.load_1 USING btree (okved);


--
-- TOC entry 3208 (class 1259 OID 254340)
-- Name: ix_load2_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load2_indicator ON zlata.load_2 USING btree (indicator);


--
-- TOC entry 3209 (class 1259 OID 254339)
-- Name: ix_load2_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load2_oktmo ON zlata.load_2 USING btree (oktmo);


--
-- TOC entry 3210 (class 1259 OID 254341)
-- Name: ix_load2_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load2_okved ON zlata.load_2 USING btree (okved);


--
-- TOC entry 3213 (class 1259 OID 254343)
-- Name: ix_load3_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load3_indicator ON zlata.load_3 USING btree (indicator);


--
-- TOC entry 3214 (class 1259 OID 254342)
-- Name: ix_load3_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load3_oktmo ON zlata.load_3 USING btree (oktmo);


--
-- TOC entry 3215 (class 1259 OID 254344)
-- Name: ix_load3_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load3_okved ON zlata.load_3 USING btree (okved);


--
-- TOC entry 3218 (class 1259 OID 254346)
-- Name: ix_load4_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load4_indicator ON zlata.load_4 USING btree (indicator);


--
-- TOC entry 3219 (class 1259 OID 254345)
-- Name: ix_load4_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load4_oktmo ON zlata.load_4 USING btree (oktmo);


--
-- TOC entry 3220 (class 1259 OID 254347)
-- Name: ix_load4_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load4_okved ON zlata.load_4 USING btree (okved);


--
-- TOC entry 3223 (class 1259 OID 254349)
-- Name: ix_load5_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load5_indicator ON zlata.load_5 USING btree (indicator);


--
-- TOC entry 3224 (class 1259 OID 254348)
-- Name: ix_load5_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load5_oktmo ON zlata.load_5 USING btree (oktmo);


--
-- TOC entry 3225 (class 1259 OID 254350)
-- Name: ix_load5_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load5_okved ON zlata.load_5 USING btree (okved);


--
-- TOC entry 3228 (class 1259 OID 254352)
-- Name: ix_load6_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load6_indicator ON zlata.load_6 USING btree (indicator);


--
-- TOC entry 3229 (class 1259 OID 254351)
-- Name: ix_load6_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load6_oktmo ON zlata.load_6 USING btree (oktmo);


--
-- TOC entry 3230 (class 1259 OID 254353)
-- Name: ix_load6_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load6_okved ON zlata.load_6 USING btree (okved);


--
-- TOC entry 3233 (class 1259 OID 254355)
-- Name: ix_load7_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load7_indicator ON zlata.load_7 USING btree (indicator);


--
-- TOC entry 3234 (class 1259 OID 254354)
-- Name: ix_load7_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load7_oktmo ON zlata.load_7 USING btree (oktmo);


--
-- TOC entry 3235 (class 1259 OID 254356)
-- Name: ix_load7_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load7_okved ON zlata.load_7 USING btree (okved);


--
-- TOC entry 3238 (class 1259 OID 254358)
-- Name: ix_load8_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load8_indicator ON zlata.load_8 USING btree (indicator);


--
-- TOC entry 3239 (class 1259 OID 254357)
-- Name: ix_load8_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load8_oktmo ON zlata.load_8 USING btree (oktmo);


--
-- TOC entry 3240 (class 1259 OID 254359)
-- Name: ix_load8_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load8_okved ON zlata.load_8 USING btree (okved);


--
-- TOC entry 3243 (class 1259 OID 254361)
-- Name: ix_load9_indicator; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load9_indicator ON zlata.load_9 USING btree (indicator);


--
-- TOC entry 3244 (class 1259 OID 254360)
-- Name: ix_load9_oktmo; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load9_oktmo ON zlata.load_9 USING btree (oktmo);


--
-- TOC entry 3245 (class 1259 OID 254362)
-- Name: ix_load9_okved; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_load9_okved ON zlata.load_9 USING btree (okved);


--
-- TOC entry 3193 (class 1259 OID 252335)
-- Name: ix_location_long_name; Type: INDEX; Schema: zlata; Owner: postgres2
--

CREATE INDEX ix_location_long_name ON zlata.location USING btree (long_name);


--
-- TOC entry 3310 (class 2606 OID 253866)
-- Name: load_0 loading_0_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_0
    ADD CONSTRAINT loading_0_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3320 (class 2606 OID 254504)
-- Name: gold_0 loading_0_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_0
    ADD CONSTRAINT loading_0_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3311 (class 2606 OID 253880)
-- Name: load_1 loading_1_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_1
    ADD CONSTRAINT loading_1_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3321 (class 2606 OID 254520)
-- Name: gold_1 loading_1_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_1
    ADD CONSTRAINT loading_1_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3312 (class 2606 OID 253894)
-- Name: load_2 loading_2_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_2
    ADD CONSTRAINT loading_2_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3322 (class 2606 OID 254536)
-- Name: gold_2 loading_2_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_2
    ADD CONSTRAINT loading_2_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3313 (class 2606 OID 253908)
-- Name: load_3 loading_3_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_3
    ADD CONSTRAINT loading_3_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3323 (class 2606 OID 254552)
-- Name: gold_3 loading_3_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_3
    ADD CONSTRAINT loading_3_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3314 (class 2606 OID 253922)
-- Name: load_4 loading_4_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_4
    ADD CONSTRAINT loading_4_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3324 (class 2606 OID 254568)
-- Name: gold_4 loading_4_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_4
    ADD CONSTRAINT loading_4_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3315 (class 2606 OID 253936)
-- Name: load_5 loading_5_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_5
    ADD CONSTRAINT loading_5_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3325 (class 2606 OID 254584)
-- Name: gold_5 loading_5_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_5
    ADD CONSTRAINT loading_5_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3316 (class 2606 OID 253950)
-- Name: load_6 loading_6_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_6
    ADD CONSTRAINT loading_6_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3326 (class 2606 OID 254600)
-- Name: gold_6 loading_6_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_6
    ADD CONSTRAINT loading_6_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3317 (class 2606 OID 253964)
-- Name: load_7 loading_7_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_7
    ADD CONSTRAINT loading_7_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3327 (class 2606 OID 254616)
-- Name: gold_7 loading_7_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_7
    ADD CONSTRAINT loading_7_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3318 (class 2606 OID 253978)
-- Name: load_8 loading_8_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_8
    ADD CONSTRAINT loading_8_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3328 (class 2606 OID 254632)
-- Name: gold_8 loading_8_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_8
    ADD CONSTRAINT loading_8_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3319 (class 2606 OID 253992)
-- Name: load_9 loading_9_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.load_9
    ADD CONSTRAINT loading_9_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3329 (class 2606 OID 254648)
-- Name: gold_9 loading_9_indicator_code_fkey; Type: FK CONSTRAINT; Schema: zlata; Owner: postgres2
--

ALTER TABLE ONLY zlata.gold_9
    ADD CONSTRAINT loading_9_indicator_code_fkey FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA zlata; Type: ACL; Schema: -; Owner: postgres2
--

GRANT USAGE ON SCHEMA zlata TO reader;


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 311
-- Name: TABLE gold_0; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.gold_0 TO reader;


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 313
-- Name: TABLE gold_1; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.gold_1 TO reader;


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE gold_2; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.gold_2 TO reader;


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 317
-- Name: TABLE gold_3; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.gold_3 TO reader;


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 319
-- Name: TABLE gold_4; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.gold_4 TO reader;


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 321
-- Name: TABLE gold_5; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.gold_5 TO reader;


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 323
-- Name: TABLE gold_6; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.gold_6 TO reader;


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 325
-- Name: TABLE gold_7; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.gold_7 TO reader;


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 327
-- Name: TABLE gold_8; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.gold_8 TO reader;


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 329
-- Name: TABLE gold_9; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.gold_9 TO reader;


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE load_0; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_0 TO reader;


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 293
-- Name: TABLE load_1; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_1 TO reader;


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 295
-- Name: TABLE load_2; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_2 TO reader;


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 297
-- Name: TABLE load_3; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_3 TO reader;


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 299
-- Name: TABLE load_4; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_4 TO reader;


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 301
-- Name: TABLE load_5; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_5 TO reader;


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 303
-- Name: TABLE load_6; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_6 TO reader;


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 305
-- Name: TABLE load_7; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_7 TO reader;


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 307
-- Name: TABLE load_8; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_8 TO reader;


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 309
-- Name: TABLE load_9; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_9 TO reader;


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 331
-- Name: TABLE load_logs; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.load_logs TO reader;


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE location; Type: ACL; Schema: zlata; Owner: postgres2
--

GRANT SELECT ON TABLE zlata.location TO reader;


-- Completed on 2023-03-03 14:03:38

--
-- PostgreSQL database dump complete
--

