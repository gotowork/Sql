-- drop table Configuration
CREATE TABLE Configuration
(
	idconfiguration	smallint default nextval('configuration_idconfiguration_seq') primary key,
	nom_configuration	varchar(30),
	value_configuration	varchar(300)
);

CREATE TABLE Group_access
(
	idgroup_access	serial primary key,
	group_access_name	varchar(60)
);

CREATE TABLE Access (
       idaccess             serial primary key,
       cod_access           int NOT NULL,
       access_name          varchar(60) NOT NULL,
       description          varchar(200) NULL,
       command              varchar(1000) NULL,
       group                varchar(50) NULL,
       idgroup_access 	    int REFERENCES group_access
);

-- drop table module
CREATE TABLE Module 
(
	cod_module	varchar(4) primary key,
	nom_module	varchar(30),
	description	varchar(100)
);

CREATE TABLE Area
(
	cod_area	varchar(4) primary key,
	nom_area	varchar(30),
	description	varchar(100)
);

-- drop table process
CREATE TABLE Process 
(
	cod_process	varchar(4) primary key,
	nom_process	varchar(30),
	description	varchar(100),
	cod_module	varchar(4) references module(cod_module),
	cod_area	varchar(4) references area(cod_area)	
);




-- drop table person
CREATE TABLE person
(
	idperson 	int2 default nextval('person_idperson_seq') primary key,
	cod_person	varchar(15),
	type_document	smallint,
	last_name1	varchar(50),
	last_name2	varchar(50),
	names_person	varchar(100),
	allname		varchar(200),
	gender		char(1),
	domicile	varchar(20),
	mail 		varchar(50),
	phone		varchar(15),
	cellphone	varchar(15),
	-- faltan campos
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table analist
CREATE TABLE Analist
(
	idanalist 	int4 primary key references person(idperson),
	cod_analist	varchar(20),
	date_ini	date,
	contact1	int2 references person(idperson),
	contact2	int2 references person(idperson),
	-- faltan campos
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table company
CREATE TABLE company
(
	idcompany 	int2 default nextval('company_idcompany_seq') primary key,
	cod_company	varchar(20),
	ruc		varchar(20),
	business_name	varchar(30),
	type_company	char(1), 	-- C:cliente, P:proveedor,
	domicile	varchar(200),	
	mail 		varchar(50),
	phone_client	varchar(15),
	idcontact1 	int2 references person(idperson),
	idcontact2	int2 references person(idperson),
	-- faltan campos
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table Tablempn
CREATE TABLE Tablempn
(
	idtablempn 	int2 default nextval('tablempn_idtablempn_seq') primary key,
	combination_pos varchar(5),
	mpn_index	varchar(5),
	limit_lower	decimal(5,3),
	limit_high	decimal(5,3)
);

-- drop table element
CREATE TABLE Element
(
	idelement 	int2 default nextval('element_idelement_seq') primary key,
	cod_element	varchar(10),
	name_element	varchar(50),
	description 	varchar(200),
	native_element	varchar(5),
	type_element	char(1),
	UserNew		varchar(50),
	DateNew		date,
	UserEdit	varchar(50),
	DateEdit	date,
	Status		boolean
);

-- drop table measurement_unit
CREATE TABLE measurement_unit
(
	idunit int2 default nextval('measurement_unit_iduni_seq') primary key,
	name_unit varchar(6),
	description varchar(20),	
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table convert_unit_measurement
CREATE TABLE convert_unit_measurement
(
	idconvert int2 default nextval('convert_unit_measurement_idconvert_seq') primary key,
	den_unit1 varchar(6),
	den_unit2 varchar(6),
	idunit1 	int2 references measurement_unit(idunit),
	idunit2		int2 references measurement_unit(idunit),
	factor 		decimal(10,5),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table digestion_method
CREATE TABLE digestion_method
(
	cod_digestion_method varchar(5) primary key,
	name_digestion_method varchar(20),
	status		boolean
);

-- drop table serie
CREATE TABLE serie
(
	cod_serie 	varchar(10) primary key,	
	nom_serie	varchar(20),
	num_digits	int2,	
	DateInit	date,
	DateEnd		date,
	status_serie	boolean,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table mr
CREATE TABLE Mr
(
	idmr 		int2 default nextval('mr_idmr_seq') primary key,		
	cod_mr		varchar(15),
	lot		varchar(12),
	type_mr 	char(1),      	-- C:certificado, I:interno
	type_material	char(1),	-- M:mineral, B:carbon, C:concentrado	
	status_mr	boolean,	-- vigencia, caducado
	manufaturer	int2 references company(idcompany),
	certifier	int2 references company(idcompany),
	fbegin_validity	date,
	fend_validity	date,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean	
);

-- drop table Mr_jar
CREATE TABLE Mr_jar
(
	idMr_jar 	int2 default nextval('mr_jar_idmr_jar_seq') primary key,
	idmr 		int2 references Mr (idmr),
	idcorrelative	int2,
	description 	varchar(20),
	observation	varchar(100),
	fbegin		date,
	fend		date,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table mr_detail
CREATE TABLE Mr_Detail
(
	idmr_detail 	int2 default nextval('mr_detail_idmr_detail_seq') primary key,	
	idmr		int2 references mr(idmr),
	analyte 	int2 references Element(idelement),
	cod_element	varchar(10),
	nom_detail	varchar(10),
	incertitude	decimal(10,5),
	nominal_value	decimal(10,5),
	idunit1		int2 references measurement_unit(idunit),
	document_ref	varchar(1000),	
	dev		decimal(10,5),
	dev_labs	decimal(10,5),
	flag_provitional	boolean,
	cod_digestion_method varchar(5) references digestion_method(cod_digestion_method),
	observation	varchar(100),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table type_sample
CREATE TABLE type_sample
(	
	cod_type_sample varchar(5) primary key, ---  tipo = (mineral, solucion, ..., etc)
	prefix 		varchar(5),
	name_type_sample varchar(20),
	description varchar(100),
	UserNew		varchar(50),
	DateNew		date,
	UserEdit	varchar(50),
	DateEdit	date,
	Status		boolean
);

-- drop table correlative
CREATE TABLE correlative
(
	cod_type_sample varchar(5) references type_sample(cod_type_sample),
	cod_serie	varchar(10) references serie(cod_serie),
	prefix		varchar(10),
	correlative	int4,
	mreach15	bool,
	num_digits	int2,
	UserNew		varchar(50),
	DateNew		date,
	UserEdit	varchar(50),
	DateEdit	date,
	Status		boolean,
	primary key(cod_type_sample, cod_serie)
);

-- drop table description_sample
CREATE TABLE description_sample
(
	cod_des_sample varchar(5) primary key,
	description	varchar(100),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table template_method
CREATE TABLE template_method
(
	idtemplate_method serial primary key,
	num_version 	int2,
	cod_template_method varchar(20),
	cod_repetition  int2,        -- 1:simple, 2:duplicado, 3:triplicado, 4:cuadruplicado, 8:octuplicado
	title 		varchar(200),
	abbreviation	varchar(15),		
	name_method 	varchar(50),	
	type_analisys	char(1),     -- A:AA, V:Volumentria, G:Gravimetría, I:Icp, F:Fotometría	
	recognized	boolean,
	idelement 	int4 references Element(idelement),
	cod_type_sample	varchar(5) references type_sample(cod_type_sample),
	cod_digestion_method varchar(5) references digestion_method(cod_digestion_method),	
	cost_method	decimal(10,5),
	idunit_result	int2 references measurement_unit(idunit),
	-- field trace
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table template_method_aa
CREATE TABLE template_method_aa
(
	idtemplate_method int4 references template_method(idtemplate_method) primary key,
	-- weight and readings
	weight		decimal(10,5),
	weight_incertitude	decimal(10,5),
	volumen		decimal(10,5),
	reading_min	decimal(10,5),
	reading_max	decimal(10,5),
	dilution2	decimal(10,5),
	dilution3	decimal(10,5),
	reason_rep	decimal(10,5),
	error_allowed	decimal(10,5),
	
	-- Results
	symbol		varchar(10),	
	law_limit_bottom	decimal(10,5),
	law_limit_top		decimal(10,5),

	-- calibration
	idunit_calib	int2 references measurement_unit(idunit),
	absorvance	decimal(10,5),
	abs_incertitude	decimal(10,5),
	std_verif	decimal(10,5),
	std_verif_incertitude	decimal(10,5),
	wave_long	decimal(12,5),
	num_decimal	int2,
		
	-- material reference
	idmr_detail 	smallint references mr_detail(idmr_detail),
	mr_incertitude	decimal(10,5),
	blk_max		decimal(10,5),
	reproducibility	decimal(10,5),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean,
	date_allowed_error date
);

-- drop table calib
CREATE TABLE calib
(
	idcalib bigserial primary key,
	order_calib	int2,
	name_calib 	varchar(15),
	concentration	decimal(10,5),
	idtemplate_method int4 references template_method(idtemplate_method)
);

-- drop table tray
CREATE TABLE Tray
(
	idtray 		int2 default nextval('tray_idtray_seq') primary key,
	name_tray	varchar(7),
	num_cols	int2,
	num_rows	int2,
	repetition	smallint,	-- 1:simple, 2:duplicado, 3:triplicado, 4:cuadruplicado, 8:octuplicado
	cost_method 	decimal(6,2),	
	type_tray 	char(1),   -- G:gradilla, B:bandeja
	size_tray	int2,
	
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean		
);

-- drop table template_method_detail
CREATE TABLE template_method_detail
(
	idtemplate_method_detail serial primary key,	
	name_variable 	varchar(30),
	alias_variable 	varchar(30),
	value_variable 	decimal(10,5),
	type_variable	char(1), -- (C=constante ó V=variable)
	group_variable 	char(1), -- (H=head or D=detail)
	visible 	boolean,
	idtemplate_method int4 references template_method(idtemplate_method),
	status 		boolean,
	
);

-- drop table tree_expression
CREATE TABLE tree_expression
(
	idtree_expression bigserial primary key,
	name_variable 	varchar(20),	
	id		int,
	parentid	int,
	expression	varchar(500),
	status 		boolean,
	idtemplate_method int4 references template_method(idtemplate_method),
	idtemplate_method_detail int8 references template_method_detail(idtemplate_method_detail)
);

-- drop table condition_variable
CREATE TABLE condition_variable
(
	idcondition_variable serial primary key,
	name_variable varchar(30),
	operation varchar(10),
	name_value1 varchar(40),
	name_value2 varchar(40),
	idvalue1 int4 references template_method_detail(idtemplate_method_detail),
	idvalue2 int4 references template_method_detail(idtemplate_method_detail),
	message varchar(100),
	status boolean,
	idtemplate_method int4 references template_method(idtemplate_method),
	idtemplate_method_detail int8 references template_method_detail(idtemplate_method_detail)
);



-- drop table Recep_Sample
CREATE TABLE Recep_Sample
(
	idrecep_sample bigserial primary key,
	cod_recep_sample	varchar(15),
	date_reception	date,
	type_post	char(1), -- Seleccionar (Personal, e - mail, curier, Emp. Transp, FAX, Otro)
	phone_client	varchar(15),
	idcompany	int2 references company(idcompany),
	idcontact1	int2 references person(idperson),
	idcontact2	int2 references person(idperson),
	cod_serie	varchar(10) references serie(cod_serie),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean,
	date_result	date
);

-- drop table Recep_Sample_Detail
CREATE TABLE Recep_Sample_Detail
(
	idrecep_sample_detail bigserial primary key,
	order_sample	int2,							-- NEW 
	cod_sample	varchar(12),
	procedence	varchar(300),
	name_sample	varchar(300),
	amount_weight	decimal(10,5),
	cod_interno	int8,
	flag_reject	boolean,
	flag_counter_sample boolean,
	cost_sample	decimal(6,2),
	analisys_time	int2,
	flag_control_sample	boolean,					-- NEW 
	des_link_attach	varchar(1000),
	link_attach	varchar(300),				-- "\\folder\especificaciones.doc","\\carpeta\fwf.pdf","\\otracarpeta\muestras.pdf"
	cod_type_sample varchar(5) references type_sample(cod_type_sample),
	cod_des_sample 	varchar(5) references description_sample(cod_des_sample),
	idrecep_sample 	int8 references recep_sample(idrecep_sample)
);

-- drop table recep_elem
CREATE TABLE Recep_Elem
(
	idrecep_elem bigserial primary key,
	idelement int2 references element(idelement),
	idtemplate_method int4 references template_method(idtemplate_method),
	idunit int2 references measurement_unit(idunit),
	abbreviation varchar(15),
	name_unit varchar(6),
	percent_repetition int2,
	idrecep_sample 	int8 references recep_sample(idrecep_sample)
);

-- drop table Recep_Sample_Report
CREATE TABLE Recep_Sample_Report
(
	idrecep_sample_report bigserial primary key,
	order_report	int2,
	cod_recep_sample_report	varchar(100),
	report_status 	int2, -- 1:en creacion, 2:reportado, 3:anulado
	type_report 	int2, -- 1:parcial, 2:final
	idrecep_sample 	int8 references Recep_Sample(idrecep_sample),
	flag_rpt_email	boolean, -- fue enviado por correo
	flag_rpt_print	boolean, -- fue impreso
	flag_rpt_pdf	boolean, -- fue impreso en pdf
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table Recep_Sample_Detail_Elem
CREATE TABLE Recep_Sample_Detail_Elem
(
	idrecep_sample_detail_elem bigserial primary key,
	idrecep_sample 	int8 references recep_sample(idrecep_sample),
	idrecep_sample_detail int8 references recep_sample_detail(idrecep_sample_detail),
	idelement int2 references element(idelement),
	idtemplate_method int4 references template_method(idtemplate_method),
	cost_method 	decimal(6,2),
	analysis_time	int2,
	str_result_analysis varchar(15),
	result_analysis decimal(10,5),
	idunit 		int2 references measurement_unit(idunit),
	idcompany	int4 references company(idcompany),
	UNIQUE(idrecep_sample, idrecep_sample_detail, idelement, idtemplate_method, idunit)
);

-- drop table Cells_Reported
CREATE TABLE Cells_Reported
(
	idcell_reported bigserial primary key,
	idrecep_sample_detail_elem int8 references recep_sample_detail_elem(idrecep_sample_detail_elem),
	idrecep_sample_report int8 references recep_sample_report(idrecep_sample_report),
	idtemplate_method int4 references template_method(idtemplate_method),
	idrecep_sample_detail int8 references recep_sample_detail(idrecep_sample_detail),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean,
	UNIQUE(idrecep_sample_detail_elem, idrecep_sample_report, idtemplate_method, idrecep_sample_detail)
);

-- drop table Batch
CREATE TABLE Batch
(
	idbatch bigserial primary key,
	name_batch 	varchar(30),
	num_tray	int8,
	idtemplate_method int4 references template_method(idtemplate_method),
	cod_module	varchar(4) references module(cod_module),
	cod_process	varchar(4) references process(cod_process), -- tabla de procesos
	cod_area	varchar(4) references area(cod_area),
	status_process	char(1),	-- W:espera, P:proceso, F:finalizado y N: anulado	
	status 		boolean,
	mri_value	numeric(10,6),	
	description	varchar(100),
	dateedit	timestamp,
	useredit	varchar(20)
);

-- drop table batch_qaqc
CREATE TABLE Batch_qaqc
(
	idbatch_qaqc	bigint primary key references Batch(idbatch),
	qaqc_mri_value	numeric(10,6),
	qaqc_blk_value	numeric(10,6),
	qaqc_mri_error	boolean,
	qaqc_blk_error	boolean,
	usernew		varchar(20),
	datenew		timestamp,
	useredit	varchar(20),
	dateedit	timestamp
);

-- drop table trace_batch
CREATE TABLE Trace_Batch
(
	idtrace_batch	bigserial primary key,
	cod_module	varchar(4) references module(cod_module),
	cod_process	varchar(4) references process(cod_process), -- tabla de procesos
	cod_area	varchar(4) references area(cod_area),	
	idbatch		bigint references batch(idbatch),
	date_in		timestamp,
	date_out	timestamp,
	status_process	char(1),	-- W:espera, P:proceso, F:finalizado y N: anulado
	idtrace_prev	int8 references trace_batch(idtrace_batch),
	idtrace_next	int8 references trace_batch(idtrace_batch),
	observation	varchar(60),
	usernew		varchar(20),
	datenew		timestamp,
	useredit	varchar(20),
	dateedit	timestamp,
	status		boolean
);

-- drop table trace_sample_elem
CREATE TABLE Trace_sample_elem
(
	idtrace_sample_elem	bigserial primary key,
	cod_module	varchar(4) references module(cod_module),
	cod_process	varchar(4) references process(cod_process),
	cod_area	varchar(4) references area(cod_area),
	idrecep_sample_detail_elem int8 references Recep_Sample_Detail_Elem(idrecep_sample_detail_elem),
	idbatch		bigint references batch(idbatch),
	status_process	char(1),	-- W:espera, P:proceso, F:finalizado y N:anulado
	date_in		timestamp,
	date_out	timestamp,
	status_result	smallint,
	idtrace_prev	int8 references trace_sample_elem(idtrace_sample_elem),
	idtrace_next	int8 references trace_sample_elem(idtrace_sample_elem),
	observation	varchar(60),
	usernew		varchar(20),
	datenew		timestamp,
	useredit	varchar(20),
	dateedit	timestamp,
	status		boolean
);

-- drop table Retest
CREATE TABLE Retest
(
	idretest bigserial primary key,	
	idrecep_sample_detail_elem int8 references Recep_Sample_Detail_Elem(idrecep_sample_detail_elem),
	idrecep_sample_detail 		int8 references Recep_Sample_Detail(idrecep_sample_detail),
	origin_batch 	int8 references batch(idbatch),
	destiny_batch 	int8 references batch(idbatch),
	type_retest	char(1), -- R:reportar, V:validación de método, E:entrenamiento,P:parcial 
	date_retest 	date,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit1	varchar(20),
	DateEdit1	date,
	Status		boolean
);


-- drop table Batch_result_aa_qaqc 
CREATE TABLE Batch_Result_AA_Qaqc
(
	idbatch_result_aa_qaqc	bigserial primary key,
	idbatch 	int8 references batch(idbatch),
	idrecep_sample_detail_elem 	int8 references Recep_Sample_Detail_Elem(idrecep_sample_detail_elem),
	idrecep_sample_detail 		int8 references Recep_Sample_Detail(idrecep_sample_detail),
	idrecep_sample 	int8 references recep_sample(idrecep_sample),
	str_result_analysis 		varchar(15),
	result_analysis decimal(10,5),
	status_result 	smallint, 	-- 1:parcial, 2:espera, 3:reensayo, 4:pendiente, 5:aceptado, 6:plausible, 7:incorrecto
					-- 0:espera, 1:incorrecto, 2:plausible, 3:aceptado
	idunit 		int2 references measurement_unit(idunit),
	Qaqc_blk	smallint,
	Qaqc_par	smallint,
	Qaqc_mr		smallint,
	Qaqc_approve_retest	smallint,
	Qaqc_text_obs		varchar(200),
	Qaqc_error		smallint,
	Qaqc_flag_checked	boolean	
);

-- drop table Batch_Detail_AA
CREATE TABLE Batch_Detail_AA
(
	idbatch_detail_aa bigserial primary key,
	num_repetition	int2,		
	idtemplate_method int4 references template_method(idtemplate_method),
	idrecep_sample 	int8 references recep_sample(idrecep_sample),
	idrecep_sample_detail_elem int8 references Recep_Sample_Detail_Elem(idrecep_sample_detail_elem),
	idrecep_sample_detail int8 references Recep_Sample_Detail(idrecep_sample_detail),
	weight	decimal(10,6),	-- peso
	reading	decimal(10,6),	-- lectura
	volumen	decimal(10,6),	-- volumen
	dilua 	decimal(10,6),	-- dilucion 2
	dilub	decimal(10,6),	-- dilucion 3
	factor	decimal(10,6),	-- factor
	rank	decimal(10,6),	-- rango
	law	decimal(10,6),	-- ley parcial
	verify_equip	decimal(10,6), 	-- verificación de equipo
	verify_curve	decimal(10,6),	-- verificación de curva
	flag_dila	boolean,
	flag_dilb	boolean,
	idbatch 	int8 references batch(idbatch),
	idtype_rep 	char(1), 	-- C:Configuracion (1,2,4,8 repeticion), R:muestra repeticion
	sample_mr_blk	char(1),	-- R:mr, B:blanco						-- NEW
	idmr_detail	int2 references Mr_Detail(idmr_detail),						-- NEW 
	idmr_jar	int2 references Mr_jar(idmr_jar),						-- NEW
	UserNew		varchar(20),
	DateNew		date,
	UserEdit1	varchar(20),
	DateEdit1	date,
	idequipment1	int2,
	Status		boolean
);


CREATE TABLE template_method_format
(
	idtemplate_method_format bigserial NOT NULL,
	idtemplate_method integer REFERENCES template_method (idtemplate_method),
	nom_field character varying(40),
	num_decimal smallint
);

CREATE TABLE 

/*
CREATE TABLE Batch_Detail_VC
(
	idbatch_detail_vc int8 primary key,
	num_repetition	int2,		
	idtemplate_method int4 references template_method(idtemplate_method),
	idrecep_sample_detail_elem int8 references Recep_Sample_Detail_Elem(idrecep_sample_detail_elem),
	p1	decimal(10,5),
	l1	decimal(10,5),
	v1	decimal(10,5),
	d1	decimal(10,5),
	f1	decimal(10,5),
	r1	decimal(10,5),
	idbatch 	int8 references batch(idbatch),		
	idtype_rep 	char(2), -- C:Configuracion(1,2,4,8 repeticion), R:muestra repeticion
	UserNew		varchar(20),
	DateNew		date,
	UserEdit1	varchar(20),
	DateEdit1	date,
	idequipment1	int2,
	Status		boolean
);

-- drop table Batch_Detail_Process_AA
CREATE TABLE Batch_Detail_Process_VC
(
	idbatch_detail_vc 	int8 references Batch_Detail(idbatch_detail_vc),
	idprocess	int2 references Process(idprocess),
	status_process	int2,  -- 1:proceso, 2:terminado, 3:observado
	observation	varchar(100), -- descripcion de la observacion
	primary key(idbatch_detail_aa, idprocess)
);

*/


-- drop table corr_modules
CREATE TABLE corr_modules
(	
	cod_module	varchar(20) primary key,	
	name_module	varchar(20),
	prefix		varchar(10),
	correlative	int4,
	num_digits	int2,
	UserNew		varchar(50),
	DateNew		date,
	UserEdit	varchar(50),
	DateEdit	date,
	Status		boolean
);

-- drop table profile_system
CREATE TABLE profile_system
(
	idprofile int2 default nextval('profile_system_idprofile_seq') primary key,
	profile_name varchar(30)
);

-- drop table user_system
CREATE TABLE user_system
(
	iduser int2 default nextval('user_system_iduser_seq') primary key,
	cod_user varchar(30),	
	pwd varchar(32),
	idperson smallint references person(idperson),
	idprofile smallint references profile_system(idprofile),
	UserNew		varchar(50),
	DateNew		date,
	UserEdit	varchar(50),
	DateEdit	date,
	Status		boolean
);


-- drop table process_user_system

CREATE TABLE process_user_system
(
	idprocess_user_system int2 default nextval('process_user_system_seq') primary key,
	cod_process	varchar(4) references process(cod_process),
	cod_module 	varchar(4) references module(cod_module),
	cod_area	varchar(4) references area(cod_area),
	iduser 		smallint references user_system(iduser),
	date_ini	timestamp,
	date_end	timestamp,		
	UserNew		varchar(50),
	DateNew		date,
	UserEdit	varchar(50),
	DateEdit	date,
	Status		boolean
);

