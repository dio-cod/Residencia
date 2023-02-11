/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : redvitabprueba

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2023-02-08 21:19:01
*/

SET FOREIGN_KEY_CHECKS=0;

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
  PRIMARY KEY (`m_id`),
  KEY `m_fkinst` (`m_fkinst`),
  KEY `m_fkgenero` (`m_fkgenero`),
  KEY `m_fkgrado` (`m_fkgrado`),
  KEY `m_fkestatus` (`m_fkestatus`),
  KEY `m_fktipo` (`m_fktipo`),
  CONSTRAINT `tab_miembro_ibfk_1` FOREIGN KEY (`m_fkinst`) REFERENCES `tab_dependencia` (`dep_id`),
  CONSTRAINT `tab_miembro_ibfk_2` FOREIGN KEY (`m_fkgenero`) REFERENCES `tab_sexo` (`sex_id`),
  CONSTRAINT `tab_miembro_ibfk_3` FOREIGN KEY (`m_fkgrado`) REFERENCES `tab_gradoacad` (`grado_id`),
  CONSTRAINT `tab_miembro_ibfk_4` FOREIGN KEY (`m_fkestatus`) REFERENCES `tab_estatus` (`est_id`),
  CONSTRAINT `tab_miembro_ibfk_5` FOREIGN KEY (`m_fktipo`) REFERENCES `tab_tipousuario` (`tip_id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_sexo
-- ----------------------------

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
