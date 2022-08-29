create database mailserver;
CREATE USER 'mailuser'@'127.0.0.1' IDENTIFIED BY 'mailuserpass';
GRANT SELECT ON mailserver.* TO 'mailuser'@'*';
FLUSH PRIVILEGES;

FLUSH PRIVILEGES;

use mailserver;

CREATE TABLE `virtual_domains` (
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `virtual_users` (
`id` INT NOT NULL AUTO_INCREMENT,
`domain_id` INT NOT NULL,
`password` VARCHAR(106) NOT NULL,
`email` VARCHAR(120) NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `email` (`email`),
FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `mailserver`.`virtual_domains`
(`id` ,`name`)
VALUES
    ('1', 'woodytoys.louisdewilde.be');

INSERT INTO `mailserver`.`virtual_users`
(`id`, `domain_id`, `password` , `email`)
VALUES
    ('1', '1', ENCRYPT('pw_louis', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'louis@woodytoys.louisdewilde.be');

INSERT INTO `mailserver`.`virtual_users`
(`id`, `domain_id`, `password` , `email`)
VALUES
    ('2', '1', ENCRYPT('pw_tommy', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'tommy@woodytoys.louisdewilde.be');

INSERT INTO `mailserver`.`virtual_users`
(`id`, `domain_id`, `password` , `email`)
VALUES
    ('3', '1', ENCRYPT('pw_quentin', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'quentin@woodytoys.louisdewilde.be');

INSERT INTO `mailserver`.`virtual_users`
(`id`, `domain_id`, `password` , `email`)
VALUES
    ('4', '1', ENCRYPT('pw_B2B', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'b2b@woodytoys.louisdewilde.be');

INSERT INTO `mailserver`.`virtual_users`
(`id`, `domain_id`, `password` , `email`)
VALUES
    ('5', '1', ENCRYPT('pw_Contact', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'contact@woodytoys.louisdewilde.be');

