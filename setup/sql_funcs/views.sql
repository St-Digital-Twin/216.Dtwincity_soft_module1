CREATE VIEW find_dups AS
select max(id) as id_1, min(id) as id_2, oktmo, indicator, okved, scenario, count(*)
from public.maintable
group by oktmo, indicator, okved, scenario
HAVING count(*) > 1;