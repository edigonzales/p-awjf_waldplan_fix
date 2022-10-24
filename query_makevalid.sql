DROP TABLE IF EXISTS awjf_waldplan_v1_fix.waldplan_exterioring;
CREATE TABLE awjf_waldplan_v1_fix.waldplan_exterioring
AS 
SELECT 
    ST_ExteriorRing(geom) AS geom
FROM 
(
    SELECT 
        (ST_DumpRings(geometrie)).geom AS geom
    FROM 
        awjf_waldplan_v1_fix.waldpln_stndskrte_waldplan_bestandeskarte 
) AS foo
;
CREATE INDEX ON awjf_waldplan_v1_fix.waldplan_exterioring USING GIST ("geom")
;


DROP TABLE IF EXISTS awjf_waldplan_v1_fix.waldplan_union;
CREATE TABLE awjf_waldplan_v1_fix.waldplan_union
AS
SELECT 
    ST_Union(geom, 0.001) AS geom
FROM 
    awjf_waldplan_v1_fix.waldplan_exterioring
;
CREATE INDEX ON awjf_waldplan_v1_fix.waldplan_union USING GIST ("geom")
;


DROP SEQUENCE IF EXISTS awjf_waldplan_v1_fix.polyseq;
CREATE SEQUENCE awjf_waldplan_v1_fix.polyseq;
DROP TABLE IF EXISTS awjf_waldplan_v1_fix.polys;
CREATE TABLE awjf_waldplan_v1_fix.polys 
AS
SELECT 
    nextval('awjf_waldplan_v1_fix.polyseq') AS id, 
    (ST_Dump(ST_Polygonize(geom))).geom AS geom
FROM 
    awjf_waldplan_v1_fix.waldplan_union
;
CREATE INDEX ON "awjf_waldplan_v1_fix"."polys" USING GIST ("geom")
;


DROP TABLE IF EXISTS awjf_waldplan_v1_fix.polys_point;
CREATE TABLE awjf_waldplan_v1_fix.polys_point 
AS
SELECT 
    geom,
    ST_PointOnSurface(geom) AS point
FROM 
    awjf_waldplan_v1_fix.polys
;
CREATE INDEX ON "awjf_waldplan_v1_fix"."polys_point" USING GIST ("geom")
;



DROP TABLE IF EXISTS awjf_waldplan_v1_fix.polys_attr;
CREATE TABLE awjf_waldplan_v1_fix.polys_attr
AS
SELECT 
    DISTINCT ON (polys.point) 
    wald.t_id, 
    polys.geom AS geometrie,
    id_wp,
    fid_amtei,
    fid_fk,
    fid_fr,
    wirt_zone,
    gem_bfs,
    fid_we,
    gb_flaeche,
    we_text,
    fid_eigcod,
    fid_eig,
    fid_prod,
    wpnr,
    wptyp,
    betriebsteil,
    fid_abt,
    bstnr,
    bsttyp,
    wpinfo,
    bemerkung,
    flae_gis,
    zeitstand,
    beschrift,
    x_beschr,
    y_beschr,
    objnummer,
    weidewald,
    gb_gem_bfs,
    astatus
FROM 
    awjf_waldplan_v1_fix.waldpln_stndskrte_waldplan_bestandeskarte AS wald
    INNER JOIN awjf_waldplan_v1_fix.polys_point AS polys 
    ON ST_Intersects(polys.point, wald.geometrie)
;
CREATE INDEX ON "awjf_waldplan_v1_fix"."polys_attr" USING GIST ("geometrie")
;


DROP TABLE IF EXISTS awjf_waldplan_v1_fix.polys_join;
CREATE TABLE awjf_waldplan_v1_fix.polys_join
AS
SELECT 
    wald.t_id,
    (ST_Dump(foo.geometrie)).geom AS geometrie,
    id_wp,
    fid_amtei,
    fid_fk,
    fid_fr,
    wirt_zone,
    gem_bfs,
    fid_we,
    gb_flaeche,
    we_text,
    fid_eigcod,
    fid_eig,
    fid_prod,
    wpnr,
    wptyp,
    betriebsteil,
    fid_abt,
    bstnr,
    bsttyp,
    wpinfo,
    bemerkung,
    flae_gis,
    zeitstand,
    beschrift,
    x_beschr,
    y_beschr,
    objnummer,
    weidewald,
    gb_gem_bfs,
    astatus
FROM 
(
    SELECT 
        t_id, ST_RemoveRepeatedPoints(ST_Union(geometrie)) AS geometrie
    FROM 
        awjf_waldplan_v1_fix.polys_attr
    GROUP BY (t_id)
) AS foo
LEFT JOIN awjf_waldplan_v1_fix.waldpln_stndskrte_waldplan_bestandeskarte AS wald
ON wald.t_id = foo.t_id
;
CREATE INDEX ON "awjf_waldplan_v1_fix"."polys_join" USING GIST ("geometrie")
;

DELETE FROM awjf_waldplan_v1_definitiv.waldpln_stndskrte_waldplan_bestandeskarte ;
INSERT INTO awjf_waldplan_v1_definitiv.waldpln_stndskrte_waldplan_bestandeskarte 
(
    geometrie,
    id_wp,
    fid_amtei,
    fid_fk,
    fid_fr,
    wirt_zone,
    gem_bfs,
    fid_we,
    gb_flaeche,
    we_text,
    fid_eigcod,
    fid_eig,
    fid_prod,
    wpnr,
    wptyp,
    betriebsteil,
    fid_abt,
    bstnr,
    bsttyp,
    wpinfo,
    bemerkung,
    flae_gis,
    zeitstand,
    beschrift,
    x_beschr,
    y_beschr,
    objnummer,
    weidewald,
    gb_gem_bfs,
    astatus
)
SELECT 
    geometrie,
    id_wp,
    fid_amtei,
    fid_fk,
    fid_fr,
    wirt_zone,
    gem_bfs,
    fid_we,
    gb_flaeche,
    we_text,
    fid_eigcod,
    fid_eig,
    fid_prod,
    wpnr,
    wptyp,
    betriebsteil,
    fid_abt,
    bstnr,
    bsttyp,
    wpinfo,
    bemerkung,
    flae_gis,
    zeitstand,
    beschrift,
    x_beschr,
    y_beschr,
    objnummer,
    weidewald,
    gb_gem_bfs,
    astatus
FROM 
    awjf_waldplan_v1_fix.polys_join 
;