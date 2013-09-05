-- drop table type_sample_control
CREATE TABLE type_sample_control
(
	idtype_sample_control serial primary key,
	nametsc		varchar(5),
	priority	int,
	usernew 	varchar(50),
	DateNew		date,
	UserEdit	varchar(50),
	DateEdit	date,
	Status		boolean
);

-- drop table control_sample
CREATE TABLE control_sample
(
	idcontrol_sample	serial primary key,
	idtype_sample_control	int references type_sample_control(idtype_sample_control),
	idtemplate_method int references template_method(idtemplate_method),
	type_analisys	int,  
	name_cs 	varchar(20),
	description 	varchar(200),
	name_value_prefijo	varchar(15),
	value1			decimal,
	name_value_sufijo	varchar(15),
	name_frec_prefijo	varchar(15),
	frecuency		int,	
	name_frec_sufijo	varchar(15),	
	flag_frec_by_batch	boolean,
	flag_frec_by_sample	boolean,	
	priority		int,
	usernew 	varchar(50),
	DateNew		date,
	UserEdit	varchar(50),
	DateEdit	date,
	Status		boolean
);

-- drop table control_sample_condition
CREATE TABLE control_sample_condition
(
	idcontrol_sample_condition  serial primary key,
	idcontrol_sample	int references control_sample(idcontrol_sample),		
	matchsample	varchar(200),
	test		varchar(200),
	idcondition	int,	
	msgok		varchar(15),
	msgerror	varchar(15),
	flag_apply	boolean,
	usernew		varchar(20),
	datenew		timestamp,
	useredit	varchar(20),
	dateedit	timestamp,
	status		boolean
);

-- drop table control_sample_frequency
CREATE TABLE control_sample_frequency
(
	idcontrol_sample_frequency	serial primary key,
	idtype_sample_control	int references type_sample_control(idtype_sample_control),
	idtemplate_method int references template_method(idtemplate_method),	
	type_analisys	int,  
	name_frequency		varchar(20),
	name_frec_prefijo	varchar(15),
	frecuency		int,	
	name_frec_sufijo	varchar(15),	
	flag_frec_by_batch	boolean,
	flag_frec_by_sample	boolean,
	priority		int,
	usernew 	varchar(50),
	DateNew		date,
	UserEdit	varchar(50),
	DateEdit	date,
	Status		boolean
);