select matchdate, 
SUM(IF(a.type = 2, a.ct, 0))   AS ct2,
SUM(IF(a.type = 3, a.ct, 0))   AS ct3,
SUM(IF(a.type = 4, a.ct, 0))   AS ct4 from (
SELECT t.matchdate,
               (SELECT COUNT(playerid)
                FROM   playermatch
                WHERE  matchid = t.matchid) AS type,
               COUNT(t.matchid)             AS ct
        FROM   tntmatch t
        GROUP  BY t.matchdate,
                  (SELECT COUNT(playerid)
                   FROM   playermatch
                   WHERE  matchid = t.matchid) ) a
                   group by a.matchdate
                   order by matchdate asc;
