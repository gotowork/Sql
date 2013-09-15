-- drop table price
create table price
(
	idprice	serial primary key,
	cod_price	varchar(20),
	dispatch_person smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	dispatch_mail	smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	dispatch_curier	smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	dispatch_transport	smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	dispatch_fax	smallint, -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	dispatch_otro	smallint,  -- 0:no seleccionado, 1:seleccionado/pendiente, 2:enviado
	request_reference	int -- 1: llamada telefonica, 2: telefono	
);

-- drop table price_version
create table price_version
(
	idprice_version	serial primary key,
	idprice		int references price(idprice),
	idrecep_sample	bigint references recep_sample(idrecep_sample),
	num_version	int,
	cod_type_sample	varchar(5) references type_sample(cod_type_sample),
	idcompany	smallint references company(idcompany),
	attention	smallint references person(idperson),
	iduser		smallint references user_system(iduser),
	Num_days_post	int,
	date_creation	timestamp,
	user_creation	varchar(20),
	num_days_valid  smallint,
	status_price	int, -- 1: espera, 2: desestimado, 3: expirado, 4: concretado
	observation	varchar(3000)
);

-- drop table price_version_detail
create table price_version_detail
(
	idprice_version_detail	serial primary key,
	idprice_version	int references price_version(idprice_version),
	num_item	int,
	idtemplate_method	int references template_method(idtemplate_method),		
	amount_item	int,
	rank		varchar(20),
	unit_price	numeric(10,2),
	sale_price	numeric(10,2)
);

-- drop table memo_price
create table memo_price
(
	idmemo_price	serial primary key,
	idprice_version	int references price_version(idprice_version),
	paragraph	varchar(3000),
	memo_type	int -- 1:inicial, 2:final
);

-- drop table memo_template
create table memo_template
(
	idmemo_template	serial primary key,
	paragraph	varchar(3000),
	paragraph_rtf	varchar(3000),
	memo_type	int -- 1:inicial, 2:final	
);

-- drop table price_company_person
CREATE TABLE price_company_person
(
	idprice_company_person serial primary key,
	idcompany	smallint references company(idcompany),
	idperson	smallint references person(idperson),
	idprice		int references price(idprice),		
	idprice_version	int references price_version(idprice_version),	
	person_type	smallint -- 1:solicitante, 2:Contacto, 3:Atencion
);


-- drop table attach
CREATE TABLE price_attach
(
	idattach	serial primary key,
	idprice		int references price(idprice),
	idprice_version	int references price_version(idprice_version),
	name_document	varchar(200),
	type_document	varchar(10)
);