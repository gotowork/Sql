﻿-- drop table type_solution
CREATE TABLE Type_Solution
(
	idtype_solution serial primary key,
	name_type_solution varchar(20),
	num_days_expiration smallint,
	observation	varchar(100),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table Reactive
create table reactive
(
	idreactive 	serial primary key,
	reactive_name	varchar(15),
	chemical_formula	varchar(30),
	weight_molecular	numeric(5,4)
);

-- drop table solution_interm
create table solution_interm
(
	idsolution_interm serial primary key,
	id		int,
	parentid	int,	
	idelement	int references element(idelement),
	cod_solution 	varchar(20),
	type_sol	int, -- 1:solution intermedia 1, 2:solution intermedia 2, 3: estandar verificación, 4: estandar calibracion
	solution_name	varchar(50),
	purity		numeric(6,2),
	concentration	decimal,	
	aliquot		numeric(10,4),
	volumen		numeric(10,2),
	date_begin	date,
	date_end	date,
	num_months	int,
	prepared_by	smallint references user_system(iduser),
	observation	varchar(100),
	lote		varchar(12),
	solution_status	boolean, -- activado = true, desactivado = false
	solution_obs	varchar(15), -- utilizado cuando se desactiva
	expired_status 	boolean, -- expirado = true, no expirado = false
	root_type_pattern	int, -- 1:mrc, 2:patron solucion
	root_idmr_detail	smallint references Mr_detail(idmr_detail),
	idreactive_medium 	integer references reactive (idreactive),
	reactive_medium_value	numeric(10,4),
	idreactive_modif 	integer references reactive (idreactive),
	reactive_modif_value	numeric(10,4),
	flag_current_method	boolean,
	image_index	int,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table solution_interm_methods
create table solution_interm_methods
(
	idsolution_methods serial primary key,
	idsolution_interm int references solution_interm(idsolution_interm),
	idtemplate_method int references template_method(idtemplate_method),
	status boolean
);

-- drop table solution
create table solution
(
	idsolution serial primary key,
	id		int,
	parentid	int,
	idgroup_solution int references group_solution(idgroup_solution),
	idelement	int references element(idelement),
	cod_solution 	varchar(20),
	type_sol	int, -- 1:solution intermedia 1, 2:solution intermedia 2, 3: estandar verificación
	solution_name	varchar(50),
	purity		numeric(6,2),
	concentration	decimal,
	aliquot		numeric(10,4),
	volumen		numeric(10,2),
	date_begin	date,
	date_end	date,
	num_months	int,
	prepared_by	smallint references user_system(iduser),
	observation	varchar(100),
	lote		varchar(12),
	solution_status	boolean,
	root_type_pattern	int, -- 1:mrc, 2:patron solucion
	root_idmr_detail	smallint references Mr_detail(idmr_detail),
	idreactive_medium 	integer references reactive (idreactive),
	reactive_medium_value	numeric(10,4),
	idreactive_modif 	integer references reactive (idreactive),
	reactive_modif_value	numeric(10,4),
	concat_cod_methods	varchar(100),
	image_index	int,
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table set_calibs
create table set_calibs
(
	idset_calibs serial primary key,
	calib_group_name varchar(20),
	R		numeric(12,6),
	a		numeric(12,6),
	b		numeric(12,6),
	idtemplate_method int4 references template_method(idtemplate_method),
	idsolution_interm int references solution_interm(idsolution_interm),
	usersign	varchar(20),
	datesign	timestamp,
	last_calib	boolean
);

-- drop table Calib_std
create table calib_std
(
	idcalib_std bigserial primary key,
	idcalib 	int8 references calib(idcalib),
	absorbance	numeric(12,4),
	absorbance_previus	numeric(12,4),
	concentration	numeric(10,5),
	idset_calibs 	int references set_calibs(idset_calibs),
	idtemplate_method int4 references template_method(idtemplate_method),	
	idsolution_interm int references solution_interm(idsolution_interm)
);

-- drop table titration_main
create table titration_main
(
	idtitration_main int references Solution(idsolution) primary key ,	
	num_analyst int,
	type_average int,  -- 1:global, 2:por analista
	num_test int,
	concentration_unit int,
	concentration_value numeric(10,4),
	factor numeric(10,4),
	idunit_measure_factor smallint,
	status_process	int, -- 0:nuevo, 1:cabecera, 2:analistas, 3:firma final 
	analyst1	smallint references user_system(iduser),
	date_analyst1	timestamp,
	analyst2	smallint references user_system(iduser),
	date_analyst2	timestamp,
	analyst3 	smallint references user_system(iduser),
	date_analyst3	timestamp,
	analyst4	smallint references user_system(iduser),
	date_analyst4	timestamp
);

-- drop table Solution_titration
create table solution_titration
(
	idsolution_titration serial primary key,
	idtitration_main int references titration_main(idtitration_main),
	idsolution 		int references Solution(idsolution),
	Aliquot			numeric(10,4),
	theorical_reading 	numeric(10,4),
	practice_reading 	numeric(10,4),
	factor			numeric(10,4),
	prepared_by		smallint references user_system(iduser),
	date_prepared		timestamp,
	status_titration	boolean, -- true:se considera al promedio, false:no se considera
	average			numeric(10,4)
);