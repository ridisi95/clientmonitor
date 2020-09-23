DROP database clientmonitor;

CREATE DATABASE  IF NOT EXISTS `clientmonitor`;
USE `clientmonitor`;

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `diagnostics`;

CREATE TABLE `diagnostics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `left_eye` DECIMAL(2,1) DEFAULT (0.0),
  `right_eye` DECIMAL(2,1) DEFAULT (0.0),
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`client_id` int(11) NOT NULL ,
`type` varchar(45) NOT NULL,
`creation_time` TIMESTAMP DEFAULT NOW(),
#duratation in minutes
`duratation` int(11) NOT NULL,
`performance` int(3) NOT NULL,
`diagnostic_id` int(11),

PRIMARY KEY (`id`),
FOREIGN KEY (`client_id`) REFERENCES clients(`id`),
FOREIGN KEY (`diagnostic_id`) REFERENCES diagnostics(`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


# test values

# INSERT INTO cats(name, age) VALUES ('Jetson', 7), ('Butter', 4);

INSERT INTO clients(first_name, last_name, notes) values ('Alex', 'Smolin', 'calm client');

INSERT INTO diagnostics(left_eye, right_eye) values ('0.2', '0.5');
INSERT INTO diagnostics(left_eye, right_eye) values ('0.5', '0.7');

INSERT INTO sessions(client_id, type, duratation, performance, diagnostic_id) values (1, "GAME", 30, 100, 1);
INSERT INTO sessions(client_id, type, duratation, performance, diagnostic_id) values (1, "WATCHING_VIDEO", 20, 25, 2);