CREATE TABLE template_method (
	idtemplate_method serial
);
CREATE TABLE element (
	idelement int4,
	name_element varchar(10),
	type_element char(1)
);
ALTER TABLE element ADD CONSTRAINT pk_idelement PRIMARY KEY(idelement);
ALTER TABLE template_method ADD CONSTRAINT pk_template_method PRIMARY KEY(idtemplate_method);
ALTER TABLE element ADD FK_template_method_idtemplate_method serial;
ALTER TABLE element ADD CONSTRAINT rel_element_template_method FOREIGN KEY (FK_template_method_idtemplate_method) REFERENCES template_method(idtemplate_method) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE element DROP CONSTRAINT rel_element_template_method;
ALTER TABLE element DROP COLUMN FK_template_method_idtemplate_method;
ALTER TABLE template_method ADD FK_element_idelement int4;
ALTER TABLE template_method ADD CONSTRAINT r FOREIGN KEY (FK_element_idelement) REFERENCES element(idelement) ON DELETE NO ACTION ON UPDATE NO ACTION;
