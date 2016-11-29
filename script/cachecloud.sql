﻿-- MySQL dump 10.13  Distrib 5.5.16, for Linux (x86_64)
--
-- Host: 10.10.19.167    Database: cache-cloud
-- ------------------------------------------------------
-- Server version	5.5.34-32.0-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

CREATE DATABASE IF NOT EXISTS `cache-cloud` DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

use `cache-cloud`;

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Trigger 作为 Blob 类型存储(用于 Quartz 用户用 JDBC 创建他们自己定制的 Trigger 类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL COMMENT 'scheduler名称',
  `CALENDAR_NAME` varchar(200) NOT NULL COMMENT 'calendar名称',
  `CALENDAR` blob NOT NULL COMMENT 'calendar信息',
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='以 Blob 类型存储 Quartz 的 Calendar 信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL COMMENT 'scheduler名称',
  `TRIGGER_NAME` varchar(200) NOT NULL COMMENT 'trigger名',
  `TRIGGER_GROUP` varchar(200) NOT NULL COMMENT 'trigger组',
  `CRON_EXPRESSION` varchar(120) NOT NULL COMMENT 'cron表达式',
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储 Cron Trigger，包括 Cron 表达式和时区信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL COMMENT '是否非并行执行',
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL COMMENT '是否持久化',
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储已触发的 Trigger相关的状态信息，以及关联 Job 的执行信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL COMMENT '是否持久化，0不持久化，1持久化',
  `IS_NONCONCURRENT` varchar(1) NOT NULL COMMENT '是否非并发，0非并发，1并发',
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL COMMENT '是否可恢复，0不恢复，1恢复',
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储每一个已配置的 Job 的详细信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储程序的悲观锁的信息(假如使用了悲观锁)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储已暂停的 Trigger 组的信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL COMMENT '执行quartz实例的主机名',
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL COMMENT '实例将状态报告给集群中的其它实例的上一次时间',
  `CHECKIN_INTERVAL` bigint(13) NOT NULL COMMENT '实例间状态报告的时间频率',
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储少量的有关 Scheduler 的状态信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL COMMENT '重复次数',
  `REPEAT_INTERVAL` bigint(12) NOT NULL COMMENT '重复间隔',
  `TIMES_TRIGGERED` bigint(10) NOT NULL COMMENT '已出发次数',
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储简单的 Trigger，包括重复次数，间隔，以及已触的次数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储已配置的 Trigger 的信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_audit`
--

DROP TABLE IF EXISTS `app_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `user_id` bigint(20) NOT NULL COMMENT '申请人的id',
  `user_name` varchar(64) NOT NULL COMMENT '用户名',
  `type` tinyint(4) NOT NULL COMMENT '申请类型:0:申请应用,1:应用扩容,2:修改配置',
  `param1` varchar(600) DEFAULT NULL COMMENT '预留参数1',
  `param2` varchar(600) DEFAULT NULL COMMENT '预留参数2',
  `param3` varchar(600) DEFAULT NULL COMMENT '预留参数3',
  `info` varchar(360) NOT NULL COMMENT '申请描述',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:等待审批; 1:审批通过; -1:驳回',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `refuse_reason` varchar(360) DEFAULT NULL COMMENT '驳回理由',
  PRIMARY KEY (`id`),
  KEY `idx_appid` (`app_id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_status_create_time` (`status`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用审核表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_audit_log`
--

DROP TABLE IF EXISTS `app_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_audit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `user_id` bigint(20) NOT NULL COMMENT '审批操作人id',
  `info` longtext NOT NULL COMMENT 'app审批的详细信息',
  `type` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `app_audit_id` bigint(20) NOT NULL COMMENT '审批id',
  PRIMARY KEY (`id`),
  KEY `idx_audit_appid` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app审核日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_client_costtime_minute_stat`
--

DROP TABLE IF EXISTS `app_client_costtime_minute_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_client_costtime_minute_stat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `collect_time` bigint(20) NOT NULL COMMENT '统计时间:格式yyyyMMddHHmm00',
  `client_ip` varchar(20) NOT NULL COMMENT '客户端ip',
  `report_time` datetime NOT NULL COMMENT '客户端上报时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `command` varchar(20) NOT NULL COMMENT '命令',
  `mean` double NOT NULL COMMENT '耗时平均值',
  `median` int(11) NOT NULL COMMENT '耗时中值',
  `ninety_percent_max` int(11) NOT NULL COMMENT '耗时90%最大值',
  `ninety_nine_percent_max` int(11) NOT NULL COMMENT '耗时99%最大值',
  `hundred_max` int(11) NOT NULL COMMENT '耗时最大值',
  `count` int(11) NOT NULL COMMENT '调用次数',
  `instance_host` varchar(20) DEFAULT NULL COMMENT '客户端上报实例ip',
  `instance_port` int(11) DEFAULT NULL COMMENT '客户端上报实例port',
  `instance_id` bigint(20) DEFAULT NULL COMMENT '实例id',
  PRIMARY KEY (`id`),
  KEY `idx_appid_collecttime` (`app_id`,`collect_time`),
  KEY `idx_collect_time` (`collect_time`),
  KEY `idx_group` (`app_id`,`instance_id`,`client_ip`,`collect_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端每分钟耗时上报数据统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_client_costtime_minute_stat_total`
--

DROP TABLE IF EXISTS `app_client_costtime_minute_stat_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_client_costtime_minute_stat_total` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `collect_time` bigint(20) NOT NULL COMMENT '统计时间:格式yyyyMMddHHmm00',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `command` varchar(20) NOT NULL COMMENT '命令',
  `mean` double NOT NULL COMMENT '耗时平均值',
  `median` int(11) NOT NULL COMMENT '耗时中值',
  `ninety_percent_max` int(11) NOT NULL COMMENT '耗时90%最大值',
  `ninety_nine_percent_max` int(11) NOT NULL COMMENT '耗时99%最大值',
  `hundred_max` int(11) NOT NULL COMMENT '耗时最大值',
  `total_cost` double NOT NULL COMMENT '总耗时',
  `total_count` int(11) NOT NULL COMMENT '调用次数',
  `max_instance_host` varchar(20) DEFAULT NULL COMMENT '客户端上报最大耗时对应的实例ip',
  `max_instance_port` int(11) DEFAULT NULL COMMENT '客户端上报最大耗时对应的实例port',
  `max_instance_id` bigint(20) DEFAULT NULL COMMENT '最大耗时对应的实例id',
  `max_client_ip` varchar(20) NOT NULL COMMENT '最大耗时对应的客户端ip',
  `accumulation` int(10) NOT NULL DEFAULT '0' COMMENT '参与累加实例数和客户端数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`,`command`,`collect_time`),
  KEY `idx_appid_collecttime` (`app_id`,`collect_time`),
  KEY `idx_collect_time` (`collect_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用全局耗时统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_client_datasize_minute_stat`
--

DROP TABLE IF EXISTS `app_client_datasize_minute_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_client_datasize_minute_stat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `collect_time` bigint(20) NOT NULL COMMENT '统计时间:格式yyyyMMddHHmm00',
  `client_ip` varchar(20) NOT NULL COMMENT '客户端ip',
  `report_time` datetime NOT NULL COMMENT '客户端上报时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `cost_map_size` varchar(20) NOT NULL COMMENT '耗时map尺寸',
  `value_map_size` double NOT NULL COMMENT '值map尺寸',
  `exception_map_size` int(11) NOT NULL COMMENT '异常map尺寸',
  `collect_map_size` int(11) NOT NULL COMMENT '耗时map尺寸',
  PRIMARY KEY (`id`),
  KEY `idx_client_ip` (`client_ip`),
  KEY `idx_collect_time_client_ip` (`collect_time`,`client_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端每分钟耗时上报收集数据的map尺寸';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_client_exception_minute_stat`
--

DROP TABLE IF EXISTS `app_client_exception_minute_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_client_exception_minute_stat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `collect_time` bigint(20) NOT NULL COMMENT '统计时间:格式yyyyMMddHHmm00',
  `client_ip` varchar(20) NOT NULL COMMENT '客户端ip',
  `report_time` datetime NOT NULL COMMENT '客户端上报时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `exception_class` varchar(255) NOT NULL COMMENT '异常类',
  `exception_count` varchar(255) NOT NULL COMMENT '异常个数',
  `instance_host` varchar(20) DEFAULT NULL COMMENT '实例ip',
  `instance_port` int(11) DEFAULT NULL COMMENT '实例port',
  `instance_id` bigint(20) DEFAULT NULL COMMENT '实例id',
  `type` tinyint(4) DEFAULT '1' COMMENT '异常类型:1是jedis异常,2是客户端异常',
  PRIMARY KEY (`id`),
  KEY `idx_appid_collecttime` (`app_id`,`collect_time`),
  KEY `idx_collect_time` (`collect_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端每分钟异常上报数据统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_client_value_distri_minute_stat`
--

DROP TABLE IF EXISTS `app_client_value_distri_minute_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_client_value_distri_minute_stat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `collect_time` bigint(20) NOT NULL COMMENT '统计时间:格式yyyyMMddHHmm00',
  `client_ip` varchar(20) NOT NULL COMMENT '客户端ip',
  `report_time` datetime NOT NULL COMMENT '客户端上报时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `command` varchar(20) NOT NULL COMMENT '命令',
  `distribute_value` varchar(20) NOT NULL COMMENT '值分布',
  `distribute_type` tinyint(4) NOT NULL COMMENT '值分布类型',
  `count` int(11) NOT NULL COMMENT '调用次数',
  `instance_host` varchar(20) DEFAULT NULL COMMENT '实例ip',
  `instance_port` int(11) DEFAULT NULL COMMENT '实例port',
  `instance_id` bigint(20) DEFAULT NULL COMMENT '实例id',
  PRIMARY KEY (`id`),
  KEY `idx_appid_collecttime` (`app_id`,`collect_time`),
  KEY `idx_collect_time` (`collect_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端每分钟值分布上报数据统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_client_version_statistic`
--

DROP TABLE IF EXISTS `app_client_version_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_client_version_statistic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `client_ip` varchar(20) NOT NULL COMMENT '客户端ip地址',
  `client_version` varchar(20) NOT NULL COMMENT '客户端版本',
  `report_time` datetime DEFAULT NULL COMMENT '上报时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_client_ip` (`app_id`,`client_ip`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端上报版本信息统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_desc`
--

DROP TABLE IF EXISTS `app_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_desc` (
  `app_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '应用id',
  `name` varchar(36) NOT NULL COMMENT '应用名',
  `user_id` bigint(20) NOT NULL COMMENT '申请人id',
  `status` tinyint(4) NOT NULL COMMENT '应用状态, 0未分配，1申请未审批，2审批并发布 3:应用下线',
  `intro` varchar(255) NOT NULL COMMENT '应用描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `passed_time` datetime NOT NULL COMMENT '审批通过时间',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT 'cache类型，2. redis-cluster,5. redis-sentinel ,6.redis-standalone ',
  `officer` varchar(20) NOT NULL COMMENT '负责人，中文',
  `ver_id` int(11) NOT NULL COMMENT '版本',
  `is_test` tinyint(4) DEFAULT '0' COMMENT '是否测试：1是0否',
  `need_persistence` tinyint(4) DEFAULT '1' COMMENT '是否需要持久化: 1是0否',
  `need_hot_back_up` tinyint(4) DEFAULT '1' COMMENT '是否需要热备: 1是0否',
  `has_back_store` tinyint(4) DEFAULT '1' COMMENT '是否有后端数据源: 1是0否',
  `forecase_qps` int(11) DEFAULT NULL COMMENT '预估qps',
  `forecast_obj_num` int(11) DEFAULT NULL COMMENT '预估条目数',
  `mem_alert_value` int(11) DEFAULT NULL COMMENT '内存报警阀值',
  `client_machine_room` varchar(36) DEFAULT NULL COMMENT '客户端机房信息',
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `uidx_app_name` (`name`),
  UNIQUE KEY `idx_app_uid` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='app应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_hour_command_statistics`
--

DROP TABLE IF EXISTS `app_hour_command_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_hour_command_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `collect_time` bigint(20) NOT NULL COMMENT '统计时间:格式yyyyMMddHH',
  `command_name` varchar(60) NOT NULL COMMENT '命令名称',
  `command_count` bigint(20) NOT NULL COMMENT '命令执行次数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`,`command_name`,`collect_time`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_modify_time` (`modify_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用的每小时命令统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_hour_statistics`
--

DROP TABLE IF EXISTS `app_hour_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_hour_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `collect_time` bigint(20) NOT NULL COMMENT '收集时间:格式yyyyMMddHH',
  `hits` bigint(20) NOT NULL COMMENT '每小时命中数量和',
  `misses` bigint(20) NOT NULL COMMENT '每小时未命中数量和',
  `command_count` bigint(20) DEFAULT '0' COMMENT '命令总数',
  `used_memory` bigint(20) NOT NULL COMMENT '每小时内存占用最大值',
  `expired_keys` bigint(20) NOT NULL COMMENT '每小时过期key数量和',
  `evicted_keys` bigint(20) NOT NULL COMMENT '每小时驱逐key数量和',
  `net_input_byte` bigint(20) DEFAULT '0' COMMENT '网络输入字节',
  `net_output_byte` bigint(20) DEFAULT '0' COMMENT '网络输出字节',
  `connected_clients` int(10) NOT NULL COMMENT '每小时客户端连接数最大值',
  `object_size` bigint(20) NOT NULL COMMENT '每小时存储对象数最大值',
  `accumulation` int(10) NOT NULL DEFAULT '0' COMMENT '每小时参与累加实例数最小值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '每小时修改时间最大值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`,`collect_time`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_modify_time` (`modify_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用统计数据每小时统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_minute_command_statistics`
--

DROP TABLE IF EXISTS `app_minute_command_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_minute_command_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `collect_time` bigint(20) NOT NULL COMMENT '统计时间:格式yyyyMMddHHmm',
  `command_name` varchar(60) NOT NULL COMMENT '命令名称',
  `command_count` bigint(20) NOT NULL COMMENT '命令执行次数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`,`collect_time`,`command_name`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_modify_time` (`modify_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用的每分钟命令统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_minute_statistics`
--

DROP TABLE IF EXISTS `app_minute_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_minute_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `collect_time` bigint(20) NOT NULL COMMENT '收集时间:格式yyyyMMddHHmm',
  `hits` bigint(20) NOT NULL COMMENT '命中数量',
  `misses` bigint(20) NOT NULL COMMENT '未命中数量',
  `command_count` bigint(20) DEFAULT '0' COMMENT '命令总数',
  `used_memory` bigint(20) NOT NULL COMMENT '内存占用',
  `expired_keys` bigint(20) NOT NULL COMMENT '过期key数量',
  `evicted_keys` bigint(20) NOT NULL COMMENT '驱逐key数量',
  `net_input_byte` bigint(20) DEFAULT '0' COMMENT '网络输入字节',
  `net_output_byte` bigint(20) DEFAULT '0' COMMENT '网络输出字节',
  `connected_clients` int(10) NOT NULL COMMENT '客户端连接数',
  `object_size` bigint(20) NOT NULL COMMENT '每分钟存储对象数最大值',
  `accumulation` int(10) NOT NULL DEFAULT '0' COMMENT '参与累加实例数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`,`collect_time`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_modify_time` (`modify_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_to_user`
--

DROP TABLE IF EXISTS `app_to_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_to_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `ch_name` varchar(255) NOT NULL COMMENT '中文名',
  `email` varchar(64) NOT NULL COMMENT '邮箱',
  `mobile` varchar(16) NOT NULL COMMENT '手机',
  `type` int(4) NOT NULL DEFAULT '2' COMMENT '0管理员，1预留，2普通用户，-1无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_user_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_fault`
--

DROP TABLE IF EXISTS `instance_fault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_fault` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `inst_id` bigint(20) NOT NULL COMMENT '实例id',
  `ip` varchar(16) NOT NULL COMMENT 'ip地址',
  `port` int(11) NOT NULL COMMENT '端口',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:0:心跳停止,1:心跳恢复',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `type` mediumint(4) NOT NULL COMMENT '类型：2. redis-cluster, 5. redis-sentinel 6.redis-standalone',
  `reason` mediumtext NOT NULL COMMENT '故障原因描述',
  PRIMARY KEY (`id`),
  KEY `idx_ip_port` (`ip`,`port`),
  KEY `app_id` (`app_id`),
  KEY `inst_id` (`inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实例故障表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_host`
--

DROP TABLE IF EXISTS `instance_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_host` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(16) NOT NULL COMMENT '机器ip',
  `ssh_user` varchar(32) DEFAULT NULL COMMENT 'ssh用户',
  `ssh_pwd` varchar(32) DEFAULT NULL COMMENT 'ssh密码',
  `warn` int(5) DEFAULT '1' COMMENT '0不报警，1报警',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_host_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_info`
--

DROP TABLE IF EXISTS `instance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'instance id',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对等实例的id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id，与app_desc关联',
  `host_id` bigint(20) NOT NULL COMMENT '对应的主机id，与instance_host关联',
  `ip` varchar(16) NOT NULL COMMENT '实例的ip',
  `port` int(11) NOT NULL COMMENT '实例端口',
  `status` tinyint(4) NOT NULL COMMENT '是否启用:0:节点异常,1:正常启用,2:节点下线',
  `mem` int(11) NOT NULL COMMENT '内存大小',
  `conn` int(11) NOT NULL COMMENT '连接数',
  `cmd` varchar(255) NOT NULL COMMENT '启动实例的命令/redis-sentinel的masterName',
  `type` mediumint(11) NOT NULL COMMENT '类型：2. redis-cluster, 5. redis-sentinel 6.redis-standalone',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_inst_ipport` (`ip`,`port`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实例信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_statistics`
--

DROP TABLE IF EXISTS `instance_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `inst_id` bigint(20) NOT NULL COMMENT '实例的id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `host_id` bigint(20) NOT NULL COMMENT '机器的id',
  `ip` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'ip',
  `port` int(255) NOT NULL COMMENT 'port',
  `role` tinyint(255) NOT NULL COMMENT '主从，1主2从',
  `max_memory` bigint(255) NOT NULL COMMENT '预分配内存，单位byte',
  `used_memory` bigint(255) NOT NULL COMMENT '已使用内存，单位byte',
  `curr_items` bigint(255) NOT NULL COMMENT '当前item数量',
  `curr_connections` int(255) NOT NULL COMMENT '当前连接数',
  `misses` bigint(255) NOT NULL COMMENT 'miss数',
  `hits` bigint(255) NOT NULL COMMENT '命中数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`,`port`),
  KEY `app_id` (`app_id`),
  KEY `machine_id` (`host_id`),
  KEY `idx_inst_id` (`inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实例的最新统计信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machine_info`
--

DROP TABLE IF EXISTS `machine_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '机器的id',
  `ssh_user` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'cachecloud' COMMENT 'ssh用户',
  `ssh_passwd` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'cachecloud' COMMENT 'ssh密码',
  `ip` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'ip',
  `room` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '所属机房',
  `mem` int(11) unsigned NOT NULL COMMENT '内存大小，单位G',
  `cpu` mediumint(24) unsigned NOT NULL COMMENT 'cpu数量',
  `virtual` tinyint(8) unsigned NOT NULL DEFAULT '1' COMMENT '是否虚拟，0表示否，1表示是',
  `real_ip` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '宿主机ip',
  `service_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上线时间',
  `fault_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '故障次数',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `warn` tinyint(255) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用报警，0不启用，1启用',
  `available` tinyint(255) NOT NULL COMMENT '表示机器是否可用，1表示可用，0表示不可用；',
  `groupId` int(11) NOT NULL DEFAULT '0' COMMENT '机器分组，默认为0，表示原生资源，非0表示外部提供的资源(可扩展)',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0原生 1 其他',
  `extra_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '对于机器的额外说明(例如机器安装的其他服务(web,mysql,queue等等))',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='保存机器的静态信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machine_statistics`
--

DROP TABLE IF EXISTS `machine_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `host_id` bigint(20) NOT NULL COMMENT '机器id',
  `ip` varchar(16) NOT NULL COMMENT '机器ip',
  `cpu_usage` varchar(120) NOT NULL COMMENT 'cpu使用率',
  `load` varchar(120) NOT NULL COMMENT '机器负载',
  `traffic` varchar(120) NOT NULL COMMENT 'io网络流量',
  `memory_usage_ratio` varchar(120) NOT NULL COMMENT '内存使用率',
  `memory_free` varchar(120) NOT NULL COMMENT '内存剩余',
  `memory_total` varchar(120) NOT NULL COMMENT '总内存量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_ip` (`ip`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机器状态统计信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `standard_statistics`
--

DROP TABLE IF EXISTS `standard_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standard_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `collect_time` bigint(20) NOT NULL COMMENT '收集时间:格式yyyyMMddHHmm',
  `ip` varchar(16) NOT NULL COMMENT 'ip地址',
  `port` int(11) NOT NULL COMMENT '端口/hostId',
  `db_type` varchar(16) NOT NULL COMMENT '收集的数据类型',
  `info_json` text NOT NULL COMMENT '收集的json数据',
  `diff_json` text NOT NULL COMMENT '上一次收集差异的json数据',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_index` (`ip`,`port`,`db_type`,`collect_time`),
  KEY `idx_create_time` (`created_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `instance_slow_log`;

CREATE TABLE `instance_slow_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `instance_id` bigint(20) NOT NULL COMMENT '实例的id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `ip` varchar(32) NOT NULL COMMENT 'ip',
  `port` int(11) NOT NULL COMMENT 'port',
  `slow_log_id` bigint(20) NOT NULL COMMENT '慢查询id',
  `cost_time` int(11) NOT NULL COMMENT '耗时(微妙)',
  `command` varchar(255) NOT NULL COMMENT '执行命令',
  `execute_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '执行时间点',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slowlogkey` (`instance_id`,`slow_log_id`,`execute_time`),
  KEY `idx_app_create_time` (`app_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='实例慢查询列表';
--
-- init cachecloud data
--
insert into app_user(name,ch_name,email,mobile,type) values('admin','admin','admin@sohu-inc.com','13500000000',0);

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-13  9:28:31
