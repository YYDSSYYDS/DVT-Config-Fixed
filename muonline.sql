/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : localhost:3306
 Source Schema         : muonline

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 27/09/2024 12:23:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_buff
-- ----------------------------
DROP TABLE IF EXISTS `account_buff`;
CREATE TABLE `account_buff`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `buff` smallint(5) UNSIGNED NOT NULL,
  `effect_1` tinyint(3) UNSIGNED NOT NULL,
  `value_1` int(11) NOT NULL,
  `effect_2` tinyint(3) UNSIGNED NOT NULL,
  `value_2` int(11) NOT NULL,
  `effect_3` tinyint(3) UNSIGNED NOT NULL,
  `value_3` int(11) NOT NULL,
  `duration` bigint(20) NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`account_id`, `buff`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for account_cash_shop_gift
-- ----------------------------
DROP TABLE IF EXISTS `account_cash_shop_gift`;
CREATE TABLE `account_cash_shop_gift`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `product` int(10) UNSIGNED NOT NULL,
  `option` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED NOT NULL,
  `serial_cash_shop` int(10) UNSIGNED NOT NULL,
  `server` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for account_cash_shop_item
-- ----------------------------
DROP TABLE IF EXISTS `account_cash_shop_item`;
CREATE TABLE `account_cash_shop_item`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `product` int(10) UNSIGNED NOT NULL,
  `option` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED NOT NULL,
  `serial_cash_shop` int(10) UNSIGNED NOT NULL,
  `server` smallint(5) UNSIGNED NOT NULL,
  `gift` tinyint(3) UNSIGNED NOT NULL,
  `date` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for account_data
-- ----------------------------
DROP TABLE IF EXISTS `account_data`;
CREATE TABLE `account_data`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `vip_status` int(11) NULL DEFAULT -1,
  `vip_duration` bigint(20) NULL DEFAULT NULL,
  `expanded_warehouse` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `expanded_warehouse_time` bigint(20) NULL DEFAULT NULL,
  `special_character` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `credits` int(10) UNSIGNED NULL DEFAULT NULL,
  `web_credits` int(10) UNSIGNED NULL DEFAULT NULL,
  `current_character` int(10) UNSIGNED NULL DEFAULT NULL,
  `current_type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `current_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `current_mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `current_diskserial` int(10) UNSIGNED NULL DEFAULT NULL,
  `current_server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `cash_shop_discount_wc` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `cash_shop_discount_gp` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `cash_shop_discount_date` bigint(20) NULL DEFAULT NULL,
  `goblin_points` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for account_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `account_warehouse`;
CREATE TABLE `account_warehouse`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `money` int(10) UNSIGNED NULL DEFAULT NULL,
  `password` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `inventory` varbinary(55000) NULL DEFAULT NULL,
  `gremory_case_acc` varbinary(10000) NULL DEFAULT NULL,
  `wingcoreinventory` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `guid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `blocked` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `security_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `golden_channel` bigint(20) NULL DEFAULT 1500434821,
  `facebook_status` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `secured` tinyint(3) UNSIGNED NULL DEFAULT 1,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `register` bigint(20) NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `email_verified_at` datetime NULL DEFAULT NULL,
  `web_admin` int(11) NULL DEFAULT 0,
  `deletion_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `passlost_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `email_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `new_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `social_id` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `activated` int(11) NULL DEFAULT 0,
  `DiscordDiscriminator` int(11) NULL DEFAULT NULL,
  `DiscordAvatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DiscordId` int(11) NULL DEFAULT NULL,
  `DiscordUsername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DiscordEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DiscordLogin` int(11) NULL DEFAULT 0,
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registration_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lock_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ban_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accounts_allowed
-- ----------------------------
DROP TABLE IF EXISTS `accounts_allowed`;
CREATE TABLE `accounts_allowed`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `guid` int(10) UNSIGNED NULL DEFAULT NULL,
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accounts_banned
-- ----------------------------
DROP TABLE IF EXISTS `accounts_banned`;
CREATE TABLE `accounts_banned`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `guid` int(10) UNSIGNED NULL DEFAULT NULL,
  `unban_date` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accounts_disconnect
-- ----------------------------
DROP TABLE IF EXISTS `accounts_disconnect`;
CREATE TABLE `accounts_disconnect`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `masive` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accounts_security
-- ----------------------------
DROP TABLE IF EXISTS `accounts_security`;
CREATE TABLE `accounts_security`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `disk_serial` int(10) UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accounts_status
-- ----------------------------
DROP TABLE IF EXISTS `accounts_status`;
CREATE TABLE `accounts_status`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `server_group` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `current_server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `start_server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `dest_server` smallint(6) NULL DEFAULT NULL,
  `dest_world` smallint(6) NULL DEFAULT NULL,
  `dest_x` smallint(6) NULL DEFAULT NULL,
  `dest_y` smallint(6) NULL DEFAULT NULL,
  `warp_time` int(10) UNSIGNED NULL DEFAULT NULL,
  `warp_auth_1` int(10) UNSIGNED NULL DEFAULT NULL,
  `warp_auth_2` int(10) UNSIGNED NULL DEFAULT NULL,
  `warp_auth_3` int(10) UNSIGNED NULL DEFAULT NULL,
  `warp_auth_4` int(10) UNSIGNED NULL DEFAULT NULL,
  `last_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_online` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `online` tinyint(4) NULL DEFAULT NULL,
  `disk_serial` int(10) UNSIGNED NULL DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accounts_validation
-- ----------------------------
DROP TABLE IF EXISTS `accounts_validation`;
CREATE TABLE `accounts_validation`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `disk_serial` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accounts_warning
-- ----------------------------
DROP TABLE IF EXISTS `accounts_warning`;
CREATE TABLE `accounts_warning`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `disk_serial` int(10) UNSIGNED NULL DEFAULT NULL,
  `block_date` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for arka_war_data
-- ----------------------------
DROP TABLE IF EXISTS `arka_war_data`;
CREATE TABLE `arka_war_data`  (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `guild` int(10) UNSIGNED NOT NULL,
  `attribute` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `guild`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for block_diskserial
-- ----------------------------
DROP TABLE IF EXISTS `block_diskserial`;
CREATE TABLE `block_diskserial`  (
  `disk_serial` int(10) UNSIGNED NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`disk_serial`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for block_ip
-- ----------------------------
DROP TABLE IF EXISTS `block_ip`;
CREATE TABLE `block_ip`  (
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for block_mac
-- ----------------------------
DROP TABLE IF EXISTS `block_mac`;
CREATE TABLE `block_mac`  (
  `mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mac`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for castle_siege_data
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_data`;
CREATE TABLE `castle_siege_data`  (
  `owner` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `tax_hunt` int(11) NULL DEFAULT NULL,
  `tax_chaos` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `tax_store` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `hunt_allowed` tinyint(4) NULL DEFAULT NULL,
  `money` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for castle_siege_guild
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_guild`;
CREATE TABLE `castle_siege_guild`  (
  `guild` int(10) UNSIGNED NOT NULL,
  `side` tinyint(3) UNSIGNED NOT NULL,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`guild`, `side`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for castle_siege_npc
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_npc`;
CREATE TABLE `castle_siege_npc`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` smallint(6) NULL DEFAULT NULL,
  `defense_level` smallint(6) NULL DEFAULT NULL,
  `regen_level` smallint(6) NULL DEFAULT NULL,
  `life_level` smallint(6) NULL DEFAULT NULL,
  `life` int(11) NULL DEFAULT NULL,
  `npc` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for castle_siege_registered_guild
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_registered_guild`;
CREATE TABLE `castle_siege_registered_guild`  (
  `guild` int(10) UNSIGNED NOT NULL,
  `marks` int(10) UNSIGNED NULL DEFAULT NULL,
  `register_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `level` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `level_master` smallint(5) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`guild`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for chaos_castle_survival_hall_of_fame
-- ----------------------------
DROP TABLE IF EXISTS `chaos_castle_survival_hall_of_fame`;
CREATE TABLE `chaos_castle_survival_hall_of_fame`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for chaos_castle_survival_ranking
-- ----------------------------
DROP TABLE IF EXISTS `chaos_castle_survival_ranking`;
CREATE TABLE `chaos_castle_survival_ranking`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `score` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_add_stat
-- ----------------------------
DROP TABLE IF EXISTS `character_add_stat`;
CREATE TABLE `character_add_stat`  (
  `GUID` int(11) NULL DEFAULT NULL,
  `Strenght` int(11) NOT NULL DEFAULT 0,
  `Agility` int(11) NOT NULL DEFAULT 0,
  `Vitality` int(11) NOT NULL DEFAULT 0,
  `Energy` int(11) NOT NULL DEFAULT 0,
  `Leadership` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_buff
-- ----------------------------
DROP TABLE IF EXISTS `character_buff`;
CREATE TABLE `character_buff`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `buff` smallint(5) UNSIGNED NOT NULL,
  `effect_1` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `value_1` int(11) NULL DEFAULT NULL,
  `effect_2` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `value_2` int(11) NULL DEFAULT NULL,
  `effect_3` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `value_3` int(11) NULL DEFAULT NULL,
  `duration` bigint(20) NULL DEFAULT NULL,
  `flags` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `buff`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_chat_block
-- ----------------------------
DROP TABLE IF EXISTS `character_chat_block`;
CREATE TABLE `character_chat_block`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `blocked` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_date
-- ----------------------------
DROP TABLE IF EXISTS `character_date`;
CREATE TABLE `character_date`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `date` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_deleted
-- ----------------------------
DROP TABLE IF EXISTS `character_deleted`;
CREATE TABLE `character_deleted`  (
  `account_id` int(10) UNSIGNED NOT NULL,
  `char_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`, `char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_event_count
-- ----------------------------
DROP TABLE IF EXISTS `character_event_count`;
CREATE TABLE `character_event_count`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `event_id` tinyint(3) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `day` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`char_id`, `event_id`, `day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_friend
-- ----------------------------
DROP TABLE IF EXISTS `character_friend`;
CREATE TABLE `character_friend`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `friend_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`char_id`, `friend_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_gameoption
-- ----------------------------
DROP TABLE IF EXISTS `character_gameoption`;
CREATE TABLE `character_gameoption`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `game_option` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `chat_window` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `q_key` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `w_key` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `e_key` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `r_key` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `qwer_level` int(11) NULL DEFAULT NULL,
  `skill_bind_0` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `skill_bind_1` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `skill_bind_2` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `skill_bind_3` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `skill_bind_4` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `skill_bind_5` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `skill_bind_6` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `skill_bind_7` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `skill_bind_8` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `skill_bind_9` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `extra_data` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `change_skin` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `additional_options` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `button_bind_1` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `button_bind_2` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `button_bind_3` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `button_bind_4` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `button_bind_5` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_gens
-- ----------------------------
DROP TABLE IF EXISTS `character_gens`;
CREATE TABLE `character_gens`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `family` tinyint(3) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `contribution` int(11) NULL DEFAULT NULL,
  `reward_date` bigint(20) NULL DEFAULT NULL,
  `join_date` bigint(20) NULL DEFAULT NULL,
  `left_date` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `family`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_gens_kill
-- ----------------------------
DROP TABLE IF EXISTS `character_gens_kill`;
CREATE TABLE `character_gens_kill`  (
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `killed_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `count` int(10) UNSIGNED NULL DEFAULT NULL,
  `date` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_gremory_case
-- ----------------------------
DROP TABLE IF EXISTS `character_gremory_case`;
CREATE TABLE `character_gremory_case`  (
  `guid` int(11) NOT NULL,
  `gremory_case_char` varbinary(20000) NULL DEFAULT NULL,
  `gremory_case_mobile` varbinary(20000) NULL DEFAULT NULL,
  `gremory_case_ps` varbinary(20000) NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_helper
-- ----------------------------
DROP TABLE IF EXISTS `character_helper`;
CREATE TABLE `character_helper`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `option_flag_1` int(10) UNSIGNED NULL DEFAULT NULL,
  `option_flag_2` int(10) UNSIGNED NULL DEFAULT NULL,
  `item_pick_flag` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `hunting_range` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `item_pick_range` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `distance` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `attack_skill_1` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `attack_sec_skill_1` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `attack_sec_skill_2` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `attack_sec_delay_1` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `attack_sec_delay_2` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `buff_skill_1` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `buff_skill_2` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `buff_skill_3` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `time_space_casting` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `percent_autopot` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `percent_autoheal` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `percent_partyheal` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `percent_drainlife` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `item_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buff_item_1` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `buff_item_2` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `buff_item_3` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `buff_skill_4` smallint(5) UNSIGNED NULL DEFAULT 0,
  `buff_skill_5` smallint(5) UNSIGNED NULL DEFAULT 0,
  `buff_skill_6` smallint(5) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_hunting_record
-- ----------------------------
DROP TABLE IF EXISTS `character_hunting_record`;
CREATE TABLE `character_hunting_record`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `world` smallint(5) UNSIGNED NOT NULL,
  `year` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `month` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `day` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `level` int(10) UNSIGNED NULL DEFAULT NULL,
  `duration` int(10) UNSIGNED NULL DEFAULT NULL,
  `damage` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `elemental_damage` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `healing` int(10) UNSIGNED NULL DEFAULT NULL,
  `killed_count` int(10) UNSIGNED NULL DEFAULT NULL,
  `earned_experience` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `world`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_info
-- ----------------------------
DROP TABLE IF EXISTS `character_info`;
CREATE TABLE `character_info`  (
  `guid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `authority` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `race` smallint(3) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `slot` tinyint(4) NULL DEFAULT 1,
  `level` smallint(6) NULL DEFAULT 0,
  `level_master` smallint(6) NULL DEFAULT 0,
  `level_majestic` smallint(6) NULL DEFAULT 0,
  `experience` bigint(20) NULL DEFAULT 0,
  `experience_master` bigint(20) NULL DEFAULT 0,
  `experience_majestic` bigint(20) NULL DEFAULT 0,
  `points` int(11) NULL DEFAULT 0,
  `points_master` int(11) NULL DEFAULT 0,
  `points_majestic` int(11) NULL DEFAULT 0,
  `strength` int(10) UNSIGNED NULL DEFAULT 0,
  `agility` int(10) UNSIGNED NULL DEFAULT 0,
  `vitality` int(10) UNSIGNED NULL DEFAULT 0,
  `energy` int(10) UNSIGNED NULL DEFAULT 0,
  `leadership` int(10) UNSIGNED NULL DEFAULT 0,
  `world` smallint(5) UNSIGNED NULL DEFAULT 0,
  `world_x` smallint(6) NULL DEFAULT 0,
  `world_y` smallint(6) NULL DEFAULT 0,
  `direction` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `money` int(10) UNSIGNED NULL DEFAULT 0,
  `life` int(11) NULL DEFAULT 0,
  `mana` int(11) NULL DEFAULT 0,
  `shield` int(11) NULL DEFAULT 0,
  `stamina` int(11) NULL DEFAULT 0,
  `add_fruit_points` int(11) NULL DEFAULT 0,
  `dec_fruit_points` int(11) NULL DEFAULT 0,
  `expanded_inventory` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `mute_time` bigint(20) NULL DEFAULT 0,
  `admin_flags` int(10) UNSIGNED NULL DEFAULT 0,
  `pk_level` tinyint(3) UNSIGNED NULL DEFAULT 3,
  `pk_count` int(11) NULL DEFAULT 0,
  `pk_points` int(11) NULL DEFAULT 0,
  `first_time` tinyint(3) UNSIGNED NULL DEFAULT 1,
  `santa_claus_gift` bigint(20) NULL DEFAULT 0,
  `personal_store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `personal_store_open` tinyint(4) NULL DEFAULT 0,
  `last_use` bigint(20) NULL DEFAULT 0,
  `kick_time` bigint(20) NULL DEFAULT 0,
  `post_count` int(11) NULL DEFAULT 0,
  `post_day` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `post_month` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `ruud_money` int(10) UNSIGNED NULL DEFAULT 0,
  `hunting_log_visible` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `create_date` bigint(20) NULL DEFAULT 0,
  `online` tinyint(4) NULL DEFAULT 0,
  `server_code` smallint(5) UNSIGNED NULL DEFAULT 3,
  `reset` int(10) UNSIGNED NULL DEFAULT 0,
  `monster_soul_purchase` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_item_delay
-- ----------------------------
DROP TABLE IF EXISTS `character_item_delay`;
CREATE TABLE `character_item_delay`  (
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `item` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `date` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_item_inventory
-- ----------------------------
DROP TABLE IF EXISTS `character_item_inventory`;
CREATE TABLE `character_item_inventory`  (
  `GUID` int(11) NOT NULL,
  `InventoryData` varbinary(65525) NULL DEFAULT NULL,
  PRIMARY KEY (`GUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_item_pentagram
-- ----------------------------
DROP TABLE IF EXISTS `character_item_pentagram`;
CREATE TABLE `character_item_pentagram`  (
  `GUID` int(11) NOT NULL,
  `PentagramInventoryData` varbinary(65525) NULL DEFAULT NULL,
  `INV_TYPE` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`GUID`, `INV_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_jewel_bingo
-- ----------------------------
DROP TABLE IF EXISTS `character_jewel_bingo`;
CREATE TABLE `character_jewel_bingo`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `box` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `count` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `jewel` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `score1` int(11) NULL DEFAULT NULL,
  `score2` int(11) NULL DEFAULT NULL,
  `score3` int(11) NULL DEFAULT NULL,
  `date` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_jewel_bingo_grid
-- ----------------------------
DROP TABLE IF EXISTS `character_jewel_bingo_grid`;
CREATE TABLE `character_jewel_bingo_grid`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `slot` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `value` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_kick
-- ----------------------------
DROP TABLE IF EXISTS `character_kick`;
CREATE TABLE `character_kick`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `character_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_labyrinth
-- ----------------------------
DROP TABLE IF EXISTS `character_labyrinth`;
CREATE TABLE `character_labyrinth`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `stage` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `id` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `level` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `killed_monsters` int(11) NULL DEFAULT NULL,
  `earned_experience` bigint(20) NULL DEFAULT NULL,
  `completed_missions` int(11) NULL DEFAULT NULL,
  `date` bigint(20) NULL DEFAULT NULL,
  `goblin_state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `day_first` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_labyrinth_level
-- ----------------------------
DROP TABLE IF EXISTS `character_labyrinth_level`;
CREATE TABLE `character_labyrinth_level`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `level` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_labyrinth_zone
-- ----------------------------
DROP TABLE IF EXISTS `character_labyrinth_zone`;
CREATE TABLE `character_labyrinth_zone`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `idx` tinyint(3) UNSIGNED NOT NULL,
  `subidx` tinyint(3) UNSIGNED NOT NULL,
  `mission_id_1` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `mission_id_2` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `mission_id_3` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `mission_id_4` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `mission_id_5` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `mission_count_1` int(11) NULL DEFAULT NULL,
  `mission_count_2` int(11) NULL DEFAULT NULL,
  `mission_count_3` int(11) NULL DEFAULT NULL,
  `mission_count_4` int(11) NULL DEFAULT NULL,
  `mission_count_5` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `idx`, `subidx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_mail
-- ----------------------------
DROP TABLE IF EXISTS `character_mail`;
CREATE TABLE `character_mail`  (
  `id` int(10) UNSIGNED NOT NULL,
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `from_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direction` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `action` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `window_guid` int(10) UNSIGNED NULL DEFAULT NULL,
  `date` bigint(20) NULL DEFAULT NULL,
  `opened` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_majestic_stats
-- ----------------------------
DROP TABLE IF EXISTS `character_majestic_stats`;
CREATE TABLE `character_majestic_stats`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `id` tinyint(3) UNSIGNED NOT NULL,
  `level` smallint(5) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_majestic_tree
-- ----------------------------
DROP TABLE IF EXISTS `character_majestic_tree`;
CREATE TABLE `character_majestic_tree`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `section` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `id` smallint(5) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_mini_bomb
-- ----------------------------
DROP TABLE IF EXISTS `character_mini_bomb`;
CREATE TABLE `character_mini_bomb`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `score` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `total_score` int(11) NULL DEFAULT NULL,
  `cdate` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_mini_bomb_grid
-- ----------------------------
DROP TABLE IF EXISTS `character_mini_bomb_grid`;
CREATE TABLE `character_mini_bomb_grid`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `cell` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `value` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_monster_soul
-- ----------------------------
DROP TABLE IF EXISTS `character_monster_soul`;
CREATE TABLE `character_monster_soul`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NULL DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_mu_roomy
-- ----------------------------
DROP TABLE IF EXISTS `character_mu_roomy`;
CREATE TABLE `character_mu_roomy`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `playing` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `score` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `card_count` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `special_card_count` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `date` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_mu_roomy_deck
-- ----------------------------
DROP TABLE IF EXISTS `character_mu_roomy_deck`;
CREATE TABLE `character_mu_roomy_deck`  (
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `slot` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `color` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `number` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `play_slot` tinyint(3) UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_mupass
-- ----------------------------
DROP TABLE IF EXISTS `character_mupass`;
CREATE TABLE `character_mupass`  (
  `guid` bigint(20) NOT NULL AUTO_INCREMENT,
  `character_id` bigint(20) NULL DEFAULT NULL,
  `pass_level` int(11) NULL DEFAULT NULL,
  `pass_exp` bigint(20) NULL DEFAULT NULL,
  `gold_enabled` tinyint(1) NULL DEFAULT NULL,
  `premiun_enabled` tinyint(1) NULL DEFAULT NULL,
  `MuRevardEnabled` tinyint(1) NULL DEFAULT NULL,
  `MuRevardGoldEnabled` tinyint(1) NULL DEFAULT NULL,
  `MuRevardPremiumEnabled` tinyint(1) NULL DEFAULT NULL,
  `TodayMuPassExp` int(11) NULL DEFAULT NULL,
  `pass_data` varbinary(30000) NULL DEFAULT NULL,
  `pass_reward_data` varbinary(30000) NULL DEFAULT NULL,
  `ticketCount` bigint(20) NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48171 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_notification
-- ----------------------------
DROP TABLE IF EXISTS `character_notification`;
CREATE TABLE `character_notification`  (
  `server_group` smallint(5) UNSIGNED NOT NULL,
  `char_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `facebook_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_data` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`server_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_numeric_baseball
-- ----------------------------
DROP TABLE IF EXISTS `character_numeric_baseball`;
CREATE TABLE `character_numeric_baseball`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `number_1` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `number_2` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `number_3` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `numbers` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `strikes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `balls` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_quest_evo
-- ----------------------------
DROP TABLE IF EXISTS `character_quest_evo`;
CREATE TABLE `character_quest_evo`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `id` tinyint(3) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `kill_count_1` int(11) NULL DEFAULT NULL,
  `kill_count_2` int(11) NULL DEFAULT NULL,
  `kill_count_3` int(11) NULL DEFAULT NULL,
  `kill_count_4` int(11) NULL DEFAULT NULL,
  `kill_count_5` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_quest_guided
-- ----------------------------
DROP TABLE IF EXISTS `character_quest_guided`;
CREATE TABLE `character_quest_guided`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `quest` smallint(5) UNSIGNED NOT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `date` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `quest`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_quest_mu
-- ----------------------------
DROP TABLE IF EXISTS `character_quest_mu`;
CREATE TABLE `character_quest_mu`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `quest_id` smallint(5) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `objective` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `date` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `quest_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_restriction
-- ----------------------------
DROP TABLE IF EXISTS `character_restriction`;
CREATE TABLE `character_restriction`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `restriction` int(10) UNSIGNED NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_score
-- ----------------------------
DROP TABLE IF EXISTS `character_score`;
CREATE TABLE `character_score`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_skill
-- ----------------------------
DROP TABLE IF EXISTS `character_skill`;
CREATE TABLE `character_skill`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `skill` smallint(5) UNSIGNED NOT NULL,
  `skill_level` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `type`, `skill`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_statistics
-- ----------------------------
DROP TABLE IF EXISTS `character_statistics`;
CREATE TABLE `character_statistics`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `statistic_id` int(10) UNSIGNED NOT NULL,
  `count` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `statistic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for character_warp_favorite_list
-- ----------------------------
DROP TABLE IF EXISTS `character_warp_favorite_list`;
CREATE TABLE `character_warp_favorite_list`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `slot` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `data` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `warp_id` smallint(5) UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crywolf_data
-- ----------------------------
DROP TABLE IF EXISTS `crywolf_data`;
CREATE TABLE `crywolf_data`  (
  `state` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`state`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_arka_war_kill
-- ----------------------------
DROP TABLE IF EXISTS `event_arka_war_kill`;
CREATE TABLE `event_arka_war_kill`  (
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_rank` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `player_data_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id_01` int(10) UNSIGNED NULL DEFAULT NULL,
  `guild_name_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `killer_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `killer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `killer_rank` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `player_data_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id_02` int(10) UNSIGNED NULL DEFAULT NULL,
  `guild_name_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `world` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint(6) NULL DEFAULT NULL,
  `world_y` smallint(6) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_arka_war_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_arka_war_ranking`;
CREATE TABLE `event_arka_war_ranking`  (
  `guild_id_01` int(10) UNSIGNED NULL DEFAULT NULL,
  `guild_name_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id_02` int(10) UNSIGNED NULL DEFAULT NULL,
  `guild_name_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `character_count` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_castle_siege_kill
-- ----------------------------
DROP TABLE IF EXISTS `event_castle_siege_kill`;
CREATE TABLE `event_castle_siege_kill`  (
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_rank` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `player_data_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id_01` int(10) UNSIGNED NULL DEFAULT NULL,
  `guild_name_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `killer_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `killer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `killer_rank` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `player_data_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id_02` int(10) UNSIGNED NULL DEFAULT NULL,
  `guild_name_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `world` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint(6) NULL DEFAULT NULL,
  `world_y` smallint(6) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_castle_siege_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_castle_siege_ranking`;
CREATE TABLE `event_castle_siege_ranking`  (
  `guild_id` int(10) UNSIGNED NOT NULL,
  `guild_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `character_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`guild_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_castle_siege_time
-- ----------------------------
DROP TABLE IF EXISTS `event_castle_siege_time`;
CREATE TABLE `event_castle_siege_time`  (
  `char_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_rank` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `guild_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `time` int(10) UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_dungeon_instance
-- ----------------------------
DROP TABLE IF EXISTS `event_dungeon_instance`;
CREATE TABLE `event_dungeon_instance`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `id` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_jewel_bingo_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_jewel_bingo_ranking`;
CREATE TABLE `event_jewel_bingo_ranking`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `score1` int(11) NULL DEFAULT NULL,
  `score2` int(11) NULL DEFAULT NULL,
  `score3` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_labyrinth_league
-- ----------------------------
DROP TABLE IF EXISTS `event_labyrinth_league`;
CREATE TABLE `event_labyrinth_league`  (
  `category` tinyint(3) UNSIGNED NOT NULL,
  `char_id` int(10) UNSIGNED NOT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_class` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `league_score` int(11) NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `category`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_labyrinth_schedule
-- ----------------------------
DROP TABLE IF EXISTS `event_labyrinth_schedule`;
CREATE TABLE `event_labyrinth_schedule`  (
  `server` smallint(5) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `start_date` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`server`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_mini_bomb_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_mini_bomb_ranking`;
CREATE TABLE `event_mini_bomb_ranking`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `score` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `bombs_founded` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `bombs_failed` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_mu_roomy_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_mu_roomy_ranking`;
CREATE TABLE `event_mu_roomy_ranking`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `score` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `remain_card` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `remain_special_card` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_numeric_baseball_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_numeric_baseball_ranking`;
CREATE TABLE `event_numeric_baseball_ranking`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_race_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_race_ranking`;
CREATE TABLE `event_race_ranking`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `race` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `race`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_ranking`;
CREATE TABLE `event_ranking`  (
  `event_id` tinyint(3) UNSIGNED NOT NULL,
  `event_ground` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NOT NULL,
  `score` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`, `char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_ranking_labyrinth
-- ----------------------------
DROP TABLE IF EXISTS `event_ranking_labyrinth`;
CREATE TABLE `event_ranking_labyrinth`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `level` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `stage` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `index` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `killed_monsters` int(11) NULL DEFAULT NULL,
  `earned_experience` bigint(20) NULL DEFAULT NULL,
  `completed_missions` int(11) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_scramble_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_scramble_ranking`;
CREATE TABLE `event_scramble_ranking`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shuffle_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for event_stage
-- ----------------------------
DROP TABLE IF EXISTS `event_stage`;
CREATE TABLE `event_stage`  (
  `event_id` tinyint(3) UNSIGNED NOT NULL,
  `stage` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for gen_ranking
-- ----------------------------
DROP TABLE IF EXISTS `gen_ranking`;
CREATE TABLE `gen_ranking`  (
  `family` tinyint(3) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `ranking` int(11) NULL DEFAULT NULL,
  `char_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`family`, `char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for giant_mount_settings
-- ----------------------------
DROP TABLE IF EXISTS `giant_mount_settings`;
CREATE TABLE `giant_mount_settings`  (
  `character_id` bigint(20) NOT NULL,
  `giant_model` smallint(6) NOT NULL,
  `giant_status` smallint(6) NOT NULL,
  PRIMARY KEY (`character_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for guild_list
-- ----------------------------
DROP TABLE IF EXISTS `guild_list`;
CREATE TABLE `guild_list`  (
  `guid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emblem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hostil` int(10) UNSIGNED NULL DEFAULT NULL,
  `alliance` int(10) UNSIGNED NULL DEFAULT NULL,
  `notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for guild_matching
-- ----------------------------
DROP TABLE IF EXISTS `guild_matching`;
CREATE TABLE `guild_matching`  (
  `guild_id` int(10) UNSIGNED NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interest_type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `level_range` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `class_type` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `board_number` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`guild_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for guild_members
-- ----------------------------
DROP TABLE IF EXISTS `guild_members`;
CREATE TABLE `guild_members`  (
  `guild_id` int(10) UNSIGNED NOT NULL,
  `char_id` int(10) UNSIGNED NOT NULL,
  `id` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `ranking` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`guild_id`, `char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for guild_score
-- ----------------------------
DROP TABLE IF EXISTS `guild_score`;
CREATE TABLE `guild_score`  (
  `guild_id` int(10) UNSIGNED NOT NULL,
  `score` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`guild_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for item_recovery
-- ----------------------------
DROP TABLE IF EXISTS `item_recovery`;
CREATE TABLE `item_recovery`  (
  `char_id` int(10) UNSIGNED NOT NULL,
  `item` smallint(5) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `durability` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `skill` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `luck` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `option` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `excellent` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `ancient` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `harmony` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `option_380` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `socket_1` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `socket_2` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `socket_3` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `socket_4` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `socket_5` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `socket_bonus` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `data_1` int(11) NULL DEFAULT NULL,
  `data_2` int(11) NULL DEFAULT NULL,
  `data_3` int(11) NULL DEFAULT NULL,
  `serial_server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `serial` int(10) UNSIGNED NULL DEFAULT NULL,
  `serial_cash_shop` int(10) UNSIGNED NULL DEFAULT NULL,
  `flags` int(10) UNSIGNED NULL DEFAULT NULL,
  `id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `item`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for item_serial
-- ----------------------------
DROP TABLE IF EXISTS `item_serial`;
CREATE TABLE `item_serial`  (
  `server` int(11) NOT NULL,
  `serial` bigint(20) NOT NULL,
  `serial_shop` bigint(20) NOT NULL,
  PRIMARY KEY (`server`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for lo_de
-- ----------------------------
DROP TABLE IF EXISTS `lo_de`;
CREATE TABLE `lo_de`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `char_id` int(11) NOT NULL,
  `bet_number` int(11) NOT NULL,
  `bet_type` int(11) NOT NULL,
  `bet_item` int(11) NOT NULL,
  `bet_value` int(11) NOT NULL,
  `bet_time` datetime(6) NOT NULL,
  `reward_value_x` int(11) NOT NULL,
  `reward_status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for master_pc
-- ----------------------------
DROP TABLE IF EXISTS `master_pc`;
CREATE TABLE `master_pc`  (
  `disk_serial` int(10) UNSIGNED NOT NULL,
  `mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`disk_serial`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for monster_respawn
-- ----------------------------
DROP TABLE IF EXISTS `monster_respawn`;
CREATE TABLE `monster_respawn`  (
  `server` smallint(5) UNSIGNED NOT NULL,
  `guid` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`server`, `guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for party
-- ----------------------------
DROP TABLE IF EXISTS `party`;
CREATE TABLE `party`  (
  `guid` smallint(5) UNSIGNED NOT NULL,
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for party_member
-- ----------------------------
DROP TABLE IF EXISTS `party_member`;
CREATE TABLE `party_member`  (
  `member` int(10) UNSIGNED NOT NULL,
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `party` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`member`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `abilities` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for serial_check
-- ----------------------------
DROP TABLE IF EXISTS `serial_check`;
CREATE TABLE `serial_check`  (
  `server` smallint(5) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `disk_serial` int(10) UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for server_monster_soul_reset
-- ----------------------------
DROP TABLE IF EXISTS `server_monster_soul_reset`;
CREATE TABLE `server_monster_soul_reset`  (
  `monster_soul_reset` int(11) NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for server_ranking
-- ----------------------------
DROP TABLE IF EXISTS `server_ranking`;
CREATE TABLE `server_ranking`  (
  `guid` int(11) NOT NULL,
  `race` int(11) NULL DEFAULT NULL,
  `level_normal` int(11) NULL DEFAULT NULL,
  `level_master` int(11) NULL DEFAULT NULL,
  `level_majestic` int(11) NULL DEFAULT NULL,
  `reset` int(11) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for server_signal
-- ----------------------------
DROP TABLE IF EXISTS `server_signal`;
CREATE TABLE `server_signal`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `server` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `signal` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `data_1` int(11) NULL DEFAULT NULL,
  `data_2` int(11) NULL DEFAULT NULL,
  `data_3` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tormented_square_survival_hall_of_fame
-- ----------------------------
DROP TABLE IF EXISTS `tormented_square_survival_hall_of_fame`;
CREATE TABLE `tormented_square_survival_hall_of_fame`  (
  `char_id_1` int(10) UNSIGNED NOT NULL,
  `char_name_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_2` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`char_id_1`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tormented_square_survival_ranking
-- ----------------------------
DROP TABLE IF EXISTS `tormented_square_survival_ranking`;
CREATE TABLE `tormented_square_survival_ranking`  (
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `ranking` int(11) NULL DEFAULT NULL,
  `char_id_1` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_2` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_name_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tormented_square_survival_team
-- ----------------------------
DROP TABLE IF EXISTS `tormented_square_survival_team`;
CREATE TABLE `tormented_square_survival_team`  (
  `char_id_1` int(10) UNSIGNED NULL DEFAULT NULL,
  `char_id_2` int(10) UNSIGNED NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `enter_count` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
