DROP database clientmonitor;

CREATE DATABASE  IF NOT EXISTS `clientmonitor`;
USE `clientmonitor`;

CREATE TABLE `roles` (
`id` int(11) NOT NULL auto_increment,
`name` varchar(45) NOT NULL,

PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `rights` (
`id` int(11) NOT NULL auto_increment,
`name` varchar(45) NOT NULL,

PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `roles_rights` (
`role_id` int(11) NOT NULL,
`right_id` int(11) NOT NULL,

PRIMARY KEY (`role_id`, `right_id`),

FOREIGN KEY (`role_id`) REFERENCES roles(`id`),
FOREIGN KEY (`right_id`) REFERENCES rights(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL,
  
  PRIMARY KEY (`id`),
  FOREIGN KEY (`role_id`) REFERENCES roles(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `user_creator_id` int(11) NOT NULL,
  `creation_time` TIMESTAMP DEFAULT NOW(),
  
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_creator_id`) REFERENCES users(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `diagnostics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `left_eye` DECIMAL(2,1) DEFAULT NULL,
  `right_eye` DECIMAL(2,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `sessions` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`client_id` int(11) NOT NULL ,
`type` varchar(45) NOT NULL,
`creation_time` TIMESTAMP DEFAULT NOW(),

`duratation` int(11) NOT NULL,
`performance` int(3) NOT NULL,
`diagnostic_id` int(11),
`user_creator_id` int(11) NOT NULL,

PRIMARY KEY (`id`),
FOREIGN KEY (`client_id`) REFERENCES clients(`id`),
FOREIGN KEY (`diagnostic_id`) REFERENCES diagnostics(`id`),
FOREIGN KEY (`user_creator_id`) REFERENCES users(`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO roles(name) values ('DOCKTOR'), ('ADMIN');
INSERT INTO rights(name) values ('CREATE_CLIENT'), ('EDIT_CLIENT'), ('CREATE_SESSION'), ('CREATE_USER'), ('EDIT_USER');
INSERT INTO roles_rights(`role_id`, `right_id`) values 
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5);

INSERT INTO users(`first_name`, `last_name`, `login`, `role_id`) values ('Max', 'Smith', 'max123', 1);
INSERT INTO users(`first_name`, `last_name`, `login`, `role_id`) values ('Vlad', 'Papper', 'vlad123', 2);