
drop function if exists public.sp_corr_modules_Insert(varchar,varchar,varchar,int4,int2,varchar,date,varchar,date,bool,varchar);
CREATE OR REPLACE FUNCTION public.sp_corr_modules_Insert
(
	p_cod_module varchar(20) ,
	p_name_module varchar(20) = null ,
	p_prefix varchar(20) = null ,
	p_correlative int4 = null ,
	p_num_digits int2 = null ,
	p_usernew varchar(50) = null ,
	p_datenew date = null ,
	p_useredit varchar(50) = null ,
	p_dateedit date = null ,
	p_status bool = null ,
	p_cod_serie varchar(10) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.corr_modules
(
	cod_module,
	name_module,
	prefix,
	correlative,
	num_digits,
	usernew,
	datenew,
	useredit,
	dateedit,
	status,
	cod_serie

)
VALUES
(
	p_cod_module,
	p_name_module,
	p_prefix,
	p_correlative,
	p_num_digits,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status,
	p_cod_serie

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_corr_modules_Update(varchar,varchar,varchar,int4,int2,varchar,date,varchar,date,bool,varchar);
CREATE OR REPLACE FUNCTION public.sp_corr_modules_Update
(
	p_cod_module varchar(20),
	p_name_module varchar(20) = null,
	p_prefix varchar(20) = null,
	p_correlative int4 = null,
	p_num_digits int2 = null,
	p_usernew varchar(50) = null,
	p_datenew date = null,
	p_useredit varchar(50) = null,
	p_dateedit date = null,
	p_status bool = null,
	p_cod_serie varchar(10) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.corr_modules
SET
	cod_module = p_cod_module,
	name_module = p_name_module,
	prefix = p_prefix,
	correlative = p_correlative,
	num_digits = p_num_digits,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status,
	cod_serie = p_cod_serie
 WHERE 
	cod_module = p_cod_module;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_corr_modules_SelectByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_corr_modules_SelectByPrimaryKey
(
	p_cod_module varchar(20)
) returns TABLE ("Cod_module" varchar, "Name_module" varchar, "Prefix" varchar, "Correlative" int4, "Num_digits" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Cod_serie" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.corr_modules
	WHERE 
			cod_module = p_cod_module;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_corr_modules_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_corr_modules_SelectAll()
 returns TABLE ("Cod_module" varchar, "Name_module" varchar, "Prefix" varchar, "Correlative" int4, "Num_digits" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Cod_serie" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.corr_modules;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_corr_modules_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_corr_modules_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (cod_module varchar, name_module varchar, prefix varchar, correlative int4, num_digits int2, usernew varchar, datenew date, useredit varchar, dateedit date, status bool, cod_serie varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.corr_modules WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_corr_modules_DeleteByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_corr_modules_DeleteByPrimaryKey
(
	p_cod_module varchar(20)
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.corr_modules
 WHERE 
	cod_module = p_cod_module; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_corr_modules_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_corr_modules_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.corr_modules WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_digestion_method_Insert(varchar,varchar,bool);
CREATE OR REPLACE FUNCTION public.sp_digestion_method_Insert
(
	p_cod_digestion_method varchar(5) ,
	p_name_digestion_method varchar(20) = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.digestion_method
(
	cod_digestion_method,
	name_digestion_method,
	status

)
VALUES
(
	p_cod_digestion_method,
	p_name_digestion_method,
	p_status

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_digestion_method_Update(varchar,varchar,bool);
CREATE OR REPLACE FUNCTION public.sp_digestion_method_Update
(
	p_cod_digestion_method varchar(5),
	p_name_digestion_method varchar(20) = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.digestion_method
SET
	cod_digestion_method = p_cod_digestion_method,
	name_digestion_method = p_name_digestion_method,
	status = p_status
 WHERE 
	cod_digestion_method = p_cod_digestion_method;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_digestion_method_SelectByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_digestion_method_SelectByPrimaryKey
(
	p_cod_digestion_method varchar(5)
) returns TABLE ("Cod_digestion_method" varchar, "Name_digestion_method" varchar, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.digestion_method
	WHERE 
			cod_digestion_method = p_cod_digestion_method;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_digestion_method_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_digestion_method_SelectAll()
 returns TABLE ("Cod_digestion_method" varchar, "Name_digestion_method" varchar, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.digestion_method;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_digestion_method_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_digestion_method_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (cod_digestion_method varchar, name_digestion_method varchar, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.digestion_method WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_digestion_method_DeleteByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_digestion_method_DeleteByPrimaryKey
(
	p_cod_digestion_method varchar(5)
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.digestion_method
 WHERE 
	cod_digestion_method = p_cod_digestion_method; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_digestion_method_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_digestion_method_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.digestion_method WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_profile_system_Insert(int2,varchar);
CREATE OR REPLACE FUNCTION public.sp_profile_system_Insert
(
	p_idprofile int2 ,
	p_profile_name varchar(30) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.profile_system
(
	profile_name

)
VALUES
(
	p_profile_name

)returning idprofile into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_profile_system_Update(int2,varchar);
CREATE OR REPLACE FUNCTION public.sp_profile_system_Update
(
	p_idprofile int2,
	p_profile_name varchar(30) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.profile_system
SET
	profile_name = p_profile_name
 WHERE 
	idprofile = p_idprofile;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_profile_system_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_profile_system_SelectByPrimaryKey
(
	p_idprofile int2
) returns TABLE ("Idprofile" int2, "Profile_name" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.profile_system
	WHERE 
			idprofile = p_idprofile;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_profile_system_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_profile_system_SelectAll()
 returns TABLE ("Idprofile" int2, "Profile_name" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.profile_system;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_profile_system_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_profile_system_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idprofile int2, profile_name varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.profile_system WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_profile_system_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_profile_system_DeleteByPrimaryKey
(
	p_idprofile int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.profile_system
 WHERE 
	idprofile = p_idprofile; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_profile_system_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_profile_system_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.profile_system WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_Insert(varchar,varchar,varchar,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_process_Insert
(
	p_cod_process varchar(4) ,
	p_nom_process varchar(30) = null ,
	p_description varchar(100) = null ,
	p_cod_module varchar(4) = null ,
	p_cod_area varchar(4) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.process
(
	cod_process,
	nom_process,
	description,
	cod_module,
	cod_area

)
VALUES
(
	p_cod_process,
	p_nom_process,
	p_description,
	p_cod_module,
	p_cod_area

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_Update(varchar,varchar,varchar,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_process_Update
(
	p_cod_process varchar(4),
	p_nom_process varchar(30) = null,
	p_description varchar(100) = null,
	p_cod_module varchar(4) = null,
	p_cod_area varchar(4) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.process
SET
	cod_process = p_cod_process,
	nom_process = p_nom_process,
	description = p_description,
	cod_module = p_cod_module,
	cod_area = p_cod_area
 WHERE 
	cod_process = p_cod_process;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_SelectByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_process_SelectByPrimaryKey
(
	p_cod_process varchar(4)
) returns TABLE ("Cod_process" varchar, "Nom_process" varchar, "Description" varchar, "Cod_module" varchar, "Cod_area" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.process
	WHERE 
			cod_process = p_cod_process;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_process_SelectAll()
 returns TABLE ("Cod_process" varchar, "Nom_process" varchar, "Description" varchar, "Cod_module" varchar, "Cod_area" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.process;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_process_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (cod_process varchar, nom_process varchar, description varchar, cod_module varchar, cod_area varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.process WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_DeleteByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_process_DeleteByPrimaryKey
(
	p_cod_process varchar(4)
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.process
 WHERE 
	cod_process = p_cod_process; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_process_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.process WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_document_recep_Insert(int4,varchar,int4,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_document_recep_Insert
(
	p_iddocument_recep int4 ,
	p_name_file varchar(15) = null ,
	p_order_file int4 = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.document_recep
(
	name_file,
	order_file,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_name_file,
	p_order_file,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning iddocument_recep into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_document_recep_Update(int4,varchar,int4,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_document_recep_Update
(
	p_iddocument_recep int4,
	p_name_file varchar(15) = null,
	p_order_file int4 = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.document_recep
SET
	name_file = p_name_file,
	order_file = p_order_file,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	iddocument_recep = p_iddocument_recep;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_document_recep_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_document_recep_SelectByPrimaryKey
(
	p_iddocument_recep int4
) returns TABLE ("Iddocument_recep" int4, "Name_file" varchar, "Order_file" int4, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.document_recep
	WHERE 
			iddocument_recep = p_iddocument_recep;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_document_recep_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_document_recep_SelectAll()
 returns TABLE ("Iddocument_recep" int4, "Name_file" varchar, "Order_file" int4, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.document_recep;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_document_recep_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_document_recep_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (iddocument_recep int4, name_file varchar, order_file int4, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.document_recep WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_document_recep_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_document_recep_DeleteByPrimaryKey
(
	p_iddocument_recep int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.document_recep
 WHERE 
	iddocument_recep = p_iddocument_recep; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_document_recep_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_document_recep_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.document_recep WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_Insert(int2,varchar,varchar,bpchar,bpchar,bool,int2,int2,date,date,varchar,date,varchar,date,bool,bool);
CREATE OR REPLACE FUNCTION public.sp_mr_Insert
(
	p_idmr int2 ,
	p_cod_mr varchar(15) = null ,
	p_lot varchar(12) = null ,
	p_type_mr bpchar = null ,
	p_type_material bpchar = null ,
	p_status_mr bool = null ,
	p_manufaturer int2 = null ,
	p_certifier int2 = null ,
	p_fbegin_validity date = null ,
	p_fend_validity date = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null ,
	p_solid bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.mr
(
	cod_mr,
	lot,
	type_mr,
	type_material,
	status_mr,
	manufaturer,
	certifier,
	fbegin_validity,
	fend_validity,
	usernew,
	datenew,
	useredit,
	dateedit,
	status,
	solid

)
VALUES
(
	p_cod_mr,
	p_lot,
	p_type_mr,
	p_type_material,
	p_status_mr,
	p_manufaturer,
	p_certifier,
	p_fbegin_validity,
	p_fend_validity,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status,
	p_solid

)returning idmr into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_Update(int2,varchar,varchar,bpchar,bpchar,bool,int2,int2,date,date,varchar,date,varchar,date,bool,bool);
CREATE OR REPLACE FUNCTION public.sp_mr_Update
(
	p_idmr int2,
	p_cod_mr varchar(15) = null,
	p_lot varchar(12) = null,
	p_type_mr bpchar = null,
	p_type_material bpchar = null,
	p_status_mr bool = null,
	p_manufaturer int2 = null,
	p_certifier int2 = null,
	p_fbegin_validity date = null,
	p_fend_validity date = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null,
	p_solid bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.mr
SET
	cod_mr = p_cod_mr,
	lot = p_lot,
	type_mr = p_type_mr,
	type_material = p_type_material,
	status_mr = p_status_mr,
	manufaturer = p_manufaturer,
	certifier = p_certifier,
	fbegin_validity = p_fbegin_validity,
	fend_validity = p_fend_validity,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status,
	solid = p_solid
 WHERE 
	idmr = p_idmr;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_mr_SelectByPrimaryKey
(
	p_idmr int2
) returns TABLE ("Idmr" int2, "Cod_mr" varchar, "Lot" varchar, "Type_mr" bpchar, "Type_material" bpchar, "Status_mr" bool, "Manufaturer" int2, "Certifier" int2, "Fbegin_validity" date, "Fend_validity" date, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Solid" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.mr
	WHERE 
			idmr = p_idmr;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_mr_SelectAll()
 returns TABLE ("Idmr" int2, "Cod_mr" varchar, "Lot" varchar, "Type_mr" bpchar, "Type_material" bpchar, "Status_mr" bool, "Manufaturer" int2, "Certifier" int2, "Fbegin_validity" date, "Fend_validity" date, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Solid" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.mr;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_mr_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idmr int2, cod_mr varchar, lot varchar, type_mr bpchar, type_material bpchar, status_mr bool, manufaturer int2, certifier int2, fbegin_validity date, fend_validity date, usernew varchar, datenew date, useredit varchar, dateedit date, status bool, solid bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.mr WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_mr_DeleteByPrimaryKey
(
	p_idmr int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.mr
 WHERE 
	idmr = p_idmr; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_mr_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.mr WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tablempn_Insert(int2,varchar,varchar,numeric,numeric);
CREATE OR REPLACE FUNCTION public.sp_tablempn_Insert
(
	p_idtablempn int2 ,
	p_combination_pos varchar(5) = null ,
	p_mpn_index varchar(5) = null ,
	p_limit_lower numeric = null ,
	p_limit_high numeric = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.tablempn
(
	combination_pos,
	mpn_index,
	limit_lower,
	limit_high

)
VALUES
(
	p_combination_pos,
	p_mpn_index,
	p_limit_lower,
	p_limit_high

)returning idtablempn into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tablempn_Update(int2,varchar,varchar,numeric,numeric);
CREATE OR REPLACE FUNCTION public.sp_tablempn_Update
(
	p_idtablempn int2,
	p_combination_pos varchar(5) = null,
	p_mpn_index varchar(5) = null,
	p_limit_lower numeric = null,
	p_limit_high numeric = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.tablempn
SET
	combination_pos = p_combination_pos,
	mpn_index = p_mpn_index,
	limit_lower = p_limit_lower,
	limit_high = p_limit_high
 WHERE 
	idtablempn = p_idtablempn;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tablempn_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_tablempn_SelectByPrimaryKey
(
	p_idtablempn int2
) returns TABLE ("Idtablempn" int2, "Combination_pos" varchar, "Mpn_index" varchar, "Limit_lower" numeric, "Limit_high" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.tablempn
	WHERE 
			idtablempn = p_idtablempn;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tablempn_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_tablempn_SelectAll()
 returns TABLE ("Idtablempn" int2, "Combination_pos" varchar, "Mpn_index" varchar, "Limit_lower" numeric, "Limit_high" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.tablempn;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tablempn_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_tablempn_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtablempn int2, combination_pos varchar, mpn_index varchar, limit_lower numeric, limit_high numeric
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.tablempn WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tablempn_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_tablempn_DeleteByPrimaryKey
(
	p_idtablempn int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.tablempn
 WHERE 
	idtablempn = p_idtablempn; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tablempn_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_tablempn_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.tablempn WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batchicp_Insert(int4,timestamp);
CREATE OR REPLACE FUNCTION public.sp_batchicp_Insert
(
	p_idbatchicp int4 ,
	p_datecreation timestamp = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.batchicp
(
	datecreation

)
VALUES
(
	p_datecreation

)returning idbatchicp into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batchicp_Update(int4,timestamp);
CREATE OR REPLACE FUNCTION public.sp_batchicp_Update
(
	p_idbatchicp int4,
	p_datecreation timestamp = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.batchicp
SET
	datecreation = p_datecreation
 WHERE 
	idbatchicp = p_idbatchicp;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batchicp_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_batchicp_SelectByPrimaryKey
(
	p_idbatchicp int4
) returns TABLE ("Idbatchicp" int4, "Datecreation" timestamp
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.batchicp
	WHERE 
			idbatchicp = p_idbatchicp;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batchicp_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_batchicp_SelectAll()
 returns TABLE ("Idbatchicp" int4, "Datecreation" timestamp
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.batchicp;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batchicp_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_batchicp_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idbatchicp int4, datecreation timestamp
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.batchicp WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batchicp_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_batchicp_DeleteByPrimaryKey
(
	p_idbatchicp int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.batchicp
 WHERE 
	idbatchicp = p_idbatchicp; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batchicp_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_batchicp_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.batchicp WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tray_Insert(int2,varchar,int2,int2,int2,numeric,bpchar,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_tray_Insert
(
	p_idtray int2 ,
	p_name_tray varchar(7) = null ,
	p_num_cols int2 = null ,
	p_num_rows int2 = null ,
	p_repetition int2 = null ,
	p_cost_method numeric = null ,
	p_type_tray bpchar = null ,
	p_size_tray int2 = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.tray
(
	name_tray,
	num_cols,
	num_rows,
	repetition,
	cost_method,
	type_tray,
	size_tray,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_name_tray,
	p_num_cols,
	p_num_rows,
	p_repetition,
	p_cost_method,
	p_type_tray,
	p_size_tray,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idtray into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tray_Update(int2,varchar,int2,int2,int2,numeric,bpchar,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_tray_Update
(
	p_idtray int2,
	p_name_tray varchar(7) = null,
	p_num_cols int2 = null,
	p_num_rows int2 = null,
	p_repetition int2 = null,
	p_cost_method numeric = null,
	p_type_tray bpchar = null,
	p_size_tray int2 = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.tray
SET
	name_tray = p_name_tray,
	num_cols = p_num_cols,
	num_rows = p_num_rows,
	repetition = p_repetition,
	cost_method = p_cost_method,
	type_tray = p_type_tray,
	size_tray = p_size_tray,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtray = p_idtray;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tray_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_tray_SelectByPrimaryKey
(
	p_idtray int2
) returns TABLE ("Idtray" int2, "Name_tray" varchar, "Num_cols" int2, "Num_rows" int2, "Repetition" int2, "Cost_method" numeric, "Type_tray" bpchar, "Size_tray" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.tray
	WHERE 
			idtray = p_idtray;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tray_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_tray_SelectAll()
 returns TABLE ("Idtray" int2, "Name_tray" varchar, "Num_cols" int2, "Num_rows" int2, "Repetition" int2, "Cost_method" numeric, "Type_tray" bpchar, "Size_tray" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.tray;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tray_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_tray_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtray int2, name_tray varchar, num_cols int2, num_rows int2, repetition int2, cost_method numeric, type_tray bpchar, size_tray int2, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.tray WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tray_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_tray_DeleteByPrimaryKey
(
	p_idtray int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.tray
 WHERE 
	idtray = p_idtray; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tray_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_tray_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.tray WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_description_sample_Insert(varchar,varchar,varchar,date,varchar,date,bool,int2);
CREATE OR REPLACE FUNCTION public.sp_description_sample_Insert
(
	p_cod_des_sample varchar(5) ,
	p_description varchar(100) = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null ,
	p_priority_order int2 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.description_sample
(
	cod_des_sample,
	description,
	usernew,
	datenew,
	useredit,
	dateedit,
	status,
	priority_order

)
VALUES
(
	p_cod_des_sample,
	p_description,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status,
	p_priority_order

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_description_sample_Update(varchar,varchar,varchar,date,varchar,date,bool,int2);
CREATE OR REPLACE FUNCTION public.sp_description_sample_Update
(
	p_cod_des_sample varchar(5),
	p_description varchar(100) = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null,
	p_priority_order int2 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.description_sample
SET
	cod_des_sample = p_cod_des_sample,
	description = p_description,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status,
	priority_order = p_priority_order
 WHERE 
	cod_des_sample = p_cod_des_sample;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_description_sample_SelectByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_description_sample_SelectByPrimaryKey
(
	p_cod_des_sample varchar(5)
) returns TABLE ("Cod_des_sample" varchar, "Description" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Priority_order" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.description_sample
	WHERE 
			cod_des_sample = p_cod_des_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_description_sample_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_description_sample_SelectAll()
 returns TABLE ("Cod_des_sample" varchar, "Description" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Priority_order" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.description_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_description_sample_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_description_sample_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (cod_des_sample varchar, description varchar, usernew varchar, datenew date, useredit varchar, dateedit date, status bool, priority_order int2
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.description_sample WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_description_sample_DeleteByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_description_sample_DeleteByPrimaryKey
(
	p_cod_des_sample varchar(5)
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.description_sample
 WHERE 
	cod_des_sample = p_cod_des_sample; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_description_sample_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_description_sample_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.description_sample WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_Insert(varchar,varchar,varchar,varchar,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_type_sample_Insert
(
	p_cod_type_sample varchar(5) ,
	p_prefix varchar(5) = null ,
	p_name_type_sample varchar(20) = null ,
	p_description varchar(100) = null ,
	p_usernew varchar(50) = null ,
	p_datenew date = null ,
	p_useredit varchar(50) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.type_sample
(
	cod_type_sample,
	prefix,
	name_type_sample,
	description,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_cod_type_sample,
	p_prefix,
	p_name_type_sample,
	p_description,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_Update(varchar,varchar,varchar,varchar,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_type_sample_Update
(
	p_cod_type_sample varchar(5),
	p_prefix varchar(5) = null,
	p_name_type_sample varchar(20) = null,
	p_description varchar(100) = null,
	p_usernew varchar(50) = null,
	p_datenew date = null,
	p_useredit varchar(50) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.type_sample
SET
	cod_type_sample = p_cod_type_sample,
	prefix = p_prefix,
	name_type_sample = p_name_type_sample,
	description = p_description,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	cod_type_sample = p_cod_type_sample;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_SelectByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_type_sample_SelectByPrimaryKey
(
	p_cod_type_sample varchar(5)
) returns TABLE ("Cod_type_sample" varchar, "Prefix" varchar, "Name_type_sample" varchar, "Description" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.type_sample
	WHERE 
			cod_type_sample = p_cod_type_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_type_sample_SelectAll()
 returns TABLE ("Cod_type_sample" varchar, "Prefix" varchar, "Name_type_sample" varchar, "Description" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.type_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_type_sample_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (cod_type_sample varchar, prefix varchar, name_type_sample varchar, description varchar, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.type_sample WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_DeleteByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_type_sample_DeleteByPrimaryKey
(
	p_cod_type_sample varchar(5)
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.type_sample
 WHERE 
	cod_type_sample = p_cod_type_sample; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_type_sample_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.type_sample WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_serie_Insert(varchar,varchar,int2,date,date,bool,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_serie_Insert
(
	p_cod_serie varchar(10) ,
	p_nom_serie varchar(20) = null ,
	p_num_digits int2 = null ,
	p_dateinit date = null ,
	p_dateend date = null ,
	p_status_serie bool = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.serie
(
	cod_serie,
	nom_serie,
	num_digits,
	dateinit,
	dateend,
	status_serie,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_cod_serie,
	p_nom_serie,
	p_num_digits,
	p_dateinit,
	p_dateend,
	p_status_serie,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_serie_Update(varchar,varchar,int2,date,date,bool,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_serie_Update
(
	p_cod_serie varchar(10),
	p_nom_serie varchar(20) = null,
	p_num_digits int2 = null,
	p_dateinit date = null,
	p_dateend date = null,
	p_status_serie bool = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.serie
SET
	cod_serie = p_cod_serie,
	nom_serie = p_nom_serie,
	num_digits = p_num_digits,
	dateinit = p_dateinit,
	dateend = p_dateend,
	status_serie = p_status_serie,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	cod_serie = p_cod_serie;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_serie_SelectByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_serie_SelectByPrimaryKey
(
	p_cod_serie varchar(10)
) returns TABLE ("Cod_serie" varchar, "Nom_serie" varchar, "Num_digits" int2, "Dateinit" date, "Dateend" date, "Status_serie" bool, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.serie
	WHERE 
			cod_serie = p_cod_serie;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_serie_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_serie_SelectAll()
 returns TABLE ("Cod_serie" varchar, "Nom_serie" varchar, "Num_digits" int2, "Dateinit" date, "Dateend" date, "Status_serie" bool, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.serie;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_serie_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_serie_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (cod_serie varchar, nom_serie varchar, num_digits int2, dateinit date, dateend date, status_serie bool, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.serie WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_serie_DeleteByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_serie_DeleteByPrimaryKey
(
	p_cod_serie varchar(10)
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.serie
 WHERE 
	cod_serie = p_cod_serie; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_serie_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_serie_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.serie WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_elem_Insert(int8,int2,int4,int2,varchar,varchar,int2,int8);
CREATE OR REPLACE FUNCTION public.sp_recep_elem_Insert
(
	p_idrecep_elem int8 ,
	p_idelement int2 = null ,
	p_idtemplate_method int4 = null ,
	p_idunit int2 = null ,
	p_abbreviation varchar(15) = null ,
	p_name_unit varchar(6) = null ,
	p_percent_repetition int2 = null ,
	p_idrecep_sample int8 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.recep_elem
(
	idelement,
	idtemplate_method,
	idunit,
	abbreviation,
	name_unit,
	percent_repetition,
	idrecep_sample

)
VALUES
(
	p_idelement,
	p_idtemplate_method,
	p_idunit,
	p_abbreviation,
	p_name_unit,
	p_percent_repetition,
	p_idrecep_sample

)returning idrecep_elem into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_elem_Update(int8,int2,int4,int2,varchar,varchar,int2,int8);
CREATE OR REPLACE FUNCTION public.sp_recep_elem_Update
(
	p_idrecep_elem int8,
	p_idelement int2 = null,
	p_idtemplate_method int4 = null,
	p_idunit int2 = null,
	p_abbreviation varchar(15) = null,
	p_name_unit varchar(6) = null,
	p_percent_repetition int2 = null,
	p_idrecep_sample int8 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.recep_elem
SET
	idelement = p_idelement,
	idtemplate_method = p_idtemplate_method,
	idunit = p_idunit,
	abbreviation = p_abbreviation,
	name_unit = p_name_unit,
	percent_repetition = p_percent_repetition,
	idrecep_sample = p_idrecep_sample
 WHERE 
	idrecep_elem = p_idrecep_elem;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_elem_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_elem_SelectByPrimaryKey
(
	p_idrecep_elem int8
) returns TABLE ("Idrecep_elem" int8, "Idelement" int2, "Idtemplate_method" int4, "Idunit" int2, "Abbreviation" varchar, "Name_unit" varchar, "Percent_repetition" int2, "Idrecep_sample" int8
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_elem
	WHERE 
			idrecep_elem = p_idrecep_elem;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_elem_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_recep_elem_SelectAll()
 returns TABLE ("Idrecep_elem" int8, "Idelement" int2, "Idtemplate_method" int4, "Idunit" int2, "Abbreviation" varchar, "Name_unit" varchar, "Percent_repetition" int2, "Idrecep_sample" int8
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_elem;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_elem_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_elem_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_elem int8, idelement int2, idtemplate_method int4, idunit int2, abbreviation varchar, name_unit varchar, percent_repetition int2, idrecep_sample int8
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.recep_elem WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_elem_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_elem_DeleteByPrimaryKey
(
	p_idrecep_elem int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.recep_elem
 WHERE 
	idrecep_elem = p_idrecep_elem; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_elem_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_elem_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.recep_elem WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_detail_Insert(int4,varchar,varchar,numeric,bpchar,bpchar,bool,int4,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_detail_Insert
(
	p_idtemplate_method_detail int4 ,
	p_name_variable varchar(30) = null ,
	p_alias_variable varchar(30) = null ,
	p_value_variable numeric = null ,
	p_type_variable bpchar = null ,
	p_group_variable bpchar = null ,
	p_visible bool = null ,
	p_idtemplate_method int4 = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.template_method_detail
(
	name_variable,
	alias_variable,
	value_variable,
	type_variable,
	group_variable,
	visible,
	idtemplate_method,
	status

)
VALUES
(
	p_name_variable,
	p_alias_variable,
	p_value_variable,
	p_type_variable,
	p_group_variable,
	p_visible,
	p_idtemplate_method,
	p_status

)returning idtemplate_method_detail into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_detail_Update(int4,varchar,varchar,numeric,bpchar,bpchar,bool,int4,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_detail_Update
(
	p_idtemplate_method_detail int4,
	p_name_variable varchar(30) = null,
	p_alias_variable varchar(30) = null,
	p_value_variable numeric = null,
	p_type_variable bpchar = null,
	p_group_variable bpchar = null,
	p_visible bool = null,
	p_idtemplate_method int4 = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.template_method_detail
SET
	name_variable = p_name_variable,
	alias_variable = p_alias_variable,
	value_variable = p_value_variable,
	type_variable = p_type_variable,
	group_variable = p_group_variable,
	visible = p_visible,
	idtemplate_method = p_idtemplate_method,
	status = p_status
 WHERE 
	idtemplate_method_detail = p_idtemplate_method_detail;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_detail_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_detail_SelectByPrimaryKey
(
	p_idtemplate_method_detail int4
) returns TABLE ("Idtemplate_method_detail" int4, "Name_variable" varchar, "Alias_variable" varchar, "Value_variable" numeric, "Type_variable" bpchar, "Group_variable" bpchar, "Visible" bool, "Idtemplate_method" int4, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_detail
	WHERE 
			idtemplate_method_detail = p_idtemplate_method_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_detail_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_template_method_detail_SelectAll()
 returns TABLE ("Idtemplate_method_detail" int4, "Name_variable" varchar, "Alias_variable" varchar, "Value_variable" numeric, "Type_variable" bpchar, "Group_variable" bpchar, "Visible" bool, "Idtemplate_method" int4, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_detail_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_detail_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtemplate_method_detail int4, name_variable varchar, alias_variable varchar, value_variable numeric, type_variable bpchar, group_variable bpchar, visible bool, idtemplate_method int4, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.template_method_detail WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_detail_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_detail_DeleteByPrimaryKey
(
	p_idtemplate_method_detail int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.template_method_detail
 WHERE 
	idtemplate_method_detail = p_idtemplate_method_detail; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_detail_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_detail_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.template_method_detail WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tree_expression_Insert(int8,varchar,int4,int4,varchar,bool,int4,int8);
CREATE OR REPLACE FUNCTION public.sp_tree_expression_Insert
(
	p_idtree_expression int8 ,
	p_name_variable varchar(20) = null ,
	p_id int4 = null ,
	p_parentid int4 = null ,
	p_expression varchar(500) = null ,
	p_status bool = null ,
	p_idtemplate_method int4 = null ,
	p_idtemplate_method_detail int8 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.tree_expression
(
	name_variable,
	id,
	parentid,
	expression,
	status,
	idtemplate_method,
	idtemplate_method_detail

)
VALUES
(
	p_name_variable,
	p_id,
	p_parentid,
	p_expression,
	p_status,
	p_idtemplate_method,
	p_idtemplate_method_detail

)returning idtree_expression into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tree_expression_Update(int8,varchar,int4,int4,varchar,bool,int4,int8);
CREATE OR REPLACE FUNCTION public.sp_tree_expression_Update
(
	p_idtree_expression int8,
	p_name_variable varchar(20) = null,
	p_id int4 = null,
	p_parentid int4 = null,
	p_expression varchar(500) = null,
	p_status bool = null,
	p_idtemplate_method int4 = null,
	p_idtemplate_method_detail int8 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.tree_expression
SET
	name_variable = p_name_variable,
	id = p_id,
	parentid = p_parentid,
	expression = p_expression,
	status = p_status,
	idtemplate_method = p_idtemplate_method,
	idtemplate_method_detail = p_idtemplate_method_detail
 WHERE 
	idtree_expression = p_idtree_expression;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tree_expression_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_tree_expression_SelectByPrimaryKey
(
	p_idtree_expression int8
) returns TABLE ("Idtree_expression" int8, "Name_variable" varchar, "Id" int4, "Parentid" int4, "Expression" varchar, "Status" bool, "Idtemplate_method" int4, "Idtemplate_method_detail" int8
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.tree_expression
	WHERE 
			idtree_expression = p_idtree_expression;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tree_expression_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_tree_expression_SelectAll()
 returns TABLE ("Idtree_expression" int8, "Name_variable" varchar, "Id" int4, "Parentid" int4, "Expression" varchar, "Status" bool, "Idtemplate_method" int4, "Idtemplate_method_detail" int8
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.tree_expression;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tree_expression_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_tree_expression_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtree_expression int8, name_variable varchar, id int4, parentid int4, expression varchar, status bool, idtemplate_method int4, idtemplate_method_detail int8
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.tree_expression WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tree_expression_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_tree_expression_DeleteByPrimaryKey
(
	p_idtree_expression int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.tree_expression
 WHERE 
	idtree_expression = p_idtree_expression; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_tree_expression_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_tree_expression_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.tree_expression WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_format_Insert(int8,int4,varchar,int2);
CREATE OR REPLACE FUNCTION public.sp_template_method_format_Insert
(
	p_idtemplate_method_format int8 ,
	p_idtemplate_method int4 = null ,
	p_nom_field varchar(40) = null ,
	p_num_decimal int2 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.template_method_format
(
	idtemplate_method,
	nom_field,
	num_decimal

)
VALUES
(
	p_idtemplate_method,
	p_nom_field,
	p_num_decimal

)returning idtemplate_method_format into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_format_Update(int8,int4,varchar,int2);
CREATE OR REPLACE FUNCTION public.sp_template_method_format_Update
(
	p_idtemplate_method_format int8,
	p_idtemplate_method int4 = null,
	p_nom_field varchar(40) = null,
	p_num_decimal int2 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.template_method_format
SET
	idtemplate_method = p_idtemplate_method,
	nom_field = p_nom_field,
	num_decimal = p_num_decimal
 WHERE 
	idtemplate_method_format = p_idtemplate_method_format;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_format_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_template_method_format_SelectByPrimaryKey
(
	p_idtemplate_method_format int8
) returns TABLE ("Idtemplate_method_format" int8, "Idtemplate_method" int4, "Nom_field" varchar, "Num_decimal" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_format
	WHERE 
			idtemplate_method_format = p_idtemplate_method_format;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_format_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_template_method_format_SelectAll()
 returns TABLE ("Idtemplate_method_format" int8, "Idtemplate_method" int4, "Nom_field" varchar, "Num_decimal" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_format;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_format_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_format_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtemplate_method_format int8, idtemplate_method int4, nom_field varchar, num_decimal int2
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.template_method_format WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_format_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_template_method_format_DeleteByPrimaryKey
(
	p_idtemplate_method_format int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.template_method_format
 WHERE 
	idtemplate_method_format = p_idtemplate_method_format; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_format_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_format_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.template_method_format WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_module_Insert(varchar,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_module_Insert
(
	p_cod_module varchar(4) ,
	p_nom_module varchar(30) = null ,
	p_description varchar(100) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.module
(
	cod_module,
	nom_module,
	description

)
VALUES
(
	p_cod_module,
	p_nom_module,
	p_description

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_module_Update(varchar,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_module_Update
(
	p_cod_module varchar(4),
	p_nom_module varchar(30) = null,
	p_description varchar(100) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.module
SET
	cod_module = p_cod_module,
	nom_module = p_nom_module,
	description = p_description
 WHERE 
	cod_module = p_cod_module;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_module_SelectByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_module_SelectByPrimaryKey
(
	p_cod_module varchar(4)
) returns TABLE ("Cod_module" varchar, "Nom_module" varchar, "Description" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.module
	WHERE 
			cod_module = p_cod_module;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_module_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_module_SelectAll()
 returns TABLE ("Cod_module" varchar, "Nom_module" varchar, "Description" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.module;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_module_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_module_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (cod_module varchar, nom_module varchar, description varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.module WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_module_DeleteByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_module_DeleteByPrimaryKey
(
	p_cod_module varchar(4)
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.module
 WHERE 
	cod_module = p_cod_module; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_module_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_module_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.module WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_Insert(int8,int2,varchar,numeric,int4,numeric,numeric);
CREATE OR REPLACE FUNCTION public.sp_calib_Insert
(
	p_idcalib int8 ,
	p_order_calib int2 = null ,
	p_name_calib varchar(15) = null ,
	p_concentration numeric = null ,
	p_idtemplate_method int4 = null ,
	p_aliquot numeric = null ,
	p_volumen numeric = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.calib
(
	order_calib,
	name_calib,
	concentration,
	idtemplate_method,
	aliquot,
	volumen

)
VALUES
(
	p_order_calib,
	p_name_calib,
	p_concentration,
	p_idtemplate_method,
	p_aliquot,
	p_volumen

)returning idcalib into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_Update(int8,int2,varchar,numeric,int4,numeric,numeric);
CREATE OR REPLACE FUNCTION public.sp_calib_Update
(
	p_idcalib int8,
	p_order_calib int2 = null,
	p_name_calib varchar(15) = null,
	p_concentration numeric = null,
	p_idtemplate_method int4 = null,
	p_aliquot numeric = null,
	p_volumen numeric = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.calib
SET
	order_calib = p_order_calib,
	name_calib = p_name_calib,
	concentration = p_concentration,
	idtemplate_method = p_idtemplate_method,
	aliquot = p_aliquot,
	volumen = p_volumen
 WHERE 
	idcalib = p_idcalib;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_calib_SelectByPrimaryKey
(
	p_idcalib int8
) returns TABLE ("Idcalib" int8, "Order_calib" int2, "Name_calib" varchar, "Concentration" numeric, "Idtemplate_method" int4, "Aliquot" numeric, "Volumen" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.calib
	WHERE 
			idcalib = p_idcalib;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_calib_SelectAll()
 returns TABLE ("Idcalib" int8, "Order_calib" int2, "Name_calib" varchar, "Concentration" numeric, "Idtemplate_method" int4, "Aliquot" numeric, "Volumen" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.calib;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_calib_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcalib int8, order_calib int2, name_calib varchar, concentration numeric, idtemplate_method int4, aliquot numeric, volumen numeric
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.calib WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_calib_DeleteByPrimaryKey
(
	p_idcalib int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.calib
 WHERE 
	idcalib = p_idcalib; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_calib_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.calib WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_attach_Insert(int4,int4,int4,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_attach_Insert
(
	p_idattach int4 ,
	p_idprice int4 = null ,
	p_idprice_version int4 = null ,
	p_name_document varchar(500) = null ,
	p_type_document varchar(10) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.price_attach
(
	idprice,
	idprice_version,
	name_document,
	type_document

)
VALUES
(
	p_idprice,
	p_idprice_version,
	p_name_document,
	p_type_document

)returning idattach into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_attach_Update(int4,int4,int4,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_attach_Update
(
	p_idattach int4,
	p_idprice int4 = null,
	p_idprice_version int4 = null,
	p_name_document varchar(500) = null,
	p_type_document varchar(10) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.price_attach
SET
	idprice = p_idprice,
	idprice_version = p_idprice_version,
	name_document = p_name_document,
	type_document = p_type_document
 WHERE 
	idattach = p_idattach;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_attach_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_price_attach_SelectByPrimaryKey
(
	p_idattach int4
) returns TABLE ("Idattach" int4, "Idprice" int4, "Idprice_version" int4, "Name_document" varchar, "Type_document" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.price_attach
	WHERE 
			idattach = p_idattach;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_attach_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_price_attach_SelectAll()
 returns TABLE ("Idattach" int4, "Idprice" int4, "Idprice_version" int4, "Name_document" varchar, "Type_document" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.price_attach;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_attach_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_attach_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idattach int4, idprice int4, idprice_version int4, name_document varchar, type_document varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.price_attach WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_attach_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_price_attach_DeleteByPrimaryKey
(
	p_idattach int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.price_attach
 WHERE 
	idattach = p_idattach; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_attach_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_attach_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.price_attach WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_area_Insert(varchar,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_area_Insert
(
	p_cod_area varchar(4) ,
	p_nom_area varchar(30) = null ,
	p_description varchar(100) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.area
(
	cod_area,
	nom_area,
	description

)
VALUES
(
	p_cod_area,
	p_nom_area,
	p_description

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_area_Update(varchar,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_area_Update
(
	p_cod_area varchar(4),
	p_nom_area varchar(30) = null,
	p_description varchar(100) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.area
SET
	cod_area = p_cod_area,
	nom_area = p_nom_area,
	description = p_description
 WHERE 
	cod_area = p_cod_area;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_area_SelectByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_area_SelectByPrimaryKey
(
	p_cod_area varchar(4)
) returns TABLE ("Cod_area" varchar, "Nom_area" varchar, "Description" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.area
	WHERE 
			cod_area = p_cod_area;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_area_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_area_SelectAll()
 returns TABLE ("Cod_area" varchar, "Nom_area" varchar, "Description" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.area;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_area_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_area_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (cod_area varchar, nom_area varchar, description varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.area WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_area_DeleteByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_area_DeleteByPrimaryKey
(
	p_cod_area varchar(4)
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.area
 WHERE 
	cod_area = p_cod_area; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_area_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_area_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.area WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icpimport_Insert(int4,int4,int4,int4,timestamp,int4,varchar,int4,varchar,numeric,varchar,int4);
CREATE OR REPLACE FUNCTION public.sp_icpimport_Insert
(
	p_idicpimport int4 ,
	p_idbatchicp int4 = null ,
	p_methodid int4 = null ,
	p_version int4 = null ,
	p_storagedate timestamp = null ,
	p_calibid int4 = null ,
	p_elementname varchar(6) = null ,
	p_sampleid int4 = null ,
	p_name varchar(30) = null ,
	p_averageresult numeric = null ,
	p_str_result varchar(10) = null ,
	p_dilution2 int4 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.icpimport
(
	idbatchicp,
	methodid,
	version,
	storagedate,
	calibid,
	elementname,
	sampleid,
	name,
	averageresult,
	str_result,
	dilution2

)
VALUES
(
	p_idbatchicp,
	p_methodid,
	p_version,
	p_storagedate,
	p_calibid,
	p_elementname,
	p_sampleid,
	p_name,
	p_averageresult,
	p_str_result,
	p_dilution2

)returning idicpimport into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icpimport_Update(int4,int4,int4,int4,timestamp,int4,varchar,int4,varchar,numeric,varchar,int4);
CREATE OR REPLACE FUNCTION public.sp_icpimport_Update
(
	p_idicpimport int4,
	p_idbatchicp int4 = null,
	p_methodid int4 = null,
	p_version int4 = null,
	p_storagedate timestamp = null,
	p_calibid int4 = null,
	p_elementname varchar(6) = null,
	p_sampleid int4 = null,
	p_name varchar(30) = null,
	p_averageresult numeric = null,
	p_str_result varchar(10) = null,
	p_dilution2 int4 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.icpimport
SET
	idbatchicp = p_idbatchicp,
	methodid = p_methodid,
	version = p_version,
	storagedate = p_storagedate,
	calibid = p_calibid,
	elementname = p_elementname,
	sampleid = p_sampleid,
	name = p_name,
	averageresult = p_averageresult,
	str_result = p_str_result,
	dilution2 = p_dilution2
 WHERE 
	idicpimport = p_idicpimport;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icpimport_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_icpimport_SelectByPrimaryKey
(
	p_idicpimport int4
) returns TABLE ("Idicpimport" int4, "Idbatchicp" int4, "Methodid" int4, "Version" int4, "Storagedate" timestamp, "Calibid" int4, "Elementname" varchar, "Sampleid" int4, "Name" varchar, "Averageresult" numeric, "Str_result" varchar, "Dilution2" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.icpimport
	WHERE 
			idicpimport = p_idicpimport;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icpimport_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_icpimport_SelectAll()
 returns TABLE ("Idicpimport" int4, "Idbatchicp" int4, "Methodid" int4, "Version" int4, "Storagedate" timestamp, "Calibid" int4, "Elementname" varchar, "Sampleid" int4, "Name" varchar, "Averageresult" numeric, "Str_result" varchar, "Dilution2" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.icpimport;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icpimport_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_icpimport_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idicpimport int4, idbatchicp int4, methodid int4, version int4, storagedate timestamp, calibid int4, elementname varchar, sampleid int4, name varchar, averageresult numeric, str_result varchar, dilution2 int4
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.icpimport WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icpimport_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_icpimport_DeleteByPrimaryKey
(
	p_idicpimport int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.icpimport
 WHERE 
	idicpimport = p_idicpimport; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icpimport_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_icpimport_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.icpimport WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_Insert(int8,varchar,int8,int4,varchar,varchar,varchar,bpchar,bool,numeric,varchar,timestamp,varchar,bool,numeric,numeric,bool,numeric,numeric,bool,bool,bool,bool,varchar,timestamp,varchar,timestamp,varchar,timestamp);
CREATE OR REPLACE FUNCTION public.sp_batch_Insert
(
	p_idbatch int8 ,
	p_name_batch varchar(30) = null ,
	p_num_tray int8 = null ,
	p_idtemplate_method int4 = null ,
	p_cod_module varchar(4) = null ,
	p_cod_process varchar(4) = null ,
	p_cod_area varchar(4) = null ,
	p_status_process bpchar = null ,
	p_status bool = null ,
	p_mri_value numeric = null ,
	p_description varchar(100) = null ,
	p_date_creation_tray timestamp = null ,
	p_user_creation_tray varchar(20) = null ,
	p_has_sample_control bool = null ,
	p_absorvance numeric = null ,
	p_std_verification numeric = null ,
	p_flag_abs_std bool = null ,
	p_mri_measured numeric = null ,
	p_lrb_measured numeric = null ,
	p_flag_correct_abs bool = null ,
	p_flag_correct_std bool = null ,
	p_flag_correct_mri bool = null ,
	p_flag_correct_lrb bool = null ,
	p_user_close_tray varchar(20) = null ,
	p_date_close_tray timestamp = null ,
	p_user_approve_tray varchar(20) = null ,
	p_date_approve_tray timestamp = null ,
	p_user_review_tray varchar(20) = null ,
	p_date_review_tray timestamp = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.batch
(
	name_batch,
	num_tray,
	idtemplate_method,
	cod_module,
	cod_process,
	cod_area,
	status_process,
	status,
	mri_value,
	description,
	date_creation_tray,
	user_creation_tray,
	has_sample_control,
	absorvance,
	std_verification,
	flag_abs_std,
	mri_measured,
	lrb_measured,
	flag_correct_abs,
	flag_correct_std,
	flag_correct_mri,
	flag_correct_lrb,
	user_close_tray,
	date_close_tray,
	user_approve_tray,
	date_approve_tray,
	user_review_tray,
	date_review_tray

)
VALUES
(
	p_name_batch,
	p_num_tray,
	p_idtemplate_method,
	p_cod_module,
	p_cod_process,
	p_cod_area,
	p_status_process,
	p_status,
	p_mri_value,
	p_description,
	p_date_creation_tray,
	p_user_creation_tray,
	p_has_sample_control,
	p_absorvance,
	p_std_verification,
	p_flag_abs_std,
	p_mri_measured,
	p_lrb_measured,
	p_flag_correct_abs,
	p_flag_correct_std,
	p_flag_correct_mri,
	p_flag_correct_lrb,
	p_user_close_tray,
	p_date_close_tray,
	p_user_approve_tray,
	p_date_approve_tray,
	p_user_review_tray,
	p_date_review_tray

)returning idbatch into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_Update(int8,varchar,int8,int4,varchar,varchar,varchar,bpchar,bool,numeric,varchar,timestamp,varchar,bool,numeric,numeric,bool,numeric,numeric,bool,bool,bool,bool,varchar,timestamp,varchar,timestamp,varchar,timestamp);
CREATE OR REPLACE FUNCTION public.sp_batch_Update
(
	p_idbatch int8,
	p_name_batch varchar(30) = null,
	p_num_tray int8 = null,
	p_idtemplate_method int4 = null,
	p_cod_module varchar(4) = null,
	p_cod_process varchar(4) = null,
	p_cod_area varchar(4) = null,
	p_status_process bpchar = null,
	p_status bool = null,
	p_mri_value numeric = null,
	p_description varchar(100) = null,
	p_date_creation_tray timestamp = null,
	p_user_creation_tray varchar(20) = null,
	p_has_sample_control bool = null,
	p_absorvance numeric = null,
	p_std_verification numeric = null,
	p_flag_abs_std bool = null,
	p_mri_measured numeric = null,
	p_lrb_measured numeric = null,
	p_flag_correct_abs bool = null,
	p_flag_correct_std bool = null,
	p_flag_correct_mri bool = null,
	p_flag_correct_lrb bool = null,
	p_user_close_tray varchar(20) = null,
	p_date_close_tray timestamp = null,
	p_user_approve_tray varchar(20) = null,
	p_date_approve_tray timestamp = null,
	p_user_review_tray varchar(20) = null,
	p_date_review_tray timestamp = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.batch
SET
	name_batch = p_name_batch,
	num_tray = p_num_tray,
	idtemplate_method = p_idtemplate_method,
	cod_module = p_cod_module,
	cod_process = p_cod_process,
	cod_area = p_cod_area,
	status_process = p_status_process,
	status = p_status,
	mri_value = p_mri_value,
	description = p_description,
	date_creation_tray = p_date_creation_tray,
	user_creation_tray = p_user_creation_tray,
	has_sample_control = p_has_sample_control,
	absorvance = p_absorvance,
	std_verification = p_std_verification,
	flag_abs_std = p_flag_abs_std,
	mri_measured = p_mri_measured,
	lrb_measured = p_lrb_measured,
	flag_correct_abs = p_flag_correct_abs,
	flag_correct_std = p_flag_correct_std,
	flag_correct_mri = p_flag_correct_mri,
	flag_correct_lrb = p_flag_correct_lrb,
	user_close_tray = p_user_close_tray,
	date_close_tray = p_date_close_tray,
	user_approve_tray = p_user_approve_tray,
	date_approve_tray = p_date_approve_tray,
	user_review_tray = p_user_review_tray,
	date_review_tray = p_date_review_tray
 WHERE 
	idbatch = p_idbatch;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_batch_SelectByPrimaryKey
(
	p_idbatch int8
) returns TABLE ("Idbatch" int8, "Name_batch" varchar, "Num_tray" int8, "Idtemplate_method" int4, "Cod_module" varchar, "Cod_process" varchar, "Cod_area" varchar, "Status_process" bpchar, "Status" bool, "Mri_value" numeric, "Description" varchar, "Date_creation_tray" timestamp, "User_creation_tray" varchar, "Has_sample_control" bool, "Absorvance" numeric, "Std_verification" numeric, "Flag_abs_std" bool, "Mri_measured" numeric, "Lrb_measured" numeric, "Flag_correct_abs" bool, "Flag_correct_std" bool, "Flag_correct_mri" bool, "Flag_correct_lrb" bool, "User_close_tray" varchar, "Date_close_tray" timestamp, "User_approve_tray" varchar, "Date_approve_tray" timestamp, "User_review_tray" varchar, "Date_review_tray" timestamp
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.batch
	WHERE 
			idbatch = p_idbatch;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_batch_SelectAll()
 returns TABLE ("Idbatch" int8, "Name_batch" varchar, "Num_tray" int8, "Idtemplate_method" int4, "Cod_module" varchar, "Cod_process" varchar, "Cod_area" varchar, "Status_process" bpchar, "Status" bool, "Mri_value" numeric, "Description" varchar, "Date_creation_tray" timestamp, "User_creation_tray" varchar, "Has_sample_control" bool, "Absorvance" numeric, "Std_verification" numeric, "Flag_abs_std" bool, "Mri_measured" numeric, "Lrb_measured" numeric, "Flag_correct_abs" bool, "Flag_correct_std" bool, "Flag_correct_mri" bool, "Flag_correct_lrb" bool, "User_close_tray" varchar, "Date_close_tray" timestamp, "User_approve_tray" varchar, "Date_approve_tray" timestamp, "User_review_tray" varchar, "Date_review_tray" timestamp
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.batch;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_batch_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idbatch int8, name_batch varchar, num_tray int8, idtemplate_method int4, cod_module varchar, cod_process varchar, cod_area varchar, status_process bpchar, status bool, mri_value numeric, description varchar, date_creation_tray timestamp, user_creation_tray varchar, has_sample_control bool, absorvance numeric, std_verification numeric, flag_abs_std bool, mri_measured numeric, lrb_measured numeric, flag_correct_abs bool, flag_correct_std bool, flag_correct_mri bool, flag_correct_lrb bool, user_close_tray varchar, date_close_tray timestamp, user_approve_tray varchar, date_approve_tray timestamp, user_review_tray varchar, date_review_tray timestamp
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.batch WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_batch_DeleteByPrimaryKey
(
	p_idbatch int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.batch
 WHERE 
	idbatch = p_idbatch; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_batch_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.batch WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_Insert(int4,varchar,varchar,varchar,varchar,varchar,varchar,bool,varchar);
CREATE OR REPLACE FUNCTION public.sp_decree_Insert
(
	p_iddecree int4 ,
	p_cod_decree varchar(20) = null ,
	p_name_decree varchar(50) = null ,
	p_description varchar(500) = null ,
	p_cumple varchar(20) = null ,
	p_nocumple varchar(20) = null ,
	p_cumple_onlytest varchar(20) = null ,
	p_status bool = null ,
	p_conclusion varchar(500) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.decree
(
	cod_decree,
	name_decree,
	description,
	cumple,
	nocumple,
	cumple_onlytest,
	status,
	conclusion

)
VALUES
(
	p_cod_decree,
	p_name_decree,
	p_description,
	p_cumple,
	p_nocumple,
	p_cumple_onlytest,
	p_status,
	p_conclusion

)returning iddecree into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_Update(int4,varchar,varchar,varchar,varchar,varchar,varchar,bool,varchar);
CREATE OR REPLACE FUNCTION public.sp_decree_Update
(
	p_iddecree int4,
	p_cod_decree varchar(20) = null,
	p_name_decree varchar(50) = null,
	p_description varchar(500) = null,
	p_cumple varchar(20) = null,
	p_nocumple varchar(20) = null,
	p_cumple_onlytest varchar(20) = null,
	p_status bool = null,
	p_conclusion varchar(500) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.decree
SET
	cod_decree = p_cod_decree,
	name_decree = p_name_decree,
	description = p_description,
	cumple = p_cumple,
	nocumple = p_nocumple,
	cumple_onlytest = p_cumple_onlytest,
	status = p_status,
	conclusion = p_conclusion
 WHERE 
	iddecree = p_iddecree;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_decree_SelectByPrimaryKey
(
	p_iddecree int4
) returns TABLE ("Iddecree" int4, "Cod_decree" varchar, "Name_decree" varchar, "Description" varchar, "Cumple" varchar, "Nocumple" varchar, "Cumple_onlytest" varchar, "Status" bool, "Conclusion" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.decree
	WHERE 
			iddecree = p_iddecree;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_decree_SelectAll()
 returns TABLE ("Iddecree" int4, "Cod_decree" varchar, "Name_decree" varchar, "Description" varchar, "Cumple" varchar, "Nocumple" varchar, "Cumple_onlytest" varchar, "Status" bool, "Conclusion" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.decree;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_decree_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (iddecree int4, cod_decree varchar, name_decree varchar, description varchar, cumple varchar, nocumple varchar, cumple_onlytest varchar, status bool, conclusion varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.decree WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_decree_DeleteByPrimaryKey
(
	p_iddecree int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.decree
 WHERE 
	iddecree = p_iddecree; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_decree_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.decree WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_detail_Insert(int4,int4,int4,int4,varchar,int4,varchar,varchar,bool);
CREATE OR REPLACE FUNCTION public.sp_decree_detail_Insert
(
	p_iddecree_detail int4 ,
	p_iddecree int4 = null ,
	p_idunit int4 = null ,
	p_idtemplate_method int4 = null ,
	p_parameter varchar(50) = null ,
	p_idcondition int4 = null ,
	p_valor1 varchar(50) = null ,
	p_valor2 varchar(50) = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.decree_detail
(
	iddecree,
	idunit,
	idtemplate_method,
	parameter,
	idcondition,
	valor1,
	valor2,
	status

)
VALUES
(
	p_iddecree,
	p_idunit,
	p_idtemplate_method,
	p_parameter,
	p_idcondition,
	p_valor1,
	p_valor2,
	p_status

)returning iddecree_detail into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_detail_Update(int4,int4,int4,int4,varchar,int4,varchar,varchar,bool);
CREATE OR REPLACE FUNCTION public.sp_decree_detail_Update
(
	p_iddecree_detail int4,
	p_iddecree int4 = null,
	p_idunit int4 = null,
	p_idtemplate_method int4 = null,
	p_parameter varchar(50) = null,
	p_idcondition int4 = null,
	p_valor1 varchar(50) = null,
	p_valor2 varchar(50) = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.decree_detail
SET
	iddecree = p_iddecree,
	idunit = p_idunit,
	idtemplate_method = p_idtemplate_method,
	parameter = p_parameter,
	idcondition = p_idcondition,
	valor1 = p_valor1,
	valor2 = p_valor2,
	status = p_status
 WHERE 
	iddecree_detail = p_iddecree_detail;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_detail_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_decree_detail_SelectByPrimaryKey
(
	p_iddecree_detail int4
) returns TABLE ("Iddecree_detail" int4, "Iddecree" int4, "Idunit" int4, "Idtemplate_method" int4, "Parameter" varchar, "Idcondition" int4, "Valor1" varchar, "Valor2" varchar, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.decree_detail
	WHERE 
			iddecree_detail = p_iddecree_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_detail_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_decree_detail_SelectAll()
 returns TABLE ("Iddecree_detail" int4, "Iddecree" int4, "Idunit" int4, "Idtemplate_method" int4, "Parameter" varchar, "Idcondition" int4, "Valor1" varchar, "Valor2" varchar, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.decree_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_detail_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_decree_detail_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (iddecree_detail int4, iddecree int4, idunit int4, idtemplate_method int4, parameter varchar, idcondition int4, valor1 varchar, valor2 varchar, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.decree_detail WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_detail_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_decree_detail_DeleteByPrimaryKey
(
	p_iddecree_detail int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.decree_detail
 WHERE 
	iddecree_detail = p_iddecree_detail; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_decree_detail_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_decree_detail_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.decree_detail WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_report_Insert(int8,int2,int8,int2,int2,int8,bool,bool,bool,date,timestamp,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_report_Insert
(
	p_idrecep_sample_report int8 ,
	p_order_report int2 = null ,
	p_cod_recep_sample_report int8 = null ,
	p_report_status int2 = null ,
	p_type_report int2 = null ,
	p_idrecep_sample int8 = null ,
	p_flag_rpt_email bool = null ,
	p_flag_rpt_print bool = null ,
	p_flag_rpt_pdf bool = null ,
	p_date_report date = null ,
	p_time_report timestamp = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.recep_sample_report
(
	order_report,
	cod_recep_sample_report,
	report_status,
	type_report,
	idrecep_sample,
	flag_rpt_email,
	flag_rpt_print,
	flag_rpt_pdf,
	date_report,
	time_report,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_order_report,
	p_cod_recep_sample_report,
	p_report_status,
	p_type_report,
	p_idrecep_sample,
	p_flag_rpt_email,
	p_flag_rpt_print,
	p_flag_rpt_pdf,
	p_date_report,
	p_time_report,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idrecep_sample_report into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_report_Update(int8,int2,int8,int2,int2,int8,bool,bool,bool,date,timestamp,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_report_Update
(
	p_idrecep_sample_report int8,
	p_order_report int2 = null,
	p_cod_recep_sample_report int8 = null,
	p_report_status int2 = null,
	p_type_report int2 = null,
	p_idrecep_sample int8 = null,
	p_flag_rpt_email bool = null,
	p_flag_rpt_print bool = null,
	p_flag_rpt_pdf bool = null,
	p_date_report date = null,
	p_time_report timestamp = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.recep_sample_report
SET
	order_report = p_order_report,
	cod_recep_sample_report = p_cod_recep_sample_report,
	report_status = p_report_status,
	type_report = p_type_report,
	idrecep_sample = p_idrecep_sample,
	flag_rpt_email = p_flag_rpt_email,
	flag_rpt_print = p_flag_rpt_print,
	flag_rpt_pdf = p_flag_rpt_pdf,
	date_report = p_date_report,
	time_report = p_time_report,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idrecep_sample_report = p_idrecep_sample_report;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_report_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_report_SelectByPrimaryKey
(
	p_idrecep_sample_report int8
) returns TABLE ("Idrecep_sample_report" int8, "Order_report" int2, "Cod_recep_sample_report" int8, "Report_status" int2, "Type_report" int2, "Idrecep_sample" int8, "Flag_rpt_email" bool, "Flag_rpt_print" bool, "Flag_rpt_pdf" bool, "Date_report" date, "Time_report" timestamp, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_report
	WHERE 
			idrecep_sample_report = p_idrecep_sample_report;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_report_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_recep_sample_report_SelectAll()
 returns TABLE ("Idrecep_sample_report" int8, "Order_report" int2, "Cod_recep_sample_report" int8, "Report_status" int2, "Type_report" int2, "Idrecep_sample" int8, "Flag_rpt_email" bool, "Flag_rpt_print" bool, "Flag_rpt_pdf" bool, "Date_report" date, "Time_report" timestamp, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_report;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_report_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_report_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_sample_report int8, order_report int2, cod_recep_sample_report int8, report_status int2, type_report int2, idrecep_sample int8, flag_rpt_email bool, flag_rpt_print bool, flag_rpt_pdf bool, date_report date, time_report timestamp, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.recep_sample_report WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_report_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_report_DeleteByPrimaryKey
(
	p_idrecep_sample_report int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.recep_sample_report
 WHERE 
	idrecep_sample_report = p_idrecep_sample_report; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_report_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_report_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.recep_sample_report WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_company_person_Insert(int8,int2,int2,int8,int2,bool,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_company_person_Insert
(
	p_idrecep_company_person int8 ,
	p_idcompany int2 = null ,
	p_idperson int2 = null ,
	p_idrecep_sample int8 = null ,
	p_person_type int2 = null ,
	p_enabled_show bool = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.recep_company_person
(
	idcompany,
	idperson,
	idrecep_sample,
	person_type,
	enabled_show,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idcompany,
	p_idperson,
	p_idrecep_sample,
	p_person_type,
	p_enabled_show,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idrecep_company_person into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_company_person_Update(int8,int2,int2,int8,int2,bool,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_company_person_Update
(
	p_idrecep_company_person int8,
	p_idcompany int2 = null,
	p_idperson int2 = null,
	p_idrecep_sample int8 = null,
	p_person_type int2 = null,
	p_enabled_show bool = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.recep_company_person
SET
	idcompany = p_idcompany,
	idperson = p_idperson,
	idrecep_sample = p_idrecep_sample,
	person_type = p_person_type,
	enabled_show = p_enabled_show,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idrecep_company_person = p_idrecep_company_person;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_company_person_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_company_person_SelectByPrimaryKey
(
	p_idrecep_company_person int8
) returns TABLE ("Idrecep_company_person" int8, "Idcompany" int2, "Idperson" int2, "Idrecep_sample" int8, "Person_type" int2, "Enabled_show" bool, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_company_person
	WHERE 
			idrecep_company_person = p_idrecep_company_person;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_company_person_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_recep_company_person_SelectAll()
 returns TABLE ("Idrecep_company_person" int8, "Idcompany" int2, "Idperson" int2, "Idrecep_sample" int8, "Person_type" int2, "Enabled_show" bool, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_company_person;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_company_person_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_company_person_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_company_person int8, idcompany int2, idperson int2, idrecep_sample int8, person_type int2, enabled_show bool, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.recep_company_person WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_company_person_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_company_person_DeleteByPrimaryKey
(
	p_idrecep_company_person int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.recep_company_person
 WHERE 
	idrecep_company_person = p_idrecep_company_person; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_company_person_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_company_person_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.recep_company_person WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_retest_Insert(int8,int8,int8,int8,int8,bpchar,date,varchar,date,varchar,date,bool,int2);
CREATE OR REPLACE FUNCTION public.sp_retest_Insert
(
	p_idretest int8 ,
	p_idrecep_sample_detail_elem int8 = null ,
	p_idrecep_sample_detail int8 = null ,
	p_origin_batch int8 = null ,
	p_destiny_batch int8 = null ,
	p_type_retest bpchar = null ,
	p_date_retest date = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit1 varchar(20) = null ,
	p_dateedit1 date = null ,
	p_status bool = null ,
	p_status_retest int2 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.retest
(
	idrecep_sample_detail_elem,
	idrecep_sample_detail,
	origin_batch,
	destiny_batch,
	type_retest,
	date_retest,
	usernew,
	datenew,
	useredit1,
	dateedit1,
	status,
	status_retest

)
VALUES
(
	p_idrecep_sample_detail_elem,
	p_idrecep_sample_detail,
	p_origin_batch,
	p_destiny_batch,
	p_type_retest,
	p_date_retest,
	p_usernew,
	p_datenew,
	p_useredit1,
	p_dateedit1,
	p_status,
	p_status_retest

)returning idretest into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_retest_Update(int8,int8,int8,int8,int8,bpchar,date,varchar,date,varchar,date,bool,int2);
CREATE OR REPLACE FUNCTION public.sp_retest_Update
(
	p_idretest int8,
	p_idrecep_sample_detail_elem int8 = null,
	p_idrecep_sample_detail int8 = null,
	p_origin_batch int8 = null,
	p_destiny_batch int8 = null,
	p_type_retest bpchar = null,
	p_date_retest date = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit1 varchar(20) = null,
	p_dateedit1 date = null,
	p_status bool = null,
	p_status_retest int2 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.retest
SET
	idrecep_sample_detail_elem = p_idrecep_sample_detail_elem,
	idrecep_sample_detail = p_idrecep_sample_detail,
	origin_batch = p_origin_batch,
	destiny_batch = p_destiny_batch,
	type_retest = p_type_retest,
	date_retest = p_date_retest,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit1 = p_useredit1,
	dateedit1 = p_dateedit1,
	status = p_status,
	status_retest = p_status_retest
 WHERE 
	idretest = p_idretest;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_retest_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_retest_SelectByPrimaryKey
(
	p_idretest int8
) returns TABLE ("Idretest" int8, "Idrecep_sample_detail_elem" int8, "Idrecep_sample_detail" int8, "Origin_batch" int8, "Destiny_batch" int8, "Type_retest" bpchar, "Date_retest" date, "Usernew" varchar, "Datenew" date, "Useredit1" varchar, "Dateedit1" date, "Status" bool, "Status_retest" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.retest
	WHERE 
			idretest = p_idretest;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_retest_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_retest_SelectAll()
 returns TABLE ("Idretest" int8, "Idrecep_sample_detail_elem" int8, "Idrecep_sample_detail" int8, "Origin_batch" int8, "Destiny_batch" int8, "Type_retest" bpchar, "Date_retest" date, "Usernew" varchar, "Datenew" date, "Useredit1" varchar, "Dateedit1" date, "Status" bool, "Status_retest" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.retest;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_retest_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_retest_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idretest int8, idrecep_sample_detail_elem int8, idrecep_sample_detail int8, origin_batch int8, destiny_batch int8, type_retest bpchar, date_retest date, usernew varchar, datenew date, useredit1 varchar, dateedit1 date, status bool, status_retest int2
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.retest WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_retest_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_retest_DeleteByPrimaryKey
(
	p_idretest int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.retest
 WHERE 
	idretest = p_idretest; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_retest_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_retest_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.retest WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_person_Insert(int2,varchar,int2,varchar,varchar,varchar,varchar,bpchar,varchar,varchar,varchar,varchar,varchar,date,varchar,date,bool,int4);
CREATE OR REPLACE FUNCTION public.sp_person_Insert
(
	p_idperson int2 ,
	p_cod_person varchar(15) = null ,
	p_type_document int2 = null ,
	p_last_name1 varchar(50) = null ,
	p_last_name2 varchar(50) = null ,
	p_names_person varchar(100) = null ,
	p_allname varchar(200) = null ,
	p_gender bpchar = null ,
	p_domicile varchar(20) = null ,
	p_mail varchar(50) = null ,
	p_phone varchar(15) = null ,
	p_cellphone varchar(15) = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null ,
	p_person_type int4 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.person
(
	cod_person,
	type_document,
	last_name1,
	last_name2,
	names_person,
	allname,
	gender,
	domicile,
	mail,
	phone,
	cellphone,
	usernew,
	datenew,
	useredit,
	dateedit,
	status,
	person_type

)
VALUES
(
	p_cod_person,
	p_type_document,
	p_last_name1,
	p_last_name2,
	p_names_person,
	p_allname,
	p_gender,
	p_domicile,
	p_mail,
	p_phone,
	p_cellphone,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status,
	p_person_type

)returning idperson into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_person_Update(int2,varchar,int2,varchar,varchar,varchar,varchar,bpchar,varchar,varchar,varchar,varchar,varchar,date,varchar,date,bool,int4);
CREATE OR REPLACE FUNCTION public.sp_person_Update
(
	p_idperson int2,
	p_cod_person varchar(15) = null,
	p_type_document int2 = null,
	p_last_name1 varchar(50) = null,
	p_last_name2 varchar(50) = null,
	p_names_person varchar(100) = null,
	p_allname varchar(200) = null,
	p_gender bpchar = null,
	p_domicile varchar(20) = null,
	p_mail varchar(50) = null,
	p_phone varchar(15) = null,
	p_cellphone varchar(15) = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null,
	p_person_type int4 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.person
SET
	cod_person = p_cod_person,
	type_document = p_type_document,
	last_name1 = p_last_name1,
	last_name2 = p_last_name2,
	names_person = p_names_person,
	allname = p_allname,
	gender = p_gender,
	domicile = p_domicile,
	mail = p_mail,
	phone = p_phone,
	cellphone = p_cellphone,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status,
	person_type = p_person_type
 WHERE 
	idperson = p_idperson;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_person_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_person_SelectByPrimaryKey
(
	p_idperson int2
) returns TABLE ("Idperson" int2, "Cod_person" varchar, "Type_document" int2, "Last_name1" varchar, "Last_name2" varchar, "Names_person" varchar, "Allname" varchar, "Gender" bpchar, "Domicile" varchar, "Mail" varchar, "Phone" varchar, "Cellphone" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Person_type" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.person
	WHERE 
			idperson = p_idperson;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_person_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_person_SelectAll()
 returns TABLE ("Idperson" int2, "Cod_person" varchar, "Type_document" int2, "Last_name1" varchar, "Last_name2" varchar, "Names_person" varchar, "Allname" varchar, "Gender" bpchar, "Domicile" varchar, "Mail" varchar, "Phone" varchar, "Cellphone" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Person_type" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.person;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_person_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_person_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idperson int2, cod_person varchar, type_document int2, last_name1 varchar, last_name2 varchar, names_person varchar, allname varchar, gender bpchar, domicile varchar, mail varchar, phone varchar, cellphone varchar, usernew varchar, datenew date, useredit varchar, dateedit date, status bool, person_type int4
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.person WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_person_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_person_DeleteByPrimaryKey
(
	p_idperson int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.person
 WHERE 
	idperson = p_idperson; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_person_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_person_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.person WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_Insert(int2,varchar,varchar,varchar,bpchar,varchar,varchar,varchar,int2,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_company_Insert
(
	p_idcompany int2 ,
	p_cod_company varchar(20) = null ,
	p_ruc varchar(20) = null ,
	p_business_name varchar(30) = null ,
	p_type_company bpchar = null ,
	p_domicile varchar(200) = null ,
	p_mail varchar(50) = null ,
	p_phone_client varchar(15) = null ,
	p_idcontact1 int2 = null ,
	p_idcontact2 int2 = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.company
(
	cod_company,
	ruc,
	business_name,
	type_company,
	domicile,
	mail,
	phone_client,
	idcontact1,
	idcontact2,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_cod_company,
	p_ruc,
	p_business_name,
	p_type_company,
	p_domicile,
	p_mail,
	p_phone_client,
	p_idcontact1,
	p_idcontact2,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idcompany into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_Update(int2,varchar,varchar,varchar,bpchar,varchar,varchar,varchar,int2,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_company_Update
(
	p_idcompany int2,
	p_cod_company varchar(20) = null,
	p_ruc varchar(20) = null,
	p_business_name varchar(30) = null,
	p_type_company bpchar = null,
	p_domicile varchar(200) = null,
	p_mail varchar(50) = null,
	p_phone_client varchar(15) = null,
	p_idcontact1 int2 = null,
	p_idcontact2 int2 = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.company
SET
	cod_company = p_cod_company,
	ruc = p_ruc,
	business_name = p_business_name,
	type_company = p_type_company,
	domicile = p_domicile,
	mail = p_mail,
	phone_client = p_phone_client,
	idcontact1 = p_idcontact1,
	idcontact2 = p_idcontact2,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idcompany = p_idcompany;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_company_SelectByPrimaryKey
(
	p_idcompany int2
) returns TABLE ("Idcompany" int2, "Cod_company" varchar, "Ruc" varchar, "Business_name" varchar, "Type_company" bpchar, "Domicile" varchar, "Mail" varchar, "Phone_client" varchar, "Idcontact1" int2, "Idcontact2" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.company
	WHERE 
			idcompany = p_idcompany;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_company_SelectAll()
 returns TABLE ("Idcompany" int2, "Cod_company" varchar, "Ruc" varchar, "Business_name" varchar, "Type_company" bpchar, "Domicile" varchar, "Mail" varchar, "Phone_client" varchar, "Idcontact1" int2, "Idcontact2" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.company;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_company_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcompany int2, cod_company varchar, ruc varchar, business_name varchar, type_company bpchar, domicile varchar, mail varchar, phone_client varchar, idcontact1 int2, idcontact2 int2, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.company WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_company_DeleteByPrimaryKey
(
	p_idcompany int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.company
 WHERE 
	idcompany = p_idcompany; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_company_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.company WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_condition_variable_Insert(int4,varchar,varchar,varchar,varchar,int4,int4,varchar,bool,int4,int8);
CREATE OR REPLACE FUNCTION public.sp_condition_variable_Insert
(
	p_idcondition_variable int4 ,
	p_name_variable varchar(30) = null ,
	p_operation varchar(10) = null ,
	p_name_value1 varchar(40) = null ,
	p_name_value2 varchar(40) = null ,
	p_idvalue1 int4 = null ,
	p_idvalue2 int4 = null ,
	p_message varchar(100) = null ,
	p_status bool = null ,
	p_idtemplate_method int4 = null ,
	p_idtemplate_method_detail int8 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.condition_variable
(
	name_variable,
	operation,
	name_value1,
	name_value2,
	idvalue1,
	idvalue2,
	message,
	status,
	idtemplate_method,
	idtemplate_method_detail

)
VALUES
(
	p_name_variable,
	p_operation,
	p_name_value1,
	p_name_value2,
	p_idvalue1,
	p_idvalue2,
	p_message,
	p_status,
	p_idtemplate_method,
	p_idtemplate_method_detail

)returning idcondition_variable into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_condition_variable_Update(int4,varchar,varchar,varchar,varchar,int4,int4,varchar,bool,int4,int8);
CREATE OR REPLACE FUNCTION public.sp_condition_variable_Update
(
	p_idcondition_variable int4,
	p_name_variable varchar(30) = null,
	p_operation varchar(10) = null,
	p_name_value1 varchar(40) = null,
	p_name_value2 varchar(40) = null,
	p_idvalue1 int4 = null,
	p_idvalue2 int4 = null,
	p_message varchar(100) = null,
	p_status bool = null,
	p_idtemplate_method int4 = null,
	p_idtemplate_method_detail int8 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.condition_variable
SET
	name_variable = p_name_variable,
	operation = p_operation,
	name_value1 = p_name_value1,
	name_value2 = p_name_value2,
	idvalue1 = p_idvalue1,
	idvalue2 = p_idvalue2,
	message = p_message,
	status = p_status,
	idtemplate_method = p_idtemplate_method,
	idtemplate_method_detail = p_idtemplate_method_detail
 WHERE 
	idcondition_variable = p_idcondition_variable;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_condition_variable_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_condition_variable_SelectByPrimaryKey
(
	p_idcondition_variable int4
) returns TABLE ("Idcondition_variable" int4, "Name_variable" varchar, "Operation" varchar, "Name_value1" varchar, "Name_value2" varchar, "Idvalue1" int4, "Idvalue2" int4, "Message" varchar, "Status" bool, "Idtemplate_method" int4, "Idtemplate_method_detail" int8
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.condition_variable
	WHERE 
			idcondition_variable = p_idcondition_variable;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_condition_variable_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_condition_variable_SelectAll()
 returns TABLE ("Idcondition_variable" int4, "Name_variable" varchar, "Operation" varchar, "Name_value1" varchar, "Name_value2" varchar, "Idvalue1" int4, "Idvalue2" int4, "Message" varchar, "Status" bool, "Idtemplate_method" int4, "Idtemplate_method_detail" int8
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.condition_variable;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_condition_variable_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_condition_variable_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcondition_variable int4, name_variable varchar, operation varchar, name_value1 varchar, name_value2 varchar, idvalue1 int4, idvalue2 int4, message varchar, status bool, idtemplate_method int4, idtemplate_method_detail int8
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.condition_variable WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_condition_variable_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_condition_variable_DeleteByPrimaryKey
(
	p_idcondition_variable int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.condition_variable
 WHERE 
	idcondition_variable = p_idcondition_variable; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_condition_variable_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_condition_variable_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.condition_variable WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_convert_unit_measurement_Insert(int2,varchar,varchar,int2,int2,numeric,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_convert_unit_measurement_Insert
(
	p_idconvert int2 ,
	p_den_unit1 varchar(6) = null ,
	p_den_unit2 varchar(6) = null ,
	p_idunit1 int2 = null ,
	p_idunit2 int2 = null ,
	p_factor numeric = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.convert_unit_measurement
(
	den_unit1,
	den_unit2,
	idunit1,
	idunit2,
	factor,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_den_unit1,
	p_den_unit2,
	p_idunit1,
	p_idunit2,
	p_factor,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idconvert into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_convert_unit_measurement_Update(int2,varchar,varchar,int2,int2,numeric,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_convert_unit_measurement_Update
(
	p_idconvert int2,
	p_den_unit1 varchar(6) = null,
	p_den_unit2 varchar(6) = null,
	p_idunit1 int2 = null,
	p_idunit2 int2 = null,
	p_factor numeric = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.convert_unit_measurement
SET
	den_unit1 = p_den_unit1,
	den_unit2 = p_den_unit2,
	idunit1 = p_idunit1,
	idunit2 = p_idunit2,
	factor = p_factor,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idconvert = p_idconvert;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_convert_unit_measurement_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_convert_unit_measurement_SelectByPrimaryKey
(
	p_idconvert int2
) returns TABLE ("Idconvert" int2, "Den_unit1" varchar, "Den_unit2" varchar, "Idunit1" int2, "Idunit2" int2, "Factor" numeric, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.convert_unit_measurement
	WHERE 
			idconvert = p_idconvert;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_convert_unit_measurement_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_convert_unit_measurement_SelectAll()
 returns TABLE ("Idconvert" int2, "Den_unit1" varchar, "Den_unit2" varchar, "Idunit1" int2, "Idunit2" int2, "Factor" numeric, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.convert_unit_measurement;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_convert_unit_measurement_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_convert_unit_measurement_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idconvert int2, den_unit1 varchar, den_unit2 varchar, idunit1 int2, idunit2 int2, factor numeric, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.convert_unit_measurement WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_convert_unit_measurement_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_convert_unit_measurement_DeleteByPrimaryKey
(
	p_idconvert int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.convert_unit_measurement
 WHERE 
	idconvert = p_idconvert; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_convert_unit_measurement_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_convert_unit_measurement_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.convert_unit_measurement WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_Insert(int2,varchar,varchar,varchar,varchar,bpchar,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_element_Insert
(
	p_idelement int2 ,
	p_cod_element varchar(10) = null ,
	p_name_element varchar(50) = null ,
	p_description varchar(200) = null ,
	p_native_element varchar(5) = null ,
	p_type_element bpchar = null ,
	p_usernew varchar(50) = null ,
	p_datenew date = null ,
	p_useredit varchar(50) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.element
(
	cod_element,
	name_element,
	description,
	native_element,
	type_element,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_cod_element,
	p_name_element,
	p_description,
	p_native_element,
	p_type_element,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idelement into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_Update(int2,varchar,varchar,varchar,varchar,bpchar,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_element_Update
(
	p_idelement int2,
	p_cod_element varchar(10) = null,
	p_name_element varchar(50) = null,
	p_description varchar(200) = null,
	p_native_element varchar(5) = null,
	p_type_element bpchar = null,
	p_usernew varchar(50) = null,
	p_datenew date = null,
	p_useredit varchar(50) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.element
SET
	cod_element = p_cod_element,
	name_element = p_name_element,
	description = p_description,
	native_element = p_native_element,
	type_element = p_type_element,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idelement = p_idelement;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_element_SelectByPrimaryKey
(
	p_idelement int2
) returns TABLE ("Idelement" int2, "Cod_element" varchar, "Name_element" varchar, "Description" varchar, "Native_element" varchar, "Type_element" bpchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.element
	WHERE 
			idelement = p_idelement;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_element_SelectAll()
 returns TABLE ("Idelement" int2, "Cod_element" varchar, "Name_element" varchar, "Description" varchar, "Native_element" varchar, "Type_element" bpchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.element;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_element_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idelement int2, cod_element varchar, name_element varchar, description varchar, native_element varchar, type_element bpchar, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.element WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_element_DeleteByPrimaryKey
(
	p_idelement int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.element
 WHERE 
	idelement = p_idelement; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_element_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.element WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_folder_Insert(int2,varchar,varchar,varchar,bpchar,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_configuration_folder_Insert
(
	p_idconfiguration_folder int2 ,
	p_folder_name varchar(100) ,
	p_description varchar(500) ,
	p_path varchar(500) ,
	p_folder_type bpchar ,
	p_usernew varchar(20) ,
	p_datenew timestamp ,
	p_useredit varchar(20) ,
	p_dateedit timestamp ,
	p_status bool 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.configuration_folder
(
	folder_name,
	description,
	path,
	folder_type,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_folder_name,
	p_description,
	p_path,
	p_folder_type,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idconfiguration_folder into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_folder_Update(int2,varchar,varchar,varchar,bpchar,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_configuration_folder_Update
(
	p_idconfiguration_folder int2,
	p_folder_name varchar(100),
	p_description varchar(500),
	p_path varchar(500),
	p_folder_type bpchar,
	p_usernew varchar(20),
	p_datenew timestamp,
	p_useredit varchar(20),
	p_dateedit timestamp,
	p_status bool

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.configuration_folder
SET
	folder_name = p_folder_name,
	description = p_description,
	path = p_path,
	folder_type = p_folder_type,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idconfiguration_folder = p_idconfiguration_folder;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_folder_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_configuration_folder_SelectByPrimaryKey
(
	p_idconfiguration_folder int2
) returns TABLE ("Idconfiguration_folder" int2, "Folder_name" varchar, "Description" varchar, "Path" varchar, "Folder_type" bpchar, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.configuration_folder
	WHERE 
			idconfiguration_folder = p_idconfiguration_folder;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_folder_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_configuration_folder_SelectAll()
 returns TABLE ("Idconfiguration_folder" int2, "Folder_name" varchar, "Description" varchar, "Path" varchar, "Folder_type" bpchar, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.configuration_folder;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_folder_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_configuration_folder_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idconfiguration_folder int2, folder_name varchar, description varchar, path varchar, folder_type bpchar, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.configuration_folder WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_folder_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_configuration_folder_DeleteByPrimaryKey
(
	p_idconfiguration_folder int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.configuration_folder
 WHERE 
	idconfiguration_folder = p_idconfiguration_folder; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_folder_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_configuration_folder_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.configuration_folder WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_company_person_Insert(int4,int2,int2,int4,int4,int2);
CREATE OR REPLACE FUNCTION public.sp_price_company_person_Insert
(
	p_idprice_company_person int4 ,
	p_idcompany int2 = null ,
	p_idperson int2 = null ,
	p_idprice int4 = null ,
	p_idprice_version int4 = null ,
	p_person_type int2 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.price_company_person
(
	idcompany,
	idperson,
	idprice,
	idprice_version,
	person_type

)
VALUES
(
	p_idcompany,
	p_idperson,
	p_idprice,
	p_idprice_version,
	p_person_type

)returning idprice_company_person into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_company_person_Update(int4,int2,int2,int4,int4,int2);
CREATE OR REPLACE FUNCTION public.sp_price_company_person_Update
(
	p_idprice_company_person int4,
	p_idcompany int2 = null,
	p_idperson int2 = null,
	p_idprice int4 = null,
	p_idprice_version int4 = null,
	p_person_type int2 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.price_company_person
SET
	idcompany = p_idcompany,
	idperson = p_idperson,
	idprice = p_idprice,
	idprice_version = p_idprice_version,
	person_type = p_person_type
 WHERE 
	idprice_company_person = p_idprice_company_person;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_company_person_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_price_company_person_SelectByPrimaryKey
(
	p_idprice_company_person int4
) returns TABLE ("Idprice_company_person" int4, "Idcompany" int2, "Idperson" int2, "Idprice" int4, "Idprice_version" int4, "Person_type" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.price_company_person
	WHERE 
			idprice_company_person = p_idprice_company_person;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_company_person_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_price_company_person_SelectAll()
 returns TABLE ("Idprice_company_person" int4, "Idcompany" int2, "Idperson" int2, "Idprice" int4, "Idprice_version" int4, "Person_type" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.price_company_person;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_company_person_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_company_person_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idprice_company_person int4, idcompany int2, idperson int2, idprice int4, idprice_version int4, person_type int2
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.price_company_person WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_company_person_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_price_company_person_DeleteByPrimaryKey
(
	p_idprice_company_person int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.price_company_person
 WHERE 
	idprice_company_person = p_idprice_company_person; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_company_person_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_company_person_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.price_company_person WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_document_attach_Insert(int4,varchar,int4,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_document_attach_Insert
(
	p_idrecep_document_attach int4 ,
	p_name_file varchar(15) = null ,
	p_order_file int4 = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.recep_document_attach
(
	name_file,
	order_file,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_name_file,
	p_order_file,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idrecep_document_attach into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_document_attach_Update(int4,varchar,int4,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_document_attach_Update
(
	p_idrecep_document_attach int4,
	p_name_file varchar(15) = null,
	p_order_file int4 = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.recep_document_attach
SET
	name_file = p_name_file,
	order_file = p_order_file,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idrecep_document_attach = p_idrecep_document_attach;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_document_attach_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_recep_document_attach_SelectByPrimaryKey
(
	p_idrecep_document_attach int4
) returns TABLE ("Idrecep_document_attach" int4, "Name_file" varchar, "Order_file" int4, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_document_attach
	WHERE 
			idrecep_document_attach = p_idrecep_document_attach;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_document_attach_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_recep_document_attach_SelectAll()
 returns TABLE ("Idrecep_document_attach" int4, "Name_file" varchar, "Order_file" int4, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_document_attach;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_document_attach_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_document_attach_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_document_attach int4, name_file varchar, order_file int4, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.recep_document_attach WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_document_attach_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_recep_document_attach_DeleteByPrimaryKey
(
	p_idrecep_document_attach int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.recep_document_attach
 WHERE 
	idrecep_document_attach = p_idrecep_document_attach; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_document_attach_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_document_attach_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.recep_document_attach WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icp_lecturas_Insert(int4,int4,varchar,int4,varchar,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_icp_lecturas_Insert
(
	p_id int4 ,
	p_calibracion int4 = null ,
	p_elemento varchar(10) = null ,
	p_idmuestra int4 = null ,
	p_muestra varchar(15) = null ,
	p_lectura varchar(15) = null ,
	p_dilucion2 varchar(15) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.icp_lecturas
(
	calibracion,
	elemento,
	idmuestra,
	muestra,
	lectura,
	dilucion2

)
VALUES
(
	p_calibracion,
	p_elemento,
	p_idmuestra,
	p_muestra,
	p_lectura,
	p_dilucion2

)returning id into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icp_lecturas_Update(int4,int4,varchar,int4,varchar,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_icp_lecturas_Update
(
	p_id int4,
	p_calibracion int4 = null,
	p_elemento varchar(10) = null,
	p_idmuestra int4 = null,
	p_muestra varchar(15) = null,
	p_lectura varchar(15) = null,
	p_dilucion2 varchar(15) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.icp_lecturas
SET
	calibracion = p_calibracion,
	elemento = p_elemento,
	idmuestra = p_idmuestra,
	muestra = p_muestra,
	lectura = p_lectura,
	dilucion2 = p_dilucion2
 WHERE 
	id = p_id;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icp_lecturas_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_icp_lecturas_SelectByPrimaryKey
(
	p_id int4
) returns TABLE ("Id" int4, "Calibracion" int4, "Elemento" varchar, "Idmuestra" int4, "Muestra" varchar, "Lectura" varchar, "Dilucion2" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.icp_lecturas
	WHERE 
			id = p_id;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icp_lecturas_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_icp_lecturas_SelectAll()
 returns TABLE ("Id" int4, "Calibracion" int4, "Elemento" varchar, "Idmuestra" int4, "Muestra" varchar, "Lectura" varchar, "Dilucion2" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.icp_lecturas;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icp_lecturas_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_icp_lecturas_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (id int4, calibracion int4, elemento varchar, idmuestra int4, muestra varchar, lectura varchar, dilucion2 varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.icp_lecturas WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icp_lecturas_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_icp_lecturas_DeleteByPrimaryKey
(
	p_id int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.icp_lecturas
 WHERE 
	id = p_id; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_icp_lecturas_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_icp_lecturas_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.icp_lecturas WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_reported_Insert(int8,int8,int8,int4,int8,bool,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_cells_reported_Insert
(
	p_idcell_reported int8 ,
	p_idrecep_sample_detail_elem int8 = null ,
	p_idrecep_sample_report int8 = null ,
	p_idtemplate_method int4 = null ,
	p_idrecep_sample_detail int8 = null ,
	p_flag_confirm_report bool = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.cells_reported
(
	idrecep_sample_detail_elem,
	idrecep_sample_report,
	idtemplate_method,
	idrecep_sample_detail,
	flag_confirm_report,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idrecep_sample_detail_elem,
	p_idrecep_sample_report,
	p_idtemplate_method,
	p_idrecep_sample_detail,
	p_flag_confirm_report,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idcell_reported into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_reported_Update(int8,int8,int8,int4,int8,bool,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_cells_reported_Update
(
	p_idcell_reported int8,
	p_idrecep_sample_detail_elem int8 = null,
	p_idrecep_sample_report int8 = null,
	p_idtemplate_method int4 = null,
	p_idrecep_sample_detail int8 = null,
	p_flag_confirm_report bool = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.cells_reported
SET
	idrecep_sample_detail_elem = p_idrecep_sample_detail_elem,
	idrecep_sample_report = p_idrecep_sample_report,
	idtemplate_method = p_idtemplate_method,
	idrecep_sample_detail = p_idrecep_sample_detail,
	flag_confirm_report = p_flag_confirm_report,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idcell_reported = p_idcell_reported;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_reported_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_cells_reported_SelectByPrimaryKey
(
	p_idcell_reported int8
) returns TABLE ("Idcell_reported" int8, "Idrecep_sample_detail_elem" int8, "Idrecep_sample_report" int8, "Idtemplate_method" int4, "Idrecep_sample_detail" int8, "Flag_confirm_report" bool, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.cells_reported
	WHERE 
			idcell_reported = p_idcell_reported;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_reported_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_cells_reported_SelectAll()
 returns TABLE ("Idcell_reported" int8, "Idrecep_sample_detail_elem" int8, "Idrecep_sample_report" int8, "Idtemplate_method" int4, "Idrecep_sample_detail" int8, "Flag_confirm_report" bool, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.cells_reported;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_reported_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_cells_reported_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcell_reported int8, idrecep_sample_detail_elem int8, idrecep_sample_report int8, idtemplate_method int4, idrecep_sample_detail int8, flag_confirm_report bool, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.cells_reported WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_reported_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_cells_reported_DeleteByPrimaryKey
(
	p_idcell_reported int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.cells_reported
 WHERE 
	idcell_reported = p_idcell_reported; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_reported_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_cells_reported_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.cells_reported WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_methods_multi_Insert(int4,varchar,varchar,int4,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric);
CREATE OR REPLACE FUNCTION public.sp_methods_multi_Insert
(
	p_id int4 ,
	p_elemento_longitud varchar(15) = null ,
	p_elemento varchar(10) = null ,
	p_prioridad int4 = null ,
	p_longitud numeric = null ,
	p_idl numeric = null ,
	p_mdl numeric = null ,
	p_linealidad numeric = null ,
	p_num_decimal numeric = null ,
	p_std1 numeric = null ,
	p_std2 numeric = null ,
	p_ipc numeric = null ,
	p_lfb numeric = null ,
	p_lfm numeric = null ,
	p_limite_inferior_md numeric = null ,
	p_limite_inferior_mt numeric = null ,
	p_limite_superior numeric = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.methods_multi
(
	elemento_longitud,
	elemento,
	prioridad,
	longitud,
	idl,
	mdl,
	linealidad,
	num_decimal,
	std1,
	std2,
	ipc,
	lfb,
	lfm,
	limite_inferior_md,
	limite_inferior_mt,
	limite_superior

)
VALUES
(
	p_elemento_longitud,
	p_elemento,
	p_prioridad,
	p_longitud,
	p_idl,
	p_mdl,
	p_linealidad,
	p_num_decimal,
	p_std1,
	p_std2,
	p_ipc,
	p_lfb,
	p_lfm,
	p_limite_inferior_md,
	p_limite_inferior_mt,
	p_limite_superior

)returning id into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_methods_multi_Update(int4,varchar,varchar,int4,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric);
CREATE OR REPLACE FUNCTION public.sp_methods_multi_Update
(
	p_id int4,
	p_elemento_longitud varchar(15) = null,
	p_elemento varchar(10) = null,
	p_prioridad int4 = null,
	p_longitud numeric = null,
	p_idl numeric = null,
	p_mdl numeric = null,
	p_linealidad numeric = null,
	p_num_decimal numeric = null,
	p_std1 numeric = null,
	p_std2 numeric = null,
	p_ipc numeric = null,
	p_lfb numeric = null,
	p_lfm numeric = null,
	p_limite_inferior_md numeric = null,
	p_limite_inferior_mt numeric = null,
	p_limite_superior numeric = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.methods_multi
SET
	elemento_longitud = p_elemento_longitud,
	elemento = p_elemento,
	prioridad = p_prioridad,
	longitud = p_longitud,
	idl = p_idl,
	mdl = p_mdl,
	linealidad = p_linealidad,
	num_decimal = p_num_decimal,
	std1 = p_std1,
	std2 = p_std2,
	ipc = p_ipc,
	lfb = p_lfb,
	lfm = p_lfm,
	limite_inferior_md = p_limite_inferior_md,
	limite_inferior_mt = p_limite_inferior_mt,
	limite_superior = p_limite_superior
 WHERE 
	id = p_id;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_methods_multi_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_methods_multi_SelectByPrimaryKey
(
	p_id int4
) returns TABLE ("Id" int4, "Elemento_longitud" varchar, "Elemento" varchar, "Prioridad" int4, "Longitud" numeric, "Idl" numeric, "Mdl" numeric, "Linealidad" numeric, "Num_decimal" numeric, "Std1" numeric, "Std2" numeric, "Ipc" numeric, "Lfb" numeric, "Lfm" numeric, "Limite_inferior_md" numeric, "Limite_inferior_mt" numeric, "Limite_superior" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.methods_multi
	WHERE 
			id = p_id;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_methods_multi_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_methods_multi_SelectAll()
 returns TABLE ("Id" int4, "Elemento_longitud" varchar, "Elemento" varchar, "Prioridad" int4, "Longitud" numeric, "Idl" numeric, "Mdl" numeric, "Linealidad" numeric, "Num_decimal" numeric, "Std1" numeric, "Std2" numeric, "Ipc" numeric, "Lfb" numeric, "Lfm" numeric, "Limite_inferior_md" numeric, "Limite_inferior_mt" numeric, "Limite_superior" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.methods_multi;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_methods_multi_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_methods_multi_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (id int4, elemento_longitud varchar, elemento varchar, prioridad int4, longitud numeric, idl numeric, mdl numeric, linealidad numeric, num_decimal numeric, std1 numeric, std2 numeric, ipc numeric, lfb numeric, lfm numeric, limite_inferior_md numeric, limite_inferior_mt numeric, limite_superior numeric
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.methods_multi WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_methods_multi_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_methods_multi_DeleteByPrimaryKey
(
	p_id int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.methods_multi
 WHERE 
	id = p_id; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_methods_multi_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_methods_multi_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.methods_multi WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_reactive_Insert(int4,varchar,varchar,numeric);
CREATE OR REPLACE FUNCTION public.sp_reactive_Insert
(
	p_idreactive int4 ,
	p_reactive_name varchar(40) = null ,
	p_chemical_formula varchar(15) = null ,
	p_weight_molecular numeric = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.reactive
(
	reactive_name,
	chemical_formula,
	weight_molecular

)
VALUES
(
	p_reactive_name,
	p_chemical_formula,
	p_weight_molecular

)returning idreactive into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_reactive_Update(int4,varchar,varchar,numeric);
CREATE OR REPLACE FUNCTION public.sp_reactive_Update
(
	p_idreactive int4,
	p_reactive_name varchar(40) = null,
	p_chemical_formula varchar(15) = null,
	p_weight_molecular numeric = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.reactive
SET
	reactive_name = p_reactive_name,
	chemical_formula = p_chemical_formula,
	weight_molecular = p_weight_molecular
 WHERE 
	idreactive = p_idreactive;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_reactive_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_reactive_SelectByPrimaryKey
(
	p_idreactive int4
) returns TABLE ("Idreactive" int4, "Reactive_name" varchar, "Chemical_formula" varchar, "Weight_molecular" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.reactive
	WHERE 
			idreactive = p_idreactive;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_reactive_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_reactive_SelectAll()
 returns TABLE ("Idreactive" int4, "Reactive_name" varchar, "Chemical_formula" varchar, "Weight_molecular" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.reactive;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_reactive_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_reactive_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idreactive int4, reactive_name varchar, chemical_formula varchar, weight_molecular numeric
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.reactive WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_reactive_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_reactive_DeleteByPrimaryKey
(
	p_idreactive int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.reactive
 WHERE 
	idreactive = p_idreactive; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_reactive_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_reactive_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.reactive WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_Insert(int2,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_configuration_Insert
(
	p_idconfiguration int2 ,
	p_nom_configuration varchar(30) = null ,
	p_value_configuration varchar(300) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.configuration
(
	nom_configuration,
	value_configuration

)
VALUES
(
	p_nom_configuration,
	p_value_configuration

)returning idconfiguration into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_Update(int2,varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_configuration_Update
(
	p_idconfiguration int2,
	p_nom_configuration varchar(30) = null,
	p_value_configuration varchar(300) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.configuration
SET
	nom_configuration = p_nom_configuration,
	value_configuration = p_value_configuration
 WHERE 
	idconfiguration = p_idconfiguration;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_configuration_SelectByPrimaryKey
(
	p_idconfiguration int2
) returns TABLE ("Idconfiguration" int2, "Nom_configuration" varchar, "Value_configuration" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.configuration
	WHERE 
			idconfiguration = p_idconfiguration;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_configuration_SelectAll()
 returns TABLE ("Idconfiguration" int2, "Nom_configuration" varchar, "Value_configuration" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.configuration;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_configuration_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idconfiguration int2, nom_configuration varchar, value_configuration varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.configuration WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_configuration_DeleteByPrimaryKey
(
	p_idconfiguration int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.configuration
 WHERE 
	idconfiguration = p_idconfiguration; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_configuration_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_configuration_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.configuration WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_user_system_Insert(int2,varchar,varchar,varchar,int2,timestamp,timestamp,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_process_user_system_Insert
(
	p_idprocess_user_system int2 ,
	p_cod_process varchar(4) = null ,
	p_cod_module varchar(4) = null ,
	p_cod_area varchar(4) = null ,
	p_iduser int2 = null ,
	p_date_ini timestamp = null ,
	p_date_end timestamp = null ,
	p_usernew varchar(50) = null ,
	p_datenew date = null ,
	p_useredit varchar(50) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.process_user_system
(
	cod_process,
	cod_module,
	cod_area,
	iduser,
	date_ini,
	date_end,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_cod_process,
	p_cod_module,
	p_cod_area,
	p_iduser,
	p_date_ini,
	p_date_end,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idprocess_user_system into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_user_system_Update(int2,varchar,varchar,varchar,int2,timestamp,timestamp,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_process_user_system_Update
(
	p_idprocess_user_system int2,
	p_cod_process varchar(4) = null,
	p_cod_module varchar(4) = null,
	p_cod_area varchar(4) = null,
	p_iduser int2 = null,
	p_date_ini timestamp = null,
	p_date_end timestamp = null,
	p_usernew varchar(50) = null,
	p_datenew date = null,
	p_useredit varchar(50) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.process_user_system
SET
	cod_process = p_cod_process,
	cod_module = p_cod_module,
	cod_area = p_cod_area,
	iduser = p_iduser,
	date_ini = p_date_ini,
	date_end = p_date_end,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idprocess_user_system = p_idprocess_user_system;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_user_system_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_process_user_system_SelectByPrimaryKey
(
	p_idprocess_user_system int2
) returns TABLE ("Idprocess_user_system" int2, "Cod_process" varchar, "Cod_module" varchar, "Cod_area" varchar, "Iduser" int2, "Date_ini" timestamp, "Date_end" timestamp, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.process_user_system
	WHERE 
			idprocess_user_system = p_idprocess_user_system;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_user_system_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_process_user_system_SelectAll()
 returns TABLE ("Idprocess_user_system" int2, "Cod_process" varchar, "Cod_module" varchar, "Cod_area" varchar, "Iduser" int2, "Date_ini" timestamp, "Date_end" timestamp, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.process_user_system;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_user_system_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_process_user_system_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idprocess_user_system int2, cod_process varchar, cod_module varchar, cod_area varchar, iduser int2, date_ini timestamp, date_end timestamp, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.process_user_system WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_user_system_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_process_user_system_DeleteByPrimaryKey
(
	p_idprocess_user_system int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.process_user_system
 WHERE 
	idprocess_user_system = p_idprocess_user_system; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_process_user_system_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_process_user_system_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.process_user_system WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_Insert(int8,varchar,timestamp,bpchar,varchar,int2,int2,int2,varchar,varchar,date,varchar,date,bool,timestamp,varchar,numeric,numeric,numeric,numeric,bool,numeric);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_Insert
(
	p_idrecep_sample int8 ,
	p_cod_recep_sample varchar(15) = null ,
	p_date_reception timestamp = null ,
	p_type_post bpchar = null ,
	p_phone_client varchar(15) = null ,
	p_idcompany int2 = null ,
	p_idcontact1 int2 = null ,
	p_idcontact2 int2 = null ,
	p_cod_serie varchar(10) = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null ,
	p_date_result timestamp = null ,
	p_cod_type_sample varchar(5) = null ,
	p_total_amount numeric = null ,
	p_total_igv numeric = null ,
	p_total_amount_igv numeric = null ,
	p_amortization numeric = null ,
	p_flag_isprice bool = null ,
	p_discount numeric = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.recep_sample
(
	cod_recep_sample,
	date_reception,
	type_post,
	phone_client,
	idcompany,
	idcontact1,
	idcontact2,
	cod_serie,
	usernew,
	datenew,
	useredit,
	dateedit,
	status,
	date_result,
	cod_type_sample,
	total_amount,
	total_igv,
	total_amount_igv,
	amortization,
	flag_isprice,
	discount

)
VALUES
(
	p_cod_recep_sample,
	p_date_reception,
	p_type_post,
	p_phone_client,
	p_idcompany,
	p_idcontact1,
	p_idcontact2,
	p_cod_serie,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status,
	p_date_result,
	p_cod_type_sample,
	p_total_amount,
	p_total_igv,
	p_total_amount_igv,
	p_amortization,
	p_flag_isprice,
	p_discount

)returning idrecep_sample into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_Update(int8,varchar,timestamp,bpchar,varchar,int2,int2,int2,varchar,varchar,date,varchar,date,bool,timestamp,varchar,numeric,numeric,numeric,numeric,bool,numeric);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_Update
(
	p_idrecep_sample int8,
	p_cod_recep_sample varchar(15) = null,
	p_date_reception timestamp = null,
	p_type_post bpchar = null,
	p_phone_client varchar(15) = null,
	p_idcompany int2 = null,
	p_idcontact1 int2 = null,
	p_idcontact2 int2 = null,
	p_cod_serie varchar(10) = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null,
	p_date_result timestamp = null,
	p_cod_type_sample varchar(5) = null,
	p_total_amount numeric = null,
	p_total_igv numeric = null,
	p_total_amount_igv numeric = null,
	p_amortization numeric = null,
	p_flag_isprice bool = null,
	p_discount numeric = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.recep_sample
SET
	cod_recep_sample = p_cod_recep_sample,
	date_reception = p_date_reception,
	type_post = p_type_post,
	phone_client = p_phone_client,
	idcompany = p_idcompany,
	idcontact1 = p_idcontact1,
	idcontact2 = p_idcontact2,
	cod_serie = p_cod_serie,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status,
	date_result = p_date_result,
	cod_type_sample = p_cod_type_sample,
	total_amount = p_total_amount,
	total_igv = p_total_igv,
	total_amount_igv = p_total_amount_igv,
	amortization = p_amortization,
	flag_isprice = p_flag_isprice,
	discount = p_discount
 WHERE 
	idrecep_sample = p_idrecep_sample;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_SelectByPrimaryKey
(
	p_idrecep_sample int8
) returns TABLE ("Idrecep_sample" int8, "Cod_recep_sample" varchar, "Date_reception" timestamp, "Type_post" bpchar, "Phone_client" varchar, "Idcompany" int2, "Idcontact1" int2, "Idcontact2" int2, "Cod_serie" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Date_result" timestamp, "Cod_type_sample" varchar, "Total_amount" numeric, "Total_igv" numeric, "Total_amount_igv" numeric, "Amortization" numeric, "Flag_isprice" bool, "Discount" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample
	WHERE 
			idrecep_sample = p_idrecep_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_recep_sample_SelectAll()
 returns TABLE ("Idrecep_sample" int8, "Cod_recep_sample" varchar, "Date_reception" timestamp, "Type_post" bpchar, "Phone_client" varchar, "Idcompany" int2, "Idcontact1" int2, "Idcontact2" int2, "Cod_serie" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Date_result" timestamp, "Cod_type_sample" varchar, "Total_amount" numeric, "Total_igv" numeric, "Total_amount_igv" numeric, "Amortization" numeric, "Flag_isprice" bool, "Discount" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_sample int8, cod_recep_sample varchar, date_reception timestamp, type_post bpchar, phone_client varchar, idcompany int2, idcontact1 int2, idcontact2 int2, cod_serie varchar, usernew varchar, datenew date, useredit varchar, dateedit date, status bool, date_result timestamp, cod_type_sample varchar, total_amount numeric, total_igv numeric, total_amount_igv numeric, amortization numeric, flag_isprice bool, discount numeric
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.recep_sample WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_DeleteByPrimaryKey
(
	p_idrecep_sample int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.recep_sample
 WHERE 
	idrecep_sample = p_idrecep_sample; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.recep_sample WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_sample_elem_Insert(int8,varchar,varchar,varchar,int8,int8,bpchar,timestamp,timestamp,int2,int8,int8,varchar,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_trace_sample_elem_Insert
(
	p_idtrace_sample_elem int8 ,
	p_cod_module varchar(4) = null ,
	p_cod_process varchar(4) = null ,
	p_cod_area varchar(4) = null ,
	p_idrecep_sample_detail_elem int8 = null ,
	p_idbatch int8 = null ,
	p_status_process bpchar = null ,
	p_date_in timestamp = null ,
	p_date_out timestamp = null ,
	p_status_result int2 = null ,
	p_idtrace_prev int8 = null ,
	p_idtrace_next int8 = null ,
	p_observation varchar(60) = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.trace_sample_elem
(
	cod_module,
	cod_process,
	cod_area,
	idrecep_sample_detail_elem,
	idbatch,
	status_process,
	date_in,
	date_out,
	status_result,
	idtrace_prev,
	idtrace_next,
	observation,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_cod_module,
	p_cod_process,
	p_cod_area,
	p_idrecep_sample_detail_elem,
	p_idbatch,
	p_status_process,
	p_date_in,
	p_date_out,
	p_status_result,
	p_idtrace_prev,
	p_idtrace_next,
	p_observation,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idtrace_sample_elem into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_sample_elem_Update(int8,varchar,varchar,varchar,int8,int8,bpchar,timestamp,timestamp,int2,int8,int8,varchar,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_trace_sample_elem_Update
(
	p_idtrace_sample_elem int8,
	p_cod_module varchar(4) = null,
	p_cod_process varchar(4) = null,
	p_cod_area varchar(4) = null,
	p_idrecep_sample_detail_elem int8 = null,
	p_idbatch int8 = null,
	p_status_process bpchar = null,
	p_date_in timestamp = null,
	p_date_out timestamp = null,
	p_status_result int2 = null,
	p_idtrace_prev int8 = null,
	p_idtrace_next int8 = null,
	p_observation varchar(60) = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.trace_sample_elem
SET
	cod_module = p_cod_module,
	cod_process = p_cod_process,
	cod_area = p_cod_area,
	idrecep_sample_detail_elem = p_idrecep_sample_detail_elem,
	idbatch = p_idbatch,
	status_process = p_status_process,
	date_in = p_date_in,
	date_out = p_date_out,
	status_result = p_status_result,
	idtrace_prev = p_idtrace_prev,
	idtrace_next = p_idtrace_next,
	observation = p_observation,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtrace_sample_elem = p_idtrace_sample_elem;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_sample_elem_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_trace_sample_elem_SelectByPrimaryKey
(
	p_idtrace_sample_elem int8
) returns TABLE ("Idtrace_sample_elem" int8, "Cod_module" varchar, "Cod_process" varchar, "Cod_area" varchar, "Idrecep_sample_detail_elem" int8, "Idbatch" int8, "Status_process" bpchar, "Date_in" timestamp, "Date_out" timestamp, "Status_result" int2, "Idtrace_prev" int8, "Idtrace_next" int8, "Observation" varchar, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.trace_sample_elem
	WHERE 
			idtrace_sample_elem = p_idtrace_sample_elem;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_sample_elem_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_trace_sample_elem_SelectAll()
 returns TABLE ("Idtrace_sample_elem" int8, "Cod_module" varchar, "Cod_process" varchar, "Cod_area" varchar, "Idrecep_sample_detail_elem" int8, "Idbatch" int8, "Status_process" bpchar, "Date_in" timestamp, "Date_out" timestamp, "Status_result" int2, "Idtrace_prev" int8, "Idtrace_next" int8, "Observation" varchar, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.trace_sample_elem;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_sample_elem_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_trace_sample_elem_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtrace_sample_elem int8, cod_module varchar, cod_process varchar, cod_area varchar, idrecep_sample_detail_elem int8, idbatch int8, status_process bpchar, date_in timestamp, date_out timestamp, status_result int2, idtrace_prev int8, idtrace_next int8, observation varchar, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.trace_sample_elem WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_sample_elem_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_trace_sample_elem_DeleteByPrimaryKey
(
	p_idtrace_sample_elem int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.trace_sample_elem
 WHERE 
	idtrace_sample_elem = p_idtrace_sample_elem; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_sample_elem_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_trace_sample_elem_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.trace_sample_elem WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_Insert(int8,int2,varchar,varchar,varchar,numeric,int8,bool,numeric,numeric,bool,varchar,varchar,int8,int2,bool,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_Insert
(
	p_idrecep_sample_detail int8 ,
	p_order_sample int2 = null ,
	p_cod_sample varchar(12) = null ,
	p_procedence varchar(300) = null ,
	p_name_sample varchar(300) = null ,
	p_amount_weight numeric = null ,
	p_cod_interno int8 = null ,
	p_flag_reject bool = null ,
	p_cost_sample numeric = null ,
	p_analisys_time numeric = null ,
	p_flag_control_sample bool = null ,
	p_cod_type_sample varchar(5) = null ,
	p_cod_des_sample varchar(5) = null ,
	p_idrecep_sample int8 = null ,
	p_flag_counter_sample int2 = null ,
	p_flag_envelope_sealed bool = null ,
	p_des_container varchar(50) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.recep_sample_detail
(
	order_sample,
	cod_sample,
	procedence,
	name_sample,
	amount_weight,
	cod_interno,
	flag_reject,
	cost_sample,
	analisys_time,
	flag_control_sample,
	cod_type_sample,
	cod_des_sample,
	idrecep_sample,
	flag_counter_sample,
	flag_envelope_sealed,
	des_container

)
VALUES
(
	p_order_sample,
	p_cod_sample,
	p_procedence,
	p_name_sample,
	p_amount_weight,
	p_cod_interno,
	p_flag_reject,
	p_cost_sample,
	p_analisys_time,
	p_flag_control_sample,
	p_cod_type_sample,
	p_cod_des_sample,
	p_idrecep_sample,
	p_flag_counter_sample,
	p_flag_envelope_sealed,
	p_des_container

)returning idrecep_sample_detail into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_Update(int8,int2,varchar,varchar,varchar,numeric,int8,bool,numeric,numeric,bool,varchar,varchar,int8,int2,bool,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_Update
(
	p_idrecep_sample_detail int8,
	p_order_sample int2 = null,
	p_cod_sample varchar(12) = null,
	p_procedence varchar(300) = null,
	p_name_sample varchar(300) = null,
	p_amount_weight numeric = null,
	p_cod_interno int8 = null,
	p_flag_reject bool = null,
	p_cost_sample numeric = null,
	p_analisys_time numeric = null,
	p_flag_control_sample bool = null,
	p_cod_type_sample varchar(5) = null,
	p_cod_des_sample varchar(5) = null,
	p_idrecep_sample int8 = null,
	p_flag_counter_sample int2 = null,
	p_flag_envelope_sealed bool = null,
	p_des_container varchar(50) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.recep_sample_detail
SET
	order_sample = p_order_sample,
	cod_sample = p_cod_sample,
	procedence = p_procedence,
	name_sample = p_name_sample,
	amount_weight = p_amount_weight,
	cod_interno = p_cod_interno,
	flag_reject = p_flag_reject,
	cost_sample = p_cost_sample,
	analisys_time = p_analisys_time,
	flag_control_sample = p_flag_control_sample,
	cod_type_sample = p_cod_type_sample,
	cod_des_sample = p_cod_des_sample,
	idrecep_sample = p_idrecep_sample,
	flag_counter_sample = p_flag_counter_sample,
	flag_envelope_sealed = p_flag_envelope_sealed,
	des_container = p_des_container
 WHERE 
	idrecep_sample_detail = p_idrecep_sample_detail;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_SelectByPrimaryKey
(
	p_idrecep_sample_detail int8
) returns TABLE ("Idrecep_sample_detail" int8, "Order_sample" int2, "Cod_sample" varchar, "Procedence" varchar, "Name_sample" varchar, "Amount_weight" numeric, "Cod_interno" int8, "Flag_reject" bool, "Cost_sample" numeric, "Analisys_time" numeric, "Flag_control_sample" bool, "Cod_type_sample" varchar, "Cod_des_sample" varchar, "Idrecep_sample" int8, "Flag_counter_sample" int2, "Flag_envelope_sealed" bool, "Des_container" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_detail
	WHERE 
			idrecep_sample_detail = p_idrecep_sample_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_SelectAll()
 returns TABLE ("Idrecep_sample_detail" int8, "Order_sample" int2, "Cod_sample" varchar, "Procedence" varchar, "Name_sample" varchar, "Amount_weight" numeric, "Cod_interno" int8, "Flag_reject" bool, "Cost_sample" numeric, "Analisys_time" numeric, "Flag_control_sample" bool, "Cod_type_sample" varchar, "Cod_des_sample" varchar, "Idrecep_sample" int8, "Flag_counter_sample" int2, "Flag_envelope_sealed" bool, "Des_container" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_sample_detail int8, order_sample int2, cod_sample varchar, procedence varchar, name_sample varchar, amount_weight numeric, cod_interno int8, flag_reject bool, cost_sample numeric, analisys_time numeric, flag_control_sample bool, cod_type_sample varchar, cod_des_sample varchar, idrecep_sample int8, flag_counter_sample int2, flag_envelope_sealed bool, des_container varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.recep_sample_detail WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_DeleteByPrimaryKey
(
	p_idrecep_sample_detail int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.recep_sample_detail
 WHERE 
	idrecep_sample_detail = p_idrecep_sample_detail; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.recep_sample_detail WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_batch_Insert(int8,varchar,varchar,varchar,int8,timestamp,timestamp,bpchar,int8,int8,varchar,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_trace_batch_Insert
(
	p_idtrace_batch int8 ,
	p_cod_module varchar(4) = null ,
	p_cod_process varchar(4) = null ,
	p_cod_area varchar(4) = null ,
	p_idbatch int8 = null ,
	p_date_in timestamp = null ,
	p_date_out timestamp = null ,
	p_status_process bpchar = null ,
	p_idtrace_prev int8 = null ,
	p_idtrace_next int8 = null ,
	p_observation varchar(60) = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.trace_batch
(
	cod_module,
	cod_process,
	cod_area,
	idbatch,
	date_in,
	date_out,
	status_process,
	idtrace_prev,
	idtrace_next,
	observation,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_cod_module,
	p_cod_process,
	p_cod_area,
	p_idbatch,
	p_date_in,
	p_date_out,
	p_status_process,
	p_idtrace_prev,
	p_idtrace_next,
	p_observation,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idtrace_batch into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_batch_Update(int8,varchar,varchar,varchar,int8,timestamp,timestamp,bpchar,int8,int8,varchar,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_trace_batch_Update
(
	p_idtrace_batch int8,
	p_cod_module varchar(4) = null,
	p_cod_process varchar(4) = null,
	p_cod_area varchar(4) = null,
	p_idbatch int8 = null,
	p_date_in timestamp = null,
	p_date_out timestamp = null,
	p_status_process bpchar = null,
	p_idtrace_prev int8 = null,
	p_idtrace_next int8 = null,
	p_observation varchar(60) = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.trace_batch
SET
	cod_module = p_cod_module,
	cod_process = p_cod_process,
	cod_area = p_cod_area,
	idbatch = p_idbatch,
	date_in = p_date_in,
	date_out = p_date_out,
	status_process = p_status_process,
	idtrace_prev = p_idtrace_prev,
	idtrace_next = p_idtrace_next,
	observation = p_observation,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtrace_batch = p_idtrace_batch;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_batch_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_trace_batch_SelectByPrimaryKey
(
	p_idtrace_batch int8
) returns TABLE ("Idtrace_batch" int8, "Cod_module" varchar, "Cod_process" varchar, "Cod_area" varchar, "Idbatch" int8, "Date_in" timestamp, "Date_out" timestamp, "Status_process" bpchar, "Idtrace_prev" int8, "Idtrace_next" int8, "Observation" varchar, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.trace_batch
	WHERE 
			idtrace_batch = p_idtrace_batch;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_batch_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_trace_batch_SelectAll()
 returns TABLE ("Idtrace_batch" int8, "Cod_module" varchar, "Cod_process" varchar, "Cod_area" varchar, "Idbatch" int8, "Date_in" timestamp, "Date_out" timestamp, "Status_process" bpchar, "Idtrace_prev" int8, "Idtrace_next" int8, "Observation" varchar, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.trace_batch;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_batch_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_trace_batch_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtrace_batch int8, cod_module varchar, cod_process varchar, cod_area varchar, idbatch int8, date_in timestamp, date_out timestamp, status_process bpchar, idtrace_prev int8, idtrace_next int8, observation varchar, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.trace_batch WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_batch_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_trace_batch_DeleteByPrimaryKey
(
	p_idtrace_batch int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.trace_batch
 WHERE 
	idtrace_batch = p_idtrace_batch; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_trace_batch_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_trace_batch_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.trace_batch WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_attach_Insert(int8,int4,int8,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_attach_Insert
(
	p_idrecep_sample_attach int8 ,
	p_iddocument_recep int4 = null ,
	p_idrecep_sample int8 = null ,
	p_order_file int2 = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.recep_sample_attach
(
	iddocument_recep,
	idrecep_sample,
	order_file,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_iddocument_recep,
	p_idrecep_sample,
	p_order_file,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idrecep_sample_attach into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_attach_Update(int8,int4,int8,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_attach_Update
(
	p_idrecep_sample_attach int8,
	p_iddocument_recep int4 = null,
	p_idrecep_sample int8 = null,
	p_order_file int2 = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.recep_sample_attach
SET
	iddocument_recep = p_iddocument_recep,
	idrecep_sample = p_idrecep_sample,
	order_file = p_order_file,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idrecep_sample_attach = p_idrecep_sample_attach;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_attach_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_attach_SelectByPrimaryKey
(
	p_idrecep_sample_attach int8
) returns TABLE ("Idrecep_sample_attach" int8, "Iddocument_recep" int4, "Idrecep_sample" int8, "Order_file" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_attach
	WHERE 
			idrecep_sample_attach = p_idrecep_sample_attach;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_attach_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_recep_sample_attach_SelectAll()
 returns TABLE ("Idrecep_sample_attach" int8, "Iddocument_recep" int4, "Idrecep_sample" int8, "Order_file" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_attach;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_attach_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_attach_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_sample_attach int8, iddocument_recep int4, idrecep_sample int8, order_file int2, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.recep_sample_attach WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_attach_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_attach_DeleteByPrimaryKey
(
	p_idrecep_sample_attach int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.recep_sample_attach
 WHERE 
	idrecep_sample_attach = p_idrecep_sample_attach; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_attach_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_attach_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.recep_sample_attach WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_attach_file_Insert(int8,int8,int8,int4,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_cells_attach_file_Insert
(
	p_idcells_attach_file int8 ,
	p_idrecep_sample_attach int8 = null ,
	p_idrecep_sample_detail_elem int8 = null ,
	p_idtemplate_method int4 = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.cells_attach_file
(
	idrecep_sample_attach,
	idrecep_sample_detail_elem,
	idtemplate_method,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idrecep_sample_attach,
	p_idrecep_sample_detail_elem,
	p_idtemplate_method,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idcells_attach_file into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_attach_file_Update(int8,int8,int8,int4,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_cells_attach_file_Update
(
	p_idcells_attach_file int8,
	p_idrecep_sample_attach int8 = null,
	p_idrecep_sample_detail_elem int8 = null,
	p_idtemplate_method int4 = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.cells_attach_file
SET
	idrecep_sample_attach = p_idrecep_sample_attach,
	idrecep_sample_detail_elem = p_idrecep_sample_detail_elem,
	idtemplate_method = p_idtemplate_method,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idcells_attach_file = p_idcells_attach_file;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_attach_file_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_cells_attach_file_SelectByPrimaryKey
(
	p_idcells_attach_file int8
) returns TABLE ("Idcells_attach_file" int8, "Idrecep_sample_attach" int8, "Idrecep_sample_detail_elem" int8, "Idtemplate_method" int4, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.cells_attach_file
	WHERE 
			idcells_attach_file = p_idcells_attach_file;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_attach_file_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_cells_attach_file_SelectAll()
 returns TABLE ("Idcells_attach_file" int8, "Idrecep_sample_attach" int8, "Idrecep_sample_detail_elem" int8, "Idtemplate_method" int4, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.cells_attach_file;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_attach_file_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_cells_attach_file_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcells_attach_file int8, idrecep_sample_attach int8, idrecep_sample_detail_elem int8, idtemplate_method int4, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.cells_attach_file WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_attach_file_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_cells_attach_file_DeleteByPrimaryKey
(
	p_idcells_attach_file int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.cells_attach_file
 WHERE 
	idcells_attach_file = p_idcells_attach_file; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_attach_file_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_cells_attach_file_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.cells_attach_file WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_measurement_unit_Insert(int2,varchar,varchar,varchar,date,varchar,date,bool,int4);
CREATE OR REPLACE FUNCTION public.sp_measurement_unit_Insert
(
	p_idunit int2 ,
	p_name_unit varchar(6) = null ,
	p_description varchar(20) = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null ,
	p_concentration_unit int4 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.measurement_unit
(
	name_unit,
	description,
	usernew,
	datenew,
	useredit,
	dateedit,
	status,
	concentration_unit

)
VALUES
(
	p_name_unit,
	p_description,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status,
	p_concentration_unit

)returning idunit into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_measurement_unit_Update(int2,varchar,varchar,varchar,date,varchar,date,bool,int4);
CREATE OR REPLACE FUNCTION public.sp_measurement_unit_Update
(
	p_idunit int2,
	p_name_unit varchar(6) = null,
	p_description varchar(20) = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null,
	p_concentration_unit int4 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.measurement_unit
SET
	name_unit = p_name_unit,
	description = p_description,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status,
	concentration_unit = p_concentration_unit
 WHERE 
	idunit = p_idunit;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_measurement_unit_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_measurement_unit_SelectByPrimaryKey
(
	p_idunit int2
) returns TABLE ("Idunit" int2, "Name_unit" varchar, "Description" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Concentration_unit" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.measurement_unit
	WHERE 
			idunit = p_idunit;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_measurement_unit_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_measurement_unit_SelectAll()
 returns TABLE ("Idunit" int2, "Name_unit" varchar, "Description" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Concentration_unit" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.measurement_unit;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_measurement_unit_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_measurement_unit_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idunit int2, name_unit varchar, description varchar, usernew varchar, datenew date, useredit varchar, dateedit date, status bool, concentration_unit int4
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.measurement_unit WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_measurement_unit_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_measurement_unit_DeleteByPrimaryKey
(
	p_idunit int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.measurement_unit
 WHERE 
	idunit = p_idunit; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_measurement_unit_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_measurement_unit_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.measurement_unit WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_dispatch_Insert(int8,int2,int2,int2,int2,int2,int2,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_dispatch_Insert
(
	p_idrecep_sample int8 ,
	p_dispatch_person int2 = null ,
	p_dispatch_mail int2 = null ,
	p_dispatch_curier int2 = null ,
	p_dispatch_transport int2 = null ,
	p_dispatch_fax int2 = null ,
	p_dispatch_otro int2 = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.recep_sample_dispatch
(
	idrecep_sample,
	dispatch_person,
	dispatch_mail,
	dispatch_curier,
	dispatch_transport,
	dispatch_fax,
	dispatch_otro,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idrecep_sample,
	p_dispatch_person,
	p_dispatch_mail,
	p_dispatch_curier,
	p_dispatch_transport,
	p_dispatch_fax,
	p_dispatch_otro,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_dispatch_Update(int8,int2,int2,int2,int2,int2,int2,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_dispatch_Update
(
	p_idrecep_sample int8,
	p_dispatch_person int2 = null,
	p_dispatch_mail int2 = null,
	p_dispatch_curier int2 = null,
	p_dispatch_transport int2 = null,
	p_dispatch_fax int2 = null,
	p_dispatch_otro int2 = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.recep_sample_dispatch
SET
	idrecep_sample = p_idrecep_sample,
	dispatch_person = p_dispatch_person,
	dispatch_mail = p_dispatch_mail,
	dispatch_curier = p_dispatch_curier,
	dispatch_transport = p_dispatch_transport,
	dispatch_fax = p_dispatch_fax,
	dispatch_otro = p_dispatch_otro,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idrecep_sample = p_idrecep_sample;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_dispatch_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_dispatch_SelectByPrimaryKey
(
	p_idrecep_sample int8
) returns TABLE ("Idrecep_sample" int8, "Dispatch_person" int2, "Dispatch_mail" int2, "Dispatch_curier" int2, "Dispatch_transport" int2, "Dispatch_fax" int2, "Dispatch_otro" int2, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_dispatch
	WHERE 
			idrecep_sample = p_idrecep_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_dispatch_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_recep_sample_dispatch_SelectAll()
 returns TABLE ("Idrecep_sample" int8, "Dispatch_person" int2, "Dispatch_mail" int2, "Dispatch_curier" int2, "Dispatch_transport" int2, "Dispatch_fax" int2, "Dispatch_otro" int2, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_dispatch;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_dispatch_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_dispatch_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_sample int8, dispatch_person int2, dispatch_mail int2, dispatch_curier int2, dispatch_transport int2, dispatch_fax int2, dispatch_otro int2, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.recep_sample_dispatch WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_dispatch_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_dispatch_DeleteByPrimaryKey
(
	p_idrecep_sample int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.recep_sample_dispatch
 WHERE 
	idrecep_sample = p_idrecep_sample; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_dispatch_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_dispatch_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.recep_sample_dispatch WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_samples_Insert(int4,varchar,numeric,numeric,int4,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_destiny_samples_Insert
(
	p_iddestiny_samples int4 ,
	p_description varchar(30) = null ,
	p_cost_counter_sample numeric = null ,
	p_cost_reject_sample numeric = null ,
	p_time_without_cost int4 = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.destiny_samples
(
	description,
	cost_counter_sample,
	cost_reject_sample,
	time_without_cost,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_description,
	p_cost_counter_sample,
	p_cost_reject_sample,
	p_time_without_cost,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning iddestiny_samples into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_samples_Update(int4,varchar,numeric,numeric,int4,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_destiny_samples_Update
(
	p_iddestiny_samples int4,
	p_description varchar(30) = null,
	p_cost_counter_sample numeric = null,
	p_cost_reject_sample numeric = null,
	p_time_without_cost int4 = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.destiny_samples
SET
	description = p_description,
	cost_counter_sample = p_cost_counter_sample,
	cost_reject_sample = p_cost_reject_sample,
	time_without_cost = p_time_without_cost,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	iddestiny_samples = p_iddestiny_samples;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_samples_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_destiny_samples_SelectByPrimaryKey
(
	p_iddestiny_samples int4
) returns TABLE ("Iddestiny_samples" int4, "Description" varchar, "Cost_counter_sample" numeric, "Cost_reject_sample" numeric, "Time_without_cost" int4, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.destiny_samples
	WHERE 
			iddestiny_samples = p_iddestiny_samples;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_samples_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_destiny_samples_SelectAll()
 returns TABLE ("Iddestiny_samples" int4, "Description" varchar, "Cost_counter_sample" numeric, "Cost_reject_sample" numeric, "Time_without_cost" int4, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.destiny_samples;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_samples_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_destiny_samples_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (iddestiny_samples int4, description varchar, cost_counter_sample numeric, cost_reject_sample numeric, time_without_cost int4, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.destiny_samples WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_samples_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_destiny_samples_DeleteByPrimaryKey
(
	p_iddestiny_samples int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.destiny_samples
 WHERE 
	iddestiny_samples = p_iddestiny_samples; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_samples_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_destiny_samples_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.destiny_samples WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_group_Insert(int4,varchar,varchar,bool);
CREATE OR REPLACE FUNCTION public.sp_matrix_group_Insert
(
	p_idmatrix_group int4 ,
	p_sigla varchar(10) = null ,
	p_name_group varchar(100) = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.matrix_group
(
	sigla,
	name_group,
	status

)
VALUES
(
	p_sigla,
	p_name_group,
	p_status

)returning idmatrix_group into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_group_Update(int4,varchar,varchar,bool);
CREATE OR REPLACE FUNCTION public.sp_matrix_group_Update
(
	p_idmatrix_group int4,
	p_sigla varchar(10) = null,
	p_name_group varchar(100) = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.matrix_group
SET
	sigla = p_sigla,
	name_group = p_name_group,
	status = p_status
 WHERE 
	idmatrix_group = p_idmatrix_group;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_group_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_matrix_group_SelectByPrimaryKey
(
	p_idmatrix_group int4
) returns TABLE ("Idmatrix_group" int4, "Sigla" varchar, "Name_group" varchar, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.matrix_group
	WHERE 
			idmatrix_group = p_idmatrix_group;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_group_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_matrix_group_SelectAll()
 returns TABLE ("Idmatrix_group" int4, "Sigla" varchar, "Name_group" varchar, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.matrix_group;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_group_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_matrix_group_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idmatrix_group int4, sigla varchar, name_group varchar, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.matrix_group WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_group_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_matrix_group_DeleteByPrimaryKey
(
	p_idmatrix_group int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.matrix_group
 WHERE 
	idmatrix_group = p_idmatrix_group; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_group_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_matrix_group_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.matrix_group WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_elem_Insert(int8,int8,int8,int2,int4,numeric,int2,varchar,numeric,int2,int4,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_elem_Insert
(
	p_idrecep_sample_detail_elem int8 ,
	p_idrecep_sample int8 = null ,
	p_idrecep_sample_detail int8 = null ,
	p_idelement int2 = null ,
	p_idtemplate_method int4 = null ,
	p_cost_method numeric = null ,
	p_analysis_time int2 = null ,
	p_str_result_analysis varchar(15) = null ,
	p_result_analysis numeric = null ,
	p_idunit int2 = null ,
	p_idcompany int4 = null ,
	p_with_result bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.recep_sample_detail_elem
(
	idrecep_sample,
	idrecep_sample_detail,
	idelement,
	idtemplate_method,
	cost_method,
	analysis_time,
	str_result_analysis,
	result_analysis,
	idunit,
	idcompany,
	with_result

)
VALUES
(
	p_idrecep_sample,
	p_idrecep_sample_detail,
	p_idelement,
	p_idtemplate_method,
	p_cost_method,
	p_analysis_time,
	p_str_result_analysis,
	p_result_analysis,
	p_idunit,
	p_idcompany,
	p_with_result

)returning idrecep_sample_detail_elem into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_elem_Update(int8,int8,int8,int2,int4,numeric,int2,varchar,numeric,int2,int4,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_elem_Update
(
	p_idrecep_sample_detail_elem int8,
	p_idrecep_sample int8 = null,
	p_idrecep_sample_detail int8 = null,
	p_idelement int2 = null,
	p_idtemplate_method int4 = null,
	p_cost_method numeric = null,
	p_analysis_time int2 = null,
	p_str_result_analysis varchar(15) = null,
	p_result_analysis numeric = null,
	p_idunit int2 = null,
	p_idcompany int4 = null,
	p_with_result bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.recep_sample_detail_elem
SET
	idrecep_sample = p_idrecep_sample,
	idrecep_sample_detail = p_idrecep_sample_detail,
	idelement = p_idelement,
	idtemplate_method = p_idtemplate_method,
	cost_method = p_cost_method,
	analysis_time = p_analysis_time,
	str_result_analysis = p_str_result_analysis,
	result_analysis = p_result_analysis,
	idunit = p_idunit,
	idcompany = p_idcompany,
	with_result = p_with_result
 WHERE 
	idrecep_sample_detail_elem = p_idrecep_sample_detail_elem;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_elem_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_elem_SelectByPrimaryKey
(
	p_idrecep_sample_detail_elem int8
) returns TABLE ("Idrecep_sample_detail_elem" int8, "Idrecep_sample" int8, "Idrecep_sample_detail" int8, "Idelement" int2, "Idtemplate_method" int4, "Cost_method" numeric, "Analysis_time" int2, "Str_result_analysis" varchar, "Result_analysis" numeric, "Idunit" int2, "Idcompany" int4, "With_result" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_detail_elem
	WHERE 
			idrecep_sample_detail_elem = p_idrecep_sample_detail_elem;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_elem_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_elem_SelectAll()
 returns TABLE ("Idrecep_sample_detail_elem" int8, "Idrecep_sample" int8, "Idrecep_sample_detail" int8, "Idelement" int2, "Idtemplate_method" int4, "Cost_method" numeric, "Analysis_time" int2, "Str_result_analysis" varchar, "Result_analysis" numeric, "Idunit" int2, "Idcompany" int4, "With_result" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_detail_elem;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_elem_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_elem_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_sample_detail_elem int8, idrecep_sample int8, idrecep_sample_detail int8, idelement int2, idtemplate_method int4, cost_method numeric, analysis_time int2, str_result_analysis varchar, result_analysis numeric, idunit int2, idcompany int4, with_result bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.recep_sample_detail_elem WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_elem_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_elem_DeleteByPrimaryKey
(
	p_idrecep_sample_detail_elem int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.recep_sample_detail_elem
 WHERE 
	idrecep_sample_detail_elem = p_idrecep_sample_detail_elem; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_detail_elem_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_detail_elem_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.recep_sample_detail_elem WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_program_Insert(int8,int8,int2,int8,int2,date,timestamp,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_program_Insert
(
	p_idrecep_sample_program int8 ,
	p_cod_recep_sample_program int8 = null ,
	p_order_report int2 = null ,
	p_idrecep_sample int8 = null ,
	p_program_status int2 = null ,
	p_date_report date = null ,
	p_time_report timestamp = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.recep_sample_program
(
	cod_recep_sample_program,
	order_report,
	idrecep_sample,
	program_status,
	date_report,
	time_report,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_cod_recep_sample_program,
	p_order_report,
	p_idrecep_sample,
	p_program_status,
	p_date_report,
	p_time_report,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idrecep_sample_program into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_program_Update(int8,int8,int2,int8,int2,date,timestamp,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_program_Update
(
	p_idrecep_sample_program int8,
	p_cod_recep_sample_program int8 = null,
	p_order_report int2 = null,
	p_idrecep_sample int8 = null,
	p_program_status int2 = null,
	p_date_report date = null,
	p_time_report timestamp = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.recep_sample_program
SET
	cod_recep_sample_program = p_cod_recep_sample_program,
	order_report = p_order_report,
	idrecep_sample = p_idrecep_sample,
	program_status = p_program_status,
	date_report = p_date_report,
	time_report = p_time_report,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idrecep_sample_program = p_idrecep_sample_program;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_program_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_program_SelectByPrimaryKey
(
	p_idrecep_sample_program int8
) returns TABLE ("Idrecep_sample_program" int8, "Cod_recep_sample_program" int8, "Order_report" int2, "Idrecep_sample" int8, "Program_status" int2, "Date_report" date, "Time_report" timestamp, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_program
	WHERE 
			idrecep_sample_program = p_idrecep_sample_program;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_program_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_recep_sample_program_SelectAll()
 returns TABLE ("Idrecep_sample_program" int8, "Cod_recep_sample_program" int8, "Order_report" int2, "Idrecep_sample" int8, "Program_status" int2, "Date_report" date, "Time_report" timestamp, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.recep_sample_program;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_program_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_program_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_sample_program int8, cod_recep_sample_program int8, order_report int2, idrecep_sample int8, program_status int2, date_report date, time_report timestamp, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.recep_sample_program WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_program_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_program_DeleteByPrimaryKey
(
	p_idrecep_sample_program int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.recep_sample_program
 WHERE 
	idrecep_sample_program = p_idrecep_sample_program; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_recep_sample_program_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_recep_sample_program_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.recep_sample_program WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_solution_Insert(int4,varchar,int2,varchar,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_type_solution_Insert
(
	p_idtype_solution int4 ,
	p_name_type_solution varchar(20) = null ,
	p_num_days_expiration int2 = null ,
	p_observation varchar(100) = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.type_solution
(
	name_type_solution,
	num_days_expiration,
	observation,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_name_type_solution,
	p_num_days_expiration,
	p_observation,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idtype_solution into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_solution_Update(int4,varchar,int2,varchar,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_type_solution_Update
(
	p_idtype_solution int4,
	p_name_type_solution varchar(20) = null,
	p_num_days_expiration int2 = null,
	p_observation varchar(100) = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.type_solution
SET
	name_type_solution = p_name_type_solution,
	num_days_expiration = p_num_days_expiration,
	observation = p_observation,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtype_solution = p_idtype_solution;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_solution_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_type_solution_SelectByPrimaryKey
(
	p_idtype_solution int4
) returns TABLE ("Idtype_solution" int4, "Name_type_solution" varchar, "Num_days_expiration" int2, "Observation" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.type_solution
	WHERE 
			idtype_solution = p_idtype_solution;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_solution_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_type_solution_SelectAll()
 returns TABLE ("Idtype_solution" int4, "Name_type_solution" varchar, "Num_days_expiration" int2, "Observation" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.type_solution;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_solution_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_type_solution_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtype_solution int4, name_type_solution varchar, num_days_expiration int2, observation varchar, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.type_solution WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_solution_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_type_solution_DeleteByPrimaryKey
(
	p_idtype_solution int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.type_solution
 WHERE 
	idtype_solution = p_idtype_solution; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_solution_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_type_solution_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.type_solution WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_Insert(int2,int2,int4,bpchar,int4,varchar,bpchar,int4,int4,bool,int4,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_documentation_Insert
(
	p_iddocumentation int2 ,
	p_idconfiguration_folder int2 ,
	p_idtemplate_method int4 = null ,
	p_procedure_type bpchar = null ,
	p_code int4 = null ,
	p_name_doc varchar(100) = null ,
	p_type_doc bpchar = null ,
	p_id int4 = null ,
	p_parentid int4 = null ,
	p_flag_enabled bool = null ,
	p_image_index int4 = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.documentation
(
	idconfiguration_folder,
	idtemplate_method,
	procedure_type,
	code,
	name_doc,
	type_doc,
	id,
	parentid,
	flag_enabled,
	image_index,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idconfiguration_folder,
	p_idtemplate_method,
	p_procedure_type,
	p_code,
	p_name_doc,
	p_type_doc,
	p_id,
	p_parentid,
	p_flag_enabled,
	p_image_index,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning iddocumentation into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_Update(int2,int2,int4,bpchar,int4,varchar,bpchar,int4,int4,bool,int4,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_documentation_Update
(
	p_iddocumentation int2,
	p_idconfiguration_folder int2,
	p_idtemplate_method int4 = null,
	p_procedure_type bpchar = null,
	p_code int4 = null,
	p_name_doc varchar(100) = null,
	p_type_doc bpchar = null,
	p_id int4 = null,
	p_parentid int4 = null,
	p_flag_enabled bool = null,
	p_image_index int4 = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.documentation
SET
	idconfiguration_folder = p_idconfiguration_folder,
	idtemplate_method = p_idtemplate_method,
	procedure_type = p_procedure_type,
	code = p_code,
	name_doc = p_name_doc,
	type_doc = p_type_doc,
	id = p_id,
	parentid = p_parentid,
	flag_enabled = p_flag_enabled,
	image_index = p_image_index,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	iddocumentation = p_iddocumentation;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_documentation_SelectByPrimaryKey
(
	p_iddocumentation int2
) returns TABLE ("Iddocumentation" int2, "Idconfiguration_folder" int2, "Idtemplate_method" int4, "Procedure_type" bpchar, "Code" int4, "Name_doc" varchar, "Type_doc" bpchar, "Id" int4, "Parentid" int4, "Flag_enabled" bool, "Image_index" int4, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.documentation
	WHERE 
			iddocumentation = p_iddocumentation;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_documentation_SelectAll()
 returns TABLE ("Iddocumentation" int2, "Idconfiguration_folder" int2, "Idtemplate_method" int4, "Procedure_type" bpchar, "Code" int4, "Name_doc" varchar, "Type_doc" bpchar, "Id" int4, "Parentid" int4, "Flag_enabled" bool, "Image_index" int4, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.documentation;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_documentation_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (iddocumentation int2, idconfiguration_folder int2, idtemplate_method int4, procedure_type bpchar, code int4, name_doc varchar, type_doc bpchar, id int4, parentid int4, flag_enabled bool, image_index int4, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.documentation WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_documentation_DeleteByPrimaryKey
(
	p_iddocumentation int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.documentation
 WHERE 
	iddocumentation = p_iddocumentation; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_documentation_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.documentation WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_program_Insert(int8,int8,int8,int4,int8,bool,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_cells_program_Insert
(
	p_idcell_reported int8 ,
	p_idrecep_sample_detail_elem int8 = null ,
	p_idrecep_sample_program int8 = null ,
	p_idtemplate_method int4 = null ,
	p_idrecep_sample_detail int8 = null ,
	p_flag_confirm_report bool = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.cells_program
(
	idrecep_sample_detail_elem,
	idrecep_sample_program,
	idtemplate_method,
	idrecep_sample_detail,
	flag_confirm_report,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idrecep_sample_detail_elem,
	p_idrecep_sample_program,
	p_idtemplate_method,
	p_idrecep_sample_detail,
	p_flag_confirm_report,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idcell_reported into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_program_Update(int8,int8,int8,int4,int8,bool,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_cells_program_Update
(
	p_idcell_reported int8,
	p_idrecep_sample_detail_elem int8 = null,
	p_idrecep_sample_program int8 = null,
	p_idtemplate_method int4 = null,
	p_idrecep_sample_detail int8 = null,
	p_flag_confirm_report bool = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.cells_program
SET
	idrecep_sample_detail_elem = p_idrecep_sample_detail_elem,
	idrecep_sample_program = p_idrecep_sample_program,
	idtemplate_method = p_idtemplate_method,
	idrecep_sample_detail = p_idrecep_sample_detail,
	flag_confirm_report = p_flag_confirm_report,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idcell_reported = p_idcell_reported;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_program_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_cells_program_SelectByPrimaryKey
(
	p_idcell_reported int8
) returns TABLE ("Idcell_reported" int8, "Idrecep_sample_detail_elem" int8, "Idrecep_sample_program" int8, "Idtemplate_method" int4, "Idrecep_sample_detail" int8, "Flag_confirm_report" bool, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.cells_program
	WHERE 
			idcell_reported = p_idcell_reported;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_program_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_cells_program_SelectAll()
 returns TABLE ("Idcell_reported" int8, "Idrecep_sample_detail_elem" int8, "Idrecep_sample_program" int8, "Idtemplate_method" int4, "Idrecep_sample_detail" int8, "Flag_confirm_report" bool, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.cells_program;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_program_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_cells_program_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcell_reported int8, idrecep_sample_detail_elem int8, idrecep_sample_program int8, idtemplate_method int4, idrecep_sample_detail int8, flag_confirm_report bool, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.cells_program WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_program_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_cells_program_DeleteByPrimaryKey
(
	p_idcell_reported int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.cells_program
 WHERE 
	idcell_reported = p_idcell_reported; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_cells_program_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_cells_program_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.cells_program WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_item_Insert(int4,int4,varchar,varchar,varchar,bool,bool);
CREATE OR REPLACE FUNCTION public.sp_matrix_item_Insert
(
	p_idmatrix_item int4 ,
	p_idmatrix_group int4 = null ,
	p_sigla varchar(10) = null ,
	p_name_item varchar(100) = null ,
	p_description varchar(500) = null ,
	p_flag_acreditado bool = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.matrix_item
(
	idmatrix_group,
	sigla,
	name_item,
	description,
	flag_acreditado,
	status

)
VALUES
(
	p_idmatrix_group,
	p_sigla,
	p_name_item,
	p_description,
	p_flag_acreditado,
	p_status

)returning idmatrix_item into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_item_Update(int4,int4,varchar,varchar,varchar,bool,bool);
CREATE OR REPLACE FUNCTION public.sp_matrix_item_Update
(
	p_idmatrix_item int4,
	p_idmatrix_group int4 = null,
	p_sigla varchar(10) = null,
	p_name_item varchar(100) = null,
	p_description varchar(500) = null,
	p_flag_acreditado bool = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.matrix_item
SET
	idmatrix_group = p_idmatrix_group,
	sigla = p_sigla,
	name_item = p_name_item,
	description = p_description,
	flag_acreditado = p_flag_acreditado,
	status = p_status
 WHERE 
	idmatrix_item = p_idmatrix_item;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_item_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_matrix_item_SelectByPrimaryKey
(
	p_idmatrix_item int4
) returns TABLE ("Idmatrix_item" int4, "Idmatrix_group" int4, "Sigla" varchar, "Name_item" varchar, "Description" varchar, "Flag_acreditado" bool, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.matrix_item
	WHERE 
			idmatrix_item = p_idmatrix_item;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_item_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_matrix_item_SelectAll()
 returns TABLE ("Idmatrix_item" int4, "Idmatrix_group" int4, "Sigla" varchar, "Name_item" varchar, "Description" varchar, "Flag_acreditado" bool, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.matrix_item;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_item_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_matrix_item_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idmatrix_item int4, idmatrix_group int4, sigla varchar, name_item varchar, description varchar, flag_acreditado bool, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.matrix_item WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_item_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_matrix_item_DeleteByPrimaryKey
(
	p_idmatrix_item int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.matrix_item
 WHERE 
	idmatrix_item = p_idmatrix_item; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_matrix_item_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_matrix_item_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.matrix_item WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_user_Insert(int8,int2,int2,timestamp,timestamp,varchar,int8,varchar,bool,int4,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_documentation_user_Insert
(
	p_iddocumentation_user int8 ,
	p_iddocumentation int2 ,
	p_iduser int2 ,
	p_date_ini timestamp = null ,
	p_date_end timestamp = null ,
	p_name_file varchar(15) = null ,
	p_order_file int8 = null ,
	p_extension_file varchar(5) = null ,
	p_prev_authorized bool = null ,
	p_rank_valid_inmonth int4 = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.documentation_user
(
	iddocumentation,
	iduser,
	date_ini,
	date_end,
	name_file,
	order_file,
	extension_file,
	prev_authorized,
	rank_valid_inmonth,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_iddocumentation,
	p_iduser,
	p_date_ini,
	p_date_end,
	p_name_file,
	p_order_file,
	p_extension_file,
	p_prev_authorized,
	p_rank_valid_inmonth,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning iddocumentation_user into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_user_Update(int8,int2,int2,timestamp,timestamp,varchar,int8,varchar,bool,int4,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_documentation_user_Update
(
	p_iddocumentation_user int8,
	p_iddocumentation int2,
	p_iduser int2,
	p_date_ini timestamp = null,
	p_date_end timestamp = null,
	p_name_file varchar(15) = null,
	p_order_file int8 = null,
	p_extension_file varchar(5) = null,
	p_prev_authorized bool = null,
	p_rank_valid_inmonth int4 = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.documentation_user
SET
	iddocumentation = p_iddocumentation,
	iduser = p_iduser,
	date_ini = p_date_ini,
	date_end = p_date_end,
	name_file = p_name_file,
	order_file = p_order_file,
	extension_file = p_extension_file,
	prev_authorized = p_prev_authorized,
	rank_valid_inmonth = p_rank_valid_inmonth,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	iddocumentation_user = p_iddocumentation_user;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_user_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_documentation_user_SelectByPrimaryKey
(
	p_iddocumentation_user int8
) returns TABLE ("Iddocumentation_user" int8, "Iddocumentation" int2, "Iduser" int2, "Date_ini" timestamp, "Date_end" timestamp, "Name_file" varchar, "Order_file" int8, "Extension_file" varchar, "Prev_authorized" bool, "Rank_valid_inmonth" int4, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.documentation_user
	WHERE 
			iddocumentation_user = p_iddocumentation_user;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_user_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_documentation_user_SelectAll()
 returns TABLE ("Iddocumentation_user" int8, "Iddocumentation" int2, "Iduser" int2, "Date_ini" timestamp, "Date_end" timestamp, "Name_file" varchar, "Order_file" int8, "Extension_file" varchar, "Prev_authorized" bool, "Rank_valid_inmonth" int4, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.documentation_user;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_user_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_documentation_user_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (iddocumentation_user int8, iddocumentation int2, iduser int2, date_ini timestamp, date_end timestamp, name_file varchar, order_file int8, extension_file varchar, prev_authorized bool, rank_valid_inmonth int4, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.documentation_user WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_user_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_documentation_user_DeleteByPrimaryKey
(
	p_iddocumentation_user int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.documentation_user
 WHERE 
	iddocumentation_user = p_iddocumentation_user; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_documentation_user_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_documentation_user_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.documentation_user WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_sample_recep_Insert(int4,int8,bool,bool,bool,bool,bool,bool,bool,bool,numeric,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_destiny_sample_recep_Insert
(
	p_iddestiny_sample_recep int4 ,
	p_idrecep_sample int8 = null ,
	p_return_after_a_cs bool = null ,
	p_return_after_a_re bool = null ,
	p_return_after_t_cs bool = null ,
	p_return_after_t_re bool = null ,
	p_discard_after_t_cs bool = null ,
	p_discard_after_t_re bool = null ,
	p_charge_after_t_cs bool = null ,
	p_charge_after_t_re bool = null ,
	p_percent_discount numeric = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.destiny_sample_recep
(
	idrecep_sample,
	return_after_a_cs,
	return_after_a_re,
	return_after_t_cs,
	return_after_t_re,
	discard_after_t_cs,
	discard_after_t_re,
	charge_after_t_cs,
	charge_after_t_re,
	percent_discount,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idrecep_sample,
	p_return_after_a_cs,
	p_return_after_a_re,
	p_return_after_t_cs,
	p_return_after_t_re,
	p_discard_after_t_cs,
	p_discard_after_t_re,
	p_charge_after_t_cs,
	p_charge_after_t_re,
	p_percent_discount,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning iddestiny_sample_recep into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_sample_recep_Update(int4,int8,bool,bool,bool,bool,bool,bool,bool,bool,numeric,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_destiny_sample_recep_Update
(
	p_iddestiny_sample_recep int4,
	p_idrecep_sample int8 = null,
	p_return_after_a_cs bool = null,
	p_return_after_a_re bool = null,
	p_return_after_t_cs bool = null,
	p_return_after_t_re bool = null,
	p_discard_after_t_cs bool = null,
	p_discard_after_t_re bool = null,
	p_charge_after_t_cs bool = null,
	p_charge_after_t_re bool = null,
	p_percent_discount numeric = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.destiny_sample_recep
SET
	idrecep_sample = p_idrecep_sample,
	return_after_a_cs = p_return_after_a_cs,
	return_after_a_re = p_return_after_a_re,
	return_after_t_cs = p_return_after_t_cs,
	return_after_t_re = p_return_after_t_re,
	discard_after_t_cs = p_discard_after_t_cs,
	discard_after_t_re = p_discard_after_t_re,
	charge_after_t_cs = p_charge_after_t_cs,
	charge_after_t_re = p_charge_after_t_re,
	percent_discount = p_percent_discount,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	iddestiny_sample_recep = p_iddestiny_sample_recep;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_sample_recep_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_destiny_sample_recep_SelectByPrimaryKey
(
	p_iddestiny_sample_recep int4
) returns TABLE ("Iddestiny_sample_recep" int4, "Idrecep_sample" int8, "Return_after_a_cs" bool, "Return_after_a_re" bool, "Return_after_t_cs" bool, "Return_after_t_re" bool, "Discard_after_t_cs" bool, "Discard_after_t_re" bool, "Charge_after_t_cs" bool, "Charge_after_t_re" bool, "Percent_discount" numeric, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.destiny_sample_recep
	WHERE 
			iddestiny_sample_recep = p_iddestiny_sample_recep;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_sample_recep_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_destiny_sample_recep_SelectAll()
 returns TABLE ("Iddestiny_sample_recep" int4, "Idrecep_sample" int8, "Return_after_a_cs" bool, "Return_after_a_re" bool, "Return_after_t_cs" bool, "Return_after_t_re" bool, "Discard_after_t_cs" bool, "Discard_after_t_re" bool, "Charge_after_t_cs" bool, "Charge_after_t_re" bool, "Percent_discount" numeric, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.destiny_sample_recep;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_sample_recep_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_destiny_sample_recep_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (iddestiny_sample_recep int4, idrecep_sample int8, return_after_a_cs bool, return_after_a_re bool, return_after_t_cs bool, return_after_t_re bool, discard_after_t_cs bool, discard_after_t_re bool, charge_after_t_cs bool, charge_after_t_re bool, percent_discount numeric, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.destiny_sample_recep WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_sample_recep_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_destiny_sample_recep_DeleteByPrimaryKey
(
	p_iddestiny_sample_recep int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.destiny_sample_recep
 WHERE 
	iddestiny_sample_recep = p_iddestiny_sample_recep; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_destiny_sample_recep_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_destiny_sample_recep_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.destiny_sample_recep WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_detail_Insert(int2,int2,int2,varchar,varchar,numeric,numeric,int2,varchar,numeric,numeric,bool,varchar,varchar,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_mr_detail_Insert
(
	p_idmr_detail int2 ,
	p_idmr int2 = null ,
	p_analyte int2 = null ,
	p_cod_element varchar(10) = null ,
	p_nom_detail varchar(10) = null ,
	p_incertitude numeric = null ,
	p_nominal_value numeric = null ,
	p_idunit1 int2 = null ,
	p_document_ref varchar(1000) = null ,
	p_dev numeric = null ,
	p_dev_labs numeric = null ,
	p_flag_provitional bool = null ,
	p_cod_digestion_method varchar(5) = null ,
	p_observation varchar(100) = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.mr_detail
(
	idmr,
	analyte,
	cod_element,
	nom_detail,
	incertitude,
	nominal_value,
	idunit1,
	document_ref,
	dev,
	dev_labs,
	flag_provitional,
	cod_digestion_method,
	observation,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idmr,
	p_analyte,
	p_cod_element,
	p_nom_detail,
	p_incertitude,
	p_nominal_value,
	p_idunit1,
	p_document_ref,
	p_dev,
	p_dev_labs,
	p_flag_provitional,
	p_cod_digestion_method,
	p_observation,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idmr_detail into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_detail_Update(int2,int2,int2,varchar,varchar,numeric,numeric,int2,varchar,numeric,numeric,bool,varchar,varchar,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_mr_detail_Update
(
	p_idmr_detail int2,
	p_idmr int2 = null,
	p_analyte int2 = null,
	p_cod_element varchar(10) = null,
	p_nom_detail varchar(10) = null,
	p_incertitude numeric = null,
	p_nominal_value numeric = null,
	p_idunit1 int2 = null,
	p_document_ref varchar(1000) = null,
	p_dev numeric = null,
	p_dev_labs numeric = null,
	p_flag_provitional bool = null,
	p_cod_digestion_method varchar(5) = null,
	p_observation varchar(100) = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.mr_detail
SET
	idmr = p_idmr,
	analyte = p_analyte,
	cod_element = p_cod_element,
	nom_detail = p_nom_detail,
	incertitude = p_incertitude,
	nominal_value = p_nominal_value,
	idunit1 = p_idunit1,
	document_ref = p_document_ref,
	dev = p_dev,
	dev_labs = p_dev_labs,
	flag_provitional = p_flag_provitional,
	cod_digestion_method = p_cod_digestion_method,
	observation = p_observation,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idmr_detail = p_idmr_detail;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_detail_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_mr_detail_SelectByPrimaryKey
(
	p_idmr_detail int2
) returns TABLE ("Idmr_detail" int2, "Idmr" int2, "Analyte" int2, "Cod_element" varchar, "Nom_detail" varchar, "Incertitude" numeric, "Nominal_value" numeric, "Idunit1" int2, "Document_ref" varchar, "Dev" numeric, "Dev_labs" numeric, "Flag_provitional" bool, "Cod_digestion_method" varchar, "Observation" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.mr_detail
	WHERE 
			idmr_detail = p_idmr_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_detail_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_mr_detail_SelectAll()
 returns TABLE ("Idmr_detail" int2, "Idmr" int2, "Analyte" int2, "Cod_element" varchar, "Nom_detail" varchar, "Incertitude" numeric, "Nominal_value" numeric, "Idunit1" int2, "Document_ref" varchar, "Dev" numeric, "Dev_labs" numeric, "Flag_provitional" bool, "Cod_digestion_method" varchar, "Observation" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.mr_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_detail_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_mr_detail_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idmr_detail int2, idmr int2, analyte int2, cod_element varchar, nom_detail varchar, incertitude numeric, nominal_value numeric, idunit1 int2, document_ref varchar, dev numeric, dev_labs numeric, flag_provitional bool, cod_digestion_method varchar, observation varchar, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.mr_detail WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_detail_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_mr_detail_DeleteByPrimaryKey
(
	p_idmr_detail int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.mr_detail
 WHERE 
	idmr_detail = p_idmr_detail; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_detail_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_mr_detail_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.mr_detail WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_correlative_Insert(varchar,varchar,varchar,int4,bool,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_correlative_Insert
(
	p_cod_type_sample varchar(5) ,
	p_cod_serie varchar(10) = null ,
	p_prefix varchar(10) = null ,
	p_correlative int4 = null ,
	p_mreach15 bool = null ,
	p_num_digits int2 = null ,
	p_usernew varchar(50) = null ,
	p_datenew date = null ,
	p_useredit varchar(50) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.correlative
(
	cod_type_sample,
	cod_serie,
	prefix,
	correlative,
	mreach15,
	num_digits,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_cod_type_sample,
	p_cod_serie,
	p_prefix,
	p_correlative,
	p_mreach15,
	p_num_digits,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_correlative_Update(varchar,varchar,varchar,int4,bool,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_correlative_Update
(
	p_cod_type_sample varchar(5),
	p_cod_serie varchar(10) = null,
	p_prefix varchar(10) = null,
	p_correlative int4 = null,
	p_mreach15 bool = null,
	p_num_digits int2 = null,
	p_usernew varchar(50) = null,
	p_datenew date = null,
	p_useredit varchar(50) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.correlative
SET
	cod_type_sample = p_cod_type_sample,
	cod_serie = p_cod_serie,
	prefix = p_prefix,
	correlative = p_correlative,
	mreach15 = p_mreach15,
	num_digits = p_num_digits,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	cod_type_sample = p_cod_type_sample;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_correlative_SelectByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_correlative_SelectByPrimaryKey
(
	p_cod_type_sample varchar(5)
) returns TABLE ("Cod_type_sample" varchar, "Cod_serie" varchar, "Prefix" varchar, "Correlative" int4, "Mreach15" bool, "Num_digits" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.correlative
	WHERE 
			cod_type_sample = p_cod_type_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_correlative_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_correlative_SelectAll()
 returns TABLE ("Cod_type_sample" varchar, "Cod_serie" varchar, "Prefix" varchar, "Correlative" int4, "Mreach15" bool, "Num_digits" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.correlative;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_correlative_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_correlative_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (cod_type_sample varchar, cod_serie varchar, prefix varchar, correlative int4, mreach15 bool, num_digits int2, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.correlative WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_correlative_DeleteByPrimaryKey(varchar);
CREATE OR REPLACE FUNCTION public.sp_correlative_DeleteByPrimaryKey
(
	p_cod_type_sample varchar(5)
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.correlative
 WHERE 
	cod_type_sample = p_cod_type_sample; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_correlative_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_correlative_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.correlative WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_jar_Insert(int2,int2,int2,varchar,varchar,date,date,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_mr_jar_Insert
(
	p_idmr_jar int2 ,
	p_idmr int2 = null ,
	p_idcorrelative int2 = null ,
	p_description varchar(20) = null ,
	p_observation varchar(100) = null ,
	p_fbegin date = null ,
	p_fend date = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.mr_jar
(
	idmr,
	idcorrelative,
	description,
	observation,
	fbegin,
	fend,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idmr,
	p_idcorrelative,
	p_description,
	p_observation,
	p_fbegin,
	p_fend,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idmr_jar into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_jar_Update(int2,int2,int2,varchar,varchar,date,date,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_mr_jar_Update
(
	p_idmr_jar int2,
	p_idmr int2 = null,
	p_idcorrelative int2 = null,
	p_description varchar(20) = null,
	p_observation varchar(100) = null,
	p_fbegin date = null,
	p_fend date = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.mr_jar
SET
	idmr = p_idmr,
	idcorrelative = p_idcorrelative,
	description = p_description,
	observation = p_observation,
	fbegin = p_fbegin,
	fend = p_fend,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idmr_jar = p_idmr_jar;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_jar_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_mr_jar_SelectByPrimaryKey
(
	p_idmr_jar int2
) returns TABLE ("Idmr_jar" int2, "Idmr" int2, "Idcorrelative" int2, "Description" varchar, "Observation" varchar, "Fbegin" date, "Fend" date, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.mr_jar
	WHERE 
			idmr_jar = p_idmr_jar;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_jar_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_mr_jar_SelectAll()
 returns TABLE ("Idmr_jar" int2, "Idmr" int2, "Idcorrelative" int2, "Description" varchar, "Observation" varchar, "Fbegin" date, "Fend" date, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.mr_jar;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_jar_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_mr_jar_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idmr_jar int2, idmr int2, idcorrelative int2, description varchar, observation varchar, fbegin date, fend date, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.mr_jar WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_jar_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_mr_jar_DeleteByPrimaryKey
(
	p_idmr_jar int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.mr_jar
 WHERE 
	idmr_jar = p_idmr_jar; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_mr_jar_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_mr_jar_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.mr_jar WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_Insert(int4,varchar,int2,int2,int2,int2,int2,int2,int4);
CREATE OR REPLACE FUNCTION public.sp_price_Insert
(
	p_idprice int4 ,
	p_cod_price varchar(20) = null ,
	p_dispatch_person int2 = null ,
	p_dispatch_mail int2 = null ,
	p_dispatch_curier int2 = null ,
	p_dispatch_transport int2 = null ,
	p_dispatch_fax int2 = null ,
	p_dispatch_otro int2 = null ,
	p_request_reference int4 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.price
(
	cod_price,
	dispatch_person,
	dispatch_mail,
	dispatch_curier,
	dispatch_transport,
	dispatch_fax,
	dispatch_otro,
	request_reference

)
VALUES
(
	p_cod_price,
	p_dispatch_person,
	p_dispatch_mail,
	p_dispatch_curier,
	p_dispatch_transport,
	p_dispatch_fax,
	p_dispatch_otro,
	p_request_reference

)returning idprice into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_Update(int4,varchar,int2,int2,int2,int2,int2,int2,int4);
CREATE OR REPLACE FUNCTION public.sp_price_Update
(
	p_idprice int4,
	p_cod_price varchar(20) = null,
	p_dispatch_person int2 = null,
	p_dispatch_mail int2 = null,
	p_dispatch_curier int2 = null,
	p_dispatch_transport int2 = null,
	p_dispatch_fax int2 = null,
	p_dispatch_otro int2 = null,
	p_request_reference int4 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.price
SET
	cod_price = p_cod_price,
	dispatch_person = p_dispatch_person,
	dispatch_mail = p_dispatch_mail,
	dispatch_curier = p_dispatch_curier,
	dispatch_transport = p_dispatch_transport,
	dispatch_fax = p_dispatch_fax,
	dispatch_otro = p_dispatch_otro,
	request_reference = p_request_reference
 WHERE 
	idprice = p_idprice;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_price_SelectByPrimaryKey
(
	p_idprice int4
) returns TABLE ("Idprice" int4, "Cod_price" varchar, "Dispatch_person" int2, "Dispatch_mail" int2, "Dispatch_curier" int2, "Dispatch_transport" int2, "Dispatch_fax" int2, "Dispatch_otro" int2, "Request_reference" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.price
	WHERE 
			idprice = p_idprice;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_price_SelectAll()
 returns TABLE ("Idprice" int4, "Cod_price" varchar, "Dispatch_person" int2, "Dispatch_mail" int2, "Dispatch_curier" int2, "Dispatch_transport" int2, "Dispatch_fax" int2, "Dispatch_otro" int2, "Request_reference" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.price;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idprice int4, cod_price varchar, dispatch_person int2, dispatch_mail int2, dispatch_curier int2, dispatch_transport int2, dispatch_fax int2, dispatch_otro int2, request_reference int4
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.price WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_price_DeleteByPrimaryKey
(
	p_idprice int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.price
 WHERE 
	idprice = p_idprice; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.price WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_detail_aa_twofold_Insert(int8,int2,int4,int8,int8,int8,varchar,int2,varchar,int8,int2,int4,numeric,varchar,numeric,varchar,varchar,numeric,bpchar,numeric,varchar,numeric,varchar,varchar,numeric,bpchar,numeric,bool,numeric,bool,int8,numeric,numeric,bpchar,int2,int2,varchar,date,varchar,date,int2,bool,varchar,numeric,numeric,int2,int4,int4,int4,int4,varchar,bool,int4,varchar,bool,int4,int4,int4,int4);
CREATE OR REPLACE FUNCTION public.sp_batch_detail_aa_twofold_Insert
(
	p_idbatch_detail_aa int8 ,
	p_num_repetition int2 = null ,
	p_idtemplate_method int4 = null ,
	p_idrecep_sample int8 = null ,
	p_idrecep_sample_detail_elem int8 = null ,
	p_idrecep_sample_detail int8 = null ,
	p_cod_des_sample varchar(5) = null ,
	p_order_des_sample int2 = null ,
	p_cod_sample varchar(12) = null ,
	p_cod_interno int8 = null ,
	p_order_sample_batch int2 = null ,
	p_flag_mri int4 = null ,
	p_weight1 numeric = null ,
	p_reading1 varchar(10) = null ,
	p_volumen1 numeric = null ,
	p_factor1 varchar(10) = null ,
	p_law1 varchar(10) = null ,
	p_law1_long numeric = null ,
	p_sample_mr_blk1 bpchar = null ,
	p_weight2 numeric = null ,
	p_reading2 varchar(10) = null ,
	p_volumen2 numeric = null ,
	p_factor2 varchar(10) = null ,
	p_law2 varchar(10) = null ,
	p_law2_long numeric = null ,
	p_sample_mr_blk2 bpchar = null ,
	p_dilu2 numeric = null ,
	p_flag_dilu2 bool = null ,
	p_dilu3 numeric = null ,
	p_flag_dilu3 bool = null ,
	p_idbatch int8 = null ,
	p_verify_equip numeric = null ,
	p_verify_curve numeric = null ,
	p_idtype_rep bpchar = null ,
	p_idmr_detail int2 = null ,
	p_idmr_jar int2 = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_idequipment1 int2 = null ,
	p_status bool = null ,
	p_str_result_analysis varchar(15) = null ,
	p_result_analysis numeric = null ,
	p_fum numeric = null ,
	p_idunit_result int2 = null ,
	p_qaqc_status_result int4 = null ,
	p_qaqc_blk int4 = null ,
	p_qaqc_par int4 = null ,
	p_qaqc_mr int4 = null ,
	p_qaqc_approve_text varchar(200) = null ,
	p_qaqc_approve bool = null ,
	p_qaqc_error int4 = null ,
	p_qaqc_review_text varchar(200) = null ,
	p_qaqc_review bool = null ,
	p_qaqc_par_prev_batch int4 = null ,
	p_qaqc_tmp_retest_idmethod int4 = null ,
	p_qaqc_tmp_retest int4 = null ,
	p_qaqc_has_retest int4 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.batch_detail_aa_twofold
(
	num_repetition,
	idtemplate_method,
	idrecep_sample,
	idrecep_sample_detail_elem,
	idrecep_sample_detail,
	cod_des_sample,
	order_des_sample,
	cod_sample,
	cod_interno,
	order_sample_batch,
	flag_mri,
	weight1,
	reading1,
	volumen1,
	factor1,
	law1,
	law1_long,
	sample_mr_blk1,
	weight2,
	reading2,
	volumen2,
	factor2,
	law2,
	law2_long,
	sample_mr_blk2,
	dilu2,
	flag_dilu2,
	dilu3,
	flag_dilu3,
	idbatch,
	verify_equip,
	verify_curve,
	idtype_rep,
	idmr_detail,
	idmr_jar,
	usernew,
	datenew,
	useredit,
	dateedit,
	idequipment1,
	status,
	str_result_analysis,
	result_analysis,
	fum,
	idunit_result,
	qaqc_status_result,
	qaqc_blk,
	qaqc_par,
	qaqc_mr,
	qaqc_approve_text,
	qaqc_approve,
	qaqc_error,
	qaqc_review_text,
	qaqc_review,
	qaqc_par_prev_batch,
	qaqc_tmp_retest_idmethod,
	qaqc_tmp_retest,
	qaqc_has_retest

)
VALUES
(
	p_num_repetition,
	p_idtemplate_method,
	p_idrecep_sample,
	p_idrecep_sample_detail_elem,
	p_idrecep_sample_detail,
	p_cod_des_sample,
	p_order_des_sample,
	p_cod_sample,
	p_cod_interno,
	p_order_sample_batch,
	p_flag_mri,
	p_weight1,
	p_reading1,
	p_volumen1,
	p_factor1,
	p_law1,
	p_law1_long,
	p_sample_mr_blk1,
	p_weight2,
	p_reading2,
	p_volumen2,
	p_factor2,
	p_law2,
	p_law2_long,
	p_sample_mr_blk2,
	p_dilu2,
	p_flag_dilu2,
	p_dilu3,
	p_flag_dilu3,
	p_idbatch,
	p_verify_equip,
	p_verify_curve,
	p_idtype_rep,
	p_idmr_detail,
	p_idmr_jar,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_idequipment1,
	p_status,
	p_str_result_analysis,
	p_result_analysis,
	p_fum,
	p_idunit_result,
	p_qaqc_status_result,
	p_qaqc_blk,
	p_qaqc_par,
	p_qaqc_mr,
	p_qaqc_approve_text,
	p_qaqc_approve,
	p_qaqc_error,
	p_qaqc_review_text,
	p_qaqc_review,
	p_qaqc_par_prev_batch,
	p_qaqc_tmp_retest_idmethod,
	p_qaqc_tmp_retest,
	p_qaqc_has_retest

)returning idbatch_detail_aa into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_detail_aa_twofold_Update(int8,int2,int4,int8,int8,int8,varchar,int2,varchar,int8,int2,int4,numeric,varchar,numeric,varchar,varchar,numeric,bpchar,numeric,varchar,numeric,varchar,varchar,numeric,bpchar,numeric,bool,numeric,bool,int8,numeric,numeric,bpchar,int2,int2,varchar,date,varchar,date,int2,bool,varchar,numeric,numeric,int2,int4,int4,int4,int4,varchar,bool,int4,varchar,bool,int4,int4,int4,int4);
CREATE OR REPLACE FUNCTION public.sp_batch_detail_aa_twofold_Update
(
	p_idbatch_detail_aa int8,
	p_num_repetition int2 = null,
	p_idtemplate_method int4 = null,
	p_idrecep_sample int8 = null,
	p_idrecep_sample_detail_elem int8 = null,
	p_idrecep_sample_detail int8 = null,
	p_cod_des_sample varchar(5) = null,
	p_order_des_sample int2 = null,
	p_cod_sample varchar(12) = null,
	p_cod_interno int8 = null,
	p_order_sample_batch int2 = null,
	p_flag_mri int4 = null,
	p_weight1 numeric = null,
	p_reading1 varchar(10) = null,
	p_volumen1 numeric = null,
	p_factor1 varchar(10) = null,
	p_law1 varchar(10) = null,
	p_law1_long numeric = null,
	p_sample_mr_blk1 bpchar = null,
	p_weight2 numeric = null,
	p_reading2 varchar(10) = null,
	p_volumen2 numeric = null,
	p_factor2 varchar(10) = null,
	p_law2 varchar(10) = null,
	p_law2_long numeric = null,
	p_sample_mr_blk2 bpchar = null,
	p_dilu2 numeric = null,
	p_flag_dilu2 bool = null,
	p_dilu3 numeric = null,
	p_flag_dilu3 bool = null,
	p_idbatch int8 = null,
	p_verify_equip numeric = null,
	p_verify_curve numeric = null,
	p_idtype_rep bpchar = null,
	p_idmr_detail int2 = null,
	p_idmr_jar int2 = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_idequipment1 int2 = null,
	p_status bool = null,
	p_str_result_analysis varchar(15) = null,
	p_result_analysis numeric = null,
	p_fum numeric = null,
	p_idunit_result int2 = null,
	p_qaqc_status_result int4 = null,
	p_qaqc_blk int4 = null,
	p_qaqc_par int4 = null,
	p_qaqc_mr int4 = null,
	p_qaqc_approve_text varchar(200) = null,
	p_qaqc_approve bool = null,
	p_qaqc_error int4 = null,
	p_qaqc_review_text varchar(200) = null,
	p_qaqc_review bool = null,
	p_qaqc_par_prev_batch int4 = null,
	p_qaqc_tmp_retest_idmethod int4 = null,
	p_qaqc_tmp_retest int4 = null,
	p_qaqc_has_retest int4 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.batch_detail_aa_twofold
SET
	num_repetition = p_num_repetition,
	idtemplate_method = p_idtemplate_method,
	idrecep_sample = p_idrecep_sample,
	idrecep_sample_detail_elem = p_idrecep_sample_detail_elem,
	idrecep_sample_detail = p_idrecep_sample_detail,
	cod_des_sample = p_cod_des_sample,
	order_des_sample = p_order_des_sample,
	cod_sample = p_cod_sample,
	cod_interno = p_cod_interno,
	order_sample_batch = p_order_sample_batch,
	flag_mri = p_flag_mri,
	weight1 = p_weight1,
	reading1 = p_reading1,
	volumen1 = p_volumen1,
	factor1 = p_factor1,
	law1 = p_law1,
	law1_long = p_law1_long,
	sample_mr_blk1 = p_sample_mr_blk1,
	weight2 = p_weight2,
	reading2 = p_reading2,
	volumen2 = p_volumen2,
	factor2 = p_factor2,
	law2 = p_law2,
	law2_long = p_law2_long,
	sample_mr_blk2 = p_sample_mr_blk2,
	dilu2 = p_dilu2,
	flag_dilu2 = p_flag_dilu2,
	dilu3 = p_dilu3,
	flag_dilu3 = p_flag_dilu3,
	idbatch = p_idbatch,
	verify_equip = p_verify_equip,
	verify_curve = p_verify_curve,
	idtype_rep = p_idtype_rep,
	idmr_detail = p_idmr_detail,
	idmr_jar = p_idmr_jar,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	idequipment1 = p_idequipment1,
	status = p_status,
	str_result_analysis = p_str_result_analysis,
	result_analysis = p_result_analysis,
	fum = p_fum,
	idunit_result = p_idunit_result,
	qaqc_status_result = p_qaqc_status_result,
	qaqc_blk = p_qaqc_blk,
	qaqc_par = p_qaqc_par,
	qaqc_mr = p_qaqc_mr,
	qaqc_approve_text = p_qaqc_approve_text,
	qaqc_approve = p_qaqc_approve,
	qaqc_error = p_qaqc_error,
	qaqc_review_text = p_qaqc_review_text,
	qaqc_review = p_qaqc_review,
	qaqc_par_prev_batch = p_qaqc_par_prev_batch,
	qaqc_tmp_retest_idmethod = p_qaqc_tmp_retest_idmethod,
	qaqc_tmp_retest = p_qaqc_tmp_retest,
	qaqc_has_retest = p_qaqc_has_retest
 WHERE 
	idbatch_detail_aa = p_idbatch_detail_aa;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_detail_aa_twofold_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_batch_detail_aa_twofold_SelectByPrimaryKey
(
	p_idbatch_detail_aa int8
) returns TABLE ("Idbatch_detail_aa" int8, "Num_repetition" int2, "Idtemplate_method" int4, "Idrecep_sample" int8, "Idrecep_sample_detail_elem" int8, "Idrecep_sample_detail" int8, "Cod_des_sample" varchar, "Order_des_sample" int2, "Cod_sample" varchar, "Cod_interno" int8, "Order_sample_batch" int2, "Flag_mri" int4, "Weight1" numeric, "Reading1" varchar, "Volumen1" numeric, "Factor1" varchar, "Law1" varchar, "Law1_long" numeric, "Sample_mr_blk1" bpchar, "Weight2" numeric, "Reading2" varchar, "Volumen2" numeric, "Factor2" varchar, "Law2" varchar, "Law2_long" numeric, "Sample_mr_blk2" bpchar, "Dilu2" numeric, "Flag_dilu2" bool, "Dilu3" numeric, "Flag_dilu3" bool, "Idbatch" int8, "Verify_equip" numeric, "Verify_curve" numeric, "Idtype_rep" bpchar, "Idmr_detail" int2, "Idmr_jar" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Idequipment1" int2, "Status" bool, "Str_result_analysis" varchar, "Result_analysis" numeric, "Fum" numeric, "Idunit_result" int2, "Qaqc_status_result" int4, "Qaqc_blk" int4, "Qaqc_par" int4, "Qaqc_mr" int4, "Qaqc_approve_text" varchar, "Qaqc_approve" bool, "Qaqc_error" int4, "Qaqc_review_text" varchar, "Qaqc_review" bool, "Qaqc_par_prev_batch" int4, "Qaqc_tmp_retest_idmethod" int4, "Qaqc_tmp_retest" int4, "Qaqc_has_retest" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.batch_detail_aa_twofold
	WHERE 
			idbatch_detail_aa = p_idbatch_detail_aa;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_detail_aa_twofold_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_batch_detail_aa_twofold_SelectAll()
 returns TABLE ("Idbatch_detail_aa" int8, "Num_repetition" int2, "Idtemplate_method" int4, "Idrecep_sample" int8, "Idrecep_sample_detail_elem" int8, "Idrecep_sample_detail" int8, "Cod_des_sample" varchar, "Order_des_sample" int2, "Cod_sample" varchar, "Cod_interno" int8, "Order_sample_batch" int2, "Flag_mri" int4, "Weight1" numeric, "Reading1" varchar, "Volumen1" numeric, "Factor1" varchar, "Law1" varchar, "Law1_long" numeric, "Sample_mr_blk1" bpchar, "Weight2" numeric, "Reading2" varchar, "Volumen2" numeric, "Factor2" varchar, "Law2" varchar, "Law2_long" numeric, "Sample_mr_blk2" bpchar, "Dilu2" numeric, "Flag_dilu2" bool, "Dilu3" numeric, "Flag_dilu3" bool, "Idbatch" int8, "Verify_equip" numeric, "Verify_curve" numeric, "Idtype_rep" bpchar, "Idmr_detail" int2, "Idmr_jar" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Idequipment1" int2, "Status" bool, "Str_result_analysis" varchar, "Result_analysis" numeric, "Fum" numeric, "Idunit_result" int2, "Qaqc_status_result" int4, "Qaqc_blk" int4, "Qaqc_par" int4, "Qaqc_mr" int4, "Qaqc_approve_text" varchar, "Qaqc_approve" bool, "Qaqc_error" int4, "Qaqc_review_text" varchar, "Qaqc_review" bool, "Qaqc_par_prev_batch" int4, "Qaqc_tmp_retest_idmethod" int4, "Qaqc_tmp_retest" int4, "Qaqc_has_retest" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.batch_detail_aa_twofold;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_detail_aa_twofold_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_batch_detail_aa_twofold_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idbatch_detail_aa int8, num_repetition int2, idtemplate_method int4, idrecep_sample int8, idrecep_sample_detail_elem int8, idrecep_sample_detail int8, cod_des_sample varchar, order_des_sample int2, cod_sample varchar, cod_interno int8, order_sample_batch int2, flag_mri int4, weight1 numeric, reading1 varchar, volumen1 numeric, factor1 varchar, law1 varchar, law1_long numeric, sample_mr_blk1 bpchar, weight2 numeric, reading2 varchar, volumen2 numeric, factor2 varchar, law2 varchar, law2_long numeric, sample_mr_blk2 bpchar, dilu2 numeric, flag_dilu2 bool, dilu3 numeric, flag_dilu3 bool, idbatch int8, verify_equip numeric, verify_curve numeric, idtype_rep bpchar, idmr_detail int2, idmr_jar int2, usernew varchar, datenew date, useredit varchar, dateedit date, idequipment1 int2, status bool, str_result_analysis varchar, result_analysis numeric, fum numeric, idunit_result int2, qaqc_status_result int4, qaqc_blk int4, qaqc_par int4, qaqc_mr int4, qaqc_approve_text varchar, qaqc_approve bool, qaqc_error int4, qaqc_review_text varchar, qaqc_review bool, qaqc_par_prev_batch int4, qaqc_tmp_retest_idmethod int4, qaqc_tmp_retest int4, qaqc_has_retest int4
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.batch_detail_aa_twofold WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_detail_aa_twofold_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_batch_detail_aa_twofold_DeleteByPrimaryKey
(
	p_idbatch_detail_aa int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.batch_detail_aa_twofold
 WHERE 
	idbatch_detail_aa = p_idbatch_detail_aa; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_batch_detail_aa_twofold_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_batch_detail_aa_twofold_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.batch_detail_aa_twofold WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_aa_Insert(int4,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,varchar,numeric,numeric,int2,numeric,numeric,numeric,numeric,numeric,int2,int2,numeric,numeric,numeric,varchar,date,varchar,date,bool,date,int2,numeric,int4,numeric,int4,numeric,int2,int4,bool,numeric,bool,timestamp,timestamp,int4,int4,bool,bool,numeric,numeric,numeric,int2,bool,timestamp,timestamp,numeric,numeric,numeric,int2,int2,int2,int2);
CREATE OR REPLACE FUNCTION public.sp_template_method_aa_Insert
(
	p_idtemplate_method int4 ,
	p_weight numeric = null ,
	p_weight_incertitude numeric = null ,
	p_volumen numeric = null ,
	p_reading_min numeric = null ,
	p_reading_max numeric = null ,
	p_dilution2 numeric = null ,
	p_dilution3 numeric = null ,
	p_reason_rep numeric = null ,
	p_error_allowed numeric = null ,
	p_symbol varchar(10) = null ,
	p_law_limit_bottom numeric = null ,
	p_law_limit_top numeric = null ,
	p_idunit_calib int2 = null ,
	p_absorvance numeric = null ,
	p_abs_incertitude numeric = null ,
	p_std_verif numeric = null ,
	p_std_verif_incertitude numeric = null ,
	p_wave_long numeric = null ,
	p_num_decimal int2 = null ,
	p_idmr_detail int2 = null ,
	p_mr_incertitude numeric = null ,
	p_blk_max numeric = null ,
	p_reproducibility numeric = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null ,
	p_date_allowed_error date = null ,
	p_mrorpattern int2 = null ,
	p_rexp2 numeric = null ,
	p_medium int4 = null ,
	p_medium_conc numeric = null ,
	p_modif int4 = null ,
	p_modif_conc numeric = null ,
	p_validity_calib int2 = null ,
	p_type_pattern int4 = null ,
	p_flag_sol_intermedia bool = null ,
	p_sol_concentration numeric = null ,
	p_sol_status bool = null ,
	p_sol_date_preparation timestamp = null ,
	p_sol_date_expiration timestamp = null ,
	p_std_mrorpattern int4 = null ,
	p_std_type_pattern int4 = null ,
	p_std_flag_sol_intermedia1 bool = null ,
	p_std_flag_sol_intermedia2 bool = null ,
	p_std_concentration numeric = null ,
	p_std_concentration_sol1 numeric = null ,
	p_std_concentration_sol2 numeric = null ,
	p_std_validity int2 = null ,
	p_std_status bool = null ,
	p_std_date_preparation timestamp = null ,
	p_std_date_expiration timestamp = null ,
	p_std_sol1_medium numeric = null ,
	p_std_sol2_medium numeric = null ,
	p_std_stdverif_medium numeric = null ,
	p_idunit_result int2 = null ,
	p_num_samples int2 = null ,
	p_num_days int2 = null ,
	p_limit_samples int2 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.template_method_aa
(
	idtemplate_method,
	weight,
	weight_incertitude,
	volumen,
	reading_min,
	reading_max,
	dilution2,
	dilution3,
	reason_rep,
	error_allowed,
	symbol,
	law_limit_bottom,
	law_limit_top,
	idunit_calib,
	absorvance,
	abs_incertitude,
	std_verif,
	std_verif_incertitude,
	wave_long,
	num_decimal,
	idmr_detail,
	mr_incertitude,
	blk_max,
	reproducibility,
	usernew,
	datenew,
	useredit,
	dateedit,
	status,
	date_allowed_error,
	mrorpattern,
	rexp2,
	medium,
	medium_conc,
	modif,
	modif_conc,
	validity_calib,
	type_pattern,
	flag_sol_intermedia,
	sol_concentration,
	sol_status,
	sol_date_preparation,
	sol_date_expiration,
	std_mrorpattern,
	std_type_pattern,
	std_flag_sol_intermedia1,
	std_flag_sol_intermedia2,
	std_concentration,
	std_concentration_sol1,
	std_concentration_sol2,
	std_validity,
	std_status,
	std_date_preparation,
	std_date_expiration,
	std_sol1_medium,
	std_sol2_medium,
	std_stdverif_medium,
	idunit_result,
	num_samples,
	num_days,
	limit_samples

)
VALUES
(
	p_idtemplate_method,
	p_weight,
	p_weight_incertitude,
	p_volumen,
	p_reading_min,
	p_reading_max,
	p_dilution2,
	p_dilution3,
	p_reason_rep,
	p_error_allowed,
	p_symbol,
	p_law_limit_bottom,
	p_law_limit_top,
	p_idunit_calib,
	p_absorvance,
	p_abs_incertitude,
	p_std_verif,
	p_std_verif_incertitude,
	p_wave_long,
	p_num_decimal,
	p_idmr_detail,
	p_mr_incertitude,
	p_blk_max,
	p_reproducibility,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status,
	p_date_allowed_error,
	p_mrorpattern,
	p_rexp2,
	p_medium,
	p_medium_conc,
	p_modif,
	p_modif_conc,
	p_validity_calib,
	p_type_pattern,
	p_flag_sol_intermedia,
	p_sol_concentration,
	p_sol_status,
	p_sol_date_preparation,
	p_sol_date_expiration,
	p_std_mrorpattern,
	p_std_type_pattern,
	p_std_flag_sol_intermedia1,
	p_std_flag_sol_intermedia2,
	p_std_concentration,
	p_std_concentration_sol1,
	p_std_concentration_sol2,
	p_std_validity,
	p_std_status,
	p_std_date_preparation,
	p_std_date_expiration,
	p_std_sol1_medium,
	p_std_sol2_medium,
	p_std_stdverif_medium,
	p_idunit_result,
	p_num_samples,
	p_num_days,
	p_limit_samples

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_aa_Update(int4,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,varchar,numeric,numeric,int2,numeric,numeric,numeric,numeric,numeric,int2,int2,numeric,numeric,numeric,varchar,date,varchar,date,bool,date,int2,numeric,int4,numeric,int4,numeric,int2,int4,bool,numeric,bool,timestamp,timestamp,int4,int4,bool,bool,numeric,numeric,numeric,int2,bool,timestamp,timestamp,numeric,numeric,numeric,int2,int2,int2,int2);
CREATE OR REPLACE FUNCTION public.sp_template_method_aa_Update
(
	p_idtemplate_method int4,
	p_weight numeric = null,
	p_weight_incertitude numeric = null,
	p_volumen numeric = null,
	p_reading_min numeric = null,
	p_reading_max numeric = null,
	p_dilution2 numeric = null,
	p_dilution3 numeric = null,
	p_reason_rep numeric = null,
	p_error_allowed numeric = null,
	p_symbol varchar(10) = null,
	p_law_limit_bottom numeric = null,
	p_law_limit_top numeric = null,
	p_idunit_calib int2 = null,
	p_absorvance numeric = null,
	p_abs_incertitude numeric = null,
	p_std_verif numeric = null,
	p_std_verif_incertitude numeric = null,
	p_wave_long numeric = null,
	p_num_decimal int2 = null,
	p_idmr_detail int2 = null,
	p_mr_incertitude numeric = null,
	p_blk_max numeric = null,
	p_reproducibility numeric = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null,
	p_date_allowed_error date = null,
	p_mrorpattern int2 = null,
	p_rexp2 numeric = null,
	p_medium int4 = null,
	p_medium_conc numeric = null,
	p_modif int4 = null,
	p_modif_conc numeric = null,
	p_validity_calib int2 = null,
	p_type_pattern int4 = null,
	p_flag_sol_intermedia bool = null,
	p_sol_concentration numeric = null,
	p_sol_status bool = null,
	p_sol_date_preparation timestamp = null,
	p_sol_date_expiration timestamp = null,
	p_std_mrorpattern int4 = null,
	p_std_type_pattern int4 = null,
	p_std_flag_sol_intermedia1 bool = null,
	p_std_flag_sol_intermedia2 bool = null,
	p_std_concentration numeric = null,
	p_std_concentration_sol1 numeric = null,
	p_std_concentration_sol2 numeric = null,
	p_std_validity int2 = null,
	p_std_status bool = null,
	p_std_date_preparation timestamp = null,
	p_std_date_expiration timestamp = null,
	p_std_sol1_medium numeric = null,
	p_std_sol2_medium numeric = null,
	p_std_stdverif_medium numeric = null,
	p_idunit_result int2 = null,
	p_num_samples int2 = null,
	p_num_days int2 = null,
	p_limit_samples int2 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.template_method_aa
SET
	idtemplate_method = p_idtemplate_method,
	weight = p_weight,
	weight_incertitude = p_weight_incertitude,
	volumen = p_volumen,
	reading_min = p_reading_min,
	reading_max = p_reading_max,
	dilution2 = p_dilution2,
	dilution3 = p_dilution3,
	reason_rep = p_reason_rep,
	error_allowed = p_error_allowed,
	symbol = p_symbol,
	law_limit_bottom = p_law_limit_bottom,
	law_limit_top = p_law_limit_top,
	idunit_calib = p_idunit_calib,
	absorvance = p_absorvance,
	abs_incertitude = p_abs_incertitude,
	std_verif = p_std_verif,
	std_verif_incertitude = p_std_verif_incertitude,
	wave_long = p_wave_long,
	num_decimal = p_num_decimal,
	idmr_detail = p_idmr_detail,
	mr_incertitude = p_mr_incertitude,
	blk_max = p_blk_max,
	reproducibility = p_reproducibility,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status,
	date_allowed_error = p_date_allowed_error,
	mrorpattern = p_mrorpattern,
	rexp2 = p_rexp2,
	medium = p_medium,
	medium_conc = p_medium_conc,
	modif = p_modif,
	modif_conc = p_modif_conc,
	validity_calib = p_validity_calib,
	type_pattern = p_type_pattern,
	flag_sol_intermedia = p_flag_sol_intermedia,
	sol_concentration = p_sol_concentration,
	sol_status = p_sol_status,
	sol_date_preparation = p_sol_date_preparation,
	sol_date_expiration = p_sol_date_expiration,
	std_mrorpattern = p_std_mrorpattern,
	std_type_pattern = p_std_type_pattern,
	std_flag_sol_intermedia1 = p_std_flag_sol_intermedia1,
	std_flag_sol_intermedia2 = p_std_flag_sol_intermedia2,
	std_concentration = p_std_concentration,
	std_concentration_sol1 = p_std_concentration_sol1,
	std_concentration_sol2 = p_std_concentration_sol2,
	std_validity = p_std_validity,
	std_status = p_std_status,
	std_date_preparation = p_std_date_preparation,
	std_date_expiration = p_std_date_expiration,
	std_sol1_medium = p_std_sol1_medium,
	std_sol2_medium = p_std_sol2_medium,
	std_stdverif_medium = p_std_stdverif_medium,
	idunit_result = p_idunit_result,
	num_samples = p_num_samples,
	num_days = p_num_days,
	limit_samples = p_limit_samples
 WHERE 
	idtemplate_method = p_idtemplate_method;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_aa_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_aa_SelectByPrimaryKey
(
	p_idtemplate_method int4
) returns TABLE ("Idtemplate_method" int4, "Weight" numeric, "Weight_incertitude" numeric, "Volumen" numeric, "Reading_min" numeric, "Reading_max" numeric, "Dilution2" numeric, "Dilution3" numeric, "Reason_rep" numeric, "Error_allowed" numeric, "Symbol" varchar, "Law_limit_bottom" numeric, "Law_limit_top" numeric, "Idunit_calib" int2, "Absorvance" numeric, "Abs_incertitude" numeric, "Std_verif" numeric, "Std_verif_incertitude" numeric, "Wave_long" numeric, "Num_decimal" int2, "Idmr_detail" int2, "Mr_incertitude" numeric, "Blk_max" numeric, "Reproducibility" numeric, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Date_allowed_error" date, "Mrorpattern" int2, "Rexp2" numeric, "Medium" int4, "Medium_conc" numeric, "Modif" int4, "Modif_conc" numeric, "Validity_calib" int2, "Type_pattern" int4, "Flag_sol_intermedia" bool, "Sol_concentration" numeric, "Sol_status" bool, "Sol_date_preparation" timestamp, "Sol_date_expiration" timestamp, "Std_mrorpattern" int4, "Std_type_pattern" int4, "Std_flag_sol_intermedia1" bool, "Std_flag_sol_intermedia2" bool, "Std_concentration" numeric, "Std_concentration_sol1" numeric, "Std_concentration_sol2" numeric, "Std_validity" int2, "Std_status" bool, "Std_date_preparation" timestamp, "Std_date_expiration" timestamp, "Std_sol1_medium" numeric, "Std_sol2_medium" numeric, "Std_stdverif_medium" numeric, "Idunit_result" int2, "Num_samples" int2, "Num_days" int2, "Limit_samples" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_aa
	WHERE 
			idtemplate_method = p_idtemplate_method;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_aa_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_template_method_aa_SelectAll()
 returns TABLE ("Idtemplate_method" int4, "Weight" numeric, "Weight_incertitude" numeric, "Volumen" numeric, "Reading_min" numeric, "Reading_max" numeric, "Dilution2" numeric, "Dilution3" numeric, "Reason_rep" numeric, "Error_allowed" numeric, "Symbol" varchar, "Law_limit_bottom" numeric, "Law_limit_top" numeric, "Idunit_calib" int2, "Absorvance" numeric, "Abs_incertitude" numeric, "Std_verif" numeric, "Std_verif_incertitude" numeric, "Wave_long" numeric, "Num_decimal" int2, "Idmr_detail" int2, "Mr_incertitude" numeric, "Blk_max" numeric, "Reproducibility" numeric, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool, "Date_allowed_error" date, "Mrorpattern" int2, "Rexp2" numeric, "Medium" int4, "Medium_conc" numeric, "Modif" int4, "Modif_conc" numeric, "Validity_calib" int2, "Type_pattern" int4, "Flag_sol_intermedia" bool, "Sol_concentration" numeric, "Sol_status" bool, "Sol_date_preparation" timestamp, "Sol_date_expiration" timestamp, "Std_mrorpattern" int4, "Std_type_pattern" int4, "Std_flag_sol_intermedia1" bool, "Std_flag_sol_intermedia2" bool, "Std_concentration" numeric, "Std_concentration_sol1" numeric, "Std_concentration_sol2" numeric, "Std_validity" int2, "Std_status" bool, "Std_date_preparation" timestamp, "Std_date_expiration" timestamp, "Std_sol1_medium" numeric, "Std_sol2_medium" numeric, "Std_stdverif_medium" numeric, "Idunit_result" int2, "Num_samples" int2, "Num_days" int2, "Limit_samples" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_aa;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_aa_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_aa_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtemplate_method int4, weight numeric, weight_incertitude numeric, volumen numeric, reading_min numeric, reading_max numeric, dilution2 numeric, dilution3 numeric, reason_rep numeric, error_allowed numeric, symbol varchar, law_limit_bottom numeric, law_limit_top numeric, idunit_calib int2, absorvance numeric, abs_incertitude numeric, std_verif numeric, std_verif_incertitude numeric, wave_long numeric, num_decimal int2, idmr_detail int2, mr_incertitude numeric, blk_max numeric, reproducibility numeric, usernew varchar, datenew date, useredit varchar, dateedit date, status bool, date_allowed_error date, mrorpattern int2, rexp2 numeric, medium int4, medium_conc numeric, modif int4, modif_conc numeric, validity_calib int2, type_pattern int4, flag_sol_intermedia bool, sol_concentration numeric, sol_status bool, sol_date_preparation timestamp, sol_date_expiration timestamp, std_mrorpattern int4, std_type_pattern int4, std_flag_sol_intermedia1 bool, std_flag_sol_intermedia2 bool, std_concentration numeric, std_concentration_sol1 numeric, std_concentration_sol2 numeric, std_validity int2, std_status bool, std_date_preparation timestamp, std_date_expiration timestamp, std_sol1_medium numeric, std_sol2_medium numeric, std_stdverif_medium numeric, idunit_result int2, num_samples int2, num_days int2, limit_samples int2
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.template_method_aa WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_aa_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_aa_DeleteByPrimaryKey
(
	p_idtemplate_method int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.template_method_aa
 WHERE 
	idtemplate_method = p_idtemplate_method; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_aa_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_aa_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.template_method_aa WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_preparation_sample_Insert(int4,varchar,varchar,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_type_preparation_sample_Insert
(
	p_idtype_preparation_sample int4 ,
	p_name_preparation varchar(30) = null ,
	p_description varchar(500) = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.type_preparation_sample
(
	name_preparation,
	description,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_name_preparation,
	p_description,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idtype_preparation_sample into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_preparation_sample_Update(int4,varchar,varchar,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_type_preparation_sample_Update
(
	p_idtype_preparation_sample int4,
	p_name_preparation varchar(30) = null,
	p_description varchar(500) = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.type_preparation_sample
SET
	name_preparation = p_name_preparation,
	description = p_description,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtype_preparation_sample = p_idtype_preparation_sample;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_preparation_sample_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_type_preparation_sample_SelectByPrimaryKey
(
	p_idtype_preparation_sample int4
) returns TABLE ("Idtype_preparation_sample" int4, "Name_preparation" varchar, "Description" varchar, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.type_preparation_sample
	WHERE 
			idtype_preparation_sample = p_idtype_preparation_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_preparation_sample_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_type_preparation_sample_SelectAll()
 returns TABLE ("Idtype_preparation_sample" int4, "Name_preparation" varchar, "Description" varchar, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.type_preparation_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_preparation_sample_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_type_preparation_sample_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtype_preparation_sample int4, name_preparation varchar, description varchar, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.type_preparation_sample WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_preparation_sample_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_type_preparation_sample_DeleteByPrimaryKey
(
	p_idtype_preparation_sample int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.type_preparation_sample
 WHERE 
	idtype_preparation_sample = p_idtype_preparation_sample; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_preparation_sample_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_type_preparation_sample_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.type_preparation_sample WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_methods_Insert(int4,int4,int4,bool);
CREATE OR REPLACE FUNCTION public.sp_solution_methods_Insert
(
	p_idsolution_methods int4 ,
	p_idsolution int4 = null ,
	p_idtemplate_method int4 = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.solution_methods
(
	idsolution,
	idtemplate_method,
	status

)
VALUES
(
	p_idsolution,
	p_idtemplate_method,
	p_status

)returning idsolution_methods into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_methods_Update(int4,int4,int4,bool);
CREATE OR REPLACE FUNCTION public.sp_solution_methods_Update
(
	p_idsolution_methods int4,
	p_idsolution int4 = null,
	p_idtemplate_method int4 = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.solution_methods
SET
	idsolution = p_idsolution,
	idtemplate_method = p_idtemplate_method,
	status = p_status
 WHERE 
	idsolution_methods = p_idsolution_methods;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_methods_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_solution_methods_SelectByPrimaryKey
(
	p_idsolution_methods int4
) returns TABLE ("Idsolution_methods" int4, "Idsolution" int4, "Idtemplate_method" int4, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.solution_methods
	WHERE 
			idsolution_methods = p_idsolution_methods;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_methods_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_solution_methods_SelectAll()
 returns TABLE ("Idsolution_methods" int4, "Idsolution" int4, "Idtemplate_method" int4, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.solution_methods;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_methods_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_solution_methods_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idsolution_methods int4, idsolution int4, idtemplate_method int4, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.solution_methods WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_methods_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_solution_methods_DeleteByPrimaryKey
(
	p_idsolution_methods int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.solution_methods
 WHERE 
	idsolution_methods = p_idsolution_methods; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_methods_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_solution_methods_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.solution_methods WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_set_calibs_Insert(int4,varchar,numeric,numeric,numeric,int4,int4);
CREATE OR REPLACE FUNCTION public.sp_set_calibs_Insert
(
	p_idset_calibs int4 ,
	p_calib_group_name varchar(20) = null ,
	p_r numeric = null ,
	p_a numeric = null ,
	p_b numeric = null ,
	p_idtemplate_method int4 = null ,
	p_idgroup_solution int4 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.set_calibs
(
	calib_group_name,
	r,
	a,
	b,
	idtemplate_method,
	idgroup_solution

)
VALUES
(
	p_calib_group_name,
	p_r,
	p_a,
	p_b,
	p_idtemplate_method,
	p_idgroup_solution

)returning idset_calibs into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_set_calibs_Update(int4,varchar,numeric,numeric,numeric,int4,int4);
CREATE OR REPLACE FUNCTION public.sp_set_calibs_Update
(
	p_idset_calibs int4,
	p_calib_group_name varchar(20) = null,
	p_r numeric = null,
	p_a numeric = null,
	p_b numeric = null,
	p_idtemplate_method int4 = null,
	p_idgroup_solution int4 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.set_calibs
SET
	calib_group_name = p_calib_group_name,
	r = p_r,
	a = p_a,
	b = p_b,
	idtemplate_method = p_idtemplate_method,
	idgroup_solution = p_idgroup_solution
 WHERE 
	idset_calibs = p_idset_calibs;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_set_calibs_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_set_calibs_SelectByPrimaryKey
(
	p_idset_calibs int4
) returns TABLE ("Idset_calibs" int4, "Calib_group_name" varchar, "R" numeric, "A" numeric, "B" numeric, "Idtemplate_method" int4, "Idgroup_solution" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.set_calibs
	WHERE 
			idset_calibs = p_idset_calibs;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_set_calibs_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_set_calibs_SelectAll()
 returns TABLE ("Idset_calibs" int4, "Calib_group_name" varchar, "R" numeric, "A" numeric, "B" numeric, "Idtemplate_method" int4, "Idgroup_solution" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.set_calibs;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_set_calibs_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_set_calibs_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idset_calibs int4, calib_group_name varchar, r numeric, a numeric, b numeric, idtemplate_method int4, idgroup_solution int4
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.set_calibs WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_set_calibs_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_set_calibs_DeleteByPrimaryKey
(
	p_idset_calibs int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.set_calibs
 WHERE 
	idset_calibs = p_idset_calibs; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_set_calibs_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_set_calibs_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.set_calibs WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_Insert(int4,int2,varchar,int2,varchar,varchar,varchar,bpchar,bool,int4,varchar,varchar,numeric,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_Insert
(
	p_idtemplate_method int4 ,
	p_num_version int2 = null ,
	p_cod_template_method varchar(20) = null ,
	p_cod_repetition int2 = null ,
	p_title varchar(200) = null ,
	p_abbreviation varchar(15) = null ,
	p_name_method varchar(50) = null ,
	p_type_analisys bpchar = null ,
	p_recognized bool = null ,
	p_idelement int4 = null ,
	p_cod_type_sample varchar(5) = null ,
	p_cod_digestion_method varchar(5) = null ,
	p_cost_method numeric = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.template_method
(
	num_version,
	cod_template_method,
	cod_repetition,
	title,
	abbreviation,
	name_method,
	type_analisys,
	recognized,
	idelement,
	cod_type_sample,
	cod_digestion_method,
	cost_method,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_num_version,
	p_cod_template_method,
	p_cod_repetition,
	p_title,
	p_abbreviation,
	p_name_method,
	p_type_analisys,
	p_recognized,
	p_idelement,
	p_cod_type_sample,
	p_cod_digestion_method,
	p_cost_method,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idtemplate_method into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_Update(int4,int2,varchar,int2,varchar,varchar,varchar,bpchar,bool,int4,varchar,varchar,numeric,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_Update
(
	p_idtemplate_method int4,
	p_num_version int2 = null,
	p_cod_template_method varchar(20) = null,
	p_cod_repetition int2 = null,
	p_title varchar(200) = null,
	p_abbreviation varchar(15) = null,
	p_name_method varchar(50) = null,
	p_type_analisys bpchar = null,
	p_recognized bool = null,
	p_idelement int4 = null,
	p_cod_type_sample varchar(5) = null,
	p_cod_digestion_method varchar(5) = null,
	p_cost_method numeric = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.template_method
SET
	num_version = p_num_version,
	cod_template_method = p_cod_template_method,
	cod_repetition = p_cod_repetition,
	title = p_title,
	abbreviation = p_abbreviation,
	name_method = p_name_method,
	type_analisys = p_type_analisys,
	recognized = p_recognized,
	idelement = p_idelement,
	cod_type_sample = p_cod_type_sample,
	cod_digestion_method = p_cod_digestion_method,
	cost_method = p_cost_method,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtemplate_method = p_idtemplate_method;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_SelectByPrimaryKey
(
	p_idtemplate_method int4
) returns TABLE ("Idtemplate_method" int4, "Num_version" int2, "Cod_template_method" varchar, "Cod_repetition" int2, "Title" varchar, "Abbreviation" varchar, "Name_method" varchar, "Type_analisys" bpchar, "Recognized" bool, "Idelement" int4, "Cod_type_sample" varchar, "Cod_digestion_method" varchar, "Cost_method" numeric, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method
	WHERE 
			idtemplate_method = p_idtemplate_method;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_template_method_SelectAll()
 returns TABLE ("Idtemplate_method" int4, "Num_version" int2, "Cod_template_method" varchar, "Cod_repetition" int2, "Title" varchar, "Abbreviation" varchar, "Name_method" varchar, "Type_analisys" bpchar, "Recognized" bool, "Idelement" int4, "Cod_type_sample" varchar, "Cod_digestion_method" varchar, "Cost_method" numeric, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtemplate_method int4, num_version int2, cod_template_method varchar, cod_repetition int2, title varchar, abbreviation varchar, name_method varchar, type_analisys bpchar, recognized bool, idelement int4, cod_type_sample varchar, cod_digestion_method varchar, cost_method numeric, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.template_method WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_DeleteByPrimaryKey
(
	p_idtemplate_method int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.template_method
 WHERE 
	idtemplate_method = p_idtemplate_method; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.template_method WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_prep_samples_Insert(int8,bool,bool,int2,bool,timestamp,timestamp,varchar,numeric,timestamp,varchar,numeric,timestamp,varchar,numeric,timestamp,varchar,numeric,bool,timestamp,varchar,numeric,timestamp,varchar,bool,bool,bool,timestamp,varchar,timestamp,varchar,timestamp,varchar,varchar,timestamp,varchar,timestamp,varchar,timestamp,varchar,timestamp,varchar,varchar,int4,int4,int4,int4);
CREATE OR REPLACE FUNCTION public.sp_prep_samples_Insert
(
	p_idrecep_sample_detail int8 ,
	p_flag_humidity_analysis bool = null ,
	p_flag_reject bool = null ,
	p_flag_counter_sample int2 = null ,
	p_flag_60celsius bool = null ,
	p_date_creation timestamp = null ,
	p_input_sample_date timestamp = null ,
	p_input_sample_user varchar(20) = null ,
	p_weight_gross numeric = null ,
	p_weight_gross_date timestamp = null ,
	p_weight_gross_user varchar(20) = null ,
	p_weight_moisture numeric = null ,
	p_weight_moisture_date timestamp = null ,
	p_weight_moisture_user varchar(20) = null ,
	p_weight_dry numeric = null ,
	p_weight_dry_date timestamp = null ,
	p_weight_dry_user varchar(20) = null ,
	p_percent_moisture numeric = null ,
	p_moisture_reject bool = null ,
	p_moisture_reject_date timestamp = null ,
	p_moisture_reject_user varchar(20) = null ,
	p_weight_gross_reject numeric = null ,
	p_weight_gross_reject_date timestamp = null ,
	p_weight_gross_reject_user varchar(20) = null ,
	p_output_flag_sample bool = null ,
	p_output_flag_cs bool = null ,
	p_output_flag_re bool = null ,
	p_output_date_sample timestamp = null ,
	p_output_user_sample varchar(20) = null ,
	p_output_date_cs timestamp = null ,
	p_output_user_cs varchar(20) = null ,
	p_output_date_re timestamp = null ,
	p_output_user_re varchar(20) = null ,
	p_observation1 varchar(50) = null ,
	p_store_input_date_cs timestamp = null ,
	p_store_input_user_cs varchar(20) = null ,
	p_store_input_date_re timestamp = null ,
	p_store_input_user_re varchar(20) = null ,
	p_store_output_date_cs timestamp = null ,
	p_store_output_user_cs varchar(20) = null ,
	p_store_output_date_re timestamp = null ,
	p_store_output_user_re varchar(20) = null ,
	p_observation2 varchar(50) = null ,
	p_final_weight_gross int4 = null ,
	p_final_moisture int4 = null ,
	p_final_reject int4 = null ,
	p_final_sample_prepared int4 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.prep_samples
(
	idrecep_sample_detail,
	flag_humidity_analysis,
	flag_reject,
	flag_counter_sample,
	flag_60celsius,
	date_creation,
	input_sample_date,
	input_sample_user,
	weight_gross,
	weight_gross_date,
	weight_gross_user,
	weight_moisture,
	weight_moisture_date,
	weight_moisture_user,
	weight_dry,
	weight_dry_date,
	weight_dry_user,
	percent_moisture,
	moisture_reject,
	moisture_reject_date,
	moisture_reject_user,
	weight_gross_reject,
	weight_gross_reject_date,
	weight_gross_reject_user,
	output_flag_sample,
	output_flag_cs,
	output_flag_re,
	output_date_sample,
	output_user_sample,
	output_date_cs,
	output_user_cs,
	output_date_re,
	output_user_re,
	observation1,
	store_input_date_cs,
	store_input_user_cs,
	store_input_date_re,
	store_input_user_re,
	store_output_date_cs,
	store_output_user_cs,
	store_output_date_re,
	store_output_user_re,
	observation2,
	final_weight_gross,
	final_moisture,
	final_reject,
	final_sample_prepared

)
VALUES
(
	p_idrecep_sample_detail,
	p_flag_humidity_analysis,
	p_flag_reject,
	p_flag_counter_sample,
	p_flag_60celsius,
	p_date_creation,
	p_input_sample_date,
	p_input_sample_user,
	p_weight_gross,
	p_weight_gross_date,
	p_weight_gross_user,
	p_weight_moisture,
	p_weight_moisture_date,
	p_weight_moisture_user,
	p_weight_dry,
	p_weight_dry_date,
	p_weight_dry_user,
	p_percent_moisture,
	p_moisture_reject,
	p_moisture_reject_date,
	p_moisture_reject_user,
	p_weight_gross_reject,
	p_weight_gross_reject_date,
	p_weight_gross_reject_user,
	p_output_flag_sample,
	p_output_flag_cs,
	p_output_flag_re,
	p_output_date_sample,
	p_output_user_sample,
	p_output_date_cs,
	p_output_user_cs,
	p_output_date_re,
	p_output_user_re,
	p_observation1,
	p_store_input_date_cs,
	p_store_input_user_cs,
	p_store_input_date_re,
	p_store_input_user_re,
	p_store_output_date_cs,
	p_store_output_user_cs,
	p_store_output_date_re,
	p_store_output_user_re,
	p_observation2,
	p_final_weight_gross,
	p_final_moisture,
	p_final_reject,
	p_final_sample_prepared

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_prep_samples_Update(int8,bool,bool,int2,bool,timestamp,timestamp,varchar,numeric,timestamp,varchar,numeric,timestamp,varchar,numeric,timestamp,varchar,numeric,bool,timestamp,varchar,numeric,timestamp,varchar,bool,bool,bool,timestamp,varchar,timestamp,varchar,timestamp,varchar,varchar,timestamp,varchar,timestamp,varchar,timestamp,varchar,timestamp,varchar,varchar,int4,int4,int4,int4);
CREATE OR REPLACE FUNCTION public.sp_prep_samples_Update
(
	p_idrecep_sample_detail int8,
	p_flag_humidity_analysis bool = null,
	p_flag_reject bool = null,
	p_flag_counter_sample int2 = null,
	p_flag_60celsius bool = null,
	p_date_creation timestamp = null,
	p_input_sample_date timestamp = null,
	p_input_sample_user varchar(20) = null,
	p_weight_gross numeric = null,
	p_weight_gross_date timestamp = null,
	p_weight_gross_user varchar(20) = null,
	p_weight_moisture numeric = null,
	p_weight_moisture_date timestamp = null,
	p_weight_moisture_user varchar(20) = null,
	p_weight_dry numeric = null,
	p_weight_dry_date timestamp = null,
	p_weight_dry_user varchar(20) = null,
	p_percent_moisture numeric = null,
	p_moisture_reject bool = null,
	p_moisture_reject_date timestamp = null,
	p_moisture_reject_user varchar(20) = null,
	p_weight_gross_reject numeric = null,
	p_weight_gross_reject_date timestamp = null,
	p_weight_gross_reject_user varchar(20) = null,
	p_output_flag_sample bool = null,
	p_output_flag_cs bool = null,
	p_output_flag_re bool = null,
	p_output_date_sample timestamp = null,
	p_output_user_sample varchar(20) = null,
	p_output_date_cs timestamp = null,
	p_output_user_cs varchar(20) = null,
	p_output_date_re timestamp = null,
	p_output_user_re varchar(20) = null,
	p_observation1 varchar(50) = null,
	p_store_input_date_cs timestamp = null,
	p_store_input_user_cs varchar(20) = null,
	p_store_input_date_re timestamp = null,
	p_store_input_user_re varchar(20) = null,
	p_store_output_date_cs timestamp = null,
	p_store_output_user_cs varchar(20) = null,
	p_store_output_date_re timestamp = null,
	p_store_output_user_re varchar(20) = null,
	p_observation2 varchar(50) = null,
	p_final_weight_gross int4 = null,
	p_final_moisture int4 = null,
	p_final_reject int4 = null,
	p_final_sample_prepared int4 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.prep_samples
SET
	idrecep_sample_detail = p_idrecep_sample_detail,
	flag_humidity_analysis = p_flag_humidity_analysis,
	flag_reject = p_flag_reject,
	flag_counter_sample = p_flag_counter_sample,
	flag_60celsius = p_flag_60celsius,
	date_creation = p_date_creation,
	input_sample_date = p_input_sample_date,
	input_sample_user = p_input_sample_user,
	weight_gross = p_weight_gross,
	weight_gross_date = p_weight_gross_date,
	weight_gross_user = p_weight_gross_user,
	weight_moisture = p_weight_moisture,
	weight_moisture_date = p_weight_moisture_date,
	weight_moisture_user = p_weight_moisture_user,
	weight_dry = p_weight_dry,
	weight_dry_date = p_weight_dry_date,
	weight_dry_user = p_weight_dry_user,
	percent_moisture = p_percent_moisture,
	moisture_reject = p_moisture_reject,
	moisture_reject_date = p_moisture_reject_date,
	moisture_reject_user = p_moisture_reject_user,
	weight_gross_reject = p_weight_gross_reject,
	weight_gross_reject_date = p_weight_gross_reject_date,
	weight_gross_reject_user = p_weight_gross_reject_user,
	output_flag_sample = p_output_flag_sample,
	output_flag_cs = p_output_flag_cs,
	output_flag_re = p_output_flag_re,
	output_date_sample = p_output_date_sample,
	output_user_sample = p_output_user_sample,
	output_date_cs = p_output_date_cs,
	output_user_cs = p_output_user_cs,
	output_date_re = p_output_date_re,
	output_user_re = p_output_user_re,
	observation1 = p_observation1,
	store_input_date_cs = p_store_input_date_cs,
	store_input_user_cs = p_store_input_user_cs,
	store_input_date_re = p_store_input_date_re,
	store_input_user_re = p_store_input_user_re,
	store_output_date_cs = p_store_output_date_cs,
	store_output_user_cs = p_store_output_user_cs,
	store_output_date_re = p_store_output_date_re,
	store_output_user_re = p_store_output_user_re,
	observation2 = p_observation2,
	final_weight_gross = p_final_weight_gross,
	final_moisture = p_final_moisture,
	final_reject = p_final_reject,
	final_sample_prepared = p_final_sample_prepared
 WHERE 
	idrecep_sample_detail = p_idrecep_sample_detail;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_prep_samples_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_prep_samples_SelectByPrimaryKey
(
	p_idrecep_sample_detail int8
) returns TABLE ("Idrecep_sample_detail" int8, "Flag_humidity_analysis" bool, "Flag_reject" bool, "Flag_counter_sample" int2, "Flag_60celsius" bool, "Date_creation" timestamp, "Input_sample_date" timestamp, "Input_sample_user" varchar, "Weight_gross" numeric, "Weight_gross_date" timestamp, "Weight_gross_user" varchar, "Weight_moisture" numeric, "Weight_moisture_date" timestamp, "Weight_moisture_user" varchar, "Weight_dry" numeric, "Weight_dry_date" timestamp, "Weight_dry_user" varchar, "Percent_moisture" numeric, "Moisture_reject" bool, "Moisture_reject_date" timestamp, "Moisture_reject_user" varchar, "Weight_gross_reject" numeric, "Weight_gross_reject_date" timestamp, "Weight_gross_reject_user" varchar, "Output_flag_sample" bool, "Output_flag_cs" bool, "Output_flag_re" bool, "Output_date_sample" timestamp, "Output_user_sample" varchar, "Output_date_cs" timestamp, "Output_user_cs" varchar, "Output_date_re" timestamp, "Output_user_re" varchar, "Observation1" varchar, "Store_input_date_cs" timestamp, "Store_input_user_cs" varchar, "Store_input_date_re" timestamp, "Store_input_user_re" varchar, "Store_output_date_cs" timestamp, "Store_output_user_cs" varchar, "Store_output_date_re" timestamp, "Store_output_user_re" varchar, "Observation2" varchar, "Final_weight_gross" int4, "Final_moisture" int4, "Final_reject" int4, "Final_sample_prepared" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.prep_samples
	WHERE 
			idrecep_sample_detail = p_idrecep_sample_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_prep_samples_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_prep_samples_SelectAll()
 returns TABLE ("Idrecep_sample_detail" int8, "Flag_humidity_analysis" bool, "Flag_reject" bool, "Flag_counter_sample" int2, "Flag_60celsius" bool, "Date_creation" timestamp, "Input_sample_date" timestamp, "Input_sample_user" varchar, "Weight_gross" numeric, "Weight_gross_date" timestamp, "Weight_gross_user" varchar, "Weight_moisture" numeric, "Weight_moisture_date" timestamp, "Weight_moisture_user" varchar, "Weight_dry" numeric, "Weight_dry_date" timestamp, "Weight_dry_user" varchar, "Percent_moisture" numeric, "Moisture_reject" bool, "Moisture_reject_date" timestamp, "Moisture_reject_user" varchar, "Weight_gross_reject" numeric, "Weight_gross_reject_date" timestamp, "Weight_gross_reject_user" varchar, "Output_flag_sample" bool, "Output_flag_cs" bool, "Output_flag_re" bool, "Output_date_sample" timestamp, "Output_user_sample" varchar, "Output_date_cs" timestamp, "Output_user_cs" varchar, "Output_date_re" timestamp, "Output_user_re" varchar, "Observation1" varchar, "Store_input_date_cs" timestamp, "Store_input_user_cs" varchar, "Store_input_date_re" timestamp, "Store_input_user_re" varchar, "Store_output_date_cs" timestamp, "Store_output_user_cs" varchar, "Store_output_date_re" timestamp, "Store_output_user_re" varchar, "Observation2" varchar, "Final_weight_gross" int4, "Final_moisture" int4, "Final_reject" int4, "Final_sample_prepared" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.prep_samples;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_prep_samples_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_prep_samples_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idrecep_sample_detail int8, flag_humidity_analysis bool, flag_reject bool, flag_counter_sample int2, flag_60celsius bool, date_creation timestamp, input_sample_date timestamp, input_sample_user varchar, weight_gross numeric, weight_gross_date timestamp, weight_gross_user varchar, weight_moisture numeric, weight_moisture_date timestamp, weight_moisture_user varchar, weight_dry numeric, weight_dry_date timestamp, weight_dry_user varchar, percent_moisture numeric, moisture_reject bool, moisture_reject_date timestamp, moisture_reject_user varchar, weight_gross_reject numeric, weight_gross_reject_date timestamp, weight_gross_reject_user varchar, output_flag_sample bool, output_flag_cs bool, output_flag_re bool, output_date_sample timestamp, output_user_sample varchar, output_date_cs timestamp, output_user_cs varchar, output_date_re timestamp, output_user_re varchar, observation1 varchar, store_input_date_cs timestamp, store_input_user_cs varchar, store_input_date_re timestamp, store_input_user_re varchar, store_output_date_cs timestamp, store_output_user_cs varchar, store_output_date_re timestamp, store_output_user_re varchar, observation2 varchar, final_weight_gross int4, final_moisture int4, final_reject int4, final_sample_prepared int4
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.prep_samples WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_prep_samples_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_prep_samples_DeleteByPrimaryKey
(
	p_idrecep_sample_detail int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.prep_samples
 WHERE 
	idrecep_sample_detail = p_idrecep_sample_detail; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_prep_samples_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_prep_samples_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.prep_samples WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_person_Insert(int4,int2,int2);
CREATE OR REPLACE FUNCTION public.sp_company_person_Insert
(
	p_idcompany_person int4 ,
	p_idcompany int2 = null ,
	p_idperson int2 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.company_person
(
	idcompany,
	idperson

)
VALUES
(
	p_idcompany,
	p_idperson

)returning idcompany_person into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_person_Update(int4,int2,int2);
CREATE OR REPLACE FUNCTION public.sp_company_person_Update
(
	p_idcompany_person int4,
	p_idcompany int2 = null,
	p_idperson int2 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.company_person
SET
	idcompany = p_idcompany,
	idperson = p_idperson
 WHERE 
	idcompany_person = p_idcompany_person;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_person_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_company_person_SelectByPrimaryKey
(
	p_idcompany_person int4
) returns TABLE ("Idcompany_person" int4, "Idcompany" int2, "Idperson" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.company_person
	WHERE 
			idcompany_person = p_idcompany_person;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_person_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_company_person_SelectAll()
 returns TABLE ("Idcompany_person" int4, "Idcompany" int2, "Idperson" int2
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.company_person;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_person_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_company_person_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcompany_person int4, idcompany int2, idperson int2
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.company_person WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_person_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_company_person_DeleteByPrimaryKey
(
	p_idcompany_person int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.company_person
 WHERE 
	idcompany_person = p_idcompany_person; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_company_person_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_company_person_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.company_person WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_std_Insert(int8,int8,numeric,numeric,numeric,int4,int4,int4);
CREATE OR REPLACE FUNCTION public.sp_calib_std_Insert
(
	p_idcalib_std int8 ,
	p_idcalib int8 = null ,
	p_absorbance numeric = null ,
	p_absorbance_previus numeric = null ,
	p_concentration numeric = null ,
	p_idset_calibs int4 = null ,
	p_idtemplate_method int4 = null ,
	p_idgroup_solution int4 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.calib_std
(
	idcalib,
	absorbance,
	absorbance_previus,
	concentration,
	idset_calibs,
	idtemplate_method,
	idgroup_solution

)
VALUES
(
	p_idcalib,
	p_absorbance,
	p_absorbance_previus,
	p_concentration,
	p_idset_calibs,
	p_idtemplate_method,
	p_idgroup_solution

)returning idcalib_std into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_std_Update(int8,int8,numeric,numeric,numeric,int4,int4,int4);
CREATE OR REPLACE FUNCTION public.sp_calib_std_Update
(
	p_idcalib_std int8,
	p_idcalib int8 = null,
	p_absorbance numeric = null,
	p_absorbance_previus numeric = null,
	p_concentration numeric = null,
	p_idset_calibs int4 = null,
	p_idtemplate_method int4 = null,
	p_idgroup_solution int4 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.calib_std
SET
	idcalib = p_idcalib,
	absorbance = p_absorbance,
	absorbance_previus = p_absorbance_previus,
	concentration = p_concentration,
	idset_calibs = p_idset_calibs,
	idtemplate_method = p_idtemplate_method,
	idgroup_solution = p_idgroup_solution
 WHERE 
	idcalib_std = p_idcalib_std;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_std_SelectByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_calib_std_SelectByPrimaryKey
(
	p_idcalib_std int8
) returns TABLE ("Idcalib_std" int8, "Idcalib" int8, "Absorbance" numeric, "Absorbance_previus" numeric, "Concentration" numeric, "Idset_calibs" int4, "Idtemplate_method" int4, "Idgroup_solution" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.calib_std
	WHERE 
			idcalib_std = p_idcalib_std;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_std_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_calib_std_SelectAll()
 returns TABLE ("Idcalib_std" int8, "Idcalib" int8, "Absorbance" numeric, "Absorbance_previus" numeric, "Concentration" numeric, "Idset_calibs" int4, "Idtemplate_method" int4, "Idgroup_solution" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.calib_std;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_std_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_calib_std_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcalib_std int8, idcalib int8, absorbance numeric, absorbance_previus numeric, concentration numeric, idset_calibs int4, idtemplate_method int4, idgroup_solution int4
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.calib_std WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_std_DeleteByPrimaryKey(int8);
CREATE OR REPLACE FUNCTION public.sp_calib_std_DeleteByPrimaryKey
(
	p_idcalib_std int8
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.calib_std
 WHERE 
	idcalib_std = p_idcalib_std; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_calib_std_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_calib_std_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.calib_std WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_methods_Insert(int4,int4,int4,bool);
CREATE OR REPLACE FUNCTION public.sp_group_solution_methods_Insert
(
	p_idgroup_solution_methods int4 ,
	p_idgroup_solution int4 = null ,
	p_idtemplate_method int4 = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.group_solution_methods
(
	idgroup_solution,
	idtemplate_method,
	status

)
VALUES
(
	p_idgroup_solution,
	p_idtemplate_method,
	p_status

)returning idgroup_solution_methods into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_methods_Update(int4,int4,int4,bool);
CREATE OR REPLACE FUNCTION public.sp_group_solution_methods_Update
(
	p_idgroup_solution_methods int4,
	p_idgroup_solution int4 = null,
	p_idtemplate_method int4 = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.group_solution_methods
SET
	idgroup_solution = p_idgroup_solution,
	idtemplate_method = p_idtemplate_method,
	status = p_status
 WHERE 
	idgroup_solution_methods = p_idgroup_solution_methods;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_methods_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_group_solution_methods_SelectByPrimaryKey
(
	p_idgroup_solution_methods int4
) returns TABLE ("Idgroup_solution_methods" int4, "Idgroup_solution" int4, "Idtemplate_method" int4, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.group_solution_methods
	WHERE 
			idgroup_solution_methods = p_idgroup_solution_methods;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_methods_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_group_solution_methods_SelectAll()
 returns TABLE ("Idgroup_solution_methods" int4, "Idgroup_solution" int4, "Idtemplate_method" int4, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.group_solution_methods;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_methods_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_group_solution_methods_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idgroup_solution_methods int4, idgroup_solution int4, idtemplate_method int4, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.group_solution_methods WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_methods_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_group_solution_methods_DeleteByPrimaryKey
(
	p_idgroup_solution_methods int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.group_solution_methods
 WHERE 
	idgroup_solution_methods = p_idgroup_solution_methods; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_methods_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_group_solution_methods_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.group_solution_methods WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_Insert(int4,varchar,int4,int2,int4,int4,int4,int4,int4,bool,int2,timestamp,bool,bool,int4,timestamp,timestamp,bool,bool);
CREATE OR REPLACE FUNCTION public.sp_group_solution_Insert
(
	p_idgroup_solution int4 ,
	p_cod_solution varchar(20) = null ,
	p_idelement int4 = null ,
	p_idmr_detail int2 = null ,
	p_idreactive_medium int4 = null ,
	p_idreactive_modif int4 = null ,
	p_idtemplate_method int4 = null ,
	p_type_solution int4 = null ,
	p_type_pattern int4 = null ,
	p_flag_selected_methods bool = null ,
	p_user_sign_calib int2 = null ,
	p_date_sign_calib timestamp = null ,
	p_flag_sign_calib bool = null ,
	p_flag_close_calib bool = null ,
	p_idgroup_solution_previus int4 = null ,
	p_date_ini timestamp = null ,
	p_date_end timestamp = null ,
	p_flag_sol_intermedia1 bool = null ,
	p_flag_sol_intermedia2 bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.group_solution
(
	cod_solution,
	idelement,
	idmr_detail,
	idreactive_medium,
	idreactive_modif,
	idtemplate_method,
	type_solution,
	type_pattern,
	flag_selected_methods,
	user_sign_calib,
	date_sign_calib,
	flag_sign_calib,
	flag_close_calib,
	idgroup_solution_previus,
	date_ini,
	date_end,
	flag_sol_intermedia1,
	flag_sol_intermedia2

)
VALUES
(
	p_cod_solution,
	p_idelement,
	p_idmr_detail,
	p_idreactive_medium,
	p_idreactive_modif,
	p_idtemplate_method,
	p_type_solution,
	p_type_pattern,
	p_flag_selected_methods,
	p_user_sign_calib,
	p_date_sign_calib,
	p_flag_sign_calib,
	p_flag_close_calib,
	p_idgroup_solution_previus,
	p_date_ini,
	p_date_end,
	p_flag_sol_intermedia1,
	p_flag_sol_intermedia2

)returning idgroup_solution into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_Update(int4,varchar,int4,int2,int4,int4,int4,int4,int4,bool,int2,timestamp,bool,bool,int4,timestamp,timestamp,bool,bool);
CREATE OR REPLACE FUNCTION public.sp_group_solution_Update
(
	p_idgroup_solution int4,
	p_cod_solution varchar(20) = null,
	p_idelement int4 = null,
	p_idmr_detail int2 = null,
	p_idreactive_medium int4 = null,
	p_idreactive_modif int4 = null,
	p_idtemplate_method int4 = null,
	p_type_solution int4 = null,
	p_type_pattern int4 = null,
	p_flag_selected_methods bool = null,
	p_user_sign_calib int2 = null,
	p_date_sign_calib timestamp = null,
	p_flag_sign_calib bool = null,
	p_flag_close_calib bool = null,
	p_idgroup_solution_previus int4 = null,
	p_date_ini timestamp = null,
	p_date_end timestamp = null,
	p_flag_sol_intermedia1 bool = null,
	p_flag_sol_intermedia2 bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.group_solution
SET
	cod_solution = p_cod_solution,
	idelement = p_idelement,
	idmr_detail = p_idmr_detail,
	idreactive_medium = p_idreactive_medium,
	idreactive_modif = p_idreactive_modif,
	idtemplate_method = p_idtemplate_method,
	type_solution = p_type_solution,
	type_pattern = p_type_pattern,
	flag_selected_methods = p_flag_selected_methods,
	user_sign_calib = p_user_sign_calib,
	date_sign_calib = p_date_sign_calib,
	flag_sign_calib = p_flag_sign_calib,
	flag_close_calib = p_flag_close_calib,
	idgroup_solution_previus = p_idgroup_solution_previus,
	date_ini = p_date_ini,
	date_end = p_date_end,
	flag_sol_intermedia1 = p_flag_sol_intermedia1,
	flag_sol_intermedia2 = p_flag_sol_intermedia2
 WHERE 
	idgroup_solution = p_idgroup_solution;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_group_solution_SelectByPrimaryKey
(
	p_idgroup_solution int4
) returns TABLE ("Idgroup_solution" int4, "Cod_solution" varchar, "Idelement" int4, "Idmr_detail" int2, "Idreactive_medium" int4, "Idreactive_modif" int4, "Idtemplate_method" int4, "Type_solution" int4, "Type_pattern" int4, "Flag_selected_methods" bool, "User_sign_calib" int2, "Date_sign_calib" timestamp, "Flag_sign_calib" bool, "Flag_close_calib" bool, "Idgroup_solution_previus" int4, "Date_ini" timestamp, "Date_end" timestamp, "Flag_sol_intermedia1" bool, "Flag_sol_intermedia2" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.group_solution
	WHERE 
			idgroup_solution = p_idgroup_solution;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_group_solution_SelectAll()
 returns TABLE ("Idgroup_solution" int4, "Cod_solution" varchar, "Idelement" int4, "Idmr_detail" int2, "Idreactive_medium" int4, "Idreactive_modif" int4, "Idtemplate_method" int4, "Type_solution" int4, "Type_pattern" int4, "Flag_selected_methods" bool, "User_sign_calib" int2, "Date_sign_calib" timestamp, "Flag_sign_calib" bool, "Flag_close_calib" bool, "Idgroup_solution_previus" int4, "Date_ini" timestamp, "Date_end" timestamp, "Flag_sol_intermedia1" bool, "Flag_sol_intermedia2" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.group_solution;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_group_solution_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idgroup_solution int4, cod_solution varchar, idelement int4, idmr_detail int2, idreactive_medium int4, idreactive_modif int4, idtemplate_method int4, type_solution int4, type_pattern int4, flag_selected_methods bool, user_sign_calib int2, date_sign_calib timestamp, flag_sign_calib bool, flag_close_calib bool, idgroup_solution_previus int4, date_ini timestamp, date_end timestamp, flag_sol_intermedia1 bool, flag_sol_intermedia2 bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.group_solution WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_group_solution_DeleteByPrimaryKey
(
	p_idgroup_solution int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.group_solution
 WHERE 
	idgroup_solution = p_idgroup_solution; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_group_solution_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_group_solution_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.group_solution WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_Insert(int4,int4,int4,int4,int4,varchar,int4,varchar,numeric,numeric,numeric,numeric,date,date,int4,int2,varchar,varchar,bool,int4,numeric,int4,numeric,varchar,int4,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_solution_Insert
(
	p_idsolution int4 ,
	p_id int4 = null ,
	p_parentid int4 = null ,
	p_idgroup_solution int4 = null ,
	p_idelement int4 = null ,
	p_cod_solution varchar(20) = null ,
	p_type_sol int4 = null ,
	p_solution_name varchar(50) = null ,
	p_purity numeric = null ,
	p_concentration numeric = null ,
	p_aliquot numeric = null ,
	p_volumen numeric = null ,
	p_date_begin date = null ,
	p_date_end date = null ,
	p_num_months int4 = null ,
	p_prepared_by int2 = null ,
	p_observation varchar(100) = null ,
	p_lote varchar(12) = null ,
	p_solution_status bool = null ,
	p_idreactive_medium int4 = null ,
	p_reactive_medium_value numeric = null ,
	p_idreactive_modif int4 = null ,
	p_reactive_modif_value numeric = null ,
	p_concat_cod_methods varchar(100) = null ,
	p_image_index int4 = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.solution
(
	id,
	parentid,
	idgroup_solution,
	idelement,
	cod_solution,
	type_sol,
	solution_name,
	purity,
	concentration,
	aliquot,
	volumen,
	date_begin,
	date_end,
	num_months,
	prepared_by,
	observation,
	lote,
	solution_status,
	idreactive_medium,
	reactive_medium_value,
	idreactive_modif,
	reactive_modif_value,
	concat_cod_methods,
	image_index,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_id,
	p_parentid,
	p_idgroup_solution,
	p_idelement,
	p_cod_solution,
	p_type_sol,
	p_solution_name,
	p_purity,
	p_concentration,
	p_aliquot,
	p_volumen,
	p_date_begin,
	p_date_end,
	p_num_months,
	p_prepared_by,
	p_observation,
	p_lote,
	p_solution_status,
	p_idreactive_medium,
	p_reactive_medium_value,
	p_idreactive_modif,
	p_reactive_modif_value,
	p_concat_cod_methods,
	p_image_index,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idsolution into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_Update(int4,int4,int4,int4,int4,varchar,int4,varchar,numeric,numeric,numeric,numeric,date,date,int4,int2,varchar,varchar,bool,int4,numeric,int4,numeric,varchar,int4,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_solution_Update
(
	p_idsolution int4,
	p_id int4 = null,
	p_parentid int4 = null,
	p_idgroup_solution int4 = null,
	p_idelement int4 = null,
	p_cod_solution varchar(20) = null,
	p_type_sol int4 = null,
	p_solution_name varchar(50) = null,
	p_purity numeric = null,
	p_concentration numeric = null,
	p_aliquot numeric = null,
	p_volumen numeric = null,
	p_date_begin date = null,
	p_date_end date = null,
	p_num_months int4 = null,
	p_prepared_by int2 = null,
	p_observation varchar(100) = null,
	p_lote varchar(12) = null,
	p_solution_status bool = null,
	p_idreactive_medium int4 = null,
	p_reactive_medium_value numeric = null,
	p_idreactive_modif int4 = null,
	p_reactive_modif_value numeric = null,
	p_concat_cod_methods varchar(100) = null,
	p_image_index int4 = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.solution
SET
	id = p_id,
	parentid = p_parentid,
	idgroup_solution = p_idgroup_solution,
	idelement = p_idelement,
	cod_solution = p_cod_solution,
	type_sol = p_type_sol,
	solution_name = p_solution_name,
	purity = p_purity,
	concentration = p_concentration,
	aliquot = p_aliquot,
	volumen = p_volumen,
	date_begin = p_date_begin,
	date_end = p_date_end,
	num_months = p_num_months,
	prepared_by = p_prepared_by,
	observation = p_observation,
	lote = p_lote,
	solution_status = p_solution_status,
	idreactive_medium = p_idreactive_medium,
	reactive_medium_value = p_reactive_medium_value,
	idreactive_modif = p_idreactive_modif,
	reactive_modif_value = p_reactive_modif_value,
	concat_cod_methods = p_concat_cod_methods,
	image_index = p_image_index,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idsolution = p_idsolution;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_solution_SelectByPrimaryKey
(
	p_idsolution int4
) returns TABLE ("Idsolution" int4, "Id" int4, "Parentid" int4, "Idgroup_solution" int4, "Idelement" int4, "Cod_solution" varchar, "Type_sol" int4, "Solution_name" varchar, "Purity" numeric, "Concentration" numeric, "Aliquot" numeric, "Volumen" numeric, "Date_begin" date, "Date_end" date, "Num_months" int4, "Prepared_by" int2, "Observation" varchar, "Lote" varchar, "Solution_status" bool, "Idreactive_medium" int4, "Reactive_medium_value" numeric, "Idreactive_modif" int4, "Reactive_modif_value" numeric, "Concat_cod_methods" varchar, "Image_index" int4, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.solution
	WHERE 
			idsolution = p_idsolution;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_solution_SelectAll()
 returns TABLE ("Idsolution" int4, "Id" int4, "Parentid" int4, "Idgroup_solution" int4, "Idelement" int4, "Cod_solution" varchar, "Type_sol" int4, "Solution_name" varchar, "Purity" numeric, "Concentration" numeric, "Aliquot" numeric, "Volumen" numeric, "Date_begin" date, "Date_end" date, "Num_months" int4, "Prepared_by" int2, "Observation" varchar, "Lote" varchar, "Solution_status" bool, "Idreactive_medium" int4, "Reactive_medium_value" numeric, "Idreactive_modif" int4, "Reactive_modif_value" numeric, "Concat_cod_methods" varchar, "Image_index" int4, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.solution;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_solution_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idsolution int4, id int4, parentid int4, idgroup_solution int4, idelement int4, cod_solution varchar, type_sol int4, solution_name varchar, purity numeric, concentration numeric, aliquot numeric, volumen numeric, date_begin date, date_end date, num_months int4, prepared_by int2, observation varchar, lote varchar, solution_status bool, idreactive_medium int4, reactive_medium_value numeric, idreactive_modif int4, reactive_modif_value numeric, concat_cod_methods varchar, image_index int4, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.solution WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_solution_DeleteByPrimaryKey
(
	p_idsolution int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.solution
 WHERE 
	idsolution = p_idsolution; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_solution_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_solution_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.solution WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_detail_Insert(int4,int4,int4,int4,int4,varchar,numeric,numeric);
CREATE OR REPLACE FUNCTION public.sp_price_version_detail_Insert
(
	p_idprice_version_detail int4 ,
	p_idprice_version int4 = null ,
	p_num_item int4 = null ,
	p_idtemplate_method int4 = null ,
	p_amount_item int4 = null ,
	p_rank varchar(20) = null ,
	p_unit_price numeric = null ,
	p_sale_price numeric = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.price_version_detail
(
	idprice_version,
	num_item,
	idtemplate_method,
	amount_item,
	rank,
	unit_price,
	sale_price

)
VALUES
(
	p_idprice_version,
	p_num_item,
	p_idtemplate_method,
	p_amount_item,
	p_rank,
	p_unit_price,
	p_sale_price

)returning idprice_version_detail into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_detail_Update(int4,int4,int4,int4,int4,varchar,numeric,numeric);
CREATE OR REPLACE FUNCTION public.sp_price_version_detail_Update
(
	p_idprice_version_detail int4,
	p_idprice_version int4 = null,
	p_num_item int4 = null,
	p_idtemplate_method int4 = null,
	p_amount_item int4 = null,
	p_rank varchar(20) = null,
	p_unit_price numeric = null,
	p_sale_price numeric = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.price_version_detail
SET
	idprice_version = p_idprice_version,
	num_item = p_num_item,
	idtemplate_method = p_idtemplate_method,
	amount_item = p_amount_item,
	rank = p_rank,
	unit_price = p_unit_price,
	sale_price = p_sale_price
 WHERE 
	idprice_version_detail = p_idprice_version_detail;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_detail_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_price_version_detail_SelectByPrimaryKey
(
	p_idprice_version_detail int4
) returns TABLE ("Idprice_version_detail" int4, "Idprice_version" int4, "Num_item" int4, "Idtemplate_method" int4, "Amount_item" int4, "Rank" varchar, "Unit_price" numeric, "Sale_price" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.price_version_detail
	WHERE 
			idprice_version_detail = p_idprice_version_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_detail_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_price_version_detail_SelectAll()
 returns TABLE ("Idprice_version_detail" int4, "Idprice_version" int4, "Num_item" int4, "Idtemplate_method" int4, "Amount_item" int4, "Rank" varchar, "Unit_price" numeric, "Sale_price" numeric
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.price_version_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_detail_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_version_detail_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idprice_version_detail int4, idprice_version int4, num_item int4, idtemplate_method int4, amount_item int4, rank varchar, unit_price numeric, sale_price numeric
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.price_version_detail WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_detail_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_price_version_detail_DeleteByPrimaryKey
(
	p_idprice_version_detail int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.price_version_detail
 WHERE 
	idprice_version_detail = p_idprice_version_detail; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_detail_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_version_detail_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.price_version_detail WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_template_Insert(int4,varchar,varchar,int4);
CREATE OR REPLACE FUNCTION public.sp_memo_template_Insert
(
	p_idmemo_template int4 ,
	p_paragraph varchar(3000) = null ,
	p_paragraph_rtf varchar(3000) = null ,
	p_memo_type int4 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.memo_template
(
	paragraph,
	paragraph_rtf,
	memo_type

)
VALUES
(
	p_paragraph,
	p_paragraph_rtf,
	p_memo_type

)returning idmemo_template into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_template_Update(int4,varchar,varchar,int4);
CREATE OR REPLACE FUNCTION public.sp_memo_template_Update
(
	p_idmemo_template int4,
	p_paragraph varchar(3000) = null,
	p_paragraph_rtf varchar(3000) = null,
	p_memo_type int4 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.memo_template
SET
	paragraph = p_paragraph,
	paragraph_rtf = p_paragraph_rtf,
	memo_type = p_memo_type
 WHERE 
	idmemo_template = p_idmemo_template;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_template_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_memo_template_SelectByPrimaryKey
(
	p_idmemo_template int4
) returns TABLE ("Idmemo_template" int4, "Paragraph" varchar, "Paragraph_rtf" varchar, "Memo_type" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.memo_template
	WHERE 
			idmemo_template = p_idmemo_template;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_template_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_memo_template_SelectAll()
 returns TABLE ("Idmemo_template" int4, "Paragraph" varchar, "Paragraph_rtf" varchar, "Memo_type" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.memo_template;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_template_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_memo_template_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idmemo_template int4, paragraph varchar, paragraph_rtf varchar, memo_type int4
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.memo_template WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_template_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_memo_template_DeleteByPrimaryKey
(
	p_idmemo_template int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.memo_template
 WHERE 
	idmemo_template = p_idmemo_template; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_template_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_memo_template_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.memo_template WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_price_Insert(int4,int4,varchar,int4);
CREATE OR REPLACE FUNCTION public.sp_memo_price_Insert
(
	p_idmemo_price int4 ,
	p_idprice_version int4 = null ,
	p_paragraph varchar(3000) = null ,
	p_memo_type int4 = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.memo_price
(
	idprice_version,
	paragraph,
	memo_type

)
VALUES
(
	p_idprice_version,
	p_paragraph,
	p_memo_type

)returning idmemo_price into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_price_Update(int4,int4,varchar,int4);
CREATE OR REPLACE FUNCTION public.sp_memo_price_Update
(
	p_idmemo_price int4,
	p_idprice_version int4 = null,
	p_paragraph varchar(3000) = null,
	p_memo_type int4 = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.memo_price
SET
	idprice_version = p_idprice_version,
	paragraph = p_paragraph,
	memo_type = p_memo_type
 WHERE 
	idmemo_price = p_idmemo_price;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_price_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_memo_price_SelectByPrimaryKey
(
	p_idmemo_price int4
) returns TABLE ("Idmemo_price" int4, "Idprice_version" int4, "Paragraph" varchar, "Memo_type" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.memo_price
	WHERE 
			idmemo_price = p_idmemo_price;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_price_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_memo_price_SelectAll()
 returns TABLE ("Idmemo_price" int4, "Idprice_version" int4, "Paragraph" varchar, "Memo_type" int4
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.memo_price;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_price_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_memo_price_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idmemo_price int4, idprice_version int4, paragraph varchar, memo_type int4
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.memo_price WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_price_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_memo_price_DeleteByPrimaryKey
(
	p_idmemo_price int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.memo_price
 WHERE 
	idmemo_price = p_idmemo_price; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_memo_price_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_memo_price_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.memo_price WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_user_system_Insert(int2,varchar,varchar,int2,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_user_system_Insert
(
	p_iduser int2 ,
	p_cod_user varchar(30) ,
	p_pwd varchar(32) ,
	p_idperson int2 = null ,
	p_usernew varchar(50) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(50) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.user_system
(
	cod_user,
	pwd,
	idperson,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_cod_user,
	p_pwd,
	p_idperson,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning iduser into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_user_system_Update(int2,varchar,varchar,int2,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_user_system_Update
(
	p_iduser int2,
	p_cod_user varchar(30),
	p_pwd varchar(32),
	p_idperson int2 = null,
	p_usernew varchar(50) = null,
	p_datenew timestamp = null,
	p_useredit varchar(50) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.user_system
SET
	cod_user = p_cod_user,
	pwd = p_pwd,
	idperson = p_idperson,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	iduser = p_iduser;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_user_system_SelectByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_user_system_SelectByPrimaryKey
(
	p_iduser int2
) returns TABLE ("Iduser" int2, "Cod_user" varchar, "Pwd" varchar, "Idperson" int2, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.user_system
	WHERE 
			iduser = p_iduser;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_user_system_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_user_system_SelectAll()
 returns TABLE ("Iduser" int2, "Cod_user" varchar, "Pwd" varchar, "Idperson" int2, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.user_system;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_user_system_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_user_system_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (iduser int2, cod_user varchar, pwd varchar, idperson int2, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.user_system WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_user_system_DeleteByPrimaryKey(int2);
CREATE OR REPLACE FUNCTION public.sp_user_system_DeleteByPrimaryKey
(
	p_iduser int2
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.user_system
 WHERE 
	iduser = p_iduser; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_user_system_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_user_system_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.user_system WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_Insert(int4,int4,int8,int4,varchar,int2,int2,int2,int4,timestamp,varchar,int2,int4,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_version_Insert
(
	p_idprice_version int4 ,
	p_idprice int4 = null ,
	p_idrecep_sample int8 = null ,
	p_num_version int4 = null ,
	p_cod_type_sample varchar(5) = null ,
	p_idcompany int2 = null ,
	p_attention int2 = null ,
	p_iduser int2 = null ,
	p_num_days_post int4 = null ,
	p_date_creation timestamp = null ,
	p_user_creation varchar(20) = null ,
	p_num_days_valid int2 = null ,
	p_status_price int4 = null ,
	p_observation varchar(3000) = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.price_version
(
	idprice,
	idrecep_sample,
	num_version,
	cod_type_sample,
	idcompany,
	attention,
	iduser,
	num_days_post,
	date_creation,
	user_creation,
	num_days_valid,
	status_price,
	observation

)
VALUES
(
	p_idprice,
	p_idrecep_sample,
	p_num_version,
	p_cod_type_sample,
	p_idcompany,
	p_attention,
	p_iduser,
	p_num_days_post,
	p_date_creation,
	p_user_creation,
	p_num_days_valid,
	p_status_price,
	p_observation

)returning idprice_version into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_Update(int4,int4,int8,int4,varchar,int2,int2,int2,int4,timestamp,varchar,int2,int4,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_version_Update
(
	p_idprice_version int4,
	p_idprice int4 = null,
	p_idrecep_sample int8 = null,
	p_num_version int4 = null,
	p_cod_type_sample varchar(5) = null,
	p_idcompany int2 = null,
	p_attention int2 = null,
	p_iduser int2 = null,
	p_num_days_post int4 = null,
	p_date_creation timestamp = null,
	p_user_creation varchar(20) = null,
	p_num_days_valid int2 = null,
	p_status_price int4 = null,
	p_observation varchar(3000) = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.price_version
SET
	idprice = p_idprice,
	idrecep_sample = p_idrecep_sample,
	num_version = p_num_version,
	cod_type_sample = p_cod_type_sample,
	idcompany = p_idcompany,
	attention = p_attention,
	iduser = p_iduser,
	num_days_post = p_num_days_post,
	date_creation = p_date_creation,
	user_creation = p_user_creation,
	num_days_valid = p_num_days_valid,
	status_price = p_status_price,
	observation = p_observation
 WHERE 
	idprice_version = p_idprice_version;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_price_version_SelectByPrimaryKey
(
	p_idprice_version int4
) returns TABLE ("Idprice_version" int4, "Idprice" int4, "Idrecep_sample" int8, "Num_version" int4, "Cod_type_sample" varchar, "Idcompany" int2, "Attention" int2, "Iduser" int2, "Num_days_post" int4, "Date_creation" timestamp, "User_creation" varchar, "Num_days_valid" int2, "Status_price" int4, "Observation" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.price_version
	WHERE 
			idprice_version = p_idprice_version;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_price_version_SelectAll()
 returns TABLE ("Idprice_version" int4, "Idprice" int4, "Idrecep_sample" int8, "Num_version" int4, "Cod_type_sample" varchar, "Idcompany" int2, "Attention" int2, "Iduser" int2, "Num_days_post" int4, "Date_creation" timestamp, "User_creation" varchar, "Num_days_valid" int2, "Status_price" int4, "Observation" varchar
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.price_version;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_version_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idprice_version int4, idprice int4, idrecep_sample int8, num_version int4, cod_type_sample varchar, idcompany int2, attention int2, iduser int2, num_days_post int4, date_creation timestamp, user_creation varchar, num_days_valid int2, status_price int4, observation varchar
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.price_version WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_price_version_DeleteByPrimaryKey
(
	p_idprice_version int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.price_version
 WHERE 
	idprice_version = p_idprice_version; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_price_version_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_price_version_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.price_version WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_control_Insert(int4,varchar,int4,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_type_sample_control_Insert
(
	p_idtype_sample_control int4 ,
	p_nametsc varchar(5) = null ,
	p_priority int4 = null ,
	p_usernew varchar(50) = null ,
	p_datenew date = null ,
	p_useredit varchar(50) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.type_sample_control
(
	nametsc,
	priority,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_nametsc,
	p_priority,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idtype_sample_control into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_control_Update(int4,varchar,int4,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_type_sample_control_Update
(
	p_idtype_sample_control int4,
	p_nametsc varchar(5) = null,
	p_priority int4 = null,
	p_usernew varchar(50) = null,
	p_datenew date = null,
	p_useredit varchar(50) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.type_sample_control
SET
	nametsc = p_nametsc,
	priority = p_priority,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtype_sample_control = p_idtype_sample_control;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_control_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_type_sample_control_SelectByPrimaryKey
(
	p_idtype_sample_control int4
) returns TABLE ("Idtype_sample_control" int4, "Nametsc" varchar, "Priority" int4, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.type_sample_control
	WHERE 
			idtype_sample_control = p_idtype_sample_control;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_control_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_type_sample_control_SelectAll()
 returns TABLE ("Idtype_sample_control" int4, "Nametsc" varchar, "Priority" int4, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.type_sample_control;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_control_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_type_sample_control_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtype_sample_control int4, nametsc varchar, priority int4, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.type_sample_control WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_control_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_type_sample_control_DeleteByPrimaryKey
(
	p_idtype_sample_control int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.type_sample_control
 WHERE 
	idtype_sample_control = p_idtype_sample_control; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_type_sample_control_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_type_sample_control_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.type_sample_control WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_frequency_Insert(int4,int4,int4,int4,varchar,varchar,int4,varchar,bool,bool,int4,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_control_sample_frequency_Insert
(
	p_idcontrol_sample_frequency int4 ,
	p_idtype_sample_control int4 = null ,
	p_idtemplate_method int4 = null ,
	p_type_analisys int4 = null ,
	p_name_frequency varchar(20) = null ,
	p_name_frec_prefijo varchar(15) = null ,
	p_frecuency int4 = null ,
	p_name_frec_sufijo varchar(15) = null ,
	p_flag_frec_by_batch bool = null ,
	p_flag_frec_by_sample bool = null ,
	p_priority int4 = null ,
	p_usernew varchar(50) = null ,
	p_datenew date = null ,
	p_useredit varchar(50) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.control_sample_frequency
(
	idtype_sample_control,
	idtemplate_method,
	type_analisys,
	name_frequency,
	name_frec_prefijo,
	frecuency,
	name_frec_sufijo,
	flag_frec_by_batch,
	flag_frec_by_sample,
	priority,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idtype_sample_control,
	p_idtemplate_method,
	p_type_analisys,
	p_name_frequency,
	p_name_frec_prefijo,
	p_frecuency,
	p_name_frec_sufijo,
	p_flag_frec_by_batch,
	p_flag_frec_by_sample,
	p_priority,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idcontrol_sample_frequency into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_frequency_Update(int4,int4,int4,int4,varchar,varchar,int4,varchar,bool,bool,int4,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_control_sample_frequency_Update
(
	p_idcontrol_sample_frequency int4,
	p_idtype_sample_control int4 = null,
	p_idtemplate_method int4 = null,
	p_type_analisys int4 = null,
	p_name_frequency varchar(20) = null,
	p_name_frec_prefijo varchar(15) = null,
	p_frecuency int4 = null,
	p_name_frec_sufijo varchar(15) = null,
	p_flag_frec_by_batch bool = null,
	p_flag_frec_by_sample bool = null,
	p_priority int4 = null,
	p_usernew varchar(50) = null,
	p_datenew date = null,
	p_useredit varchar(50) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.control_sample_frequency
SET
	idtype_sample_control = p_idtype_sample_control,
	idtemplate_method = p_idtemplate_method,
	type_analisys = p_type_analisys,
	name_frequency = p_name_frequency,
	name_frec_prefijo = p_name_frec_prefijo,
	frecuency = p_frecuency,
	name_frec_sufijo = p_name_frec_sufijo,
	flag_frec_by_batch = p_flag_frec_by_batch,
	flag_frec_by_sample = p_flag_frec_by_sample,
	priority = p_priority,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idcontrol_sample_frequency = p_idcontrol_sample_frequency;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_frequency_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_control_sample_frequency_SelectByPrimaryKey
(
	p_idcontrol_sample_frequency int4
) returns TABLE ("Idcontrol_sample_frequency" int4, "Idtype_sample_control" int4, "Idtemplate_method" int4, "Type_analisys" int4, "Name_frequency" varchar, "Name_frec_prefijo" varchar, "Frecuency" int4, "Name_frec_sufijo" varchar, "Flag_frec_by_batch" bool, "Flag_frec_by_sample" bool, "Priority" int4, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.control_sample_frequency
	WHERE 
			idcontrol_sample_frequency = p_idcontrol_sample_frequency;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_frequency_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_control_sample_frequency_SelectAll()
 returns TABLE ("Idcontrol_sample_frequency" int4, "Idtype_sample_control" int4, "Idtemplate_method" int4, "Type_analisys" int4, "Name_frequency" varchar, "Name_frec_prefijo" varchar, "Frecuency" int4, "Name_frec_sufijo" varchar, "Flag_frec_by_batch" bool, "Flag_frec_by_sample" bool, "Priority" int4, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.control_sample_frequency;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_frequency_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_control_sample_frequency_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcontrol_sample_frequency int4, idtype_sample_control int4, idtemplate_method int4, type_analisys int4, name_frequency varchar, name_frec_prefijo varchar, frecuency int4, name_frec_sufijo varchar, flag_frec_by_batch bool, flag_frec_by_sample bool, priority int4, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.control_sample_frequency WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_frequency_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_control_sample_frequency_DeleteByPrimaryKey
(
	p_idcontrol_sample_frequency int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.control_sample_frequency
 WHERE 
	idcontrol_sample_frequency = p_idcontrol_sample_frequency; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_frequency_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_control_sample_frequency_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.control_sample_frequency WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_Insert(int4,int4,int4,int4,varchar,varchar,varchar,numeric,varchar,varchar,int4,varchar,bool,bool,int4,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_control_sample_Insert
(
	p_idcontrol_sample int4 ,
	p_idtype_sample_control int4 = null ,
	p_idtemplate_method int4 = null ,
	p_type_analisys int4 = null ,
	p_name_cs varchar(20) = null ,
	p_description varchar(200) = null ,
	p_name_value_prefijo varchar(15) = null ,
	p_value1 numeric = null ,
	p_name_value_sufijo varchar(15) = null ,
	p_name_frec_prefijo varchar(15) = null ,
	p_frecuency int4 = null ,
	p_name_frec_sufijo varchar(15) = null ,
	p_flag_frec_by_batch bool = null ,
	p_flag_frec_by_sample bool = null ,
	p_priority int4 = null ,
	p_usernew varchar(50) = null ,
	p_datenew date = null ,
	p_useredit varchar(50) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.control_sample
(
	idtype_sample_control,
	idtemplate_method,
	type_analisys,
	name_cs,
	description,
	name_value_prefijo,
	value1,
	name_value_sufijo,
	name_frec_prefijo,
	frecuency,
	name_frec_sufijo,
	flag_frec_by_batch,
	flag_frec_by_sample,
	priority,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idtype_sample_control,
	p_idtemplate_method,
	p_type_analisys,
	p_name_cs,
	p_description,
	p_name_value_prefijo,
	p_value1,
	p_name_value_sufijo,
	p_name_frec_prefijo,
	p_frecuency,
	p_name_frec_sufijo,
	p_flag_frec_by_batch,
	p_flag_frec_by_sample,
	p_priority,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idcontrol_sample into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_Update(int4,int4,int4,int4,varchar,varchar,varchar,numeric,varchar,varchar,int4,varchar,bool,bool,int4,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_control_sample_Update
(
	p_idcontrol_sample int4,
	p_idtype_sample_control int4 = null,
	p_idtemplate_method int4 = null,
	p_type_analisys int4 = null,
	p_name_cs varchar(20) = null,
	p_description varchar(200) = null,
	p_name_value_prefijo varchar(15) = null,
	p_value1 numeric = null,
	p_name_value_sufijo varchar(15) = null,
	p_name_frec_prefijo varchar(15) = null,
	p_frecuency int4 = null,
	p_name_frec_sufijo varchar(15) = null,
	p_flag_frec_by_batch bool = null,
	p_flag_frec_by_sample bool = null,
	p_priority int4 = null,
	p_usernew varchar(50) = null,
	p_datenew date = null,
	p_useredit varchar(50) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.control_sample
SET
	idtype_sample_control = p_idtype_sample_control,
	idtemplate_method = p_idtemplate_method,
	type_analisys = p_type_analisys,
	name_cs = p_name_cs,
	description = p_description,
	name_value_prefijo = p_name_value_prefijo,
	value1 = p_value1,
	name_value_sufijo = p_name_value_sufijo,
	name_frec_prefijo = p_name_frec_prefijo,
	frecuency = p_frecuency,
	name_frec_sufijo = p_name_frec_sufijo,
	flag_frec_by_batch = p_flag_frec_by_batch,
	flag_frec_by_sample = p_flag_frec_by_sample,
	priority = p_priority,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idcontrol_sample = p_idcontrol_sample;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_control_sample_SelectByPrimaryKey
(
	p_idcontrol_sample int4
) returns TABLE ("Idcontrol_sample" int4, "Idtype_sample_control" int4, "Idtemplate_method" int4, "Type_analisys" int4, "Name_cs" varchar, "Description" varchar, "Name_value_prefijo" varchar, "Value1" numeric, "Name_value_sufijo" varchar, "Name_frec_prefijo" varchar, "Frecuency" int4, "Name_frec_sufijo" varchar, "Flag_frec_by_batch" bool, "Flag_frec_by_sample" bool, "Priority" int4, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.control_sample
	WHERE 
			idcontrol_sample = p_idcontrol_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_control_sample_SelectAll()
 returns TABLE ("Idcontrol_sample" int4, "Idtype_sample_control" int4, "Idtemplate_method" int4, "Type_analisys" int4, "Name_cs" varchar, "Description" varchar, "Name_value_prefijo" varchar, "Value1" numeric, "Name_value_sufijo" varchar, "Name_frec_prefijo" varchar, "Frecuency" int4, "Name_frec_sufijo" varchar, "Flag_frec_by_batch" bool, "Flag_frec_by_sample" bool, "Priority" int4, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.control_sample;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_control_sample_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcontrol_sample int4, idtype_sample_control int4, idtemplate_method int4, type_analisys int4, name_cs varchar, description varchar, name_value_prefijo varchar, value1 numeric, name_value_sufijo varchar, name_frec_prefijo varchar, frecuency int4, name_frec_sufijo varchar, flag_frec_by_batch bool, flag_frec_by_sample bool, priority int4, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.control_sample WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_control_sample_DeleteByPrimaryKey
(
	p_idcontrol_sample int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.control_sample
 WHERE 
	idcontrol_sample = p_idcontrol_sample; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_control_sample_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.control_sample WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_condition_Insert(int4,int4,varchar,varchar,int4,varchar,varchar,bool,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_control_sample_condition_Insert
(
	p_idcontrol_sample_condition int4 ,
	p_idcontrol_sample int4 = null ,
	p_matchsample varchar(200) = null ,
	p_test varchar(200) = null ,
	p_idcondition int4 = null ,
	p_msgok varchar(15) = null ,
	p_msgerror varchar(15) = null ,
	p_flag_apply bool = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.control_sample_condition
(
	idcontrol_sample,
	matchsample,
	test,
	idcondition,
	msgok,
	msgerror,
	flag_apply,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idcontrol_sample,
	p_matchsample,
	p_test,
	p_idcondition,
	p_msgok,
	p_msgerror,
	p_flag_apply,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idcontrol_sample_condition into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_condition_Update(int4,int4,varchar,varchar,int4,varchar,varchar,bool,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_control_sample_condition_Update
(
	p_idcontrol_sample_condition int4,
	p_idcontrol_sample int4 = null,
	p_matchsample varchar(200) = null,
	p_test varchar(200) = null,
	p_idcondition int4 = null,
	p_msgok varchar(15) = null,
	p_msgerror varchar(15) = null,
	p_flag_apply bool = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.control_sample_condition
SET
	idcontrol_sample = p_idcontrol_sample,
	matchsample = p_matchsample,
	test = p_test,
	idcondition = p_idcondition,
	msgok = p_msgok,
	msgerror = p_msgerror,
	flag_apply = p_flag_apply,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idcontrol_sample_condition = p_idcontrol_sample_condition;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_condition_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_control_sample_condition_SelectByPrimaryKey
(
	p_idcontrol_sample_condition int4
) returns TABLE ("Idcontrol_sample_condition" int4, "Idcontrol_sample" int4, "Matchsample" varchar, "Test" varchar, "Idcondition" int4, "Msgok" varchar, "Msgerror" varchar, "Flag_apply" bool, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.control_sample_condition
	WHERE 
			idcontrol_sample_condition = p_idcontrol_sample_condition;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_condition_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_control_sample_condition_SelectAll()
 returns TABLE ("Idcontrol_sample_condition" int4, "Idcontrol_sample" int4, "Matchsample" varchar, "Test" varchar, "Idcondition" int4, "Msgok" varchar, "Msgerror" varchar, "Flag_apply" bool, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.control_sample_condition;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_condition_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_control_sample_condition_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcontrol_sample_condition int4, idcontrol_sample int4, matchsample varchar, test varchar, idcondition int4, msgok varchar, msgerror varchar, flag_apply bool, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.control_sample_condition WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_condition_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_control_sample_condition_DeleteByPrimaryKey
(
	p_idcontrol_sample_condition int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.control_sample_condition
 WHERE 
	idcontrol_sample_condition = p_idcontrol_sample_condition; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_control_sample_condition_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_control_sample_condition_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.control_sample_condition WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_ah_Insert(int4,varchar,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_ah_Insert
(
	p_idtemplate_method int4 ,
	p_symbol varchar(10) = null ,
	p_idunit_result int2 = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.template_method_ah
(
	idtemplate_method,
	symbol,
	idunit_result,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idtemplate_method,
	p_symbol,
	p_idunit_result,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_ah_Update(int4,varchar,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_ah_Update
(
	p_idtemplate_method int4,
	p_symbol varchar(10) = null,
	p_idunit_result int2 = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.template_method_ah
SET
	idtemplate_method = p_idtemplate_method,
	symbol = p_symbol,
	idunit_result = p_idunit_result,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtemplate_method = p_idtemplate_method;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_ah_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_ah_SelectByPrimaryKey
(
	p_idtemplate_method int4
) returns TABLE ("Idtemplate_method" int4, "Symbol" varchar, "Idunit_result" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_ah
	WHERE 
			idtemplate_method = p_idtemplate_method;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_ah_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_template_method_ah_SelectAll()
 returns TABLE ("Idtemplate_method" int4, "Symbol" varchar, "Idunit_result" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_ah;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_ah_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_ah_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtemplate_method int4, symbol varchar, idunit_result int2, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.template_method_ah WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_ah_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_ah_DeleteByPrimaryKey
(
	p_idtemplate_method int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.template_method_ah
 WHERE 
	idtemplate_method = p_idtemplate_method; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_ah_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_ah_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.template_method_ah WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_Insert(int4,numeric,numeric,bool,numeric,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_Insert
(
	p_idtemplate_method int4 ,
	p_volumen numeric = null ,
	p_aliquot numeric = null ,
	p_dilution_flag bool = null ,
	p_dilution_value numeric = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.template_method_icp
(
	idtemplate_method,
	volumen,
	aliquot,
	dilution_flag,
	dilution_value,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idtemplate_method,
	p_volumen,
	p_aliquot,
	p_dilution_flag,
	p_dilution_value,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_Update(int4,numeric,numeric,bool,numeric,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_Update
(
	p_idtemplate_method int4,
	p_volumen numeric = null,
	p_aliquot numeric = null,
	p_dilution_flag bool = null,
	p_dilution_value numeric = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.template_method_icp
SET
	idtemplate_method = p_idtemplate_method,
	volumen = p_volumen,
	aliquot = p_aliquot,
	dilution_flag = p_dilution_flag,
	dilution_value = p_dilution_value,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtemplate_method = p_idtemplate_method;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_SelectByPrimaryKey
(
	p_idtemplate_method int4
) returns TABLE ("Idtemplate_method" int4, "Volumen" numeric, "Aliquot" numeric, "Dilution_flag" bool, "Dilution_value" numeric, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_icp
	WHERE 
			idtemplate_method = p_idtemplate_method;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_SelectAll()
 returns TABLE ("Idtemplate_method" int4, "Volumen" numeric, "Aliquot" numeric, "Dilution_flag" bool, "Dilution_value" numeric, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_icp;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtemplate_method int4, volumen numeric, aliquot numeric, dilution_flag bool, dilution_value numeric, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.template_method_icp WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_DeleteByPrimaryKey
(
	p_idtemplate_method int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.template_method_icp
 WHERE 
	idtemplate_method = p_idtemplate_method; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.template_method_icp WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_gr_Insert(int4,numeric,numeric,numeric,numeric,numeric,numeric,varchar,numeric,numeric,int2,bool,int2,numeric,numeric,numeric,bool,numeric,numeric,numeric,bool,numeric,numeric,numeric,date,int2,int2,int2,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_gr_Insert
(
	p_idtemplate_method int4 ,
	p_weight numeric = null ,
	p_weight_incertitude numeric = null ,
	p_reading_min numeric = null ,
	p_reading_max numeric = null ,
	p_reason_rep numeric = null ,
	p_error_allowed numeric = null ,
	p_symbol varchar(10) = null ,
	p_law_limit_bottom numeric = null ,
	p_law_limit_top numeric = null ,
	p_num_decimal int2 = null ,
	p_flag_mr bool = null ,
	p_idmr_detail int2 = null ,
	p_mr_incertitude numeric = null ,
	p_blk_max numeric = null ,
	p_reproducibility numeric = null ,
	p_flagsamfortify bool = null ,
	p_samfortisol numeric = null ,
	p_samfortialiquot numeric = null ,
	p_samfortireproducibility numeric = null ,
	p_flagblkfortify bool = null ,
	p_blkfortisol numeric = null ,
	p_blkfortialiquot numeric = null ,
	p_blkfortireproducibility numeric = null ,
	p_date_allowed_error date = null ,
	p_idunit_result int2 = null ,
	p_num_samples int2 = null ,
	p_num_days int2 = null ,
	p_limit_samples int2 = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.template_method_gr
(
	idtemplate_method,
	weight,
	weight_incertitude,
	reading_min,
	reading_max,
	reason_rep,
	error_allowed,
	symbol,
	law_limit_bottom,
	law_limit_top,
	num_decimal,
	flag_mr,
	idmr_detail,
	mr_incertitude,
	blk_max,
	reproducibility,
	flagsamfortify,
	samfortisol,
	samfortialiquot,
	samfortireproducibility,
	flagblkfortify,
	blkfortisol,
	blkfortialiquot,
	blkfortireproducibility,
	date_allowed_error,
	idunit_result,
	num_samples,
	num_days,
	limit_samples,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idtemplate_method,
	p_weight,
	p_weight_incertitude,
	p_reading_min,
	p_reading_max,
	p_reason_rep,
	p_error_allowed,
	p_symbol,
	p_law_limit_bottom,
	p_law_limit_top,
	p_num_decimal,
	p_flag_mr,
	p_idmr_detail,
	p_mr_incertitude,
	p_blk_max,
	p_reproducibility,
	p_flagsamfortify,
	p_samfortisol,
	p_samfortialiquot,
	p_samfortireproducibility,
	p_flagblkfortify,
	p_blkfortisol,
	p_blkfortialiquot,
	p_blkfortireproducibility,
	p_date_allowed_error,
	p_idunit_result,
	p_num_samples,
	p_num_days,
	p_limit_samples,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

);
get diagnostics result = ROW_COUNT;return result;


END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_gr_Update(int4,numeric,numeric,numeric,numeric,numeric,numeric,varchar,numeric,numeric,int2,bool,int2,numeric,numeric,numeric,bool,numeric,numeric,numeric,bool,numeric,numeric,numeric,date,int2,int2,int2,int2,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_gr_Update
(
	p_idtemplate_method int4,
	p_weight numeric = null,
	p_weight_incertitude numeric = null,
	p_reading_min numeric = null,
	p_reading_max numeric = null,
	p_reason_rep numeric = null,
	p_error_allowed numeric = null,
	p_symbol varchar(10) = null,
	p_law_limit_bottom numeric = null,
	p_law_limit_top numeric = null,
	p_num_decimal int2 = null,
	p_flag_mr bool = null,
	p_idmr_detail int2 = null,
	p_mr_incertitude numeric = null,
	p_blk_max numeric = null,
	p_reproducibility numeric = null,
	p_flagsamfortify bool = null,
	p_samfortisol numeric = null,
	p_samfortialiquot numeric = null,
	p_samfortireproducibility numeric = null,
	p_flagblkfortify bool = null,
	p_blkfortisol numeric = null,
	p_blkfortialiquot numeric = null,
	p_blkfortireproducibility numeric = null,
	p_date_allowed_error date = null,
	p_idunit_result int2 = null,
	p_num_samples int2 = null,
	p_num_days int2 = null,
	p_limit_samples int2 = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.template_method_gr
SET
	idtemplate_method = p_idtemplate_method,
	weight = p_weight,
	weight_incertitude = p_weight_incertitude,
	reading_min = p_reading_min,
	reading_max = p_reading_max,
	reason_rep = p_reason_rep,
	error_allowed = p_error_allowed,
	symbol = p_symbol,
	law_limit_bottom = p_law_limit_bottom,
	law_limit_top = p_law_limit_top,
	num_decimal = p_num_decimal,
	flag_mr = p_flag_mr,
	idmr_detail = p_idmr_detail,
	mr_incertitude = p_mr_incertitude,
	blk_max = p_blk_max,
	reproducibility = p_reproducibility,
	flagsamfortify = p_flagsamfortify,
	samfortisol = p_samfortisol,
	samfortialiquot = p_samfortialiquot,
	samfortireproducibility = p_samfortireproducibility,
	flagblkfortify = p_flagblkfortify,
	blkfortisol = p_blkfortisol,
	blkfortialiquot = p_blkfortialiquot,
	blkfortireproducibility = p_blkfortireproducibility,
	date_allowed_error = p_date_allowed_error,
	idunit_result = p_idunit_result,
	num_samples = p_num_samples,
	num_days = p_num_days,
	limit_samples = p_limit_samples,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtemplate_method = p_idtemplate_method;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_gr_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_gr_SelectByPrimaryKey
(
	p_idtemplate_method int4
) returns TABLE ("Idtemplate_method" int4, "Weight" numeric, "Weight_incertitude" numeric, "Reading_min" numeric, "Reading_max" numeric, "Reason_rep" numeric, "Error_allowed" numeric, "Symbol" varchar, "Law_limit_bottom" numeric, "Law_limit_top" numeric, "Num_decimal" int2, "Flag_mr" bool, "Idmr_detail" int2, "Mr_incertitude" numeric, "Blk_max" numeric, "Reproducibility" numeric, "Flagsamfortify" bool, "Samfortisol" numeric, "Samfortialiquot" numeric, "Samfortireproducibility" numeric, "Flagblkfortify" bool, "Blkfortisol" numeric, "Blkfortialiquot" numeric, "Blkfortireproducibility" numeric, "Date_allowed_error" date, "Idunit_result" int2, "Num_samples" int2, "Num_days" int2, "Limit_samples" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_gr
	WHERE 
			idtemplate_method = p_idtemplate_method;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_gr_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_template_method_gr_SelectAll()
 returns TABLE ("Idtemplate_method" int4, "Weight" numeric, "Weight_incertitude" numeric, "Reading_min" numeric, "Reading_max" numeric, "Reason_rep" numeric, "Error_allowed" numeric, "Symbol" varchar, "Law_limit_bottom" numeric, "Law_limit_top" numeric, "Num_decimal" int2, "Flag_mr" bool, "Idmr_detail" int2, "Mr_incertitude" numeric, "Blk_max" numeric, "Reproducibility" numeric, "Flagsamfortify" bool, "Samfortisol" numeric, "Samfortialiquot" numeric, "Samfortireproducibility" numeric, "Flagblkfortify" bool, "Blkfortisol" numeric, "Blkfortialiquot" numeric, "Blkfortireproducibility" numeric, "Date_allowed_error" date, "Idunit_result" int2, "Num_samples" int2, "Num_days" int2, "Limit_samples" int2, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_gr;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_gr_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_gr_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtemplate_method int4, weight numeric, weight_incertitude numeric, reading_min numeric, reading_max numeric, reason_rep numeric, error_allowed numeric, symbol varchar, law_limit_bottom numeric, law_limit_top numeric, num_decimal int2, flag_mr bool, idmr_detail int2, mr_incertitude numeric, blk_max numeric, reproducibility numeric, flagsamfortify bool, samfortisol numeric, samfortialiquot numeric, samfortireproducibility numeric, flagblkfortify bool, blkfortisol numeric, blkfortialiquot numeric, blkfortireproducibility numeric, date_allowed_error date, idunit_result int2, num_samples int2, num_days int2, limit_samples int2, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.template_method_gr WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_gr_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_gr_DeleteByPrimaryKey
(
	p_idtemplate_method int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.template_method_gr
 WHERE 
	idtemplate_method = p_idtemplate_method; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_gr_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_gr_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.template_method_gr WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_wavelength_Insert(int4,int2,varchar,varchar,numeric,numeric,numeric,numeric,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_element_wavelength_Insert
(
	p_idelement_wavelength int4 ,
	p_idelement int2 = null ,
	p_wavelength varchar(8) = null ,
	p_element_wavelength varchar(25) = null ,
	p_idl_axial numeric = null ,
	p_idl_radial numeric = null ,
	p_lineality_axial numeric = null ,
	p_lineality_radial numeric = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.element_wavelength
(
	idelement,
	wavelength,
	element_wavelength,
	idl_axial,
	idl_radial,
	lineality_axial,
	lineality_radial,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idelement,
	p_wavelength,
	p_element_wavelength,
	p_idl_axial,
	p_idl_radial,
	p_lineality_axial,
	p_lineality_radial,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idelement_wavelength into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_wavelength_Update(int4,int2,varchar,varchar,numeric,numeric,numeric,numeric,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_element_wavelength_Update
(
	p_idelement_wavelength int4,
	p_idelement int2 = null,
	p_wavelength varchar(8) = null,
	p_element_wavelength varchar(25) = null,
	p_idl_axial numeric = null,
	p_idl_radial numeric = null,
	p_lineality_axial numeric = null,
	p_lineality_radial numeric = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.element_wavelength
SET
	idelement = p_idelement,
	wavelength = p_wavelength,
	element_wavelength = p_element_wavelength,
	idl_axial = p_idl_axial,
	idl_radial = p_idl_radial,
	lineality_axial = p_lineality_axial,
	lineality_radial = p_lineality_radial,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idelement_wavelength = p_idelement_wavelength;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_wavelength_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_element_wavelength_SelectByPrimaryKey
(
	p_idelement_wavelength int4
) returns TABLE ("Idelement_wavelength" int4, "Idelement" int2, "Wavelength" varchar, "Element_wavelength" varchar, "Idl_axial" numeric, "Idl_radial" numeric, "Lineality_axial" numeric, "Lineality_radial" numeric, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.element_wavelength
	WHERE 
			idelement_wavelength = p_idelement_wavelength;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_wavelength_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_element_wavelength_SelectAll()
 returns TABLE ("Idelement_wavelength" int4, "Idelement" int2, "Wavelength" varchar, "Element_wavelength" varchar, "Idl_axial" numeric, "Idl_radial" numeric, "Lineality_axial" numeric, "Lineality_radial" numeric, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.element_wavelength;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_wavelength_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_element_wavelength_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idelement_wavelength int4, idelement int2, wavelength varchar, element_wavelength varchar, idl_axial numeric, idl_radial numeric, lineality_axial numeric, lineality_radial numeric, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.element_wavelength WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_wavelength_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_element_wavelength_DeleteByPrimaryKey
(
	p_idelement_wavelength int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.element_wavelength
 WHERE 
	idelement_wavelength = p_idelement_wavelength; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_element_wavelength_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_element_wavelength_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.element_wavelength WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_compound_Insert(int4,varchar,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_compound_Insert
(
	p_idcompound int4 ,
	p_name_compound varchar(20) = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.compound
(
	name_compound,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_name_compound,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idcompound into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_compound_Update(int4,varchar,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_compound_Update
(
	p_idcompound int4,
	p_name_compound varchar(20) = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.compound
SET
	name_compound = p_name_compound,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idcompound = p_idcompound;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_compound_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_compound_SelectByPrimaryKey
(
	p_idcompound int4
) returns TABLE ("Idcompound" int4, "Name_compound" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.compound
	WHERE 
			idcompound = p_idcompound;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_compound_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_compound_SelectAll()
 returns TABLE ("Idcompound" int4, "Name_compound" varchar, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.compound;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_compound_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_compound_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idcompound int4, name_compound varchar, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.compound WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_compound_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_compound_DeleteByPrimaryKey
(
	p_idcompound int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.compound
 WHERE 
	idcompound = p_idcompound; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_compound_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_compound_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.compound WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_detail_Insert(int4,int4,int4,int2,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_detail_Insert
(
	p_idtemplate_method_icp_detail int4 ,
	p_idtemplate_method int4 = null ,
	p_idelement_wavelength int4 = null ,
	p_idelement int2 = null ,
	p_idl numeric = null ,
	p_mdl_axial numeric = null ,
	p_mdl_radial numeric = null ,
	p_ldr numeric = null ,
	p_ldr_aux numeric = null ,
	p_num_decimal numeric = null ,
	p_std1 numeric = null ,
	p_std2 numeric = null ,
	p_ipc numeric = null ,
	p_lfb numeric = null ,
	p_qc numeric = null ,
	p_priority numeric = null ,
	p_lfm numeric = null ,
	p_limit_top numeric = null ,
	p_usernew varchar(20) = null ,
	p_datenew timestamp = null ,
	p_useredit varchar(20) = null ,
	p_dateedit timestamp = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.template_method_icp_detail
(
	idtemplate_method,
	idelement_wavelength,
	idelement,
	idl,
	mdl_axial,
	mdl_radial,
	ldr,
	ldr_aux,
	num_decimal,
	std1,
	std2,
	ipc,
	lfb,
	qc,
	priority,
	lfm,
	limit_top,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idtemplate_method,
	p_idelement_wavelength,
	p_idelement,
	p_idl,
	p_mdl_axial,
	p_mdl_radial,
	p_ldr,
	p_ldr_aux,
	p_num_decimal,
	p_std1,
	p_std2,
	p_ipc,
	p_lfb,
	p_qc,
	p_priority,
	p_lfm,
	p_limit_top,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idtemplate_method_icp_detail into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_detail_Update(int4,int4,int4,int2,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,numeric,varchar,timestamp,varchar,timestamp,bool);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_detail_Update
(
	p_idtemplate_method_icp_detail int4,
	p_idtemplate_method int4 = null,
	p_idelement_wavelength int4 = null,
	p_idelement int2 = null,
	p_idl numeric = null,
	p_mdl_axial numeric = null,
	p_mdl_radial numeric = null,
	p_ldr numeric = null,
	p_ldr_aux numeric = null,
	p_num_decimal numeric = null,
	p_std1 numeric = null,
	p_std2 numeric = null,
	p_ipc numeric = null,
	p_lfb numeric = null,
	p_qc numeric = null,
	p_priority numeric = null,
	p_lfm numeric = null,
	p_limit_top numeric = null,
	p_usernew varchar(20) = null,
	p_datenew timestamp = null,
	p_useredit varchar(20) = null,
	p_dateedit timestamp = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.template_method_icp_detail
SET
	idtemplate_method = p_idtemplate_method,
	idelement_wavelength = p_idelement_wavelength,
	idelement = p_idelement,
	idl = p_idl,
	mdl_axial = p_mdl_axial,
	mdl_radial = p_mdl_radial,
	ldr = p_ldr,
	ldr_aux = p_ldr_aux,
	num_decimal = p_num_decimal,
	std1 = p_std1,
	std2 = p_std2,
	ipc = p_ipc,
	lfb = p_lfb,
	qc = p_qc,
	priority = p_priority,
	lfm = p_lfm,
	limit_top = p_limit_top,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idtemplate_method_icp_detail = p_idtemplate_method_icp_detail;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_detail_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_detail_SelectByPrimaryKey
(
	p_idtemplate_method_icp_detail int4
) returns TABLE ("Idtemplate_method_icp_detail" int4, "Idtemplate_method" int4, "Idelement_wavelength" int4, "Idelement" int2, "Idl" numeric, "Mdl_axial" numeric, "Mdl_radial" numeric, "Ldr" numeric, "Ldr_aux" numeric, "Num_decimal" numeric, "Std1" numeric, "Std2" numeric, "Ipc" numeric, "Lfb" numeric, "Qc" numeric, "Priority" numeric, "Lfm" numeric, "Limit_top" numeric, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_icp_detail
	WHERE 
			idtemplate_method_icp_detail = p_idtemplate_method_icp_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_detail_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_detail_SelectAll()
 returns TABLE ("Idtemplate_method_icp_detail" int4, "Idtemplate_method" int4, "Idelement_wavelength" int4, "Idelement" int2, "Idl" numeric, "Mdl_axial" numeric, "Mdl_radial" numeric, "Ldr" numeric, "Ldr_aux" numeric, "Num_decimal" numeric, "Std1" numeric, "Std2" numeric, "Ipc" numeric, "Lfb" numeric, "Qc" numeric, "Priority" numeric, "Lfm" numeric, "Limit_top" numeric, "Usernew" varchar, "Datenew" timestamp, "Useredit" varchar, "Dateedit" timestamp, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.template_method_icp_detail;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_detail_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_detail_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idtemplate_method_icp_detail int4, idtemplate_method int4, idelement_wavelength int4, idelement int2, idl numeric, mdl_axial numeric, mdl_radial numeric, ldr numeric, ldr_aux numeric, num_decimal numeric, std1 numeric, std2 numeric, ipc numeric, lfb numeric, qc numeric, priority numeric, lfm numeric, limit_top numeric, usernew varchar, datenew timestamp, useredit varchar, dateedit timestamp, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.template_method_icp_detail WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_detail_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_detail_DeleteByPrimaryKey
(
	p_idtemplate_method_icp_detail int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.template_method_icp_detail
 WHERE 
	idtemplate_method_icp_detail = p_idtemplate_method_icp_detail; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_template_method_icp_detail_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_template_method_icp_detail_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.template_method_icp_detail WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_factor_estequiometrico_Insert(int4,int4,int4,numeric,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_factor_estequiometrico_Insert
(
	p_idfactor_estequiometrico int4 ,
	p_idcompound int4 = null ,
	p_idelement int4 = null ,
	p_factor numeric = null ,
	p_usernew varchar(20) = null ,
	p_datenew date = null ,
	p_useredit varchar(20) = null ,
	p_dateedit date = null ,
	p_status bool = null 

)returns int8 AS $$
Declare result int8;
BEGIN

INSERT INTO public.factor_estequiometrico
(
	idcompound,
	idelement,
	factor,
	usernew,
	datenew,
	useredit,
	dateedit,
	status

)
VALUES
(
	p_idcompound,
	p_idelement,
	p_factor,
	p_usernew,
	p_datenew,
	p_useredit,
	p_dateedit,
	p_status

)returning idfactor_estequiometrico into result;
	return result;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_factor_estequiometrico_Update(int4,int4,int4,numeric,varchar,date,varchar,date,bool);
CREATE OR REPLACE FUNCTION public.sp_factor_estequiometrico_Update
(
	p_idfactor_estequiometrico int4,
	p_idcompound int4 = null,
	p_idelement int4 = null,
	p_factor numeric = null,
	p_usernew varchar(20) = null,
	p_datenew date = null,
	p_useredit varchar(20) = null,
	p_dateedit date = null,
	p_status bool = null

)returns int8 AS $$
Declare result int8;
BEGIN

UPDATE public.factor_estequiometrico
SET
	idcompound = p_idcompound,
	idelement = p_idelement,
	factor = p_factor,
	usernew = p_usernew,
	datenew = p_datenew,
	useredit = p_useredit,
	dateedit = p_dateedit,
	status = p_status
 WHERE 
	idfactor_estequiometrico = p_idfactor_estequiometrico;
	get diagnostics result = ROW_COUNT;
	return result;
END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_factor_estequiometrico_SelectByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_factor_estequiometrico_SelectByPrimaryKey
(
	p_idfactor_estequiometrico int4
) returns TABLE ("Idfactor_estequiometrico" int4, "Idcompound" int4, "Idelement" int4, "Factor" numeric, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.factor_estequiometrico
	WHERE 
			idfactor_estequiometrico = p_idfactor_estequiometrico;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_factor_estequiometrico_SelectAll();
CREATE OR REPLACE FUNCTION public.sp_factor_estequiometrico_SelectAll()
 returns TABLE ("Idfactor_estequiometrico" int4, "Idcompound" int4, "Idelement" int4, "Factor" numeric, "Usernew" varchar, "Datenew" date, "Useredit" varchar, "Dateedit" date, "Status" bool
)AS $$
BEGIN

	return query
	SELECT *
	FROM public.factor_estequiometrico;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_factor_estequiometrico_SelectByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_factor_estequiometrico_SelectByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
 returns TABLE (idfactor_estequiometrico int4, idcompound int4, idelement int4, factor numeric, usernew varchar, datenew date, useredit varchar, dateedit date, status bool
)AS $$
BEGIN


	return query EXECUTE 'SELECT * FROM public.factor_estequiometrico WHERE '|| FieldName ||' = '|| Value 
	USING Value;

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_factor_estequiometrico_DeleteByPrimaryKey(int4);
CREATE OR REPLACE FUNCTION public.sp_factor_estequiometrico_DeleteByPrimaryKey
(
	p_idfactor_estequiometrico int4
)
returns int4 AS $$
declare result int;
BEGIN
DELETE FROM public.factor_estequiometrico
 WHERE 
	idfactor_estequiometrico = p_idfactor_estequiometrico; 
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;

drop function if exists public.sp_factor_estequiometrico_DeleteByField(varchar,varchar);
CREATE OR REPLACE FUNCTION public.sp_factor_estequiometrico_DeleteByField
(
	FieldName varchar(100),
	Value varchar(1000)
)
returns int4 AS $$
declare result int;
BEGIN


	EXECUTE 'DELETE FROM public.factor_estequiometrico WHERE ' || FieldName  ||' = '|| Value 
	USING Value;
	get diagnostics result = ROW_COUNT;
	RETURN  result;	

END;
$$ LANGUAGE plpgsql;
