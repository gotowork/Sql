




---------------------------------------------------------------------------------------------------
---------- select methods as batch group and samples as batch's children --------------------------
---------- this function get a table tree configuration -------------------------------------------
---------------------------------------------------------------------------------------------------
drop function if exists public.sp_batch_detail_SelectTree(varchar, varchar, boolean, date, date, bigint, bigint);
-- select * from public.sp_batch_detail_SelectTree('A004', 'M002', false, '17/02/2013', '19/02/2013', null, null)
-- select * from public.sp_batch_detail_SelectTree('0000', 'M003', true, '20/02/2013', '05/03/2013', null, null)

CREATE OR REPLACE FUNCTION public.sp_batch_detail_SelectTree(
p_cod_area varchar
, p_cod_module varchar
, p_enabled_history boolean
, p_date_ini date
, p_date_end date
, p_cod_interno bigint
, p_idcompany bigint)
 returns TABLE ("Id" int8, "Parentid" int8, "Idtemplate_method" int, "Idrecep_sample_detail_elem" int8, 
 "Idbatch_detail_aa" int8,  "Abbreviation" text, "Cod_repetition" int2, 
 "Num_tray" varchar, "Date_result" timestamp, "Hour_result" timestamp, 
 "Image_index" int, "Urgent_sample" int)
AS $$
	DECLARE v_id int;
BEGIN
			
	-- select trays
	CREATE TEMP TABLE tmp_batch ON COMMIT DROP AS
	SELECT DISTINCT *
	FROM batch
	WHERE p_enabled_history = FALSE AND cod_module = p_cod_module AND cod_area = p_cod_area 
	UNION ALL
	SELECT DISTINCT t1.*
	FROM batch t1
	INNER JOIN batch_detail_aa_twofold t2
		ON t1.idbatch = t2.idbatch
	INNER JOIN recep_sample_detail t3
		ON t2.idrecep_sample_detail = t3.idrecep_sample_detail
	INNER JOIN recep_sample t4
		ON t3.idrecep_sample = t4.idrecep_sample
	INNER JOIN company t5
		ON t4.idcompany = t5.idcompany
	WHERE cod_module = p_cod_module
		AND (p_enabled_history = TRUE AND t1.cod_process = 'P016' AND CAST(t1.date_creation_tray AS DATE) BETWEEN CAST(p_date_ini AS DATE) AND CAST(p_date_end AS DATE))
		AND (p_cod_interno IS NULL OR p_cod_interno = T3.cod_interno)
		AND (p_idcompany IS NULL OR p_idcompany = t5.idcompany);

	CREATE TEMP TABLE tmp_batch_date ON COMMIT DROP AS
	SELECT t1.idbatch, MIN(t3.date_result) as date_result
	FROM tmp_batch t1
		INNER JOIN batch_detail_aa_twofold t2
			ON t1.idbatch = t2.idbatch
		INNER JOIN recep_sample t3
			ON t2.idrecep_sample = t3.idrecep_sample
	GROUP BY t1.idbatch;
				
	-- tree's parents
	CREATE TEMP TABLE tmp_parent ON COMMIT DROP AS 
	SELECT DISTINCT t1.Idbatch AS id, 
		0 AS parentid,
		t1.Idtemplate_method,
		0,
		0 as Idbatch_detail_aa,
		(t2.cod_template_method||' - '||t2.abbreviation) as "abbreviation",
		t2.cod_repetition,
		CAST('B-'||TO_CHAR(t3.Num_tray, '00000') AS VARCHAR) as num_tray,
		t4.date_result as date_result,
		t4.date_result as hour_result,
		CASE 
			WHEN cast(date_result as date) - cast(current_date as date) = 0 then 0
			WHEN cast(date_result as date) - cast(current_date as date) = 1 then 0
			WHEN cast(date_result as date) - cast(current_date as date) >= 1 
				and cast(date_result as date) - cast(current_date as date) <= 3 then 1
			WHEN cast(date_result as date) - cast(current_date as date) >= 4 then 2
		END AS Image_index,
		0 as urgent_sample
	FROM batch_detail_aa_twofold t1
		INNER JOIN template_method t2
			ON t1.idtemplate_method = t2.idtemplate_method
		INNER JOIN tmp_batch t3
			ON t1.idbatch = t3.idbatch
		INNER JOIN tmp_batch_date t4
			ON t1.idbatch = t4.idbatch
	ORDER BY num_tray ASC;
	
	-- parent's children
	CREATE TEMP TABLE tmp_children ON COMMIT DROP AS 
	SELECT DISTINCT t1.Idrecep_sample_detail_elem as id,
		t1.Idbatch as parentid,
		t1.Idtemplate_method,
		t1.Idrecep_sample_detail_elem,
		t1.Idbatch_detail_aa,
		t2.cod_sample as abbreviation,
		cast(0 as int2),
		'',
		cast(null as timestamp) as date_result, cast(null as timestamp) as hour_result,
		cast(3 as int) as Image_index,
		case 
			when t4.idcell_reported is null then 0
			else 1 
		end as urgent_sample
		
	FROM batch_detail_aa_twofold t1
		INNER JOIN recep_sample_detail t2
			ON t1.idrecep_sample_detail = t2.idrecep_sample_detail
		INNER JOIN tmp_batch t3
			ON t1.idbatch = t3.idbatch
		LEFT OUTER JOIN cells_program t4
			ON t1.idrecep_sample_detail = t4.idrecep_sample_detail
			AND t1.idrecep_sample_detail_elem = t4.idrecep_sample_detail_elem
			AND t1.idtemplate_method = t4.idtemplate_method
	ORDER BY t2.cod_sample;

	v_id = COALESCE((SELECT MAX(id)
			FROM tmp_parent), 0)+1;
		
	DROP SEQUENCE IF EXISTS seq_id;
	EXECUTE('CREATE TEMP SEQUENCE seq_id START '|| CAST( v_id AS VARCHAR));
		
	ALTER TABLE tmp_children 
	ALTER COLUMN id 
        SET DEFAULT NEXTVAL('seq_id');
        
	UPDATE tmp_children
	SET id = NEXTVAL('seq_id');
	
	-- union of queries
	return query 
	SELECT * FROM tmp_parent
	UNION ALL
	SELECT * FROM tmp_children;

END;
$$ LANGUAGE plpgsql;

