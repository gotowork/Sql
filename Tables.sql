﻿
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
       command              varchar(1000) NULL,group                varchar(50) NULL,
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
	Status		boolean,
	type_person	int   -- 2:cliente, 1:personal de la empresa
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

-- drop table company_person
CREATE TABLE company_person
(
	idcompany_person serial primary key,
	idcompany	smallint references company(idcompany),
	idperson	smallint references person(idperson)	
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
	name_unit 	varchar(6),
	description 	varchar(20),	
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean,
	concentration_unit integer -- 1:masa, 2:volumen
);

-- drop table convert_unit_measurement
CREATE TABLE convert_unit_measurement
(
	idconvert int2 default nextval('convert_unit_measurement_idconvert_seq') primary key,
	den_unit1 	varchar(6),
	den_unit2 	varchar(6),
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
	Status		boolean,
	solid		boolean
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
	primary key(cod_type_sample)
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
	Status		boolean,
	priority_order 	smallint
);

-- drop table compound
CREATE TABLE compound
(
	idcompound	serial primary key,
	name_compound	varchar(20),
	usernew character varying(20),
	datenew date,
	useredit character varying(20),
	dateedit date,
	status boolean
);

-- drop table factor_estequiometrico
CREATE TABLE factor_estequiometrico
(
	idfactor_estequiometrico serial primary key,
	idcompound	int references compound(idcompound),
	idelement 	int4 references Element(idelement),
	factor		decimal,
	usernew character varying(20),
	datenew date,
	useredit character varying(20),
	dateedit date,
	status boolean
);

-- drop table template_method_newmont_aa
CREATE TABLE template_method_newmont_aa
(
	idtemplate_method int4 references template_method(idtemplate_method) primary key,

	-- weight and readings	
	num_mesh	smallint,
	weight_mesh_entire	decimal(6,2),
	weight_mesh1	decimal(6,2),
	volumen		decimal(10,5),
	dilution2	decimal(10,5),
	reading_min	decimal(10,5),
	reading_max	decimal(10,5),

	-- Results
	symbol		varchar(10),
	law_limit_bottom	decimal(10,5),
	law_limit_top	decimal(10,5),
	factor_correction	decimal(6,4),
	flag_factor_correction	boolean,

	flag_repetibility1	boolean,
	rep1_a			decimal(6,4),	
	rep1_b			decimal(6,4),
	flag_repetibility2	boolean,
	rep2_percent		decimal(6,4),

	error_allowed	decimal(10,5),
	date_allowed_error 	date,
	flag_flux_taxed_gold	boolean,
	flux_gold	decimal(10,5),

	-- material reference
	idmr_detail 	smallint references mr_detail(idmr_detail),
	mr_incertitude	decimal(10,5),
	blk_max		decimal(10,5),
	reproducibility	decimal(10,5),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table template_method_newmont_gr
CREATE TABLE template_method_newmont_gr
(
	idtemplate_method int4 references template_method(idtemplate_method) primary key,

	-- weight and readings
	num_mesh	smallint,
	weight_mesh_entire	decimal(6,2),
	weight_mesh1	decimal(6,2),
	reading_min	decimal(10,5),
	reading_max	decimal(10,5),

	-- Results
	symbol		varchar(10),
	law_limit_bottom	decimal(10,5),
	law_limit_top	decimal(10,5),
	factor_correction	decimal(6,4),
	flag_factor_correction	boolean,

	flag_repetibility1	boolean,
	rep1_a			decimal(6,4),	
	rep1_b			decimal(6,4),
	flag_repetibility2	boolean,
	rep2_percent		decimal(6,4),

	error_allowed	decimal(10,5),
	date_allowed_error date,
	flag_flux_taxed_gold	boolean,
	flux_gold	decimal(10,5),

	-- material reference
	idmr_detail 	smallint references mr_detail(idmr_detail),
	mr_incertitude	decimal(10,5),
	blk_max		decimal(10,5),
	reproducibility	decimal(10,5),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table calib
CREATE TABLE calib
(
	idcalib bigserial primary key,
	order_calib	int2,
	name_calib 	varchar(15),
	concentration	decimal(10,5),
	idtemplate_method int4 references template_method(idtemplate_method),
	aliquot		decimal(10,5),
	volumen		decimal(10,5)
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
	date_result	date,
	cod_type_sample	varchar(5) references type_sample(cod_type_sample),
	total_amount	decimal(6,2),
	total_igv	decimal(6,2),
	total_amount_igv decimal(6,2),
	amortization	decimal(6,2),
	flag_isprice	boolean,
	discount	numeric(6,2)
);

-- drop table Recep_Company_Person
CREATE TABLE Recep_Company_Person
(
	idrecep_company_person bigserial primary key,
	idcompany	smallint references company(idcompany),
	idperson	smallint references person(idperson),
	idrecep_sample  bigint references Recep_Sample(idrecep_sample),
	person_type	smallint, -- 1:solicitante, 2:Contacto, 3:Atencion
	enabled_show	boolean,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table Recep_Sample_Dispatch
CREATE TABLE Recep_Sample_Dispatch
(	
	idrecep_sample  bigint primary key references Recep_Sample(idrecep_sample),	
	dispatch_person smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	dispatch_mail	smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	dispatch_curier	smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	dispatch_transport	smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	dispatch_fax	smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	dispatch_otro	smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	UserNew		varchar(20),
	DateNew		timestamp,
	UserEdit	varchar(20),
	DateEdit	timestamp,
	Status		boolean
);

-- drop table Recep_Sample_Detail
CREATE TABLE Recep_Sample_Detail
(
	idrecep_sample_detail bigserial primary key,
	order_sample	int2,							-- NEW 
	cod_sample	varchar(12),
	procedence	varchar(20),
	name_sample	varchar(30),
	amount_weight	decimal(10,5),
	cod_interno	int8,
	flag_reject	boolean,	
	cost_sample	decimal(6,2),
	analisys_time	decimal(6,3),
	flag_control_sample	boolean,					-- NEW 
	cod_type_sample varchar(5) references type_sample(cod_type_sample),
	cod_des_sample 	varchar(5) references description_sample(cod_des_sample),
	idrecep_sample 	int8 references recep_sample(idrecep_sample),
	flag_counter_sample smallint,
	flag_envelope_sealed boolean,
	des_container	varchar(50)
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
	cod_recep_sample_report	bigint,
	report_status 	int2, -- 1:en creacion, 2:reservado, 3:reportado
	type_report 	int2, -- 1:parcial, 2:final
	idrecep_sample 	int8 references Recep_Sample(idrecep_sample),
	flag_rpt_email	boolean, -- fue enviado por correo
	flag_rpt_print	boolean, -- fue impreso
	flag_rpt_pdf	boolean, -- fue impreso en pdf
	date_report	date,
	time_report	timestamp,
	
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table Recep_sample_program
CREATE TABLE Recep_Sample_Program
(
	idrecep_sample_program bigserial primary key,
	cod_recep_sample_program bigint,
	order_report	int2,	
	idrecep_sample 	int8 references Recep_Sample(idrecep_sample),
	program_status  int2, -- 1:en creacion, 2:programado
	date_report	date,
	time_report	timestamp,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table cells_program
CREATE TABLE Cells_Program
(
	idcell_reported bigserial primary key,
	idrecep_sample_detail_elem int8 references recep_sample_detail_elem(idrecep_sample_detail_elem),
	idrecep_sample_program int8 references Recep_Sample_Program(idrecep_sample_program),
	idtemplate_method int4 references template_method(idtemplate_method),
	idrecep_sample_detail int8 references recep_sample_detail(idrecep_sample_detail),
	flag_confirm_report boolean,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean,
	UNIQUE(idrecep_sample_detail_elem, idrecep_sample_program, idtemplate_method, idrecep_sample_detail)
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
	with_result	boolean, -- false:sin resultado, true:con resultado
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
	flag_confirm_report boolean,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean,
	UNIQUE(idrecep_sample_detail_elem, idrecep_sample_report, idtemplate_method, idrecep_sample_detail)
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



----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

CREATE TABLE template_method_format
(
	idtemplate_method_format bigserial NOT NULL,
	idtemplate_method integer REFERENCES template_method (idtemplate_method),
	nom_field character varying(40),
	num_decimal smallint
);

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
	Status		boolean,
	cod_serie 	varchar(10) references serie(cod_serie)
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
	cod_user varchar(30) not null,
	pwd varchar(32) not null,
	idperson smallint references person(idperson),
	UserNew		varchar(50),
	DateNew		timestamp,
	UserEdit	varchar(50),
	DateEdit	timestamp,
	Status		boolean
);

-- drop table process_user_system
CREATE TABLE process_user_system
(
	idprocess_user_system int2 default nextval('process_user_system_seq') primary key,
	cod_process	varchar(4) references process(cod_process),
	cod_module 	varchar(4) references module(cod_module),
	cod_area	varchar(4) references area(cod_area),
	iduser 	smallint references user_system(iduser),
	UserNew		varchar(50),
	DateNew		date,
	UserEdit	varchar(50),
	DateEdit	date,
	Status		boolean
);

-- DROP TABLE configuration_folder
CREATE TABLE configuration_folder
(
	idconfiguration_folder	smallint default nextval('configuration_folder_seq') primary key,
	folder_name	varchar(100) not null,
	description	varchar(500) not null,
	path	varchar(500) not null,
	folder_type	char(1) not null,
	usernew		varchar(20) not null,
	datenew		timestamp not null,
	useredit	varchar(20) not null,
	dateedit	timestamp not null,
	status 		boolean not null
);

-- DROP TABLE documentation
CREATE TABLE documentation
(
	iddocumentation	smallint default nextval('documentation_seq') primary key,
	idconfiguration_folder	smallint references configuration_folder(idconfiguration_folder) not null, -- autorizaciones, acciones correctivas, procedimiento de ensayo, raiz
	idtemplate_method	int references template_method(idtemplate_method) null,
	procedure_type	char(1) ,   	-- T:tareas, M:metodos, G:gestion
	code		int,
	name_doc	varchar(100) ,
	type_doc	char(1) ,	
	id		int ,
	parentid	int ,
	flag_enabled	boolean ,
	image_index	int ,
	usernew		varchar(20) ,
	datenew		timestamp ,
	useredit	varchar(20) ,
	dateedit	timestamp ,
	status 		boolean
);

-- DROP TABLE documentation_user
CREATE TABLE documentation_user
(
	iddocumentation_user	bigserial primary key,	
	iddocumentation	smallint references documentation(iddocumentation) not null,
	iduser		smallint references user_system not null,
	--idconfiguration_folder	smallint references configuration_folder(idconfiguration_folder),
	--idtemplate_method	int references template_method(idtemplate_method),
	date_ini	timestamp,
	date_end	timestamp,
	name_file	varchar(15),
	order_file	bigint,
	extension_file	varchar(5),
	Prev_authorized boolean,
	Rank_valid_inmonth int ,
	usernew		varchar(20),
	datenew		timestamp,
	useredit	varchar(20),
	dateedit	timestamp,
	status 		boolean
);

-- drop table Document_attach
CREATE TABLE Document_Recep
(
	iddocument_recep serial primary key,
	name_file	varchar(15),
	order_file	int,
	UserNew		varchar(20),
	DateNew		timestamp,
	UserEdit	varchar(20),
	DateEdit	timestamp,
	Status		boolean
);

-- drop table Recep_Sample_Attach
CREATE TABLE Recep_Sample_Attach
(
	idrecep_sample_attach bigserial primary key,
	iddocument_recep	int references Document_Recep(iddocument_recep),	
	idrecep_sample 	int8 references Recep_Sample(idrecep_sample),
	order_file	smallint,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table Cells_attach_file
CREATE TABLE Cells_attach_file
(
	idcells_attach_file bigserial primary key,
	idrecep_sample_attach bigint references recep_sample_attach(idrecep_sample_attach),
	idrecep_sample_detail_elem bigint references recep_sample_detail_elem(idrecep_sample_detail_elem),
	idtemplate_method int4 references template_method(idtemplate_method),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table methods_multi
CREATE TABLE methods_multi
(
	id	serial primary key,
	Elemento_longitud varchar(15),
	Elemento	varchar(10),
	Prioridad	int,
	Longitud	decimal,
	IDL		decimal,
	MDL		decimal,
	Linealidad	decimal,
	Num_decimal	decimal,
	STD1		decimal,
	STD2		decimal,
	IPC		decimal,
	LFB		decimal,
	LFM		decimal,
	Limite_inferior_MD	decimal,
	Limite_inferior_MT	decimal,
	Limite_superior		decimal	
);

-- drop table icp_lecturas
CREATE TABLE icp_lecturas
(
	id 		serial primary key,
	calibracion	int,
	elemento	varchar(10),
	idmuestra	int,
	muestra		varchar(15),	
	lectura		varchar(15),
	dilucion2	varchar(15)
);

-- drop table batchicp
CREATE TABLE Batchicp
(
	idbatchicp 	serial primary key,
	datecreation	timestamp	
);

-- drop table icpimport
CREATE TABLE icpimport
(	
	idicpimport	serial primary key,
	idbatchicp	int references batchicp,
	Methodid 	int,
	version		int,
	storagedate	timestamp,
	calibid 	int,
	elementname	varchar(6),
	sampleid	int,
	name		varchar(30),
	averageresult	decimal,
	str_result	varchar(10),
	dilution2	int
);

-- drop table matrix_group
CREATE TABLE Matrix_group
(
	idmatrix_group	serial primary key,
	sigla		varchar(10),
	name_group	varchar(100),
	status		boolean
);

-- drop table Matrix_item
CREATE TABLE Matrix_item
(
	idmatrix_item	serial primary key,
	idmatrix_group	int references Matrix_group(idmatrix_group),	
	sigla		varchar(10),
	name_item	varchar(100),
	description	varchar(500),
	flag_acreditado boolean,
	status 		boolean
);

-- drop table Decree
CREATE TABLE Decree
(
	iddecree 	serial primary key,
	cod_decree	varchar(20),	
	name_decree	varchar(50),
	description	varchar(500),
	cumple		varchar(20),
	nocumple	varchar(20),
	cumple_onlytest varchar(20),
	status 		boolean,
	conclusion	varchar(500)
);

-- drop table Decree_detail
CREATE TABLE Decree_detail
(
	iddecree_detail serial primary key,
	iddecree	int references decree(iddecree),
	idunit 		int references measurement_unit(idunit),
	idtemplate_method	int references template_method(idtemplate_method),
	parameter	varchar(50),
	idcondition	int,
	valor1		varchar(50),
	valor2		varchar(50),
	status 		boolean
);

-- drop table destiny_samples
create table destiny_samples_config
(
	iddestiny_samples serial primary key,
	description	varchar(30),
	cost_counter_sample	numeric(5,2),	
	cost_reject_sample	numeric(5,2),
	time_without_cost	int,		-- meses
	usernew		varchar(20), 
	datenew		timestamp,
	useredit	varchar(20),
	dateedit	timestamp,
	status		boolean	
);

-- drop table destiny_sample_recep
create table destiny_sample_recep
(
	iddestiny_sample_recep serial primary key,
	idrecep_sample	bigint references recep_sample(idrecep_sample),
	return_after_a_cs 	boolean,
	return_after_a_re	boolean,
	return_after_t_cs	boolean,
	return_after_t_re	boolean,
	discard_after_t_cs	boolean,
	discard_after_t_re	boolean,
	charge_after_t_cs	boolean,
	charge_after_t_re	boolean,
	percent_discount	decimal(4,2),
	usernew		varchar(20),
	datenew		timestamp,
	useredit	varchar(20),
	dateedit	timestamp,
	status		boolean	
);

-- drop table prep_samples
create table prep_samples
(		
	idrecep_sample_detail bigint references Recep_Sample_Detail(idrecep_sample_detail) primary key,	
	Flag_humidity_analysis boolean,
        Flag_reject boolean,
        Flag_counter_sample smallint,
	flag_60celsius	boolean,
	Date_creation	timestamp,
	-- entrada y salida de la muestra
	Input_sample_date	timestamp,
	Input_sample_user	varchar(20),
	
	weight_gross	decimal,
	weight_gross_date	timestamp,
	weight_gross_user	varchar(20),
	
	-- determinación de humedad
	weight_moisture	decimal,
	weight_moisture_date	timestamp,
	weight_moisture_user	varchar(20),
		
	weight_dry	decimal,
	weight_dry_date timestamp,
	weight_dry_user	varchar(20),
	
	percent_moisture decimal,
	
	moisture_reject	boolean,
	moisture_reject_date	timestamp,
	moisture_reject_user	varchar(20),
	
	-- peso de rechazo para almacenamiento
	weight_gross_reject	decimal,
	weight_gross_reject_date timestamp,
	weight_gross_reject_user varchar(20),

	-- marcar salida de muestra a ataque u otra
	output_flag_sample	boolean,
	output_flag_cs	boolean,
	output_flag_re	boolean,
	output_date_sample timestamp,
	output_user_sample varchar(20),
	output_date_cs	timestamp,
	output_user_cs	varchar(20),
	output_date_re	timestamp,
	output_user_re	varchar(20),
	
	observation1	varchar(50),

	-- entrada y salida almacen
	store_input_date_cs	timestamp,
	store_input_user_cs	varchar(20),

	store_input_date_re	timestamp,
	store_input_user_re	varchar(20),
	
	store_output_date_cs	timestamp,
	store_output_user_cs	varchar(20),

	store_output_date_re	timestamp,
	store_output_user_re	varchar(20),

	observation2	varchar(50),

	final_weight_gross 	int, -- 0:sin dato terminal, 1:con dato terminal, 2:completado
	final_moisture	int,
	final_reject	int,
	final_sample_prepared int
);

