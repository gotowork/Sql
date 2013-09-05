----------- REPORTES ------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
---------- reporte de ensayo ----------------------------------------------------------------------
-- Solo cabecera de datos -------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
drop function if exists public.sp_rpt_report_head(int8);
-- select * from public.sp_rpt_report_head(24)
CREATE OR REPLACE FUNCTION public.sp_rpt_report_head(p_idrecep_sample_report int8)
 returns TABLE ("cod_recep_sample" varchar, "date_reception" timestamp, "date_result" timestamp, "type_post" char, 
 "cod_company" varchar, "ruc" varchar, "business_name" varchar, "domicile" varchar, "mail" varchar, "phone_client" varchar,
 "name_contact1" varchar,
 "name_contact2" varchar
)AS $$
BEGIN

	RETURN query
	SELECT t2.cod_recep_sample, t2.date_reception, t2.date_result, t2.type_post,		
		/*---- compañia -----*/
		t5.cod_company, t5.ruc, t5.business_name, t5.domicile, t5.mail, t2.phone_client,
		/*---- contacto1 ----*/
		t3.allname as name_contact1, 
		/*---- contacto2 ----*/
		t4.allname as name_contact2
	FROM recep_sample_report t1 
		INNER JOIN recep_sample t2
			ON t1.idrecep_sample = t2.idrecep_sample
		LEFT OUTER JOIN person t3
			ON t3.idperson = t2.idcontact1
		LEFT OUTER JOIN person t4
			ON t4.idperson = t2.idcontact2
		LEFT OUTER JOIN company t5
			ON t2.idcompany = t5.idcompany
	WHERE t1.idrecep_sample_report = p_idrecep_sample_report;
END;
$$ LANGUAGE plpgsql;

---------------------------------------------------------------------------------------------------
---------- reporte de ensayo ----------------------------------------------------------------------
-- Solo métodos de ensayo aplicados ---------------------------------------------------------------
---------------------------------------------------------------------------------------------------
drop function if exists public.sp_rpt_report_methods(int8);
-- select * from public.sp_rpt_report_methods(24)
CREATE OR REPLACE FUNCTION public.sp_rpt_report_methods(p_idrecep_sample_report int8)
 returns TABLE ("cod_template_method" varchar, "abbreviation" varchar, "title" varchar, "recognized" varchar
)AS $$
BEGIN

	RETURN query
	SELECT DISTINCT t2.cod_template_method, t2.abbreviation, t2.title, 
		CAST(
		CASE  
		   WHEN t2.recognized = true THEN '*'
		   ELSE ''
		END AS VARCHAR) AS recognized 
	FROM cells_reported t1
		INNER JOIN template_method t2		
				ON t1.idtemplate_method = t2.idtemplate_method		
	WHERE t1.idrecep_sample_report = p_idrecep_sample_report;
		
END;
$$ LANGUAGE plpgsql;


---------------------------------------------------------------------------------------------------
---------- reporte de ensayo ----------------------------------------------------------------------
-- Mostrar solo resultados ------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
drop function if exists public.sp_rpt_report_results(int8);
-- select * from public.sp_rpt_report_results(30)
CREATE OR REPLACE FUNCTION public.sp_rpt_report_results(p_idrecep_sample_report int8)
 returns TABLE ("Idrecep_sample_detail_elem" int8, "Idrecep_sample" int8, "Idrecep_sample_detail" int8, "Idtemplate_method" int4, "Result_analysis" decimal,
 "Cod_template_method" varchar, "Abbreviation" varchar, "Name_unit" varchar, "Order_sample" int2, "Cod_sample" varchar, "Procedence" varchar, "Name_sample" varchar
 , "Str_result_analysis" varchar, "Description" varchar
)AS $$
BEGIN

	return query
	SELECT t2.idrecep_sample_detail_elem, t2.idrecep_sample, t2.idrecep_sample_detail,
		t2.idtemplate_method, t2.result_analysis, t3.cod_template_method, 
		t3.abbreviation, t4.name_unit, t5.order_sample, t5.cod_sample, t5.procedence,
		t5.name_sample, t2.str_result_analysis, t6.description
	FROM cells_reported t1, recep_sample_detail_elem t2, template_method t3,
		measurement_unit t4, recep_sample_detail t5, description_sample t6
	WHERE t1.idrecep_sample_report = p_idrecep_sample_report
		AND t1.idrecep_sample_detail_elem = t2.idrecep_sample_detail_elem
		AND t2.idtemplate_method = t3.idtemplate_method
		AND t4.idunit = t3.idunit_result
		AND t2.idrecep_sample_detail = t5.idrecep_sample_detail
		AND t5.cod_des_sample = t6.cod_des_sample;
END;
$$ LANGUAGE plpgsql;


-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
----------- Reporte por cliente -----------------------------------------------------------------
-------------------------------------------------------------------------------------------------
drop function if exists public.sp_rpt_report_client();
-- select * from public.sp_rpt_report_client()
CREATE OR REPLACE FUNCTION public.sp_rpt_report_client()
 returns TABLE ("Idcompany" smallint, "Cod_company" varchar, "Business_name" varchar
)AS $$
BEGIN

	return query
	SELECT idcompany, cod_company, business_name
	FROM company;
				
END;
$$ LANGUAGE plpgsql;






drop function if exists public.sp_rpt_report_results_by_client();
-- select * from public.sp_rpt_report_results_by_client()
CREATE OR REPLACE FUNCTION public.sp_rpt_report_results_by_client()
 returns TABLE ("Idrecep_sample_detail_elem" int8, "Idrecep_sample" int8, "Idrecep_sample_detail" int8, "Idtemplate_method" int4, "Result_analysis" decimal,
 "Cod_template_method" varchar, "Abbreviation" varchar, "Name_unit" varchar, "Order_sample" int2, "Cod_sample" varchar, "Procedence" varchar, "Name_sample" varchar,
 "Idcompany" int2, "Cod_interno" bigint
)AS $$
BEGIN

	return query
	SELECT t2.idrecep_sample_detail_elem, t2.idrecep_sample, t2.idrecep_sample_detail,
		t2.idtemplate_method, t2.result_analysis, t3.cod_template_method, 
		t3.abbreviation, t4.name_unit, t5.order_sample, t5.cod_sample, t5.procedence,
		t5.name_sample, t7.idcompany, t5.cod_interno
	FROM cells_reported t1
		INNER JOIN recep_sample_detail_elem t2
			ON t1.idrecep_sample_detail_elem = t2.idrecep_sample_detail_elem
		INNER JOIN template_method t3
			ON t2.idtemplate_method = t3.idtemplate_method
		INNER JOIN measurement_unit t4
			ON t4.idunit = t3.idunit_result
		INNER JOIN recep_sample_detail t5
			ON t2.idrecep_sample_detail = t5.idrecep_sample_detail
		INNER JOIN recep_sample t6
			ON t5.idrecep_sample = t6.idrecep_sample		
		INNER JOIN company t7
			ON t6.idcompany = t7.idcompany;
				
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_rpt_report_etiq(bigint);
-- select * from public.sp_rpt_report_etiq(55)
CREATE OR REPLACE FUNCTION public.sp_rpt_report_etiq(p_idrecep_sample bigint)
 returns TABLE ("Idrecep_sample" int8, "Idrecep_sample_detail" int8,
 "Order_sample" int2, "Cod_sample" varchar, "Procedence" varchar
)AS $$
BEGIN
	RETURN QUERY
	SELECT idrecep_sample, idrecep_sample_detail, order_sample, cod_sample, procedence
	FROM recep_sample_detail
	WHERE idrecep_sample = p_idrecep_sample;
				
END;
$$ LANGUAGE plpgsql;


drop function if exists public.sp_rpt_report_etiq_methods_by_sample(bigint);
-- select * from public.sp_rpt_report_etiq_methods_by_sample(55)
CREATE OR REPLACE FUNCTION public.sp_rpt_report_etiq_methods_by_sample(p_idrecep_sample bigint)
 returns TABLE ("Idrecep_sample" int8, "Idrecep_sample_detail" int8,
 "Cod_template_method" varchar, "Symbol" varchar
)AS $$
BEGIN
	RETURN QUERY
	SELECT DISTINCT idrecep_sample, idrecep_sample_detail, t2.cod_template_method, t3.symbol 
	FROM recep_sample_detail_elem t1
		INNER JOIN template_method t2
			ON t1.idtemplate_method = t2.idtemplate_method
		INNER JOIN template_method_aa t3
			ON t2.idtemplate_method = t3.idtemplate_method
	WHERE idrecep_sample = p_idrecep_sample
	ORDER BY Idrecep_sample, Idrecep_sample_detail;	
				
END;
$$ LANGUAGE plpgsql;
