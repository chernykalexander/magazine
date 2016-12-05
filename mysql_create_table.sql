CREATE TABLE `tbl_client` (
	`id` INT(10) NOT NULL,
	`fio` varchar(60) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tbl_magazine` (
	`id` INT(10) NOT NULL,
	`descr` varchar(50) NOT NULL UNIQUE,
	`adresphone` varchar(40) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tbl_tovar` (
	`id` INT(10) NOT NULL,
	`descr` varchar(30) NOT NULL UNIQUE,
	`price` FLOAT(10) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tbl_tovar_list` (
	`id` INT(10) NOT NULL,
	`id_magazine` INT(10) NOT NULL,
	`id_tovar` INT(10) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tbl_pokupki` (
	`id` INT(10) NOT NULL,
	`id_client` INT(10) NOT NULL,
	`id_magazine` INT(10) NOT NULL,
	`data_pokupki` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tbl_check` (
	`id` INT(10) NOT NULL,
	`id_pokupki` INT(10) NOT NULL,
	`id_tovar` INT(10) NOT NULL,
	`kolichestvo` INT(5) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id`)
);

ALTER TABLE `tbl_tovar_list` ADD CONSTRAINT `tbl_tovar_list_fk0` FOREIGN KEY (`id_magazine`) REFERENCES `tbl_magazine`(`id`);

ALTER TABLE `tbl_tovar_list` ADD CONSTRAINT `tbl_tovar_list_fk1` FOREIGN KEY (`id_tovar`) REFERENCES `tbl_tovar`(`id`);

ALTER TABLE `tbl_pokupki` ADD CONSTRAINT `tbl_pokupki_fk0` FOREIGN KEY (`id_client`) REFERENCES `tbl_client`(`id`);

ALTER TABLE `tbl_pokupki` ADD CONSTRAINT `tbl_pokupki_fk1` FOREIGN KEY (`id_magazine`) REFERENCES `tbl_magazine`(`id`);

ALTER TABLE `tbl_check` ADD CONSTRAINT `tbl_check_fk0` FOREIGN KEY (`id_pokupki`) REFERENCES `tbl_pokupki`(`id`);

ALTER TABLE `tbl_check` ADD CONSTRAINT `tbl_check_fk1` FOREIGN KEY (`id_tovar`) REFERENCES `tbl_tovar`(`id`);

