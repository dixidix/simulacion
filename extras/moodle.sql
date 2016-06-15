-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2016 a las 04:07:51
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `moodle`
--
CREATE DATABASE IF NOT EXISTS `moodle` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `moodle`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign`
--

CREATE TABLE `mdl_assign` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table saves information about an instance of mod_assign';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign_grades`
--

CREATE TABLE `mdl_assign_grades` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading information about a single assignment submission.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign_plugin_config`
--

CREATE TABLE `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) NOT NULL DEFAULT '',
  `subtype` varchar(28) NOT NULL DEFAULT '',
  `name` varchar(28) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config data for an instance of a plugin in an assignment.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign_submission`
--

CREATE TABLE `mdl_assign_submission` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about student interactions with';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign_user_flags`
--

CREATE TABLE `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of flags that can be set for a single user in a single ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign_user_mapping`
--

CREATE TABLE `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Map an assignment specific id number to a user';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignfeedback_comments`
--

CREATE TABLE `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext,
  `commentformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text feedback for submitted assignments';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignfeedback_editpdf_annot`
--

CREATE TABLE `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext,
  `type` varchar(10) DEFAULT 'line',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores annotations added to pdfs submitted by students';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignfeedback_editpdf_cmnt`
--

CREATE TABLE `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores comments added to pdfs';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignfeedback_editpdf_quick`
--

CREATE TABLE `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) DEFAULT 'yellow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores teacher specified quicklist comments';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignfeedback_file`
--

CREATE TABLE `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores info about the number of files submitted by a student';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignment`
--

CREATE TABLE `mdl_assignment` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignment_submissions`
--

CREATE TABLE `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext,
  `data2` longtext,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignsubmission_file`
--

CREATE TABLE `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about file submissions for assignments';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignsubmission_onlinetext`
--

CREATE TABLE `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about onlinetext submission';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_controllers`
--

CREATE TABLE `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_courses`
--

CREATE TABLE `mdl_backup_courses` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_logs`
--

CREATE TABLE `mdl_backup_logs` (
  `id` bigint(10) NOT NULL,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge`
--

CREATE TABLE `mdl_badge` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) NOT NULL DEFAULT '',
  `issuerurl` varchar(255) NOT NULL DEFAULT '',
  `issuercontact` varchar(255) DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext NOT NULL,
  `messagesubject` longtext NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines badge';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_backpack`
--

CREATE TABLE `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `backpackurl` varchar(255) NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines settings for connecting external backpack';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_criteria`
--

CREATE TABLE `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria for issuing badges';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_criteria_met`
--

CREATE TABLE `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria that were met for an issued badge';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_criteria_param`
--

CREATE TABLE `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines parameters for badges criteria';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_external`
--

CREATE TABLE `mdl_badge_external` (
  `id` bigint(10) NOT NULL,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Setting for external badges display';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_issued`
--

CREATE TABLE `mdl_badge_issued` (
  `id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines issued badges';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_manual_award`
--

CREATE TABLE `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track manual award criteria for badges';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block`
--

CREATE TABLE `mdl_block` (
  `id` bigint(10) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks';

--
-- Volcado de datos para la tabla `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 0, 0, 1),
(2, 'admin_bookmarks', 0, 0, 1),
(3, 'badges', 0, 0, 1),
(4, 'blog_menu', 0, 0, 1),
(5, 'blog_recent', 0, 0, 1),
(6, 'blog_tags', 0, 0, 1),
(7, 'calendar_month', 0, 0, 1),
(8, 'calendar_upcoming', 0, 0, 1),
(9, 'comments', 0, 0, 1),
(10, 'community', 0, 0, 1),
(11, 'completionstatus', 0, 0, 1),
(12, 'course_list', 0, 0, 1),
(13, 'course_overview', 0, 0, 1),
(14, 'course_summary', 0, 0, 1),
(15, 'feedback', 0, 0, 0),
(16, 'glossary_random', 0, 0, 1),
(17, 'html', 0, 0, 1),
(18, 'login', 0, 0, 1),
(19, 'mentees', 0, 0, 1),
(20, 'messages', 0, 0, 1),
(21, 'mnet_hosts', 0, 0, 1),
(22, 'myprofile', 0, 0, 1),
(23, 'navigation', 0, 0, 1),
(24, 'news_items', 0, 0, 1),
(25, 'online_users', 0, 0, 1),
(26, 'participants', 0, 0, 1),
(27, 'private_files', 0, 0, 1),
(28, 'quiz_results', 0, 0, 1),
(29, 'recent_activity', 0, 0, 1),
(30, 'rss_client', 300, 0, 1),
(31, 'search_forums', 0, 0, 1),
(32, 'section_links', 0, 0, 1),
(33, 'selfcompletion', 0, 0, 1),
(34, 'settings', 0, 0, 1),
(35, 'site_main_menu', 0, 0, 1),
(36, 'social_activities', 0, 0, 1),
(37, 'tag_flickr', 0, 0, 1),
(38, 'tag_youtube', 0, 0, 1),
(39, 'tags', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_community`
--

CREATE TABLE `mdl_block_community` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_instances`
--

CREATE TABLE `mdl_block_instances` (
  `id` bigint(10) NOT NULL,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is';

--
-- Volcado de datos para la tabla `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_positions`
--

CREATE TABLE `mdl_block_positions` (
  `id` bigint(10) NOT NULL,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_rss_client`
--

CREATE TABLE `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_blog_association`
--

CREATE TABLE `mdl_blog_association` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_blog_external`
--

CREATE TABLE `mdl_blog_external` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `url` longtext NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_book`
--

CREATE TABLE `mdl_book` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_book_chapters`
--

CREATE TABLE `mdl_book_chapters` (
  `id` bigint(10) NOT NULL,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cache_filters`
--

CREATE TABLE `mdl_cache_filters` (
  `id` bigint(10) NOT NULL,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cache_flags`
--

CREATE TABLE `mdl_cache_flags` (
  `id` bigint(10) NOT NULL,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `expiry` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags';

--
-- Volcado de datos para la tabla `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1465943883, '1', 1465951083),
(2, 'userpreferenceschanged', '3', 1465943217, '1', 1465950417);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cache_text`
--

CREATE TABLE `mdl_cache_text` (
  `id` bigint(10) NOT NULL,
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `formattedtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For storing temporary copies of processed texts';

--
-- Volcado de datos para la tabla `mdl_cache_text`
--

INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(1, '4351d00a1a0428201e17b7a595a0c95a', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1465851639),
(2, '7088784e04c075cc90016a72cf938cb2', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1465943140);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_capabilities`
--

CREATE TABLE `mdl_capabilities` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities';

--
-- Volcado de datos para la tabla `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(39, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(40, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(41, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(42, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(43, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(44, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(45, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(46, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(47, 'moodle/role:review', 'read', 50, 'moodle', 8),
(48, 'moodle/role:override', 'write', 50, 'moodle', 28),
(49, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(50, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(51, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(52, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(53, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(54, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(55, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(56, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(57, 'moodle/course:create', 'write', 40, 'moodle', 4),
(58, 'moodle/course:request', 'write', 10, 'moodle', 0),
(59, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(60, 'moodle/course:update', 'write', 50, 'moodle', 4),
(61, 'moodle/course:view', 'read', 50, 'moodle', 0),
(62, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(63, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(64, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(65, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(66, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(67, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(68, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(69, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(70, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(71, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(72, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(73, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(74, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(75, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(76, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(77, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(78, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(79, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(80, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(81, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(82, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(83, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(84, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(85, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(86, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(87, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(88, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(89, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(90, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(91, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(92, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(93, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(94, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(95, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(96, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(97, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(98, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(99, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(100, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(101, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(102, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(103, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(104, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(105, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(106, 'moodle/question:add', 'write', 50, 'moodle', 20),
(107, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(108, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(109, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(110, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(111, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(112, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(113, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(114, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(115, 'moodle/question:config', 'write', 10, 'moodle', 2),
(116, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(117, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(118, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(119, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(120, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(121, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(122, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(123, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(124, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(125, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(126, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(127, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(128, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(129, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(130, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(131, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(132, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(133, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(134, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(135, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(136, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(137, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(138, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(139, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(140, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(141, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(142, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(143, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(144, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(145, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(146, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(147, 'moodle/block:view', 'read', 80, 'moodle', 0),
(148, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(149, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(150, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(151, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(152, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(153, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(154, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(155, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(156, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(157, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(158, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(159, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(160, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(161, 'moodle/community:add', 'write', 10, 'moodle', 0),
(162, 'moodle/community:download', 'write', 10, 'moodle', 0),
(163, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(164, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
(165, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
(166, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(167, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
(168, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
(169, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
(170, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
(171, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 0),
(172, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
(173, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
(174, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
(175, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(176, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(177, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(178, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(179, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(180, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(181, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(182, 'mod/assign:reviewgrades', 'write', 70, 'mod_assign', 0),
(183, 'mod/assign:releasegrades', 'write', 70, 'mod_assign', 0),
(184, 'mod/assign:managegrades', 'write', 70, 'mod_assign', 0),
(185, 'mod/assign:manageallocations', 'write', 70, 'mod_assign', 0),
(186, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(187, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(188, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(189, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(190, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(191, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(192, 'mod/book:read', 'read', 70, 'mod_book', 0),
(193, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(194, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(195, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(196, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(197, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(198, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(199, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(200, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(201, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(202, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(203, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(204, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(205, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(206, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(207, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(208, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(209, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(210, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(211, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(212, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(213, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(214, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(215, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(216, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(217, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(218, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(219, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(220, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(221, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(222, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(223, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(224, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(225, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(226, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(227, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(228, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(229, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(230, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(231, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(232, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(233, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(234, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(235, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(236, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(237, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(238, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(239, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(240, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(241, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(242, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(243, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(244, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(245, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(246, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(247, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(248, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(249, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(250, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(251, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(252, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(253, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(254, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(255, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(256, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(257, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(258, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(259, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(260, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(261, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(262, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(263, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(264, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(265, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(266, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(267, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(268, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(269, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(270, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(271, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(272, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(273, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(274, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(275, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(276, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(277, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(278, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(279, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(280, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(281, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(282, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(283, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(284, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(285, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(286, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(287, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(288, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(289, 'mod/lti:grade', 'write', 70, 'mod_lti', 8),
(290, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
(291, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(292, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(293, 'mod/page:view', 'read', 70, 'mod_page', 0),
(294, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(295, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(296, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(297, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(298, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(299, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(300, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(301, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(302, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 20),
(303, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(304, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(305, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(306, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(307, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(308, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(309, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(310, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(311, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(312, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(313, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(314, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(315, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(316, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(317, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(318, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(319, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(320, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(321, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(322, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(323, 'mod/url:view', 'read', 70, 'mod_url', 0),
(324, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(325, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(326, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(327, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(328, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(329, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(330, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(331, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(332, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(333, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(334, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(335, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(336, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(337, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(338, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(339, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(340, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(341, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(342, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(343, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(344, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(345, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(346, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(347, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(348, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(349, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(350, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(351, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(352, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(353, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(354, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(355, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(356, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(357, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(358, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(359, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(360, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(361, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(362, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(363, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(364, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(365, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(366, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(367, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(368, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(369, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(370, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(371, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(372, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(373, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(374, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(375, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(376, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(377, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(378, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(379, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
(380, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(381, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(382, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(383, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(384, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(385, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(386, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(387, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(388, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(389, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(390, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(391, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(392, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(393, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(394, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(395, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
(396, 'block/course_overview:addinstance', 'write', 80, 'block_course_overview', 20),
(397, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(398, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(399, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(400, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(401, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(402, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(403, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(404, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(405, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(406, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(407, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(408, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(409, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(410, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(411, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(412, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(413, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(414, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(415, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(416, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(417, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(418, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(419, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(420, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(421, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(422, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(423, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(424, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(425, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(426, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(427, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(428, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(429, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(430, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(431, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(432, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(433, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(434, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(435, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(436, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(437, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(438, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(439, 'report/completion:view', 'read', 50, 'report_completion', 8),
(440, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(441, 'report/log:view', 'read', 50, 'report_log', 8),
(442, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(443, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(444, 'report/outline:view', 'read', 50, 'report_outline', 8),
(445, 'report/participation:view', 'read', 50, 'report_participation', 8),
(446, 'report/performance:view', 'read', 10, 'report_performance', 2),
(447, 'report/progress:view', 'read', 50, 'report_progress', 8),
(448, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(449, 'report/security:view', 'read', 10, 'report_security', 2),
(450, 'report/stats:view', 'read', 50, 'report_stats', 8),
(451, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(452, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(453, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(454, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(455, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(456, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(457, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(458, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(459, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(460, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(461, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(462, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(463, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(464, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(465, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(466, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(467, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(468, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(469, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(470, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(471, 'repository/areafiles:view', 'read', 70, 'repository_areafiles', 0),
(472, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(473, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(474, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(475, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(476, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(477, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(478, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(479, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(480, 'repository/local:view', 'read', 70, 'repository_local', 0),
(481, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(482, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(483, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(484, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(485, 'repository/skydrive:view', 'read', 70, 'repository_skydrive', 0),
(486, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(487, 'repository/url:view', 'read', 70, 'repository_url', 0),
(488, 'repository/user:view', 'read', 70, 'repository_user', 0),
(489, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(490, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(491, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(492, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(493, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(494, 'tool/uploaduser:uploaduserpictures', 'write', 10, 'tool_uploaduser', 16),
(495, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(496, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(497, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(498, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(499, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(500, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat`
--

CREATE TABLE `mdl_chat` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat_messages`
--

CREATE TABLE `mdl_chat_messages` (
  `id` bigint(10) NOT NULL,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat_messages_current`
--

CREATE TABLE `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat_users`
--

CREATE TABLE `mdl_chat_users` (
  `id` bigint(10) NOT NULL,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_choice`
--

CREATE TABLE `mdl_choice` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_choice_answers`
--

CREATE TABLE `mdl_choice_answers` (
  `id` bigint(10) NOT NULL,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_choice_options`
--

CREATE TABLE `mdl_choice_options` (
  `id` bigint(10) NOT NULL,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cohort`
--

CREATE TABLE `mdl_cohort` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cohort_members`
--

CREATE TABLE `mdl_cohort_members` (
  `id` bigint(10) NOT NULL,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_comments`
--

CREATE TABLE `mdl_comments` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_config`
--

CREATE TABLE `mdl_config` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables';

--
-- Volcado de datos para la tabla `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'standard'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', '0Pl1VKcYMeh4nRjezPEmJ2Kb9diStpd4localhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '1465851573'),
(21, 'jsrev', '1465851573'),
(22, 'gdversion', '2'),
(23, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(24, 'version', '2013111811.01'),
(25, 'enableoutcomes', '0'),
(26, 'usecomments', '1'),
(27, 'usetags', '1'),
(28, 'enablenotes', '1'),
(29, 'enableportfolios', '0'),
(30, 'enablewebservices', '0'),
(31, 'messaging', '1'),
(32, 'messaginghidereadnotifications', '0'),
(33, 'messagingdeletereadnotificationsdelay', '604800'),
(34, 'messagingallowemailoverride', '0'),
(35, 'enablestats', '0'),
(36, 'enablerssfeeds', '0'),
(37, 'enableblogs', '1'),
(38, 'enablecompletion', '0'),
(39, 'completiondefault', '1'),
(40, 'enableavailability', '0'),
(41, 'enableplagiarism', '0'),
(42, 'enablebadges', '1'),
(43, 'autologinguests', '0'),
(44, 'hiddenuserfields', ''),
(45, 'showuseridentity', 'email'),
(46, 'fullnamedisplay', 'language'),
(47, 'maxusersperpage', '100'),
(48, 'enablegravatar', '0'),
(49, 'gravatardefaulturl', 'mm'),
(50, 'enablecourserequests', '0'),
(51, 'defaultrequestcategory', '1'),
(52, 'requestcategoryselection', '0'),
(53, 'courserequestnotify', ''),
(54, 'grade_profilereport', 'user'),
(55, 'grade_aggregationposition', '1'),
(56, 'grade_includescalesinaggregation', '1'),
(57, 'grade_hiddenasdate', '0'),
(58, 'gradepublishing', '0'),
(59, 'grade_export_displaytype', '1'),
(60, 'grade_export_decimalpoints', '2'),
(61, 'grade_navmethod', '0'),
(62, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(63, 'grade_export_customprofilefields', ''),
(64, 'recovergradesdefault', '0'),
(65, 'gradeexport', ''),
(66, 'unlimitedgrades', '0'),
(67, 'grade_hideforcedsettings', '1'),
(68, 'grade_aggregation', '11'),
(69, 'grade_aggregation_flag', '0'),
(70, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(71, 'grade_aggregateonlygraded', '1'),
(72, 'grade_aggregateonlygraded_flag', '2'),
(73, 'grade_aggregateoutcomes', '0'),
(74, 'grade_aggregateoutcomes_flag', '2'),
(75, 'grade_aggregatesubcats', '0'),
(76, 'grade_aggregatesubcats_flag', '2'),
(77, 'grade_keephigh', '0'),
(78, 'grade_keephigh_flag', '3'),
(79, 'grade_droplow', '0'),
(80, 'grade_droplow_flag', '2'),
(81, 'grade_displaytype', '1'),
(82, 'grade_decimalpoints', '2'),
(83, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(84, 'grade_report_studentsperpage', '100'),
(85, 'grade_report_showonlyactiveenrol', '1'),
(86, 'grade_report_quickgrading', '1'),
(87, 'grade_report_showquickfeedback', '0'),
(88, 'grade_report_fixedstudents', '0'),
(89, 'grade_report_meanselection', '1'),
(90, 'grade_report_enableajax', '0'),
(91, 'grade_report_showcalculations', '0'),
(92, 'grade_report_showeyecons', '0'),
(93, 'grade_report_showaverages', '1'),
(94, 'grade_report_showlocks', '0'),
(95, 'grade_report_showranges', '0'),
(96, 'grade_report_showanalysisicon', '1'),
(97, 'grade_report_showuserimage', '1'),
(98, 'grade_report_showactivityicons', '1'),
(99, 'grade_report_shownumberofgrades', '0'),
(100, 'grade_report_averagesdisplaytype', 'inherit'),
(101, 'grade_report_rangesdisplaytype', 'inherit'),
(102, 'grade_report_averagesdecimalpoints', 'inherit'),
(103, 'grade_report_rangesdecimalpoints', 'inherit'),
(104, 'grade_report_overview_showrank', '0'),
(105, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(106, 'grade_report_user_showrank', '0'),
(107, 'grade_report_user_showpercentage', '1'),
(108, 'grade_report_user_showgrade', '1'),
(109, 'grade_report_user_showfeedback', '1'),
(110, 'grade_report_user_showrange', '1'),
(111, 'grade_report_user_showweight', '0'),
(112, 'grade_report_user_showaverage', '0'),
(113, 'grade_report_user_showlettergrade', '0'),
(114, 'grade_report_user_rangedecimals', '0'),
(115, 'grade_report_user_showhiddenitems', '1'),
(116, 'grade_report_user_showtotalsifcontainhidden', '0'),
(117, 'badges_defaultissuername', ''),
(118, 'badges_defaultissuercontact', ''),
(119, 'badges_badgesalt', 'badges1465851455'),
(120, 'badges_allowexternalbackpack', '1'),
(121, 'badges_allowcoursebadges', '1'),
(122, 'timezone', '99'),
(123, 'forcetimezone', '99'),
(124, 'country', '0'),
(125, 'defaultcity', ''),
(126, 'geoipfile', 'C:\\xampp\\moodledata/geoip/GeoLiteCity.dat'),
(127, 'googlemapkey3', ''),
(128, 'allcountrycodes', ''),
(129, 'autolang', '1'),
(130, 'lang', 'en'),
(131, 'langmenu', '1'),
(132, 'langlist', ''),
(133, 'langrev', '1465851573'),
(134, 'langcache', '1'),
(135, 'langstringcache', '1'),
(136, 'locale', ''),
(137, 'latinexcelexport', '0'),
(139, 'authpreventaccountcreation', '0'),
(140, 'loginpageautofocus', '0'),
(141, 'guestloginbutton', '1'),
(142, 'alternateloginurl', ''),
(143, 'forgottenpasswordurl', ''),
(144, 'auth_instructions', ''),
(145, 'allowemailaddresses', ''),
(146, 'denyemailaddresses', ''),
(147, 'verifychangedemail', '1'),
(148, 'recaptchapublickey', ''),
(149, 'recaptchaprivatekey', ''),
(150, 'sitedefaultlicense', 'allrightsreserved'),
(151, 'cachetext', '60'),
(152, 'filteruploadedfiles', '0'),
(153, 'filtermatchoneperpage', '0'),
(154, 'filtermatchonepertext', '0'),
(155, 'portfolio_moderate_filesize_threshold', '1048576'),
(156, 'portfolio_high_filesize_threshold', '5242880'),
(157, 'portfolio_moderate_db_threshold', '20'),
(158, 'portfolio_high_db_threshold', '50'),
(159, 'repositorycacheexpire', '120'),
(160, 'repositoryallowexternallinks', '1'),
(161, 'legacyfilesinnewcourses', '0'),
(162, 'legacyfilesaddallowed', '1'),
(163, 'mobilecssurl', ''),
(164, 'enablewsdocumentation', '0'),
(165, 'allowbeforeblock', '0'),
(166, 'allowedip', ''),
(167, 'blockedip', ''),
(168, 'protectusernames', '1'),
(169, 'forcelogin', '0'),
(170, 'forceloginforprofiles', '1'),
(171, 'forceloginforprofileimage', '0'),
(172, 'opentogoogle', '0'),
(173, 'maxbytes', '0'),
(174, 'userquota', '104857600'),
(175, 'allowobjectembed', '0'),
(176, 'enabletrusttext', '0'),
(177, 'maxeditingtime', '1800'),
(178, 'extendedusernamechars', '0'),
(179, 'sitepolicy', ''),
(180, 'sitepolicyguest', ''),
(181, 'keeptagnamecase', '1'),
(182, 'profilesforenrolledusersonly', '1'),
(183, 'cronclionly', '0'),
(184, 'cronremotepassword', ''),
(185, 'lockoutthreshold', '0'),
(186, 'lockoutwindow', '1800'),
(187, 'lockoutduration', '1800'),
(188, 'passwordpolicy', '1'),
(189, 'minpasswordlength', '8'),
(190, 'minpassworddigits', '1'),
(191, 'minpasswordlower', '1'),
(192, 'minpasswordupper', '1'),
(193, 'minpasswordnonalphanum', '1'),
(194, 'maxconsecutiveidentchars', '0'),
(195, 'pwresettime', '1800'),
(196, 'groupenrolmentkeypolicy', '1'),
(197, 'disableuserimages', '0'),
(198, 'emailchangeconfirmation', '1'),
(199, 'rememberusername', '2'),
(200, 'strictformsrequired', '0'),
(201, 'loginhttps', '0'),
(202, 'cookiesecure', '0'),
(203, 'cookiehttponly', '0'),
(204, 'allowframembedding', '0'),
(205, 'loginpasswordautocomplete', '0'),
(206, 'displayloginfailures', ''),
(207, 'notifyloginfailures', ''),
(208, 'notifyloginthreshold', '10'),
(209, 'runclamonupload', '0'),
(210, 'pathtoclam', ''),
(211, 'quarantinedir', ''),
(212, 'clamfailureonupload', 'donothing'),
(213, 'themelist', ''),
(214, 'themedesignermode', '0'),
(215, 'allowuserthemes', '0'),
(216, 'allowcoursethemes', '0'),
(217, 'allowcategorythemes', '0'),
(218, 'allowthemechangeonurl', '0'),
(219, 'allowuserblockhiding', '1'),
(220, 'allowblockstodock', '1'),
(221, 'custommenuitems', ''),
(222, 'enabledevicedetection', '1'),
(223, 'devicedetectregex', '[]'),
(224, 'calendartype', 'gregorian'),
(225, 'calendar_adminseesall', '0'),
(226, 'calendar_site_timeformat', '0'),
(227, 'calendar_startwday', '0'),
(228, 'calendar_weekend', '65'),
(229, 'calendar_lookahead', '21'),
(230, 'calendar_maxevents', '10'),
(231, 'enablecalendarexport', '1'),
(232, 'calendar_customexport', '1'),
(233, 'calendar_exportlookahead', '365'),
(234, 'calendar_exportlookback', '5'),
(235, 'calendar_exportsalt', 'myTsmdSuekmshYUM0sBvyOQFLgDWMEIWJglAy4u1J8ZPWcBLVJHrwRjl1Z7j'),
(236, 'calendar_showicalsource', '1'),
(237, 'useblogassociations', '1'),
(238, 'bloglevel', '4'),
(239, 'useexternalblogs', '1'),
(240, 'externalblogcrontime', '86400'),
(241, 'maxexternalblogsperuser', '1'),
(242, 'blogusecomments', '1'),
(243, 'blogshowcommentscount', '1'),
(244, 'defaulthomepage', '0'),
(245, 'allowguestmymoodle', '1'),
(246, 'navshowfullcoursenames', '0'),
(247, 'navshowcategories', '1'),
(248, 'navshowmycoursecategories', '0'),
(249, 'navshowallcourses', '0'),
(250, 'navsortmycoursessort', 'sortorder'),
(251, 'navcourselimit', '20'),
(252, 'usesitenameforsitepages', '0'),
(253, 'linkadmincategories', '0'),
(254, 'navshowfrontpagemods', '1'),
(255, 'navadduserpostslinks', '1'),
(256, 'formatstringstriptags', '1'),
(257, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(258, 'core_media_enable_youtube', '1'),
(259, 'core_media_enable_vimeo', '0'),
(260, 'core_media_enable_mp3', '1'),
(261, 'core_media_enable_flv', '1'),
(262, 'core_media_enable_swf', '1'),
(263, 'core_media_enable_html5audio', '1'),
(264, 'core_media_enable_html5video', '1'),
(265, 'core_media_enable_qt', '1'),
(266, 'core_media_enable_wmp', '1'),
(267, 'core_media_enable_rm', '1'),
(268, 'docroot', 'http://docs.moodle.org'),
(269, 'doctonewwindow', '0'),
(270, 'courselistshortnames', '0'),
(271, 'coursesperpage', '20'),
(272, 'courseswithsummarieslimit', '10'),
(273, 'courseoverviewfileslimit', '1'),
(274, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(275, 'enableajax', '1'),
(276, 'useexternalyui', '0'),
(277, 'yuicomboloading', '1'),
(278, 'cachejs', '1'),
(279, 'modchooserdefault', '1'),
(280, 'modeditingmenu', '1'),
(281, 'blockeditingmenu', '1'),
(282, 'additionalhtmlhead', ''),
(283, 'additionalhtmltopofbody', ''),
(284, 'additionalhtmlfooter', ''),
(285, 'pathtodu', ''),
(286, 'aspellpath', ''),
(287, 'pathtodot', ''),
(288, 'supportpage', ''),
(289, 'dbsessions', '0'),
(290, 'sessioncookie', ''),
(291, 'sessioncookiepath', ''),
(292, 'sessioncookiedomain', ''),
(293, 'statsfirstrun', 'none'),
(294, 'statsmaxruntime', '0'),
(295, 'statsruntimedays', '31'),
(296, 'statsruntimestarthour', '0'),
(297, 'statsruntimestartminute', '0'),
(298, 'statsuserthreshold', '0'),
(299, 'slasharguments', '1'),
(300, 'getremoteaddrconf', '0'),
(301, 'proxyhost', ''),
(302, 'proxyport', '0'),
(303, 'proxytype', 'HTTP'),
(304, 'proxyuser', ''),
(305, 'proxypassword', ''),
(306, 'proxybypass', 'localhost, 127.0.0.1'),
(307, 'maintenance_enabled', '0'),
(308, 'maintenance_message', ''),
(309, 'deleteunconfirmed', '168'),
(310, 'deleteincompleteusers', '0'),
(311, 'logguests', '1'),
(312, 'loglifetime', '0'),
(313, 'disablegradehistory', '0'),
(314, 'gradehistorylifetime', '0'),
(315, 'extramemorylimit', '512M'),
(316, 'curlcache', '120'),
(317, 'curltimeoutkbitrate', '56'),
(318, 'updateautocheck', '1'),
(319, 'updateautodeploy', '0'),
(320, 'updateminmaturity', '200'),
(321, 'updatenotifybuilds', '0'),
(322, 'enablesafebrowserintegration', '0'),
(323, 'enablegroupmembersonly', '0'),
(324, 'dndallowtextandlinks', '0'),
(325, 'enablecssoptimiser', '0'),
(326, 'enabletgzbackups', '0'),
(327, 'debug', '0'),
(328, 'debugdisplay', '1'),
(329, 'debugsmtp', '0'),
(330, 'perfdebug', '7'),
(331, 'debugstringids', '0'),
(332, 'debugvalidators', '0'),
(333, 'debugpageinfo', '0'),
(334, 'profilingenabled', '0'),
(335, 'profilingincluded', ''),
(336, 'profilingexcluded', ''),
(337, 'profilingautofrec', '0'),
(338, 'profilingallowme', '0'),
(339, 'profilingallowall', '0'),
(340, 'profilinglifetime', '1440'),
(341, 'profilingimportprefix', '(I)'),
(342, 'release', '2.6.11+ (Build: 20150619)'),
(343, 'branch', '26'),
(344, 'localcachedirpurged', '1465851573'),
(345, 'allversionshash', 'eabff10677de281afd9da82f8b9893a9ff4fd295'),
(347, 'notloggedinroleid', '6'),
(348, 'guestroleid', '6'),
(349, 'defaultuserroleid', '7'),
(350, 'creatornewroleid', '3'),
(351, 'restorernewroleid', '3'),
(352, 'gradebookroles', '5'),
(353, 'assignment_maxbytes', '1048576'),
(354, 'assignment_itemstocount', '1'),
(355, 'assignment_showrecentsubmissions', '1'),
(356, 'chat_method', 'ajax'),
(357, 'chat_refresh_userlist', '10'),
(358, 'chat_old_ping', '35'),
(359, 'chat_refresh_room', '5'),
(360, 'chat_normal_updatemode', 'jsupdate'),
(361, 'chat_serverhost', 'localhost'),
(362, 'chat_serverip', '127.0.0.1'),
(363, 'chat_serverport', '9111'),
(364, 'chat_servermax', '100'),
(365, 'data_enablerssfeeds', '0'),
(366, 'feedback_allowfullanonymous', '0'),
(367, 'forum_displaymode', '3'),
(368, 'forum_replytouser', '1'),
(369, 'forum_shortpost', '300'),
(370, 'forum_longpost', '600'),
(371, 'forum_manydiscussions', '100'),
(372, 'forum_maxbytes', '512000'),
(373, 'forum_maxattachments', '9'),
(374, 'forum_trackingtype', '1'),
(375, 'forum_trackreadposts', '1'),
(376, 'forum_allowforcedreadtracking', '0'),
(377, 'forum_oldpostdays', '14'),
(378, 'forum_usermarksread', '0'),
(379, 'forum_cleanreadtime', '2'),
(380, 'digestmailtime', '17'),
(381, 'forum_enablerssfeeds', '0'),
(382, 'forum_enabletimedposts', '0'),
(383, 'glossary_entbypage', '10'),
(384, 'glossary_dupentries', '0'),
(385, 'glossary_allowcomments', '0'),
(386, 'glossary_linkbydefault', '1'),
(387, 'glossary_defaultapproval', '1'),
(388, 'glossary_enablerssfeeds', '0'),
(389, 'glossary_linkentries', '0'),
(390, 'glossary_casesensitive', '0'),
(391, 'glossary_fullmatch', '0'),
(392, 'lesson_slideshowwidth', '640'),
(393, 'lesson_slideshowheight', '480'),
(394, 'lesson_slideshowbgcolor', '#FFFFFF'),
(395, 'lesson_mediawidth', '640'),
(396, 'lesson_mediaheight', '480'),
(397, 'lesson_mediaclose', '0'),
(398, 'lesson_maxhighscores', '10'),
(399, 'lesson_maxanswers', '4'),
(400, 'lesson_defaultnextpage', '0'),
(401, 'block_course_list_adminview', 'all'),
(402, 'block_course_list_hideallcourseslink', '0'),
(403, 'block_html_allowcssclasses', '0'),
(404, 'block_online_users_timetosee', '5'),
(405, 'block_rss_client_num_entries', '5'),
(406, 'block_rss_client_timeout', '30'),
(407, 'block_tags_showcoursetags', '0'),
(408, 'smtphosts', ''),
(409, 'smtpsecure', ''),
(410, 'smtpuser', ''),
(411, 'smtppass', ''),
(412, 'smtpmaxbulk', '1'),
(413, 'noreplyaddress', 'noreply@localhost'),
(414, 'emailonlyfromnoreplyaddress', '0'),
(415, 'sitemailcharset', '0'),
(416, 'allowusermailcharset', '0'),
(417, 'allowattachments', '1'),
(418, 'mailnewline', 'LF'),
(419, 'jabberhost', ''),
(420, 'jabberserver', ''),
(421, 'jabberusername', ''),
(422, 'jabberpassword', ''),
(423, 'jabberport', '5222'),
(424, 'filter_censor_badwords', ''),
(425, 'filter_multilang_force_old', '0'),
(426, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(427, 'filter_tex_latexbackground', '#FFFFFF'),
(428, 'filter_tex_density', '120'),
(429, 'filter_tex_pathlatex', 'c:\\texmf\\miktex\\bin\\latex.exe'),
(430, 'filter_tex_pathdvips', 'c:\\texmf\\miktex\\bin\\dvips.exe'),
(431, 'filter_tex_pathconvert', 'c:\\imagemagick\\convert.exe'),
(432, 'filter_tex_convertformat', 'gif'),
(433, 'profileroles', '5,4,3'),
(434, 'coursecontact', '3'),
(435, 'frontpage', '6'),
(436, 'frontpageloggedin', '6'),
(437, 'maxcategorydepth', '2'),
(438, 'frontpagecourselimit', '200'),
(439, 'commentsperpage', '15'),
(440, 'defaultfrontpageroleid', '8'),
(441, 'supportname', 'Admin User'),
(442, 'supportemail', 'testadmin@gmail.com'),
(443, 'registerauth', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_config_log`
--

CREATE TABLE `mdl_config_log` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  `oldvalue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI';

--
-- Volcado de datos para la tabla `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1465851465, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1465851466, NULL, 'usecomments', '1', NULL),
(3, 0, 1465851466, NULL, 'usetags', '1', NULL),
(4, 0, 1465851466, NULL, 'enablenotes', '1', NULL),
(5, 0, 1465851466, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1465851466, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1465851466, NULL, 'messaging', '1', NULL),
(8, 0, 1465851466, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1465851466, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1465851466, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1465851466, NULL, 'enablestats', '0', NULL),
(12, 0, 1465851466, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1465851466, NULL, 'enableblogs', '1', NULL),
(14, 0, 1465851466, NULL, 'enablecompletion', '0', NULL),
(15, 0, 1465851466, NULL, 'completiondefault', '1', NULL),
(16, 0, 1465851466, NULL, 'enableavailability', '0', NULL),
(17, 0, 1465851466, NULL, 'enableplagiarism', '0', NULL),
(18, 0, 1465851466, NULL, 'enablebadges', '1', NULL),
(19, 0, 1465851466, NULL, 'autologinguests', '0', NULL),
(20, 0, 1465851466, NULL, 'hiddenuserfields', '', NULL),
(21, 0, 1465851466, NULL, 'showuseridentity', 'email', NULL),
(22, 0, 1465851466, NULL, 'fullnamedisplay', 'language', NULL),
(23, 0, 1465851466, NULL, 'maxusersperpage', '100', NULL),
(24, 0, 1465851466, NULL, 'enablegravatar', '0', NULL),
(25, 0, 1465851466, NULL, 'gravatardefaulturl', 'mm', NULL),
(26, 0, 1465851466, 'moodlecourse', 'visible', '1', NULL),
(27, 0, 1465851466, 'moodlecourse', 'format', 'weeks', NULL),
(28, 0, 1465851466, 'moodlecourse', 'maxsections', '52', NULL),
(29, 0, 1465851466, 'moodlecourse', 'numsections', '10', NULL),
(30, 0, 1465851466, 'moodlecourse', 'hiddensections', '0', NULL),
(31, 0, 1465851466, 'moodlecourse', 'coursedisplay', '0', NULL),
(32, 0, 1465851466, 'moodlecourse', 'lang', '', NULL),
(33, 0, 1465851466, 'moodlecourse', 'newsitems', '5', NULL),
(34, 0, 1465851466, 'moodlecourse', 'showgrades', '1', NULL),
(35, 0, 1465851466, 'moodlecourse', 'showreports', '0', NULL),
(36, 0, 1465851466, 'moodlecourse', 'maxbytes', '0', NULL),
(37, 0, 1465851466, 'moodlecourse', 'enablecompletion', '0', NULL),
(38, 0, 1465851466, 'moodlecourse', 'groupmode', '0', NULL),
(39, 0, 1465851466, 'moodlecourse', 'groupmodeforce', '0', NULL),
(40, 0, 1465851466, NULL, 'enablecourserequests', '0', NULL),
(41, 0, 1465851466, NULL, 'defaultrequestcategory', '1', NULL),
(42, 0, 1465851466, NULL, 'requestcategoryselection', '0', NULL),
(43, 0, 1465851466, NULL, 'courserequestnotify', '', NULL),
(44, 0, 1465851466, 'backup', 'loglifetime', '30', NULL),
(45, 0, 1465851466, 'backup', 'backup_general_users', '1', NULL),
(46, 0, 1465851466, 'backup', 'backup_general_users_locked', '', NULL),
(47, 0, 1465851466, 'backup', 'backup_general_anonymize', '0', NULL),
(48, 0, 1465851466, 'backup', 'backup_general_anonymize_locked', '', NULL),
(49, 0, 1465851466, 'backup', 'backup_general_role_assignments', '1', NULL),
(50, 0, 1465851466, 'backup', 'backup_general_role_assignments_locked', '', NULL),
(51, 0, 1465851466, 'backup', 'backup_general_activities', '1', NULL),
(52, 0, 1465851466, 'backup', 'backup_general_activities_locked', '', NULL),
(53, 0, 1465851466, 'backup', 'backup_general_blocks', '1', NULL),
(54, 0, 1465851466, 'backup', 'backup_general_blocks_locked', '', NULL),
(55, 0, 1465851466, 'backup', 'backup_general_filters', '1', NULL),
(56, 0, 1465851466, 'backup', 'backup_general_filters_locked', '', NULL),
(57, 0, 1465851466, 'backup', 'backup_general_comments', '1', NULL),
(58, 0, 1465851466, 'backup', 'backup_general_comments_locked', '', NULL),
(59, 0, 1465851467, 'backup', 'backup_general_badges', '1', NULL),
(60, 0, 1465851467, 'backup', 'backup_general_badges_locked', '', NULL),
(61, 0, 1465851467, 'backup', 'backup_general_userscompletion', '1', NULL),
(62, 0, 1465851467, 'backup', 'backup_general_userscompletion_locked', '', NULL),
(63, 0, 1465851467, 'backup', 'backup_general_logs', '0', NULL),
(64, 0, 1465851467, 'backup', 'backup_general_logs_locked', '', NULL),
(65, 0, 1465851467, 'backup', 'backup_general_histories', '0', NULL),
(66, 0, 1465851467, 'backup', 'backup_general_histories_locked', '', NULL),
(67, 0, 1465851467, 'backup', 'backup_general_questionbank', '1', NULL),
(68, 0, 1465851467, 'backup', 'backup_general_questionbank_locked', '', NULL),
(69, 0, 1465851467, 'backup', 'import_general_maxresults', '10', NULL),
(70, 0, 1465851467, 'backup', 'backup_auto_active', '0', NULL),
(71, 0, 1465851467, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(72, 0, 1465851467, 'backup', 'backup_auto_hour', '0', NULL),
(73, 0, 1465851467, 'backup', 'backup_auto_minute', '0', NULL),
(74, 0, 1465851467, 'backup', 'backup_auto_storage', '0', NULL),
(75, 0, 1465851467, 'backup', 'backup_auto_destination', '', NULL),
(76, 0, 1465851467, 'backup', 'backup_auto_keep', '1', NULL),
(77, 0, 1465851467, 'backup', 'backup_shortname', '0', NULL),
(78, 0, 1465851467, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(79, 0, 1465851467, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(80, 0, 1465851467, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(81, 0, 1465851467, 'backup', 'backup_auto_users', '1', NULL),
(82, 0, 1465851467, 'backup', 'backup_auto_role_assignments', '1', NULL),
(83, 0, 1465851467, 'backup', 'backup_auto_activities', '1', NULL),
(84, 0, 1465851467, 'backup', 'backup_auto_blocks', '1', NULL),
(85, 0, 1465851467, 'backup', 'backup_auto_filters', '1', NULL),
(86, 0, 1465851467, 'backup', 'backup_auto_comments', '1', NULL),
(87, 0, 1465851467, 'backup', 'backup_auto_badges', '1', NULL),
(88, 0, 1465851467, 'backup', 'backup_auto_userscompletion', '1', NULL),
(89, 0, 1465851467, 'backup', 'backup_auto_logs', '0', NULL),
(90, 0, 1465851467, 'backup', 'backup_auto_histories', '0', NULL),
(91, 0, 1465851467, 'backup', 'backup_auto_questionbank', '1', NULL),
(92, 0, 1465851468, NULL, 'grade_profilereport', 'user', NULL),
(93, 0, 1465851468, NULL, 'grade_aggregationposition', '1', NULL),
(94, 0, 1465851468, NULL, 'grade_includescalesinaggregation', '1', NULL),
(95, 0, 1465851468, NULL, 'grade_hiddenasdate', '0', NULL),
(96, 0, 1465851468, NULL, 'gradepublishing', '0', NULL),
(97, 0, 1465851468, NULL, 'grade_export_displaytype', '1', NULL),
(98, 0, 1465851468, NULL, 'grade_export_decimalpoints', '2', NULL),
(99, 0, 1465851468, NULL, 'grade_navmethod', '0', NULL),
(100, 0, 1465851468, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(101, 0, 1465851468, NULL, 'grade_export_customprofilefields', '', NULL),
(102, 0, 1465851468, NULL, 'recovergradesdefault', '0', NULL),
(103, 0, 1465851468, NULL, 'gradeexport', '', NULL),
(104, 0, 1465851468, NULL, 'unlimitedgrades', '0', NULL),
(105, 0, 1465851468, NULL, 'grade_hideforcedsettings', '1', NULL),
(106, 0, 1465851468, NULL, 'grade_aggregation', '11', NULL),
(107, 0, 1465851468, NULL, 'grade_aggregation_flag', '0', NULL),
(108, 0, 1465851468, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(109, 0, 1465851468, NULL, 'grade_aggregateonlygraded', '1', NULL),
(110, 0, 1465851468, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(111, 0, 1465851468, NULL, 'grade_aggregateoutcomes', '0', NULL),
(112, 0, 1465851468, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(113, 0, 1465851468, NULL, 'grade_aggregatesubcats', '0', NULL),
(114, 0, 1465851468, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(115, 0, 1465851468, NULL, 'grade_keephigh', '0', NULL),
(116, 0, 1465851468, NULL, 'grade_keephigh_flag', '3', NULL),
(117, 0, 1465851468, NULL, 'grade_droplow', '0', NULL),
(118, 0, 1465851468, NULL, 'grade_droplow_flag', '2', NULL),
(119, 0, 1465851468, NULL, 'grade_displaytype', '1', NULL),
(120, 0, 1465851468, NULL, 'grade_decimalpoints', '2', NULL),
(121, 0, 1465851468, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(122, 0, 1465851468, NULL, 'grade_report_studentsperpage', '100', NULL),
(123, 0, 1465851468, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(124, 0, 1465851468, NULL, 'grade_report_quickgrading', '1', NULL),
(125, 0, 1465851468, NULL, 'grade_report_showquickfeedback', '0', NULL),
(126, 0, 1465851468, NULL, 'grade_report_fixedstudents', '0', NULL),
(127, 0, 1465851468, NULL, 'grade_report_meanselection', '1', NULL),
(128, 0, 1465851468, NULL, 'grade_report_enableajax', '0', NULL),
(129, 0, 1465851468, NULL, 'grade_report_showcalculations', '0', NULL),
(130, 0, 1465851468, NULL, 'grade_report_showeyecons', '0', NULL),
(131, 0, 1465851468, NULL, 'grade_report_showaverages', '1', NULL),
(132, 0, 1465851468, NULL, 'grade_report_showlocks', '0', NULL),
(133, 0, 1465851468, NULL, 'grade_report_showranges', '0', NULL),
(134, 0, 1465851468, NULL, 'grade_report_showanalysisicon', '1', NULL),
(135, 0, 1465851468, NULL, 'grade_report_showuserimage', '1', NULL),
(136, 0, 1465851468, NULL, 'grade_report_showactivityicons', '1', NULL),
(137, 0, 1465851468, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(138, 0, 1465851468, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(139, 0, 1465851468, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(140, 0, 1465851468, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(141, 0, 1465851468, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(142, 0, 1465851468, NULL, 'grade_report_overview_showrank', '0', NULL),
(143, 0, 1465851468, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(144, 0, 1465851468, NULL, 'grade_report_user_showrank', '0', NULL),
(145, 0, 1465851468, NULL, 'grade_report_user_showpercentage', '1', NULL),
(146, 0, 1465851468, NULL, 'grade_report_user_showgrade', '1', NULL),
(147, 0, 1465851468, NULL, 'grade_report_user_showfeedback', '1', NULL),
(148, 0, 1465851468, NULL, 'grade_report_user_showrange', '1', NULL),
(149, 0, 1465851468, NULL, 'grade_report_user_showweight', '0', NULL),
(150, 0, 1465851468, NULL, 'grade_report_user_showaverage', '0', NULL),
(151, 0, 1465851468, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(152, 0, 1465851468, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(153, 0, 1465851468, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(154, 0, 1465851468, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(155, 0, 1465851468, NULL, 'badges_defaultissuername', '', NULL),
(156, 0, 1465851468, NULL, 'badges_defaultissuercontact', '', NULL),
(157, 0, 1465851468, NULL, 'badges_badgesalt', 'badges1465851455', NULL),
(158, 0, 1465851468, NULL, 'badges_allowexternalbackpack', '1', NULL),
(159, 0, 1465851468, NULL, 'badges_allowcoursebadges', '1', NULL),
(160, 0, 1465851468, NULL, 'timezone', '99', NULL),
(161, 0, 1465851468, NULL, 'forcetimezone', '99', NULL),
(162, 0, 1465851469, NULL, 'country', '0', NULL),
(163, 0, 1465851469, NULL, 'defaultcity', '', NULL),
(164, 0, 1465851469, NULL, 'geoipfile', 'C:\\xampp\\moodledata/geoip/GeoLiteCity.dat', NULL),
(165, 0, 1465851469, NULL, 'googlemapkey3', '', NULL),
(166, 0, 1465851469, NULL, 'allcountrycodes', '', NULL),
(167, 0, 1465851469, NULL, 'autolang', '1', NULL),
(168, 0, 1465851469, NULL, 'lang', 'en', NULL),
(169, 0, 1465851469, NULL, 'langmenu', '1', NULL),
(170, 0, 1465851469, NULL, 'langlist', '', NULL),
(171, 0, 1465851469, NULL, 'langcache', '1', NULL),
(172, 0, 1465851469, NULL, 'langstringcache', '1', NULL),
(173, 0, 1465851469, NULL, 'locale', '', NULL),
(174, 0, 1465851469, NULL, 'latinexcelexport', '0', NULL),
(175, 0, 1465851469, NULL, 'registerauth', '', NULL),
(176, 0, 1465851469, NULL, 'authpreventaccountcreation', '0', NULL),
(177, 0, 1465851469, NULL, 'loginpageautofocus', '0', NULL),
(178, 0, 1465851469, NULL, 'guestloginbutton', '1', NULL),
(179, 0, 1465851469, NULL, 'alternateloginurl', '', NULL),
(180, 0, 1465851469, NULL, 'forgottenpasswordurl', '', NULL),
(181, 0, 1465851469, NULL, 'auth_instructions', '', NULL),
(182, 0, 1465851469, NULL, 'allowemailaddresses', '', NULL),
(183, 0, 1465851469, NULL, 'denyemailaddresses', '', NULL),
(184, 0, 1465851469, NULL, 'verifychangedemail', '1', NULL),
(185, 0, 1465851469, NULL, 'recaptchapublickey', '', NULL),
(186, 0, 1465851469, NULL, 'recaptchaprivatekey', '', NULL),
(187, 0, 1465851469, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(188, 0, 1465851469, NULL, 'cachetext', '60', NULL),
(189, 0, 1465851469, NULL, 'filteruploadedfiles', '0', NULL),
(190, 0, 1465851469, NULL, 'filtermatchoneperpage', '0', NULL),
(191, 0, 1465851469, NULL, 'filtermatchonepertext', '0', NULL),
(192, 0, 1465851469, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(193, 0, 1465851469, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(194, 0, 1465851469, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(195, 0, 1465851469, NULL, 'portfolio_high_db_threshold', '50', NULL),
(196, 0, 1465851469, NULL, 'repositorycacheexpire', '120', NULL),
(197, 0, 1465851469, NULL, 'repositoryallowexternallinks', '1', NULL),
(198, 0, 1465851469, NULL, 'legacyfilesinnewcourses', '0', NULL),
(199, 0, 1465851469, NULL, 'legacyfilesaddallowed', '1', NULL),
(200, 0, 1465851469, NULL, 'mobilecssurl', '', NULL),
(201, 0, 1465851469, NULL, 'enablewsdocumentation', '0', NULL),
(202, 0, 1465851469, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(203, 0, 1465851469, 'question_preview', 'correctness', '1', NULL),
(204, 0, 1465851469, 'question_preview', 'marks', '2', NULL),
(205, 0, 1465851469, 'question_preview', 'markdp', '2', NULL),
(206, 0, 1465851469, 'question_preview', 'feedback', '1', NULL),
(207, 0, 1465851469, 'question_preview', 'generalfeedback', '1', NULL),
(208, 0, 1465851469, 'question_preview', 'rightanswer', '1', NULL),
(209, 0, 1465851469, 'question_preview', 'history', '0', NULL),
(210, 0, 1465851469, 'cachestore_memcache', 'testservers', '', NULL),
(211, 0, 1465851470, 'cachestore_memcached', 'testservers', '', NULL),
(212, 0, 1465851470, 'cachestore_mongodb', 'testserver', '', NULL),
(213, 0, 1465851470, NULL, 'allowbeforeblock', '0', NULL),
(214, 0, 1465851470, NULL, 'allowedip', '', NULL),
(215, 0, 1465851470, NULL, 'blockedip', '', NULL),
(216, 0, 1465851470, NULL, 'protectusernames', '1', NULL),
(217, 0, 1465851470, NULL, 'forcelogin', '0', NULL),
(218, 0, 1465851470, NULL, 'forceloginforprofiles', '1', NULL),
(219, 0, 1465851470, NULL, 'forceloginforprofileimage', '0', NULL),
(220, 0, 1465851470, NULL, 'opentogoogle', '0', NULL),
(221, 0, 1465851470, NULL, 'maxbytes', '0', NULL),
(222, 0, 1465851470, NULL, 'userquota', '104857600', NULL),
(223, 0, 1465851470, NULL, 'allowobjectembed', '0', NULL),
(224, 0, 1465851470, NULL, 'enabletrusttext', '0', NULL),
(225, 0, 1465851470, NULL, 'maxeditingtime', '1800', NULL),
(226, 0, 1465851470, NULL, 'extendedusernamechars', '0', NULL),
(227, 0, 1465851470, NULL, 'sitepolicy', '', NULL),
(228, 0, 1465851470, NULL, 'sitepolicyguest', '', NULL),
(229, 0, 1465851470, NULL, 'keeptagnamecase', '1', NULL),
(230, 0, 1465851470, NULL, 'profilesforenrolledusersonly', '1', NULL),
(231, 0, 1465851470, NULL, 'cronclionly', '0', NULL),
(232, 0, 1465851470, NULL, 'cronremotepassword', '', NULL),
(233, 0, 1465851470, NULL, 'lockoutthreshold', '0', NULL),
(234, 0, 1465851470, NULL, 'lockoutwindow', '1800', NULL),
(235, 0, 1465851470, NULL, 'lockoutduration', '1800', NULL),
(236, 0, 1465851470, NULL, 'passwordpolicy', '1', NULL),
(237, 0, 1465851470, NULL, 'minpasswordlength', '8', NULL),
(238, 0, 1465851470, NULL, 'minpassworddigits', '1', NULL),
(239, 0, 1465851470, NULL, 'minpasswordlower', '1', NULL),
(240, 0, 1465851470, NULL, 'minpasswordupper', '1', NULL),
(241, 0, 1465851470, NULL, 'minpasswordnonalphanum', '1', NULL),
(242, 0, 1465851470, NULL, 'maxconsecutiveidentchars', '0', NULL),
(243, 0, 1465851470, NULL, 'pwresettime', '1800', NULL),
(244, 0, 1465851470, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(245, 0, 1465851470, NULL, 'disableuserimages', '0', NULL),
(246, 0, 1465851470, NULL, 'emailchangeconfirmation', '1', NULL),
(247, 0, 1465851470, NULL, 'rememberusername', '2', NULL),
(248, 0, 1465851470, NULL, 'strictformsrequired', '0', NULL),
(249, 0, 1465851470, NULL, 'loginhttps', '0', NULL),
(250, 0, 1465851470, NULL, 'cookiesecure', '0', NULL),
(251, 0, 1465851470, NULL, 'cookiehttponly', '0', NULL),
(252, 0, 1465851470, NULL, 'allowframembedding', '0', NULL),
(253, 0, 1465851470, NULL, 'loginpasswordautocomplete', '0', NULL),
(254, 0, 1465851470, NULL, 'displayloginfailures', '', NULL),
(255, 0, 1465851470, NULL, 'notifyloginfailures', '', NULL),
(256, 0, 1465851470, NULL, 'notifyloginthreshold', '10', NULL),
(257, 0, 1465851470, NULL, 'runclamonupload', '0', NULL),
(258, 0, 1465851470, NULL, 'pathtoclam', '', NULL),
(259, 0, 1465851470, NULL, 'quarantinedir', '', NULL),
(260, 0, 1465851470, NULL, 'clamfailureonupload', 'donothing', NULL),
(261, 0, 1465851470, NULL, 'themelist', '', NULL),
(262, 0, 1465851470, NULL, 'themedesignermode', '0', NULL),
(263, 0, 1465851470, NULL, 'allowuserthemes', '0', NULL),
(264, 0, 1465851470, NULL, 'allowcoursethemes', '0', NULL),
(265, 0, 1465851470, NULL, 'allowcategorythemes', '0', NULL),
(266, 0, 1465851470, NULL, 'allowthemechangeonurl', '0', NULL),
(267, 0, 1465851470, NULL, 'allowuserblockhiding', '1', NULL),
(268, 0, 1465851470, NULL, 'allowblockstodock', '1', NULL),
(269, 0, 1465851470, NULL, 'custommenuitems', '', NULL),
(270, 0, 1465851470, NULL, 'enabledevicedetection', '1', NULL),
(271, 0, 1465851470, NULL, 'devicedetectregex', '[]', NULL),
(272, 0, 1465851470, 'theme_afterburner', 'logo', '', NULL),
(273, 0, 1465851470, 'theme_afterburner', 'footnote', '', NULL),
(274, 0, 1465851470, 'theme_afterburner', 'customcss', '', NULL),
(275, 0, 1465851470, 'theme_anomaly', 'tagline', '', NULL),
(276, 0, 1465851470, 'theme_anomaly', 'customcss', '', NULL),
(277, 0, 1465851470, 'theme_arialist', 'logo', '', NULL),
(278, 0, 1465851470, 'theme_arialist', 'tagline', '', NULL),
(279, 0, 1465851470, 'theme_arialist', 'linkcolor', '#f25f0f', NULL),
(280, 0, 1465851470, 'theme_arialist', 'regionwidth', '250', NULL),
(281, 0, 1465851470, 'theme_arialist', 'customcss', '', NULL),
(282, 0, 1465851471, 'theme_brick', 'logo', '', NULL),
(283, 0, 1465851471, 'theme_brick', 'linkcolor', '#06365b', NULL),
(284, 0, 1465851471, 'theme_brick', 'linkhover', '#5487ad', NULL),
(285, 0, 1465851471, 'theme_brick', 'maincolor', '#8e2800', NULL),
(286, 0, 1465851471, 'theme_brick', 'maincolorlink', '#fff0a5', NULL),
(287, 0, 1465851471, 'theme_brick', 'headingcolor', '#5c3500', NULL),
(288, 0, 1465851471, 'theme_clean', 'invert', '0', NULL),
(289, 0, 1465851471, 'theme_clean', 'logo', '', NULL),
(290, 0, 1465851471, 'theme_clean', 'customcss', '', NULL),
(291, 0, 1465851471, 'theme_clean', 'footnote', '', NULL),
(292, 0, 1465851471, 'theme_formal_white', 'fontsizereference', '13', NULL),
(293, 0, 1465851471, 'theme_formal_white', 'noframe', '0', NULL),
(294, 0, 1465851471, 'theme_formal_white', 'framemargin', '15', NULL),
(295, 0, 1465851471, 'theme_formal_white', 'headercontent', '1', NULL),
(296, 0, 1465851471, 'theme_formal_white', 'trendcolor', 'mink', NULL),
(297, 0, 1465851471, 'theme_formal_white', 'customlogourl', '', NULL),
(298, 0, 1465851471, 'theme_formal_white', 'frontpagelogourl', '', NULL),
(299, 0, 1465851471, 'theme_formal_white', 'headerbgc', '#E3DFD4', NULL),
(300, 0, 1465851471, 'theme_formal_white', 'creditstomoodleorg', '2', NULL),
(301, 0, 1465851471, 'theme_formal_white', 'blockcolumnwidth', '200', NULL),
(302, 0, 1465851471, 'theme_formal_white', 'blockpadding', '8', NULL),
(303, 0, 1465851471, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6', NULL),
(304, 0, 1465851471, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4', NULL),
(305, 0, 1465851471, 'theme_formal_white', 'rblockcolumnbgc', '', NULL),
(306, 0, 1465851471, 'theme_formal_white', 'footnote', '', NULL),
(307, 0, 1465851471, 'theme_formal_white', 'customcss', '', NULL),
(308, 0, 1465851471, 'theme_fusion', 'linkcolor', '#2d83d5', NULL),
(309, 0, 1465851471, 'theme_fusion', 'tagline', '', NULL),
(310, 0, 1465851471, 'theme_fusion', 'footertext', '', NULL),
(311, 0, 1465851471, 'theme_fusion', 'customcss', '', NULL),
(312, 0, 1465851471, 'theme_magazine', 'background', '', NULL),
(313, 0, 1465851471, 'theme_magazine', 'logo', '', NULL),
(314, 0, 1465851471, 'theme_magazine', 'linkcolor', '#32529a', NULL),
(315, 0, 1465851471, 'theme_magazine', 'linkhover', '#4e2300', NULL),
(316, 0, 1465851471, 'theme_magazine', 'maincolor', '#002f2f', NULL),
(317, 0, 1465851471, 'theme_magazine', 'maincoloraccent', '#092323', NULL),
(318, 0, 1465851471, 'theme_magazine', 'headingcolor', '#4e0000', NULL),
(319, 0, 1465851471, 'theme_magazine', 'blockcolor', '#002f2f', NULL),
(320, 0, 1465851471, 'theme_magazine', 'forumback', '#e6e2af', NULL),
(321, 0, 1465851471, 'theme_nimble', 'tagline', '', NULL),
(322, 0, 1465851471, 'theme_nimble', 'footerline', '', NULL),
(323, 0, 1465851471, 'theme_nimble', 'backgroundcolor', '#454545', NULL),
(324, 0, 1465851471, 'theme_nimble', 'linkcolor', '#2a65b1', NULL),
(325, 0, 1465851471, 'theme_nimble', 'linkhover', '#222222', NULL),
(326, 0, 1465851471, 'theme_nonzero', 'regionprewidth', '200', NULL),
(327, 0, 1465851471, 'theme_nonzero', 'regionpostwidth', '200', NULL),
(328, 0, 1465851471, 'theme_nonzero', 'customcss', '', NULL),
(329, 0, 1465851471, 'theme_overlay', 'linkcolor', '#428ab5', NULL),
(330, 0, 1465851471, 'theme_overlay', 'headercolor', '#2a4c7b', NULL),
(331, 0, 1465851471, 'theme_overlay', 'footertext', '', NULL),
(332, 0, 1465851471, 'theme_overlay', 'customcss', '', NULL),
(333, 0, 1465851471, 'theme_sky_high', 'logo', '', NULL),
(334, 0, 1465851471, 'theme_sky_high', 'regionwidth', '240', NULL),
(335, 0, 1465851471, 'theme_sky_high', 'footnote', '', NULL),
(336, 0, 1465851471, 'theme_sky_high', 'customcss', '', NULL),
(337, 0, 1465851471, 'theme_splash', 'logo', '', NULL),
(338, 0, 1465851471, 'theme_splash', 'tagline', 'Virtual learning center', NULL),
(339, 0, 1465851471, 'theme_splash', 'hide_tagline', '0', NULL),
(340, 0, 1465851471, 'theme_splash', 'footnote', '', NULL),
(341, 0, 1465851471, 'theme_splash', 'customcss', '', NULL),
(342, 0, 1465851472, NULL, 'calendartype', 'gregorian', NULL),
(343, 0, 1465851472, NULL, 'calendar_adminseesall', '0', NULL),
(344, 0, 1465851472, NULL, 'calendar_site_timeformat', '0', NULL),
(345, 0, 1465851472, NULL, 'calendar_startwday', '0', NULL),
(346, 0, 1465851472, NULL, 'calendar_weekend', '65', NULL),
(347, 0, 1465851472, NULL, 'calendar_lookahead', '21', NULL),
(348, 0, 1465851472, NULL, 'calendar_maxevents', '10', NULL),
(349, 0, 1465851472, NULL, 'enablecalendarexport', '1', NULL),
(350, 0, 1465851472, NULL, 'calendar_customexport', '1', NULL),
(351, 0, 1465851472, NULL, 'calendar_exportlookahead', '365', NULL),
(352, 0, 1465851472, NULL, 'calendar_exportlookback', '5', NULL),
(353, 0, 1465851472, NULL, 'calendar_exportsalt', 'myTsmdSuekmshYUM0sBvyOQFLgDWMEIWJglAy4u1J8ZPWcBLVJHrwRjl1Z7j', NULL),
(354, 0, 1465851472, NULL, 'calendar_showicalsource', '1', NULL),
(355, 0, 1465851472, NULL, 'useblogassociations', '1', NULL),
(356, 0, 1465851472, NULL, 'bloglevel', '4', NULL),
(357, 0, 1465851472, NULL, 'useexternalblogs', '1', NULL),
(358, 0, 1465851472, NULL, 'externalblogcrontime', '86400', NULL),
(359, 0, 1465851472, NULL, 'maxexternalblogsperuser', '1', NULL),
(360, 0, 1465851472, NULL, 'blogusecomments', '1', NULL),
(361, 0, 1465851472, NULL, 'blogshowcommentscount', '1', NULL),
(362, 0, 1465851472, NULL, 'defaulthomepage', '0', NULL),
(363, 0, 1465851472, NULL, 'allowguestmymoodle', '1', NULL),
(364, 0, 1465851472, NULL, 'navshowfullcoursenames', '0', NULL),
(365, 0, 1465851472, NULL, 'navshowcategories', '1', NULL),
(366, 0, 1465851472, NULL, 'navshowmycoursecategories', '0', NULL),
(367, 0, 1465851472, NULL, 'navshowallcourses', '0', NULL),
(368, 0, 1465851472, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(369, 0, 1465851472, NULL, 'navcourselimit', '20', NULL),
(370, 0, 1465851472, NULL, 'usesitenameforsitepages', '0', NULL),
(371, 0, 1465851472, NULL, 'linkadmincategories', '0', NULL),
(372, 0, 1465851472, NULL, 'navshowfrontpagemods', '1', NULL),
(373, 0, 1465851472, NULL, 'navadduserpostslinks', '1', NULL),
(374, 0, 1465851472, NULL, 'formatstringstriptags', '1', NULL),
(375, 0, 1465851472, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(376, 0, 1465851472, NULL, 'core_media_enable_youtube', '1', NULL),
(377, 0, 1465851472, NULL, 'core_media_enable_vimeo', '0', NULL),
(378, 0, 1465851472, NULL, 'core_media_enable_mp3', '1', NULL),
(379, 0, 1465851472, NULL, 'core_media_enable_flv', '1', NULL),
(380, 0, 1465851472, NULL, 'core_media_enable_swf', '1', NULL),
(381, 0, 1465851473, NULL, 'core_media_enable_html5audio', '1', NULL),
(382, 0, 1465851473, NULL, 'core_media_enable_html5video', '1', NULL),
(383, 0, 1465851473, NULL, 'core_media_enable_qt', '1', NULL),
(384, 0, 1465851473, NULL, 'core_media_enable_wmp', '1', NULL),
(385, 0, 1465851473, NULL, 'core_media_enable_rm', '1', NULL),
(386, 0, 1465851473, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(387, 0, 1465851473, NULL, 'doctonewwindow', '0', NULL),
(388, 0, 1465851473, NULL, 'courselistshortnames', '0', NULL),
(389, 0, 1465851473, NULL, 'coursesperpage', '20', NULL),
(390, 0, 1465851473, NULL, 'courseswithsummarieslimit', '10', NULL),
(391, 0, 1465851473, NULL, 'courseoverviewfileslimit', '1', NULL),
(392, 0, 1465851473, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(393, 0, 1465851473, NULL, 'enableajax', '1', NULL),
(394, 0, 1465851473, NULL, 'useexternalyui', '0', NULL),
(395, 0, 1465851473, NULL, 'yuicomboloading', '1', NULL),
(396, 0, 1465851473, NULL, 'cachejs', '1', NULL),
(397, 0, 1465851473, NULL, 'modchooserdefault', '1', NULL),
(398, 0, 1465851473, NULL, 'modeditingmenu', '1', NULL),
(399, 0, 1465851473, NULL, 'blockeditingmenu', '1', NULL),
(400, 0, 1465851473, NULL, 'additionalhtmlhead', '', NULL),
(401, 0, 1465851473, NULL, 'additionalhtmltopofbody', '', NULL),
(402, 0, 1465851473, NULL, 'additionalhtmlfooter', '', NULL),
(403, 0, 1465851473, NULL, 'pathtodu', '', NULL),
(404, 0, 1465851473, NULL, 'aspellpath', '', NULL),
(405, 0, 1465851473, NULL, 'pathtodot', '', NULL),
(406, 0, 1465851473, NULL, 'supportpage', '', NULL),
(407, 0, 1465851473, NULL, 'dbsessions', '0', NULL),
(408, 0, 1465851473, NULL, 'sessioncookie', '', NULL),
(409, 0, 1465851473, NULL, 'sessioncookiepath', '', NULL),
(410, 0, 1465851473, NULL, 'sessioncookiedomain', '', NULL),
(411, 0, 1465851473, NULL, 'statsfirstrun', 'none', NULL),
(412, 0, 1465851473, NULL, 'statsmaxruntime', '0', NULL),
(413, 0, 1465851473, NULL, 'statsruntimedays', '31', NULL),
(414, 0, 1465851473, NULL, 'statsruntimestarthour', '0', NULL),
(415, 0, 1465851473, NULL, 'statsruntimestartminute', '0', NULL),
(416, 0, 1465851473, NULL, 'statsuserthreshold', '0', NULL),
(417, 0, 1465851473, NULL, 'slasharguments', '1', NULL),
(418, 0, 1465851473, NULL, 'getremoteaddrconf', '0', NULL),
(419, 0, 1465851473, NULL, 'proxyhost', '', NULL),
(420, 0, 1465851473, NULL, 'proxyport', '0', NULL),
(421, 0, 1465851473, NULL, 'proxytype', 'HTTP', NULL),
(422, 0, 1465851473, NULL, 'proxyuser', '', NULL),
(423, 0, 1465851473, NULL, 'proxypassword', '', NULL),
(424, 0, 1465851473, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(425, 0, 1465851473, NULL, 'maintenance_enabled', '0', NULL),
(426, 0, 1465851473, NULL, 'maintenance_message', '', NULL),
(427, 0, 1465851473, NULL, 'deleteunconfirmed', '168', NULL),
(428, 0, 1465851473, NULL, 'deleteincompleteusers', '0', NULL),
(429, 0, 1465851473, NULL, 'logguests', '1', NULL),
(430, 0, 1465851473, NULL, 'loglifetime', '0', NULL),
(431, 0, 1465851473, NULL, 'disablegradehistory', '0', NULL),
(432, 0, 1465851473, NULL, 'gradehistorylifetime', '0', NULL),
(433, 0, 1465851474, NULL, 'extramemorylimit', '512M', NULL),
(434, 0, 1465851474, NULL, 'curlcache', '120', NULL),
(435, 0, 1465851474, NULL, 'curltimeoutkbitrate', '56', NULL),
(436, 0, 1465851474, NULL, 'updateautocheck', '1', NULL),
(437, 0, 1465851474, NULL, 'updateautodeploy', '0', NULL),
(438, 0, 1465851474, NULL, 'updateminmaturity', '200', NULL),
(439, 0, 1465851474, NULL, 'updatenotifybuilds', '0', NULL),
(440, 0, 1465851474, NULL, 'enablesafebrowserintegration', '0', NULL),
(441, 0, 1465851474, NULL, 'enablegroupmembersonly', '0', NULL),
(442, 0, 1465851474, NULL, 'dndallowtextandlinks', '0', NULL),
(443, 0, 1465851474, NULL, 'enablecssoptimiser', '0', NULL),
(444, 0, 1465851474, NULL, 'enabletgzbackups', '0', NULL),
(445, 0, 1465851474, NULL, 'debug', '0', NULL),
(446, 0, 1465851474, NULL, 'debugdisplay', '1', NULL),
(447, 0, 1465851474, NULL, 'debugsmtp', '0', NULL),
(448, 0, 1465851474, NULL, 'perfdebug', '7', NULL),
(449, 0, 1465851474, NULL, 'debugstringids', '0', NULL),
(450, 0, 1465851474, NULL, 'debugvalidators', '0', NULL),
(451, 0, 1465851474, NULL, 'debugpageinfo', '0', NULL),
(452, 0, 1465851474, NULL, 'profilingenabled', '0', NULL),
(453, 0, 1465851474, NULL, 'profilingincluded', '', NULL),
(454, 0, 1465851474, NULL, 'profilingexcluded', '', NULL),
(455, 0, 1465851474, NULL, 'profilingautofrec', '0', NULL),
(456, 0, 1465851474, NULL, 'profilingallowme', '0', NULL),
(457, 0, 1465851474, NULL, 'profilingallowall', '0', NULL),
(458, 0, 1465851474, NULL, 'profilinglifetime', '1440', NULL),
(459, 0, 1465851474, NULL, 'profilingimportprefix', '(I)', NULL),
(460, 0, 1465851536, 'activitynames', 'filter_active', '1', ''),
(461, 0, 1465851537, 'mediaplugin', 'filter_active', '1', ''),
(462, 2, 1465851645, NULL, 'notloggedinroleid', '6', NULL),
(463, 2, 1465851645, NULL, 'guestroleid', '6', NULL),
(464, 2, 1465851645, NULL, 'defaultuserroleid', '7', NULL),
(465, 2, 1465851645, NULL, 'creatornewroleid', '3', NULL),
(466, 2, 1465851645, NULL, 'restorernewroleid', '3', NULL),
(467, 2, 1465851645, NULL, 'gradebookroles', '5', NULL),
(468, 2, 1465851645, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(469, 2, 1465851645, 'assign', 'showrecentsubmissions', '0', NULL),
(470, 2, 1465851645, 'assign', 'submissionreceipts', '1', NULL),
(471, 2, 1465851645, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(472, 2, 1465851645, 'assign', 'alwaysshowdescription', '1', NULL),
(473, 2, 1465851645, 'assign', 'alwaysshowdescription_adv', '', NULL),
(474, 2, 1465851645, 'assign', 'alwaysshowdescription_locked', '', NULL),
(475, 2, 1465851645, 'assign', 'allowsubmissionsfromdate', '0', NULL),
(476, 2, 1465851645, 'assign', 'allowsubmissionsfromdate_enabled', '1', NULL),
(477, 2, 1465851645, 'assign', 'allowsubmissionsfromdate_adv', '', NULL),
(478, 2, 1465851645, 'assign', 'duedate', '604800', NULL),
(479, 2, 1465851645, 'assign', 'duedate_enabled', '1', NULL),
(480, 2, 1465851645, 'assign', 'duedate_adv', '', NULL),
(481, 2, 1465851645, 'assign', 'cutoffdate', '1209600', NULL),
(482, 2, 1465851645, 'assign', 'cutoffdate_enabled', '', NULL),
(483, 2, 1465851645, 'assign', 'cutoffdate_adv', '', NULL),
(484, 2, 1465851645, 'assign', 'submissiondrafts', '0', NULL),
(485, 2, 1465851645, 'assign', 'submissiondrafts_adv', '', NULL),
(486, 2, 1465851645, 'assign', 'submissiondrafts_locked', '', NULL),
(487, 2, 1465851645, 'assign', 'requiresubmissionstatement', '0', NULL),
(488, 2, 1465851646, 'assign', 'requiresubmissionstatement_adv', '', NULL),
(489, 2, 1465851646, 'assign', 'requiresubmissionstatement_locked', '', NULL),
(490, 2, 1465851646, 'assign', 'attemptreopenmethod', 'none', NULL),
(491, 2, 1465851646, 'assign', 'attemptreopenmethod_adv', '', NULL),
(492, 2, 1465851646, 'assign', 'attemptreopenmethod_locked', '', NULL),
(493, 2, 1465851646, 'assign', 'maxattempts', '-1', NULL),
(494, 2, 1465851646, 'assign', 'maxattempts_adv', '', NULL),
(495, 2, 1465851646, 'assign', 'maxattempts_locked', '', NULL),
(496, 2, 1465851646, 'assign', 'teamsubmission', '0', NULL),
(497, 2, 1465851646, 'assign', 'teamsubmission_adv', '', NULL),
(498, 2, 1465851646, 'assign', 'teamsubmission_locked', '', NULL),
(499, 2, 1465851646, 'assign', 'requireallteammemberssubmit', '0', NULL),
(500, 2, 1465851646, 'assign', 'requireallteammemberssubmit_adv', '', NULL),
(501, 2, 1465851646, 'assign', 'requireallteammemberssubmit_locked', '', NULL),
(502, 2, 1465851646, 'assign', 'teamsubmissiongroupingid', '', NULL),
(503, 2, 1465851646, 'assign', 'teamsubmissiongroupingid_adv', '', NULL),
(504, 2, 1465851646, 'assign', 'sendnotifications', '0', NULL),
(505, 2, 1465851646, 'assign', 'sendnotifications_adv', '', NULL),
(506, 2, 1465851646, 'assign', 'sendnotifications_locked', '', NULL),
(507, 2, 1465851646, 'assign', 'sendlatenotifications', '0', NULL),
(508, 2, 1465851646, 'assign', 'sendlatenotifications_adv', '', NULL),
(509, 2, 1465851646, 'assign', 'sendlatenotifications_locked', '', NULL),
(510, 2, 1465851646, 'assign', 'blindmarking', '0', NULL),
(511, 2, 1465851646, 'assign', 'blindmarking_adv', '', NULL),
(512, 2, 1465851646, 'assign', 'blindmarking_locked', '', NULL),
(513, 2, 1465851646, 'assign', 'markingworkflow', '0', NULL),
(514, 2, 1465851646, 'assign', 'markingworkflow_adv', '', NULL),
(515, 2, 1465851646, 'assign', 'markingworkflow_locked', '', NULL),
(516, 2, 1465851646, 'assign', 'markingallocation', '0', NULL),
(517, 2, 1465851646, 'assign', 'markingallocation_adv', '', NULL),
(518, 2, 1465851646, 'assign', 'markingallocation_locked', '', NULL),
(519, 2, 1465851646, 'assignsubmission_file', 'default', '1', NULL),
(520, 2, 1465851646, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
(521, 2, 1465851646, 'assignsubmission_onlinetext', 'default', '0', NULL),
(522, 2, 1465851646, 'assignfeedback_comments', 'default', '1', NULL),
(523, 2, 1465851646, 'assignfeedback_editpdf', 'stamps', '', NULL),
(524, 2, 1465851646, 'assignfeedback_editpdf', 'gspath', '/usr/bin/gs', NULL),
(525, 2, 1465851646, 'assignfeedback_file', 'default', '0', NULL),
(526, 2, 1465851646, 'assignfeedback_offline', 'default', '0', NULL),
(527, 2, 1465851646, NULL, 'assignment_maxbytes', '1048576', NULL),
(528, 2, 1465851646, NULL, 'assignment_itemstocount', '1', NULL),
(529, 2, 1465851646, NULL, 'assignment_showrecentsubmissions', '1', NULL),
(530, 2, 1465851646, 'book', 'requiremodintro', '1', NULL),
(531, 2, 1465851646, 'book', 'numberingoptions', '0,1,2,3', NULL),
(532, 2, 1465851646, 'book', 'numbering', '1', NULL),
(533, 2, 1465851647, NULL, 'chat_method', 'ajax', NULL),
(534, 2, 1465851647, NULL, 'chat_refresh_userlist', '10', NULL),
(535, 2, 1465851647, NULL, 'chat_old_ping', '35', NULL),
(536, 2, 1465851647, NULL, 'chat_refresh_room', '5', NULL),
(537, 2, 1465851647, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(538, 2, 1465851647, NULL, 'chat_serverhost', 'localhost', NULL),
(539, 2, 1465851647, NULL, 'chat_serverip', '127.0.0.1', NULL),
(540, 2, 1465851647, NULL, 'chat_serverport', '9111', NULL),
(541, 2, 1465851647, NULL, 'chat_servermax', '100', NULL),
(542, 2, 1465851647, NULL, 'data_enablerssfeeds', '0', NULL),
(543, 2, 1465851647, NULL, 'feedback_allowfullanonymous', '0', NULL),
(544, 2, 1465851647, 'folder', 'requiremodintro', '1', NULL),
(545, 2, 1465851647, 'folder', 'showexpanded', '1', NULL),
(546, 2, 1465851647, NULL, 'forum_displaymode', '3', NULL),
(547, 2, 1465851647, NULL, 'forum_replytouser', '1', NULL),
(548, 2, 1465851647, NULL, 'forum_shortpost', '300', NULL),
(549, 2, 1465851647, NULL, 'forum_longpost', '600', NULL),
(550, 2, 1465851647, NULL, 'forum_manydiscussions', '100', NULL),
(551, 2, 1465851647, NULL, 'forum_maxbytes', '512000', NULL),
(552, 2, 1465851647, NULL, 'forum_maxattachments', '9', NULL),
(553, 2, 1465851647, NULL, 'forum_trackingtype', '1', NULL),
(554, 2, 1465851647, NULL, 'forum_trackreadposts', '1', NULL),
(555, 2, 1465851647, NULL, 'forum_allowforcedreadtracking', '0', NULL),
(556, 2, 1465851647, NULL, 'forum_oldpostdays', '14', NULL),
(557, 2, 1465851647, NULL, 'forum_usermarksread', '0', NULL),
(558, 2, 1465851647, NULL, 'forum_cleanreadtime', '2', NULL),
(559, 2, 1465851647, NULL, 'digestmailtime', '17', NULL),
(560, 2, 1465851647, NULL, 'forum_enablerssfeeds', '0', NULL),
(561, 2, 1465851647, NULL, 'forum_enabletimedposts', '0', NULL),
(562, 2, 1465851647, NULL, 'glossary_entbypage', '10', NULL),
(563, 2, 1465851647, NULL, 'glossary_dupentries', '0', NULL),
(564, 2, 1465851647, NULL, 'glossary_allowcomments', '0', NULL),
(565, 2, 1465851648, NULL, 'glossary_linkbydefault', '1', NULL),
(566, 2, 1465851648, NULL, 'glossary_defaultapproval', '1', NULL),
(567, 2, 1465851648, NULL, 'glossary_enablerssfeeds', '0', NULL),
(568, 2, 1465851648, NULL, 'glossary_linkentries', '0', NULL),
(569, 2, 1465851648, NULL, 'glossary_casesensitive', '0', NULL),
(570, 2, 1465851648, NULL, 'glossary_fullmatch', '0', NULL),
(571, 2, 1465851648, 'imscp', 'requiremodintro', '1', NULL),
(572, 2, 1465851648, 'imscp', 'keepold', '1', NULL),
(573, 2, 1465851648, 'imscp', 'keepold_adv', '', NULL),
(574, 2, 1465851648, 'label', 'dndmedia', '1', NULL),
(575, 2, 1465851648, 'label', 'dndresizewidth', '400', NULL),
(576, 2, 1465851648, 'label', 'dndresizeheight', '400', NULL),
(577, 2, 1465851648, NULL, 'lesson_slideshowwidth', '640', NULL),
(578, 2, 1465851648, NULL, 'lesson_slideshowheight', '480', NULL),
(579, 2, 1465851648, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(580, 2, 1465851648, NULL, 'lesson_mediawidth', '640', NULL),
(581, 2, 1465851648, NULL, 'lesson_mediaheight', '480', NULL),
(582, 2, 1465851648, NULL, 'lesson_mediaclose', '0', NULL),
(583, 2, 1465851648, NULL, 'lesson_maxhighscores', '10', NULL),
(584, 2, 1465851648, NULL, 'lesson_maxanswers', '4', NULL),
(585, 2, 1465851648, NULL, 'lesson_defaultnextpage', '0', NULL),
(586, 2, 1465851648, 'page', 'requiremodintro', '1', NULL),
(587, 2, 1465851648, 'page', 'displayoptions', '5', NULL),
(588, 2, 1465851648, 'page', 'printintro', '0', NULL),
(589, 2, 1465851648, 'page', 'display', '5', NULL),
(590, 2, 1465851648, 'page', 'popupwidth', '620', NULL),
(591, 2, 1465851648, 'page', 'popupheight', '450', NULL),
(592, 2, 1465851648, 'quiz', 'timelimit', '0', NULL),
(593, 2, 1465851648, 'quiz', 'timelimit_adv', '', NULL),
(594, 2, 1465851649, 'quiz', 'overduehandling', 'autoabandon', NULL),
(595, 2, 1465851649, 'quiz', 'overduehandling_adv', '', NULL),
(596, 2, 1465851649, 'quiz', 'graceperiod', '86400', NULL),
(597, 2, 1465851649, 'quiz', 'graceperiod_adv', '', NULL),
(598, 2, 1465851649, 'quiz', 'graceperiodmin', '60', NULL),
(599, 2, 1465851649, 'quiz', 'attempts', '0', NULL),
(600, 2, 1465851649, 'quiz', 'attempts_adv', '', NULL),
(601, 2, 1465851649, 'quiz', 'grademethod', '1', NULL),
(602, 2, 1465851649, 'quiz', 'grademethod_adv', '', NULL),
(603, 2, 1465851649, 'quiz', 'maximumgrade', '10', NULL),
(604, 2, 1465851649, 'quiz', 'shufflequestions', '0', NULL),
(605, 2, 1465851649, 'quiz', 'shufflequestions_adv', '', NULL),
(606, 2, 1465851649, 'quiz', 'questionsperpage', '1', NULL),
(607, 2, 1465851649, 'quiz', 'questionsperpage_adv', '', NULL),
(608, 2, 1465851649, 'quiz', 'navmethod', 'free', NULL),
(609, 2, 1465851649, 'quiz', 'navmethod_adv', '1', NULL),
(610, 2, 1465851649, 'quiz', 'shuffleanswers', '1', NULL),
(611, 2, 1465851649, 'quiz', 'shuffleanswers_adv', '', NULL),
(612, 2, 1465851649, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(613, 2, 1465851649, 'quiz', 'attemptonlast', '0', NULL),
(614, 2, 1465851649, 'quiz', 'attemptonlast_adv', '1', NULL),
(615, 2, 1465851649, 'quiz', 'reviewattempt', '69904', NULL),
(616, 2, 1465851649, 'quiz', 'reviewcorrectness', '69904', NULL),
(617, 2, 1465851649, 'quiz', 'reviewmarks', '69904', NULL),
(618, 2, 1465851649, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(619, 2, 1465851649, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(620, 2, 1465851649, 'quiz', 'reviewrightanswer', '69904', NULL),
(621, 2, 1465851649, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(622, 2, 1465851649, 'quiz', 'showuserpicture', '0', NULL),
(623, 2, 1465851649, 'quiz', 'showuserpicture_adv', '', NULL),
(624, 2, 1465851649, 'quiz', 'decimalpoints', '2', NULL),
(625, 2, 1465851649, 'quiz', 'decimalpoints_adv', '', NULL),
(626, 2, 1465851649, 'quiz', 'questiondecimalpoints', '-1', NULL),
(627, 2, 1465851649, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(628, 2, 1465851649, 'quiz', 'showblocks', '0', NULL),
(629, 2, 1465851649, 'quiz', 'showblocks_adv', '1', NULL),
(630, 2, 1465851649, 'quiz', 'password', '', NULL),
(631, 2, 1465851649, 'quiz', 'password_adv', '1', NULL),
(632, 2, 1465851649, 'quiz', 'subnet', '', NULL),
(633, 2, 1465851649, 'quiz', 'subnet_adv', '1', NULL),
(634, 2, 1465851649, 'quiz', 'delay1', '0', NULL),
(635, 2, 1465851649, 'quiz', 'delay1_adv', '1', NULL),
(636, 2, 1465851649, 'quiz', 'delay2', '0', NULL),
(637, 2, 1465851649, 'quiz', 'delay2_adv', '1', NULL),
(638, 2, 1465851650, 'quiz', 'browsersecurity', '-', NULL),
(639, 2, 1465851650, 'quiz', 'browsersecurity_adv', '1', NULL),
(640, 2, 1465851650, 'quiz', 'autosaveperiod', '0', NULL),
(641, 2, 1465851650, 'resource', 'framesize', '130', NULL),
(642, 2, 1465851650, 'resource', 'requiremodintro', '1', NULL),
(643, 2, 1465851650, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(644, 2, 1465851650, 'resource', 'printintro', '1', NULL),
(645, 2, 1465851650, 'resource', 'display', '0', NULL),
(646, 2, 1465851650, 'resource', 'showsize', '0', NULL),
(647, 2, 1465851650, 'resource', 'showtype', '0', NULL),
(648, 2, 1465851650, 'resource', 'popupwidth', '620', NULL),
(649, 2, 1465851650, 'resource', 'popupheight', '450', NULL),
(650, 2, 1465851650, 'resource', 'filterfiles', '0', NULL),
(651, 2, 1465851650, 'scorm', 'displaycoursestructure', '0', NULL),
(652, 2, 1465851650, 'scorm', 'displaycoursestructure_adv', '', NULL),
(653, 2, 1465851650, 'scorm', 'popup', '0', NULL),
(654, 2, 1465851650, 'scorm', 'popup_adv', '', NULL),
(655, 2, 1465851650, 'scorm', 'framewidth', '100', NULL),
(656, 2, 1465851650, 'scorm', 'framewidth_adv', '1', NULL),
(657, 2, 1465851650, 'scorm', 'frameheight', '500', NULL),
(658, 2, 1465851650, 'scorm', 'frameheight_adv', '1', NULL),
(659, 2, 1465851650, 'scorm', 'winoptgrp_adv', '1', NULL),
(660, 2, 1465851650, 'scorm', 'scrollbars', '0', NULL),
(661, 2, 1465851650, 'scorm', 'directories', '0', NULL),
(662, 2, 1465851650, 'scorm', 'location', '0', NULL),
(663, 2, 1465851650, 'scorm', 'menubar', '0', NULL),
(664, 2, 1465851650, 'scorm', 'toolbar', '0', NULL),
(665, 2, 1465851650, 'scorm', 'status', '0', NULL),
(666, 2, 1465851650, 'scorm', 'skipview', '0', NULL),
(667, 2, 1465851650, 'scorm', 'skipview_adv', '1', NULL),
(668, 2, 1465851650, 'scorm', 'hidebrowse', '0', NULL),
(669, 2, 1465851650, 'scorm', 'hidebrowse_adv', '1', NULL),
(670, 2, 1465851650, 'scorm', 'hidetoc', '0', NULL),
(671, 2, 1465851650, 'scorm', 'hidetoc_adv', '1', NULL),
(672, 2, 1465851650, 'scorm', 'nav', '1', NULL),
(673, 2, 1465851650, 'scorm', 'nav_adv', '1', NULL),
(674, 2, 1465851650, 'scorm', 'navpositionleft', '-100', NULL),
(675, 2, 1465851650, 'scorm', 'navpositionleft_adv', '1', NULL),
(676, 2, 1465851650, 'scorm', 'navpositiontop', '-100', NULL),
(677, 2, 1465851650, 'scorm', 'navpositiontop_adv', '1', NULL),
(678, 2, 1465851650, 'scorm', 'collapsetocwinsize', '767', NULL),
(679, 2, 1465851650, 'scorm', 'collapsetocwinsize_adv', '1', NULL),
(680, 2, 1465851650, 'scorm', 'displayattemptstatus', '1', NULL),
(681, 2, 1465851650, 'scorm', 'displayattemptstatus_adv', '', NULL),
(682, 2, 1465851650, 'scorm', 'grademethod', '1', NULL),
(683, 2, 1465851650, 'scorm', 'maxgrade', '100', NULL),
(684, 2, 1465851651, 'scorm', 'maxattempt', '0', NULL),
(685, 2, 1465851651, 'scorm', 'whatgrade', '0', NULL),
(686, 2, 1465851651, 'scorm', 'forcecompleted', '0', NULL),
(687, 2, 1465851651, 'scorm', 'forcenewattempt', '0', NULL),
(688, 2, 1465851651, 'scorm', 'lastattemptlock', '0', NULL),
(689, 2, 1465851651, 'scorm', 'auto', '0', NULL),
(690, 2, 1465851651, 'scorm', 'updatefreq', '0', NULL),
(691, 2, 1465851651, 'scorm', 'allowtypeexternal', '0', NULL),
(692, 2, 1465851651, 'scorm', 'allowtypelocalsync', '0', NULL),
(693, 2, 1465851651, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(694, 2, 1465851651, 'scorm', 'allowaicchacp', '0', NULL),
(695, 2, 1465851651, 'scorm', 'aicchacptimeout', '30', NULL),
(696, 2, 1465851651, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(697, 2, 1465851651, 'scorm', 'forcejavascript', '1', NULL),
(698, 2, 1465851651, 'scorm', 'allowapidebug', '0', NULL),
(699, 2, 1465851651, 'scorm', 'apidebugmask', '.*', NULL),
(700, 2, 1465851651, 'url', 'framesize', '130', NULL),
(701, 2, 1465851651, 'url', 'requiremodintro', '1', NULL),
(702, 2, 1465851651, 'url', 'secretphrase', '', NULL),
(703, 2, 1465851651, 'url', 'rolesinparams', '0', NULL),
(704, 2, 1465851651, 'url', 'displayoptions', '0,1,5,6', NULL),
(705, 2, 1465851651, 'url', 'printintro', '1', NULL),
(706, 2, 1465851651, 'url', 'display', '0', NULL),
(707, 2, 1465851651, 'url', 'popupwidth', '620', NULL),
(708, 2, 1465851651, 'url', 'popupheight', '450', NULL),
(709, 2, 1465851651, 'workshop', 'grade', '80', NULL),
(710, 2, 1465851651, 'workshop', 'gradinggrade', '20', NULL),
(711, 2, 1465851651, 'workshop', 'gradedecimals', '0', NULL),
(712, 2, 1465851651, 'workshop', 'maxbytes', '0', NULL),
(713, 2, 1465851651, 'workshop', 'strategy', 'accumulative', NULL),
(714, 2, 1465851651, 'workshop', 'examplesmode', '0', NULL),
(715, 2, 1465851651, 'workshopallocation_random', 'numofreviews', '5', NULL),
(716, 2, 1465851651, 'workshopform_numerrors', 'grade0', 'No', NULL),
(717, 2, 1465851651, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(718, 2, 1465851651, 'workshopeval_best', 'comparison', '5', NULL),
(719, 2, 1465851652, 'format_singleactivity', 'activitytype', 'forum', NULL),
(720, 2, 1465851652, NULL, 'block_course_list_adminview', 'all', NULL),
(721, 2, 1465851652, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(722, 2, 1465851652, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
(723, 2, 1465851652, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
(724, 2, 1465851652, 'block_course_overview', 'showchildren', '0', NULL),
(725, 2, 1465851652, 'block_course_overview', 'showwelcomearea', '0', NULL),
(726, 2, 1465851652, NULL, 'block_html_allowcssclasses', '0', NULL),
(727, 2, 1465851652, NULL, 'block_online_users_timetosee', '5', NULL),
(728, 2, 1465851652, NULL, 'block_rss_client_num_entries', '5', NULL),
(729, 2, 1465851652, NULL, 'block_rss_client_timeout', '30', NULL),
(730, 2, 1465851652, 'block_section_links', 'numsections1', '22', NULL),
(731, 2, 1465851652, 'block_section_links', 'incby1', '2', NULL),
(732, 2, 1465851652, 'block_section_links', 'numsections2', '40', NULL),
(733, 2, 1465851652, 'block_section_links', 'incby2', '5', NULL),
(734, 2, 1465851652, NULL, 'block_tags_showcoursetags', '0', NULL),
(735, 2, 1465851652, NULL, 'smtphosts', '', NULL),
(736, 2, 1465851652, NULL, 'smtpsecure', '', NULL),
(737, 2, 1465851652, NULL, 'smtpuser', '', NULL),
(738, 2, 1465851652, NULL, 'smtppass', '', NULL),
(739, 2, 1465851652, NULL, 'smtpmaxbulk', '1', NULL),
(740, 2, 1465851652, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(741, 2, 1465851652, NULL, 'emailonlyfromnoreplyaddress', '0', NULL),
(742, 2, 1465851652, NULL, 'sitemailcharset', '0', NULL),
(743, 2, 1465851652, NULL, 'allowusermailcharset', '0', NULL),
(744, 2, 1465851652, NULL, 'allowattachments', '1', NULL),
(745, 2, 1465851653, NULL, 'mailnewline', 'LF', NULL),
(746, 2, 1465851653, NULL, 'jabberhost', '', NULL),
(747, 2, 1465851653, NULL, 'jabberserver', '', NULL),
(748, 2, 1465851653, NULL, 'jabberusername', '', NULL),
(749, 2, 1465851653, NULL, 'jabberpassword', '', NULL),
(750, 2, 1465851653, NULL, 'jabberport', '5222', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(751, 2, 1465851653, 'enrol_cohort', 'roleid', '5', NULL),
(752, 2, 1465851653, 'enrol_cohort', 'unenrolaction', '0', NULL),
(753, 2, 1465851653, 'enrol_database', 'dbtype', '', NULL),
(754, 2, 1465851653, 'enrol_database', 'dbhost', 'localhost', NULL),
(755, 2, 1465851653, 'enrol_database', 'dbuser', '', NULL),
(756, 2, 1465851653, 'enrol_database', 'dbpass', '', NULL),
(757, 2, 1465851653, 'enrol_database', 'dbname', '', NULL),
(758, 2, 1465851653, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(759, 2, 1465851653, 'enrol_database', 'dbsetupsql', '', NULL),
(760, 2, 1465851653, 'enrol_database', 'dbsybasequoting', '0', NULL),
(761, 2, 1465851653, 'enrol_database', 'debugdb', '0', NULL),
(762, 2, 1465851653, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(763, 2, 1465851653, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(764, 2, 1465851653, 'enrol_database', 'localrolefield', 'shortname', NULL),
(765, 2, 1465851653, 'enrol_database', 'localcategoryfield', 'id', NULL),
(766, 2, 1465851653, 'enrol_database', 'remoteenroltable', '', NULL),
(767, 2, 1465851653, 'enrol_database', 'remotecoursefield', '', NULL),
(768, 2, 1465851653, 'enrol_database', 'remoteuserfield', '', NULL),
(769, 2, 1465851653, 'enrol_database', 'remoterolefield', '', NULL),
(770, 2, 1465851653, 'enrol_database', 'defaultrole', '5', NULL),
(771, 2, 1465851653, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(772, 2, 1465851653, 'enrol_database', 'unenrolaction', '0', NULL),
(773, 2, 1465851653, 'enrol_database', 'newcoursetable', '', NULL),
(774, 2, 1465851653, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(775, 2, 1465851653, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(776, 2, 1465851653, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(777, 2, 1465851653, 'enrol_database', 'newcoursecategory', '', NULL),
(778, 2, 1465851653, 'enrol_database', 'defaultcategory', '1', NULL),
(779, 2, 1465851653, 'enrol_database', 'templatecourse', '', NULL),
(780, 2, 1465851653, 'enrol_flatfile', 'location', '', NULL),
(781, 2, 1465851653, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(782, 2, 1465851653, 'enrol_flatfile', 'mailstudents', '0', NULL),
(783, 2, 1465851653, 'enrol_flatfile', 'mailteachers', '0', NULL),
(784, 2, 1465851653, 'enrol_flatfile', 'mailadmins', '0', NULL),
(785, 2, 1465851653, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(786, 2, 1465851653, 'enrol_flatfile', 'expiredaction', '3', NULL),
(787, 2, 1465851654, 'enrol_guest', 'requirepassword', '0', NULL),
(788, 2, 1465851654, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(789, 2, 1465851654, 'enrol_guest', 'showhint', '0', NULL),
(790, 2, 1465851654, 'enrol_guest', 'defaultenrol', '1', NULL),
(791, 2, 1465851654, 'enrol_guest', 'status', '1', NULL),
(792, 2, 1465851654, 'enrol_guest', 'status_adv', '', NULL),
(793, 2, 1465851654, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(794, 2, 1465851654, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(795, 2, 1465851654, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(796, 2, 1465851654, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(797, 2, 1465851654, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(798, 2, 1465851654, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(799, 2, 1465851654, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(800, 2, 1465851654, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(801, 2, 1465851654, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(802, 2, 1465851654, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(803, 2, 1465851654, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(804, 2, 1465851654, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(805, 2, 1465851654, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(806, 2, 1465851654, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(807, 2, 1465851654, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(808, 2, 1465851654, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(809, 2, 1465851654, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(810, 2, 1465851654, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(811, 2, 1465851654, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(812, 2, 1465851654, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(813, 2, 1465851654, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(814, 2, 1465851654, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(815, 2, 1465851654, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(816, 2, 1465851654, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(817, 2, 1465851654, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(818, 2, 1465851654, 'enrol_manual', 'expiredaction', '1', NULL),
(819, 2, 1465851654, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(820, 2, 1465851654, 'enrol_manual', 'defaultenrol', '1', NULL),
(821, 2, 1465851654, 'enrol_manual', 'status', '0', NULL),
(822, 2, 1465851654, 'enrol_manual', 'roleid', '5', NULL),
(823, 2, 1465851654, 'enrol_manual', 'enrolperiod', '0', NULL),
(824, 2, 1465851654, 'enrol_manual', 'expirynotify', '0', NULL),
(825, 2, 1465851654, 'enrol_manual', 'expirythreshold', '86400', NULL),
(826, 2, 1465851654, 'enrol_meta', 'nosyncroleids', '', NULL),
(827, 2, 1465851654, 'enrol_meta', 'syncall', '1', NULL),
(828, 2, 1465851654, 'enrol_meta', 'unenrolaction', '3', NULL),
(829, 2, 1465851654, 'enrol_mnet', 'roleid', '5', NULL),
(830, 2, 1465851654, 'enrol_mnet', 'roleid_adv', '1', NULL),
(831, 2, 1465851654, 'enrol_paypal', 'paypalbusiness', '', NULL),
(832, 2, 1465851654, 'enrol_paypal', 'mailstudents', '0', NULL),
(833, 2, 1465851654, 'enrol_paypal', 'mailteachers', '0', NULL),
(834, 2, 1465851655, 'enrol_paypal', 'mailadmins', '0', NULL),
(835, 2, 1465851655, 'enrol_paypal', 'expiredaction', '3', NULL),
(836, 2, 1465851655, 'enrol_paypal', 'status', '1', NULL),
(837, 2, 1465851655, 'enrol_paypal', 'cost', '0', NULL),
(838, 2, 1465851655, 'enrol_paypal', 'currency', 'USD', NULL),
(839, 2, 1465851655, 'enrol_paypal', 'roleid', '5', NULL),
(840, 2, 1465851655, 'enrol_paypal', 'enrolperiod', '0', NULL),
(841, 2, 1465851655, 'enrol_self', 'requirepassword', '0', NULL),
(842, 2, 1465851655, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(843, 2, 1465851655, 'enrol_self', 'showhint', '0', NULL),
(844, 2, 1465851655, 'enrol_self', 'expiredaction', '1', NULL),
(845, 2, 1465851655, 'enrol_self', 'expirynotifyhour', '6', NULL),
(846, 2, 1465851655, 'enrol_self', 'defaultenrol', '1', NULL),
(847, 2, 1465851655, 'enrol_self', 'status', '1', NULL),
(848, 2, 1465851655, 'enrol_self', 'newenrols', '1', NULL),
(849, 2, 1465851655, 'enrol_self', 'groupkey', '0', NULL),
(850, 2, 1465851655, 'enrol_self', 'roleid', '5', NULL),
(851, 2, 1465851655, 'enrol_self', 'enrolperiod', '0', NULL),
(852, 2, 1465851655, 'enrol_self', 'expirynotify', '0', NULL),
(853, 2, 1465851655, 'enrol_self', 'expirythreshold', '86400', NULL),
(854, 2, 1465851655, 'enrol_self', 'longtimenosee', '0', NULL),
(855, 2, 1465851655, 'enrol_self', 'maxenrolled', '0', NULL),
(856, 2, 1465851655, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(857, 2, 1465851655, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen', NULL),
(858, 2, 1465851655, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(859, 2, 1465851655, 'editor_tinymce', 'customconfig', '', NULL),
(860, 2, 1465851655, 'tinymce_dragmath', 'requiretex', '1', NULL),
(861, 2, 1465851655, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(862, 2, 1465851655, 'tinymce_spellchecker', 'spellengine', '', NULL),
(863, 2, 1465851655, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(864, 2, 1465851655, NULL, 'filter_censor_badwords', '', NULL),
(865, 2, 1465851655, 'filter_emoticon', 'formats', '1,4,0', NULL),
(866, 2, 1465851655, NULL, 'filter_multilang_force_old', '0', NULL),
(867, 2, 1465851655, NULL, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(868, 2, 1465851655, NULL, 'filter_tex_latexbackground', '#FFFFFF', NULL),
(869, 2, 1465851655, NULL, 'filter_tex_density', '120', NULL),
(870, 2, 1465851655, NULL, 'filter_tex_pathlatex', 'c:\\texmf\\miktex\\bin\\latex.exe', NULL),
(871, 2, 1465851655, NULL, 'filter_tex_pathdvips', 'c:\\texmf\\miktex\\bin\\dvips.exe', NULL),
(872, 2, 1465851655, NULL, 'filter_tex_pathconvert', 'c:\\imagemagick\\convert.exe', NULL),
(873, 2, 1465851655, NULL, 'filter_tex_convertformat', 'gif', NULL),
(874, 2, 1465851655, 'filter_urltolink', 'formats', '0', NULL),
(875, 2, 1465851655, 'filter_urltolink', 'embedimages', '1', NULL),
(876, 2, 1465851656, NULL, 'profileroles', '5,4,3', NULL),
(877, 2, 1465851656, NULL, 'coursecontact', '3', NULL),
(878, 2, 1465851656, NULL, 'frontpage', '6', NULL),
(879, 2, 1465851656, NULL, 'frontpageloggedin', '6', NULL),
(880, 2, 1465851656, NULL, 'maxcategorydepth', '2', NULL),
(881, 2, 1465851656, NULL, 'frontpagecourselimit', '200', NULL),
(882, 2, 1465851656, NULL, 'commentsperpage', '15', NULL),
(883, 2, 1465851656, NULL, 'defaultfrontpageroleid', '8', NULL),
(884, 2, 1465851656, NULL, 'supportname', 'Admin User', NULL),
(885, 2, 1465851656, NULL, 'supportemail', 'testadmin@gmail.com', NULL),
(886, 2, 1465851684, NULL, 'registerauth', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_config_plugins`
--

CREATE TABLE `mdl_config_plugins` (
  `id` bigint(10) NOT NULL,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables';

--
-- Volcado de datos para la tabla `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'visible', '1'),
(2, 'moodlecourse', 'format', 'weeks'),
(3, 'moodlecourse', 'maxsections', '52'),
(4, 'moodlecourse', 'numsections', '10'),
(5, 'moodlecourse', 'hiddensections', '0'),
(6, 'moodlecourse', 'coursedisplay', '0'),
(7, 'moodlecourse', 'lang', ''),
(8, 'moodlecourse', 'newsitems', '5'),
(9, 'moodlecourse', 'showgrades', '1'),
(10, 'moodlecourse', 'showreports', '0'),
(11, 'moodlecourse', 'maxbytes', '0'),
(12, 'moodlecourse', 'enablecompletion', '0'),
(13, 'moodlecourse', 'groupmode', '0'),
(14, 'moodlecourse', 'groupmodeforce', '0'),
(15, 'backup', 'loglifetime', '30'),
(16, 'backup', 'backup_general_users', '1'),
(17, 'backup', 'backup_general_users_locked', ''),
(18, 'backup', 'backup_general_anonymize', '0'),
(19, 'backup', 'backup_general_anonymize_locked', ''),
(20, 'backup', 'backup_general_role_assignments', '1'),
(21, 'backup', 'backup_general_role_assignments_locked', ''),
(22, 'backup', 'backup_general_activities', '1'),
(23, 'backup', 'backup_general_activities_locked', ''),
(24, 'backup', 'backup_general_blocks', '1'),
(25, 'backup', 'backup_general_blocks_locked', ''),
(26, 'backup', 'backup_general_filters', '1'),
(27, 'backup', 'backup_general_filters_locked', ''),
(28, 'backup', 'backup_general_comments', '1'),
(29, 'backup', 'backup_general_comments_locked', ''),
(30, 'backup', 'backup_general_badges', '1'),
(31, 'backup', 'backup_general_badges_locked', ''),
(32, 'backup', 'backup_general_userscompletion', '1'),
(33, 'backup', 'backup_general_userscompletion_locked', ''),
(34, 'backup', 'backup_general_logs', '0'),
(35, 'backup', 'backup_general_logs_locked', ''),
(36, 'backup', 'backup_general_histories', '0'),
(37, 'backup', 'backup_general_histories_locked', ''),
(38, 'backup', 'backup_general_questionbank', '1'),
(39, 'backup', 'backup_general_questionbank_locked', ''),
(40, 'backup', 'import_general_maxresults', '10'),
(41, 'backup', 'backup_auto_active', '0'),
(42, 'backup', 'backup_auto_weekdays', '0000000'),
(43, 'backup', 'backup_auto_hour', '0'),
(44, 'backup', 'backup_auto_minute', '0'),
(45, 'backup', 'backup_auto_storage', '0'),
(46, 'backup', 'backup_auto_destination', ''),
(47, 'backup', 'backup_auto_keep', '1'),
(48, 'backup', 'backup_shortname', '0'),
(49, 'backup', 'backup_auto_skip_hidden', '1'),
(50, 'backup', 'backup_auto_skip_modif_days', '30'),
(51, 'backup', 'backup_auto_skip_modif_prev', '0'),
(52, 'backup', 'backup_auto_users', '1'),
(53, 'backup', 'backup_auto_role_assignments', '1'),
(54, 'backup', 'backup_auto_activities', '1'),
(55, 'backup', 'backup_auto_blocks', '1'),
(56, 'backup', 'backup_auto_filters', '1'),
(57, 'backup', 'backup_auto_comments', '1'),
(58, 'backup', 'backup_auto_badges', '1'),
(59, 'backup', 'backup_auto_userscompletion', '1'),
(60, 'backup', 'backup_auto_logs', '0'),
(61, 'backup', 'backup_auto_histories', '0'),
(62, 'backup', 'backup_auto_questionbank', '1'),
(63, 'question_preview', 'behaviour', 'deferredfeedback'),
(64, 'question_preview', 'correctness', '1'),
(65, 'question_preview', 'marks', '2'),
(66, 'question_preview', 'markdp', '2'),
(67, 'question_preview', 'feedback', '1'),
(68, 'question_preview', 'generalfeedback', '1'),
(69, 'question_preview', 'rightanswer', '1'),
(70, 'question_preview', 'history', '0'),
(71, 'cachestore_memcache', 'testservers', ''),
(72, 'cachestore_memcached', 'testservers', ''),
(73, 'cachestore_mongodb', 'testserver', ''),
(74, 'theme_afterburner', 'logo', ''),
(75, 'theme_afterburner', 'footnote', ''),
(76, 'theme_afterburner', 'customcss', ''),
(77, 'theme_anomaly', 'tagline', ''),
(78, 'theme_anomaly', 'customcss', ''),
(79, 'theme_arialist', 'logo', ''),
(80, 'theme_arialist', 'tagline', ''),
(81, 'theme_arialist', 'linkcolor', '#f25f0f'),
(82, 'theme_arialist', 'regionwidth', '250'),
(83, 'theme_arialist', 'customcss', ''),
(84, 'theme_brick', 'logo', ''),
(85, 'theme_brick', 'linkcolor', '#06365b'),
(86, 'theme_brick', 'linkhover', '#5487ad'),
(87, 'theme_brick', 'maincolor', '#8e2800'),
(88, 'theme_brick', 'maincolorlink', '#fff0a5'),
(89, 'theme_brick', 'headingcolor', '#5c3500'),
(90, 'theme_clean', 'invert', '0'),
(91, 'theme_clean', 'logo', ''),
(92, 'theme_clean', 'customcss', ''),
(93, 'theme_clean', 'footnote', ''),
(94, 'theme_formal_white', 'fontsizereference', '13'),
(95, 'theme_formal_white', 'noframe', '0'),
(96, 'theme_formal_white', 'framemargin', '15'),
(97, 'theme_formal_white', 'headercontent', '1'),
(98, 'theme_formal_white', 'trendcolor', 'mink'),
(99, 'theme_formal_white', 'customlogourl', ''),
(100, 'theme_formal_white', 'frontpagelogourl', ''),
(101, 'theme_formal_white', 'headerbgc', '#E3DFD4'),
(102, 'theme_formal_white', 'creditstomoodleorg', '2'),
(103, 'theme_formal_white', 'blockcolumnwidth', '200'),
(104, 'theme_formal_white', 'blockpadding', '8'),
(105, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6'),
(106, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4'),
(107, 'theme_formal_white', 'rblockcolumnbgc', ''),
(108, 'theme_formal_white', 'footnote', ''),
(109, 'theme_formal_white', 'customcss', ''),
(110, 'theme_fusion', 'linkcolor', '#2d83d5'),
(111, 'theme_fusion', 'tagline', ''),
(112, 'theme_fusion', 'footertext', ''),
(113, 'theme_fusion', 'customcss', ''),
(114, 'theme_magazine', 'background', ''),
(115, 'theme_magazine', 'logo', ''),
(116, 'theme_magazine', 'linkcolor', '#32529a'),
(117, 'theme_magazine', 'linkhover', '#4e2300'),
(118, 'theme_magazine', 'maincolor', '#002f2f'),
(119, 'theme_magazine', 'maincoloraccent', '#092323'),
(120, 'theme_magazine', 'headingcolor', '#4e0000'),
(121, 'theme_magazine', 'blockcolor', '#002f2f'),
(122, 'theme_magazine', 'forumback', '#e6e2af'),
(123, 'theme_nimble', 'tagline', ''),
(124, 'theme_nimble', 'footerline', ''),
(125, 'theme_nimble', 'backgroundcolor', '#454545'),
(126, 'theme_nimble', 'linkcolor', '#2a65b1'),
(127, 'theme_nimble', 'linkhover', '#222222'),
(128, 'theme_nonzero', 'regionprewidth', '200'),
(129, 'theme_nonzero', 'regionpostwidth', '200'),
(130, 'theme_nonzero', 'customcss', ''),
(131, 'theme_overlay', 'linkcolor', '#428ab5'),
(132, 'theme_overlay', 'headercolor', '#2a4c7b'),
(133, 'theme_overlay', 'footertext', ''),
(134, 'theme_overlay', 'customcss', ''),
(135, 'theme_sky_high', 'logo', ''),
(136, 'theme_sky_high', 'regionwidth', '240'),
(137, 'theme_sky_high', 'footnote', ''),
(138, 'theme_sky_high', 'customcss', ''),
(139, 'theme_splash', 'logo', ''),
(140, 'theme_splash', 'tagline', 'Virtual learning center'),
(141, 'theme_splash', 'hide_tagline', '0'),
(142, 'theme_splash', 'footnote', ''),
(143, 'theme_splash', 'customcss', ''),
(144, 'qtype_calculated', 'version', '2013110500'),
(145, 'qtype_calculatedmulti', 'version', '2013110500'),
(146, 'qtype_calculatedsimple', 'version', '2013110500'),
(147, 'qtype_description', 'version', '2013110500'),
(148, 'qtype_essay', 'version', '2013110500'),
(149, 'qtype_match', 'version', '2013110500'),
(150, 'qtype_missingtype', 'version', '2013110500'),
(151, 'qtype_multianswer', 'version', '2013110500'),
(152, 'qtype_multichoice', 'version', '2013110500'),
(153, 'qtype_numerical', 'version', '2013110500'),
(154, 'qtype_random', 'version', '2013110501'),
(155, 'qtype_randomsamatch', 'version', '2013110503'),
(156, 'qtype_shortanswer', 'version', '2013110500'),
(157, 'qtype_truefalse', 'version', '2013110500'),
(158, 'mod_assign', 'version', '2013110501'),
(159, 'mod_assignment', 'version', '2013110500'),
(161, 'mod_book', 'version', '2013110500'),
(162, 'mod_chat', 'version', '2013110500'),
(163, 'mod_choice', 'version', '2013110500'),
(164, 'mod_data', 'version', '2013110500'),
(165, 'mod_feedback', 'version', '2013110500'),
(167, 'mod_folder', 'version', '2013110500'),
(169, 'mod_forum', 'version', '2013110502'),
(170, 'mod_glossary', 'version', '2013110500'),
(171, 'mod_imscp', 'version', '2013110500'),
(173, 'mod_label', 'version', '2013110500'),
(174, 'mod_lesson', 'version', '2013110500'),
(175, 'mod_lti', 'version', '2013110500'),
(176, 'mod_page', 'version', '2013110500'),
(178, 'mod_quiz', 'version', '2013110501'),
(179, 'mod_resource', 'version', '2013110500'),
(180, 'mod_scorm', 'version', '2013110504'),
(181, 'mod_survey', 'version', '2013110500'),
(183, 'mod_url', 'version', '2013110500'),
(185, 'mod_wiki', 'version', '2013110500'),
(187, 'mod_workshop', 'version', '2013110501'),
(188, 'auth_cas', 'version', '2013110500'),
(190, 'auth_db', 'version', '2013110500'),
(192, 'auth_email', 'version', '2013110500'),
(193, 'auth_fc', 'version', '2013110500'),
(195, 'auth_imap', 'version', '2013110500'),
(197, 'auth_ldap', 'version', '2013110500'),
(199, 'auth_manual', 'version', '2013110500'),
(200, 'auth_mnet', 'version', '2013110500'),
(202, 'auth_nntp', 'version', '2013110500'),
(204, 'auth_nologin', 'version', '2013110500'),
(205, 'auth_none', 'version', '2013110500'),
(206, 'auth_pam', 'version', '2013110500'),
(208, 'auth_pop3', 'version', '2013110500'),
(210, 'auth_radius', 'version', '2013110500'),
(212, 'auth_shibboleth', 'version', '2013110500'),
(214, 'auth_webservice', 'version', '2013110500'),
(215, 'calendartype_gregorian', 'version', '2013110500'),
(216, 'enrol_category', 'version', '2013110500'),
(218, 'enrol_cohort', 'version', '2013110500'),
(219, 'enrol_database', 'version', '2013110500'),
(221, 'enrol_flatfile', 'version', '2013110500'),
(223, 'enrol_flatfile', 'map_1', 'manager'),
(224, 'enrol_flatfile', 'map_2', 'coursecreator'),
(225, 'enrol_flatfile', 'map_3', 'editingteacher'),
(226, 'enrol_flatfile', 'map_4', 'teacher'),
(227, 'enrol_flatfile', 'map_5', 'student'),
(228, 'enrol_flatfile', 'map_6', 'guest'),
(229, 'enrol_flatfile', 'map_7', 'user'),
(230, 'enrol_flatfile', 'map_8', 'frontpage'),
(231, 'enrol_guest', 'version', '2013110500'),
(232, 'enrol_imsenterprise', 'version', '2013110500'),
(234, 'enrol_ldap', 'version', '2013110500'),
(236, 'enrol_manual', 'version', '2013110500'),
(238, 'enrol_meta', 'version', '2013110500'),
(240, 'enrol_mnet', 'version', '2013110500'),
(241, 'enrol_paypal', 'version', '2013110500'),
(242, 'enrol_self', 'version', '2013110501'),
(244, 'message_email', 'version', '2013110500'),
(246, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(247, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(248, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(249, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(250, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(251, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(252, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(253, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(254, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(255, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(256, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(257, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(258, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(259, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(260, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(261, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(262, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(263, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(264, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(265, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(266, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(267, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(268, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(269, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(270, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(271, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(272, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(273, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(274, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(275, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(276, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(277, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(278, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(279, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(280, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(281, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(282, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(283, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(284, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(285, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(286, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(287, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(288, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(289, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(290, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(291, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(292, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(293, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(294, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(295, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(296, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(297, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(298, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(299, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(300, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(301, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(302, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(303, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(304, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(305, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(306, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(307, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(308, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(309, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(310, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(311, 'message', 'email_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(312, 'message', 'message_provider_moodle_badgerecipientnotice_loggedoff', 'popup,email'),
(313, 'message', 'email_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(314, 'message', 'message_provider_moodle_badgecreatornotice_loggedoff', 'email'),
(315, 'message_jabber', 'version', '2013110500'),
(317, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(318, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(319, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(320, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(321, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(322, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(323, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(324, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(325, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(326, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(327, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(328, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(329, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(330, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(331, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(332, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(333, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(334, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(335, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(336, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(337, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(338, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(339, 'message', 'jabber_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(340, 'message', 'jabber_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(341, 'message_popup', 'version', '2013110500'),
(343, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(344, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(345, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(346, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(347, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(348, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(349, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(350, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(351, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(352, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(353, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(354, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(355, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(356, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(357, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(358, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(359, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(360, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(361, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(362, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(363, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(364, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(365, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(366, 'message', 'popup_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(367, 'message', 'message_provider_moodle_badgerecipientnotice_loggedin', 'popup'),
(368, 'message', 'popup_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(369, 'block_activity_modules', 'version', '2013110500'),
(370, 'block_admin_bookmarks', 'version', '2013110500'),
(371, 'block_badges', 'version', '2013110500'),
(372, 'block_blog_menu', 'version', '2013110500'),
(373, 'block_blog_recent', 'version', '2013110500'),
(374, 'block_blog_tags', 'version', '2013110500'),
(375, 'block_calendar_month', 'version', '2013110500'),
(376, 'block_calendar_upcoming', 'version', '2013110500'),
(377, 'block_comments', 'version', '2013110500'),
(378, 'block_community', 'version', '2013110500'),
(379, 'block_completionstatus', 'version', '2013110500'),
(380, 'block_course_list', 'version', '2013110500'),
(381, 'block_course_overview', 'version', '2013110500'),
(382, 'block_course_summary', 'version', '2013110500'),
(383, 'block_feedback', 'version', '2013110500'),
(385, 'block_glossary_random', 'version', '2013110500'),
(386, 'block_html', 'version', '2013110500'),
(387, 'block_login', 'version', '2013110500'),
(388, 'block_mentees', 'version', '2013110500'),
(389, 'block_messages', 'version', '2013110500'),
(390, 'block_mnet_hosts', 'version', '2013110500'),
(391, 'block_myprofile', 'version', '2013110500'),
(392, 'block_navigation', 'version', '2013110500'),
(393, 'block_news_items', 'version', '2013110501'),
(394, 'block_online_users', 'version', '2013110500'),
(395, 'block_participants', 'version', '2013110500'),
(396, 'block_private_files', 'version', '2013110500'),
(397, 'block_quiz_results', 'version', '2013110500'),
(398, 'block_recent_activity', 'version', '2013110500'),
(399, 'block_rss_client', 'version', '2013110500'),
(400, 'block_search_forums', 'version', '2013110500'),
(401, 'block_section_links', 'version', '2013110500'),
(402, 'block_selfcompletion', 'version', '2013110500'),
(403, 'block_settings', 'version', '2013110500'),
(404, 'block_site_main_menu', 'version', '2013110500'),
(405, 'block_social_activities', 'version', '2013110500'),
(406, 'block_tag_flickr', 'version', '2013110500'),
(407, 'block_tag_youtube', 'version', '2013110500'),
(408, 'block_tags', 'version', '2013110500'),
(409, 'filter_activitynames', 'version', '2013110500'),
(411, 'filter_algebra', 'version', '2013110500'),
(412, 'filter_censor', 'version', '2013110500'),
(413, 'filter_data', 'version', '2013110500'),
(415, 'filter_emailprotect', 'version', '2013110500'),
(416, 'filter_emoticon', 'version', '2013110500'),
(417, 'filter_glossary', 'version', '2013110500'),
(419, 'filter_mediaplugin', 'version', '2013110500'),
(421, 'filter_multilang', 'version', '2013110500'),
(422, 'filter_tex', 'version', '2013110500'),
(424, 'filter_tidy', 'version', '2013110500'),
(425, 'filter_urltolink', 'version', '2013110500'),
(426, 'editor_textarea', 'version', '2013110500'),
(427, 'editor_tinymce', 'version', '2013110603'),
(428, 'format_singleactivity', 'version', '2013110500'),
(429, 'format_social', 'version', '2013110500'),
(430, 'format_topics', 'version', '2013110500'),
(431, 'format_weeks', 'version', '2013110500'),
(432, 'profilefield_checkbox', 'version', '2013110500'),
(433, 'profilefield_datetime', 'version', '2013110500'),
(434, 'profilefield_menu', 'version', '2013110500'),
(435, 'profilefield_text', 'version', '2013110500'),
(436, 'profilefield_textarea', 'version', '2013110500'),
(437, 'report_backups', 'version', '2013110500'),
(438, 'report_completion', 'version', '2013110500'),
(440, 'report_configlog', 'version', '2013110500'),
(441, 'report_courseoverview', 'version', '2013110500'),
(442, 'report_log', 'version', '2013110500'),
(444, 'report_loglive', 'version', '2013110500'),
(445, 'report_outline', 'version', '2013110500'),
(447, 'report_participation', 'version', '2013110500'),
(449, 'report_performance', 'version', '2013110500'),
(450, 'report_progress', 'version', '2013110500'),
(452, 'report_questioninstances', 'version', '2013110500'),
(453, 'report_security', 'version', '2013110500'),
(454, 'report_stats', 'version', '2013110500'),
(456, 'gradeexport_ods', 'version', '2013110500'),
(457, 'gradeexport_txt', 'version', '2013110500'),
(458, 'gradeexport_xls', 'version', '2013110500'),
(459, 'gradeexport_xml', 'version', '2013110500'),
(460, 'gradeimport_csv', 'version', '2013110500'),
(461, 'gradeimport_xml', 'version', '2013110500'),
(462, 'gradereport_grader', 'version', '2013110500'),
(463, 'gradereport_outcomes', 'version', '2013110500'),
(464, 'gradereport_overview', 'version', '2013110500'),
(465, 'gradereport_user', 'version', '2013110500'),
(466, 'gradingform_guide', 'version', '2013110500'),
(467, 'gradingform_rubric', 'version', '2013110500'),
(468, 'mnetservice_enrol', 'version', '2013110500'),
(469, 'webservice_amf', 'version', '2013110500'),
(470, 'webservice_rest', 'version', '2013110500'),
(471, 'webservice_soap', 'version', '2013110500'),
(472, 'webservice_xmlrpc', 'version', '2013110500'),
(473, 'repository_alfresco', 'version', '2014022600'),
(474, 'repository_areafiles', 'version', '2013110500'),
(476, 'areafiles', 'enablecourseinstances', '0'),
(477, 'areafiles', 'enableuserinstances', '0'),
(478, 'repository_boxnet', 'version', '2013110700'),
(479, 'repository_coursefiles', 'version', '2013110500'),
(480, 'repository_dropbox', 'version', '2013110500'),
(481, 'repository_equella', 'version', '2013110500'),
(482, 'repository_filesystem', 'version', '2013110500'),
(483, 'repository_flickr', 'version', '2013110500'),
(484, 'repository_flickr_public', 'version', '2013110500'),
(485, 'repository_googledocs', 'version', '2013110500'),
(486, 'repository_local', 'version', '2013110500'),
(488, 'local', 'enablecourseinstances', '0'),
(489, 'local', 'enableuserinstances', '0'),
(490, 'repository_merlot', 'version', '2013110500'),
(491, 'repository_picasa', 'version', '2013110500'),
(492, 'repository_recent', 'version', '2013110500'),
(494, 'recent', 'enablecourseinstances', '0'),
(495, 'recent', 'enableuserinstances', '0'),
(496, 'repository_s3', 'version', '2013110500'),
(497, 'repository_skydrive', 'version', '2013110500'),
(498, 'repository_upload', 'version', '2013110500'),
(500, 'upload', 'enablecourseinstances', '0'),
(501, 'upload', 'enableuserinstances', '0'),
(502, 'repository_url', 'version', '2013110500'),
(504, 'url', 'enablecourseinstances', '0'),
(505, 'url', 'enableuserinstances', '0'),
(506, 'repository_user', 'version', '2013110500'),
(508, 'user', 'enablecourseinstances', '0'),
(509, 'user', 'enableuserinstances', '0'),
(510, 'repository_webdav', 'version', '2013110500'),
(511, 'repository_wikimedia', 'version', '2013110500'),
(513, 'wikimedia', 'enablecourseinstances', '0'),
(514, 'wikimedia', 'enableuserinstances', '0'),
(515, 'repository_youtube', 'version', '2013110500'),
(517, 'youtube', 'enablecourseinstances', '0'),
(518, 'youtube', 'enableuserinstances', '0'),
(519, 'portfolio_boxnet', 'version', '2013110602'),
(520, 'portfolio_download', 'version', '2013110500'),
(521, 'portfolio_flickr', 'version', '2013110500'),
(522, 'portfolio_googledocs', 'version', '2013110500'),
(523, 'portfolio_mahara', 'version', '2013110500'),
(524, 'portfolio_picasa', 'version', '2013110500'),
(525, 'qbehaviour_adaptive', 'version', '2013110500'),
(526, 'qbehaviour_adaptivenopenalty', 'version', '2013110500'),
(527, 'qbehaviour_deferredcbm', 'version', '2013110500'),
(528, 'qbehaviour_deferredfeedback', 'version', '2013110500'),
(529, 'qbehaviour_immediatecbm', 'version', '2013110500'),
(530, 'qbehaviour_immediatefeedback', 'version', '2013110500'),
(531, 'qbehaviour_informationitem', 'version', '2013110500'),
(532, 'qbehaviour_interactive', 'version', '2013110500'),
(533, 'qbehaviour_interactivecountback', 'version', '2013110500'),
(534, 'qbehaviour_manualgraded', 'version', '2013110500'),
(536, 'question', 'disabledbehaviours', 'manualgraded'),
(537, 'qbehaviour_missing', 'version', '2013110500'),
(538, 'qformat_aiken', 'version', '2013110500'),
(539, 'qformat_blackboard_six', 'version', '2013110500'),
(540, 'qformat_examview', 'version', '2013110500'),
(541, 'qformat_gift', 'version', '2013110500'),
(542, 'qformat_learnwise', 'version', '2013110500'),
(543, 'qformat_missingword', 'version', '2013110500'),
(544, 'qformat_multianswer', 'version', '2013110500'),
(545, 'qformat_webct', 'version', '2013110500'),
(546, 'qformat_xhtml', 'version', '2013110500'),
(547, 'qformat_xml', 'version', '2013110500'),
(548, 'tool_assignmentupgrade', 'version', '2013110500'),
(549, 'tool_behat', 'version', '2013110501'),
(550, 'tool_capability', 'version', '2013110500'),
(551, 'tool_customlang', 'version', '2013110500'),
(553, 'tool_dbtransfer', 'version', '2013110500'),
(554, 'tool_generator', 'version', '2013110500'),
(555, 'tool_health', 'version', '2013110500'),
(556, 'tool_innodb', 'version', '2013110500'),
(557, 'tool_installaddon', 'version', '2013110500'),
(558, 'tool_langimport', 'version', '2013110500'),
(559, 'tool_multilangupgrade', 'version', '2013110500'),
(560, 'tool_phpunit', 'version', '2013110500'),
(561, 'tool_profiling', 'version', '2013110500'),
(562, 'tool_qeupgradehelper', 'version', '2013110500'),
(564, 'tool_replace', 'version', '2013110501'),
(565, 'tool_spamcleaner', 'version', '2013110500'),
(566, 'tool_timezoneimport', 'version', '2013110500'),
(567, 'tool_unsuproles', 'version', '2013110500'),
(569, 'tool_uploadcourse', 'version', '2013110500'),
(570, 'tool_uploaduser', 'version', '2013110500'),
(571, 'tool_xmldb', 'version', '2013110500'),
(572, 'cachestore_file', 'version', '2013110500'),
(573, 'cachestore_memcache', 'version', '2013110500'),
(574, 'cachestore_memcached', 'version', '2013110500'),
(575, 'cachestore_mongodb', 'version', '2013110500'),
(576, 'cachestore_session', 'version', '2013110500'),
(577, 'cachestore_static', 'version', '2013110500'),
(578, 'cachelock_file', 'version', '2013110500'),
(579, 'theme_afterburner', 'version', '2013110500'),
(580, 'theme_anomaly', 'version', '2013110500'),
(581, 'theme_arialist', 'version', '2013110500'),
(582, 'theme_base', 'version', '2013110500'),
(583, 'theme_binarius', 'version', '2013110500'),
(584, 'theme_bootstrapbase', 'version', '2013110500'),
(585, 'theme_boxxie', 'version', '2013110500'),
(586, 'theme_brick', 'version', '2013110500'),
(587, 'theme_canvas', 'version', '2013110500'),
(588, 'theme_clean', 'version', '2013110500'),
(589, 'theme_formal_white', 'version', '2013110500'),
(591, 'theme_formfactor', 'version', '2013110500'),
(592, 'theme_fusion', 'version', '2013110500'),
(593, 'theme_leatherbound', 'version', '2013110500'),
(594, 'theme_magazine', 'version', '2013110500'),
(595, 'theme_nimble', 'version', '2013110500'),
(596, 'theme_nonzero', 'version', '2013110500'),
(597, 'theme_overlay', 'version', '2013110500'),
(598, 'theme_serenity', 'version', '2013110500'),
(599, 'theme_sky_high', 'version', '2013110500'),
(600, 'theme_splash', 'version', '2013110500'),
(601, 'theme_standard', 'version', '2013110500'),
(602, 'theme_standardold', 'version', '2013110500'),
(603, 'assignsubmission_comments', 'version', '2013110500'),
(605, 'assignsubmission_file', 'sortorder', '1'),
(606, 'assignsubmission_comments', 'sortorder', '2'),
(607, 'assignsubmission_onlinetext', 'sortorder', '0'),
(608, 'assignsubmission_file', 'version', '2013110500'),
(609, 'assignsubmission_onlinetext', 'version', '2013110500'),
(611, 'assignfeedback_comments', 'version', '2013110500'),
(613, 'assignfeedback_comments', 'sortorder', '0'),
(614, 'assignfeedback_editpdf', 'sortorder', '1'),
(615, 'assignfeedback_file', 'sortorder', '3'),
(616, 'assignfeedback_offline', 'sortorder', '2'),
(617, 'assignfeedback_editpdf', 'version', '2013110800'),
(619, 'assignfeedback_file', 'version', '2013110500'),
(621, 'assignfeedback_offline', 'version', '2013110500'),
(622, 'assignment_offline', 'version', '2013110500'),
(623, 'assignment_online', 'version', '2013110500'),
(624, 'assignment_upload', 'version', '2013110500'),
(625, 'assignment_uploadsingle', 'version', '2013110500'),
(626, 'booktool_exportimscp', 'version', '2013110500'),
(627, 'booktool_importhtml', 'version', '2013110500'),
(628, 'booktool_print', 'version', '2013110500'),
(629, 'datafield_checkbox', 'version', '2013110500'),
(630, 'datafield_date', 'version', '2013110500'),
(631, 'datafield_file', 'version', '2013110500'),
(632, 'datafield_latlong', 'version', '2013110500'),
(633, 'datafield_menu', 'version', '2013110500'),
(634, 'datafield_multimenu', 'version', '2013110500'),
(635, 'datafield_number', 'version', '2013110500'),
(636, 'datafield_picture', 'version', '2013110500'),
(637, 'datafield_radiobutton', 'version', '2013110500'),
(638, 'datafield_text', 'version', '2013110500'),
(639, 'datafield_textarea', 'version', '2013110500'),
(640, 'datafield_url', 'version', '2013110500'),
(641, 'datapreset_imagegallery', 'version', '2013110500'),
(642, 'quiz_grading', 'version', '2013110500'),
(644, 'quiz_overview', 'version', '2013110500'),
(646, 'quiz_responses', 'version', '2013110500'),
(648, 'quiz_statistics', 'version', '2013110500'),
(650, 'quizaccess_delaybetweenattempts', 'version', '2013110500'),
(651, 'quizaccess_ipaddress', 'version', '2013110500'),
(652, 'quizaccess_numattempts', 'version', '2013110500'),
(653, 'quizaccess_openclosedate', 'version', '2013110500'),
(654, 'quizaccess_password', 'version', '2013110500'),
(655, 'quizaccess_safebrowser', 'version', '2013110500'),
(656, 'quizaccess_securewindow', 'version', '2013110500'),
(657, 'quizaccess_timelimit', 'version', '2013110500'),
(658, 'scormreport_basic', 'version', '2013110500'),
(659, 'scormreport_graphs', 'version', '2013110500'),
(660, 'scormreport_interactions', 'version', '2013110500'),
(661, 'scormreport_objectives', 'version', '2013110500'),
(662, 'workshopform_accumulative', 'version', '2013110500'),
(664, 'workshopform_comments', 'version', '2013110500'),
(666, 'workshopform_numerrors', 'version', '2013110500'),
(668, 'workshopform_rubric', 'version', '2013110500'),
(670, 'workshopallocation_manual', 'version', '2013110500'),
(671, 'workshopallocation_random', 'version', '2013110500'),
(672, 'workshopallocation_scheduled', 'version', '2013110500'),
(673, 'workshopeval_best', 'version', '2013110500'),
(674, 'tinymce_ctrlhelp', 'version', '2013110500'),
(675, 'tinymce_dragmath', 'version', '2013110500'),
(676, 'tinymce_managefiles', 'version', '2014010800'),
(677, 'tinymce_moodleemoticon', 'version', '2013110500'),
(678, 'tinymce_moodleimage', 'version', '2013110500'),
(679, 'tinymce_moodlemedia', 'version', '2013110500'),
(680, 'tinymce_moodlenolink', 'version', '2013110500'),
(681, 'tinymce_pdw', 'version', '2013110500'),
(682, 'tinymce_spellchecker', 'version', '2013110500'),
(684, 'tinymce_wrap', 'version', '2013110500'),
(685, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(686, 'assign', 'showrecentsubmissions', '0'),
(687, 'assign', 'submissionreceipts', '1'),
(688, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(689, 'assign', 'alwaysshowdescription', '1'),
(690, 'assign', 'alwaysshowdescription_adv', ''),
(691, 'assign', 'alwaysshowdescription_locked', ''),
(692, 'assign', 'allowsubmissionsfromdate', '0'),
(693, 'assign', 'allowsubmissionsfromdate_enabled', '1'),
(694, 'assign', 'allowsubmissionsfromdate_adv', ''),
(695, 'assign', 'duedate', '604800'),
(696, 'assign', 'duedate_enabled', '1'),
(697, 'assign', 'duedate_adv', ''),
(698, 'assign', 'cutoffdate', '1209600'),
(699, 'assign', 'cutoffdate_enabled', ''),
(700, 'assign', 'cutoffdate_adv', ''),
(701, 'assign', 'submissiondrafts', '0'),
(702, 'assign', 'submissiondrafts_adv', ''),
(703, 'assign', 'submissiondrafts_locked', ''),
(704, 'assign', 'requiresubmissionstatement', '0'),
(705, 'assign', 'requiresubmissionstatement_adv', ''),
(706, 'assign', 'requiresubmissionstatement_locked', ''),
(707, 'assign', 'attemptreopenmethod', 'none'),
(708, 'assign', 'attemptreopenmethod_adv', ''),
(709, 'assign', 'attemptreopenmethod_locked', ''),
(710, 'assign', 'maxattempts', '-1'),
(711, 'assign', 'maxattempts_adv', ''),
(712, 'assign', 'maxattempts_locked', ''),
(713, 'assign', 'teamsubmission', '0'),
(714, 'assign', 'teamsubmission_adv', ''),
(715, 'assign', 'teamsubmission_locked', ''),
(716, 'assign', 'requireallteammemberssubmit', '0'),
(717, 'assign', 'requireallteammemberssubmit_adv', ''),
(718, 'assign', 'requireallteammemberssubmit_locked', ''),
(719, 'assign', 'teamsubmissiongroupingid', ''),
(720, 'assign', 'teamsubmissiongroupingid_adv', ''),
(721, 'assign', 'sendnotifications', '0'),
(722, 'assign', 'sendnotifications_adv', ''),
(723, 'assign', 'sendnotifications_locked', ''),
(724, 'assign', 'sendlatenotifications', '0'),
(725, 'assign', 'sendlatenotifications_adv', ''),
(726, 'assign', 'sendlatenotifications_locked', ''),
(727, 'assign', 'blindmarking', '0'),
(728, 'assign', 'blindmarking_adv', ''),
(729, 'assign', 'blindmarking_locked', ''),
(730, 'assign', 'markingworkflow', '0'),
(731, 'assign', 'markingworkflow_adv', ''),
(732, 'assign', 'markingworkflow_locked', ''),
(733, 'assign', 'markingallocation', '0'),
(734, 'assign', 'markingallocation_adv', ''),
(735, 'assign', 'markingallocation_locked', ''),
(736, 'assignsubmission_file', 'default', '1'),
(737, 'assignsubmission_file', 'maxbytes', '1048576'),
(738, 'assignsubmission_onlinetext', 'default', '0'),
(739, 'assignfeedback_comments', 'default', '1'),
(740, 'assignfeedback_editpdf', 'stamps', ''),
(741, 'assignfeedback_editpdf', 'gspath', '/usr/bin/gs'),
(742, 'assignfeedback_file', 'default', '0'),
(743, 'assignfeedback_offline', 'default', '0'),
(744, 'book', 'requiremodintro', '1'),
(745, 'book', 'numberingoptions', '0,1,2,3'),
(746, 'book', 'numbering', '1'),
(747, 'folder', 'requiremodintro', '1'),
(748, 'folder', 'showexpanded', '1'),
(749, 'imscp', 'requiremodintro', '1'),
(750, 'imscp', 'keepold', '1'),
(751, 'imscp', 'keepold_adv', ''),
(752, 'label', 'dndmedia', '1'),
(753, 'label', 'dndresizewidth', '400'),
(754, 'label', 'dndresizeheight', '400'),
(755, 'page', 'requiremodintro', '1'),
(756, 'page', 'displayoptions', '5'),
(757, 'page', 'printintro', '0'),
(758, 'page', 'display', '5'),
(759, 'page', 'popupwidth', '620'),
(760, 'page', 'popupheight', '450'),
(761, 'quiz', 'timelimit', '0'),
(762, 'quiz', 'timelimit_adv', ''),
(763, 'quiz', 'overduehandling', 'autoabandon'),
(764, 'quiz', 'overduehandling_adv', ''),
(765, 'quiz', 'graceperiod', '86400'),
(766, 'quiz', 'graceperiod_adv', ''),
(767, 'quiz', 'graceperiodmin', '60'),
(768, 'quiz', 'attempts', '0'),
(769, 'quiz', 'attempts_adv', ''),
(770, 'quiz', 'grademethod', '1'),
(771, 'quiz', 'grademethod_adv', ''),
(772, 'quiz', 'maximumgrade', '10'),
(773, 'quiz', 'shufflequestions', '0'),
(774, 'quiz', 'shufflequestions_adv', ''),
(775, 'quiz', 'questionsperpage', '1'),
(776, 'quiz', 'questionsperpage_adv', ''),
(777, 'quiz', 'navmethod', 'free'),
(778, 'quiz', 'navmethod_adv', '1'),
(779, 'quiz', 'shuffleanswers', '1'),
(780, 'quiz', 'shuffleanswers_adv', ''),
(781, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(782, 'quiz', 'attemptonlast', '0'),
(783, 'quiz', 'attemptonlast_adv', '1'),
(784, 'quiz', 'reviewattempt', '69904'),
(785, 'quiz', 'reviewcorrectness', '69904'),
(786, 'quiz', 'reviewmarks', '69904'),
(787, 'quiz', 'reviewspecificfeedback', '69904'),
(788, 'quiz', 'reviewgeneralfeedback', '69904'),
(789, 'quiz', 'reviewrightanswer', '69904'),
(790, 'quiz', 'reviewoverallfeedback', '4368'),
(791, 'quiz', 'showuserpicture', '0'),
(792, 'quiz', 'showuserpicture_adv', ''),
(793, 'quiz', 'decimalpoints', '2'),
(794, 'quiz', 'decimalpoints_adv', ''),
(795, 'quiz', 'questiondecimalpoints', '-1'),
(796, 'quiz', 'questiondecimalpoints_adv', '1'),
(797, 'quiz', 'showblocks', '0'),
(798, 'quiz', 'showblocks_adv', '1'),
(799, 'quiz', 'password', ''),
(800, 'quiz', 'password_adv', '1'),
(801, 'quiz', 'subnet', ''),
(802, 'quiz', 'subnet_adv', '1'),
(803, 'quiz', 'delay1', '0'),
(804, 'quiz', 'delay1_adv', '1'),
(805, 'quiz', 'delay2', '0'),
(806, 'quiz', 'delay2_adv', '1'),
(807, 'quiz', 'browsersecurity', '-'),
(808, 'quiz', 'browsersecurity_adv', '1'),
(809, 'quiz', 'autosaveperiod', '0'),
(810, 'resource', 'framesize', '130'),
(811, 'resource', 'requiremodintro', '1'),
(812, 'resource', 'displayoptions', '0,1,4,5,6'),
(813, 'resource', 'printintro', '1'),
(814, 'resource', 'display', '0'),
(815, 'resource', 'showsize', '0'),
(816, 'resource', 'showtype', '0'),
(817, 'resource', 'popupwidth', '620'),
(818, 'resource', 'popupheight', '450'),
(819, 'resource', 'filterfiles', '0'),
(820, 'scorm', 'displaycoursestructure', '0'),
(821, 'scorm', 'displaycoursestructure_adv', ''),
(822, 'scorm', 'popup', '0'),
(823, 'scorm', 'popup_adv', ''),
(824, 'scorm', 'framewidth', '100'),
(825, 'scorm', 'framewidth_adv', '1'),
(826, 'scorm', 'frameheight', '500'),
(827, 'scorm', 'frameheight_adv', '1'),
(828, 'scorm', 'winoptgrp_adv', '1'),
(829, 'scorm', 'scrollbars', '0'),
(830, 'scorm', 'directories', '0'),
(831, 'scorm', 'location', '0'),
(832, 'scorm', 'menubar', '0'),
(833, 'scorm', 'toolbar', '0'),
(834, 'scorm', 'status', '0'),
(835, 'scorm', 'skipview', '0'),
(836, 'scorm', 'skipview_adv', '1'),
(837, 'scorm', 'hidebrowse', '0'),
(838, 'scorm', 'hidebrowse_adv', '1'),
(839, 'scorm', 'hidetoc', '0'),
(840, 'scorm', 'hidetoc_adv', '1'),
(841, 'scorm', 'nav', '1'),
(842, 'scorm', 'nav_adv', '1'),
(843, 'scorm', 'navpositionleft', '-100'),
(844, 'scorm', 'navpositionleft_adv', '1'),
(845, 'scorm', 'navpositiontop', '-100'),
(846, 'scorm', 'navpositiontop_adv', '1'),
(847, 'scorm', 'collapsetocwinsize', '767'),
(848, 'scorm', 'collapsetocwinsize_adv', '1'),
(849, 'scorm', 'displayattemptstatus', '1'),
(850, 'scorm', 'displayattemptstatus_adv', ''),
(851, 'scorm', 'grademethod', '1'),
(852, 'scorm', 'maxgrade', '100'),
(853, 'scorm', 'maxattempt', '0'),
(854, 'scorm', 'whatgrade', '0'),
(855, 'scorm', 'forcecompleted', '0'),
(856, 'scorm', 'forcenewattempt', '0'),
(857, 'scorm', 'lastattemptlock', '0'),
(858, 'scorm', 'auto', '0'),
(859, 'scorm', 'updatefreq', '0'),
(860, 'scorm', 'allowtypeexternal', '0'),
(861, 'scorm', 'allowtypelocalsync', '0'),
(862, 'scorm', 'allowtypeexternalaicc', '0'),
(863, 'scorm', 'allowaicchacp', '0'),
(864, 'scorm', 'aicchacptimeout', '30'),
(865, 'scorm', 'aicchacpkeepsessiondata', '1'),
(866, 'scorm', 'forcejavascript', '1'),
(867, 'scorm', 'allowapidebug', '0'),
(868, 'scorm', 'apidebugmask', '.*'),
(869, 'url', 'framesize', '130'),
(870, 'url', 'requiremodintro', '1'),
(871, 'url', 'secretphrase', ''),
(872, 'url', 'rolesinparams', '0'),
(873, 'url', 'displayoptions', '0,1,5,6'),
(874, 'url', 'printintro', '1'),
(875, 'url', 'display', '0'),
(876, 'url', 'popupwidth', '620'),
(877, 'url', 'popupheight', '450'),
(878, 'workshop', 'grade', '80'),
(879, 'workshop', 'gradinggrade', '20'),
(880, 'workshop', 'gradedecimals', '0'),
(881, 'workshop', 'maxbytes', '0'),
(882, 'workshop', 'strategy', 'accumulative'),
(883, 'workshop', 'examplesmode', '0'),
(884, 'workshopallocation_random', 'numofreviews', '5'),
(885, 'workshopform_numerrors', 'grade0', 'No'),
(886, 'workshopform_numerrors', 'grade1', 'Yes'),
(887, 'workshopeval_best', 'comparison', '5'),
(888, 'format_singleactivity', 'activitytype', 'forum'),
(889, 'block_course_overview', 'defaultmaxcourses', '10'),
(890, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
(891, 'block_course_overview', 'showchildren', '0'),
(892, 'block_course_overview', 'showwelcomearea', '0'),
(893, 'block_section_links', 'numsections1', '22'),
(894, 'block_section_links', 'incby1', '2'),
(895, 'block_section_links', 'numsections2', '40'),
(896, 'block_section_links', 'incby2', '5'),
(897, 'enrol_cohort', 'roleid', '5'),
(898, 'enrol_cohort', 'unenrolaction', '0'),
(899, 'enrol_database', 'dbtype', ''),
(900, 'enrol_database', 'dbhost', 'localhost'),
(901, 'enrol_database', 'dbuser', ''),
(902, 'enrol_database', 'dbpass', ''),
(903, 'enrol_database', 'dbname', ''),
(904, 'enrol_database', 'dbencoding', 'utf-8'),
(905, 'enrol_database', 'dbsetupsql', ''),
(906, 'enrol_database', 'dbsybasequoting', '0'),
(907, 'enrol_database', 'debugdb', '0'),
(908, 'enrol_database', 'localcoursefield', 'idnumber'),
(909, 'enrol_database', 'localuserfield', 'idnumber'),
(910, 'enrol_database', 'localrolefield', 'shortname'),
(911, 'enrol_database', 'localcategoryfield', 'id'),
(912, 'enrol_database', 'remoteenroltable', ''),
(913, 'enrol_database', 'remotecoursefield', ''),
(914, 'enrol_database', 'remoteuserfield', ''),
(915, 'enrol_database', 'remoterolefield', ''),
(916, 'enrol_database', 'defaultrole', '5'),
(917, 'enrol_database', 'ignorehiddencourses', '0'),
(918, 'enrol_database', 'unenrolaction', '0'),
(919, 'enrol_database', 'newcoursetable', ''),
(920, 'enrol_database', 'newcoursefullname', 'fullname'),
(921, 'enrol_database', 'newcourseshortname', 'shortname'),
(922, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(923, 'enrol_database', 'newcoursecategory', ''),
(924, 'enrol_database', 'defaultcategory', '1'),
(925, 'enrol_database', 'templatecourse', ''),
(926, 'enrol_flatfile', 'location', ''),
(927, 'enrol_flatfile', 'encoding', 'UTF-8'),
(928, 'enrol_flatfile', 'mailstudents', '0'),
(929, 'enrol_flatfile', 'mailteachers', '0'),
(930, 'enrol_flatfile', 'mailadmins', '0'),
(931, 'enrol_flatfile', 'unenrolaction', '3'),
(932, 'enrol_flatfile', 'expiredaction', '3'),
(933, 'enrol_guest', 'requirepassword', '0'),
(934, 'enrol_guest', 'usepasswordpolicy', '0'),
(935, 'enrol_guest', 'showhint', '0'),
(936, 'enrol_guest', 'defaultenrol', '1'),
(937, 'enrol_guest', 'status', '1'),
(938, 'enrol_guest', 'status_adv', ''),
(939, 'enrol_imsenterprise', 'imsfilelocation', ''),
(940, 'enrol_imsenterprise', 'logtolocation', ''),
(941, 'enrol_imsenterprise', 'mailadmins', '0'),
(942, 'enrol_imsenterprise', 'createnewusers', '0'),
(943, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(944, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(945, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(946, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(947, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(948, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(949, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(950, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(951, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(952, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(953, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(954, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(955, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(956, 'enrol_imsenterprise', 'createnewcourses', '0'),
(957, 'enrol_imsenterprise', 'createnewcategories', '0'),
(958, 'enrol_imsenterprise', 'imsunenrol', '0'),
(959, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(960, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(961, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(962, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(963, 'enrol_imsenterprise', 'imscapitafix', '0'),
(964, 'enrol_manual', 'expiredaction', '1'),
(965, 'enrol_manual', 'expirynotifyhour', '6'),
(966, 'enrol_manual', 'defaultenrol', '1'),
(967, 'enrol_manual', 'status', '0'),
(968, 'enrol_manual', 'roleid', '5'),
(969, 'enrol_manual', 'enrolperiod', '0'),
(970, 'enrol_manual', 'expirynotify', '0'),
(971, 'enrol_manual', 'expirythreshold', '86400'),
(972, 'enrol_meta', 'nosyncroleids', ''),
(973, 'enrol_meta', 'syncall', '1'),
(974, 'enrol_meta', 'unenrolaction', '3'),
(975, 'enrol_mnet', 'roleid', '5'),
(976, 'enrol_mnet', 'roleid_adv', '1'),
(977, 'enrol_paypal', 'paypalbusiness', ''),
(978, 'enrol_paypal', 'mailstudents', '0'),
(979, 'enrol_paypal', 'mailteachers', '0'),
(980, 'enrol_paypal', 'mailadmins', '0'),
(981, 'enrol_paypal', 'expiredaction', '3'),
(982, 'enrol_paypal', 'status', '1'),
(983, 'enrol_paypal', 'cost', '0'),
(984, 'enrol_paypal', 'currency', 'USD'),
(985, 'enrol_paypal', 'roleid', '5'),
(986, 'enrol_paypal', 'enrolperiod', '0'),
(987, 'enrol_self', 'requirepassword', '0'),
(988, 'enrol_self', 'usepasswordpolicy', '0'),
(989, 'enrol_self', 'showhint', '0'),
(990, 'enrol_self', 'expiredaction', '1'),
(991, 'enrol_self', 'expirynotifyhour', '6'),
(992, 'enrol_self', 'defaultenrol', '1'),
(993, 'enrol_self', 'status', '1'),
(994, 'enrol_self', 'newenrols', '1'),
(995, 'enrol_self', 'groupkey', '0'),
(996, 'enrol_self', 'roleid', '5'),
(997, 'enrol_self', 'enrolperiod', '0'),
(998, 'enrol_self', 'expirynotify', '0'),
(999, 'enrol_self', 'expirythreshold', '86400'),
(1000, 'enrol_self', 'longtimenosee', '0'),
(1001, 'enrol_self', 'maxenrolled', '0'),
(1002, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(1003, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),
(1004, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(1005, 'editor_tinymce', 'customconfig', ''),
(1006, 'tinymce_dragmath', 'requiretex', '1'),
(1007, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(1008, 'tinymce_spellchecker', 'spellengine', ''),
(1009, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(1010, 'filter_emoticon', 'formats', '1,4,0'),
(1011, 'filter_urltolink', 'formats', '0'),
(1012, 'filter_urltolink', 'embedimages', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_context`
--

CREATE TABLE `mdl_context` (
  `id` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='one of these must be set';

--
-- Volcado de datos para la tabla `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(15, 30, 3, '/1/15', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_context_temp`
--

CREATE TABLE `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course`
--

CREATE TABLE `mdl_course` (
  `id` bigint(10) NOT NULL,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `calendartype` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Central course table';

--
-- Volcado de datos para la tabla `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `calendartype`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`, `cacherev`) VALUES
(1, 0, 0, 'simulacion', 'simulacion', '', '', 0, 'site', 1, 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1465851455, 1465851684, 0, 0, 0, 1465851573);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_categories`
--

CREATE TABLE `mdl_course_categories` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course categories';

--
-- Volcado de datos para la tabla `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 10000, 0, 1, 1, 1465851455, 1, '/1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completion_aggr_methd`
--

CREATE TABLE `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completion_crit_compl`
--

CREATE TABLE `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completion_criteria`
--

CREATE TABLE `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completions`
--

CREATE TABLE `mdl_course_completions` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_format_options`
--

CREATE TABLE `mdl_course_format_options` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores format-specific options for the course or course sect';

--
-- Volcado de datos para la tabla `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules`
--

CREATE TABLE `mdl_course_modules` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules_avail_fields`
--

CREATE TABLE `mdl_course_modules_avail_fields` (
  `id` bigint(10) NOT NULL,
  `coursemoduleid` bigint(10) NOT NULL,
  `userfield` varchar(50) DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user field conditions that affect whether an activity';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules_availability`
--

CREATE TABLE `mdl_course_modules_availability` (
  `id` bigint(10) NOT NULL,
  `coursemoduleid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table stores conditions that affect whether a module/activit';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules_completion`
--

CREATE TABLE `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_published`
--

CREATE TABLE `mdl_course_published` (
  `id` bigint(10) NOT NULL,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_request`
--

CREATE TABLE `mdl_course_request` (
  `id` bigint(10) NOT NULL,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_sections`
--

CREATE TABLE `mdl_course_sections` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_sections_avail_fields`
--

CREATE TABLE `mdl_course_sections_avail_fields` (
  `id` bigint(10) NOT NULL,
  `coursesectionid` bigint(10) NOT NULL,
  `userfield` varchar(50) DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user field conditions that affect whether an activity';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_sections_availability`
--

CREATE TABLE `mdl_course_sections_availability` (
  `id` bigint(10) NOT NULL,
  `coursesectionid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Completion or grade conditions that affect if a section is c';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data`
--

CREATE TABLE `mdl_data` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext,
  `listtemplate` longtext,
  `listtemplateheader` longtext,
  `listtemplatefooter` longtext,
  `addtemplate` longtext,
  `rsstemplate` longtext,
  `rsstitletemplate` longtext,
  `csstemplate` longtext,
  `jstemplate` longtext,
  `asearchtemplate` longtext,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data_content`
--

CREATE TABLE `mdl_data_content` (
  `id` bigint(10) NOT NULL,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data_fields`
--

CREATE TABLE `mdl_data_fields` (
  `id` bigint(10) NOT NULL,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  `param6` longtext,
  `param7` longtext,
  `param8` longtext,
  `param9` longtext,
  `param10` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data_records`
--

CREATE TABLE `mdl_data_records` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol`
--

CREATE TABLE `mdl_enrol` (
  `id` bigint(10) NOT NULL,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customchar3` varchar(1333) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `customtext3` longtext,
  `customtext4` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol_flatfile`
--

CREATE TABLE `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol_paypal`
--

CREATE TABLE `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_event`
--

CREATE TABLE `mdl_event` (
  `id` bigint(10) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_event_subscriptions`
--

CREATE TABLE `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks subscriptions to remote calendars.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_events_handlers`
--

CREATE TABLE `mdl_events_handlers` (
  `id` bigint(10) NOT NULL,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` longtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ';

--
-- Volcado de datos para la tabla `mdl_events_handlers`
--

INSERT INTO `mdl_events_handlers` (`id`, `eventname`, `component`, `handlerfile`, `handlerfunction`, `schedule`, `status`, `internal`) VALUES
(1, 'portfolio_send', 'moodle', '/lib/portfoliolib.php', 's:22:"portfolio_handle_event";', 'cron', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_events_queue`
--

CREATE TABLE `mdl_events_queue` (
  `id` bigint(10) NOT NULL,
  `eventdata` longtext NOT NULL,
  `stackdump` longtext,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_events_queue_handlers`
--

CREATE TABLE `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_functions`
--

CREATE TABLE `mdl_external_functions` (
  `id` bigint(10) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='list of all external functions';

--
-- Volcado de datos para la tabla `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(2, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(3, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(4, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(5, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(6, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(7, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(8, 'moodle_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(9, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(10, 'moodle_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(11, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'moodle_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'moodle_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(16, 'moodle_group_get_groupmembers', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(17, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(18, 'moodle_group_add_groupmembers', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(19, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(20, 'moodle_group_delete_groupmembers', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(21, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(22, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', ''),
(23, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', ''),
(24, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', ''),
(25, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', ''),
(26, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', ''),
(27, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', ''),
(28, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', ''),
(29, 'moodle_file_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(30, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(31, 'moodle_file_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(32, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(33, 'moodle_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(34, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(35, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(36, 'moodle_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(37, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(38, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(39, 'moodle_user_get_users_by_courseid', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(40, 'moodle_user_get_course_participants_by_id', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(41, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(42, 'moodle_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(43, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(44, 'moodle_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(45, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(46, 'core_user_add_user_device', 'core_user_external', 'add_user_device', 'user/externallib.php', 'moodle', ''),
(47, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', ''),
(48, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(49, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(50, 'moodle_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(51, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(52, 'core_enrol_get_course_enrolment_methods', 'core_enrol_external', 'get_course_enrolment_methods', 'enrol/externallib.php', 'moodle', ''),
(53, 'moodle_role_assign', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(54, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(55, 'moodle_role_unassign', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(56, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(57, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(58, 'moodle_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(59, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(60, 'moodle_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(61, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(62, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete'),
(63, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities'),
(64, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),
(65, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),
(66, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories'),
(67, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(68, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(69, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(70, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),
(71, 'moodle_message_send_instantmessages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(72, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(73, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', ''),
(74, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', ''),
(75, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', ''),
(76, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', ''),
(77, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', ''),
(78, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', ''),
(79, 'moodle_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(80, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(81, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(82, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(83, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(84, 'core_grading_get_definitions', 'core_grading_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(85, 'core_grade_get_definitions', 'core_grade_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(86, 'core_grading_get_gradingform_instances', 'core_grading_external', 'get_gradingform_instances', 'grade/externallib.php', 'moodle', ''),
(87, 'moodle_webservice_get_siteinfo', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(88, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(89, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', ''),
(90, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', ''),
(91, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', ''),
(92, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(93, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(94, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(95, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(96, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', ''),
(97, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(98, 'mod_assign_get_user_flags', 'mod_assign_external', 'get_user_flags', 'mod/assign/externallib.php', 'mod_assign', ''),
(99, 'mod_assign_set_user_flags', 'mod_assign_external', 'set_user_flags', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade'),
(100, 'mod_assign_get_user_mappings', 'mod_assign_external', 'get_user_mappings', 'mod/assign/externallib.php', 'mod_assign', ''),
(101, 'mod_assign_revert_submissions_to_draft', 'mod_assign_external', 'revert_submissions_to_draft', 'mod/assign/externallib.php', 'mod_assign', ''),
(102, 'mod_assign_lock_submissions', 'mod_assign_external', 'lock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(103, 'mod_assign_unlock_submissions', 'mod_assign_external', 'unlock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(104, 'mod_assign_save_submission', 'mod_assign_external', 'save_submission', 'mod/assign/externallib.php', 'mod_assign', ''),
(105, 'mod_assign_submit_for_grading', 'mod_assign_external', 'submit_for_grading', 'mod/assign/externallib.php', 'mod_assign', ''),
(106, 'mod_assign_save_grade', 'mod_assign_external', 'save_grade', 'mod/assign/externallib.php', 'mod_assign', ''),
(107, 'mod_assign_save_user_extensions', 'mod_assign_external', 'save_user_extensions', 'mod/assign/externallib.php', 'mod_assign', ''),
(108, 'mod_assign_reveal_identities', 'mod_assign_external', 'reveal_identities', 'mod/assign/externallib.php', 'mod_assign', ''),
(109, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(110, 'mod_forum_get_forum_discussions', 'mod_forum_external', 'get_forum_discussions', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(111, 'moodle_enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(112, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(113, 'enrol_self_get_instance_info', 'enrol_self_external', 'get_instance_info', 'enrol/self/externallib.php', 'enrol_self', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_services`
--

CREATE TABLE `mdl_external_services` (
  `id` bigint(10) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='built in and custom external services';

--
-- Volcado de datos para la tabla `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`, `uploadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1465851463, NULL, 'moodle_mobile_app', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_services_functions`
--

CREATE TABLE `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group';

--
-- Volcado de datos para la tabla `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents'),
(10, 1, 'core_get_component_strings'),
(11, 1, 'core_user_add_user_device'),
(12, 1, 'core_calendar_get_calendar_events');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_services_users`
--

CREATE TABLE `mdl_external_services_users` (
  `id` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_tokens`
--

CREATE TABLE `mdl_external_tokens` (
  `id` bigint(10) NOT NULL,
  `token` varchar(128) NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback`
--

CREATE TABLE `mdl_feedback` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` longtext NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_completed`
--

CREATE TABLE `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_completedtmp`
--

CREATE TABLE `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_item`
--

CREATE TABLE `mdl_feedback_item` (
  `id` bigint(10) NOT NULL,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_sitecourse_map`
--

CREATE TABLE `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_template`
--

CREATE TABLE `mdl_feedback_template` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_tracking`
--

CREATE TABLE `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback trackingdata';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_value`
--

CREATE TABLE `mdl_feedback_value` (
  `id` bigint(10) NOT NULL,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_valuetmp`
--

CREATE TABLE `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_files`
--

CREATE TABLE `mdl_files` (
  `id` bigint(10) NOT NULL,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool';

--
-- Volcado de datos para la tabla `mdl_files`
--

INSERT INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`) VALUES
(1, 'fb262df98d67c4e2a5c9802403821e00cf2992af', '508e674d49c30d4fde325fe6c7f6fd3d56b247e1', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'smile.png', 2, 1600, 'image/png', 0, NULL, NULL, NULL, 1465851563, 1465851563, 0, NULL),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1465851563, 1465851563, 0, NULL),
(3, 'a4f146f120e7e00d21291b924e26aaabe9f4297a', '68317eab56c67d32aeaee5acf509a0c4aa828b6b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'sad.png', 2, 1702, 'image/png', 0, NULL, NULL, NULL, 1465851563, 1465851563, 0, NULL),
(4, '33957e31ba9c763a74638b825f0a9154acf475e1', '695a55ff780e61c9e59428aa425430b0d6bde53b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'tick.png', 2, 1187, 'image/png', 0, NULL, NULL, NULL, 1465851563, 1465851563, 0, NULL),
(5, 'd613d55f37bb76d38d4ffb4b7b83e6c694778c30', '373e63af262a9b8466ba8632551520be793c37ff', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'cross.png', 2, 1230, 'image/png', 0, NULL, NULL, NULL, 1465851564, 1465851564, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_files_reference`
--

CREATE TABLE `mdl_files_reference` (
  `id` bigint(10) NOT NULL,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext,
  `referencehash` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store files references';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_filter_active`
--

CREATE TABLE `mdl_filter_active` (
  `id` bigint(10) NOT NULL,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c';

--
-- Volcado de datos para la tabla `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 1),
(2, 'mediaplugin', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_filter_config`
--

CREATE TABLE `mdl_filter_config` (
  `id` bigint(10) NOT NULL,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_folder`
--

CREATE TABLE `mdl_folder` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum`
--

CREATE TABLE `mdl_forum` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_digests`
--

CREATE TABLE `mdl_forum_digests` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of user mail delivery preferences for each forum';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_discussions`
--

CREATE TABLE `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_posts`
--

CREATE TABLE `mdl_forum_posts` (
  `id` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_queue`
--

CREATE TABLE `mdl_forum_queue` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_read`
--

CREATE TABLE `mdl_forum_read` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_subscriptions`
--

CREATE TABLE `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_track_prefs`
--

CREATE TABLE `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary`
--

CREATE TABLE `mdl_glossary` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_alias`
--

CREATE TABLE `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_categories`
--

CREATE TABLE `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_entries`
--

CREATE TABLE `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` longtext NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_entries_categories`
--

CREATE TABLE `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_formats`
--

CREATE TABLE `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats';

--
-- Volcado de datos para la tabla `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_categories`
--

CREATE TABLE `mdl_grade_categories` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_categories_history`
--

CREATE TABLE `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History of grade_categories';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_grades`
--

CREATE TABLE `mdl_grade_grades` (
  `id` bigint(10) NOT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_grades_history`
--

CREATE TABLE `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_import_newitem`
--

CREATE TABLE `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_import_values`
--

CREATE TABLE `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_items`
--

CREATE TABLE `mdl_grade_items` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_items_history`
--

CREATE TABLE `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History of grade_items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_letters`
--

CREATE TABLE `mdl_grade_letters` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_outcomes`
--

CREATE TABLE `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_outcomes_courses`
--

CREATE TABLE `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_outcomes_history`
--

CREATE TABLE `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_settings`
--

CREATE TABLE `mdl_grade_settings` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grading_areas`
--

CREATE TABLE `mdl_grading_areas` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies gradable areas where advanced grading can happen.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grading_definitions`
--

CREATE TABLE `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the basic information about an advanced grading for';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grading_instances`
--

CREATE TABLE `mdl_grading_instances` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading form instance is an assessment record for one gradab';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_guide_comments`
--

CREATE TABLE `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='frequently used comments used in marking guide';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_guide_criteria`
--

CREATE TABLE `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the criteria grid.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_guide_fillings`
--

CREATE TABLE `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the guide is filled by a particular r';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_rubric_criteria`
--

CREATE TABLE `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the rubric grid.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_rubric_fillings`
--

CREATE TABLE `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the rubric is filled by a particular ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_rubric_levels`
--

CREATE TABLE `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the columns of the rubric grid.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groupings`
--

CREATE TABLE `mdl_groupings` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groupings_groups`
--

CREATE TABLE `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groups`
--

CREATE TABLE `mdl_groups` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groups_members`
--

CREATE TABLE `mdl_groups_members` (
  `id` bigint(10) NOT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_imscp`
--

CREATE TABLE `mdl_imscp` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_label`
--

CREATE TABLE `mdl_label` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson`
--

CREATE TABLE `mdl_lesson` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_answers`
--

CREATE TABLE `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_attempts`
--

CREATE TABLE `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext,
  `timeseen` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_branch`
--

CREATE TABLE `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_grades`
--

CREATE TABLE `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_high_scores`
--

CREATE TABLE `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_pages`
--

CREATE TABLE `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` longtext NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_timer`
--

CREATE TABLE `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_license`
--

CREATE TABLE `mdl_license` (
  `id` bigint(10) NOT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` longtext,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle';

--
-- Volcado de datos para la tabla `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_log`
--

CREATE TABLE `mdl_log` (
  `id` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible';

--
-- Volcado de datos para la tabla `mdl_log`
--

INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(1, 1465851591, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(2, 1465851639, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(3, 1465851639, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(4, 1465851685, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(5, 1465851695, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(6, 1465851702, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(7, 1465851886, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(8, 1465852631, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(9, 1465852776, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(10, 1465854187, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(11, 1465854229, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(12, 1465856201, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(13, 1465856204, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(14, 1465856213, 0, '0:0:0:0:0:0:0:1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(15, 1465856220, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(16, 1465856220, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(17, 1465856816, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(18, 1465856882, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(19, 1465856882, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(20, 1465940234, 0, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(21, 1465940234, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(22, 1465940239, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(23, 1465940244, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(24, 1465940773, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(25, 1465940774, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(26, 1465940789, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(27, 1465940910, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(28, 1465940910, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(29, 1465940942, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(30, 1465940957, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(31, 1465940958, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(32, 1465941046, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(33, 1465941142, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(34, 1465941212, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(35, 1465941212, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(36, 1465941711, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(37, 1465941748, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(38, 1465941748, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(39, 1465941773, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(40, 1465941809, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(41, 1465941810, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(42, 1465941841, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(43, 1465941862, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(44, 1465941862, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(45, 1465942466, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(46, 1465942483, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(47, 1465942483, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(48, 1465942638, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(49, 1465942662, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(50, 1465942662, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(51, 1465942663, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(52, 1465942740, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(53, 1465942772, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(54, 1465942772, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(55, 1465942830, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(56, 1465942835, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(57, 1465942835, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(58, 1465942896, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(59, 1465942914, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(60, 1465942915, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(61, 1465942959, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(62, 1465943018, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(63, 1465943018, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(64, 1465943140, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'add', '/view.php?id=3', 'Andres Coppola'),
(65, 1465943217, 3, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=3&course=1', '3'),
(66, 1465943218, 3, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(67, 1465943227, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(68, 1465943428, 3, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(69, 1465943883, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(70, 1465943883, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_log_display`
--

CREATE TABLE `mdl_log_display` (
  `id` bigint(10) NOT NULL,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie';

--
-- Volcado de datos para la tabla `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'set marking workflow state', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(45, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(46, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(51, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(52, 'assign', 'view batch set marking workflow state', 'assign', 'name', 'mod_assign'),
(53, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(56, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(57, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(58, 'book', 'add', 'book', 'name', 'mod_book'),
(59, 'book', 'update', 'book', 'name', 'mod_book'),
(60, 'book', 'view', 'book', 'name', 'mod_book'),
(61, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(63, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(64, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(67, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(68, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(69, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(73, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(74, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(75, 'data', 'view', 'data', 'name', 'mod_data'),
(76, 'data', 'add', 'data', 'name', 'mod_data'),
(77, 'data', 'update', 'data', 'name', 'mod_data'),
(78, 'data', 'record delete', 'data', 'name', 'mod_data'),
(79, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(80, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(81, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(82, 'data', 'templates def', 'data', 'name', 'mod_data'),
(83, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(86, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(87, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(88, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(90, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(91, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(92, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(93, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(94, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(95, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(96, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(97, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(98, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(101, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(102, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(103, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(104, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(105, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(106, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(113, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(114, 'glossary', 'disapprove entry', 'glossary', 'name', 'mod_glossary'),
(115, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(116, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(117, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(118, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(119, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(120, 'label', 'add', 'label', 'name', 'mod_label'),
(121, 'label', 'update', 'label', 'name', 'mod_label'),
(122, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(123, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(124, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(125, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(126, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(127, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(128, 'page', 'view', 'page', 'name', 'mod_page'),
(129, 'page', 'view all', 'page', 'name', 'mod_page'),
(130, 'page', 'update', 'page', 'name', 'mod_page'),
(131, 'page', 'add', 'page', 'name', 'mod_page'),
(132, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(133, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(134, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(143, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(144, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(145, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(146, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
(147, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(148, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(149, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(150, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(151, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(152, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(153, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(154, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(155, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(156, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(157, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(158, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(159, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(160, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(161, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(162, 'url', 'view', 'url', 'name', 'mod_url'),
(163, 'url', 'view all', 'url', 'name', 'mod_url'),
(164, 'url', 'update', 'url', 'name', 'mod_url'),
(165, 'url', 'add', 'url', 'name', 'mod_url'),
(166, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(167, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(168, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(169, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(170, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(171, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(172, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(179, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(180, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(181, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(182, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(183, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(184, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(185, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(186, 'book', 'print', 'book', 'name', 'booktool_print'),
(187, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_log_queries`
--

CREATE TABLE `mdl_log_queries` (
  `id` bigint(10) NOT NULL,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext,
  `backtrace` longtext,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lti`
--

CREATE TABLE `mdl_lti` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext NOT NULL,
  `securetoolurl` longtext,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` longtext,
  `secureicon` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains Basic LTI activities instances';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lti_submission`
--

CREATE TABLE `mdl_lti_submission` (
  `id` bigint(10) NOT NULL,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of individual submissions for LTI activities.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lti_types`
--

CREATE TABLE `mdl_lti_types` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI pre-configured activities';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lti_types_config`
--

CREATE TABLE `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI types configuration';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message`
--

CREATE TABLE `mdl_message` (
  `id` bigint(10) NOT NULL,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_contacts`
--

CREATE TABLE `mdl_message_contacts` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_processors`
--

CREATE TABLE `mdl_message_processors` (
  `id` bigint(10) NOT NULL,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of message output plugins';

--
-- Volcado de datos para la tabla `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'email', 1),
(2, 'jabber', 1),
(3, 'popup', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_providers`
--

CREATE TABLE `mdl_message_providers` (
  `id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy';

--
-- Volcado de datos para la tabla `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'badgerecipientnotice', 'moodle', 'moodle/badges:earnbadge'),
(10, 'badgecreatornotice', 'moodle', NULL),
(11, 'assign_notification', 'mod_assign', NULL),
(12, 'assignment_updates', 'mod_assignment', NULL),
(13, 'submission', 'mod_feedback', NULL),
(14, 'message', 'mod_feedback', NULL),
(15, 'posts', 'mod_forum', NULL),
(16, 'graded_essay', 'mod_lesson', NULL),
(17, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(18, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(19, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(20, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(21, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(22, 'expiry_notification', 'enrol_manual', NULL),
(23, 'paypal_enrolment', 'enrol_paypal', NULL),
(24, 'expiry_notification', 'enrol_self', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_read`
--

CREATE TABLE `mdl_message_read` (
  `id` bigint(10) NOT NULL,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_working`
--

CREATE TABLE `mdl_message_working` (
  `id` bigint(10) NOT NULL,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_application`
--

CREATE TABLE `mdl_mnet_application` (
  `id` bigint(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts';

--
-- Volcado de datos para la tabla `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_host`
--

CREATE TABLE `mdl_mnet_host` (
  `id` bigint(10) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` longtext NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC';

--
-- Volcado de datos para la tabla `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://localhost/moodle', '::1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_host2service`
--

CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_log`
--

CREATE TABLE `mdl_mnet_log` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_remote_rpc`
--

CREATE TABLE `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely';

--
-- Volcado de datos para la tabla `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_remote_service2rpc`
--

CREATE TABLE `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';

--
-- Volcado de datos para la tabla `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_rpc`
--

CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext NOT NULL,
  `profile` longtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to';

--
-- Volcado de datos para la tabla `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_service`
--

CREATE TABLE `mdl_mnet_service` (
  `id` bigint(10) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions';

--
-- Volcado de datos para la tabla `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_service2rpc`
--

CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';

--
-- Volcado de datos para la tabla `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_session`
--

CREATE TABLE `mdl_mnet_session` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_sso_access_control`
--

CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnetservice_enrol_courses`
--

CREATE TABLE `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_modules`
--

CREATE TABLE `mdl_modules` (
  `id` bigint(10) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='modules available in the site';

--
-- Volcado de datos para la tabla `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 60, 0, '', 1),
(2, 'assignment', 60, 0, '', 0),
(3, 'book', 0, 0, '', 1),
(4, 'chat', 300, 0, '', 1),
(5, 'choice', 0, 0, '', 1),
(6, 'data', 0, 0, '', 1),
(7, 'feedback', 0, 0, '', 0),
(8, 'folder', 0, 0, '', 1),
(9, 'forum', 60, 0, '', 1),
(10, 'glossary', 0, 0, '', 1),
(11, 'imscp', 0, 0, '', 1),
(12, 'label', 0, 0, '', 1),
(13, 'lesson', 0, 0, '', 1),
(14, 'lti', 0, 0, '', 1),
(15, 'page', 0, 0, '', 1),
(16, 'quiz', 60, 0, '', 1),
(17, 'resource', 0, 0, '', 1),
(18, 'scorm', 300, 0, '', 1),
(19, 'survey', 0, 0, '', 1),
(20, 'url', 0, 0, '', 1),
(21, 'wiki', 0, 0, '', 1),
(22, 'workshop', 60, 0, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_my_pages`
--

CREATE TABLE `mdl_my_pages` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system';

--
-- Volcado de datos para la tabla `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_page`
--

CREATE TABLE `mdl_page` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_instance`
--

CREATE TABLE `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_instance_config`
--

CREATE TABLE `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_instance_user`
--

CREATE TABLE `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_log`
--

CREATE TABLE `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_component` varchar(255) DEFAULT NULL,
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_mahara_queue`
--

CREATE TABLE `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_tempdata`
--

CREATE TABLE `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL,
  `data` longtext,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_post`
--

CREATE TABLE `mdl_post` (
  `id` bigint(10) NOT NULL,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_profiling`
--

CREATE TABLE `mdl_profiling` (
  `id` bigint(10) NOT NULL,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the results of all the profiling runs';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_essay_options`
--

CREATE TABLE `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra options for essay questions.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_match_options`
--

CREATE TABLE `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the question-type specific options for matching ques';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_match_subquestions`
--

CREATE TABLE `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The subquestions that make up a matching question';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_multichoice_options`
--

CREATE TABLE `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_randomsamatch_options`
--

CREATE TABLE `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_shortanswer_options`
--

CREATE TABLE `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question`
--

CREATE TABLE `mdl_question` (
  `id` bigint(10) NOT NULL,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The questions themselves';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_answers`
--

CREATE TABLE `mdl_question_answers` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_attempt_step_data`
--

CREATE TABLE `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each question_attempt_step has an associative array of the d';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_attempt_steps`
--

CREATE TABLE `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores one step in in a question attempt. As well as the dat';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_attempts`
--

CREATE TABLE `mdl_question_attempts` (
  `id` bigint(10) NOT NULL,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext,
  `rightanswer` longtext,
  `responsesummary` longtext,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each row here corresponds to an attempt at one question, as ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_calculated`
--

CREATE TABLE `mdl_question_calculated` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_calculated_options`
--

CREATE TABLE `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_categories`
--

CREATE TABLE `mdl_question_categories` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_dataset_definitions`
--

CREATE TABLE `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_dataset_items`
--

CREATE TABLE `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_datasets`
--

CREATE TABLE `mdl_question_datasets` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_hints`
--

CREATE TABLE `mdl_question_hints` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the the part of the question definition that gives di';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_multianswer`
--

CREATE TABLE `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_numerical`
--

CREATE TABLE `mdl_question_numerical` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_numerical_options`
--

CREATE TABLE `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_numerical_units`
--

CREATE TABLE `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_response_analysis`
--

CREATE TABLE `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `subqid` varchar(100) NOT NULL DEFAULT '',
  `aid` varchar(100) DEFAULT NULL,
  `response` longtext,
  `rcount` bigint(10) DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Analysis of student responses given to questions.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_sessions`
--

CREATE TABLE `mdl_question_sessions` (
  `id` bigint(10) NOT NULL,
  `attemptid` bigint(10) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `newest` bigint(10) NOT NULL DEFAULT '0',
  `newgraded` bigint(10) NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` longtext NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gives ids of the newest open and newest graded states';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_states`
--

CREATE TABLE `mdl_question_states` (
  `id` bigint(10) NOT NULL,
  `attempt` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  `event` smallint(4) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user responses to an attempt, and percentage grades';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_statistics`
--

CREATE TABLE `mdl_question_statistics` (
  `id` bigint(10) NOT NULL,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext,
  `randomguessscore` decimal(12,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Statistics for individual questions used in an activity.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_truefalse`
--

CREATE TABLE `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_usages`
--

CREATE TABLE `mdl_question_usages` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table''s main purpose it to assign a unique id to each a';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz`
--

CREATE TABLE `mdl_quiz` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` longtext NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The settings for each quiz.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_attempts`
--

CREATE TABLE `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `needsupgradetonewqe` smallint(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores users attempts at quizzes.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_feedback`
--

CREATE TABLE `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_grades`
--

CREATE TABLE `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the overall grade for each user on the quiz, based on';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_overrides`
--

CREATE TABLE `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_overview_regrades`
--

CREATE TABLE `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_question_instances`
--

CREATE TABLE `mdl_quiz_question_instances` (
  `id` bigint(10) NOT NULL,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the maximum possible grade (weight) for each question';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_reports`
--

CREATE TABLE `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order';

--
-- Volcado de datos para la tabla `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'grading', 6000, 'mod/quiz:grade'),
(2, 'overview', 10000, NULL),
(3, 'responses', 9000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_statistics`
--

CREATE TABLE `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to cache results from analysis done in statistics repo';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_rating`
--

CREATE TABLE `mdl_rating` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `ratingarea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_registration_hubs`
--

CREATE TABLE `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_repository`
--

CREATE TABLE `mdl_repository` (
  `id` bigint(10) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ';

--
-- Volcado de datos para la tabla `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'areafiles', 1, 1),
(2, 'local', 1, 2),
(3, 'recent', 1, 3),
(4, 'upload', 1, 4),
(5, 'url', 1, 5),
(6, 'user', 1, 6),
(7, 'wikimedia', 1, 7),
(8, 'youtube', 1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_repository_instance_config`
--

CREATE TABLE `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_repository_instances`
--

CREATE TABLE `mdl_repository_instances` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ';

--
-- Volcado de datos para la tabla `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1465851548, 1465851548, 0),
(2, '', 2, 0, 1, NULL, NULL, 1465851550, 1465851550, 0),
(3, '', 3, 0, 1, NULL, NULL, 1465851551, 1465851551, 0),
(4, '', 4, 0, 1, NULL, NULL, 1465851551, 1465851551, 0),
(5, '', 5, 0, 1, NULL, NULL, 1465851552, 1465851552, 0),
(6, '', 6, 0, 1, NULL, NULL, 1465851552, 1465851552, 0),
(7, '', 7, 0, 1, NULL, NULL, 1465851553, 1465851553, 0),
(8, '', 8, 0, 1, NULL, NULL, 1465851553, 1465851553, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_resource`
--

CREATE TABLE `mdl_resource` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_resource_old`
--

CREATE TABLE `mdl_resource_old` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext NOT NULL,
  `popup` longtext NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role`
--

CREATE TABLE `mdl_role` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle roles';

--
-- Volcado de datos para la tabla `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_allow_assign`
--

CREATE TABLE `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role';

--
-- Volcado de datos para la tabla `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_allow_override`
--

CREATE TABLE `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role';

--
-- Volcado de datos para la tabla `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_allow_switch`
--

CREATE TABLE `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ';

--
-- Volcado de datos para la tabla `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_assignments`
--

CREATE TABLE `mdl_role_assignments` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_capabilities`
--

CREATE TABLE `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p';

--
-- Volcado de datos para la tabla `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1465851456, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1465851456, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1465851456, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1465851456, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1465851456, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1465851456, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1465851456, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1465851456, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1465851456, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1465851456, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1465851456, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1465851456, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1465851456, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1465851456, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1465851456, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1465851456, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1465851456, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1465851456, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1465851456, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1465851456, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1465851456, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1465851456, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1465851456, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1465851456, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1465851456, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1465851456, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1465851456, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1465851456, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1465851456, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1465851456, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1465851456, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1465851456, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1465851456, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1465851456, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1465851457, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1465851457, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1465851457, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1465851457, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1465851457, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1465851457, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1465851457, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1465851457, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1465851457, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1465851457, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1465851457, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1465851457, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1465851457, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1465851457, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1465851457, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1465851457, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1465851457, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1465851457, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1465851457, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1465851457, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1465851457, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1465851457, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1465851457, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1465851457, 0),
(59, 1, 1, 'moodle/user:create', 1, 1465851457, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1465851457, 0),
(61, 1, 1, 'moodle/user:update', 1, 1465851457, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1465851457, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1465851457, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1465851457, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1465851457, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1465851457, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1465851457, 0),
(68, 1, 4, 'moodle/user:viewhiddendetails', 1, 1465851457, 0),
(69, 1, 3, 'moodle/user:viewhiddendetails', 1, 1465851457, 0),
(70, 1, 1, 'moodle/user:viewhiddendetails', 1, 1465851457, 0),
(71, 1, 1, 'moodle/user:loginas', 1, 1465851457, 0),
(72, 1, 1, 'moodle/user:managesyspages', 1, 1465851457, 0),
(73, 1, 7, 'moodle/user:manageownblocks', 1, 1465851457, 0),
(74, 1, 7, 'moodle/user:manageownfiles', 1, 1465851457, 0),
(75, 1, 1, 'moodle/my:configsyspages', 1, 1465851457, 0),
(76, 1, 3, 'moodle/role:assign', 1, 1465851457, 0),
(77, 1, 1, 'moodle/role:assign', 1, 1465851457, 0),
(78, 1, 4, 'moodle/role:review', 1, 1465851457, 0),
(79, 1, 3, 'moodle/role:review', 1, 1465851457, 0),
(80, 1, 1, 'moodle/role:review', 1, 1465851457, 0),
(81, 1, 1, 'moodle/role:override', 1, 1465851457, 0),
(82, 1, 3, 'moodle/role:safeoverride', 1, 1465851457, 0),
(83, 1, 1, 'moodle/role:manage', 1, 1465851457, 0),
(84, 1, 3, 'moodle/role:switchroles', 1, 1465851457, 0),
(85, 1, 1, 'moodle/role:switchroles', 1, 1465851457, 0),
(86, 1, 1, 'moodle/category:manage', 1, 1465851457, 0),
(87, 1, 2, 'moodle/category:viewhiddencategories', 1, 1465851457, 0),
(88, 1, 1, 'moodle/category:viewhiddencategories', 1, 1465851457, 0),
(89, 1, 1, 'moodle/cohort:manage', 1, 1465851457, 0),
(90, 1, 1, 'moodle/cohort:assign', 1, 1465851457, 0),
(91, 1, 3, 'moodle/cohort:view', 1, 1465851457, 0),
(92, 1, 1, 'moodle/cohort:view', 1, 1465851457, 0),
(93, 1, 2, 'moodle/course:create', 1, 1465851457, 0),
(94, 1, 1, 'moodle/course:create', 1, 1465851457, 0),
(95, 1, 7, 'moodle/course:request', 1, 1465851457, 0),
(96, 1, 1, 'moodle/course:delete', 1, 1465851457, 0),
(97, 1, 3, 'moodle/course:update', 1, 1465851457, 0),
(98, 1, 1, 'moodle/course:update', 1, 1465851457, 0),
(99, 1, 1, 'moodle/course:view', 1, 1465851457, 0),
(100, 1, 3, 'moodle/course:enrolreview', 1, 1465851457, 0),
(101, 1, 1, 'moodle/course:enrolreview', 1, 1465851457, 0),
(102, 1, 3, 'moodle/course:enrolconfig', 1, 1465851457, 0),
(103, 1, 1, 'moodle/course:enrolconfig', 1, 1465851457, 0),
(104, 1, 4, 'moodle/course:bulkmessaging', 1, 1465851457, 0),
(105, 1, 3, 'moodle/course:bulkmessaging', 1, 1465851457, 0),
(106, 1, 1, 'moodle/course:bulkmessaging', 1, 1465851457, 0),
(107, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1465851457, 0),
(108, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1465851457, 0),
(109, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1465851457, 0),
(110, 1, 2, 'moodle/course:viewhiddencourses', 1, 1465851457, 0),
(111, 1, 4, 'moodle/course:viewhiddencourses', 1, 1465851457, 0),
(112, 1, 3, 'moodle/course:viewhiddencourses', 1, 1465851457, 0),
(113, 1, 1, 'moodle/course:viewhiddencourses', 1, 1465851457, 0),
(114, 1, 3, 'moodle/course:visibility', 1, 1465851457, 0),
(115, 1, 1, 'moodle/course:visibility', 1, 1465851457, 0),
(116, 1, 3, 'moodle/course:managefiles', 1, 1465851458, 0),
(117, 1, 1, 'moodle/course:managefiles', 1, 1465851458, 0),
(118, 1, 3, 'moodle/course:manageactivities', 1, 1465851458, 0),
(119, 1, 1, 'moodle/course:manageactivities', 1, 1465851458, 0),
(120, 1, 3, 'moodle/course:activityvisibility', 1, 1465851458, 0),
(121, 1, 1, 'moodle/course:activityvisibility', 1, 1465851458, 0),
(122, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1465851458, 0),
(123, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1465851458, 0),
(124, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1465851458, 0),
(125, 1, 5, 'moodle/course:viewparticipants', 1, 1465851458, 0),
(126, 1, 4, 'moodle/course:viewparticipants', 1, 1465851458, 0),
(127, 1, 3, 'moodle/course:viewparticipants', 1, 1465851458, 0),
(128, 1, 1, 'moodle/course:viewparticipants', 1, 1465851458, 0),
(129, 1, 3, 'moodle/course:changefullname', 1, 1465851458, 0),
(130, 1, 1, 'moodle/course:changefullname', 1, 1465851458, 0),
(131, 1, 3, 'moodle/course:changeshortname', 1, 1465851458, 0),
(132, 1, 1, 'moodle/course:changeshortname', 1, 1465851458, 0),
(133, 1, 3, 'moodle/course:changeidnumber', 1, 1465851458, 0),
(134, 1, 1, 'moodle/course:changeidnumber', 1, 1465851458, 0),
(135, 1, 3, 'moodle/course:changecategory', 1, 1465851458, 0),
(136, 1, 1, 'moodle/course:changecategory', 1, 1465851458, 0),
(137, 1, 3, 'moodle/course:changesummary', 1, 1465851458, 0),
(138, 1, 1, 'moodle/course:changesummary', 1, 1465851458, 0),
(139, 1, 1, 'moodle/site:viewparticipants', 1, 1465851458, 0),
(140, 1, 5, 'moodle/course:isincompletionreports', 1, 1465851458, 0),
(141, 1, 5, 'moodle/course:viewscales', 1, 1465851458, 0),
(142, 1, 4, 'moodle/course:viewscales', 1, 1465851458, 0),
(143, 1, 3, 'moodle/course:viewscales', 1, 1465851458, 0),
(144, 1, 1, 'moodle/course:viewscales', 1, 1465851458, 0),
(145, 1, 3, 'moodle/course:managescales', 1, 1465851458, 0),
(146, 1, 1, 'moodle/course:managescales', 1, 1465851458, 0),
(147, 1, 3, 'moodle/course:managegroups', 1, 1465851458, 0),
(148, 1, 1, 'moodle/course:managegroups', 1, 1465851458, 0),
(149, 1, 3, 'moodle/course:reset', 1, 1465851458, 0),
(150, 1, 1, 'moodle/course:reset', 1, 1465851458, 0),
(151, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1465851458, 0),
(152, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1465851458, 0),
(153, 1, 6, 'moodle/blog:view', 1, 1465851458, 0),
(154, 1, 7, 'moodle/blog:view', 1, 1465851458, 0),
(155, 1, 5, 'moodle/blog:view', 1, 1465851458, 0),
(156, 1, 4, 'moodle/blog:view', 1, 1465851458, 0),
(157, 1, 3, 'moodle/blog:view', 1, 1465851458, 0),
(158, 1, 1, 'moodle/blog:view', 1, 1465851458, 0),
(159, 1, 6, 'moodle/blog:search', 1, 1465851458, 0),
(160, 1, 7, 'moodle/blog:search', 1, 1465851458, 0),
(161, 1, 5, 'moodle/blog:search', 1, 1465851458, 0),
(162, 1, 4, 'moodle/blog:search', 1, 1465851458, 0),
(163, 1, 3, 'moodle/blog:search', 1, 1465851458, 0),
(164, 1, 1, 'moodle/blog:search', 1, 1465851458, 0),
(165, 1, 1, 'moodle/blog:viewdrafts', 1, 1465851458, 0),
(166, 1, 7, 'moodle/blog:create', 1, 1465851458, 0),
(167, 1, 1, 'moodle/blog:create', 1, 1465851458, 0),
(168, 1, 4, 'moodle/blog:manageentries', 1, 1465851458, 0),
(169, 1, 3, 'moodle/blog:manageentries', 1, 1465851458, 0),
(170, 1, 1, 'moodle/blog:manageentries', 1, 1465851458, 0),
(171, 1, 5, 'moodle/blog:manageexternal', 1, 1465851458, 0),
(172, 1, 7, 'moodle/blog:manageexternal', 1, 1465851458, 0),
(173, 1, 4, 'moodle/blog:manageexternal', 1, 1465851458, 0),
(174, 1, 3, 'moodle/blog:manageexternal', 1, 1465851458, 0),
(175, 1, 1, 'moodle/blog:manageexternal', 1, 1465851458, 0),
(176, 1, 7, 'moodle/calendar:manageownentries', 1, 1465851458, 0),
(177, 1, 1, 'moodle/calendar:manageownentries', 1, 1465851458, 0),
(178, 1, 4, 'moodle/calendar:managegroupentries', 1, 1465851458, 0),
(179, 1, 3, 'moodle/calendar:managegroupentries', 1, 1465851458, 0),
(180, 1, 1, 'moodle/calendar:managegroupentries', 1, 1465851458, 0),
(181, 1, 4, 'moodle/calendar:manageentries', 1, 1465851458, 0),
(182, 1, 3, 'moodle/calendar:manageentries', 1, 1465851458, 0),
(183, 1, 1, 'moodle/calendar:manageentries', 1, 1465851458, 0),
(184, 1, 1, 'moodle/user:editprofile', 1, 1465851458, 0),
(185, 1, 6, 'moodle/user:editownprofile', -1000, 1465851458, 0),
(186, 1, 7, 'moodle/user:editownprofile', 1, 1465851458, 0),
(187, 1, 1, 'moodle/user:editownprofile', 1, 1465851458, 0),
(188, 1, 6, 'moodle/user:changeownpassword', -1000, 1465851458, 0),
(189, 1, 7, 'moodle/user:changeownpassword', 1, 1465851458, 0),
(190, 1, 1, 'moodle/user:changeownpassword', 1, 1465851458, 0),
(191, 1, 5, 'moodle/user:readuserposts', 1, 1465851458, 0),
(192, 1, 4, 'moodle/user:readuserposts', 1, 1465851458, 0),
(193, 1, 3, 'moodle/user:readuserposts', 1, 1465851458, 0),
(194, 1, 1, 'moodle/user:readuserposts', 1, 1465851458, 0),
(195, 1, 5, 'moodle/user:readuserblogs', 1, 1465851458, 0),
(196, 1, 4, 'moodle/user:readuserblogs', 1, 1465851458, 0),
(197, 1, 3, 'moodle/user:readuserblogs', 1, 1465851458, 0),
(198, 1, 1, 'moodle/user:readuserblogs', 1, 1465851458, 0),
(199, 1, 1, 'moodle/user:editmessageprofile', 1, 1465851458, 0),
(200, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1465851458, 0),
(201, 1, 7, 'moodle/user:editownmessageprofile', 1, 1465851458, 0),
(202, 1, 1, 'moodle/user:editownmessageprofile', 1, 1465851458, 0),
(203, 1, 3, 'moodle/question:managecategory', 1, 1465851458, 0),
(204, 1, 1, 'moodle/question:managecategory', 1, 1465851458, 0),
(205, 1, 3, 'moodle/question:add', 1, 1465851458, 0),
(206, 1, 1, 'moodle/question:add', 1, 1465851458, 0),
(207, 1, 3, 'moodle/question:editmine', 1, 1465851458, 0),
(208, 1, 1, 'moodle/question:editmine', 1, 1465851458, 0),
(209, 1, 3, 'moodle/question:editall', 1, 1465851458, 0),
(210, 1, 1, 'moodle/question:editall', 1, 1465851458, 0),
(211, 1, 3, 'moodle/question:viewmine', 1, 1465851458, 0),
(212, 1, 1, 'moodle/question:viewmine', 1, 1465851458, 0),
(213, 1, 3, 'moodle/question:viewall', 1, 1465851458, 0),
(214, 1, 1, 'moodle/question:viewall', 1, 1465851458, 0),
(215, 1, 3, 'moodle/question:usemine', 1, 1465851459, 0),
(216, 1, 1, 'moodle/question:usemine', 1, 1465851459, 0),
(217, 1, 3, 'moodle/question:useall', 1, 1465851459, 0),
(218, 1, 1, 'moodle/question:useall', 1, 1465851459, 0),
(219, 1, 3, 'moodle/question:movemine', 1, 1465851459, 0),
(220, 1, 1, 'moodle/question:movemine', 1, 1465851459, 0),
(221, 1, 3, 'moodle/question:moveall', 1, 1465851459, 0),
(222, 1, 1, 'moodle/question:moveall', 1, 1465851459, 0),
(223, 1, 1, 'moodle/question:config', 1, 1465851459, 0),
(224, 1, 5, 'moodle/question:flag', 1, 1465851459, 0),
(225, 1, 4, 'moodle/question:flag', 1, 1465851459, 0),
(226, 1, 3, 'moodle/question:flag', 1, 1465851459, 0),
(227, 1, 1, 'moodle/question:flag', 1, 1465851459, 0),
(228, 1, 4, 'moodle/site:doclinks', 1, 1465851459, 0),
(229, 1, 3, 'moodle/site:doclinks', 1, 1465851459, 0),
(230, 1, 1, 'moodle/site:doclinks', 1, 1465851459, 0),
(231, 1, 3, 'moodle/course:sectionvisibility', 1, 1465851459, 0),
(232, 1, 1, 'moodle/course:sectionvisibility', 1, 1465851459, 0),
(233, 1, 3, 'moodle/course:useremail', 1, 1465851459, 0),
(234, 1, 1, 'moodle/course:useremail', 1, 1465851459, 0),
(235, 1, 3, 'moodle/course:viewhiddensections', 1, 1465851459, 0),
(236, 1, 1, 'moodle/course:viewhiddensections', 1, 1465851459, 0),
(237, 1, 3, 'moodle/course:setcurrentsection', 1, 1465851459, 0),
(238, 1, 1, 'moodle/course:setcurrentsection', 1, 1465851459, 0),
(239, 1, 3, 'moodle/course:movesections', 1, 1465851459, 0),
(240, 1, 1, 'moodle/course:movesections', 1, 1465851459, 0),
(241, 1, 4, 'moodle/grade:viewall', 1, 1465851459, 0),
(242, 1, 3, 'moodle/grade:viewall', 1, 1465851459, 0),
(243, 1, 1, 'moodle/grade:viewall', 1, 1465851459, 0),
(244, 1, 5, 'moodle/grade:view', 1, 1465851459, 0),
(245, 1, 4, 'moodle/grade:viewhidden', 1, 1465851459, 0),
(246, 1, 3, 'moodle/grade:viewhidden', 1, 1465851459, 0),
(247, 1, 1, 'moodle/grade:viewhidden', 1, 1465851459, 0),
(248, 1, 3, 'moodle/grade:import', 1, 1465851459, 0),
(249, 1, 1, 'moodle/grade:import', 1, 1465851459, 0),
(250, 1, 4, 'moodle/grade:export', 1, 1465851459, 0),
(251, 1, 3, 'moodle/grade:export', 1, 1465851459, 0),
(252, 1, 1, 'moodle/grade:export', 1, 1465851459, 0),
(253, 1, 3, 'moodle/grade:manage', 1, 1465851459, 0),
(254, 1, 1, 'moodle/grade:manage', 1, 1465851459, 0),
(255, 1, 3, 'moodle/grade:edit', 1, 1465851459, 0),
(256, 1, 1, 'moodle/grade:edit', 1, 1465851459, 0),
(257, 1, 3, 'moodle/grade:managegradingforms', 1, 1465851459, 0),
(258, 1, 1, 'moodle/grade:managegradingforms', 1, 1465851459, 0),
(259, 1, 1, 'moodle/grade:sharegradingforms', 1, 1465851459, 0),
(260, 1, 1, 'moodle/grade:managesharedforms', 1, 1465851459, 0),
(261, 1, 3, 'moodle/grade:manageoutcomes', 1, 1465851459, 0),
(262, 1, 1, 'moodle/grade:manageoutcomes', 1, 1465851459, 0),
(263, 1, 3, 'moodle/grade:manageletters', 1, 1465851459, 0),
(264, 1, 1, 'moodle/grade:manageletters', 1, 1465851459, 0),
(265, 1, 3, 'moodle/grade:hide', 1, 1465851459, 0),
(266, 1, 1, 'moodle/grade:hide', 1, 1465851459, 0),
(267, 1, 3, 'moodle/grade:lock', 1, 1465851459, 0),
(268, 1, 1, 'moodle/grade:lock', 1, 1465851459, 0),
(269, 1, 3, 'moodle/grade:unlock', 1, 1465851459, 0),
(270, 1, 1, 'moodle/grade:unlock', 1, 1465851459, 0),
(271, 1, 7, 'moodle/my:manageblocks', 1, 1465851459, 0),
(272, 1, 4, 'moodle/notes:view', 1, 1465851459, 0),
(273, 1, 3, 'moodle/notes:view', 1, 1465851459, 0),
(274, 1, 1, 'moodle/notes:view', 1, 1465851459, 0),
(275, 1, 4, 'moodle/notes:manage', 1, 1465851459, 0),
(276, 1, 3, 'moodle/notes:manage', 1, 1465851459, 0),
(277, 1, 1, 'moodle/notes:manage', 1, 1465851459, 0),
(278, 1, 4, 'moodle/tag:manage', 1, 1465851459, 0),
(279, 1, 3, 'moodle/tag:manage', 1, 1465851459, 0),
(280, 1, 1, 'moodle/tag:manage', 1, 1465851459, 0),
(281, 1, 1, 'moodle/tag:create', 1, 1465851459, 0),
(282, 1, 7, 'moodle/tag:create', 1, 1465851459, 0),
(283, 1, 1, 'moodle/tag:edit', 1, 1465851459, 0),
(284, 1, 7, 'moodle/tag:edit', 1, 1465851459, 0),
(285, 1, 1, 'moodle/tag:flag', 1, 1465851459, 0),
(286, 1, 7, 'moodle/tag:flag', 1, 1465851459, 0),
(287, 1, 4, 'moodle/tag:editblocks', 1, 1465851459, 0),
(288, 1, 3, 'moodle/tag:editblocks', 1, 1465851459, 0),
(289, 1, 1, 'moodle/tag:editblocks', 1, 1465851459, 0),
(290, 1, 6, 'moodle/block:view', 1, 1465851459, 0),
(291, 1, 7, 'moodle/block:view', 1, 1465851459, 0),
(292, 1, 5, 'moodle/block:view', 1, 1465851459, 0),
(293, 1, 4, 'moodle/block:view', 1, 1465851459, 0),
(294, 1, 3, 'moodle/block:view', 1, 1465851459, 0),
(295, 1, 3, 'moodle/block:edit', 1, 1465851459, 0),
(296, 1, 1, 'moodle/block:edit', 1, 1465851459, 0),
(297, 1, 7, 'moodle/portfolio:export', 1, 1465851459, 0),
(298, 1, 5, 'moodle/portfolio:export', 1, 1465851459, 0),
(299, 1, 4, 'moodle/portfolio:export', 1, 1465851459, 0),
(300, 1, 3, 'moodle/portfolio:export', 1, 1465851459, 0),
(301, 1, 8, 'moodle/comment:view', 1, 1465851459, 0),
(302, 1, 6, 'moodle/comment:view', 1, 1465851459, 0),
(303, 1, 7, 'moodle/comment:view', 1, 1465851459, 0),
(304, 1, 5, 'moodle/comment:view', 1, 1465851459, 0),
(305, 1, 4, 'moodle/comment:view', 1, 1465851459, 0),
(306, 1, 3, 'moodle/comment:view', 1, 1465851459, 0),
(307, 1, 1, 'moodle/comment:view', 1, 1465851459, 0),
(308, 1, 7, 'moodle/comment:post', 1, 1465851459, 0),
(309, 1, 5, 'moodle/comment:post', 1, 1465851460, 0),
(310, 1, 4, 'moodle/comment:post', 1, 1465851460, 0),
(311, 1, 3, 'moodle/comment:post', 1, 1465851460, 0),
(312, 1, 1, 'moodle/comment:post', 1, 1465851460, 0),
(313, 1, 3, 'moodle/comment:delete', 1, 1465851460, 0),
(314, 1, 1, 'moodle/comment:delete', 1, 1465851460, 0),
(315, 1, 1, 'moodle/webservice:createtoken', 1, 1465851460, 0),
(316, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1465851460, 0),
(317, 1, 7, 'moodle/rating:view', 1, 1465851460, 0),
(318, 1, 5, 'moodle/rating:view', 1, 1465851460, 0),
(319, 1, 4, 'moodle/rating:view', 1, 1465851460, 0),
(320, 1, 3, 'moodle/rating:view', 1, 1465851460, 0),
(321, 1, 1, 'moodle/rating:view', 1, 1465851460, 0),
(322, 1, 7, 'moodle/rating:viewany', 1, 1465851460, 0),
(323, 1, 5, 'moodle/rating:viewany', 1, 1465851460, 0),
(324, 1, 4, 'moodle/rating:viewany', 1, 1465851460, 0),
(325, 1, 3, 'moodle/rating:viewany', 1, 1465851460, 0),
(326, 1, 1, 'moodle/rating:viewany', 1, 1465851460, 0),
(327, 1, 7, 'moodle/rating:viewall', 1, 1465851460, 0),
(328, 1, 5, 'moodle/rating:viewall', 1, 1465851460, 0),
(329, 1, 4, 'moodle/rating:viewall', 1, 1465851460, 0),
(330, 1, 3, 'moodle/rating:viewall', 1, 1465851460, 0),
(331, 1, 1, 'moodle/rating:viewall', 1, 1465851460, 0),
(332, 1, 7, 'moodle/rating:rate', 1, 1465851460, 0),
(333, 1, 5, 'moodle/rating:rate', 1, 1465851460, 0),
(334, 1, 4, 'moodle/rating:rate', 1, 1465851460, 0),
(335, 1, 3, 'moodle/rating:rate', 1, 1465851460, 0),
(336, 1, 1, 'moodle/rating:rate', 1, 1465851460, 0),
(337, 1, 1, 'moodle/course:publish', 1, 1465851460, 0),
(338, 1, 4, 'moodle/course:markcomplete', 1, 1465851460, 0),
(339, 1, 3, 'moodle/course:markcomplete', 1, 1465851460, 0),
(340, 1, 1, 'moodle/course:markcomplete', 1, 1465851460, 0),
(341, 1, 1, 'moodle/community:add', 1, 1465851460, 0),
(342, 1, 4, 'moodle/community:add', 1, 1465851460, 0),
(343, 1, 3, 'moodle/community:add', 1, 1465851460, 0),
(344, 1, 1, 'moodle/community:download', 1, 1465851460, 0),
(345, 1, 3, 'moodle/community:download', 1, 1465851460, 0),
(346, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1465851460, 0),
(347, 1, 7, 'moodle/badges:viewbadges', 1, 1465851460, 0),
(348, 1, 7, 'moodle/badges:manageownbadges', 1, 1465851460, 0),
(349, 1, 7, 'moodle/badges:viewotherbadges', 1, 1465851460, 0),
(350, 1, 7, 'moodle/badges:earnbadge', 1, 1465851460, 0),
(351, 1, 1, 'moodle/badges:createbadge', 1, 1465851460, 0),
(352, 1, 3, 'moodle/badges:createbadge', 1, 1465851460, 0),
(353, 1, 1, 'moodle/badges:deletebadge', 1, 1465851460, 0),
(354, 1, 3, 'moodle/badges:deletebadge', 1, 1465851460, 0),
(355, 1, 1, 'moodle/badges:configuredetails', 1, 1465851460, 0),
(356, 1, 3, 'moodle/badges:configuredetails', 1, 1465851460, 0),
(357, 1, 1, 'moodle/badges:configurecriteria', 1, 1465851460, 0),
(358, 1, 3, 'moodle/badges:configurecriteria', 1, 1465851460, 0),
(359, 1, 1, 'moodle/badges:configuremessages', 1, 1465851460, 0),
(360, 1, 3, 'moodle/badges:configuremessages', 1, 1465851460, 0),
(361, 1, 1, 'moodle/badges:awardbadge', 1, 1465851460, 0),
(362, 1, 4, 'moodle/badges:awardbadge', 1, 1465851460, 0),
(363, 1, 3, 'moodle/badges:awardbadge', 1, 1465851460, 0),
(364, 1, 1, 'moodle/badges:viewawarded', 1, 1465851460, 0),
(365, 1, 4, 'moodle/badges:viewawarded', 1, 1465851460, 0),
(366, 1, 3, 'moodle/badges:viewawarded', 1, 1465851460, 0),
(367, 1, 6, 'mod/assign:view', 1, 1465851479, 0),
(368, 1, 5, 'mod/assign:view', 1, 1465851479, 0),
(369, 1, 4, 'mod/assign:view', 1, 1465851479, 0),
(370, 1, 3, 'mod/assign:view', 1, 1465851479, 0),
(371, 1, 1, 'mod/assign:view', 1, 1465851479, 0),
(372, 1, 5, 'mod/assign:submit', 1, 1465851479, 0),
(373, 1, 4, 'mod/assign:grade', 1, 1465851479, 0),
(374, 1, 3, 'mod/assign:grade', 1, 1465851479, 0),
(375, 1, 1, 'mod/assign:grade', 1, 1465851479, 0),
(376, 1, 4, 'mod/assign:exportownsubmission', 1, 1465851479, 0),
(377, 1, 3, 'mod/assign:exportownsubmission', 1, 1465851480, 0),
(378, 1, 1, 'mod/assign:exportownsubmission', 1, 1465851480, 0),
(379, 1, 5, 'mod/assign:exportownsubmission', 1, 1465851480, 0),
(380, 1, 3, 'mod/assign:addinstance', 1, 1465851480, 0),
(381, 1, 1, 'mod/assign:addinstance', 1, 1465851480, 0),
(382, 1, 4, 'mod/assign:grantextension', 1, 1465851480, 0),
(383, 1, 3, 'mod/assign:grantextension', 1, 1465851480, 0),
(384, 1, 1, 'mod/assign:grantextension', 1, 1465851480, 0),
(385, 1, 3, 'mod/assign:revealidentities', 1, 1465851480, 0),
(386, 1, 1, 'mod/assign:revealidentities', 1, 1465851480, 0),
(387, 1, 3, 'mod/assign:reviewgrades', 1, 1465851480, 0),
(388, 1, 1, 'mod/assign:reviewgrades', 1, 1465851480, 0),
(389, 1, 3, 'mod/assign:releasegrades', 1, 1465851480, 0),
(390, 1, 1, 'mod/assign:releasegrades', 1, 1465851480, 0),
(391, 1, 3, 'mod/assign:managegrades', 1, 1465851480, 0),
(392, 1, 1, 'mod/assign:managegrades', 1, 1465851480, 0),
(393, 1, 3, 'mod/assign:manageallocations', 1, 1465851480, 0),
(394, 1, 1, 'mod/assign:manageallocations', 1, 1465851480, 0),
(395, 1, 6, 'mod/assignment:view', 1, 1465851481, 0),
(396, 1, 5, 'mod/assignment:view', 1, 1465851481, 0),
(397, 1, 4, 'mod/assignment:view', 1, 1465851481, 0),
(398, 1, 3, 'mod/assignment:view', 1, 1465851481, 0),
(399, 1, 1, 'mod/assignment:view', 1, 1465851481, 0),
(400, 1, 3, 'mod/assignment:addinstance', 1, 1465851481, 0),
(401, 1, 1, 'mod/assignment:addinstance', 1, 1465851481, 0),
(402, 1, 5, 'mod/assignment:submit', 1, 1465851481, 0),
(403, 1, 4, 'mod/assignment:grade', 1, 1465851481, 0),
(404, 1, 3, 'mod/assignment:grade', 1, 1465851481, 0),
(405, 1, 1, 'mod/assignment:grade', 1, 1465851481, 0),
(406, 1, 4, 'mod/assignment:exportownsubmission', 1, 1465851481, 0),
(407, 1, 3, 'mod/assignment:exportownsubmission', 1, 1465851481, 0),
(408, 1, 1, 'mod/assignment:exportownsubmission', 1, 1465851481, 0),
(409, 1, 5, 'mod/assignment:exportownsubmission', 1, 1465851481, 0),
(410, 1, 3, 'mod/book:addinstance', 1, 1465851481, 0),
(411, 1, 1, 'mod/book:addinstance', 1, 1465851481, 0),
(412, 1, 6, 'mod/book:read', 1, 1465851481, 0),
(413, 1, 8, 'mod/book:read', 1, 1465851481, 0),
(414, 1, 5, 'mod/book:read', 1, 1465851481, 0),
(415, 1, 4, 'mod/book:read', 1, 1465851481, 0),
(416, 1, 3, 'mod/book:read', 1, 1465851481, 0),
(417, 1, 1, 'mod/book:read', 1, 1465851481, 0),
(418, 1, 4, 'mod/book:viewhiddenchapters', 1, 1465851481, 0),
(419, 1, 3, 'mod/book:viewhiddenchapters', 1, 1465851481, 0),
(420, 1, 1, 'mod/book:viewhiddenchapters', 1, 1465851481, 0),
(421, 1, 3, 'mod/book:edit', 1, 1465851481, 0),
(422, 1, 1, 'mod/book:edit', 1, 1465851481, 0),
(423, 1, 3, 'mod/chat:addinstance', 1, 1465851482, 0),
(424, 1, 1, 'mod/chat:addinstance', 1, 1465851482, 0),
(425, 1, 5, 'mod/chat:chat', 1, 1465851482, 0),
(426, 1, 4, 'mod/chat:chat', 1, 1465851482, 0),
(427, 1, 3, 'mod/chat:chat', 1, 1465851482, 0),
(428, 1, 1, 'mod/chat:chat', 1, 1465851482, 0),
(429, 1, 5, 'mod/chat:readlog', 1, 1465851482, 0),
(430, 1, 4, 'mod/chat:readlog', 1, 1465851482, 0),
(431, 1, 3, 'mod/chat:readlog', 1, 1465851482, 0),
(432, 1, 1, 'mod/chat:readlog', 1, 1465851483, 0),
(433, 1, 4, 'mod/chat:deletelog', 1, 1465851483, 0),
(434, 1, 3, 'mod/chat:deletelog', 1, 1465851483, 0),
(435, 1, 1, 'mod/chat:deletelog', 1, 1465851483, 0),
(436, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1465851483, 0),
(437, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1465851483, 0),
(438, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1465851483, 0),
(439, 1, 4, 'mod/chat:exportsession', 1, 1465851483, 0),
(440, 1, 3, 'mod/chat:exportsession', 1, 1465851483, 0),
(441, 1, 1, 'mod/chat:exportsession', 1, 1465851483, 0),
(442, 1, 3, 'mod/choice:addinstance', 1, 1465851484, 0),
(443, 1, 1, 'mod/choice:addinstance', 1, 1465851484, 0),
(444, 1, 5, 'mod/choice:choose', 1, 1465851484, 0),
(445, 1, 4, 'mod/choice:choose', 1, 1465851484, 0),
(446, 1, 3, 'mod/choice:choose', 1, 1465851484, 0),
(447, 1, 4, 'mod/choice:readresponses', 1, 1465851484, 0),
(448, 1, 3, 'mod/choice:readresponses', 1, 1465851484, 0),
(449, 1, 1, 'mod/choice:readresponses', 1, 1465851484, 0),
(450, 1, 4, 'mod/choice:deleteresponses', 1, 1465851484, 0),
(451, 1, 3, 'mod/choice:deleteresponses', 1, 1465851484, 0),
(452, 1, 1, 'mod/choice:deleteresponses', 1, 1465851484, 0),
(453, 1, 4, 'mod/choice:downloadresponses', 1, 1465851484, 0),
(454, 1, 3, 'mod/choice:downloadresponses', 1, 1465851484, 0),
(455, 1, 1, 'mod/choice:downloadresponses', 1, 1465851484, 0),
(456, 1, 3, 'mod/data:addinstance', 1, 1465851485, 0),
(457, 1, 1, 'mod/data:addinstance', 1, 1465851485, 0),
(458, 1, 8, 'mod/data:viewentry', 1, 1465851485, 0),
(459, 1, 6, 'mod/data:viewentry', 1, 1465851485, 0),
(460, 1, 5, 'mod/data:viewentry', 1, 1465851485, 0),
(461, 1, 4, 'mod/data:viewentry', 1, 1465851485, 0),
(462, 1, 3, 'mod/data:viewentry', 1, 1465851485, 0),
(463, 1, 1, 'mod/data:viewentry', 1, 1465851485, 0),
(464, 1, 5, 'mod/data:writeentry', 1, 1465851485, 0),
(465, 1, 4, 'mod/data:writeentry', 1, 1465851485, 0),
(466, 1, 3, 'mod/data:writeentry', 1, 1465851485, 0),
(467, 1, 1, 'mod/data:writeentry', 1, 1465851485, 0),
(468, 1, 5, 'mod/data:comment', 1, 1465851485, 0),
(469, 1, 4, 'mod/data:comment', 1, 1465851485, 0),
(470, 1, 3, 'mod/data:comment', 1, 1465851485, 0),
(471, 1, 1, 'mod/data:comment', 1, 1465851485, 0),
(472, 1, 4, 'mod/data:rate', 1, 1465851485, 0),
(473, 1, 3, 'mod/data:rate', 1, 1465851485, 0),
(474, 1, 1, 'mod/data:rate', 1, 1465851485, 0),
(475, 1, 4, 'mod/data:viewrating', 1, 1465851485, 0),
(476, 1, 3, 'mod/data:viewrating', 1, 1465851485, 0),
(477, 1, 1, 'mod/data:viewrating', 1, 1465851485, 0),
(478, 1, 4, 'mod/data:viewanyrating', 1, 1465851485, 0),
(479, 1, 3, 'mod/data:viewanyrating', 1, 1465851486, 0),
(480, 1, 1, 'mod/data:viewanyrating', 1, 1465851486, 0),
(481, 1, 4, 'mod/data:viewallratings', 1, 1465851486, 0),
(482, 1, 3, 'mod/data:viewallratings', 1, 1465851486, 0),
(483, 1, 1, 'mod/data:viewallratings', 1, 1465851486, 0),
(484, 1, 4, 'mod/data:approve', 1, 1465851486, 0),
(485, 1, 3, 'mod/data:approve', 1, 1465851486, 0),
(486, 1, 1, 'mod/data:approve', 1, 1465851486, 0),
(487, 1, 4, 'mod/data:manageentries', 1, 1465851486, 0),
(488, 1, 3, 'mod/data:manageentries', 1, 1465851486, 0),
(489, 1, 1, 'mod/data:manageentries', 1, 1465851486, 0),
(490, 1, 4, 'mod/data:managecomments', 1, 1465851486, 0),
(491, 1, 3, 'mod/data:managecomments', 1, 1465851486, 0),
(492, 1, 1, 'mod/data:managecomments', 1, 1465851486, 0),
(493, 1, 3, 'mod/data:managetemplates', 1, 1465851486, 0),
(494, 1, 1, 'mod/data:managetemplates', 1, 1465851486, 0),
(495, 1, 4, 'mod/data:viewalluserpresets', 1, 1465851486, 0),
(496, 1, 3, 'mod/data:viewalluserpresets', 1, 1465851486, 0),
(497, 1, 1, 'mod/data:viewalluserpresets', 1, 1465851486, 0),
(498, 1, 1, 'mod/data:manageuserpresets', 1, 1465851486, 0),
(499, 1, 1, 'mod/data:exportentry', 1, 1465851486, 0),
(500, 1, 4, 'mod/data:exportentry', 1, 1465851486, 0),
(501, 1, 3, 'mod/data:exportentry', 1, 1465851486, 0),
(502, 1, 1, 'mod/data:exportownentry', 1, 1465851486, 0),
(503, 1, 4, 'mod/data:exportownentry', 1, 1465851486, 0),
(504, 1, 3, 'mod/data:exportownentry', 1, 1465851486, 0),
(505, 1, 5, 'mod/data:exportownentry', 1, 1465851486, 0),
(506, 1, 1, 'mod/data:exportallentries', 1, 1465851486, 0),
(507, 1, 4, 'mod/data:exportallentries', 1, 1465851486, 0),
(508, 1, 3, 'mod/data:exportallentries', 1, 1465851486, 0),
(509, 1, 1, 'mod/data:exportuserinfo', 1, 1465851486, 0),
(510, 1, 4, 'mod/data:exportuserinfo', 1, 1465851486, 0),
(511, 1, 3, 'mod/data:exportuserinfo', 1, 1465851486, 0),
(512, 1, 3, 'mod/feedback:addinstance', 1, 1465851488, 0),
(513, 1, 1, 'mod/feedback:addinstance', 1, 1465851488, 0),
(514, 1, 6, 'mod/feedback:view', 1, 1465851488, 0),
(515, 1, 5, 'mod/feedback:view', 1, 1465851488, 0),
(516, 1, 4, 'mod/feedback:view', 1, 1465851488, 0),
(517, 1, 3, 'mod/feedback:view', 1, 1465851488, 0),
(518, 1, 1, 'mod/feedback:view', 1, 1465851488, 0),
(519, 1, 5, 'mod/feedback:complete', 1, 1465851488, 0),
(520, 1, 5, 'mod/feedback:viewanalysepage', 1, 1465851488, 0),
(521, 1, 3, 'mod/feedback:viewanalysepage', 1, 1465851488, 0),
(522, 1, 1, 'mod/feedback:viewanalysepage', 1, 1465851488, 0),
(523, 1, 3, 'mod/feedback:deletesubmissions', 1, 1465851488, 0),
(524, 1, 1, 'mod/feedback:deletesubmissions', 1, 1465851488, 0),
(525, 1, 1, 'mod/feedback:mapcourse', 1, 1465851488, 0),
(526, 1, 3, 'mod/feedback:edititems', 1, 1465851489, 0),
(527, 1, 1, 'mod/feedback:edititems', 1, 1465851489, 0),
(528, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1465851489, 0),
(529, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1465851489, 0),
(530, 1, 3, 'mod/feedback:createpublictemplate', 1, 1465851489, 0),
(531, 1, 1, 'mod/feedback:createpublictemplate', 1, 1465851489, 0),
(532, 1, 3, 'mod/feedback:deletetemplate', 1, 1465851489, 0),
(533, 1, 1, 'mod/feedback:deletetemplate', 1, 1465851489, 0),
(534, 1, 4, 'mod/feedback:viewreports', 1, 1465851489, 0),
(535, 1, 3, 'mod/feedback:viewreports', 1, 1465851489, 0),
(536, 1, 1, 'mod/feedback:viewreports', 1, 1465851489, 0),
(537, 1, 4, 'mod/feedback:receivemail', 1, 1465851489, 0),
(538, 1, 3, 'mod/feedback:receivemail', 1, 1465851489, 0),
(539, 1, 3, 'mod/folder:addinstance', 1, 1465851489, 0),
(540, 1, 1, 'mod/folder:addinstance', 1, 1465851489, 0),
(541, 1, 6, 'mod/folder:view', 1, 1465851489, 0),
(542, 1, 7, 'mod/folder:view', 1, 1465851489, 0),
(543, 1, 3, 'mod/folder:managefiles', 1, 1465851489, 0),
(544, 1, 3, 'mod/forum:addinstance', 1, 1465851491, 0),
(545, 1, 1, 'mod/forum:addinstance', 1, 1465851491, 0),
(546, 1, 8, 'mod/forum:viewdiscussion', 1, 1465851491, 0),
(547, 1, 6, 'mod/forum:viewdiscussion', 1, 1465851491, 0),
(548, 1, 5, 'mod/forum:viewdiscussion', 1, 1465851491, 0),
(549, 1, 4, 'mod/forum:viewdiscussion', 1, 1465851491, 0),
(550, 1, 3, 'mod/forum:viewdiscussion', 1, 1465851491, 0),
(551, 1, 1, 'mod/forum:viewdiscussion', 1, 1465851491, 0),
(552, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1465851491, 0),
(553, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1465851491, 0),
(554, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1465851491, 0),
(555, 1, 5, 'mod/forum:startdiscussion', 1, 1465851491, 0),
(556, 1, 4, 'mod/forum:startdiscussion', 1, 1465851492, 0),
(557, 1, 3, 'mod/forum:startdiscussion', 1, 1465851492, 0),
(558, 1, 1, 'mod/forum:startdiscussion', 1, 1465851492, 0),
(559, 1, 5, 'mod/forum:replypost', 1, 1465851492, 0),
(560, 1, 4, 'mod/forum:replypost', 1, 1465851492, 0),
(561, 1, 3, 'mod/forum:replypost', 1, 1465851492, 0),
(562, 1, 1, 'mod/forum:replypost', 1, 1465851492, 0),
(563, 1, 4, 'mod/forum:addnews', 1, 1465851492, 0),
(564, 1, 3, 'mod/forum:addnews', 1, 1465851492, 0),
(565, 1, 1, 'mod/forum:addnews', 1, 1465851492, 0),
(566, 1, 4, 'mod/forum:replynews', 1, 1465851492, 0),
(567, 1, 3, 'mod/forum:replynews', 1, 1465851492, 0),
(568, 1, 1, 'mod/forum:replynews', 1, 1465851492, 0),
(569, 1, 5, 'mod/forum:viewrating', 1, 1465851492, 0),
(570, 1, 4, 'mod/forum:viewrating', 1, 1465851492, 0),
(571, 1, 3, 'mod/forum:viewrating', 1, 1465851492, 0),
(572, 1, 1, 'mod/forum:viewrating', 1, 1465851492, 0),
(573, 1, 4, 'mod/forum:viewanyrating', 1, 1465851492, 0),
(574, 1, 3, 'mod/forum:viewanyrating', 1, 1465851492, 0),
(575, 1, 1, 'mod/forum:viewanyrating', 1, 1465851492, 0),
(576, 1, 4, 'mod/forum:viewallratings', 1, 1465851492, 0),
(577, 1, 3, 'mod/forum:viewallratings', 1, 1465851492, 0),
(578, 1, 1, 'mod/forum:viewallratings', 1, 1465851492, 0),
(579, 1, 4, 'mod/forum:rate', 1, 1465851492, 0),
(580, 1, 3, 'mod/forum:rate', 1, 1465851492, 0),
(581, 1, 1, 'mod/forum:rate', 1, 1465851492, 0),
(582, 1, 5, 'mod/forum:createattachment', 1, 1465851492, 0),
(583, 1, 4, 'mod/forum:createattachment', 1, 1465851492, 0),
(584, 1, 3, 'mod/forum:createattachment', 1, 1465851492, 0),
(585, 1, 1, 'mod/forum:createattachment', 1, 1465851492, 0),
(586, 1, 5, 'mod/forum:deleteownpost', 1, 1465851492, 0),
(587, 1, 4, 'mod/forum:deleteownpost', 1, 1465851492, 0),
(588, 1, 3, 'mod/forum:deleteownpost', 1, 1465851492, 0),
(589, 1, 1, 'mod/forum:deleteownpost', 1, 1465851492, 0),
(590, 1, 4, 'mod/forum:deleteanypost', 1, 1465851492, 0),
(591, 1, 3, 'mod/forum:deleteanypost', 1, 1465851492, 0),
(592, 1, 1, 'mod/forum:deleteanypost', 1, 1465851492, 0),
(593, 1, 4, 'mod/forum:splitdiscussions', 1, 1465851492, 0),
(594, 1, 3, 'mod/forum:splitdiscussions', 1, 1465851492, 0),
(595, 1, 1, 'mod/forum:splitdiscussions', 1, 1465851492, 0),
(596, 1, 4, 'mod/forum:movediscussions', 1, 1465851492, 0),
(597, 1, 3, 'mod/forum:movediscussions', 1, 1465851492, 0),
(598, 1, 1, 'mod/forum:movediscussions', 1, 1465851492, 0),
(599, 1, 4, 'mod/forum:editanypost', 1, 1465851492, 0),
(600, 1, 3, 'mod/forum:editanypost', 1, 1465851492, 0),
(601, 1, 1, 'mod/forum:editanypost', 1, 1465851492, 0),
(602, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1465851493, 0),
(603, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1465851493, 0),
(604, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1465851493, 0),
(605, 1, 4, 'mod/forum:viewsubscribers', 1, 1465851493, 0),
(606, 1, 3, 'mod/forum:viewsubscribers', 1, 1465851493, 0),
(607, 1, 1, 'mod/forum:viewsubscribers', 1, 1465851493, 0),
(608, 1, 4, 'mod/forum:managesubscriptions', 1, 1465851493, 0),
(609, 1, 3, 'mod/forum:managesubscriptions', 1, 1465851493, 0),
(610, 1, 1, 'mod/forum:managesubscriptions', 1, 1465851493, 0),
(611, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1465851493, 0),
(612, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1465851493, 0),
(613, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1465851493, 0),
(614, 1, 4, 'mod/forum:exportdiscussion', 1, 1465851493, 0),
(615, 1, 3, 'mod/forum:exportdiscussion', 1, 1465851493, 0),
(616, 1, 1, 'mod/forum:exportdiscussion', 1, 1465851493, 0),
(617, 1, 4, 'mod/forum:exportpost', 1, 1465851493, 0),
(618, 1, 3, 'mod/forum:exportpost', 1, 1465851493, 0),
(619, 1, 1, 'mod/forum:exportpost', 1, 1465851493, 0),
(620, 1, 4, 'mod/forum:exportownpost', 1, 1465851493, 0),
(621, 1, 3, 'mod/forum:exportownpost', 1, 1465851493, 0),
(622, 1, 1, 'mod/forum:exportownpost', 1, 1465851493, 0),
(623, 1, 5, 'mod/forum:exportownpost', 1, 1465851493, 0),
(624, 1, 4, 'mod/forum:addquestion', 1, 1465851493, 0),
(625, 1, 3, 'mod/forum:addquestion', 1, 1465851493, 0),
(626, 1, 1, 'mod/forum:addquestion', 1, 1465851493, 0),
(627, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1465851493, 0),
(628, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1465851493, 0),
(629, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1465851493, 0),
(630, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1465851493, 0),
(631, 1, 3, 'mod/glossary:addinstance', 1, 1465851495, 0),
(632, 1, 1, 'mod/glossary:addinstance', 1, 1465851495, 0),
(633, 1, 8, 'mod/glossary:view', 1, 1465851495, 0),
(634, 1, 6, 'mod/glossary:view', 1, 1465851495, 0),
(635, 1, 5, 'mod/glossary:view', 1, 1465851495, 0),
(636, 1, 4, 'mod/glossary:view', 1, 1465851495, 0),
(637, 1, 3, 'mod/glossary:view', 1, 1465851495, 0),
(638, 1, 1, 'mod/glossary:view', 1, 1465851495, 0),
(639, 1, 5, 'mod/glossary:write', 1, 1465851495, 0),
(640, 1, 4, 'mod/glossary:write', 1, 1465851495, 0),
(641, 1, 3, 'mod/glossary:write', 1, 1465851495, 0),
(642, 1, 1, 'mod/glossary:write', 1, 1465851495, 0),
(643, 1, 4, 'mod/glossary:manageentries', 1, 1465851495, 0),
(644, 1, 3, 'mod/glossary:manageentries', 1, 1465851495, 0),
(645, 1, 1, 'mod/glossary:manageentries', 1, 1465851495, 0),
(646, 1, 4, 'mod/glossary:managecategories', 1, 1465851495, 0),
(647, 1, 3, 'mod/glossary:managecategories', 1, 1465851495, 0),
(648, 1, 1, 'mod/glossary:managecategories', 1, 1465851495, 0),
(649, 1, 5, 'mod/glossary:comment', 1, 1465851495, 0),
(650, 1, 4, 'mod/glossary:comment', 1, 1465851495, 0),
(651, 1, 3, 'mod/glossary:comment', 1, 1465851495, 0),
(652, 1, 1, 'mod/glossary:comment', 1, 1465851495, 0),
(653, 1, 4, 'mod/glossary:managecomments', 1, 1465851495, 0),
(654, 1, 3, 'mod/glossary:managecomments', 1, 1465851495, 0),
(655, 1, 1, 'mod/glossary:managecomments', 1, 1465851495, 0),
(656, 1, 4, 'mod/glossary:import', 1, 1465851495, 0),
(657, 1, 3, 'mod/glossary:import', 1, 1465851495, 0),
(658, 1, 1, 'mod/glossary:import', 1, 1465851495, 0),
(659, 1, 4, 'mod/glossary:export', 1, 1465851495, 0),
(660, 1, 3, 'mod/glossary:export', 1, 1465851495, 0),
(661, 1, 1, 'mod/glossary:export', 1, 1465851495, 0),
(662, 1, 4, 'mod/glossary:approve', 1, 1465851495, 0),
(663, 1, 3, 'mod/glossary:approve', 1, 1465851495, 0),
(664, 1, 1, 'mod/glossary:approve', 1, 1465851495, 0),
(665, 1, 4, 'mod/glossary:rate', 1, 1465851495, 0),
(666, 1, 3, 'mod/glossary:rate', 1, 1465851495, 0),
(667, 1, 1, 'mod/glossary:rate', 1, 1465851495, 0),
(668, 1, 4, 'mod/glossary:viewrating', 1, 1465851495, 0),
(669, 1, 3, 'mod/glossary:viewrating', 1, 1465851495, 0),
(670, 1, 1, 'mod/glossary:viewrating', 1, 1465851495, 0),
(671, 1, 4, 'mod/glossary:viewanyrating', 1, 1465851495, 0),
(672, 1, 3, 'mod/glossary:viewanyrating', 1, 1465851495, 0),
(673, 1, 1, 'mod/glossary:viewanyrating', 1, 1465851495, 0),
(674, 1, 4, 'mod/glossary:viewallratings', 1, 1465851495, 0),
(675, 1, 3, 'mod/glossary:viewallratings', 1, 1465851495, 0),
(676, 1, 1, 'mod/glossary:viewallratings', 1, 1465851496, 0),
(677, 1, 4, 'mod/glossary:exportentry', 1, 1465851496, 0),
(678, 1, 3, 'mod/glossary:exportentry', 1, 1465851496, 0),
(679, 1, 1, 'mod/glossary:exportentry', 1, 1465851496, 0),
(680, 1, 4, 'mod/glossary:exportownentry', 1, 1465851496, 0),
(681, 1, 3, 'mod/glossary:exportownentry', 1, 1465851496, 0),
(682, 1, 1, 'mod/glossary:exportownentry', 1, 1465851496, 0),
(683, 1, 5, 'mod/glossary:exportownentry', 1, 1465851496, 0),
(684, 1, 6, 'mod/imscp:view', 1, 1465851496, 0),
(685, 1, 7, 'mod/imscp:view', 1, 1465851496, 0),
(686, 1, 3, 'mod/imscp:addinstance', 1, 1465851496, 0),
(687, 1, 1, 'mod/imscp:addinstance', 1, 1465851496, 0),
(688, 1, 3, 'mod/label:addinstance', 1, 1465851497, 0),
(689, 1, 1, 'mod/label:addinstance', 1, 1465851497, 0),
(690, 1, 3, 'mod/lesson:addinstance', 1, 1465851499, 0),
(691, 1, 1, 'mod/lesson:addinstance', 1, 1465851499, 0),
(692, 1, 3, 'mod/lesson:edit', 1, 1465851499, 0),
(693, 1, 1, 'mod/lesson:edit', 1, 1465851499, 0),
(694, 1, 4, 'mod/lesson:manage', 1, 1465851499, 0),
(695, 1, 3, 'mod/lesson:manage', 1, 1465851499, 0),
(696, 1, 1, 'mod/lesson:manage', 1, 1465851499, 0),
(697, 1, 5, 'mod/lti:view', 1, 1465851500, 0),
(698, 1, 4, 'mod/lti:view', 1, 1465851500, 0),
(699, 1, 3, 'mod/lti:view', 1, 1465851500, 0),
(700, 1, 1, 'mod/lti:view', 1, 1465851500, 0),
(701, 1, 3, 'mod/lti:addinstance', 1, 1465851500, 0),
(702, 1, 1, 'mod/lti:addinstance', 1, 1465851500, 0),
(703, 1, 4, 'mod/lti:grade', 1, 1465851500, 0),
(704, 1, 3, 'mod/lti:grade', 1, 1465851500, 0),
(705, 1, 1, 'mod/lti:grade', 1, 1465851500, 0),
(706, 1, 4, 'mod/lti:manage', 1, 1465851500, 0),
(707, 1, 3, 'mod/lti:manage', 1, 1465851500, 0),
(708, 1, 1, 'mod/lti:manage', 1, 1465851500, 0),
(709, 1, 3, 'mod/lti:addcoursetool', 1, 1465851500, 0),
(710, 1, 1, 'mod/lti:addcoursetool', 1, 1465851500, 0),
(711, 1, 3, 'mod/lti:requesttooladd', 1, 1465851500, 0),
(712, 1, 1, 'mod/lti:requesttooladd', 1, 1465851500, 0),
(713, 1, 6, 'mod/page:view', 1, 1465851500, 0),
(714, 1, 7, 'mod/page:view', 1, 1465851501, 0),
(715, 1, 3, 'mod/page:addinstance', 1, 1465851501, 0),
(716, 1, 1, 'mod/page:addinstance', 1, 1465851501, 0),
(717, 1, 6, 'mod/quiz:view', 1, 1465851502, 0),
(718, 1, 5, 'mod/quiz:view', 1, 1465851502, 0),
(719, 1, 4, 'mod/quiz:view', 1, 1465851502, 0),
(720, 1, 3, 'mod/quiz:view', 1, 1465851502, 0),
(721, 1, 1, 'mod/quiz:view', 1, 1465851502, 0),
(722, 1, 3, 'mod/quiz:addinstance', 1, 1465851502, 0),
(723, 1, 1, 'mod/quiz:addinstance', 1, 1465851503, 0),
(724, 1, 5, 'mod/quiz:attempt', 1, 1465851503, 0),
(725, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1465851503, 0),
(726, 1, 3, 'mod/quiz:manage', 1, 1465851503, 0),
(727, 1, 1, 'mod/quiz:manage', 1, 1465851503, 0),
(728, 1, 3, 'mod/quiz:manageoverrides', 1, 1465851503, 0),
(729, 1, 1, 'mod/quiz:manageoverrides', 1, 1465851503, 0),
(730, 1, 4, 'mod/quiz:preview', 1, 1465851503, 0),
(731, 1, 3, 'mod/quiz:preview', 1, 1465851503, 0),
(732, 1, 1, 'mod/quiz:preview', 1, 1465851503, 0),
(733, 1, 4, 'mod/quiz:grade', 1, 1465851503, 0),
(734, 1, 3, 'mod/quiz:grade', 1, 1465851503, 0),
(735, 1, 1, 'mod/quiz:grade', 1, 1465851503, 0),
(736, 1, 4, 'mod/quiz:regrade', 1, 1465851503, 0),
(737, 1, 3, 'mod/quiz:regrade', 1, 1465851503, 0),
(738, 1, 1, 'mod/quiz:regrade', 1, 1465851503, 0),
(739, 1, 4, 'mod/quiz:viewreports', 1, 1465851503, 0),
(740, 1, 3, 'mod/quiz:viewreports', 1, 1465851503, 0),
(741, 1, 1, 'mod/quiz:viewreports', 1, 1465851503, 0),
(742, 1, 3, 'mod/quiz:deleteattempts', 1, 1465851503, 0),
(743, 1, 1, 'mod/quiz:deleteattempts', 1, 1465851503, 0),
(744, 1, 6, 'mod/resource:view', 1, 1465851504, 0),
(745, 1, 7, 'mod/resource:view', 1, 1465851504, 0),
(746, 1, 3, 'mod/resource:addinstance', 1, 1465851504, 0),
(747, 1, 1, 'mod/resource:addinstance', 1, 1465851504, 0),
(748, 1, 3, 'mod/scorm:addinstance', 1, 1465851507, 0),
(749, 1, 1, 'mod/scorm:addinstance', 1, 1465851507, 0),
(750, 1, 4, 'mod/scorm:viewreport', 1, 1465851507, 0),
(751, 1, 3, 'mod/scorm:viewreport', 1, 1465851507, 0),
(752, 1, 1, 'mod/scorm:viewreport', 1, 1465851507, 0),
(753, 1, 5, 'mod/scorm:skipview', 1, 1465851507, 0),
(754, 1, 5, 'mod/scorm:savetrack', 1, 1465851507, 0),
(755, 1, 4, 'mod/scorm:savetrack', 1, 1465851507, 0),
(756, 1, 3, 'mod/scorm:savetrack', 1, 1465851507, 0),
(757, 1, 1, 'mod/scorm:savetrack', 1, 1465851507, 0),
(758, 1, 5, 'mod/scorm:viewscores', 1, 1465851507, 0),
(759, 1, 4, 'mod/scorm:viewscores', 1, 1465851507, 0),
(760, 1, 3, 'mod/scorm:viewscores', 1, 1465851507, 0),
(761, 1, 1, 'mod/scorm:viewscores', 1, 1465851507, 0),
(762, 1, 4, 'mod/scorm:deleteresponses', 1, 1465851507, 0),
(763, 1, 3, 'mod/scorm:deleteresponses', 1, 1465851507, 0),
(764, 1, 1, 'mod/scorm:deleteresponses', 1, 1465851507, 0),
(765, 1, 3, 'mod/survey:addinstance', 1, 1465851509, 0),
(766, 1, 1, 'mod/survey:addinstance', 1, 1465851509, 0),
(767, 1, 5, 'mod/survey:participate', 1, 1465851509, 0),
(768, 1, 4, 'mod/survey:participate', 1, 1465851509, 0),
(769, 1, 3, 'mod/survey:participate', 1, 1465851509, 0),
(770, 1, 1, 'mod/survey:participate', 1, 1465851509, 0),
(771, 1, 4, 'mod/survey:readresponses', 1, 1465851509, 0),
(772, 1, 3, 'mod/survey:readresponses', 1, 1465851509, 0),
(773, 1, 1, 'mod/survey:readresponses', 1, 1465851509, 0),
(774, 1, 4, 'mod/survey:download', 1, 1465851509, 0),
(775, 1, 3, 'mod/survey:download', 1, 1465851509, 0),
(776, 1, 1, 'mod/survey:download', 1, 1465851509, 0),
(777, 1, 6, 'mod/url:view', 1, 1465851510, 0),
(778, 1, 7, 'mod/url:view', 1, 1465851510, 0),
(779, 1, 3, 'mod/url:addinstance', 1, 1465851510, 0),
(780, 1, 1, 'mod/url:addinstance', 1, 1465851510, 0),
(781, 1, 3, 'mod/wiki:addinstance', 1, 1465851511, 0),
(782, 1, 1, 'mod/wiki:addinstance', 1, 1465851511, 0),
(783, 1, 6, 'mod/wiki:viewpage', 1, 1465851511, 0),
(784, 1, 5, 'mod/wiki:viewpage', 1, 1465851511, 0),
(785, 1, 4, 'mod/wiki:viewpage', 1, 1465851511, 0),
(786, 1, 3, 'mod/wiki:viewpage', 1, 1465851511, 0),
(787, 1, 1, 'mod/wiki:viewpage', 1, 1465851511, 0),
(788, 1, 5, 'mod/wiki:editpage', 1, 1465851511, 0),
(789, 1, 4, 'mod/wiki:editpage', 1, 1465851512, 0),
(790, 1, 3, 'mod/wiki:editpage', 1, 1465851512, 0),
(791, 1, 1, 'mod/wiki:editpage', 1, 1465851512, 0),
(792, 1, 5, 'mod/wiki:createpage', 1, 1465851512, 0),
(793, 1, 4, 'mod/wiki:createpage', 1, 1465851512, 0),
(794, 1, 3, 'mod/wiki:createpage', 1, 1465851512, 0),
(795, 1, 1, 'mod/wiki:createpage', 1, 1465851512, 0),
(796, 1, 5, 'mod/wiki:viewcomment', 1, 1465851512, 0),
(797, 1, 4, 'mod/wiki:viewcomment', 1, 1465851512, 0),
(798, 1, 3, 'mod/wiki:viewcomment', 1, 1465851512, 0),
(799, 1, 1, 'mod/wiki:viewcomment', 1, 1465851512, 0),
(800, 1, 5, 'mod/wiki:editcomment', 1, 1465851512, 0),
(801, 1, 4, 'mod/wiki:editcomment', 1, 1465851512, 0),
(802, 1, 3, 'mod/wiki:editcomment', 1, 1465851512, 0),
(803, 1, 1, 'mod/wiki:editcomment', 1, 1465851512, 0),
(804, 1, 4, 'mod/wiki:managecomment', 1, 1465851512, 0),
(805, 1, 3, 'mod/wiki:managecomment', 1, 1465851512, 0),
(806, 1, 1, 'mod/wiki:managecomment', 1, 1465851512, 0),
(807, 1, 4, 'mod/wiki:managefiles', 1, 1465851512, 0),
(808, 1, 3, 'mod/wiki:managefiles', 1, 1465851512, 0),
(809, 1, 1, 'mod/wiki:managefiles', 1, 1465851512, 0),
(810, 1, 4, 'mod/wiki:overridelock', 1, 1465851512, 0),
(811, 1, 3, 'mod/wiki:overridelock', 1, 1465851512, 0),
(812, 1, 1, 'mod/wiki:overridelock', 1, 1465851512, 0),
(813, 1, 4, 'mod/wiki:managewiki', 1, 1465851512, 0),
(814, 1, 3, 'mod/wiki:managewiki', 1, 1465851512, 0),
(815, 1, 1, 'mod/wiki:managewiki', 1, 1465851512, 0),
(816, 1, 6, 'mod/workshop:view', 1, 1465851515, 0),
(817, 1, 5, 'mod/workshop:view', 1, 1465851515, 0),
(818, 1, 4, 'mod/workshop:view', 1, 1465851515, 0),
(819, 1, 3, 'mod/workshop:view', 1, 1465851515, 0),
(820, 1, 1, 'mod/workshop:view', 1, 1465851515, 0),
(821, 1, 3, 'mod/workshop:addinstance', 1, 1465851515, 0),
(822, 1, 1, 'mod/workshop:addinstance', 1, 1465851515, 0),
(823, 1, 4, 'mod/workshop:switchphase', 1, 1465851515, 0),
(824, 1, 3, 'mod/workshop:switchphase', 1, 1465851515, 0),
(825, 1, 1, 'mod/workshop:switchphase', 1, 1465851515, 0),
(826, 1, 3, 'mod/workshop:editdimensions', 1, 1465851515, 0),
(827, 1, 1, 'mod/workshop:editdimensions', 1, 1465851515, 0),
(828, 1, 5, 'mod/workshop:submit', 1, 1465851515, 0),
(829, 1, 5, 'mod/workshop:peerassess', 1, 1465851515, 0),
(830, 1, 4, 'mod/workshop:manageexamples', 1, 1465851515, 0),
(831, 1, 3, 'mod/workshop:manageexamples', 1, 1465851515, 0),
(832, 1, 1, 'mod/workshop:manageexamples', 1, 1465851515, 0),
(833, 1, 4, 'mod/workshop:allocate', 1, 1465851515, 0),
(834, 1, 3, 'mod/workshop:allocate', 1, 1465851516, 0),
(835, 1, 1, 'mod/workshop:allocate', 1, 1465851516, 0),
(836, 1, 4, 'mod/workshop:publishsubmissions', 1, 1465851516, 0),
(837, 1, 3, 'mod/workshop:publishsubmissions', 1, 1465851516, 0),
(838, 1, 1, 'mod/workshop:publishsubmissions', 1, 1465851516, 0),
(839, 1, 5, 'mod/workshop:viewauthornames', 1, 1465851516, 0),
(840, 1, 4, 'mod/workshop:viewauthornames', 1, 1465851516, 0),
(841, 1, 3, 'mod/workshop:viewauthornames', 1, 1465851516, 0),
(842, 1, 1, 'mod/workshop:viewauthornames', 1, 1465851516, 0),
(843, 1, 4, 'mod/workshop:viewreviewernames', 1, 1465851516, 0),
(844, 1, 3, 'mod/workshop:viewreviewernames', 1, 1465851516, 0),
(845, 1, 1, 'mod/workshop:viewreviewernames', 1, 1465851516, 0),
(846, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1465851516, 0),
(847, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1465851516, 0),
(848, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1465851516, 0),
(849, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1465851516, 0),
(850, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1465851516, 0),
(851, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1465851516, 0),
(852, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1465851516, 0),
(853, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1465851516, 0),
(854, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1465851516, 0),
(855, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1465851516, 0),
(856, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1465851516, 0),
(857, 1, 4, 'mod/workshop:viewallassessments', 1, 1465851516, 0),
(858, 1, 3, 'mod/workshop:viewallassessments', 1, 1465851516, 0),
(859, 1, 1, 'mod/workshop:viewallassessments', 1, 1465851516, 0),
(860, 1, 4, 'mod/workshop:overridegrades', 1, 1465851516, 0),
(861, 1, 3, 'mod/workshop:overridegrades', 1, 1465851516, 0),
(862, 1, 1, 'mod/workshop:overridegrades', 1, 1465851516, 0),
(863, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1465851516, 0),
(864, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1465851516, 0),
(865, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1465851516, 0),
(866, 1, 3, 'enrol/cohort:config', 1, 1465851521, 0),
(867, 1, 1, 'enrol/cohort:config', 1, 1465851521, 0),
(868, 1, 1, 'enrol/cohort:unenrol', 1, 1465851521, 0),
(869, 1, 1, 'enrol/database:unenrol', 1, 1465851521, 0),
(870, 1, 1, 'enrol/guest:config', 1, 1465851522, 0),
(871, 1, 3, 'enrol/guest:config', 1, 1465851522, 0),
(872, 1, 1, 'enrol/ldap:manage', 1, 1465851522, 0),
(873, 1, 1, 'enrol/manual:config', 1, 1465851523, 0),
(874, 1, 1, 'enrol/manual:enrol', 1, 1465851523, 0),
(875, 1, 3, 'enrol/manual:enrol', 1, 1465851523, 0),
(876, 1, 1, 'enrol/manual:manage', 1, 1465851523, 0),
(877, 1, 3, 'enrol/manual:manage', 1, 1465851523, 0),
(878, 1, 1, 'enrol/manual:unenrol', 1, 1465851523, 0),
(879, 1, 3, 'enrol/manual:unenrol', 1, 1465851523, 0),
(880, 1, 1, 'enrol/meta:config', 1, 1465851523, 0),
(881, 1, 3, 'enrol/meta:config', 1, 1465851523, 0),
(882, 1, 1, 'enrol/meta:selectaslinked', 1, 1465851523, 0),
(883, 1, 1, 'enrol/meta:unenrol', 1, 1465851523, 0),
(884, 1, 1, 'enrol/paypal:config', 1, 1465851524, 0),
(885, 1, 1, 'enrol/paypal:manage', 1, 1465851524, 0),
(886, 1, 3, 'enrol/paypal:manage', 1, 1465851524, 0),
(887, 1, 1, 'enrol/paypal:unenrol', 1, 1465851524, 0),
(888, 1, 3, 'enrol/self:config', 1, 1465851525, 0),
(889, 1, 1, 'enrol/self:config', 1, 1465851525, 0),
(890, 1, 3, 'enrol/self:manage', 1, 1465851525, 0),
(891, 1, 1, 'enrol/self:manage', 1, 1465851525, 0),
(892, 1, 5, 'enrol/self:unenrolself', 1, 1465851525, 0),
(893, 1, 3, 'enrol/self:unenrol', 1, 1465851525, 0),
(894, 1, 1, 'enrol/self:unenrol', 1, 1465851525, 0),
(895, 1, 3, 'block/activity_modules:addinstance', 1, 1465851527, 0),
(896, 1, 1, 'block/activity_modules:addinstance', 1, 1465851527, 0),
(897, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1465851527, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(898, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1465851527, 0),
(899, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1465851527, 0),
(900, 1, 3, 'block/badges:addinstance', 1, 1465851528, 0),
(901, 1, 1, 'block/badges:addinstance', 1, 1465851528, 0),
(902, 1, 7, 'block/badges:myaddinstance', 1, 1465851528, 0),
(903, 1, 3, 'block/blog_menu:addinstance', 1, 1465851528, 0),
(904, 1, 1, 'block/blog_menu:addinstance', 1, 1465851528, 0),
(905, 1, 3, 'block/blog_recent:addinstance', 1, 1465851528, 0),
(906, 1, 1, 'block/blog_recent:addinstance', 1, 1465851528, 0),
(907, 1, 3, 'block/blog_tags:addinstance', 1, 1465851528, 0),
(908, 1, 1, 'block/blog_tags:addinstance', 1, 1465851528, 0),
(909, 1, 7, 'block/calendar_month:myaddinstance', 1, 1465851528, 0),
(910, 1, 3, 'block/calendar_month:addinstance', 1, 1465851528, 0),
(911, 1, 1, 'block/calendar_month:addinstance', 1, 1465851528, 0),
(912, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1465851528, 0),
(913, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1465851528, 0),
(914, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1465851528, 0),
(915, 1, 7, 'block/comments:myaddinstance', 1, 1465851529, 0),
(916, 1, 3, 'block/comments:addinstance', 1, 1465851529, 0),
(917, 1, 1, 'block/comments:addinstance', 1, 1465851529, 0),
(918, 1, 7, 'block/community:myaddinstance', 1, 1465851529, 0),
(919, 1, 3, 'block/community:addinstance', 1, 1465851529, 0),
(920, 1, 1, 'block/community:addinstance', 1, 1465851529, 0),
(921, 1, 3, 'block/completionstatus:addinstance', 1, 1465851529, 0),
(922, 1, 1, 'block/completionstatus:addinstance', 1, 1465851529, 0),
(923, 1, 7, 'block/course_list:myaddinstance', 1, 1465851529, 0),
(924, 1, 3, 'block/course_list:addinstance', 1, 1465851530, 0),
(925, 1, 1, 'block/course_list:addinstance', 1, 1465851530, 0),
(926, 1, 7, 'block/course_overview:myaddinstance', 1, 1465851530, 0),
(927, 1, 3, 'block/course_overview:addinstance', 1, 1465851530, 0),
(928, 1, 1, 'block/course_overview:addinstance', 1, 1465851530, 0),
(929, 1, 3, 'block/course_summary:addinstance', 1, 1465851530, 0),
(930, 1, 1, 'block/course_summary:addinstance', 1, 1465851530, 0),
(931, 1, 3, 'block/feedback:addinstance', 1, 1465851530, 0),
(932, 1, 1, 'block/feedback:addinstance', 1, 1465851530, 0),
(933, 1, 7, 'block/glossary_random:myaddinstance', 1, 1465851530, 0),
(934, 1, 3, 'block/glossary_random:addinstance', 1, 1465851530, 0),
(935, 1, 1, 'block/glossary_random:addinstance', 1, 1465851530, 0),
(936, 1, 7, 'block/html:myaddinstance', 1, 1465851530, 0),
(937, 1, 3, 'block/html:addinstance', 1, 1465851530, 0),
(938, 1, 1, 'block/html:addinstance', 1, 1465851530, 0),
(939, 1, 3, 'block/login:addinstance', 1, 1465851530, 0),
(940, 1, 1, 'block/login:addinstance', 1, 1465851530, 0),
(941, 1, 7, 'block/mentees:myaddinstance', 1, 1465851531, 0),
(942, 1, 3, 'block/mentees:addinstance', 1, 1465851531, 0),
(943, 1, 1, 'block/mentees:addinstance', 1, 1465851531, 0),
(944, 1, 7, 'block/messages:myaddinstance', 1, 1465851531, 0),
(945, 1, 3, 'block/messages:addinstance', 1, 1465851531, 0),
(946, 1, 1, 'block/messages:addinstance', 1, 1465851531, 0),
(947, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1465851531, 0),
(948, 1, 3, 'block/mnet_hosts:addinstance', 1, 1465851531, 0),
(949, 1, 1, 'block/mnet_hosts:addinstance', 1, 1465851531, 0),
(950, 1, 7, 'block/myprofile:myaddinstance', 1, 1465851531, 0),
(951, 1, 3, 'block/myprofile:addinstance', 1, 1465851531, 0),
(952, 1, 1, 'block/myprofile:addinstance', 1, 1465851531, 0),
(953, 1, 7, 'block/navigation:myaddinstance', 1, 1465851531, 0),
(954, 1, 3, 'block/navigation:addinstance', 1, 1465851531, 0),
(955, 1, 1, 'block/navigation:addinstance', 1, 1465851531, 0),
(956, 1, 7, 'block/news_items:myaddinstance', 1, 1465851531, 0),
(957, 1, 3, 'block/news_items:addinstance', 1, 1465851531, 0),
(958, 1, 1, 'block/news_items:addinstance', 1, 1465851531, 0),
(959, 1, 7, 'block/online_users:myaddinstance', 1, 1465851531, 0),
(960, 1, 3, 'block/online_users:addinstance', 1, 1465851531, 0),
(961, 1, 1, 'block/online_users:addinstance', 1, 1465851531, 0),
(962, 1, 7, 'block/online_users:viewlist', 1, 1465851531, 0),
(963, 1, 6, 'block/online_users:viewlist', 1, 1465851531, 0),
(964, 1, 5, 'block/online_users:viewlist', 1, 1465851531, 0),
(965, 1, 4, 'block/online_users:viewlist', 1, 1465851531, 0),
(966, 1, 3, 'block/online_users:viewlist', 1, 1465851531, 0),
(967, 1, 1, 'block/online_users:viewlist', 1, 1465851531, 0),
(968, 1, 3, 'block/participants:addinstance', 1, 1465851532, 0),
(969, 1, 1, 'block/participants:addinstance', 1, 1465851532, 0),
(970, 1, 7, 'block/private_files:myaddinstance', 1, 1465851532, 0),
(971, 1, 3, 'block/private_files:addinstance', 1, 1465851532, 0),
(972, 1, 1, 'block/private_files:addinstance', 1, 1465851532, 0),
(973, 1, 3, 'block/quiz_results:addinstance', 1, 1465851532, 0),
(974, 1, 1, 'block/quiz_results:addinstance', 1, 1465851532, 0),
(975, 1, 3, 'block/recent_activity:addinstance', 1, 1465851532, 0),
(976, 1, 1, 'block/recent_activity:addinstance', 1, 1465851532, 0),
(977, 1, 7, 'block/rss_client:myaddinstance', 1, 1465851533, 0),
(978, 1, 3, 'block/rss_client:addinstance', 1, 1465851533, 0),
(979, 1, 1, 'block/rss_client:addinstance', 1, 1465851533, 0),
(980, 1, 4, 'block/rss_client:manageownfeeds', 1, 1465851533, 0),
(981, 1, 3, 'block/rss_client:manageownfeeds', 1, 1465851533, 0),
(982, 1, 1, 'block/rss_client:manageownfeeds', 1, 1465851533, 0),
(983, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1465851533, 0),
(984, 1, 3, 'block/search_forums:addinstance', 1, 1465851533, 0),
(985, 1, 1, 'block/search_forums:addinstance', 1, 1465851533, 0),
(986, 1, 3, 'block/section_links:addinstance', 1, 1465851533, 0),
(987, 1, 1, 'block/section_links:addinstance', 1, 1465851533, 0),
(988, 1, 3, 'block/selfcompletion:addinstance', 1, 1465851533, 0),
(989, 1, 1, 'block/selfcompletion:addinstance', 1, 1465851533, 0),
(990, 1, 7, 'block/settings:myaddinstance', 1, 1465851534, 0),
(991, 1, 3, 'block/settings:addinstance', 1, 1465851534, 0),
(992, 1, 1, 'block/settings:addinstance', 1, 1465851534, 0),
(993, 1, 3, 'block/site_main_menu:addinstance', 1, 1465851534, 0),
(994, 1, 1, 'block/site_main_menu:addinstance', 1, 1465851534, 0),
(995, 1, 3, 'block/social_activities:addinstance', 1, 1465851534, 0),
(996, 1, 1, 'block/social_activities:addinstance', 1, 1465851534, 0),
(997, 1, 3, 'block/tag_flickr:addinstance', 1, 1465851534, 0),
(998, 1, 1, 'block/tag_flickr:addinstance', 1, 1465851534, 0),
(999, 1, 3, 'block/tag_youtube:addinstance', 1, 1465851535, 0),
(1000, 1, 1, 'block/tag_youtube:addinstance', 1, 1465851535, 0),
(1001, 1, 7, 'block/tags:myaddinstance', 1, 1465851535, 0),
(1002, 1, 3, 'block/tags:addinstance', 1, 1465851535, 0),
(1003, 1, 1, 'block/tags:addinstance', 1, 1465851535, 0),
(1004, 1, 4, 'report/completion:view', 1, 1465851540, 0),
(1005, 1, 3, 'report/completion:view', 1, 1465851540, 0),
(1006, 1, 1, 'report/completion:view', 1, 1465851540, 0),
(1007, 1, 4, 'report/courseoverview:view', 1, 1465851540, 0),
(1008, 1, 3, 'report/courseoverview:view', 1, 1465851540, 0),
(1009, 1, 1, 'report/courseoverview:view', 1, 1465851540, 0),
(1010, 1, 4, 'report/log:view', 1, 1465851540, 0),
(1011, 1, 3, 'report/log:view', 1, 1465851540, 0),
(1012, 1, 1, 'report/log:view', 1, 1465851540, 0),
(1013, 1, 4, 'report/log:viewtoday', 1, 1465851540, 0),
(1014, 1, 3, 'report/log:viewtoday', 1, 1465851540, 0),
(1015, 1, 1, 'report/log:viewtoday', 1, 1465851540, 0),
(1016, 1, 4, 'report/loglive:view', 1, 1465851540, 0),
(1017, 1, 3, 'report/loglive:view', 1, 1465851540, 0),
(1018, 1, 1, 'report/loglive:view', 1, 1465851540, 0),
(1019, 1, 4, 'report/outline:view', 1, 1465851541, 0),
(1020, 1, 3, 'report/outline:view', 1, 1465851541, 0),
(1021, 1, 1, 'report/outline:view', 1, 1465851541, 0),
(1022, 1, 4, 'report/participation:view', 1, 1465851541, 0),
(1023, 1, 3, 'report/participation:view', 1, 1465851541, 0),
(1024, 1, 1, 'report/participation:view', 1, 1465851541, 0),
(1025, 1, 1, 'report/performance:view', 1, 1465851541, 0),
(1026, 1, 4, 'report/progress:view', 1, 1465851541, 0),
(1027, 1, 3, 'report/progress:view', 1, 1465851541, 0),
(1028, 1, 1, 'report/progress:view', 1, 1465851541, 0),
(1029, 1, 1, 'report/security:view', 1, 1465851542, 0),
(1030, 1, 4, 'report/stats:view', 1, 1465851542, 0),
(1031, 1, 3, 'report/stats:view', 1, 1465851542, 0),
(1032, 1, 1, 'report/stats:view', 1, 1465851542, 0),
(1033, 1, 4, 'gradeexport/ods:view', 1, 1465851542, 0),
(1034, 1, 3, 'gradeexport/ods:view', 1, 1465851542, 0),
(1035, 1, 1, 'gradeexport/ods:view', 1, 1465851542, 0),
(1036, 1, 1, 'gradeexport/ods:publish', 1, 1465851542, 0),
(1037, 1, 4, 'gradeexport/txt:view', 1, 1465851542, 0),
(1038, 1, 3, 'gradeexport/txt:view', 1, 1465851543, 0),
(1039, 1, 1, 'gradeexport/txt:view', 1, 1465851543, 0),
(1040, 1, 1, 'gradeexport/txt:publish', 1, 1465851543, 0),
(1041, 1, 4, 'gradeexport/xls:view', 1, 1465851543, 0),
(1042, 1, 3, 'gradeexport/xls:view', 1, 1465851543, 0),
(1043, 1, 1, 'gradeexport/xls:view', 1, 1465851543, 0),
(1044, 1, 1, 'gradeexport/xls:publish', 1, 1465851543, 0),
(1045, 1, 4, 'gradeexport/xml:view', 1, 1465851543, 0),
(1046, 1, 3, 'gradeexport/xml:view', 1, 1465851543, 0),
(1047, 1, 1, 'gradeexport/xml:view', 1, 1465851543, 0),
(1048, 1, 1, 'gradeexport/xml:publish', 1, 1465851543, 0),
(1049, 1, 3, 'gradeimport/csv:view', 1, 1465851543, 0),
(1050, 1, 1, 'gradeimport/csv:view', 1, 1465851544, 0),
(1051, 1, 3, 'gradeimport/xml:view', 1, 1465851544, 0),
(1052, 1, 1, 'gradeimport/xml:view', 1, 1465851544, 0),
(1053, 1, 1, 'gradeimport/xml:publish', 1, 1465851544, 0),
(1054, 1, 4, 'gradereport/grader:view', 1, 1465851544, 0),
(1055, 1, 3, 'gradereport/grader:view', 1, 1465851544, 0),
(1056, 1, 1, 'gradereport/grader:view', 1, 1465851544, 0),
(1057, 1, 4, 'gradereport/outcomes:view', 1, 1465851544, 0),
(1058, 1, 3, 'gradereport/outcomes:view', 1, 1465851544, 0),
(1059, 1, 1, 'gradereport/outcomes:view', 1, 1465851544, 0),
(1060, 1, 5, 'gradereport/overview:view', 1, 1465851544, 0),
(1061, 1, 1, 'gradereport/overview:view', 1, 1465851545, 0),
(1062, 1, 5, 'gradereport/user:view', 1, 1465851545, 0),
(1063, 1, 4, 'gradereport/user:view', 1, 1465851545, 0),
(1064, 1, 3, 'gradereport/user:view', 1, 1465851545, 0),
(1065, 1, 1, 'gradereport/user:view', 1, 1465851545, 0),
(1066, 1, 7, 'repository/alfresco:view', 1, 1465851548, 0),
(1067, 1, 7, 'repository/areafiles:view', 1, 1465851548, 0),
(1068, 1, 7, 'repository/boxnet:view', 1, 1465851548, 0),
(1069, 1, 2, 'repository/coursefiles:view', 1, 1465851548, 0),
(1070, 1, 4, 'repository/coursefiles:view', 1, 1465851548, 0),
(1071, 1, 3, 'repository/coursefiles:view', 1, 1465851548, 0),
(1072, 1, 1, 'repository/coursefiles:view', 1, 1465851548, 0),
(1073, 1, 7, 'repository/dropbox:view', 1, 1465851549, 0),
(1074, 1, 7, 'repository/equella:view', 1, 1465851549, 0),
(1075, 1, 2, 'repository/filesystem:view', 1, 1465851549, 0),
(1076, 1, 4, 'repository/filesystem:view', 1, 1465851549, 0),
(1077, 1, 3, 'repository/filesystem:view', 1, 1465851549, 0),
(1078, 1, 1, 'repository/filesystem:view', 1, 1465851549, 0),
(1079, 1, 7, 'repository/flickr:view', 1, 1465851549, 0),
(1080, 1, 7, 'repository/flickr_public:view', 1, 1465851550, 0),
(1081, 1, 7, 'repository/googledocs:view', 1, 1465851550, 0),
(1082, 1, 2, 'repository/local:view', 1, 1465851550, 0),
(1083, 1, 4, 'repository/local:view', 1, 1465851550, 0),
(1084, 1, 3, 'repository/local:view', 1, 1465851550, 0),
(1085, 1, 1, 'repository/local:view', 1, 1465851550, 0),
(1086, 1, 7, 'repository/merlot:view', 1, 1465851550, 0),
(1087, 1, 7, 'repository/picasa:view', 1, 1465851550, 0),
(1088, 1, 7, 'repository/recent:view', 1, 1465851551, 0),
(1089, 1, 7, 'repository/s3:view', 1, 1465851551, 0),
(1090, 1, 7, 'repository/skydrive:view', 1, 1465851551, 0),
(1091, 1, 7, 'repository/upload:view', 1, 1465851552, 0),
(1092, 1, 7, 'repository/url:view', 1, 1465851552, 0),
(1093, 1, 7, 'repository/user:view', 1, 1465851552, 0),
(1094, 1, 2, 'repository/webdav:view', 1, 1465851553, 0),
(1095, 1, 4, 'repository/webdav:view', 1, 1465851553, 0),
(1096, 1, 3, 'repository/webdav:view', 1, 1465851553, 0),
(1097, 1, 1, 'repository/webdav:view', 1, 1465851553, 0),
(1098, 1, 7, 'repository/wikimedia:view', 1, 1465851553, 0),
(1099, 1, 7, 'repository/youtube:view', 1, 1465851553, 0),
(1100, 1, 1, 'tool/customlang:view', 1, 1465851557, 0),
(1101, 1, 1, 'tool/customlang:edit', 1, 1465851557, 0),
(1102, 1, 1, 'tool/uploaduser:uploaduserpictures', 1, 1465851559, 0),
(1103, 1, 3, 'booktool/importhtml:import', 1, 1465851565, 0),
(1104, 1, 1, 'booktool/importhtml:import', 1, 1465851565, 0),
(1105, 1, 6, 'booktool/print:print', 1, 1465851565, 0),
(1106, 1, 8, 'booktool/print:print', 1, 1465851565, 0),
(1107, 1, 5, 'booktool/print:print', 1, 1465851565, 0),
(1108, 1, 4, 'booktool/print:print', 1, 1465851565, 0),
(1109, 1, 3, 'booktool/print:print', 1, 1465851565, 0),
(1110, 1, 1, 'booktool/print:print', 1, 1465851565, 0),
(1111, 1, 4, 'quiz/grading:viewstudentnames', 1, 1465851567, 0),
(1112, 1, 3, 'quiz/grading:viewstudentnames', 1, 1465851567, 0),
(1113, 1, 1, 'quiz/grading:viewstudentnames', 1, 1465851567, 0),
(1114, 1, 4, 'quiz/grading:viewidnumber', 1, 1465851567, 0),
(1115, 1, 3, 'quiz/grading:viewidnumber', 1, 1465851567, 0),
(1116, 1, 1, 'quiz/grading:viewidnumber', 1, 1465851567, 0),
(1117, 1, 4, 'quiz/statistics:view', 1, 1465851568, 0),
(1118, 1, 3, 'quiz/statistics:view', 1, 1465851568, 0),
(1119, 1, 1, 'quiz/statistics:view', 1, 1465851568, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_context_levels`
--

CREATE TABLE `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T';

--
-- Volcado de datos para la tabla `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_names`
--

CREATE TABLE `mdl_role_names` (
  `id` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_sortorder`
--

CREATE TABLE `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scale`
--

CREATE TABLE `mdl_scale` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines grading scales';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scale_history`
--

CREATE TABLE `mdl_scale_history` (
  `id` bigint(10) NOT NULL,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm`
--

CREATE TABLE `mdl_scorm` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_aicc_session`
--

CREATE TABLE `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) DEFAULT NULL,
  `scormstatus` varchar(255) DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) DEFAULT NULL,
  `sessiontime` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by AICC HACP to store session information';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_scoes`
--

CREATE TABLE `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` longtext NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_scoes_data`
--

CREATE TABLE `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_scoes_track`
--

CREATE TABLE `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_mapinfo`
--

CREATE TABLE `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_objective`
--

CREATE TABLE `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_rolluprule`
--

CREATE TABLE `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_rulecond`
--

CREATE TABLE `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_ruleconds`
--

CREATE TABLE `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_sessions`
--

CREATE TABLE `mdl_sessions` (
  `id` bigint(10) NOT NULL,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended';

--
-- Volcado de datos para la tabla `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(38, 0, 'sp2f3calm0kta2ihc82kue7nt0', 3, NULL, 1465943217, 1465943428, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(40, 0, 'qgmv1vu8n6ansu62qqn8hde7m1', 2, NULL, 1465943883, 1465943883, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_daily`
--

CREATE TABLE `mdl_stats_daily` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_monthly`
--

CREATE TABLE `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_user_daily`
--

CREATE TABLE `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_user_monthly`
--

CREATE TABLE `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_user_weekly`
--

CREATE TABLE `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_weekly`
--

CREATE TABLE `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey`
--

CREATE TABLE `mdl_survey` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration';

--
-- Volcado de datos para la tabla `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey_analysis`
--

CREATE TABLE `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey_answers`
--

CREATE TABLE `mdl_survey_answers` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext NOT NULL,
  `answer2` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey_questions`
--

CREATE TABLE `mdl_survey_questions` (
  `id` bigint(10) NOT NULL,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey';

--
-- Volcado de datos para la tabla `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tag`
--

CREATE TABLE `mdl_tag` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `tagtype` varchar(255) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tag_correlation`
--

CREATE TABLE `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tag_instance`
--

CREATE TABLE `mdl_tag_instance` (
  `id` bigint(10) NOT NULL,
  `tagid` bigint(10) NOT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_timezone`
--

CREATE TABLE `mdl_timezone` (
  `id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) NOT NULL DEFAULT '00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tool_customlang`
--

CREATE TABLE `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tool_customlang_components`
--

CREATE TABLE `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_upgrade_log`
--

CREATE TABLE `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `targetversion` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` longtext,
  `backtrace` longtext,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Upgrade logging';

--
-- Volcado de datos para la tabla `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2013111811.01', '2013111811.01', 'Upgrade savepoint reached', NULL, '', 0, 1465851461),
(2, 0, 'core', '2013111811.01', '2013111811.01', 'Core installed', NULL, '', 0, 1465851474),
(3, 0, 'qtype_calculated', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851474),
(4, 0, 'qtype_calculated', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851475),
(5, 0, 'qtype_calculated', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851475),
(6, 0, 'qtype_calculatedmulti', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851475),
(7, 0, 'qtype_calculatedmulti', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851475),
(8, 0, 'qtype_calculatedmulti', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851475),
(9, 0, 'qtype_calculatedsimple', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851475),
(10, 0, 'qtype_calculatedsimple', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851475),
(11, 0, 'qtype_calculatedsimple', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851475),
(12, 0, 'qtype_description', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851475),
(13, 0, 'qtype_description', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851476),
(14, 0, 'qtype_description', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851476),
(15, 0, 'qtype_essay', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851476),
(16, 0, 'qtype_essay', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851476),
(17, 0, 'qtype_essay', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851476),
(18, 0, 'qtype_match', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851476),
(19, 0, 'qtype_match', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851476),
(20, 0, 'qtype_match', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851476),
(21, 0, 'qtype_missingtype', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851476),
(22, 0, 'qtype_missingtype', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851476),
(23, 0, 'qtype_missingtype', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851477),
(24, 0, 'qtype_multianswer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851477),
(25, 0, 'qtype_multianswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851477),
(26, 0, 'qtype_multianswer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851477),
(27, 0, 'qtype_multichoice', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851477),
(28, 0, 'qtype_multichoice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851477),
(29, 0, 'qtype_multichoice', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851477),
(30, 0, 'qtype_numerical', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851477),
(31, 0, 'qtype_numerical', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851478),
(32, 0, 'qtype_numerical', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851478),
(33, 0, 'qtype_random', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1465851478),
(34, 0, 'qtype_random', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1465851478),
(35, 0, 'qtype_random', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1465851478),
(36, 0, 'qtype_randomsamatch', NULL, '2013110503', 'Starting plugin installation', NULL, '', 0, 1465851478),
(37, 0, 'qtype_randomsamatch', '2013110503', '2013110503', 'Upgrade savepoint reached', NULL, '', 0, 1465851478),
(38, 0, 'qtype_randomsamatch', '2013110503', '2013110503', 'Plugin installed', NULL, '', 0, 1465851478),
(39, 0, 'qtype_shortanswer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851478),
(40, 0, 'qtype_shortanswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851478),
(41, 0, 'qtype_shortanswer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851478),
(42, 0, 'qtype_truefalse', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851478),
(43, 0, 'qtype_truefalse', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851479),
(44, 0, 'qtype_truefalse', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851479),
(45, 0, 'mod_assign', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1465851479),
(46, 0, 'mod_assign', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1465851479),
(47, 0, 'mod_assign', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1465851480),
(48, 0, 'mod_assignment', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851480),
(49, 0, 'mod_assignment', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851481),
(50, 0, 'mod_assignment', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851481),
(51, 0, 'mod_book', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851481),
(52, 0, 'mod_book', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851481),
(53, 0, 'mod_book', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851482),
(54, 0, 'mod_chat', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851482),
(55, 0, 'mod_chat', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851482),
(56, 0, 'mod_chat', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851483),
(57, 0, 'mod_choice', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851483),
(58, 0, 'mod_choice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851483),
(59, 0, 'mod_choice', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851484),
(60, 0, 'mod_data', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851484),
(61, 0, 'mod_data', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851485),
(62, 0, 'mod_data', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851486),
(63, 0, 'mod_feedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851486),
(64, 0, 'mod_feedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851488),
(65, 0, 'mod_feedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851489),
(66, 0, 'mod_folder', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851489),
(67, 0, 'mod_folder', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851489),
(68, 0, 'mod_folder', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851489),
(69, 0, 'mod_forum', NULL, '2013110502', 'Starting plugin installation', NULL, '', 0, 1465851489),
(70, 0, 'mod_forum', '2013110502', '2013110502', 'Upgrade savepoint reached', NULL, '', 0, 1465851491),
(71, 0, 'mod_forum', '2013110502', '2013110502', 'Plugin installed', NULL, '', 0, 1465851493),
(72, 0, 'mod_glossary', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851494),
(73, 0, 'mod_glossary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851494),
(74, 0, 'mod_glossary', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851496),
(75, 0, 'mod_imscp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851496),
(76, 0, 'mod_imscp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851496),
(77, 0, 'mod_imscp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851496),
(78, 0, 'mod_label', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851496),
(79, 0, 'mod_label', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851497),
(80, 0, 'mod_label', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851497),
(81, 0, 'mod_lesson', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851497),
(82, 0, 'mod_lesson', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851499),
(83, 0, 'mod_lesson', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851499),
(84, 0, 'mod_lti', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851499),
(85, 0, 'mod_lti', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851500),
(86, 0, 'mod_lti', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851500),
(87, 0, 'mod_page', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851500),
(88, 0, 'mod_page', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851500),
(89, 0, 'mod_page', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851501),
(90, 0, 'mod_quiz', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1465851501),
(91, 0, 'mod_quiz', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1465851502),
(92, 0, 'mod_quiz', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1465851503),
(93, 0, 'mod_resource', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851503),
(94, 0, 'mod_resource', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851504),
(95, 0, 'mod_resource', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851504),
(96, 0, 'mod_scorm', NULL, '2013110504', 'Starting plugin installation', NULL, '', 0, 1465851504),
(97, 0, 'mod_scorm', '2013110504', '2013110504', 'Upgrade savepoint reached', NULL, '', 0, 1465851506),
(98, 0, 'mod_scorm', '2013110504', '2013110504', 'Plugin installed', NULL, '', 0, 1465851507),
(99, 0, 'mod_survey', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851507),
(100, 0, 'mod_survey', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851508),
(101, 0, 'mod_survey', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851510),
(102, 0, 'mod_url', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851510),
(103, 0, 'mod_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851510),
(104, 0, 'mod_url', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851510),
(105, 0, 'mod_wiki', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851510),
(106, 0, 'mod_wiki', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851511),
(107, 0, 'mod_wiki', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851512),
(108, 0, 'mod_workshop', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1465851512),
(109, 0, 'mod_workshop', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1465851515),
(110, 0, 'mod_workshop', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1465851517),
(111, 0, 'auth_cas', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851517),
(112, 0, 'auth_cas', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851517),
(113, 0, 'auth_cas', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851517),
(114, 0, 'auth_db', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851517),
(115, 0, 'auth_db', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851517),
(116, 0, 'auth_db', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851517),
(117, 0, 'auth_email', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851517),
(118, 0, 'auth_email', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851517),
(119, 0, 'auth_email', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851517),
(120, 0, 'auth_fc', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851517),
(121, 0, 'auth_fc', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851517),
(122, 0, 'auth_fc', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851517),
(123, 0, 'auth_imap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851517),
(124, 0, 'auth_imap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851517),
(125, 0, 'auth_imap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851518),
(126, 0, 'auth_ldap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851518),
(127, 0, 'auth_ldap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851518),
(128, 0, 'auth_ldap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851518),
(129, 0, 'auth_manual', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851518),
(130, 0, 'auth_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851518),
(131, 0, 'auth_manual', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851518),
(132, 0, 'auth_mnet', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851518),
(133, 0, 'auth_mnet', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851518),
(134, 0, 'auth_mnet', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851519),
(135, 0, 'auth_nntp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851519),
(136, 0, 'auth_nntp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851519),
(137, 0, 'auth_nntp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851519),
(138, 0, 'auth_nologin', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851519),
(139, 0, 'auth_nologin', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851519),
(140, 0, 'auth_nologin', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851519),
(141, 0, 'auth_none', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851519),
(142, 0, 'auth_none', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851519),
(143, 0, 'auth_none', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851519),
(144, 0, 'auth_pam', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851519),
(145, 0, 'auth_pam', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851519),
(146, 0, 'auth_pam', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851520),
(147, 0, 'auth_pop3', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851520),
(148, 0, 'auth_pop3', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851520),
(149, 0, 'auth_pop3', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851520),
(150, 0, 'auth_radius', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851520),
(151, 0, 'auth_radius', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851520),
(152, 0, 'auth_radius', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851520),
(153, 0, 'auth_shibboleth', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851520),
(154, 0, 'auth_shibboleth', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851520),
(155, 0, 'auth_shibboleth', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851520),
(156, 0, 'auth_webservice', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851520),
(157, 0, 'auth_webservice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851520),
(158, 0, 'auth_webservice', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851520),
(159, 0, 'calendartype_gregorian', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851520),
(160, 0, 'calendartype_gregorian', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851520),
(161, 0, 'calendartype_gregorian', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851520),
(162, 0, 'enrol_category', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851520),
(163, 0, 'enrol_category', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851520),
(164, 0, 'enrol_category', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851521),
(165, 0, 'enrol_cohort', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851521),
(166, 0, 'enrol_cohort', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851521),
(167, 0, 'enrol_cohort', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851521),
(168, 0, 'enrol_database', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851521),
(169, 0, 'enrol_database', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851521),
(170, 0, 'enrol_database', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851521),
(171, 0, 'enrol_flatfile', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851521),
(172, 0, 'enrol_flatfile', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851521),
(173, 0, 'enrol_flatfile', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851522),
(174, 0, 'enrol_guest', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851522),
(175, 0, 'enrol_guest', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851522),
(176, 0, 'enrol_guest', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851522),
(177, 0, 'enrol_imsenterprise', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851522),
(178, 0, 'enrol_imsenterprise', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851522),
(179, 0, 'enrol_imsenterprise', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851522),
(180, 0, 'enrol_ldap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851522),
(181, 0, 'enrol_ldap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851522),
(182, 0, 'enrol_ldap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851522),
(183, 0, 'enrol_manual', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851522),
(184, 0, 'enrol_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851522),
(185, 0, 'enrol_manual', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851523),
(186, 0, 'enrol_meta', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851523),
(187, 0, 'enrol_meta', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851523),
(188, 0, 'enrol_meta', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851523),
(189, 0, 'enrol_mnet', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851523),
(190, 0, 'enrol_mnet', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851523),
(191, 0, 'enrol_mnet', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851524),
(192, 0, 'enrol_paypal', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851524),
(193, 0, 'enrol_paypal', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851524),
(194, 0, 'enrol_paypal', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851524),
(195, 0, 'enrol_self', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1465851524),
(196, 0, 'enrol_self', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1465851524),
(197, 0, 'enrol_self', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1465851525),
(198, 0, 'message_email', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851525),
(199, 0, 'message_email', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851525),
(200, 0, 'message_email', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851526),
(201, 0, 'message_jabber', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851526),
(202, 0, 'message_jabber', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851526),
(203, 0, 'message_jabber', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851527),
(204, 0, 'message_popup', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851527),
(205, 0, 'message_popup', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851527),
(206, 0, 'message_popup', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851527),
(207, 0, 'block_activity_modules', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851527),
(208, 0, 'block_activity_modules', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851527),
(209, 0, 'block_activity_modules', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851527),
(210, 0, 'block_admin_bookmarks', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851527),
(211, 0, 'block_admin_bookmarks', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851527),
(212, 0, 'block_admin_bookmarks', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851527),
(213, 0, 'block_badges', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851527),
(214, 0, 'block_badges', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851528),
(215, 0, 'block_badges', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851528),
(216, 0, 'block_blog_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851528),
(217, 0, 'block_blog_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851528),
(218, 0, 'block_blog_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851528),
(219, 0, 'block_blog_recent', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851528),
(220, 0, 'block_blog_recent', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851528),
(221, 0, 'block_blog_recent', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851528),
(222, 0, 'block_blog_tags', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851528),
(223, 0, 'block_blog_tags', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851528),
(224, 0, 'block_blog_tags', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851528),
(225, 0, 'block_calendar_month', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851528),
(226, 0, 'block_calendar_month', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851528),
(227, 0, 'block_calendar_month', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851528),
(228, 0, 'block_calendar_upcoming', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851528),
(229, 0, 'block_calendar_upcoming', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851528),
(230, 0, 'block_calendar_upcoming', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851529),
(231, 0, 'block_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851529),
(232, 0, 'block_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851529),
(233, 0, 'block_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851529),
(234, 0, 'block_community', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851529),
(235, 0, 'block_community', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851529),
(236, 0, 'block_community', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851529),
(237, 0, 'block_completionstatus', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851529),
(238, 0, 'block_completionstatus', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851529),
(239, 0, 'block_completionstatus', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851529),
(240, 0, 'block_course_list', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851529),
(241, 0, 'block_course_list', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851529),
(242, 0, 'block_course_list', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851530),
(243, 0, 'block_course_overview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851530),
(244, 0, 'block_course_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851530),
(245, 0, 'block_course_overview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851530),
(246, 0, 'block_course_summary', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851530),
(247, 0, 'block_course_summary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851530),
(248, 0, 'block_course_summary', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851530),
(249, 0, 'block_feedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851530),
(250, 0, 'block_feedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851530),
(251, 0, 'block_feedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851530),
(252, 0, 'block_glossary_random', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851530),
(253, 0, 'block_glossary_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851530),
(254, 0, 'block_glossary_random', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851530),
(255, 0, 'block_html', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851530),
(256, 0, 'block_html', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851530),
(257, 0, 'block_html', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851530),
(258, 0, 'block_login', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851530),
(259, 0, 'block_login', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851530),
(260, 0, 'block_login', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851531),
(261, 0, 'block_mentees', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851531),
(262, 0, 'block_mentees', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851531),
(263, 0, 'block_mentees', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851531),
(264, 0, 'block_messages', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851531),
(265, 0, 'block_messages', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851531),
(266, 0, 'block_messages', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851531),
(267, 0, 'block_mnet_hosts', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851531),
(268, 0, 'block_mnet_hosts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851531),
(269, 0, 'block_mnet_hosts', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851531),
(270, 0, 'block_myprofile', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851531),
(271, 0, 'block_myprofile', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851531),
(272, 0, 'block_myprofile', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851531),
(273, 0, 'block_navigation', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851531),
(274, 0, 'block_navigation', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851531),
(275, 0, 'block_navigation', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851531),
(276, 0, 'block_news_items', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1465851531),
(277, 0, 'block_news_items', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1465851531),
(278, 0, 'block_news_items', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1465851531),
(279, 0, 'block_online_users', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851531),
(280, 0, 'block_online_users', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851531),
(281, 0, 'block_online_users', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851531),
(282, 0, 'block_participants', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851531),
(283, 0, 'block_participants', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851531),
(284, 0, 'block_participants', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851532),
(285, 0, 'block_private_files', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851532),
(286, 0, 'block_private_files', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851532),
(287, 0, 'block_private_files', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851532),
(288, 0, 'block_quiz_results', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851532),
(289, 0, 'block_quiz_results', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851532),
(290, 0, 'block_quiz_results', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851532),
(291, 0, 'block_recent_activity', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851532),
(292, 0, 'block_recent_activity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851532),
(293, 0, 'block_recent_activity', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851532),
(294, 0, 'block_rss_client', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851532),
(295, 0, 'block_rss_client', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851533),
(296, 0, 'block_rss_client', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851533),
(297, 0, 'block_search_forums', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851533),
(298, 0, 'block_search_forums', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851533),
(299, 0, 'block_search_forums', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851533),
(300, 0, 'block_section_links', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851533),
(301, 0, 'block_section_links', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851533),
(302, 0, 'block_section_links', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851533),
(303, 0, 'block_selfcompletion', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851533),
(304, 0, 'block_selfcompletion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851533),
(305, 0, 'block_selfcompletion', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851533),
(306, 0, 'block_settings', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851534),
(307, 0, 'block_settings', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851534),
(308, 0, 'block_settings', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851534),
(309, 0, 'block_site_main_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851534),
(310, 0, 'block_site_main_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851534),
(311, 0, 'block_site_main_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851534),
(312, 0, 'block_social_activities', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851534),
(313, 0, 'block_social_activities', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851534),
(314, 0, 'block_social_activities', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851534),
(315, 0, 'block_tag_flickr', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851534),
(316, 0, 'block_tag_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851534),
(317, 0, 'block_tag_flickr', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851534),
(318, 0, 'block_tag_youtube', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851534),
(319, 0, 'block_tag_youtube', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851535),
(320, 0, 'block_tag_youtube', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851535),
(321, 0, 'block_tags', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851535),
(322, 0, 'block_tags', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851535),
(323, 0, 'block_tags', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851535),
(324, 0, 'filter_activitynames', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851535),
(325, 0, 'filter_activitynames', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851535),
(326, 0, 'filter_activitynames', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851536),
(327, 0, 'filter_algebra', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851536),
(328, 0, 'filter_algebra', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851536),
(329, 0, 'filter_algebra', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851536),
(330, 0, 'filter_censor', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851536),
(331, 0, 'filter_censor', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851536),
(332, 0, 'filter_censor', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851536),
(333, 0, 'filter_data', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851536),
(334, 0, 'filter_data', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851536),
(335, 0, 'filter_data', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851536),
(336, 0, 'filter_emailprotect', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851536),
(337, 0, 'filter_emailprotect', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851536),
(338, 0, 'filter_emailprotect', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851536),
(339, 0, 'filter_emoticon', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851536),
(340, 0, 'filter_emoticon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851536),
(341, 0, 'filter_emoticon', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851537),
(342, 0, 'filter_glossary', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851537),
(343, 0, 'filter_glossary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851537),
(344, 0, 'filter_glossary', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851537),
(345, 0, 'filter_mediaplugin', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851537),
(346, 0, 'filter_mediaplugin', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851537),
(347, 0, 'filter_mediaplugin', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851537),
(348, 0, 'filter_multilang', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851537),
(349, 0, 'filter_multilang', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851537),
(350, 0, 'filter_multilang', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851537),
(351, 0, 'filter_tex', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851537),
(352, 0, 'filter_tex', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851537),
(353, 0, 'filter_tex', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851537),
(354, 0, 'filter_tidy', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851537),
(355, 0, 'filter_tidy', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851537),
(356, 0, 'filter_tidy', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851538),
(357, 0, 'filter_urltolink', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851538),
(358, 0, 'filter_urltolink', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851538),
(359, 0, 'filter_urltolink', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851538),
(360, 0, 'editor_textarea', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851538),
(361, 0, 'editor_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851538),
(362, 0, 'editor_textarea', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851538),
(363, 0, 'editor_tinymce', NULL, '2013110603', 'Starting plugin installation', NULL, '', 0, 1465851538),
(364, 0, 'editor_tinymce', '2013110603', '2013110603', 'Upgrade savepoint reached', NULL, '', 0, 1465851538),
(365, 0, 'editor_tinymce', '2013110603', '2013110603', 'Plugin installed', NULL, '', 0, 1465851538),
(366, 0, 'format_singleactivity', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851538),
(367, 0, 'format_singleactivity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851538),
(368, 0, 'format_singleactivity', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851538),
(369, 0, 'format_social', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851538),
(370, 0, 'format_social', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851538),
(371, 0, 'format_social', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851538),
(372, 0, 'format_topics', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851538),
(373, 0, 'format_topics', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851538),
(374, 0, 'format_topics', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851538),
(375, 0, 'format_weeks', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851538),
(376, 0, 'format_weeks', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851538),
(377, 0, 'format_weeks', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851539),
(378, 0, 'profilefield_checkbox', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851539),
(379, 0, 'profilefield_checkbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851539),
(380, 0, 'profilefield_checkbox', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851539),
(381, 0, 'profilefield_datetime', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851539),
(382, 0, 'profilefield_datetime', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851539),
(383, 0, 'profilefield_datetime', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851539),
(384, 0, 'profilefield_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851539),
(385, 0, 'profilefield_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851539),
(386, 0, 'profilefield_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851539),
(387, 0, 'profilefield_text', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851539),
(388, 0, 'profilefield_text', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851539),
(389, 0, 'profilefield_text', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851539),
(390, 0, 'profilefield_textarea', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851539),
(391, 0, 'profilefield_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851539),
(392, 0, 'profilefield_textarea', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851539),
(393, 0, 'report_backups', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851539),
(394, 0, 'report_backups', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851539),
(395, 0, 'report_backups', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851540),
(396, 0, 'report_completion', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851540),
(397, 0, 'report_completion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851540),
(398, 0, 'report_completion', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851540),
(399, 0, 'report_configlog', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851540),
(400, 0, 'report_configlog', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851540),
(401, 0, 'report_configlog', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851540),
(402, 0, 'report_courseoverview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851540),
(403, 0, 'report_courseoverview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851540),
(404, 0, 'report_courseoverview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851540),
(405, 0, 'report_log', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851540),
(406, 0, 'report_log', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851540),
(407, 0, 'report_log', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851540),
(408, 0, 'report_loglive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851540),
(409, 0, 'report_loglive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851540),
(410, 0, 'report_loglive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851541),
(411, 0, 'report_outline', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851541),
(412, 0, 'report_outline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851541),
(413, 0, 'report_outline', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851541),
(414, 0, 'report_participation', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851541),
(415, 0, 'report_participation', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851541),
(416, 0, 'report_participation', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851541),
(417, 0, 'report_performance', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851541),
(418, 0, 'report_performance', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851541),
(419, 0, 'report_performance', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851541),
(420, 0, 'report_progress', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851541),
(421, 0, 'report_progress', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851541),
(422, 0, 'report_progress', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851541),
(423, 0, 'report_questioninstances', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851541),
(424, 0, 'report_questioninstances', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851542),
(425, 0, 'report_questioninstances', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851542),
(426, 0, 'report_security', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851542),
(427, 0, 'report_security', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851542),
(428, 0, 'report_security', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851542),
(429, 0, 'report_stats', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851542),
(430, 0, 'report_stats', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851542),
(431, 0, 'report_stats', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851542),
(432, 0, 'gradeexport_ods', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851542),
(433, 0, 'gradeexport_ods', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851542),
(434, 0, 'gradeexport_ods', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851542),
(435, 0, 'gradeexport_txt', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851542),
(436, 0, 'gradeexport_txt', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851542),
(437, 0, 'gradeexport_txt', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851543),
(438, 0, 'gradeexport_xls', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851543),
(439, 0, 'gradeexport_xls', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851543),
(440, 0, 'gradeexport_xls', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851543),
(441, 0, 'gradeexport_xml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851543),
(442, 0, 'gradeexport_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851543),
(443, 0, 'gradeexport_xml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851543),
(444, 0, 'gradeimport_csv', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851543),
(445, 0, 'gradeimport_csv', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851543),
(446, 0, 'gradeimport_csv', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851544),
(447, 0, 'gradeimport_xml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851544),
(448, 0, 'gradeimport_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851544),
(449, 0, 'gradeimport_xml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851544),
(450, 0, 'gradereport_grader', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851544),
(451, 0, 'gradereport_grader', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851544),
(452, 0, 'gradereport_grader', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851544),
(453, 0, 'gradereport_outcomes', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851544),
(454, 0, 'gradereport_outcomes', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851544),
(455, 0, 'gradereport_outcomes', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851544),
(456, 0, 'gradereport_overview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851544),
(457, 0, 'gradereport_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851544),
(458, 0, 'gradereport_overview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851545),
(459, 0, 'gradereport_user', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851545),
(460, 0, 'gradereport_user', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851545),
(461, 0, 'gradereport_user', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851545),
(462, 0, 'gradingform_guide', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851545),
(463, 0, 'gradingform_guide', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851545),
(464, 0, 'gradingform_guide', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851545),
(465, 0, 'gradingform_rubric', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851545),
(466, 0, 'gradingform_rubric', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851546),
(467, 0, 'gradingform_rubric', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851546),
(468, 0, 'mnetservice_enrol', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851546),
(469, 0, 'mnetservice_enrol', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851546),
(470, 0, 'mnetservice_enrol', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851547),
(471, 0, 'webservice_amf', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851547),
(472, 0, 'webservice_amf', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851547),
(473, 0, 'webservice_amf', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851547),
(474, 0, 'webservice_rest', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851547),
(475, 0, 'webservice_rest', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851547),
(476, 0, 'webservice_rest', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851547),
(477, 0, 'webservice_soap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851547),
(478, 0, 'webservice_soap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851547),
(479, 0, 'webservice_soap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851547),
(480, 0, 'webservice_xmlrpc', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851547),
(481, 0, 'webservice_xmlrpc', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851547);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(482, 0, 'webservice_xmlrpc', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851547),
(483, 0, 'repository_alfresco', NULL, '2014022600', 'Starting plugin installation', NULL, '', 0, 1465851548),
(484, 0, 'repository_alfresco', '2014022600', '2014022600', 'Upgrade savepoint reached', NULL, '', 0, 1465851548),
(485, 0, 'repository_alfresco', '2014022600', '2014022600', 'Plugin installed', NULL, '', 0, 1465851548),
(486, 0, 'repository_areafiles', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851548),
(487, 0, 'repository_areafiles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851548),
(488, 0, 'repository_areafiles', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851548),
(489, 0, 'repository_boxnet', NULL, '2013110700', 'Starting plugin installation', NULL, '', 0, 1465851548),
(490, 0, 'repository_boxnet', '2013110700', '2013110700', 'Upgrade savepoint reached', NULL, '', 0, 1465851548),
(491, 0, 'repository_boxnet', '2013110700', '2013110700', 'Plugin installed', NULL, '', 0, 1465851548),
(492, 0, 'repository_coursefiles', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851548),
(493, 0, 'repository_coursefiles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851548),
(494, 0, 'repository_coursefiles', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851548),
(495, 0, 'repository_dropbox', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851549),
(496, 0, 'repository_dropbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851549),
(497, 0, 'repository_dropbox', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851549),
(498, 0, 'repository_equella', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851549),
(499, 0, 'repository_equella', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851549),
(500, 0, 'repository_equella', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851549),
(501, 0, 'repository_filesystem', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851549),
(502, 0, 'repository_filesystem', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851549),
(503, 0, 'repository_filesystem', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851549),
(504, 0, 'repository_flickr', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851549),
(505, 0, 'repository_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851549),
(506, 0, 'repository_flickr', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851549),
(507, 0, 'repository_flickr_public', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851549),
(508, 0, 'repository_flickr_public', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851549),
(509, 0, 'repository_flickr_public', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851550),
(510, 0, 'repository_googledocs', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851550),
(511, 0, 'repository_googledocs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851550),
(512, 0, 'repository_googledocs', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851550),
(513, 0, 'repository_local', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851550),
(514, 0, 'repository_local', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851550),
(515, 0, 'repository_local', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851550),
(516, 0, 'repository_merlot', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851550),
(517, 0, 'repository_merlot', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851550),
(518, 0, 'repository_merlot', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851550),
(519, 0, 'repository_picasa', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851550),
(520, 0, 'repository_picasa', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851550),
(521, 0, 'repository_picasa', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851551),
(522, 0, 'repository_recent', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851551),
(523, 0, 'repository_recent', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851551),
(524, 0, 'repository_recent', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851551),
(525, 0, 'repository_s3', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851551),
(526, 0, 'repository_s3', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851551),
(527, 0, 'repository_s3', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851551),
(528, 0, 'repository_skydrive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851551),
(529, 0, 'repository_skydrive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851551),
(530, 0, 'repository_skydrive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851551),
(531, 0, 'repository_upload', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851551),
(532, 0, 'repository_upload', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851551),
(533, 0, 'repository_upload', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851552),
(534, 0, 'repository_url', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851552),
(535, 0, 'repository_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851552),
(536, 0, 'repository_url', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851552),
(537, 0, 'repository_user', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851552),
(538, 0, 'repository_user', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851552),
(539, 0, 'repository_user', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851552),
(540, 0, 'repository_webdav', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851552),
(541, 0, 'repository_webdav', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851552),
(542, 0, 'repository_webdav', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851553),
(543, 0, 'repository_wikimedia', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851553),
(544, 0, 'repository_wikimedia', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851553),
(545, 0, 'repository_wikimedia', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851553),
(546, 0, 'repository_youtube', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851553),
(547, 0, 'repository_youtube', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851553),
(548, 0, 'repository_youtube', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851553),
(549, 0, 'portfolio_boxnet', NULL, '2013110602', 'Starting plugin installation', NULL, '', 0, 1465851553),
(550, 0, 'portfolio_boxnet', '2013110602', '2013110602', 'Upgrade savepoint reached', NULL, '', 0, 1465851553),
(551, 0, 'portfolio_boxnet', '2013110602', '2013110602', 'Plugin installed', NULL, '', 0, 1465851553),
(552, 0, 'portfolio_download', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851553),
(553, 0, 'portfolio_download', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851553),
(554, 0, 'portfolio_download', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851553),
(555, 0, 'portfolio_flickr', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851553),
(556, 0, 'portfolio_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851553),
(557, 0, 'portfolio_flickr', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851553),
(558, 0, 'portfolio_googledocs', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851554),
(559, 0, 'portfolio_googledocs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851554),
(560, 0, 'portfolio_googledocs', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851554),
(561, 0, 'portfolio_mahara', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851554),
(562, 0, 'portfolio_mahara', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851554),
(563, 0, 'portfolio_mahara', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851554),
(564, 0, 'portfolio_picasa', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851554),
(565, 0, 'portfolio_picasa', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851554),
(566, 0, 'portfolio_picasa', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851554),
(567, 0, 'qbehaviour_adaptive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851554),
(568, 0, 'qbehaviour_adaptive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851554),
(569, 0, 'qbehaviour_adaptive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851554),
(570, 0, 'qbehaviour_adaptivenopenalty', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851554),
(571, 0, 'qbehaviour_adaptivenopenalty', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851554),
(572, 0, 'qbehaviour_adaptivenopenalty', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851554),
(573, 0, 'qbehaviour_deferredcbm', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851554),
(574, 0, 'qbehaviour_deferredcbm', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851554),
(575, 0, 'qbehaviour_deferredcbm', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851554),
(576, 0, 'qbehaviour_deferredfeedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851554),
(577, 0, 'qbehaviour_deferredfeedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851554),
(578, 0, 'qbehaviour_deferredfeedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851554),
(579, 0, 'qbehaviour_immediatecbm', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851554),
(580, 0, 'qbehaviour_immediatecbm', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851554),
(581, 0, 'qbehaviour_immediatecbm', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851554),
(582, 0, 'qbehaviour_immediatefeedback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851554),
(583, 0, 'qbehaviour_immediatefeedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851554),
(584, 0, 'qbehaviour_immediatefeedback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851554),
(585, 0, 'qbehaviour_informationitem', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851555),
(586, 0, 'qbehaviour_informationitem', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851555),
(587, 0, 'qbehaviour_informationitem', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851555),
(588, 0, 'qbehaviour_interactive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851555),
(589, 0, 'qbehaviour_interactive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851555),
(590, 0, 'qbehaviour_interactive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851555),
(591, 0, 'qbehaviour_interactivecountback', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851555),
(592, 0, 'qbehaviour_interactivecountback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851555),
(593, 0, 'qbehaviour_interactivecountback', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851555),
(594, 0, 'qbehaviour_manualgraded', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851555),
(595, 0, 'qbehaviour_manualgraded', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851555),
(596, 0, 'qbehaviour_manualgraded', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851555),
(597, 0, 'qbehaviour_missing', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851555),
(598, 0, 'qbehaviour_missing', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851555),
(599, 0, 'qbehaviour_missing', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851555),
(600, 0, 'qformat_aiken', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851555),
(601, 0, 'qformat_aiken', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851555),
(602, 0, 'qformat_aiken', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851555),
(603, 0, 'qformat_blackboard_six', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851555),
(604, 0, 'qformat_blackboard_six', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851555),
(605, 0, 'qformat_blackboard_six', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851555),
(606, 0, 'qformat_examview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851555),
(607, 0, 'qformat_examview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851555),
(608, 0, 'qformat_examview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851555),
(609, 0, 'qformat_gift', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851556),
(610, 0, 'qformat_gift', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851556),
(611, 0, 'qformat_gift', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851556),
(612, 0, 'qformat_learnwise', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851556),
(613, 0, 'qformat_learnwise', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851556),
(614, 0, 'qformat_learnwise', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851556),
(615, 0, 'qformat_missingword', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851556),
(616, 0, 'qformat_missingword', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851556),
(617, 0, 'qformat_missingword', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851556),
(618, 0, 'qformat_multianswer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851556),
(619, 0, 'qformat_multianswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851556),
(620, 0, 'qformat_multianswer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851556),
(621, 0, 'qformat_webct', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851556),
(622, 0, 'qformat_webct', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851556),
(623, 0, 'qformat_webct', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851556),
(624, 0, 'qformat_xhtml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851556),
(625, 0, 'qformat_xhtml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851556),
(626, 0, 'qformat_xhtml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851556),
(627, 0, 'qformat_xml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851556),
(628, 0, 'qformat_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851556),
(629, 0, 'qformat_xml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851556),
(630, 0, 'tool_assignmentupgrade', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851556),
(631, 0, 'tool_assignmentupgrade', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851556),
(632, 0, 'tool_assignmentupgrade', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851556),
(633, 0, 'tool_behat', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1465851556),
(634, 0, 'tool_behat', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1465851556),
(635, 0, 'tool_behat', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1465851556),
(636, 0, 'tool_capability', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851556),
(637, 0, 'tool_capability', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851556),
(638, 0, 'tool_capability', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851556),
(639, 0, 'tool_customlang', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851556),
(640, 0, 'tool_customlang', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851557),
(641, 0, 'tool_customlang', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851557),
(642, 0, 'tool_dbtransfer', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851557),
(643, 0, 'tool_dbtransfer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851557),
(644, 0, 'tool_dbtransfer', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851557),
(645, 0, 'tool_generator', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851557),
(646, 0, 'tool_generator', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851557),
(647, 0, 'tool_generator', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851557),
(648, 0, 'tool_health', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851557),
(649, 0, 'tool_health', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851557),
(650, 0, 'tool_health', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851557),
(651, 0, 'tool_innodb', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851557),
(652, 0, 'tool_innodb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851557),
(653, 0, 'tool_innodb', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851557),
(654, 0, 'tool_installaddon', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851558),
(655, 0, 'tool_installaddon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851558),
(656, 0, 'tool_installaddon', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851558),
(657, 0, 'tool_langimport', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851558),
(658, 0, 'tool_langimport', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851558),
(659, 0, 'tool_langimport', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851558),
(660, 0, 'tool_multilangupgrade', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851558),
(661, 0, 'tool_multilangupgrade', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851558),
(662, 0, 'tool_multilangupgrade', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851558),
(663, 0, 'tool_phpunit', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851558),
(664, 0, 'tool_phpunit', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851558),
(665, 0, 'tool_phpunit', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851558),
(666, 0, 'tool_profiling', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851558),
(667, 0, 'tool_profiling', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851558),
(668, 0, 'tool_profiling', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851558),
(669, 0, 'tool_qeupgradehelper', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851558),
(670, 0, 'tool_qeupgradehelper', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851558),
(671, 0, 'tool_qeupgradehelper', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851558),
(672, 0, 'tool_replace', NULL, '2013110501', 'Starting plugin installation', NULL, '', 0, 1465851558),
(673, 0, 'tool_replace', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1465851558),
(674, 0, 'tool_replace', '2013110501', '2013110501', 'Plugin installed', NULL, '', 0, 1465851558),
(675, 0, 'tool_spamcleaner', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851558),
(676, 0, 'tool_spamcleaner', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851558),
(677, 0, 'tool_spamcleaner', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851558),
(678, 0, 'tool_timezoneimport', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851558),
(679, 0, 'tool_timezoneimport', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851558),
(680, 0, 'tool_timezoneimport', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851558),
(681, 0, 'tool_unsuproles', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851558),
(682, 0, 'tool_unsuproles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851558),
(683, 0, 'tool_unsuproles', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851559),
(684, 0, 'tool_uploadcourse', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851559),
(685, 0, 'tool_uploadcourse', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851559),
(686, 0, 'tool_uploadcourse', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851559),
(687, 0, 'tool_uploaduser', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851559),
(688, 0, 'tool_uploaduser', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851559),
(689, 0, 'tool_uploaduser', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851559),
(690, 0, 'tool_xmldb', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851559),
(691, 0, 'tool_xmldb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851559),
(692, 0, 'tool_xmldb', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851559),
(693, 0, 'cachestore_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851559),
(694, 0, 'cachestore_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851559),
(695, 0, 'cachestore_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851559),
(696, 0, 'cachestore_memcache', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851559),
(697, 0, 'cachestore_memcache', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851559),
(698, 0, 'cachestore_memcache', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851559),
(699, 0, 'cachestore_memcached', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851559),
(700, 0, 'cachestore_memcached', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851559),
(701, 0, 'cachestore_memcached', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851559),
(702, 0, 'cachestore_mongodb', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851559),
(703, 0, 'cachestore_mongodb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851559),
(704, 0, 'cachestore_mongodb', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851559),
(705, 0, 'cachestore_session', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851559),
(706, 0, 'cachestore_session', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851559),
(707, 0, 'cachestore_session', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851559),
(708, 0, 'cachestore_static', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851559),
(709, 0, 'cachestore_static', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851560),
(710, 0, 'cachestore_static', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851560),
(711, 0, 'cachelock_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851560),
(712, 0, 'cachelock_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851560),
(713, 0, 'cachelock_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851560),
(714, 0, 'theme_afterburner', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851560),
(715, 0, 'theme_afterburner', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851560),
(716, 0, 'theme_afterburner', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851560),
(717, 0, 'theme_anomaly', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851560),
(718, 0, 'theme_anomaly', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851560),
(719, 0, 'theme_anomaly', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851560),
(720, 0, 'theme_arialist', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851560),
(721, 0, 'theme_arialist', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851560),
(722, 0, 'theme_arialist', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851560),
(723, 0, 'theme_base', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851560),
(724, 0, 'theme_base', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851560),
(725, 0, 'theme_base', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851560),
(726, 0, 'theme_binarius', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851560),
(727, 0, 'theme_binarius', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851560),
(728, 0, 'theme_binarius', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851560),
(729, 0, 'theme_bootstrapbase', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851560),
(730, 0, 'theme_bootstrapbase', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851560),
(731, 0, 'theme_bootstrapbase', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851560),
(732, 0, 'theme_boxxie', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851560),
(733, 0, 'theme_boxxie', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851560),
(734, 0, 'theme_boxxie', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851560),
(735, 0, 'theme_brick', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851560),
(736, 0, 'theme_brick', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(737, 0, 'theme_brick', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(738, 0, 'theme_canvas', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(739, 0, 'theme_canvas', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(740, 0, 'theme_canvas', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(741, 0, 'theme_clean', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(742, 0, 'theme_clean', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(743, 0, 'theme_clean', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(744, 0, 'theme_formal_white', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(745, 0, 'theme_formal_white', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(746, 0, 'theme_formal_white', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(747, 0, 'theme_formfactor', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(748, 0, 'theme_formfactor', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(749, 0, 'theme_formfactor', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(750, 0, 'theme_fusion', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(751, 0, 'theme_fusion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(752, 0, 'theme_fusion', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(753, 0, 'theme_leatherbound', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(754, 0, 'theme_leatherbound', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(755, 0, 'theme_leatherbound', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(756, 0, 'theme_magazine', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(757, 0, 'theme_magazine', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(758, 0, 'theme_magazine', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(759, 0, 'theme_nimble', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(760, 0, 'theme_nimble', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(761, 0, 'theme_nimble', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(762, 0, 'theme_nonzero', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(763, 0, 'theme_nonzero', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(764, 0, 'theme_nonzero', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(765, 0, 'theme_overlay', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(766, 0, 'theme_overlay', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(767, 0, 'theme_overlay', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(768, 0, 'theme_serenity', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(769, 0, 'theme_serenity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(770, 0, 'theme_serenity', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(771, 0, 'theme_sky_high', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(772, 0, 'theme_sky_high', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(773, 0, 'theme_sky_high', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851561),
(774, 0, 'theme_splash', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851561),
(775, 0, 'theme_splash', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851561),
(776, 0, 'theme_splash', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851562),
(777, 0, 'theme_standard', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851562),
(778, 0, 'theme_standard', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851562),
(779, 0, 'theme_standard', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851562),
(780, 0, 'theme_standardold', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851562),
(781, 0, 'theme_standardold', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851562),
(782, 0, 'theme_standardold', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851562),
(783, 0, 'assignsubmission_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851562),
(784, 0, 'assignsubmission_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851562),
(785, 0, 'assignsubmission_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851562),
(786, 0, 'assignsubmission_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851562),
(787, 0, 'assignsubmission_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851562),
(788, 0, 'assignsubmission_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851562),
(789, 0, 'assignsubmission_onlinetext', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851562),
(790, 0, 'assignsubmission_onlinetext', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851562),
(791, 0, 'assignsubmission_onlinetext', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851562),
(792, 0, 'assignfeedback_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851562),
(793, 0, 'assignfeedback_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851562),
(794, 0, 'assignfeedback_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851563),
(795, 0, 'assignfeedback_editpdf', NULL, '2013110800', 'Starting plugin installation', NULL, '', 0, 1465851563),
(796, 0, 'assignfeedback_editpdf', '2013110800', '2013110800', 'Upgrade savepoint reached', NULL, '', 0, 1465851563),
(797, 0, 'assignfeedback_editpdf', '2013110800', '2013110800', 'Plugin installed', NULL, '', 0, 1465851564),
(798, 0, 'assignfeedback_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851564),
(799, 0, 'assignfeedback_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851564),
(800, 0, 'assignfeedback_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851564),
(801, 0, 'assignfeedback_offline', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851564),
(802, 0, 'assignfeedback_offline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851564),
(803, 0, 'assignfeedback_offline', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851564),
(804, 0, 'assignment_offline', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851564),
(805, 0, 'assignment_offline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851564),
(806, 0, 'assignment_offline', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851564),
(807, 0, 'assignment_online', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851564),
(808, 0, 'assignment_online', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851564),
(809, 0, 'assignment_online', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851564),
(810, 0, 'assignment_upload', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851565),
(811, 0, 'assignment_upload', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851565),
(812, 0, 'assignment_upload', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851565),
(813, 0, 'assignment_uploadsingle', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851565),
(814, 0, 'assignment_uploadsingle', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851565),
(815, 0, 'assignment_uploadsingle', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851565),
(816, 0, 'booktool_exportimscp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851565),
(817, 0, 'booktool_exportimscp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851565),
(818, 0, 'booktool_exportimscp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851565),
(819, 0, 'booktool_importhtml', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851565),
(820, 0, 'booktool_importhtml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851565),
(821, 0, 'booktool_importhtml', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851565),
(822, 0, 'booktool_print', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851565),
(823, 0, 'booktool_print', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851565),
(824, 0, 'booktool_print', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851565),
(825, 0, 'datafield_checkbox', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851565),
(826, 0, 'datafield_checkbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851565),
(827, 0, 'datafield_checkbox', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851565),
(828, 0, 'datafield_date', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851565),
(829, 0, 'datafield_date', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851566),
(830, 0, 'datafield_date', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851566),
(831, 0, 'datafield_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851566),
(832, 0, 'datafield_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851566),
(833, 0, 'datafield_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851566),
(834, 0, 'datafield_latlong', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851566),
(835, 0, 'datafield_latlong', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851566),
(836, 0, 'datafield_latlong', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851566),
(837, 0, 'datafield_menu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851566),
(838, 0, 'datafield_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851566),
(839, 0, 'datafield_menu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851566),
(840, 0, 'datafield_multimenu', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851566),
(841, 0, 'datafield_multimenu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851566),
(842, 0, 'datafield_multimenu', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851566),
(843, 0, 'datafield_number', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851566),
(844, 0, 'datafield_number', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851566),
(845, 0, 'datafield_number', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851566),
(846, 0, 'datafield_picture', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851566),
(847, 0, 'datafield_picture', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851566),
(848, 0, 'datafield_picture', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851566),
(849, 0, 'datafield_radiobutton', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851566),
(850, 0, 'datafield_radiobutton', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851566),
(851, 0, 'datafield_radiobutton', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851566),
(852, 0, 'datafield_text', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851566),
(853, 0, 'datafield_text', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851566),
(854, 0, 'datafield_text', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851567),
(855, 0, 'datafield_textarea', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851567),
(856, 0, 'datafield_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851567),
(857, 0, 'datafield_textarea', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851567),
(858, 0, 'datafield_url', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851567),
(859, 0, 'datafield_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851567),
(860, 0, 'datafield_url', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851567),
(861, 0, 'datapreset_imagegallery', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851567),
(862, 0, 'datapreset_imagegallery', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851567),
(863, 0, 'datapreset_imagegallery', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851567),
(864, 0, 'quiz_grading', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851567),
(865, 0, 'quiz_grading', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851567),
(866, 0, 'quiz_grading', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851567),
(867, 0, 'quiz_overview', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851567),
(868, 0, 'quiz_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851567),
(869, 0, 'quiz_overview', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851567),
(870, 0, 'quiz_responses', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851567),
(871, 0, 'quiz_responses', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851567),
(872, 0, 'quiz_responses', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851568),
(873, 0, 'quiz_statistics', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851568),
(874, 0, 'quiz_statistics', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851568),
(875, 0, 'quiz_statistics', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851568),
(876, 0, 'quizaccess_delaybetweenattempts', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851568),
(877, 0, 'quizaccess_delaybetweenattempts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851568),
(878, 0, 'quizaccess_delaybetweenattempts', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851568),
(879, 0, 'quizaccess_ipaddress', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851568),
(880, 0, 'quizaccess_ipaddress', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851568),
(881, 0, 'quizaccess_ipaddress', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851568),
(882, 0, 'quizaccess_numattempts', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851568),
(883, 0, 'quizaccess_numattempts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851568),
(884, 0, 'quizaccess_numattempts', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851568),
(885, 0, 'quizaccess_openclosedate', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851568),
(886, 0, 'quizaccess_openclosedate', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851568),
(887, 0, 'quizaccess_openclosedate', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851568),
(888, 0, 'quizaccess_password', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851568),
(889, 0, 'quizaccess_password', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851568),
(890, 0, 'quizaccess_password', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851568),
(891, 0, 'quizaccess_safebrowser', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851568),
(892, 0, 'quizaccess_safebrowser', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851568),
(893, 0, 'quizaccess_safebrowser', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851568),
(894, 0, 'quizaccess_securewindow', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851568),
(895, 0, 'quizaccess_securewindow', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851569),
(896, 0, 'quizaccess_securewindow', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851569),
(897, 0, 'quizaccess_timelimit', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851569),
(898, 0, 'quizaccess_timelimit', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851569),
(899, 0, 'quizaccess_timelimit', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851569),
(900, 0, 'scormreport_basic', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851569),
(901, 0, 'scormreport_basic', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851569),
(902, 0, 'scormreport_basic', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851569),
(903, 0, 'scormreport_graphs', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851569),
(904, 0, 'scormreport_graphs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851569),
(905, 0, 'scormreport_graphs', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851569),
(906, 0, 'scormreport_interactions', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851569),
(907, 0, 'scormreport_interactions', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851569),
(908, 0, 'scormreport_interactions', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851569),
(909, 0, 'scormreport_objectives', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851569),
(910, 0, 'scormreport_objectives', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851569),
(911, 0, 'scormreport_objectives', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851569),
(912, 0, 'workshopform_accumulative', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851569),
(913, 0, 'workshopform_accumulative', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851569),
(914, 0, 'workshopform_accumulative', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851570),
(915, 0, 'workshopform_comments', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851570),
(916, 0, 'workshopform_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851570),
(917, 0, 'workshopform_comments', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851570),
(918, 0, 'workshopform_numerrors', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851570),
(919, 0, 'workshopform_numerrors', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851570),
(920, 0, 'workshopform_numerrors', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851570),
(921, 0, 'workshopform_rubric', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851570),
(922, 0, 'workshopform_rubric', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851571),
(923, 0, 'workshopform_rubric', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851571),
(924, 0, 'workshopallocation_manual', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851571),
(925, 0, 'workshopallocation_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851571),
(926, 0, 'workshopallocation_manual', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851571),
(927, 0, 'workshopallocation_random', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851571),
(928, 0, 'workshopallocation_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851571),
(929, 0, 'workshopallocation_random', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851571),
(930, 0, 'workshopallocation_scheduled', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851571),
(931, 0, 'workshopallocation_scheduled', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851571),
(932, 0, 'workshopallocation_scheduled', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851571),
(933, 0, 'workshopeval_best', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851571),
(934, 0, 'workshopeval_best', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851572),
(935, 0, 'workshopeval_best', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851572),
(936, 0, 'tinymce_ctrlhelp', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851572),
(937, 0, 'tinymce_ctrlhelp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851572),
(938, 0, 'tinymce_ctrlhelp', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851572),
(939, 0, 'tinymce_dragmath', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851572),
(940, 0, 'tinymce_dragmath', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851572),
(941, 0, 'tinymce_dragmath', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851572),
(942, 0, 'tinymce_managefiles', NULL, '2014010800', 'Starting plugin installation', NULL, '', 0, 1465851572),
(943, 0, 'tinymce_managefiles', '2014010800', '2014010800', 'Upgrade savepoint reached', NULL, '', 0, 1465851572),
(944, 0, 'tinymce_managefiles', '2014010800', '2014010800', 'Plugin installed', NULL, '', 0, 1465851572),
(945, 0, 'tinymce_moodleemoticon', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851572),
(946, 0, 'tinymce_moodleemoticon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851572);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(947, 0, 'tinymce_moodleemoticon', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851572),
(948, 0, 'tinymce_moodleimage', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851572),
(949, 0, 'tinymce_moodleimage', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851572),
(950, 0, 'tinymce_moodleimage', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851572),
(951, 0, 'tinymce_moodlemedia', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851572),
(952, 0, 'tinymce_moodlemedia', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851572),
(953, 0, 'tinymce_moodlemedia', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851573),
(954, 0, 'tinymce_moodlenolink', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851573),
(955, 0, 'tinymce_moodlenolink', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851573),
(956, 0, 'tinymce_moodlenolink', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851573),
(957, 0, 'tinymce_pdw', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851573),
(958, 0, 'tinymce_pdw', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851573),
(959, 0, 'tinymce_pdw', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851573),
(960, 0, 'tinymce_spellchecker', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851573),
(961, 0, 'tinymce_spellchecker', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851573),
(962, 0, 'tinymce_spellchecker', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851573),
(963, 0, 'tinymce_wrap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1465851573),
(964, 0, 'tinymce_wrap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1465851573),
(965, 0, 'tinymce_wrap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1465851573);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_url`
--

CREATE TABLE `mdl_url` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `parameters` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one url resource';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user`
--

CREATE TABLE `mdl_user` (
  `id` bigint(10) NOT NULL,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(255) NOT NULL DEFAULT '',
  `department` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  `lastnamephonetic` varchar(255) DEFAULT NULL,
  `firstnamephonetic` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `alternatename` varchar(255) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='One record for each person';

--
-- Volcado de datos para la tabla `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `calendartype`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `lastnamephonetic`, `firstnamephonetic`, `middlename`, `alternatename`, `active`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '$2y$10$mB/pVNpK1euL9apCHIGdZeIjozKtLUPHcE0FyEN3dgisEHB81DKbO', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 1, 1, 0, 2, 1, 0, 0, 1465851455, 0, NULL, NULL, NULL, NULL, NULL, 0),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '49da846da147bf3092c56c6dd051a551', '', 'Admin', 'User', 'testadmin@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 1465851591, 1465943883, 1465943018, 1465943883, '0:0:0:0:0:0:0:1', '', 0, '', '', 1, 1, 0, 1, 1, 0, 0, 1465851639, 0, NULL, '', '', '', '', 0),
(3, 'manual', 1, 0, 0, 0, 1, 'andres', '31f58a3a715c6db5ef6e6d47ef9fd161', '', 'Andres', 'Coppola', 'l52374@trbvo.com', 0, '', '', '', '', '', '', '', '', '', '', 'Mendoza', 'AR', 'es', 'gregorian', '', '-3.0', 1465943217, 1465943428, 0, 1465943217, '0:0:0:0:0:0:0:1', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1465943140, 1465943140, 0, '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_devices`
--

CREATE TABLE `mdl_user_devices` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `model` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `pushid` varchar(255) NOT NULL DEFAULT '',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores user''s mobile devices information in order';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_enrolments`
--

CREATE TABLE `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_info_category`
--

CREATE TABLE `mdl_user_info_category` (
  `id` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_info_data`
--

CREATE TABLE `mdl_user_info_data` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_info_field`
--

CREATE TABLE `mdl_user_info_field` (
  `id` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_lastaccess`
--

CREATE TABLE `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_password_resets`
--

CREATE TABLE `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table tracking password reset confirmation tokens';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_preferences`
--

CREATE TABLE `mdl_user_preferences` (
  `id` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(1333) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences';

--
-- Volcado de datos para la tabla `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'htmleditor', ''),
(2, 2, 'email_bounce_count', '1'),
(3, 2, 'email_send_count', '1'),
(4, 3, 'auth_forcepasswordchange', '0'),
(5, 3, 'htmleditor', ''),
(6, 3, 'email_bounce_count', '1'),
(7, 3, 'email_send_count', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_private_key`
--

CREATE TABLE `mdl_user_private_key` (
  `id` bigint(10) NOT NULL,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_webdav_locks`
--

CREATE TABLE `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource locks for WebDAV users';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki`
--

CREATE TABLE `mdl_wiki` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_links`
--

CREATE TABLE `mdl_wiki_links` (
  `id` bigint(10) NOT NULL,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_locks`
--

CREATE TABLE `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_pages`
--

CREATE TABLE `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_subwikis`
--

CREATE TABLE `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_synonyms`
--

CREATE TABLE `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_versions`
--

CREATE TABLE `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop`
--

CREATE TABLE `mdl_workshop` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_aggregations`
--

CREATE TABLE `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_assessments`
--

CREATE TABLE `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_assessments_old`
--

CREATE TABLE `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext,
  `teachercomment` longtext,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_comments_old`
--

CREATE TABLE `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_elements_old`
--

CREATE TABLE `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_grades`
--

CREATE TABLE `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_grades_old`
--

CREATE TABLE `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_old`
--

CREATE TABLE `mdl_workshop_old` (
  `id` bigint(10) NOT NULL,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_rubrics_old`
--

CREATE TABLE `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_stockcomments_old`
--

CREATE TABLE `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_submissions`
--

CREATE TABLE `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_submissions_old`
--

CREATE TABLE `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopallocation_scheduled`
--

CREATE TABLE `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) DEFAULT NULL,
  `resultlog` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the allocation settings for the scheduled allocator';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopeval_best_settings`
--

CREATE TABLE `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_accumulative`
--

CREATE TABLE `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_comments`
--

CREATE TABLE `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_numerrors`
--

CREATE TABLE `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_numerrors_map`
--

CREATE TABLE `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_rubric`
--

CREATE TABLE `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_rubric_config`
--

CREATE TABLE `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) DEFAULT 'list'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_rubric_levels`
--

CREATE TABLE `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mdl_assign`
--
ALTER TABLE `mdl_assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assi_cou_ix` (`course`),
  ADD KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`);

--
-- Indices de la tabla `mdl_assign_grades`
--
ALTER TABLE `mdl_assign_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  ADD KEY `mdl_assigrad_use_ix` (`userid`),
  ADD KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  ADD KEY `mdl_assigrad_ass_ix` (`assignment`);

--
-- Indices de la tabla `mdl_assign_plugin_config`
--
ALTER TABLE `mdl_assign_plugin_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  ADD KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  ADD KEY `mdl_assiplugconf_nam_ix` (`name`),
  ADD KEY `mdl_assiplugconf_ass_ix` (`assignment`);

--
-- Indices de la tabla `mdl_assign_submission`
--
ALTER TABLE `mdl_assign_submission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  ADD KEY `mdl_assisubm_use_ix` (`userid`),
  ADD KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  ADD KEY `mdl_assisubm_ass_ix` (`assignment`);

--
-- Indices de la tabla `mdl_assign_user_flags`
--
ALTER TABLE `mdl_assign_user_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  ADD KEY `mdl_assiuserflag_use_ix` (`userid`),
  ADD KEY `mdl_assiuserflag_ass_ix` (`assignment`);

--
-- Indices de la tabla `mdl_assign_user_mapping`
--
ALTER TABLE `mdl_assign_user_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  ADD KEY `mdl_assiusermapp_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_assignfeedback_comments`
--
ALTER TABLE `mdl_assignfeedback_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assicomm_ass_ix` (`assignment`),
  ADD KEY `mdl_assicomm_gra_ix` (`grade`);

--
-- Indices de la tabla `mdl_assignfeedback_editpdf_annot`
--
ALTER TABLE `mdl_assignfeedback_editpdf_annot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  ADD KEY `mdl_assieditanno_gra_ix` (`gradeid`);

--
-- Indices de la tabla `mdl_assignfeedback_editpdf_cmnt`
--
ALTER TABLE `mdl_assignfeedback_editpdf_cmnt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  ADD KEY `mdl_assieditcmnt_gra_ix` (`gradeid`);

--
-- Indices de la tabla `mdl_assignfeedback_editpdf_quick`
--
ALTER TABLE `mdl_assignfeedback_editpdf_quick`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assieditquic_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_assignfeedback_file`
--
ALTER TABLE `mdl_assignfeedback_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assifile_ass2_ix` (`assignment`),
  ADD KEY `mdl_assifile_gra_ix` (`grade`);

--
-- Indices de la tabla `mdl_assignment`
--
ALTER TABLE `mdl_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assi_cou2_ix` (`course`);

--
-- Indices de la tabla `mdl_assignment_submissions`
--
ALTER TABLE `mdl_assignment_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assisubm_use2_ix` (`userid`),
  ADD KEY `mdl_assisubm_mai_ix` (`mailed`),
  ADD KEY `mdl_assisubm_tim_ix` (`timemarked`),
  ADD KEY `mdl_assisubm_ass2_ix` (`assignment`);

--
-- Indices de la tabla `mdl_assignsubmission_file`
--
ALTER TABLE `mdl_assignsubmission_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assifile_ass_ix` (`assignment`),
  ADD KEY `mdl_assifile_sub_ix` (`submission`);

--
-- Indices de la tabla `mdl_assignsubmission_onlinetext`
--
ALTER TABLE `mdl_assignsubmission_onlinetext`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_assionli_ass_ix` (`assignment`),
  ADD KEY `mdl_assionli_sub_ix` (`submission`);

--
-- Indices de la tabla `mdl_backup_controllers`
--
ALTER TABLE `mdl_backup_controllers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  ADD KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  ADD KEY `mdl_backcont_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_backup_courses`
--
ALTER TABLE `mdl_backup_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`);

--
-- Indices de la tabla `mdl_backup_logs`
--
ALTER TABLE `mdl_backup_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  ADD KEY `mdl_backlogs_bac_ix` (`backupid`);

--
-- Indices de la tabla `mdl_badge`
--
ALTER TABLE `mdl_badge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badg_typ_ix` (`type`),
  ADD KEY `mdl_badg_cou_ix` (`courseid`),
  ADD KEY `mdl_badg_use_ix` (`usermodified`),
  ADD KEY `mdl_badg_use2_ix` (`usercreated`);

--
-- Indices de la tabla `mdl_badge_backpack`
--
ALTER TABLE `mdl_badge_backpack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgback_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_badge_criteria`
--
ALTER TABLE `mdl_badge_criteria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  ADD KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  ADD KEY `mdl_badgcrit_bad_ix` (`badgeid`);

--
-- Indices de la tabla `mdl_badge_criteria_met`
--
ALTER TABLE `mdl_badge_criteria_met`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgcritmet_cri_ix` (`critid`),
  ADD KEY `mdl_badgcritmet_use_ix` (`userid`),
  ADD KEY `mdl_badgcritmet_iss_ix` (`issuedid`);

--
-- Indices de la tabla `mdl_badge_criteria_param`
--
ALTER TABLE `mdl_badge_criteria_param`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgcritpara_cri_ix` (`critid`);

--
-- Indices de la tabla `mdl_badge_external`
--
ALTER TABLE `mdl_badge_external`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgexte_bac_ix` (`backpackid`);

--
-- Indices de la tabla `mdl_badge_issued`
--
ALTER TABLE `mdl_badge_issued`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  ADD KEY `mdl_badgissu_bad_ix` (`badgeid`),
  ADD KEY `mdl_badgissu_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_badge_manual_award`
--
ALTER TABLE `mdl_badge_manual_award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  ADD KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  ADD KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  ADD KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`);

--
-- Indices de la tabla `mdl_block`
--
ALTER TABLE `mdl_block`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_bloc_nam_uix` (`name`);

--
-- Indices de la tabla `mdl_block_community`
--
ALTER TABLE `mdl_block_community`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_block_instances`
--
ALTER TABLE `mdl_block_instances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  ADD KEY `mdl_blocinst_par_ix` (`parentcontextid`);

--
-- Indices de la tabla `mdl_block_positions`
--
ALTER TABLE `mdl_block_positions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  ADD KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  ADD KEY `mdl_blocposi_con_ix` (`contextid`);

--
-- Indices de la tabla `mdl_block_rss_client`
--
ALTER TABLE `mdl_block_rss_client`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_blog_association`
--
ALTER TABLE `mdl_blog_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blogasso_con_ix` (`contextid`),
  ADD KEY `mdl_blogasso_blo_ix` (`blogid`);

--
-- Indices de la tabla `mdl_blog_external`
--
ALTER TABLE `mdl_blog_external`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_blogexte_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_book`
--
ALTER TABLE `mdl_book`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_book_chapters`
--
ALTER TABLE `mdl_book_chapters`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_cache_filters`
--
ALTER TABLE `mdl_cache_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`);

--
-- Indices de la tabla `mdl_cache_flags`
--
ALTER TABLE `mdl_cache_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_cachflag_fla_ix` (`flagtype`),
  ADD KEY `mdl_cachflag_nam_ix` (`name`);

--
-- Indices de la tabla `mdl_cache_text`
--
ALTER TABLE `mdl_cache_text`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_cachtext_md5_ix` (`md5key`),
  ADD KEY `mdl_cachtext_tim_ix` (`timemodified`);

--
-- Indices de la tabla `mdl_capabilities`
--
ALTER TABLE `mdl_capabilities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_capa_nam_uix` (`name`);

--
-- Indices de la tabla `mdl_chat`
--
ALTER TABLE `mdl_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chat_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_chat_messages`
--
ALTER TABLE `mdl_chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chatmess_use_ix` (`userid`),
  ADD KEY `mdl_chatmess_gro_ix` (`groupid`),
  ADD KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  ADD KEY `mdl_chatmess_cha_ix` (`chatid`);

--
-- Indices de la tabla `mdl_chat_messages_current`
--
ALTER TABLE `mdl_chat_messages_current`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chatmesscurr_use_ix` (`userid`),
  ADD KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  ADD KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  ADD KEY `mdl_chatmesscurr_cha_ix` (`chatid`);

--
-- Indices de la tabla `mdl_chat_users`
--
ALTER TABLE `mdl_chat_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_chatuser_use_ix` (`userid`),
  ADD KEY `mdl_chatuser_las_ix` (`lastping`),
  ADD KEY `mdl_chatuser_gro_ix` (`groupid`),
  ADD KEY `mdl_chatuser_cha_ix` (`chatid`);

--
-- Indices de la tabla `mdl_choice`
--
ALTER TABLE `mdl_choice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_choi_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_choice_answers`
--
ALTER TABLE `mdl_choice_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_choiansw_use_ix` (`userid`),
  ADD KEY `mdl_choiansw_cho_ix` (`choiceid`),
  ADD KEY `mdl_choiansw_opt_ix` (`optionid`);

--
-- Indices de la tabla `mdl_choice_options`
--
ALTER TABLE `mdl_choice_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_choiopti_cho_ix` (`choiceid`);

--
-- Indices de la tabla `mdl_cohort`
--
ALTER TABLE `mdl_cohort`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_coho_con_ix` (`contextid`);

--
-- Indices de la tabla `mdl_cohort_members`
--
ALTER TABLE `mdl_cohort_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  ADD KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  ADD KEY `mdl_cohomemb_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_comments`
--
ALTER TABLE `mdl_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_config`
--
ALTER TABLE `mdl_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_conf_nam_uix` (`name`);

--
-- Indices de la tabla `mdl_config_log`
--
ALTER TABLE `mdl_config_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_conflog_tim_ix` (`timemodified`),
  ADD KEY `mdl_conflog_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_config_plugins`
--
ALTER TABLE `mdl_config_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`);

--
-- Indices de la tabla `mdl_context`
--
ALTER TABLE `mdl_context`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  ADD KEY `mdl_cont_ins_ix` (`instanceid`),
  ADD KEY `mdl_cont_pat_ix` (`path`);

--
-- Indices de la tabla `mdl_context_temp`
--
ALTER TABLE `mdl_context_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_course`
--
ALTER TABLE `mdl_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_cour_cat_ix` (`category`),
  ADD KEY `mdl_cour_idn_ix` (`idnumber`),
  ADD KEY `mdl_cour_sho_ix` (`shortname`),
  ADD KEY `mdl_cour_sor_ix` (`sortorder`);

--
-- Indices de la tabla `mdl_course_categories`
--
ALTER TABLE `mdl_course_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courcate_par_ix` (`parent`);

--
-- Indices de la tabla `mdl_course_completion_aggr_methd`
--
ALTER TABLE `mdl_course_completion_aggr_methd`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  ADD KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  ADD KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`);

--
-- Indices de la tabla `mdl_course_completion_crit_compl`
--
ALTER TABLE `mdl_course_completion_crit_compl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  ADD KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  ADD KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  ADD KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  ADD KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`);

--
-- Indices de la tabla `mdl_course_completion_criteria`
--
ALTER TABLE `mdl_course_completion_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courcompcrit_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_course_completions`
--
ALTER TABLE `mdl_course_completions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  ADD KEY `mdl_courcomp_use_ix` (`userid`),
  ADD KEY `mdl_courcomp_cou_ix` (`course`),
  ADD KEY `mdl_courcomp_tim_ix` (`timecompleted`);

--
-- Indices de la tabla `mdl_course_format_options`
--
ALTER TABLE `mdl_course_format_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  ADD KEY `mdl_courformopti_cou_ix` (`courseid`);

--
-- Indices de la tabla `mdl_course_modules`
--
ALTER TABLE `mdl_course_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courmodu_vis_ix` (`visible`),
  ADD KEY `mdl_courmodu_cou_ix` (`course`),
  ADD KEY `mdl_courmodu_mod_ix` (`module`),
  ADD KEY `mdl_courmodu_ins_ix` (`instance`),
  ADD KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  ADD KEY `mdl_courmodu_gro_ix` (`groupingid`);

--
-- Indices de la tabla `mdl_course_modules_avail_fields`
--
ALTER TABLE `mdl_course_modules_avail_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courmoduavaifiel_cou_ix` (`coursemoduleid`);

--
-- Indices de la tabla `mdl_course_modules_availability`
--
ALTER TABLE `mdl_course_modules_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  ADD KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  ADD KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`);

--
-- Indices de la tabla `mdl_course_modules_completion`
--
ALTER TABLE `mdl_course_modules_completion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  ADD KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`);

--
-- Indices de la tabla `mdl_course_published`
--
ALTER TABLE `mdl_course_published`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_course_request`
--
ALTER TABLE `mdl_course_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_courrequ_sho_ix` (`shortname`);

--
-- Indices de la tabla `mdl_course_sections`
--
ALTER TABLE `mdl_course_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`);

--
-- Indices de la tabla `mdl_course_sections_avail_fields`
--
ALTER TABLE `mdl_course_sections_avail_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_coursectavaifiel_cou_ix` (`coursesectionid`);

--
-- Indices de la tabla `mdl_course_sections_availability`
--
ALTER TABLE `mdl_course_sections_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_coursectavai_cou_ix` (`coursesectionid`),
  ADD KEY `mdl_coursectavai_sou_ix` (`sourcecmid`),
  ADD KEY `mdl_coursectavai_gra_ix` (`gradeitemid`);

--
-- Indices de la tabla `mdl_data`
--
ALTER TABLE `mdl_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_data_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_data_content`
--
ALTER TABLE `mdl_data_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_datacont_rec_ix` (`recordid`),
  ADD KEY `mdl_datacont_fie_ix` (`fieldid`);

--
-- Indices de la tabla `mdl_data_fields`
--
ALTER TABLE `mdl_data_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  ADD KEY `mdl_datafiel_dat_ix` (`dataid`);

--
-- Indices de la tabla `mdl_data_records`
--
ALTER TABLE `mdl_data_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_datareco_dat_ix` (`dataid`);

--
-- Indices de la tabla `mdl_enrol`
--
ALTER TABLE `mdl_enrol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enro_enr_ix` (`enrol`),
  ADD KEY `mdl_enro_cou_ix` (`courseid`);

--
-- Indices de la tabla `mdl_enrol_flatfile`
--
ALTER TABLE `mdl_enrol_flatfile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_enroflat_cou_ix` (`courseid`),
  ADD KEY `mdl_enroflat_use_ix` (`userid`),
  ADD KEY `mdl_enroflat_rol_ix` (`roleid`);

--
-- Indices de la tabla `mdl_enrol_paypal`
--
ALTER TABLE `mdl_enrol_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_event`
--
ALTER TABLE `mdl_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_even_cou_ix` (`courseid`),
  ADD KEY `mdl_even_use_ix` (`userid`),
  ADD KEY `mdl_even_tim_ix` (`timestart`),
  ADD KEY `mdl_even_tim2_ix` (`timeduration`),
  ADD KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`);

--
-- Indices de la tabla `mdl_event_subscriptions`
--
ALTER TABLE `mdl_event_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_events_handlers`
--
ALTER TABLE `mdl_events_handlers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`);

--
-- Indices de la tabla `mdl_events_queue`
--
ALTER TABLE `mdl_events_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_evenqueu_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_events_queue_handlers`
--
ALTER TABLE `mdl_events_queue_handlers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  ADD KEY `mdl_evenqueuhand_han_ix` (`handlerid`);

--
-- Indices de la tabla `mdl_external_functions`
--
ALTER TABLE `mdl_external_functions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_extefunc_nam_uix` (`name`);

--
-- Indices de la tabla `mdl_external_services`
--
ALTER TABLE `mdl_external_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_exteserv_nam_uix` (`name`);

--
-- Indices de la tabla `mdl_external_services_functions`
--
ALTER TABLE `mdl_external_services_functions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`);

--
-- Indices de la tabla `mdl_external_services_users`
--
ALTER TABLE `mdl_external_services_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  ADD KEY `mdl_exteservuser_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_external_tokens`
--
ALTER TABLE `mdl_external_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_extetoke_use_ix` (`userid`),
  ADD KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  ADD KEY `mdl_extetoke_con_ix` (`contextid`),
  ADD KEY `mdl_extetoke_cre_ix` (`creatorid`);

--
-- Indices de la tabla `mdl_feedback`
--
ALTER TABLE `mdl_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feed_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_feedback_completed`
--
ALTER TABLE `mdl_feedback_completed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedcomp_use_ix` (`userid`),
  ADD KEY `mdl_feedcomp_fee_ix` (`feedback`);

--
-- Indices de la tabla `mdl_feedback_completedtmp`
--
ALTER TABLE `mdl_feedback_completedtmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedcomp_use2_ix` (`userid`),
  ADD KEY `mdl_feedcomp_fee2_ix` (`feedback`);

--
-- Indices de la tabla `mdl_feedback_item`
--
ALTER TABLE `mdl_feedback_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feeditem_fee_ix` (`feedback`),
  ADD KEY `mdl_feeditem_tem_ix` (`template`);

--
-- Indices de la tabla `mdl_feedback_sitecourse_map`
--
ALTER TABLE `mdl_feedback_sitecourse_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  ADD KEY `mdl_feedsitemap_fee_ix` (`feedbackid`);

--
-- Indices de la tabla `mdl_feedback_template`
--
ALTER TABLE `mdl_feedback_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedtemp_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_feedback_tracking`
--
ALTER TABLE `mdl_feedback_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedtrac_use_ix` (`userid`),
  ADD KEY `mdl_feedtrac_fee_ix` (`feedback`),
  ADD KEY `mdl_feedtrac_com_ix` (`completed`);

--
-- Indices de la tabla `mdl_feedback_value`
--
ALTER TABLE `mdl_feedback_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedvalu_cou_ix` (`course_id`),
  ADD KEY `mdl_feedvalu_ite_ix` (`item`);

--
-- Indices de la tabla `mdl_feedback_valuetmp`
--
ALTER TABLE `mdl_feedback_valuetmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  ADD KEY `mdl_feedvalu_ite2_ix` (`item`);

--
-- Indices de la tabla `mdl_files`
--
ALTER TABLE `mdl_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  ADD KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  ADD KEY `mdl_file_con_ix` (`contenthash`),
  ADD KEY `mdl_file_con2_ix` (`contextid`),
  ADD KEY `mdl_file_use_ix` (`userid`),
  ADD KEY `mdl_file_ref_ix` (`referencefileid`);

--
-- Indices de la tabla `mdl_files_reference`
--
ALTER TABLE `mdl_files_reference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_filerefe_repref_uix` (`repositoryid`,`referencehash`),
  ADD KEY `mdl_filerefe_rep_ix` (`repositoryid`);

--
-- Indices de la tabla `mdl_filter_active`
--
ALTER TABLE `mdl_filter_active`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  ADD KEY `mdl_filtacti_con_ix` (`contextid`);

--
-- Indices de la tabla `mdl_filter_config`
--
ALTER TABLE `mdl_filter_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  ADD KEY `mdl_filtconf_con_ix` (`contextid`);

--
-- Indices de la tabla `mdl_folder`
--
ALTER TABLE `mdl_folder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_fold_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_forum`
--
ALTER TABLE `mdl_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_foru_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_forum_digests`
--
ALTER TABLE `mdl_forum_digests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  ADD KEY `mdl_forudige_use_ix` (`userid`),
  ADD KEY `mdl_forudige_for_ix` (`forum`);

--
-- Indices de la tabla `mdl_forum_discussions`
--
ALTER TABLE `mdl_forum_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forudisc_use_ix` (`userid`),
  ADD KEY `mdl_forudisc_for_ix` (`forum`);

--
-- Indices de la tabla `mdl_forum_posts`
--
ALTER TABLE `mdl_forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forupost_use_ix` (`userid`),
  ADD KEY `mdl_forupost_cre_ix` (`created`),
  ADD KEY `mdl_forupost_mai_ix` (`mailed`),
  ADD KEY `mdl_forupost_dis_ix` (`discussion`),
  ADD KEY `mdl_forupost_par_ix` (`parent`);

--
-- Indices de la tabla `mdl_forum_queue`
--
ALTER TABLE `mdl_forum_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_foruqueu_use_ix` (`userid`),
  ADD KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  ADD KEY `mdl_foruqueu_pos_ix` (`postid`);

--
-- Indices de la tabla `mdl_forum_read`
--
ALTER TABLE `mdl_forum_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  ADD KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  ADD KEY `mdl_foruread_usepos_ix` (`userid`,`postid`);

--
-- Indices de la tabla `mdl_forum_subscriptions`
--
ALTER TABLE `mdl_forum_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forusubs_use_ix` (`userid`),
  ADD KEY `mdl_forusubs_for_ix` (`forum`);

--
-- Indices de la tabla `mdl_forum_track_prefs`
--
ALTER TABLE `mdl_forum_track_prefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`);

--
-- Indices de la tabla `mdl_glossary`
--
ALTER TABLE `mdl_glossary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glos_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_glossary_alias`
--
ALTER TABLE `mdl_glossary_alias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glosalia_ent_ix` (`entryid`);

--
-- Indices de la tabla `mdl_glossary_categories`
--
ALTER TABLE `mdl_glossary_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gloscate_glo_ix` (`glossaryid`);

--
-- Indices de la tabla `mdl_glossary_entries`
--
ALTER TABLE `mdl_glossary_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glosentr_use_ix` (`userid`),
  ADD KEY `mdl_glosentr_con_ix` (`concept`),
  ADD KEY `mdl_glosentr_glo_ix` (`glossaryid`);

--
-- Indices de la tabla `mdl_glossary_entries_categories`
--
ALTER TABLE `mdl_glossary_entries_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  ADD KEY `mdl_glosentrcate_ent_ix` (`entryid`);

--
-- Indices de la tabla `mdl_glossary_formats`
--
ALTER TABLE `mdl_glossary_formats`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_grade_categories`
--
ALTER TABLE `mdl_grade_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradcate_cou_ix` (`courseid`),
  ADD KEY `mdl_gradcate_par_ix` (`parent`);

--
-- Indices de la tabla `mdl_grade_categories_history`
--
ALTER TABLE `mdl_grade_categories_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradcatehist_act_ix` (`action`),
  ADD KEY `mdl_gradcatehist_old_ix` (`oldid`),
  ADD KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  ADD KEY `mdl_gradcatehist_par_ix` (`parent`),
  ADD KEY `mdl_gradcatehist_log_ix` (`loggeduser`);

--
-- Indices de la tabla `mdl_grade_grades`
--
ALTER TABLE `mdl_grade_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  ADD KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  ADD KEY `mdl_gradgrad_ite_ix` (`itemid`),
  ADD KEY `mdl_gradgrad_use_ix` (`userid`),
  ADD KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  ADD KEY `mdl_gradgrad_use2_ix` (`usermodified`);

--
-- Indices de la tabla `mdl_grade_grades_history`
--
ALTER TABLE `mdl_grade_grades_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradgradhist_act_ix` (`action`),
  ADD KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  ADD KEY `mdl_gradgradhist_old_ix` (`oldid`),
  ADD KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  ADD KEY `mdl_gradgradhist_use_ix` (`userid`),
  ADD KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  ADD KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  ADD KEY `mdl_gradgradhist_log_ix` (`loggeduser`);

--
-- Indices de la tabla `mdl_grade_import_newitem`
--
ALTER TABLE `mdl_grade_import_newitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradimponewi_imp_ix` (`importer`);

--
-- Indices de la tabla `mdl_grade_import_values`
--
ALTER TABLE `mdl_grade_import_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  ADD KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  ADD KEY `mdl_gradimpovalu_imp_ix` (`importer`);

--
-- Indices de la tabla `mdl_grade_items`
--
ALTER TABLE `mdl_grade_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  ADD KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  ADD KEY `mdl_graditem_gra_ix` (`gradetype`),
  ADD KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  ADD KEY `mdl_graditem_cou_ix` (`courseid`),
  ADD KEY `mdl_graditem_cat_ix` (`categoryid`),
  ADD KEY `mdl_graditem_sca_ix` (`scaleid`),
  ADD KEY `mdl_graditem_out_ix` (`outcomeid`);

--
-- Indices de la tabla `mdl_grade_items_history`
--
ALTER TABLE `mdl_grade_items_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_graditemhist_act_ix` (`action`),
  ADD KEY `mdl_graditemhist_old_ix` (`oldid`),
  ADD KEY `mdl_graditemhist_cou_ix` (`courseid`),
  ADD KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  ADD KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  ADD KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  ADD KEY `mdl_graditemhist_log_ix` (`loggeduser`);

--
-- Indices de la tabla `mdl_grade_letters`
--
ALTER TABLE `mdl_grade_letters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`);

--
-- Indices de la tabla `mdl_grade_outcomes`
--
ALTER TABLE `mdl_grade_outcomes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  ADD KEY `mdl_gradoutc_cou_ix` (`courseid`),
  ADD KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  ADD KEY `mdl_gradoutc_use_ix` (`usermodified`);

--
-- Indices de la tabla `mdl_grade_outcomes_courses`
--
ALTER TABLE `mdl_grade_outcomes_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  ADD KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  ADD KEY `mdl_gradoutccour_out_ix` (`outcomeid`);

--
-- Indices de la tabla `mdl_grade_outcomes_history`
--
ALTER TABLE `mdl_grade_outcomes_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradoutchist_act_ix` (`action`),
  ADD KEY `mdl_gradoutchist_old_ix` (`oldid`),
  ADD KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  ADD KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  ADD KEY `mdl_gradoutchist_log_ix` (`loggeduser`);

--
-- Indices de la tabla `mdl_grade_settings`
--
ALTER TABLE `mdl_grade_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  ADD KEY `mdl_gradsett_cou_ix` (`courseid`);

--
-- Indices de la tabla `mdl_grading_areas`
--
ALTER TABLE `mdl_grading_areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  ADD KEY `mdl_gradarea_con_ix` (`contextid`);

--
-- Indices de la tabla `mdl_grading_definitions`
--
ALTER TABLE `mdl_grading_definitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  ADD KEY `mdl_graddefi_are_ix` (`areaid`),
  ADD KEY `mdl_graddefi_use_ix` (`usermodified`),
  ADD KEY `mdl_graddefi_use2_ix` (`usercreated`);

--
-- Indices de la tabla `mdl_grading_instances`
--
ALTER TABLE `mdl_grading_instances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradinst_def_ix` (`definitionid`),
  ADD KEY `mdl_gradinst_rat_ix` (`raterid`);

--
-- Indices de la tabla `mdl_gradingform_guide_comments`
--
ALTER TABLE `mdl_gradingform_guide_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradguidcomm_def_ix` (`definitionid`);

--
-- Indices de la tabla `mdl_gradingform_guide_criteria`
--
ALTER TABLE `mdl_gradingform_guide_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradguidcrit_def_ix` (`definitionid`);

--
-- Indices de la tabla `mdl_gradingform_guide_fillings`
--
ALTER TABLE `mdl_gradingform_guide_fillings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  ADD KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  ADD KEY `mdl_gradguidfill_cri_ix` (`criterionid`);

--
-- Indices de la tabla `mdl_gradingform_rubric_criteria`
--
ALTER TABLE `mdl_gradingform_rubric_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradrubrcrit_def_ix` (`definitionid`);

--
-- Indices de la tabla `mdl_gradingform_rubric_fillings`
--
ALTER TABLE `mdl_gradingform_rubric_fillings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  ADD KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  ADD KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  ADD KEY `mdl_gradrubrfill_cri_ix` (`criterionid`);

--
-- Indices de la tabla `mdl_gradingform_rubric_levels`
--
ALTER TABLE `mdl_gradingform_rubric_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_gradrubrleve_cri_ix` (`criterionid`);

--
-- Indices de la tabla `mdl_groupings`
--
ALTER TABLE `mdl_groupings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_grou_idn2_ix` (`idnumber`),
  ADD KEY `mdl_grou_cou2_ix` (`courseid`);

--
-- Indices de la tabla `mdl_groupings_groups`
--
ALTER TABLE `mdl_groupings_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_grougrou_gro_ix` (`groupingid`),
  ADD KEY `mdl_grougrou_gro2_ix` (`groupid`);

--
-- Indices de la tabla `mdl_groups`
--
ALTER TABLE `mdl_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_grou_idn_ix` (`idnumber`),
  ADD KEY `mdl_grou_cou_ix` (`courseid`);

--
-- Indices de la tabla `mdl_groups_members`
--
ALTER TABLE `mdl_groups_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_groumemb_gro_ix` (`groupid`),
  ADD KEY `mdl_groumemb_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_imscp`
--
ALTER TABLE `mdl_imscp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_imsc_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_label`
--
ALTER TABLE `mdl_label`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_labe_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_lesson`
--
ALTER TABLE `mdl_lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_less_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_lesson_answers`
--
ALTER TABLE `mdl_lesson_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessansw_les_ix` (`lessonid`),
  ADD KEY `mdl_lessansw_pag_ix` (`pageid`);

--
-- Indices de la tabla `mdl_lesson_attempts`
--
ALTER TABLE `mdl_lesson_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessatte_use_ix` (`userid`),
  ADD KEY `mdl_lessatte_les_ix` (`lessonid`),
  ADD KEY `mdl_lessatte_pag_ix` (`pageid`),
  ADD KEY `mdl_lessatte_ans_ix` (`answerid`);

--
-- Indices de la tabla `mdl_lesson_branch`
--
ALTER TABLE `mdl_lesson_branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessbran_use_ix` (`userid`),
  ADD KEY `mdl_lessbran_les_ix` (`lessonid`),
  ADD KEY `mdl_lessbran_pag_ix` (`pageid`);

--
-- Indices de la tabla `mdl_lesson_grades`
--
ALTER TABLE `mdl_lesson_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lessgrad_use_ix` (`userid`),
  ADD KEY `mdl_lessgrad_les_ix` (`lessonid`);

--
-- Indices de la tabla `mdl_lesson_high_scores`
--
ALTER TABLE `mdl_lesson_high_scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lesshighscor_use_ix` (`userid`),
  ADD KEY `mdl_lesshighscor_les_ix` (`lessonid`);

--
-- Indices de la tabla `mdl_lesson_pages`
--
ALTER TABLE `mdl_lesson_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lesspage_les_ix` (`lessonid`);

--
-- Indices de la tabla `mdl_lesson_timer`
--
ALTER TABLE `mdl_lesson_timer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lesstime_use_ix` (`userid`),
  ADD KEY `mdl_lesstime_les_ix` (`lessonid`);

--
-- Indices de la tabla `mdl_license`
--
ALTER TABLE `mdl_license`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_log`
--
ALTER TABLE `mdl_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  ADD KEY `mdl_log_tim_ix` (`time`),
  ADD KEY `mdl_log_act_ix` (`action`),
  ADD KEY `mdl_log_usecou_ix` (`userid`,`course`),
  ADD KEY `mdl_log_cmi_ix` (`cmid`);

--
-- Indices de la tabla `mdl_log_display`
--
ALTER TABLE `mdl_log_display`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`);

--
-- Indices de la tabla `mdl_log_queries`
--
ALTER TABLE `mdl_log_queries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_lti`
--
ALTER TABLE `mdl_lti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_lti_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_lti_submission`
--
ALTER TABLE `mdl_lti_submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltisubm_lti_ix` (`ltiid`);

--
-- Indices de la tabla `mdl_lti_types`
--
ALTER TABLE `mdl_lti_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltitype_cou_ix` (`course`),
  ADD KEY `mdl_ltitype_too_ix` (`tooldomain`);

--
-- Indices de la tabla `mdl_lti_types_config`
--
ALTER TABLE `mdl_lti_types_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ltitypeconf_typ_ix` (`typeid`);

--
-- Indices de la tabla `mdl_message`
--
ALTER TABLE `mdl_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mess_use_ix` (`useridfrom`),
  ADD KEY `mdl_mess_use2_ix` (`useridto`);

--
-- Indices de la tabla `mdl_message_contacts`
--
ALTER TABLE `mdl_message_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`);

--
-- Indices de la tabla `mdl_message_processors`
--
ALTER TABLE `mdl_message_processors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_message_providers`
--
ALTER TABLE `mdl_message_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`);

--
-- Indices de la tabla `mdl_message_read`
--
ALTER TABLE `mdl_message_read`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_messread_use_ix` (`useridfrom`),
  ADD KEY `mdl_messread_use2_ix` (`useridto`);

--
-- Indices de la tabla `mdl_message_working`
--
ALTER TABLE `mdl_message_working`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_messwork_unr_ix` (`unreadmessageid`);

--
-- Indices de la tabla `mdl_mnet_application`
--
ALTER TABLE `mdl_mnet_application`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_mnet_host`
--
ALTER TABLE `mdl_mnet_host`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnethost_app_ix` (`applicationid`);

--
-- Indices de la tabla `mdl_mnet_host2service`
--
ALTER TABLE `mdl_mnet_host2service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`);

--
-- Indices de la tabla `mdl_mnet_log`
--
ALTER TABLE `mdl_mnet_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`);

--
-- Indices de la tabla `mdl_mnet_remote_rpc`
--
ALTER TABLE `mdl_mnet_remote_rpc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_mnet_remote_service2rpc`
--
ALTER TABLE `mdl_mnet_remote_service2rpc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`);

--
-- Indices de la tabla `mdl_mnet_rpc`
--
ALTER TABLE `mdl_mnet_rpc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`);

--
-- Indices de la tabla `mdl_mnet_service`
--
ALTER TABLE `mdl_mnet_service`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_mnet_service2rpc`
--
ALTER TABLE `mdl_mnet_service2rpc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`);

--
-- Indices de la tabla `mdl_mnet_session`
--
ALTER TABLE `mdl_mnet_session`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`);

--
-- Indices de la tabla `mdl_mnet_sso_access_control`
--
ALTER TABLE `mdl_mnet_sso_access_control`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`);

--
-- Indices de la tabla `mdl_mnetservice_enrol_courses`
--
ALTER TABLE `mdl_mnetservice_enrol_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`);

--
-- Indices de la tabla `mdl_mnetservice_enrol_enrolments`
--
ALTER TABLE `mdl_mnetservice_enrol_enrolments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mnetenroenro_use_ix` (`userid`),
  ADD KEY `mdl_mnetenroenro_hos_ix` (`hostid`);

--
-- Indices de la tabla `mdl_modules`
--
ALTER TABLE `mdl_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_modu_nam_ix` (`name`);

--
-- Indices de la tabla `mdl_my_pages`
--
ALTER TABLE `mdl_my_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_mypage_usepri_ix` (`userid`,`private`);

--
-- Indices de la tabla `mdl_page`
--
ALTER TABLE `mdl_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_page_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_portfolio_instance`
--
ALTER TABLE `mdl_portfolio_instance`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_portfolio_instance_config`
--
ALTER TABLE `mdl_portfolio_instance_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portinstconf_nam_ix` (`name`),
  ADD KEY `mdl_portinstconf_ins_ix` (`instance`);

--
-- Indices de la tabla `mdl_portfolio_instance_user`
--
ALTER TABLE `mdl_portfolio_instance_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portinstuser_ins_ix` (`instance`),
  ADD KEY `mdl_portinstuser_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_portfolio_log`
--
ALTER TABLE `mdl_portfolio_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portlog_use_ix` (`userid`),
  ADD KEY `mdl_portlog_por_ix` (`portfolio`);

--
-- Indices de la tabla `mdl_portfolio_mahara_queue`
--
ALTER TABLE `mdl_portfolio_mahara_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_portmahaqueu_tok_ix` (`token`),
  ADD KEY `mdl_portmahaqueu_tra_ix` (`transferid`);

--
-- Indices de la tabla `mdl_portfolio_tempdata`
--
ALTER TABLE `mdl_portfolio_tempdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_porttemp_use_ix` (`userid`),
  ADD KEY `mdl_porttemp_ins_ix` (`instance`);

--
-- Indices de la tabla `mdl_post`
--
ALTER TABLE `mdl_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  ADD KEY `mdl_post_las_ix` (`lastmodified`),
  ADD KEY `mdl_post_mod_ix` (`module`),
  ADD KEY `mdl_post_sub_ix` (`subject`),
  ADD KEY `mdl_post_use_ix` (`usermodified`);

--
-- Indices de la tabla `mdl_profiling`
--
ALTER TABLE `mdl_profiling`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  ADD KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  ADD KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`);

--
-- Indices de la tabla `mdl_qtype_essay_options`
--
ALTER TABLE `mdl_qtype_essay_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`);

--
-- Indices de la tabla `mdl_qtype_match_options`
--
ALTER TABLE `mdl_qtype_match_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`);

--
-- Indices de la tabla `mdl_qtype_match_subquestions`
--
ALTER TABLE `mdl_qtype_match_subquestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_qtypmatcsubq_que_ix` (`questionid`);

--
-- Indices de la tabla `mdl_qtype_multichoice_options`
--
ALTER TABLE `mdl_qtype_multichoice_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`);

--
-- Indices de la tabla `mdl_qtype_randomsamatch_options`
--
ALTER TABLE `mdl_qtype_randomsamatch_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`);

--
-- Indices de la tabla `mdl_qtype_shortanswer_options`
--
ALTER TABLE `mdl_qtype_shortanswer_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`);

--
-- Indices de la tabla `mdl_question`
--
ALTER TABLE `mdl_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_ques_cat_ix` (`category`),
  ADD KEY `mdl_ques_par_ix` (`parent`),
  ADD KEY `mdl_ques_cre_ix` (`createdby`),
  ADD KEY `mdl_ques_mod_ix` (`modifiedby`);

--
-- Indices de la tabla `mdl_question_answers`
--
ALTER TABLE `mdl_question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesansw_que_ix` (`question`);

--
-- Indices de la tabla `mdl_question_attempt_step_data`
--
ALTER TABLE `mdl_question_attempt_step_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  ADD KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`);

--
-- Indices de la tabla `mdl_question_attempt_steps`
--
ALTER TABLE `mdl_question_attempt_steps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  ADD KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  ADD KEY `mdl_quesattestep_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_question_attempts`
--
ALTER TABLE `mdl_question_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  ADD KEY `mdl_quesatte_beh_ix` (`behaviour`),
  ADD KEY `mdl_quesatte_que_ix` (`questionid`),
  ADD KEY `mdl_quesatte_que2_ix` (`questionusageid`);

--
-- Indices de la tabla `mdl_question_calculated`
--
ALTER TABLE `mdl_question_calculated`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quescalc_ans_ix` (`answer`),
  ADD KEY `mdl_quescalc_que_ix` (`question`);

--
-- Indices de la tabla `mdl_question_calculated_options`
--
ALTER TABLE `mdl_question_calculated_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quescalcopti_que_ix` (`question`);

--
-- Indices de la tabla `mdl_question_categories`
--
ALTER TABLE `mdl_question_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quescate_con_ix` (`contextid`),
  ADD KEY `mdl_quescate_par_ix` (`parent`);

--
-- Indices de la tabla `mdl_question_dataset_definitions`
--
ALTER TABLE `mdl_question_dataset_definitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesdatadefi_cat_ix` (`category`);

--
-- Indices de la tabla `mdl_question_dataset_items`
--
ALTER TABLE `mdl_question_dataset_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesdataitem_def_ix` (`definition`);

--
-- Indices de la tabla `mdl_question_datasets`
--
ALTER TABLE `mdl_question_datasets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  ADD KEY `mdl_quesdata_que_ix` (`question`),
  ADD KEY `mdl_quesdata_dat_ix` (`datasetdefinition`);

--
-- Indices de la tabla `mdl_question_hints`
--
ALTER TABLE `mdl_question_hints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_queshint_que_ix` (`questionid`);

--
-- Indices de la tabla `mdl_question_multianswer`
--
ALTER TABLE `mdl_question_multianswer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesmult_que_ix` (`question`);

--
-- Indices de la tabla `mdl_question_numerical`
--
ALTER TABLE `mdl_question_numerical`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesnume_ans_ix` (`answer`),
  ADD KEY `mdl_quesnume_que_ix` (`question`);

--
-- Indices de la tabla `mdl_question_numerical_options`
--
ALTER TABLE `mdl_question_numerical_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesnumeopti_que_ix` (`question`);

--
-- Indices de la tabla `mdl_question_numerical_units`
--
ALTER TABLE `mdl_question_numerical_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  ADD KEY `mdl_quesnumeunit_que_ix` (`question`);

--
-- Indices de la tabla `mdl_question_response_analysis`
--
ALTER TABLE `mdl_question_response_analysis`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_question_sessions`
--
ALTER TABLE `mdl_question_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  ADD KEY `mdl_quessess_att_ix` (`attemptid`),
  ADD KEY `mdl_quessess_que_ix` (`questionid`),
  ADD KEY `mdl_quessess_new_ix` (`newest`),
  ADD KEY `mdl_quessess_new2_ix` (`newgraded`);

--
-- Indices de la tabla `mdl_question_states`
--
ALTER TABLE `mdl_question_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesstat_att_ix` (`attempt`),
  ADD KEY `mdl_quesstat_que_ix` (`question`);

--
-- Indices de la tabla `mdl_question_statistics`
--
ALTER TABLE `mdl_question_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_question_truefalse`
--
ALTER TABLE `mdl_question_truefalse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_questrue_que_ix` (`question`);

--
-- Indices de la tabla `mdl_question_usages`
--
ALTER TABLE `mdl_question_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesusag_con_ix` (`contextid`);

--
-- Indices de la tabla `mdl_quiz`
--
ALTER TABLE `mdl_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quiz_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_quiz_attempts`
--
ALTER TABLE `mdl_quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  ADD UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  ADD KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  ADD KEY `mdl_quizatte_qui_ix` (`quiz`),
  ADD KEY `mdl_quizatte_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_quiz_feedback`
--
ALTER TABLE `mdl_quiz_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizfeed_qui_ix` (`quizid`);

--
-- Indices de la tabla `mdl_quiz_grades`
--
ALTER TABLE `mdl_quiz_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizgrad_use_ix` (`userid`),
  ADD KEY `mdl_quizgrad_qui_ix` (`quiz`);

--
-- Indices de la tabla `mdl_quiz_overrides`
--
ALTER TABLE `mdl_quiz_overrides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizover_qui_ix` (`quiz`),
  ADD KEY `mdl_quizover_gro_ix` (`groupid`),
  ADD KEY `mdl_quizover_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_quiz_overview_regrades`
--
ALTER TABLE `mdl_quiz_overview_regrades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_quiz_question_instances`
--
ALTER TABLE `mdl_quiz_question_instances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  ADD KEY `mdl_quizquesinst_que_ix` (`question`);

--
-- Indices de la tabla `mdl_quiz_reports`
--
ALTER TABLE `mdl_quiz_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`);

--
-- Indices de la tabla `mdl_quiz_statistics`
--
ALTER TABLE `mdl_quiz_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_rating`
--
ALTER TABLE `mdl_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  ADD KEY `mdl_rati_con_ix` (`contextid`),
  ADD KEY `mdl_rati_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_registration_hubs`
--
ALTER TABLE `mdl_registration_hubs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_repository`
--
ALTER TABLE `mdl_repository`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_repository_instance_config`
--
ALTER TABLE `mdl_repository_instance_config`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_repository_instances`
--
ALTER TABLE `mdl_repository_instances`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_resource`
--
ALTER TABLE `mdl_resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_reso_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_resource_old`
--
ALTER TABLE `mdl_resource_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  ADD KEY `mdl_resoold_cmi_ix` (`cmid`);

--
-- Indices de la tabla `mdl_role`
--
ALTER TABLE `mdl_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  ADD UNIQUE KEY `mdl_role_sho_uix` (`shortname`);

--
-- Indices de la tabla `mdl_role_allow_assign`
--
ALTER TABLE `mdl_role_allow_assign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  ADD KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  ADD KEY `mdl_rolealloassi_all_ix` (`allowassign`);

--
-- Indices de la tabla `mdl_role_allow_override`
--
ALTER TABLE `mdl_role_allow_override`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  ADD KEY `mdl_rolealloover_rol_ix` (`roleid`),
  ADD KEY `mdl_rolealloover_all_ix` (`allowoverride`);

--
-- Indices de la tabla `mdl_role_allow_switch`
--
ALTER TABLE `mdl_role_allow_switch`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  ADD KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  ADD KEY `mdl_rolealloswit_all_ix` (`allowswitch`);

--
-- Indices de la tabla `mdl_role_assignments`
--
ALTER TABLE `mdl_role_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_roleassi_sor_ix` (`sortorder`),
  ADD KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  ADD KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  ADD KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  ADD KEY `mdl_roleassi_rol_ix` (`roleid`),
  ADD KEY `mdl_roleassi_con_ix` (`contextid`),
  ADD KEY `mdl_roleassi_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_role_capabilities`
--
ALTER TABLE `mdl_role_capabilities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  ADD KEY `mdl_rolecapa_rol_ix` (`roleid`),
  ADD KEY `mdl_rolecapa_con_ix` (`contextid`),
  ADD KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  ADD KEY `mdl_rolecapa_cap_ix` (`capability`);

--
-- Indices de la tabla `mdl_role_context_levels`
--
ALTER TABLE `mdl_role_context_levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  ADD KEY `mdl_rolecontleve_rol_ix` (`roleid`);

--
-- Indices de la tabla `mdl_role_names`
--
ALTER TABLE `mdl_role_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  ADD KEY `mdl_rolename_rol_ix` (`roleid`),
  ADD KEY `mdl_rolename_con_ix` (`contextid`);

--
-- Indices de la tabla `mdl_role_sortorder`
--
ALTER TABLE `mdl_role_sortorder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  ADD KEY `mdl_rolesort_use_ix` (`userid`),
  ADD KEY `mdl_rolesort_rol_ix` (`roleid`),
  ADD KEY `mdl_rolesort_con_ix` (`contextid`);

--
-- Indices de la tabla `mdl_scale`
--
ALTER TABLE `mdl_scale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scal_cou_ix` (`courseid`);

--
-- Indices de la tabla `mdl_scale_history`
--
ALTER TABLE `mdl_scale_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scalhist_act_ix` (`action`),
  ADD KEY `mdl_scalhist_old_ix` (`oldid`),
  ADD KEY `mdl_scalhist_cou_ix` (`courseid`),
  ADD KEY `mdl_scalhist_log_ix` (`loggeduser`);

--
-- Indices de la tabla `mdl_scorm`
--
ALTER TABLE `mdl_scorm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scor_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_scorm_aicc_session`
--
ALTER TABLE `mdl_scorm_aicc_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  ADD KEY `mdl_scoraiccsess_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_scorm_scoes`
--
ALTER TABLE `mdl_scorm_scoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scorscoe_sco_ix` (`scorm`);

--
-- Indices de la tabla `mdl_scorm_scoes_data`
--
ALTER TABLE `mdl_scorm_scoes_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_scorscoedata_sco_ix` (`scoid`);

--
-- Indices de la tabla `mdl_scorm_scoes_track`
--
ALTER TABLE `mdl_scorm_scoes_track`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  ADD KEY `mdl_scorscoetrac_use_ix` (`userid`),
  ADD KEY `mdl_scorscoetrac_ele_ix` (`element`),
  ADD KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  ADD KEY `mdl_scorscoetrac_sco2_ix` (`scoid`);

--
-- Indices de la tabla `mdl_scorm_seq_mapinfo`
--
ALTER TABLE `mdl_scorm_seq_mapinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  ADD KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  ADD KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`);

--
-- Indices de la tabla `mdl_scorm_seq_objective`
--
ALTER TABLE `mdl_scorm_seq_objective`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  ADD KEY `mdl_scorseqobje_sco_ix` (`scoid`);

--
-- Indices de la tabla `mdl_scorm_seq_rolluprule`
--
ALTER TABLE `mdl_scorm_seq_rolluprule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  ADD KEY `mdl_scorseqroll_sco_ix` (`scoid`);

--
-- Indices de la tabla `mdl_scorm_seq_rolluprulecond`
--
ALTER TABLE `mdl_scorm_seq_rolluprulecond`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  ADD KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  ADD KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`);

--
-- Indices de la tabla `mdl_scorm_seq_rulecond`
--
ALTER TABLE `mdl_scorm_seq_rulecond`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  ADD KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  ADD KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`);

--
-- Indices de la tabla `mdl_scorm_seq_ruleconds`
--
ALTER TABLE `mdl_scorm_seq_ruleconds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  ADD KEY `mdl_scorseqrule_sco_ix` (`scoid`);

--
-- Indices de la tabla `mdl_sessions`
--
ALTER TABLE `mdl_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  ADD KEY `mdl_sess_sta_ix` (`state`),
  ADD KEY `mdl_sess_tim_ix` (`timecreated`),
  ADD KEY `mdl_sess_tim2_ix` (`timemodified`),
  ADD KEY `mdl_sess_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_stats_daily`
--
ALTER TABLE `mdl_stats_daily`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statdail_cou_ix` (`courseid`),
  ADD KEY `mdl_statdail_tim_ix` (`timeend`),
  ADD KEY `mdl_statdail_rol_ix` (`roleid`);

--
-- Indices de la tabla `mdl_stats_monthly`
--
ALTER TABLE `mdl_stats_monthly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statmont_cou_ix` (`courseid`),
  ADD KEY `mdl_statmont_tim_ix` (`timeend`),
  ADD KEY `mdl_statmont_rol_ix` (`roleid`);

--
-- Indices de la tabla `mdl_stats_user_daily`
--
ALTER TABLE `mdl_stats_user_daily`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statuserdail_cou_ix` (`courseid`),
  ADD KEY `mdl_statuserdail_use_ix` (`userid`),
  ADD KEY `mdl_statuserdail_rol_ix` (`roleid`),
  ADD KEY `mdl_statuserdail_tim_ix` (`timeend`);

--
-- Indices de la tabla `mdl_stats_user_monthly`
--
ALTER TABLE `mdl_stats_user_monthly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statusermont_cou_ix` (`courseid`),
  ADD KEY `mdl_statusermont_use_ix` (`userid`),
  ADD KEY `mdl_statusermont_rol_ix` (`roleid`),
  ADD KEY `mdl_statusermont_tim_ix` (`timeend`);

--
-- Indices de la tabla `mdl_stats_user_weekly`
--
ALTER TABLE `mdl_stats_user_weekly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statuserweek_cou_ix` (`courseid`),
  ADD KEY `mdl_statuserweek_use_ix` (`userid`),
  ADD KEY `mdl_statuserweek_rol_ix` (`roleid`),
  ADD KEY `mdl_statuserweek_tim_ix` (`timeend`);

--
-- Indices de la tabla `mdl_stats_weekly`
--
ALTER TABLE `mdl_stats_weekly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_statweek_cou_ix` (`courseid`),
  ADD KEY `mdl_statweek_tim_ix` (`timeend`),
  ADD KEY `mdl_statweek_rol_ix` (`roleid`);

--
-- Indices de la tabla `mdl_survey`
--
ALTER TABLE `mdl_survey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_surv_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_survey_analysis`
--
ALTER TABLE `mdl_survey_analysis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_survanal_use_ix` (`userid`),
  ADD KEY `mdl_survanal_sur_ix` (`survey`);

--
-- Indices de la tabla `mdl_survey_answers`
--
ALTER TABLE `mdl_survey_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_survansw_use_ix` (`userid`),
  ADD KEY `mdl_survansw_sur_ix` (`survey`),
  ADD KEY `mdl_survansw_que_ix` (`question`);

--
-- Indices de la tabla `mdl_survey_questions`
--
ALTER TABLE `mdl_survey_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_tag`
--
ALTER TABLE `mdl_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  ADD UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  ADD KEY `mdl_tag_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_tag_correlation`
--
ALTER TABLE `mdl_tag_correlation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_tagcorr_tag_ix` (`tagid`);

--
-- Indices de la tabla `mdl_tag_instance`
--
ALTER TABLE `mdl_tag_instance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  ADD KEY `mdl_taginst_tag_ix` (`tagid`);

--
-- Indices de la tabla `mdl_timezone`
--
ALTER TABLE `mdl_timezone`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_tool_customlang`
--
ALTER TABLE `mdl_tool_customlang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  ADD KEY `mdl_toolcust_com_ix` (`componentid`);

--
-- Indices de la tabla `mdl_tool_customlang_components`
--
ALTER TABLE `mdl_tool_customlang_components`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_upgrade_log`
--
ALTER TABLE `mdl_upgrade_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  ADD KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  ADD KEY `mdl_upgrlog_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_url`
--
ALTER TABLE `mdl_url`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_url_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_user`
--
ALTER TABLE `mdl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  ADD KEY `mdl_user_del_ix` (`deleted`),
  ADD KEY `mdl_user_con_ix` (`confirmed`),
  ADD KEY `mdl_user_fir_ix` (`firstname`),
  ADD KEY `mdl_user_las_ix` (`lastname`),
  ADD KEY `mdl_user_cit_ix` (`city`),
  ADD KEY `mdl_user_cou_ix` (`country`),
  ADD KEY `mdl_user_las2_ix` (`lastaccess`),
  ADD KEY `mdl_user_ema_ix` (`email`),
  ADD KEY `mdl_user_aut_ix` (`auth`),
  ADD KEY `mdl_user_idn_ix` (`idnumber`),
  ADD KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  ADD KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  ADD KEY `mdl_user_mid_ix` (`middlename`),
  ADD KEY `mdl_user_alt_ix` (`alternatename`);

--
-- Indices de la tabla `mdl_user_devices`
--
ALTER TABLE `mdl_user_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  ADD KEY `mdl_userdevi_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_user_enrolments`
--
ALTER TABLE `mdl_user_enrolments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  ADD KEY `mdl_userenro_enr_ix` (`enrolid`),
  ADD KEY `mdl_userenro_use_ix` (`userid`),
  ADD KEY `mdl_userenro_mod_ix` (`modifierid`);

--
-- Indices de la tabla `mdl_user_info_category`
--
ALTER TABLE `mdl_user_info_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_user_info_data`
--
ALTER TABLE `mdl_user_info_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`);

--
-- Indices de la tabla `mdl_user_info_field`
--
ALTER TABLE `mdl_user_info_field`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_user_lastaccess`
--
ALTER TABLE `mdl_user_lastaccess`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  ADD KEY `mdl_userlast_use_ix` (`userid`),
  ADD KEY `mdl_userlast_cou_ix` (`courseid`);

--
-- Indices de la tabla `mdl_user_password_resets`
--
ALTER TABLE `mdl_user_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_userpassrese_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_user_preferences`
--
ALTER TABLE `mdl_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`);

--
-- Indices de la tabla `mdl_user_private_key`
--
ALTER TABLE `mdl_user_private_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  ADD KEY `mdl_userprivkey_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_webdav_locks`
--
ALTER TABLE `mdl_webdav_locks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  ADD KEY `mdl_webdlock_pat_ix` (`path`),
  ADD KEY `mdl_webdlock_exp_ix` (`expiry`);

--
-- Indices de la tabla `mdl_wiki`
--
ALTER TABLE `mdl_wiki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_wiki_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_wiki_links`
--
ALTER TABLE `mdl_wiki_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_wikilink_fro_ix` (`frompageid`),
  ADD KEY `mdl_wikilink_sub_ix` (`subwikiid`);

--
-- Indices de la tabla `mdl_wiki_locks`
--
ALTER TABLE `mdl_wiki_locks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mdl_wiki_pages`
--
ALTER TABLE `mdl_wiki_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  ADD KEY `mdl_wikipage_sub_ix` (`subwikiid`);

--
-- Indices de la tabla `mdl_wiki_subwikis`
--
ALTER TABLE `mdl_wiki_subwikis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  ADD KEY `mdl_wikisubw_wik_ix` (`wikiid`);

--
-- Indices de la tabla `mdl_wiki_synonyms`
--
ALTER TABLE `mdl_wiki_synonyms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`);

--
-- Indices de la tabla `mdl_wiki_versions`
--
ALTER TABLE `mdl_wiki_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_wikivers_pag_ix` (`pageid`);

--
-- Indices de la tabla `mdl_workshop`
--
ALTER TABLE `mdl_workshop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_work_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_workshop_aggregations`
--
ALTER TABLE `mdl_workshop_aggregations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  ADD KEY `mdl_workaggr_wor_ix` (`workshopid`),
  ADD KEY `mdl_workaggr_use_ix` (`userid`);

--
-- Indices de la tabla `mdl_workshop_assessments`
--
ALTER TABLE `mdl_workshop_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workasse_sub_ix` (`submissionid`),
  ADD KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  ADD KEY `mdl_workasse_rev_ix` (`reviewerid`);

--
-- Indices de la tabla `mdl_workshop_assessments_old`
--
ALTER TABLE `mdl_workshop_assessments_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workasseold_use_ix` (`userid`),
  ADD KEY `mdl_workasseold_mai_ix` (`mailed`),
  ADD KEY `mdl_workasseold_wor_ix` (`workshopid`),
  ADD KEY `mdl_workasseold_sub_ix` (`submissionid`);

--
-- Indices de la tabla `mdl_workshop_comments_old`
--
ALTER TABLE `mdl_workshop_comments_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workcommold_use_ix` (`userid`),
  ADD KEY `mdl_workcommold_mai_ix` (`mailed`),
  ADD KEY `mdl_workcommold_wor_ix` (`workshopid`),
  ADD KEY `mdl_workcommold_ass_ix` (`assessmentid`);

--
-- Indices de la tabla `mdl_workshop_elements_old`
--
ALTER TABLE `mdl_workshop_elements_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workelemold_wor_ix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshop_grades`
--
ALTER TABLE `mdl_workshop_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  ADD KEY `mdl_workgrad_ass_ix` (`assessmentid`);

--
-- Indices de la tabla `mdl_workshop_grades_old`
--
ALTER TABLE `mdl_workshop_grades_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workgradold_wor_ix` (`workshopid`),
  ADD KEY `mdl_workgradold_ass_ix` (`assessmentid`);

--
-- Indices de la tabla `mdl_workshop_old`
--
ALTER TABLE `mdl_workshop_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workold_cou_ix` (`course`);

--
-- Indices de la tabla `mdl_workshop_rubrics_old`
--
ALTER TABLE `mdl_workshop_rubrics_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workrubrold_wor_ix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshop_stockcomments_old`
--
ALTER TABLE `mdl_workshop_stockcomments_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workstocold_wor_ix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshop_submissions`
--
ALTER TABLE `mdl_workshop_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_worksubm_wor_ix` (`workshopid`),
  ADD KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  ADD KEY `mdl_worksubm_aut_ix` (`authorid`);

--
-- Indices de la tabla `mdl_workshop_submissions_old`
--
ALTER TABLE `mdl_workshop_submissions_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_worksubmold_use_ix` (`userid`),
  ADD KEY `mdl_worksubmold_mai_ix` (`mailed`),
  ADD KEY `mdl_worksubmold_wor_ix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshopallocation_scheduled`
--
ALTER TABLE `mdl_workshopallocation_scheduled`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshopeval_best_settings`
--
ALTER TABLE `mdl_workshopeval_best_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshopform_accumulative`
--
ALTER TABLE `mdl_workshopform_accumulative`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workaccu_wor_ix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshopform_comments`
--
ALTER TABLE `mdl_workshopform_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workcomm_wor_ix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshopform_numerrors`
--
ALTER TABLE `mdl_workshopform_numerrors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_worknume_wor_ix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshopform_numerrors_map`
--
ALTER TABLE `mdl_workshopform_numerrors_map`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  ADD KEY `mdl_worknumemap_wor_ix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshopform_rubric`
--
ALTER TABLE `mdl_workshopform_rubric`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workrubr_wor_ix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshopform_rubric_config`
--
ALTER TABLE `mdl_workshopform_rubric_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`);

--
-- Indices de la tabla `mdl_workshopform_rubric_levels`
--
ALTER TABLE `mdl_workshopform_rubric_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_workrubrleve_dim_ix` (`dimensionid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mdl_assign`
--
ALTER TABLE `mdl_assign`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assign_grades`
--
ALTER TABLE `mdl_assign_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assign_plugin_config`
--
ALTER TABLE `mdl_assign_plugin_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assign_submission`
--
ALTER TABLE `mdl_assign_submission`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assign_user_flags`
--
ALTER TABLE `mdl_assign_user_flags`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assign_user_mapping`
--
ALTER TABLE `mdl_assign_user_mapping`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assignfeedback_comments`
--
ALTER TABLE `mdl_assignfeedback_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assignfeedback_editpdf_annot`
--
ALTER TABLE `mdl_assignfeedback_editpdf_annot`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assignfeedback_editpdf_cmnt`
--
ALTER TABLE `mdl_assignfeedback_editpdf_cmnt`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assignfeedback_editpdf_quick`
--
ALTER TABLE `mdl_assignfeedback_editpdf_quick`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assignfeedback_file`
--
ALTER TABLE `mdl_assignfeedback_file`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assignment`
--
ALTER TABLE `mdl_assignment`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assignment_submissions`
--
ALTER TABLE `mdl_assignment_submissions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assignsubmission_file`
--
ALTER TABLE `mdl_assignsubmission_file`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_assignsubmission_onlinetext`
--
ALTER TABLE `mdl_assignsubmission_onlinetext`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_backup_controllers`
--
ALTER TABLE `mdl_backup_controllers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_backup_courses`
--
ALTER TABLE `mdl_backup_courses`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_backup_logs`
--
ALTER TABLE `mdl_backup_logs`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_badge`
--
ALTER TABLE `mdl_badge`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_badge_backpack`
--
ALTER TABLE `mdl_badge_backpack`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_badge_criteria`
--
ALTER TABLE `mdl_badge_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_badge_criteria_met`
--
ALTER TABLE `mdl_badge_criteria_met`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_badge_criteria_param`
--
ALTER TABLE `mdl_badge_criteria_param`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_badge_external`
--
ALTER TABLE `mdl_badge_external`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_badge_issued`
--
ALTER TABLE `mdl_badge_issued`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_badge_manual_award`
--
ALTER TABLE `mdl_badge_manual_award`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_block`
--
ALTER TABLE `mdl_block`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de la tabla `mdl_block_community`
--
ALTER TABLE `mdl_block_community`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_block_instances`
--
ALTER TABLE `mdl_block_instances`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `mdl_block_positions`
--
ALTER TABLE `mdl_block_positions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_block_rss_client`
--
ALTER TABLE `mdl_block_rss_client`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_blog_association`
--
ALTER TABLE `mdl_blog_association`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_blog_external`
--
ALTER TABLE `mdl_blog_external`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_book`
--
ALTER TABLE `mdl_book`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_book_chapters`
--
ALTER TABLE `mdl_book_chapters`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_cache_filters`
--
ALTER TABLE `mdl_cache_filters`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_cache_flags`
--
ALTER TABLE `mdl_cache_flags`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mdl_cache_text`
--
ALTER TABLE `mdl_cache_text`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mdl_capabilities`
--
ALTER TABLE `mdl_capabilities`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;
--
-- AUTO_INCREMENT de la tabla `mdl_chat`
--
ALTER TABLE `mdl_chat`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_chat_messages`
--
ALTER TABLE `mdl_chat_messages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_chat_messages_current`
--
ALTER TABLE `mdl_chat_messages_current`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_chat_users`
--
ALTER TABLE `mdl_chat_users`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_choice`
--
ALTER TABLE `mdl_choice`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_choice_answers`
--
ALTER TABLE `mdl_choice_answers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_choice_options`
--
ALTER TABLE `mdl_choice_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_cohort`
--
ALTER TABLE `mdl_cohort`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_cohort_members`
--
ALTER TABLE `mdl_cohort_members`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_comments`
--
ALTER TABLE `mdl_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_config`
--
ALTER TABLE `mdl_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;
--
-- AUTO_INCREMENT de la tabla `mdl_config_log`
--
ALTER TABLE `mdl_config_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=887;
--
-- AUTO_INCREMENT de la tabla `mdl_config_plugins`
--
ALTER TABLE `mdl_config_plugins`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1013;
--
-- AUTO_INCREMENT de la tabla `mdl_context`
--
ALTER TABLE `mdl_context`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `mdl_course`
--
ALTER TABLE `mdl_course`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `mdl_course_categories`
--
ALTER TABLE `mdl_course_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `mdl_course_completion_aggr_methd`
--
ALTER TABLE `mdl_course_completion_aggr_methd`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_completion_crit_compl`
--
ALTER TABLE `mdl_course_completion_crit_compl`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_completion_criteria`
--
ALTER TABLE `mdl_course_completion_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_completions`
--
ALTER TABLE `mdl_course_completions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_format_options`
--
ALTER TABLE `mdl_course_format_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `mdl_course_modules`
--
ALTER TABLE `mdl_course_modules`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_modules_avail_fields`
--
ALTER TABLE `mdl_course_modules_avail_fields`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_modules_availability`
--
ALTER TABLE `mdl_course_modules_availability`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_modules_completion`
--
ALTER TABLE `mdl_course_modules_completion`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_published`
--
ALTER TABLE `mdl_course_published`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_request`
--
ALTER TABLE `mdl_course_request`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_sections`
--
ALTER TABLE `mdl_course_sections`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_sections_avail_fields`
--
ALTER TABLE `mdl_course_sections_avail_fields`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_course_sections_availability`
--
ALTER TABLE `mdl_course_sections_availability`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_data`
--
ALTER TABLE `mdl_data`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_data_content`
--
ALTER TABLE `mdl_data_content`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_data_fields`
--
ALTER TABLE `mdl_data_fields`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_data_records`
--
ALTER TABLE `mdl_data_records`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_enrol`
--
ALTER TABLE `mdl_enrol`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_enrol_flatfile`
--
ALTER TABLE `mdl_enrol_flatfile`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_enrol_paypal`
--
ALTER TABLE `mdl_enrol_paypal`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_event`
--
ALTER TABLE `mdl_event`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_event_subscriptions`
--
ALTER TABLE `mdl_event_subscriptions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_events_handlers`
--
ALTER TABLE `mdl_events_handlers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `mdl_events_queue`
--
ALTER TABLE `mdl_events_queue`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_events_queue_handlers`
--
ALTER TABLE `mdl_events_queue_handlers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_external_functions`
--
ALTER TABLE `mdl_external_functions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT de la tabla `mdl_external_services`
--
ALTER TABLE `mdl_external_services`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `mdl_external_services_functions`
--
ALTER TABLE `mdl_external_services_functions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `mdl_external_services_users`
--
ALTER TABLE `mdl_external_services_users`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_external_tokens`
--
ALTER TABLE `mdl_external_tokens`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_feedback`
--
ALTER TABLE `mdl_feedback`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_feedback_completed`
--
ALTER TABLE `mdl_feedback_completed`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_feedback_completedtmp`
--
ALTER TABLE `mdl_feedback_completedtmp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_feedback_item`
--
ALTER TABLE `mdl_feedback_item`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_feedback_sitecourse_map`
--
ALTER TABLE `mdl_feedback_sitecourse_map`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_feedback_template`
--
ALTER TABLE `mdl_feedback_template`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_feedback_tracking`
--
ALTER TABLE `mdl_feedback_tracking`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_feedback_value`
--
ALTER TABLE `mdl_feedback_value`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_feedback_valuetmp`
--
ALTER TABLE `mdl_feedback_valuetmp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_files`
--
ALTER TABLE `mdl_files`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `mdl_files_reference`
--
ALTER TABLE `mdl_files_reference`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_filter_active`
--
ALTER TABLE `mdl_filter_active`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mdl_filter_config`
--
ALTER TABLE `mdl_filter_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_folder`
--
ALTER TABLE `mdl_folder`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_forum`
--
ALTER TABLE `mdl_forum`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_forum_digests`
--
ALTER TABLE `mdl_forum_digests`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_forum_discussions`
--
ALTER TABLE `mdl_forum_discussions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_forum_posts`
--
ALTER TABLE `mdl_forum_posts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_forum_queue`
--
ALTER TABLE `mdl_forum_queue`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_forum_read`
--
ALTER TABLE `mdl_forum_read`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_forum_subscriptions`
--
ALTER TABLE `mdl_forum_subscriptions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_forum_track_prefs`
--
ALTER TABLE `mdl_forum_track_prefs`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_glossary`
--
ALTER TABLE `mdl_glossary`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_glossary_alias`
--
ALTER TABLE `mdl_glossary_alias`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_glossary_categories`
--
ALTER TABLE `mdl_glossary_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_glossary_entries`
--
ALTER TABLE `mdl_glossary_entries`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_glossary_entries_categories`
--
ALTER TABLE `mdl_glossary_entries_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_glossary_formats`
--
ALTER TABLE `mdl_glossary_formats`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_categories`
--
ALTER TABLE `mdl_grade_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_categories_history`
--
ALTER TABLE `mdl_grade_categories_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_grades`
--
ALTER TABLE `mdl_grade_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_grades_history`
--
ALTER TABLE `mdl_grade_grades_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_import_newitem`
--
ALTER TABLE `mdl_grade_import_newitem`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_import_values`
--
ALTER TABLE `mdl_grade_import_values`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_items`
--
ALTER TABLE `mdl_grade_items`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_items_history`
--
ALTER TABLE `mdl_grade_items_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_letters`
--
ALTER TABLE `mdl_grade_letters`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_outcomes`
--
ALTER TABLE `mdl_grade_outcomes`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_outcomes_courses`
--
ALTER TABLE `mdl_grade_outcomes_courses`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_outcomes_history`
--
ALTER TABLE `mdl_grade_outcomes_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grade_settings`
--
ALTER TABLE `mdl_grade_settings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grading_areas`
--
ALTER TABLE `mdl_grading_areas`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grading_definitions`
--
ALTER TABLE `mdl_grading_definitions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_grading_instances`
--
ALTER TABLE `mdl_grading_instances`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_gradingform_guide_comments`
--
ALTER TABLE `mdl_gradingform_guide_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_gradingform_guide_criteria`
--
ALTER TABLE `mdl_gradingform_guide_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_gradingform_guide_fillings`
--
ALTER TABLE `mdl_gradingform_guide_fillings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_gradingform_rubric_criteria`
--
ALTER TABLE `mdl_gradingform_rubric_criteria`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_gradingform_rubric_fillings`
--
ALTER TABLE `mdl_gradingform_rubric_fillings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_gradingform_rubric_levels`
--
ALTER TABLE `mdl_gradingform_rubric_levels`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_groupings`
--
ALTER TABLE `mdl_groupings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_groupings_groups`
--
ALTER TABLE `mdl_groupings_groups`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_groups`
--
ALTER TABLE `mdl_groups`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_groups_members`
--
ALTER TABLE `mdl_groups_members`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_imscp`
--
ALTER TABLE `mdl_imscp`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_label`
--
ALTER TABLE `mdl_label`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lesson`
--
ALTER TABLE `mdl_lesson`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lesson_answers`
--
ALTER TABLE `mdl_lesson_answers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lesson_attempts`
--
ALTER TABLE `mdl_lesson_attempts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lesson_branch`
--
ALTER TABLE `mdl_lesson_branch`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lesson_grades`
--
ALTER TABLE `mdl_lesson_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lesson_high_scores`
--
ALTER TABLE `mdl_lesson_high_scores`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lesson_pages`
--
ALTER TABLE `mdl_lesson_pages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lesson_timer`
--
ALTER TABLE `mdl_lesson_timer`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_license`
--
ALTER TABLE `mdl_license`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `mdl_log`
--
ALTER TABLE `mdl_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT de la tabla `mdl_log_display`
--
ALTER TABLE `mdl_log_display`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;
--
-- AUTO_INCREMENT de la tabla `mdl_log_queries`
--
ALTER TABLE `mdl_log_queries`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lti`
--
ALTER TABLE `mdl_lti`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lti_submission`
--
ALTER TABLE `mdl_lti_submission`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lti_types`
--
ALTER TABLE `mdl_lti_types`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_lti_types_config`
--
ALTER TABLE `mdl_lti_types_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_message`
--
ALTER TABLE `mdl_message`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_message_contacts`
--
ALTER TABLE `mdl_message_contacts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_message_processors`
--
ALTER TABLE `mdl_message_processors`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `mdl_message_providers`
--
ALTER TABLE `mdl_message_providers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `mdl_message_read`
--
ALTER TABLE `mdl_message_read`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_message_working`
--
ALTER TABLE `mdl_message_working`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_application`
--
ALTER TABLE `mdl_mnet_application`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_host`
--
ALTER TABLE `mdl_mnet_host`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_host2service`
--
ALTER TABLE `mdl_mnet_host2service`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_log`
--
ALTER TABLE `mdl_mnet_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_remote_rpc`
--
ALTER TABLE `mdl_mnet_remote_rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_remote_service2rpc`
--
ALTER TABLE `mdl_mnet_remote_service2rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_rpc`
--
ALTER TABLE `mdl_mnet_rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_service`
--
ALTER TABLE `mdl_mnet_service`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_service2rpc`
--
ALTER TABLE `mdl_mnet_service2rpc`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_session`
--
ALTER TABLE `mdl_mnet_session`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_mnet_sso_access_control`
--
ALTER TABLE `mdl_mnet_sso_access_control`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_mnetservice_enrol_courses`
--
ALTER TABLE `mdl_mnetservice_enrol_courses`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_mnetservice_enrol_enrolments`
--
ALTER TABLE `mdl_mnetservice_enrol_enrolments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_modules`
--
ALTER TABLE `mdl_modules`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `mdl_my_pages`
--
ALTER TABLE `mdl_my_pages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mdl_page`
--
ALTER TABLE `mdl_page`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_portfolio_instance`
--
ALTER TABLE `mdl_portfolio_instance`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_portfolio_instance_config`
--
ALTER TABLE `mdl_portfolio_instance_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_portfolio_instance_user`
--
ALTER TABLE `mdl_portfolio_instance_user`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_portfolio_log`
--
ALTER TABLE `mdl_portfolio_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_portfolio_mahara_queue`
--
ALTER TABLE `mdl_portfolio_mahara_queue`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_portfolio_tempdata`
--
ALTER TABLE `mdl_portfolio_tempdata`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_post`
--
ALTER TABLE `mdl_post`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_profiling`
--
ALTER TABLE `mdl_profiling`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_qtype_essay_options`
--
ALTER TABLE `mdl_qtype_essay_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_qtype_match_options`
--
ALTER TABLE `mdl_qtype_match_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_qtype_match_subquestions`
--
ALTER TABLE `mdl_qtype_match_subquestions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_qtype_multichoice_options`
--
ALTER TABLE `mdl_qtype_multichoice_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_qtype_randomsamatch_options`
--
ALTER TABLE `mdl_qtype_randomsamatch_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_qtype_shortanswer_options`
--
ALTER TABLE `mdl_qtype_shortanswer_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question`
--
ALTER TABLE `mdl_question`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_answers`
--
ALTER TABLE `mdl_question_answers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_attempt_step_data`
--
ALTER TABLE `mdl_question_attempt_step_data`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_attempt_steps`
--
ALTER TABLE `mdl_question_attempt_steps`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_attempts`
--
ALTER TABLE `mdl_question_attempts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_calculated`
--
ALTER TABLE `mdl_question_calculated`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_calculated_options`
--
ALTER TABLE `mdl_question_calculated_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_categories`
--
ALTER TABLE `mdl_question_categories`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_dataset_definitions`
--
ALTER TABLE `mdl_question_dataset_definitions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_dataset_items`
--
ALTER TABLE `mdl_question_dataset_items`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_datasets`
--
ALTER TABLE `mdl_question_datasets`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_hints`
--
ALTER TABLE `mdl_question_hints`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_multianswer`
--
ALTER TABLE `mdl_question_multianswer`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_numerical`
--
ALTER TABLE `mdl_question_numerical`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_numerical_options`
--
ALTER TABLE `mdl_question_numerical_options`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_numerical_units`
--
ALTER TABLE `mdl_question_numerical_units`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_response_analysis`
--
ALTER TABLE `mdl_question_response_analysis`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_sessions`
--
ALTER TABLE `mdl_question_sessions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_states`
--
ALTER TABLE `mdl_question_states`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_statistics`
--
ALTER TABLE `mdl_question_statistics`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_truefalse`
--
ALTER TABLE `mdl_question_truefalse`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_question_usages`
--
ALTER TABLE `mdl_question_usages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_quiz`
--
ALTER TABLE `mdl_quiz`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_quiz_attempts`
--
ALTER TABLE `mdl_quiz_attempts`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_quiz_feedback`
--
ALTER TABLE `mdl_quiz_feedback`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_quiz_grades`
--
ALTER TABLE `mdl_quiz_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_quiz_overrides`
--
ALTER TABLE `mdl_quiz_overrides`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_quiz_overview_regrades`
--
ALTER TABLE `mdl_quiz_overview_regrades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_quiz_question_instances`
--
ALTER TABLE `mdl_quiz_question_instances`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_quiz_reports`
--
ALTER TABLE `mdl_quiz_reports`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `mdl_quiz_statistics`
--
ALTER TABLE `mdl_quiz_statistics`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_rating`
--
ALTER TABLE `mdl_rating`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_registration_hubs`
--
ALTER TABLE `mdl_registration_hubs`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_repository`
--
ALTER TABLE `mdl_repository`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `mdl_repository_instance_config`
--
ALTER TABLE `mdl_repository_instance_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_repository_instances`
--
ALTER TABLE `mdl_repository_instances`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `mdl_resource`
--
ALTER TABLE `mdl_resource`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_resource_old`
--
ALTER TABLE `mdl_resource_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_role`
--
ALTER TABLE `mdl_role`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `mdl_role_allow_assign`
--
ALTER TABLE `mdl_role_allow_assign`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `mdl_role_allow_override`
--
ALTER TABLE `mdl_role_allow_override`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `mdl_role_allow_switch`
--
ALTER TABLE `mdl_role_allow_switch`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `mdl_role_assignments`
--
ALTER TABLE `mdl_role_assignments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_role_capabilities`
--
ALTER TABLE `mdl_role_capabilities`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1120;
--
-- AUTO_INCREMENT de la tabla `mdl_role_context_levels`
--
ALTER TABLE `mdl_role_context_levels`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `mdl_role_names`
--
ALTER TABLE `mdl_role_names`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_role_sortorder`
--
ALTER TABLE `mdl_role_sortorder`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scale`
--
ALTER TABLE `mdl_scale`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scale_history`
--
ALTER TABLE `mdl_scale_history`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm`
--
ALTER TABLE `mdl_scorm`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm_aicc_session`
--
ALTER TABLE `mdl_scorm_aicc_session`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm_scoes`
--
ALTER TABLE `mdl_scorm_scoes`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm_scoes_data`
--
ALTER TABLE `mdl_scorm_scoes_data`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm_scoes_track`
--
ALTER TABLE `mdl_scorm_scoes_track`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm_seq_mapinfo`
--
ALTER TABLE `mdl_scorm_seq_mapinfo`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm_seq_objective`
--
ALTER TABLE `mdl_scorm_seq_objective`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm_seq_rolluprule`
--
ALTER TABLE `mdl_scorm_seq_rolluprule`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm_seq_rolluprulecond`
--
ALTER TABLE `mdl_scorm_seq_rolluprulecond`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm_seq_rulecond`
--
ALTER TABLE `mdl_scorm_seq_rulecond`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_scorm_seq_ruleconds`
--
ALTER TABLE `mdl_scorm_seq_ruleconds`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_sessions`
--
ALTER TABLE `mdl_sessions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `mdl_stats_daily`
--
ALTER TABLE `mdl_stats_daily`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_stats_monthly`
--
ALTER TABLE `mdl_stats_monthly`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_stats_user_daily`
--
ALTER TABLE `mdl_stats_user_daily`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_stats_user_monthly`
--
ALTER TABLE `mdl_stats_user_monthly`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_stats_user_weekly`
--
ALTER TABLE `mdl_stats_user_weekly`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_stats_weekly`
--
ALTER TABLE `mdl_stats_weekly`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_survey`
--
ALTER TABLE `mdl_survey`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `mdl_survey_analysis`
--
ALTER TABLE `mdl_survey_analysis`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_survey_answers`
--
ALTER TABLE `mdl_survey_answers`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_survey_questions`
--
ALTER TABLE `mdl_survey_questions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT de la tabla `mdl_tag`
--
ALTER TABLE `mdl_tag`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_tag_correlation`
--
ALTER TABLE `mdl_tag_correlation`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_tag_instance`
--
ALTER TABLE `mdl_tag_instance`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_timezone`
--
ALTER TABLE `mdl_timezone`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_tool_customlang`
--
ALTER TABLE `mdl_tool_customlang`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_tool_customlang_components`
--
ALTER TABLE `mdl_tool_customlang_components`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_upgrade_log`
--
ALTER TABLE `mdl_upgrade_log`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=966;
--
-- AUTO_INCREMENT de la tabla `mdl_url`
--
ALTER TABLE `mdl_url`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_user`
--
ALTER TABLE `mdl_user`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `mdl_user_devices`
--
ALTER TABLE `mdl_user_devices`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_user_enrolments`
--
ALTER TABLE `mdl_user_enrolments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_user_info_category`
--
ALTER TABLE `mdl_user_info_category`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_user_info_data`
--
ALTER TABLE `mdl_user_info_data`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_user_info_field`
--
ALTER TABLE `mdl_user_info_field`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_user_lastaccess`
--
ALTER TABLE `mdl_user_lastaccess`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_user_password_resets`
--
ALTER TABLE `mdl_user_password_resets`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_user_preferences`
--
ALTER TABLE `mdl_user_preferences`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `mdl_user_private_key`
--
ALTER TABLE `mdl_user_private_key`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_webdav_locks`
--
ALTER TABLE `mdl_webdav_locks`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_wiki`
--
ALTER TABLE `mdl_wiki`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_wiki_links`
--
ALTER TABLE `mdl_wiki_links`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_wiki_locks`
--
ALTER TABLE `mdl_wiki_locks`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_wiki_pages`
--
ALTER TABLE `mdl_wiki_pages`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_wiki_subwikis`
--
ALTER TABLE `mdl_wiki_subwikis`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_wiki_synonyms`
--
ALTER TABLE `mdl_wiki_synonyms`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_wiki_versions`
--
ALTER TABLE `mdl_wiki_versions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop`
--
ALTER TABLE `mdl_workshop`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_aggregations`
--
ALTER TABLE `mdl_workshop_aggregations`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_assessments`
--
ALTER TABLE `mdl_workshop_assessments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_assessments_old`
--
ALTER TABLE `mdl_workshop_assessments_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_comments_old`
--
ALTER TABLE `mdl_workshop_comments_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_elements_old`
--
ALTER TABLE `mdl_workshop_elements_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_grades`
--
ALTER TABLE `mdl_workshop_grades`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_grades_old`
--
ALTER TABLE `mdl_workshop_grades_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_old`
--
ALTER TABLE `mdl_workshop_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_rubrics_old`
--
ALTER TABLE `mdl_workshop_rubrics_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_stockcomments_old`
--
ALTER TABLE `mdl_workshop_stockcomments_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_submissions`
--
ALTER TABLE `mdl_workshop_submissions`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshop_submissions_old`
--
ALTER TABLE `mdl_workshop_submissions_old`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshopallocation_scheduled`
--
ALTER TABLE `mdl_workshopallocation_scheduled`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshopeval_best_settings`
--
ALTER TABLE `mdl_workshopeval_best_settings`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshopform_accumulative`
--
ALTER TABLE `mdl_workshopform_accumulative`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshopform_comments`
--
ALTER TABLE `mdl_workshopform_comments`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshopform_numerrors`
--
ALTER TABLE `mdl_workshopform_numerrors`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshopform_numerrors_map`
--
ALTER TABLE `mdl_workshopform_numerrors_map`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshopform_rubric`
--
ALTER TABLE `mdl_workshopform_rubric`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshopform_rubric_config`
--
ALTER TABLE `mdl_workshopform_rubric_config`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mdl_workshopform_rubric_levels`
--
ALTER TABLE `mdl_workshopform_rubric_levels`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"moodle","table":"mdl_sessions"},{"db":"moodle","table":"mdl_external_services_users"},{"db":"moodle","table":"mdl_external_tokens"},{"db":"moodle","table":"mdl_user"},{"db":"moodle","table":"mdl_user_info_data"},{"db":"moodle","table":"mdl_user_lastaccess"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-06-12 20:48:18', '{"lang":"es","collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
