/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : red

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2023-02-11 21:11:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add user', '6', 'add_customuser');
INSERT INTO `auth_permission` VALUES ('22', 'Can change user', '6', 'change_customuser');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete user', '6', 'delete_customuser');
INSERT INTO `auth_permission` VALUES ('24', 'Can view user', '6', 'view_customuser');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_nodos_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_nodos_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `nodos_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'nodos', 'customuser');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2023-02-11 15:58:40.173307');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2023-02-11 15:58:40.196123');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2023-02-11 15:58:40.295442');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2023-02-11 15:58:40.315431');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2023-02-11 15:58:40.320427');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2023-02-11 15:58:40.326424');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2023-02-11 15:58:40.343986');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2023-02-11 15:58:40.345984');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2023-02-11 15:58:40.350982');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2023-02-11 15:58:40.355979');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2023-02-11 15:58:40.360976');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2023-02-11 15:58:40.369116');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2023-02-11 15:58:40.373114');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0012_alter_user_first_name_max_length', '2023-02-11 15:58:40.378111');
INSERT INTO `django_migrations` VALUES ('15', 'nodos', '0001_initial', '2023-02-11 15:58:40.480100');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0001_initial', '2023-02-11 15:58:40.527078');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0002_logentry_remove_auto_add', '2023-02-11 15:58:40.534074');
INSERT INTO `django_migrations` VALUES ('18', 'admin', '0003_logentry_add_action_flag_choices', '2023-02-11 15:58:40.541070');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2023-02-11 15:58:40.556828');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('62w4bkhnv0l0rd7sj8sve54v6rpd3kir', '.eJxVjMsOwiAQRf-FtSEdoDxcuvcbCMOAVA0kpV0Z_11JutDc3T0n58V82Lfi955WvxA7M2Cn3w9DfKQ6AN1DvTUeW93WBflQ-EE7vzZKz8vh_gVK6GVkSSIlh8J9J3UEhVnSnGYNAp0xkDFTtKQmlAIINVAEozVGreyULHt_AOqDN_4:1pQsko:283xjPXdGRC9z-i3yLPgpTP1AWMnJe9BEEF10J755Fs', '2023-02-25 16:29:34.851710');

-- ----------------------------
-- Table structure for nodos_customuser
-- ----------------------------
DROP TABLE IF EXISTS `nodos_customuser`;
CREATE TABLE `nodos_customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of nodos_customuser
-- ----------------------------
INSERT INTO `nodos_customuser` VALUES ('1', 'pbkdf2_sha256$390000$A6tQYDcxE7ajsgiBASPYLe$pOoVT6A5RgsEch8zfGUN9HEnyqgvZ/KlSRioiooI/ws=', '2023-02-11 16:29:34.845299', '1', '1', '1', '2023-02-11 16:03:31.595623', 'test@test.com');
INSERT INTO `nodos_customuser` VALUES ('2', 'pbkdf2_sha256$390000$FIpo97UYDolQc7R16RVFLZ$eZm5ZqvjcaJmTVgR40C31m8cloW19wS7V+VTdaa9jvs=', '2023-02-11 16:20:31.947470', '0', '0', '1', '2023-02-11 16:20:31.671917', 'mano96@live.com');

-- ----------------------------
-- Table structure for nodos_customuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `nodos_customuser_groups`;
CREATE TABLE `nodos_customuser_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nodos_customuser_groups_customuser_id_group_id_a2fe0922_uniq` (`customuser_id`,`group_id`),
  KEY `nodos_customuser_groups_group_id_44b607a8_fk_auth_group_id` (`group_id`),
  CONSTRAINT `nodos_customuser_gro_customuser_id_589f99af_fk_nodos_cus` FOREIGN KEY (`customuser_id`) REFERENCES `nodos_customuser` (`id`),
  CONSTRAINT `nodos_customuser_groups_group_id_44b607a8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of nodos_customuser_groups
-- ----------------------------

-- ----------------------------
-- Table structure for nodos_customuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `nodos_customuser_user_permissions`;
CREATE TABLE `nodos_customuser_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nodos_customuser_user_pe_customuser_id_permission_510d8594_uniq` (`customuser_id`,`permission_id`),
  KEY `nodos_customuser_use_permission_id_5a9a0bbf_fk_auth_perm` (`permission_id`),
  CONSTRAINT `nodos_customuser_use_customuser_id_d864d681_fk_nodos_cus` FOREIGN KEY (`customuser_id`) REFERENCES `nodos_customuser` (`id`),
  CONSTRAINT `nodos_customuser_use_permission_id_5a9a0bbf_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of nodos_customuser_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for tab_dependencia
-- ----------------------------
DROP TABLE IF EXISTS `tab_dependencia`;
CREATE TABLE `tab_dependencia` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_nomb` varchar(100) NOT NULL,
  `dep_siglas` varchar(10) NOT NULL,
  `dep_direccon` varchar(150) NOT NULL,
  `dep_localidad` varchar(50) NOT NULL,
  `dep_tel` char(10) NOT NULL,
  `dep_correo` varchar(100) NOT NULL,
  `dep_fktipo` int(11) NOT NULL,
  `dep_fkenlace` int(11) NOT NULL,
  PRIMARY KEY (`dep_id`),
  KEY `dep_fktipo` (`dep_fktipo`),
  KEY `dep_fkenlace` (`dep_fkenlace`),
  CONSTRAINT `tab_dependencia_ibfk_1` FOREIGN KEY (`dep_fktipo`) REFERENCES `tab_tipodependencia` (`tipodep_id`),
  CONSTRAINT `tab_dependencia_ibfk_2` FOREIGN KEY (`dep_fkenlace`) REFERENCES `tab_miembro` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_dependencia
-- ----------------------------

-- ----------------------------
-- Table structure for tab_descgrupo
-- ----------------------------
DROP TABLE IF EXISTS `tab_descgrupo`;
CREATE TABLE `tab_descgrupo` (
  `dg_id` int(11) NOT NULL AUTO_INCREMENT,
  ` dg_fkgrupo` int(11) NOT NULL,
  `dg_fkmiemb` int(11) NOT NULL,
  `dg_fkestatus` int(11) NOT NULL,
  PRIMARY KEY (`dg_id`),
  KEY ` dg_fkgrupo` (` dg_fkgrupo`),
  KEY `dg_fkmiemb` (`dg_fkmiemb`),
  KEY `dg_fkestatus` (`dg_fkestatus`),
  CONSTRAINT `tab_descgrupo_ibfk_1` FOREIGN KEY (` dg_fkgrupo`) REFERENCES `tab_grupo` (`grup_id`),
  CONSTRAINT `tab_descgrupo_ibfk_2` FOREIGN KEY (`dg_fkmiemb`) REFERENCES `tab_miembro` (`m_id`),
  CONSTRAINT `tab_descgrupo_ibfk_3` FOREIGN KEY (`dg_fkestatus`) REFERENCES `tab_estatus` (`est_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_descgrupo
-- ----------------------------

-- ----------------------------
-- Table structure for tab_descproyec
-- ----------------------------
DROP TABLE IF EXISTS `tab_descproyec`;
CREATE TABLE `tab_descproyec` (
  `dn_id` int(11) NOT NULL AUTO_INCREMENT,
  `dn_fknodo` int(11) NOT NULL,
  `dn_fkmiemb` int(11) NOT NULL,
  `dn_fkestatus` int(11) NOT NULL,
  PRIMARY KEY (`dn_id`),
  KEY `dn_fknodo` (`dn_fknodo`),
  KEY `dn_fkmiemb` (`dn_fkmiemb`),
  KEY `dn_fkestatus` (`dn_fkestatus`),
  CONSTRAINT `tab_descproyec_ibfk_1` FOREIGN KEY (`dn_fknodo`) REFERENCES `tab_proyecto` (`proy_id`),
  CONSTRAINT `tab_descproyec_ibfk_2` FOREIGN KEY (`dn_fkmiemb`) REFERENCES `tab_miembro` (`m_id`),
  CONSTRAINT `tab_descproyec_ibfk_3` FOREIGN KEY (`dn_fkestatus`) REFERENCES `tab_estatus` (`est_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_descproyec
-- ----------------------------

-- ----------------------------
-- Table structure for tab_descreunion
-- ----------------------------
DROP TABLE IF EXISTS `tab_descreunion`;
CREATE TABLE `tab_descreunion` (
  `desr_id` int(11) NOT NULL AUTO_INCREMENT,
  `desr_fkmiem` int(11) NOT NULL,
  `desr_fkreu` int(11) NOT NULL,
  PRIMARY KEY (`desr_id`),
  KEY `desr_fkmiem` (`desr_fkmiem`),
  KEY `desr_fkreu` (`desr_fkreu`),
  CONSTRAINT `tab_descreunion_ibfk_1` FOREIGN KEY (`desr_fkmiem`) REFERENCES `tab_miembro` (`m_id`),
  CONSTRAINT `tab_descreunion_ibfk_2` FOREIGN KEY (`desr_fkreu`) REFERENCES `tab_reuniong` (`reu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_descreunion
-- ----------------------------

-- ----------------------------
-- Table structure for tab_director
-- ----------------------------
DROP TABLE IF EXISTS `tab_director`;
CREATE TABLE `tab_director` (
  `dir_id` int(11) NOT NULL AUTO_INCREMENT,
  `dir_nombre` varchar(150) NOT NULL,
  `dir_tel` char(10) NOT NULL,
  `dir_tel2` char(10) DEFAULT NULL,
  `dir_correo` varchar(100) NOT NULL,
  `dir_correo2` varchar(100) DEFAULT NULL,
  `dir_fkdep` int(11) NOT NULL,
  PRIMARY KEY (`dir_id`),
  KEY `dir_fkdep` (`dir_fkdep`),
  CONSTRAINT `tab_director_ibfk_1` FOREIGN KEY (`dir_fkdep`) REFERENCES `tab_dependencia` (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_director
-- ----------------------------

-- ----------------------------
-- Table structure for tab_estatus
-- ----------------------------
DROP TABLE IF EXISTS `tab_estatus`;
CREATE TABLE `tab_estatus` (
  `est_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_nomb` varchar(15) NOT NULL,
  PRIMARY KEY (`est_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_estatus
-- ----------------------------

-- ----------------------------
-- Table structure for tab_gradoacad
-- ----------------------------
DROP TABLE IF EXISTS `tab_gradoacad`;
CREATE TABLE `tab_gradoacad` (
  `grado_id` int(11) NOT NULL AUTO_INCREMENT,
  `grado_nomb` varchar(15) NOT NULL,
  PRIMARY KEY (`grado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_gradoacad
-- ----------------------------

-- ----------------------------
-- Table structure for tab_grupo
-- ----------------------------
DROP TABLE IF EXISTS `tab_grupo`;
CREATE TABLE `tab_grupo` (
  `grup_id` int(11) NOT NULL AUTO_INCREMENT,
  `grup_nom` varchar(150) NOT NULL,
  `grup_fechac` date NOT NULL,
  `grup_fechat` date NOT NULL,
  `grup_desc` text DEFAULT NULL,
  `grup_integrante` int(10) NOT NULL,
  `grup_fkenlace` int(11) NOT NULL,
  `grup_fkcoord` int(11) NOT NULL,
  `grup_fkest` int(11) NOT NULL,
  `grup_fknodo` int(11) NOT NULL,
  PRIMARY KEY (`grup_id`),
  KEY `grup_fkenlace` (`grup_fkenlace`),
  KEY `grup_fkcoord` (`grup_fkcoord`),
  KEY `grup_fkest` (`grup_fkest`),
  CONSTRAINT `tab_grupo_ibfk_1` FOREIGN KEY (`grup_fkenlace`) REFERENCES `tab_miembro` (`m_id`),
  CONSTRAINT `tab_grupo_ibfk_2` FOREIGN KEY (`grup_fkcoord`) REFERENCES `tab_miembro` (`m_id`),
  CONSTRAINT `tab_grupo_ibfk_3` FOREIGN KEY (`grup_fkest`) REFERENCES `tab_estatus` (`est_id`),
  CONSTRAINT `tab_grupo_ibfk_4` FOREIGN KEY (`grup_id`) REFERENCES `tab_proyecto` (`proy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_grupo
-- ----------------------------

-- ----------------------------
-- Table structure for tab_miembro
-- ----------------------------
DROP TABLE IF EXISTS `tab_miembro`;
CREATE TABLE `tab_miembro` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_nomb` varchar(50) NOT NULL,
  `m_apellido` varchar(50) NOT NULL,
  `m_tel` char(10) NOT NULL,
  `m_tel2` char(10) DEFAULT NULL,
  `m_correo` varchar(80) NOT NULL,
  `m_correo2` varchar(80) DEFAULT NULL,
  `m_cargo` varchar(100) NOT NULL,
  `m_fechains` date NOT NULL,
  `m_fkinst` int(11) NOT NULL,
  `m_fkgenero` int(11) NOT NULL,
  `m_fkgrado` int(11) NOT NULL,
  `m_fkestatus` int(11) NOT NULL,
  `m_fktipo` int(11) NOT NULL,
  `m_fkuser` bigint(20) NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `m_fkinst` (`m_fkinst`),
  KEY `m_fkgenero` (`m_fkgenero`),
  KEY `m_fkgrado` (`m_fkgrado`),
  KEY `m_fkestatus` (`m_fkestatus`),
  KEY `m_fktipo` (`m_fktipo`),
  KEY `m_fkuser` (`m_fkuser`),
  CONSTRAINT `tab_miembro_ibfk_1` FOREIGN KEY (`m_fkinst`) REFERENCES `tab_dependencia` (`dep_id`),
  CONSTRAINT `tab_miembro_ibfk_2` FOREIGN KEY (`m_fkgenero`) REFERENCES `tab_sexo` (`sex_id`),
  CONSTRAINT `tab_miembro_ibfk_3` FOREIGN KEY (`m_fkgrado`) REFERENCES `tab_gradoacad` (`grado_id`),
  CONSTRAINT `tab_miembro_ibfk_4` FOREIGN KEY (`m_fkestatus`) REFERENCES `tab_estatus` (`est_id`),
  CONSTRAINT `tab_miembro_ibfk_5` FOREIGN KEY (`m_fktipo`) REFERENCES `tab_tipousuario` (`tip_id`),
  CONSTRAINT `tab_miembro_ibfk_6` FOREIGN KEY (`m_fkuser`) REFERENCES `nodos_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_miembro
-- ----------------------------

-- ----------------------------
-- Table structure for tab_proyecto
-- ----------------------------
DROP TABLE IF EXISTS `tab_proyecto`;
CREATE TABLE `tab_proyecto` (
  `proy_id` int(11) NOT NULL AUTO_INCREMENT,
  `proy_nomb` varchar(25) NOT NULL,
  `proy_tipo` varchar(15) NOT NULL,
  `proy_desc` varchar(150) DEFAULT '',
  `proy_fechini` date NOT NULL,
  `proy_fechfin` date NOT NULL,
  PRIMARY KEY (`proy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_proyecto
-- ----------------------------

-- ----------------------------
-- Table structure for tab_reuniong
-- ----------------------------
DROP TABLE IF EXISTS `tab_reuniong`;
CREATE TABLE `tab_reuniong` (
  `reu_id` int(11) NOT NULL AUTO_INCREMENT,
  `reu_participante` int(10) NOT NULL,
  `reu_obs` text NOT NULL,
  `reu_plat` varchar(100) NOT NULL,
  `reu_fecha` date NOT NULL,
  `reu_fkgrup` int(11) NOT NULL,
  PRIMARY KEY (`reu_id`),
  KEY `reu_fkgrup` (`reu_fkgrup`),
  CONSTRAINT `tab_reuniong_ibfk_1` FOREIGN KEY (`reu_fkgrup`) REFERENCES `tab_grupo` (`grup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_reuniong
-- ----------------------------

-- ----------------------------
-- Table structure for tab_sexo
-- ----------------------------
DROP TABLE IF EXISTS `tab_sexo`;
CREATE TABLE `tab_sexo` (
  `sex_id` int(11) NOT NULL AUTO_INCREMENT,
  `sex_nomb` varchar(10) NOT NULL,
  PRIMARY KEY (`sex_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_sexo
-- ----------------------------
INSERT INTO `tab_sexo` VALUES ('1', 'FEMENINO');
INSERT INTO `tab_sexo` VALUES ('2', 'MASCULINO');

-- ----------------------------
-- Table structure for tab_tipodependencia
-- ----------------------------
DROP TABLE IF EXISTS `tab_tipodependencia`;
CREATE TABLE `tab_tipodependencia` (
  `tipodep_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipodep_nomb` varchar(50) NOT NULL,
  PRIMARY KEY (`tipodep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_tipodependencia
-- ----------------------------

-- ----------------------------
-- Table structure for tab_tipousuario
-- ----------------------------
DROP TABLE IF EXISTS `tab_tipousuario`;
CREATE TABLE `tab_tipousuario` (
  `tip_id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_nomb` varchar(30) NOT NULL,
  PRIMARY KEY (`tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_tipousuario
-- ----------------------------
