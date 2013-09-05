/*
1;"M"
2;"MRC"
3;"LRB"
4;"LFM"
5;"IPC"
6;"LFB"
7;"DUP"

1, "igual"   //admite valor1
2, "diferente"//admite valor1
3, "menor"//admite valor1
4, "mayor"//admite valor1
5, "mayor o igual"//admite valor1
6, "menor o igual"//admite valor1
7, "Entre"//admite valor1 y valor2

MT = 1
MD = 2

*/

insert into type_sample_control(nametsc) values('M');
insert into type_sample_control(nametsc) values('MRC');
insert into type_sample_control(nametsc) values('LRB');
insert into type_sample_control(nametsc) values('LFM');
insert into type_sample_control(nametsc) values('IPC');
insert into type_sample_control(nametsc) values('LFB');
insert into type_sample_control(nametsc) values('DUP');

insert into control_sample(name_cs, idtype_sample_control, idtemplate_method, type_analisys, name_value_prefijo, value1, name_value_sufijo)
	values ('IPC', 5, null, 4, 'rango+/-', 10, '%');

insert into control_sample(name_cs, idtype_sample_control, idtemplate_method, type_analisys, name_value_prefijo, value1, name_value_sufijo)
	values ('LRB', 3, null, 4, 'criterio', 2.2, 'veces MDL');
	
insert into control_sample(name_cs, idtype_sample_control, idtemplate_method, type_analisys, name_value_prefijo, value1, name_value_sufijo)
	values ('LFB', 6, null, 4, 'rango+/-', 15, '%');

insert into control_sample(name_cs, idtype_sample_control, idtemplate_method, type_analisys, name_value_prefijo, value1, name_value_sufijo)
	values ('DUP', 7, null, 4, 'rango+/-', 2.2, 'veces MDL');

-- frecuencia

insert into control_sample_frequency(name_frequency, idtype_sample_control, idtemplate_method, type_analisys, name_frec_prefijo, frecuency, name_frec_sufijo, flag_frec_by_batch, flag_frec_by_sample, priority)
	values ('IPC', 5, null, 4, 'Cada:', 10, ' muestras', false, true, 1);

insert into control_sample_frequency(name_frequency, idtype_sample_control, idtemplate_method, type_analisys, name_frec_prefijo, frecuency, name_frec_sufijo, flag_frec_by_batch, flag_frec_by_sample, priority)
	values ('LRB', 3, null, 4, 'Cada:', 10, ' muestras', false, true, 1);
	
insert into control_sample_frequency(name_frequency, idtype_sample_control, idtemplate_method, type_analisys, name_frec_prefijo, frecuency, name_frec_sufijo, flag_frec_by_batch, flag_frec_by_sample, priority)
	values ('LFB', 6, null, 4, 'Cada:', 1, ' por bandeja', false, true, 1);

insert into control_sample_frequency(name_frequency, idtype_sample_control, idtemplate_method, type_analisys, name_frec_prefijo, frecuency, name_frec_sufijo, flag_frec_by_batch, flag_frec_by_sample, priority)
	values ('DUP', 7, null, 4, 'Cada:', 1, ' por bandeja', false, true, 1);

		

insert into control_sample_condition(idcontrol_sample, matchsample, test, idcondition, msgok, msgerror, flag_apply, status)
	values (1, '','{IPC>VALUE1*M_IPC}, {IPC<VALUE2*M_IPC}', 7, 'Ok', 'Error', true, true);

insert into control_sample_condition(idcontrol_sample, matchsample, test, idcondition, msgok, msgerror, flag_apply, status)
	values (2, '{M_METODO=1}', '{LRB < VALUE1*M_MDL}', 3, 'Ok', 'Error', true, true);
	
insert into control_sample_condition(idcontrol_sample, matchsample, test, idcondition, msgok, msgerror, flag_apply, status)
	values (2, '{M_METODO=2}', '{LRB < VALUE1*M_IDL}', 3, 'Ok', 'Error', true, true);	

insert into control_sample_condition(idcontrol_sample, matchsample, test, idcondition, msgok, msgerror, flag_apply, status)
	values (3, '', '{ABS(LFB-LRB)>VALUE1*M_LFB}, {ABS(LFB-LRB)<VALUE2*M_LFB}', 3, 'Ok', 'Error', true, true);

insert into control_sample_condition(idcontrol_sample, matchsample, test, idcondition, msgok, msgerror, flag_apply, status)
	values (4, '{M_METODO=1}, {DUP>M_MDL}', '{ABS(DUP-ORI)<VALUE1*ORI}', 3, 'Ok', 'Error', true, true);

insert into control_sample_condition(idcontrol_sample, matchsample, test, idcondition, msgok, msgerror, flag_apply, status)
	values (4, '{M_METODO=2}, {DUP>M_IDL}', '{ABS(DUP-ORI)<VALUE1*ORI}', 3, 'Ok', 'Error', true, true);

insert into control_sample_condition(idcontrol_sample, matchsample, test, idcondition, msgok, msgerror, flag_apply, status)
	values (4, '{M_METODO=1}, {DUP<=M_MDL}', '{DUP<VALUE1*M_MDL}', 3, 'Ok', 'Error', true, true);

insert into control_sample_condition(idcontrol_sample, matchsample, test, idcondition, msgok, msgerror, flag_apply, status)
	values (4, '{M_METODO=2}, {DUP<=M_IDL}', '{DUP<VALUE1*M_IDL}', 3, 'Ok', 'Error', true, true);
