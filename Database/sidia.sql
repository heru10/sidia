/*
Navicat MariaDB Data Transfer

Source Server         : klop
Source Server Version : 100129
Source Host           : localhost:3307
Source Database       : sidia

Target Server Type    : MariaDB
Target Server Version : 100129
File Encoding         : 65001

Date: 2018-09-05 19:40:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for berkas
-- ----------------------------
DROP TABLE IF EXISTS `berkas`;
CREATE TABLE `berkas` (
  `BerkasId` int(11) NOT NULL AUTO_INCREMENT,
  `KodeReg` varchar(30) DEFAULT NULL,
  `IntNomor` int(8) DEFAULT NULL,
  `Nomor` varchar(30) DEFAULT NULL,
  `ClId` int(11) DEFAULT NULL,
  `RetensiInAktif` date DEFAULT NULL,
  `RoleId` varchar(11) DEFAULT NULL,
  `Uraian` varchar(255) DEFAULT NULL,
  `KurunWaktu` varchar(30) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `SatuanId` int(11) DEFAULT NULL,
  `TPId` int(11) DEFAULT NULL,
  `MediaId` int(11) DEFAULT NULL,
  `KondisId` int(11) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `Gedung` varchar(30) DEFAULT NULL,
  `Lemari` varchar(30) DEFAULT NULL,
  `Baris` varchar(30) DEFAULT NULL,
  `Boks` varchar(30) DEFAULT NULL,
  `StatusDok` varchar(20) DEFAULT NULL,
  `Path` varchar(100) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  `Operator` int(11) DEFAULT NULL,
  PRIMARY KEY (`BerkasId`) USING BTREE,
  KEY `berkas_ibfk_1` (`Operator`),
  KEY `berkas_ibfk_2` (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of berkas
-- ----------------------------
INSERT INTO `berkas` VALUES ('1', 'Nomor Reg. B-356923473226172', '1', '001', '3', '2018-08-06', 'UK.1.1.3.1', 'adada', '2009', '1', null, '1', '1', '1', '', '22', '11', '2', '1', 'aktif', 'Upload_Files/F_836424442345544/dok_001/', '2018-08-06 11:10:13', '4');
INSERT INTO `berkas` VALUES ('2', 'Nomor Reg. B-264644623267544', null, '1221', '2', '0000-00-00', 'UK.1.1.3.1', 'Pertama1', '2005', '1', null, '1', '1', '1', '', '2', '3', '2', '1', 'inaktif', 'Upload_Files/F_836424442345544/xdok_1221/', '2018-08-06 11:56:52', '4');
INSERT INTO `berkas` VALUES ('3', 'Nomor Reg. B-494444424482684', '1', '001', '2', '2018-08-06', 'UK.1.1.1.1', 'Gr', '2018', '1', null, '1', '1', '1', '', '2', '2', '3', '1', 'aktif', 'Upload_Files/F_143152101426549/dok_001/', '2018-08-06 15:48:03', '2');
INSERT INTO `berkas` VALUES ('4', 'Nomor Reg. B-257203634462722', '1', '001', '2', '2018-08-06', 'UK.1.2.1.1', 'Abc', '2018', '1', null, '1', '1', '1', '', '3', '2', '1', '2', 'aktif', 'Upload_Files/F_543514604140365/dok_001/', '2018-08-06 17:01:57', '6');
INSERT INTO `berkas` VALUES ('5', 'Nomor Reg. B-242623442228471', '1', '001', '3', '2018-08-09', 'UK.1.4.1', 'Perjalanan Direksi ke Singapure', '2017', '1', null, '1', '1', '1', '', '4', '2', '1', '3', 'aktif', 'Upload_Files/F_326442346150154/dok_001/', '2018-08-09 08:13:01', '11');

-- ----------------------------
-- Table structure for berkas_v1
-- ----------------------------
DROP TABLE IF EXISTS `berkas_v1`;
CREATE TABLE `berkas_v1` (
  `BerkasId` int(11) NOT NULL AUTO_INCREMENT,
  `ParrentBerkasId` int(11) DEFAULT NULL,
  `KodeReg` varchar(30) DEFAULT NULL,
  `ClId` int(11) DEFAULT NULL,
  `RetensiInAktif` date DEFAULT NULL,
  `RoleId` varchar(20) DEFAULT NULL,
  `Nomor` varchar(30) DEFAULT NULL,
  `Nip` varchar(30) DEFAULT NULL,
  `Uraian` varchar(255) DEFAULT NULL,
  `KurunWaktu` varchar(30) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `SatuanId` int(11) DEFAULT NULL,
  `TPId` int(11) DEFAULT NULL,
  `MediaId` int(11) DEFAULT NULL,
  `KondisId` int(11) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `Gedung` varchar(30) DEFAULT NULL,
  `Lemari` varchar(30) DEFAULT NULL,
  `Baris` varchar(30) DEFAULT NULL,
  `Boks` varchar(30) DEFAULT NULL,
  `StatusDok` varchar(20) DEFAULT NULL,
  `SubBerkas` varchar(255) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  `Operator` int(11) DEFAULT NULL,
  `Path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BerkasId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of berkas_v1
-- ----------------------------
INSERT INTO `berkas_v1` VALUES ('1', null, 'B-934443523365342', '5', null, 'UK.1.2.1.1', '001', '4431', 'Kurniawan', '2018', '0', null, '1', '1', '1', '', 'SDM', '3', '2', '1', 'aktif', '', '2018-08-04 15:31:48', '6', 'Upload_Files/F_543514604140365/vosdm_001/');
INSERT INTO `berkas_v1` VALUES ('2', '1', 'B-464213462342433', '2', null, 'UK.1.2.1.1', '001.1', '-', 'Mutasi', '2018', '0', null, '1', '1', '1', '', 'SDM', '1', '2', '1', 'aktif', 'sub', '2018-08-04 15:32:56', '6', 'Upload_Files/F_543514604140365/vosdm_001.1/');
INSERT INTO `berkas_v1` VALUES ('3', null, 'B-230423201243776', '3', null, 'UK.1.2.1.1', '002', '0981', 'Wisnu', '2018', '0', null, '1', '1', '1', '', '2', '3', '1', '2', 'aktif', '', '2018-08-06 15:31:50', '6', 'Upload_Files/F_543514604140365/vosdm_002/');
INSERT INTO `berkas_v1` VALUES ('4', '3', 'B-053464324435220', '3', null, 'UK.1.2.1.1', '002.1', '-', 'Ijin Belajar', '2018', '0', null, '1', '1', '1', '', '3', '2', '1', '2', 'aktif', 'sub', '2018-08-06 15:32:16', '6', 'Upload_Files/F_543514604140365/vosdm_002.1/');
INSERT INTO `berkas_v1` VALUES ('5', null, 'B-653541562444146', '2', null, 'UK.1.2.1.1', '002', '443', 'Kurniawan', '2018', '0', null, '1', '1', '1', '', '2', '12', '1', '2', 'aktif', '', '2018-08-13 14:34:34', '6', 'Upload_Files/F_543514604140365/vosdm_002/');
INSERT INTO `berkas_v1` VALUES ('6', '5', 'B-316526564315645', '3', null, 'UK.1.2.1.1', '002.1', '-', 'Cuti', '2018', '0', null, '1', '1', '1', '', '2', '1', '2', '2', 'aktif', 'sub', '2018-08-13 14:34:57', '6', 'Upload_Files/F_543514604140365/vosdm_002.1/');
INSERT INTO `berkas_v1` VALUES ('7', null, 'B-496726142471344', '3', null, 'UK.1.2.1.1', '002', '7765', 'Mustafa', '2018', '0', null, '1', '1', '1', '', '2', '12', '2', '2', 'aktif', '', '2018-08-16 08:07:34', '6', 'Upload_Files/F_543514604140365/vosdm_002/');
INSERT INTO `berkas_v1` VALUES ('8', null, 'B-666253136214283', '2', null, 'UK.1.2.1.1', '002', '7626', 'Ahmad', '2018', '0', null, '1', '1', '1', '', '3', '2', '1', '2', 'aktif', '', '2018-09-04 16:28:19', '6', 'Upload_Files/F_543514604140365/vosdm_002/');
INSERT INTO `berkas_v1` VALUES ('9', null, 'B-637050670622343', '3', null, 'UK.1.2.1.1', '002', '7465', 'Deni Apriyandi', '2018', '0', null, '1', '1', '1', '', '', '', '', '', 'aktif', '', '2018-09-04 16:30:10', '6', 'Upload_Files/F_543514604140365/vosdm_002/');
INSERT INTO `berkas_v1` VALUES ('10', '9', 'B-530653464263512', '4', null, 'UK.1.2.1.1', '002.1', '-', 'Ijazah', '2018', '0', null, '1', '1', '1', '', '', '', '', '', 'aktif', 'sub', '2018-09-04 16:30:56', '6', 'Upload_Files/F_543514604140365/vosdm_002.1/');
INSERT INTO `berkas_v1` VALUES ('11', null, 'B-320940433424773', '5', null, 'UK.10.2.1.1.1', '001', '223', 'Maman', '2018', '0', null, '1', '1', '1', '', '3', '2', '1', '3', 'aktif', '', '2018-09-05 10:03:19', '4', 'Upload_Files/F_417364544434314/vosdm_001/');
INSERT INTO `berkas_v1` VALUES ('12', '11', 'B-844422134236671', '5', null, 'UK.10.2.1.1.1', '001.1', '-', 'Ijazah SMA', '2018', '0', null, '1', '1', '1', '', '4', '2', '1', '3', 'aktif', 'sub', '2018-09-05 10:16:26', '4', 'Upload_Files/F_417364544434314/vosdm_001.1/');
INSERT INTO `berkas_v1` VALUES ('13', null, 'B-261214531435513', '4', null, 'UK.10.2.1.1.1', '002', '6632', 'Agus', '2018', '0', null, '1', '1', '1', '', '4', '2', '1', '3', 'aktif', '', '2018-09-05 10:18:28', '4', 'Upload_Files/F_417364544434314/vosdm_002/');
INSERT INTO `berkas_v1` VALUES ('14', '13', 'B-431246467836266', '4', null, 'UK.10.2.1.1.1', '002.1', '-', 'Penghargaan', '2018', '0', null, '1', '1', '1', '', '3', '2', '21', '3', 'aktif', 'sub', '2018-09-05 12:03:23', '4', 'Upload_Files/F_417364544434314/vosdm_002.1/');

-- ----------------------------
-- Table structure for berkas_v2
-- ----------------------------
DROP TABLE IF EXISTS `berkas_v2`;
CREATE TABLE `berkas_v2` (
  `BerkasId` int(11) NOT NULL AUTO_INCREMENT,
  `ParrentBerkasId` int(11) DEFAULT NULL,
  `KodeReg` varchar(30) DEFAULT NULL,
  `Nomor` varchar(10) DEFAULT NULL,
  `ClId` int(11) DEFAULT NULL,
  `RetensiInAktif` date DEFAULT NULL,
  `RoleId` varchar(20) DEFAULT NULL,
  `Uraian` varchar(255) DEFAULT NULL,
  `KurunWaktu` varchar(30) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `SatuanId` int(11) DEFAULT NULL,
  `TPId` int(11) DEFAULT NULL,
  `MediaId` int(11) DEFAULT NULL,
  `KondisId` int(11) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `Path` varchar(255) DEFAULT NULL,
  `Gedung` varchar(30) DEFAULT NULL,
  `Lemari` varchar(30) DEFAULT NULL,
  `Baris` varchar(30) DEFAULT NULL,
  `Boks` varchar(30) DEFAULT NULL,
  `StatusDok` varchar(20) DEFAULT NULL,
  `SubBerkas` varchar(255) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  `Operator` int(11) DEFAULT NULL,
  PRIMARY KEY (`BerkasId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of berkas_v2
-- ----------------------------
INSERT INTO `berkas_v2` VALUES ('1', null, 'B-624734664134732', '001', '2', null, 'UK.1.4.1', 'Peraturan Dokumen Produksi Spesimen', '2018', '0', null, '1', '1', '1', '', 'Upload_Files/F_326442346150154/vsetkol_001/', '2', '3', '2', '1', 'aktif', '', '2018-08-30 07:25:01', '11');
INSERT INTO `berkas_v2` VALUES ('2', '1', 'B-026524332212372', '001.1', '2', null, 'UK.1.4.1', 'S1', '2017', '0', null, '1', '1', '1', '', 'Upload_Files/F_326442346150154/vsetkol_001.1/', '3', '2', '1', '3', 'aktif', 'sub', '2018-08-06 15:03:54', '11');
INSERT INTO `berkas_v2` VALUES ('12', '1', 'B-226222122637643', '001.2', '3', null, 'UK.1.4.1', 'DPM33', '1990', '0', null, '2', '1', '2', '', 'Upload_Files/F_326442346150154/vsetkol_001.2/', '2', '1', '2', '1', 'aktif', 'sub', '2018-09-02 12:19:38', '11');
INSERT INTO `berkas_v2` VALUES ('13', null, 'B-564332246523514', '001', '14', null, 'UK.1.1', 'Perdana', '2018', '0', null, '1', '1', '1', '', 'Upload_Files/F_634994722420448/vsetkol_001/', '', '', '', '', 'aktif', '', '2018-09-05 18:18:51', '2');
INSERT INTO `berkas_v2` VALUES ('14', '13', 'B-395139323219651', '001.1', '8', null, 'UK.1.1', 'sfasfas', '1', '0', null, '1', '1', '1', '', 'Upload_Files/F_634994722420448/vsetkol_001.1/', '', '', '', '', 'aktif', 'sub', '2018-09-05 18:23:17', '2');
INSERT INTO `berkas_v2` VALUES ('23', null, 'B-472262188614446', '002', '4', null, 'UK.1.1', 'Pernyataan Tugas 1', '2424', '0', null, '1', '1', '1', '', 'Upload_Files/F_634994722420448/vsetkol_002/', '1', '2', '1', '2', 'aktif', '', '2018-09-05 19:02:16', '2');

-- ----------------------------
-- Table structure for detailvital
-- ----------------------------
DROP TABLE IF EXISTS `detailvital`;
CREATE TABLE `detailvital` (
  `DetailVitalId` int(11) NOT NULL AUTO_INCREMENT,
  `RegVitalId` int(11) DEFAULT NULL,
  `Ket` varchar(3) DEFAULT NULL,
  `Gedung` varchar(50) DEFAULT NULL,
  `Lemari` varchar(50) DEFAULT NULL,
  `Baris` varchar(50) DEFAULT NULL,
  `Boks` varchar(50) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `Operator` int(15) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  PRIMARY KEY (`DetailVitalId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detailvital
-- ----------------------------
INSERT INTO `detailvital` VALUES ('8', '3', 'sp', '2', '1', '3', '1', null, '4', '2018-08-17 04:16:35');
INSERT INTO `detailvital` VALUES ('9', '3', 'ut', '3', '2', '1', '2', null, '4', '2018-08-21 08:10:20');
INSERT INTO `detailvital` VALUES ('10', '3', 'st', '1', '2', '3', '1', null, '4', '2018-08-21 08:11:21');
INSERT INTO `detailvital` VALUES ('11', '3', 'pl', '5', '4', '3', '2', '', '4', '2018-08-21 08:11:44');
INSERT INTO `detailvital` VALUES ('12', '4', 'sp', '3', '2', '1', '2', null, '3', '2018-09-04 23:22:42');
INSERT INTO `detailvital` VALUES ('13', '4', 'ut', '3', '2', '1', '2', null, '3', '2018-09-04 23:34:09');
INSERT INTO `detailvital` VALUES ('14', '4', 'st', '4', '2', '1', '1', null, '3', '2018-09-04 23:43:38');
INSERT INTO `detailvital` VALUES ('15', '4', 'pl', '4', '2', '1', '2', '', '3', '2018-09-04 23:44:08');

-- ----------------------------
-- Table structure for detailvitalfile
-- ----------------------------
DROP TABLE IF EXISTS `detailvitalfile`;
CREATE TABLE `detailvitalfile` (
  `DetVFileId` int(11) NOT NULL AUTO_INCREMENT,
  `RegVitalId` int(11) DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `Size` int(15) DEFAULT NULL,
  `KodeReg` varchar(50) DEFAULT NULL,
  `Ket` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`DetVFileId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detailvitalfile
-- ----------------------------
INSERT INTO `detailvitalfile` VALUES ('33', '4', 'Upload_Files/F_363362460623632/sp_dalitas-16164/1.jpg', '31418', 'Dalitas_21433', 'sp');
INSERT INTO `detailvitalfile` VALUES ('34', '4', 'Upload_Files/F_363362460623632/sp_dalitas-16164/2.jpg', '75554', 'Dalitas_25522', 'sp');
INSERT INTO `detailvitalfile` VALUES ('36', '4', 'Upload_Files/F_363362460623632/ut_dalitas-16164/pr_3337312.pdf', '573637', 'Dalitas_10248', 'ut');
INSERT INTO `detailvitalfile` VALUES ('38', '4', 'Upload_Files/F_363362460623632/pl_dalitas-16164/bukti daftar seminar.jpg', '85545', 'Dalitas_44164', 'pl');
INSERT INTO `detailvitalfile` VALUES ('39', '4', 'Upload_Files/F_363362460623632/pl_dalitas-16164/pr_0133533.pdf', '95994', 'Dalitas_44345', 'pl');
INSERT INTO `detailvitalfile` VALUES ('41', '4', 'Upload_Files/F_363362460623632/st_dalitas-16164/pr_2326022.pdf', '95994', 'Dalitas_63323', 'st');
INSERT INTO `detailvitalfile` VALUES ('42', '4', 'Upload_Files/F_363362460623632/pl_dalitas-16164/pr_6333643.pdf', '145231', 'Dalitas_43622', 'pl');

-- ----------------------------
-- Table structure for detailvitalfile_proof
-- ----------------------------
DROP TABLE IF EXISTS `detailvitalfile_proof`;
CREATE TABLE `detailvitalfile_proof` (
  `DetVFileId` int(11) NOT NULL AUTO_INCREMENT,
  `DetailProfId` int(11) DEFAULT NULL,
  `RegVitalId` int(11) DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `Size` int(15) DEFAULT NULL,
  `Ket` varchar(10) DEFAULT NULL,
  `KodeReg` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DetVFileId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detailvitalfile_proof
-- ----------------------------
INSERT INTO `detailvitalfile_proof` VALUES ('3', null, '2', 'Upload_Files/F_143152101426549/sp_sainprof-84346/6.jpg', '62316', 'sp', 'SainProof_642213656544330');
INSERT INTO `detailvitalfile_proof` VALUES ('4', null, '2', 'Upload_Files/F_143152101426549/ut_sainprof-84346/pr_3337312.pdf', '573637', 'ut', 'SainProof_423658418634342');
INSERT INTO `detailvitalfile_proof` VALUES ('6', null, '2', 'Upload_Files/F_143152101426549/st_sainprof-84346/pr_6624363.pdf', '693288', 'st', 'SainProof_234333224420265');
INSERT INTO `detailvitalfile_proof` VALUES ('7', null, '2', 'Upload_Files/F_143152101426549/pl_sainprof-84346/pr_3053564.pdf', '109999', 'pl', 'SainProof_262336625439216');
INSERT INTO `detailvitalfile_proof` VALUES ('8', null, '2', 'Upload_Files/F_143152101426549/sp_sainprof-84346/1.jpg', '31418', 'sp', 'SainProof_434624712424843');
INSERT INTO `detailvitalfile_proof` VALUES ('9', null, '5', 'Upload_Files/F_372634455240635/sp_sainprof-32414/bukti daftar seminar(1).jpg', '85545', 'sp', 'SainProof_384030319446230');
INSERT INTO `detailvitalfile_proof` VALUES ('11', '0', '5', 'Upload_Files/F_372634455240635/ut_sainprof-32414/pr_2326022.pdf', '95994', 'ut', 'SainProof_736300261395713');
INSERT INTO `detailvitalfile_proof` VALUES ('12', null, '5', 'Upload_Files/F_372634455240635/st_sainprof-32414/pr_6333643.pdf', '145231', 'st', 'SainProof_359248622926395');
INSERT INTO `detailvitalfile_proof` VALUES ('13', null, '5', 'Upload_Files/F_372634455240635/pl_sainprof-32414/pr_4440124.pdf', '87375', 'pl', 'SainProof_540253258685654');
INSERT INTO `detailvitalfile_proof` VALUES ('14', null, '5', 'Upload_Files/F_372634455240635/pl_sainprof-32414/pr_6229453.pdf', '691418', 'pl', 'SainProof_595454314168408');

-- ----------------------------
-- Table structure for detailvitalmetafile_proof
-- ----------------------------
DROP TABLE IF EXISTS `detailvitalmetafile_proof`;
CREATE TABLE `detailvitalmetafile_proof` (
  `DetVFileId` int(11) NOT NULL AUTO_INCREMENT,
  `DetailProfId` int(11) DEFAULT NULL,
  `RegVitalId` int(11) DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `Size` int(15) DEFAULT NULL,
  `Ket` varchar(10) DEFAULT NULL,
  `KodeReg` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DetVFileId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detailvitalmetafile_proof
-- ----------------------------
INSERT INTO `detailvitalmetafile_proof` VALUES ('1', '1', '2', 'Upload_Files/F_143152101426549/meta_sainprof-84346/4.jpg', '72937', 'a-dasar', 'SainProof_24343');
INSERT INTO `detailvitalmetafile_proof` VALUES ('2', '1', '2', 'Upload_Files/F_143152101426549/meta_sainprof-84346/5.jpg', '78151', 'b-lampiran', 'SainProof_26625');
INSERT INTO `detailvitalmetafile_proof` VALUES ('3', '1', '2', 'Upload_Files/F_143152101426549/meta_sainprof-84346/7.jpg', '80126', 'c-nspk', 'SainProof_14209');
INSERT INTO `detailvitalmetafile_proof` VALUES ('4', '1', '2', 'Upload_Files/F_143152101426549/meta_sainprof-84346/avatar-1.jpg', '6731', 'd-nota', 'SainProof_16466');
INSERT INTO `detailvitalmetafile_proof` VALUES ('5', '1', '2', 'Upload_Files/F_143152101426549/meta_sainprof-84346/avatar-3.jpg', '4751', 'e-preview', 'SainProof_44339');
INSERT INTO `detailvitalmetafile_proof` VALUES ('6', '2', '5', 'Upload_Files/F_372634455240635/meta_sainprof-32414/pr_6229453.pdf', '691418', 'a-dasar', 'SainProof_52255');
INSERT INTO `detailvitalmetafile_proof` VALUES ('7', '2', '5', 'Upload_Files/F_372634455240635/meta_sainprof-32414/bukti daftar seminar.jpg', '85545', 'b-lampiran', 'SainProof_22136');
INSERT INTO `detailvitalmetafile_proof` VALUES ('8', '2', '5', 'Upload_Files/F_372634455240635/meta_sainprof-32414/pr_6333643.pdf', '145231', 'c-nspk', 'SainProof_22346');
INSERT INTO `detailvitalmetafile_proof` VALUES ('9', '2', '5', 'Upload_Files/F_372634455240635/meta_sainprof-32414/pr_2333324.pdf', '95647', 'd-nota', 'SainProof_34629');
INSERT INTO `detailvitalmetafile_proof` VALUES ('10', '2', '5', 'Upload_Files/F_372634455240635/meta_sainprof-32414/pr_6333643.pdf', '145231', 'e-preview', 'SainProof_53232');

-- ----------------------------
-- Table structure for detailvitalmeta_proof
-- ----------------------------
DROP TABLE IF EXISTS `detailvitalmeta_proof`;
CREATE TABLE `detailvitalmeta_proof` (
  `DetailProfId` int(11) NOT NULL AUTO_INCREMENT,
  `RegVitalId` int(11) DEFAULT NULL,
  `Perihal` varchar(100) DEFAULT NULL,
  `Dasar` varchar(100) DEFAULT NULL,
  `Tgl_Nodin` date DEFAULT NULL,
  `IdPelaksana` varchar(255) DEFAULT NULL,
  `Tgl_Desain` date DEFAULT NULL,
  `Tgl_Proof` date DEFAULT NULL,
  `Nomor_SPK` varchar(100) DEFAULT NULL,
  `KetPekerjaan` varchar(255) DEFAULT NULL,
  `Nota_Penyerahan` varchar(50) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `Gedung` varchar(50) DEFAULT NULL,
  `Lemari` varchar(50) DEFAULT NULL,
  `Baris` varchar(50) DEFAULT NULL,
  `Boks` varchar(50) DEFAULT NULL,
  `Operator` int(15) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  PRIMARY KEY (`DetailProfId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detailvitalmeta_proof
-- ----------------------------
INSERT INTO `detailvitalmeta_proof` VALUES ('1', '2', 'Pekerjaan Desain Teknis Materai 3000', '12', '2018-08-23', '1', '2018-08-23', '2018-08-31', '123', '121', '223', '', '3', '2', '1', '2', '2', '2018-08-23 11:45:25');
INSERT INTO `detailvitalmeta_proof` VALUES ('2', '5', 'Pekerjaan Desain Teknis Materai 3000', '123', '2018-09-05', '3#4', '2018-09-05', '0000-00-00', '443', 'Perencanaan Desain', '332', 'rrrr', '3', '2', '1', '2', '6', '2018-09-05 00:28:58');

-- ----------------------------
-- Table structure for detailvitalproof
-- ----------------------------
DROP TABLE IF EXISTS `detailvitalproof`;
CREATE TABLE `detailvitalproof` (
  `DetailProofId` int(11) NOT NULL AUTO_INCREMENT,
  `RegVitalId` int(11) DEFAULT NULL,
  `Uraian` varchar(500) DEFAULT NULL,
  `Tgl` date DEFAULT NULL,
  `Dasar` varchar(255) DEFAULT NULL,
  `Pelaksana` varchar(255) DEFAULT NULL,
  `TglTarget` date DEFAULT NULL,
  `TglTarget_Proof` date DEFAULT NULL,
  `No_SPK` varchar(255) DEFAULT NULL,
  `No_Kode` varchar(255) DEFAULT NULL,
  `Nota_SP` varchar(255) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `Sp_Gedung` varchar(50) DEFAULT NULL,
  `Sp_Lemari` varchar(50) DEFAULT NULL,
  `Sp_Baris` varchar(50) DEFAULT NULL,
  `SP_Boks` varchar(50) DEFAULT NULL,
  `UT_Gedung` varchar(50) DEFAULT NULL,
  `UT_Lemari` varchar(50) DEFAULT NULL,
  `UT_Baris` varchar(50) DEFAULT NULL,
  `UT_Boks` varchar(50) DEFAULT NULL,
  `ST_Gedung` varchar(50) DEFAULT NULL,
  `ST_Lemari` varchar(50) DEFAULT NULL,
  `ST_Baris` varchar(50) DEFAULT NULL,
  `ST_Boks` varchar(50) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  `Operator` int(11) DEFAULT NULL,
  PRIMARY KEY (`DetailProofId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detailvitalproof
-- ----------------------------

-- ----------------------------
-- Table structure for detailvital_proof
-- ----------------------------
DROP TABLE IF EXISTS `detailvital_proof`;
CREATE TABLE `detailvital_proof` (
  `DetailVitalId` int(11) NOT NULL AUTO_INCREMENT,
  `RegVitalId` int(11) DEFAULT NULL,
  `Ket` varchar(3) DEFAULT NULL,
  `Gedung` varchar(50) DEFAULT NULL,
  `Lemari` varchar(50) DEFAULT NULL,
  `Baris` varchar(50) DEFAULT NULL,
  `Boks` varchar(50) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `Operator` int(15) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  PRIMARY KEY (`DetailVitalId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detailvital_proof
-- ----------------------------
INSERT INTO `detailvital_proof` VALUES ('1', '2', 'sp', '4', '2', '1', '3', null, '2', '2018-08-23 11:27:11');
INSERT INTO `detailvital_proof` VALUES ('2', '2', 'ut', '5', '4', '2', '1', null, '2', '2018-08-23 11:27:52');
INSERT INTO `detailvital_proof` VALUES ('3', '2', 'st', '5', '6', '1', '2', null, '2', '2018-08-23 11:38:19');
INSERT INTO `detailvital_proof` VALUES ('4', '2', 'pl', '4', '3', '1', '3', '', '2', '2018-08-23 11:40:22');
INSERT INTO `detailvital_proof` VALUES ('5', '5', 'sp', '4', '3', '2', '1', null, '6', '2018-09-05 08:49:55');
INSERT INTO `detailvital_proof` VALUES ('6', '5', 'ut', '3', '2', '1', '3', null, '6', '2018-09-05 08:51:57');
INSERT INTO `detailvital_proof` VALUES ('7', '5', 'st', '', '', '', '', null, '6', '2018-09-05 08:52:16');
INSERT INTO `detailvital_proof` VALUES ('8', '5', 'pl', '4', '2', '1', '4', 'Rer', '6', '2018-09-05 08:52:43');

-- ----------------------------
-- Table structure for dokumen
-- ----------------------------
DROP TABLE IF EXISTS `dokumen`;
CREATE TABLE `dokumen` (
  `DokumenId` int(11) NOT NULL,
  `BerkasId` int(11) DEFAULT NULL,
  `KodeReg` varchar(20) DEFAULT NULL,
  `ClId` int(11) DEFAULT NULL,
  `JenisId` int(11) DEFAULT NULL,
  `Tgl_Dok` date DEFAULT NULL,
  `Nomor_Dok` varchar(30) DEFAULT NULL,
  `Uraian` varchar(255) DEFAULT NULL,
  `Jumlah` varchar(10) DEFAULT NULL,
  `SatuanId` int(11) DEFAULT NULL,
  `TPId` int(11) DEFAULT NULL,
  `MediaId` int(11) DEFAULT NULL,
  `KondisiId` int(11) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `WaktuReg` datetime DEFAULT NULL,
  `Operator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DokumenId`) USING BTREE,
  KEY `Imetaid` (`DokumenId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dokumen
-- ----------------------------
INSERT INTO `dokumen` VALUES ('1', '1', 'm-52038', '2', '3', '2018-07-30', '897', 'Panitia', '1', '1', '1', '1', '1', '', '2018-07-30 04:32:40', '11');
INSERT INTO `dokumen` VALUES ('2', '4', 'm-62343', '2', '3', '2018-08-02', '454', 'safa', '1', '1', '1', '1', '1', '', '2018-08-02 18:50:25', '11');
INSERT INTO `dokumen` VALUES ('3', '5', 'm-62013', '2', '5', '2018-08-04', '1111', 'adasfasf', '1', '1', '1', '1', '1', '', '2018-08-04 09:42:37', '11');
INSERT INTO `dokumen` VALUES ('4', '2', 'm-03376', '3', '2', '2018-08-06', '112', 'sasfasfasfasf', '1', '1', '1', '1', '1', '', '2018-08-06 11:57:15', '4');
INSERT INTO `dokumen` VALUES ('5', '3', 'm-33214', '4', '5', '2018-08-06', '123', 'asafas', '2', '1', '1', '1', '1', '', '2018-08-06 15:49:24', '2');

-- ----------------------------
-- Table structure for dokumen_v1
-- ----------------------------
DROP TABLE IF EXISTS `dokumen_v1`;
CREATE TABLE `dokumen_v1` (
  `DokumenId` int(11) NOT NULL,
  `BerkasId` int(11) DEFAULT NULL,
  `KodeReg` varchar(20) DEFAULT NULL,
  `ClId` int(11) DEFAULT NULL,
  `JenisId` int(11) DEFAULT NULL,
  `Tgl_Dok` date DEFAULT NULL,
  `Nomor_Dok` varchar(30) DEFAULT NULL,
  `Nip` varchar(25) DEFAULT NULL,
  `Uraian` varchar(255) DEFAULT NULL,
  `Jumlah` varchar(10) DEFAULT NULL,
  `SatuanId` int(11) DEFAULT NULL,
  `TPId` int(11) DEFAULT NULL,
  `MediaId` int(11) DEFAULT NULL,
  `KondisiId` int(11) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `WaktuReg` datetime DEFAULT NULL,
  `Operator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DokumenId`) USING BTREE,
  KEY `Imetaid` (`DokumenId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dokumen_v1
-- ----------------------------
INSERT INTO `dokumen_v1` VALUES ('1', '2', 'osdm-23234', '1', '5', '2018-08-04', '0981', null, 'Mutasi Pegawai', '1', '1', '1', '1', '1', '', '2018-08-04 15:34:02', '6');
INSERT INTO `dokumen_v1` VALUES ('2', '4', 'osdm-45123', '1', '6', '2018-08-06', '332', null, 'Sertifikat', '2', '1', '1', '1', '1', '', '2018-08-06 15:32:47', '6');
INSERT INTO `dokumen_v1` VALUES ('3', '6', 'osdm-34683', '1', '2', '2018-08-13', '123', null, 'afsafasfasfa', '1', '1', '1', '1', '1', '', '2018-08-13 14:35:21', '6');
INSERT INTO `dokumen_v1` VALUES ('4', '10', 'osdm-23212', '1', '2', '2018-09-04', '2', null, 'Ijazah SMA', '1', '1', '1', '1', '1', '', '2018-09-04 16:32:30', '6');
INSERT INTO `dokumen_v1` VALUES ('5', '12', 'osdm-74244', '1', '5', '2018-09-05', '664', null, 'Permata', '1', '1', '1', '1', '1', '', '2018-09-05 10:17:11', '4');
INSERT INTO `dokumen_v1` VALUES ('6', '14', 'osdm-17242', '1', '6', '2018-09-05', 'dsgsgd', null, '12qwasd', '1', '1', '1', '1', '1', '', '2018-09-05 12:03:47', '4');

-- ----------------------------
-- Table structure for dokumen_v2
-- ----------------------------
DROP TABLE IF EXISTS `dokumen_v2`;
CREATE TABLE `dokumen_v2` (
  `DokumenId` int(11) NOT NULL,
  `BerkasId` int(11) DEFAULT NULL,
  `KodeReg` varchar(20) DEFAULT NULL,
  `ClId` int(11) DEFAULT NULL,
  `JenisId` int(11) DEFAULT NULL,
  `Tgl_Dok` date DEFAULT NULL,
  `Nomor_Dok` varchar(30) DEFAULT NULL,
  `Uraian` varchar(255) DEFAULT NULL,
  `Jumlah` varchar(10) DEFAULT NULL,
  `SatuanId` int(11) DEFAULT NULL,
  `TPId` int(11) DEFAULT NULL,
  `MediaId` int(11) DEFAULT NULL,
  `KondisiId` int(11) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `WaktuReg` datetime DEFAULT NULL,
  `Operator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DokumenId`) USING BTREE,
  KEY `Imetaid` (`DokumenId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dokumen_v2
-- ----------------------------
INSERT INTO `dokumen_v2` VALUES ('1', '12', 'um-02144', '4', '5', '2018-09-02', '13', 'sdsdas', '2', '1', '2', '1', '1', '', '2018-09-02 10:32:28', '11');
INSERT INTO `dokumen_v2` VALUES ('2', '2', 'um-37124', '4', '4', '2018-09-02', '1132', 'sadasdoi', '1', '1', '1', '1', '1', '', '2018-09-02 10:36:20', '11');
INSERT INTO `dokumen_v2` VALUES ('3', '1', 'um-48627', '4', '4', '2018-09-02', '44', 'asdasd', '1', '1', '1', '1', '1', '', '2018-09-02 11:36:20', '11');
INSERT INTO `dokumen_v2` VALUES ('5', '2', 'um-56421', '4', '5', '2018-09-02', '221', 'sasdasd', '43', '1', '1', '1', '1', '', '2018-09-02 12:00:42', '11');
INSERT INTO `dokumen_v2` VALUES ('6', '14', 'um-64762', '7', '4', '2018-09-05', '1313', 'asdasdas', '1', '1', '1', '1', '1', '', '2018-09-05 18:44:01', '2');
INSERT INTO `dokumen_v2` VALUES ('7', '13', 'um-36320', '9', '5', '2018-09-05', '333', 'zsfzsfzsf', '1', '1', '1', '1', '1', '', '2018-09-05 18:44:41', '2');
INSERT INTO `dokumen_v2` VALUES ('8', '23', 'um-93422', '7', '6', '2018-09-05', '111', 'asdasdasd', '1', '1', '1', '1', '1', '', '2018-09-05 19:02:35', '2');

-- ----------------------------
-- Table structure for filesdigital
-- ----------------------------
DROP TABLE IF EXISTS `filesdigital`;
CREATE TABLE `filesdigital` (
  `FilesId` int(11) NOT NULL AUTO_INCREMENT,
  `DokumenId` int(11) DEFAULT NULL,
  `KodeReg` varchar(20) DEFAULT NULL,
  `Filename` varchar(100) DEFAULT NULL,
  `FileSize` double DEFAULT NULL,
  `EnskripFile` varchar(255) DEFAULT NULL,
  `FolderName` varchar(255) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  PRIMARY KEY (`FilesId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of filesdigital
-- ----------------------------
INSERT INTO `filesdigital` VALUES ('3', '2', 'm-62343', 'Upload_Files/F_326442346150154/dok_002/bg.jpg', '98535', '5523c88dd347d1b7cc617f632b7efdb7.jpg', '1', '2018-08-02 18:50:25');
INSERT INTO `filesdigital` VALUES ('4', '3', 'm-62013', 'Upload_Files/F_326442346150154/xdok_0101/bg.jpg', '98535', '5523c88dd347d1b7cc617f632b7efdb7.jpg', '1', '2018-08-04 09:42:37');
INSERT INTO `filesdigital` VALUES ('5', '4', 'm-03376', 'Upload_Files/F_836424442345544/xdok_1221/8.jpg', '55544', 'c9f0f895fb98ab9159f51fd0297e236d.jpg', '1', '2018-08-06 11:57:15');
INSERT INTO `filesdigital` VALUES ('7', '5', 'm-33214', 'Upload_Files/F_143152101426549/dok_001/pr_0282215.pdf', '103460', '129606d55128a615307024817faf7afb.pdf', '1', '2018-08-06 15:49:24');
INSERT INTO `filesdigital` VALUES ('13', '1', 'm-02324', 'Upload_Files/F_836424442345544/dok_001/pr_2242111.pdf', '2054000', 'f1bcb38dbd8e66bff14a4d86220ec1a3.pdf', '1', '2018-08-07 08:16:13');
INSERT INTO `filesdigital` VALUES ('14', '1', 'm-70933', 'Upload_Files/F_836424442345544/dok_001/pr_3404434.pdf', '100433', '936e22e654e45fd44312d6ec680ab168.pdf', '1', '2018-08-07 08:17:10');

-- ----------------------------
-- Table structure for filesdigital_v1
-- ----------------------------
DROP TABLE IF EXISTS `filesdigital_v1`;
CREATE TABLE `filesdigital_v1` (
  `FilesId` int(11) NOT NULL AUTO_INCREMENT,
  `DokumenId` int(11) DEFAULT NULL,
  `KodeReg` varchar(20) DEFAULT NULL,
  `Filename` varchar(100) DEFAULT NULL,
  `FileSize` double DEFAULT NULL,
  `EnskripFile` varchar(255) DEFAULT NULL,
  `FolderName` varchar(255) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  PRIMARY KEY (`FilesId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of filesdigital_v1
-- ----------------------------
INSERT INTO `filesdigital_v1` VALUES ('1', '1', 'osdm-23234', 'Upload_Files/F_543514604140365/vosdm_001/ret.pdf', '128999', '2cb9df9898e55fd0ad829dc202ddbd1c.pdf', '1', '2018-08-04 15:34:02');
INSERT INTO `filesdigital_v1` VALUES ('2', '2', 'osdm-45123', 'Upload_Files/F_543514604140365/vosdm_002/Curriculum Vitae Eko.pdf', '182388', 'c9f7c41500b05f5e469cddbc1d1cc285.pdf', '1', '2018-08-06 15:32:47');
INSERT INTO `filesdigital_v1` VALUES ('3', '3', 'osdm-34683', 'Upload_Files/F_543514604140365/vosdm_002/pr_3666743.pdf', '89706', '092f1ea86cabef7038cacbd4ce11124a.pdf', '1', '2018-08-13 14:35:21');
INSERT INTO `filesdigital_v1` VALUES ('4', '4', 'osdm-23212', 'Upload_Files/F_543514604140365/vosdm_002/eddy.pdf', '43152', '5aa8fed9741d33c63868a87f1af05ab7.pdf', '1', '2018-09-04 16:32:30');
INSERT INTO `filesdigital_v1` VALUES ('5', '5', 'osdm-74244', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '85545', '9c4f2144c8052640d47e66994d8038d4.jpg', '1', '2018-09-05 10:17:11');
INSERT INTO `filesdigital_v1` VALUES ('6', '6', 'osdm-17242', 'Upload_Files/F_417364544434314/vosdm_002/bukti daftar seminar(1).jpg', '85545', 'ffce4f76e1bdda62c94b0a2e14605408.jpg', '1', '2018-09-05 12:03:47');

-- ----------------------------
-- Table structure for filesdigital_v2
-- ----------------------------
DROP TABLE IF EXISTS `filesdigital_v2`;
CREATE TABLE `filesdigital_v2` (
  `FilesId` int(11) NOT NULL AUTO_INCREMENT,
  `DokumenId` int(11) DEFAULT NULL,
  `KodeReg` varchar(20) DEFAULT NULL,
  `Filename` varchar(100) DEFAULT NULL,
  `FileSize` double DEFAULT NULL,
  `EnskripFile` varchar(255) DEFAULT NULL,
  `FolderName` varchar(255) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  PRIMARY KEY (`FilesId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of filesdigital_v2
-- ----------------------------
INSERT INTO `filesdigital_v2` VALUES ('37', '2', 'um-37124', 'Upload_Files/F_326442346150154/vsetkol_001.2/6.jpg', '62316', '1679091c5a880faf6fb5e6087eb1b2dc.jpg', '1', '2018-09-02 10:36:20');
INSERT INTO `filesdigital_v2` VALUES ('38', '1', 'um-54178', 'Upload_Files/F_326442346150154/vsetkol_001.2/pr_3337312.pdf', '573637', '24803541411b42d763898e6ded1ff782.pdf', '1', '2018-09-02 10:49:17');
INSERT INTO `filesdigital_v2` VALUES ('48', '3', 'um-27442', 'Upload_Files/F_326442346150154/vsetkol_001/bg.jpg', '98535', '5523c88dd347d1b7cc617f632b7efdb7.jpg', '1', '2018-09-02 12:04:55');
INSERT INTO `filesdigital_v2` VALUES ('49', '5', 'um-37462', 'Upload_Files/F_326442346150154/vsetkol_001.2/pr_3337312.pdf', '573637', '24803541411b42d763898e6ded1ff782.pdf', '1', '2018-09-02 12:31:02');
INSERT INTO `filesdigital_v2` VALUES ('50', '1', 'um-02943', 'Upload_Files/F_326442346150154/vsetkol_001.2/6.jpg', '62316', '1679091c5a880faf6fb5e6087eb1b2dc.jpg', '1', '2018-09-02 13:53:42');
INSERT INTO `filesdigital_v2` VALUES ('54', '6', 'um-64762', 'Upload_Files/F_634994722420448/vsetkol_001.1/bukti daftar seminar(1).jpg', '85545', 'ffce4f76e1bdda62c94b0a2e14605408.jpg', '1', '2018-09-05 18:44:01');
INSERT INTO `filesdigital_v2` VALUES ('55', '7', 'um-36320', 'Upload_Files/F_634994722420448/vsetkol_001/pr_6229453.pdf', '691418', 'a80bd3ac870fe60dc964f5a1c9c636c3.pdf', '1', '2018-09-05 18:44:41');
INSERT INTO `filesdigital_v2` VALUES ('56', '8', 'um-93422', 'Upload_Files/F_634994722420448/vsetkol_002/bukti daftar seminar.jpg', '85545', '9c4f2144c8052640d47e66994d8038d4.jpg', '1', '2018-09-05 19:02:35');

-- ----------------------------
-- Table structure for groupjabatan
-- ----------------------------
DROP TABLE IF EXISTS `groupjabatan`;
CREATE TABLE `groupjabatan` (
  `GroupId` varchar(11) NOT NULL,
  `GroupName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`GroupId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of groupjabatan
-- ----------------------------
INSERT INTO `groupjabatan` VALUES ('1', 'Pengelola Arsip');
INSERT INTO `groupjabatan` VALUES ('2', 'Direktur Utama');
INSERT INTO `groupjabatan` VALUES ('3', 'Direktur');
INSERT INTO `groupjabatan` VALUES ('4', 'Kepala Biro');
INSERT INTO `groupjabatan` VALUES ('5', 'Kepala Departemen');
INSERT INTO `groupjabatan` VALUES ('7', 'Kepala Divisi');
INSERT INTO `groupjabatan` VALUES ('8', 'Kepala Seksi');
INSERT INTO `groupjabatan` VALUES ('9', 'Kepala Unit');

-- ----------------------------
-- Table structure for klasifikasi
-- ----------------------------
DROP TABLE IF EXISTS `klasifikasi`;
CREATE TABLE `klasifikasi` (
  `ClId` int(11) unsigned NOT NULL,
  `ClParentId` int(10) unsigned DEFAULT NULL,
  `ClCode` varchar(25) NOT NULL,
  `ClName` varchar(255) NOT NULL,
  `ClDesc` text,
  `RetensiThn_Active` int(2) DEFAULT NULL,
  `RetensiThn_InActive` int(2) DEFAULT NULL,
  `SusutId` varchar(14) NOT NULL,
  `CIStatus` int(2) NOT NULL,
  `ClStatusParent` int(2) NOT NULL,
  `Ket_Active` varchar(100) NOT NULL,
  `Ket_InActive` varchar(100) NOT NULL,
  `ClKeamanan` varchar(50) DEFAULT NULL,
  `HakAkses` varchar(255) DEFAULT NULL,
  `DasarPertimbang` text,
  `UnitPengolah` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ClId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of klasifikasi
-- ----------------------------
INSERT INTO `klasifikasi` VALUES ('1', '0', 'SK', 'Semua Klasifikasi', '', '0', '0', '', '1', '0', '', '', '', '', '', '');
INSERT INTO `klasifikasi` VALUES ('4', '1', 'PD', 'Produksi', '', '0', '0', '1', '1', '1', '-', '-', '1', '2', 'KKK', 'UK.1');
INSERT INTO `klasifikasi` VALUES ('5', '1', 'KP ', 'Kepegawaian ', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi` VALUES ('6', '1', 'HK', 'HUKUM ', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi` VALUES ('7', '6', 'HK 810', 'Produk Hukum Pemerintahan ', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi` VALUES ('8', '6', 'HK 811', 'Produk Hukum Internal Perusahaan ', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi` VALUES ('9', '8', 'HK 811.1', 'SKEP & KEP Direksi ', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi` VALUES ('10', '1', 'HK 811.2', 'Instruksi ', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi` VALUES ('11', '8', 'HK 811.3', 'Peraturan Perusahaan ', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi` VALUES ('12', '6', 'HK 812', 'Surat Perjanjian/MoU', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi` VALUES ('13', '6', 'HK 800', 'Produk Hukum Pemerintahan', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi` VALUES ('14', '13', 'HK 800.1', 'Produk Hukum Organisasi International (ISO, OHSAS, DLL) ', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');

-- ----------------------------
-- Table structure for klasifikasi_old
-- ----------------------------
DROP TABLE IF EXISTS `klasifikasi_old`;
CREATE TABLE `klasifikasi_old` (
  `ClId` int(11) unsigned NOT NULL,
  `ClParentId` int(10) unsigned DEFAULT NULL,
  `ClCode` varchar(25) NOT NULL,
  `ClName` varchar(255) NOT NULL,
  `ClDesc` text,
  `RetensiThn_Active` int(2) DEFAULT NULL,
  `RetensiThn_InActive` int(2) DEFAULT NULL,
  `SusutId` varchar(14) NOT NULL,
  `CIStatus` int(2) NOT NULL,
  `ClStatusParent` int(2) NOT NULL,
  `Ket_Active` varchar(100) NOT NULL,
  `Ket_InActive` varchar(100) NOT NULL,
  `ClKeamanan` varchar(50) DEFAULT NULL,
  `HakAkses` varchar(255) DEFAULT NULL,
  `DasarPertimbang` text,
  `UnitPengolah` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ClId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of klasifikasi_old
-- ----------------------------
INSERT INTO `klasifikasi_old` VALUES ('1', '0', 'SK', 'Semua Klasifikasi', '', '0', '0', '', '1', '0', '', '', '', '', '', '');
INSERT INTO `klasifikasi_old` VALUES ('2', '1', 'DP', 'Detail Produk', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi_old` VALUES ('3', '2', 'DP.01', 'Detaik Produk Materai', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');
INSERT INTO `klasifikasi_old` VALUES ('4', '3', 'DP.01.1', 'Produk Materai Rp. 6000', '', '0', '0', '1', '1', '1', '-', '-', '1', '', '', '');

-- ----------------------------
-- Table structure for log_akses
-- ----------------------------
DROP TABLE IF EXISTS `log_akses`;
CREATE TABLE `log_akses` (
  `LogId` int(11) NOT NULL AUTO_INCREMENT,
  `LogName` varchar(100) DEFAULT NULL,
  `PeopleId` int(11) DEFAULT NULL,
  `LogDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=795 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of log_akses
-- ----------------------------
INSERT INTO `log_akses` VALUES ('2', 'logout', '11', '2018-08-04 11:23:37');
INSERT INTO `log_akses` VALUES ('3', 'login sukses ', '11', '2018-08-04 11:28:23');
INSERT INTO `log_akses` VALUES ('4', 'login sukses ', '8', '2018-08-04 11:31:16');
INSERT INTO `log_akses` VALUES ('5', 'logout', '8', '2018-08-04 11:41:30');
INSERT INTO `log_akses` VALUES ('6', 'login sukses ', '1', '2018-08-04 11:59:15');
INSERT INTO `log_akses` VALUES ('7', 'logout', '1', '2018-08-04 11:59:18');
INSERT INTO `log_akses` VALUES ('8', 'login sukses ', '11', '2018-08-04 13:13:58');
INSERT INTO `log_akses` VALUES ('14', 'delete from master_media where mediaid =7', '11', '2018-08-04 13:28:14');
INSERT INTO `log_akses` VALUES ('15', 'logout', '11', '2018-08-04 14:05:06');
INSERT INTO `log_akses` VALUES ('16', 'login sukses ', '1', '2018-08-04 14:05:49');
INSERT INTO `log_akses` VALUES ('17', 'delete from groupjabatan where groupid =3', '1', '2018-08-04 14:06:01');
INSERT INTO `log_akses` VALUES ('18', 'insert into groupjabatan values( 10,  direktur  )', '1', '2018-08-04 14:06:12');
INSERT INTO `log_akses` VALUES ('19', 'update role set groupid = 3, kodeunit = 6000, rolename = direktorat teknik dan produksi, deskripsi =', '1', '2018-08-04 14:46:10');
INSERT INTO `log_akses` VALUES ('20', 'update role set groupid = 3, kodeunit = 6001, rolename = direktorat teknik dan produksi, deskripsi =', '1', '2018-08-04 14:46:19');
INSERT INTO `log_akses` VALUES ('21', 'update role set groupid = 2, kodeunit = 5021, rolename = direktur utama, deskripsi = , roleparentid ', '1', '2018-08-04 14:48:26');
INSERT INTO `log_akses` VALUES ('22', 'logout', '1', '2018-08-04 14:58:36');
INSERT INTO `log_akses` VALUES ('23', 'login sukses ', '11', '2018-08-04 14:58:42');
INSERT INTO `log_akses` VALUES ('25', 'user download file auto-start-xampp.pdf', '0', '2018-08-04 15:20:51');
INSERT INTO `log_akses` VALUES ('26', 'logout', '11', '2018-08-04 15:25:51');
INSERT INTO `log_akses` VALUES ('27', 'login sukses ', '1', '2018-08-04 15:25:59');
INSERT INTO `log_akses` VALUES ('28', 'login sukses ', '1', '2018-08-04 15:26:01');
INSERT INTO `log_akses` VALUES ('29', 'login sukses ', '1', '2018-08-04 15:26:02');
INSERT INTO `log_akses` VALUES ('30', 'login sukses ', '11', '2018-08-04 15:26:11');
INSERT INTO `log_akses` VALUES ('31', 'login sukses ', '11', '2018-08-04 15:26:12');
INSERT INTO `log_akses` VALUES ('32', 'login sukses ', '11', '2018-08-04 15:26:12');
INSERT INTO `log_akses` VALUES ('33', 'login sukses ', '11', '2018-08-04 15:26:12');
INSERT INTO `log_akses` VALUES ('34', 'login sukses ', '11', '2018-08-04 15:26:12');
INSERT INTO `log_akses` VALUES ('35', 'login sukses ', '11', '2018-08-04 15:26:12');
INSERT INTO `log_akses` VALUES ('36', 'login sukses ', '1', '2018-08-04 15:26:32');
INSERT INTO `log_akses` VALUES ('37', 'logout', '1', '2018-08-04 15:27:49');
INSERT INTO `log_akses` VALUES ('38', 'login sukses ', '5', '2018-08-04 15:28:10');
INSERT INTO `log_akses` VALUES ('39', 'logout', '5', '2018-08-04 15:28:18');
INSERT INTO `log_akses` VALUES ('40', 'login sukses ', '4', '2018-08-04 15:28:26');
INSERT INTO `log_akses` VALUES ('41', 'insert into master_katproduk values( 18,  captive, 1, uk.1.1.3.1  )', '4', '2018-08-04 15:28:49');
INSERT INTO `log_akses` VALUES ('42', 'insert into master_katproduk values( 19,  non-captive, 1, uk.1.1.3.1  )', '4', '2018-08-04 15:28:56');
INSERT INTO `log_akses` VALUES ('43', 'insert into master_jproduk (jprodukid, katprodukid, jprodukname, statusact, roleid) values ( 35,  18', '4', '2018-08-04 15:29:18');
INSERT INTO `log_akses` VALUES ('44', 'delete from master_jproduk where jprodukid =35', '4', '2018-08-04 15:29:21');
INSERT INTO `log_akses` VALUES ('45', 'insert into master_jproduk (jprodukid, katprodukid, jprodukname, statusact, roleid) values ( 35,  18', '4', '2018-08-04 15:29:27');
INSERT INTO `log_akses` VALUES ('46', 'insert into master_detailproduk (detailprodukid, katprodukid, jprodukid, detailprodukname , statusac', '4', '2018-08-04 15:29:39');
INSERT INTO `log_akses` VALUES ('47', 'delete from master_katproduk where katprodukid =18', '4', '2018-08-04 15:29:44');
INSERT INTO `log_akses` VALUES ('48', 'logout', '4', '2018-08-04 15:30:05');
INSERT INTO `log_akses` VALUES ('49', 'login sukses ', '7', '2018-08-04 15:30:20');
INSERT INTO `log_akses` VALUES ('50', 'logout', '7', '2018-08-04 15:30:32');
INSERT INTO `log_akses` VALUES ('51', 'login sukses ', '6', '2018-08-04 15:31:02');
INSERT INTO `log_akses` VALUES ('52', 'insert into berkas_v1( kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumlah, tpid,\r\n       ', '6', '2018-08-04 15:31:31');
INSERT INTO `log_akses` VALUES ('53', 'update berkas_v1 set clid = 5,  roleid = uk.1.2.1.1, nip = 4431, uraian = kurniawan, tpid = 1, media', '6', '2018-08-04 15:31:48');
INSERT INTO `log_akses` VALUES ('54', 'insert into berkas_v1(parrentberkasid,  kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumla', '6', '2018-08-04 15:32:56');
INSERT INTO `log_akses` VALUES ('55', 'insert into dokumen_v1 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '6', '2018-08-04 15:34:02');
INSERT INTO `log_akses` VALUES ('56', 'insert into filesdigital_v1(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '6', '2018-08-04 15:34:02');
INSERT INTO `log_akses` VALUES ('57', 'logout', '6', '2018-08-04 18:44:20');
INSERT INTO `log_akses` VALUES ('58', 'login sukses ', '4', '2018-08-04 18:44:27');
INSERT INTO `log_akses` VALUES ('59', 'insert into master_katproduk values( ,  captive, 1, uk.1.1.3.1  )', '4', '2018-08-04 18:47:17');
INSERT INTO `log_akses` VALUES ('60', 'insert into master_katproduk values( ,  captive, 1, uk.1.1.3.1  )', '4', '2018-08-04 18:49:16');
INSERT INTO `log_akses` VALUES ('61', 'insert into master_katproduk values( ,  captive, 1, uk.1.1.3.1  )', '4', '2018-08-04 18:49:54');
INSERT INTO `log_akses` VALUES ('62', 'insert into master_katproduk values( , captive, 1, uk.1.1.3.1  )', '4', '2018-08-04 18:51:01');
INSERT INTO `log_akses` VALUES ('63', 'update master_katproduk set katprodukname = captive, statusact = 0 where katprodukid = 1 ', '4', '2018-08-04 18:53:06');
INSERT INTO `log_akses` VALUES ('64', 'update master_katproduk set katprodukname = captivea, statusact = 1 where katprodukid = 1 ', '4', '2018-08-04 18:53:11');
INSERT INTO `log_akses` VALUES ('65', 'update master_katproduk set katprodukname = captive, statusact = 1 where katprodukid = 1 ', '4', '2018-08-04 18:53:15');
INSERT INTO `log_akses` VALUES ('66', 'insert into master_katproduk(katprodukname, statusact, roleid)values(  non-captive, 1, uk.1.1.3.1  )', '4', '2018-08-04 18:53:27');
INSERT INTO `log_akses` VALUES ('67', 'insert into master_jproduk (jprodukid, katprodukid, jprodukname, statusact, roleid) values ( ,  1,  ', '4', '2018-08-04 18:53:40');
INSERT INTO `log_akses` VALUES ('68', 'insert into master_jproduk (katprodukid, jprodukname, statusact, roleid) values (  1,  materai,  1, ', '4', '2018-08-04 18:56:35');
INSERT INTO `log_akses` VALUES ('69', 'insert into master_detailproduk (katprodukid, jprodukid, detailprodukname , statusact, roleid) value', '4', '2018-08-04 18:57:38');
INSERT INTO `log_akses` VALUES ('70', 'update master_katproduk set katprodukname = captivea, statusact = 1 where katprodukid = 1 ', '4', '2018-08-04 19:20:24');
INSERT INTO `log_akses` VALUES ('71', 'update master_katproduk set katprodukname = captive, statusact = 1 where katprodukid = 1 ', '4', '2018-08-04 19:20:28');
INSERT INTO `log_akses` VALUES ('72', 'delete from master_katproduk where katprodukid =3', '4', '2018-08-05 15:41:12');
INSERT INTO `log_akses` VALUES ('73', 'insert into master_katproduk(katprodukname, statusact, roleid)values(  non-captive, 1, uk.1.1.3.1  )', '4', '2018-08-05 15:41:19');
INSERT INTO `log_akses` VALUES ('74', 'logout', '4', '2018-08-05 15:51:41');
INSERT INTO `log_akses` VALUES ('75', 'login sukses ', '1', '2018-08-05 15:51:46');
INSERT INTO `log_akses` VALUES ('76', 'insert into klasifikasi (clid, clparentid, clcode, clname, cldesc, cistatus, clstatusparent,\r\n      ', '1', '2018-08-05 15:52:30');
INSERT INTO `log_akses` VALUES ('77', 'insert into klasifikasi (clid, clparentid, clcode, clname, cldesc, cistatus, clstatusparent,\r\n      ', '1', '2018-08-05 15:58:47');
INSERT INTO `log_akses` VALUES ('78', 'insert into klasifikasi (clid, clparentid, clcode, clname, cldesc, cistatus, clstatusparent,\r\n      ', '1', '2018-08-05 15:59:40');
INSERT INTO `log_akses` VALUES ('79', 'update klasifikasi set clparentid = 2, clcode = dp.01, clname = detaik produk materai, cldesc = , ci', '1', '2018-08-05 15:59:53');
INSERT INTO `log_akses` VALUES ('80', 'insert into klasifikasi (clid, clparentid, clcode, clname, cldesc, cistatus, clstatusparent,\r\n      ', '1', '2018-08-05 16:11:31');
INSERT INTO `log_akses` VALUES ('81', 'update klasifikasi set clparentid = 3, clcode = dp.01.1, clname = produk materai rp. 6000, cldesc = ', '1', '2018-08-05 16:12:22');
INSERT INTO `log_akses` VALUES ('82', 'logout', '1', '2018-08-05 17:47:36');
INSERT INTO `log_akses` VALUES ('83', 'login sukses ', '4', '2018-08-05 17:47:43');
INSERT INTO `log_akses` VALUES ('84', 'insert into regarsipvital (regvitalid, kodereg, katprodukid, jprodukid,  detailprodukid,\r\n          ', '4', '2018-08-05 17:57:08');
INSERT INTO `log_akses` VALUES ('85', 'logout', '4', '2018-08-05 23:46:25');
INSERT INTO `log_akses` VALUES ('86', 'login sukses ', '11', '2018-08-05 23:46:34');
INSERT INTO `log_akses` VALUES ('87', 'logout', '11', '2018-08-05 23:52:49');
INSERT INTO `log_akses` VALUES ('88', 'login sukses ', '5', '2018-08-05 23:57:54');
INSERT INTO `log_akses` VALUES ('89', 'logout', '5', '2018-08-05 23:58:10');
INSERT INTO `log_akses` VALUES ('90', 'login sukses ', '4', '2018-08-05 23:58:17');
INSERT INTO `log_akses` VALUES ('91', 'logout', '4', '2018-08-06 10:41:00');
INSERT INTO `log_akses` VALUES ('92', 'login sukses ', '1', '2018-08-06 10:41:11');
INSERT INTO `log_akses` VALUES ('93', 'logout', '1', '2018-08-06 10:41:26');
INSERT INTO `log_akses` VALUES ('94', 'login sukses ', '2', '2018-08-06 10:41:33');
INSERT INTO `log_akses` VALUES ('95', 'logout', '2', '2018-08-06 10:59:00');
INSERT INTO `log_akses` VALUES ('96', 'login sukses ', '1', '2018-08-06 10:59:23');
INSERT INTO `log_akses` VALUES ('97', 'logout', '1', '2018-08-06 10:59:35');
INSERT INTO `log_akses` VALUES ('98', 'login sukses ', '4', '2018-08-06 10:59:41');
INSERT INTO `log_akses` VALUES ('99', 'insert into berkas(berkasid, kodereg, nomor, clid, retensiinaktif, roleid, uraian, kurunwaktu, jumla', '4', '2018-08-06 11:56:52');
INSERT INTO `log_akses` VALUES ('100', 'insert into dokumen (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jumlah', '4', '2018-08-06 11:57:15');
INSERT INTO `log_akses` VALUES ('101', 'insert into filesdigital(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg) va', '4', '2018-08-06 11:57:15');
INSERT INTO `log_akses` VALUES ('102', 'logout', '4', '2018-08-06 15:01:18');
INSERT INTO `log_akses` VALUES ('103', 'login sukses ', '1', '2018-08-06 15:01:21');
INSERT INTO `log_akses` VALUES ('104', 'logout', '1', '2018-08-06 15:01:58');
INSERT INTO `log_akses` VALUES ('105', 'login sukses ', '11', '2018-08-06 15:02:07');
INSERT INTO `log_akses` VALUES ('106', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '11', '2018-08-06 15:02:28');
INSERT INTO `log_akses` VALUES ('107', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '11', '2018-08-06 15:03:54');
INSERT INTO `log_akses` VALUES ('108', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-06 15:04:16');
INSERT INTO `log_akses` VALUES ('109', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-06 15:04:16');
INSERT INTO `log_akses` VALUES ('110', 'logout', '11', '2018-08-06 15:28:16');
INSERT INTO `log_akses` VALUES ('111', 'login sukses ', '1', '2018-08-06 15:28:30');
INSERT INTO `log_akses` VALUES ('112', 'logout', '1', '2018-08-06 15:28:46');
INSERT INTO `log_akses` VALUES ('113', 'login sukses ', '1', '2018-08-06 15:29:05');
INSERT INTO `log_akses` VALUES ('114', 'update people set roleid = uk.1.2.1.1, np = 7, peoplename = pengelola 03, email = , peopletipe = 2, ', '1', '2018-08-06 15:29:21');
INSERT INTO `log_akses` VALUES ('115', 'update peopleakses set approve = 0, roleid =  uk.1.2.1.1, menu =  m2 where peopleid = 6 ', '1', '2018-08-06 15:29:21');
INSERT INTO `log_akses` VALUES ('116', 'logout', '1', '2018-08-06 15:29:29');
INSERT INTO `log_akses` VALUES ('117', 'login sukses ', '6', '2018-08-06 15:29:38');
INSERT INTO `log_akses` VALUES ('118', 'insert into berkas_v1( kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumlah, tpid,\r\n       ', '6', '2018-08-06 15:31:50');
INSERT INTO `log_akses` VALUES ('119', 'insert into berkas_v1(parrentberkasid,  kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumla', '6', '2018-08-06 15:32:16');
INSERT INTO `log_akses` VALUES ('120', 'insert into dokumen_v1 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '6', '2018-08-06 15:32:47');
INSERT INTO `log_akses` VALUES ('121', 'insert into filesdigital_v1(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '6', '2018-08-06 15:32:47');
INSERT INTO `log_akses` VALUES ('122', 'logout', '6', '2018-08-06 15:37:42');
INSERT INTO `log_akses` VALUES ('123', 'login sukses ', '1', '2018-08-06 15:37:47');
INSERT INTO `log_akses` VALUES ('124', 'logout', '1', '2018-08-06 15:37:59');
INSERT INTO `log_akses` VALUES ('125', 'login sukses ', '2', '2018-08-06 15:38:05');
INSERT INTO `log_akses` VALUES ('126', 'insert into master_katproduk(katprodukname, statusact, roleid)values(  captive, 1, uk.1.1.1.1  )', '2', '2018-08-06 15:40:54');
INSERT INTO `log_akses` VALUES ('127', 'insert into master_jproduk (katprodukid, jprodukname, statusact, roleid) values (  5,  sertifikat,  ', '2', '2018-08-06 15:41:06');
INSERT INTO `log_akses` VALUES ('128', 'insert into master_detailproduk (katprodukid, jprodukid, detailprodukname , statusact, roleid) value', '2', '2018-08-06 15:41:20');
INSERT INTO `log_akses` VALUES ('129', 'update master_kodekerja set kode = 001, uraian = materai garuda, detailprodukid = 2, statusact = 1 w', '2', '2018-08-06 15:42:09');
INSERT INTO `log_akses` VALUES ('130', 'update master_kodekerja set kode = 002, uraian = ijazah unpad, detailprodukid = 2, statusact = 1 whe', '2', '2018-08-06 15:42:16');
INSERT INTO `log_akses` VALUES ('131', 'insert into regarsipvital (regvitalid, kodereg, katprodukid, jprodukid,  detailprodukid,\r\n          ', '2', '2018-08-06 15:42:42');
INSERT INTO `log_akses` VALUES ('132', 'insert into berkas(berkasid, kodereg, intnomor, nomor, clid, retensiinaktif, roleid, uraian, kurunwa', '2', '2018-08-06 15:48:03');
INSERT INTO `log_akses` VALUES ('133', 'insert into dokumen (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jumlah', '2', '2018-08-06 15:48:34');
INSERT INTO `log_akses` VALUES ('134', 'insert into filesdigital(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg) va', '2', '2018-08-06 15:48:34');
INSERT INTO `log_akses` VALUES ('135', 'delete from dokumen where dokumenid =5', '2', '2018-08-06 15:49:02');
INSERT INTO `log_akses` VALUES ('136', 'insert into dokumen (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jumlah', '2', '2018-08-06 15:49:24');
INSERT INTO `log_akses` VALUES ('137', 'insert into filesdigital(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg) va', '2', '2018-08-06 15:49:24');
INSERT INTO `log_akses` VALUES ('138', 'logout', '2', '2018-08-06 16:28:38');
INSERT INTO `log_akses` VALUES ('139', 'login sukses ', '6', '2018-08-06 17:00:20');
INSERT INTO `log_akses` VALUES ('140', 'logout', '6', '2018-08-06 17:00:42');
INSERT INTO `log_akses` VALUES ('141', 'login sukses ', '6', '2018-08-06 17:00:52');
INSERT INTO `log_akses` VALUES ('142', 'insert into berkas(berkasid, kodereg, intnomor, nomor, clid, retensiinaktif, roleid, uraian, kurunwa', '6', '2018-08-06 17:01:57');
INSERT INTO `log_akses` VALUES ('143', 'update dokumen set clid = 2, jenisid = 3, berkasid = 4, tgl_dok = 2018-08-02, nomor_dok = 454, uraia', '6', '2018-08-06 17:02:23');
INSERT INTO `log_akses` VALUES ('144', 'update dokumen set clid = 2, jenisid = 3, berkasid = 4, tgl_dok = 2018-08-02, nomor_dok = 454, uraia', '6', '2018-08-06 17:02:23');
INSERT INTO `log_akses` VALUES ('145', 'login sukses ', '4', '2018-08-07 07:43:13');
INSERT INTO `log_akses` VALUES ('146', 'delete from filesdigital where filesid = 2 ', '4', '2018-08-07 07:54:47');
INSERT INTO `log_akses` VALUES ('147', 'update dokumen set clid = 2, jenisid = 3, berkasid = 1, tgl_dok = 2018-07-30, nomor_dok = 897, uraia', '4', '2018-08-07 08:00:07');
INSERT INTO `log_akses` VALUES ('148', 'insert into filesdigital(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg) va', '4', '2018-08-07 08:00:07');
INSERT INTO `log_akses` VALUES ('149', 'delete from filesdigital where filesid = 8 ', '4', '2018-08-07 08:01:41');
INSERT INTO `log_akses` VALUES ('150', 'update dokumen set clid = 2, jenisid = 3, berkasid = 1, tgl_dok = 2018-07-30, nomor_dok = 897, uraia', '4', '2018-08-07 08:03:10');
INSERT INTO `log_akses` VALUES ('151', 'insert into filesdigital(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg) va', '4', '2018-08-07 08:03:10');
INSERT INTO `log_akses` VALUES ('152', 'delete from filesdigital where filesid = 9 ', '4', '2018-08-07 08:05:27');
INSERT INTO `log_akses` VALUES ('153', 'update dokumen set clid = 2, jenisid = 3, berkasid = 1, tgl_dok = 2018-07-30, nomor_dok = 897, uraia', '4', '2018-08-07 08:08:34');
INSERT INTO `log_akses` VALUES ('154', 'insert into filesdigital(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg) va', '4', '2018-08-07 08:08:34');
INSERT INTO `log_akses` VALUES ('155', 'delete from filesdigital where filesid = 10 ', '4', '2018-08-07 08:09:24');
INSERT INTO `log_akses` VALUES ('156', 'update dokumen set clid = 2, jenisid = 3, berkasid = 1, tgl_dok = 2018-07-30, nomor_dok = 897, uraia', '4', '2018-08-07 08:09:55');
INSERT INTO `log_akses` VALUES ('157', 'insert into filesdigital(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg) va', '4', '2018-08-07 08:09:55');
INSERT INTO `log_akses` VALUES ('158', 'update dokumen set clid = 2, jenisid = 3, berkasid = 1, tgl_dok = 2018-07-30, nomor_dok = 897, uraia', '4', '2018-08-07 08:11:27');
INSERT INTO `log_akses` VALUES ('159', 'insert into filesdigital(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg) va', '4', '2018-08-07 08:11:27');
INSERT INTO `log_akses` VALUES ('160', 'delete from filesdigital where filesid = 12 ', '4', '2018-08-07 08:11:43');
INSERT INTO `log_akses` VALUES ('161', 'delete from filesdigital where filesid = 11 ', '4', '2018-08-07 08:14:11');
INSERT INTO `log_akses` VALUES ('162', 'update dokumen set clid = 2, jenisid = 3, berkasid = 1, tgl_dok = 2018-07-30, nomor_dok = 897, uraia', '4', '2018-08-07 08:16:13');
INSERT INTO `log_akses` VALUES ('163', 'insert into filesdigital(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg) va', '4', '2018-08-07 08:16:13');
INSERT INTO `log_akses` VALUES ('164', 'update dokumen set clid = 2, jenisid = 3, berkasid = 1, tgl_dok = 2018-07-30, nomor_dok = 897, uraia', '4', '2018-08-07 08:17:10');
INSERT INTO `log_akses` VALUES ('165', 'insert into filesdigital(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg) va', '4', '2018-08-07 08:17:10');
INSERT INTO `log_akses` VALUES ('166', 'logout', '4', '2018-08-07 08:24:49');
INSERT INTO `log_akses` VALUES ('167', 'login sukses ', '1', '2018-08-07 08:24:56');
INSERT INTO `log_akses` VALUES ('168', 'logout', '1', '2018-08-07 08:25:06');
INSERT INTO `log_akses` VALUES ('169', 'login sukses ', '4', '2018-08-07 08:25:16');
INSERT INTO `log_akses` VALUES ('170', 'logout', '4', '2018-08-07 10:08:25');
INSERT INTO `log_akses` VALUES ('171', 'login sukses ', '4', '2018-08-07 10:53:56');
INSERT INTO `log_akses` VALUES ('172', 'login sukses ', '1', '2018-08-08 10:29:59');
INSERT INTO `log_akses` VALUES ('173', 'login sukses ', '1', '2018-08-09 08:05:32');
INSERT INTO `log_akses` VALUES ('174', 'logout', '1', '2018-08-09 08:11:36');
INSERT INTO `log_akses` VALUES ('175', 'login sukses ', '11', '2018-08-09 08:11:51');
INSERT INTO `log_akses` VALUES ('176', 'insert into berkas(berkasid, kodereg, intnomor, nomor, clid, retensiinaktif, roleid, uraian, kurunwa', '11', '2018-08-09 08:13:01');
INSERT INTO `log_akses` VALUES ('177', 'logout', '11', '2018-08-09 11:26:51');
INSERT INTO `log_akses` VALUES ('178', 'login sukses ', '6', '2018-08-09 11:26:59');
INSERT INTO `log_akses` VALUES ('179', 'logout', '6', '2018-08-09 14:13:23');
INSERT INTO `log_akses` VALUES ('180', 'login sukses ', '1', '2018-08-09 14:14:41');
INSERT INTO `log_akses` VALUES ('181', 'logout', '1', '2018-08-09 14:19:14');
INSERT INTO `log_akses` VALUES ('182', 'login sukses ', '2', '2018-08-09 14:19:29');
INSERT INTO `log_akses` VALUES ('183', 'logout', '2', '2018-08-09 14:23:13');
INSERT INTO `log_akses` VALUES ('184', 'login sukses ', '4', '2018-08-09 14:23:54');
INSERT INTO `log_akses` VALUES ('185', 'logout', '4', '2018-08-09 15:03:52');
INSERT INTO `log_akses` VALUES ('186', 'login sukses ', '4', '2018-08-09 15:04:02');
INSERT INTO `log_akses` VALUES ('187', 'logout', '4', '2018-08-09 15:04:09');
INSERT INTO `log_akses` VALUES ('188', 'login sukses ', '2', '2018-08-09 15:04:50');
INSERT INTO `log_akses` VALUES ('189', 'delete from regarsipvital where regvitalid =2', '2', '2018-08-09 15:06:58');
INSERT INTO `log_akses` VALUES ('190', 'insert into regarsipvital (regvitalid, kodereg, katprodukid, jprodukid,  detailprodukid,\r\n          ', '2', '2018-08-09 15:07:40');
INSERT INTO `log_akses` VALUES ('191', 'logout', '2', '2018-08-09 15:07:54');
INSERT INTO `log_akses` VALUES ('192', 'login sukses ', '6', '2018-08-09 15:08:08');
INSERT INTO `log_akses` VALUES ('193', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '6', '2018-08-09 16:25:17');
INSERT INTO `log_akses` VALUES ('194', 'logout', '6', '2018-08-09 16:25:26');
INSERT INTO `log_akses` VALUES ('195', 'login sukses ', '4', '2018-08-09 16:25:43');
INSERT INTO `log_akses` VALUES ('196', 'logout', '4', '2018-08-09 16:25:59');
INSERT INTO `log_akses` VALUES ('197', 'login sukses ', '5', '2018-08-09 16:26:05');
INSERT INTO `log_akses` VALUES ('198', ' update peminjaman set  statuspinjam = 1,  approvedate = 2018-08-09,  daterange1 = 2018-08-09,  date', '5', '2018-08-09 16:26:24');
INSERT INTO `log_akses` VALUES ('199', 'logout', '5', '2018-08-09 16:26:32');
INSERT INTO `log_akses` VALUES ('200', 'login sukses ', '6', '2018-08-09 16:26:38');
INSERT INTO `log_akses` VALUES ('201', 'logout', '6', '2018-08-09 16:36:33');
INSERT INTO `log_akses` VALUES ('202', 'login sukses ', '5', '2018-08-09 16:36:38');
INSERT INTO `log_akses` VALUES ('203', 'logout', '5', '2018-08-10 10:06:41');
INSERT INTO `log_akses` VALUES ('204', 'login sukses ', '4', '2018-08-10 10:06:50');
INSERT INTO `log_akses` VALUES ('205', 'logout', '4', '2018-08-10 10:06:54');
INSERT INTO `log_akses` VALUES ('206', 'login sukses ', '1', '2018-08-10 10:07:04');
INSERT INTO `log_akses` VALUES ('207', 'logout', '1', '2018-08-10 10:07:19');
INSERT INTO `log_akses` VALUES ('208', 'login sukses ', '2', '2018-08-10 10:07:24');
INSERT INTO `log_akses` VALUES ('209', 'login sukses ', '1', '2018-08-12 16:23:06');
INSERT INTO `log_akses` VALUES ('210', 'logout', '1', '2018-08-12 16:23:24');
INSERT INTO `log_akses` VALUES ('211', 'login sukses ', '2', '2018-08-12 16:23:32');
INSERT INTO `log_akses` VALUES ('212', 'logout', '2', '2018-08-12 18:14:12');
INSERT INTO `log_akses` VALUES ('213', 'login sukses ', '4', '2018-08-12 18:14:19');
INSERT INTO `log_akses` VALUES ('214', 'logout', '4', '2018-08-13 10:48:30');
INSERT INTO `log_akses` VALUES ('215', 'login sukses ', '2', '2018-08-13 10:48:38');
INSERT INTO `log_akses` VALUES ('216', 'insert into master_katproduk(katprodukname, statusact, roleid)values(  non-captive, 1, uk.1.1.1.1  )', '2', '2018-08-13 11:03:22');
INSERT INTO `log_akses` VALUES ('217', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '2', '2018-08-13 11:27:52');
INSERT INTO `log_akses` VALUES ('218', 'logout', '2', '2018-08-13 11:28:03');
INSERT INTO `log_akses` VALUES ('219', 'login sukses ', '4', '2018-08-13 11:28:11');
INSERT INTO `log_akses` VALUES ('220', 'logout', '4', '2018-08-13 11:28:20');
INSERT INTO `log_akses` VALUES ('221', 'login sukses ', '5', '2018-08-13 11:28:25');
INSERT INTO `log_akses` VALUES ('222', ' update peminjaman set  statuspinjam = 1,  approvedate = 2018-08-13,  daterange1 = 2018-08-13,  date', '5', '2018-08-13 11:28:37');
INSERT INTO `log_akses` VALUES ('223', 'logout', '5', '2018-08-13 11:28:42');
INSERT INTO `log_akses` VALUES ('224', 'login sukses ', '2', '2018-08-13 11:28:52');
INSERT INTO `log_akses` VALUES ('225', 'logout', '2', '2018-08-13 12:17:25');
INSERT INTO `log_akses` VALUES ('226', 'login sukses ', '4', '2018-08-13 12:17:38');
INSERT INTO `log_akses` VALUES ('227', 'logout', '4', '2018-08-13 14:33:46');
INSERT INTO `log_akses` VALUES ('228', 'login sukses ', '6', '2018-08-13 14:33:55');
INSERT INTO `log_akses` VALUES ('229', 'insert into berkas_v1( kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumlah, tpid,\r\n       ', '6', '2018-08-13 14:34:34');
INSERT INTO `log_akses` VALUES ('230', 'insert into berkas_v1(parrentberkasid,  kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumla', '6', '2018-08-13 14:34:57');
INSERT INTO `log_akses` VALUES ('231', 'insert into dokumen_v1 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '6', '2018-08-13 14:35:21');
INSERT INTO `log_akses` VALUES ('232', 'insert into filesdigital_v1(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '6', '2018-08-13 14:35:21');
INSERT INTO `log_akses` VALUES ('233', 'insert into berkas_v1( kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumlah, tpid,\r\n       ', '6', '2018-08-16 08:07:34');
INSERT INTO `log_akses` VALUES ('234', 'logout', '6', '2018-08-16 08:14:12');
INSERT INTO `log_akses` VALUES ('235', 'login sukses ', '4', '2018-08-16 08:14:17');
INSERT INTO `log_akses` VALUES ('236', 'logout', '4', '2018-08-16 08:15:34');
INSERT INTO `log_akses` VALUES ('237', 'login sukses ', '4', '2018-08-16 08:15:45');
INSERT INTO `log_akses` VALUES ('238', 'logout', '4', '2018-08-16 08:17:44');
INSERT INTO `log_akses` VALUES ('239', 'login sukses ', '2', '2018-08-16 08:17:51');
INSERT INTO `log_akses` VALUES ('240', 'logout', '2', '2018-08-16 08:18:16');
INSERT INTO `log_akses` VALUES ('241', 'login sukses ', '4', '2018-08-16 08:31:19');
INSERT INTO `log_akses` VALUES ('242', 'logout', '4', '2018-08-16 08:36:05');
INSERT INTO `log_akses` VALUES ('243', 'login sukses ', '4', '2018-08-16 10:15:23');
INSERT INTO `log_akses` VALUES ('244', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '4', '2018-08-16 10:16:28');
INSERT INTO `log_akses` VALUES ('245', 'logout', '4', '2018-08-16 10:16:38');
INSERT INTO `log_akses` VALUES ('246', 'login sukses ', '3', '2018-08-16 10:16:43');
INSERT INTO `log_akses` VALUES ('247', ' update peminjaman set  statuspinjam = 1,  approvedate = 2018-08-16,  daterange1 = 2018-08-16,  date', '3', '2018-08-16 10:16:52');
INSERT INTO `log_akses` VALUES ('248', 'logout', '3', '2018-08-16 10:17:10');
INSERT INTO `log_akses` VALUES ('249', 'login sukses ', '4', '2018-08-16 10:17:18');
INSERT INTO `log_akses` VALUES ('250', 'login sukses ', '2', '2018-08-16 10:18:28');
INSERT INTO `log_akses` VALUES ('251', 'logout', '2', '2018-08-16 10:19:41');
INSERT INTO `log_akses` VALUES ('252', 'login sukses ', '2', '2018-08-16 10:20:26');
INSERT INTO `log_akses` VALUES ('253', 'logout', '2', '2018-08-16 10:20:29');
INSERT INTO `log_akses` VALUES ('254', 'login sukses ', '4', '2018-08-16 10:20:37');
INSERT INTO `log_akses` VALUES ('255', 'login sukses ', '4', '2018-08-16 10:21:21');
INSERT INTO `log_akses` VALUES ('256', 'login sukses ', '4', '2018-08-16 10:22:01');
INSERT INTO `log_akses` VALUES ('257', 'logout', '0', '2018-08-16 10:22:22');
INSERT INTO `log_akses` VALUES ('258', 'login sukses ', '4', '2018-08-16 10:22:28');
INSERT INTO `log_akses` VALUES ('259', 'logout', '0', '2018-08-16 10:22:53');
INSERT INTO `log_akses` VALUES ('260', 'login sukses ', '4', '2018-08-16 10:23:00');
INSERT INTO `log_akses` VALUES ('261', 'logout', '0', '2018-08-16 10:24:23');
INSERT INTO `log_akses` VALUES ('262', 'login sukses ', '4', '2018-08-16 10:24:30');
INSERT INTO `log_akses` VALUES ('263', 'login sukses ', '4', '2018-08-16 10:24:58');
INSERT INTO `log_akses` VALUES ('264', 'logout', '0', '2018-08-16 10:26:35');
INSERT INTO `log_akses` VALUES ('265', 'login sukses ', '4', '2018-08-16 10:26:43');
INSERT INTO `log_akses` VALUES ('266', 'login sukses ', '4', '2018-08-16 10:37:06');
INSERT INTO `log_akses` VALUES ('267', 'login sukses ', '4', '2018-08-16 10:38:31');
INSERT INTO `log_akses` VALUES ('268', 'logout', '0', '2018-08-16 10:40:24');
INSERT INTO `log_akses` VALUES ('269', 'login sukses ', '2', '2018-08-16 10:40:38');
INSERT INTO `log_akses` VALUES ('270', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '2', '2018-08-16 10:42:46');
INSERT INTO `log_akses` VALUES ('271', 'logout', '2', '2018-08-16 10:42:53');
INSERT INTO `log_akses` VALUES ('272', 'login sukses ', '10', '2018-08-16 10:43:04');
INSERT INTO `log_akses` VALUES ('273', ' update peminjaman set  statuspinjam = 1,  approvedate = 2018-08-16,  daterange1 = 2018-08-16,  date', '10', '2018-08-16 10:43:14');
INSERT INTO `log_akses` VALUES ('274', 'logout', '10', '2018-08-16 10:43:21');
INSERT INTO `log_akses` VALUES ('275', 'login sukses ', '2', '2018-08-16 10:43:27');
INSERT INTO `log_akses` VALUES ('276', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '2', '2018-08-16 10:44:24');
INSERT INTO `log_akses` VALUES ('277', 'logout', '2', '2018-08-16 10:44:34');
INSERT INTO `log_akses` VALUES ('278', 'login sukses ', '11', '2018-08-16 10:44:39');
INSERT INTO `log_akses` VALUES ('279', 'logout', '11', '2018-08-16 10:44:46');
INSERT INTO `log_akses` VALUES ('280', 'login sukses ', '10', '2018-08-16 10:44:53');
INSERT INTO `log_akses` VALUES ('281', ' update peminjaman set  statuspinjam = 1,  approvedate = 2018-08-16,  daterange1 = 2018-08-16,  date', '10', '2018-08-16 10:45:01');
INSERT INTO `log_akses` VALUES ('282', 'logout', '10', '2018-08-16 10:45:10');
INSERT INTO `log_akses` VALUES ('283', 'login sukses ', '2', '2018-08-16 10:45:17');
INSERT INTO `log_akses` VALUES ('284', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '2', '2018-08-16 10:46:11');
INSERT INTO `log_akses` VALUES ('285', 'logout', '2', '2018-08-16 10:46:21');
INSERT INTO `log_akses` VALUES ('286', 'login sukses ', '10', '2018-08-16 10:46:27');
INSERT INTO `log_akses` VALUES ('287', ' update peminjaman set  statuspinjam = 1,  approvedate = 2018-08-16,  daterange1 = 2018-08-16,  date', '10', '2018-08-16 10:46:36');
INSERT INTO `log_akses` VALUES ('288', 'logout', '10', '2018-08-16 10:46:43');
INSERT INTO `log_akses` VALUES ('289', 'login sukses ', '2', '2018-08-16 10:46:49');
INSERT INTO `log_akses` VALUES ('290', 'logout', '2', '2018-08-16 10:48:02');
INSERT INTO `log_akses` VALUES ('291', 'login sukses ', '11', '2018-08-16 10:48:12');
INSERT INTO `log_akses` VALUES ('292', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '11', '2018-08-16 10:49:56');
INSERT INTO `log_akses` VALUES ('293', 'logout', '11', '2018-08-16 10:50:22');
INSERT INTO `log_akses` VALUES ('294', 'login sukses ', '2', '2018-08-16 10:50:28');
INSERT INTO `log_akses` VALUES ('295', 'logout', '2', '2018-08-16 10:50:45');
INSERT INTO `log_akses` VALUES ('296', 'login sukses ', '3', '2018-08-16 10:50:51');
INSERT INTO `log_akses` VALUES ('297', ' update peminjaman set  statuspinjam = 1,  approvedate = 2018-08-16,  daterange1 = 2018-08-16,  date', '3', '2018-08-16 10:50:59');
INSERT INTO `log_akses` VALUES ('298', 'logout', '3', '2018-08-16 10:51:16');
INSERT INTO `log_akses` VALUES ('299', 'login sukses ', '11', '2018-08-16 10:51:25');
INSERT INTO `log_akses` VALUES ('300', 'logout', '0', '2018-08-16 10:51:45');
INSERT INTO `log_akses` VALUES ('301', 'login sukses ', '11', '2018-08-16 10:56:31');
INSERT INTO `log_akses` VALUES ('302', 'logout', '0', '2018-08-16 10:59:46');
INSERT INTO `log_akses` VALUES ('303', 'login sukses ', '11', '2018-08-16 10:59:55');
INSERT INTO `log_akses` VALUES ('304', 'logout', '0', '2018-08-16 11:00:49');
INSERT INTO `log_akses` VALUES ('305', 'login sukses ', '11', '2018-08-16 11:00:55');
INSERT INTO `log_akses` VALUES ('306', 'logout', '0', '2018-08-16 11:01:28');
INSERT INTO `log_akses` VALUES ('307', 'login sukses ', '11', '2018-08-16 11:01:34');
INSERT INTO `log_akses` VALUES ('308', 'logout', '0', '2018-08-16 11:01:59');
INSERT INTO `log_akses` VALUES ('309', 'login sukses ', '11', '2018-08-16 11:02:07');
INSERT INTO `log_akses` VALUES ('310', 'logout', '0', '2018-08-16 11:03:11');
INSERT INTO `log_akses` VALUES ('311', 'login sukses ', '11', '2018-08-16 11:13:42');
INSERT INTO `log_akses` VALUES ('312', 'login sukses ', '11', '2018-08-16 11:17:50');
INSERT INTO `log_akses` VALUES ('313', 'logout', '0', '2018-08-16 11:18:20');
INSERT INTO `log_akses` VALUES ('314', 'login sukses ', '11', '2018-08-16 11:18:26');
INSERT INTO `log_akses` VALUES ('315', 'login sukses ', '11', '2018-08-16 11:19:20');
INSERT INTO `log_akses` VALUES ('316', 'login sukses ', '1', '2018-08-16 11:21:19');
INSERT INTO `log_akses` VALUES ('317', 'logout', '1', '2018-08-16 11:21:39');
INSERT INTO `log_akses` VALUES ('318', 'login sukses ', '11', '2018-08-16 11:21:44');
INSERT INTO `log_akses` VALUES ('319', 'login sukses ', '11', '2018-08-16 11:23:28');
INSERT INTO `log_akses` VALUES ('320', 'login sukses ', '11', '2018-08-16 11:24:23');
INSERT INTO `log_akses` VALUES ('321', 'logout', '0', '2018-08-16 17:25:41');
INSERT INTO `log_akses` VALUES ('322', 'login sukses ', '2', '2018-08-16 17:27:05');
INSERT INTO `log_akses` VALUES ('323', 'logout', '2', '2018-08-16 17:27:09');
INSERT INTO `log_akses` VALUES ('324', 'login sukses ', '11', '2018-08-16 17:27:14');
INSERT INTO `log_akses` VALUES ('325', 'login sukses ', '11', '2018-08-16 17:28:21');
INSERT INTO `log_akses` VALUES ('326', 'login sukses ', '11', '2018-08-16 17:34:14');
INSERT INTO `log_akses` VALUES ('327', 'login sukses ', '11', '2018-08-16 17:40:20');
INSERT INTO `log_akses` VALUES ('328', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '11', '2018-08-16 17:48:20');
INSERT INTO `log_akses` VALUES ('329', 'logout', '11', '2018-08-16 17:54:08');
INSERT INTO `log_akses` VALUES ('330', 'login sukses ', '5', '2018-08-16 17:54:23');
INSERT INTO `log_akses` VALUES ('331', ' update peminjaman set  statuspinjam = 1,  approvedate = 2018-08-16,  daterange1 = 2018-08-16,  date', '5', '2018-08-16 17:54:31');
INSERT INTO `log_akses` VALUES ('332', 'logout', '5', '2018-08-16 17:54:48');
INSERT INTO `log_akses` VALUES ('333', 'login sukses ', '10', '2018-08-16 17:54:55');
INSERT INTO `log_akses` VALUES ('334', 'logout', '10', '2018-08-16 17:57:16');
INSERT INTO `log_akses` VALUES ('335', 'login sukses ', '4', '2018-08-16 17:57:23');
INSERT INTO `log_akses` VALUES ('336', 'logout', '4', '2018-08-17 04:01:19');
INSERT INTO `log_akses` VALUES ('337', 'login sukses ', '4', '2018-08-17 04:01:26');
INSERT INTO `log_akses` VALUES ('338', 'insert into regarsipvital (regvitalid, kodereg, katprodukid, jprodukid,  detailprodukid,\r\n          ', '4', '2018-08-17 04:02:12');
INSERT INTO `log_akses` VALUES ('339', 'login sukses ', '4', '2018-08-20 15:10:15');
INSERT INTO `log_akses` VALUES ('340', 'logout', '4', '2018-08-21 08:11:56');
INSERT INTO `log_akses` VALUES ('341', 'login sukses ', '2', '2018-08-21 08:12:16');
INSERT INTO `log_akses` VALUES ('342', 'login sukses ', '2', '2018-08-21 09:14:50');
INSERT INTO `log_akses` VALUES ('343', 'login sukses ', '1', '2018-08-28 17:17:54');
INSERT INTO `log_akses` VALUES ('344', 'logout', '1', '2018-08-28 17:18:15');
INSERT INTO `log_akses` VALUES ('345', 'login sukses ', '11', '2018-08-28 17:18:30');
INSERT INTO `log_akses` VALUES ('346', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-28 17:20:54');
INSERT INTO `log_akses` VALUES ('347', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-28 17:20:54');
INSERT INTO `log_akses` VALUES ('348', 'delete from dokumen_v2 where dokumenid =2', '11', '2018-08-28 17:23:42');
INSERT INTO `log_akses` VALUES ('349', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-28 17:24:01');
INSERT INTO `log_akses` VALUES ('350', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-28 17:24:01');
INSERT INTO `log_akses` VALUES ('351', 'delete from dokumen_v2 where dokumenid =2', '11', '2018-08-28 17:24:33');
INSERT INTO `log_akses` VALUES ('352', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-28 17:28:26');
INSERT INTO `log_akses` VALUES ('353', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-28 17:29:22');
INSERT INTO `log_akses` VALUES ('354', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-28 17:30:02');
INSERT INTO `log_akses` VALUES ('355', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-28 17:31:07');
INSERT INTO `log_akses` VALUES ('356', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-28 17:32:08');
INSERT INTO `log_akses` VALUES ('357', 'login sukses ', '11', '2018-08-30 07:24:23');
INSERT INTO `log_akses` VALUES ('358', 'update berkas_v2 set clid = 2,  roleid = uk.1.4.1, uraian = peraturan dokumen produksi spesimen, kur', '11', '2018-08-30 07:25:01');
INSERT INTO `log_akses` VALUES ('359', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '11', '2018-08-30 07:31:52');
INSERT INTO `log_akses` VALUES ('360', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 07:32:12');
INSERT INTO `log_akses` VALUES ('361', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 07:32:12');
INSERT INTO `log_akses` VALUES ('362', 'delete from berkas_v2 where berkasid =3', '11', '2018-08-30 07:34:02');
INSERT INTO `log_akses` VALUES ('363', 'delete from dokumen_v2 where dokumenid =1', '11', '2018-08-30 07:47:32');
INSERT INTO `log_akses` VALUES ('364', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 08:06:51');
INSERT INTO `log_akses` VALUES ('365', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 08:07:02');
INSERT INTO `log_akses` VALUES ('366', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 08:07:33');
INSERT INTO `log_akses` VALUES ('367', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 08:07:33');
INSERT INTO `log_akses` VALUES ('368', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 08:09:03');
INSERT INTO `log_akses` VALUES ('369', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 08:09:03');
INSERT INTO `log_akses` VALUES ('370', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 08:13:01');
INSERT INTO `log_akses` VALUES ('371', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 08:13:01');
INSERT INTO `log_akses` VALUES ('372', 'delete from dokumen_v2 where dokumenid =1', '11', '2018-08-30 08:13:48');
INSERT INTO `log_akses` VALUES ('373', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 08:15:24');
INSERT INTO `log_akses` VALUES ('374', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 08:15:24');
INSERT INTO `log_akses` VALUES ('375', 'delete from dokumen_v2 where dokumenid =1', '11', '2018-08-30 08:17:08');
INSERT INTO `log_akses` VALUES ('376', 'login sukses ', '11', '2018-08-30 08:20:44');
INSERT INTO `log_akses` VALUES ('377', 'login sukses ', '11', '2018-08-30 08:23:53');
INSERT INTO `log_akses` VALUES ('378', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '11', '2018-08-30 08:30:03');
INSERT INTO `log_akses` VALUES ('379', 'delete from berkas_v2 where berkasid =4', '11', '2018-08-30 08:31:20');
INSERT INTO `log_akses` VALUES ('380', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '11', '2018-08-30 08:31:40');
INSERT INTO `log_akses` VALUES ('381', 'delete from berkas_v2 where berkasid =5', '11', '2018-08-30 08:32:51');
INSERT INTO `log_akses` VALUES ('382', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '11', '2018-08-30 08:36:01');
INSERT INTO `log_akses` VALUES ('383', 'delete from berkas_v2 where berkasid =6', '11', '2018-08-30 08:36:33');
INSERT INTO `log_akses` VALUES ('384', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '11', '2018-08-30 08:37:04');
INSERT INTO `log_akses` VALUES ('385', 'delete from berkas_v2 where berkasid =7', '11', '2018-08-30 08:39:21');
INSERT INTO `log_akses` VALUES ('386', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '11', '2018-08-30 08:39:57');
INSERT INTO `log_akses` VALUES ('387', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '11', '2018-08-30 08:42:03');
INSERT INTO `log_akses` VALUES ('388', 'delete from berkas_v2 where berkasid =9', '11', '2018-08-30 08:44:07');
INSERT INTO `log_akses` VALUES ('389', 'delete from berkas_v2 where berkasid =8', '11', '2018-08-30 08:44:17');
INSERT INTO `log_akses` VALUES ('390', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '11', '2018-08-30 08:45:58');
INSERT INTO `log_akses` VALUES ('391', 'delete from berkas_v2 where berkasid =10', '11', '2018-08-30 08:56:25');
INSERT INTO `log_akses` VALUES ('392', 'logout', '11', '2018-08-30 09:01:09');
INSERT INTO `log_akses` VALUES ('393', 'login sukses ', '1', '2018-08-30 09:01:15');
INSERT INTO `log_akses` VALUES ('394', 'logout', '1', '2018-08-30 09:01:36');
INSERT INTO `log_akses` VALUES ('395', 'login sukses ', '11', '2018-08-30 09:01:42');
INSERT INTO `log_akses` VALUES ('396', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '11', '2018-08-30 09:02:05');
INSERT INTO `log_akses` VALUES ('397', 'delete from berkas_v2 where berkasid =11', '11', '2018-08-30 09:02:09');
INSERT INTO `log_akses` VALUES ('398', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '11', '2018-08-30 09:02:26');
INSERT INTO `log_akses` VALUES ('399', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 09:38:02');
INSERT INTO `log_akses` VALUES ('400', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 09:38:02');
INSERT INTO `log_akses` VALUES ('401', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 09:42:59');
INSERT INTO `log_akses` VALUES ('402', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 09:42:59');
INSERT INTO `log_akses` VALUES ('403', 'delete from filesdigital_v2 where filesid = 2 ', '11', '2018-08-30 09:46:21');
INSERT INTO `log_akses` VALUES ('404', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 09:46:38');
INSERT INTO `log_akses` VALUES ('405', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 09:46:38');
INSERT INTO `log_akses` VALUES ('406', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 09:51:00');
INSERT INTO `log_akses` VALUES ('407', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 09:51:00');
INSERT INTO `log_akses` VALUES ('408', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 09:51:26');
INSERT INTO `log_akses` VALUES ('409', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 09:51:26');
INSERT INTO `log_akses` VALUES ('410', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 10:00:57');
INSERT INTO `log_akses` VALUES ('411', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 10:00:57');
INSERT INTO `log_akses` VALUES ('412', 'delete from filesdigital_v2 where filesid = 5 ', '11', '2018-08-30 10:03:08');
INSERT INTO `log_akses` VALUES ('413', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 10:15:53');
INSERT INTO `log_akses` VALUES ('414', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 10:15:53');
INSERT INTO `log_akses` VALUES ('415', 'delete from filesdigital_v2 where filesid = 6 ', '11', '2018-08-30 10:31:56');
INSERT INTO `log_akses` VALUES ('416', 'delete from filesdigital_v2 where filesid = 3 ', '11', '2018-08-30 10:33:05');
INSERT INTO `log_akses` VALUES ('417', 'delete from filesdigital_v2 where filesid = 4 ', '11', '2018-08-30 10:34:12');
INSERT INTO `log_akses` VALUES ('418', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 10:34:27');
INSERT INTO `log_akses` VALUES ('419', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 10:34:27');
INSERT INTO `log_akses` VALUES ('420', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 10:35:00');
INSERT INTO `log_akses` VALUES ('421', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 10:35:00');
INSERT INTO `log_akses` VALUES ('422', 'delete from filesdigital_v2 where filesid = 8 ', '11', '2018-08-30 10:35:10');
INSERT INTO `log_akses` VALUES ('423', 'delete from filesdigital_v2 where filesid = 7 ', '11', '2018-08-30 10:35:14');
INSERT INTO `log_akses` VALUES ('424', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 10:39:55');
INSERT INTO `log_akses` VALUES ('425', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 10:39:55');
INSERT INTO `log_akses` VALUES ('426', 'delete from filesdigital_v2 where filesid = 9 ', '11', '2018-08-30 10:40:07');
INSERT INTO `log_akses` VALUES ('427', 'delete from filesdigital_v2 where filesid = 10 ', '11', '2018-08-30 10:44:04');
INSERT INTO `log_akses` VALUES ('428', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 10:49:57');
INSERT INTO `log_akses` VALUES ('429', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 10:49:57');
INSERT INTO `log_akses` VALUES ('430', 'delete from filesdigital_v2 where filesid = 13 ', '11', '2018-08-30 10:51:09');
INSERT INTO `log_akses` VALUES ('431', 'delete from filesdigital_v2 where filesid = 12 ', '11', '2018-08-30 10:51:12');
INSERT INTO `log_akses` VALUES ('432', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 10:52:45');
INSERT INTO `log_akses` VALUES ('433', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 10:52:45');
INSERT INTO `log_akses` VALUES ('434', 'delete from filesdigital_v2 where filesid = 14 ', '11', '2018-08-30 10:52:51');
INSERT INTO `log_akses` VALUES ('435', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 10:56:26');
INSERT INTO `log_akses` VALUES ('436', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 10:56:26');
INSERT INTO `log_akses` VALUES ('437', 'delete from filesdigital_v2 where filesid = 17 ', '11', '2018-08-30 10:56:41');
INSERT INTO `log_akses` VALUES ('438', 'delete from filesdigital_v2 where filesid = 16 ', '11', '2018-08-30 10:58:15');
INSERT INTO `log_akses` VALUES ('439', 'delete from filesdigital_v2 where filesid = 15 ', '11', '2018-08-30 10:58:53');
INSERT INTO `log_akses` VALUES ('440', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 10:59:10');
INSERT INTO `log_akses` VALUES ('441', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 10:59:10');
INSERT INTO `log_akses` VALUES ('442', 'delete from filesdigital_v2 where filesid = 18 ', '11', '2018-08-30 10:59:15');
INSERT INTO `log_akses` VALUES ('443', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 11:01:20');
INSERT INTO `log_akses` VALUES ('444', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 11:01:20');
INSERT INTO `log_akses` VALUES ('445', 'delete from filesdigital_v2 where filesid = 20 ', '11', '2018-08-30 11:01:33');
INSERT INTO `log_akses` VALUES ('446', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 11:03:47');
INSERT INTO `log_akses` VALUES ('447', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 11:03:47');
INSERT INTO `log_akses` VALUES ('448', 'delete from dokumen_v2 where dokumenid =2', '11', '2018-08-30 11:03:52');
INSERT INTO `log_akses` VALUES ('449', 'delete from filesdigital_v2 where filesid = 19 ', '11', '2018-08-30 11:04:07');
INSERT INTO `log_akses` VALUES ('450', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-08-30 11:04:37');
INSERT INTO `log_akses` VALUES ('451', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 11:04:37');
INSERT INTO `log_akses` VALUES ('452', 'delete from dokumen_v2 where dokumenid =2', '11', '2018-08-30 11:05:17');
INSERT INTO `log_akses` VALUES ('453', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-08-30 13:01:38');
INSERT INTO `log_akses` VALUES ('454', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-08-30 13:01:38');
INSERT INTO `log_akses` VALUES ('455', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-09-02 10:16:35');
INSERT INTO `log_akses` VALUES ('456', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:16:35');
INSERT INTO `log_akses` VALUES ('457', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-09-02 10:17:12');
INSERT INTO `log_akses` VALUES ('458', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:17:12');
INSERT INTO `log_akses` VALUES ('459', 'delete from filesdigital_v2 where filesid = 27 ', '11', '2018-09-02 10:17:43');
INSERT INTO `log_akses` VALUES ('460', 'delete from filesdigital_v2 where filesid = 26 ', '11', '2018-09-02 10:17:47');
INSERT INTO `log_akses` VALUES ('461', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-09-02 10:18:03');
INSERT INTO `log_akses` VALUES ('462', 'update dokumen_v2 set clid = 3, jenisid = 6, berkasid = 1, tgl_dok = 2018-08-30, nomor_dok = 6665, u', '11', '2018-09-02 10:18:03');
INSERT INTO `log_akses` VALUES ('463', 'delete from dokumen_v2 where dokumenid =1', '11', '2018-09-02 10:18:30');
INSERT INTO `log_akses` VALUES ('464', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 10:23:41');
INSERT INTO `log_akses` VALUES ('465', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:23:41');
INSERT INTO `log_akses` VALUES ('466', 'delete from dokumen_v2 where dokumenid =1', '11', '2018-09-02 10:24:33');
INSERT INTO `log_akses` VALUES ('467', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 10:26:30');
INSERT INTO `log_akses` VALUES ('468', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:26:30');
INSERT INTO `log_akses` VALUES ('469', 'delete from dokumen_v2 where dokumenid =1', '11', '2018-09-02 10:26:54');
INSERT INTO `log_akses` VALUES ('470', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 10:27:33');
INSERT INTO `log_akses` VALUES ('471', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:27:33');
INSERT INTO `log_akses` VALUES ('472', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 10:27:50');
INSERT INTO `log_akses` VALUES ('473', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:27:50');
INSERT INTO `log_akses` VALUES ('474', 'delete from dokumen_v2 where dokumenid =2', '11', '2018-09-02 10:28:42');
INSERT INTO `log_akses` VALUES ('475', 'delete from dokumen_v2 where dokumenid =1', '11', '2018-09-02 10:30:02');
INSERT INTO `log_akses` VALUES ('476', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 10:30:20');
INSERT INTO `log_akses` VALUES ('477', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:30:20');
INSERT INTO `log_akses` VALUES ('478', 'delete from dokumen_v2 where dokumenid =1', '11', '2018-09-02 10:30:37');
INSERT INTO `log_akses` VALUES ('479', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 10:31:20');
INSERT INTO `log_akses` VALUES ('480', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:31:20');
INSERT INTO `log_akses` VALUES ('481', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 10:31:41');
INSERT INTO `log_akses` VALUES ('482', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:31:41');
INSERT INTO `log_akses` VALUES ('483', 'delete from dokumen_v2 where dokumenid =2', '11', '2018-09-02 10:31:49');
INSERT INTO `log_akses` VALUES ('484', 'delete from dokumen_v2 where dokumenid =1', '11', '2018-09-02 10:31:52');
INSERT INTO `log_akses` VALUES ('485', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 10:32:28');
INSERT INTO `log_akses` VALUES ('486', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:32:28');
INSERT INTO `log_akses` VALUES ('487', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 10:36:20');
INSERT INTO `log_akses` VALUES ('488', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:36:21');
INSERT INTO `log_akses` VALUES ('489', 'delete from filesdigital_v2 where filesid = 36 ', '11', '2018-09-02 10:49:09');
INSERT INTO `log_akses` VALUES ('490', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 1, ura', '11', '2018-09-02 10:49:17');
INSERT INTO `log_akses` VALUES ('491', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:49:17');
INSERT INTO `log_akses` VALUES ('492', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 1, ura', '11', '2018-09-02 10:58:00');
INSERT INTO `log_akses` VALUES ('493', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 10:58:00');
INSERT INTO `log_akses` VALUES ('494', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 1, ura', '11', '2018-09-02 11:20:37');
INSERT INTO `log_akses` VALUES ('495', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 1, ura', '11', '2018-09-02 11:20:37');
INSERT INTO `log_akses` VALUES ('496', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 1, ura', '11', '2018-09-02 11:21:46');
INSERT INTO `log_akses` VALUES ('497', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 1, ura', '11', '2018-09-02 11:21:46');
INSERT INTO `log_akses` VALUES ('498', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 132, u', '11', '2018-09-02 11:22:32');
INSERT INTO `log_akses` VALUES ('499', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 132, u', '11', '2018-09-02 11:22:32');
INSERT INTO `log_akses` VALUES ('500', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 132, u', '11', '2018-09-02 11:23:54');
INSERT INTO `log_akses` VALUES ('501', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 132, u', '11', '2018-09-02 11:23:54');
INSERT INTO `log_akses` VALUES ('502', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 132, u', '11', '2018-09-02 11:25:04');
INSERT INTO `log_akses` VALUES ('503', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 132, u', '11', '2018-09-02 11:25:04');
INSERT INTO `log_akses` VALUES ('504', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 132, u', '11', '2018-09-02 11:25:39');
INSERT INTO `log_akses` VALUES ('505', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 132, u', '11', '2018-09-02 11:25:39');
INSERT INTO `log_akses` VALUES ('506', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 132, u', '11', '2018-09-02 11:26:39');
INSERT INTO `log_akses` VALUES ('507', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 132, u', '11', '2018-09-02 11:26:39');
INSERT INTO `log_akses` VALUES ('508', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 1323, ', '11', '2018-09-02 11:27:50');
INSERT INTO `log_akses` VALUES ('509', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 1323, ', '11', '2018-09-02 11:27:50');
INSERT INTO `log_akses` VALUES ('510', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 13, ur', '11', '2018-09-02 11:28:04');
INSERT INTO `log_akses` VALUES ('511', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 13, ur', '11', '2018-09-02 11:28:04');
INSERT INTO `log_akses` VALUES ('512', 'update dokumen_v2 set clid = 4, jenisid = 4, berkasid = 2, tgl_dok = 2018-09-02, nomor_dok = 1132, u', '11', '2018-09-02 11:28:37');
INSERT INTO `log_akses` VALUES ('513', 'update dokumen_v2 set clid = 4, jenisid = 4, berkasid = 2, tgl_dok = 2018-09-02, nomor_dok = 1132, u', '11', '2018-09-02 11:28:37');
INSERT INTO `log_akses` VALUES ('514', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 11:36:20');
INSERT INTO `log_akses` VALUES ('515', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 11:36:20');
INSERT INTO `log_akses` VALUES ('516', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 11:39:01');
INSERT INTO `log_akses` VALUES ('517', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 11:39:01');
INSERT INTO `log_akses` VALUES ('518', 'update dokumen_v2 set clid = 3, jenisid = 2, berkasid = 1, tgl_dok = 2018-09-02, nomor_dok = 65, ura', '11', '2018-09-02 11:39:22');
INSERT INTO `log_akses` VALUES ('519', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 11:39:22');
INSERT INTO `log_akses` VALUES ('520', 'update dokumen_v2 set clid = 4, jenisid = 4, berkasid = 1, tgl_dok = 2018-09-02, nomor_dok = 44, ura', '11', '2018-09-02 11:40:26');
INSERT INTO `log_akses` VALUES ('521', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 11:40:26');
INSERT INTO `log_akses` VALUES ('522', 'delete from filesdigital_v2 where filesid =  ', '11', '2018-09-02 11:40:53');
INSERT INTO `log_akses` VALUES ('523', 'delete from filesdigital_v2 where filesid =  ', '11', '2018-09-02 11:41:20');
INSERT INTO `log_akses` VALUES ('524', 'delete from filesdigital_v2 where filesid =  ', '11', '2018-09-02 11:41:36');
INSERT INTO `log_akses` VALUES ('525', 'delete from filesdigital_v2 where filesid =  ', '11', '2018-09-02 11:42:07');
INSERT INTO `log_akses` VALUES ('526', 'delete from filesdigital_v2 where filesid =  ', '11', '2018-09-02 11:43:22');
INSERT INTO `log_akses` VALUES ('527', 'delete from filesdigital_v2 where filesid =  ', '11', '2018-09-02 11:47:15');
INSERT INTO `log_akses` VALUES ('528', 'delete from filesdigital_v2 where filesid =  ', '11', '2018-09-02 11:47:48');
INSERT INTO `log_akses` VALUES ('529', 'delete from filesdigital_v2 where filesid = 42 ', '11', '2018-09-02 11:48:15');
INSERT INTO `log_akses` VALUES ('530', 'update dokumen_v2 set clid = 4, jenisid = 4, berkasid = 1, tgl_dok = 2018-09-02, nomor_dok = 44, ura', '11', '2018-09-02 11:48:40');
INSERT INTO `log_akses` VALUES ('531', 'update dokumen_v2 set clid = 4, jenisid = 4, berkasid = 1, tgl_dok = 2018-09-02, nomor_dok = 44, ura', '11', '2018-09-02 11:48:40');
INSERT INTO `log_akses` VALUES ('532', 'update dokumen_v2 set clid = 4, jenisid = 4, berkasid = 1, tgl_dok = 2018-09-02, nomor_dok = 44, ura', '11', '2018-09-02 11:57:04');
INSERT INTO `log_akses` VALUES ('533', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 11:57:04');
INSERT INTO `log_akses` VALUES ('534', 'delete from filesdigital_v2 where filesid = 41 ', '11', '2018-09-02 11:57:44');
INSERT INTO `log_akses` VALUES ('535', 'update dokumen_v2 set clid = 3, jenisid = 2, berkasid = 1, tgl_dok = 2018-09-02, nomor_dok = 65, ura', '11', '2018-09-02 11:57:53');
INSERT INTO `log_akses` VALUES ('536', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 11:57:53');
INSERT INTO `log_akses` VALUES ('537', 'update dokumen_v2 set clid = 3, jenisid = 2, berkasid = 1, tgl_dok = 2018-09-02, nomor_dok = 65, ura', '11', '2018-09-02 11:59:12');
INSERT INTO `log_akses` VALUES ('538', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 11:59:12');
INSERT INTO `log_akses` VALUES ('539', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '11', '2018-09-02 12:00:42');
INSERT INTO `log_akses` VALUES ('540', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 12:00:42');
INSERT INTO `log_akses` VALUES ('541', 'delete from filesdigital_v2 where filesid = 46 ', '11', '2018-09-02 12:01:09');
INSERT INTO `log_akses` VALUES ('542', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 221, u', '11', '2018-09-02 12:01:25');
INSERT INTO `log_akses` VALUES ('543', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 12:01:25');
INSERT INTO `log_akses` VALUES ('544', 'delete from filesdigital_v2 where filesid = 47 ', '11', '2018-09-02 12:01:40');
INSERT INTO `log_akses` VALUES ('545', 'delete from dokumen_v2 where dokumenid =', '11', '2018-09-02 12:02:13');
INSERT INTO `log_akses` VALUES ('546', 'delete from dokumen_v2 where dokumenid =', '11', '2018-09-02 12:02:24');
INSERT INTO `log_akses` VALUES ('547', 'delete from dokumen_v2 where dokumenid =', '11', '2018-09-02 12:02:26');
INSERT INTO `log_akses` VALUES ('548', 'delete from dokumen_v2 where dokumenid =', '11', '2018-09-02 12:02:35');
INSERT INTO `log_akses` VALUES ('549', 'delete from dokumen_v2 where dokumenid =', '11', '2018-09-02 12:02:54');
INSERT INTO `log_akses` VALUES ('550', 'delete from dokumen_v2 where dokumenid =', '11', '2018-09-02 12:03:47');
INSERT INTO `log_akses` VALUES ('551', 'delete from dokumen_v2 where dokumenid =', '11', '2018-09-02 12:03:50');
INSERT INTO `log_akses` VALUES ('552', 'delete from dokumen_v2 where dokumenid =4', '11', '2018-09-02 12:04:34');
INSERT INTO `log_akses` VALUES ('553', 'delete from filesdigital_v2 where filesid = 43 ', '11', '2018-09-02 12:04:44');
INSERT INTO `log_akses` VALUES ('554', 'update dokumen_v2 set clid = 4, jenisid = 4, berkasid = 1, tgl_dok = 2018-09-02, nomor_dok = 44, ura', '11', '2018-09-02 12:04:55');
INSERT INTO `log_akses` VALUES ('555', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 12:04:55');
INSERT INTO `log_akses` VALUES ('556', 'update berkas_v2 set clid = 3,  roleid = uk.1.4.1, uraian = dpm, kurunwaktu = 1990, jumlah = 0, tpid', '11', '2018-09-02 12:09:13');
INSERT INTO `log_akses` VALUES ('557', 'update berkas_v2 set clid = 3,  roleid = uk.1.4.1, uraian = dpm3, kurunwaktu = 1990, jumlah = 0, tpi', '11', '2018-09-02 12:12:34');
INSERT INTO `log_akses` VALUES ('558', 'update berkas_v2 set clid = 3,  roleid = uk.1.4.1, uraian = dpm 3, kurunwaktu = 1990, jumlah = 0, tp', '11', '2018-09-02 12:12:59');
INSERT INTO `log_akses` VALUES ('559', 'update berkas_v2 set clid = 3,  roleid = uk.1.4.1, uraian = dpm3, kurunwaktu = 1990, jumlah = 0, tpi', '11', '2018-09-02 12:13:37');
INSERT INTO `log_akses` VALUES ('560', 'update berkas_v2 set clid = 3,  roleid = uk.1.4.1, uraian = dpm3, kurunwaktu = 1990, jumlah = 0, tpi', '11', '2018-09-02 12:18:45');
INSERT INTO `log_akses` VALUES ('561', 'update berkas_v2 set clid = 3,  roleid = uk.1.4.1, uraian = dpm33, kurunwaktu = 1990, jumlah = 0, tp', '11', '2018-09-02 12:19:21');
INSERT INTO `log_akses` VALUES ('562', 'update berkas_v2 set clid = 3,  roleid = uk.1.4.1, uraian = dpm33, kurunwaktu = 1990, jumlah = 0, tp', '11', '2018-09-02 12:19:29');
INSERT INTO `log_akses` VALUES ('563', 'update berkas_v2 set clid = 3,  roleid = uk.1.4.1, uraian = dpm33, kurunwaktu = 1990, jumlah = 0, tp', '11', '2018-09-02 12:19:38');
INSERT INTO `log_akses` VALUES ('564', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 221, u', '11', '2018-09-02 12:31:02');
INSERT INTO `log_akses` VALUES ('565', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 12:31:02');
INSERT INTO `log_akses` VALUES ('566', 'login sukses ', '11', '2018-09-02 12:42:00');
INSERT INTO `log_akses` VALUES ('567', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 2, tgl_dok = 2018-09-02, nomor_dok = 221, ur', '11', '2018-09-02 12:57:44');
INSERT INTO `log_akses` VALUES ('568', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 2, tgl_dok = 2018-09-02, nomor_dok = 221, ur', '11', '2018-09-02 12:57:44');
INSERT INTO `log_akses` VALUES ('569', 'delete from filesdigital_v2 where filesid = 39 ', '11', '2018-09-02 13:53:35');
INSERT INTO `log_akses` VALUES ('570', 'update dokumen_v2 set clid = 4, jenisid = 5, berkasid = 12, tgl_dok = 2018-09-02, nomor_dok = 13, ur', '11', '2018-09-02 13:53:42');
INSERT INTO `log_akses` VALUES ('571', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '11', '2018-09-02 13:53:42');
INSERT INTO `log_akses` VALUES ('572', 'update dokumen_v2 set clid = 4, jenisid = 4, berkasid = 2, tgl_dok = 2018-09-02, nomor_dok = 1132, u', '11', '2018-09-03 08:02:52');
INSERT INTO `log_akses` VALUES ('573', 'update dokumen_v2 set clid = 4, jenisid = 4, berkasid = 2, tgl_dok = 2018-09-02, nomor_dok = 1132, u', '11', '2018-09-03 08:02:52');
INSERT INTO `log_akses` VALUES ('574', 'login sukses ', '11', '2018-09-03 09:41:18');
INSERT INTO `log_akses` VALUES ('575', 'logout', '11', '2018-09-03 11:01:11');
INSERT INTO `log_akses` VALUES ('576', 'login sukses ', '11', '2018-09-03 11:01:43');
INSERT INTO `log_akses` VALUES ('577', 'logout', '11', '2018-09-03 11:07:39');
INSERT INTO `log_akses` VALUES ('578', 'login sukses ', '1', '2018-09-03 11:07:45');
INSERT INTO `log_akses` VALUES ('579', 'logout', '1', '2018-09-03 11:09:36');
INSERT INTO `log_akses` VALUES ('580', 'login sukses ', '11', '2018-09-03 11:09:40');
INSERT INTO `log_akses` VALUES ('581', 'logout', '11', '2018-09-03 13:39:25');
INSERT INTO `log_akses` VALUES ('582', 'login sukses ', '1', '2018-09-03 13:39:38');
INSERT INTO `log_akses` VALUES ('583', 'logout', '1', '2018-09-03 13:40:16');
INSERT INTO `log_akses` VALUES ('584', 'login sukses ', '1', '2018-09-03 13:56:31');
INSERT INTO `log_akses` VALUES ('585', 'logout', '1', '2018-09-03 13:57:22');
INSERT INTO `log_akses` VALUES ('586', 'login sukses ', '24', '2018-09-03 13:58:08');
INSERT INTO `log_akses` VALUES ('587', 'logout', '24', '2018-09-03 13:58:58');
INSERT INTO `log_akses` VALUES ('588', 'login sukses ', '1', '2018-09-03 13:59:04');
INSERT INTO `log_akses` VALUES ('589', 'logout', '1', '2018-09-03 13:59:35');
INSERT INTO `log_akses` VALUES ('590', 'login sukses ', '1', '2018-09-03 14:00:24');
INSERT INTO `log_akses` VALUES ('591', 'logout', '1', '2018-09-03 14:00:40');
INSERT INTO `log_akses` VALUES ('592', 'login sukses ', '3', '2018-09-03 14:00:52');
INSERT INTO `log_akses` VALUES ('593', 'insert into master_katproduk(katprodukname, statusact, roleid)values(  aaas, 1, uk.3.1.1  )', '3', '2018-09-03 14:01:18');
INSERT INTO `log_akses` VALUES ('594', 'delete from master_katproduk where katprodukid =25', '3', '2018-09-03 14:01:29');
INSERT INTO `log_akses` VALUES ('595', 'logout', '3', '2018-09-03 14:02:27');
INSERT INTO `log_akses` VALUES ('596', 'login sukses ', '1', '2018-09-03 14:02:33');
INSERT INTO `log_akses` VALUES ('597', 'logout', '1', '2018-09-03 14:03:10');
INSERT INTO `log_akses` VALUES ('598', 'login sukses ', '19', '2018-09-03 14:03:26');
INSERT INTO `log_akses` VALUES ('599', 'logout', '19', '2018-09-03 14:06:55');
INSERT INTO `log_akses` VALUES ('600', 'login sukses ', '3', '2018-09-03 14:13:20');
INSERT INTO `log_akses` VALUES ('601', 'logout', '3', '2018-09-03 14:14:01');
INSERT INTO `log_akses` VALUES ('602', 'login sukses ', '3', '2018-09-03 14:14:20');
INSERT INTO `log_akses` VALUES ('603', 'login sukses ', '2', '2018-09-04 13:52:39');
INSERT INTO `log_akses` VALUES ('604', 'logout', '2', '2018-09-04 13:55:51');
INSERT INTO `log_akses` VALUES ('605', 'login sukses ', '1', '2018-09-04 13:55:54');
INSERT INTO `log_akses` VALUES ('606', 'update people set roleid = uk.1.1, np = 7504, peoplename = ivo nur subiwa, a.md., email = ivo.subiwa', '1', '2018-09-04 13:56:25');
INSERT INTO `log_akses` VALUES ('607', 'update peopleakses set approve = 0, roleid =  uk.1.1, menu =  m3 where peopleid = 2 ', '1', '2018-09-04 13:56:25');
INSERT INTO `log_akses` VALUES ('608', 'logout', '1', '2018-09-04 13:56:33');
INSERT INTO `log_akses` VALUES ('609', 'login sukses ', '2', '2018-09-04 13:56:44');
INSERT INTO `log_akses` VALUES ('610', 'logout', '2', '2018-09-04 14:00:23');
INSERT INTO `log_akses` VALUES ('611', 'login sukses ', '1', '2018-09-04 14:00:28');
INSERT INTO `log_akses` VALUES ('612', 'login sukses ', '21', '2018-09-04 14:05:48');
INSERT INTO `log_akses` VALUES ('613', 'logout', '21', '2018-09-04 14:05:54');
INSERT INTO `log_akses` VALUES ('614', 'login sukses ', '7', '2018-09-04 14:06:03');
INSERT INTO `log_akses` VALUES ('615', 'login sukses ', '1', '2018-09-04 14:06:19');
INSERT INTO `log_akses` VALUES ('616', 'login sukses ', '3', '2018-09-04 14:06:30');
INSERT INTO `log_akses` VALUES ('617', 'logout', '1', '2018-09-04 14:06:56');
INSERT INTO `log_akses` VALUES ('618', 'login sukses ', '6', '2018-09-04 14:07:07');
INSERT INTO `log_akses` VALUES ('619', 'insert into master_detailproduk (katprodukid, jprodukid, detailprodukname , statusact, roleid) value', '7', '2018-09-04 14:09:29');
INSERT INTO `log_akses` VALUES ('620', 'logout', '3', '2018-09-04 14:10:14');
INSERT INTO `log_akses` VALUES ('621', 'insert into master_kodekerja (detailprodukid, kode, uraian, statusact) values (  70,  015.03,18,  bl', '7', '2018-09-04 14:10:23');
INSERT INTO `log_akses` VALUES ('622', 'insert into regarsipvital (regvitalid, kodereg, katprodukid, jprodukid,  detailprodukid,\r\n          ', '7', '2018-09-04 14:10:56');
INSERT INTO `log_akses` VALUES ('623', 'login sukses ', '3', '2018-09-04 14:10:59');
INSERT INTO `log_akses` VALUES ('624', 'login sukses ', '3', '2018-09-04 14:11:53');
INSERT INTO `log_akses` VALUES ('625', 'insert into master_detailproduk (katprodukid, jprodukid, detailprodukname , statusact, roleid) value', '3', '2018-09-04 14:18:18');
INSERT INTO `log_akses` VALUES ('626', 'insert into master_detailproduk (katprodukid, jprodukid, detailprodukname , statusact, roleid) value', '3', '2018-09-04 14:18:27');
INSERT INTO `log_akses` VALUES ('627', 'insert into master_detailproduk (katprodukid, jprodukid, detailprodukname , statusact, roleid) value', '3', '2018-09-04 14:19:27');
INSERT INTO `log_akses` VALUES ('628', 'logout', '6', '2018-09-04 14:20:29');
INSERT INTO `log_akses` VALUES ('629', 'login sukses ', '2', '2018-09-04 14:23:52');
INSERT INTO `log_akses` VALUES ('630', 'login sukses ', '3', '2018-09-04 14:24:41');
INSERT INTO `log_akses` VALUES ('631', 'login sukses ', '7', '2018-09-04 14:25:00');
INSERT INTO `log_akses` VALUES ('632', 'insert into master_detailproduk (katprodukid, jprodukid, detailprodukname , statusact, roleid) value', '3', '2018-09-04 14:25:14');
INSERT INTO `log_akses` VALUES ('633', 'delete from master_detailproduk where detailprodukid =74', '3', '2018-09-04 14:26:00');
INSERT INTO `log_akses` VALUES ('634', 'delete from master_detailproduk where detailprodukid =73', '3', '2018-09-04 14:26:05');
INSERT INTO `log_akses` VALUES ('635', 'delete from master_detailproduk where detailprodukid =72', '3', '2018-09-04 14:26:09');
INSERT INTO `log_akses` VALUES ('636', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-04 14:26:11');
INSERT INTO `log_akses` VALUES ('637', 'login sukses ', '3', '2018-09-04 14:26:15');
INSERT INTO `log_akses` VALUES ('638', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-04 14:27:09');
INSERT INTO `log_akses` VALUES ('639', 'update regarsipvital set katprodukid = 19, jprodukid = 37, detailprodukid = 54, clid = 0,  roleid = ', '3', '2018-09-04 14:27:16');
INSERT INTO `log_akses` VALUES ('640', 'insert into master_detailproduk (katprodukid, jprodukid, detailprodukname , statusact, roleid) value', '7', '2018-09-04 14:28:04');
INSERT INTO `log_akses` VALUES ('641', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-04 14:28:06');
INSERT INTO `log_akses` VALUES ('642', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-04 14:28:51');
INSERT INTO `log_akses` VALUES ('643', 'logout', '3', '2018-09-04 14:32:32');
INSERT INTO `log_akses` VALUES ('644', 'login sukses ', '6', '2018-09-04 14:32:44');
INSERT INTO `log_akses` VALUES ('645', 'insert into master_detailproduk (katprodukid, jprodukid, detailprodukname , statusact, roleid) value', '3', '2018-09-04 14:33:51');
INSERT INTO `log_akses` VALUES ('646', 'delete from master_detailproduk where detailprodukid =76', '3', '2018-09-04 14:35:00');
INSERT INTO `log_akses` VALUES ('647', 'delete from regarsipvital where regvitalid =3', '3', '2018-09-04 14:37:06');
INSERT INTO `log_akses` VALUES ('648', 'delete from master_detailproduk where detailprodukid =53', '3', '2018-09-04 14:37:20');
INSERT INTO `log_akses` VALUES ('649', 'insert into master_detailproduk (katprodukid, jprodukid, detailprodukname , statusact, roleid) value', '3', '2018-09-04 14:39:11');
INSERT INTO `log_akses` VALUES ('650', 'logout', '6', '2018-09-04 14:39:50');
INSERT INTO `log_akses` VALUES ('651', 'logout', '7', '2018-09-04 14:40:11');
INSERT INTO `log_akses` VALUES ('652', 'login sukses ', '6', '2018-09-04 14:40:22');
INSERT INTO `log_akses` VALUES ('653', 'login sukses ', '3', '2018-09-04 14:40:56');
INSERT INTO `log_akses` VALUES ('654', 'insert into regarsipvital (regvitalid, kodereg, katprodukid, jprodukid,  detailprodukid,\r\n          ', '3', '2018-09-04 14:47:25');
INSERT INTO `log_akses` VALUES ('655', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-04 14:48:30');
INSERT INTO `log_akses` VALUES ('656', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-04 14:48:30');
INSERT INTO `log_akses` VALUES ('657', 'login sukses ', '6', '2018-09-04 14:51:52');
INSERT INTO `log_akses` VALUES ('658', 'login sukses ', '6', '2018-09-04 14:53:41');
INSERT INTO `log_akses` VALUES ('659', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-04 14:56:36');
INSERT INTO `log_akses` VALUES ('660', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-04 14:56:36');
INSERT INTO `log_akses` VALUES ('661', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-04 14:58:11');
INSERT INTO `log_akses` VALUES ('662', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-04 14:58:11');
INSERT INTO `log_akses` VALUES ('663', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-04 15:01:12');
INSERT INTO `log_akses` VALUES ('664', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-04 15:01:12');
INSERT INTO `log_akses` VALUES ('665', 'update dokumen_v2 set clid = 12, jenisid = 9, berkasid = 4, tgl_dok = 2017-06-27, nomor_dok = 4567, ', '2', '2018-09-04 15:01:39');
INSERT INTO `log_akses` VALUES ('666', 'update dokumen_v2 set clid = 12, jenisid = 9, berkasid = 4, tgl_dok = 2017-06-27, nomor_dok = 4567, ', '2', '2018-09-04 15:01:39');
INSERT INTO `log_akses` VALUES ('667', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-04 15:02:39');
INSERT INTO `log_akses` VALUES ('668', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-04 15:03:43');
INSERT INTO `log_akses` VALUES ('669', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-04 15:03:43');
INSERT INTO `log_akses` VALUES ('670', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-04 15:04:57');
INSERT INTO `log_akses` VALUES ('671', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-04 15:04:57');
INSERT INTO `log_akses` VALUES ('672', 'logout', '2', '2018-09-04 15:07:41');
INSERT INTO `log_akses` VALUES ('673', 'login sukses ', '2', '2018-09-04 15:07:56');
INSERT INTO `log_akses` VALUES ('674', 'logout', '2', '2018-09-04 15:08:14');
INSERT INTO `log_akses` VALUES ('675', 'login sukses ', '15', '2018-09-04 15:08:40');
INSERT INTO `log_akses` VALUES ('676', 'logout', '6', '2018-09-04 15:13:27');
INSERT INTO `log_akses` VALUES ('677', 'login sukses ', '9', '2018-09-04 15:13:42');
INSERT INTO `log_akses` VALUES ('678', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '3', '2018-09-04 15:41:45');
INSERT INTO `log_akses` VALUES ('679', 'update peminjaman set  nip = 7626,  nama = fanny prasetia, s.si.,  uraian = test,  roleid_to = uk.21', '3', '2018-09-04 15:54:05');
INSERT INTO `log_akses` VALUES ('680', 'logout', '15', '2018-09-04 16:02:04');
INSERT INTO `log_akses` VALUES ('681', 'login sukses ', '2', '2018-09-04 16:02:16');
INSERT INTO `log_akses` VALUES ('682', 'logout', '3', '2018-09-04 16:19:32');
INSERT INTO `log_akses` VALUES ('683', 'login sukses ', '2', '2018-09-04 16:20:09');
INSERT INTO `log_akses` VALUES ('684', 'logout', '2', '2018-09-04 16:20:28');
INSERT INTO `log_akses` VALUES ('685', 'login sukses ', '3', '2018-09-04 16:20:43');
INSERT INTO `log_akses` VALUES ('686', 'logout', '3', '2018-09-04 16:21:12');
INSERT INTO `log_akses` VALUES ('687', 'login sukses ', '2', '2018-09-04 16:21:22');
INSERT INTO `log_akses` VALUES ('688', 'logout', '2', '2018-09-04 16:23:06');
INSERT INTO `log_akses` VALUES ('689', 'logout', '2', '2018-09-04 16:23:19');
INSERT INTO `log_akses` VALUES ('690', 'login sukses ', '4', '2018-09-04 16:23:28');
INSERT INTO `log_akses` VALUES ('691', 'login sukses ', '4', '2018-09-04 16:23:48');
INSERT INTO `log_akses` VALUES ('692', 'insert into berkas_v1( kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumlah, tpid,\r\n       ', '4', '2018-09-04 16:24:26');
INSERT INTO `log_akses` VALUES ('693', 'insert into berkas_v1( kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumlah, tpid,\r\n       ', '4', '2018-09-04 16:24:29');
INSERT INTO `log_akses` VALUES ('694', 'logout', '4', '2018-09-04 16:25:49');
INSERT INTO `log_akses` VALUES ('695', 'login sukses ', '1', '2018-09-04 16:25:57');
INSERT INTO `log_akses` VALUES ('696', 'logout', '1', '2018-09-04 16:26:19');
INSERT INTO `log_akses` VALUES ('697', 'login sukses ', '6', '2018-09-04 16:26:26');
INSERT INTO `log_akses` VALUES ('698', 'insert into berkas_v1( kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumlah, tpid,\r\n       ', '6', '2018-09-04 16:28:19');
INSERT INTO `log_akses` VALUES ('699', 'logout', '4', '2018-09-04 16:28:39');
INSERT INTO `log_akses` VALUES ('700', 'login sukses ', '6', '2018-09-04 16:29:18');
INSERT INTO `log_akses` VALUES ('701', 'insert into berkas_v1( kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumlah, tpid,\r\n       ', '6', '2018-09-04 16:30:10');
INSERT INTO `log_akses` VALUES ('702', 'insert into berkas_v1(parrentberkasid,  kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumla', '6', '2018-09-04 16:30:56');
INSERT INTO `log_akses` VALUES ('703', 'insert into dokumen_v1 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '6', '2018-09-04 16:32:30');
INSERT INTO `log_akses` VALUES ('704', 'insert into filesdigital_v1(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '6', '2018-09-04 16:32:30');
INSERT INTO `log_akses` VALUES ('705', 'logout', '3', '2018-09-04 16:35:05');
INSERT INTO `log_akses` VALUES ('706', 'logout', '6', '2018-09-04 16:57:20');
INSERT INTO `log_akses` VALUES ('707', 'login sukses ', '1', '2018-09-04 16:57:31');
INSERT INTO `log_akses` VALUES ('708', 'logout', '1', '2018-09-04 16:57:49');
INSERT INTO `log_akses` VALUES ('709', 'login sukses ', '2', '2018-09-04 16:57:54');
INSERT INTO `log_akses` VALUES ('710', 'logout', '3', '2018-09-04 23:08:48');
INSERT INTO `log_akses` VALUES ('711', 'login sukses ', '1', '2018-09-04 23:08:54');
INSERT INTO `log_akses` VALUES ('712', 'logout', '1', '2018-09-04 23:12:25');
INSERT INTO `log_akses` VALUES ('713', 'login sukses ', '3', '2018-09-04 23:12:41');
INSERT INTO `log_akses` VALUES ('714', 'insert into master_katproduk(katprodukname, statusact, roleid)values(  captive, 1, uk.3.1.1  )', '3', '2018-09-04 23:18:10');
INSERT INTO `log_akses` VALUES ('715', 'insert into regarsipvital (regvitalid, kodereg, katprodukid, jprodukid,  detailprodukid,\r\n          ', '3', '2018-09-04 23:22:20');
INSERT INTO `log_akses` VALUES ('716', 'update regarsipvital set katprodukid = 19, jprodukid = 35, detailprodukid = 57, clid = 0,  roleid = ', '3', '2018-09-04 23:33:19');
INSERT INTO `log_akses` VALUES ('717', 'update regarsipvital set katprodukid = 19, jprodukid = 35, detailprodukid = 57, clid = 0,  roleid = ', '3', '2018-09-04 23:33:27');
INSERT INTO `log_akses` VALUES ('718', 'logout', '3', '2018-09-05 00:03:47');
INSERT INTO `log_akses` VALUES ('719', 'login sukses ', '3', '2018-09-05 00:04:05');
INSERT INTO `log_akses` VALUES ('720', 'logout', '3', '2018-09-05 00:11:14');
INSERT INTO `log_akses` VALUES ('721', 'login sukses ', '6', '2018-09-05 00:11:36');
INSERT INTO `log_akses` VALUES ('722', 'insert into regarsipvital (regvitalid, kodereg, katprodukid, jprodukid,  detailprodukid,\r\n          ', '6', '2018-09-05 00:15:54');
INSERT INTO `log_akses` VALUES ('723', 'login sukses ', '6', '2018-09-05 00:30:06');
INSERT INTO `log_akses` VALUES ('724', 'logout', '0', '2018-09-05 08:13:37');
INSERT INTO `log_akses` VALUES ('725', 'login sukses ', '6', '2018-09-05 08:13:59');
INSERT INTO `log_akses` VALUES ('726', 'login sukses ', '6', '2018-09-05 08:19:07');
INSERT INTO `log_akses` VALUES ('727', 'logout', '0', '2018-09-05 08:22:24');
INSERT INTO `log_akses` VALUES ('728', 'login sukses ', '6', '2018-09-05 08:24:52');
INSERT INTO `log_akses` VALUES ('729', 'logout', '0', '2018-09-05 08:38:07');
INSERT INTO `log_akses` VALUES ('730', 'login sukses ', '6', '2018-09-05 08:38:16');
INSERT INTO `log_akses` VALUES ('731', 'logout', '0', '2018-09-05 08:42:15');
INSERT INTO `log_akses` VALUES ('732', 'login sukses ', '6', '2018-09-05 08:42:25');
INSERT INTO `log_akses` VALUES ('733', 'logout', '0', '2018-09-05 08:43:55');
INSERT INTO `log_akses` VALUES ('734', 'login sukses ', '6', '2018-09-05 08:44:07');
INSERT INTO `log_akses` VALUES ('735', 'logout', '6', '2018-09-05 09:57:36');
INSERT INTO `log_akses` VALUES ('736', 'login sukses ', '3', '2018-09-05 09:57:53');
INSERT INTO `log_akses` VALUES ('737', 'logout', '3', '2018-09-05 10:02:31');
INSERT INTO `log_akses` VALUES ('738', 'login sukses ', '4', '2018-09-05 10:02:49');
INSERT INTO `log_akses` VALUES ('739', 'insert into berkas_v1( kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumlah, tpid,\r\n       ', '4', '2018-09-05 10:03:19');
INSERT INTO `log_akses` VALUES ('740', 'insert into berkas_v1(parrentberkasid,  kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumla', '4', '2018-09-05 10:16:26');
INSERT INTO `log_akses` VALUES ('741', 'insert into dokumen_v1 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '4', '2018-09-05 10:17:11');
INSERT INTO `log_akses` VALUES ('742', 'insert into filesdigital_v1(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '4', '2018-09-05 10:17:11');
INSERT INTO `log_akses` VALUES ('743', 'insert into berkas_v1( kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumlah, tpid,\r\n       ', '4', '2018-09-05 10:18:28');
INSERT INTO `log_akses` VALUES ('744', 'insert into berkas_v1(parrentberkasid,  kodereg, nomor, clid, roleid, nip, uraian, kurunwaktu, jumla', '4', '2018-09-05 12:03:23');
INSERT INTO `log_akses` VALUES ('745', 'insert into dokumen_v1 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '4', '2018-09-05 12:03:47');
INSERT INTO `log_akses` VALUES ('746', 'insert into filesdigital_v1(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '4', '2018-09-05 12:03:47');
INSERT INTO `log_akses` VALUES ('747', 'logout', '4', '2018-09-05 18:17:38');
INSERT INTO `log_akses` VALUES ('748', 'login sukses ', '2', '2018-09-05 18:18:29');
INSERT INTO `log_akses` VALUES ('749', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-05 18:18:51');
INSERT INTO `log_akses` VALUES ('750', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-05 18:19:19');
INSERT INTO `log_akses` VALUES ('751', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-05 18:19:19');
INSERT INTO `log_akses` VALUES ('752', 'delete from dokumen_v2 where dokumenid =6', '2', '2018-09-05 18:20:50');
INSERT INTO `log_akses` VALUES ('753', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-05 18:21:17');
INSERT INTO `log_akses` VALUES ('754', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-05 18:21:17');
INSERT INTO `log_akses` VALUES ('755', 'delete from dokumen_v2 where dokumenid =6', '2', '2018-09-05 18:21:34');
INSERT INTO `log_akses` VALUES ('756', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '2', '2018-09-05 18:23:17');
INSERT INTO `log_akses` VALUES ('757', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-05 18:23:38');
INSERT INTO `log_akses` VALUES ('758', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-05 18:23:38');
INSERT INTO `log_akses` VALUES ('759', 'delete from dokumen_v2 where dokumenid =6', '2', '2018-09-05 18:23:47');
INSERT INTO `log_akses` VALUES ('760', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-05 18:44:01');
INSERT INTO `log_akses` VALUES ('761', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-05 18:44:01');
INSERT INTO `log_akses` VALUES ('762', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-05 18:44:41');
INSERT INTO `log_akses` VALUES ('763', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-05 18:44:41');
INSERT INTO `log_akses` VALUES ('764', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-05 18:47:58');
INSERT INTO `log_akses` VALUES ('765', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-05 18:48:21');
INSERT INTO `log_akses` VALUES ('766', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-05 18:49:54');
INSERT INTO `log_akses` VALUES ('767', 'delete from berkas_v2 where berkasid =17', '2', '2018-09-05 18:50:14');
INSERT INTO `log_akses` VALUES ('768', 'select path from berkas_v2 where berkasid = 16 ', '2', '2018-09-05 18:50:17');
INSERT INTO `log_akses` VALUES ('769', 'select path from berkas_v2 where berkasid = 16 ', '2', '2018-09-05 18:50:21');
INSERT INTO `log_akses` VALUES ('770', 'select path from berkas_v2 where berkasid = 15 ', '2', '2018-09-05 18:50:28');
INSERT INTO `log_akses` VALUES ('771', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-05 18:56:24');
INSERT INTO `log_akses` VALUES ('772', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-05 18:57:22');
INSERT INTO `log_akses` VALUES ('773', 'insert into berkas_v2(parrentberkasid,  kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tp', '2', '2018-09-05 18:57:40');
INSERT INTO `log_akses` VALUES ('774', 'delete from berkas_v2 where berkasid =20', '2', '2018-09-05 18:57:42');
INSERT INTO `log_akses` VALUES ('775', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-05 18:58:16');
INSERT INTO `log_akses` VALUES ('776', 'delete from berkas_v2 where berkasid =21', '2', '2018-09-05 18:58:22');
INSERT INTO `log_akses` VALUES ('777', 'delete from berkas_v2 where berkasid =19', '2', '2018-09-05 18:58:26');
INSERT INTO `log_akses` VALUES ('778', 'update berkas_v2 set clid = 8,  roleid = uk.1.1, uraian = perencanaan anggaran, kurunwaktu = 2001, j', '2', '2018-09-05 18:59:04');
INSERT INTO `log_akses` VALUES ('779', 'update berkas_v2 set clid = 9,  roleid = uk.1.1, uraian = pembiayaaan, kurunwaktu = 1908, jumlah = 0', '2', '2018-09-05 18:59:14');
INSERT INTO `log_akses` VALUES ('780', 'delete from berkas_v2 where berkasid =18', '2', '2018-09-05 18:59:20');
INSERT INTO `log_akses` VALUES ('781', 'select path from berkas_v2 where berkasid = 15 ', '2', '2018-09-05 18:59:24');
INSERT INTO `log_akses` VALUES ('782', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-05 19:01:52');
INSERT INTO `log_akses` VALUES ('783', 'delete from berkas_v2 where berkasid =22', '2', '2018-09-05 19:01:55');
INSERT INTO `log_akses` VALUES ('784', 'insert into berkas_v2( kodereg, nomor, clid, roleid, uraian, kurunwaktu, jumlah, tpid,\r\n            ', '2', '2018-09-05 19:02:16');
INSERT INTO `log_akses` VALUES ('785', 'insert into dokumen_v2 (dokumenid, berkasid, kodereg, clid, jenisid, tgl_dok, nomor_dok, uraian, jum', '2', '2018-09-05 19:02:35');
INSERT INTO `log_akses` VALUES ('786', 'insert into filesdigital_v2(dokumenid, kodereg, filename, filesize, enskripfile, foldername, tglreg)', '2', '2018-09-05 19:02:35');
INSERT INTO `log_akses` VALUES ('787', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '2', '2018-09-05 19:04:33');
INSERT INTO `log_akses` VALUES ('788', 'update peminjaman set  nip = 5562,  nama = agus,  uraian = test,  roleid_to = uk.21.1,  arsippinjam ', '2', '2018-09-05 19:04:44');
INSERT INTO `log_akses` VALUES ('789', 'delete from peminjaman where peminjamanid =9', '2', '2018-09-05 19:06:40');
INSERT INTO `log_akses` VALUES ('790', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '2', '2018-09-05 19:08:32');
INSERT INTO `log_akses` VALUES ('791', 'delete from peminjaman where peminjamanid =9', '2', '2018-09-05 19:08:39');
INSERT INTO `log_akses` VALUES ('792', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '2', '2018-09-05 19:33:36');
INSERT INTO `log_akses` VALUES ('793', 'delete from peminjaman where peminjamanid =9', '2', '2018-09-05 19:34:30');
INSERT INTO `log_akses` VALUES ('794', 'insert into peminjaman (peminjamanid, tglpinjam, nip, nama, uraian, roleid_from, roleid_to, statuspi', '2', '2018-09-05 19:34:55');

-- ----------------------------
-- Table structure for log_archive
-- ----------------------------
DROP TABLE IF EXISTS `log_archive`;
CREATE TABLE `log_archive` (
  `LogArchiveId` int(11) NOT NULL AUTO_INCREMENT,
  `LogDok` text,
  `PeopleId` int(11) DEFAULT NULL,
  `LogDate` timestamp NULL DEFAULT NULL,
  `RoleId` varchar(15) DEFAULT NULL,
  `Kode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LogArchiveId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of log_archive
-- ----------------------------
INSERT INTO `log_archive` VALUES ('1', '../Upload_Files/F_372634455240635/st_sainprof-32414/pr_6333643.pdf', '6', '2018-09-05 09:55:12', 'UK.21.1', 'SainProof_359248622926395');
INSERT INTO `log_archive` VALUES ('2', '../Upload_Files/F_372634455240635/st_sainprof-32414/pr_6333643.pdf', '6', '2018-09-05 09:55:12', 'UK.21.1', null);
INSERT INTO `log_archive` VALUES ('3', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 10:45:55', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('4', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 10:46:27', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('5', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 10:46:43', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('6', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 10:47:05', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('7', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 10:48:44', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('8', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 10:48:44', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('9', '../Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 10:48:50', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('10', 'Upload_Files/F_417364544434314/vosdm_002/bukti daftar seminar(1).jpg', '4', '2018-09-05 12:04:06', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('11', 'Upload_Files/F_417364544434314/vosdm_002/bukti daftar seminar(1).jpg', '4', '2018-09-05 12:04:06', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('12', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 12:04:18', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('13', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 12:04:18', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('14', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 18:14:14', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('15', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 18:14:14', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('16', '../Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 18:14:18', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('17', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 18:17:20', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('18', 'Upload_Files/F_417364544434314/vosdm_001/bukti daftar seminar.jpg', '4', '2018-09-05 18:17:20', 'UK.10.2.1.1.1', null);
INSERT INTO `log_archive` VALUES ('19', 'Upload_Files/F_634994722420448/vsetkol_001/pr_6229453.pdf', '0', '2018-09-05 18:45:57', '', null);
INSERT INTO `log_archive` VALUES ('20', 'Upload_Files/F_634994722420448/vsetkol_001/pr_6229453.pdf', '0', '2018-09-05 18:47:09', '', null);
INSERT INTO `log_archive` VALUES ('21', 'Upload_Files/F_634994722420448/vsetkol_001/pr_6229453.pdf', '0', '2018-09-05 18:47:09', '', null);
INSERT INTO `log_archive` VALUES ('22', '../Upload_Files/F_634994722420448/vsetkol_001/pr_6229453.pdf', '2', '2018-09-05 18:47:15', 'UK.1.1', null);

-- ----------------------------
-- Table structure for master_detailproduk
-- ----------------------------
DROP TABLE IF EXISTS `master_detailproduk`;
CREATE TABLE `master_detailproduk` (
  `DetailProdukId` int(11) NOT NULL AUTO_INCREMENT,
  `KatProdukId` int(11) DEFAULT NULL,
  `JProdukId` int(11) DEFAULT NULL,
  `DetailProdukName` varchar(150) DEFAULT NULL,
  `StatusAct` varchar(2) DEFAULT NULL,
  `RoleId` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`DetailProdukId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of master_detailproduk
-- ----------------------------
INSERT INTO `master_detailproduk` VALUES ('1', '1', '9', 'Buku Tanah', '1', 'UK.1.3.3.1');
INSERT INTO `master_detailproduk` VALUES ('3', '1', '9', 'PPAT', '1', 'UK.1.3.3.1');
INSERT INTO `master_detailproduk` VALUES ('4', '1', '1', 'Rp. 6000', '1', 'UK.1.3.3.1');
INSERT INTO `master_detailproduk` VALUES ('5', '1', '1', 'Rp. 3000', '1', 'UK.1.3.3.1');
INSERT INTO `master_detailproduk` VALUES ('6', '5', '10', 'Uang Kertas', '1', 'UK.1.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('7', '5', '10', 'Uang Logam', '1', 'UK.1.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('8', '5', '10', 'Kertas Bermeterai', '1', 'UK.1.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('9', '5', '11', 'Meterai', '1', 'UK.1.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('10', '5', '11', 'Dokumen Pertanahan', '1', 'UK.1.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('11', '8', '13', '4 halaman', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('12', '8', '13', '2 halaman', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('13', '8', '14', 'Rp 3000', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('14', '8', '14', 'Rp 6000', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('15', '8', '15', 'Perwakilan', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('16', '8', '15', 'Exit Permit Only', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('17', '8', '15', 'On Arrival', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('18', '8', '16', 'Biasa', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('19', '8', '16', 'e-Paspor', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('20', '8', '16', 'Dinas & Diplomatik', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('21', '8', '17', 'Pecahan Y', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('22', '8', '17', 'Pecahan X', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('23', '8', '17', 'Pecahan W', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('24', '8', '17', 'Pecahan V', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('25', '8', '17', 'Pecahan T', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('26', '8', '17', 'Pecahan U', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('27', '8', '17', 'Pecahan S', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('28', '8', '19', 'BPN', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('29', '8', '19', 'PPAT', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('30', '8', '18', 'Pecahan S', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('31', '8', '18', 'Pecahan O', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('32', '8', '18', 'Pecahan P', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('33', '8', '18', 'Pecahan Q', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('34', '8', '18', 'Pecahan R', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('35', '9', '20', 'Cek', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('36', '9', '20', 'Giro', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('37', '9', '20', 'Buku Tabungan', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('38', '9', '21', 'Full sheet', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('39', '9', '21', 'Mini sheet', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('40', '9', '21', 'Souvener sheet', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('41', '9', '21', 'Prisma ', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('42', '9', '22', 'Lencana', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('43', '9', '22', 'Plakat', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('44', '10', '24', 'Rs 500', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('45', '10', '24', 'Rs 1000', '1', 'UK.2.3.2');
INSERT INTO `master_detailproduk` VALUES ('46', '12', '27', 'Rp.100.000', '1', 'UK.2.1.1');
INSERT INTO `master_detailproduk` VALUES ('47', '13', '31', 'FS,MS,SS,Prisma', '1', 'UK.2.1.1');
INSERT INTO `master_detailproduk` VALUES ('48', '14', '28', 'Rs 500', '1', 'UK.2.1.1');
INSERT INTO `master_detailproduk` VALUES ('49', '12', '30', 'Diplomatik', '1', 'UK.2.1.1');
INSERT INTO `master_detailproduk` VALUES ('51', '12', '30', 'Dinas', '1', 'UK.2.1.1');
INSERT INTO `master_detailproduk` VALUES ('52', '13', '33', 'Cek & Giro', '1', 'UK.2.1.1');
INSERT INTO `master_detailproduk` VALUES ('54', '19', '37', 'Biasa', '1', 'UK.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('57', '19', '35', 'Ukuran A4', '1', 'UK.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('64', '22', '51', 'TE 2016', '1', 'UK.21.1');
INSERT INTO `master_detailproduk` VALUES ('65', '22', '57', 'PC 2019', '1', 'UK.21.1');
INSERT INTO `master_detailproduk` VALUES ('66', '23', '56', 'Cek & Giro Bank Bengkulu', '1', 'UK.21.1');
INSERT INTO `master_detailproduk` VALUES ('67', '20', '44', 'Cek ', '1', 'UK.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('68', '20', '44', 'Giro', '1', 'UK.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('69', '20', '47', 'Izin Mempekerjakan Tenaga Kerja Asing (IMTA)', '1', 'UK.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('70', '23', '58', 'Ijazah dan Transkrip Trisakti', '1', 'UK.21.1');
INSERT INTO `master_detailproduk` VALUES ('71', '21', '66', 'Nepal', '1', 'UK.3.1.1');
INSERT INTO `master_detailproduk` VALUES ('75', '23', '55', 'Prangko Asian Games', '1', 'UK.21.1');
INSERT INTO `master_detailproduk` VALUES ('77', '19', '42', 'Visa On Board', '1', 'UK.3.1.1');

-- ----------------------------
-- Table structure for master_jnaskah
-- ----------------------------
DROP TABLE IF EXISTS `master_jnaskah`;
CREATE TABLE `master_jnaskah` (
  `JenisId` int(11) NOT NULL AUTO_INCREMENT,
  `JenisNaskah` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`JenisId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of master_jnaskah
-- ----------------------------
INSERT INTO `master_jnaskah` VALUES ('1', 'Surat Perintah');
INSERT INTO `master_jnaskah` VALUES ('2', 'Naskah Dinas');
INSERT INTO `master_jnaskah` VALUES ('3', 'Undangan');
INSERT INTO `master_jnaskah` VALUES ('4', 'Surat Perjalanan Dinas');
INSERT INTO `master_jnaskah` VALUES ('5', 'Berita Acara');
INSERT INTO `master_jnaskah` VALUES ('6', 'Sertifikat');
INSERT INTO `master_jnaskah` VALUES ('7', 'Hasil Pemeriksaan Lab');
INSERT INTO `master_jnaskah` VALUES ('8', 'Minutes of Meeting');

-- ----------------------------
-- Table structure for master_jproduk
-- ----------------------------
DROP TABLE IF EXISTS `master_jproduk`;
CREATE TABLE `master_jproduk` (
  `JProdukId` int(11) NOT NULL AUTO_INCREMENT,
  `KatProdukId` int(11) DEFAULT NULL,
  `JProdukName` varchar(25) DEFAULT NULL,
  `StatusAct` varchar(2) DEFAULT NULL,
  `RoleId` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`JProdukId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of master_jproduk
-- ----------------------------
INSERT INTO `master_jproduk` VALUES ('1', '1', 'Materai', '1', 'UK.1.3.3.1');
INSERT INTO `master_jproduk` VALUES ('2', '1', 'Passpor', '1', 'UK.1.3.3.1');
INSERT INTO `master_jproduk` VALUES ('3', '1', 'Pita Cukai', '1', 'UK.1.3.3.1');
INSERT INTO `master_jproduk` VALUES ('4', '1', 'Uang Kertas', '1', 'UK.1.3.3.1');
INSERT INTO `master_jproduk` VALUES ('5', '1', 'Uang Logam', '1', 'UK.1.3.3.1');
INSERT INTO `master_jproduk` VALUES ('6', '1', 'Visa Republik Indonesia', '1', 'UK.1.3.3.1');
INSERT INTO `master_jproduk` VALUES ('8', '2', 'Buku', '1', 'UK.1.3.3.1');
INSERT INTO `master_jproduk` VALUES ('9', '1', 'Dokumen BPN', '1', 'UK.1.3.3.1');
INSERT INTO `master_jproduk` VALUES ('10', '5', 'Uang RI', '1', 'UK.1.3.1.1');
INSERT INTO `master_jproduk` VALUES ('11', '5', 'Web & Sheet', '1', 'UK.1.3.1.1');
INSERT INTO `master_jproduk` VALUES ('12', '5', 'Paspor dan Buku', '1', 'UK.1.3.1.1');
INSERT INTO `master_jproduk` VALUES ('13', '8', 'Kertas Bermeterai', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('14', '8', 'Meterai Tempel', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('15', '8', 'Visa RI', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('16', '8', 'Paspor RI', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('17', '8', 'Uang Kertas', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('18', '8', 'Uang Logam', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('19', '8', 'Dokumen Pertanahan', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('20', '9', 'Dokumen Perbankan', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('21', '9', 'Perangko', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('22', '9', 'Logam Non Uang', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('23', '9', 'Dokumen Lembaga Pendidika', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('24', '10', 'Uang Nepal', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('25', '10', 'Pita Cukai Nepal', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('26', '10', 'Uang Kertas Srilanka', '1', 'UK.2.3.2');
INSERT INTO `master_jproduk` VALUES ('27', '12', 'Uang RI', '1', 'UK.2.1.1');
INSERT INTO `master_jproduk` VALUES ('28', '14', 'Uang Nepal', '1', 'UK.2.1.1');
INSERT INTO `master_jproduk` VALUES ('29', '14', 'Prangko Nepal', '1', 'UK.2.1.1');
INSERT INTO `master_jproduk` VALUES ('30', '12', 'Paspor RI', '1', 'UK.2.1.1');
INSERT INTO `master_jproduk` VALUES ('31', '13', 'Prangko RI', '1', 'UK.2.1.1');
INSERT INTO `master_jproduk` VALUES ('32', '13', 'Ijazah & Transkrip', '1', 'UK.2.1.1');
INSERT INTO `master_jproduk` VALUES ('33', '13', 'Perbankan', '1', 'UK.2.1.1');
INSERT INTO `master_jproduk` VALUES ('34', '3', 'Ijasah PTNS', '1', 'UK.1.3.3.1');
INSERT INTO `master_jproduk` VALUES ('35', '19', 'Kertas Bermeterai', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('36', '19', 'Meterai Tempel', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('37', '19', 'Paspor', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('38', '19', 'Pita Cukai', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('39', '19', 'Sertifikat Tanah', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('40', '19', 'Uang Kertas', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('42', '19', 'Visa RI', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('43', '19', 'Uang Logam', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('44', '20', 'Dokumen Perbankan', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('45', '20', 'Ijazah', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('46', '20', 'Transkrip', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('47', '20', 'Sertifikat', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('48', '20', 'Paspor dan Buku', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('49', '21', 'Paspor dan Buku', '1', 'UK.3.1.1');
INSERT INTO `master_jproduk` VALUES ('51', '22', 'Uang RI', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('52', '22', 'Paspor RI', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('53', '22', 'Meterai', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('54', '22', 'Visa RI', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('55', '23', 'Prangko RI', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('56', '23', 'Perbankan', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('57', '22', 'Pita Cukai RI', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('58', '23', 'Ijazah & Transkrip', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('59', '23', 'Sertipikat', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('60', '23', 'Saham', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('61', '23', 'Voucher', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('62', '23', 'Kementerian Luar Negeri', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('63', '23', 'Logo, Sticker, Kartu Nama', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('64', '22', 'BPN', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('65', '23', 'Medali, Lecana, Plaqet', '1', 'UK.21.1');
INSERT INTO `master_jproduk` VALUES ('66', '21', 'Pita Cukai', '1', 'UK.3.1.1');

-- ----------------------------
-- Table structure for master_katproduk
-- ----------------------------
DROP TABLE IF EXISTS `master_katproduk`;
CREATE TABLE `master_katproduk` (
  `KatProdukId` int(11) NOT NULL AUTO_INCREMENT,
  `KatProdukName` varchar(30) DEFAULT NULL,
  `StatusAct` varchar(2) DEFAULT NULL,
  `RoleId` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`KatProdukId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of master_katproduk
-- ----------------------------
INSERT INTO `master_katproduk` VALUES ('1', 'Captive', '1', 'UK.1.3.3.1');
INSERT INTO `master_katproduk` VALUES ('2', 'Non-Captive', '1', 'UK.1.3.3.1');
INSERT INTO `master_katproduk` VALUES ('3', 'Produk LN', '1', 'UK.1.3.3.1');
INSERT INTO `master_katproduk` VALUES ('5', 'Captive', '1', 'UK.1.3.1.1');
INSERT INTO `master_katproduk` VALUES ('6', 'Non-Captive', '1', 'UK.1.3.1.1');
INSERT INTO `master_katproduk` VALUES ('7', 'Produk LN', '1', 'UK.1.3.1.1');
INSERT INTO `master_katproduk` VALUES ('8', 'Captive', '1', 'UK.2.3.2');
INSERT INTO `master_katproduk` VALUES ('9', 'Non Captive', '1', 'UK.2.3.2');
INSERT INTO `master_katproduk` VALUES ('10', 'Luar Negeri', '1', 'UK.2.3.2');
INSERT INTO `master_katproduk` VALUES ('11', 'gayem', '1', 'UK.2.3.2');
INSERT INTO `master_katproduk` VALUES ('12', 'Captive', '1', 'UK.2.1.1');
INSERT INTO `master_katproduk` VALUES ('13', 'Non-Captive', '1', 'UK.2.1.1');
INSERT INTO `master_katproduk` VALUES ('14', 'Produk LN', '1', 'UK.2.1.1');
INSERT INTO `master_katproduk` VALUES ('15', 'gares', '1', 'UK.2.3.2.1');
INSERT INTO `master_katproduk` VALUES ('16', 'Ga jelas', '1', 'UK.2.3');
INSERT INTO `master_katproduk` VALUES ('17', 'Captive', '1', 'UK.2.3');
INSERT INTO `master_katproduk` VALUES ('18', 'Captive', '1', 'UK.1.1.3.1');
INSERT INTO `master_katproduk` VALUES ('19', 'Captive', '1', 'UK.3.1.1');
INSERT INTO `master_katproduk` VALUES ('20', 'Non Captive', '1', 'UK.3.1.1');
INSERT INTO `master_katproduk` VALUES ('21', 'Luar Negeri', '1', 'UK.3.1.1');
INSERT INTO `master_katproduk` VALUES ('22', 'Captive', '1', 'UK.21.1');
INSERT INTO `master_katproduk` VALUES ('23', 'Non Captive', '1', 'UK.21.1');
INSERT INTO `master_katproduk` VALUES ('24', 'Luar Negeri', '1', 'UK.21.1');

-- ----------------------------
-- Table structure for master_klaskeamanan
-- ----------------------------
DROP TABLE IF EXISTS `master_klaskeamanan`;
CREATE TABLE `master_klaskeamanan` (
  `ClKeamanan` int(8) NOT NULL AUTO_INCREMENT,
  `KeamananName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ClKeamanan`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of master_klaskeamanan
-- ----------------------------
INSERT INTO `master_klaskeamanan` VALUES ('1', 'Biasa/Umum');
INSERT INTO `master_klaskeamanan` VALUES ('2', 'Terbatas');
INSERT INTO `master_klaskeamanan` VALUES ('3', 'Rahasia');
INSERT INTO `master_klaskeamanan` VALUES ('4', 'Sangat Rahasia');

-- ----------------------------
-- Table structure for master_kodekerja
-- ----------------------------
DROP TABLE IF EXISTS `master_kodekerja`;
CREATE TABLE `master_kodekerja` (
  `KodeId` int(11) NOT NULL AUTO_INCREMENT,
  `DetailProdukId` int(11) DEFAULT NULL,
  `Kode` varchar(15) DEFAULT NULL,
  `Uraian` varchar(255) DEFAULT NULL,
  `StatusAct` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`KodeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of master_kodekerja
-- ----------------------------
INSERT INTO `master_kodekerja` VALUES ('13', '64', '001', 'NKRI', '1');
INSERT INTO `master_kodekerja` VALUES ('14', '65', '004', 'Pita Cukai 2019', '1');
INSERT INTO `master_kodekerja` VALUES ('15', '66', '008.13.18', 'Bank Bengkulu 2018', '1');
INSERT INTO `master_kodekerja` VALUES ('16', '70', '015.03,18', 'Blanko IJazah S2 Trisakti', '1');

-- ----------------------------
-- Table structure for master_kondisi
-- ----------------------------
DROP TABLE IF EXISTS `master_kondisi`;
CREATE TABLE `master_kondisi` (
  `KondisiId` int(15) NOT NULL,
  `KondisiName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`KondisiId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of master_kondisi
-- ----------------------------
INSERT INTO `master_kondisi` VALUES ('1', 'Baik');
INSERT INTO `master_kondisi` VALUES ('2', 'Rapuh');

-- ----------------------------
-- Table structure for master_media
-- ----------------------------
DROP TABLE IF EXISTS `master_media`;
CREATE TABLE `master_media` (
  `MediaId` int(11) NOT NULL,
  `MediaName` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`MediaId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of master_media
-- ----------------------------
INSERT INTO `master_media` VALUES ('1', 'Kertas');
INSERT INTO `master_media` VALUES ('3', 'Video');
INSERT INTO `master_media` VALUES ('6', 'Foto');

-- ----------------------------
-- Table structure for master_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `master_pegawai`;
CREATE TABLE `master_pegawai` (
  `IdPeg` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NP` varchar(15) DEFAULT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdPeg`)
) ENGINE=InnoDB AUTO_INCREMENT=2867 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_pegawai
-- ----------------------------
INSERT INTO `master_pegawai` VALUES ('1', '5556', 'YADI SUDRAJAT');
INSERT INTO `master_pegawai` VALUES ('2', '5557', 'PURWADI');
INSERT INTO `master_pegawai` VALUES ('3', '5560', 'TATA SUHARTA');
INSERT INTO `master_pegawai` VALUES ('4', '5563', 'SITI YUSTI. Ny.');
INSERT INTO `master_pegawai` VALUES ('5', '5564', 'OMO SURYANA');
INSERT INTO `master_pegawai` VALUES ('6', '5567', 'SARDI');
INSERT INTO `master_pegawai` VALUES ('7', '5568', 'M.MAHRIP');
INSERT INTO `master_pegawai` VALUES ('8', '5569', 'SLAMET SUKRISNO');
INSERT INTO `master_pegawai` VALUES ('9', '5570', 'HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('10', '5571', 'IIN');
INSERT INTO `master_pegawai` VALUES ('11', '5573', 'SURONO');
INSERT INTO `master_pegawai` VALUES ('12', '5574', 'EDY MULYADI, MM. DRS');
INSERT INTO `master_pegawai` VALUES ('13', '5576', 'GITA D.WINARTI, SH');
INSERT INTO `master_pegawai` VALUES ('14', '5578', 'SILVA ZEDTIN. Ny');
INSERT INTO `master_pegawai` VALUES ('15', '5579', 'S.SUHARTINI. Ny');
INSERT INTO `master_pegawai` VALUES ('16', '5580', 'SETIADI UTOMO');
INSERT INTO `master_pegawai` VALUES ('17', '5581', 'HARRY SUMANTRI');
INSERT INTO `master_pegawai` VALUES ('18', '5582', 'RAMELIH');
INSERT INTO `master_pegawai` VALUES ('19', '5583', 'SUHARNO');
INSERT INTO `master_pegawai` VALUES ('20', '5584', 'A.GATOT PURWOKO');
INSERT INTO `master_pegawai` VALUES ('21', '5585', 'SUMARYONO');
INSERT INTO `master_pegawai` VALUES ('22', '5586', 'WAHONO');
INSERT INTO `master_pegawai` VALUES ('23', '5587', 'DWI MARYANTO');
INSERT INTO `master_pegawai` VALUES ('24', '5588', 'EFFENDI');
INSERT INTO `master_pegawai` VALUES ('25', '5589', 'NANDANG, ST');
INSERT INTO `master_pegawai` VALUES ('26', '5590', 'MAMAN SUDARMAWAN');
INSERT INTO `master_pegawai` VALUES ('27', '4889', 'TAUFIK HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('28', '4911', 'AMANG RAHMAN, S.PD');
INSERT INTO `master_pegawai` VALUES ('29', '4942', 'SUTRISNO');
INSERT INTO `master_pegawai` VALUES ('30', '5033', 'MUH SOFYAN RAMLI, S.PD.');
INSERT INTO `master_pegawai` VALUES ('31', '5034', 'SAGINO');
INSERT INTO `master_pegawai` VALUES ('32', '5120', 'SRI SUSILOWATI.Ny');
INSERT INTO `master_pegawai` VALUES ('33', '5134', 'EDY YUSUF');
INSERT INTO `master_pegawai` VALUES ('34', '5247', 'N.P. PRADIPTA T');
INSERT INTO `master_pegawai` VALUES ('35', '5256', 'MAHDUM');
INSERT INTO `master_pegawai` VALUES ('36', '5258', 'ACHMAD HUSAINI');
INSERT INTO `master_pegawai` VALUES ('37', '5285', 'SYAHRIL, SH, M.Si');
INSERT INTO `master_pegawai` VALUES ('38', '5299', 'BAMBANG SUPRIYONO');
INSERT INTO `master_pegawai` VALUES ('39', '5328', 'DWIYANI H. SE. Ny');
INSERT INTO `master_pegawai` VALUES ('40', '5329', 'SRI ASTUTI, S.PD. NY');
INSERT INTO `master_pegawai` VALUES ('41', '5330', 'TRISNAWATI. Ny');
INSERT INTO `master_pegawai` VALUES ('42', '5335', 'ACHMAD ZAINI');
INSERT INTO `master_pegawai` VALUES ('43', '5337', 'SUGIMAN');
INSERT INTO `master_pegawai` VALUES ('44', '5338', 'ROCHMANI');
INSERT INTO `master_pegawai` VALUES ('45', '5343', 'SARWANTO');
INSERT INTO `master_pegawai` VALUES ('46', '5348', 'BACHTIAR M.');
INSERT INTO `master_pegawai` VALUES ('47', '5357', 'WIWIEK D.D. Ny');
INSERT INTO `master_pegawai` VALUES ('48', '5358', 'ANNA MARDIANA, S.PD. NY');
INSERT INTO `master_pegawai` VALUES ('49', '5359', 'SUKIYO');
INSERT INTO `master_pegawai` VALUES ('50', '5361', 'KASIYO');
INSERT INTO `master_pegawai` VALUES ('51', '5363', 'ANANG KUSPIANTO');
INSERT INTO `master_pegawai` VALUES ('52', '5364', 'EMAN SUHERMAN, S.PD');
INSERT INTO `master_pegawai` VALUES ('53', '5367', 'AGUNG RACHMADI.SE');
INSERT INTO `master_pegawai` VALUES ('54', '5371', 'R. ATELENG M.');
INSERT INTO `master_pegawai` VALUES ('55', '5374', 'SUYITNO');
INSERT INTO `master_pegawai` VALUES ('56', '5377', 'ADRIANTO YUNIADI');
INSERT INTO `master_pegawai` VALUES ('57', '5381', 'SURYADI ANWAR, SE');
INSERT INTO `master_pegawai` VALUES ('58', '5382', 'VERA EFFELYN, ST .NY');
INSERT INTO `master_pegawai` VALUES ('59', '5386', 'POSY HARYANTO, S.PD');
INSERT INTO `master_pegawai` VALUES ('60', '5387', 'ISMAYANTO EKO P, SE.');
INSERT INTO `master_pegawai` VALUES ('61', '5389', 'PUJI HARIYANTO, S.E.');
INSERT INTO `master_pegawai` VALUES ('62', '5391', 'SUYANTO');
INSERT INTO `master_pegawai` VALUES ('63', '5394', 'GUNAWAN BIANTORO');
INSERT INTO `master_pegawai` VALUES ('64', '5395', 'DEDI SUPRIATNA');
INSERT INTO `master_pegawai` VALUES ('65', '5396', 'MAKMUR HARTONO');
INSERT INTO `master_pegawai` VALUES ('66', '5398', 'SRI PUJI  L. Ny');
INSERT INTO `master_pegawai` VALUES ('67', '5401', 'SUKINO. SE');
INSERT INTO `master_pegawai` VALUES ('68', '5402', 'EKO SUGIYANTO, SE');
INSERT INTO `master_pegawai` VALUES ('69', '5406', 'SUPRIYADI');
INSERT INTO `master_pegawai` VALUES ('70', '5409', 'SUDIARTO');
INSERT INTO `master_pegawai` VALUES ('71', '5420', 'MOHAMAD NOOR');
INSERT INTO `master_pegawai` VALUES ('72', '5421', 'MARYADI');
INSERT INTO `master_pegawai` VALUES ('73', '5423', 'AHMAD KOSASIH');
INSERT INTO `master_pegawai` VALUES ('74', '5426', 'RUDI SEPTIADI');
INSERT INTO `master_pegawai` VALUES ('75', '5427', 'DWIJO SUNARNO');
INSERT INTO `master_pegawai` VALUES ('76', '5430', 'RAFLIS EFI');
INSERT INTO `master_pegawai` VALUES ('77', '5431', 'SUTAR MUJIONO');
INSERT INTO `master_pegawai` VALUES ('78', '5433', 'SUHARTO, S.PD');
INSERT INTO `master_pegawai` VALUES ('79', '5434', 'YUDHI PRASETYO');
INSERT INTO `master_pegawai` VALUES ('80', '5435', 'AGUS TARMONO, ST');
INSERT INTO `master_pegawai` VALUES ('81', '5441', 'WINARTO, SE');
INSERT INTO `master_pegawai` VALUES ('82', '5442', 'MUSLIH');
INSERT INTO `master_pegawai` VALUES ('83', '5443', 'SAGIMAN');
INSERT INTO `master_pegawai` VALUES ('84', '5448', 'SAMSI MULYANA');
INSERT INTO `master_pegawai` VALUES ('85', '5450', 'MUHAMMAD WAHYU');
INSERT INTO `master_pegawai` VALUES ('86', '5454', 'SUGIANTO');
INSERT INTO `master_pegawai` VALUES ('87', '5463', 'SUSATYO ADI');
INSERT INTO `master_pegawai` VALUES ('88', '5475', 'MOHAMAD SOFYAN');
INSERT INTO `master_pegawai` VALUES ('89', '5484', 'JENAL MUSTOPA, A.MD');
INSERT INTO `master_pegawai` VALUES ('90', '5486', 'SUWANDI');
INSERT INTO `master_pegawai` VALUES ('91', '5490', 'SUYATMAN');
INSERT INTO `master_pegawai` VALUES ('92', '5492', 'SRI WAHYUNI, SE. NY');
INSERT INTO `master_pegawai` VALUES ('93', '5495', 'SRI WILUJENG. Ny');
INSERT INTO `master_pegawai` VALUES ('94', '5496', 'MUHIDIN');
INSERT INTO `master_pegawai` VALUES ('95', '5497', 'FERRY AZARIANTO');
INSERT INTO `master_pegawai` VALUES ('96', '5501', 'M.ZAINAL ABIDIN');
INSERT INTO `master_pegawai` VALUES ('97', '5502', 'SUKIYONO');
INSERT INTO `master_pegawai` VALUES ('98', '5503', 'SOIMAN, S.SOS');
INSERT INTO `master_pegawai` VALUES ('99', '5504', 'YULIUS CHRISTIAN');
INSERT INTO `master_pegawai` VALUES ('100', '5505', 'MUHAEMIN');
INSERT INTO `master_pegawai` VALUES ('101', '5507', 'RIZAL MUSTOFA');
INSERT INTO `master_pegawai` VALUES ('102', '5508', 'SUMARDI');
INSERT INTO `master_pegawai` VALUES ('103', '5509', 'DWI ASTUTI. Ny.');
INSERT INTO `master_pegawai` VALUES ('104', '5511', 'DAIL MULYONO');
INSERT INTO `master_pegawai` VALUES ('105', '5512', 'DELLASMI, SE. NY.');
INSERT INTO `master_pegawai` VALUES ('106', '5514', 'SHOFUROH. Ny');
INSERT INTO `master_pegawai` VALUES ('107', '5516', 'ROSTANI RUDIAWAN');
INSERT INTO `master_pegawai` VALUES ('108', '5518', 'DJOKO PAMUNGKAS');
INSERT INTO `master_pegawai` VALUES ('109', '5519', 'AGUS KHAIRI');
INSERT INTO `master_pegawai` VALUES ('110', '5523', 'TONI MARTONO, SE');
INSERT INTO `master_pegawai` VALUES ('111', '5524', 'AMBAR DWI WAHONO');
INSERT INTO `master_pegawai` VALUES ('112', '5525', 'URIP SURYATNO');
INSERT INTO `master_pegawai` VALUES ('113', '5526', 'DALIMIN');
INSERT INTO `master_pegawai` VALUES ('114', '5528', 'BELA SUNANDRIA');
INSERT INTO `master_pegawai` VALUES ('115', '5529', 'SURATNO');
INSERT INTO `master_pegawai` VALUES ('116', '5530', 'BAMBANG ISMANTO, SE');
INSERT INTO `master_pegawai` VALUES ('117', '5531', 'ALEX ERMINAUNG');
INSERT INTO `master_pegawai` VALUES ('118', '5533', 'TEGUH RIHTIONO');
INSERT INTO `master_pegawai` VALUES ('119', '5535', 'NUNGKO RAHARDJO');
INSERT INTO `master_pegawai` VALUES ('120', '5537', 'SURYADI');
INSERT INTO `master_pegawai` VALUES ('121', '5538', 'M.SAEFUDIN');
INSERT INTO `master_pegawai` VALUES ('122', '5540', 'SRI WENI . Ny.');
INSERT INTO `master_pegawai` VALUES ('123', '5543', 'HERRY SOBARI');
INSERT INTO `master_pegawai` VALUES ('124', '5545', 'SURONO bin PARMAN');
INSERT INTO `master_pegawai` VALUES ('125', '5546', 'MUJIRAN, S.PD.');
INSERT INTO `master_pegawai` VALUES ('126', '5548', 'SURYA DARMA');
INSERT INTO `master_pegawai` VALUES ('127', '5549', 'SRI KUSWORO');
INSERT INTO `master_pegawai` VALUES ('128', '5550', 'SUYATNO');
INSERT INTO `master_pegawai` VALUES ('129', '5552', 'S.BAHARIAWAN, ST');
INSERT INTO `master_pegawai` VALUES ('130', '5554', 'ABDUL ROSYID');
INSERT INTO `master_pegawai` VALUES ('131', '5555', 'AGUS BUDIARTONO');
INSERT INTO `master_pegawai` VALUES ('132', '5882', 'MATSANI');
INSERT INTO `master_pegawai` VALUES ('133', '5884', 'GITO');
INSERT INTO `master_pegawai` VALUES ('134', '5885', 'NURAEDI');
INSERT INTO `master_pegawai` VALUES ('135', '5886', 'SUHENDI');
INSERT INTO `master_pegawai` VALUES ('136', '5889', 'PARTINI. Ny');
INSERT INTO `master_pegawai` VALUES ('137', '5890', 'HANOM  W. NY');
INSERT INTO `master_pegawai` VALUES ('138', '5892', 'AGUS SUJONO');
INSERT INTO `master_pegawai` VALUES ('139', '5893', 'N.NURHAENI.  NY');
INSERT INTO `master_pegawai` VALUES ('140', '5895', 'ARIF RUSMAN');
INSERT INTO `master_pegawai` VALUES ('141', '5896', 'SUWARDOYO DWI P.');
INSERT INTO `master_pegawai` VALUES ('142', '5898', 'DISMAS CAHYONO AK, ST');
INSERT INTO `master_pegawai` VALUES ('143', '5900', 'PRIYONO');
INSERT INTO `master_pegawai` VALUES ('144', '5901', 'DENI AHYANI');
INSERT INTO `master_pegawai` VALUES ('145', '5902', 'ROCHMANI');
INSERT INTO `master_pegawai` VALUES ('146', '5903', 'SUDIYANTO');
INSERT INTO `master_pegawai` VALUES ('147', '5904', 'EDY SUNARTO, S.SOS');
INSERT INTO `master_pegawai` VALUES ('148', '5905', 'SUPRIONO, SE');
INSERT INTO `master_pegawai` VALUES ('149', '5908', 'KUSMAYADI');
INSERT INTO `master_pegawai` VALUES ('150', '5910', 'WIDADI SUWARNO, SE');
INSERT INTO `master_pegawai` VALUES ('151', '5911', 'JONI EKO  H.');
INSERT INTO `master_pegawai` VALUES ('152', '5912', 'BUDI SUPRIATNO');
INSERT INTO `master_pegawai` VALUES ('153', '5914', 'UMAR JAYA');
INSERT INTO `master_pegawai` VALUES ('154', '5915', 'MUHAMAD');
INSERT INTO `master_pegawai` VALUES ('155', '5917', 'AGUS SOBARI');
INSERT INTO `master_pegawai` VALUES ('156', '5918', 'MUNAWAR NUR');
INSERT INTO `master_pegawai` VALUES ('157', '5920', 'MOCH.NUR');
INSERT INTO `master_pegawai` VALUES ('158', '5921', 'ALI CHOTIB');
INSERT INTO `master_pegawai` VALUES ('159', '5591', 'SOFYAN');
INSERT INTO `master_pegawai` VALUES ('160', '5593', 'MUJI PRAYITNO');
INSERT INTO `master_pegawai` VALUES ('161', '5594', 'EFA TRIYATNA');
INSERT INTO `master_pegawai` VALUES ('162', '5596', 'BAMBANG GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('163', '5597', 'MARIMAN');
INSERT INTO `master_pegawai` VALUES ('164', '5598', 'CHAIRUL AKBAR');
INSERT INTO `master_pegawai` VALUES ('165', '5600', 'RUSLAN');
INSERT INTO `master_pegawai` VALUES ('166', '5602', 'HENDRA SUPRIYATNA, A.MD');
INSERT INTO `master_pegawai` VALUES ('167', '5603', 'RUDITO');
INSERT INTO `master_pegawai` VALUES ('168', '5605', 'SAEFUROHMAN');
INSERT INTO `master_pegawai` VALUES ('169', '5606', 'INDU SASONO MURTI');
INSERT INTO `master_pegawai` VALUES ('170', '5607', 'LAYUNG LINCAHWATI. NY, A.MD');
INSERT INTO `master_pegawai` VALUES ('171', '5609', 'SUPARTINI SE. Ny.');
INSERT INTO `master_pegawai` VALUES ('172', '5611', 'TUKINI. Ny');
INSERT INTO `master_pegawai` VALUES ('173', '5612', 'AGUS CAHYO P.');
INSERT INTO `master_pegawai` VALUES ('174', '5613', 'BAHRUDIN');
INSERT INTO `master_pegawai` VALUES ('175', '5615', 'BADRUN, SE');
INSERT INTO `master_pegawai` VALUES ('176', '5616', 'ARYANTO');
INSERT INTO `master_pegawai` VALUES ('177', '5617', 'HENDRI WUISAN');
INSERT INTO `master_pegawai` VALUES ('178', '5621', 'AGUS');
INSERT INTO `master_pegawai` VALUES ('179', '5622', 'KUNCORO TEGUH W.');
INSERT INTO `master_pegawai` VALUES ('180', '5623', 'MUJIYONO');
INSERT INTO `master_pegawai` VALUES ('181', '5624', 'TRI WAHYONO');
INSERT INTO `master_pegawai` VALUES ('182', '5625', 'WIDI HARYONO');
INSERT INTO `master_pegawai` VALUES ('183', '5626', 'TEDDY SOERIANTO');
INSERT INTO `master_pegawai` VALUES ('184', '5627', 'M.NURDJEHAN A.');
INSERT INTO `master_pegawai` VALUES ('185', '5628', 'BAMBANG SUKEDI');
INSERT INTO `master_pegawai` VALUES ('186', '5629', 'WANDA MULYADI, ST');
INSERT INTO `master_pegawai` VALUES ('187', '5631', 'HERYATNO');
INSERT INTO `master_pegawai` VALUES ('188', '5634', 'MARIYO, SE');
INSERT INTO `master_pegawai` VALUES ('189', '5635', 'SAIDI, SH');
INSERT INTO `master_pegawai` VALUES ('190', '5636', 'ANTONIUS HARTONO');
INSERT INTO `master_pegawai` VALUES ('191', '5638', 'SUKASNA');
INSERT INTO `master_pegawai` VALUES ('192', '5639', 'JOELIANTORO');
INSERT INTO `master_pegawai` VALUES ('193', '5640', 'AGUS SRIYANTO');
INSERT INTO `master_pegawai` VALUES ('194', '5642', 'PARYONO');
INSERT INTO `master_pegawai` VALUES ('195', '5643', 'FANAN ANGSONI');
INSERT INTO `master_pegawai` VALUES ('196', '5644', 'SUPRIYONO');
INSERT INTO `master_pegawai` VALUES ('197', '5646', 'BAMBANG SUGENG R.');
INSERT INTO `master_pegawai` VALUES ('198', '5648', 'MOHAMAD HARTIYONO, SE');
INSERT INTO `master_pegawai` VALUES ('199', '5649', 'HARIMAWAN');
INSERT INTO `master_pegawai` VALUES ('200', '5650', 'EKWAN MURTONO');
INSERT INTO `master_pegawai` VALUES ('201', '5651', 'IRAWAN');
INSERT INTO `master_pegawai` VALUES ('202', '5657', 'SETYO BUDIONO');
INSERT INTO `master_pegawai` VALUES ('203', '5658', 'MULYONO');
INSERT INTO `master_pegawai` VALUES ('204', '5659', 'SURYANA JAYA, S.T.');
INSERT INTO `master_pegawai` VALUES ('205', '5660', 'AGUS SUWARNO');
INSERT INTO `master_pegawai` VALUES ('206', '5661', 'HARJANA');
INSERT INTO `master_pegawai` VALUES ('207', '5662', 'TURISNO');
INSERT INTO `master_pegawai` VALUES ('208', '5663', 'SUGENG RIYADI');
INSERT INTO `master_pegawai` VALUES ('209', '5664', 'DJUWANA');
INSERT INTO `master_pegawai` VALUES ('210', '5665', 'RAKHMAT');
INSERT INTO `master_pegawai` VALUES ('211', '5666', 'TJATURONO SAMODRO');
INSERT INTO `master_pegawai` VALUES ('212', '5667', 'ADHI WICAKSONO');
INSERT INTO `master_pegawai` VALUES ('213', '5668', 'ALMANAN');
INSERT INTO `master_pegawai` VALUES ('214', '5670', 'MUHAMAD HUSNI');
INSERT INTO `master_pegawai` VALUES ('215', '5671', 'SUMINO');
INSERT INTO `master_pegawai` VALUES ('216', '5672', 'BAMBANG ISMANTO');
INSERT INTO `master_pegawai` VALUES ('217', '5673', 'MUNDO\'AP');
INSERT INTO `master_pegawai` VALUES ('218', '5674', 'SUYANTO');
INSERT INTO `master_pegawai` VALUES ('219', '5675', 'M.YASIN I.');
INSERT INTO `master_pegawai` VALUES ('220', '5676', 'PURWARIJADI');
INSERT INTO `master_pegawai` VALUES ('221', '5677', 'SUKARDI');
INSERT INTO `master_pegawai` VALUES ('222', '5678', 'SUKATNO');
INSERT INTO `master_pegawai` VALUES ('223', '5680', 'HARDIYANTO');
INSERT INTO `master_pegawai` VALUES ('224', '5681', 'SUPARMEDI');
INSERT INTO `master_pegawai` VALUES ('225', '5682', 'BUDI SETIONO');
INSERT INTO `master_pegawai` VALUES ('226', '5683', 'AGUS TRIYONO');
INSERT INTO `master_pegawai` VALUES ('227', '5686', 'YULIAWAN');
INSERT INTO `master_pegawai` VALUES ('228', '5689', 'SISWANTO');
INSERT INTO `master_pegawai` VALUES ('229', '5691', 'SUHARMADJI');
INSERT INTO `master_pegawai` VALUES ('230', '5692', 'WAHYUDI HERMOKO');
INSERT INTO `master_pegawai` VALUES ('231', '5693', 'JUMIYO');
INSERT INTO `master_pegawai` VALUES ('232', '5697', 'TUBAGUS YUSUF R.');
INSERT INTO `master_pegawai` VALUES ('233', '5698', 'BUDI HAWADISI, SE');
INSERT INTO `master_pegawai` VALUES ('234', '5704', 'MUHARYONO');
INSERT INTO `master_pegawai` VALUES ('235', '5707', 'ZAMROWI');
INSERT INTO `master_pegawai` VALUES ('236', '5712', 'SUMIYATI. Ny.');
INSERT INTO `master_pegawai` VALUES ('237', '5715', 'DJUDJU DJUWITA. NY, S.SOS');
INSERT INTO `master_pegawai` VALUES ('238', '5717', 'DEDI KUSWANDI');
INSERT INTO `master_pegawai` VALUES ('239', '5718', 'JIPAR MISWANDI, SE');
INSERT INTO `master_pegawai` VALUES ('240', '5719', 'IRMA DEWI, ST. NY');
INSERT INTO `master_pegawai` VALUES ('241', '5720', 'SAFRUDIN');
INSERT INTO `master_pegawai` VALUES ('242', '5722', 'KINO');
INSERT INTO `master_pegawai` VALUES ('243', '5723', 'SUMARDI');
INSERT INTO `master_pegawai` VALUES ('244', '5725', 'ISWATI. Ny');
INSERT INTO `master_pegawai` VALUES ('245', '5731', 'HARTONO   (A)');
INSERT INTO `master_pegawai` VALUES ('246', '5733', 'WIJIANTI. Ny');
INSERT INTO `master_pegawai` VALUES ('247', '5735', 'SUPARNO');
INSERT INTO `master_pegawai` VALUES ('248', '5737', 'SUMARNO');
INSERT INTO `master_pegawai` VALUES ('249', '5738', 'MEMEN LARASIANA');
INSERT INTO `master_pegawai` VALUES ('250', '5739', 'ADE SUMARYANI');
INSERT INTO `master_pegawai` VALUES ('251', '5741', 'ANI DWI.P  Ny');
INSERT INTO `master_pegawai` VALUES ('252', '5742', 'TATA ASTANTARA');
INSERT INTO `master_pegawai` VALUES ('253', '5743', 'TEDY SUPRIANDI');
INSERT INTO `master_pegawai` VALUES ('254', '5744', 'M.RAIS');
INSERT INTO `master_pegawai` VALUES ('255', '5745', 'R IDA BAGUS AW.SE');
INSERT INTO `master_pegawai` VALUES ('256', '5746', 'ARI WAHYUDI');
INSERT INTO `master_pegawai` VALUES ('257', '5747', 'DWI SUSANTO');
INSERT INTO `master_pegawai` VALUES ('258', '5750', 'MARSIAH. Ny');
INSERT INTO `master_pegawai` VALUES ('259', '5752', 'SURAHMAN, SE');
INSERT INTO `master_pegawai` VALUES ('260', '5759', 'MAEMUNAH Ny.');
INSERT INTO `master_pegawai` VALUES ('261', '5760', 'MARDIANA, S.PD . Ny');
INSERT INTO `master_pegawai` VALUES ('262', '5762', 'DYAH TJIPTORINI. NY');
INSERT INTO `master_pegawai` VALUES ('263', '5764', 'MASNO');
INSERT INTO `master_pegawai` VALUES ('264', '5765', 'MAMAN RAHMAN');
INSERT INTO `master_pegawai` VALUES ('265', '5766', 'KOMARUDIN');
INSERT INTO `master_pegawai` VALUES ('266', '5767', 'SRIYONO');
INSERT INTO `master_pegawai` VALUES ('267', '5769', 'SUYATNO');
INSERT INTO `master_pegawai` VALUES ('268', '5770', 'HERU SANTOSO');
INSERT INTO `master_pegawai` VALUES ('269', '5771', 'NUROCHMAN');
INSERT INTO `master_pegawai` VALUES ('270', '5772', 'MUJITO');
INSERT INTO `master_pegawai` VALUES ('271', '5773', 'A.YULIANTO');
INSERT INTO `master_pegawai` VALUES ('272', '5774', 'PONIJAN');
INSERT INTO `master_pegawai` VALUES ('273', '5775', 'SUNTOKO');
INSERT INTO `master_pegawai` VALUES ('274', '5776', 'KRISNA PITRAJAYA');
INSERT INTO `master_pegawai` VALUES ('275', '5777', 'EKO KUSBUNTORO');
INSERT INTO `master_pegawai` VALUES ('276', '5778', 'MULYONO  K.,S.PD.');
INSERT INTO `master_pegawai` VALUES ('277', '5779', 'NURSAN');
INSERT INTO `master_pegawai` VALUES ('278', '5781', 'SUPRAPTO');
INSERT INTO `master_pegawai` VALUES ('279', '5784', 'WARSITO. S.sos');
INSERT INTO `master_pegawai` VALUES ('280', '5787', 'DIAN SUSAPTO');
INSERT INTO `master_pegawai` VALUES ('281', '5788', 'KADIMAN');
INSERT INTO `master_pegawai` VALUES ('282', '5789', 'BAMBANG BUDIARSO');
INSERT INTO `master_pegawai` VALUES ('283', '5790', 'PURKONUDIN, ST');
INSERT INTO `master_pegawai` VALUES ('284', '5791', 'SUHANA HUTAGALUNG, ST');
INSERT INTO `master_pegawai` VALUES ('285', '5792', 'EDY PRABOWO');
INSERT INTO `master_pegawai` VALUES ('286', '5793', 'YATMAR SURADI A.');
INSERT INTO `master_pegawai` VALUES ('287', '5794', 'SUPRANOTO');
INSERT INTO `master_pegawai` VALUES ('288', '5795', 'FERY GAMAL. S.Kom');
INSERT INTO `master_pegawai` VALUES ('289', '5796', 'YUNAN ISKANDAR');
INSERT INTO `master_pegawai` VALUES ('290', '5797', 'AHMAD HIDAYAT, S.KOM');
INSERT INTO `master_pegawai` VALUES ('291', '5798', 'HERRI PRIYATNA');
INSERT INTO `master_pegawai` VALUES ('292', '5799', 'RD Y MUCHAROM.SE. MM');
INSERT INTO `master_pegawai` VALUES ('293', '5800', 'KAMID');
INSERT INTO `master_pegawai` VALUES ('294', '5801', 'ASEP HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('295', '5803', 'YUWONO, SE');
INSERT INTO `master_pegawai` VALUES ('296', '5804', 'IPAN TAUPAN');
INSERT INTO `master_pegawai` VALUES ('297', '5806', 'SAMSUL BACHRUN. SE');
INSERT INTO `master_pegawai` VALUES ('298', '5807', 'AAN RUHANDA');
INSERT INTO `master_pegawai` VALUES ('299', '5808', 'KUSUMANTO');
INSERT INTO `master_pegawai` VALUES ('300', '5809', 'EDDY PURSITO, MM');
INSERT INTO `master_pegawai` VALUES ('301', '5810', 'RASTA SASMITA');
INSERT INTO `master_pegawai` VALUES ('302', '5811', 'EDDI RIYANTO, S.KOM');
INSERT INTO `master_pegawai` VALUES ('303', '5816', 'PUJOKO');
INSERT INTO `master_pegawai` VALUES ('304', '5817', 'SUHANDI');
INSERT INTO `master_pegawai` VALUES ('305', '5819', 'SADI');
INSERT INTO `master_pegawai` VALUES ('306', '5820', 'HARJONO');
INSERT INTO `master_pegawai` VALUES ('307', '5821', 'MULYADI ARIEF');
INSERT INTO `master_pegawai` VALUES ('308', '5822', 'ANDY ROSSA.BSc');
INSERT INTO `master_pegawai` VALUES ('309', '5824', 'M.ABUBAKAR. BSc');
INSERT INTO `master_pegawai` VALUES ('310', '5826', 'ENDRA EFIANTO, ST');
INSERT INTO `master_pegawai` VALUES ('311', '5828', 'WIDODO');
INSERT INTO `master_pegawai` VALUES ('312', '5835', 'BEDJO SUSILO');
INSERT INTO `master_pegawai` VALUES ('313', '5837', 'BAMBANG SUHERLAN, A.MD');
INSERT INTO `master_pegawai` VALUES ('314', '5838', 'TRI SUSILO UTOMO');
INSERT INTO `master_pegawai` VALUES ('315', '5841', 'SUHAERI');
INSERT INTO `master_pegawai` VALUES ('316', '5842', 'HERMAN');
INSERT INTO `master_pegawai` VALUES ('317', '5844', 'SUKAMDI');
INSERT INTO `master_pegawai` VALUES ('318', '5845', 'SUWARDI');
INSERT INTO `master_pegawai` VALUES ('319', '5846', 'IDHAM CHOLID');
INSERT INTO `master_pegawai` VALUES ('320', '5847', 'WAWAN SRIYANTO');
INSERT INTO `master_pegawai` VALUES ('321', '5848', 'SUHARTO');
INSERT INTO `master_pegawai` VALUES ('322', '5850', 'UDIN');
INSERT INTO `master_pegawai` VALUES ('323', '5853', 'MOH.GOZALI');
INSERT INTO `master_pegawai` VALUES ('324', '5854', 'EKO BAYU PITOYO');
INSERT INTO `master_pegawai` VALUES ('325', '5858', 'BAMBANG IRIADI');
INSERT INTO `master_pegawai` VALUES ('326', '5859', 'WIDIATMOKO');
INSERT INTO `master_pegawai` VALUES ('327', '5864', 'SUPARNO  A');
INSERT INTO `master_pegawai` VALUES ('328', '5865', 'RINA DWISIWI L.Ny');
INSERT INTO `master_pegawai` VALUES ('329', '5867', 'SAGIMAN');
INSERT INTO `master_pegawai` VALUES ('330', '5868', 'TOTO SUPRIATO');
INSERT INTO `master_pegawai` VALUES ('331', '5869', 'DEDIH SUPRIADI');
INSERT INTO `master_pegawai` VALUES ('332', '5870', 'NA\'IH');
INSERT INTO `master_pegawai` VALUES ('333', '5871', 'MARZUKI');
INSERT INTO `master_pegawai` VALUES ('334', '5873', 'SUKIYATNI. Ny');
INSERT INTO `master_pegawai` VALUES ('335', '5875', 'MARIYAM. Ny.');
INSERT INTO `master_pegawai` VALUES ('336', '5876', 'IMAM RAHARDI');
INSERT INTO `master_pegawai` VALUES ('337', '5878', 'ASIYANTO');
INSERT INTO `master_pegawai` VALUES ('338', '5879', 'RENI RELAWATI. Ny');
INSERT INTO `master_pegawai` VALUES ('339', '5880', 'RAHAYUNINGSIH. NY');
INSERT INTO `master_pegawai` VALUES ('340', '5881', 'SUPARDI');
INSERT INTO `master_pegawai` VALUES ('341', '5957', 'PARDOMUAN S.');
INSERT INTO `master_pegawai` VALUES ('342', '5958', 'HARJONO  (B)');
INSERT INTO `master_pegawai` VALUES ('343', '5959', 'R.D.TRISNAWATI. NY');
INSERT INTO `master_pegawai` VALUES ('344', '5960', 'HAMZAH');
INSERT INTO `master_pegawai` VALUES ('345', '5961', 'NURYANI.  Ny');
INSERT INTO `master_pegawai` VALUES ('346', '5964', 'ZAENAL ARIFIN');
INSERT INTO `master_pegawai` VALUES ('347', '5965', 'RACHMAT AMINULLAH');
INSERT INTO `master_pegawai` VALUES ('348', '5966', 'SYARIFUDIN');
INSERT INTO `master_pegawai` VALUES ('349', '5967', 'ACHMAD NAWAWI');
INSERT INTO `master_pegawai` VALUES ('350', '5968', 'DEDDY HERMAWAN, A.MD.');
INSERT INTO `master_pegawai` VALUES ('351', '5969', 'KRISWANTO');
INSERT INTO `master_pegawai` VALUES ('352', '5970', 'SENCOKO');
INSERT INTO `master_pegawai` VALUES ('353', '5971', 'ROHMAT MULYADI');
INSERT INTO `master_pegawai` VALUES ('354', '5975', 'IRWAN, S.E.');
INSERT INTO `master_pegawai` VALUES ('355', '5976', 'M.SYAIFUL ASRI');
INSERT INTO `master_pegawai` VALUES ('356', '5977', 'WARSITO');
INSERT INTO `master_pegawai` VALUES ('357', '5979', 'SULISTYO YULIANTO');
INSERT INTO `master_pegawai` VALUES ('358', '5980', 'ISKANDAR');
INSERT INTO `master_pegawai` VALUES ('359', '5981', 'ABDUL MALIK');
INSERT INTO `master_pegawai` VALUES ('360', '5982', 'WAHYU MULYONO');
INSERT INTO `master_pegawai` VALUES ('361', '5983', 'SUPENO BURHANUDIN');
INSERT INTO `master_pegawai` VALUES ('362', '5986', 'AGUS SUYANTO');
INSERT INTO `master_pegawai` VALUES ('363', '5988', 'DADANG TAUFIK, ST');
INSERT INTO `master_pegawai` VALUES ('364', '5989', 'SUDARSA');
INSERT INTO `master_pegawai` VALUES ('365', '5990', 'HAMDANIH');
INSERT INTO `master_pegawai` VALUES ('366', '5991', 'SITI HAPIPAH. NY');
INSERT INTO `master_pegawai` VALUES ('367', '5992', 'SLAMET WALUYO');
INSERT INTO `master_pegawai` VALUES ('368', '5995', 'TRIYATNO');
INSERT INTO `master_pegawai` VALUES ('369', '5996', 'RUDI SUTATRIHADI');
INSERT INTO `master_pegawai` VALUES ('370', '5998', 'GIYONO');
INSERT INTO `master_pegawai` VALUES ('371', '6000', 'ANANG SURYANA');
INSERT INTO `master_pegawai` VALUES ('372', '6002', 'BAMBANG HERROWANTO');
INSERT INTO `master_pegawai` VALUES ('373', '6005', 'UTOYO RAMELAN');
INSERT INTO `master_pegawai` VALUES ('374', '6006', 'TARSANA');
INSERT INTO `master_pegawai` VALUES ('375', '6007', 'SADUNI');
INSERT INTO `master_pegawai` VALUES ('376', '6008', 'SUPANGAT, SH');
INSERT INTO `master_pegawai` VALUES ('377', '6009', 'YANMI YUSUF W.,S.SOS');
INSERT INTO `master_pegawai` VALUES ('378', '6010', 'ACHMAD SUBARJO, A.MD.');
INSERT INTO `master_pegawai` VALUES ('379', '6011', 'IWAN SETIAWAN, A.MD.');
INSERT INTO `master_pegawai` VALUES ('380', '6012', 'HARTONO');
INSERT INTO `master_pegawai` VALUES ('381', '6013', 'TUPAR, SE');
INSERT INTO `master_pegawai` VALUES ('382', '6014', 'UJANG SUGIANTO');
INSERT INTO `master_pegawai` VALUES ('383', '6015', 'SYARIFUDIN');
INSERT INTO `master_pegawai` VALUES ('384', '6017', 'SUTARNO, S.PD.');
INSERT INTO `master_pegawai` VALUES ('385', '6019', 'SRI HARYANTO');
INSERT INTO `master_pegawai` VALUES ('386', '6020', 'MUHAMAD ARIFIN, SH');
INSERT INTO `master_pegawai` VALUES ('387', '6022', 'SETIADI DWIANTORO');
INSERT INTO `master_pegawai` VALUES ('388', '6023', 'YUSTINUS C.');
INSERT INTO `master_pegawai` VALUES ('389', '6026', 'MARZUKI');
INSERT INTO `master_pegawai` VALUES ('390', '6028', 'ABDUL MANAF');
INSERT INTO `master_pegawai` VALUES ('391', '6029', 'WIDIANTO');
INSERT INTO `master_pegawai` VALUES ('392', '6030', 'M.HARIS');
INSERT INTO `master_pegawai` VALUES ('393', '6031', 'MUJIANTO');
INSERT INTO `master_pegawai` VALUES ('394', '6032', 'ACHMAD DJAYADI');
INSERT INTO `master_pegawai` VALUES ('395', '6034', 'BAMBANG SETYO B.R');
INSERT INTO `master_pegawai` VALUES ('396', '6035', 'TRI WAHYUDI');
INSERT INTO `master_pegawai` VALUES ('397', '6036', 'IMAM ISMONO, A.MD');
INSERT INTO `master_pegawai` VALUES ('398', '6037', 'NARDI');
INSERT INTO `master_pegawai` VALUES ('399', '6038', 'ANDI ASIKIN');
INSERT INTO `master_pegawai` VALUES ('400', '6039', 'ACHMAD WAHYUDI');
INSERT INTO `master_pegawai` VALUES ('401', '6040', 'PONIJO');
INSERT INTO `master_pegawai` VALUES ('402', '6044', 'BUDIMAN');
INSERT INTO `master_pegawai` VALUES ('403', '6045', 'WIMBAMUHARDIJANA');
INSERT INTO `master_pegawai` VALUES ('404', '6046', 'HENDRO ATMOKO');
INSERT INTO `master_pegawai` VALUES ('405', '6047', 'ACHMAD MUZAKIR');
INSERT INTO `master_pegawai` VALUES ('406', '6052', 'SRI SUCI A. Ny');
INSERT INTO `master_pegawai` VALUES ('407', '6054', 'ADI SURYA');
INSERT INTO `master_pegawai` VALUES ('408', '6055', 'SAYIER');
INSERT INTO `master_pegawai` VALUES ('409', '6057', 'WIDIANTO');
INSERT INTO `master_pegawai` VALUES ('410', '6058', 'JUMARDA A.KOSASIH');
INSERT INTO `master_pegawai` VALUES ('411', '6063', 'BAMBANG WIDI H.');
INSERT INTO `master_pegawai` VALUES ('412', '6064', 'RISMANDA YAZAR, SE');
INSERT INTO `master_pegawai` VALUES ('413', '6065', 'PURWANTO');
INSERT INTO `master_pegawai` VALUES ('414', '6067', 'M.TAUFAN HIMAWAN');
INSERT INTO `master_pegawai` VALUES ('415', '6070', 'ACUN');
INSERT INTO `master_pegawai` VALUES ('416', '6071', 'M.ROYANI');
INSERT INTO `master_pegawai` VALUES ('417', '6074', 'SUKIR');
INSERT INTO `master_pegawai` VALUES ('418', '6078', 'H. SUGIYANTO');
INSERT INTO `master_pegawai` VALUES ('419', '6080', 'HARIYADI');
INSERT INTO `master_pegawai` VALUES ('420', '6082', 'FARDINAN  SH.');
INSERT INTO `master_pegawai` VALUES ('421', '6084', 'SAMSUDIN');
INSERT INTO `master_pegawai` VALUES ('422', '6085', 'H. TONI NAWAWI');
INSERT INTO `master_pegawai` VALUES ('423', '6089', 'AHMAD MUCHTAROM');
INSERT INTO `master_pegawai` VALUES ('424', '6093', 'ACHMAD KHOIRUN');
INSERT INTO `master_pegawai` VALUES ('425', '6094', 'AHMAD KURNIAWAN,S.KOM');
INSERT INTO `master_pegawai` VALUES ('426', '6095', 'EKO SUBEKTI');
INSERT INTO `master_pegawai` VALUES ('427', '6097', 'ARYANTO PRABOWO');
INSERT INTO `master_pegawai` VALUES ('428', '6098', 'AGOENG DERMAWAN');
INSERT INTO `master_pegawai` VALUES ('429', '6099', 'MAHMUDIN');
INSERT INTO `master_pegawai` VALUES ('430', '6100', 'HERIWIYANTO');
INSERT INTO `master_pegawai` VALUES ('431', '6101', 'HERU PURNOMO');
INSERT INTO `master_pegawai` VALUES ('432', '6102', 'BANGBANG SUBAGJA');
INSERT INTO `master_pegawai` VALUES ('433', '6103', 'IWAN PRIHANDOKO');
INSERT INTO `master_pegawai` VALUES ('434', '6104', 'SUWARNO DWIATMOKO');
INSERT INTO `master_pegawai` VALUES ('435', '6105', 'SUHARYANTO');
INSERT INTO `master_pegawai` VALUES ('436', '6106', 'SARTONO');
INSERT INTO `master_pegawai` VALUES ('437', '6107', 'ZAINAL ABIDIN');
INSERT INTO `master_pegawai` VALUES ('438', '6108', 'SOPYAN');
INSERT INTO `master_pegawai` VALUES ('439', '6109', 'HIDAYAT YUNI PRAPTOMO, ST, MM');
INSERT INTO `master_pegawai` VALUES ('440', '6110', 'MUHAMAD TAUFIK I.');
INSERT INTO `master_pegawai` VALUES ('441', '6111', 'NUR ICHWAN.J');
INSERT INTO `master_pegawai` VALUES ('442', '6112', 'AGUS HARYADI');
INSERT INTO `master_pegawai` VALUES ('443', '6114', 'MAMUN SUHERMAN, ST');
INSERT INTO `master_pegawai` VALUES ('444', '6115', 'SUDARMANTO');
INSERT INTO `master_pegawai` VALUES ('445', '6116', 'SUNARYO');
INSERT INTO `master_pegawai` VALUES ('446', '6117', 'KUSEN');
INSERT INTO `master_pegawai` VALUES ('447', '6118', 'ARYA SURYA.S');
INSERT INTO `master_pegawai` VALUES ('448', '6119', 'SAAMAN CAHYADI');
INSERT INTO `master_pegawai` VALUES ('449', '6120', 'R.ERI SUSANTO');
INSERT INTO `master_pegawai` VALUES ('450', '6121', 'SUTISNA');
INSERT INTO `master_pegawai` VALUES ('451', '6123', 'EVA FARIDA.M S., SH. NY');
INSERT INTO `master_pegawai` VALUES ('452', '6126', 'MUJIONO, S.T.');
INSERT INTO `master_pegawai` VALUES ('453', '6127', 'MASRUKAN');
INSERT INTO `master_pegawai` VALUES ('454', '6128', 'SARJONO');
INSERT INTO `master_pegawai` VALUES ('455', '6140', 'Y.DIDI SUMARYANTO');
INSERT INTO `master_pegawai` VALUES ('456', '6141', 'SUDARTO');
INSERT INTO `master_pegawai` VALUES ('457', '6143', 'MARDIYANTO');
INSERT INTO `master_pegawai` VALUES ('458', '6144', 'HERU PRAYITNO');
INSERT INTO `master_pegawai` VALUES ('459', '6145', 'DWI PRIYONO');
INSERT INTO `master_pegawai` VALUES ('460', '6146', 'DWI PURWANTO, A.MD.');
INSERT INTO `master_pegawai` VALUES ('461', '6147', 'ARIES NURMAWAN, ST,MM');
INSERT INTO `master_pegawai` VALUES ('462', '6148', 'IBNU YUNI N.');
INSERT INTO `master_pegawai` VALUES ('463', '6149', 'AYUB STON, SH');
INSERT INTO `master_pegawai` VALUES ('464', '6154', 'JAJANG SALEH');
INSERT INTO `master_pegawai` VALUES ('465', '6155', 'SULAIMAN SYAM');
INSERT INTO `master_pegawai` VALUES ('466', '6156', 'ERY HARTRIYANTO');
INSERT INTO `master_pegawai` VALUES ('467', '6158', 'SUWARDI, SE');
INSERT INTO `master_pegawai` VALUES ('468', '6159', 'SLAMET RIADI');
INSERT INTO `master_pegawai` VALUES ('469', '6161', 'HAERUMAN');
INSERT INTO `master_pegawai` VALUES ('470', '6166', 'IIS YULIANTO, SH');
INSERT INTO `master_pegawai` VALUES ('471', '6167', 'RIHWAN, A.MD');
INSERT INTO `master_pegawai` VALUES ('472', '6168', 'AHMAD JAELANI');
INSERT INTO `master_pegawai` VALUES ('473', '6169', 'SURYO TAMTOMO SE.');
INSERT INTO `master_pegawai` VALUES ('474', '6170', 'TIGO YUDHA B');
INSERT INTO `master_pegawai` VALUES ('475', '6171', 'MAMAT MAHENDRA, SH');
INSERT INTO `master_pegawai` VALUES ('476', '6172', 'A.HANDAYANI. SH');
INSERT INTO `master_pegawai` VALUES ('477', '6173', 'NASARUDIN, ST');
INSERT INTO `master_pegawai` VALUES ('478', '6174', 'RIRIN MULYANI, MT. NY');
INSERT INTO `master_pegawai` VALUES ('479', '6175', 'RISMAYANI, ST .NY');
INSERT INTO `master_pegawai` VALUES ('480', '6177', 'S. MATONDANG,SE,MM, QIA');
INSERT INTO `master_pegawai` VALUES ('481', '6178', 'DHANY NAZWAR.SE');
INSERT INTO `master_pegawai` VALUES ('482', '6183', 'FRANITHA PRIMA.S. NN');
INSERT INTO `master_pegawai` VALUES ('483', '6186', 'ADE PERMANA.M.KOM');
INSERT INTO `master_pegawai` VALUES ('484', '6187', 'MULYO HARSONO');
INSERT INTO `master_pegawai` VALUES ('485', '6189', 'ADI BUSONO P., SE');
INSERT INTO `master_pegawai` VALUES ('486', '6190', 'MARTA HENDRA.W.IR,M.T.');
INSERT INTO `master_pegawai` VALUES ('487', '6192', 'PRAMONO. Ir. MM');
INSERT INTO `master_pegawai` VALUES ('488', '6195', 'TEGUH SETIABUDI, SE, MM');
INSERT INTO `master_pegawai` VALUES ('489', '6198', 'ADHI TITIAN TANTOMO. S.SI, M.T');
INSERT INTO `master_pegawai` VALUES ('490', '6199', 'MUNAWAR HADI.S.IR,M.T');
INSERT INTO `master_pegawai` VALUES ('491', '6200', 'YAZI DESWAN, MT . IR');
INSERT INTO `master_pegawai` VALUES ('492', '6201', 'ANDI PAHREVI  R., S.KOM, MM');
INSERT INTO `master_pegawai` VALUES ('493', '6202', 'KAS HENDRA W.   S.KOM, MMSI');
INSERT INTO `master_pegawai` VALUES ('494', '6203', 'PUTERI ZULIENI, ST. NY');
INSERT INTO `master_pegawai` VALUES ('495', '6204', 'AHMAD JAZULI.SE');
INSERT INTO `master_pegawai` VALUES ('496', '6205', 'NENENG SELVIA M., ST. NY');
INSERT INTO `master_pegawai` VALUES ('497', '5922', 'M.SYAFRUDIN, SE');
INSERT INTO `master_pegawai` VALUES ('498', '5924', 'IMAM FEBI YUKO, SE');
INSERT INTO `master_pegawai` VALUES ('499', '5925', 'CHAIRUL AGUS');
INSERT INTO `master_pegawai` VALUES ('500', '5926', 'PURNOMO EDI');
INSERT INTO `master_pegawai` VALUES ('501', '5927', 'HERLAN ARIANA');
INSERT INTO `master_pegawai` VALUES ('502', '5929', 'S.I.HANDAYANI.Ny.');
INSERT INTO `master_pegawai` VALUES ('503', '5931', 'ADE CUPIANDI, A.MD');
INSERT INTO `master_pegawai` VALUES ('504', '5932', 'SUPRIADI');
INSERT INTO `master_pegawai` VALUES ('505', '5934', 'YUDI ASTUTI. NY');
INSERT INTO `master_pegawai` VALUES ('506', '5936', 'MUGIYATI . NY.');
INSERT INTO `master_pegawai` VALUES ('507', '5937', 'LISTIATI. Ny');
INSERT INTO `master_pegawai` VALUES ('508', '5939', 'SUNARYATI. Ny');
INSERT INTO `master_pegawai` VALUES ('509', '5940', 'ROSMAWATI BH. Ny');
INSERT INTO `master_pegawai` VALUES ('510', '5941', 'ERLIN R. Ny');
INSERT INTO `master_pegawai` VALUES ('511', '5942', 'NURODIN');
INSERT INTO `master_pegawai` VALUES ('512', '5943', 'SUGIYO');
INSERT INTO `master_pegawai` VALUES ('513', '5945', 'JAWANI');
INSERT INTO `master_pegawai` VALUES ('514', '5947', 'DADANG SUPRIADI');
INSERT INTO `master_pegawai` VALUES ('515', '5948', 'I SETIAWAN S.Sos.');
INSERT INTO `master_pegawai` VALUES ('516', '5949', 'DIDING SUTISNA');
INSERT INTO `master_pegawai` VALUES ('517', '5950', 'SUKASNO');
INSERT INTO `master_pegawai` VALUES ('518', '5952', 'SYAMSIR ALAM');
INSERT INTO `master_pegawai` VALUES ('519', '5953', 'AHMAD MURJANI');
INSERT INTO `master_pegawai` VALUES ('520', '5954', 'DARMANTO, S.T.');
INSERT INTO `master_pegawai` VALUES ('521', '5955', 'ADANG ROMANSYAH');
INSERT INTO `master_pegawai` VALUES ('522', '5956', 'WIWIEK .H  Ny');
INSERT INTO `master_pegawai` VALUES ('523', '6419', 'SRI SUPARNO, SE');
INSERT INTO `master_pegawai` VALUES ('524', '6420', 'SUGIARTO, S.E.');
INSERT INTO `master_pegawai` VALUES ('525', '6421', 'LASMORO B ROBANI, A.MD');
INSERT INTO `master_pegawai` VALUES ('526', '6422', 'B. PANJAITAN. ST., M.M.');
INSERT INTO `master_pegawai` VALUES ('527', '6427', 'ANDI AHMAD SURYANDI');
INSERT INTO `master_pegawai` VALUES ('528', '6428', 'WAHYU APRIYANTO');
INSERT INTO `master_pegawai` VALUES ('529', '6429', 'WAHYU PURNOMO');
INSERT INTO `master_pegawai` VALUES ('530', '6430', 'BAYU SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('531', '6431', 'ADY ROSADI');
INSERT INTO `master_pegawai` VALUES ('532', '6432', 'MARYANTO');
INSERT INTO `master_pegawai` VALUES ('533', '6433', 'CAPRISIH BIANTORO');
INSERT INTO `master_pegawai` VALUES ('534', '6434', 'TRI HARDONO ARIANTO, SE');
INSERT INTO `master_pegawai` VALUES ('535', '6435', 'DANA PRIATNA');
INSERT INTO `master_pegawai` VALUES ('536', '6436', 'MARSUDI');
INSERT INTO `master_pegawai` VALUES ('537', '6437', 'DADAN SUGIHARTO');
INSERT INTO `master_pegawai` VALUES ('538', '6438', 'DWI HARTANTO');
INSERT INTO `master_pegawai` VALUES ('539', '6439', 'ADI PUTRA JAYA, SH');
INSERT INTO `master_pegawai` VALUES ('540', '6440', 'AMY HASBULLAH');
INSERT INTO `master_pegawai` VALUES ('541', '6441', 'AGUS WAHYUDI');
INSERT INTO `master_pegawai` VALUES ('542', '6442', 'MUJIONO');
INSERT INTO `master_pegawai` VALUES ('543', '6443', 'LILY LESMANA');
INSERT INTO `master_pegawai` VALUES ('544', '6444', 'FAHRUR ROZI');
INSERT INTO `master_pegawai` VALUES ('545', '6445', 'PURWARDI');
INSERT INTO `master_pegawai` VALUES ('546', '6446', 'SUTOMO');
INSERT INTO `master_pegawai` VALUES ('547', '6448', 'AHMAD ZULHAIDAR');
INSERT INTO `master_pegawai` VALUES ('548', '6449', 'MACHRONI, A.Md');
INSERT INTO `master_pegawai` VALUES ('549', '6450', 'YUDI KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('550', '6206', 'ENDRO JATMIKO');
INSERT INTO `master_pegawai` VALUES ('551', '6207', 'I KETUT WIARSANA');
INSERT INTO `master_pegawai` VALUES ('552', '6208', 'RUDIYANA');
INSERT INTO `master_pegawai` VALUES ('553', '6209', 'SUYANTA');
INSERT INTO `master_pegawai` VALUES ('554', '6211', 'ANDI PERMANA');
INSERT INTO `master_pegawai` VALUES ('555', '6212', 'ENDANG HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('556', '6214', 'AGUS RINI Ny.');
INSERT INTO `master_pegawai` VALUES ('557', '6218', 'SUWARTO');
INSERT INTO `master_pegawai` VALUES ('558', '6219', 'SUMARJO');
INSERT INTO `master_pegawai` VALUES ('559', '6220', 'AGUS TRIONO');
INSERT INTO `master_pegawai` VALUES ('560', '6221', 'WIDIYANTORO, SE');
INSERT INTO `master_pegawai` VALUES ('561', '6222', 'AKHMAD NURHADI');
INSERT INTO `master_pegawai` VALUES ('562', '6224', 'GUNAWAN, S.KOM');
INSERT INTO `master_pegawai` VALUES ('563', '6225', 'HERI FEBRIANTO');
INSERT INTO `master_pegawai` VALUES ('564', '6226', 'DARMAWAN');
INSERT INTO `master_pegawai` VALUES ('565', '6228', 'SOLIHIN AS');
INSERT INTO `master_pegawai` VALUES ('566', '6231', 'SUPARDI');
INSERT INTO `master_pegawai` VALUES ('567', '6232', 'H. TAUFIK, MM.');
INSERT INTO `master_pegawai` VALUES ('568', '6233', 'SAHAT PARULIAN H., A.MD');
INSERT INTO `master_pegawai` VALUES ('569', '6234', 'SUHARTO');
INSERT INTO `master_pegawai` VALUES ('570', '6235', 'ACHMAD SANTOSO');
INSERT INTO `master_pegawai` VALUES ('571', '6236', 'SYAMSUDIN');
INSERT INTO `master_pegawai` VALUES ('572', '6237', 'SULAEMAN');
INSERT INTO `master_pegawai` VALUES ('573', '6238', 'DAVID SYAHPUTRA');
INSERT INTO `master_pegawai` VALUES ('574', '6239', 'MUHSIN YURGEN, A.Md.T');
INSERT INTO `master_pegawai` VALUES ('575', '6241', 'MOHAMMAD KOSASIH');
INSERT INTO `master_pegawai` VALUES ('576', '6242', 'BAMBANG SUSILO');
INSERT INTO `master_pegawai` VALUES ('577', '6243', 'IWAN SURADIYANTO');
INSERT INTO `master_pegawai` VALUES ('578', '6244', 'MULTHAZAM');
INSERT INTO `master_pegawai` VALUES ('579', '6245', 'MADHAPI');
INSERT INTO `master_pegawai` VALUES ('580', '6246', 'GIMANTA');
INSERT INTO `master_pegawai` VALUES ('581', '6247', 'TRI APRIYANTO');
INSERT INTO `master_pegawai` VALUES ('582', '6248', 'DEDI MULYADI');
INSERT INTO `master_pegawai` VALUES ('583', '6249', 'JAMALUDDIN');
INSERT INTO `master_pegawai` VALUES ('584', '6250', 'SUMADIYONO');
INSERT INTO `master_pegawai` VALUES ('585', '6251', 'BAMBANG SUKARDI, SE');
INSERT INTO `master_pegawai` VALUES ('586', '6253', 'HARI SURYOKO, A.MD');
INSERT INTO `master_pegawai` VALUES ('587', '6254', 'AGUS SULAEMAN');
INSERT INTO `master_pegawai` VALUES ('588', '6255', 'PUJIANTO');
INSERT INTO `master_pegawai` VALUES ('589', '6256', 'N.SUGIYANTO. S.Pd');
INSERT INTO `master_pegawai` VALUES ('590', '6257', 'MOHAMAD ROCHMAT');
INSERT INTO `master_pegawai` VALUES ('591', '6258', 'HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('592', '6260', 'MOH.SUPRIYANTO.SE');
INSERT INTO `master_pegawai` VALUES ('593', '6261', 'HERY INDRIYANTO');
INSERT INTO `master_pegawai` VALUES ('594', '6262', 'WAHYU RIADI');
INSERT INTO `master_pegawai` VALUES ('595', '6263', 'DUDI PERMANA S.');
INSERT INTO `master_pegawai` VALUES ('596', '6264', 'BAMBANG APRIANA R');
INSERT INTO `master_pegawai` VALUES ('597', '6265', 'TRIYANTO');
INSERT INTO `master_pegawai` VALUES ('598', '6267', 'EDY MAWARDI');
INSERT INTO `master_pegawai` VALUES ('599', '6268', 'MARMI Ny.');
INSERT INTO `master_pegawai` VALUES ('600', '6269', 'AGI, M.A.');
INSERT INTO `master_pegawai` VALUES ('601', '6270', 'HARYANA');
INSERT INTO `master_pegawai` VALUES ('602', '6271', 'BUDIYANTO');
INSERT INTO `master_pegawai` VALUES ('603', '6273', 'FAIZAL AIDIN. S.T');
INSERT INTO `master_pegawai` VALUES ('604', '6274', 'NONENG SUANGSIH, S.Kom,MM. NY');
INSERT INTO `master_pegawai` VALUES ('605', '6275', 'ERWANTO, S. Kom.');
INSERT INTO `master_pegawai` VALUES ('606', '6276', 'ATOK SUPRATIKNO, A.MD.');
INSERT INTO `master_pegawai` VALUES ('607', '6277', 'DIKY HAERIZAL N., SE');
INSERT INTO `master_pegawai` VALUES ('608', '6278', 'ZAMZAM A. P.');
INSERT INTO `master_pegawai` VALUES ('609', '6279', 'DADANG SUGANDI');
INSERT INTO `master_pegawai` VALUES ('610', '6280', 'ERWIN BAHRUDIN');
INSERT INTO `master_pegawai` VALUES ('611', '6281', 'ENDANG SARIP H.');
INSERT INTO `master_pegawai` VALUES ('612', '6282', 'PRAJITNO');
INSERT INTO `master_pegawai` VALUES ('613', '6283', 'SUHENDI');
INSERT INTO `master_pegawai` VALUES ('614', '6284', 'SUNARYA');
INSERT INTO `master_pegawai` VALUES ('615', '6285', 'ACHMAD K G. IR., M.T.');
INSERT INTO `master_pegawai` VALUES ('616', '6287', 'DEDE SUPRIYADI, ST');
INSERT INTO `master_pegawai` VALUES ('617', '6288', 'JUNAEDI, ST');
INSERT INTO `master_pegawai` VALUES ('618', '6289', 'E KUSMAYADI. Ir.');
INSERT INTO `master_pegawai` VALUES ('619', '6291', 'P. BUDI SANTOSO, S.SOS');
INSERT INTO `master_pegawai` VALUES ('620', '6292', 'PITRAEKSA, A.MD');
INSERT INTO `master_pegawai` VALUES ('621', '6293', 'PRAHORO SETYAWAN');
INSERT INTO `master_pegawai` VALUES ('622', '6294', 'HUSMEITY S. NY. DRA.');
INSERT INTO `master_pegawai` VALUES ('623', '6295', 'SUHENDRA');
INSERT INTO `master_pegawai` VALUES ('624', '6296', 'ABDUN NAPI');
INSERT INTO `master_pegawai` VALUES ('625', '6297', 'ISWANTO');
INSERT INTO `master_pegawai` VALUES ('626', '6298', 'HARIYAWAN SUSILO');
INSERT INTO `master_pegawai` VALUES ('627', '6299', 'ARIEF SETIADI, S.T.');
INSERT INTO `master_pegawai` VALUES ('628', '6300', 'EDDY PURWANTO');
INSERT INTO `master_pegawai` VALUES ('629', '6301', 'AHMAD RIFAI');
INSERT INTO `master_pegawai` VALUES ('630', '6302', 'BUDI MARGONO');
INSERT INTO `master_pegawai` VALUES ('631', '6303', 'IRWAN HERYADI');
INSERT INTO `master_pegawai` VALUES ('632', '6305', 'TEDI SWASDIAN');
INSERT INTO `master_pegawai` VALUES ('633', '6306', 'EMAN SUHERMAN');
INSERT INTO `master_pegawai` VALUES ('634', '6307', 'ARIEF SABARUDIN');
INSERT INTO `master_pegawai` VALUES ('635', '6308', 'TATANG KUSWARA, S.T.');
INSERT INTO `master_pegawai` VALUES ('636', '6309', 'PONIMAN');
INSERT INTO `master_pegawai` VALUES ('637', '6310', 'FIFI NURUL H. Ny.');
INSERT INTO `master_pegawai` VALUES ('638', '6311', 'DIANA INGRID H. NY');
INSERT INTO `master_pegawai` VALUES ('639', '6312', 'NAIDIR, A.MD');
INSERT INTO `master_pegawai` VALUES ('640', '6313', 'SUPRIHATIN. NY');
INSERT INTO `master_pegawai` VALUES ('641', '6314', 'YULIANA TRI R.S., A.MD. NY');
INSERT INTO `master_pegawai` VALUES ('642', '6315', 'NURHAYATI. NY');
INSERT INTO `master_pegawai` VALUES ('643', '6316', 'KUSMIYATI .Nn');
INSERT INTO `master_pegawai` VALUES ('644', '6317', 'SUSTIYANINGSIH. NY');
INSERT INTO `master_pegawai` VALUES ('645', '6319', 'YENI DARLIANI Ny.');
INSERT INTO `master_pegawai` VALUES ('646', '6320', 'INTAN NURCAHYA. NY');
INSERT INTO `master_pegawai` VALUES ('647', '6321', 'SODIKIN');
INSERT INTO `master_pegawai` VALUES ('648', '6322', 'TRI YULI YANTI, SE .NY');
INSERT INTO `master_pegawai` VALUES ('649', '6323', 'TRI SUWANTO');
INSERT INTO `master_pegawai` VALUES ('650', '6324', 'AGUS YUNIANTO, A.MD');
INSERT INTO `master_pegawai` VALUES ('651', '6325', 'DWI SUSILOWATI Ny');
INSERT INTO `master_pegawai` VALUES ('652', '6326', 'NUNIK SUMIATI Ny.');
INSERT INTO `master_pegawai` VALUES ('653', '6327', 'ERNA ERMAWATI. NY');
INSERT INTO `master_pegawai` VALUES ('654', '6329', 'SUNARTI, SE. NY.');
INSERT INTO `master_pegawai` VALUES ('655', '6330', 'MOH. SOLEH');
INSERT INTO `master_pegawai` VALUES ('656', '6331', 'SUTISNA, ST');
INSERT INTO `master_pegawai` VALUES ('657', '6332', 'HARTANTO');
INSERT INTO `master_pegawai` VALUES ('658', '6334', 'DARYONO, A.MD');
INSERT INTO `master_pegawai` VALUES ('659', '6335', 'M. AGUS S. S.Pd');
INSERT INTO `master_pegawai` VALUES ('660', '6336', 'JAKA SUGANDA');
INSERT INTO `master_pegawai` VALUES ('661', '6337', 'SUKATMIN');
INSERT INTO `master_pegawai` VALUES ('662', '6338', 'RAHMAT SUTISNA');
INSERT INTO `master_pegawai` VALUES ('663', '6340', 'ASEP SUPRIYADI, SH');
INSERT INTO `master_pegawai` VALUES ('664', '6342', 'ENANG ZULKARNAEN');
INSERT INTO `master_pegawai` VALUES ('665', '6343', 'SURAPUDIN');
INSERT INTO `master_pegawai` VALUES ('666', '6345', 'BANDU YUSMADI');
INSERT INTO `master_pegawai` VALUES ('667', '6347', 'DADAN HENDARMAN, MT');
INSERT INTO `master_pegawai` VALUES ('668', '6348', 'SUNARTO');
INSERT INTO `master_pegawai` VALUES ('669', '6349', 'FERRY DARMAWAN');
INSERT INTO `master_pegawai` VALUES ('670', '6350', 'NANANG NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('671', '6351', 'ISHAK');
INSERT INTO `master_pegawai` VALUES ('672', '6352', 'BUDI SUDRAJAT');
INSERT INTO `master_pegawai` VALUES ('673', '6353', 'ASEP SARIPUDIN');
INSERT INTO `master_pegawai` VALUES ('674', '6354', 'HARDJITO');
INSERT INTO `master_pegawai` VALUES ('675', '6355', 'SUMPONO');
INSERT INTO `master_pegawai` VALUES ('676', '6356', 'WENDI YULIANTO');
INSERT INTO `master_pegawai` VALUES ('677', '6357', 'FIRMAN GUNAWAN, S.KOM');
INSERT INTO `master_pegawai` VALUES ('678', '6358', 'TRI SULISTIANTO, SE');
INSERT INTO `master_pegawai` VALUES ('679', '6359', 'ECEP JENAL M., S.kom');
INSERT INTO `master_pegawai` VALUES ('680', '6360', 'FAJAR RIZKI. MM');
INSERT INTO `master_pegawai` VALUES ('681', '6361', 'LIBRA PURWATI NY');
INSERT INTO `master_pegawai` VALUES ('682', '6362', 'JAROT BUJONO');
INSERT INTO `master_pegawai` VALUES ('683', '6363', 'SITI ASIAH. NY');
INSERT INTO `master_pegawai` VALUES ('684', '6364', 'SARI WULANDARI. NY, S.E');
INSERT INTO `master_pegawai` VALUES ('685', '6365', 'ANIES USMAN SOELISTIYO');
INSERT INTO `master_pegawai` VALUES ('686', '6366', 'ADE MASWANI, A.Md');
INSERT INTO `master_pegawai` VALUES ('687', '6367', 'INDRA GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('688', '6368', 'SRI ERNAWATI. NY, S.S.');
INSERT INTO `master_pegawai` VALUES ('689', '6369', 'ARI CAHYADI');
INSERT INTO `master_pegawai` VALUES ('690', '6370', 'AHMAD HAMBALI');
INSERT INTO `master_pegawai` VALUES ('691', '6371', 'SUNGKANA');
INSERT INTO `master_pegawai` VALUES ('692', '6372', 'BUDI HARIYANTO');
INSERT INTO `master_pegawai` VALUES ('693', '6373', 'EFENDY SIANTURI, ST');
INSERT INTO `master_pegawai` VALUES ('694', '6374', 'LUPI SOEDJALMO');
INSERT INTO `master_pegawai` VALUES ('695', '6375', 'SURYA DAMIRI');
INSERT INTO `master_pegawai` VALUES ('696', '6376', 'PRIYO HANDOKO');
INSERT INTO `master_pegawai` VALUES ('697', '6377', 'YUDI SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('698', '6379', 'CECEP CAHYADI');
INSERT INTO `master_pegawai` VALUES ('699', '6380', 'SISWO SUBAGIO');
INSERT INTO `master_pegawai` VALUES ('700', '6381', 'MOHAMAD SUFRAYOGI');
INSERT INTO `master_pegawai` VALUES ('701', '6382', 'TRY YOMI H., ST .NY');
INSERT INTO `master_pegawai` VALUES ('702', '6383', 'DEDI SUPRIYADI');
INSERT INTO `master_pegawai` VALUES ('703', '6384', 'BURHANUDIN, S.PD.');
INSERT INTO `master_pegawai` VALUES ('704', '6385', 'DEDI SYAMSUDIN');
INSERT INTO `master_pegawai` VALUES ('705', '6386', 'HENDRO RADITIO');
INSERT INTO `master_pegawai` VALUES ('706', '6387', 'ADE RAHMAT N.');
INSERT INTO `master_pegawai` VALUES ('707', '6388', 'TRIYO SAPUTRO, SE, MM');
INSERT INTO `master_pegawai` VALUES ('708', '6389', 'RIAN BAYUNTORO');
INSERT INTO `master_pegawai` VALUES ('709', '6390', 'JAKA SUSILA');
INSERT INTO `master_pegawai` VALUES ('710', '6392', 'SRI HAYATI Ny.');
INSERT INTO `master_pegawai` VALUES ('711', '6393', 'PUJI ASTUTI. NY');
INSERT INTO `master_pegawai` VALUES ('712', '6394', 'WIWIK S., S.SOS .NY');
INSERT INTO `master_pegawai` VALUES ('713', '6395', 'HANDRA DEWI, S.E.');
INSERT INTO `master_pegawai` VALUES ('714', '6397', 'SUPRANTININGSIH Ny');
INSERT INTO `master_pegawai` VALUES ('715', '6399', 'SITI ZULAIKHA. NY');
INSERT INTO `master_pegawai` VALUES ('716', '6400', 'AGUS SUTOMO');
INSERT INTO `master_pegawai` VALUES ('717', '6401', 'HOTMEN SIREGAR');
INSERT INTO `master_pegawai` VALUES ('718', '6402', 'H. BADIMAN');
INSERT INTO `master_pegawai` VALUES ('719', '6403', 'FAJAR SUMIRAT');
INSERT INTO `master_pegawai` VALUES ('720', '6404', 'HARIYANTO');
INSERT INTO `master_pegawai` VALUES ('721', '6405', 'SLAMET JUNEDI');
INSERT INTO `master_pegawai` VALUES ('722', '6406', 'EKO RISDIYANTO');
INSERT INTO `master_pegawai` VALUES ('723', '6407', 'MULYAWAN');
INSERT INTO `master_pegawai` VALUES ('724', '6408', 'DINI ASTUTI Ny.');
INSERT INTO `master_pegawai` VALUES ('725', '6409', 'T RESTIANA HADI. NY');
INSERT INTO `master_pegawai` VALUES ('726', '6412', 'ARIE KUNCORO JATI');
INSERT INTO `master_pegawai` VALUES ('727', '6413', 'TRI ADMOKO, ST');
INSERT INTO `master_pegawai` VALUES ('728', '6414', 'RUDI');
INSERT INTO `master_pegawai` VALUES ('729', '6415', 'ROMMY HERFIANTO');
INSERT INTO `master_pegawai` VALUES ('730', '6416', 'MUHIDIN, A.MD');
INSERT INTO `master_pegawai` VALUES ('731', '6417', 'YANUAR DWI H.');
INSERT INTO `master_pegawai` VALUES ('732', '6418', 'ACHMAD SAMBAS, ST');
INSERT INTO `master_pegawai` VALUES ('733', '6481', 'HARYO BINOKO, ST');
INSERT INTO `master_pegawai` VALUES ('734', '6483', 'SARI PUSPITANINGRUM, SAB .NN.');
INSERT INTO `master_pegawai` VALUES ('735', '6484', 'RIANASARI, S.SOS. NY');
INSERT INTO `master_pegawai` VALUES ('736', '6485', 'DYNI D. TACRIP, A.MD. NY.');
INSERT INTO `master_pegawai` VALUES ('737', '6486', 'DEWI WAHYUNINGSIH, SE. NY');
INSERT INTO `master_pegawai` VALUES ('738', '6487', 'DIATI UTAMASARI. NY');
INSERT INTO `master_pegawai` VALUES ('739', '6488', 'YULIA YASMIN. NY');
INSERT INTO `master_pegawai` VALUES ('740', '6489', 'DWI HARYADI');
INSERT INTO `master_pegawai` VALUES ('741', '6490', 'KHAIRUL GOFHAR');
INSERT INTO `master_pegawai` VALUES ('742', '6491', 'SUPI\' I');
INSERT INTO `master_pegawai` VALUES ('743', '6492', 'HERU PURNOMO,  A. Md');
INSERT INTO `master_pegawai` VALUES ('744', '6493', 'ASEP TUPRIYA');
INSERT INTO `master_pegawai` VALUES ('745', '6494', 'BAHRULLOH,  A. Md');
INSERT INTO `master_pegawai` VALUES ('746', '6495', 'IKA MARIANINGSIH, SE. NY');
INSERT INTO `master_pegawai` VALUES ('747', '6496', 'RENY KAMALIA, S.SI. NY');
INSERT INTO `master_pegawai` VALUES ('748', '6497', 'EKA DIANAWATI, S.E. NY');
INSERT INTO `master_pegawai` VALUES ('749', '6498', 'EKO BUDY SANTOSO');
INSERT INTO `master_pegawai` VALUES ('750', '6499', 'SUGIH HERNAWAN, ST');
INSERT INTO `master_pegawai` VALUES ('751', '6500', 'EKO SUTRISNO');
INSERT INTO `master_pegawai` VALUES ('752', '6501', 'TAUFIK HIDAYAT, S.KOM');
INSERT INTO `master_pegawai` VALUES ('753', '6502', 'TOMI EKO ARIYANTO, A.MD');
INSERT INTO `master_pegawai` VALUES ('754', '6503', 'RUDY PURWADI, S.T.');
INSERT INTO `master_pegawai` VALUES ('755', '6504', 'SUGANDA PERMANA P.');
INSERT INTO `master_pegawai` VALUES ('756', '6505', 'ABDUL KADIR');
INSERT INTO `master_pegawai` VALUES ('757', '6506', 'SLAMET WIDADA');
INSERT INTO `master_pegawai` VALUES ('758', '6507', 'HERMAWAN DWI SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('759', '6508', 'AGUNG SUJARWO');
INSERT INTO `master_pegawai` VALUES ('760', '6509', 'HANDI WINATA');
INSERT INTO `master_pegawai` VALUES ('761', '6510', 'DADAN APERO, ST');
INSERT INTO `master_pegawai` VALUES ('762', '6511', 'MOCHAMAD ABDULLOH');
INSERT INTO `master_pegawai` VALUES ('763', '6512', 'ERNANTO, S.Kom.');
INSERT INTO `master_pegawai` VALUES ('764', '6513', 'NURUL HUDA');
INSERT INTO `master_pegawai` VALUES ('765', '6514', 'NANANG DJUMALIK');
INSERT INTO `master_pegawai` VALUES ('766', '6515', 'SUGIYONO, SE');
INSERT INTO `master_pegawai` VALUES ('767', '6516', 'DENPOERI WISNI W. NY');
INSERT INTO `master_pegawai` VALUES ('768', '6517', 'HASTI EKA PURYANTI, SE. NY');
INSERT INTO `master_pegawai` VALUES ('769', '6518', 'DINA ENY ANNA., A.Md. NY');
INSERT INTO `master_pegawai` VALUES ('770', '6519', 'MUHAMAD PRIYANTO');
INSERT INTO `master_pegawai` VALUES ('771', '6520', 'ANDRIYANTO');
INSERT INTO `master_pegawai` VALUES ('772', '6521', 'HADI MUKTI RIDWAN, S.KOM');
INSERT INTO `master_pegawai` VALUES ('773', '6523', 'MUHAMAD MIFTAH, S.Kom');
INSERT INTO `master_pegawai` VALUES ('774', '6524', 'MUNTOHA, S.H.');
INSERT INTO `master_pegawai` VALUES ('775', '6525', 'SUNARTO');
INSERT INTO `master_pegawai` VALUES ('776', '6526', 'EKO  LAKSONO');
INSERT INTO `master_pegawai` VALUES ('777', '6527', 'SUDIRO  HUSODO');
INSERT INTO `master_pegawai` VALUES ('778', '6528', 'KRISTON');
INSERT INTO `master_pegawai` VALUES ('779', '6529', 'ADI PURWANTO, SE');
INSERT INTO `master_pegawai` VALUES ('780', '6530', 'MUHAMMAD ISMAIL');
INSERT INTO `master_pegawai` VALUES ('781', '6531', 'TRI DARYANTO');
INSERT INTO `master_pegawai` VALUES ('782', '6532', 'BURHANUDIN');
INSERT INTO `master_pegawai` VALUES ('783', '6533', 'HENDRA KURNIA');
INSERT INTO `master_pegawai` VALUES ('784', '6534', 'SAPTO PUJO U.');
INSERT INTO `master_pegawai` VALUES ('785', '6535', 'ARIS EFENDI');
INSERT INTO `master_pegawai` VALUES ('786', '6536', 'MUJI ISTIANTO');
INSERT INTO `master_pegawai` VALUES ('787', '6537', 'AMIN HAMBALI, S.Kom');
INSERT INTO `master_pegawai` VALUES ('788', '6538', 'ARIF MOH. LUTHFI');
INSERT INTO `master_pegawai` VALUES ('789', '6539', 'ANTON HARI P.');
INSERT INTO `master_pegawai` VALUES ('790', '6540', 'ALAMSYAH');
INSERT INTO `master_pegawai` VALUES ('791', '6542', 'I K M A N');
INSERT INTO `master_pegawai` VALUES ('792', '6543', 'AGUNG NUHGROHO');
INSERT INTO `master_pegawai` VALUES ('793', '6544', 'R I Z A L,  S. Kom.');
INSERT INTO `master_pegawai` VALUES ('794', '6545', 'DEDI RAHMANTO TRI S., S.KOM');
INSERT INTO `master_pegawai` VALUES ('795', '6546', 'DENI SUHERMAN, SE');
INSERT INTO `master_pegawai` VALUES ('796', '6547', 'BAMBANG NURDIANSYAH, S. Kom');
INSERT INTO `master_pegawai` VALUES ('797', '6548', 'MOHAMMAD RUSLI');
INSERT INTO `master_pegawai` VALUES ('798', '6549', 'S. EKO SUBEKTI');
INSERT INTO `master_pegawai` VALUES ('799', '6550', 'RAHMAN ARIFIN, S.PD');
INSERT INTO `master_pegawai` VALUES ('800', '6552', 'HERU PRASETIYO');
INSERT INTO `master_pegawai` VALUES ('801', '6554', 'MUHAMAD ROZIKIN');
INSERT INTO `master_pegawai` VALUES ('802', '6555', 'TRI AGUS SOFIYAN, A.MD.');
INSERT INTO `master_pegawai` VALUES ('803', '6556', 'ERPAN SUMARSONO, ST');
INSERT INTO `master_pegawai` VALUES ('804', '6557', 'ERVAN BUDIYANTO');
INSERT INTO `master_pegawai` VALUES ('805', '6558', 'SURIYA SUPRIYANA');
INSERT INTO `master_pegawai` VALUES ('806', '6559', 'SRIYONO');
INSERT INTO `master_pegawai` VALUES ('807', '6560', 'NURSOHEM');
INSERT INTO `master_pegawai` VALUES ('808', '6561', 'KARSENO');
INSERT INTO `master_pegawai` VALUES ('809', '6562', 'WAWAN SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('810', '6563', 'ENDANG SUPRIATNA');
INSERT INTO `master_pegawai` VALUES ('811', '6564', 'NANA MULYANA');
INSERT INTO `master_pegawai` VALUES ('812', '6565', 'ISMAIL SALEH, ST');
INSERT INTO `master_pegawai` VALUES ('813', '6566', 'MOHAMAD UMAR');
INSERT INTO `master_pegawai` VALUES ('814', '6567', 'NUNUNG MURJIANTO');
INSERT INTO `master_pegawai` VALUES ('815', '6568', 'TARUNA CHALIK S.');
INSERT INTO `master_pegawai` VALUES ('816', '6569', 'DIAN AGUS PRAMONO');
INSERT INTO `master_pegawai` VALUES ('817', '6570', 'EDI ASMADI');
INSERT INTO `master_pegawai` VALUES ('818', '6571', 'RUHERDIANA, S.Kom');
INSERT INTO `master_pegawai` VALUES ('819', '6572', 'MAHWANI');
INSERT INTO `master_pegawai` VALUES ('820', '6573', 'SYAIFUL ANWAR, A.MD');
INSERT INTO `master_pegawai` VALUES ('821', '6574', 'HAIRUL FADILAH');
INSERT INTO `master_pegawai` VALUES ('822', '6575', 'W I D O D O');
INSERT INTO `master_pegawai` VALUES ('823', '6576', 'ARIE SETIYOWATI. NY');
INSERT INTO `master_pegawai` VALUES ('824', '6577', 'HAMIDAH, SE. NY');
INSERT INTO `master_pegawai` VALUES ('825', '6578', 'RAHMAWATI. NY');
INSERT INTO `master_pegawai` VALUES ('826', '6579', 'MARYANI. NY');
INSERT INTO `master_pegawai` VALUES ('827', '6580', 'RIHYANA. NY');
INSERT INTO `master_pegawai` VALUES ('828', '6583', 'DEWI JUNIAWATI. NY');
INSERT INTO `master_pegawai` VALUES ('829', '6584', 'RIA WAHYUNI. NN');
INSERT INTO `master_pegawai` VALUES ('830', '6585', 'EVIE ERVIANI. NN');
INSERT INTO `master_pegawai` VALUES ('831', '6586', 'ATIK RAHMAWATI, S.KOM. NN');
INSERT INTO `master_pegawai` VALUES ('832', '6587', 'ADE HERAWATI. NY');
INSERT INTO `master_pegawai` VALUES ('833', '6588', 'IZROMI');
INSERT INTO `master_pegawai` VALUES ('834', '6589', 'BUDIARTO ISKANDAR');
INSERT INTO `master_pegawai` VALUES ('835', '6590', 'SUKARJITO');
INSERT INTO `master_pegawai` VALUES ('836', '6591', 'ULUL AZMI');
INSERT INTO `master_pegawai` VALUES ('837', '6592', 'SUHARTA, S.PD');
INSERT INTO `master_pegawai` VALUES ('838', '6593', 'F. DARUSALAM');
INSERT INTO `master_pegawai` VALUES ('839', '6594', 'TERRY AGUSTIAR');
INSERT INTO `master_pegawai` VALUES ('840', '6595', 'AHMAD FAUZI');
INSERT INTO `master_pegawai` VALUES ('841', '6596', 'SETYO HARI MULYONO, S.S.');
INSERT INTO `master_pegawai` VALUES ('842', '6597', 'MAMAN SURACHMAN, A.MD');
INSERT INTO `master_pegawai` VALUES ('843', '6598', 'SUKAMSO, SE');
INSERT INTO `master_pegawai` VALUES ('844', '6599', 'JEJEN  JAENUDIN');
INSERT INTO `master_pegawai` VALUES ('845', '6600', 'HENDRA MARTINO, ST');
INSERT INTO `master_pegawai` VALUES ('846', '6601', 'EDY WIJANARYO');
INSERT INTO `master_pegawai` VALUES ('847', '6602', 'DICKY SUHERLAN');
INSERT INTO `master_pegawai` VALUES ('848', '6604', 'AEP MULYANA, SE');
INSERT INTO `master_pegawai` VALUES ('849', '6606', 'NURUL AZIZAH. NY');
INSERT INTO `master_pegawai` VALUES ('850', '6607', 'M A R A L I');
INSERT INTO `master_pegawai` VALUES ('851', '6608', 'M U R D I H');
INSERT INTO `master_pegawai` VALUES ('852', '6609', 'DONI RATRI AGUS');
INSERT INTO `master_pegawai` VALUES ('853', '6610', 'DWI DOYO HANDAYANI');
INSERT INTO `master_pegawai` VALUES ('854', '6611', 'EKO SUSANTO');
INSERT INTO `master_pegawai` VALUES ('855', '6612', 'BUDI PURNAWAN');
INSERT INTO `master_pegawai` VALUES ('856', '6614', 'EPI HANAPI');
INSERT INTO `master_pegawai` VALUES ('857', '6615', 'SANDI IRAWADI');
INSERT INTO `master_pegawai` VALUES ('858', '6616', 'SUPRIYONO, SE');
INSERT INTO `master_pegawai` VALUES ('859', '6617', 'SRI MULYONO');
INSERT INTO `master_pegawai` VALUES ('860', '6618', 'YAHDINSYAH, SE');
INSERT INTO `master_pegawai` VALUES ('861', '6619', 'TRI ARYANTO, A.MD');
INSERT INTO `master_pegawai` VALUES ('862', '6620', 'SRI MULYO');
INSERT INTO `master_pegawai` VALUES ('863', '6621', 'DIAN ANGGRAENI, SM.');
INSERT INTO `master_pegawai` VALUES ('864', '6623', 'MELANY EKAWATI. NY');
INSERT INTO `master_pegawai` VALUES ('865', '6624', 'SUMARNI. NY');
INSERT INTO `master_pegawai` VALUES ('866', '6625', 'WIWIT OKTASARI. NY');
INSERT INTO `master_pegawai` VALUES ('867', '6626', 'HERNAWATI. NY');
INSERT INTO `master_pegawai` VALUES ('868', '6627', 'A. SAPTA RINI. NY');
INSERT INTO `master_pegawai` VALUES ('869', '6628', 'DEWI SOERATI. NY');
INSERT INTO `master_pegawai` VALUES ('870', '6630', 'ANA SRI BUNTARI. NY');
INSERT INTO `master_pegawai` VALUES ('871', '6633', 'SRI WIDIASTUTI. NY');
INSERT INTO `master_pegawai` VALUES ('872', '6634', 'RETNO WIJI  P. NY');
INSERT INTO `master_pegawai` VALUES ('873', '6635', 'MARTINI. NY');
INSERT INTO `master_pegawai` VALUES ('874', '6636', 'M. FIRDAUS SASONGKO UTOMO');
INSERT INTO `master_pegawai` VALUES ('875', '6637', 'SANDRALEKA');
INSERT INTO `master_pegawai` VALUES ('876', '6638', 'BAMBANG PURWANTO, SE');
INSERT INTO `master_pegawai` VALUES ('877', '6641', 'NANANG KOSIM');
INSERT INTO `master_pegawai` VALUES ('878', '6642', 'BAMBANG RISTIYANTO, ST');
INSERT INTO `master_pegawai` VALUES ('879', '6643', 'WAHYU SADEWO');
INSERT INTO `master_pegawai` VALUES ('880', '6644', 'JOKO SUSILO, ST');
INSERT INTO `master_pegawai` VALUES ('881', '6645', 'ENDI WIRATNO, ST');
INSERT INTO `master_pegawai` VALUES ('882', '6646', 'HERU NURYAWAN');
INSERT INTO `master_pegawai` VALUES ('883', '6647', 'NUR ICHWANDANI, ST');
INSERT INTO `master_pegawai` VALUES ('884', '6648', 'THODI SUKAMTO');
INSERT INTO `master_pegawai` VALUES ('885', '6649', 'SUKIYADI');
INSERT INTO `master_pegawai` VALUES ('886', '6650', 'BUDI PRASETYO, ST');
INSERT INTO `master_pegawai` VALUES ('887', '6651', 'DRI ASIH HARNANO');
INSERT INTO `master_pegawai` VALUES ('888', '6652', 'DANI MAULANA');
INSERT INTO `master_pegawai` VALUES ('889', '6653', 'JAENAL JAMALUDIN');
INSERT INTO `master_pegawai` VALUES ('890', '6654', 'TITO TRI ADITYA A.');
INSERT INTO `master_pegawai` VALUES ('891', '6655', 'DEDE SUTRISNO');
INSERT INTO `master_pegawai` VALUES ('892', '6656', 'ADE SUWIRYO');
INSERT INTO `master_pegawai` VALUES ('893', '6451', 'GUNADI');
INSERT INTO `master_pegawai` VALUES ('894', '6452', 'SUTRAS BUDI PRAYOGO');
INSERT INTO `master_pegawai` VALUES ('895', '6453', 'SIGIT KUSWARA');
INSERT INTO `master_pegawai` VALUES ('896', '6454', 'EDI PUJIANTO');
INSERT INTO `master_pegawai` VALUES ('897', '6457', 'W I J I . NY. S. Sos');
INSERT INTO `master_pegawai` VALUES ('898', '6458', 'HELENA LENY M.G. NY');
INSERT INTO `master_pegawai` VALUES ('899', '6460', 'WARNO, SE');
INSERT INTO `master_pegawai` VALUES ('900', '6461', 'SUPRIYONO');
INSERT INTO `master_pegawai` VALUES ('901', '6462', 'ADI SUYITNO');
INSERT INTO `master_pegawai` VALUES ('902', '6463', 'ARIE ISKANDAR, SE');
INSERT INTO `master_pegawai` VALUES ('903', '6464', 'HERI PURWANTO');
INSERT INTO `master_pegawai` VALUES ('904', '6465', 'DEPI ABDUL MALIK, ST');
INSERT INTO `master_pegawai` VALUES ('905', '6466', 'M.ZULHAM EFFENDI');
INSERT INTO `master_pegawai` VALUES ('906', '6467', 'TATIT PRIHANDOYO, M.AK');
INSERT INTO `master_pegawai` VALUES ('907', '6468', 'FIRLLY D. RESPATIE, M.SI .NY');
INSERT INTO `master_pegawai` VALUES ('908', '6469', 'ANANTA SEPTARIANA. NY, SE.AK');
INSERT INTO `master_pegawai` VALUES ('909', '6470', 'ELVI MURNIHATI SIAHAAN, MT NY.');
INSERT INTO `master_pegawai` VALUES ('910', '6471', 'FADEL, M.T.');
INSERT INTO `master_pegawai` VALUES ('911', '6472', 'SITI KAMILA. NN, M.T.');
INSERT INTO `master_pegawai` VALUES ('912', '6473', 'SIWI WIDJAYANTI. NY, ST, MT');
INSERT INTO `master_pegawai` VALUES ('913', '6474', 'EDHY PURNOMO, M.SI');
INSERT INTO `master_pegawai` VALUES ('914', '6475', 'TITI ANDAYANI. NY, MT');
INSERT INTO `master_pegawai` VALUES ('915', '6476', 'B. SIGIT Y. GUNARTO, M.H.');
INSERT INTO `master_pegawai` VALUES ('916', '6478', 'DEVI SYAFRIYENI. NY, M.M');
INSERT INTO `master_pegawai` VALUES ('917', '6479', 'ESTI  WURYANI. NY,SH,M.HRM');
INSERT INTO `master_pegawai` VALUES ('918', '6480', 'IMRON, SE. MM');
INSERT INTO `master_pegawai` VALUES ('919', '6851', 'NANANG SUMARNA');
INSERT INTO `master_pegawai` VALUES ('920', '6852', 'SAMSUL ARIFIN');
INSERT INTO `master_pegawai` VALUES ('921', '6853', 'JAKON EBEN EZER, S. AP');
INSERT INTO `master_pegawai` VALUES ('922', '6854', 'SUMARKO');
INSERT INTO `master_pegawai` VALUES ('923', '6855', 'ABDUL ROHMAN');
INSERT INTO `master_pegawai` VALUES ('924', '6856', 'MUHAMAD MUKHLISIN');
INSERT INTO `master_pegawai` VALUES ('925', '6857', 'ADI SUHADI');
INSERT INTO `master_pegawai` VALUES ('926', '6858', 'RAMAJUDIN');
INSERT INTO `master_pegawai` VALUES ('927', '6859', 'ASEP SOPYAN, SH.');
INSERT INTO `master_pegawai` VALUES ('928', '6860', 'NANDANG MULYANA, A.Md.');
INSERT INTO `master_pegawai` VALUES ('929', '6861', 'AHMAD SURYO, A.Md.');
INSERT INTO `master_pegawai` VALUES ('930', '6862', 'WIDIANTO, S.Kom');
INSERT INTO `master_pegawai` VALUES ('931', '6863', 'SATRIA DWI MURYANTO');
INSERT INTO `master_pegawai` VALUES ('932', '6864', 'ARSENDI NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('933', '6865', 'AHMAD ZULFIQAR');
INSERT INTO `master_pegawai` VALUES ('934', '6866', 'EKA DANAR NUR ENDRA, S.T');
INSERT INTO `master_pegawai` VALUES ('935', '6867', 'MUHAMAD ARIANSYAH, S.Si.');
INSERT INTO `master_pegawai` VALUES ('936', '6868', 'FUGUH PRASTIYO, S.T');
INSERT INTO `master_pegawai` VALUES ('937', '6869', 'BERRY SUPRIMA ABDUL KADIR');
INSERT INTO `master_pegawai` VALUES ('938', '6871', 'ANANG SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('939', '6872', 'HARI YULIANSYAH, S.E.');
INSERT INTO `master_pegawai` VALUES ('940', '6873', 'SUYARNO');
INSERT INTO `master_pegawai` VALUES ('941', '6874', 'SUHERMAN');
INSERT INTO `master_pegawai` VALUES ('942', '6875', 'ASEP HAERUDIN');
INSERT INTO `master_pegawai` VALUES ('943', '6876', 'SUWITO');
INSERT INTO `master_pegawai` VALUES ('944', '6877', 'KUSNAEDI');
INSERT INTO `master_pegawai` VALUES ('945', '6878', 'MUHAMAD HUSEIN');
INSERT INTO `master_pegawai` VALUES ('946', '6657', 'AGUS RIYADI');
INSERT INTO `master_pegawai` VALUES ('947', '6658', 'AJI GUNAWAN W.');
INSERT INTO `master_pegawai` VALUES ('948', '6659', 'ANDIK KRISTIAWAN');
INSERT INTO `master_pegawai` VALUES ('949', '6660', 'DICKY SUNINGRAT');
INSERT INTO `master_pegawai` VALUES ('950', '6661', 'ANDI WARDOYO');
INSERT INTO `master_pegawai` VALUES ('951', '6662', 'MULYANA');
INSERT INTO `master_pegawai` VALUES ('952', '6663', 'ATEN NURABDILLAH');
INSERT INTO `master_pegawai` VALUES ('953', '6664', 'AGIH MUJI RAHARJO');
INSERT INTO `master_pegawai` VALUES ('954', '6665', 'APIT SUHENDAR');
INSERT INTO `master_pegawai` VALUES ('955', '6666', 'JAELANI');
INSERT INTO `master_pegawai` VALUES ('956', '6667', 'CHABIB MUSLIH');
INSERT INTO `master_pegawai` VALUES ('957', '6668', 'OTANG RODIANA');
INSERT INTO `master_pegawai` VALUES ('958', '6669', 'DANI MULYANA');
INSERT INTO `master_pegawai` VALUES ('959', '6670', 'IHSAN BUDIMAN');
INSERT INTO `master_pegawai` VALUES ('960', '6671', 'ABDUL MUJIB');
INSERT INTO `master_pegawai` VALUES ('961', '6672', 'IRVAN DWIYANTO');
INSERT INTO `master_pegawai` VALUES ('962', '6673', 'DIDI SETIADIE');
INSERT INTO `master_pegawai` VALUES ('963', '6674', 'AJAT SUDRAJAT, A.Md.');
INSERT INTO `master_pegawai` VALUES ('964', '6675', 'NARIANA SUKMA');
INSERT INTO `master_pegawai` VALUES ('965', '6676', 'DEDI ISKANDAR');
INSERT INTO `master_pegawai` VALUES ('966', '6677', 'OKE KUSUMAWARDANA');
INSERT INTO `master_pegawai` VALUES ('967', '6678', 'NUGRAHA INDRA KUSUMA');
INSERT INTO `master_pegawai` VALUES ('968', '6679', 'MOH. ROHMATULLAH SIDIQ, SE.');
INSERT INTO `master_pegawai` VALUES ('969', '6681', 'SAYONO');
INSERT INTO `master_pegawai` VALUES ('970', '6682', 'AJAT SUDRAJAT');
INSERT INTO `master_pegawai` VALUES ('971', '6683', 'DIDI JUARDI');
INSERT INTO `master_pegawai` VALUES ('972', '6684', 'WAGIYONO');
INSERT INTO `master_pegawai` VALUES ('973', '6685', 'SUSANTO');
INSERT INTO `master_pegawai` VALUES ('974', '6686', 'MEMEN PERMANA');
INSERT INTO `master_pegawai` VALUES ('975', '6687', 'SINGGIH SUPRIYANTO');
INSERT INTO `master_pegawai` VALUES ('976', '6688', 'RUSWAN DIATNA');
INSERT INTO `master_pegawai` VALUES ('977', '6689', 'FETTY BRIAN');
INSERT INTO `master_pegawai` VALUES ('978', '6690', 'DIAN ARIA SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('979', '6691', 'PRIYANTO');
INSERT INTO `master_pegawai` VALUES ('980', '6692', 'RIDWAN GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('981', '6693', 'FITANTO WIBISONO');
INSERT INTO `master_pegawai` VALUES ('982', '6694', 'ANDI AHMADI');
INSERT INTO `master_pegawai` VALUES ('983', '6695', 'JAMALUDIN');
INSERT INTO `master_pegawai` VALUES ('984', '6696', 'IZUDYN CHOLIQ');
INSERT INTO `master_pegawai` VALUES ('985', '6697', 'NUGROHO');
INSERT INTO `master_pegawai` VALUES ('986', '6698', 'TAOFIK HIDAYAT TUROCHMAN');
INSERT INTO `master_pegawai` VALUES ('987', '6699', 'ANDI MAULANA');
INSERT INTO `master_pegawai` VALUES ('988', '6700', 'RAHMATULLAH, S.T.');
INSERT INTO `master_pegawai` VALUES ('989', '6701', 'AGUS SUSILO, A.MD');
INSERT INTO `master_pegawai` VALUES ('990', '6702', 'DEDE RUDIANSYAH');
INSERT INTO `master_pegawai` VALUES ('991', '6703', 'TRI ASTO WIJUNARKO');
INSERT INTO `master_pegawai` VALUES ('992', '6704', 'SUMARNO, A.MD');
INSERT INTO `master_pegawai` VALUES ('993', '6705', 'CUCU BUSTAMIL, A.MD');
INSERT INTO `master_pegawai` VALUES ('994', '6707', 'MGS. M. WELLY, A.MD');
INSERT INTO `master_pegawai` VALUES ('995', '6708', 'RUDI RAHARDJO, S.Kom');
INSERT INTO `master_pegawai` VALUES ('996', '6709', 'NURWANDI, ST');
INSERT INTO `master_pegawai` VALUES ('997', '6710', 'HEMMY SEFRYATI .NY');
INSERT INTO `master_pegawai` VALUES ('998', '6711', 'HANDI BROTO SUKADMO, S.IP');
INSERT INTO `master_pegawai` VALUES ('999', '6712', 'RAHMAT SUMAHYAR');
INSERT INTO `master_pegawai` VALUES ('1000', '6713', 'NURHAYATI .NY');
INSERT INTO `master_pegawai` VALUES ('1001', '6714', 'HENDRA KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1002', '6715', 'DENDI ISBANDIRI');
INSERT INTO `master_pegawai` VALUES ('1003', '6716', 'YANA RUSLIANA');
INSERT INTO `master_pegawai` VALUES ('1004', '6717', 'IRWAN NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('1005', '6718', 'FAHMI FADILAH HASAN, SE');
INSERT INTO `master_pegawai` VALUES ('1006', '6719', 'NANA RUSMANA, ST');
INSERT INTO `master_pegawai` VALUES ('1007', '6720', 'HENGKI SULAIMAN');
INSERT INTO `master_pegawai` VALUES ('1008', '6721', 'TEGUH KURNIAWAN, SE');
INSERT INTO `master_pegawai` VALUES ('1009', '6722', 'IMAN SULAEMAN, ST');
INSERT INTO `master_pegawai` VALUES ('1010', '6723', 'JUMRONI MIFTAH');
INSERT INTO `master_pegawai` VALUES ('1011', '6724', 'UUS KUSNA SOLEH');
INSERT INTO `master_pegawai` VALUES ('1012', '6725', 'DESI SUSANTI, S.Si .NY');
INSERT INTO `master_pegawai` VALUES ('1013', '6726', 'NINING NURHERLINA .NY');
INSERT INTO `master_pegawai` VALUES ('1014', '6727', 'SURATNO, S.M.');
INSERT INTO `master_pegawai` VALUES ('1015', '6728', 'WARDI');
INSERT INTO `master_pegawai` VALUES ('1016', '6730', 'ERWIN NURLATA');
INSERT INTO `master_pegawai` VALUES ('1017', '6732', 'SRI MARYATI .NY');
INSERT INTO `master_pegawai` VALUES ('1018', '6734', 'TRI HARTANTO');
INSERT INTO `master_pegawai` VALUES ('1019', '6736', 'SUHENDI');
INSERT INTO `master_pegawai` VALUES ('1020', '6737', 'MEYLANIA ANGGORO K. .NY');
INSERT INTO `master_pegawai` VALUES ('1021', '6738', 'SITI FAIZATUL I., A.MD .NY');
INSERT INTO `master_pegawai` VALUES ('1022', '6739', 'SAADAH');
INSERT INTO `master_pegawai` VALUES ('1023', '6740', 'MAYRINA .NY');
INSERT INTO `master_pegawai` VALUES ('1024', '6741', 'ARIF FACHRUDIN');
INSERT INTO `master_pegawai` VALUES ('1025', '6742', 'ARIFIN, ST');
INSERT INTO `master_pegawai` VALUES ('1026', '6743', 'INDRA SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('1027', '6744', 'HARI SANTOSO, A.MD.');
INSERT INTO `master_pegawai` VALUES ('1028', '6745', 'DWI YULIANTO');
INSERT INTO `master_pegawai` VALUES ('1029', '6746', 'HARYO AGUNG PRIBADHI, ST');
INSERT INTO `master_pegawai` VALUES ('1030', '6747', 'TRIYANTO');
INSERT INTO `master_pegawai` VALUES ('1031', '6748', 'AGUS NUGROHO');
INSERT INTO `master_pegawai` VALUES ('1032', '6749', 'NANANG KOSIM');
INSERT INTO `master_pegawai` VALUES ('1033', '6750', 'HENDRY SUGANDARI');
INSERT INTO `master_pegawai` VALUES ('1034', '6751', 'OKY IRAWAN, A.MD.');
INSERT INTO `master_pegawai` VALUES ('1035', '6752', 'UMUM BAHRUDIN');
INSERT INTO `master_pegawai` VALUES ('1036', '6753', 'YADHI NURCAHYADI');
INSERT INTO `master_pegawai` VALUES ('1037', '6754', 'ADHI JAYA');
INSERT INTO `master_pegawai` VALUES ('1038', '6755', 'ROHMADI');
INSERT INTO `master_pegawai` VALUES ('1039', '6756', 'SRIYANTO');
INSERT INTO `master_pegawai` VALUES ('1040', '6757', 'LISTI NURAENI. NN. S.S');
INSERT INTO `master_pegawai` VALUES ('1041', '6758', 'GATOT TRIYANTO');
INSERT INTO `master_pegawai` VALUES ('1042', '6759', 'NOPRIANSYAH RUSMAWAN');
INSERT INTO `master_pegawai` VALUES ('1043', '6760', 'AGUNG TRISNANDAR, S.Kom');
INSERT INTO `master_pegawai` VALUES ('1044', '6761', 'FUJI PEBRI, S. Kom');
INSERT INTO `master_pegawai` VALUES ('1045', '6762', 'WAWAN SETIAWAN, S.Kom.');
INSERT INTO `master_pegawai` VALUES ('1046', '6763', 'TEDI HERMAWAN, ST');
INSERT INTO `master_pegawai` VALUES ('1047', '6764', 'PRIYANTO AKHMAD S.  S. Kom');
INSERT INTO `master_pegawai` VALUES ('1048', '6765', 'MUHAMMAD AGUS MUNIR, S.Pd');
INSERT INTO `master_pegawai` VALUES ('1049', '6766', 'CIPTO GUNAWAN, SE');
INSERT INTO `master_pegawai` VALUES ('1050', '6767', 'ANDRY');
INSERT INTO `master_pegawai` VALUES ('1051', '6768', 'ADE SURAHMAN');
INSERT INTO `master_pegawai` VALUES ('1052', '6769', 'ROSYIDI');
INSERT INTO `master_pegawai` VALUES ('1053', '6770', 'ABDULLAH');
INSERT INTO `master_pegawai` VALUES ('1054', '6771', 'ANDRI SUNANDAR');
INSERT INTO `master_pegawai` VALUES ('1055', '6772', 'A. NAZARUDIN KAMIL');
INSERT INTO `master_pegawai` VALUES ('1056', '6773', 'EMBAY BAEHAKI');
INSERT INTO `master_pegawai` VALUES ('1057', '6774', 'TERRY HERMANTO H. S, Tr. Graf');
INSERT INTO `master_pegawai` VALUES ('1058', '6775', 'ANDREAS BUDI PRASETYO');
INSERT INTO `master_pegawai` VALUES ('1059', '6776', 'Y.M. OCTAVIANUS SURYADI');
INSERT INTO `master_pegawai` VALUES ('1060', '6777', 'AGUS PRIATNA');
INSERT INTO `master_pegawai` VALUES ('1061', '6778', 'ANDIK CAHYONO');
INSERT INTO `master_pegawai` VALUES ('1062', '6779', 'TRI MURYANTO');
INSERT INTO `master_pegawai` VALUES ('1063', '6780', 'HERU HAERUDIN');
INSERT INTO `master_pegawai` VALUES ('1064', '6781', 'MUHAMAD SUHANDA DWI P');
INSERT INTO `master_pegawai` VALUES ('1065', '6782', 'ABDUL ROHIM');
INSERT INTO `master_pegawai` VALUES ('1066', '6783', 'ANDRIAN HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('1067', '6784', 'RD. HENDRA GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('1068', '6785', 'PUSPO WIYONO');
INSERT INTO `master_pegawai` VALUES ('1069', '6786', 'ANDREY FIRDAUS');
INSERT INTO `master_pegawai` VALUES ('1070', '6787', 'YAN HERYANA');
INSERT INTO `master_pegawai` VALUES ('1071', '6788', 'ARDI ARIF, S.T.');
INSERT INTO `master_pegawai` VALUES ('1072', '6789', 'ENCUM MULYANA');
INSERT INTO `master_pegawai` VALUES ('1073', '6790', 'SAYUDI');
INSERT INTO `master_pegawai` VALUES ('1074', '6791', 'NOFIK RUSWANTO, ST');
INSERT INTO `master_pegawai` VALUES ('1075', '6792', 'SUWANDI');
INSERT INTO `master_pegawai` VALUES ('1076', '6793', 'DEDEN JUMANTRI');
INSERT INTO `master_pegawai` VALUES ('1077', '6794', 'MUKTI DWI PRASETYO, ST');
INSERT INTO `master_pegawai` VALUES ('1078', '6795', 'YUDI SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('1079', '6796', 'AHMAD RAMADHAN, S.Si');
INSERT INTO `master_pegawai` VALUES ('1080', '6797', 'ANTO KURNIA SETIONO');
INSERT INTO `master_pegawai` VALUES ('1081', '6798', 'HERYANDI');
INSERT INTO `master_pegawai` VALUES ('1082', '6799', 'PARJONO');
INSERT INTO `master_pegawai` VALUES ('1083', '6800', 'BIMO ADITYA HUWAE');
INSERT INTO `master_pegawai` VALUES ('1084', '6801', 'ANDRI ISKANDAR');
INSERT INTO `master_pegawai` VALUES ('1085', '6802', 'ADI LISTALUHU');
INSERT INTO `master_pegawai` VALUES ('1086', '6803', 'AJIM MAD\' ARIF');
INSERT INTO `master_pegawai` VALUES ('1087', '6804', 'RINTO SUSANTO');
INSERT INTO `master_pegawai` VALUES ('1088', '6805', 'ANDI IRTANTO, ST');
INSERT INTO `master_pegawai` VALUES ('1089', '6806', 'M.TEGUH RIBOWO');
INSERT INTO `master_pegawai` VALUES ('1090', '6807', 'SAEPUDIN');
INSERT INTO `master_pegawai` VALUES ('1091', '6808', 'RAHMAT NURDIANSYAH');
INSERT INTO `master_pegawai` VALUES ('1092', '6809', 'BAMBANG PARDIYANSYAH');
INSERT INTO `master_pegawai` VALUES ('1093', '6810', 'ENDAY SUHENDAR');
INSERT INTO `master_pegawai` VALUES ('1094', '6811', 'TRI SUHARYANTO');
INSERT INTO `master_pegawai` VALUES ('1095', '6812', 'ESY ATIKA');
INSERT INTO `master_pegawai` VALUES ('1096', '6813', 'YANA SUPRIYATMAN');
INSERT INTO `master_pegawai` VALUES ('1097', '6814', 'TRIO SANJAYA PUTRA');
INSERT INTO `master_pegawai` VALUES ('1098', '6815', 'YULI PUJIYANTO SUKINO');
INSERT INTO `master_pegawai` VALUES ('1099', '6816', 'INA MULYANI');
INSERT INTO `master_pegawai` VALUES ('1100', '6818', 'SITTI KRISNA MARYANI, A.MD');
INSERT INTO `master_pegawai` VALUES ('1101', '6819', 'WINANIK');
INSERT INTO `master_pegawai` VALUES ('1102', '6820', 'RIA ISNAWATI, SE');
INSERT INTO `master_pegawai` VALUES ('1103', '6821', 'DETY KUSUMAWATI, A.MD');
INSERT INTO `master_pegawai` VALUES ('1104', '6822', 'DANA ISKANDAR');
INSERT INTO `master_pegawai` VALUES ('1105', '6823', 'KORIN SUHERMAN');
INSERT INTO `master_pegawai` VALUES ('1106', '6824', 'SAEPUL DAHLAN');
INSERT INTO `master_pegawai` VALUES ('1107', '6825', 'ARI KOMARA');
INSERT INTO `master_pegawai` VALUES ('1108', '6826', 'ANDHIKA KUSUMA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1109', '6828', 'FRANS MEI WARDANA, S.KOM');
INSERT INTO `master_pegawai` VALUES ('1110', '6829', 'ALFA MAHENDAR, S.KOM');
INSERT INTO `master_pegawai` VALUES ('1111', '6830', 'LISA FITRIAWATY HIPPY, SE');
INSERT INTO `master_pegawai` VALUES ('1112', '6831', 'Ny. ROSSY AVRINI, S.E.Ak.');
INSERT INTO `master_pegawai` VALUES ('1113', '6832', 'ADI SUNARDI, SE');
INSERT INTO `master_pegawai` VALUES ('1114', '6833', 'DANANG WIDHI WITOKO, SE');
INSERT INTO `master_pegawai` VALUES ('1115', '6834', 'LIONIDYA MARHAERA, NY, S.T');
INSERT INTO `master_pegawai` VALUES ('1116', '6835', 'ANDY SUSILO, S.KOM');
INSERT INTO `master_pegawai` VALUES ('1117', '6836', 'MAULUDY HIJRIANSYAH, SE');
INSERT INTO `master_pegawai` VALUES ('1118', '6840', 'SREY MARIATI HUTABARAT, SE');
INSERT INTO `master_pegawai` VALUES ('1119', '6841', 'ROSEVINE SARITA OCTAVIANA, SH');
INSERT INTO `master_pegawai` VALUES ('1120', '6842', 'MIA NOVRIANTI FAJRINIA, SE');
INSERT INTO `master_pegawai` VALUES ('1121', '6844', 'MOKHAMAD ARIF KUSUMANAGARA, SE');
INSERT INTO `master_pegawai` VALUES ('1122', '6848', 'SUKMAJAYA, S.Si., MM');
INSERT INTO `master_pegawai` VALUES ('1123', '6850', 'EDI SUSANTO');
INSERT INTO `master_pegawai` VALUES ('1124', '6906', 'SOFYAN MAHAFIR HABIBI');
INSERT INTO `master_pegawai` VALUES ('1125', '6907', 'KUSNADI');
INSERT INTO `master_pegawai` VALUES ('1126', '6908', 'BUDI SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('1127', '6909', 'SONY KOESDARYANTO');
INSERT INTO `master_pegawai` VALUES ('1128', '6910', 'SUPARYADI NUGROHO');
INSERT INTO `master_pegawai` VALUES ('1129', '6911', 'GUSTAMI');
INSERT INTO `master_pegawai` VALUES ('1130', '6912', 'MUCHAMAD SAUDIN');
INSERT INTO `master_pegawai` VALUES ('1131', '6913', 'ANDRI WIDODO');
INSERT INTO `master_pegawai` VALUES ('1132', '6914', 'DONI WIJAYANTO');
INSERT INTO `master_pegawai` VALUES ('1133', '6915', 'FECILITAS ARIS TRI PRASETYO');
INSERT INTO `master_pegawai` VALUES ('1134', '6916', 'RENDY RAMDHAN ERRIONO');
INSERT INTO `master_pegawai` VALUES ('1135', '6917', 'MARTANTO');
INSERT INTO `master_pegawai` VALUES ('1136', '6918', 'ROBBI FEBRIYANTO');
INSERT INTO `master_pegawai` VALUES ('1137', '6919', 'AJI SURYANA');
INSERT INTO `master_pegawai` VALUES ('1138', '6920', 'IIS SUPRIADI');
INSERT INTO `master_pegawai` VALUES ('1139', '6921', 'EDY KARYADI');
INSERT INTO `master_pegawai` VALUES ('1140', '6922', 'KARYANA');
INSERT INTO `master_pegawai` VALUES ('1141', '6923', 'TATAS HARIMAN');
INSERT INTO `master_pegawai` VALUES ('1142', '6924', 'SUKAMTO');
INSERT INTO `master_pegawai` VALUES ('1143', '6925', 'YOHANES CHANDRA K. S.Tr. Graf');
INSERT INTO `master_pegawai` VALUES ('1144', '6926', 'ABU BAKAR');
INSERT INTO `master_pegawai` VALUES ('1145', '6927', 'ARIA DANU CAKRA NINGRAT');
INSERT INTO `master_pegawai` VALUES ('1146', '6928', 'EDWIN FEBRIANSYAH');
INSERT INTO `master_pegawai` VALUES ('1147', '6929', 'MUHIDIN');
INSERT INTO `master_pegawai` VALUES ('1148', '6930', 'MUHAMMAD YASIN');
INSERT INTO `master_pegawai` VALUES ('1149', '6931', 'SUPRAYOGI UTAMA');
INSERT INTO `master_pegawai` VALUES ('1150', '6932', 'ARI SUSANTO');
INSERT INTO `master_pegawai` VALUES ('1151', '6933', 'MUHAMMAD BACHTIAR ANUR');
INSERT INTO `master_pegawai` VALUES ('1152', '6934', 'WAHYU FIRMANSAH, S.Sos');
INSERT INTO `master_pegawai` VALUES ('1153', '6935', 'RETNANTO ADI, ST');
INSERT INTO `master_pegawai` VALUES ('1154', '6936', 'MAKMUN HAMIDI');
INSERT INTO `master_pegawai` VALUES ('1155', '6937', 'OKKY ANDRIANES');
INSERT INTO `master_pegawai` VALUES ('1156', '6938', 'MULIA HAMZAH');
INSERT INTO `master_pegawai` VALUES ('1157', '6939', 'RAKHMAT SYAHIDIN');
INSERT INTO `master_pegawai` VALUES ('1158', '6940', 'SENTOT PRASOJO');
INSERT INTO `master_pegawai` VALUES ('1159', '6941', 'EBNU SOLEH KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1160', '6942', 'ANDI EKO CAHYONO');
INSERT INTO `master_pegawai` VALUES ('1161', '6943', 'JERI DARMAWAN');
INSERT INTO `master_pegawai` VALUES ('1162', '6944', 'DENI ADIAR, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1163', '6945', 'MOHAMAD OCTARIADY PRATOMO');
INSERT INTO `master_pegawai` VALUES ('1164', '6946', 'EMAN SUHERMAN, SE');
INSERT INTO `master_pegawai` VALUES ('1165', '6947', 'YAYAN SURYANA');
INSERT INTO `master_pegawai` VALUES ('1166', '6949', 'AGUS MUHAJIR');
INSERT INTO `master_pegawai` VALUES ('1167', '6950', 'MUHAMAD RULLI MAULANA');
INSERT INTO `master_pegawai` VALUES ('1168', '6951', 'KMS. IHSAN');
INSERT INTO `master_pegawai` VALUES ('1169', '6952', 'FIDRIYAN NURWANTO');
INSERT INTO `master_pegawai` VALUES ('1170', '6953', 'MOHAMAD ARIEF WICAKSONO');
INSERT INTO `master_pegawai` VALUES ('1171', '6954', 'HARIYANTO');
INSERT INTO `master_pegawai` VALUES ('1172', '6955', 'ASRI EKO MARDIANTO');
INSERT INTO `master_pegawai` VALUES ('1173', '6956', 'DUDUNG MULYANA, A.Md');
INSERT INTO `master_pegawai` VALUES ('1174', '6957', 'JOKO JOYO SANTOSO');
INSERT INTO `master_pegawai` VALUES ('1175', '6958', 'ABDUL AZIZ');
INSERT INTO `master_pegawai` VALUES ('1176', '6959', 'PURWA IRAWAN');
INSERT INTO `master_pegawai` VALUES ('1177', '6960', 'FITRIANI');
INSERT INTO `master_pegawai` VALUES ('1178', '6961', 'KUSNADI');
INSERT INTO `master_pegawai` VALUES ('1179', '6962', 'GANJAR SUNARYA');
INSERT INTO `master_pegawai` VALUES ('1180', '6963', 'TRI ARI WIBOWO');
INSERT INTO `master_pegawai` VALUES ('1181', '6964', 'IDA HAFITRI, A.Md');
INSERT INTO `master_pegawai` VALUES ('1182', '6965', 'GALIH SUKMA HENDRAWAN');
INSERT INTO `master_pegawai` VALUES ('1183', '6966', 'ARIFUDIN');
INSERT INTO `master_pegawai` VALUES ('1184', '6967', 'IKA KARTIKA');
INSERT INTO `master_pegawai` VALUES ('1185', '6968', 'MEMED SUMANTRI');
INSERT INTO `master_pegawai` VALUES ('1186', '6969', 'ELISNAWATY');
INSERT INTO `master_pegawai` VALUES ('1187', '6970', 'MUHAMAD BADRUDIN');
INSERT INTO `master_pegawai` VALUES ('1188', '6971', 'SIROJUL ALAM');
INSERT INTO `master_pegawai` VALUES ('1189', '6972', 'WIWIT PRATIWI');
INSERT INTO `master_pegawai` VALUES ('1190', '6973', 'ADE TITA ANITA');
INSERT INTO `master_pegawai` VALUES ('1191', '6974', 'INGGITA MAY WULAN, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1192', '6975', 'FITA NINGRUM WIBISONO');
INSERT INTO `master_pegawai` VALUES ('1193', '6976', 'ASTRI ASNURIYANTI, S.S');
INSERT INTO `master_pegawai` VALUES ('1194', '6977', 'FAISAL LUDIN');
INSERT INTO `master_pegawai` VALUES ('1195', '6978', 'TAROKHIM');
INSERT INTO `master_pegawai` VALUES ('1196', '6979', 'MUCHAMMAD NUR AFINUDDIN AZIS');
INSERT INTO `master_pegawai` VALUES ('1197', '6980', 'ACHMAD FAUZI, S.T.');
INSERT INTO `master_pegawai` VALUES ('1198', '6981', 'PURNOMO');
INSERT INTO `master_pegawai` VALUES ('1199', '6982', 'WAWAN SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('1200', '6983', 'ANTON SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('1201', '6984', 'JARWANTO');
INSERT INTO `master_pegawai` VALUES ('1202', '6985', 'CAKRA KOMARUDIN');
INSERT INTO `master_pegawai` VALUES ('1203', '6986', 'TRI PANJI SUTRISNO');
INSERT INTO `master_pegawai` VALUES ('1204', '6987', 'DWI SUPRIADI, SE');
INSERT INTO `master_pegawai` VALUES ('1205', '6988', 'RUHERDIATI');
INSERT INTO `master_pegawai` VALUES ('1206', '6989', 'IMAS MASITOH, S.Si');
INSERT INTO `master_pegawai` VALUES ('1207', '6990', 'SUNARTO');
INSERT INTO `master_pegawai` VALUES ('1208', '6991', 'HENDRO KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1209', '6992', 'M. AMIN');
INSERT INTO `master_pegawai` VALUES ('1210', '6993', 'ARIS PRIHARTONO');
INSERT INTO `master_pegawai` VALUES ('1211', '6994', 'TARMO');
INSERT INTO `master_pegawai` VALUES ('1212', '6995', 'HARDI GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('1213', '6996', 'SIGIT WIBOWO');
INSERT INTO `master_pegawai` VALUES ('1214', '6997', 'WAHYU HARTANTO');
INSERT INTO `master_pegawai` VALUES ('1215', '6998', 'RUHIAT');
INSERT INTO `master_pegawai` VALUES ('1216', '6999', 'HERMAN HERYANTO');
INSERT INTO `master_pegawai` VALUES ('1217', '7000', 'DIDIN HOERUDIN');
INSERT INTO `master_pegawai` VALUES ('1218', '7001', 'SUGENG RIYADI');
INSERT INTO `master_pegawai` VALUES ('1219', '7002', 'WIJIYANA');
INSERT INTO `master_pegawai` VALUES ('1220', '7003', 'KOMARUDIN, SE');
INSERT INTO `master_pegawai` VALUES ('1221', '7004', 'YUDI SAFARI');
INSERT INTO `master_pegawai` VALUES ('1222', '7005', 'SRIYONO');
INSERT INTO `master_pegawai` VALUES ('1223', '7006', 'IMRON');
INSERT INTO `master_pegawai` VALUES ('1224', '7007', 'NDARU AGUNG PRASETYO');
INSERT INTO `master_pegawai` VALUES ('1225', '7008', 'ZAILANI');
INSERT INTO `master_pegawai` VALUES ('1226', '7009', 'DENI, S.HI');
INSERT INTO `master_pegawai` VALUES ('1227', '7010', 'YUFI ANTANA KUSUMA, SH');
INSERT INTO `master_pegawai` VALUES ('1228', '7011', 'JOKO TRI JATMIKO');
INSERT INTO `master_pegawai` VALUES ('1229', '7012', 'KUNTJORO P.H., A.Md');
INSERT INTO `master_pegawai` VALUES ('1230', '7014', 'ANGGI NURBAYU');
INSERT INTO `master_pegawai` VALUES ('1231', '7015', 'DEVI AMBARWATI');
INSERT INTO `master_pegawai` VALUES ('1232', '7016', 'ROFIKUL ANSORI');
INSERT INTO `master_pegawai` VALUES ('1233', '7017', 'DADANG RIONO');
INSERT INTO `master_pegawai` VALUES ('1234', '7018', 'MUJI SYUKUR');
INSERT INTO `master_pegawai` VALUES ('1235', '7019', 'FAJAR SUBEKTI HERIJANTO, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1236', '7020', 'MAFUT JAHRODIN, SE');
INSERT INTO `master_pegawai` VALUES ('1237', '7021', 'ANDRIANSYAH');
INSERT INTO `master_pegawai` VALUES ('1238', '7022', 'CEPY RIYANI');
INSERT INTO `master_pegawai` VALUES ('1239', '7023', 'CICIN YUNINGSIH');
INSERT INTO `master_pegawai` VALUES ('1240', '7024', 'SUMIYARSIH PRATIWI, A.Md');
INSERT INTO `master_pegawai` VALUES ('1241', '7025', 'HARI ISWANTO');
INSERT INTO `master_pegawai` VALUES ('1242', '7026', 'SRI UTAMI INDARWATI, SE');
INSERT INTO `master_pegawai` VALUES ('1243', '7027', 'HARUN WALIDUDIN');
INSERT INTO `master_pegawai` VALUES ('1244', '7028', 'LUSIANA');
INSERT INTO `master_pegawai` VALUES ('1245', '7029', 'MUHAMAD SOBARI, ST');
INSERT INTO `master_pegawai` VALUES ('1246', '7030', 'NANANG ROHANDI');
INSERT INTO `master_pegawai` VALUES ('1247', '7031', 'YUDI HARI PRASETYO');
INSERT INTO `master_pegawai` VALUES ('1248', '7032', 'MUHAMAD NUR ROIS');
INSERT INTO `master_pegawai` VALUES ('1249', '7033', 'M. MAKINUDDIN');
INSERT INTO `master_pegawai` VALUES ('1250', '7034', 'TONY HAPOSAN');
INSERT INTO `master_pegawai` VALUES ('1251', '7035', 'RIENESTI, S.E.');
INSERT INTO `master_pegawai` VALUES ('1252', '7036', 'YAYU NURMALA, S.ST');
INSERT INTO `master_pegawai` VALUES ('1253', '7037', 'DWI SRI RAHAYU,  S.Pd.');
INSERT INTO `master_pegawai` VALUES ('1254', '7038', 'DWI YANDHINI, S.Si.');
INSERT INTO `master_pegawai` VALUES ('1255', '7039', 'WIDYA ROSMANIDA');
INSERT INTO `master_pegawai` VALUES ('1256', '7040', 'HENY PRIYANTINI, SE');
INSERT INTO `master_pegawai` VALUES ('1257', '7041', 'SELLY LESTARY, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1258', '7043', 'TRI WULANDARI, A.Md');
INSERT INTO `master_pegawai` VALUES ('1259', '7044', 'RIYANNI, A.Md');
INSERT INTO `master_pegawai` VALUES ('1260', '7045', 'R. RORO TEDJA PERBAWATI, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1261', '7046', 'RETNO PURWO PUSPITASARI');
INSERT INTO `master_pegawai` VALUES ('1262', '7047', 'DANIES SEDA YUSEVA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1263', '7048', 'THASWORO ARKO HUDOYO, S.T.');
INSERT INTO `master_pegawai` VALUES ('1264', '7049', 'ARIFIN WIDI PERDANA');
INSERT INTO `master_pegawai` VALUES ('1265', '7050', 'TOAT FIRDAUS');
INSERT INTO `master_pegawai` VALUES ('1266', '7051', 'DITA ADI WICAKSONO, S.Kom.');
INSERT INTO `master_pegawai` VALUES ('1267', '7052', 'GUNTUR HERMANUADI');
INSERT INTO `master_pegawai` VALUES ('1268', '7054', 'I GUSTI AYU KOMANG, S. Sos');
INSERT INTO `master_pegawai` VALUES ('1269', '7057', 'ASTRID PRATIWI, SH');
INSERT INTO `master_pegawai` VALUES ('1270', '7059', 'MUCHAMMAD REZA SUMARSANA, MH');
INSERT INTO `master_pegawai` VALUES ('1271', '7061', 'MEDIAN YULI HARTANTO, S.Kom');
INSERT INTO `master_pegawai` VALUES ('1272', '7063', 'ADHI RAHADIAN, ST');
INSERT INTO `master_pegawai` VALUES ('1273', '7064', 'USWATUN KHASANAH, ST');
INSERT INTO `master_pegawai` VALUES ('1274', '7065', 'MOEHAMMAD ARIEF FURQON, S.Kom');
INSERT INTO `master_pegawai` VALUES ('1275', '7066', 'GILANG YUDHA PRADINA, S.Ak.');
INSERT INTO `master_pegawai` VALUES ('1276', '7068', 'INDRA KOESUMAH, A.Md');
INSERT INTO `master_pegawai` VALUES ('1277', '7069', 'NUR SUPRIYADI');
INSERT INTO `master_pegawai` VALUES ('1278', '7070', 'GINTA MAHADIVA');
INSERT INTO `master_pegawai` VALUES ('1279', '7071', 'DANANG ANASA RAHARJA');
INSERT INTO `master_pegawai` VALUES ('1280', '7072', 'MOHAMAD ASEP ISKANDAR');
INSERT INTO `master_pegawai` VALUES ('1281', '7073', 'MUHAMMAD SOLAHUDIN');
INSERT INTO `master_pegawai` VALUES ('1282', '7074', 'LUTFI GHIFARI NURSYEHA');
INSERT INTO `master_pegawai` VALUES ('1283', '7075', 'AGUNG RACHMATULLAH, S.T.');
INSERT INTO `master_pegawai` VALUES ('1284', '6879', 'SOLEH MULYANA');
INSERT INTO `master_pegawai` VALUES ('1285', '6880', 'YOHANES AGUS FIKI ARI SANDI,');
INSERT INTO `master_pegawai` VALUES ('1286', '6881', 'DUDUNG MAMDUH');
INSERT INTO `master_pegawai` VALUES ('1287', '6882', 'YUDI YANTORO');
INSERT INTO `master_pegawai` VALUES ('1288', '6883', 'DIAN AFRIANSYAH');
INSERT INTO `master_pegawai` VALUES ('1289', '6884', 'HERNOMO SIDIK');
INSERT INTO `master_pegawai` VALUES ('1290', '6885', 'MOHAMMAD LATIF ABRAHAM');
INSERT INTO `master_pegawai` VALUES ('1291', '6886', 'HERU PURWANTO');
INSERT INTO `master_pegawai` VALUES ('1292', '6887', 'AFRIAN JUANDA');
INSERT INTO `master_pegawai` VALUES ('1293', '6888', 'AZZI MUBARAK, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1294', '6889', 'INSAN SUPRIYATIN');
INSERT INTO `master_pegawai` VALUES ('1295', '6890', 'BAGUS WIDODO');
INSERT INTO `master_pegawai` VALUES ('1296', '6891', 'MUHAMMAD TEGUH');
INSERT INTO `master_pegawai` VALUES ('1297', '6892', 'AGUNG SETIADI');
INSERT INTO `master_pegawai` VALUES ('1298', '6893', 'HERU DARMANTO');
INSERT INTO `master_pegawai` VALUES ('1299', '6894', 'OKI DWIKA RACHMAN');
INSERT INTO `master_pegawai` VALUES ('1300', '6895', 'ILHAM LAHARA');
INSERT INTO `master_pegawai` VALUES ('1301', '6896', 'SANDI ALAM');
INSERT INTO `master_pegawai` VALUES ('1302', '6897', 'YAN SAPRIJAL');
INSERT INTO `master_pegawai` VALUES ('1303', '6898', 'DESY AGITASARI, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1304', '6899', 'DIKY EDI FIANDI');
INSERT INTO `master_pegawai` VALUES ('1305', '6900', 'ANTONI');
INSERT INTO `master_pegawai` VALUES ('1306', '6901', 'ADI UTOMO, A.Md.T.');
INSERT INTO `master_pegawai` VALUES ('1307', '6902', 'YAYAN, S.T.');
INSERT INTO `master_pegawai` VALUES ('1308', '6903', 'DUDU SUTARNA');
INSERT INTO `master_pegawai` VALUES ('1309', '6904', 'RIFAI BEJO, S.Kom');
INSERT INTO `master_pegawai` VALUES ('1310', '6905', 'DENDEN ISKANDAR');
INSERT INTO `master_pegawai` VALUES ('1311', '7273', 'YUSUF SAMIAJI');
INSERT INTO `master_pegawai` VALUES ('1312', '7274', 'WAHID NURMAJID PERMADI');
INSERT INTO `master_pegawai` VALUES ('1313', '7275', 'ADITYA SANDI PRADANA');
INSERT INTO `master_pegawai` VALUES ('1314', '7276', 'AHMAD NUR KHASAN');
INSERT INTO `master_pegawai` VALUES ('1315', '7277', 'FAJAR MUCHAROM ARROISI');
INSERT INTO `master_pegawai` VALUES ('1316', '7278', 'HERI SISWANTO');
INSERT INTO `master_pegawai` VALUES ('1317', '7279', 'RAFRI DADANG NURRACHMAWAN');
INSERT INTO `master_pegawai` VALUES ('1318', '7280', 'RIKO AGUNG SANTOSO');
INSERT INTO `master_pegawai` VALUES ('1319', '7281', 'SANDRA SEPTIYAN YUFI');
INSERT INTO `master_pegawai` VALUES ('1320', '7282', 'SEPTIAN RACHMAD HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('1321', '7283', 'AHMAD AFIFUR RAHMAN');
INSERT INTO `master_pegawai` VALUES ('1322', '7284', 'ALIFKA ARDI AGUSTONO');
INSERT INTO `master_pegawai` VALUES ('1323', '7285', 'BAGUS PRIAMBADA');
INSERT INTO `master_pegawai` VALUES ('1324', '7286', 'AGUNG SAMUDRO');
INSERT INTO `master_pegawai` VALUES ('1325', '7287', 'ASEP FEBRIANA YUSUP');
INSERT INTO `master_pegawai` VALUES ('1326', '7288', 'JAJANG GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('1327', '7289', 'YUNAIDI KRISTIONO SAHARI');
INSERT INTO `master_pegawai` VALUES ('1328', '7290', 'ASEP HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('1329', '7291', 'LUTFI AZIZ');
INSERT INTO `master_pegawai` VALUES ('1330', '7292', 'RAHMAD IBNU SYUKUR');
INSERT INTO `master_pegawai` VALUES ('1331', '7293', 'ARIF AULIA RACHMAN');
INSERT INTO `master_pegawai` VALUES ('1332', '7294', 'IRFAN AHMAD FADILAH');
INSERT INTO `master_pegawai` VALUES ('1333', '7295', 'HAFIR ARYANTO');
INSERT INTO `master_pegawai` VALUES ('1334', '7076', 'LENI NOVIANI, ST.');
INSERT INTO `master_pegawai` VALUES ('1335', '7077', 'SEPTIAN RENDI SAYOGO');
INSERT INTO `master_pegawai` VALUES ('1336', '7078', 'ADI SURYA');
INSERT INTO `master_pegawai` VALUES ('1337', '7079', 'MISWANTO');
INSERT INTO `master_pegawai` VALUES ('1338', '7080', 'SUGENG ADI PRAYITNO');
INSERT INTO `master_pegawai` VALUES ('1339', '7081', 'WARDIYANTO');
INSERT INTO `master_pegawai` VALUES ('1340', '7082', 'ISMAIL PUJO AJI');
INSERT INTO `master_pegawai` VALUES ('1341', '7083', 'HERIYANTO');
INSERT INTO `master_pegawai` VALUES ('1342', '7084', 'APIT KUSTOMO');
INSERT INTO `master_pegawai` VALUES ('1343', '7085', 'WAHYU DWI PRASETYO');
INSERT INTO `master_pegawai` VALUES ('1344', '7086', 'SUJITO APRIANTO');
INSERT INTO `master_pegawai` VALUES ('1345', '7087', 'DENIS HANGGORO');
INSERT INTO `master_pegawai` VALUES ('1346', '7088', 'WAHYU SYAH PUTRA');
INSERT INTO `master_pegawai` VALUES ('1347', '7089', 'HERYL HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('1348', '7090', 'WAHYUDIN');
INSERT INTO `master_pegawai` VALUES ('1349', '7091', 'TONY BUDIARTO');
INSERT INTO `master_pegawai` VALUES ('1350', '7092', 'RICKY OKPRIYADI');
INSERT INTO `master_pegawai` VALUES ('1351', '7093', 'MUHAMMAD NOVIANDIKA');
INSERT INTO `master_pegawai` VALUES ('1352', '7094', 'SIGIT IRAWADI');
INSERT INTO `master_pegawai` VALUES ('1353', '7095', 'FARHAN RAMADANI MAHZAIN, SE');
INSERT INTO `master_pegawai` VALUES ('1354', '7096', 'GEOFHANI');
INSERT INTO `master_pegawai` VALUES ('1355', '7097', 'PANJI MUDO MAUREKSO');
INSERT INTO `master_pegawai` VALUES ('1356', '7098', 'AHMAD MAULANA');
INSERT INTO `master_pegawai` VALUES ('1357', '7099', 'FAJAR BUDIANTO');
INSERT INTO `master_pegawai` VALUES ('1358', '7100', 'AJAT SUDRAJAT');
INSERT INTO `master_pegawai` VALUES ('1359', '7101', 'DANI HAMDANI');
INSERT INTO `master_pegawai` VALUES ('1360', '7102', 'BAMBANG SURYONO');
INSERT INTO `master_pegawai` VALUES ('1361', '7103', 'AGENG TRESNA LIFTIYAN');
INSERT INTO `master_pegawai` VALUES ('1362', '7104', 'AGUNG SUTRISNO');
INSERT INTO `master_pegawai` VALUES ('1363', '7105', 'SRI HARTONO');
INSERT INTO `master_pegawai` VALUES ('1364', '7106', 'ZUL RACHIM');
INSERT INTO `master_pegawai` VALUES ('1365', '7107', 'MULYANTO');
INSERT INTO `master_pegawai` VALUES ('1366', '7108', 'ILHAM AWALUDIN');
INSERT INTO `master_pegawai` VALUES ('1367', '7109', 'ANDIKA YUDISTIRO');
INSERT INTO `master_pegawai` VALUES ('1368', '7110', 'DEDE KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1369', '7111', 'BANU SAGITA');
INSERT INTO `master_pegawai` VALUES ('1370', '7112', 'AHMAD YUNUS');
INSERT INTO `master_pegawai` VALUES ('1371', '7113', 'RADEN EKA BAYU MUHARAM');
INSERT INTO `master_pegawai` VALUES ('1372', '7114', 'JUMAEDI');
INSERT INTO `master_pegawai` VALUES ('1373', '7115', 'YUWANA DWI PRAKASA');
INSERT INTO `master_pegawai` VALUES ('1374', '7116', 'LUKMAN ZAMALUDIN');
INSERT INTO `master_pegawai` VALUES ('1375', '7117', 'RINO DANU AL\'MAS');
INSERT INTO `master_pegawai` VALUES ('1376', '7118', 'GALIH HARI NUGROHO');
INSERT INTO `master_pegawai` VALUES ('1377', '7119', 'BASUKI NUGROHO');
INSERT INTO `master_pegawai` VALUES ('1378', '7120', 'SUHENDI');
INSERT INTO `master_pegawai` VALUES ('1379', '7121', 'RUDI FIRMANSYAH');
INSERT INTO `master_pegawai` VALUES ('1380', '7122', 'ANANDA GALIH SUKARNO');
INSERT INTO `master_pegawai` VALUES ('1381', '7123', 'SYAHRONI AHMAD');
INSERT INTO `master_pegawai` VALUES ('1382', '7124', 'AWAN HARI WICAKSONO');
INSERT INTO `master_pegawai` VALUES ('1383', '7125', 'TAUFIQ HIMBAR SUDIARTO');
INSERT INTO `master_pegawai` VALUES ('1384', '7126', 'KARNA WIRA');
INSERT INTO `master_pegawai` VALUES ('1385', '7127', 'AZIZ, A.Md');
INSERT INTO `master_pegawai` VALUES ('1386', '7128', 'AAN MULYADI');
INSERT INTO `master_pegawai` VALUES ('1387', '7129', 'NUNUY NURJANAH, A.Md');
INSERT INTO `master_pegawai` VALUES ('1388', '7130', 'YIYIN MARYANI');
INSERT INTO `master_pegawai` VALUES ('1389', '7131', 'NITA SEPTIANA AMALIA, A.Md');
INSERT INTO `master_pegawai` VALUES ('1390', '7132', 'KURNIA SARI, S.AP');
INSERT INTO `master_pegawai` VALUES ('1391', '7133', 'UUN NURYATI');
INSERT INTO `master_pegawai` VALUES ('1392', '7134', 'GAN GAN HENDRASUGANNA, A.Md');
INSERT INTO `master_pegawai` VALUES ('1393', '7135', 'NURHAYATI, A.Md');
INSERT INTO `master_pegawai` VALUES ('1394', '7136', 'INDRA OKTA FANCA, ST');
INSERT INTO `master_pegawai` VALUES ('1395', '7137', 'YUDI TIAS');
INSERT INTO `master_pegawai` VALUES ('1396', '7138', 'SURALI, A.Md');
INSERT INTO `master_pegawai` VALUES ('1397', '7139', 'NOVITA TRI TJAHYA, A.Md');
INSERT INTO `master_pegawai` VALUES ('1398', '7140', 'AKHMAD SUGANDI');
INSERT INTO `master_pegawai` VALUES ('1399', '7141', 'LIGAR DEWI TRI');
INSERT INTO `master_pegawai` VALUES ('1400', '7142', 'PANDRA ADITHIYA NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('1401', '7143', 'ADE NURYAMAN');
INSERT INTO `master_pegawai` VALUES ('1402', '7144', 'TRIYONO');
INSERT INTO `master_pegawai` VALUES ('1403', '7145', 'SANDI IRAWAN');
INSERT INTO `master_pegawai` VALUES ('1404', '7146', 'FERRY FIRMANSYAH');
INSERT INTO `master_pegawai` VALUES ('1405', '7147', 'WAHYUDIN');
INSERT INTO `master_pegawai` VALUES ('1406', '7148', 'TAMIN');
INSERT INTO `master_pegawai` VALUES ('1407', '7149', 'SITI NURHAYATI');
INSERT INTO `master_pegawai` VALUES ('1408', '7150', 'ENOK SITI SOLIHAH');
INSERT INTO `master_pegawai` VALUES ('1409', '7151', 'HARRY MUHAMAD R.G.');
INSERT INTO `master_pegawai` VALUES ('1410', '7152', 'ARIF SETYAWAN');
INSERT INTO `master_pegawai` VALUES ('1411', '7154', 'REGA ROSADI');
INSERT INTO `master_pegawai` VALUES ('1412', '7155', 'DIMAS ADHITYO, A.Md');
INSERT INTO `master_pegawai` VALUES ('1413', '7156', 'ACHMAD SALAFUDIN');
INSERT INTO `master_pegawai` VALUES ('1414', '7157', 'YULIANTO');
INSERT INTO `master_pegawai` VALUES ('1415', '7158', 'DEDY DWIMULATO');
INSERT INTO `master_pegawai` VALUES ('1416', '7159', 'YANTO GUNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1417', '7160', 'IBNU YUSUP PRIANA');
INSERT INTO `master_pegawai` VALUES ('1418', '7161', 'INDRA');
INSERT INTO `master_pegawai` VALUES ('1419', '7162', 'SYA\'BANNA JUNIKAYATA');
INSERT INTO `master_pegawai` VALUES ('1420', '7163', 'M.E. SAIFUL HOLIQ');
INSERT INTO `master_pegawai` VALUES ('1421', '7164', 'DEVRI PRIYANTO');
INSERT INTO `master_pegawai` VALUES ('1422', '7165', 'DAMAS ALIET ENGGAR NAWARSHO');
INSERT INTO `master_pegawai` VALUES ('1423', '7166', 'SOLIHIN');
INSERT INTO `master_pegawai` VALUES ('1424', '7167', 'UUM SAMILUDIN');
INSERT INTO `master_pegawai` VALUES ('1425', '7168', 'TRI HARYANTO');
INSERT INTO `master_pegawai` VALUES ('1426', '7169', 'ASEP SUPRIYADI');
INSERT INTO `master_pegawai` VALUES ('1427', '7170', 'MOHAMAD NOERHADI');
INSERT INTO `master_pegawai` VALUES ('1428', '7171', 'RIZKI MALIK IBRAHIM');
INSERT INTO `master_pegawai` VALUES ('1429', '7172', 'TOMY SAHUPALA');
INSERT INTO `master_pegawai` VALUES ('1430', '7173', 'MUHIDIN');
INSERT INTO `master_pegawai` VALUES ('1431', '7174', 'BHEBE BAYU MULYA');
INSERT INTO `master_pegawai` VALUES ('1432', '7175', 'HANAFI PUTRA KUSUMA, ST');
INSERT INTO `master_pegawai` VALUES ('1433', '7176', 'ARIF MURTADHO, S.E');
INSERT INTO `master_pegawai` VALUES ('1434', '7177', 'RUDI PURWADI');
INSERT INTO `master_pegawai` VALUES ('1435', '7178', 'SADAR AMAN JAYA WARDANA');
INSERT INTO `master_pegawai` VALUES ('1436', '7179', 'BUDI PURWANTO');
INSERT INTO `master_pegawai` VALUES ('1437', '7180', 'SIGIT TRIADHI WINARSO');
INSERT INTO `master_pegawai` VALUES ('1438', '7181', 'UJANG SURYADI');
INSERT INTO `master_pegawai` VALUES ('1439', '7182', 'BUDIMAN');
INSERT INTO `master_pegawai` VALUES ('1440', '7183', 'ABDUL ROHMAN');
INSERT INTO `master_pegawai` VALUES ('1441', '7184', 'WISNU PURNAMAN');
INSERT INTO `master_pegawai` VALUES ('1442', '7185', 'ROYATI');
INSERT INTO `master_pegawai` VALUES ('1443', '7186', 'YUYUN SUHARYA');
INSERT INTO `master_pegawai` VALUES ('1444', '7187', 'M. RIZA MAUDUDI');
INSERT INTO `master_pegawai` VALUES ('1445', '7188', 'DENNY DANYAR, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1446', '7189', 'TUKKY FEBIANTO');
INSERT INTO `master_pegawai` VALUES ('1447', '7190', 'ANJAR PRIBADI');
INSERT INTO `master_pegawai` VALUES ('1448', '7191', 'AFRIKO PRAYUDHA, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1449', '7192', 'ANDRIYANA');
INSERT INTO `master_pegawai` VALUES ('1450', '7193', 'MUHAMAT SAFII');
INSERT INTO `master_pegawai` VALUES ('1451', '7195', 'SUWANDI');
INSERT INTO `master_pegawai` VALUES ('1452', '7196', 'KRISNA ANDIKA PUTRA');
INSERT INTO `master_pegawai` VALUES ('1453', '7197', 'HERMAN MAULANA YUSUP');
INSERT INTO `master_pegawai` VALUES ('1454', '7198', 'NUNUNG NURASIAH');
INSERT INTO `master_pegawai` VALUES ('1455', '7199', 'RISKA KARTIKASARI');
INSERT INTO `master_pegawai` VALUES ('1456', '7200', 'AGUS SOELISTYO');
INSERT INTO `master_pegawai` VALUES ('1457', '7201', 'DWI CAHYA');
INSERT INTO `master_pegawai` VALUES ('1458', '7202', 'KARTIKA METAWATI KURNIASIH');
INSERT INTO `master_pegawai` VALUES ('1459', '7203', 'SINGGIH DARMOKO');
INSERT INTO `master_pegawai` VALUES ('1460', '7204', 'DANANG ERI KUSMANTORO');
INSERT INTO `master_pegawai` VALUES ('1461', '7205', 'WAWAN KURNAWAN');
INSERT INTO `master_pegawai` VALUES ('1462', '7206', 'EDDY RISMANTO');
INSERT INTO `master_pegawai` VALUES ('1463', '7207', 'ADE RAHMAT');
INSERT INTO `master_pegawai` VALUES ('1464', '7208', 'ASEP SUMARTA');
INSERT INTO `master_pegawai` VALUES ('1465', '7209', 'VITA SENJAWATI');
INSERT INTO `master_pegawai` VALUES ('1466', '7210', 'SOBARI');
INSERT INTO `master_pegawai` VALUES ('1467', '7211', 'ACIH');
INSERT INTO `master_pegawai` VALUES ('1468', '7212', 'PUJIYOTO');
INSERT INTO `master_pegawai` VALUES ('1469', '7213', 'TAOFIK ISMAIL');
INSERT INTO `master_pegawai` VALUES ('1470', '7214', 'SUHARMANTO, A.Md');
INSERT INTO `master_pegawai` VALUES ('1471', '7215', 'VICCY HENDRI YULIANTI');
INSERT INTO `master_pegawai` VALUES ('1472', '7216', 'ETSA YANUAR, S.SI.');
INSERT INTO `master_pegawai` VALUES ('1473', '7217', 'SLAMET HARYANTO');
INSERT INTO `master_pegawai` VALUES ('1474', '7218', 'WANGI PRADANA PANDU BRIYAN');
INSERT INTO `master_pegawai` VALUES ('1475', '7219', 'REGGY SYABRI');
INSERT INTO `master_pegawai` VALUES ('1476', '7221', 'BAYU PRASETYO, S.Kom.');
INSERT INTO `master_pegawai` VALUES ('1477', '7222', 'ANDI YUNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1478', '7223', 'ADJI WICAKSONO');
INSERT INTO `master_pegawai` VALUES ('1479', '7224', 'SETYO EDY WIBOWO, SH.');
INSERT INTO `master_pegawai` VALUES ('1480', '7226', 'EGAR PERDANA MAULANA, S.Mn');
INSERT INTO `master_pegawai` VALUES ('1481', '7227', 'ERISA APRILIA WICAKSARI, S.E.');
INSERT INTO `master_pegawai` VALUES ('1482', '7228', 'LELI KARTIKA, SE.');
INSERT INTO `master_pegawai` VALUES ('1483', '7229', 'YASHFI HANIFAN, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1484', '7230', 'ADITYA RAHARJO, ST.');
INSERT INTO `master_pegawai` VALUES ('1485', '7231', 'SATRIYO DWI ATMOKO, S.Psi.');
INSERT INTO `master_pegawai` VALUES ('1486', '7232', 'MARIA CHRISTINA MAGDALENA,A.Md');
INSERT INTO `master_pegawai` VALUES ('1487', '7233', 'RINI DWICAHYANTI, ST.');
INSERT INTO `master_pegawai` VALUES ('1488', '7236', 'FITRIANA FRIDA AYU LESTARI, SE');
INSERT INTO `master_pegawai` VALUES ('1489', '7237', 'MUHAMMAD AGREZKA MAULA SUYUDI');
INSERT INTO `master_pegawai` VALUES ('1490', '7238', 'FAJAR BEKTI SAPUTRA, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1491', '7239', 'RATIH SUKMA PRATIWI, SE');
INSERT INTO `master_pegawai` VALUES ('1492', '7241', 'MUHAMMAD ERSHAD, SE');
INSERT INTO `master_pegawai` VALUES ('1493', '7242', 'AYU PRIHATINI, ST.');
INSERT INTO `master_pegawai` VALUES ('1494', '7243', 'DESLINA PINEM, S.E.');
INSERT INTO `master_pegawai` VALUES ('1495', '7244', 'SULARKO');
INSERT INTO `master_pegawai` VALUES ('1496', '7245', 'SURAHMAN');
INSERT INTO `master_pegawai` VALUES ('1497', '7246', 'ABDUL KHOLIQ');
INSERT INTO `master_pegawai` VALUES ('1498', '7247', 'UNDI NURCAHYA');
INSERT INTO `master_pegawai` VALUES ('1499', '7248', 'ARIS SUBHAN MUHAMMADIN');
INSERT INTO `master_pegawai` VALUES ('1500', '7249', 'TONY SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('1501', '7250', 'DWI LIANTO');
INSERT INTO `master_pegawai` VALUES ('1502', '7251', 'APRIANA');
INSERT INTO `master_pegawai` VALUES ('1503', '7252', 'GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('1504', '7253', 'BARKAH');
INSERT INTO `master_pegawai` VALUES ('1505', '7254', 'FERY ABI SULASTIONO');
INSERT INTO `master_pegawai` VALUES ('1506', '7255', 'CANDRA BAYU KRESNA');
INSERT INTO `master_pegawai` VALUES ('1507', '7256', 'IMAM SYAFINGI');
INSERT INTO `master_pegawai` VALUES ('1508', '7257', 'GILANG ADI NEKA');
INSERT INTO `master_pegawai` VALUES ('1509', '7258', 'NURMUHAROM');
INSERT INTO `master_pegawai` VALUES ('1510', '7259', 'DERI AGUSTIAN');
INSERT INTO `master_pegawai` VALUES ('1511', '7260', 'AGUS SUGIANTO');
INSERT INTO `master_pegawai` VALUES ('1512', '7261', 'JULIADI HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('1513', '7262', 'TENDI JAMALUDIN');
INSERT INTO `master_pegawai` VALUES ('1514', '7263', 'JENI');
INSERT INTO `master_pegawai` VALUES ('1515', '7264', 'RIKKI RAINALDI');
INSERT INTO `master_pegawai` VALUES ('1516', '7265', 'ISTIQOMAH');
INSERT INTO `master_pegawai` VALUES ('1517', '7266', 'TEGUH ROHMAT');
INSERT INTO `master_pegawai` VALUES ('1518', '7267', 'CHOIRUL IMAM');
INSERT INTO `master_pegawai` VALUES ('1519', '7268', 'SURYANTO');
INSERT INTO `master_pegawai` VALUES ('1520', '7269', 'ADE JUNIARDI, S.T.');
INSERT INTO `master_pegawai` VALUES ('1521', '7270', 'MUH. RIZKI MAULUDHI');
INSERT INTO `master_pegawai` VALUES ('1522', '7271', 'REALDO INOVAN');
INSERT INTO `master_pegawai` VALUES ('1523', '7272', 'YOGI PURNOMO');
INSERT INTO `master_pegawai` VALUES ('1524', '7325', 'FAJAR SUBHI');
INSERT INTO `master_pegawai` VALUES ('1525', '7326', 'MOH. KHAERUL ANWAR');
INSERT INTO `master_pegawai` VALUES ('1526', '7327', 'TEGAR RIZKY RIMAWAN');
INSERT INTO `master_pegawai` VALUES ('1527', '7328', 'DOMBI SUSILO');
INSERT INTO `master_pegawai` VALUES ('1528', '7329', 'ALFANITA CHRISMAWATI H., A.Md.');
INSERT INTO `master_pegawai` VALUES ('1529', '7330', 'TIARA AYU ARISTONEMI');
INSERT INTO `master_pegawai` VALUES ('1530', '7331', 'DONA MARDIANSYAH');
INSERT INTO `master_pegawai` VALUES ('1531', '7332', 'NONO SUWARDANI');
INSERT INTO `master_pegawai` VALUES ('1532', '7333', 'GILANG AGUNG RHAMADHAN');
INSERT INTO `master_pegawai` VALUES ('1533', '7334', 'SYAMSUDIN SYAH');
INSERT INTO `master_pegawai` VALUES ('1534', '7335', 'DIMAS SURYO NUR CAHYO');
INSERT INTO `master_pegawai` VALUES ('1535', '7336', 'RIDWAN SYAFI\'I');
INSERT INTO `master_pegawai` VALUES ('1536', '7337', 'AHMAD SOBARI');
INSERT INTO `master_pegawai` VALUES ('1537', '7338', 'DEVI SOPIAN');
INSERT INTO `master_pegawai` VALUES ('1538', '7339', 'DIAN NURIZA');
INSERT INTO `master_pegawai` VALUES ('1539', '7340', 'ROBY EFFENDI');
INSERT INTO `master_pegawai` VALUES ('1540', '7341', 'SUDARWINTO');
INSERT INTO `master_pegawai` VALUES ('1541', '7342', 'FEBRIANGGRIAWAN');
INSERT INTO `master_pegawai` VALUES ('1542', '7343', 'ALFARIS RASYDIN');
INSERT INTO `master_pegawai` VALUES ('1543', '7344', 'IMAM SYAFEI');
INSERT INTO `master_pegawai` VALUES ('1544', '7345', 'INDRA NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('1545', '7346', 'WANDA EKO PRASETYO');
INSERT INTO `master_pegawai` VALUES ('1546', '7347', 'MUHAMMAD DENI KUSWARA');
INSERT INTO `master_pegawai` VALUES ('1547', '7348', 'NASIR AMIRULLOH KUSUMAWARDANI');
INSERT INTO `master_pegawai` VALUES ('1548', '7349', 'AGUS SUSANTO');
INSERT INTO `master_pegawai` VALUES ('1549', '7350', 'DEDE ISKANDAR');
INSERT INTO `master_pegawai` VALUES ('1550', '7351', 'ARIS EKA SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('1551', '7353', 'OKY PRIBOWO');
INSERT INTO `master_pegawai` VALUES ('1552', '7354', 'AHMAD YUNIANTO');
INSERT INTO `master_pegawai` VALUES ('1553', '7355', 'NUNU NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('1554', '7356', 'NANANG SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('1555', '7357', 'ARIEF IRAWAN');
INSERT INTO `master_pegawai` VALUES ('1556', '7358', 'CASNOTO');
INSERT INTO `master_pegawai` VALUES ('1557', '7359', 'NANANG SURYANA, MSi.');
INSERT INTO `master_pegawai` VALUES ('1558', '7360', 'JUNAEDI');
INSERT INTO `master_pegawai` VALUES ('1559', '7361', 'ARIZKY PRABOWO');
INSERT INTO `master_pegawai` VALUES ('1560', '7362', 'IRIYANTO');
INSERT INTO `master_pegawai` VALUES ('1561', '7363', 'KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1562', '7364', 'ANDI ROHENDI');
INSERT INTO `master_pegawai` VALUES ('1563', '7365', 'TEGUH DARMOKO');
INSERT INTO `master_pegawai` VALUES ('1564', '7366', 'NANA RAHADIATNA');
INSERT INTO `master_pegawai` VALUES ('1565', '7367', 'YUDHA SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('1566', '7369', 'TONO HARTONO');
INSERT INTO `master_pegawai` VALUES ('1567', '7370', 'DENI HAMJAH');
INSERT INTO `master_pegawai` VALUES ('1568', '7371', 'IWAN SUNANDAR');
INSERT INTO `master_pegawai` VALUES ('1569', '7372', 'AGUS ROHMANI');
INSERT INTO `master_pegawai` VALUES ('1570', '7373', 'JATIKA SANDRA');
INSERT INTO `master_pegawai` VALUES ('1571', '7374', 'SUTOPO');
INSERT INTO `master_pegawai` VALUES ('1572', '7375', 'KRISNO SURYO UTOMO');
INSERT INTO `master_pegawai` VALUES ('1573', '7376', 'DANU SAFRIA');
INSERT INTO `master_pegawai` VALUES ('1574', '7377', 'YUSUF ADIPURA');
INSERT INTO `master_pegawai` VALUES ('1575', '7378', 'SULARDI');
INSERT INTO `master_pegawai` VALUES ('1576', '7379', 'ROJADIN');
INSERT INTO `master_pegawai` VALUES ('1577', '7380', 'KUSNADI');
INSERT INTO `master_pegawai` VALUES ('1578', '7381', 'AWALUDIN GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('1579', '7382', 'HERU PRASETYO, S.E.');
INSERT INTO `master_pegawai` VALUES ('1580', '7383', 'DAMAR TRISTIAN');
INSERT INTO `master_pegawai` VALUES ('1581', '7384', 'AZIZ SOPYAN');
INSERT INTO `master_pegawai` VALUES ('1582', '7385', 'YOGI MARDIYANTO');
INSERT INTO `master_pegawai` VALUES ('1583', '7386', 'MOH. AMIN');
INSERT INTO `master_pegawai` VALUES ('1584', '7387', 'SYAIFUL FAHRI');
INSERT INTO `master_pegawai` VALUES ('1585', '7388', 'YOTRIZAL EPENDI');
INSERT INTO `master_pegawai` VALUES ('1586', '7389', 'ADI IRMANSYAH');
INSERT INTO `master_pegawai` VALUES ('1587', '7390', 'SUDIRO');
INSERT INTO `master_pegawai` VALUES ('1588', '7391', 'HADI MAULANA');
INSERT INTO `master_pegawai` VALUES ('1589', '7392', 'RAHMADI IKHSAN');
INSERT INTO `master_pegawai` VALUES ('1590', '7393', 'LUKAS APRIANDO');
INSERT INTO `master_pegawai` VALUES ('1591', '7394', 'MOHAMAD IKMAL ISMAIL');
INSERT INTO `master_pegawai` VALUES ('1592', '7395', 'JOSAL MARTHIN');
INSERT INTO `master_pegawai` VALUES ('1593', '7396', 'RINO ALI AKBAR');
INSERT INTO `master_pegawai` VALUES ('1594', '7397', 'ARIF FIRMANSYAH');
INSERT INTO `master_pegawai` VALUES ('1595', '7398', 'SONI PARID MAULANA');
INSERT INTO `master_pegawai` VALUES ('1596', '7399', 'ADE DENI RUSLAN');
INSERT INTO `master_pegawai` VALUES ('1597', '7400', 'MUHAMMAD HUSEIN');
INSERT INTO `master_pegawai` VALUES ('1598', '7401', 'ELZA NUARI DICKIN');
INSERT INTO `master_pegawai` VALUES ('1599', '7402', 'AHMAD FAUZI');
INSERT INTO `master_pegawai` VALUES ('1600', '7403', 'SADIKIN');
INSERT INTO `master_pegawai` VALUES ('1601', '7404', 'HENDRA LESMANA');
INSERT INTO `master_pegawai` VALUES ('1602', '7405', 'TASWO');
INSERT INTO `master_pegawai` VALUES ('1603', '7406', 'IKA SUPRIADI');
INSERT INTO `master_pegawai` VALUES ('1604', '7407', 'PRINGGANDANA');
INSERT INTO `master_pegawai` VALUES ('1605', '7408', 'DWI PURWANTO');
INSERT INTO `master_pegawai` VALUES ('1606', '7409', 'SAEPULLOH');
INSERT INTO `master_pegawai` VALUES ('1607', '7410', 'AKHYARULLOH');
INSERT INTO `master_pegawai` VALUES ('1608', '7411', 'MUHAMMAD SYAHRONI');
INSERT INTO `master_pegawai` VALUES ('1609', '7412', 'SAMIN');
INSERT INTO `master_pegawai` VALUES ('1610', '7413', 'KAHRODIN');
INSERT INTO `master_pegawai` VALUES ('1611', '7414', 'PANJI UNTORO');
INSERT INTO `master_pegawai` VALUES ('1612', '7415', 'RISMANUDIN');
INSERT INTO `master_pegawai` VALUES ('1613', '7416', 'YANI ROHAYANI');
INSERT INTO `master_pegawai` VALUES ('1614', '7417', 'NITA ARTIKA');
INSERT INTO `master_pegawai` VALUES ('1615', '7418', 'MURIDIN AKBAR');
INSERT INTO `master_pegawai` VALUES ('1616', '7420', 'OFFI RAFFLY ANWAR');
INSERT INTO `master_pegawai` VALUES ('1617', '7421', 'YUSNAN SUKENDRO');
INSERT INTO `master_pegawai` VALUES ('1618', '7422', 'HARYONO');
INSERT INTO `master_pegawai` VALUES ('1619', '7423', 'HENI SUHAENI');
INSERT INTO `master_pegawai` VALUES ('1620', '7424', 'DADAN HAMDANI');
INSERT INTO `master_pegawai` VALUES ('1621', '7425', 'CHRISMANSYAH');
INSERT INTO `master_pegawai` VALUES ('1622', '7426', 'ARIS HUDIN');
INSERT INTO `master_pegawai` VALUES ('1623', '7427', 'WAHYU SULAIMAN');
INSERT INTO `master_pegawai` VALUES ('1624', '7428', 'FIKIH MUAMAR');
INSERT INTO `master_pegawai` VALUES ('1625', '7429', 'JODY ANDIKA PRATAMA');
INSERT INTO `master_pegawai` VALUES ('1626', '7430', 'INDRA SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('1627', '7431', 'KHAERUL SALEH');
INSERT INTO `master_pegawai` VALUES ('1628', '7432', 'EKO PRAYITNO');
INSERT INTO `master_pegawai` VALUES ('1629', '7433', 'ADAM DWI SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('1630', '7434', 'DJOKO PAMUNGKAS');
INSERT INTO `master_pegawai` VALUES ('1631', '7435', 'ARYA PANJI KOSWARA');
INSERT INTO `master_pegawai` VALUES ('1632', '7436', 'WAWAN HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('1633', '7437', 'SANDI PRATAMA');
INSERT INTO `master_pegawai` VALUES ('1634', '7438', 'RIKY NOVIARDI PUTRA');
INSERT INTO `master_pegawai` VALUES ('1635', '7439', 'WUWUH BEREMETA');
INSERT INTO `master_pegawai` VALUES ('1636', '7440', 'IMAM ADE PUTRA');
INSERT INTO `master_pegawai` VALUES ('1637', '7441', 'ARIE WIBOWO');
INSERT INTO `master_pegawai` VALUES ('1638', '7442', 'FABBY FRAZASTI FRIDYAN');
INSERT INTO `master_pegawai` VALUES ('1639', '7443', 'AGUS NUR KOMARA PURNOMO');
INSERT INTO `master_pegawai` VALUES ('1640', '7444', 'ASEP TAUFIK FATUROHMAN');
INSERT INTO `master_pegawai` VALUES ('1641', '7445', 'EKA SUNANDAR');
INSERT INTO `master_pegawai` VALUES ('1642', '7446', 'PANDU IRAWAN SUKMA');
INSERT INTO `master_pegawai` VALUES ('1643', '7447', 'ABDUL KARIM');
INSERT INTO `master_pegawai` VALUES ('1644', '7448', 'MUHAMAD ARI KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1645', '7449', 'CRESSA AMELIA');
INSERT INTO `master_pegawai` VALUES ('1646', '7450', 'HARIS SUSILO');
INSERT INTO `master_pegawai` VALUES ('1647', '7451', 'IRFAN');
INSERT INTO `master_pegawai` VALUES ('1648', '7452', 'SUTISNA SENJAYA');
INSERT INTO `master_pegawai` VALUES ('1649', '7453', 'AHMAD GHIFAARY');
INSERT INTO `master_pegawai` VALUES ('1650', '7454', 'MULYADI');
INSERT INTO `master_pegawai` VALUES ('1651', '7455', 'PRASETYO');
INSERT INTO `master_pegawai` VALUES ('1652', '7456', 'TRI BUDIONO');
INSERT INTO `master_pegawai` VALUES ('1653', '7457', 'PIA RIFI FAUZIAH');
INSERT INTO `master_pegawai` VALUES ('1654', '7458', 'ACHMADYAN SULISTIADI');
INSERT INTO `master_pegawai` VALUES ('1655', '7459', 'ENDARWATI MEY KARTIKASARI');
INSERT INTO `master_pegawai` VALUES ('1656', '7460', 'ARUM NOVIYANTI, S.E.');
INSERT INTO `master_pegawai` VALUES ('1657', '7461', 'YUSWAN ARYANTO');
INSERT INTO `master_pegawai` VALUES ('1658', '7462', 'HERU SISWANTO');
INSERT INTO `master_pegawai` VALUES ('1659', '7463', 'YUSRONI');
INSERT INTO `master_pegawai` VALUES ('1660', '7464', 'AGUS RUDIYANTO');
INSERT INTO `master_pegawai` VALUES ('1661', '7465', 'DENI APRIYANDI, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1662', '7466', 'GALIH GEMA RIYADI');
INSERT INTO `master_pegawai` VALUES ('1663', '7467', 'EDDYAH AYU IKA FATMALA');
INSERT INTO `master_pegawai` VALUES ('1664', '7469', 'DEFI EKO MARIANTI');
INSERT INTO `master_pegawai` VALUES ('1665', '7470', 'MUHAMMAD RADITYO ARUMBINANG');
INSERT INTO `master_pegawai` VALUES ('1666', '7471', 'MOFA ROZZY');
INSERT INTO `master_pegawai` VALUES ('1667', '7472', 'HALIMATUNNISA');
INSERT INTO `master_pegawai` VALUES ('1668', '7473', 'ARIE PRATAMA YUDHA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1669', '7474', 'FARAH FIRNAWATI');
INSERT INTO `master_pegawai` VALUES ('1670', '7475', 'MUHAMMAD SADDAM HUSSEIN');
INSERT INTO `master_pegawai` VALUES ('1671', '7476', 'DZULFIKAR SYAHBANI');
INSERT INTO `master_pegawai` VALUES ('1672', '7477', 'YUNANDA NUR HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('1673', '7478', 'AHMAD GHOZY FATHDILAH');
INSERT INTO `master_pegawai` VALUES ('1674', '7479', 'TRI SUTRISNO');
INSERT INTO `master_pegawai` VALUES ('1675', '7480', 'WISNU ANDREYAS');
INSERT INTO `master_pegawai` VALUES ('1676', '7481', 'FERIYANTO');
INSERT INTO `master_pegawai` VALUES ('1677', '7482', 'NUR ROCHMAN');
INSERT INTO `master_pegawai` VALUES ('1678', '7483', 'DAMAR ANGGORO');
INSERT INTO `master_pegawai` VALUES ('1679', '7484', 'RENDHY AGAM DHARMA SENA');
INSERT INTO `master_pegawai` VALUES ('1680', '7485', 'FATHUL AZMI ADHA');
INSERT INTO `master_pegawai` VALUES ('1681', '7487', 'RIZKY RAMADHAN');
INSERT INTO `master_pegawai` VALUES ('1682', '7488', 'RIDWAN KARTOGI');
INSERT INTO `master_pegawai` VALUES ('1683', '7489', 'EGA SYA\'BAN BUDIMAN');
INSERT INTO `master_pegawai` VALUES ('1684', '7490', 'THORIQ HIMAM ASKARILLAH');
INSERT INTO `master_pegawai` VALUES ('1685', '7491', 'YUDHA BAKTI');
INSERT INTO `master_pegawai` VALUES ('1686', '7492', 'ROZAQ HARTANTO');
INSERT INTO `master_pegawai` VALUES ('1687', '7493', 'SYARIEF NUR RACHMAN');
INSERT INTO `master_pegawai` VALUES ('1688', '7494', 'NICKHOLAS KARO KARO PURBA');
INSERT INTO `master_pegawai` VALUES ('1689', '7495', 'SANDY NURSAPUTRA ISKANDAR');
INSERT INTO `master_pegawai` VALUES ('1690', '7296', 'ABDUL RACHMAN');
INSERT INTO `master_pegawai` VALUES ('1691', '7297', 'MALEM KRISTINA, S.Ikom.');
INSERT INTO `master_pegawai` VALUES ('1692', '7298', 'SITA SETASIA');
INSERT INTO `master_pegawai` VALUES ('1693', '7299', 'RACHMADANY NUR ANISA, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1694', '7300', 'RISCA ANGGRAENI PRATIWI');
INSERT INTO `master_pegawai` VALUES ('1695', '7301', 'RISKI AMELIA, S.E.');
INSERT INTO `master_pegawai` VALUES ('1696', '7302', 'TITA PEBRIANTI');
INSERT INTO `master_pegawai` VALUES ('1697', '7303', 'RIZKY APRILLIA PUTRI');
INSERT INTO `master_pegawai` VALUES ('1698', '7304', 'ZULKARNAIN');
INSERT INTO `master_pegawai` VALUES ('1699', '7305', 'FIQIH ILHAM WIJAYA');
INSERT INTO `master_pegawai` VALUES ('1700', '7306', 'MAULANA YUSUP');
INSERT INTO `master_pegawai` VALUES ('1701', '7307', 'SUDARMAN');
INSERT INTO `master_pegawai` VALUES ('1702', '7308', 'M. ASATUL HUDA');
INSERT INTO `master_pegawai` VALUES ('1703', '7309', 'NUZA ADITYA');
INSERT INTO `master_pegawai` VALUES ('1704', '7310', 'SONY WAHYU HARDIANTO');
INSERT INTO `master_pegawai` VALUES ('1705', '7311', 'BAYU HERLAMBANG');
INSERT INTO `master_pegawai` VALUES ('1706', '7312', 'MUHAMAD NURDIN');
INSERT INTO `master_pegawai` VALUES ('1707', '7313', 'MUHAMAD IQBAL BILAWAL');
INSERT INTO `master_pegawai` VALUES ('1708', '7314', 'GALIH FIRMAN MAULANA');
INSERT INTO `master_pegawai` VALUES ('1709', '7315', 'MOHAMMAD ANDRIE WIBISONO');
INSERT INTO `master_pegawai` VALUES ('1710', '7316', 'ROMLI');
INSERT INTO `master_pegawai` VALUES ('1711', '7317', 'ASEP BUDIYANTO');
INSERT INTO `master_pegawai` VALUES ('1712', '7318', 'LUTFI SYAM\'UN AL GHOZI');
INSERT INTO `master_pegawai` VALUES ('1713', '7319', 'GALUH BUDIATMOKO');
INSERT INTO `master_pegawai` VALUES ('1714', '7320', 'DUDI HARDIMAN');
INSERT INTO `master_pegawai` VALUES ('1715', '7321', 'WAWAN NIRWAN');
INSERT INTO `master_pegawai` VALUES ('1716', '7322', 'VERY SURYA DEWATA');
INSERT INTO `master_pegawai` VALUES ('1717', '7323', 'MUNGKI RAHMAN RAMADAN');
INSERT INTO `master_pegawai` VALUES ('1718', '7324', 'SUGENG PRIHATIN');
INSERT INTO `master_pegawai` VALUES ('1719', '7706', 'PRIYAGUNG HERNAWANDRA');
INSERT INTO `master_pegawai` VALUES ('1720', '7707', 'R.AGUS SANTOSA MAHENDRA');
INSERT INTO `master_pegawai` VALUES ('1721', '7708', 'RENGGI ALEXSA');
INSERT INTO `master_pegawai` VALUES ('1722', '7709', 'RIZKI DWI CAHYO');
INSERT INTO `master_pegawai` VALUES ('1723', '7710', 'RUDI ADITIA NUGROHO');
INSERT INTO `master_pegawai` VALUES ('1724', '7711', 'SALIM');
INSERT INTO `master_pegawai` VALUES ('1725', '7712', 'SEPTIAN NURJAMAN');
INSERT INTO `master_pegawai` VALUES ('1726', '7713', 'SIGIT DWI PRASETYA');
INSERT INTO `master_pegawai` VALUES ('1727', '7714', 'SUBAKIR');
INSERT INTO `master_pegawai` VALUES ('1728', '7715', 'SULISTYO BUDI NUGROHO');
INSERT INTO `master_pegawai` VALUES ('1729', '7716', 'TAUFIK ISMAIL');
INSERT INTO `master_pegawai` VALUES ('1730', '7717', 'TEGUH SANTOSO');
INSERT INTO `master_pegawai` VALUES ('1731', '7718', 'TITO APRIYANTO');
INSERT INTO `master_pegawai` VALUES ('1732', '7719', 'WENDY');
INSERT INTO `master_pegawai` VALUES ('1733', '7720', 'WISNU GALIH AJI');
INSERT INTO `master_pegawai` VALUES ('1734', '7721', 'YOGI HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('1735', '7722', 'YONATAN RENDI TRITAMA');
INSERT INTO `master_pegawai` VALUES ('1736', '7723', 'YUSUF PRASETYO');
INSERT INTO `master_pegawai` VALUES ('1737', '7724', 'YUSUP ABDUL JAELANI');
INSERT INTO `master_pegawai` VALUES ('1738', '7725', 'ANGGIANSA');
INSERT INTO `master_pegawai` VALUES ('1739', '7726', 'ARGITHA SYAMTIANI PUTRI');
INSERT INTO `master_pegawai` VALUES ('1740', '7727', 'GALA CAHYA PAWAKA');
INSERT INTO `master_pegawai` VALUES ('1741', '7728', 'RICO HIDAYATULLOH');
INSERT INTO `master_pegawai` VALUES ('1742', 'B445', 'AGUS SUKOTJO');
INSERT INTO `master_pegawai` VALUES ('1743', 'B452', 'RESTAULIN RAHMAWATI PASARIBU');
INSERT INTO `master_pegawai` VALUES ('1744', 'B503', 'RONALD H SINAGA');
INSERT INTO `master_pegawai` VALUES ('1745', 'B504', 'EDDY KURNIA');
INSERT INTO `master_pegawai` VALUES ('1746', 'B651', 'JULIANSAH');
INSERT INTO `master_pegawai` VALUES ('1747', 'B654', 'DJEJADI');
INSERT INTO `master_pegawai` VALUES ('1748', 'B747', 'SARWOTO');
INSERT INTO `master_pegawai` VALUES ('1749', 'B748', 'MAULANI');
INSERT INTO `master_pegawai` VALUES ('1750', 'B749', 'HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('1751', 'B750', 'LIMI MULYANTO');
INSERT INTO `master_pegawai` VALUES ('1752', '7496', 'REZA YULI KUSTIANTO');
INSERT INTO `master_pegawai` VALUES ('1753', '7497', 'SRI MULYONO');
INSERT INTO `master_pegawai` VALUES ('1754', '7498', 'HISYAM DHANU TAMA');
INSERT INTO `master_pegawai` VALUES ('1755', '7499', 'MOCHAMAD DUROHIM');
INSERT INTO `master_pegawai` VALUES ('1756', '7500', 'MUHAMMAD DODY WIBISONO');
INSERT INTO `master_pegawai` VALUES ('1757', '7501', 'TUTUR ADI PRATISTA');
INSERT INTO `master_pegawai` VALUES ('1758', '7502', 'AGUNG PRAYOGO');
INSERT INTO `master_pegawai` VALUES ('1759', '7503', 'RIZAL BAGUS APRIYANTO');
INSERT INTO `master_pegawai` VALUES ('1760', '7504', 'IVO NUR SUBIWA, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1761', '7505', 'PRIHANTIKA NOVITASARI');
INSERT INTO `master_pegawai` VALUES ('1762', '7506', 'EVAN SEPTANTYO NUGROHO, S.I.P.');
INSERT INTO `master_pegawai` VALUES ('1763', '7507', 'DELTA NUSANTARA, S.H., M.Kn');
INSERT INTO `master_pegawai` VALUES ('1764', '7508', 'SAFITRI NURROHMANINGRUM, S.H.');
INSERT INTO `master_pegawai` VALUES ('1765', '7509', 'ARHAM MAULANA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1766', '7510', 'CYNTHIA SUKMA RAHMANETTI, SH.');
INSERT INTO `master_pegawai` VALUES ('1767', '7512', 'RAHMAWATI PUJI LESTARI');
INSERT INTO `master_pegawai` VALUES ('1768', '7513', 'FEBRIYANTO, S.E.');
INSERT INTO `master_pegawai` VALUES ('1769', '7514', 'ARDINO YOSLAND PUTRANTO, S.E.');
INSERT INTO `master_pegawai` VALUES ('1770', '7515', 'INDRA PERDANA SIMANJUNTAK');
INSERT INTO `master_pegawai` VALUES ('1771', '7517', 'SATYA IRCHAM ALAM');
INSERT INTO `master_pegawai` VALUES ('1772', '7518', 'RAHMI MADINA');
INSERT INTO `master_pegawai` VALUES ('1773', '7519', 'MUHAMMAD SIFFA ALFALAQ, S.E.');
INSERT INTO `master_pegawai` VALUES ('1774', '7520', 'DIEN RUSDA ARINI');
INSERT INTO `master_pegawai` VALUES ('1775', '7521', 'SINGGIH SETIADI, S.E.');
INSERT INTO `master_pegawai` VALUES ('1776', '7522', 'PUTRI LIANITA, S.Mb.');
INSERT INTO `master_pegawai` VALUES ('1777', '7523', 'AHLAN SAFENA MAHMUDIN S.Tr.Graf.');
INSERT INTO `master_pegawai` VALUES ('1778', '7524', 'MASHARI SOFIAN ASMAR');
INSERT INTO `master_pegawai` VALUES ('1779', '7525', 'OKTAVIANI YURISTIANANDA, S.H.');
INSERT INTO `master_pegawai` VALUES ('1780', '7526', 'DICKY WICAKSONO, S.H.');
INSERT INTO `master_pegawai` VALUES ('1781', '7527', 'REZI SYAHPUTRA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1782', '7528', 'ALAM GENTUR KHARISMA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1783', '7529', 'FARID PRAWIRA PUTRA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1784', '7531', 'ALFADHLI, S.T.');
INSERT INTO `master_pegawai` VALUES ('1785', '7532', 'EKO SARYONO, S.E.');
INSERT INTO `master_pegawai` VALUES ('1786', '7533', 'FAISAL RAMADHANUS');
INSERT INTO `master_pegawai` VALUES ('1787', '7534', 'BIMO MUHAMMAD, S.E. Ak, C.A.');
INSERT INTO `master_pegawai` VALUES ('1788', '7535', 'DEDI KURNIAWAN, S.E.');
INSERT INTO `master_pegawai` VALUES ('1789', '7536', 'EKA ARISMIA PUTRA');
INSERT INTO `master_pegawai` VALUES ('1790', '7537', 'NOVA AMELIA BUNTANG');
INSERT INTO `master_pegawai` VALUES ('1791', '7538', 'VIVI CAROLINA ALTHEA HUTAGAOL');
INSERT INTO `master_pegawai` VALUES ('1792', '7539', 'WIDIASTUTI DWI MULYANI, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1793', '7540', 'RIPA LESTARI, S.E.');
INSERT INTO `master_pegawai` VALUES ('1794', '7541', 'FIANDY FATHONI, S.I.Kom.');
INSERT INTO `master_pegawai` VALUES ('1795', '7542', 'HUDA PERDANA SITEPU, S.I.Kom.');
INSERT INTO `master_pegawai` VALUES ('1796', '7543', 'NANDA FARA NADIA PERMATA SARI,');
INSERT INTO `master_pegawai` VALUES ('1797', '7544', 'MUHAMMAD ERFO PRATAMA, SE.,MBA');
INSERT INTO `master_pegawai` VALUES ('1798', '7545', 'HANI SABRINA, S.H.');
INSERT INTO `master_pegawai` VALUES ('1799', '7546', 'RIZKI TAMAYANTI, S.A.');
INSERT INTO `master_pegawai` VALUES ('1800', '7547', 'VERYAL ANA FITRI, S.T.');
INSERT INTO `master_pegawai` VALUES ('1801', '7548', 'GUNAWAN TRI HANDOKO, S.H.');
INSERT INTO `master_pegawai` VALUES ('1802', '7549', 'BETARI ALAMINDRA HAPSARI, S.H.');
INSERT INTO `master_pegawai` VALUES ('1803', '7550', 'SHITTA MARSELLA SUTERA, S.E.');
INSERT INTO `master_pegawai` VALUES ('1804', '7551', 'MONA JUWITA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1805', '7552', 'ARTESA GALUH KIRANA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1806', '7553', 'FAJAR MUHAMAD SUBHI, S.Si.');
INSERT INTO `master_pegawai` VALUES ('1807', '7555', 'RIAN ADITIA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1808', '7556', 'ANJAR KRESNA PUTRA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1809', '7557', 'KALPIKO WIDAGDO, S.T.');
INSERT INTO `master_pegawai` VALUES ('1810', '7558', 'ANANG NUNGKY RISTYANTO, S.T.');
INSERT INTO `master_pegawai` VALUES ('1811', '7559', 'RAHMAD BAWA SETIAWAN HARAHAP,');
INSERT INTO `master_pegawai` VALUES ('1812', '7560', 'HIDAYAT TULLAH, S.Kom.');
INSERT INTO `master_pegawai` VALUES ('1813', '7561', 'MUFI WIDYANTI, S.T.');
INSERT INTO `master_pegawai` VALUES ('1814', '7562', 'RIZKA MUHAMMAD NUR, S.H.');
INSERT INTO `master_pegawai` VALUES ('1815', '7563', 'HERI PRASETYO WIBOWO, S.H.');
INSERT INTO `master_pegawai` VALUES ('1816', '7564', 'DEWI AFRIYANTI, S.K.M.');
INSERT INTO `master_pegawai` VALUES ('1817', '7565', 'ATSNI KAUTSAR RAHMAWANI, S.K.M');
INSERT INTO `master_pegawai` VALUES ('1818', '7566', 'JANISTY AYU, S.E.');
INSERT INTO `master_pegawai` VALUES ('1819', '7567', 'SWARNO GUNAWAN SINAGA, S.E.');
INSERT INTO `master_pegawai` VALUES ('1820', '7568', 'ERMI AGUSTININGRUM, S.T.');
INSERT INTO `master_pegawai` VALUES ('1821', '7569', 'WINDA SEPTIAN, S.T.');
INSERT INTO `master_pegawai` VALUES ('1822', '7570', 'YAYANG FEBRIANSYAH');
INSERT INTO `master_pegawai` VALUES ('1823', '7571', 'HADI SANTOSO');
INSERT INTO `master_pegawai` VALUES ('1824', '7572', 'IKHSAN ARIF GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('1825', '7573', 'WARIS AL QORNI NURDIEN');
INSERT INTO `master_pegawai` VALUES ('1826', '7574', 'DEDE IRAWAN');
INSERT INTO `master_pegawai` VALUES ('1827', '7575', 'ANNISA FIRDATUN FAJRIN');
INSERT INTO `master_pegawai` VALUES ('1828', '7576', 'SRI WAHYUNI');
INSERT INTO `master_pegawai` VALUES ('1829', '7577', 'HERU AGUNG WIBOWO');
INSERT INTO `master_pegawai` VALUES ('1830', '7578', 'LILIS SUHAETI');
INSERT INTO `master_pegawai` VALUES ('1831', '7579', 'AYU SRI MUHAROMAH');
INSERT INTO `master_pegawai` VALUES ('1832', '7580', 'NURUL SAFITRI, S.E.');
INSERT INTO `master_pegawai` VALUES ('1833', '7581', 'DIAN RANU ISMAWAN, S.H.');
INSERT INTO `master_pegawai` VALUES ('1834', '7582', 'CHRISTIAN HAPOSAN S., S.I.P');
INSERT INTO `master_pegawai` VALUES ('1835', '7584', 'SYA\'BANDI DOLI SIREGAR, M.T.');
INSERT INTO `master_pegawai` VALUES ('1836', '7585', 'RIDHO KURNIAWAN, S.E.');
INSERT INTO `master_pegawai` VALUES ('1837', '7586', 'R. RADITYA ZULMAHDI H.P., S.M');
INSERT INTO `master_pegawai` VALUES ('1838', '7587', 'ADI PURNOMO, S.E.');
INSERT INTO `master_pegawai` VALUES ('1839', '7588', 'EKA INDRIYA SETYAWAN, S.E.');
INSERT INTO `master_pegawai` VALUES ('1840', '7589', 'KELIK BAYUNDARA, SE.');
INSERT INTO `master_pegawai` VALUES ('1841', '7590', 'VANYA CHAIRIYAH FITRI, S.Mb.');
INSERT INTO `master_pegawai` VALUES ('1842', '7591', 'AMELIA DWI ANDIKA, S.T.');
INSERT INTO `master_pegawai` VALUES ('1843', '7592', 'WIRASANTI DITA ANUGRAH, SE.');
INSERT INTO `master_pegawai` VALUES ('1844', '7593', 'WIRANTO FIRDAUS, S.Des.');
INSERT INTO `master_pegawai` VALUES ('1845', '7594', 'BASTIAN CARJUSA SIAHAAN, S.E.');
INSERT INTO `master_pegawai` VALUES ('1846', '7595', 'AMILA DYAN MARAYA, S.E.');
INSERT INTO `master_pegawai` VALUES ('1847', '7597', 'WIEMA ADHITYA, S.E.');
INSERT INTO `master_pegawai` VALUES ('1848', '7598', 'MEILINDA WISUDA WATI, S.E.');
INSERT INTO `master_pegawai` VALUES ('1849', '7600', 'HOLONGAN SIMANJUNTAK, ST.');
INSERT INTO `master_pegawai` VALUES ('1850', '7601', 'YAHDI LIL IHSAN, M.M.');
INSERT INTO `master_pegawai` VALUES ('1851', '7602', 'RIFQI SANDY, S.Stat.');
INSERT INTO `master_pegawai` VALUES ('1852', '7603', 'R. RIZKY YUDHA PRASETYO, SE.');
INSERT INTO `master_pegawai` VALUES ('1853', '7604', 'RONIASI SITUMORANG, SE.');
INSERT INTO `master_pegawai` VALUES ('1854', '7605', 'SEPTIAN NURFATONI, S.Pd.');
INSERT INTO `master_pegawai` VALUES ('1855', '7606', 'RIZKY KURNIAWAN PRATOMO, S.Sn.');
INSERT INTO `master_pegawai` VALUES ('1856', '7607', 'JUAN PERMANA, ST.');
INSERT INTO `master_pegawai` VALUES ('1857', '7608', 'BAYU WICAKSONO, S.Kom.');
INSERT INTO `master_pegawai` VALUES ('1858', '7609', 'AGASI RIZAL KURNIAWAN Z, ST.');
INSERT INTO `master_pegawai` VALUES ('1859', '7610', 'VERLY ARDHI ANDARTA, ST.');
INSERT INTO `master_pegawai` VALUES ('1860', '7611', 'ERDI HERMAWAN, ST.');
INSERT INTO `master_pegawai` VALUES ('1861', '7612', 'YUSRI ICHWAN NOOR, ST.');
INSERT INTO `master_pegawai` VALUES ('1862', '7613', 'GURUH MEHRA MULYANA, MT.');
INSERT INTO `master_pegawai` VALUES ('1863', '7614', 'YUSUF ARIFKA RAHMAN, S.Si.');
INSERT INTO `master_pegawai` VALUES ('1864', '7615', 'RADHITYO AJI KUSUMO B., M.T.');
INSERT INTO `master_pegawai` VALUES ('1865', '7616', 'M. ANDHIKA PRATAMA, ST.');
INSERT INTO `master_pegawai` VALUES ('1866', '7617', 'DEDE DANNY, ST. .');
INSERT INTO `master_pegawai` VALUES ('1867', '7618', 'HENDY TRI KURNIAWAN, ST.');
INSERT INTO `master_pegawai` VALUES ('1868', '7619', 'FARCHAT IHSAN NAWAWI, S.Ds.');
INSERT INTO `master_pegawai` VALUES ('1869', '7620', 'RISA SEPTIANI, S.Kom.');
INSERT INTO `master_pegawai` VALUES ('1870', '7621', 'AULIA ANDINI, ST.');
INSERT INTO `master_pegawai` VALUES ('1871', '7622', 'RIZALDI DARMAWAN, ST.');
INSERT INTO `master_pegawai` VALUES ('1872', '7623', 'SITI NURLINA, ST.');
INSERT INTO `master_pegawai` VALUES ('1873', '7624', 'ADRIAN RIFQI PAMBUDI, ST.');
INSERT INTO `master_pegawai` VALUES ('1874', '7625', 'EDWIN NURSYAH JULIO PUTRA, ST.');
INSERT INTO `master_pegawai` VALUES ('1875', '7626', 'FANNY PRASETIA, S.Si.');
INSERT INTO `master_pegawai` VALUES ('1876', '7627', 'ANUGRAH PRATAMA, S.Si.');
INSERT INTO `master_pegawai` VALUES ('1877', '7628', 'FACHRIZKA MUBIANTY, S.Si.');
INSERT INTO `master_pegawai` VALUES ('1878', '7629', 'FREDIKA DWI UTOMO, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1879', '7630', 'CITRAWATI NUGRAHENI M., ST.');
INSERT INTO `master_pegawai` VALUES ('1880', '7631', 'LIKE NOVIA HALIM, MT.');
INSERT INTO `master_pegawai` VALUES ('1881', '7633', 'AKHMAD BAKHRUL FAUZI, ST.');
INSERT INTO `master_pegawai` VALUES ('1882', '7634', 'YOHANA ELY YULIANI, S.H.');
INSERT INTO `master_pegawai` VALUES ('1883', '7635', 'MELINDA RIZKI UTAMI, ST.');
INSERT INTO `master_pegawai` VALUES ('1884', '7636', 'WIWI WIDI ASTUTI, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1885', '7637', 'IRSANTI AISYA, ST.');
INSERT INTO `master_pegawai` VALUES ('1886', '7638', 'DIANDRA ISRODIYAH Y. P., S.Psi');
INSERT INTO `master_pegawai` VALUES ('1887', '7639', 'JUPENTINUS SIMANULLANG, ST.');
INSERT INTO `master_pegawai` VALUES ('1888', '7640', 'PRIYANCE NABABAN, SE.');
INSERT INTO `master_pegawai` VALUES ('1889', '7641', 'MOH. AGUNG SETIAWAN, SE.');
INSERT INTO `master_pegawai` VALUES ('1890', '7642', 'FADHLAN MUHTADI, SE.');
INSERT INTO `master_pegawai` VALUES ('1891', '7644', 'HANA TARIZKHA COGANULI, SE.');
INSERT INTO `master_pegawai` VALUES ('1892', '7645', 'TIRTA HADI KUSUMA, S.Pn.');
INSERT INTO `master_pegawai` VALUES ('1893', '7646', 'FYKO FABUD PRATAMA, S.I.A.');
INSERT INTO `master_pegawai` VALUES ('1894', '7647', 'OFI RIYANI, S.Kom.');
INSERT INTO `master_pegawai` VALUES ('1895', '7648', 'TRI WIBOWO, S.Pd.');
INSERT INTO `master_pegawai` VALUES ('1896', '7649', 'DAWAM HAFIDHUDDIN, A.Md.');
INSERT INTO `master_pegawai` VALUES ('1897', '7650', 'MAS ARIS WIBOWO, SE.');
INSERT INTO `master_pegawai` VALUES ('1898', '7651', 'MUHAMMAD ADHIKA, S.EI.');
INSERT INTO `master_pegawai` VALUES ('1899', '7652', 'ACHMAD JOHARI');
INSERT INTO `master_pegawai` VALUES ('1900', '7653', 'ADI RIYATNO');
INSERT INTO `master_pegawai` VALUES ('1901', '7654', 'ADITYA AJI PRAMUDI');
INSERT INTO `master_pegawai` VALUES ('1902', '7655', 'AGUS FAIZAL');
INSERT INTO `master_pegawai` VALUES ('1903', '7656', 'ALFREDO SAHERTIAN');
INSERT INTO `master_pegawai` VALUES ('1904', '7657', 'ANDRI SUCIPTO');
INSERT INTO `master_pegawai` VALUES ('1905', '7658', 'ANGGA ADHI PRAMANA');
INSERT INTO `master_pegawai` VALUES ('1906', '7659', 'ANGGI PERMANA SAKTI');
INSERT INTO `master_pegawai` VALUES ('1907', '7660', 'ANNAS ASY\'ARI');
INSERT INTO `master_pegawai` VALUES ('1908', '7661', 'ASEP NANANG MAULANA');
INSERT INTO `master_pegawai` VALUES ('1909', '7662', 'ASEP SOPIAN');
INSERT INTO `master_pegawai` VALUES ('1910', '7663', 'BAHRUL ULUM');
INSERT INTO `master_pegawai` VALUES ('1911', '7664', 'BAYU PUTRA PRATAMA');
INSERT INTO `master_pegawai` VALUES ('1912', '7665', 'CANDRA IRAWAN');
INSERT INTO `master_pegawai` VALUES ('1913', '7666', 'CHAERUL HUDA');
INSERT INTO `master_pegawai` VALUES ('1914', '7667', 'DAMAR DWI PRASETYO');
INSERT INTO `master_pegawai` VALUES ('1915', '7668', 'DANA SUADA');
INSERT INTO `master_pegawai` VALUES ('1916', '7669', 'DANIEL');
INSERT INTO `master_pegawai` VALUES ('1917', '7670', 'DEDE MUHAMMAD RIDWAN');
INSERT INTO `master_pegawai` VALUES ('1918', '7671', 'DEDEN JUJU JUWANDA');
INSERT INTO `master_pegawai` VALUES ('1919', '7672', 'DHIKA ARYA NUGROHO');
INSERT INTO `master_pegawai` VALUES ('1920', '7673', 'DIAN PRADANA PUTRA');
INSERT INTO `master_pegawai` VALUES ('1921', '7674', 'EKA SYAHRONI SANDY');
INSERT INTO `master_pegawai` VALUES ('1922', '7675', 'ERVAN GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('1923', '7676', 'FACHRI IMANULHAQ ADNASYAH');
INSERT INTO `master_pegawai` VALUES ('1924', '7677', 'FAHMI AZUAR');
INSERT INTO `master_pegawai` VALUES ('1925', '7678', 'FAJAR TRI SETIO');
INSERT INTO `master_pegawai` VALUES ('1926', '7679', 'FARIZ HILMAN');
INSERT INTO `master_pegawai` VALUES ('1927', '7680', 'FEMMY RAMAH HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('1928', '7681', 'FERRY RESTIANTO');
INSERT INTO `master_pegawai` VALUES ('1929', '7682', 'FITYAN MUHAJIR');
INSERT INTO `master_pegawai` VALUES ('1930', '7683', 'FRANSISKUS FRASKA LAKSONO P');
INSERT INTO `master_pegawai` VALUES ('1931', '7684', 'GERRY ADRIAN');
INSERT INTO `master_pegawai` VALUES ('1932', '7685', 'GERRY PUTRA PAMBUDI');
INSERT INTO `master_pegawai` VALUES ('1933', '7686', 'GIVANI MALIK');
INSERT INTO `master_pegawai` VALUES ('1934', '7687', 'GULAM GUNTADI');
INSERT INTO `master_pegawai` VALUES ('1935', '7688', 'HARY TRIYANTO');
INSERT INTO `master_pegawai` VALUES ('1936', '7689', 'HERI KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1937', '7690', 'HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('1938', '7691', 'HERU DARMAWAN');
INSERT INTO `master_pegawai` VALUES ('1939', '7692', 'IQBAL BASANDID');
INSERT INTO `master_pegawai` VALUES ('1940', '7693', 'IQBAL MAULIDI');
INSERT INTO `master_pegawai` VALUES ('1941', '7694', 'JAJANG SOPANDI');
INSERT INTO `master_pegawai` VALUES ('1942', '7695', 'JOKO LUKITO');
INSERT INTO `master_pegawai` VALUES ('1943', '7696', 'LUHUR PAMBUDI');
INSERT INTO `master_pegawai` VALUES ('1944', '7697', 'M.WAHYU BAYU P');
INSERT INTO `master_pegawai` VALUES ('1945', '7698', 'MOHAMMAD YUSUF HIZBULLAH');
INSERT INTO `master_pegawai` VALUES ('1946', '7699', 'MUHAMMAD GUSTIAN');
INSERT INTO `master_pegawai` VALUES ('1947', '7700', 'MUHAMAD HARDHA');
INSERT INTO `master_pegawai` VALUES ('1948', '7701', 'MUHAMMAD RAFLI BUCHARY');
INSERT INTO `master_pegawai` VALUES ('1949', '7702', 'MUHAMMAD RIDWAN');
INSERT INTO `master_pegawai` VALUES ('1950', '7703', 'MUHAMMMAD SEPTAVALIAN EKA D');
INSERT INTO `master_pegawai` VALUES ('1951', '7704', 'MUHAMMAD KHILMI');
INSERT INTO `master_pegawai` VALUES ('1952', '7705', 'NURYASSIN PURNAMA');
INSERT INTO `master_pegawai` VALUES ('1953', 'F611', 'SUMIATI');
INSERT INTO `master_pegawai` VALUES ('1954', 'F613', 'KARNINA DHIHARMA');
INSERT INTO `master_pegawai` VALUES ('1955', 'F676', 'SISWANTO');
INSERT INTO `master_pegawai` VALUES ('1956', 'F677', 'WAHYU TRI ANGGONO');
INSERT INTO `master_pegawai` VALUES ('1957', 'F684', 'MUHAMAD SUFYAN TSAORI');
INSERT INTO `master_pegawai` VALUES ('1958', 'F827', 'AISHA INDAH PERMATASARI');
INSERT INTO `master_pegawai` VALUES ('1959', 'F829', 'SEFRI KHUDORI');
INSERT INTO `master_pegawai` VALUES ('1960', 'F830', 'CHERDY NURDIN');
INSERT INTO `master_pegawai` VALUES ('1961', 'F831', 'IDA MARDIANA');
INSERT INTO `master_pegawai` VALUES ('1962', 'F832', 'MOHAMMAD RAMA WIJAYA');
INSERT INTO `master_pegawai` VALUES ('1963', 'F833', 'SILVIANA YUSNIA HASBI');
INSERT INTO `master_pegawai` VALUES ('1964', 'F834', 'KARTIKA');
INSERT INTO `master_pegawai` VALUES ('1965', 'F836', 'YULIATIN EKI NUR FAJRIYAH');
INSERT INTO `master_pegawai` VALUES ('1966', 'F839', 'OKKI APRIAN');
INSERT INTO `master_pegawai` VALUES ('1967', 'F842', 'KIKI RAMADHAN');
INSERT INTO `master_pegawai` VALUES ('1968', 'F843', 'ANANG BUDIANTO');
INSERT INTO `master_pegawai` VALUES ('1969', 'F845', 'BAGAS DWI ADIANTO');
INSERT INTO `master_pegawai` VALUES ('1970', 'F846', 'AHMAD ZAENAL MUSTABA');
INSERT INTO `master_pegawai` VALUES ('1971', 'F847', 'YOGA ADI PRASETYO');
INSERT INTO `master_pegawai` VALUES ('1972', 'F849', 'IKHWAN FIRDAUS');
INSERT INTO `master_pegawai` VALUES ('1973', 'F850', 'DARMAWAN ANDIKA PUTRA');
INSERT INTO `master_pegawai` VALUES ('1974', 'F851', 'ALAN NAJURIADI');
INSERT INTO `master_pegawai` VALUES ('1975', 'F853', 'ANGGER JUNI PRASETIO');
INSERT INTO `master_pegawai` VALUES ('1976', 'F854', 'DICKY SYAH PUTRA');
INSERT INTO `master_pegawai` VALUES ('1977', 'F856', 'TANMALAKA PERDANA PUTRA');
INSERT INTO `master_pegawai` VALUES ('1978', 'F858', 'DEDY HARISMAN SUHENDY');
INSERT INTO `master_pegawai` VALUES ('1979', 'F860', 'DERI GHANIAL ABDI');
INSERT INTO `master_pegawai` VALUES ('1980', 'F861', 'FAOZI HELMI WARDANA');
INSERT INTO `master_pegawai` VALUES ('1981', 'F863', 'RIZKI RAMDAN HARTANTO');
INSERT INTO `master_pegawai` VALUES ('1982', 'F865', 'ANTON YULIANTO WIDODO');
INSERT INTO `master_pegawai` VALUES ('1983', 'F867', 'PANDU DWI KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1984', 'F868', 'NANUNG WIBISONO');
INSERT INTO `master_pegawai` VALUES ('1985', 'F872', 'WARDIANA');
INSERT INTO `master_pegawai` VALUES ('1986', 'F875', 'KHOERUN BAKIR');
INSERT INTO `master_pegawai` VALUES ('1987', 'F876', 'PRADANA HARDIANSYAH');
INSERT INTO `master_pegawai` VALUES ('1988', 'F882', 'ADE RIKI SUTEJA');
INSERT INTO `master_pegawai` VALUES ('1989', 'F885', 'MUHAMAD HARFIAN');
INSERT INTO `master_pegawai` VALUES ('1990', 'F887', 'KUKUH GIO SUGIYANTO');
INSERT INTO `master_pegawai` VALUES ('1991', 'F888', 'MEILANGGA NURÁCHSAN PRATAMA');
INSERT INTO `master_pegawai` VALUES ('1992', 'F889', 'FAIZAL AKBAR');
INSERT INTO `master_pegawai` VALUES ('1993', 'F891', 'IKHWAN NOOR ZULKHAIDIR');
INSERT INTO `master_pegawai` VALUES ('1994', 'F892', 'FIRMAN DWI APRIANTO');
INSERT INTO `master_pegawai` VALUES ('1995', 'F893', 'SANDI SETIANDI');
INSERT INTO `master_pegawai` VALUES ('1996', 'F894', 'ROKHAYADI');
INSERT INTO `master_pegawai` VALUES ('1997', 'F895', 'RIZKY ABQRIYAN KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('1998', 'F897', 'MOCHAMAD AGUNG GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('1999', 'F898', 'ILYASIN');
INSERT INTO `master_pegawai` VALUES ('2000', 'F900', 'VIVIANA RIARIDES');
INSERT INTO `master_pegawai` VALUES ('2001', 'F901', 'ANNIZA NOVIA FATMA');
INSERT INTO `master_pegawai` VALUES ('2002', 'F908', 'RUDY SRIWARTONO');
INSERT INTO `master_pegawai` VALUES ('2003', 'F910', 'USMAN ISMAIL');
INSERT INTO `master_pegawai` VALUES ('2004', 'F912', 'NANDA ALFIAN');
INSERT INTO `master_pegawai` VALUES ('2005', 'F913', 'ADI NUGROHO');
INSERT INTO `master_pegawai` VALUES ('2006', 'F915', 'EKO RAHMAT PEBRIYANTO');
INSERT INTO `master_pegawai` VALUES ('2007', 'F916', 'ISHARYADI');
INSERT INTO `master_pegawai` VALUES ('2008', 'F917', 'ABDUL MUJIB');
INSERT INTO `master_pegawai` VALUES ('2009', 'F919', 'HERMAWAN APRIYANTO');
INSERT INTO `master_pegawai` VALUES ('2010', 'F921', 'FATHAHILLAH SETYO RIZKI');
INSERT INTO `master_pegawai` VALUES ('2011', 'F923', 'PRATAMA RONGGO SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('2012', 'F924', 'DESI ELI RIAWATI');
INSERT INTO `master_pegawai` VALUES ('2013', 'F927', 'DEVI MAIHARTANTI');
INSERT INTO `master_pegawai` VALUES ('2014', 'F928', 'AYU SARASWATI');
INSERT INTO `master_pegawai` VALUES ('2015', 'F929', 'ASRI MUNAWAROH');
INSERT INTO `master_pegawai` VALUES ('2016', 'F930', 'RINDRA NOVIARINA');
INSERT INTO `master_pegawai` VALUES ('2017', 'F932', 'PINGKI PUSPA RAMADIAN S');
INSERT INTO `master_pegawai` VALUES ('2018', 'F933', 'ROCHATI');
INSERT INTO `master_pegawai` VALUES ('2019', 'F935', 'USWATUN KHASANAH');
INSERT INTO `master_pegawai` VALUES ('2020', 'F936', 'AFIANAH');
INSERT INTO `master_pegawai` VALUES ('2021', 'F937', 'ARZIA LAKSMITA PUTRI');
INSERT INTO `master_pegawai` VALUES ('2022', 'F938', 'PUSPHITA KARTIKA CHANDRA');
INSERT INTO `master_pegawai` VALUES ('2023', 'F939', 'LINGGA OCTAVIANA PUTRI');
INSERT INTO `master_pegawai` VALUES ('2024', 'F944', 'TITIS DWI SUCIATI');
INSERT INTO `master_pegawai` VALUES ('2025', 'F946', 'SITI ANNISA SHAUMA');
INSERT INTO `master_pegawai` VALUES ('2026', 'F947', 'PUTRI KURNIAWATI');
INSERT INTO `master_pegawai` VALUES ('2027', 'F948', 'RYANDINI WIRASH MULYORA');
INSERT INTO `master_pegawai` VALUES ('2028', 'F961', 'MOHAMAD ROVI KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2029', 'F962', 'FAISAL MUBARAK AL-FAZRI');
INSERT INTO `master_pegawai` VALUES ('2030', 'F963', 'ALDY MAULANA');
INSERT INTO `master_pegawai` VALUES ('2031', 'F964', 'LUTFI NURDIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2032', 'F968', 'ATANG KURNAEDI');
INSERT INTO `master_pegawai` VALUES ('2033', 'F970', 'AGUS SULAEMAN');
INSERT INTO `master_pegawai` VALUES ('2034', 'F971', 'IVAN AJI SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('2035', 'F972', 'ALFIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2036', 'F974', 'MUHAMAD ANWAR');
INSERT INTO `master_pegawai` VALUES ('2037', 'F975', 'PANGGITA INOPRASETYO');
INSERT INTO `master_pegawai` VALUES ('2038', 'F976', 'VITO CHRISTIAN HARJANTO');
INSERT INTO `master_pegawai` VALUES ('2039', 'F977', 'GALIH ARIO SENO');
INSERT INTO `master_pegawai` VALUES ('2040', 'F979', 'IQBAL RIZQURRAHMAN');
INSERT INTO `master_pegawai` VALUES ('2041', 'F982', 'SYAEFUL AMIN');
INSERT INTO `master_pegawai` VALUES ('2042', 'F983', 'REZA PAHLEVI');
INSERT INTO `master_pegawai` VALUES ('2043', 'F984', 'MUHAMAD RIDWAN ELFARIS');
INSERT INTO `master_pegawai` VALUES ('2044', 'F986', 'RIZWAN ZULKARNAIN');
INSERT INTO `master_pegawai` VALUES ('2045', 'F987', 'AGUS PRASOJO');
INSERT INTO `master_pegawai` VALUES ('2046', 'F988', 'ANDRIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2047', 'F989', 'M. ANDANG HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('2048', 'F990', 'KARNADI');
INSERT INTO `master_pegawai` VALUES ('2049', 'F991', 'RISA ERVIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2050', 'F992', 'TIARA FRASTIKA');
INSERT INTO `master_pegawai` VALUES ('2051', 'F993', 'RISKA AMELIA');
INSERT INTO `master_pegawai` VALUES ('2052', 'F995', 'YAHYA FIRMANSYAH');
INSERT INTO `master_pegawai` VALUES ('2053', 'F996', 'DOVA PUTRA KAUTSAR');
INSERT INTO `master_pegawai` VALUES ('2054', 'F997', 'FIRMAN PRAYOGO');
INSERT INTO `master_pegawai` VALUES ('2055', 'F998', 'NURMALIK AMARULLOH, SE.');
INSERT INTO `master_pegawai` VALUES ('2056', 'F999', 'IMAM SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('2057', 'G004', 'ARIF BUDIMAN');
INSERT INTO `master_pegawai` VALUES ('2058', 'G007', 'RINTO GELINGGING');
INSERT INTO `master_pegawai` VALUES ('2059', 'G008', 'RIYANTO');
INSERT INTO `master_pegawai` VALUES ('2060', 'G009', 'ADITYA FAHRA HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('2061', 'G010', 'MUKTI SANTOSA');
INSERT INTO `master_pegawai` VALUES ('2062', 'G011', 'JOHAN TUNGGARA ADIL SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('2063', 'G013', 'MUHAMMAD BARON');
INSERT INTO `master_pegawai` VALUES ('2064', 'G014', 'YUDIKA FIRDAUS');
INSERT INTO `master_pegawai` VALUES ('2065', 'G019', 'PUNTODEWO PRIYAGUNG ARIS W.');
INSERT INTO `master_pegawai` VALUES ('2066', 'G023', 'RENGGA AYOMI BUDIMAN');
INSERT INTO `master_pegawai` VALUES ('2067', 'G025', 'LUTFI REZA PAHLEVI');
INSERT INTO `master_pegawai` VALUES ('2068', 'G027', 'ARIEF FADILLAH DWI APRIYANTO');
INSERT INTO `master_pegawai` VALUES ('2069', 'G032', 'MO\'AMMAR MOUFTI');
INSERT INTO `master_pegawai` VALUES ('2070', 'G033', 'MOCHAMAD RIZA HILMAWAN');
INSERT INTO `master_pegawai` VALUES ('2071', 'G036', 'ERYKA RIZKYANA PUTRI');
INSERT INTO `master_pegawai` VALUES ('2072', 'G038', 'INDAH NUR AZIZAH');
INSERT INTO `master_pegawai` VALUES ('2073', 'G039', 'ANNA SUTINAH');
INSERT INTO `master_pegawai` VALUES ('2074', 'G043', 'MENIK SUDARYANI');
INSERT INTO `master_pegawai` VALUES ('2075', 'G044', 'SHINTA MENURIANTY ELVIRA');
INSERT INTO `master_pegawai` VALUES ('2076', 'G045', 'NURUL FITRIA HAPSARI RAHARJO');
INSERT INTO `master_pegawai` VALUES ('2077', 'G046', 'ARI TRI SUSANTI');
INSERT INTO `master_pegawai` VALUES ('2078', 'G047', 'DINI SARTIKA');
INSERT INTO `master_pegawai` VALUES ('2079', 'G048', 'AJENG PRATIWI');
INSERT INTO `master_pegawai` VALUES ('2080', 'G050', 'RANI PUJIASTUTI');
INSERT INTO `master_pegawai` VALUES ('2081', 'G051', 'NEILA MADINA');
INSERT INTO `master_pegawai` VALUES ('2082', 'G052', 'SRI SETYAHANI');
INSERT INTO `master_pegawai` VALUES ('2083', 'G053', 'MEIGI KUSANDZANI WIDYA PUSPA');
INSERT INTO `master_pegawai` VALUES ('2084', 'G054', 'WINDA YANI');
INSERT INTO `master_pegawai` VALUES ('2085', 'G055', 'NETI MULYANI');
INSERT INTO `master_pegawai` VALUES ('2086', 'G056', 'RIZKIATUL KHASANAH');
INSERT INTO `master_pegawai` VALUES ('2087', 'G058', 'IIS WARIS');
INSERT INTO `master_pegawai` VALUES ('2088', 'G059', 'INKA RESTY MAULIDINA');
INSERT INTO `master_pegawai` VALUES ('2089', 'G063', 'HAMDANI');
INSERT INTO `master_pegawai` VALUES ('2090', 'G066', 'S. HADIYOSO');
INSERT INTO `master_pegawai` VALUES ('2091', 'G068', 'HEGO PRASETYAWAN');
INSERT INTO `master_pegawai` VALUES ('2092', 'G069', 'ADEN KUSTIAWAN');
INSERT INTO `master_pegawai` VALUES ('2093', 'G071', 'YULI NUR ANISA');
INSERT INTO `master_pegawai` VALUES ('2094', 'G072', 'RAE SENA MUNGGARAN');
INSERT INTO `master_pegawai` VALUES ('2095', 'G073', 'DIMAS RESTU PUTRA');
INSERT INTO `master_pegawai` VALUES ('2096', 'G074', 'STEVANO GEMA AIRLANGGA');
INSERT INTO `master_pegawai` VALUES ('2097', 'G075', 'SYAHRUN UNGGUL BINTORO');
INSERT INTO `master_pegawai` VALUES ('2098', 'G076', 'GIRI HARMOYO');
INSERT INTO `master_pegawai` VALUES ('2099', 'G077', 'REZA RIFQI ADZANI');
INSERT INTO `master_pegawai` VALUES ('2100', 'G078', 'BUDI SONJAYA');
INSERT INTO `master_pegawai` VALUES ('2101', 'G084', 'FADILAH AD.');
INSERT INTO `master_pegawai` VALUES ('2102', 'G085', 'SUHARTO');
INSERT INTO `master_pegawai` VALUES ('2103', 'G086', 'MUHAMMAD RIZKI FAUZAN');
INSERT INTO `master_pegawai` VALUES ('2104', 'G087', 'NOVI KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2105', 'G088', 'DADAN HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('2106', 'G089', 'IPUNG ANDRIYAN');
INSERT INTO `master_pegawai` VALUES ('2107', 'G090', 'FADLY PRATAMA EFFENDI');
INSERT INTO `master_pegawai` VALUES ('2108', 'G091', 'SUKMA ADHI WIJAYA');
INSERT INTO `master_pegawai` VALUES ('2109', 'G092', 'WAHYU HIBATULLAH');
INSERT INTO `master_pegawai` VALUES ('2110', 'G093', 'ALI AKBAR');
INSERT INTO `master_pegawai` VALUES ('2111', 'G094', 'ANDIKA SEPTIAN');
INSERT INTO `master_pegawai` VALUES ('2112', 'G095', 'ROBY PAHLEVY');
INSERT INTO `master_pegawai` VALUES ('2113', 'G096', 'DIKA ALFIARI FAUZI');
INSERT INTO `master_pegawai` VALUES ('2114', 'G099', 'DIMAS HABIB ABDILLAH SHODIQ');
INSERT INTO `master_pegawai` VALUES ('2115', 'G100', 'MUHAMAD AKBAR');
INSERT INTO `master_pegawai` VALUES ('2116', 'G101', 'TRI DENDA');
INSERT INTO `master_pegawai` VALUES ('2117', 'G102', 'FACHRI WISMO AJI');
INSERT INTO `master_pegawai` VALUES ('2118', 'G103', 'ALESSANDRO WIJANARKO');
INSERT INTO `master_pegawai` VALUES ('2119', 'G104', 'DIKA MAULANA');
INSERT INTO `master_pegawai` VALUES ('2120', 'G105', 'YOGI HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('2121', 'G108', 'ARI CRISTIANTO');
INSERT INTO `master_pegawai` VALUES ('2122', 'G110', 'AGUS SUPIAN');
INSERT INTO `master_pegawai` VALUES ('2123', 'G111', 'YANUAR ANDI PRADANA');
INSERT INTO `master_pegawai` VALUES ('2124', 'G113', 'ZEHAN PRAHARDIKA');
INSERT INTO `master_pegawai` VALUES ('2125', 'G114', 'RHEZA SENTANU');
INSERT INTO `master_pegawai` VALUES ('2126', 'G115', 'MUCHAMAD FAUZI');
INSERT INTO `master_pegawai` VALUES ('2127', 'G117', 'BAMBANG IRIANTO');
INSERT INTO `master_pegawai` VALUES ('2128', 'G119', 'HILMI TAQIYUDDIN DHIYA UL-HAQ');
INSERT INTO `master_pegawai` VALUES ('2129', 'G120', 'MUHAMMAD CHOIRUL BAHTIAR');
INSERT INTO `master_pegawai` VALUES ('2130', 'G121', 'EKA SEPTIAN TONO');
INSERT INTO `master_pegawai` VALUES ('2131', 'G122', 'RICO CAESAR CHRISTANTO');
INSERT INTO `master_pegawai` VALUES ('2132', 'G123', 'TRI SUKMAWARTO PURNAWIRAWAN');
INSERT INTO `master_pegawai` VALUES ('2133', 'G124', 'BUDIYANTO');
INSERT INTO `master_pegawai` VALUES ('2134', 'G125', 'RESTU RAY SANDY');
INSERT INTO `master_pegawai` VALUES ('2135', 'G126', 'FAISAL AZHAR');
INSERT INTO `master_pegawai` VALUES ('2136', 'G127', 'RIZKY ADI PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2137', 'G128', 'MUHAMMAD YASIN');
INSERT INTO `master_pegawai` VALUES ('2138', 'G129', 'ZIDNI ASH SHIDIQ');
INSERT INTO `master_pegawai` VALUES ('2139', 'G131', 'AEPUL ANWAR');
INSERT INTO `master_pegawai` VALUES ('2140', 'G132', 'HARPREET CHANDRA');
INSERT INTO `master_pegawai` VALUES ('2141', 'G133', 'YANG LEPRILIAN');
INSERT INTO `master_pegawai` VALUES ('2142', 'G135', 'NUR ADIN TRIAWAN');
INSERT INTO `master_pegawai` VALUES ('2143', 'G136', 'AJI NURIMAN');
INSERT INTO `master_pegawai` VALUES ('2144', 'G138', 'RENNO BRYAN PABOMAYA R.');
INSERT INTO `master_pegawai` VALUES ('2145', 'G139', 'RAHAN TENNOVI PAHLAWAN');
INSERT INTO `master_pegawai` VALUES ('2146', 'B755', 'YUSTINA SUMARNI');
INSERT INTO `master_pegawai` VALUES ('2147', 'B756', 'ASNIDAR');
INSERT INTO `master_pegawai` VALUES ('2148', 'B757', 'SUSILO IRIANTI');
INSERT INTO `master_pegawai` VALUES ('2149', 'B761', 'MUHAMMAD SOBARI');
INSERT INTO `master_pegawai` VALUES ('2150', 'B762', 'MARYANTO SAPTO ATMOJO');
INSERT INTO `master_pegawai` VALUES ('2151', 'B763', 'MARMAN');
INSERT INTO `master_pegawai` VALUES ('2152', 'B764', 'SARTINI');
INSERT INTO `master_pegawai` VALUES ('2153', 'B765', 'SYA\'RONI');
INSERT INTO `master_pegawai` VALUES ('2154', 'B767', 'MARTONO');
INSERT INTO `master_pegawai` VALUES ('2155', 'B770', 'BUDIYONO');
INSERT INTO `master_pegawai` VALUES ('2156', 'B771', 'FARAH FITRIA RAHMAYANTI');
INSERT INTO `master_pegawai` VALUES ('2157', 'B772', 'SUHARYONO');
INSERT INTO `master_pegawai` VALUES ('2158', 'B773', 'SHELVY ARIFIN');
INSERT INTO `master_pegawai` VALUES ('2159', 'B779', 'SUKMANA NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('2160', 'B780', 'MAULANA ADNIN');
INSERT INTO `master_pegawai` VALUES ('2161', 'B781', 'RAIS');
INSERT INTO `master_pegawai` VALUES ('2162', 'B783', 'WAGIRAN');
INSERT INTO `master_pegawai` VALUES ('2163', 'B784', 'IRWIN NUR HAKIM');
INSERT INTO `master_pegawai` VALUES ('2164', 'B785', 'SUMI MARIANI');
INSERT INTO `master_pegawai` VALUES ('2165', 'B865', 'ROJAYA');
INSERT INTO `master_pegawai` VALUES ('2166', 'B866', 'HALIM SULASMONO');
INSERT INTO `master_pegawai` VALUES ('2167', 'B867', 'SUKRIA');
INSERT INTO `master_pegawai` VALUES ('2168', 'D011', 'IR. DWINA SEPTIANI WIJAYA');
INSERT INTO `master_pegawai` VALUES ('2169', 'D012', 'SAIFUL BAHRI, SE.');
INSERT INTO `master_pegawai` VALUES ('2170', 'D013', 'DRA. NUNGKI INDRATY T. K');
INSERT INTO `master_pegawai` VALUES ('2171', 'F246', 'GILANG PRAMUDYA  WIDODO');
INSERT INTO `master_pegawai` VALUES ('2172', 'F248', 'ADE RAHMAT AGUSTIAN');
INSERT INTO `master_pegawai` VALUES ('2173', 'F305', 'TEDDY ALFIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2174', 'F307', 'YUSTINUS ARI HADIWIJAYA');
INSERT INTO `master_pegawai` VALUES ('2175', 'F379', 'UDIN JAENUDIN');
INSERT INTO `master_pegawai` VALUES ('2176', 'F406', 'IVAN AULIA S');
INSERT INTO `master_pegawai` VALUES ('2177', 'F600', 'SISWINANTI HENDARIYANI');
INSERT INTO `master_pegawai` VALUES ('2178', 'F605', 'ENDANG RETNO SIWI');
INSERT INTO `master_pegawai` VALUES ('2179', 'F606', 'ETTY LATIFAH');
INSERT INTO `master_pegawai` VALUES ('2180', 'F607', 'MURSITI');
INSERT INTO `master_pegawai` VALUES ('2181', 'G393', 'BAGUS AGUSTINA');
INSERT INTO `master_pegawai` VALUES ('2182', 'G394', 'BILLIE KHOWIRANTIO LACKY S');
INSERT INTO `master_pegawai` VALUES ('2183', 'G395', 'CITRA AFRIDA SARI');
INSERT INTO `master_pegawai` VALUES ('2184', 'G396', 'DAFFA PRATAMA PUTRA');
INSERT INTO `master_pegawai` VALUES ('2185', 'G397', 'DAILAMI FIRDAUS');
INSERT INTO `master_pegawai` VALUES ('2186', 'G398', 'DANANG PRIYAMBODO');
INSERT INTO `master_pegawai` VALUES ('2187', 'G399', 'DANANG WIRAWAN');
INSERT INTO `master_pegawai` VALUES ('2188', 'G400', 'DIAN  UTAMI');
INSERT INTO `master_pegawai` VALUES ('2189', 'G401', 'DIDIET ABIZAR MU\'ARIF');
INSERT INTO `master_pegawai` VALUES ('2190', 'G403', 'DWI BUDIHARTONO');
INSERT INTO `master_pegawai` VALUES ('2191', 'G404', 'DWI WULANDARI');
INSERT INTO `master_pegawai` VALUES ('2192', 'G405', 'DWIKI ABASTIAN');
INSERT INTO `master_pegawai` VALUES ('2193', 'G406', 'ERFAN DWI PRASETYO');
INSERT INTO `master_pegawai` VALUES ('2194', 'G407', 'ERICK FIRMANSYAH');
INSERT INTO `master_pegawai` VALUES ('2195', 'G408', 'FAIS FAJARRUDDIN');
INSERT INTO `master_pegawai` VALUES ('2196', 'G409', 'FAIZAL KHOIRUL ROHMAN');
INSERT INTO `master_pegawai` VALUES ('2197', 'G410', 'FAIZAL KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2198', 'G411', 'FANI FAYANTI ASWIYATI');
INSERT INTO `master_pegawai` VALUES ('2199', 'G412', 'FEBRIAN SYAHRONI');
INSERT INTO `master_pegawai` VALUES ('2200', 'G413', 'FERY DEA NOVANTO');
INSERT INTO `master_pegawai` VALUES ('2201', 'G414', 'FLORENTINA AURELIA WULANDARI');
INSERT INTO `master_pegawai` VALUES ('2202', 'G415', 'FRANSCO GISTINO CAHYA SITOHANG');
INSERT INTO `master_pegawai` VALUES ('2203', 'G416', 'GANZAR AZIM RIZK RUSYDI');
INSERT INTO `master_pegawai` VALUES ('2204', 'G417', 'GUSTI ARIFIYANTO');
INSERT INTO `master_pegawai` VALUES ('2205', 'G418', 'HADI IRFAN');
INSERT INTO `master_pegawai` VALUES ('2206', 'G419', 'HAERONI');
INSERT INTO `master_pegawai` VALUES ('2207', 'G420', 'HENDRA ADI PUTRA');
INSERT INTO `master_pegawai` VALUES ('2208', 'G421', 'HILMAN HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('2209', 'G422', 'IBNU ABDURROHMAN');
INSERT INTO `master_pegawai` VALUES ('2210', 'G423', 'IFAN APRILLIAN');
INSERT INTO `master_pegawai` VALUES ('2211', 'G424', 'ILHAM HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('2212', 'G140', 'OSEP AL-QORNI');
INSERT INTO `master_pegawai` VALUES ('2213', 'G141', 'ADE DIKI');
INSERT INTO `master_pegawai` VALUES ('2214', 'G142', 'IHSAN NASIHIN');
INSERT INTO `master_pegawai` VALUES ('2215', 'G143', 'KHAVIZ KHIZBI FIRNIDA');
INSERT INTO `master_pegawai` VALUES ('2216', 'G144', 'DIKY MOHAMAD RAMDAN');
INSERT INTO `master_pegawai` VALUES ('2217', 'G145', 'ANDHIKA HASTO PRIANGGORO');
INSERT INTO `master_pegawai` VALUES ('2218', 'G146', 'RIHVA ALVARIK');
INSERT INTO `master_pegawai` VALUES ('2219', 'G147', 'DWIKI RAMADHAN');
INSERT INTO `master_pegawai` VALUES ('2220', 'G148', 'AZIS KRESNAWAN');
INSERT INTO `master_pegawai` VALUES ('2221', 'G149', 'MUHAMAD LUTPI');
INSERT INTO `master_pegawai` VALUES ('2222', 'G150', 'ANGGA HERISMA PUTRA');
INSERT INTO `master_pegawai` VALUES ('2223', 'G151', 'AHMAD RAHIL ALI');
INSERT INTO `master_pegawai` VALUES ('2224', 'G152', 'FEBRI RAMANNDANI');
INSERT INTO `master_pegawai` VALUES ('2225', 'G153', 'ANGGITA DEWI HAJARANI');
INSERT INTO `master_pegawai` VALUES ('2226', 'G154', 'DEVI MARDIANA');
INSERT INTO `master_pegawai` VALUES ('2227', 'G155', 'WIDA DWI YANTI');
INSERT INTO `master_pegawai` VALUES ('2228', 'G156', 'ADRI SETIADI');
INSERT INTO `master_pegawai` VALUES ('2229', 'G157', 'ARI FAUZI');
INSERT INTO `master_pegawai` VALUES ('2230', 'G158', 'ACHMAD PANDU YUDHA TAMA');
INSERT INTO `master_pegawai` VALUES ('2231', 'G159', 'EKA IRHAM MAULANA');
INSERT INTO `master_pegawai` VALUES ('2232', 'G160', 'ARGA MAULANA PRIBADI');
INSERT INTO `master_pegawai` VALUES ('2233', 'G161', 'AKMAL WALID');
INSERT INTO `master_pegawai` VALUES ('2234', 'G162', 'ADITYA RAMADHANI HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('2235', 'G163', 'KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2236', 'G164', 'RIAN AHMAD FAUZI');
INSERT INTO `master_pegawai` VALUES ('2237', 'G167', 'DIAN EKA PERMANA');
INSERT INTO `master_pegawai` VALUES ('2238', 'G169', 'ARIS ISMAIL');
INSERT INTO `master_pegawai` VALUES ('2239', 'G170', 'DIMAS SUHADA');
INSERT INTO `master_pegawai` VALUES ('2240', 'G171', 'ERVIN APRILLIAN');
INSERT INTO `master_pegawai` VALUES ('2241', 'G172', 'HARRYANSYAH AZI PERMANA');
INSERT INTO `master_pegawai` VALUES ('2242', 'G174', 'ARIF PERMANA');
INSERT INTO `master_pegawai` VALUES ('2243', 'G175', 'DADAN FAUZY');
INSERT INTO `master_pegawai` VALUES ('2244', 'G176', 'FAHYUDHA PERMANA');
INSERT INTO `master_pegawai` VALUES ('2245', 'G177', 'RIDWANULLOH AWALI AKBAR');
INSERT INTO `master_pegawai` VALUES ('2246', 'G178', 'LUTFI SAHAL');
INSERT INTO `master_pegawai` VALUES ('2247', 'G179', 'RAKA ADE SEPTIAWAN');
INSERT INTO `master_pegawai` VALUES ('2248', 'G180', 'MUHAMMAD RENALDY AL FURQON');
INSERT INTO `master_pegawai` VALUES ('2249', 'G181', 'MAYNARNA SUNANDA');
INSERT INTO `master_pegawai` VALUES ('2250', 'G182', 'YOPI SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('2251', 'G183', 'TRI SETIAJI');
INSERT INTO `master_pegawai` VALUES ('2252', 'G184', 'PAHJRI TRI SAPUTRO');
INSERT INTO `master_pegawai` VALUES ('2253', 'G185', 'SAMSUL ARIFIN');
INSERT INTO `master_pegawai` VALUES ('2254', 'G186', 'LUKMAN HAKIM');
INSERT INTO `master_pegawai` VALUES ('2255', 'G187', 'VEGA HENDI IRMAWAN');
INSERT INTO `master_pegawai` VALUES ('2256', 'G188', 'SALMAN AL FARAISYI');
INSERT INTO `master_pegawai` VALUES ('2257', 'G189', 'RIZKI MAULANA');
INSERT INTO `master_pegawai` VALUES ('2258', 'G190', 'MUHAMMAD ALVAVA');
INSERT INTO `master_pegawai` VALUES ('2259', 'G191', 'SAEFUDIN JUFRI');
INSERT INTO `master_pegawai` VALUES ('2260', 'G192', 'RICO NAN PUTRA');
INSERT INTO `master_pegawai` VALUES ('2261', 'G193', 'MUCHAMAD JUNAEDI ABDILAH');
INSERT INTO `master_pegawai` VALUES ('2262', 'G194', 'RIVALDI JULIANTO');
INSERT INTO `master_pegawai` VALUES ('2263', 'G195', 'RIJAL MUBAROKH');
INSERT INTO `master_pegawai` VALUES ('2264', 'G196', 'ANDI HUDIATNA');
INSERT INTO `master_pegawai` VALUES ('2265', 'G197', 'ANGGA MUSTOPA');
INSERT INTO `master_pegawai` VALUES ('2266', 'G198', 'MUHAMAD IHSAN');
INSERT INTO `master_pegawai` VALUES ('2267', 'G201', 'RESTU GESANG SETIYAWAN');
INSERT INTO `master_pegawai` VALUES ('2268', 'G202', 'YUSUP AWALUDIN');
INSERT INTO `master_pegawai` VALUES ('2269', 'G203', 'YUSUP SOBARNAS');
INSERT INTO `master_pegawai` VALUES ('2270', 'G204', 'YULIA WAHYU ANDONI');
INSERT INTO `master_pegawai` VALUES ('2271', 'G205', 'HAFIZH DIANTAMA NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('2272', 'G206', 'HENDRA SETYADI');
INSERT INTO `master_pegawai` VALUES ('2273', 'G207', 'RIDHO NURFEBRIANTO');
INSERT INTO `master_pegawai` VALUES ('2274', 'G208', 'HUSNI IQBAL MUNAWAR');
INSERT INTO `master_pegawai` VALUES ('2275', 'G209', 'M IQBAL NUZIRWAN FARHAN');
INSERT INTO `master_pegawai` VALUES ('2276', 'G210', 'DIAN ANDRIYANA');
INSERT INTO `master_pegawai` VALUES ('2277', 'G211', 'FAHMI SIHABUDIN');
INSERT INTO `master_pegawai` VALUES ('2278', 'G212', 'MUHAMMAD HARBI HANIF');
INSERT INTO `master_pegawai` VALUES ('2279', 'G213', 'ANDRE JULIO RAHMAN');
INSERT INTO `master_pegawai` VALUES ('2280', 'G214', 'SUPARDI');
INSERT INTO `master_pegawai` VALUES ('2281', 'G215', 'ABDAN SYAKURO ADNANSYAH, A.Md.');
INSERT INTO `master_pegawai` VALUES ('2282', 'G216', 'MUHAMMAD IQBAL');
INSERT INTO `master_pegawai` VALUES ('2283', 'G217', 'MUHAMMADRIVALDI');
INSERT INTO `master_pegawai` VALUES ('2284', 'G218', 'ADITYA ZATNIKA');
INSERT INTO `master_pegawai` VALUES ('2285', 'G219', 'SYAIFFUL RACHMAT');
INSERT INTO `master_pegawai` VALUES ('2286', 'G220', 'GHOFUR MUZZAFAR');
INSERT INTO `master_pegawai` VALUES ('2287', 'G221', 'ADE NOVIAN');
INSERT INTO `master_pegawai` VALUES ('2288', 'G222', 'RACHMAT SADHIWIJAYA');
INSERT INTO `master_pegawai` VALUES ('2289', 'G223', 'DICKY ALAMSYAH');
INSERT INTO `master_pegawai` VALUES ('2290', 'G224', 'ZIDANE KHULUD KAUTSAR');
INSERT INTO `master_pegawai` VALUES ('2291', 'G225', 'JULI DWI ASHARI');
INSERT INTO `master_pegawai` VALUES ('2292', 'G226', 'ELFIN HERLANGGA');
INSERT INTO `master_pegawai` VALUES ('2293', 'G227', 'ADITIA SUKMAJAYA');
INSERT INTO `master_pegawai` VALUES ('2294', 'G228', 'KHAERUL SANZANI');
INSERT INTO `master_pegawai` VALUES ('2295', 'G229', 'SYAHRUL MUNNIR');
INSERT INTO `master_pegawai` VALUES ('2296', 'G230', 'JEJEN JAENUDIN');
INSERT INTO `master_pegawai` VALUES ('2297', 'G231', 'DANANG EDI PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2298', 'G232', 'ALDO MALLORY WILLIE');
INSERT INTO `master_pegawai` VALUES ('2299', 'G233', 'NUGIY FADZAR APRIATNA');
INSERT INTO `master_pegawai` VALUES ('2300', 'G234', 'RADITYA REZZA MAHENDRA');
INSERT INTO `master_pegawai` VALUES ('2301', 'G235', 'IBNU PAMBUDI');
INSERT INTO `master_pegawai` VALUES ('2302', 'G237', 'MOHAMMAD EGY SAEFUDIN');
INSERT INTO `master_pegawai` VALUES ('2303', 'G238', 'DENIER OTHMAN');
INSERT INTO `master_pegawai` VALUES ('2304', 'G239', 'ACHMAD RIZKAN');
INSERT INTO `master_pegawai` VALUES ('2305', 'G240', 'RHAKA PRASETYA PUTRA');
INSERT INTO `master_pegawai` VALUES ('2306', 'G241', 'AGUS HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('2307', 'G243', 'MAULANA YUSUP');
INSERT INTO `master_pegawai` VALUES ('2308', 'G244', 'AMRI FAUZI');
INSERT INTO `master_pegawai` VALUES ('2309', 'G245', 'EKA WAHYU ABIMANYU');
INSERT INTO `master_pegawai` VALUES ('2310', 'G247', 'GILANG RAMADHAN');
INSERT INTO `master_pegawai` VALUES ('2311', 'G248', 'ARIEP HIDAYATULLAH');
INSERT INTO `master_pegawai` VALUES ('2312', 'G249', 'MEGANTARA RAMADHAN');
INSERT INTO `master_pegawai` VALUES ('2313', 'G250', 'IQBAL NURSYAMSI');
INSERT INTO `master_pegawai` VALUES ('2314', 'G251', 'MUHAMMAD YUSUF HANIFAN');
INSERT INTO `master_pegawai` VALUES ('2315', 'G252', 'ARIF RAHMAN HIDAYAH');
INSERT INTO `master_pegawai` VALUES ('2316', 'G253', 'LUTHFI GUMELAR');
INSERT INTO `master_pegawai` VALUES ('2317', 'G254', 'YOGI GIRALDI');
INSERT INTO `master_pegawai` VALUES ('2318', 'G255', 'RENDY MUHAMMAD PUTRA');
INSERT INTO `master_pegawai` VALUES ('2319', 'G256', 'HAMZAH ARFAH NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('2320', 'G257', 'FANDHY ACHMAD ROMADHON');
INSERT INTO `master_pegawai` VALUES ('2321', 'G258', 'RUSDIANA RAMDANI');
INSERT INTO `master_pegawai` VALUES ('2322', 'G259', 'PRIO BUDI PRASETYO');
INSERT INTO `master_pegawai` VALUES ('2323', 'G260', 'M. NADHIFULLAH');
INSERT INTO `master_pegawai` VALUES ('2324', 'G261', 'SYAWAL ABU FARIS');
INSERT INTO `master_pegawai` VALUES ('2325', 'G262', 'MUHAMMAD IQRAM');
INSERT INTO `master_pegawai` VALUES ('2326', 'G263', 'MUHAMMAD AFIF HIMAN MUZAKI');
INSERT INTO `master_pegawai` VALUES ('2327', 'G264', 'SHENDY DIO ERLANGGA');
INSERT INTO `master_pegawai` VALUES ('2328', 'G266', 'GARDA ARYANSYAH');
INSERT INTO `master_pegawai` VALUES ('2329', 'G267', 'MEGI FAUZI');
INSERT INTO `master_pegawai` VALUES ('2330', 'G268', 'DANANG TRI ASMORO');
INSERT INTO `master_pegawai` VALUES ('2331', 'G269', 'HAMDANI ARIPIN');
INSERT INTO `master_pegawai` VALUES ('2332', 'G270', 'AGUNG DORODJATUN');
INSERT INTO `master_pegawai` VALUES ('2333', 'G271', 'AJIS MUSLIM');
INSERT INTO `master_pegawai` VALUES ('2334', 'G272', 'ARDANTYO GUNAWAN BUDIHARJO');
INSERT INTO `master_pegawai` VALUES ('2335', 'G273', 'DIMAS CATUR WAHYU MUKTI');
INSERT INTO `master_pegawai` VALUES ('2336', 'G274', 'FARQAN SANTORY');
INSERT INTO `master_pegawai` VALUES ('2337', 'G275', 'GILANG PUTRA PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2338', 'G276', 'HENDRI FITRIANDI');
INSERT INTO `master_pegawai` VALUES ('2339', 'G277', 'IWAN WAHYUDI');
INSERT INTO `master_pegawai` VALUES ('2340', 'G278', 'KEMAL ADIATNA');
INSERT INTO `master_pegawai` VALUES ('2341', 'G279', 'MOH. SAHRULI');
INSERT INTO `master_pegawai` VALUES ('2342', 'G281', 'MUCHAMMAD NURUL MUNIF');
INSERT INTO `master_pegawai` VALUES ('2343', 'G282', 'MUHAMAD MAHDIHARI');
INSERT INTO `master_pegawai` VALUES ('2344', 'G283', 'RAKA DWI PERDANA SUWANDI');
INSERT INTO `master_pegawai` VALUES ('2345', 'G284', 'RANDA AFHDOL DINIL HAQ');
INSERT INTO `master_pegawai` VALUES ('2346', 'G285', 'ROFI AMIN');
INSERT INTO `master_pegawai` VALUES ('2347', 'G286', 'SATRIA DWI JULIANTO');
INSERT INTO `master_pegawai` VALUES ('2348', 'G287', 'TAUFIQ ROMADON');
INSERT INTO `master_pegawai` VALUES ('2349', 'G288', 'WAWAN DARMAWAN');
INSERT INTO `master_pegawai` VALUES ('2350', 'G289', 'ALAN MOHAMMAD MAULANI');
INSERT INTO `master_pegawai` VALUES ('2351', 'G290', 'AMMAR HAIKAL ABDILLAH');
INSERT INTO `master_pegawai` VALUES ('2352', 'G292', 'DIMAS FAJRI SURYAHARJONO');
INSERT INTO `master_pegawai` VALUES ('2353', 'G293', 'MUHAMMAD FADHLI NOOR');
INSERT INTO `master_pegawai` VALUES ('2354', 'G294', 'MUHAMMAD RIZKY FERDIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2355', 'G295', 'MUHAMMAD GHILMAN FIRDAUS');
INSERT INTO `master_pegawai` VALUES ('2356', 'G296', 'MUSTOPA ZAELANI');
INSERT INTO `master_pegawai` VALUES ('2357', 'G297', 'SYAMAIDZAR REFORI A.G');
INSERT INTO `master_pegawai` VALUES ('2358', 'G298', 'SYARIFUDDIN');
INSERT INTO `master_pegawai` VALUES ('2359', 'G299', 'UJANG SUNTANA');
INSERT INTO `master_pegawai` VALUES ('2360', 'G300', 'ZOEPRY SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('2361', 'G301', 'ACHMAD FAHRI');
INSERT INTO `master_pegawai` VALUES ('2362', 'G302', 'ADHI PRAKOSO');
INSERT INTO `master_pegawai` VALUES ('2363', 'G303', 'DWI ANTHONY C S');
INSERT INTO `master_pegawai` VALUES ('2364', 'G304', 'FEMMY FAISAL ANWAR');
INSERT INTO `master_pegawai` VALUES ('2365', 'G305', 'FIRMAN ISMAIL HARIRI');
INSERT INTO `master_pegawai` VALUES ('2366', 'G306', 'HARI SETYO NUGROHO');
INSERT INTO `master_pegawai` VALUES ('2367', 'G307', 'JAGUAR NITIBASKARA');
INSERT INTO `master_pegawai` VALUES ('2368', 'G308', 'KURNIAWAN SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('2369', 'G309', 'WAHYU GUNTORO');
INSERT INTO `master_pegawai` VALUES ('2370', 'G310', 'AFIFAH NUR ISMAWATI');
INSERT INTO `master_pegawai` VALUES ('2371', 'G311', 'AHMAD SAEPUDIN');
INSERT INTO `master_pegawai` VALUES ('2372', 'G312', 'ANNISA RABISANI');
INSERT INTO `master_pegawai` VALUES ('2373', 'G313', 'RAHMADITA UTAMI');
INSERT INTO `master_pegawai` VALUES ('2374', 'G316', 'AJI PUJIYANTO');
INSERT INTO `master_pegawai` VALUES ('2375', 'G317', 'AJI CANDRA KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2376', 'G318', 'ARY DINAL HAQI AHMAD');
INSERT INTO `master_pegawai` VALUES ('2377', 'G319', 'HENDRI SETYAWAN');
INSERT INTO `master_pegawai` VALUES ('2378', 'G320', 'RICO PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2379', 'G321', 'OCKTA FAJAR PRASETYA');
INSERT INTO `master_pegawai` VALUES ('2380', 'G322', 'RIZKI ADI SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('2381', 'G323', 'RUSDIAN AL ISLAMI');
INSERT INTO `master_pegawai` VALUES ('2382', 'G324', 'ADHA ABDURRAHMAN');
INSERT INTO `master_pegawai` VALUES ('2383', 'G325', 'MARTANI AJI');
INSERT INTO `master_pegawai` VALUES ('2384', 'G326', 'AZAM MUHAMMAD ISHLAH');
INSERT INTO `master_pegawai` VALUES ('2385', 'G327', 'FEBRI KURNIAWAN SUWARDI');
INSERT INTO `master_pegawai` VALUES ('2386', 'G328', 'EDWIN ONKY LILIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2387', 'G329', 'MUKHLIS OGAM WIRABAWA');
INSERT INTO `master_pegawai` VALUES ('2388', 'G330', 'MUHAMMAD HAIKAL SAZILI');
INSERT INTO `master_pegawai` VALUES ('2389', 'G331', 'INDRA MAULANA AL MUSTOFA');
INSERT INTO `master_pegawai` VALUES ('2390', 'G333', 'AMELIA RAHMAWATY');
INSERT INTO `master_pegawai` VALUES ('2391', 'G334', 'AUDITA OCTAVIANI');
INSERT INTO `master_pegawai` VALUES ('2392', 'G335', 'RESTU SUCI ANANDA');
INSERT INTO `master_pegawai` VALUES ('2393', 'G336', 'SHAFIRA INAS NURINA');
INSERT INTO `master_pegawai` VALUES ('2394', 'G337', 'VINCENCIA EVELLYN PRIYADI');
INSERT INTO `master_pegawai` VALUES ('2395', 'G338', 'WAHYU RIANI MEIRISTANTI');
INSERT INTO `master_pegawai` VALUES ('2396', 'G339', 'DIKI NUR\'AIN');
INSERT INTO `master_pegawai` VALUES ('2397', 'G340', 'SUTISNA');
INSERT INTO `master_pegawai` VALUES ('2398', 'G341', 'BAGAS WICAKSONO');
INSERT INTO `master_pegawai` VALUES ('2399', 'G343', 'MUHAMMAD IHZZA ROSULLY');
INSERT INTO `master_pegawai` VALUES ('2400', 'G344', 'ARIF AKBAR FAOZAN');
INSERT INTO `master_pegawai` VALUES ('2401', 'G345', 'YOHAN AL FARIZKY NF.');
INSERT INTO `master_pegawai` VALUES ('2402', 'G346', 'DE BRITTO DWI KUNCORO');
INSERT INTO `master_pegawai` VALUES ('2403', 'G347', 'MEGAWEY KANAYA');
INSERT INTO `master_pegawai` VALUES ('2404', 'G348', 'HENDRI FEBRI ERLANGGA');
INSERT INTO `master_pegawai` VALUES ('2405', 'G349', 'EKI DWI SEPTIAWAN');
INSERT INTO `master_pegawai` VALUES ('2406', 'G350', 'TOMY ADYTIA');
INSERT INTO `master_pegawai` VALUES ('2407', 'G351', 'IFAN RIZKIA RAMADHAN');
INSERT INTO `master_pegawai` VALUES ('2408', 'G352', 'SOBARI YUSUP');
INSERT INTO `master_pegawai` VALUES ('2409', 'G353', 'SASHIERA KIRANA WIBOWO');
INSERT INTO `master_pegawai` VALUES ('2410', 'G354', 'SYIFA IMANIAH ULFA');
INSERT INTO `master_pegawai` VALUES ('2411', 'G355', 'AGUSTI PANGESTU');
INSERT INTO `master_pegawai` VALUES ('2412', 'G356', 'AHMAD NOVARIANTO');
INSERT INTO `master_pegawai` VALUES ('2413', 'G357', 'ANGGI ANDRIYANA');
INSERT INTO `master_pegawai` VALUES ('2414', 'G358', 'ANTON LUBIS PERMANA');
INSERT INTO `master_pegawai` VALUES ('2415', 'G359', 'KENDALL FAJAR MAULANA');
INSERT INTO `master_pegawai` VALUES ('2416', 'G360', 'MUHAMAD ABDUL AZIS');
INSERT INTO `master_pegawai` VALUES ('2417', 'G361', 'ROBBY SUGARA');
INSERT INTO `master_pegawai` VALUES ('2418', 'G362', 'ACHMAD INDRA KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2419', 'G363', 'ADITTYA');
INSERT INTO `master_pegawai` VALUES ('2420', 'G373', 'ABDUL AZIS');
INSERT INTO `master_pegawai` VALUES ('2421', 'G374', 'ADE ALFIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2422', 'G375', 'ADE MULYANA');
INSERT INTO `master_pegawai` VALUES ('2423', 'G376', 'ADI PAMUNGKAS');
INSERT INTO `master_pegawai` VALUES ('2424', 'G377', 'ADIKA FRISKY ARAAF');
INSERT INTO `master_pegawai` VALUES ('2425', 'G378', 'ADINDA PUTRI SABILA');
INSERT INTO `master_pegawai` VALUES ('2426', 'G379', 'ADITYA AJI PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2427', 'G380', 'ADITYA DAVIT NUGROHO');
INSERT INTO `master_pegawai` VALUES ('2428', 'G381', 'ADITYA NUR RIZKI');
INSERT INTO `master_pegawai` VALUES ('2429', 'G382', 'AFRI SETIANTO');
INSERT INTO `master_pegawai` VALUES ('2430', 'G383', 'AGIS MAULANA PUTRA');
INSERT INTO `master_pegawai` VALUES ('2431', 'G384', 'AGUNG PURWANTO NUGROHO');
INSERT INTO `master_pegawai` VALUES ('2432', 'G385', 'AMANDA GHITA PURNAMA');
INSERT INTO `master_pegawai` VALUES ('2433', 'G386', 'ANISA DWI SAPUTRI');
INSERT INTO `master_pegawai` VALUES ('2434', 'G387', 'ACHMAD FAUZI');
INSERT INTO `master_pegawai` VALUES ('2435', 'G388', 'ARDIYAN NOVRIYANTO');
INSERT INTO `master_pegawai` VALUES ('2436', 'G389', 'ARIEF RAHMAN MAULUDA');
INSERT INTO `master_pegawai` VALUES ('2437', 'G390', 'ARIF BUDI SANTOSO');
INSERT INTO `master_pegawai` VALUES ('2438', 'G391', 'ASEP SYAHIDI');
INSERT INTO `master_pegawai` VALUES ('2439', 'G392', 'AVIF ALIFUDIN GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('2440', 'G456', 'MUHAMMAD FUAD');
INSERT INTO `master_pegawai` VALUES ('2441', 'G457', 'MUHAMMAD KHOIRUL NGUBAIDI');
INSERT INTO `master_pegawai` VALUES ('2442', 'G458', 'MUHAMMAD KHOIRUZZADI');
INSERT INTO `master_pegawai` VALUES ('2443', 'G459', 'MUHAMMAD TRIO ROFI YANTO');
INSERT INTO `master_pegawai` VALUES ('2444', 'G460', 'MUHAMMAD TULUS RAIHAN');
INSERT INTO `master_pegawai` VALUES ('2445', 'G461', 'AHMAD RIZKI FAUZI');
INSERT INTO `master_pegawai` VALUES ('2446', 'G462', 'NAUFAL AL ABRORY');
INSERT INTO `master_pegawai` VALUES ('2447', 'G463', 'NICKO FELLY SARJONO');
INSERT INTO `master_pegawai` VALUES ('2448', 'G464', 'NILAM KURNIAWATI');
INSERT INTO `master_pegawai` VALUES ('2449', 'G465', 'NUNUK NOVITASARI');
INSERT INTO `master_pegawai` VALUES ('2450', 'G466', 'NUR ASIAH JAMIL');
INSERT INTO `master_pegawai` VALUES ('2451', 'G467', 'NUR ROHMAN');
INSERT INTO `master_pegawai` VALUES ('2452', 'G468', 'NUR VAIZAH');
INSERT INTO `master_pegawai` VALUES ('2453', 'G469', 'NURAIDA DIAH WAHYUNINGTIAS');
INSERT INTO `master_pegawai` VALUES ('2454', 'G470', 'NURUL ICHWAN');
INSERT INTO `master_pegawai` VALUES ('2455', 'G471', 'NURUL RALIN FAUZIAH');
INSERT INTO `master_pegawai` VALUES ('2456', 'G472', 'OKTA ADAM FAUZI');
INSERT INTO `master_pegawai` VALUES ('2457', 'G473', 'OKTA TRI REJEKI FAUJI');
INSERT INTO `master_pegawai` VALUES ('2458', 'G474', 'OVI MARZUKI');
INSERT INTO `master_pegawai` VALUES ('2459', 'G475', 'PASHA DILAH LUBIS');
INSERT INTO `master_pegawai` VALUES ('2460', 'G476', 'PASKAL GAMERYO');
INSERT INTO `master_pegawai` VALUES ('2461', 'G477', 'PEBI DAYNI');
INSERT INTO `master_pegawai` VALUES ('2462', 'G478', 'PERMANA NURLANA RIZQY ILAHY');
INSERT INTO `master_pegawai` VALUES ('2463', 'G479', 'RAKADITYA SEPTIAWAN');
INSERT INTO `master_pegawai` VALUES ('2464', 'G480', 'RAMADHAN EKA HENRIYANTO PUTRA');
INSERT INTO `master_pegawai` VALUES ('2465', 'G481', 'RANGGA ADITYA PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2466', 'G482', 'RENY NOVIANTI');
INSERT INTO `master_pegawai` VALUES ('2467', 'G483', 'RESTI APRILIA');
INSERT INTO `master_pegawai` VALUES ('2468', 'G484', 'REZA SANDY JUNIAR');
INSERT INTO `master_pegawai` VALUES ('2469', 'G485', 'RIAN DWI SAPUTRO');
INSERT INTO `master_pegawai` VALUES ('2470', 'G486', 'RICKY DIAN PERMANA');
INSERT INTO `master_pegawai` VALUES ('2471', 'G487', 'RIFKI FAUZAN AKBAR');
INSERT INTO `master_pegawai` VALUES ('2472', 'G488', 'RIO SYA\'BANI');
INSERT INTO `master_pegawai` VALUES ('2473', 'G489', 'RISKA SEPTIANTI');
INSERT INTO `master_pegawai` VALUES ('2474', 'G490', 'RIZAL FATONI');
INSERT INTO `master_pegawai` VALUES ('2475', 'G491', 'RIZAL YOGI RINALDHI');
INSERT INTO `master_pegawai` VALUES ('2476', 'G492', 'RIZKI FAUZI');
INSERT INTO `master_pegawai` VALUES ('2477', 'G493', 'RIZKI MAULANA');
INSERT INTO `master_pegawai` VALUES ('2478', 'G494', 'RIZKY HIDAYATI');
INSERT INTO `master_pegawai` VALUES ('2479', 'G495', 'ROHMAN AGUNG PRAYOGO');
INSERT INTO `master_pegawai` VALUES ('2480', 'G496', 'ROHMAT DONI');
INSERT INTO `master_pegawai` VALUES ('2481', 'G497', 'RUDI MUHAMAD RISMAYANA');
INSERT INTO `master_pegawai` VALUES ('2482', 'G498', 'RYAN ADI NUGROHO');
INSERT INTO `master_pegawai` VALUES ('2483', 'G499', 'AGUS AZIZ');
INSERT INTO `master_pegawai` VALUES ('2484', 'G500', 'SANDI DANIALA PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2485', 'G501', 'SENDY AZIZ NOVIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2486', 'G502', 'SERGIO LILI AFRIDA SUDIRMAN');
INSERT INTO `master_pegawai` VALUES ('2487', 'G503', 'SETIYA ARDANA');
INSERT INTO `master_pegawai` VALUES ('2488', 'G504', 'SHANDY PRASETYO');
INSERT INTO `master_pegawai` VALUES ('2489', 'G505', 'SHANDY SYAHPUTRA');
INSERT INTO `master_pegawai` VALUES ('2490', 'G506', 'SIGIT PURNOMO AJI');
INSERT INTO `master_pegawai` VALUES ('2491', 'G507', 'SINUNG ADHI ANDOYO');
INSERT INTO `master_pegawai` VALUES ('2492', 'G508', 'SOFIA NURRAHAYU');
INSERT INTO `master_pegawai` VALUES ('2493', 'G509', 'SUBUR BANGKIT WIJAYA');
INSERT INTO `master_pegawai` VALUES ('2494', 'G510', 'SUGIO PRANOTO');
INSERT INTO `master_pegawai` VALUES ('2495', 'G511', 'SUPRIYATNA');
INSERT INTO `master_pegawai` VALUES ('2496', 'G512', 'TEGUH EKA PRASETYA');
INSERT INTO `master_pegawai` VALUES ('2497', 'G513', 'AJI SETIABUDI');
INSERT INTO `master_pegawai` VALUES ('2498', 'G514', 'TRI BANDA RAHAYU');
INSERT INTO `master_pegawai` VALUES ('2499', 'G515', 'AHMAD DARMAWAN');
INSERT INTO `master_pegawai` VALUES ('2500', 'G516', 'TRIYONO');
INSERT INTO `master_pegawai` VALUES ('2501', 'G517', 'UJANG KRISNANDAR');
INSERT INTO `master_pegawai` VALUES ('2502', 'G612', 'RUWANTI');
INSERT INTO `master_pegawai` VALUES ('2503', 'G613', 'FEGA HERNAWAN');
INSERT INTO `master_pegawai` VALUES ('2504', 'G614', 'SELVIA ULFANI');
INSERT INTO `master_pegawai` VALUES ('2505', 'G615', 'SEPTIA ABDULLAH');
INSERT INTO `master_pegawai` VALUES ('2506', 'G616', 'SHERYL VAZRANI');
INSERT INTO `master_pegawai` VALUES ('2507', 'G617', 'SISKA KUSUMA WARDANI');
INSERT INTO `master_pegawai` VALUES ('2508', 'G618', 'SUKRON MA\'MUN');
INSERT INTO `master_pegawai` VALUES ('2509', 'G619', 'SYAEFUDIN HAMZAH');
INSERT INTO `master_pegawai` VALUES ('2510', 'G620', 'SYAHRUL ARDIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2511', 'G621', 'SYAMSUL ARIFIN');
INSERT INTO `master_pegawai` VALUES ('2512', 'G624', 'UJANG PIAN');
INSERT INTO `master_pegawai` VALUES ('2513', 'G625', 'UMAR IBNU ZAINAL MUTTAQIN');
INSERT INTO `master_pegawai` VALUES ('2514', 'G626', 'WACHIDATUL AYU FITRI');
INSERT INTO `master_pegawai` VALUES ('2515', 'G627', 'WIDODO ARI SETIAWAN');
INSERT INTO `master_pegawai` VALUES ('2516', 'G628', 'WIWIT WIJAYANTO PUTRA');
INSERT INTO `master_pegawai` VALUES ('2517', 'G629', 'YAYAH MIYANTIH');
INSERT INTO `master_pegawai` VALUES ('2518', 'G631', 'ZAENI MAHROM');
INSERT INTO `master_pegawai` VALUES ('2519', 'G632', 'ZAKKI FAUZAN ZAKARIA');
INSERT INTO `master_pegawai` VALUES ('2520', 'G633', 'ZUBAIR FATURRAHMAN');
INSERT INTO `master_pegawai` VALUES ('2521', 'G634', 'ZULFIKAR HIDAYATULLAH');
INSERT INTO `master_pegawai` VALUES ('2522', 'G635', 'HUDA WAHYU ILAHI');
INSERT INTO `master_pegawai` VALUES ('2523', 'G636', 'ILHAM RAMADHAN JANUAR');
INSERT INTO `master_pegawai` VALUES ('2524', 'G637', 'LUTHER IMAN SUSETYO');
INSERT INTO `master_pegawai` VALUES ('2525', 'G638', 'MUHAMMAD SURFA\'I');
INSERT INTO `master_pegawai` VALUES ('2526', 'G639', 'OBBY ANGGARA');
INSERT INTO `master_pegawai` VALUES ('2527', 'G641', 'RAHMAT NURFAUZI');
INSERT INTO `master_pegawai` VALUES ('2528', 'G642', 'RAMDANI');
INSERT INTO `master_pegawai` VALUES ('2529', 'G643', 'RISMANTO');
INSERT INTO `master_pegawai` VALUES ('2530', 'G644', 'SEPTIAN SANTOSO');
INSERT INTO `master_pegawai` VALUES ('2531', 'G645', 'SEPTYA RINI HARYONO');
INSERT INTO `master_pegawai` VALUES ('2532', 'G646', 'AKBAR DEWANTARA');
INSERT INTO `master_pegawai` VALUES ('2533', 'G647', 'M.REZKI YULIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2534', 'G518', 'WAWAN GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('2535', 'G519', 'WINDRIYANI');
INSERT INTO `master_pegawai` VALUES ('2536', 'G520', 'YUDI SUPRIYADI');
INSERT INTO `master_pegawai` VALUES ('2537', 'G521', 'ZAENAL MUTTAQIN');
INSERT INTO `master_pegawai` VALUES ('2538', 'G522', 'ZULHADI');
INSERT INTO `master_pegawai` VALUES ('2539', 'G523', 'ALQORI ALFI BRAMANTYO');
INSERT INTO `master_pegawai` VALUES ('2540', 'G524', 'ALFREDO GUSTA DANUPUTRA');
INSERT INTO `master_pegawai` VALUES ('2541', 'G525', 'ANDRES LESMANA');
INSERT INTO `master_pegawai` VALUES ('2542', 'G526', 'ANDRI KRISTIAWAN');
INSERT INTO `master_pegawai` VALUES ('2543', 'G527', 'ANGGI RINGGO KUNCORO JATI');
INSERT INTO `master_pegawai` VALUES ('2544', 'G528', 'ANGGRAENI');
INSERT INTO `master_pegawai` VALUES ('2545', 'G529', 'ANISA HERDIANI');
INSERT INTO `master_pegawai` VALUES ('2546', 'G530', 'ANJAR');
INSERT INTO `master_pegawai` VALUES ('2547', 'G531', 'ARIF SOPIAN');
INSERT INTO `master_pegawai` VALUES ('2548', 'G532', 'ASEP SURYANA');
INSERT INTO `master_pegawai` VALUES ('2549', 'G533', 'AVRILA WIRANTI');
INSERT INTO `master_pegawai` VALUES ('2550', 'G534', 'BAGUS RILIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2551', 'G535', 'BALQIS PUTRI DENA');
INSERT INTO `master_pegawai` VALUES ('2552', 'G536', 'BANI SUHUD');
INSERT INTO `master_pegawai` VALUES ('2553', 'G537', 'BAYU KURNIADI');
INSERT INTO `master_pegawai` VALUES ('2554', 'G538', 'BELA PERMATASARI');
INSERT INTO `master_pegawai` VALUES ('2555', 'G539', 'BELLA SONIA NOVIANTY');
INSERT INTO `master_pegawai` VALUES ('2556', 'G540', 'BILLY ANJASWARA');
INSERT INTO `master_pegawai` VALUES ('2557', 'G541', 'CINTHYA DEWI ZHAVIERA');
INSERT INTO `master_pegawai` VALUES ('2558', 'G542', 'CITRA TAMARA DEBRIANI');
INSERT INTO `master_pegawai` VALUES ('2559', 'G543', 'DENI KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2560', 'G544', 'DEWI PERTIWI');
INSERT INTO `master_pegawai` VALUES ('2561', 'G545', 'DIMAS ZULFIRIANDY');
INSERT INTO `master_pegawai` VALUES ('2562', 'G546', 'DINI ANDINI');
INSERT INTO `master_pegawai` VALUES ('2563', 'G547', 'DODY SUYATNO');
INSERT INTO `master_pegawai` VALUES ('2564', 'G548', 'DONI DARMAWAN');
INSERT INTO `master_pegawai` VALUES ('2565', 'G549', 'DYAH AYU MUSTIKA DEWI');
INSERT INTO `master_pegawai` VALUES ('2566', 'G550', 'EFRIL NINDYAPRAYOGA');
INSERT INTO `master_pegawai` VALUES ('2567', 'G551', 'ERWAN SURYA PRASETYO');
INSERT INTO `master_pegawai` VALUES ('2568', 'G552', 'ERWIN RAMADHAN');
INSERT INTO `master_pegawai` VALUES ('2569', 'G553', 'FAUZAN EGI PRATOMO');
INSERT INTO `master_pegawai` VALUES ('2570', 'G554', 'FIKI RAMDANI');
INSERT INTO `master_pegawai` VALUES ('2571', 'G555', 'GHUFRON MUKHLAS HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('2572', 'G556', 'GUNTUR PUTRA PRABOWO');
INSERT INTO `master_pegawai` VALUES ('2573', 'G557', 'HAINA APRILIANI');
INSERT INTO `master_pegawai` VALUES ('2574', 'G558', 'HANA ANJARSARI');
INSERT INTO `master_pegawai` VALUES ('2575', 'G559', 'HANIEF NUR MUHAMMAD');
INSERT INTO `master_pegawai` VALUES ('2576', 'G560', 'HASAN BISRI');
INSERT INTO `master_pegawai` VALUES ('2577', 'G561', 'HERMANSYAH');
INSERT INTO `master_pegawai` VALUES ('2578', 'G562', 'IIS KURNIA');
INSERT INTO `master_pegawai` VALUES ('2579', 'G563', 'ILHAM MUHAMMAD AULIA');
INSERT INTO `master_pegawai` VALUES ('2580', 'G564', 'ILHAM NUR ABRYAN');
INSERT INTO `master_pegawai` VALUES ('2581', 'G565', 'INDAH ANGGRAENI');
INSERT INTO `master_pegawai` VALUES ('2582', 'G566', 'IRFAN ARWIKHI');
INSERT INTO `master_pegawai` VALUES ('2583', 'G567', 'JULPI ABDUL MUTI');
INSERT INTO `master_pegawai` VALUES ('2584', 'G568', 'KEMAS AHMAD RIFAI');
INSERT INTO `master_pegawai` VALUES ('2585', 'G569', 'KIKI SUKENDRO');
INSERT INTO `master_pegawai` VALUES ('2586', 'G570', 'KISMAN SAFEI');
INSERT INTO `master_pegawai` VALUES ('2587', 'G571', 'LAELA ANA AGUSTIN');
INSERT INTO `master_pegawai` VALUES ('2588', 'G572', 'LANTIP SUHINDRO');
INSERT INTO `master_pegawai` VALUES ('2589', 'G573', 'LEKHA BIMA FATKURROHMAN');
INSERT INTO `master_pegawai` VALUES ('2590', 'G574', 'LUCKY GUSTIANA PERMADI');
INSERT INTO `master_pegawai` VALUES ('2591', 'G575', 'LUKY LUKMAN HAKIM');
INSERT INTO `master_pegawai` VALUES ('2592', 'G576', 'M. ATTAUFAN HAZAMI');
INSERT INTO `master_pegawai` VALUES ('2593', 'G577', 'MARFIANA DEFI SARI');
INSERT INTO `master_pegawai` VALUES ('2594', 'G578', 'ASEP MUHAMAD PAJAR');
INSERT INTO `master_pegawai` VALUES ('2595', 'G579', 'MUHAMAD ADHITYA AZHAR');
INSERT INTO `master_pegawai` VALUES ('2596', 'G580', 'M. DONY YUSUF');
INSERT INTO `master_pegawai` VALUES ('2597', 'G581', 'MUHAMAD NASRULLOH');
INSERT INTO `master_pegawai` VALUES ('2598', 'G582', 'MUHAMAD NAUFAL NURUL AGHIYATS');
INSERT INTO `master_pegawai` VALUES ('2599', 'G583', 'MUHAMAD RIDWAN GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('2600', 'G584', 'MUHAMAD RIZKY');
INSERT INTO `master_pegawai` VALUES ('2601', 'G585', 'MUHAMMAD ABDUL ROFIK');
INSERT INTO `master_pegawai` VALUES ('2602', 'G586', 'MUHAMMAD AFIF');
INSERT INTO `master_pegawai` VALUES ('2603', 'G587', 'MUHAMMAD ALFANI FEBRIANTO');
INSERT INTO `master_pegawai` VALUES ('2604', 'G589', 'MUHAMMAD AULIA WISNUTAMA');
INSERT INTO `master_pegawai` VALUES ('2605', 'G590', 'MUHAMMAD FAISAL AKBAR');
INSERT INTO `master_pegawai` VALUES ('2606', 'G591', 'MUHAMMAD RIDWAN');
INSERT INTO `master_pegawai` VALUES ('2607', 'G592', 'MUHAMMAD THOIQUS SAMIH');
INSERT INTO `master_pegawai` VALUES ('2608', 'G593', 'MUHAMMAD ZULFIKAR');
INSERT INTO `master_pegawai` VALUES ('2609', 'G594', 'MUHLY SAUQI HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('2610', 'G595', 'NOCKY ABDUL FAUZAN');
INSERT INTO `master_pegawai` VALUES ('2611', 'G596', 'NOVA RAHMATYASTUTI');
INSERT INTO `master_pegawai` VALUES ('2612', 'G597', 'NURLITA SUKMA INSANI');
INSERT INTO `master_pegawai` VALUES ('2613', 'G598', 'RAFII EKA SYAHPUTRA');
INSERT INTO `master_pegawai` VALUES ('2614', 'G599', 'RAFIKA INDRA PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2615', 'G600', 'RESTIKA MILANI');
INSERT INTO `master_pegawai` VALUES ('2616', 'G601', 'REVIYAN ALBI WAHYUDI');
INSERT INTO `master_pegawai` VALUES ('2617', 'G602', 'RIDWAN ADIMAN JATI');
INSERT INTO `master_pegawai` VALUES ('2618', 'G603', 'RIVALDI PASKHA HARMAEN');
INSERT INTO `master_pegawai` VALUES ('2619', 'G604', 'RIVALDI RIYANTO');
INSERT INTO `master_pegawai` VALUES ('2620', 'G605', 'RIZA HAMMID PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2621', 'G606', 'RIZKI ALFANI');
INSERT INTO `master_pegawai` VALUES ('2622', 'G607', 'RIZKI MUHAMAD RIZAL');
INSERT INTO `master_pegawai` VALUES ('2623', 'G609', 'DEWA WIJAYA KUSUMA');
INSERT INTO `master_pegawai` VALUES ('2624', 'G610', 'RIZKY RIFANTO');
INSERT INTO `master_pegawai` VALUES ('2625', 'G611', 'ROBI NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('2626', 'G425', 'ILHAMDA RAFI FERDANI');
INSERT INTO `master_pegawai` VALUES ('2627', 'G426', 'IMADUDDIN NASHRUL');
INSERT INTO `master_pegawai` VALUES ('2628', 'G427', 'IMAM RIANDI');
INSERT INTO `master_pegawai` VALUES ('2629', 'G428', 'IMAM TANTOWI');
INSERT INTO `master_pegawai` VALUES ('2630', 'G429', 'KATON SUGIARTO');
INSERT INTO `master_pegawai` VALUES ('2631', 'G431', 'KURNIAWAN AMRI');
INSERT INTO `master_pegawai` VALUES ('2632', 'G432', 'KURNIAWAN SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('2633', 'G433', 'ADITYA AFFANDI');
INSERT INTO `master_pegawai` VALUES ('2634', 'G434', 'M. SYAHRUL ROBBI');
INSERT INTO `master_pegawai` VALUES ('2635', 'G435', 'MACHILLAH AFANY DURLISTA');
INSERT INTO `master_pegawai` VALUES ('2636', 'G436', 'MAGHFIRAH RIZKI AMELIA');
INSERT INTO `master_pegawai` VALUES ('2637', 'G437', 'MALINDA AYUNDA BERNI');
INSERT INTO `master_pegawai` VALUES ('2638', 'G438', 'MEIDA SURYANI');
INSERT INTO `master_pegawai` VALUES ('2639', 'G439', 'MIFTAKHUS SOBIRIN');
INSERT INTO `master_pegawai` VALUES ('2640', 'G440', 'MIRANTI WAHYUNINGTIAS');
INSERT INTO `master_pegawai` VALUES ('2641', 'G441', 'MOCH RIFKI HADIYAT');
INSERT INTO `master_pegawai` VALUES ('2642', 'G442', 'MOCHAMAD TEGUH HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('2643', 'G443', 'ACHMAD HASYIM SA\'ID');
INSERT INTO `master_pegawai` VALUES ('2644', 'G444', 'MOHAMAD IKBAL');
INSERT INTO `master_pegawai` VALUES ('2645', 'G445', 'MOHAMAD RIZKI');
INSERT INTO `master_pegawai` VALUES ('2646', 'G446', 'MUHAMMAD FAJAR INSAN ABDILLAH');
INSERT INTO `master_pegawai` VALUES ('2647', 'G447', 'MUHAMAD ADHAM AHYAN');
INSERT INTO `master_pegawai` VALUES ('2648', 'G448', 'MUHAMAD FARUQ ROJABI');
INSERT INTO `master_pegawai` VALUES ('2649', 'G449', 'MUHAMAD NUR ADHA');
INSERT INTO `master_pegawai` VALUES ('2650', 'G450', 'MUHAMAD RIFKI');
INSERT INTO `master_pegawai` VALUES ('2651', 'G451', 'MUHAMAD WILDAN HANAFI');
INSERT INTO `master_pegawai` VALUES ('2652', 'G452', 'MUHAMMAD AMIN NURDIN');
INSERT INTO `master_pegawai` VALUES ('2653', 'G453', 'MUHAMMAD ARIEF NADHOFA');
INSERT INTO `master_pegawai` VALUES ('2654', 'G454', 'MUHAMMAD DICKY HANIF PRASETYO');
INSERT INTO `master_pegawai` VALUES ('2655', 'G455', 'MUHAMMAD FIKRI ADHIRAJASA');
INSERT INTO `master_pegawai` VALUES ('2656', 'G649', 'GILANG RAMADHAN');
INSERT INTO `master_pegawai` VALUES ('2657', 'G650', 'MISBAHUDIN');
INSERT INTO `master_pegawai` VALUES ('2658', 'G651', 'NOVIANDI HADI PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2659', 'G652', 'SOFYAN ADYATNA');
INSERT INTO `master_pegawai` VALUES ('2660', 'G653', 'YUSUF PRAYOGA YULIANTO');
INSERT INTO `master_pegawai` VALUES ('2661', 'G654', 'JONESIUS JULINDO PURBA');
INSERT INTO `master_pegawai` VALUES ('2662', 'G655', 'ANDONY ARIY ANTORO');
INSERT INTO `master_pegawai` VALUES ('2663', 'G657', 'MURSID SAMIAJI');
INSERT INTO `master_pegawai` VALUES ('2664', 'G658', 'BUDI NUGRAHA');
INSERT INTO `master_pegawai` VALUES ('2665', 'G659', 'ALFIAN');
INSERT INTO `master_pegawai` VALUES ('2666', 'G661', 'HERLAN JAELANI');
INSERT INTO `master_pegawai` VALUES ('2667', 'G662', 'ADHA RAHMAT DIANANDA');
INSERT INTO `master_pegawai` VALUES ('2668', 'G663', 'PEBRI PUJI HARIYANTO');
INSERT INTO `master_pegawai` VALUES ('2669', 'G664', 'MAULANA BAHARI');
INSERT INTO `master_pegawai` VALUES ('2670', 'G665', 'WAWAN GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('2671', 'G666', 'IMAN TABAROKAH');
INSERT INTO `master_pegawai` VALUES ('2672', 'G667', 'AMAT ZAENUDIN');
INSERT INTO `master_pegawai` VALUES ('2673', 'G669', 'RENDHY DWI PUTRANTO');
INSERT INTO `master_pegawai` VALUES ('2674', 'G670', 'JARWANTO');
INSERT INTO `master_pegawai` VALUES ('2675', 'G671', 'YUSWAN YUDISEP');
INSERT INTO `master_pegawai` VALUES ('2676', 'G672', 'ADITYA EKA NURGIAWAN');
INSERT INTO `master_pegawai` VALUES ('2677', 'G673', 'SEPTIAN BAGUS KEMBARA');
INSERT INTO `master_pegawai` VALUES ('2678', 'G674', 'MUHAMMAD RAKA ANJASKARA');
INSERT INTO `master_pegawai` VALUES ('2679', 'G675', 'MUHAMAD FARHAN NIKMATAN');
INSERT INTO `master_pegawai` VALUES ('2680', 'G676', 'FAISAL RIADY');
INSERT INTO `master_pegawai` VALUES ('2681', 'G677', 'ARYA TRI SAKTI');
INSERT INTO `master_pegawai` VALUES ('2682', 'G678', 'DHIMAS FAJAR');
INSERT INTO `master_pegawai` VALUES ('2683', 'G679', 'SUGITO');
INSERT INTO `master_pegawai` VALUES ('2684', 'G680', 'ANGGIE DWI SYAPUTRA');
INSERT INTO `master_pegawai` VALUES ('2685', 'G681', 'ARIF MAULANA HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('2686', 'G682', 'FIKI ADRIANTO');
INSERT INTO `master_pegawai` VALUES ('2687', 'G683', 'GALIH ANGGRIAWAN');
INSERT INTO `master_pegawai` VALUES ('2688', 'G684', 'HABIB SANDI PRADANA');
INSERT INTO `master_pegawai` VALUES ('2689', 'G685', 'YULIANTO TRI WIDODO');
INSERT INTO `master_pegawai` VALUES ('2690', 'G686', 'IMAM ISMAIL');
INSERT INTO `master_pegawai` VALUES ('2691', 'G687', 'KHAIRUL RAMDANI');
INSERT INTO `master_pegawai` VALUES ('2692', 'G688', 'MIFTAH ARDIA SASMITA');
INSERT INTO `master_pegawai` VALUES ('2693', 'G689', 'EKA JULIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2694', 'G690', 'M. ALWI BUHOERI');
INSERT INTO `master_pegawai` VALUES ('2695', 'G691', 'M.ARIF IRMANTO');
INSERT INTO `master_pegawai` VALUES ('2696', 'G692', 'MUHAMMAD FACHRI A');
INSERT INTO `master_pegawai` VALUES ('2697', 'G693', 'MUHAMMAD MARWAN');
INSERT INTO `master_pegawai` VALUES ('2698', 'G694', 'MUHAMMAD YUSUF FERDIANS');
INSERT INTO `master_pegawai` VALUES ('2699', 'G695', 'PANCA KURNIA RIVAY');
INSERT INTO `master_pegawai` VALUES ('2700', 'G696', 'RIDWAN AZIS');
INSERT INTO `master_pegawai` VALUES ('2701', 'G697', 'RIVAN NUR RAHMAN');
INSERT INTO `master_pegawai` VALUES ('2702', 'G698', 'RIZAL NOVIANDRI P');
INSERT INTO `master_pegawai` VALUES ('2703', 'G699', 'YUDI SOLEH');
INSERT INTO `master_pegawai` VALUES ('2704', 'G700', 'ADE IMRON SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('2705', 'G701', 'EPAN NURSIGIT');
INSERT INTO `master_pegawai` VALUES ('2706', 'G702', 'TIO KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2707', 'G703', 'MUHAMMAD IMAM BUKHORI');
INSERT INTO `master_pegawai` VALUES ('2708', 'G704', 'CHRISTIAN VEBRIE ADITYA ANGGI');
INSERT INTO `master_pegawai` VALUES ('2709', 'G705', 'YOGI SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('2710', 'G706', 'TIMOR WISNU MUKTI W');
INSERT INTO `master_pegawai` VALUES ('2711', 'G707', 'MUCHAMAD AGUNG PERMANA');
INSERT INTO `master_pegawai` VALUES ('2712', 'G708', 'SATRIA PRASTA ANANDA');
INSERT INTO `master_pegawai` VALUES ('2713', 'G709', 'M.FARHAN DZAKY KAMAL');
INSERT INTO `master_pegawai` VALUES ('2714', 'G710', 'NUR AZIZ');
INSERT INTO `master_pegawai` VALUES ('2715', 'G711', 'DIDIK EGO WIRATNO');
INSERT INTO `master_pegawai` VALUES ('2716', 'G712', 'SHANTDY MUHAMMAD');
INSERT INTO `master_pegawai` VALUES ('2717', 'G713', 'ADI SASMITA');
INSERT INTO `master_pegawai` VALUES ('2718', 'G714', 'YUSUF ANSHORI TOSADU');
INSERT INTO `master_pegawai` VALUES ('2719', 'G715', 'ABU DZAR AL GHIPARI');
INSERT INTO `master_pegawai` VALUES ('2720', 'G717', 'TEGUH PRIYATNO');
INSERT INTO `master_pegawai` VALUES ('2721', 'G718', 'AARON BAGUS JAGAT D');
INSERT INTO `master_pegawai` VALUES ('2722', 'G719', 'RAMDHAN ASHARI');
INSERT INTO `master_pegawai` VALUES ('2723', 'G720', 'MOCHAMAD ZAINUDDIN');
INSERT INTO `master_pegawai` VALUES ('2724', 'G721', 'AHMAD MUTAQIN');
INSERT INTO `master_pegawai` VALUES ('2725', 'G722', 'ACHMAD SYAMSUDDIN');
INSERT INTO `master_pegawai` VALUES ('2726', 'G723', 'CHARLEE YAN');
INSERT INTO `master_pegawai` VALUES ('2727', 'G724', 'DIAN SAFITRI');
INSERT INTO `master_pegawai` VALUES ('2728', 'G725', 'HUMEIRAH HIDAYAH');
INSERT INTO `master_pegawai` VALUES ('2729', 'G726', 'ILHAM FAUZI');
INSERT INTO `master_pegawai` VALUES ('2730', 'G727', 'ISTIQOMAH');
INSERT INTO `master_pegawai` VALUES ('2731', 'G728', 'RATRIE PUTRI KHARISMA');
INSERT INTO `master_pegawai` VALUES ('2732', 'G729', 'SHABRINA NURAULIA');
INSERT INTO `master_pegawai` VALUES ('2733', 'G730', 'SITI FAZRIAH');
INSERT INTO `master_pegawai` VALUES ('2734', 'G731', 'YUKE ANDINI PUTRI');
INSERT INTO `master_pegawai` VALUES ('2735', 'G732', 'ADEN AJI NUSANTARA');
INSERT INTO `master_pegawai` VALUES ('2736', 'G733', 'ANGGA SAPUTRA');
INSERT INTO `master_pegawai` VALUES ('2737', 'G734', 'MOCHAMMAD RIO KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2738', 'G735', 'MUHAMAD RAMDHANI');
INSERT INTO `master_pegawai` VALUES ('2739', 'G736', 'ADI GUNAWAN');
INSERT INTO `master_pegawai` VALUES ('2740', 'G737', 'ADITYA AJI PANGESTU');
INSERT INTO `master_pegawai` VALUES ('2741', 'G738', 'DHARMA SUMIRAT SOMAWIJAYA');
INSERT INTO `master_pegawai` VALUES ('2742', 'G739', 'GALLIH PANGESTU');
INSERT INTO `master_pegawai` VALUES ('2743', 'G740', 'MOHAMAD REZA PELITAWAN');
INSERT INTO `master_pegawai` VALUES ('2744', 'G741', 'DEDI JUNAEDI');
INSERT INTO `master_pegawai` VALUES ('2745', 'G742', 'GHIZA ALAMSYAH');
INSERT INTO `master_pegawai` VALUES ('2746', 'G743', 'AMY RESMININGSIH');
INSERT INTO `master_pegawai` VALUES ('2747', 'L033', 'Drs.SAHAT TAMPUBOLON, SE, MBA');
INSERT INTO `master_pegawai` VALUES ('2748', 'L042', 'NUR WAHID');
INSERT INTO `master_pegawai` VALUES ('2749', 'L043', 'ARI WAHYUNI, S.H., MPM');
INSERT INTO `master_pegawai` VALUES ('2750', 'L044', 'RUGUN HUTAPEA, S.E.');
INSERT INTO `master_pegawai` VALUES ('2751', 'L048', 'YANTO SUGIANTO');
INSERT INTO `master_pegawai` VALUES ('2752', 'L049', 'MAWARTI');
INSERT INTO `master_pegawai` VALUES ('2753', 'L050', 'DR. IR. RIZAL AFFANDI LUKMAN, MA.');
INSERT INTO `master_pegawai` VALUES ('2754', 'L051', 'ERNA WIJAYANTI, S.E.');
INSERT INTO `master_pegawai` VALUES ('2755', 'L052', 'HASIHOLAN SIAHAAN');
INSERT INTO `master_pegawai` VALUES ('2756', 'L053', 'DRS. SUROSO HADI SISWOYO, M.Si');
INSERT INTO `master_pegawai` VALUES ('2757', 'L054', 'GUMILAR RAHADHYAN PRASETYA');
INSERT INTO `master_pegawai` VALUES ('2758', 'L055', 'SUFI SAFITRI NURWIDIATI');
INSERT INTO `master_pegawai` VALUES ('2759', 'L056', 'TEGUH WIDHYO UTOMO');
INSERT INTO `master_pegawai` VALUES ('2760', 'L058', 'MAYA INDRESWARI');
INSERT INTO `master_pegawai` VALUES ('2761', 'M075', 'RIKI MAULANA');
INSERT INTO `master_pegawai` VALUES ('2762', 'M082', 'RIZKY RAMADHAN');
INSERT INTO `master_pegawai` VALUES ('2763', 'M085', 'RIDWAN NUGROHO');
INSERT INTO `master_pegawai` VALUES ('2764', 'M134', 'ZULFAR RIFATUROHMAN');
INSERT INTO `master_pegawai` VALUES ('2765', 'M142', 'DEKA JAMAIKA');
INSERT INTO `master_pegawai` VALUES ('2766', 'M144', 'ENRICO FAISHAL');
INSERT INTO `master_pegawai` VALUES ('2767', 'M149', 'IAN KUSUMAH');
INSERT INTO `master_pegawai` VALUES ('2768', 'M150', 'ILHAM KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2769', 'M153', 'IRFAN MAULANA');
INSERT INTO `master_pegawai` VALUES ('2770', 'M154', 'IVAN KRISTA BUANA PALEDI');
INSERT INTO `master_pegawai` VALUES ('2771', 'M155', 'ASEP JAMALUDIN');
INSERT INTO `master_pegawai` VALUES ('2772', 'M157', 'KENNY BAGAS DWI JUMATIN');
INSERT INTO `master_pegawai` VALUES ('2773', 'M158', 'LUTHFI ALAMSYAH');
INSERT INTO `master_pegawai` VALUES ('2774', 'M160', 'MUHAMMAD ROBI JULIS FIRNANDA');
INSERT INTO `master_pegawai` VALUES ('2775', 'M162', 'MOHAMAD FIKRI HADI');
INSERT INTO `master_pegawai` VALUES ('2776', 'M165', 'PEDRIK MAULANA');
INSERT INTO `master_pegawai` VALUES ('2777', 'M166', 'REZA DIAN MULYANA');
INSERT INTO `master_pegawai` VALUES ('2778', 'M183', 'FAISAL INDRIYATMO BHAROTO');
INSERT INTO `master_pegawai` VALUES ('2779', 'M185', 'FARID MAULANA');
INSERT INTO `master_pegawai` VALUES ('2780', 'M190', 'IMAN MAULANA');
INSERT INTO `master_pegawai` VALUES ('2781', 'M202', 'MUHAMMAD ARI RAHMAN SIDIQ');
INSERT INTO `master_pegawai` VALUES ('2782', 'M218', 'AGUSTINA WAHYUNINGSIH');
INSERT INTO `master_pegawai` VALUES ('2783', 'M221', 'DEWI RIYANTI WIBOWO');
INSERT INTO `master_pegawai` VALUES ('2784', 'M231', 'NADIA SUKMA DINDA');
INSERT INTO `master_pegawai` VALUES ('2785', 'M233', 'PUSPITA PUTRI PERTIWI');
INSERT INTO `master_pegawai` VALUES ('2786', 'M236', 'RUSITA AFRIYANTI');
INSERT INTO `master_pegawai` VALUES ('2787', 'M240', 'FAISAL MULYANA');
INSERT INTO `master_pegawai` VALUES ('2788', 'M241', 'FARID HUSNI JAMIL');
INSERT INTO `master_pegawai` VALUES ('2789', 'M243', 'JOSUA JEPRI TARIGAN');
INSERT INTO `master_pegawai` VALUES ('2790', 'M244', 'MUHAMMAD FAQIH ALIFUDDIN');
INSERT INTO `master_pegawai` VALUES ('2791', 'M245', 'SYAFRIZAL AZIZ');
INSERT INTO `master_pegawai` VALUES ('2792', 'M246', 'ADITYA HARYANTO');
INSERT INTO `master_pegawai` VALUES ('2793', 'M247', 'DENIS NURAMADAN');
INSERT INTO `master_pegawai` VALUES ('2794', 'M249', 'DICKY WAHYUDI');
INSERT INTO `master_pegawai` VALUES ('2795', 'M250', 'MUHAMMAD TOPIK');
INSERT INTO `master_pegawai` VALUES ('2796', 'M252', 'RIO HAKEEM ALMADANI');
INSERT INTO `master_pegawai` VALUES ('2797', 'M254', 'TOMI SOPIAN');
INSERT INTO `master_pegawai` VALUES ('2798', 'M255', 'TULUS HUTABARAT');
INSERT INTO `master_pegawai` VALUES ('2799', 'M256', 'WAWAN HARDIANA');
INSERT INTO `master_pegawai` VALUES ('2800', 'M300', 'ADHIE BIMA RIVALDY');
INSERT INTO `master_pegawai` VALUES ('2801', 'M301', 'ANJANI');
INSERT INTO `master_pegawai` VALUES ('2802', 'M302', 'FITRI NUR ROMADONA');
INSERT INTO `master_pegawai` VALUES ('2803', 'M303', 'HUSNUL KHOTIMAH');
INSERT INTO `master_pegawai` VALUES ('2804', 'M304', 'ICHWAN AHMAD RIVAI');
INSERT INTO `master_pegawai` VALUES ('2805', 'M305', 'IYAN FERDIAN');
INSERT INTO `master_pegawai` VALUES ('2806', 'M306', 'LEO VANI RIZKI SEPTIAWAN');
INSERT INTO `master_pegawai` VALUES ('2807', 'M307', 'MAHDALENA');
INSERT INTO `master_pegawai` VALUES ('2808', 'M308', 'MEGA AMALIA');
INSERT INTO `master_pegawai` VALUES ('2809', 'M309', 'MILA FITRIANA');
INSERT INTO `master_pegawai` VALUES ('2810', 'M310', 'MIRA MAULIDINA');
INSERT INTO `master_pegawai` VALUES ('2811', 'M311', 'MOCHAMMAD RISQI');
INSERT INTO `master_pegawai` VALUES ('2812', 'M313', 'NURFATIMAH');
INSERT INTO `master_pegawai` VALUES ('2813', 'M314', 'RIAN MUNANDIAR');
INSERT INTO `master_pegawai` VALUES ('2814', 'M316', 'SILVIA QOTRUN NADA');
INSERT INTO `master_pegawai` VALUES ('2815', 'M317', 'SITI SARA FAZRIYA');
INSERT INTO `master_pegawai` VALUES ('2816', 'M319', 'SYAIFUL RACHMAN HAKIM');
INSERT INTO `master_pegawai` VALUES ('2817', 'M320', 'AHMAD SURYADI');
INSERT INTO `master_pegawai` VALUES ('2818', 'M322', 'ALDI FIRMAN SYAH');
INSERT INTO `master_pegawai` VALUES ('2819', 'M323', 'ANWAR');
INSERT INTO `master_pegawai` VALUES ('2820', 'M324', 'DANDI');
INSERT INTO `master_pegawai` VALUES ('2821', 'M325', 'DARUS FIRMANSYAH');
INSERT INTO `master_pegawai` VALUES ('2822', 'M326', 'DEDE ALWI KURNIAWAN');
INSERT INTO `master_pegawai` VALUES ('2823', 'M327', 'DWIMAS ADITIA AKBAR MAULANA');
INSERT INTO `master_pegawai` VALUES ('2824', 'M329', 'HAPID FANANY');
INSERT INTO `master_pegawai` VALUES ('2825', 'M330', 'HENDRI FIRMANSYAH');
INSERT INTO `master_pegawai` VALUES ('2826', 'M331', 'IMAN FIRMANSYAH');
INSERT INTO `master_pegawai` VALUES ('2827', 'M332', 'IQBAL DARMANSYAH');
INSERT INTO `master_pegawai` VALUES ('2828', 'M333', 'LUTHFI HABIBI');
INSERT INTO `master_pegawai` VALUES ('2829', 'M334', 'MUHAMAD RAMDAN');
INSERT INTO `master_pegawai` VALUES ('2830', 'M335', 'MULUS YULIANO PRAJA');
INSERT INTO `master_pegawai` VALUES ('2831', 'M336', 'NENDI PERMANA');
INSERT INTO `master_pegawai` VALUES ('2832', 'M337', 'PANDI');
INSERT INTO `master_pegawai` VALUES ('2833', 'M339', 'RIZKY ANDHIKA WIJAYA');
INSERT INTO `master_pegawai` VALUES ('2834', 'M340', 'ROCHMAN HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('2835', 'M341', 'RUHIYAT');
INSERT INTO `master_pegawai` VALUES ('2836', 'M342', 'SAEPUL WAHYU');
INSERT INTO `master_pegawai` VALUES ('2837', 'M343', 'SUQMA AGTHA PRATAMA');
INSERT INTO `master_pegawai` VALUES ('2838', 'M344', 'VIKHA TRI VICIKA');
INSERT INTO `master_pegawai` VALUES ('2839', 'M345', 'WARMIN');
INSERT INTO `master_pegawai` VALUES ('2840', 'M346', 'AHMAD FAUJI');
INSERT INTO `master_pegawai` VALUES ('2841', 'M347', 'AJIS HERMAWAN');
INSERT INTO `master_pegawai` VALUES ('2842', 'M348', 'ALDI SEPTIAN');
INSERT INTO `master_pegawai` VALUES ('2843', 'M349', 'ARI ANGGARA');
INSERT INTO `master_pegawai` VALUES ('2844', 'M351', 'BAGUS PRIYADI NUR HIDAYAT');
INSERT INTO `master_pegawai` VALUES ('2845', 'M352', 'DEWI ALIA');
INSERT INTO `master_pegawai` VALUES ('2846', 'M353', 'FARHAN FAHREZI');
INSERT INTO `master_pegawai` VALUES ('2847', 'M354', 'FAUZI NOPYANA');
INSERT INTO `master_pegawai` VALUES ('2848', 'M355', 'FERHAN MIANGGA');
INSERT INTO `master_pegawai` VALUES ('2849', 'M356', 'ICAN WAHYUDIN');
INSERT INTO `master_pegawai` VALUES ('2850', 'M357', 'IKBAL MAULANA');
INSERT INTO `master_pegawai` VALUES ('2851', 'M358', 'IRNA SUCI NURRAHMAH');
INSERT INTO `master_pegawai` VALUES ('2852', 'M359', 'KIKI KURNIA');
INSERT INTO `master_pegawai` VALUES ('2853', 'M360', 'MARDANI');
INSERT INTO `master_pegawai` VALUES ('2854', 'M361', 'MAYA MEILANI');
INSERT INTO `master_pegawai` VALUES ('2855', 'M362', 'MUHAMAD FIKRI NUR FADILAH M.');
INSERT INTO `master_pegawai` VALUES ('2856', 'M363', 'MUHAMMAD ZAKI ZAHRAN');
INSERT INTO `master_pegawai` VALUES ('2857', 'M364', 'NIKO ALDIANTO TAFAREL');
INSERT INTO `master_pegawai` VALUES ('2858', 'M367', 'RIKI RENALDO');
INSERT INTO `master_pegawai` VALUES ('2859', 'M368', 'RIKO PERDIAN');
INSERT INTO `master_pegawai` VALUES ('2860', 'M369', 'RIVAL SEPTIAN');
INSERT INTO `master_pegawai` VALUES ('2861', 'M370', 'RIZKY ALFIANSYAH');
INSERT INTO `master_pegawai` VALUES ('2862', 'M373', 'SAHRUL MULADI');
INSERT INTO `master_pegawai` VALUES ('2863', 'M374', 'UJANG KARIM');
INSERT INTO `master_pegawai` VALUES ('2864', 'M375', 'WAHYU ALAMSYAH');
INSERT INTO `master_pegawai` VALUES ('2865', 'M376', 'ZULKIFLI ZULYADIN');
INSERT INTO `master_pegawai` VALUES ('2866', 'M377', 'ILHAM BAKHRI SIAGIAN');

-- ----------------------------
-- Table structure for master_satuanarsip
-- ----------------------------
DROP TABLE IF EXISTS `master_satuanarsip`;
CREATE TABLE `master_satuanarsip` (
  `SatuanId` int(11) NOT NULL AUTO_INCREMENT,
  `SatuanArsip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SatuanId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of master_satuanarsip
-- ----------------------------
INSERT INTO `master_satuanarsip` VALUES ('1', 'Lembar');
INSERT INTO `master_satuanarsip` VALUES ('2', 'Bundel');
INSERT INTO `master_satuanarsip` VALUES ('3', 'Buku');
INSERT INTO `master_satuanarsip` VALUES ('4', 'dummy');

-- ----------------------------
-- Table structure for master_susut
-- ----------------------------
DROP TABLE IF EXISTS `master_susut`;
CREATE TABLE `master_susut` (
  `SusutId` int(11) NOT NULL AUTO_INCREMENT,
  `SusutName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SusutId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of master_susut
-- ----------------------------
INSERT INTO `master_susut` VALUES ('1', 'Musnah');
INSERT INTO `master_susut` VALUES ('2', 'Permanen');

-- ----------------------------
-- Table structure for master_tperkembangan
-- ----------------------------
DROP TABLE IF EXISTS `master_tperkembangan`;
CREATE TABLE `master_tperkembangan` (
  `TPId` int(11) NOT NULL,
  `TPName` varchar(50) DEFAULT NULL,
  `StatusAct` int(2) DEFAULT NULL,
  PRIMARY KEY (`TPId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of master_tperkembangan
-- ----------------------------
INSERT INTO `master_tperkembangan` VALUES ('1', 'Asli', '1');
INSERT INTO `master_tperkembangan` VALUES ('2', 'Kopi', '1');
INSERT INTO `master_tperkembangan` VALUES ('3', 'Asli dan Kopi', '1');

-- ----------------------------
-- Table structure for master_tperkembangan_old
-- ----------------------------
DROP TABLE IF EXISTS `master_tperkembangan_old`;
CREATE TABLE `master_tperkembangan_old` (
  `TPId` int(11) NOT NULL,
  `TPName` varchar(50) NOT NULL,
  `StatusAct` int(2) DEFAULT NULL,
  PRIMARY KEY (`TPId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of master_tperkembangan_old
-- ----------------------------
INSERT INTO `master_tperkembangan_old` VALUES ('1', 'Asli', '0');
INSERT INTO `master_tperkembangan_old` VALUES ('2', 'Kopi', '0');
INSERT INTO `master_tperkembangan_old` VALUES ('3', 'Asli dan Kopi', '0');

-- ----------------------------
-- Table structure for pelaksana_teknis
-- ----------------------------
DROP TABLE IF EXISTS `pelaksana_teknis`;
CREATE TABLE `pelaksana_teknis` (
  `IdPT` int(11) DEFAULT NULL,
  `Nip` varchar(15) DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pelaksana_teknis
-- ----------------------------
INSERT INTO `pelaksana_teknis` VALUES ('1', '6206', 'Endro Jatmiko', '2018-08-08 09:22:34');
INSERT INTO `pelaksana_teknis` VALUES ('2', '6207', 'I Ketut Wiarsana', '2018-08-08 09:22:47');
INSERT INTO `pelaksana_teknis` VALUES ('3', '6567', 'Nunung Murjianto', '2018-08-08 09:23:06');
INSERT INTO `pelaksana_teknis` VALUES ('4', '7230', 'Aditya Raharjo', '2018-08-08 09:23:21');
INSERT INTO `pelaksana_teknis` VALUES ('5', '6550', 'Rahman Arifin', '2018-08-08 09:23:39');
INSERT INTO `pelaksana_teknis` VALUES ('6', '5719', 'Irma Dewi', '2018-08-08 09:23:55');
INSERT INTO `pelaksana_teknis` VALUES ('7', '7069', 'Nur Supriyadi', '2018-08-08 09:24:09');
INSERT INTO `pelaksana_teknis` VALUES ('8', '7218', 'Wangi Pradana Pandu Briyan Afgani', '2018-08-08 09:24:29');
INSERT INTO `pelaksana_teknis` VALUES ('9', '7265', 'Istiqomah', '2018-08-08 09:24:38');
INSERT INTO `pelaksana_teknis` VALUES ('10', '7478', 'Ahmad Ghozy Fathdillah', '2018-08-08 09:24:56');
INSERT INTO `pelaksana_teknis` VALUES ('11', '7302', 'Tita Pebrianti', '2018-08-08 09:25:09');
INSERT INTO `pelaksana_teknis` VALUES ('12', '7518', 'Rahmi Madina', '2018-08-08 09:25:24');
INSERT INTO `pelaksana_teknis` VALUES ('13', '7605', 'Septian Nur Fatoni', '2018-08-08 09:25:36');
INSERT INTO `pelaksana_teknis` VALUES ('14', '7606', 'Rizky Kurniawan Pratomo', '2018-08-08 09:26:10');
INSERT INTO `pelaksana_teknis` VALUES ('15', '6757', 'Listi Nuraeni', '2018-08-08 09:26:28');
INSERT INTO `pelaksana_teknis` VALUES ('16', 'F939', 'Lingga Octaviana Putri', '2018-08-08 09:26:52');
INSERT INTO `pelaksana_teknis` VALUES ('17', '6502', 'Tomi Eko Ariyanto', '2018-08-08 09:27:09');
INSERT INTO `pelaksana_teknis` VALUES ('18', '6871', 'Anang Setiawan', '2018-08-08 09:27:23');
INSERT INTO `pelaksana_teknis` VALUES ('19', '7264', 'Rikki Rainaldi', '2018-08-08 09:27:49');
INSERT INTO `pelaksana_teknis` VALUES ('20', '7304', 'Zulkarnain', '2018-08-08 09:28:04');
INSERT INTO `pelaksana_teknis` VALUES ('21', '7483', 'Damar Anggoro', '2018-08-08 09:28:15');
INSERT INTO `pelaksana_teknis` VALUES ('22', '7482', 'Nur Rochman', '2018-08-08 09:28:31');
INSERT INTO `pelaksana_teknis` VALUES ('23', '6653', 'Jaenal Jamaludin', '2018-08-08 09:28:45');
INSERT INTO `pelaksana_teknis` VALUES ('24', '5707', 'Zamrowi', '2018-08-08 09:29:02');
INSERT INTO `pelaksana_teknis` VALUES ('25', 'G400', 'Dian Utami', '2018-08-08 09:29:16');

-- ----------------------------
-- Table structure for peminjaman
-- ----------------------------
DROP TABLE IF EXISTS `peminjaman`;
CREATE TABLE `peminjaman` (
  `PeminjamanId` int(11) NOT NULL,
  `TglPinjam` datetime DEFAULT NULL,
  `Nip` varchar(30) DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `RoleId_From` varchar(255) DEFAULT NULL,
  `RoleId_To` varchar(15) DEFAULT NULL,
  `Uraian` varchar(255) DEFAULT NULL,
  `StatusPinjam` varchar(10) DEFAULT NULL,
  `DateRange1` date DEFAULT NULL,
  `DateRange2` date DEFAULT NULL,
  `ApproveDate` date DEFAULT NULL,
  `ArsipPinjam` varchar(150) DEFAULT NULL,
  `Item` varchar(150) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `Catatan` varchar(255) DEFAULT NULL,
  `Akses` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PeminjamanId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of peminjaman
-- ----------------------------
INSERT INTO `peminjaman` VALUES ('1', '2018-08-09 16:25:17', '5443', 'Sagiman', 'UK.1.2.1.1', 'UK.1.1.3.1', 'sdsds', '1', '2018-08-09', '2018-08-13', '2018-08-09', '1', 'sp|ut', 'm0', '', 'd|');
INSERT INTO `peminjaman` VALUES ('2', '2018-08-13 11:27:52', '3321', 'Test', 'UK.1.1.1.1', 'UK.1.1.3.1', 'safasfasf', '3', '2018-08-13', '2018-08-16', '2018-08-13', '1', 'sp', 'm0', '', 'd|');
INSERT INTO `peminjaman` VALUES ('3', '2018-08-16 10:16:28', '321', 'Auy', 'UK.1.1.3.1', 'UK.1.1.1.1', 'fasfasfas', '1', '2018-08-16', '2018-08-17', '2018-08-16', '2', 'sp|ut', 'm1', '', 'd|');
INSERT INTO `peminjaman` VALUES ('4', '2018-08-16 10:42:46', '554', 'asdasd', 'UK.1.1.1.1', 'UK.1.4.1', 'test', '3', '2018-08-16', '2018-08-16', '2018-08-16', '5', '', 'm4', '', 'd|');
INSERT INTO `peminjaman` VALUES ('5', '2018-08-16 10:44:24', '443', 'asdasdas', 'UK.1.1.1.1', 'UK.1.4.1', 'dd', '1', '2018-08-16', '2018-08-20', '2018-08-16', '5', '', 'm4', '', 'd|');
INSERT INTO `peminjaman` VALUES ('6', '2018-08-16 10:46:11', '2221', 'dasdasd', 'UK.1.1.1.1', 'UK.1.4.1', 'sadsdas', '1', '2018-08-16', '2018-08-19', '2018-08-16', '2', '', 'm3', '', 'd|');
INSERT INTO `peminjaman` VALUES ('7', '2018-08-16 10:49:56', '3343', 'maman', 'UK.1.4.1', 'UK.1.1.1.1', 'rrre', '1', '2018-08-16', '2018-08-18', '2018-08-16', '2', 'sp|ut', 'm1', '', 'd|');
INSERT INTO `peminjaman` VALUES ('8', '2018-08-16 17:48:20', '3342', 'ffrt', 'UK.1.4.1', 'UK.1.1.3.1', 'me', '1', '2018-08-16', '2018-08-23', '2018-08-16', '1', 'sp|ut|st|pl', 'm0', '', 'd|');
INSERT INTO `peminjaman` VALUES ('9', '2018-09-05 19:34:55', '7626', 'Fanny Prasetia, S.si.', 'UK.1.1', 'UK.10.2.1', 'ret', '0', '2018-09-05', '2018-09-07', '0000-00-00', '12|14', ',', 'm2', null, null);

-- ----------------------------
-- Table structure for peminjaman_fisik
-- ----------------------------
DROP TABLE IF EXISTS `peminjaman_fisik`;
CREATE TABLE `peminjaman_fisik` (
  `PeminjamanId` int(11) NOT NULL,
  `TglPinjam` datetime DEFAULT NULL,
  `TglKembali` datetime DEFAULT NULL,
  `Nip` varchar(30) DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Nip_B` varchar(30) DEFAULT NULL,
  `Nama_B` varchar(30) DEFAULT NULL,
  `RoleId` varchar(15) DEFAULT NULL,
  `RoleId_Reg` varchar(15) DEFAULT NULL,
  `ArsipPinjam` varchar(150) DEFAULT NULL,
  `Item` varchar(150) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL,
  `Catatan` varchar(100) DEFAULT NULL,
  `Catatan_B` varchar(100) DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `Operator` varchar(15) DEFAULT NULL,
  `StatusPinjam` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`PeminjamanId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of peminjaman_fisik
-- ----------------------------
INSERT INTO `peminjaman_fisik` VALUES ('1', '2018-08-02 17:31:04', '2018-08-02 21:04:15', '5556', 'Yadi Sudrajat', '5556', 'Yadi Sudrajat', 'UK.1.1.3.1', 'UK.1.4.1', '1|4', '', 'm4', 'makanya', '', 'Upload_Files/F_326442346150154/permohonan/db_backup.png', '11', '0');

-- ----------------------------
-- Table structure for pengembalian_fisik
-- ----------------------------
DROP TABLE IF EXISTS `pengembalian_fisik`;
CREATE TABLE `pengembalian_fisik` (
  `Kembali_Id` int(11) NOT NULL,
  `PeminjamanId` int(11) DEFAULT NULL,
  `ArsipPinjam` varchar(255) DEFAULT NULL,
  `Item` varchar(255) DEFAULT NULL,
  `Keterangan` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Kembali_Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pengembalian_fisik
-- ----------------------------

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `PeopleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(15) DEFAULT NULL,
  `NP` varchar(10) DEFAULT NULL,
  `PeopleName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `PeopleTipe` varchar(20) DEFAULT NULL,
  `PeopleStatus` varchar(2) DEFAULT NULL,
  `Pengguna` varchar(100) DEFAULT NULL,
  `Key1` varchar(25) DEFAULT NULL,
  `Key2` varchar(100) DEFAULT NULL,
  `AksesMenu` varchar(10) DEFAULT NULL,
  `People` varchar(15) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  PRIMARY KEY (`PeopleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of people
-- ----------------------------
INSERT INTO `people` VALUES ('1', 'Root', null, 'Administrator', null, '1', '1', 'admin', '123', '202cb962ac59075b964b07152d234b70', null, null, '2018-04-10 16:53:33');
INSERT INTO `people` VALUES ('2', 'UK.1.1', '7504', 'Ivo Nur Subiwa, A.md.', 'ivo.subiwa@peruri.co.id', '1', '1', '7504', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '1', '2018-08-06 14:03:35');
INSERT INTO `people` VALUES ('3', 'UK.3.1.1', '7626', 'Fanny Prasetia, S.si.', 'fanny.prasetia@peruri.co.id', '2', '1', '7626', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-06 16:59:16');
INSERT INTO `people` VALUES ('4', 'UK.10.2.1.1.1', '7465', 'Deni Apriyandi, A.md.', 'denijagor@gmail.com', '2', '1', '7465', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-06 17:03:22');
INSERT INTO `people` VALUES ('5', 'UK.10.2.1', '7560', 'Hidayat Tullah, S.kom.', 'hidayatullah@peruri.co.id', '2', '1', '7560', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-06 17:24:15');
INSERT INTO `people` VALUES ('6', 'UK.21.1', '6567', 'Nunung Murjianto', 'nunung.murjianto@peruri.co.id', '2', '1', '6567', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-07 09:12:07');
INSERT INTO `people` VALUES ('7', 'UK.21.1', 'f939', 'Lingga Octaviana Putri', 'desainperuri@peruri.co.id', '2', '1', 'f939', 'dibuka939', '2e4835202d0a724499a7fe556a55bf67', null, '2', '2018-08-07 09:19:34');
INSERT INTO `people` VALUES ('8', 'UK.21.1', 'g400', 'Dian  Utami', 'desainperuri@peruri.co.id', '2', '1', 'g400', '123', '202cb962ac59075b964b07152d234b70', null, '2', '2018-08-07 09:20:32');
INSERT INTO `people` VALUES ('9', 'UK.21.1', '6206', 'Endro Jatmiko', 'endro.jatmiko@peruri.co.id', '3', '1', '6206', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-07 09:24:46');
INSERT INTO `people` VALUES ('10', 'UK.21.1', '6502', 'Tomi Eko Ariyanto, A.md', 'tomi.eko@peruri.co.id', '3', '1', '6502', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '1', '2018-08-07 10:05:02');
INSERT INTO `people` VALUES ('11', 'UK.21.1', '6207', 'I Ketut Wiarsana', 'ketut.wiarsana@peruri.co.id', '3', '1', '6207', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-08-07 10:06:08');
INSERT INTO `people` VALUES ('12', 'UK.16.1', 'g337', 'Vincencia Evellyn Priyadi', 'vicencia.evellyn@peruri.co.id', '2', '1', 'g337', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-07 10:35:26');
INSERT INTO `people` VALUES ('13', 'UK.16.1.1', '6826', 'Andhika Kusuma, S.t.', 'andhika.kusuma@peruri.co.id', '3', '1', '6826', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-07 10:37:13');
INSERT INTO `people` VALUES ('14', 'UK.16.1.1', '6224', 'Gunawan, S.kom', 'gunawan@peruri.co.id', '3', '1', '6224', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-07 10:40:56');
INSERT INTO `people` VALUES ('15', 'UK.1.1', '5033', 'Muh Sofyan Ramli, S.pd.', 'msofyanr5033@gmail.com', '3', '1', '5033', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-08 10:02:17');
INSERT INTO `people` VALUES ('16', 'UK.1.1', 'g602', 'Ridwan Adiman Jati', 'ivosubiwa@gmail.com', '2', '1', 'g602', '123456', 'e10adc3949ba59abbe56e057f20f883e', null, '2', '2018-08-08 10:10:08');
INSERT INTO `people` VALUES ('17', 'UK.1.1', 'g540', 'Billy Anjaswara', 'billyperuri@gmail.com', '2', '1', 'g540', 'peruri1234', '512406927b870d78870d0457459ebe9d', null, '2', '2018-08-08 10:11:15');
INSERT INTO `people` VALUES ('18', 'UK.1.1', '6485', 'Dyni D. Tacrip, A.md. Ny.', 'dyni.peruri@gmail.com', '3', '1', '6485', '1234', '81dc9bdb52d04dc20036dbd8313ed055', null, '2', '2018-08-08 15:43:49');
INSERT INTO `people` VALUES ('19', 'UK.21.1', '7302', 'Tita Pebrianti', 'tita.pebrianti@peruri.co.id', '2', '1', '7302', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-09 14:17:04');
INSERT INTO `people` VALUES ('20', 'UK.3.1.1', '6868', 'Fuguh Prastiyo, S.t', 'fuguh.prastiyo@peruri.co.id', '3', '1', '6868', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '1', '2018-08-20 08:55:32');
INSERT INTO `people` VALUES ('21', 'UK.3.1.1', '6204', 'Ahmad Jazuli.se', 'ahmad.jazuli@peruri.co.id', '3', '1', '6204', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '1', '2018-08-20 08:56:38');
INSERT INTO `people` VALUES ('22', 'UK.3.1.1', '6203', 'Puteri Zulieni, St. Ny', 'puteri.zulieni@peruri.co.id', '3', '1', '6203', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '1', '2018-08-20 08:58:21');
INSERT INTO `people` VALUES ('23', 'UK.16.1.1', '6864', 'Arsendi Nugraha', 'arsendi.nugraha@peruri.co.id', '2', '1', '6864', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '1', '2018-08-20 08:59:52');
INSERT INTO `people` VALUES ('24', 'UK.3.1.1', '7473', 'Arie Pratama Yudha, S.t.', 'arie.pratama@peruri.co.id', '3', '1', '7473', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '1', '2018-08-20 09:00:57');
INSERT INTO `people` VALUES ('25', 'UK.1.1', '6123', 'Eva Farida.m S., Sh. Ny', 'epoycantiq@gmail.com', '3', '1', '6123', 'peruri123', '9276ad721507684c00780f22a587c7db', null, '2', '2018-08-28 09:23:14');

-- ----------------------------
-- Table structure for peopleakses
-- ----------------------------
DROP TABLE IF EXISTS `peopleakses`;
CREATE TABLE `peopleakses` (
  `AksesId` int(11) NOT NULL AUTO_INCREMENT,
  `PeopleId` varchar(11) DEFAULT NULL,
  `RoleId` varchar(15) DEFAULT NULL,
  `Menu` varchar(100) DEFAULT NULL,
  `Approve` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`AksesId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of peopleakses
-- ----------------------------
INSERT INTO `peopleakses` VALUES ('1', '2', 'UK.1.1', 'm3', '0');
INSERT INTO `peopleakses` VALUES ('2', '3', 'UK.3.1.1', 'm0', '0');
INSERT INTO `peopleakses` VALUES ('3', '4', 'UK.10.2.1.1.1', 'm2', '0');
INSERT INTO `peopleakses` VALUES ('4', '5', 'UK.1.1.3.1', 'm0', '1');
INSERT INTO `peopleakses` VALUES ('5', '6', 'UK.21.1', 'm1', '1');
INSERT INTO `peopleakses` VALUES ('6', '7', 'UK.21.1', 'm1', '1');
INSERT INTO `peopleakses` VALUES ('7', '8', 'UK.21.1', 'm1', '0');
INSERT INTO `peopleakses` VALUES ('8', '9', 'UK.21.1', 'm1', '1');
INSERT INTO `peopleakses` VALUES ('9', '10', 'UK.21.1', 'm1', '1');
INSERT INTO `peopleakses` VALUES ('10', '11', 'UK.21.1', 'm1#m4', '1');
INSERT INTO `peopleakses` VALUES ('11', '2', 'UK.1.1', 'm3', '0');
INSERT INTO `peopleakses` VALUES ('12', '3', 'UK.3.1.1', 'm0', '0');
INSERT INTO `peopleakses` VALUES ('13', '4', 'UK.10.2.1.1.1', 'm2', '0');
INSERT INTO `peopleakses` VALUES ('14', '5', 'UK.10.2.1', 'm2', '0');
INSERT INTO `peopleakses` VALUES ('15', '6', 'UK.21.1', 'm1', '1');
INSERT INTO `peopleakses` VALUES ('16', '7', 'UK.21.1', 'm1', '1');
INSERT INTO `peopleakses` VALUES ('17', '8', 'UK.21.1', 'm1', '0');
INSERT INTO `peopleakses` VALUES ('18', '9', 'UK.21.1', 'm1', '1');
INSERT INTO `peopleakses` VALUES ('19', '10', 'UK.21.1', 'm1', '1');
INSERT INTO `peopleakses` VALUES ('20', '11', 'UK.21.1', 'm1#m4', '1');
INSERT INTO `peopleakses` VALUES ('21', '12', 'UK.16.1', 'm3', '0');
INSERT INTO `peopleakses` VALUES ('22', '13', 'UK.16.1.1', 'm3', '1');
INSERT INTO `peopleakses` VALUES ('23', '14', 'UK.16.1.1', 'm3', '1');
INSERT INTO `peopleakses` VALUES ('26', '15', 'UK.1.1', 'm3', '1');
INSERT INTO `peopleakses` VALUES ('27', '16', 'UK.1.1', 'm3', '0');
INSERT INTO `peopleakses` VALUES ('28', '17', 'UK.1.1', 'm3', '0');
INSERT INTO `peopleakses` VALUES ('29', '18', 'UK.1.1', 'm3', '1');
INSERT INTO `peopleakses` VALUES ('30', '19', 'UK.21.1', 'm1', '0');
INSERT INTO `peopleakses` VALUES ('31', '20', 'UK.3.1.1', 'm0', '1');
INSERT INTO `peopleakses` VALUES ('32', '21', 'UK.3.1.1', 'm0', '1');
INSERT INTO `peopleakses` VALUES ('33', '22', 'UK.3.1.1', 'm0', '1');
INSERT INTO `peopleakses` VALUES ('34', '23', 'UK.16.1.1', 'm0', '0');
INSERT INTO `peopleakses` VALUES ('35', '24', 'UK.3.1.1', 'm0', '0');
INSERT INTO `peopleakses` VALUES ('36', '25', 'UK.1.1', 'm3', '0');

-- ----------------------------
-- Table structure for peopleakses_old
-- ----------------------------
DROP TABLE IF EXISTS `peopleakses_old`;
CREATE TABLE `peopleakses_old` (
  `AksesId` int(11) NOT NULL AUTO_INCREMENT,
  `PeopleId` varchar(11) DEFAULT NULL,
  `RoleId` varchar(15) DEFAULT NULL,
  `Menu` varchar(100) DEFAULT NULL,
  `Approve` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`AksesId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of peopleakses_old
-- ----------------------------
INSERT INTO `peopleakses_old` VALUES ('1', '2', 'UK.1.1.1.1', 'm1', '0');
INSERT INTO `peopleakses_old` VALUES ('2', '3', 'UK.1.1.1.1', 'm1', '1');
INSERT INTO `peopleakses_old` VALUES ('3', '4', 'UK.1.1.3.1', 'm0', '0');
INSERT INTO `peopleakses_old` VALUES ('4', '5', 'UK.1.1.3.1', 'm0', '1');
INSERT INTO `peopleakses_old` VALUES ('5', '6', 'UK.1.2.1.1', 'm2', '0');
INSERT INTO `peopleakses_old` VALUES ('6', '7', 'UK.1.2.1.1', 'm2', '1');
INSERT INTO `peopleakses_old` VALUES ('7', '8', 'UK.1.3.1.1', 'm3', '0');
INSERT INTO `peopleakses_old` VALUES ('8', '9', 'UK.1.3.1.1', 'm3', '1');
INSERT INTO `peopleakses_old` VALUES ('9', '10', 'UK.1.4.1', 'm3', '1');
INSERT INTO `peopleakses_old` VALUES ('10', '11', 'UK.1.4.1', 'm3#m4', '0');

-- ----------------------------
-- Table structure for people_old
-- ----------------------------
DROP TABLE IF EXISTS `people_old`;
CREATE TABLE `people_old` (
  `PeopleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(15) DEFAULT NULL,
  `NP` varchar(10) DEFAULT NULL,
  `PeopleName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `PeopleTipe` varchar(20) DEFAULT NULL,
  `PeopleStatus` varchar(2) DEFAULT NULL,
  `Pengguna` varchar(100) DEFAULT NULL,
  `Key1` varchar(25) DEFAULT NULL,
  `Key2` varchar(100) DEFAULT NULL,
  `AksesMenu` varchar(10) DEFAULT NULL,
  `People` varchar(15) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  PRIMARY KEY (`PeopleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of people_old
-- ----------------------------
INSERT INTO `people_old` VALUES ('1', 'Root', '', 'Administrator', '', '1', '1', 'admin', '123', '202cb962ac59075b964b07152d234b70', '', '', '2018-04-10 16:53:33');
INSERT INTO `people_old` VALUES ('2', 'UK.1.1.1.1', '1', 'Pengelola 08', '', '2', '1', 'pengelola.08', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-07-30 04:05:29');
INSERT INTO `people_old` VALUES ('3', 'UK.1.1.1.1', '2', 'User 08', '', '3', '1', 'user.08', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-07-30 04:06:14');
INSERT INTO `people_old` VALUES ('4', 'UK.1.1.3.1', '3', 'Pengelola 05', '', '2', '1', 'pengelola.05', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-07-30 04:07:38');
INSERT INTO `people_old` VALUES ('5', 'UK.1.1.3.1', '4', 'User 05', '', '3', '1', 'user.05', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-07-30 04:08:36');
INSERT INTO `people_old` VALUES ('6', 'UK.1.2.1.1', '7', 'Pengelola 03', '', '2', '1', 'pengelola.03', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-07-30 04:11:10');
INSERT INTO `people_old` VALUES ('7', 'UK.1.2.1.1', '8', 'User 03', '', '3', '1', 'user.03', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-07-30 04:12:05');
INSERT INTO `people_old` VALUES ('8', 'UK.1.3.1.1', '10', 'Pengelola 02', '', '2', '1', 'pengelola.02', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-07-30 04:14:23');
INSERT INTO `people_old` VALUES ('9', 'UK.1.3.1.1', '11', 'User 02', '', '3', '1', 'user.02', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-07-30 04:15:36');
INSERT INTO `people_old` VALUES ('10', 'UK.1.4.1', '12', 'User 01', '', '3', '1', 'user.01', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-07-30 04:16:16');
INSERT INTO `people_old` VALUES ('11', 'UK.1.4.1', '12', 'Pengelola 01', '', '2', '1', 'pengelola.01', '123', '202cb962ac59075b964b07152d234b70', null, '1', '2018-07-30 04:17:07');

-- ----------------------------
-- Table structure for record_center
-- ----------------------------
DROP TABLE IF EXISTS `record_center`;
CREATE TABLE `record_center` (
  `RCId` int(11) NOT NULL AUTO_INCREMENT,
  `Room` varchar(100) DEFAULT NULL,
  `Filling` varchar(100) DEFAULT NULL,
  `Boks` varchar(100) DEFAULT NULL,
  `Ket` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RCId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of record_center
-- ----------------------------

-- ----------------------------
-- Table structure for regarsipvital
-- ----------------------------
DROP TABLE IF EXISTS `regarsipvital`;
CREATE TABLE `regarsipvital` (
  `RegVitalId` int(11) NOT NULL AUTO_INCREMENT,
  `KodeReg` varchar(15) DEFAULT NULL,
  `JProdukId` int(11) DEFAULT NULL,
  `KatProdukId` int(11) DEFAULT NULL,
  `DetailProdukId` int(11) DEFAULT NULL,
  `ClId` int(11) DEFAULT NULL,
  `RoleId` varchar(20) DEFAULT NULL,
  `TPId` int(11) DEFAULT NULL,
  `MediaId` int(11) DEFAULT NULL,
  `KondisiId` int(11) DEFAULT NULL,
  `Uraian` varchar(255) DEFAULT NULL,
  `Tahun` varchar(4) DEFAULT NULL,
  `Jumlah` int(5) DEFAULT NULL,
  `SatuanId` int(11) DEFAULT NULL,
  `KodeId` int(11) DEFAULT NULL,
  `Dept` varchar(10) DEFAULT NULL,
  `Gedung` varchar(20) DEFAULT NULL,
  `Lemari` varchar(20) DEFAULT NULL,
  `Baris` varchar(20) DEFAULT NULL,
  `Boks` varchar(20) DEFAULT NULL,
  `Tgl_Reg` datetime DEFAULT NULL,
  `Operator` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`RegVitalId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of regarsipvital
-- ----------------------------
INSERT INTO `regarsipvital` VALUES ('4', 'dalitas-16164', '35', '19', '57', '0', 'UK.3.1.1', '1', '1', '1', 'Produk Kertas Bermaterai', '1990', '0', '0', '0', 'dalitas', null, null, null, null, '2018-09-04 23:33:27', '3');
INSERT INTO `regarsipvital` VALUES ('5', 'sainprof-32414', '51', '22', '64', '0', 'UK.21.1', '1', '1', '1', 'Percobaan', '1980', null, null, '13', 'proof', null, null, null, null, '2018-09-05 00:15:54', '6');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `RoleId` varchar(20) NOT NULL,
  `RoleParentId` varchar(15) DEFAULT NULL,
  `GroupId` varchar(11) DEFAULT NULL,
  `KodeUnit` varchar(15) DEFAULT NULL,
  `RoleName` varchar(100) DEFAULT NULL,
  `Deskripsi` varchar(255) DEFAULT NULL,
  `CodeRole` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RoleId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('Root', '', '1', '', 'Administrator', '', 'F_Administrator');
INSERT INTO `role` VALUES ('UK', 'Root', '1', '0000', 'Unit Kearsipan', '', 'F_GeneralTemp');
INSERT INTO `role` VALUES ('UK.1', 'UK', '2', '10000', 'Direktur Utama', '', 'F_694686824873424');
INSERT INTO `role` VALUES ('UK.1.1', 'UK.1.11', '4', '55100', 'Biro Kesekretariatan dan Protokol', '', 'F_634994722420448');
INSERT INTO `role` VALUES ('UK.1.11', 'UK.1', '7', '55000', 'Sekretaris Perusahaan dan Perencanaan Strategi', '', 'F_235463422968233');
INSERT INTO `role` VALUES ('UK.1.11.2', 'UK.1.11', '5', '55300', 'Biro Legal, Regulatory Management and Compliance', '', 'F_622426312444444');
INSERT INTO `role` VALUES ('UK.1.11.3', 'UK.1.11', '5', '55500', 'Biro Komunikasi Perusahaan', '', 'F_413636426435324');
INSERT INTO `role` VALUES ('UK.1.13', 'UK.1', '7', '56000', 'Risk Management', '', 'F_338435524461334');
INSERT INTO `role` VALUES ('UK.1.13.1', 'UK.1.13', '5', '56600', 'Biro Risk Management', '', 'F_642343524274429');
INSERT INTO `role` VALUES ('UK.1.13.2', 'UK.1.13', '5', '56300', 'Biro Corporate Policy', '', 'F_823244342847442');
INSERT INTO `role` VALUES ('UK.1.16', 'UK.1', '7', '53000', 'Satuan Pengawasan Internal', '', 'F_323542396233249');
INSERT INTO `role` VALUES ('UK.1.16.1', 'UK.1.16', '5', '53100', 'Biro Audit Keuangan dan Fraud', '', 'F_344213493114353');
INSERT INTO `role` VALUES ('UK.1.16.2', 'UK.1.16', '5', '53200', 'Biro Audit Operasional dan Teknologi Informasi ', '', 'F_240132132182733');
INSERT INTO `role` VALUES ('UK.1.16.3', 'UK.1.16', '5', '53300', 'Biro Kebijakan dan Perencanaan Audit', '', 'F_020822512040243');
INSERT INTO `role` VALUES ('UK.10', 'UK', '3', '80000', 'Direktur SDM DAN UMUM ', '', 'F_753243136316444');
INSERT INTO `role` VALUES ('UK.10.1', 'UK.10', '7', '81000', 'Divisi Pengadaan dan Fasilitas Umum', '', 'F_336732464454444');
INSERT INTO `role` VALUES ('UK.10.2', 'UK.10', '7', '82000', 'Divisi Sumber Daya Manusia', '', 'F_346645443738147');
INSERT INTO `role` VALUES ('UK.10.2.1', 'UK.10.2', '5', '82200', 'Departemen Operasional SDM', '', 'F_533342333362351');
INSERT INTO `role` VALUES ('UK.10.2.1.1', 'UK.10.2.1', '8', '82220', 'Seksi Remunerasi dan HRIS', '', 'F_632425244242910');
INSERT INTO `role` VALUES ('UK.10.2.1.1.1', 'UK.10.2.1.1', '9', '82222', 'Unit HRIS', '', 'F_417364544434314');
INSERT INTO `role` VALUES ('UK.10.3', 'UK.10', '7', '83000', 'Divisi Pengamanan Perusahaan', '', 'F_242623442228471');
INSERT INTO `role` VALUES ('UK.10.4', 'UK.10', '7', '84000', 'Pusat Pendidikan, Penelitian dan Pengembangan', '', 'F_423202122420031');
INSERT INTO `role` VALUES ('UK.16', 'UK', '3', '90000', 'Direktur Keuangan', '', 'F_454326324249672');
INSERT INTO `role` VALUES ('UK.16.1', 'UK.16', '7', '93000', 'Divisi Teknologi Informasi', '', 'F_614247134400342');
INSERT INTO `role` VALUES ('UK.16.1.1', 'UK.16.1', '5', '93400', 'Departemen Pengembangan dan Pengendalian Kualitas Teknologi Informasi', '', 'F_626665126340334');
INSERT INTO `role` VALUES ('UK.16.1.2', 'UK.16.1', '5', '93100', 'Departemen Operasional Teknologi Informasi', '', 'F_256433392475245');
INSERT INTO `role` VALUES ('UK.16.3', 'UK.16', '7', '91000', 'Divisi Keuangan dan Akuntansi', '', 'F_314445625421633');
INSERT INTO `role` VALUES ('UK.16.5', 'UK.16', '5', '92100', 'Departemen Pengelolaan Aset', '', 'F_574033142256460');
INSERT INTO `role` VALUES ('UK.16.6', 'UK.16', '5', '90200', 'Program Kemitraan dan Bina Lingkungan', '', 'F_351347722220641');
INSERT INTO `role` VALUES ('UK.16.7', 'UK.16', '5', '81110', 'Departemen Pengelolaan Investasi ', '', 'F_644426542406446');
INSERT INTO `role` VALUES ('UK.21', 'UK', '3', '60000', 'Direktur Pengembangan Usaha', '', 'F_295537463545421');
INSERT INTO `role` VALUES ('UK.21.1', 'UK.21.2', '5', '62400', 'Departemen Desain dan Proof', '', 'F_372634455240635');
INSERT INTO `role` VALUES ('UK.21.2', 'UK.21', '7', '62000', 'Divisi Pengembangan Produk dan Desain', '', 'F_356264402406303');
INSERT INTO `role` VALUES ('UK.21.2.2', 'UK.21.2', '5', '62200', 'Departemen Pengembangan Produk dan Manajemen Sistem Informasi Produk', '', 'F_345444452942434');
INSERT INTO `role` VALUES ('UK.21.4', 'UK.21', '7', '65000', 'Strategic Business Unit (SBU) Digital Security', '', 'F_643445643224536');
INSERT INTO `role` VALUES ('UK.21.5', 'UK.21', '7', '77000', 'Proyek Bisnis High Security Paper', '', 'F_615325545124536');
INSERT INTO `role` VALUES ('UK.3', 'UK', '3', '70000', 'Direktur Operasi', 'Direktur Operasi', 'F_826343344122258');
INSERT INTO `role` VALUES ('UK.3.1', 'UK.3', '7', '73000', 'Divisi Teknik dan Jaminan Keandalan', '', 'F_543240642636153');
INSERT INTO `role` VALUES ('UK.3.1.1', 'UK.3.1', '5', '73200', 'Departemen Pengendalian Kualitas', '', 'F_363362460623632');
INSERT INTO `role` VALUES ('UK.3.3', 'UK.3', '7', '71000', 'Strategic Business Unit Uang RI', '', 'F_467464857435406');
INSERT INTO `role` VALUES ('UK.3.3.1', 'UK.3.3', '5', '71100', 'Departemen Persiapan Cetak Uang RI', '', 'F_356333430304442');
INSERT INTO `role` VALUES ('UK.3.3.2', 'UK.3.3', '5', '71200', 'Departemen Cetak Uang Kertas', '', 'F_423636173737436');
INSERT INTO `role` VALUES ('UK.3.3.3', 'UK.3.3', '5', '71300', 'Departemen Khazanah dan Verifikasi Uang Kertas', '', 'F_433596644454364');
INSERT INTO `role` VALUES ('UK.3.7', 'UK.3', '7', '71000', 'Strategic Business Unit (SBU) Uang RI', '', 'F_226461226225445');
INSERT INTO `role` VALUES ('UK.3.8', 'UK.3', '7', '75000', 'Strategic Business Unit (SBU) PP 32 Non Uang RI ', '', 'F_392613442434683');
INSERT INTO `role` VALUES ('UK.3.9', 'UK.3', '7', '67000', 'Koordinator Hubungan Antar Lembaga ', '', 'F_332226246064241');

-- ----------------------------
-- Table structure for role_klasifikasi
-- ----------------------------
DROP TABLE IF EXISTS `role_klasifikasi`;
CREATE TABLE `role_klasifikasi` (
  `ClId` int(11) NOT NULL,
  `RoleId` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of role_klasifikasi
-- ----------------------------
INSERT INTO `role_klasifikasi` VALUES ('2', 'UK.1');
INSERT INTO `role_klasifikasi` VALUES ('2', 'UK.1.1.1');
INSERT INTO `role_klasifikasi` VALUES ('2', 'UK.1.1.3');
INSERT INTO `role_klasifikasi` VALUES ('2', 'UK.1.2.1');
INSERT INTO `role_klasifikasi` VALUES ('2', 'UK.1.3.1');
INSERT INTO `role_klasifikasi` VALUES ('2', 'UK.1.4');
INSERT INTO `role_klasifikasi` VALUES ('3', 'UK.1');
INSERT INTO `role_klasifikasi` VALUES ('3', 'UK.1');
INSERT INTO `role_klasifikasi` VALUES ('4', 'UK.1');
INSERT INTO `role_klasifikasi` VALUES ('6', 'UK.1.1');
INSERT INTO `role_klasifikasi` VALUES ('5', 'UK.10.2.1');
INSERT INTO `role_klasifikasi` VALUES ('7', 'UK.1.1');
INSERT INTO `role_klasifikasi` VALUES ('8', 'UK.1.1');
INSERT INTO `role_klasifikasi` VALUES ('9', 'UK.1.1');
INSERT INTO `role_klasifikasi` VALUES ('10', 'UK.1.1');
INSERT INTO `role_klasifikasi` VALUES ('11', 'UK.1.1');
INSERT INTO `role_klasifikasi` VALUES ('12', 'UK.1.1');
INSERT INTO `role_klasifikasi` VALUES ('13', 'UK.1.1');
INSERT INTO `role_klasifikasi` VALUES ('14', 'UK.1.1');

-- ----------------------------
-- Table structure for role_klasifikasi_old
-- ----------------------------
DROP TABLE IF EXISTS `role_klasifikasi_old`;
CREATE TABLE `role_klasifikasi_old` (
  `ClId` int(11) NOT NULL,
  `RoleId` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of role_klasifikasi_old
-- ----------------------------
INSERT INTO `role_klasifikasi_old` VALUES ('5', 'UK.1.2');
INSERT INTO `role_klasifikasi_old` VALUES ('6', 'UK.1');
INSERT INTO `role_klasifikasi_old` VALUES ('2', 'UK.1');
INSERT INTO `role_klasifikasi_old` VALUES ('3', 'UK.1');
INSERT INTO `role_klasifikasi_old` VALUES ('4', 'UK.1');

-- ----------------------------
-- Table structure for role_old
-- ----------------------------
DROP TABLE IF EXISTS `role_old`;
CREATE TABLE `role_old` (
  `RoleId` varchar(15) NOT NULL,
  `RoleParentId` varchar(15) DEFAULT NULL,
  `GroupId` varchar(11) DEFAULT NULL,
  `KodeUnit` varchar(15) DEFAULT NULL,
  `RoleName` varchar(100) DEFAULT NULL,
  `Deskripsi` varchar(255) DEFAULT NULL,
  `CodeRole` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RoleId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of role_old
-- ----------------------------
INSERT INTO `role_old` VALUES ('Root', '', '1', '', 'Administrator', '', 'F_Administrator');
INSERT INTO `role_old` VALUES ('UK', 'Root', '1', '0000', 'Unit Kearsipan', '', 'F_GeneralTemp');
INSERT INTO `role_old` VALUES ('UK.1', 'UK', '2', '5021', 'DIrektur Utama', '', 'F_434132286154222');
INSERT INTO `role_old` VALUES ('UK.1.1', 'UK.1', '3', '6001', 'Direktorat Teknik dan Produksi', '', 'F_343424261514622');
INSERT INTO `role_old` VALUES ('UK.1.1.1', 'UK.1.1', '7', '8', 'Divisi Perencanaan Produksi', '', 'F_142259838295364');
INSERT INTO `role_old` VALUES ('UK.1.1.1.1', 'UK.1.1.1', '5', '1', 'Departemen Desain dan Proof', '', 'F_143152101426549');
INSERT INTO `role_old` VALUES ('UK.1.1.3', 'UK.1.1', '7', '2', 'Divisi Teknik dan Jaminan Keandalan', '', 'F_445433412044142');
INSERT INTO `role_old` VALUES ('UK.1.1.3.1', 'UK.1.1.3', '5', '3', 'Departemen Pengendalian Kualitas', '', 'F_836424442345544');
INSERT INTO `role_old` VALUES ('UK.1.2', 'UK.1', '3', '80000', 'Direktorat SDM dan Umum', '', 'F_552216123343416');
INSERT INTO `role_old` VALUES ('UK.1.2.1', 'UK.1.2', '7', '4', 'Divisi Sumber Daya Manusia', '', 'F_054329158264260');
INSERT INTO `role_old` VALUES ('UK.1.2.1.1', 'UK.1.2.1', '5', '5', 'Departemen Operasional SDM', '', 'F_543514604140365');
INSERT INTO `role_old` VALUES ('UK.1.3', 'UK.1', '3', '90000', 'Direktorat Keuangan', '', 'F_247224424534436');
INSERT INTO `role_old` VALUES ('UK.1.3.1', 'UK.1.3', '7', '6', 'Divisi Teknologi Informasi', '', 'F_425462852722433');
INSERT INTO `role_old` VALUES ('UK.1.3.1.1', 'UK.1.3.1', '5', '10', 'Departemen Operasional Teknologi Informasi', '', 'F_262335114519444');
INSERT INTO `role_old` VALUES ('UK.1.4', 'UK.1', '5', '51000', 'Corporate Secretary and Strategic Planning', '', 'F_522925332365513');
INSERT INTO `role_old` VALUES ('UK.1.4.1', 'UK.1.4', '4', '51100', 'Biro Kesekretariatan dan Protokol', '', 'F_326442346150154');

-- ----------------------------
-- Table structure for template
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
  `IdTemp` int(11) NOT NULL AUTO_INCREMENT,
  `Judul` varchar(255) DEFAULT NULL,
  `Filename` varchar(255) DEFAULT NULL,
  `TglReg` datetime DEFAULT NULL,
  `PeopleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdTemp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of template
-- ----------------------------
INSERT INTO `template` VALUES ('1', 'BA serah terima', 'fileupload/BA SERAH TERIMA.docx', '2018-07-17 11:41:58', '6');
INSERT INTO `template` VALUES ('2', 'SSTB', 'fileupload/PENERIMAAN DOK JAKARTA - KARAWANG.xlsx', '2018-07-17 14:53:10', '13');
INSERT INTO `template` VALUES ('3', 'rrrt', 'fileupload/6.jpg', '2018-07-29 12:03:04', '3');

-- ----------------------------
-- Table structure for tunjuk_silang
-- ----------------------------
DROP TABLE IF EXISTS `tunjuk_silang`;
CREATE TABLE `tunjuk_silang` (
  `TsId` int(11) NOT NULL AUTO_INCREMENT,
  `TJ1` int(11) DEFAULT NULL,
  `TJ2` int(11) DEFAULT NULL,
  `Level` varchar(50) DEFAULT NULL,
  `Ket` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TsId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tunjuk_silang
-- ----------------------------

-- ----------------------------
-- View structure for c_jenis
-- ----------------------------
DROP VIEW IF EXISTS `c_jenis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `c_jenis` AS SELECT
dokumen.JenisId as a,
dokumen_v1.JenisId as b,
dokumen_v2.JenisId as c
FROM
master_jnaskah
LEFT JOIN dokumen ON dokumen.JenisId = master_jnaskah.JenisId
LEFT JOIN dokumen_v1 ON dokumen_v1.JenisId = master_jnaskah.JenisId
LEFT JOIN dokumen_v2 ON dokumen_v2.JenisId = master_jnaskah.JenisId ;

-- ----------------------------
-- View structure for c_jproduk
-- ----------------------------
DROP VIEW IF EXISTS `c_jproduk`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `c_jproduk` AS SELECT
master_detailproduk.JProdukId AS a,
regarsipvital.JProdukId as b
FROM
master_jproduk
LEFT JOIN master_detailproduk ON master_detailproduk.JProdukId = master_jproduk.JProdukId
LEFT JOIN regarsipvital ON regarsipvital.JProdukId = master_jproduk.JProdukId ;

-- ----------------------------
-- View structure for c_katproduk
-- ----------------------------
DROP VIEW IF EXISTS `c_katproduk`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `c_katproduk` AS SELECT
master_jproduk.KatProdukId as a,
master_detailproduk.KatProdukId AS b,
regarsipvital.KatProdukId as c
FROM
master_katproduk
LEFT JOIN master_jproduk ON master_jproduk.KatProdukId = master_katproduk.KatProdukId
LEFT JOIN master_detailproduk ON master_detailproduk.KatProdukId = master_katproduk.KatProdukId
LEFT JOIN regarsipvital ON regarsipvital.KatProdukId = master_katproduk.KatProdukId ;

-- ----------------------------
-- View structure for c_klas
-- ----------------------------
DROP VIEW IF EXISTS `c_klas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `c_klas` AS SELECT
berkas.ClId as a,
berkas_v1.ClId as b,
berkas_v2.ClId as c,
dokumen.ClId as d,
dokumen_v1.ClId as e,
dokumen_v2.ClId as f,
klasifikasi.ClParentId as g
FROM
klasifikasi
LEFT JOIN berkas ON berkas.ClId = klasifikasi.ClId
LEFT JOIN berkas_v1 ON berkas_v1.ClId = klasifikasi.ClId
LEFT JOIN berkas_v2 ON berkas_v2.ClId = klasifikasi.ClId
LEFT JOIN dokumen ON dokumen.ClId = klasifikasi.ClId
LEFT JOIN dokumen_v1 ON dokumen_v1.ClId = klasifikasi.ClId
LEFT JOIN dokumen_v2 ON dokumen_v2.ClId = klasifikasi.ClId ;

-- ----------------------------
-- View structure for c_kondisi
-- ----------------------------
DROP VIEW IF EXISTS `c_kondisi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `c_kondisi` AS SELECT
berkas.KondisId as a,
berkas_v1.KondisId as b,
berkas_v2.KondisId as c,
dokumen.KondisiId as d,
dokumen_v1.KondisiId as e,
dokumen_v2.KondisiId as f
FROM
master_kondisi
LEFT JOIN berkas ON berkas.KondisId = master_kondisi.KondisiId
LEFT JOIN berkas_v1 ON berkas_v1.KondisId = master_kondisi.KondisiId
LEFT JOIN berkas_v2 ON berkas_v2.KondisId = master_kondisi.KondisiId
LEFT JOIN dokumen ON dokumen.KondisiId = master_kondisi.KondisiId
LEFT JOIN dokumen_v1 ON dokumen_v1.KondisiId = master_kondisi.KondisiId
LEFT JOIN dokumen_v2 ON dokumen_v2.KondisiId = master_kondisi.KondisiId ;

-- ----------------------------
-- View structure for c_media
-- ----------------------------
DROP VIEW IF EXISTS `c_media`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `c_media` AS SELECT
berkas.MediaId as a,
berkas_v1.MediaId as b,
berkas_v2.MediaId as c,
dokumen.MediaId as d,
dokumen_v1.MediaId as e,
dokumen_v2.MediaId as f
FROM
master_media
LEFT JOIN berkas ON berkas.MediaId = master_media.MediaId
LEFT JOIN berkas_v1 ON berkas_v1.MediaId = master_media.MediaId
LEFT JOIN berkas_v2 ON berkas_v2.MediaId = master_media.MediaId
LEFT JOIN dokumen ON dokumen.MediaId = master_media.MediaId
LEFT JOIN dokumen_v1 ON dokumen_v1.MediaId = master_media.MediaId
LEFT JOIN dokumen_v2 ON dokumen_v2.MediaId = master_media.MediaId ;

-- ----------------------------
-- View structure for c_satuan
-- ----------------------------
DROP VIEW IF EXISTS `c_satuan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `c_satuan` AS SELECT
dokumen.SatuanId as a,
dokumen_v1.SatuanId as b,
dokumen_v2.SatuanId as c
FROM
master_satuanarsip
LEFT JOIN dokumen ON dokumen.SatuanId = master_satuanarsip.SatuanId
LEFT JOIN dokumen_v1 ON dokumen_v1.SatuanId = master_satuanarsip.SatuanId
LEFT JOIN dokumen_v2 ON dokumen_v2.SatuanId = master_satuanarsip.SatuanId ;

-- ----------------------------
-- View structure for vtbl_role
-- ----------------------------
DROP VIEW IF EXISTS `vtbl_role`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vtbl_role` AS select `role`.`RoleId` AS `RoleId`,`role`.`RoleName` AS `RoleName`,`role`.`Deskripsi` AS `Deskripsi`,`role`.`KodeUnit` AS `KodeUnit`,`groupjabatan`.`GroupName` AS `GroupName` from (`role` join `groupjabatan` on((`groupjabatan`.`GroupId` = `role`.`GroupId`))) ;

-- ----------------------------
-- View structure for v_berkas_aktif
-- ----------------------------
DROP VIEW IF EXISTS `v_berkas_aktif`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_berkas_aktif` AS select `master_tperkembangan`.`TPName` AS `TPName`,`master_media`.`MediaName` AS `MediaName`,`master_kondisi`.`KondisiName` AS `KondisiName`,`berkas`.`Uraian` AS `Uraian`,concat(`klasifikasi`.`ClCode`,'-',`klasifikasi`.`ClName`) AS `KlasBerkas`,concat(`berkas`.`Gedung`,',',`berkas`.`Lemari`,',',`berkas`.`Baris`,',',`berkas`.`Boks`) AS `LokasiSimpan`,concat(`klasifikasi`.`ClCode`,'/',`berkas`.`Nomor`,' - ',`berkas`.`Uraian`) AS `Ur`,`role`.`RoleName` AS `RoleName`,`berkas`.`RetensiInAktif` AS `RetensiInAktif`,`berkas`.`BerkasId` AS `BerkasId`,`berkas`.`Jumlah` AS `Jumlah`,`berkas`.`KodeReg` AS `KodeReg`,`berkas`.`KurunWaktu` AS `KurunWaktu`,`berkas`.`RoleId` AS `RoleId`,`berkas`.`Path` AS `Path`,`berkas`.`Nomor` AS `Nomor`,`berkas`.`TglReg` AS `TglReg` from (`master_kondisi` left join (`master_media` left join (`master_tperkembangan` left join ((`klasifikasi` left join `berkas` on((`klasifikasi`.`ClId` = `berkas`.`ClId`))) join `role` on((`role`.`RoleId` = `berkas`.`RoleId`))) on((`master_tperkembangan`.`TPId` = `berkas`.`TPId`))) on((`master_media`.`MediaId` = `berkas`.`MediaId`))) on((`master_kondisi`.`KondisiId` = `berkas`.`KondisId`))) where (`berkas`.`StatusDok` = 'aktif') ; ;

-- ----------------------------
-- View structure for v_berkas_inaktif
-- ----------------------------
DROP VIEW IF EXISTS `v_berkas_inaktif`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_berkas_inaktif` AS select `master_tperkembangan`.`TPName` AS `TPName`,`master_media`.`MediaName` AS `MediaName`,`master_kondisi`.`KondisiName` AS `KondisiName`,`berkas`.`Uraian` AS `Uraian`,concat(`klasifikasi`.`ClCode`,'-',`klasifikasi`.`ClName`) AS `KlasBerkas`,concat(`berkas`.`Gedung`,',',`berkas`.`Lemari`,',',`berkas`.`Baris`,',',`berkas`.`Boks`) AS `LokasiSimpan`,concat(`klasifikasi`.`ClCode`,'/',`berkas`.`Nomor`,' - ',`berkas`.`Uraian`) AS `Ur`,`berkas`.`BerkasId` AS `BerkasId`,`role`.`RoleName` AS `RoleName`,`berkas`.`RetensiInAktif` AS `RetensiInAktif`,`berkas`.`Jumlah` AS `Jumlah`,`berkas`.`KodeReg` AS `KodeReg`,`berkas`.`KurunWaktu` AS `KurunWaktu`,`berkas`.`RoleId` AS `RoleId`,`berkas`.`Path` AS `Path`,`berkas`.`Nomor` AS `Nomor` from (((((`berkas` join `klasifikasi` on((`klasifikasi`.`ClId` = `berkas`.`ClId`))) join `role` on((`role`.`RoleId` = `berkas`.`RoleId`))) join `master_tperkembangan` on((`master_tperkembangan`.`TPId` = `berkas`.`TPId`))) join `master_media` on((`master_media`.`MediaId` = `berkas`.`MediaId`))) join `master_kondisi` on((`master_kondisi`.`KondisiId` = `berkas`.`KondisId`))) where (`berkas`.`StatusDok` = 'inaktif') ; ;

-- ----------------------------
-- View structure for v_berkas_v1
-- ----------------------------
DROP VIEW IF EXISTS `v_berkas_v1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_berkas_v1` AS select `master_tperkembangan`.`TPName` AS `TPName`,`master_media`.`MediaName` AS `MediaName`,`master_kondisi`.`KondisiName` AS `KondisiName`,`berkas_v1`.`Uraian` AS `Uraian`,concat(`klasifikasi`.`ClCode`,' - ',`klasifikasi`.`ClName`) AS `KlasBerkas`,concat(`berkas_v1`.`Gedung`,',',`berkas_v1`.`Lemari`,',',`berkas_v1`.`Baris`,',',`berkas_v1`.`Boks`) AS `LokasiSimpan`,concat(`berkas_v1`.`Uraian`) AS `Ur`,`berkas_v1`.`BerkasId` AS `BerkasId`,`berkas_v1`.`ParrentBerkasId` AS `ParrentBerkasId`,`role`.`RoleName` AS `RoleName`,`berkas_v1`.`RetensiInAktif` AS `RetensiInAktif`,`berkas_v1`.`Jumlah` AS `Jumlah`,`berkas_v1`.`KodeReg` AS `KodeReg`,`berkas_v1`.`KurunWaktu` AS `KurunWaktu`,`berkas_v1`.`RoleId` AS `RoleId`,`berkas_v1`.`Nip` AS `Nip`,`berkas_v1`.`Nomor` AS `Nomor`,`berkas_v1`.`SubBerkas` AS `SubBerkas`,`berkas_v1`.`Path` AS `Path`,`berkas_v1`.`TglReg` AS `TglReg` from (((((`berkas_v1` join `klasifikasi` on((`klasifikasi`.`ClId` = `berkas_v1`.`ClId`))) join `role` on((`role`.`RoleId` = `berkas_v1`.`RoleId`))) join `master_tperkembangan` on((`master_tperkembangan`.`TPId` = `berkas_v1`.`TPId`))) join `master_media` on((`master_media`.`MediaId` = `berkas_v1`.`MediaId`))) join `master_kondisi` on((`master_kondisi`.`KondisiId` = `berkas_v1`.`KondisId`))) order by `berkas_v1`.`Nomor` ; ;

-- ----------------------------
-- View structure for v_berkas_v2
-- ----------------------------
DROP VIEW IF EXISTS `v_berkas_v2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_berkas_v2` AS select `master_tperkembangan`.`TPName` AS `TPName`,`master_media`.`MediaName` AS `MediaName`,`master_kondisi`.`KondisiName` AS `KondisiName`,`berkas_v2`.`Uraian` AS `Uraian`,concat(`klasifikasi`.`ClCode`,'-',`klasifikasi`.`ClName`) AS `KlasBerkas`,concat(`berkas_v2`.`Gedung`,',',`berkas_v2`.`Lemari`,',',`berkas_v2`.`Baris`,',',`berkas_v2`.`Boks`) AS `LokasiSimpan`,concat(`klasifikasi`.`ClCode`,'/',`berkas_v2`.`Nomor`,'/',`berkas_v2`.`Uraian`) AS `Ur`,`berkas_v2`.`BerkasId` AS `BerkasId`,`role`.`RoleName` AS `RoleName`,`berkas_v2`.`RetensiInAktif` AS `RetensiInAktif`,`berkas_v2`.`Jumlah` AS `Jumlah`,`berkas_v2`.`KodeReg` AS `KodeReg`,`berkas_v2`.`KurunWaktu` AS `KurunWaktu`,`berkas_v2`.`RoleId` AS `RoleId`,`berkas_v2`.`ParrentBerkasId` AS `ParrentBerkasId`,`berkas_v2`.`SubBerkas` AS `SubBerkas`,`berkas_v2`.`Nomor` AS `Nomor`,`berkas_v2`.`TglReg` AS `TglReg` from (((((`berkas_v2` join `klasifikasi` on((`klasifikasi`.`ClId` = `berkas_v2`.`ClId`))) join `role` on((`role`.`RoleId` = `berkas_v2`.`RoleId`))) join `master_tperkembangan` on((`master_tperkembangan`.`TPId` = `berkas_v2`.`TPId`))) join `master_media` on((`master_media`.`MediaId` = `berkas_v2`.`MediaId`))) join `master_kondisi` on((`master_kondisi`.`KondisiId` = `berkas_v2`.`KondisId`))) order by `berkas_v2`.`Nomor` ; ;

-- ----------------------------
-- View structure for v_dokumen
-- ----------------------------
DROP VIEW IF EXISTS `v_dokumen`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_dokumen` AS select `dokumen`.`DokumenId` AS `DokumenId`,`dokumen`.`BerkasId` AS `BerkasId`,`dokumen`.`KodeReg` AS `KodeReg`,`dokumen`.`ClId` AS `ClId`,`dokumen`.`JenisId` AS `JenisId`,date_format(`dokumen`.`Tgl_Dok`,'%d/%m/%Y') AS `Tgl_Dok`,`dokumen`.`Nomor_Dok` AS `Nomor_Dok`,`dokumen`.`Uraian` AS `Uraian`,`dokumen`.`Jumlah` AS `Jumlah`,`dokumen`.`SatuanId` AS `SatuanId`,`dokumen`.`TPId` AS `TPId`,`dokumen`.`MediaId` AS `MediaId`,`dokumen`.`KondisiId` AS `KondisiId`,`dokumen`.`Keterangan` AS `Keterangan`,`dokumen`.`WaktuReg` AS `WaktuReg`,`dokumen`.`Operator` AS `Operator`,concat(`klasifikasi`.`ClCode`,'-',`klasifikasi`.`ClName`) AS `Klas`,`master_satuanarsip`.`SatuanArsip` AS `SatuanArsip`,`master_tperkembangan`.`TPName` AS `TPName`,`master_media`.`MediaName` AS `MediaName`,`master_kondisi`.`KondisiName` AS `KondisiName`,`master_jnaskah`.`JenisNaskah` AS `JenisNaskah` from ((((((`dokumen` join `klasifikasi` on((`klasifikasi`.`ClId` = `dokumen`.`ClId`))) join `master_satuanarsip` on((`master_satuanarsip`.`SatuanId` = `dokumen`.`SatuanId`))) join `master_tperkembangan` on((`master_tperkembangan`.`TPId` = `dokumen`.`TPId`))) join `master_media` on((`master_media`.`MediaId` = `dokumen`.`MediaId`))) join `master_kondisi` on((`master_kondisi`.`KondisiId` = `dokumen`.`KondisiId`))) join `master_jnaskah` on((`master_jnaskah`.`JenisId` = `dokumen`.`JenisId`))) ; ;

-- ----------------------------
-- View structure for v_dokumen_v1
-- ----------------------------
DROP VIEW IF EXISTS `v_dokumen_v1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_dokumen_v1` AS select `dokumen_v1`.`DokumenId` AS `DokumenId`,`dokumen_v1`.`BerkasId` AS `BerkasId`,`dokumen_v1`.`KodeReg` AS `KodeReg`,`dokumen_v1`.`ClId` AS `ClId`,`dokumen_v1`.`JenisId` AS `JenisId`,date_format(`dokumen_v1`.`Tgl_Dok`,'%d/%m/%Y') AS `Tgl_Dok`,`dokumen_v1`.`Nomor_Dok` AS `Nomor_Dok`,`dokumen_v1`.`Uraian` AS `Uraian`,`dokumen_v1`.`Jumlah` AS `Jumlah`,`dokumen_v1`.`SatuanId` AS `SatuanId`,`dokumen_v1`.`TPId` AS `TPId`,`dokumen_v1`.`MediaId` AS `MediaId`,`dokumen_v1`.`KondisiId` AS `KondisiId`,`dokumen_v1`.`Keterangan` AS `Keterangan`,`dokumen_v1`.`WaktuReg` AS `WaktuReg`,`dokumen_v1`.`Operator` AS `Operator`,concat(`klasifikasi`.`ClCode`,'-',`klasifikasi`.`ClName`) AS `Klas`,`master_satuanarsip`.`SatuanArsip` AS `SatuanArsip`,`master_tperkembangan`.`TPName` AS `TPName`,`master_media`.`MediaName` AS `MediaName`,`master_kondisi`.`KondisiName` AS `KondisiName`,`master_jnaskah`.`JenisNaskah` AS `JenisNaskah` from ((((((`dokumen_v1` join `klasifikasi` on((`klasifikasi`.`ClId` = `dokumen_v1`.`ClId`))) join `master_satuanarsip` on((`master_satuanarsip`.`SatuanId` = `dokumen_v1`.`SatuanId`))) join `master_tperkembangan` on((`master_tperkembangan`.`TPId` = `dokumen_v1`.`TPId`))) join `master_media` on((`master_media`.`MediaId` = `dokumen_v1`.`MediaId`))) join `master_kondisi` on((`master_kondisi`.`KondisiId` = `dokumen_v1`.`KondisiId`))) join `master_jnaskah` on((`master_jnaskah`.`JenisId` = `dokumen_v1`.`JenisId`))) ; ;

-- ----------------------------
-- View structure for v_dokumen_v2
-- ----------------------------
DROP VIEW IF EXISTS `v_dokumen_v2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_dokumen_v2` AS select `dokumen_v2`.`DokumenId` AS `DokumenId`,`dokumen_v2`.`BerkasId` AS `BerkasId`,`dokumen_v2`.`KodeReg` AS `KodeReg`,`dokumen_v2`.`ClId` AS `ClId`,`dokumen_v2`.`JenisId` AS `JenisId`,date_format(`dokumen_v2`.`Tgl_Dok`,'%d/%m/%Y') AS `Tgl_Dok`,`dokumen_v2`.`Nomor_Dok` AS `Nomor_Dok`,`dokumen_v2`.`Uraian` AS `Uraian`,`dokumen_v2`.`Jumlah` AS `Jumlah`,`dokumen_v2`.`SatuanId` AS `SatuanId`,`dokumen_v2`.`TPId` AS `TPId`,`dokumen_v2`.`MediaId` AS `MediaId`,`dokumen_v2`.`KondisiId` AS `KondisiId`,`dokumen_v2`.`Keterangan` AS `Keterangan`,`dokumen_v2`.`WaktuReg` AS `WaktuReg`,`dokumen_v2`.`Operator` AS `Operator`,concat(`klasifikasi`.`ClCode`,'-',`klasifikasi`.`ClName`) AS `Klas`,`master_satuanarsip`.`SatuanArsip` AS `SatuanArsip`,`master_tperkembangan`.`TPName` AS `TPName`,`master_media`.`MediaName` AS `MediaName`,`master_kondisi`.`KondisiName` AS `KondisiName`,`master_jnaskah`.`JenisNaskah` AS `JenisNaskah` from ((((((`dokumen_v2` join `klasifikasi` on((`klasifikasi`.`ClId` = `dokumen_v2`.`ClId`))) join `master_satuanarsip` on((`master_satuanarsip`.`SatuanId` = `dokumen_v2`.`SatuanId`))) join `master_tperkembangan` on((`master_tperkembangan`.`TPId` = `dokumen_v2`.`TPId`))) join `master_media` on((`master_media`.`MediaId` = `dokumen_v2`.`MediaId`))) join `master_kondisi` on((`master_kondisi`.`KondisiId` = `dokumen_v2`.`KondisiId`))) join `master_jnaskah` on((`master_jnaskah`.`JenisId` = `dokumen_v2`.`JenisId`))) ; ;

-- ----------------------------
-- View structure for v_logakses
-- ----------------------------
DROP VIEW IF EXISTS `v_logakses`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_logakses` AS select `people`.`PeopleName` AS `PeopleName`,`log_akses`.`LogId` AS `LogId`,`log_akses`.`LogName` AS `LogName`,concat(date_format(`log_akses`.`LogDate`,'%d-%m-%Y'),' ',time_format(`log_akses`.`LogDate`,'%H:%i:%s')) AS `DLog` from (`log_akses` join `people` on((`people`.`PeopleId` = `log_akses`.`PeopleId`))) order by `log_akses`.`LogDate` desc ; ;

-- ----------------------------
-- View structure for v_logdok
-- ----------------------------
DROP VIEW IF EXISTS `v_logdok`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_logdok` AS SELECT
log_archive.LogArchiveId,
log_archive.LogDok,
log_archive.LogDate,
log_archive.RoleId,
log_archive.Kode,
people.PeopleName
FROM
log_archive
INNER JOIN people ON people.PeopleId = log_archive.PeopleId ;

-- ----------------------------
-- View structure for v_login
-- ----------------------------
DROP VIEW IF EXISTS `v_login`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_login` AS select `people`.`PeopleId` AS `PeopleId`,`people`.`RoleId` AS `RoleId`,`people`.`PeopleName` AS `PeopleName`,`people`.`email` AS `email`,`people`.`PeopleTipe` AS `PeopleTipe`,`people`.`PeopleStatus` AS `PeopleStatus`,`people`.`Pengguna` AS `Pengguna`,`people`.`Key1` AS `Key1`,`people`.`Key2` AS `Key2`,`role`.`RoleParentId` AS `RoleParentId`,`role`.`GroupId` AS `GroupId`,`role`.`RoleName` AS `RoleName`,`role`.`Deskripsi` AS `Deskripsi`,`role`.`CodeRole` AS `CodeRole`,`peopleakses`.`Approve` AS `Approve`,`peopleakses`.`Menu` AS `Menu` from ((`people` join `role` on((`role`.`RoleId` = `people`.`RoleId`))) left join `peopleakses` on((`peopleakses`.`PeopleId` = `people`.`PeopleId`))) ; ;

-- ----------------------------
-- View structure for v_metaproof
-- ----------------------------
DROP VIEW IF EXISTS `v_metaproof`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_metaproof` AS select `detailvitalmeta_proof`.`DetailProfId` AS `DetailProfId`,`detailvitalmeta_proof`.`RegVitalId` AS `RegVitalId`,`detailvitalmeta_proof`.`Perihal` AS `Perihal`,`detailvitalmeta_proof`.`Dasar` AS `Dasar`,`detailvitalmeta_proof`.`Tgl_Nodin` AS `Tgl_Nodin`,`detailvitalmeta_proof`.`IdPelaksana` AS `IdPelaksana`,`detailvitalmeta_proof`.`Tgl_Desain` AS `Tgl_Desain`,`detailvitalmeta_proof`.`Tgl_Proof` AS `Tgl_Proof`,`detailvitalmeta_proof`.`Nomor_SPK` AS `Nomor_SPK`,`detailvitalmeta_proof`.`KetPekerjaan` AS `KetPekerjaan`,`detailvitalmeta_proof`.`Nota_Penyerahan` AS `Nota_Penyerahan`,`detailvitalmeta_proof`.`Keterangan` AS `Keterangan`,concat(`detailvitalmeta_proof`.`Tgl_Desain`,'#',`detailvitalmeta_proof`.`Tgl_Proof`) AS `Target`,concat(`detailvitalmeta_proof`.`Gedung`,'.',`detailvitalmeta_proof`.`Lemari`,'.',`detailvitalmeta_proof`.`Baris`,'.',`detailvitalmeta_proof`.`Boks`) AS `Lokasi`,`detailvitalmeta_proof`.`Gedung` AS `Gedung`,`detailvitalmeta_proof`.`Lemari` AS `Lemari`,`detailvitalmeta_proof`.`Baris` AS `Baris`,`detailvitalmeta_proof`.`Boks` AS `Boks` from `detailvitalmeta_proof` ;

-- ----------------------------
-- View structure for v_naskah_vital
-- ----------------------------
DROP VIEW IF EXISTS `v_naskah_vital`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_naskah_vital` AS select `master_detailproduk`.`DetailProdukName` AS `DetailProdukName`,`master_jproduk`.`JProdukName` AS `JProdukName`,`master_katproduk`.`KatProdukName` AS `KatProdukName`,`klasifikasi`.`ClCode` AS `ClCode`,`klasifikasi`.`ClName` AS `ClName`,`role`.`RoleName` AS `RoleName`,`master_tperkembangan`.`TPName` AS `TPName`,`master_media`.`MediaName` AS `MediaName`,`master_kondisi`.`KondisiName` AS `KondisiName`,`regarsipvital`.`Uraian` AS `Uraian`,`regarsipvital`.`Tahun` AS `Tahun`,`regarsipvital`.`RegVitalId` AS `RegVitalId`,concat(`regarsipvital`.`Gedung`,'.',`regarsipvital`.`Lemari`,'.',`regarsipvital`.`Baris`,'.',`regarsipvital`.`Boks`) AS `Lokasi_Simpan`,`regarsipvital`.`KatProdukId` AS `KatProdukId`,`regarsipvital`.`RoleId` AS `RoleId` from ((((((((`regarsipvital` join `master_detailproduk` on((`master_detailproduk`.`DetailProdukId` = `regarsipvital`.`DetailProdukId`))) join `master_jproduk` on((`master_jproduk`.`JProdukId` = `regarsipvital`.`JProdukId`))) join `master_katproduk` on((`master_katproduk`.`KatProdukId` = `regarsipvital`.`KatProdukId`))) left join `klasifikasi` on((`klasifikasi`.`ClId` = `regarsipvital`.`ClId`))) join `role` on((`role`.`RoleId` = `regarsipvital`.`RoleId`))) join `master_tperkembangan` on((`master_tperkembangan`.`TPId` = `regarsipvital`.`TPId`))) join `master_media` on((`master_media`.`MediaId` = `regarsipvital`.`MediaId`))) join `master_kondisi` on((`master_kondisi`.`KondisiId` = `regarsipvital`.`KondisiId`))) where (`regarsipvital`.`Dept` = 'dalitas') ; ;

-- ----------------------------
-- View structure for v_naskah_vital_proof
-- ----------------------------
DROP VIEW IF EXISTS `v_naskah_vital_proof`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_naskah_vital_proof` AS select `master_detailproduk`.`DetailProdukName` AS `DetailProdukName`,`master_jproduk`.`JProdukName` AS `JProdukName`,`master_katproduk`.`KatProdukName` AS `KatProdukName`,`klasifikasi`.`ClCode` AS `ClCode`,`klasifikasi`.`ClName` AS `ClName`,`role`.`RoleName` AS `RoleName`,`master_tperkembangan`.`TPName` AS `TPName`,`master_media`.`MediaName` AS `MediaName`,`master_kondisi`.`KondisiName` AS `KondisiName`,`regarsipvital`.`Uraian` AS `Uraian`,`regarsipvital`.`Tahun` AS `Tahun`,`regarsipvital`.`RegVitalId` AS `RegVitalId`,concat(`regarsipvital`.`Gedung`,'.',`regarsipvital`.`Lemari`,'.',`regarsipvital`.`Baris`,'.',`regarsipvital`.`Boks`) AS `Lokasi_Simpan`,`regarsipvital`.`KatProdukId` AS `KatProdukId`,`regarsipvital`.`RoleId` AS `RoleId`,concat(`master_kodekerja`.`Kode`,' - ',`master_kodekerja`.`Uraian`) AS `Kode`,`regarsipvital`.`Tgl_Reg` AS `Tgl_Reg` from (((((((((`regarsipvital` join `master_detailproduk` on((`master_detailproduk`.`DetailProdukId` = `regarsipvital`.`DetailProdukId`))) join `master_jproduk` on((`master_jproduk`.`JProdukId` = `regarsipvital`.`JProdukId`))) join `master_katproduk` on((`master_katproduk`.`KatProdukId` = `regarsipvital`.`KatProdukId`))) left join `klasifikasi` on((`klasifikasi`.`ClId` = `regarsipvital`.`ClId`))) join `role` on((`role`.`RoleId` = `regarsipvital`.`RoleId`))) join `master_tperkembangan` on((`master_tperkembangan`.`TPId` = `regarsipvital`.`TPId`))) join `master_media` on((`master_media`.`MediaId` = `regarsipvital`.`MediaId`))) join `master_kondisi` on((`master_kondisi`.`KondisiId` = `regarsipvital`.`KondisiId`))) join `master_kodekerja` on((`master_kodekerja`.`KodeId` = `regarsipvital`.`KodeId`))) ; ;

-- ----------------------------
-- View structure for v_peminjaman
-- ----------------------------
DROP VIEW IF EXISTS `v_peminjaman`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_peminjaman` AS SELECT
	`peminjaman`.`PeminjamanId` AS `PeminjamanId`,
	date_format(
		`peminjaman`.`TglPinjam`,
		'%d/%m/%Y %H:%i:%s'
	) AS `TglReg`,
	date_format(
		`peminjaman`.`TglPinjam`,
		'%d/%m/%Y'
	) AS `TglPinjam1`,
  peminjaman.TglPinjam,
	`peminjaman`.`Nip` AS `Nip`,
	`peminjaman`.`Nama` AS `Nama`,
	`peminjaman`.`RoleId_From` AS `RoleId_From`,
	`peminjaman`.`RoleId_To` AS `RoleId_To`,
	`peminjaman`.`Uraian` AS `Uraian`,
	`peminjaman`.`StatusPinjam` AS `StatusPinjam`,
	`peminjaman`.`ApproveDate` AS `ApproveDate`,
	`peminjaman`.`ArsipPinjam` AS `ArsipPinjam`,
	`peminjaman`.`Keterangan` AS `Keterangan`,
	`peminjaman`.`Catatan` AS `Catatan`,
	`peminjaman`.`Item` AS `Item`,
	(
		SELECT
			`role`.`RoleName`
		FROM
			`role`
		WHERE
			(
				`role`.`RoleId` = `peminjaman`.`RoleId_To`
			)
	) AS `Kepada`,
	(
		SELECT
			`role`.`RoleName`
		FROM
			`role`
		WHERE
			(
				`role`.`RoleId` = `peminjaman`.`RoleId_From`
			)
	) AS `Dari`,
	date_format(
		`peminjaman`.`DateRange1`,
		'%d/%m/%Y'
	) AS `Reservation1`,
	date_format(
		`peminjaman`.`DateRange2`,
		'%d/%m/%Y'
	) AS `Reservation2`,
	`peminjaman`.`Akses` AS `Akses`,
	`peminjaman`.`DateRange1` AS `DateRange1`,
	`peminjaman`.`DateRange2` AS `DateRange2`
FROM
	`peminjaman` ;

-- ----------------------------
-- View structure for v_peminjaman_fisik
-- ----------------------------
DROP VIEW IF EXISTS `v_peminjaman_fisik`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_peminjaman_fisik` AS select `peminjaman_fisik`.`PeminjamanId` AS `PeminjamanId`,`peminjaman_fisik`.`TglPinjam` AS `TglReg`,date_format(`peminjaman_fisik`.`TglPinjam`,'%d/%m/%Y') AS `TglPinjam`,date_format(`peminjaman_fisik`.`TglKembali`,'%d/%m/%Y') AS `TglKembali`,`peminjaman_fisik`.`Nip` AS `Nip`,`peminjaman_fisik`.`RoleId` AS `RoleId`,`peminjaman_fisik`.`Nama` AS `Nama`,`peminjaman_fisik`.`RoleId_Reg` AS `RoleId_Reg`,`peminjaman_fisik`.`ArsipPinjam` AS `ArsipPinjam`,`peminjaman_fisik`.`Keterangan` AS `Keterangan`,`peminjaman_fisik`.`Catatan` AS `Catatan`,`peminjaman_fisik`.`Item` AS `Item`,`peminjaman_fisik`.`StatusPinjam` AS `StatusPinjam`,(select `role`.`RoleName` from `role` where (`role`.`RoleId` = `peminjaman_fisik`.`RoleId`)) AS `UnitKerja`,`peminjaman_fisik`.`Filename` AS `Filename`,`peminjaman_fisik`.`Nip_B` AS `Nip_B`,`peminjaman_fisik`.`Nama_B` AS `Nama_B`,`peminjaman_fisik`.`Catatan_B` AS `Catatan_B` from `peminjaman_fisik` ; ;

-- ----------------------------
-- View structure for v_people
-- ----------------------------
DROP VIEW IF EXISTS `v_people`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_people` AS select `people`.`PeopleId` AS `PeopleId`,`role`.`RoleName` AS `RoleName`,`people`.`PeopleName` AS `PeopleName`,`people`.`email` AS `email`,`people`.`PeopleTipe` AS `PeopleTipe`,if((`people`.`PeopleStatus` = 1),'Aktif','Tidak Aktif') AS `StatusP`,`people`.`Pengguna` AS `Pengguna` from (`people` join `role` on((`role`.`RoleId` = `people`.`RoleId`))) ; ;
