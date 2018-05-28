# bumbelbee

------db create-----
---mysql version - 5.7--
CREATE DATABASE `bumbelbee` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE TABLE `attachment` (
  `attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attachment_data` longblob,
  `attachment_name` varchar(255) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

CREATE TABLE `bug` (
  `bug_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assign_to` blob,
  `cc_to` blob,
  `create_date` datetime DEFAULT NULL,
  `description` longtext,
  `platform` int(11) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `sec_vulnerability` tinyint(1) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `reported_by` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE `bug_attachment` (
  `bug_id` bigint(20) NOT NULL,
  `attachment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`bug_id`,`attachment_id`),
  UNIQUE KEY `UK_bf7b6c4a34e54f3eadbbb2edcb9` (`attachment_id`),
  UNIQUE KEY `UK_eedcfdd7b54b4041bcb0e3ad459` (`attachment_id`),
  UNIQUE KEY `UK_2fb8f69f2fb443b69581a6326d1` (`attachment_id`),
  UNIQUE KEY `UK_b473f67a79b5468193a855d1ed0` (`attachment_id`),
  UNIQUE KEY `UK_b1e3e31c3766488199e5ede42e1` (`attachment_id`),
  UNIQUE KEY `UK_8407566ab49f4ca7b47c6800260` (`attachment_id`),
  UNIQUE KEY `UK_5b2f8bf606de46839c9f4bd0e9a` (`attachment_id`),
  UNIQUE KEY `UK_d671be5d2d7b49beb1d17226655` (`attachment_id`),
  UNIQUE KEY `UK_d910664119dd43e0b96d26a91da` (`attachment_id`),
  UNIQUE KEY `UK_a7f3f759ef63428b873a74aa93b` (`attachment_id`),
  UNIQUE KEY `UK_513ad3bf3db04696ad6f51e4b9c` (`attachment_id`),
  UNIQUE KEY `UK_1eab501992f74655a59f2bffd17` (`attachment_id`),
  UNIQUE KEY `UK_d9c908119f834dae8d14aa42182` (`attachment_id`),
  UNIQUE KEY `UK_18abea40406b4bf6b6ded89b6af` (`attachment_id`),
  UNIQUE KEY `UK_f3256a82f2a44aaf81edc7c8e6e` (`attachment_id`),
  UNIQUE KEY `UK_0aee46b2a0fb432b8bcafa9d398` (`attachment_id`),
  UNIQUE KEY `UK_f5a1eae24e124b749355d6b4d38` (`attachment_id`),
  UNIQUE KEY `UK_fbc4ed96a03f44299b08dc6a13c` (`attachment_id`),
  UNIQUE KEY `UK_5d140163829f4a20b6edae3101a` (`attachment_id`),
  UNIQUE KEY `UK_13cc65f2a4d9485798c04b0e4b8` (`attachment_id`),
  UNIQUE KEY `UK_7de9d8dc3e134255af5d843eaa8` (`attachment_id`),
  UNIQUE KEY `UK_15920917aeb44d41b21a45eb069` (`attachment_id`),
  UNIQUE KEY `UK_352b5168cfc845ccbce287e24e4` (`attachment_id`),
  UNIQUE KEY `UK_79098d0251b84157992bd3457fe` (`attachment_id`),
  UNIQUE KEY `UK_1fe71715fb69447f84a90dc249d` (`attachment_id`),
  UNIQUE KEY `UK_0e868927a59f459aa47427cbadc` (`attachment_id`),
  UNIQUE KEY `UK_f1512073859649c89614bb9fff5` (`attachment_id`),
  UNIQUE KEY `UK_b4f35d6f874b41eea144df7c382` (`attachment_id`),
  UNIQUE KEY `UK_57f7335b20504fdea10f7d9dae9` (`attachment_id`),
  UNIQUE KEY `UK_af9c59adc2ad463f9bd876e9c3e` (`attachment_id`),
  UNIQUE KEY `UK_5bd38590bf4249ea8eab45025eb` (`attachment_id`),
  UNIQUE KEY `UK_9f44fa5a7e7c465b91525e382c3` (`attachment_id`),
  UNIQUE KEY `UK_71fad430db484142a0468121bf1` (`attachment_id`),
  UNIQUE KEY `UK_64963c356bd64856aba337525c0` (`attachment_id`),
  UNIQUE KEY `UK_cf691eb68af947849686fd10cc5` (`attachment_id`),
  UNIQUE KEY `UK_f15558f3c7d7448088601a80e98` (`attachment_id`),
  UNIQUE KEY `UK_dfcab665cff14797a85af3e3468` (`attachment_id`),
  UNIQUE KEY `UK_998c4903ed4e4895abeabe27162` (`attachment_id`),
  UNIQUE KEY `UK_7503cfac88a04fb58fbe04b7139` (`attachment_id`),
  UNIQUE KEY `UK_2d2a38f90e154562ae0505aad61` (`attachment_id`),
  UNIQUE KEY `UK_a2086bf2cff44029a2982268bf1` (`attachment_id`),
  UNIQUE KEY `UK_3604d7820edc4441b75c0cac023` (`attachment_id`),
  UNIQUE KEY `UK_595be121a1e8456ead83c3cb7cb` (`attachment_id`),
  UNIQUE KEY `UK_e02b323b4cbd4d81bd600abe518` (`attachment_id`),
  UNIQUE KEY `UK_dff72f7edf5e4b748f7bdd62399` (`attachment_id`),
  UNIQUE KEY `UK_fd812b7f9207446189db0beede4` (`attachment_id`),
  UNIQUE KEY `UK_7d10ae6fc6924866ab81c604c52` (`attachment_id`),
  UNIQUE KEY `UK_0bcf35e5ed694241ad0ec77c180` (`attachment_id`),
  UNIQUE KEY `UK_0f2eda55ddd84c4488711f85d04` (`attachment_id`),
  UNIQUE KEY `UK_0e2b319b03a249869904bc68946` (`attachment_id`),
  UNIQUE KEY `UK_304dea29523e409cb6962f7fbe0` (`attachment_id`),
  UNIQUE KEY `UK_e0c4b574b4be4365a1528e8188c` (`attachment_id`),
  UNIQUE KEY `UK_c86b729cda054be2af95ed0f802` (`attachment_id`),
  UNIQUE KEY `UK_2a48bbc2bf3f4830a38f818919f` (`attachment_id`),
  UNIQUE KEY `UK_50cbb14caec54fd48e05645e186` (`attachment_id`),
  UNIQUE KEY `UK_6f6bedd72b5246b586072456c4e` (`attachment_id`),
  UNIQUE KEY `UK_3e673ab797ae4855b6ed8123d69` (`attachment_id`),
  UNIQUE KEY `UK_cc85f75a15f2499a95a42d0afdc` (`attachment_id`),
  UNIQUE KEY `UK_8b8bfde5e38d48b68469bc97bfc` (`attachment_id`),
  UNIQUE KEY `UK_60a0b12aa3fd4e2d8cb2580140e` (`attachment_id`),
  UNIQUE KEY `UK_ed6e60dc2cc94cd4be079d2ef7c` (`attachment_id`),
  KEY `FK_2295ec4bafc5417e955153deffc` (`attachment_id`),
  KEY `FK_7b0eb63a615c422fb9b1e6db97c` (`bug_id`),
  CONSTRAINT `FK_2295ec4bafc5417e955153deffc` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`attachment_id`),
  CONSTRAINT `FK_7b0eb63a615c422fb9b1e6db97c` FOREIGN KEY (`bug_id`) REFERENCES `bug` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bug_comment` (
  `bug_id` bigint(20) DEFAULT NULL,
  `comment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_04ce6ba80e4e4cf28b4f65a91e5` (`bug_id`),
  KEY `FK_3dd33e13499e40aa8bb2452e103` (`comment_id`),
  CONSTRAINT `FK_04ce6ba80e4e4cf28b4f65a91e5` FOREIGN KEY (`bug_id`) REFERENCES `bug` (`bug_id`),
  CONSTRAINT `FK_3dd33e13499e40aa8bb2452e103` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comment` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `description` longtext,
  `comented_by` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

CREATE TABLE `comment_attachment` (
  `comment_id` bigint(20) NOT NULL,
  `attachment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`comment_id`,`attachment_id`),
  UNIQUE KEY `UK_d33171a19a3245ae890b85dd68a` (`attachment_id`),
  UNIQUE KEY `UK_1cf68afc30454c418ce65798b03` (`attachment_id`),
  UNIQUE KEY `UK_378af1979a29479b89768a1343f` (`attachment_id`),
  UNIQUE KEY `UK_8f8d0e78e7eb4660aaf0cf8d875` (`attachment_id`),
  UNIQUE KEY `UK_62b11a51b8f5415b87796e75cf9` (`attachment_id`),
  UNIQUE KEY `UK_17e21a9801464f699a5bda7f40a` (`attachment_id`),
  UNIQUE KEY `UK_31c1d5bfc31b47bfbc52a86b1dc` (`attachment_id`),
  UNIQUE KEY `UK_abb532049e4e42cb96448b81cbc` (`attachment_id`),
  UNIQUE KEY `UK_0a4d909b50ff4deea06e0b3b494` (`attachment_id`),
  UNIQUE KEY `UK_90b1bee44f0446ddb78ddf447b5` (`attachment_id`),
  UNIQUE KEY `UK_7faefc844a4049dfa996eb853fa` (`attachment_id`),
  UNIQUE KEY `UK_7a62784109a94e238348aebf618` (`attachment_id`),
  UNIQUE KEY `UK_7f81b26f37694fab81ce6d14af6` (`attachment_id`),
  UNIQUE KEY `UK_b4c3e8133d084dc3955efef8be0` (`attachment_id`),
  UNIQUE KEY `UK_90234791304c4f779c8e337ec8c` (`attachment_id`),
  UNIQUE KEY `UK_a1bca3892c474748a8fa35eb620` (`attachment_id`),
  UNIQUE KEY `UK_dc737e9df0044206a648c3fcef4` (`attachment_id`),
  UNIQUE KEY `UK_b4aff48bcffd438a9a18a7b376e` (`attachment_id`),
  UNIQUE KEY `UK_cbdd10e1f6ed4e3dab66994a9de` (`attachment_id`),
  UNIQUE KEY `UK_7b1502d037c34e10940c89dfed2` (`attachment_id`),
  UNIQUE KEY `UK_3fef6bfb56524b5ba0e69eee271` (`attachment_id`),
  UNIQUE KEY `UK_63242fb8d7e94a529ea5813ccf7` (`attachment_id`),
  UNIQUE KEY `UK_506499ecf2a146b99733e26efe8` (`attachment_id`),
  UNIQUE KEY `UK_acc574a9faad4d3d8d5371cecef` (`attachment_id`),
  UNIQUE KEY `UK_e757008e93424c78bc9e1314951` (`attachment_id`),
  UNIQUE KEY `UK_e94714a17e5f4f0394c589a725f` (`attachment_id`),
  UNIQUE KEY `UK_76e206fbe3004f5fb68446db6e0` (`attachment_id`),
  UNIQUE KEY `UK_4e3101686783449fb8de5627821` (`attachment_id`),
  UNIQUE KEY `UK_fe9eaa2367d7402d8d1f1ac5d44` (`attachment_id`),
  UNIQUE KEY `UK_46600730f47e4244848afdf0f16` (`attachment_id`),
  UNIQUE KEY `UK_f2999980645b43659653c25e925` (`attachment_id`),
  UNIQUE KEY `UK_c7549cf4954441a0b285234c98d` (`attachment_id`),
  UNIQUE KEY `UK_0f35e58320bd4b80bf5f95e05d5` (`attachment_id`),
  UNIQUE KEY `UK_d358fd801e7e420bb26fbee6792` (`attachment_id`),
  UNIQUE KEY `UK_54e49fab87aa40f39977854386c` (`attachment_id`),
  UNIQUE KEY `UK_ed3bc239369b4e9ebdfb68581b8` (`attachment_id`),
  UNIQUE KEY `UK_c2134941ee7c4d8098891e5abcf` (`attachment_id`),
  UNIQUE KEY `UK_d29e0f6d795b49b993d7b2d64fd` (`attachment_id`),
  UNIQUE KEY `UK_e2519c2e1e9c4112a2344be59a5` (`attachment_id`),
  UNIQUE KEY `UK_ea9f7d438d5043ec9973c897751` (`attachment_id`),
  UNIQUE KEY `UK_6799ab2c7ec04e959d7b5d9d20a` (`attachment_id`),
  UNIQUE KEY `UK_9c604de0a88d4a0bb8f65cfcfaa` (`attachment_id`),
  UNIQUE KEY `UK_5fcac0501f604bac934f35dd646` (`attachment_id`),
  UNIQUE KEY `UK_5d67b8aacca34c0ca4820cc1fd5` (`attachment_id`),
  UNIQUE KEY `UK_f179285b05c04bfaa28b04c6cb7` (`attachment_id`),
  UNIQUE KEY `UK_b4f876312559480da073d5582ea` (`attachment_id`),
  UNIQUE KEY `UK_aedeb831522d4caab669a80a717` (`attachment_id`),
  UNIQUE KEY `UK_ee42301fa78b4c6d86996d50546` (`attachment_id`),
  UNIQUE KEY `UK_34c852ee83474b3ca482b0a8a46` (`attachment_id`),
  UNIQUE KEY `UK_e57c467629dc45ebbac8d75d152` (`attachment_id`),
  UNIQUE KEY `UK_27a611bd8b064e7090298393832` (`attachment_id`),
  UNIQUE KEY `UK_a93881f622af495ea1177f3f8c4` (`attachment_id`),
  UNIQUE KEY `UK_5f815ff4a39c45759172ec890a6` (`attachment_id`),
  UNIQUE KEY `UK_e1a09ca927c642728e79e623df3` (`attachment_id`),
  UNIQUE KEY `UK_5aa18d145d6a4980a1be913f5b3` (`attachment_id`),
  UNIQUE KEY `UK_6525fe4c44404966b07a0dbdeca` (`attachment_id`),
  UNIQUE KEY `UK_d179dd866c6248508b0a3b7f8fc` (`attachment_id`),
  UNIQUE KEY `UK_29052bdf74584294a38251d8ffc` (`attachment_id`),
  UNIQUE KEY `UK_24c91099c0ce455096adaf44896` (`attachment_id`),
  UNIQUE KEY `UK_db1c8450095d4151b712b5a477b` (`attachment_id`),
  UNIQUE KEY `UK_bf48a7ce2fe4488f98cbe826f72` (`attachment_id`),
  KEY `FK_56770cfe61ec4c2a8f66bfcadb1` (`attachment_id`),
  KEY `FK_54cdf826069c48b49daa3369703` (`comment_id`),
  CONSTRAINT `FK_54cdf826069c48b49daa3369703` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  CONSTRAINT `FK_56770cfe61ec4c2a8f66bfcadb1` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `project` (
  `project_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_description` varchar(255) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_active` tinyint(1) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_7538d8ac2c324044b9a14c1b026` (`user_email`),
  UNIQUE KEY `UK_3be520c3a982455d8077180badd` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `user_password` (
  `userpassword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userpassword_activation_token` varchar(255) DEFAULT NULL,
  `userpassword_activation_token_timestamp` datetime DEFAULT NULL,
  `userpassword_email` varchar(255) DEFAULT NULL,
  `userpassword_password_token` varchar(255) DEFAULT NULL,
  `userpassword_password_token_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`userpassword_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `user_project` (
  `user_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `FK_5671c3991bf14ddaa70de5b893b` (`user_id`),
  KEY `FK_0bda3be6cfd04028bae7bb6757f` (`project_id`),
  CONSTRAINT `FK_0bda3be6cfd04028bae7bb6757f` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `FK_5671c3991bf14ddaa70de5b893b` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_32c0327c260c4418a1d9d449712` (`role_id`),
  KEY `FK_7ffe0d094ae5420c89de58a2878` (`user_id`),
  CONSTRAINT `FK_32c0327c260c4418a1d9d449712` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FK_7ffe0d094ae5420c89de58a2878` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
test commit by gyanesh...// IGNOREW_
