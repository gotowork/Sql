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
	date_creation_tray	timestamp,
	user_creation_tray	varchar(20),
	has_sample_control boolean,
	absorvance	numeric(10,6),
	std_verification	numeric(10,6),
	flag_abs_std 	boolean,	-- controla existencia de absorvancia y estandar de verificación.
	mri_measured	numeric(10,6),	
	lrb_measured	numeric(10,6),
	flag_correct_abs boolean,
	flag_correct_std boolean,
	flag_correct_mri boolean,
	flag_correct_lrb boolean,
	user_close_tray varchar(20),
	date_close_tray timestamp,
	user_approve_tray varchar(20),
	date_approve_tray timestamp,
	user_review_tray varchar(20),
	date_review_tray timestamp,
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
					-- 0:espera, 1:incorrecto, 2:plausible, 3:aceptado, 4:incorrecto plausible
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
CREATE TABLE Batch_Detail_AA_OneFold
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
	law	decimal(10,6),	-- ley parcial
	law_long	decimal(10,6),	-- ley parcial sin truncamiento
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
	Status		boolean,
	
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

-- drop table Batch_Detail_AA_TwoFold
CREATE TABLE Batch_Detail_AA_TwoFold
(
	idbatch_detail_aa bigserial primary key,
	num_repetition	int2,
	idtemplate_method int4 references template_method(idtemplate_method),
	idrecep_sample 	int8 references recep_sample(idrecep_sample),
	idrecep_sample_detail_elem int8 references Recep_Sample_Detail_Elem(idrecep_sample_detail_elem),
	idrecep_sample_detail int8 references Recep_Sample_Detail(idrecep_sample_detail),
	cod_des_sample	varchar(5) references Description_sample(cod_des_sample),	
	order_des_sample smallint,
	cod_sample 	varchar(12),	
	cod_interno	int8,
	order_sample_batch smallint,
	flag_mri	int,
	weight1	decimal(10,6),	-- peso
	reading1	varchar(10),	-- lectura
	volumen1	decimal(10,6),	-- volumen
	factor1	varchar(10),	-- factor
	law1	varchar(10),	-- ley parcial
	law1_long	decimal(10,6), 	-- ley parcial sin truncamiento
	sample_mr_blk1	char(1),
	
	weight2	decimal(10,6),	-- peso
	reading2	varchar(10),	-- lectura
	volumen2	decimal(10,6),	-- volumen
	factor2	varchar(10),	-- factor	
	law2	varchar(10),	-- ley parcial	
	law2_long	decimal(10,6),	-- ley parcial sin truncamiento
	sample_mr_blk2	char(1),

	dilu2	decimal(10,6),
	flag_dilu2	boolean,
	dilu3	decimal(10,6),
	flag_dilu3	boolean,

	idbatch 	int8 references batch(idbatch),
	verify_equip	decimal(10,6), 	-- verificación de equipo
	verify_curve	decimal(10,6),	-- verificación de curva
	
	idtype_rep 	char(1), 	-- C:Configuracion (1,2,4,8 repeticion), R:muestra repeticion	
	idmr_detail	int2 references Mr_Detail(idmr_detail),						-- NEW 
	idmr_jar	int2 references Mr_jar(idmr_jar),						-- NEW
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	idequipment1	int2,
	Status		boolean,

	
	str_result_analysis 		varchar(15),
	result_analysis decimal(10,5),
	fum		numeric(10,6),
	idunit_result	int2 references measurement_unit(idunit),
	Qaqc_status_result 	int, 	-- 0:espera, 1:incorrecto, 2:plausible, 3:aceptado, 4:incorrecto plausible				
	Qaqc_blk	int,
	Qaqc_par	int,
	Qaqc_mr		int,
	Qaqc_approve_text	varchar(200),
	Qaqc_approve	boolean,	
	Qaqc_error		int,
	Qaqc_review_text	varchar(200),
	Qaqc_review	boolean,
	Qaqc_par_prev_batch int,
	Qaqc_tmp_retest_idmethod int,
	Qaqc_tmp_retest int,
	Qaqc_has_retest int
);

CREATE TABLE Batch_Detail_AA_ThreeFold
(
	idbatch_detail_aa bigserial primary key,
	num_repetition	int2,		
	idtemplate_method int4 references template_method(idtemplate_method),
	idrecep_sample 	int8 references recep_sample(idrecep_sample),
	idrecep_sample_detail_elem int8 references Recep_Sample_Detail_Elem(idrecep_sample_detail_elem),
	idrecep_sample_detail int8 references Recep_Sample_Detail(idrecep_sample_detail),

	weight1	decimal(10,6),	-- peso
	reading1	decimal(10,6),	-- lectura
	volumen1	decimal(10,6),	-- volumen
	dilua1 	decimal(10,6),	-- dilucion 2
	dilub1	decimal(10,6),	-- dilucion 3
	factor1	decimal(10,6),	-- factor	
	law1	decimal(10,6),	-- ley parcial	
	law1_long	decimal(10,6),
	flag_dila1	boolean,
	flag_dilb1	boolean,
	sample_mr_blk1	char(1),

	weight2	decimal(10,6),	-- peso
	reading2	decimal(10,6),	-- lectura
	volumen2	decimal(10,6),	-- volumen
	dilua2 	decimal(10,6),	-- dilucion 2
	dilub2	decimal(10,6),	-- dilucion 3
	factor2	decimal(10,6),	-- factor	
	law2	decimal(10,6),	-- ley parcial	
	law2_long	decimal(10,6),	-- ley parcial sin truncamiento
	flag_dila2	boolean,
	flag_dilb2	boolean,
	sample_mr_blk2	char(1),

	weight3	decimal(10,6),	-- peso
	reading3	decimal(10,6),	-- lectura
	volumen3	decimal(10,6),	-- volumen
	dilua3 	decimal(10,6),	-- dilucion 2
	dilub3	decimal(10,6),	-- dilucion 3
	factor3	decimal(10,6),	-- factor	
	law3	decimal(10,6),	-- ley parcial	
	law3_long	decimal(10,6),	-- ley parcial sin truncamiento
	flag_dila3	boolean,
	flag_dilb3	boolean,
	sample_mr_blk3	char(1),

	idbatch 	int8 references batch(idbatch),
	verify_equip	decimal(10,6), 	-- verificación de equipo
	verify_curve	decimal(10,6),	-- verificación de curva	
	idtype_rep 	char(1), 	-- C:Configuracion (1,2,4,8 repeticion), R:muestra repeticion	
	idmr_detail	int2 references Mr_Detail(idmr_detail),						-- NEW 
	idmr_jar	int2 references Mr_jar(idmr_jar),						-- NEW
	UserNew		varchar(20),
	DateNew		date,
	UserEdit1	varchar(20),
	DateEdit1	date,
	idequipment1	int2,
	Status		boolean,

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

CREATE TABLE Batch_Detail_AA_FourFold
(
	idbatch_detail_aa bigserial primary key,
	num_repetition	int2,		
	idtemplate_method int4 references template_method(idtemplate_method),
	idrecep_sample 	int8 references recep_sample(idrecep_sample),
	idrecep_sample_detail_elem int8 references Recep_Sample_Detail_Elem(idrecep_sample_detail_elem),
	idrecep_sample_detail int8 references Recep_Sample_Detail(idrecep_sample_detail),

	weight1	decimal(10,6),	-- peso
	reading1	decimal(10,6),	-- lectura
	volumen1	decimal(10,6),	-- volumen
	dilua1 	decimal(10,6),	-- dilucion 2
	dilub1	decimal(10,6),	-- dilucion 3
	factor1	decimal(10,6),	-- factor	
	law1	decimal(10,6),	-- ley parcial	
	law1_long	decimal(10,6),	-- ley parcial sin truncamiento
	flag_dila1	boolean,
	flag_dilb1	boolean,
	sample_mr_blk1	char(1),

	weight2	decimal(10,6),	-- peso
	reading2	decimal(10,6),	-- lectura
	volumen2	decimal(10,6),	-- volumen
	dilua2 	decimal(10,6),	-- dilucion 2
	dilub2	decimal(10,6),	-- dilucion 3
	factor2	decimal(10,6),	-- factor	
	law2	decimal(10,6),	-- ley parcial	
	law2_long 	decimal(10,6),
	flag_dila2	boolean,
	flag_dilb2	boolean,
	sample_mr_blk2	char(1),
	
	weight3	decimal(10,6),	-- peso
	reading3	decimal(10,6),	-- lectura
	volumen3	decimal(10,6),	-- volumen
	dilua3 	decimal(10,6),	-- dilucion 2
	dilub3	decimal(10,6),	-- dilucion 3
	factor3	decimal(10,6),	-- factor	
	law3	decimal(10,6),	-- ley parcial	
	law3_long	decimal(10,6),	-- ley parcial sin truncamiento
	flag_dila3	boolean,
	flag_dilb3	boolean,
	sample_mr_blk3	char(1),

	weight4	decimal(10,6),	-- peso
	reading4	decimal(10,6),	-- lectura
	volumen4	decimal(10,6),	-- volumen
	dilua4 	decimal(10,6),	-- dilucion 2
	dilub4	decimal(10,6),	-- dilucion 3
	factor4	decimal(10,6),	-- factor	
	law4	decimal(10,6),	-- ley parcial	
	law4_long	decimal(10,6),	-- ley parcial sin truncamiento
	flag_dila4	boolean,
	flag_dilb4	boolean,
	sample_mr_blk4	char(1),	

	idbatch 	int8 references batch(idbatch),
	verify_equip	decimal(10,6), 	-- verificación de equipo
	verify_curve	decimal(10,6),	-- verificación de curva
	idtype_rep 	char(1), 	-- C:Configuracion (1,2,4,8 repeticion), R:muestra repeticion	
	idmr_detail	int2 references Mr_Detail(idmr_detail),						-- NEW 
	idmr_jar	int2 references Mr_jar(idmr_jar),						-- NEW
	UserNew		varchar(20),
	DateNew		date,
	UserEdit1	varchar(20),
	DateEdit1	date,
	idequipment1	int2,
	Status		boolean,
	
	str_result_analysis 	varchar(15),
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

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
-- drop table Batch_Detail_AA
CREATE TABLE Batch_Detail_VC_OneFold
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

CREATE TABLE Batch_Detail_VC_TwoFold
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

CREATE TABLE Batch_Detail_VC_ThreeFold
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

CREATE TABLE Batch_Detail_VC_FourFold
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

CREATE TABLE Batch_Detail_VC_EightFold
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

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

-- drop table Batch_Detail_AA
CREATE TABLE Batch_Detail_GR_OneFold
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

CREATE TABLE Batch_Detail_GR_TwoFold
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

CREATE TABLE Batch_Detail_GR_ThreeFold
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

CREATE TABLE Batch_Detail_GR_FourFold
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

CREATE TABLE Batch_Detail_GR_EightFold
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

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

-- drop table Batch_Detail_AA
CREATE TABLE Batch_Detail_NWAA_OneFold
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

CREATE TABLE Batch_Detail_NWAA_TwoFold
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

CREATE TABLE Batch_Detail_NWAA_ThreeFold
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

CREATE TABLE Batch_Detail_NWAA_FourFold
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

CREATE TABLE Batch_Detail_NWAA_EightFold
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

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

-- drop table Batch_Detail_AA
CREATE TABLE Batch_Detail_NWGR_OneFold
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

CREATE TABLE Batch_Detail_NWGR_TwoFold
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

CREATE TABLE Batch_Detail_NWGR_ThreeFold
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

CREATE TABLE Batch_Detail_NWGR_FourFold
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

CREATE TABLE Batch_Detail_NWGR_EightFold
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
