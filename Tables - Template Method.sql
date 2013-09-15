-- drop table template_method
CREATE TABLE template_method
(
	idtemplate_method serial primary key,
	num_version 	int2,
	cod_template_method varchar(20),
	cod_repetition  int2,        	-- 1:simple, 2:duplicado, 3:triplicado, 4:cuadruplicado, 8:octuplicado
	title 		varchar(200),
	abbreviation	varchar(15),
	name_method 	varchar(50),
	type_analisys	char(1),  	-- 1:AA, 2:Volumentria, 3:Gravimetría, 4:Icp, 5:Fotometría	
	recognized	boolean,
	idelement 	int4 references Element(idelement),
	cod_type_sample	varchar(5) references type_sample(cod_type_sample),
	cod_digestion_method varchar(5) references digestion_method(cod_digestion_method),	
	cost_method	decimal(10,5),	
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
	law_limit_top	decimal(10,5),

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
	date_allowed_error date,
	MrOrPattern	smallint references mr_detail(idmr_detail),
	Rexp2		decimal(5,4),
	medium		int references reactive(idreactive),
	medium_conc	numeric(12,4),
	modif		int references reactive(idreactive),
	modif_conc	numeric(12,4),
	validity_calib  smallint,		
	type_pattern	int, -- 1:mrc, 2:patron solución
	flag_sol_intermedia boolean,
	sol_concentration	numeric(12,4),

	sol_status		boolean,
	sol_date_preparation	timestamp,
	sol_date_expiration	timestamp,

	std_mrorpattern		int references mr_detail(idmr_detail),
	std_type_pattern	int, -- 1:mrc, 2:patron solucion
	std_flag_sol_intermedia1	boolean,
	std_flag_sol_intermedia2	boolean,
	std_concentration	decimal(10,4),
	std_concentration_sol1	decimal(5,2),
	std_concentration_sol2	decimal(5,2),
	std_validity		smallint,
	std_status		boolean,
	std_date_preparation	timestamp,
	std_date_expiration	timestamp,
	std_sol1_medium		decimal(10,4),
	std_sol2_medium		decimal(10,4),
	std_stdverif_medium	decimal(10,4),
	
	idunit_result	int2 references measurement_unit(idunit),
	Num_samples	smallint,
	Num_days	smallint,
	Limit_samples	smallint
);

-- drop table template_method_ah
CREATE TABLE template_method_ah
(
	idtemplate_method int references template_method_ah(idtemplate_method) primary key,
	symbol		varchar(10),
	idunit_result	int2 references measurement_unit(idunit),
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table template_method_gr
CREATE TABLE template_method_gr
(
	idtemplate_method int4 references template_method(idtemplate_method) primary key,
	-- weight and readings
	weight		decimal(10,5),
	weight_incertitude	decimal(10,5),	
	reading_min	decimal(10,5),
	reading_max	decimal(10,5),	
	reason_rep	decimal(10,5),
	error_allowed	decimal(10,5),
	
	-- Results
	symbol		varchar(10),	
	law_limit_bottom	decimal(10,5),
	law_limit_top	decimal(10,5),
	
	num_decimal	int2,
		
	-- material reference
	flag_mr		boolean,	
	idmr_detail 	smallint references mr_detail(idmr_detail),
	mr_incertitude	decimal(10,5),
	blk_max		decimal(10,5),
	reproducibility	decimal(10,5),	

	flagsamfortify	boolean,
	samfortisol	decimal(10,5),
	samfortialiquot decimal(10,5),
	samfortireproducibility decimal(10,5),

	flagblkfortify  boolean,
	blkfortisol	decimal(10,5),
	blkfortialiquot	decimal(10,5),
	blkfortireproducibility decimal(10,5),
	
	date_allowed_error date,
	
	idunit_result	int2 references measurement_unit(idunit),
	Num_samples	smallint,
	Num_days	smallint,
	Limit_samples	smallint,

	idfactor_estequiometrico int references factor_estequiometrico(idfactor_estequiometrico),
	
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table template_method_vc
CREATE TABLE template_method_vc
(
	idtemplate_method int4 references template_method(idtemplate_method) primary key,
	-- weight and readings
	weight		decimal(10,5),
	weight_incertitude	decimal(10,5),	
	reading_min	decimal(10,5),
	reading_max	decimal(10,5),	
	reason_rep	decimal(10,5),
	error_allowed	decimal(10,5),
	
	-- Results
	symbol		varchar(10),	
	law_limit_bottom	decimal(10,5),
	law_limit_top	decimal(10,5),
	
	num_decimal	int2,
		
	-- material reference
	flag_mr		boolean,	
	idmr_detail 	smallint references mr_detail(idmr_detail),
	mr_incertitude	decimal(10,5),
	blk_max		decimal(10,5),
	reproducibility	decimal(10,5),	

	flagsamfortify	boolean,
	samfortisol	decimal(10,5),
	samfortialiquot decimal(10,5),
	samfortireproducibility decimal(10,5),

	flagblkfortify  boolean,
	blkfortisol	decimal(10,5),
	blkfortialiquot	decimal(10,5),
	blkfortireproducibility decimal(10,5),
	
	date_allowed_error date,
	
	idunit_result	int2 references measurement_unit(idunit),
	Num_samples	smallint,
	Num_days	smallint,
	Limit_samples	smallint,	
	
	UserNew		varchar(20),
	DateNew		date,
	UserEdit	varchar(20),
	DateEdit	date,
	Status		boolean
);

-- drop table template_method_icp
CREATE TABLE template_method_icp
(
	idtemplate_method int primary key references template_method(idtemplate_method),
	volumen		numeric(10,5),
	aliquot		numeric(10,5),
	dilution_flag	boolean,
	dilution_value	numeric(10,5),
	usernew		varchar(20),
	datenew		timestamp,
	useredit	varchar(20),
	dateedit	timestamp,
	status		boolean
);

-- drop table element_wavelength
create table element_wavelength
(
	idelement_wavelength 	serial primary key,
	idelement	smallint references element(idelement),
	wavelength	varchar(8),
	element_wavelength	varchar(25),
	idl_axial	decimal,
	idl_radial	decimal,
	lineality_axial	decimal,
	lineality_radial decimal,
	usernew		varchar(20), 
	datenew		timestamp,
	useredit	varchar(20),
	dateedit	timestamp,
	status		boolean
);

-- drop table template_method_icp_detail
create table Template_method_icp_detail
(
	idtemplate_method_icp_detail serial primary key,
	idtemplate_method int references template_method_icp(idtemplate_method),
	idelement_wavelength int references element_wavelength(idelement_wavelength),
	idelement	smallint references element(idelement),        
        idl 		decimal, -- = a limite inferior MT
        
        mdl_axial	decimal, -- = a limite inferior MD; ; ; ordenar en forma, elemento, intervalo(mdl)
	mdl_radial	decimal, -- = a limite inferior MD; ; ; ordenar en forma, elemento, intervalo(mdl)

	ldr		decimal,
        ldr_aux       	decimal,
        num_decimal  	decimal,
        std1 		decimal,
        std2         	decimal,
        ipc         	decimal,
        lfb         	decimal,
		
	qc		decimal,
	priority	decimal,		                 

	lfm         	decimal,
        limit_top   	decimal, -- volumen/alicuota*dilucion2*linealidad
	   
        usernew		varchar(20), 
	datenew		timestamp,
	useredit	varchar(20),
	dateedit	timestamp,
	status		boolean
);