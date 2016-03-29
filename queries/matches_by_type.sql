select
SUM(IF(a.type = 2, a.ct, 0))   AS `2p`,
SUM(IF(a.type = 3, a.ct, 0))   AS `3p`,
SUM(IF(a.type = 4, a.ct, 0))   AS `4p` from (
SELECT t.matchdate,
               (SELECT COUNT(playerid)
                FROM   playermatch
                WHERE  matchid = t.matchid) AS type,
               COUNT(t.matchid)             AS ct
        FROM   tntmatch t
        WHERE t.matchdate <= '2004-05-21'
        GROUP  BY (SELECT COUNT(playerid)
                   FROM   playermatch
                   WHERE  matchid = t.matchid) ) a
                   ;
