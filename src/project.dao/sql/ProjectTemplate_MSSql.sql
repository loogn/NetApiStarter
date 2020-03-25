/*
 Navicat Premium Data Transfer

 Source Server         : 110sqlserver
 Source Server Type    : SQL Server
 Source Server Version : 10501600
 Source Host           : 192.168.1.110:1433
 Source Catalog        : ProjectTemplate
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 10501600
 File Encoding         : 65001

 Date: 07/08/2019 09:25:18
*/


-- ----------------------------
-- Table structure for Ad
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Ad]') AND type IN ('U'))
	DROP TABLE [dbo].[Ad]
GO

CREATE TABLE [dbo].[Ad] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [Title] varchar(200) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [AdTypeId] bigint DEFAULT ((0)) NOT NULL,
  [ImageUrl] varchar(200) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [LinkUrl] varchar(200) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Status] int DEFAULT ((0)) NOT NULL,
  [BeginTime] datetime DEFAULT (getdate()) NOT NULL,
  [EndTime] datetime DEFAULT (getdate()) NOT NULL,
  [ObjectType] int DEFAULT ((0)) NOT NULL,
  [ObjectId] varchar(200) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [OrderNum] int DEFAULT ((0)) NOT NULL,
  [AddTime] datetime DEFAULT (getdate()) NOT NULL
)
GO

ALTER TABLE [dbo].[Ad] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标题',
'SCHEMA', N'dbo',
'TABLE', N'Ad',
'COLUMN', N'Title'
GO

EXEC sp_addextendedproperty
'MS_Description', N'广告位编号',
'SCHEMA', N'dbo',
'TABLE', N'Ad',
'COLUMN', N'AdTypeId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片地址',
'SCHEMA', N'dbo',
'TABLE', N'Ad',
'COLUMN', N'ImageUrl'
GO

EXEC sp_addextendedproperty
'MS_Description', N'链接地址',
'SCHEMA', N'dbo',
'TABLE', N'Ad',
'COLUMN', N'LinkUrl'
GO

EXEC sp_addextendedproperty
'MS_Description', N'1正常，2禁用',
'SCHEMA', N'dbo',
'TABLE', N'Ad',
'COLUMN', N'Status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'对象类型 1商品,2品牌，3分类',
'SCHEMA', N'dbo',
'TABLE', N'Ad',
'COLUMN', N'ObjectType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'对象编号',
'SCHEMA', N'dbo',
'TABLE', N'Ad',
'COLUMN', N'ObjectId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序号',
'SCHEMA', N'dbo',
'TABLE', N'Ad',
'COLUMN', N'OrderNum'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'Ad',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'广告',
'SCHEMA', N'dbo',
'TABLE', N'Ad'
GO


-- ----------------------------
-- Records of Ad
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[Ad] ON
GO

INSERT INTO [dbo].[Ad] ([Id], [Title], [AdTypeId], [ImageUrl], [LinkUrl], [Status], [BeginTime], [EndTime], [ObjectType], [ObjectId], [OrderNum], [AddTime]) VALUES (N'3', N'sdfvv', N'1', N'/sf/20190715/20190715113050_4PSUTR.png', N'', N'1', N'2019-07-15 00:00:00.000', N'2020-07-15 00:00:00.000', N'0', N'', N'0', N'2019-07-15 11:30:51.296')
GO

INSERT INTO [dbo].[Ad] ([Id], [Title], [AdTypeId], [ImageUrl], [LinkUrl], [Status], [BeginTime], [EndTime], [ObjectType], [ObjectId], [OrderNum], [AddTime]) VALUES (N'4', N'首页广告', N'1', N'/sf/20190715/20190715113427_czWbPw.png', N'http://www.baidu.com', N'1', N'2019-07-15 00:00:00.000', N'2020-07-15 00:00:00.000', N'0', N'', N'0', N'2019-07-15 11:34:28.800')
GO

SET IDENTITY_INSERT [dbo].[Ad] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for AppVersion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[AppVersion]') AND type IN ('U'))
	DROP TABLE [dbo].[AppVersion]
GO

CREATE TABLE [dbo].[AppVersion] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [Version] int DEFAULT ((0)) NOT NULL,
  [Download] varchar(500) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [ForceUpdate] bit DEFAULT ((0)) NOT NULL,
  [AddTime] datetime DEFAULT (getdate()) NOT NULL
)
GO

ALTER TABLE [dbo].[AppVersion] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'版本号',
'SCHEMA', N'dbo',
'TABLE', N'AppVersion',
'COLUMN', N'Version'
GO

EXEC sp_addextendedproperty
'MS_Description', N'下载地址',
'SCHEMA', N'dbo',
'TABLE', N'AppVersion',
'COLUMN', N'Download'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是强制更新',
'SCHEMA', N'dbo',
'TABLE', N'AppVersion',
'COLUMN', N'ForceUpdate'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'AppVersion',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'APP版本',
'SCHEMA', N'dbo',
'TABLE', N'AppVersion'
GO


-- ----------------------------
-- Table structure for CountLimit
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[CountLimit]') AND type IN ('U'))
	DROP TABLE [dbo].[CountLimit]
GO

CREATE TABLE [dbo].[CountLimit] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [UniqueId] varchar(100) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [AlreadyCount] int DEFAULT ((0)) NOT NULL,
  [BeginTime] datetime DEFAULT (getdate()) NOT NULL
)
GO

ALTER TABLE [dbo].[CountLimit] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'唯一标识',
'SCHEMA', N'dbo',
'TABLE', N'CountLimit',
'COLUMN', N'UniqueId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'已有计数',
'SCHEMA', N'dbo',
'TABLE', N'CountLimit',
'COLUMN', N'AlreadyCount'
GO

EXEC sp_addextendedproperty
'MS_Description', N'开始计数时间',
'SCHEMA', N'dbo',
'TABLE', N'CountLimit',
'COLUMN', N'BeginTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'计数限制',
'SCHEMA', N'dbo',
'TABLE', N'CountLimit'
GO


-- ----------------------------
-- Table structure for DataDict
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DataDict]') AND type IN ('U'))
	DROP TABLE [dbo].[DataDict]
GO

CREATE TABLE [dbo].[DataDict] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [DictId] int  NOT NULL,
  [DictType] int  NOT NULL,
  [Name] varchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OrderNum] int  NOT NULL,
  [AddTime] datetime DEFAULT (getdate()) NOT NULL,
  [ParentId] bigint  NOT NULL,
  [Remark] varchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[DataDict] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典编号',
'SCHEMA', N'dbo',
'TABLE', N'DataDict',
'COLUMN', N'DictId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典类型1-广告位，2-新闻内容',
'SCHEMA', N'dbo',
'TABLE', N'DataDict',
'COLUMN', N'DictType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'字典名称',
'SCHEMA', N'dbo',
'TABLE', N'DataDict',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序号',
'SCHEMA', N'dbo',
'TABLE', N'DataDict',
'COLUMN', N'OrderNum'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'DataDict',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'DataDict',
'COLUMN', N'Remark'
GO


-- ----------------------------
-- Records of DataDict
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[DataDict] ON
GO

INSERT INTO [dbo].[DataDict] ([Id], [DictId], [DictType], [Name], [OrderNum], [AddTime], [ParentId], [Remark]) VALUES (N'1', N'1', N'1', N'首页广告', N'0', N'2019-07-25 14:01:33.900', N'0', N'sd')
GO

SET IDENTITY_INSERT [dbo].[DataDict] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for Feedback
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Feedback]') AND type IN ('U'))
	DROP TABLE [dbo].[Feedback]
GO

CREATE TABLE [dbo].[Feedback] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [UserId] bigint DEFAULT ((0)) NOT NULL,
  [Content] nvarchar(max) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [AddTime] datetime DEFAULT (getdate()) NOT NULL
)
GO

ALTER TABLE [dbo].[Feedback] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户ID',
'SCHEMA', N'dbo',
'TABLE', N'Feedback',
'COLUMN', N'UserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'反馈内容',
'SCHEMA', N'dbo',
'TABLE', N'Feedback',
'COLUMN', N'Content'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'Feedback',
'COLUMN', N'AddTime'
GO


-- ----------------------------
-- Table structure for Region
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Region]') AND type IN ('U'))
	DROP TABLE [dbo].[Region]
GO

CREATE TABLE [dbo].[Region] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [Code] int DEFAULT ((0)) NOT NULL,
  [Level] int DEFAULT ((0)) NOT NULL,
  [PostCode] varchar(10) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Name] varchar(100) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Pinyin] varchar(100) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL
)
GO

ALTER TABLE [dbo].[Region] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'地区编码',
'SCHEMA', N'dbo',
'TABLE', N'Region',
'COLUMN', N'Code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'级别',
'SCHEMA', N'dbo',
'TABLE', N'Region',
'COLUMN', N'Level'
GO

EXEC sp_addextendedproperty
'MS_Description', N'邮编',
'SCHEMA', N'dbo',
'TABLE', N'Region',
'COLUMN', N'PostCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地区名称',
'SCHEMA', N'dbo',
'TABLE', N'Region',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'拼音',
'SCHEMA', N'dbo',
'TABLE', N'Region',
'COLUMN', N'Pinyin'
GO

EXEC sp_addextendedproperty
'MS_Description', N'地区',
'SCHEMA', N'dbo',
'TABLE', N'Region'
GO


-- ----------------------------
-- Records of Region
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[Region] ON
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1', N'110000', N'1', N'100000', N'北京市', N'BEI3 JING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2', N'110100', N'2', N'100000', N'北京市', N'BEI3 JING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3', N'110101', N'3', N'100010', N'东城区', N'DONG1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'4', N'110102', N'3', N'100032', N'西城区', N'XI1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'5', N'110105', N'3', N'100020', N'朝阳区', N'CHAO2 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'6', N'110106', N'3', N'100071', N'丰台区', N'FENG1 TAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'7', N'110107', N'3', N'100043', N'石景山区', N'SHI2 JING3 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'8', N'110108', N'3', N'100089', N'海淀区', N'HAI3 DIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'9', N'110109', N'3', N'102300', N'门头沟区', N'MEN2 TOU2 GOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'10', N'110111', N'3', N'102488', N'房山区', N'FANG2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'11', N'110112', N'3', N'101100', N'通州区', N'TONG1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'12', N'110113', N'3', N'101300', N'顺义区', N'SHUN4 YI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'13', N'110114', N'3', N'102200', N'昌平区', N'CHANG1 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'14', N'110115', N'3', N'102600', N'大兴区', N'DA4 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'15', N'110116', N'3', N'101400', N'怀柔区', N'HUAI2 ROU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'16', N'110117', N'3', N'101200', N'平谷区', N'PING2 GU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'17', N'110118', N'3', N'101500', N'密云区', N'MI4 YUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'18', N'110119', N'3', N'102100', N'延庆区', N'YAN2 QING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'19', N'120000', N'1', N'300000', N'天津市', N'TIAN1 JIN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'20', N'120100', N'2', N'300000', N'天津市', N'TIAN1 JIN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'21', N'120101', N'3', N'300041', N'和平区', N'HE2 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'22', N'120102', N'3', N'300171', N'河东区', N'HE2 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'23', N'120103', N'3', N'572000', N'河西区', N'HE2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'24', N'120104', N'3', N'300100', N'南开区', N'NAN2 KAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'25', N'120105', N'3', N'300143', N'河北区', N'HE2 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'26', N'120106', N'3', N'300131', N'红桥区', N'GONG1 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'27', N'120110', N'3', N'300300', N'东丽区', N'DONG1 LI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'28', N'120111', N'3', N'300380', N'西青区', N'XI1 QING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'29', N'120112', N'3', N'300350', N'津南区', N'JIN1 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'30', N'120113', N'3', N'300400', N'北辰区', N'BEI3 CHEN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'31', N'120114', N'3', N'301700', N'武清区', N'WU3 QING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'32', N'120115', N'3', N'301800', N'宝坻区', N'BAO3 CHI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'33', N'120116', N'3', N'300457', N'滨海新区', N'BIN1 HAI3 XIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'34', N'120117', N'3', N'300000', N'宁河区', N'NING2 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'35', N'120118', N'3', N'301600', N'静海区', N'JING4 HAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'36', N'120119', N'3', N'301900', N'蓟州区', N'JI4 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'37', N'130000', N'1', N'0', N'河北省', N'HE2 BEI3 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'38', N'130100', N'2', N'50000', N'石家庄市', N'SHI2 GU1 ZHUANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'39', N'130102', N'3', N'50011', N'长安区', N'CHANG2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'40', N'130104', N'3', N'50051', N'桥西区', N'QIAO2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'41', N'130105', N'3', N'50051', N'新华区', N'XIN1 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'42', N'130107', N'3', N'50100', N'井陉矿区', N'JING3 JING4 KUANG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'43', N'130108', N'3', N'50081', N'裕华区', N'YU4 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'44', N'130109', N'3', N'52160', N'藁城区', N'GAO3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'45', N'130110', N'3', N'50200', N'鹿泉区', N'LU4 QUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'46', N'130111', N'3', N'51430', N'栾城区', N'LUAN2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'47', N'130121', N'3', N'50000', N'井陉县', N'JING3 JING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'48', N'130123', N'3', N'50800', N'正定县', N'ZHENG1 DING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'49', N'130125', N'3', N'50600', N'行唐县', N'HANG2 TANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'50', N'130126', N'3', N'50500', N'灵寿县', N'LING2 SHOU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'51', N'130127', N'3', N'51330', N'高邑县', N'GAO1 YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'52', N'130128', N'3', N'52560', N'深泽县', N'SHEN1 ZE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'53', N'130129', N'3', N'51230', N'赞皇县', N'ZAN4 HUANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'54', N'130130', N'3', N'52400', N'无极县', N'MO2 JI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'55', N'130131', N'3', N'50400', N'平山县', N'PING2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'56', N'130132', N'3', N'51130', N'元氏县', N'YUAN2 SHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'57', N'130133', N'3', N'51530', N'赵县', N'ZHAO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'58', N'130181', N'3', N'53800', N'辛集市', N'XIN1 JI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'59', N'130183', N'3', N'52200', N'晋州市', N'JIN4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'60', N'130184', N'3', N'50700', N'新乐市', N'XIN1 LE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'61', N'130200', N'2', N'63000', N'唐山市', N'TANG2 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'62', N'130202', N'3', N'63017', N'路南区', N'LU4 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'63', N'130203', N'3', N'63015', N'路北区', N'LU4 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'64', N'130204', N'3', N'63104', N'古冶区', N'GU3 YE3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'65', N'130205', N'3', N'63021', N'开平区', N'KAI1 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'66', N'130207', N'3', N'63300', N'丰南区', N'FENG1 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'67', N'130208', N'3', N'64000', N'丰润区', N'FENG1 RUN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'68', N'130209', N'3', N'64000', N'曹妃甸区', N'CAO2 FEI1 DIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'69', N'130223', N'3', N'63700', N'滦县', N'LUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'70', N'130224', N'3', N'63500', N'滦南县', N'LUAN2 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'71', N'130225', N'3', N'63600', N'乐亭县', N'LE4 TING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'72', N'130227', N'3', N'64300', N'迁西县', N'QIAN1 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'73', N'130229', N'3', N'64100', N'玉田县', N'YU4 TIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'74', N'130281', N'3', N'64200', N'遵化市', N'ZUN1 HUA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'75', N'130283', N'3', N'64400', N'迁安市', N'QIAN1 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'76', N'130300', N'2', N'66000', N'秦皇岛市', N'QIN2 HUANG2 DAO3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'77', N'130302', N'3', N'66000', N'海港区', N'HAI3 GANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'78', N'130303', N'3', N'66200', N'山海关区', N'SHAN1 HAI3 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'79', N'130304', N'3', N'66100', N'北戴河区', N'BEI3 DAI4 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'80', N'130306', N'3', N'66300', N'抚宁区', N'FU3 NING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'81', N'130321', N'3', N'66500', N'青龙满族自治县', N'QING1 LONG2 MAN3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'82', N'130322', N'3', N'66600', N'昌黎县', N'CHANG1 LI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'83', N'130324', N'3', N'66400', N'卢龙县', N'LU2 LONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'84', N'130400', N'2', N'56000', N'邯郸市', N'HAN2 DAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'85', N'130402', N'3', N'56001', N'邯山区', N'HAN2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'86', N'130403', N'3', N'56004', N'丛台区', N'CONG2 TAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'87', N'130404', N'3', N'56003', N'复兴区', N'FU4 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'88', N'130406', N'3', N'56200', N'峰峰矿区', N'FENG1 FENG1 KUANG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'89', N'130407', N'3', N'57550', N'肥乡区', N'FEI2 XIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'90', N'130408', N'3', N'57151', N'永年区', N'YONG3 NIAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'91', N'130423', N'3', N'56600', N'临漳县', N'LIN2 ZHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'92', N'130424', N'3', N'56700', N'成安县', N'CHENG2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'93', N'130425', N'3', N'56900', N'大名县', N'DA4 MING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'94', N'130426', N'3', N'56400', N'涉县', N'SHE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'95', N'130427', N'3', N'56500', N'磁县', N'CI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'96', N'130430', N'3', N'57450', N'邱县', N'QIU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'97', N'130431', N'3', N'57350', N'鸡泽县', N'JI1 ZE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'98', N'130432', N'3', N'57650', N'广平县', N'GUANG3 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'99', N'130433', N'3', N'57750', N'馆陶县', N'GUAN3 TAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'100', N'130434', N'3', N'56800', N'魏县', N'WEI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'101', N'130435', N'3', N'57250', N'曲周县', N'QU1 ZHOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'102', N'130481', N'3', N'56300', N'武安市', N'WU3 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'103', N'130500', N'2', N'54000', N'邢台市', N'GENG3 TAI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'104', N'130502', N'3', N'54001', N'桥东区', N'QIAO2 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'105', N'130503', N'3', N'54000', N'桥西区', N'QIAO2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'106', N'130521', N'3', N'54001', N'邢台县', N'GENG3 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'107', N'130522', N'3', N'54300', N'临城县', N'LIN2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'108', N'130523', N'3', N'54200', N'内丘县', N'NEI4 QIU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'109', N'130524', N'3', N'55450', N'柏乡县', N'BAI3 XIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'110', N'130525', N'3', N'55350', N'隆尧县', N'LONG1 YAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'111', N'130526', N'3', N'55150', N'任县', N'REN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'112', N'130527', N'3', N'54400', N'南和县', N'NAN2 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'113', N'130528', N'3', N'55550', N'宁晋县', N'NING2 JIN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'114', N'130529', N'3', N'55250', N'巨鹿县', N'JU4 LU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'115', N'130530', N'3', N'51730', N'新河县', N'XIN1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'116', N'130531', N'3', N'54600', N'广宗县', N'GUANG3 ZONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'117', N'130532', N'3', N'54500', N'平乡县', N'PING2 XIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'118', N'130533', N'3', N'54700', N'威县', N'WEI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'119', N'130534', N'3', N'54800', N'清河县', N'QING1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'120', N'130535', N'3', N'54900', N'临西县', N'LIN2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'121', N'130581', N'3', N'55750', N'南宫市', N'NAN2 GONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'122', N'130582', N'3', N'54100', N'沙河市', N'SHA1 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'123', N'130600', N'2', N'71000', N'保定市', N'BAO3 DING4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'124', N'130602', N'3', N'71052', N'竞秀区', N'JING4 XIU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'125', N'130606', N'3', N'71000', N'莲池区', N'LIAN2 CHI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'126', N'130607', N'3', N'71000', N'满城区', N'MAN3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'127', N'130608', N'3', N'72150', N'清苑区', N'QING1 YUAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'128', N'130609', N'3', N'71100', N'徐水区', N'XU2 SHUI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'129', N'130623', N'3', N'74100', N'涞水县', N'LAI2 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'130', N'130624', N'3', N'73200', N'阜平县', N'FU4 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'131', N'130626', N'3', N'72650', N'定兴县', N'DING4 XING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'132', N'130627', N'3', N'72350', N'唐县', N'TANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'133', N'130628', N'3', N'71500', N'高阳县', N'GAO1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'134', N'130629', N'3', N'71700', N'容城县', N'RONG2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'135', N'130630', N'3', N'74300', N'涞源县', N'LAI2 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'136', N'130631', N'3', N'72450', N'望都县', N'WANG4 DOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'137', N'130632', N'3', N'71600', N'安新县', N'AN1 XIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'138', N'130633', N'3', N'74200', N'易县', N'YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'139', N'130634', N'3', N'73100', N'曲阳县', N'QU1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'140', N'130635', N'3', N'71400', N'蠡县', N'LI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'141', N'130636', N'3', N'72250', N'顺平县', N'SHUN4 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'142', N'130637', N'3', N'71300', N'博野县', N'BO2 YE3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'143', N'130638', N'3', N'71800', N'雄县', N'XIONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'144', N'130681', N'3', N'72750', N'涿州市', N'ZHUO1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'145', N'130682', N'3', N'53800', N'定州市', N'DING4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'146', N'130683', N'3', N'71200', N'安国市', N'AN1 GUO2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'147', N'130684', N'3', N'74000', N'高碑店市', N'GAO1 BEI1 DIAN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'148', N'130700', N'2', N'75000', N'张家口市', N'ZHANG1 GU1 KOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'149', N'130702', N'3', N'75000', N'桥东区', N'QIAO2 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'150', N'130703', N'3', N'75061', N'桥西区', N'QIAO2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'151', N'130705', N'3', N'75100', N'宣化区', N'XUAN1 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'152', N'130706', N'3', N'75300', N'下花园区', N'XIA4 HUA1 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'153', N'130708', N'3', N'75100', N'万全区', N'MO4 QUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'154', N'130709', N'3', N'75100', N'崇礼区', N'CHONG2 LI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'155', N'130722', N'3', N'76450', N'张北县', N'ZHANG1 BEI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'156', N'130723', N'3', N'76650', N'康保县', N'KANG1 BAO3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'157', N'130724', N'3', N'76550', N'沽源县', N'GU1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'158', N'130725', N'3', N'76750', N'尚义县', N'SHANG4 YI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'159', N'130726', N'3', N'75700', N'蔚县', N'WEI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'160', N'130727', N'3', N'75800', N'阳原县', N'YANG2 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'161', N'130728', N'3', N'76150', N'怀安县', N'HUAI2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'162', N'130730', N'3', N'75400', N'怀来县', N'HUAI2 LAI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'163', N'130731', N'3', N'75600', N'涿鹿县', N'ZHUO1 LU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'164', N'130732', N'3', N'75500', N'赤城县', N'CHI4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'165', N'130800', N'2', N'67000', N'承德市', N'CHENG2 DE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'166', N'130802', N'3', N'400900', N'双桥区', N'SHUANG1 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'167', N'130803', N'3', N'67000', N'双滦区', N'SHUANG1 LUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'168', N'130804', N'3', N'67200', N'鹰手营子矿区', N'YING1 SHOU3 YING2 ZI3 KUANG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'169', N'130821', N'3', N'67400', N'承德县', N'CHENG2 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'170', N'130822', N'3', N'67300', N'兴隆县', N'XING1 LONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'171', N'130824', N'3', N'68250', N'滦平县', N'LUAN2 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'172', N'130825', N'3', N'68150', N'隆化县', N'LONG1 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'173', N'130826', N'3', N'68350', N'丰宁满族自治县', N'FENG1 NING2 MAN3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'174', N'130827', N'3', N'67600', N'宽城满族自治县', N'KUAN1 CHENG2 MAN3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'175', N'130828', N'3', N'68450', N'围场满族蒙古族自治县', N'WEI2 CHANG2 MAN3 ZU2 MENG1 GU3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'176', N'130881', N'3', N'67500', N'平泉市', N'PING2 QUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'177', N'130900', N'2', N'61000', N'沧州市', N'CANG1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'178', N'130902', N'3', N'61000', N'新华区', N'XIN1 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'179', N'130903', N'3', N'61000', N'运河区', N'YUN4 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'180', N'130921', N'3', N'61000', N'沧县', N'CANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'181', N'130922', N'3', N'62650', N'青县', N'QING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'182', N'130923', N'3', N'61600', N'东光县', N'DONG1 GUANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'183', N'130924', N'3', N'61200', N'海兴县', N'HAI3 XING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'184', N'130925', N'3', N'61300', N'盐山县', N'YAN2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'185', N'130926', N'3', N'62350', N'肃宁县', N'SU4 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'186', N'130927', N'3', N'61500', N'南皮县', N'NAN2 PI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'187', N'130928', N'3', N'61800', N'吴桥县', N'WU2 QIAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'188', N'130929', N'3', N'62250', N'献县', N'SUO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'189', N'130930', N'3', N'61400', N'孟村回族自治县', N'MENG4 CUN1 HUI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'190', N'130981', N'3', N'62150', N'泊头市', N'BO2 TOU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'191', N'130982', N'3', N'62550', N'任丘市', N'REN2 QIU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'192', N'130983', N'3', N'61100', N'黄骅市', N'HUANG2 HUA2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'193', N'130984', N'3', N'62450', N'河间市', N'HE2 JIAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'194', N'131000', N'2', N'65000', N'廊坊市', N'LANG2 FANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'195', N'131002', N'3', N'65000', N'安次区', N'AN1 CI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'196', N'131003', N'3', N'65000', N'广阳区', N'GUANG3 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'197', N'131022', N'3', N'65500', N'固安县', N'GU4 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'198', N'131023', N'3', N'65600', N'永清县', N'YONG3 QING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'199', N'131024', N'3', N'65400', N'香河县', N'XIANG1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'200', N'131025', N'3', N'65900', N'大城县', N'DA4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'201', N'131026', N'3', N'65800', N'文安县', N'WEN2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'202', N'131028', N'3', N'65300', N'大厂回族自治县', N'DA4 AN1 HUI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'203', N'131081', N'3', N'65700', N'霸州市', N'BA4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'204', N'131082', N'3', N'65200', N'三河市', N'SAN1 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'205', N'131100', N'2', N'53000', N'衡水市', N'HENG2 SHUI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'206', N'131102', N'3', N'53000', N'桃城区', N'TAO2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'207', N'131103', N'3', N'53000', N'冀州区', N'JI4 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'208', N'131121', N'3', N'53100', N'枣强县', N'ZAO3 JIANG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'209', N'131122', N'3', N'53400', N'武邑县', N'WU3 YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'210', N'131123', N'3', N'53300', N'武强县', N'WU3 JIANG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'211', N'131124', N'3', N'53900', N'饶阳县', N'RAO2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'212', N'131125', N'3', N'53600', N'安平县', N'AN1 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'213', N'131126', N'3', N'253800', N'故城县', N'GU4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'214', N'131127', N'3', N'53500', N'景县', N'JING3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'215', N'131128', N'3', N'53700', N'阜城县', N'FU4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'216', N'131182', N'3', N'53800', N'深州市', N'SHEN1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'217', N'140000', N'1', N'0', N'山西省', N'SHAN1 XI1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'218', N'140100', N'2', N'30000', N'太原市', N'TAI4 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'219', N'140105', N'3', N'30032', N'小店区', N'XIAO3 DIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'220', N'140106', N'3', N'30024', N'迎泽区', N'YING2 ZE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'221', N'140107', N'3', N'30001', N'杏花岭区', N'XING4 HUA1 LING3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'222', N'140108', N'3', N'30003', N'尖草坪区', N'JIAN1 CAO3 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'223', N'140109', N'3', N'30027', N'万柏林区', N'MO4 BAI3 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'224', N'140110', N'3', N'30025', N'晋源区', N'JIN4 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'225', N'140121', N'3', N'30400', N'清徐县', N'QING1 XU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'226', N'140122', N'3', N'30100', N'阳曲县', N'YANG2 QU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'227', N'140123', N'3', N'30300', N'娄烦县', N'LOU2 FAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'228', N'140181', N'3', N'30200', N'古交市', N'GU3 JIAO1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'229', N'140200', N'2', N'37000', N'大同市', N'DA4 TONG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'230', N'140202', N'3', N'37008', N'城区', N'CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'231', N'140203', N'3', N'37001', N'矿区', N'KUANG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'232', N'140211', N'3', N'37001', N'南郊区', N'NAN2 JIAO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'233', N'140212', N'3', N'37002', N'新荣区', N'XIN1 RONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'234', N'140221', N'3', N'38100', N'阳高县', N'YANG2 GAO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'235', N'140222', N'3', N'38200', N'天镇县', N'TIAN1 ZHEN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'236', N'140223', N'3', N'37500', N'广灵县', N'GUANG3 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'237', N'140224', N'3', N'34400', N'灵丘县', N'LING2 QIU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'238', N'140225', N'3', N'37400', N'浑源县', N'HUN2 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'239', N'140226', N'3', N'37100', N'左云县', N'ZUO3 YUN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'240', N'140227', N'3', N'37300', N'大同县', N'DA4 TONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'241', N'140300', N'2', N'45000', N'阳泉市', N'YANG2 QUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'242', N'140302', N'3', N'45000', N'城区', N'CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'243', N'140303', N'3', N'45000', N'矿区', N'KUANG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'244', N'140311', N'3', N'45011', N'郊区', N'JIAO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'245', N'140321', N'3', N'45200', N'平定县', N'PING2 DING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'246', N'140322', N'3', N'45100', N'盂县', N'YU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'247', N'140400', N'2', N'46000', N'长治市', N'CHANG2 ZHI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'248', N'140402', N'3', N'46011', N'城区', N'CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'249', N'140411', N'3', N'46011', N'郊区', N'JIAO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'250', N'140421', N'3', N'47100', N'长治县', N'CHANG2 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'251', N'140423', N'3', N'46200', N'襄垣县', N'XIANG1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'252', N'140424', N'3', N'46100', N'屯留县', N'TUN2 LIU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'253', N'140425', N'3', N'47400', N'平顺县', N'PING2 SHUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'254', N'140426', N'3', N'47600', N'黎城县', N'LI2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'255', N'140427', N'3', N'47300', N'壶关县', N'HU2 GUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'256', N'140428', N'3', N'46600', N'长子县', N'CHANG2 ZI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'257', N'140429', N'3', N'46300', N'武乡县', N'WU3 XIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'258', N'140430', N'3', N'46400', N'沁县', N'QIN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'259', N'140431', N'3', N'46500', N'沁源县', N'QIN4 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'260', N'140481', N'3', N'47500', N'潞城市', N'LU4 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'261', N'140500', N'2', N'48000', N'晋城市', N'JIN4 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'262', N'140502', N'3', N'48000', N'城区', N'CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'263', N'140521', N'3', N'48200', N'沁水县', N'QIN4 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'264', N'140522', N'3', N'48100', N'阳城县', N'YANG2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'265', N'140524', N'3', N'48300', N'陵川县', N'LING2 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'266', N'140525', N'3', N'48012', N'泽州县', N'ZE2 ZHOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'267', N'140581', N'3', N'48400', N'高平市', N'GAO1 PING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'268', N'140600', N'2', N'38500', N'朔州市', N'SHUO4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'269', N'140602', N'3', N'38500', N'朔城区', N'SHUO4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'270', N'140603', N'3', N'38600', N'平鲁区', N'PING2 LU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'271', N'140621', N'3', N'36900', N'山阴县', N'SHAN1 YIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'272', N'140622', N'3', N'37600', N'应县', N'YING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'273', N'140623', N'3', N'37200', N'右玉县', N'YOU4 YU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'274', N'140624', N'3', N'38300', N'怀仁县', N'HUAI2 REN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'275', N'140700', N'2', N'38300', N'晋中市', N'JIN4 ZHONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'276', N'140702', N'3', N'30600', N'榆次区', N'YU2 CI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'277', N'140721', N'3', N'31800', N'榆社县', N'YU2 SHE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'278', N'140722', N'3', N'32600', N'左权县', N'ZUO3 QUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'279', N'140723', N'3', N'32700', N'和顺县', N'HE2 SHUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'280', N'140724', N'3', N'45300', N'昔阳县', N'XI1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'281', N'140725', N'3', N'45400', N'寿阳县', N'SHOU4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'282', N'140726', N'3', N'30800', N'太谷县', N'TAI4 GU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'283', N'140727', N'3', N'30900', N'祁县', N'QI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'284', N'140728', N'3', N'31100', N'平遥县', N'PING2 YAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'285', N'140729', N'3', N'31300', N'灵石县', N'LING2 SHI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'286', N'140781', N'3', N'31200', N'介休市', N'JIE4 XIU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'287', N'140800', N'2', N'44000', N'运城市', N'YUN4 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'288', N'140802', N'3', N'44000', N'盐湖区', N'YAN2 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'289', N'140821', N'3', N'44100', N'临猗县', N'LIN2 YI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'290', N'140822', N'3', N'44200', N'万荣县', N'MO4 RONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'291', N'140823', N'3', N'43800', N'闻喜县', N'WEN2 XI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'292', N'140824', N'3', N'43200', N'稷山县', N'JI4 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'293', N'140825', N'3', N'43100', N'新绛县', N'XIN1 JIANG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'294', N'140826', N'3', N'43600', N'绛县', N'JIANG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'295', N'140827', N'3', N'43700', N'垣曲县', N'YUAN2 QU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'296', N'140828', N'3', N'44400', N'夏县', N'XIA4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'297', N'140829', N'3', N'44300', N'平陆县', N'PING2 LIU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'298', N'140830', N'3', N'44600', N'芮城县', N'RUI4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'299', N'140881', N'3', N'44500', N'永济市', N'YONG3 JI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'300', N'140882', N'3', N'43300', N'河津市', N'HE2 JIN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'301', N'140900', N'2', N'34000', N'忻州市', N'XIN1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'302', N'140902', N'3', N'34000', N'忻府区', N'XIN1 FU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'303', N'140921', N'3', N'35400', N'定襄县', N'DING4 XIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'304', N'140922', N'3', N'35500', N'五台县', N'WU3 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'305', N'140923', N'3', N'34200', N'代县', N'DAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'306', N'140924', N'3', N'34300', N'繁峙县', N'FAN2 SHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'307', N'140925', N'3', N'36700', N'宁武县', N'NING2 WU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'308', N'140926', N'3', N'35100', N'静乐县', N'JING4 LE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'309', N'140927', N'3', N'36100', N'神池县', N'SHEN2 CHI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'310', N'140928', N'3', N'36200', N'五寨县', N'WU3 ZHAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'311', N'140929', N'3', N'36300', N'岢岚县', N'KE3 LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'312', N'140930', N'3', N'36500', N'河曲县', N'HE2 QU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'313', N'140931', N'3', N'36600', N'保德县', N'BAO3 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'314', N'140932', N'3', N'36400', N'偏关县', N'PIAN1 GUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'315', N'140981', N'3', N'34100', N'原平市', N'YUAN2 PING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'316', N'141000', N'2', N'41000', N'临汾市', N'LIN2 FEN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'317', N'141002', N'3', N'41000', N'尧都区', N'YAO2 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'318', N'141021', N'3', N'43400', N'曲沃县', N'QU1 WO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'319', N'141022', N'3', N'43500', N'翼城县', N'YI4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'320', N'141023', N'3', N'41500', N'襄汾县', N'XIANG1 FEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'321', N'141024', N'3', N'31600', N'洪洞县', N'HONG2 DONG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'322', N'141025', N'3', N'42400', N'古县', N'GU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'323', N'141026', N'3', N'42500', N'安泽县', N'AN1 ZE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'324', N'141027', N'3', N'42600', N'浮山县', N'FU2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'325', N'141028', N'3', N'42200', N'吉县', N'JI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'326', N'141029', N'3', N'42100', N'乡宁县', N'XIANG1 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'327', N'141030', N'3', N'42300', N'大宁县', N'DA4 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'328', N'141031', N'3', N'41300', N'隰县', N'XI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'329', N'141032', N'3', N'41400', N'永和县', N'YONG3 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'330', N'141033', N'3', N'41200', N'蒲县', N'PU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'331', N'141034', N'3', N'31500', N'汾西县', N'FEN2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'332', N'141081', N'3', N'43007', N'侯马市', N'HOU2 MA3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'333', N'141082', N'3', N'31400', N'霍州市', N'HUO4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'334', N'141100', N'2', N'33000', N'吕梁市', N'LV3 LIANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'335', N'141102', N'3', N'33000', N'离石区', N'LI2 SHI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'336', N'141121', N'3', N'32100', N'文水县', N'WEN2 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'337', N'141122', N'3', N'30500', N'交城县', N'JIAO1 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'338', N'141123', N'3', N'33600', N'兴县', N'XING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'339', N'141124', N'3', N'33200', N'临县', N'LIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'340', N'141125', N'3', N'33300', N'柳林县', N'LIU3 LIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'341', N'141126', N'3', N'32500', N'石楼县', N'SHI2 LOU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'342', N'141127', N'3', N'33500', N'岚县', N'LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'343', N'141128', N'3', N'33100', N'方山县', N'FANG1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'344', N'141129', N'3', N'33400', N'中阳县', N'ZHONG1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'345', N'141130', N'3', N'32400', N'交口县', N'JIAO1 KOU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'346', N'141181', N'3', N'32300', N'孝义市', N'XIAO4 YI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'347', N'141182', N'3', N'32200', N'汾阳市', N'FEN2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'348', N'150000', N'1', N'0', N'内蒙古自治区', N'NEI4 MENG1 GU3 ZI4 ZHI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'349', N'150100', N'2', N'10000', N'呼和浩特市', N'HU1 HE2 HAO4 TE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'350', N'150102', N'3', N'10030', N'新城区', N'XIN1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'351', N'150103', N'3', N'10030', N'回民区', N'HUI2 MIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'352', N'150104', N'3', N'10020', N'玉泉区', N'YU4 QUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'353', N'150105', N'3', N'10020', N'赛罕区', N'SAI4 HAN3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'354', N'150121', N'3', N'10100', N'土默特左旗', N'TU3 MO4 TE4 ZUO3 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'355', N'150122', N'3', N'10200', N'托克托县', N'TUO1 KE4 TUO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'356', N'150123', N'3', N'11500', N'和林格尔县', N'HE2 LIN2 GE1 ER3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'357', N'150124', N'3', N'11600', N'清水河县', N'QING1 SHUI3 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'358', N'150125', N'3', N'11700', N'武川县', N'WU3 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'359', N'150200', N'2', N'14000', N'包头市', N'BAO1 TOU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'360', N'150202', N'3', N'14040', N'东河区', N'DONG1 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'361', N'150203', N'3', N'14010', N'昆都仑区', N'KUN1 DOU1 LUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'362', N'150204', N'3', N'14030', N'青山区', N'QING1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'363', N'150205', N'3', N'14070', N'石拐区', N'SHI2 GUAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'364', N'150206', N'3', N'0', N'白云鄂博矿区', N'BAI2 YUN2 E4 BO2 KUANG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'365', N'150207', N'3', N'14060', N'九原区', N'JIU3 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'366', N'150221', N'3', N'14100', N'土默特右旗', N'TU3 MO4 TE4 YOU4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'367', N'150222', N'3', N'14200', N'固阳县', N'GU4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'368', N'150223', N'3', N'14500', N'达尔罕茂明安联合旗', N'DA2 ER3 HAN3 MAO4 MING2 AN1 LIAN2 GE3 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'369', N'150300', N'2', N'16000', N'乌海市', N'WU1 HAI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'370', N'150302', N'3', N'16000', N'海勃湾区', N'HAI3 BO2 WAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'371', N'150303', N'3', N'16030', N'海南区', N'HAI3 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'372', N'150304', N'3', N'16040', N'乌达区', N'WU1 DA2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'373', N'150400', N'2', N'24000', N'赤峰市', N'CHI4 FENG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'374', N'150402', N'3', N'24020', N'红山区', N'GONG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'375', N'150403', N'3', N'24076', N'元宝山区', N'YUAN2 BAO3 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'376', N'150404', N'3', N'24005', N'松山区', N'SONG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'377', N'150421', N'3', N'25550', N'阿鲁科尔沁旗', N'A1 LU3 KE1 ER3 QIN4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'378', N'150422', N'3', N'25450', N'巴林左旗', N'BA1 LIN2 ZUO3 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'379', N'150423', N'3', N'25150', N'巴林右旗', N'BA1 LIN2 YOU4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'380', N'150424', N'3', N'25250', N'林西县', N'LIN2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'381', N'150425', N'3', N'25350', N'克什克腾旗', N'KE4 SHEN2 KE4 TENG1 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'382', N'150426', N'3', N'24500', N'翁牛特旗', N'WENG1 NIU2 TE4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'383', N'150428', N'3', N'24400', N'喀喇沁旗', N'KA1 LA1 QIN4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'384', N'150429', N'3', N'24200', N'宁城县', N'NING2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'385', N'150430', N'3', N'24300', N'敖汉旗', N'AO2 HAN4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'386', N'150500', N'2', N'28000', N'通辽市', N'TONG1 LIAO2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'387', N'150502', N'3', N'28000', N'科尔沁区', N'KE1 ER3 QIN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'388', N'150521', N'3', N'29300', N'科尔沁左翼中旗', N'KE1 ER3 QIN4 ZUO3 YI4 ZHONG1 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'389', N'150522', N'3', N'28100', N'科尔沁左翼后旗', N'KE1 ER3 QIN4 ZUO3 YI4 HOU4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'390', N'150523', N'3', N'28400', N'开鲁县', N'KAI1 LU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'391', N'150524', N'3', N'28200', N'库伦旗', N'KU4 LUN2 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'392', N'150525', N'3', N'28300', N'奈曼旗', N'NAI4 MAN4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'393', N'150526', N'3', N'29100', N'扎鲁特旗', N'ZA1 LU3 TE4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'394', N'150581', N'3', N'29200', N'霍林郭勒市', N'HUO4 LIN2 GUO1 LE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'395', N'150600', N'2', N'17000', N'鄂尔多斯市', N'E4 ER3 DUO1 SI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'396', N'150602', N'3', N'17000', N'东胜区', N'DONG1 SHENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'397', N'150603', N'3', N'0', N'康巴什区', N'KANG1 BA1 SHEN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'398', N'150621', N'3', N'14300', N'达拉特旗', N'DA2 LA1 TE4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'399', N'150622', N'3', N'17100', N'准格尔旗', N'ZHUN3 GE1 ER3 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'400', N'150623', N'3', N'16200', N'鄂托克前旗', N'E4 TUO1 KE4 QIAN2 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'401', N'150624', N'3', N'16100', N'鄂托克旗', N'E4 TUO1 KE4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'402', N'150625', N'3', N'17400', N'杭锦旗', N'HANG2 JIN3 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'403', N'150626', N'3', N'17300', N'乌审旗', N'WU1 SHEN3 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'404', N'150627', N'3', N'17200', N'伊金霍洛旗', N'YI1 JIN1 HUO4 LUO4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'405', N'150700', N'2', N'21000', N'呼伦贝尔市', N'HU1 LUN2 BEI4 ER3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'406', N'150702', N'3', N'21000', N'海拉尔区', N'HAI3 LA1 ER3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'407', N'150703', N'3', N'21000', N'扎赉诺尔区', N'ZA1 LAI4 NUO4 ER3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'408', N'150721', N'3', N'162750', N'阿荣旗', N'A1 RONG2 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'409', N'150722', N'3', N'162850', N'莫力达瓦达斡尔族自治旗', N'MO4 LI4 DA2 WA3 DA2 WO4 ER3 ZU2 ZI4 ZHI4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'410', N'150723', N'3', N'165450', N'鄂伦春自治旗', N'E4 LUN2 CHUN1 ZI4 ZHI4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'411', N'150724', N'3', N'21100', N'鄂温克族自治旗', N'E4 WEN1 KE4 ZU2 ZI4 ZHI4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'412', N'150725', N'3', N'21500', N'陈巴尔虎旗', N'CHEN2 BA1 ER3 HU1 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'413', N'150726', N'3', N'21200', N'新巴尔虎左旗', N'XIN1 BA1 ER3 HU1 ZUO3 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'414', N'150727', N'3', N'21300', N'新巴尔虎右旗', N'XIN1 BA1 ER3 HU1 YOU4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'415', N'150781', N'3', N'21400', N'满洲里市', N'MAN3 ZHOU1 LI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'416', N'150782', N'3', N'22150', N'牙克石市', N'YA2 KE4 SHI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'417', N'150783', N'3', N'162650', N'扎兰屯市', N'ZA1 LAN2 TUN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'418', N'150784', N'3', N'22250', N'额尔古纳市', N'E2 ER3 GU3 NA4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'419', N'150785', N'3', N'22350', N'根河市', N'GEN1 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'420', N'150800', N'2', N'15000', N'巴彦淖尔市', N'BA1 YAN4 NAO4 ER3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'421', N'150802', N'3', N'15001', N'临河区', N'LIN2 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'422', N'150821', N'3', N'15100', N'五原县', N'WU3 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'423', N'150822', N'3', N'15200', N'磴口县', N'DENG4 KOU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'424', N'150823', N'3', N'14400', N'乌拉特前旗', N'WU1 LA1 TE4 QIAN2 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'425', N'150824', N'3', N'15300', N'乌拉特中旗', N'WU1 LA1 TE4 ZHONG1 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'426', N'150825', N'3', N'15500', N'乌拉特后旗', N'WU1 LA1 TE4 HOU4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'427', N'150826', N'3', N'15400', N'杭锦后旗', N'HANG2 JIN3 HOU4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'428', N'150900', N'2', N'0', N'乌兰察布市', N'WU1 LAN2 CHA2 BU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'429', N'150902', N'3', N'12000', N'集宁区', N'JI2 NING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'430', N'150921', N'3', N'12300', N'卓资县', N'ZHUO2 ZI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'431', N'150922', N'3', N'13350', N'化德县', N'HUA1 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'432', N'150923', N'3', N'13450', N'商都县', N'SHANG1 DOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'433', N'150924', N'3', N'13650', N'兴和县', N'XING1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'434', N'150925', N'3', N'13750', N'凉城县', N'LIANG2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'435', N'150926', N'3', N'12200', N'察哈尔右翼前旗', N'CHA2 HA1 ER3 YOU4 YI4 QIAN2 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'436', N'150927', N'3', N'13550', N'察哈尔右翼中旗', N'CHA2 HA1 ER3 YOU4 YI4 ZHONG1 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'437', N'150928', N'3', N'12400', N'察哈尔右翼后旗', N'CHA2 HA1 ER3 YOU4 YI4 HOU4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'438', N'150929', N'3', N'11800', N'四子王旗', N'SI4 ZI3 WANG2 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'439', N'150981', N'3', N'12100', N'丰镇市', N'FENG1 ZHEN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'440', N'152200', N'2', N'0', N'兴安盟', N'XING1 AN1 MENG2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'441', N'152201', N'3', N'137400', N'乌兰浩特市', N'WU1 LAN2 HAO4 TE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'442', N'152202', N'3', N'137400', N'阿尔山市', N'A1 ER3 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'443', N'152221', N'3', N'137400', N'科尔沁右翼前旗', N'KE1 ER3 QIN4 YOU4 YI4 QIAN2 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'444', N'152222', N'3', N'29400', N'科尔沁右翼中旗', N'KE1 ER3 QIN4 YOU4 YI4 ZHONG1 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'445', N'152223', N'3', N'137600', N'扎赉特旗', N'ZA1 LAI4 TE4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'446', N'152224', N'3', N'137500', N'突泉县', N'TU1 QUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'447', N'152500', N'2', N'26000', N'锡林郭勒盟', N'XI1 LIN2 GUO1 LE4 MENG2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'448', N'152501', N'3', N'12100', N'二连浩特市', N'ER4 LIAN2 HAO4 TE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'449', N'152502', N'3', N'12100', N'锡林浩特市', N'XI1 LIN2 HAO4 TE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'450', N'152522', N'3', N'12100', N'阿巴嘎旗', N'A1 BA1 GA1 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'451', N'152523', N'3', N'12100', N'苏尼特左旗', N'SU1 NI2 TE4 ZUO3 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'452', N'152524', N'3', N'12100', N'苏尼特右旗', N'SU1 NI2 TE4 YOU4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'453', N'152525', N'3', N'12100', N'东乌珠穆沁旗', N'DONG1 WU1 ZHU1 MU4 QIN4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'454', N'152526', N'3', N'12100', N'西乌珠穆沁旗', N'XI1 WU1 ZHU1 MU4 QIN4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'455', N'152527', N'3', N'12100', N'太仆寺旗', N'TAI4 PU1 SI4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'456', N'152528', N'3', N'12100', N'镶黄旗', N'RANG2 HUANG2 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'457', N'152529', N'3', N'12100', N'正镶白旗', N'ZHENG1 RANG2 BAI2 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'458', N'152530', N'3', N'12100', N'正蓝旗', N'ZHENG1 LAN2 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'459', N'152531', N'3', N'12100', N'多伦县', N'DUO1 LUN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'460', N'152900', N'2', N'0', N'阿拉善盟', N'A1 LA1 SHAN4 MENG2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'461', N'152921', N'3', N'750300', N'阿拉善左旗', N'A1 LA1 SHAN4 ZUO3 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'462', N'152922', N'3', N'737300', N'阿拉善右旗', N'A1 LA1 SHAN4 YOU4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'463', N'152923', N'3', N'735400', N'额济纳旗', N'E2 JI3 NA4 QI2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'464', N'210000', N'1', N'0', N'辽宁省', N'LIAO2 NING2 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'465', N'210100', N'2', N'110000', N'沈阳市', N'SHEN3 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'466', N'210102', N'3', N'110001', N'和平区', N'HE2 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'467', N'210103', N'3', N'110013', N'沈河区', N'SHEN3 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'468', N'210104', N'3', N'110041', N'大东区', N'DA4 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'469', N'210105', N'3', N'110031', N'皇姑区', N'HUANG2 GU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'470', N'210106', N'3', N'114013', N'铁西区', N'TIE3 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'471', N'210111', N'3', N'110101', N'苏家屯区', N'SU1 GU1 TUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'472', N'210112', N'3', N'110101', N'浑南区', N'HUN2 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'473', N'210113', N'3', N'110121', N'沈北新区', N'SHEN3 BEI3 XIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'474', N'210114', N'3', N'110141', N'于洪区', N'YU2 HONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'475', N'210115', N'3', N'110200', N'辽中区', N'LIAO2 ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'476', N'210123', N'3', N'110500', N'康平县', N'KANG1 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'477', N'210124', N'3', N'110400', N'法库县', N'FA3 KU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'478', N'210181', N'3', N'110300', N'新民市', N'XIN1 MIN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'479', N'210200', N'2', N'116000', N'大连市', N'DA4 LIAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'480', N'210202', N'3', N'116001', N'中山区', N'ZHONG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'481', N'210203', N'3', N'116011', N'西岗区', N'XI1 GANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'482', N'210204', N'3', N'116021', N'沙河口区', N'SHA1 HE2 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'483', N'210211', N'3', N'116033', N'甘井子区', N'GAN1 JING3 ZI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'484', N'210212', N'3', N'116041', N'旅顺口区', N'LV3 SHUN4 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'485', N'210213', N'3', N'116100', N'金州区', N'JIN1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'486', N'210214', N'3', N'116200', N'普兰店区', N'PU3 LAN2 DIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'487', N'210224', N'3', N'116500', N'长海县', N'CHANG2 HAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'488', N'210281', N'3', N'116300', N'瓦房店市', N'WA3 FANG2 DIAN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'489', N'210283', N'3', N'116400', N'庄河市', N'ZHUANG1 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'490', N'210300', N'2', N'114000', N'鞍山市', N'AN1 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'491', N'210302', N'3', N'114001', N'铁东区', N'TIE3 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'492', N'210303', N'3', N'136000', N'铁西区', N'TIE3 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'493', N'210304', N'3', N'114031', N'立山区', N'LI4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'494', N'210311', N'3', N'114041', N'千山区', N'QIAN1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'495', N'210321', N'3', N'114100', N'台安县', N'TAI1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'496', N'210323', N'3', N'114300', N'岫岩满族自治县', N'XIU4 YAN2 MAN3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'497', N'210381', N'3', N'114200', N'海城市', N'HAI3 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'498', N'210400', N'2', N'113000', N'抚顺市', N'FU3 SHUN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'499', N'210402', N'3', N'113008', N'新抚区', N'XIN1 FU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'500', N'210403', N'3', N'113003', N'东洲区', N'DONG1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'501', N'210404', N'3', N'113001', N'望花区', N'WANG4 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'502', N'210411', N'3', N'113006', N'顺城区', N'SHUN4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'503', N'210421', N'3', N'113006', N'抚顺县', N'FU3 SHUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'504', N'210422', N'3', N'113200', N'新宾满族自治县', N'XIN1 BIN1 MAN3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'505', N'210423', N'3', N'113300', N'清原满族自治县', N'QING1 YUAN2 MAN3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'506', N'210500', N'2', N'117000', N'本溪市', N'BEN3 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'507', N'210502', N'3', N'117000', N'平山区', N'PING2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'508', N'210503', N'3', N'117002', N'溪湖区', N'XI1 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'509', N'210504', N'3', N'117021', N'明山区', N'MING2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'510', N'210505', N'3', N'117014', N'南芬区', N'NAN2 FEN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'511', N'210521', N'3', N'117100', N'本溪满族自治县', N'BEN3 XI1 MAN3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'512', N'210522', N'3', N'117200', N'桓仁满族自治县', N'HUAN2 REN2 MAN3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'513', N'210600', N'2', N'118000', N'丹东市', N'DAN1 DONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'514', N'210602', N'3', N'118000', N'元宝区', N'YUAN2 BAO3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'515', N'210603', N'3', N'118002', N'振兴区', N'ZHEN4 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'516', N'210604', N'3', N'118001', N'振安区', N'ZHEN4 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'517', N'210624', N'3', N'118200', N'宽甸满族自治县', N'KUAN1 DIAN4 MAN3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'518', N'210681', N'3', N'118300', N'东港市', N'DONG1 GANG3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'519', N'210682', N'3', N'118100', N'凤城市', N'FENG4 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'520', N'210700', N'2', N'121000', N'锦州市', N'JIN3 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'521', N'210702', N'3', N'121001', N'古塔区', N'GU3 DA5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'522', N'210703', N'3', N'121000', N'凌河区', N'LING1 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'523', N'210711', N'3', N'121011', N'太和区', N'TAI4 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'524', N'210726', N'3', N'121400', N'黑山县', N'HEI1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'525', N'210727', N'3', N'121100', N'义县', N'YI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'526', N'210781', N'3', N'121200', N'凌海市', N'LING1 HAI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'527', N'210782', N'3', N'0', N'北镇市', N'BEI3 ZHEN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'528', N'210800', N'2', N'115000', N'营口市', N'YING2 KOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'529', N'210802', N'3', N'115002', N'站前区', N'ZHAN4 QIAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'530', N'210803', N'3', N'115004', N'西市区', N'XI1 SHI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'531', N'210804', N'3', N'115004', N'鲅鱼圈区', N'BA4 YU2 JUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'532', N'210811', N'3', N'115005', N'老边区', N'LAO3 BIAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'533', N'210881', N'3', N'115200', N'盖州市', N'GAI4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'534', N'210882', N'3', N'115100', N'大石桥市', N'DA4 SHI2 QIAO2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'535', N'210900', N'2', N'123000', N'阜新市', N'FU4 XIN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'536', N'210902', N'3', N'123000', N'海州区', N'HAI3 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'537', N'210903', N'3', N'123005', N'新邱区', N'XIN1 QIU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'538', N'210904', N'3', N'123003', N'太平区', N'TAI4 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'539', N'210905', N'3', N'123006', N'清河门区', N'QING1 HE2 MEN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'540', N'210911', N'3', N'123000', N'细河区', N'XI4 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'541', N'210921', N'3', N'123100', N'阜新蒙古族自治县', N'FU4 XIN1 MENG1 GU3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'542', N'210922', N'3', N'123200', N'彰武县', N'ZHANG1 WU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'543', N'211000', N'2', N'111000', N'辽阳市', N'LIAO2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'544', N'211002', N'3', N'111000', N'白塔区', N'BAI2 DA5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'545', N'211003', N'3', N'111000', N'文圣区', N'WEN2 SHENG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'546', N'211004', N'3', N'111003', N'宏伟区', N'HONG2 WEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'547', N'211005', N'3', N'111008', N'弓长岭区', N'GONG1 CHANG2 LING3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'548', N'211011', N'3', N'111000', N'太子河区', N'TAI4 ZI3 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'549', N'211021', N'3', N'111200', N'辽阳县', N'LIAO2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'550', N'211081', N'3', N'111300', N'灯塔市', N'DENG1 DA5 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'551', N'211100', N'2', N'124000', N'盘锦市', N'PAN2 JIN3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'552', N'211102', N'3', N'124000', N'双台子区', N'SHUANG1 TAI1 ZI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'553', N'211103', N'3', N'124010', N'兴隆台区', N'XING1 LONG1 TAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'554', N'211104', N'3', N'124200', N'大洼区', N'DA4 WA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'555', N'211122', N'3', N'124000', N'盘山县', N'PAN2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'556', N'211200', N'2', N'112000', N'铁岭市', N'TIE3 LING3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'557', N'211202', N'3', N'112000', N'银州区', N'YIN2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'558', N'211204', N'3', N'112003', N'清河区', N'QING1 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'559', N'211221', N'3', N'112000', N'铁岭县', N'TIE3 LING3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'560', N'211223', N'3', N'112400', N'西丰县', N'XI1 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'561', N'211224', N'3', N'112500', N'昌图县', N'CHANG1 TU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'562', N'211281', N'3', N'112700', N'调兵山市', N'DIAO4 BING1 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'563', N'211282', N'3', N'112300', N'开原市', N'KAI1 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'564', N'211300', N'2', N'122000', N'朝阳市', N'CHAO2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'565', N'211302', N'3', N'122000', N'双塔区', N'SHUANG1 DA5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'566', N'211303', N'3', N'122000', N'龙城区', N'LONG2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'567', N'211321', N'3', N'122000', N'朝阳县', N'CHAO2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'568', N'211322', N'3', N'122400', N'建平县', N'JIAN4 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'569', N'211324', N'3', N'122300', N'喀喇沁左翼蒙古族自治县', N'KA1 LA1 QIN4 ZUO3 YI4 MENG1 GU3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'570', N'211381', N'3', N'122100', N'北票市', N'BEI3 PIAO4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'571', N'211382', N'3', N'122500', N'凌源市', N'LING1 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'572', N'211400', N'2', N'125000', N'葫芦岛市', N'HU2 LU2 DAO3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'573', N'211402', N'3', N'125001', N'连山区', N'LIAN2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'574', N'211403', N'3', N'125003', N'龙港区', N'LONG2 GANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'575', N'211404', N'3', N'125027', N'南票区', N'NAN2 PIAO4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'576', N'211421', N'3', N'125200', N'绥中县', N'SUI2 ZHONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'577', N'211422', N'3', N'125300', N'建昌县', N'JIAN4 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'578', N'211481', N'3', N'125100', N'兴城市', N'XING1 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'579', N'220000', N'1', N'0', N'吉林省', N'JI2 LIN2 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'580', N'220100', N'2', N'130000', N'长春市', N'CHANG2 CHUN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'581', N'220102', N'3', N'130022', N'南关区', N'NAN2 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'582', N'220103', N'3', N'130051', N'宽城区', N'KUAN1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'583', N'220104', N'3', N'130012', N'朝阳区', N'CHAO2 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'584', N'220105', N'3', N'130031', N'二道区', N'ER4 DAO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'585', N'220106', N'3', N'130062', N'绿园区', N'LU4 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'586', N'220112', N'3', N'130600', N'双阳区', N'SHUANG1 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'587', N'220113', N'3', N'130500', N'九台区', N'JIU3 TAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'588', N'220122', N'3', N'130200', N'农安县', N'NONG2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'589', N'220182', N'3', N'130400', N'榆树市', N'YU2 SHU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'590', N'220183', N'3', N'130300', N'德惠市', N'DE2 HUI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'591', N'220200', N'2', N'132000', N'吉林市', N'JI2 LIN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'592', N'220202', N'3', N'132002', N'昌邑区', N'CHANG1 YI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'593', N'220203', N'3', N'132021', N'龙潭区', N'LONG2 TAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'594', N'220204', N'3', N'132011', N'船营区', N'CHUAN2 YING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'595', N'220211', N'3', N'132013', N'丰满区', N'FENG1 MAN3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'596', N'220221', N'3', N'132200', N'永吉县', N'YONG3 JI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'597', N'220281', N'3', N'132500', N'蛟河市', N'JIAO1 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'598', N'220282', N'3', N'132400', N'桦甸市', N'HUA4 DIAN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'599', N'220283', N'3', N'132600', N'舒兰市', N'SHU1 LAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'600', N'220284', N'3', N'132300', N'磐石市', N'PAN2 SHI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'601', N'220300', N'2', N'136000', N'四平市', N'SI4 PING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'602', N'220302', N'3', N'136000', N'铁西区', N'TIE3 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'603', N'220303', N'3', N'136001', N'铁东区', N'TIE3 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'604', N'220322', N'3', N'136500', N'梨树县', N'LI2 SHU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'605', N'220323', N'3', N'130700', N'伊通满族自治县', N'YI1 TONG1 MAN3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'606', N'220381', N'3', N'136100', N'公主岭市', N'GONG1 ZHU3 LING3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'607', N'220382', N'3', N'136400', N'双辽市', N'SHUANG1 LIAO2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'608', N'220400', N'2', N'136200', N'辽源市', N'LIAO2 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'609', N'220402', N'3', N'136200', N'龙山区', N'LONG2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'610', N'220403', N'3', N'136201', N'西安区', N'XI1 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'611', N'220421', N'3', N'136300', N'东丰县', N'DONG1 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'612', N'220422', N'3', N'136600', N'东辽县', N'DONG1 LIAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'613', N'220500', N'2', N'134000', N'通化市', N'TONG1 HUA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'614', N'220502', N'3', N'134001', N'东昌区', N'DONG1 CHANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'615', N'220503', N'3', N'134003', N'二道江区', N'ER4 DAO1 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'616', N'220521', N'3', N'134100', N'通化县', N'TONG1 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'617', N'220523', N'3', N'135100', N'辉南县', N'HUI1 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'618', N'220524', N'3', N'135300', N'柳河县', N'LIU3 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'619', N'220581', N'3', N'135000', N'梅河口市', N'MEI2 HE2 KOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'620', N'220582', N'3', N'134200', N'集安市', N'JI2 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'621', N'220600', N'2', N'134300', N'白山市', N'BAI2 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'622', N'220602', N'3', N'134300', N'浑江区', N'HUN2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'623', N'220605', N'3', N'134300', N'江源区', N'JIANG1 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'624', N'220621', N'3', N'134500', N'抚松县', N'FU3 SONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'625', N'220622', N'3', N'135200', N'靖宇县', N'JING4 YU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'626', N'220623', N'3', N'134400', N'长白朝鲜族自治县', N'CHANG2 BAI2 CHAO2 XIAN1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'627', N'220681', N'3', N'134600', N'临江市', N'LIN2 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'628', N'220700', N'2', N'138000', N'松原市', N'SONG1 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'629', N'220702', N'3', N'138000', N'宁江区', N'NING2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'630', N'220721', N'3', N'138000', N'前郭尔罗斯蒙古族自治县', N'QIAN2 GUO1 ER3 LUO2 SI1 MENG1 GU3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'631', N'220722', N'3', N'131500', N'长岭县', N'CHANG2 LING3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'632', N'220723', N'3', N'131400', N'乾安县', N'GAN1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'633', N'220781', N'3', N'131200', N'扶余市', N'FU2 YU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'634', N'220800', N'2', N'137000', N'白城市', N'BAI2 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'635', N'220802', N'3', N'137000', N'洮北区', N'TAO2 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'636', N'220821', N'3', N'137300', N'镇赉县', N'ZHEN1 LAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'637', N'220822', N'3', N'137200', N'通榆县', N'TONG1 YU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'638', N'220881', N'3', N'137100', N'洮南市', N'TAO2 NAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'639', N'220882', N'3', N'131300', N'大安市', N'DA4 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'640', N'222400', N'2', N'133000', N'延边朝鲜族自治州', N'YAN2 BIAN1 CHAO2 XIAN1 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'641', N'222401', N'3', N'133000', N'延吉市', N'YAN2 JI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'642', N'222402', N'3', N'133100', N'图们市', N'TU2 MEN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'643', N'222403', N'3', N'133700', N'敦化市', N'DUI4 HUA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'644', N'222404', N'3', N'133300', N'珲春市', N'HUI1 CHUN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'645', N'222405', N'3', N'133400', N'龙井市', N'LONG2 JING3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'646', N'222406', N'3', N'133500', N'和龙市', N'HE2 LONG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'647', N'222424', N'3', N'133200', N'汪清县', N'WANG1 QING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'648', N'222426', N'3', N'133600', N'安图县', N'AN1 TU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'649', N'230000', N'1', N'0', N'黑龙江省', N'HEI1 LONG2 JIANG1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'650', N'230100', N'2', N'150000', N'哈尔滨市', N'HA1 ER3 BIN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'651', N'230102', N'3', N'150010', N'道里区', N'DAO1 LI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'652', N'230103', N'3', N'150006', N'南岗区', N'NAN2 GANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'653', N'230104', N'3', N'150020', N'道外区', N'DAO1 WAI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'654', N'230108', N'3', N'150060', N'平房区', N'PING2 FANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'655', N'230109', N'3', N'150028', N'松北区', N'SONG1 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'656', N'230110', N'3', N'150036', N'香坊区', N'XIANG1 FANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'657', N'230111', N'3', N'150500', N'呼兰区', N'HU1 LAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'658', N'230112', N'3', N'150300', N'阿城区', N'A1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'659', N'230113', N'3', N'150100', N'双城区', N'SHUANG1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'660', N'230123', N'3', N'154800', N'依兰县', N'YI1 LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'661', N'230124', N'3', N'150800', N'方正县', N'FANG1 ZHENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'662', N'230125', N'3', N'150400', N'宾县', N'BIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'663', N'230126', N'3', N'151800', N'巴彦县', N'BA1 YAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'664', N'230127', N'3', N'151900', N'木兰县', N'MU4 LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'665', N'230128', N'3', N'150900', N'通河县', N'TONG1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'666', N'230129', N'3', N'150700', N'延寿县', N'YAN2 SHOU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'667', N'230183', N'3', N'150600', N'尚志市', N'SHANG4 ZHI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'668', N'230184', N'3', N'150200', N'五常市', N'WU3 CHANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'669', N'230200', N'2', N'161000', N'齐齐哈尔市', N'JI4 JI4 HA1 ER3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'670', N'230202', N'3', N'161000', N'龙沙区', N'LONG2 SHA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'671', N'230203', N'3', N'161006', N'建华区', N'JIAN4 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'672', N'230204', N'3', N'161000', N'铁锋区', N'TIE3 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'673', N'230205', N'3', N'161000', N'昂昂溪区', N'ANG2 ANG2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'674', N'230206', N'3', N'161041', N'富拉尔基区', N'FU4 LA1 ER3 JI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'675', N'230207', N'3', N'161046', N'碾子山区', N'NIAN3 ZI3 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'676', N'230208', N'3', N'161021', N'梅里斯达斡尔族区', N'MEI2 LI3 SI1 DA2 WO4 ER3 ZU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'677', N'230221', N'3', N'161100', N'龙江县', N'LONG2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'678', N'230223', N'3', N'161500', N'依安县', N'YI1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'679', N'230224', N'3', N'162400', N'泰来县', N'TAI4 LAI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'680', N'230225', N'3', N'162100', N'甘南县', N'GAN1 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'681', N'230227', N'3', N'161200', N'富裕县', N'FU4 YU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'682', N'230229', N'3', N'161600', N'克山县', N'KE4 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'683', N'230230', N'3', N'164800', N'克东县', N'KE4 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'684', N'230231', N'3', N'164700', N'拜泉县', N'BAI4 QUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'685', N'230281', N'3', N'161300', N'讷河市', N'NE4 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'686', N'230300', N'2', N'158100', N'鸡西市', N'JI1 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'687', N'230302', N'3', N'158100', N'鸡冠区', N'JI1 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'688', N'230303', N'3', N'158130', N'恒山区', N'HENG2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'689', N'230304', N'3', N'158150', N'滴道区', N'DI1 DAO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'690', N'230305', N'3', N'158160', N'梨树区', N'LI2 SHU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'691', N'230306', N'3', N'158170', N'城子河区', N'CHENG2 ZI3 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'692', N'230307', N'3', N'158180', N'麻山区', N'MA1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'693', N'230321', N'3', N'158200', N'鸡东县', N'JI1 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'694', N'230381', N'3', N'158400', N'虎林市', N'HU1 LIN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'695', N'230382', N'3', N'158300', N'密山市', N'MI4 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'696', N'230400', N'2', N'154100', N'鹤岗市', N'HE4 GANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'697', N'230402', N'3', N'154100', N'向阳区', N'XIANG4 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'698', N'230403', N'3', N'154101', N'工农区', N'GONG1 NONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'699', N'230404', N'3', N'154104', N'南山区', N'NAN2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'700', N'230405', N'3', N'154102', N'兴安区', N'XING1 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'701', N'230406', N'3', N'522031', N'东山区', N'DONG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'702', N'230407', N'3', N'154105', N'兴山区', N'XING1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'703', N'230421', N'3', N'154200', N'萝北县', N'LUO2 BEI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'704', N'230422', N'3', N'156200', N'绥滨县', N'SUI2 BIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'705', N'230500', N'2', N'155100', N'双鸭山市', N'SHUANG1 YA1 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'706', N'230502', N'3', N'155100', N'尖山区', N'JIAN1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'707', N'230503', N'3', N'155120', N'岭东区', N'LING3 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'708', N'230505', N'3', N'155130', N'四方台区', N'SI4 FANG1 TAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'709', N'230506', N'3', N'155131', N'宝山区', N'BAO3 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'710', N'230521', N'3', N'155900', N'集贤县', N'JI2 XIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'711', N'230522', N'3', N'155800', N'友谊县', N'YOU3 YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'712', N'230523', N'3', N'155600', N'宝清县', N'BAO3 QING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'713', N'230524', N'3', N'155700', N'饶河县', N'RAO2 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'714', N'230600', N'2', N'163000', N'大庆市', N'DA4 QING4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'715', N'230602', N'3', N'163001', N'萨尔图区', N'SA4 ER3 TU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'716', N'230603', N'3', N'163711', N'龙凤区', N'LONG2 FENG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'717', N'230604', N'3', N'163712', N'让胡路区', N'RANG4 HU2 LU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'718', N'230605', N'3', N'163511', N'红岗区', N'GONG1 GANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'719', N'230606', N'3', N'163515', N'大同区', N'DA4 TONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'720', N'230621', N'3', N'166400', N'肇州县', N'ZHAO4 ZHOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'721', N'230622', N'3', N'166500', N'肇源县', N'ZHAO4 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'722', N'230623', N'3', N'166300', N'林甸县', N'LIN2 DIAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'723', N'230624', N'3', N'166200', N'杜尔伯特蒙古族自治县', N'DU4 ER3 BAI3 TE4 MENG1 GU3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'724', N'230700', N'2', N'153000', N'伊春市', N'YI1 CHUN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'725', N'230702', N'3', N'153000', N'伊春区', N'YI1 CHUN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'726', N'230703', N'3', N'153100', N'南岔区', N'NAN2 CHA4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'727', N'230704', N'3', N'153031', N'友好区', N'YOU3 HAO3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'728', N'230705', N'3', N'153025', N'西林区', N'XI1 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'729', N'230706', N'3', N'153013', N'翠峦区', N'CUI4 LUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'730', N'230707', N'3', N'153036', N'新青区', N'XIN1 QING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'731', N'230708', N'3', N'153021', N'美溪区', N'MEI3 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'732', N'230709', N'3', N'153026', N'金山屯区', N'JIN1 SHAN1 TUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'733', N'230710', N'3', N'153033', N'五营区', N'WU3 YING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'734', N'230711', N'3', N'153011', N'乌马河区', N'WU1 MA3 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'735', N'230712', N'3', N'153037', N'汤旺河区', N'SHANG1 WANG4 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'736', N'230713', N'3', N'153106', N'带岭区', N'DAI4 LING3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'737', N'230714', N'3', N'153038', N'乌伊岭区', N'WU1 YI1 LING3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'738', N'230715', N'3', N'153035', N'红星区', N'GONG1 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'739', N'230716', N'3', N'153032', N'上甘岭区', N'SHANG3 GAN1 LING3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'740', N'230722', N'3', N'153200', N'嘉荫县', N'JIA1 YIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'741', N'230781', N'3', N'152500', N'铁力市', N'TIE3 LI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'742', N'230800', N'2', N'154000', N'佳木斯市', N'JIA1 MU4 SI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'743', N'230803', N'3', N'154002', N'向阳区', N'XIANG4 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'744', N'230804', N'3', N'154002', N'前进区', N'QIAN2 JIN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'745', N'230805', N'3', N'154005', N'东风区', N'DONG1 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'746', N'230811', N'3', N'244000', N'郊区', N'JIAO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'747', N'230822', N'3', N'154400', N'桦南县', N'HUA4 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'748', N'230826', N'3', N'154300', N'桦川县', N'HUA4 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'749', N'230828', N'3', N'154700', N'汤原县', N'SHANG1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'750', N'230881', N'3', N'156400', N'同江市', N'TONG2 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'751', N'230882', N'3', N'156100', N'富锦市', N'FU4 JIN3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'752', N'230883', N'3', N'156500', N'抚远市', N'FU3 YUAN3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'753', N'230900', N'2', N'154600', N'七台河市', N'QI1 TAI1 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'754', N'230902', N'3', N'154604', N'新兴区', N'XIN1 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'755', N'230903', N'3', N'154600', N'桃山区', N'TAO2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'756', N'230904', N'3', N'154622', N'茄子河区', N'JIA1 ZI3 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'757', N'230921', N'3', N'154500', N'勃利县', N'BO2 LI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'758', N'231000', N'2', N'157000', N'牡丹江市', N'MU3 DAN1 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'759', N'231002', N'3', N'157000', N'东安区', N'DONG1 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'760', N'231003', N'3', N'157013', N'阳明区', N'YANG2 MING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'761', N'231004', N'3', N'157009', N'爱民区', N'AI4 MIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'762', N'231005', N'3', N'157000', N'西安区', N'XI1 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'763', N'231025', N'3', N'157600', N'林口县', N'LIN2 KOU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'764', N'231081', N'3', N'157300', N'绥芬河市', N'SUI2 FEN1 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'765', N'231083', N'3', N'157100', N'海林市', N'HAI3 LIN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'766', N'231084', N'3', N'157400', N'宁安市', N'NING2 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'767', N'231085', N'3', N'157500', N'穆棱市', N'MU4 LENG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'768', N'231086', N'3', N'157200', N'东宁市', N'DONG1 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'769', N'231100', N'2', N'164300', N'黑河市', N'HEI1 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'770', N'231102', N'3', N'164300', N'爱辉区', N'AI4 HUI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'771', N'231121', N'3', N'161400', N'嫩江县', N'NEN4 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'772', N'231123', N'3', N'164400', N'逊克县', N'XUN4 KE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'773', N'231124', N'3', N'164200', N'孙吴县', N'SUN1 WU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'774', N'231181', N'3', N'164000', N'北安市', N'BEI3 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'775', N'231182', N'3', N'164100', N'五大连池市', N'WU3 DA4 LIAN2 CHI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'776', N'231200', N'2', N'152000', N'绥化市', N'SUI2 HUA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'777', N'231202', N'3', N'152000', N'北林区', N'BEI3 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'778', N'231221', N'3', N'152100', N'望奎县', N'WANG4 KUI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'779', N'231222', N'3', N'151500', N'兰西县', N'LAN2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'780', N'231223', N'3', N'151600', N'青冈县', N'QING1 GANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'781', N'231224', N'3', N'152400', N'庆安县', N'QING4 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'782', N'231225', N'3', N'151700', N'明水县', N'MING2 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'783', N'231226', N'3', N'152200', N'绥棱县', N'SUI2 LENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'784', N'231281', N'3', N'151400', N'安达市', N'AN1 DA2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'785', N'231282', N'3', N'151100', N'肇东市', N'ZHAO4 DONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'786', N'231283', N'3', N'152300', N'海伦市', N'HAI3 LUN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'787', N'232700', N'2', N'165000', N'大兴安岭地区', N'DA4 XING1 AN1 LING3 DE5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'788', N'232701', N'3', N'165000', N'加格达奇区', N'JIA1 GE1 DA2 JI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'789', N'232702', N'3', N'165010', N'松岭区', N'SONG1 LING3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'790', N'232703', N'3', N'165000', N'新林区', N'XIN1 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'791', N'232704', N'3', N'165036', N'呼中区', N'HU1 ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'792', N'232721', N'3', N'165100', N'呼玛县', N'HU1 MA3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'793', N'232722', N'3', N'165200', N'塔河县', N'DA5 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'794', N'232723', N'3', N'165300', N'漠河县', N'MO4 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'795', N'310000', N'1', N'200000', N'上海市', N'SHANG3 HAI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'796', N'310100', N'2', N'200000', N'上海市', N'SHANG3 HAI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'797', N'310101', N'3', N'200001', N'黄浦区', N'HUANG2 PU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'798', N'310104', N'3', N'200030', N'徐汇区', N'XU2 HUI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'799', N'310105', N'3', N'200050', N'长宁区', N'CHANG2 NING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'800', N'310106', N'3', N'200050', N'静安区', N'JING4 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'801', N'310107', N'3', N'200333', N'普陀区', N'PU3 TUO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'802', N'310109', N'3', N'200080', N'虹口区', N'HONG2 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'803', N'310110', N'3', N'200082', N'杨浦区', N'YANG2 PU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'804', N'310112', N'3', N'201100', N'闵行区', N'MIN3 HANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'805', N'310113', N'3', N'201900', N'宝山区', N'BAO3 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'806', N'310114', N'3', N'201800', N'嘉定区', N'JIA1 DING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'807', N'310115', N'3', N'200135', N'浦东新区', N'PU3 DONG1 XIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'808', N'310116', N'3', N'200540', N'金山区', N'JIN1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'809', N'310117', N'3', N'201600', N'松江区', N'SONG1 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'810', N'310118', N'3', N'201700', N'青浦区', N'QING1 PU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'811', N'310120', N'3', N'201400', N'奉贤区', N'FENG4 XIAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'812', N'310151', N'3', N'202150', N'崇明区', N'CHONG2 MING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'813', N'320000', N'1', N'0', N'江苏省', N'JIANG1 SU1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'814', N'320100', N'2', N'210000', N'南京市', N'NAN2 JING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'815', N'320102', N'3', N'210018', N'玄武区', N'XUAN2 WU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'816', N'320104', N'3', N'210001', N'秦淮区', N'QIN2 HUAI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'817', N'320105', N'3', N'210004', N'建邺区', N'JIAN4 YE4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'818', N'320106', N'3', N'210009', N'鼓楼区', N'GU3 LOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'819', N'320111', N'3', N'211800', N'浦口区', N'PU3 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'820', N'320113', N'3', N'210046', N'栖霞区', N'QI1 XIA2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'821', N'320114', N'3', N'210012', N'雨花台区', N'YU3 HUA1 TAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'822', N'320115', N'3', N'211100', N'江宁区', N'JIANG1 NING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'823', N'320116', N'3', N'211500', N'六合区', N'LIU4 GE3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'824', N'320117', N'3', N'211200', N'溧水区', N'LI4 SHUI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'825', N'320118', N'3', N'211300', N'高淳区', N'GAO1 CHUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'826', N'320200', N'2', N'214000', N'无锡市', N'MO2 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'827', N'320205', N'3', N'214021', N'锡山区', N'XI1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'828', N'320206', N'3', N'214021', N'惠山区', N'HUI4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'829', N'320211', N'3', N'214062', N'滨湖区', N'BIN1 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'830', N'320213', N'3', N'214400', N'梁溪区', N'LIANG2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'831', N'320214', N'3', N'214200', N'新吴区', N'XIN1 WU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'832', N'320281', N'3', N'0', N'江阴市', N'JIANG1 YIN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'833', N'320282', N'3', N'214200', N'宜兴市', N'YI2 XING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'834', N'320300', N'2', N'221000', N'徐州市', N'XU2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'835', N'320302', N'3', N'221005', N'鼓楼区', N'GU3 LOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'836', N'320303', N'3', N'221009', N'云龙区', N'YUN2 LONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'837', N'320305', N'3', N'221011', N'贾汪区', N'GU3 WANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'838', N'320311', N'3', N'221006', N'泉山区', N'QUAN2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'839', N'320312', N'3', N'221000', N'铜山区', N'TONG2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'840', N'320321', N'3', N'221700', N'丰县', N'FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'841', N'320322', N'3', N'221600', N'沛县', N'PEI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'842', N'320324', N'3', N'221200', N'睢宁县', N'SUI1 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'843', N'320381', N'3', N'221400', N'新沂市', N'XIN1 YI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'844', N'320382', N'3', N'221300', N'邳州市', N'PI1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'845', N'320400', N'2', N'213000', N'常州市', N'CHANG2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'846', N'320402', N'3', N'213003', N'天宁区', N'TIAN1 NING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'847', N'320404', N'3', N'213002', N'钟楼区', N'ZHONG1 LOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'848', N'320411', N'3', N'213001', N'新北区', N'XIN1 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'849', N'320412', N'3', N'213161', N'武进区', N'WU3 JIN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'850', N'320413', N'3', N'213200', N'金坛区', N'JIN1 TAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'851', N'320481', N'3', N'213300', N'溧阳市', N'LI4 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'852', N'320500', N'2', N'215000', N'苏州市', N'SU1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'853', N'320505', N'3', N'215004', N'虎丘区', N'HU1 QIU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'854', N'320506', N'3', N'215128', N'吴中区', N'WU2 ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'855', N'320507', N'3', N'215131', N'相城区', N'XIANG1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'856', N'320508', N'3', N'215000', N'姑苏区', N'GU1 SU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'857', N'320509', N'3', N'215000', N'吴江区', N'WU2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'858', N'320581', N'3', N'215500', N'常熟市', N'CHANG2 SHOU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'859', N'320582', N'3', N'215600', N'张家港市', N'ZHANG1 GU1 GANG3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'860', N'320583', N'3', N'215300', N'昆山市', N'KUN1 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'861', N'320585', N'3', N'215400', N'太仓市', N'TAI4 CANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'862', N'320600', N'2', N'226000', N'南通市', N'NAN2 TONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'863', N'320602', N'3', N'226001', N'崇川区', N'CHONG2 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'864', N'320611', N'3', N'226001', N'港闸区', N'GANG3 ZHA2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'865', N'320612', N'3', N'226300', N'通州区', N'TONG1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'866', N'320621', N'3', N'226600', N'海安县', N'HAI3 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'867', N'320623', N'3', N'226400', N'如东县', N'RU2 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'868', N'320681', N'3', N'226200', N'启东市', N'QI3 DONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'869', N'320682', N'3', N'226500', N'如皋市', N'RU2 GAO1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'870', N'320684', N'3', N'226100', N'海门市', N'HAI3 MEN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'871', N'320700', N'2', N'222000', N'连云港市', N'LIAN2 YUN2 GANG3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'872', N'320703', N'3', N'222042', N'连云区', N'LIAN2 YUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'873', N'320706', N'3', N'222023', N'海州区', N'HAI3 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'874', N'320707', N'3', N'222100', N'赣榆区', N'GAN4 YU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'875', N'320722', N'3', N'222300', N'东海县', N'DONG1 HAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'876', N'320723', N'3', N'222200', N'灌云县', N'GUAN4 YUN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'877', N'320724', N'3', N'223500', N'灌南县', N'GUAN4 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'878', N'320800', N'2', N'223001', N'淮安市', N'HUAI2 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'879', N'320803', N'3', N'223001', N'淮安区', N'HUAI2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'880', N'320804', N'3', N'223300', N'淮阴区', N'HUAI2 YIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'881', N'320812', N'3', N'223002', N'清江浦区', N'QING1 JIANG1 PU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'882', N'320813', N'3', N'223100', N'洪泽区', N'HONG2 ZE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'883', N'320826', N'3', N'223400', N'涟水县', N'LIAN2 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'884', N'320830', N'3', N'211700', N'盱眙县', N'XU1 CHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'885', N'320831', N'3', N'211600', N'金湖县', N'JIN1 HU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'886', N'320900', N'2', N'224000', N'盐城市', N'YAN2 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'887', N'320902', N'3', N'224005', N'亭湖区', N'TING2 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'888', N'320903', N'3', N'224055', N'盐都区', N'YAN2 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'889', N'320904', N'3', N'224100', N'大丰区', N'DA4 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'890', N'320921', N'3', N'224600', N'响水县', N'XIANG3 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'891', N'320922', N'3', N'224500', N'滨海县', N'BIN1 HAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'892', N'320923', N'3', N'224400', N'阜宁县', N'FU4 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'893', N'320924', N'3', N'224300', N'射阳县', N'SHE4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'894', N'320925', N'3', N'224700', N'建湖县', N'JIAN4 HU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'895', N'320981', N'3', N'224200', N'东台市', N'DONG1 TAI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'896', N'321000', N'2', N'225000', N'扬州市', N'YANG2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'897', N'321002', N'3', N'225002', N'广陵区', N'GUANG3 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'898', N'321003', N'3', N'225002', N'邗江区', N'HAN2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'899', N'321012', N'3', N'0', N'江都区', N'JIANG1 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'900', N'321023', N'3', N'225800', N'宝应县', N'BAO3 YING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'901', N'321081', N'3', N'211400', N'仪征市', N'YI2 ZHENG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'902', N'321084', N'3', N'225600', N'高邮市', N'GAO1 YOU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'903', N'321100', N'2', N'212000', N'镇江市', N'ZHEN1 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'904', N'321102', N'3', N'212001', N'京口区', N'JING1 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'905', N'321111', N'3', N'212004', N'润州区', N'RUN4 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'906', N'321112', N'3', N'212001', N'丹徒区', N'DAN1 TU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'907', N'321181', N'3', N'212300', N'丹阳市', N'DAN1 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'908', N'321182', N'3', N'212200', N'扬中市', N'YANG2 ZHONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'909', N'321183', N'3', N'212400', N'句容市', N'GOU1 RONG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'910', N'321200', N'2', N'225300', N'泰州市', N'TAI4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'911', N'321202', N'3', N'225300', N'海陵区', N'HAI3 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'912', N'321203', N'3', N'225321', N'高港区', N'GAO1 GANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'913', N'321204', N'3', N'225500', N'姜堰区', N'JIANG1 YAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'914', N'321281', N'3', N'225700', N'兴化市', N'XING1 HUA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'915', N'321282', N'3', N'214500', N'靖江市', N'JING4 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'916', N'321283', N'3', N'225400', N'泰兴市', N'TAI4 XING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'917', N'321300', N'2', N'223800', N'宿迁市', N'SU4 QIAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'918', N'321302', N'3', N'223800', N'宿城区', N'SU4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'919', N'321311', N'3', N'223800', N'宿豫区', N'SU4 YU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'920', N'321322', N'3', N'223600', N'沭阳县', N'SHU4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'921', N'321323', N'3', N'223700', N'泗阳县', N'SI4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'922', N'321324', N'3', N'223900', N'泗洪县', N'SI4 HONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'923', N'330000', N'1', N'0', N'浙江省', N'ZHE4 JIANG1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'924', N'330100', N'2', N'310000', N'杭州市', N'HANG2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'925', N'330102', N'3', N'310002', N'上城区', N'SHANG3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'926', N'330103', N'3', N'310006', N'下城区', N'XIA4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'927', N'330104', N'3', N'310016', N'江干区', N'JIANG1 GAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'928', N'330105', N'3', N'310011', N'拱墅区', N'GONG3 SHU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'929', N'330106', N'3', N'310013', N'西湖区', N'XI1 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'930', N'330108', N'3', N'310051', N'滨江区', N'BIN1 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'931', N'330109', N'3', N'311200', N'萧山区', N'XIAO1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'932', N'330110', N'3', N'311100', N'余杭区', N'YU2 HANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'933', N'330111', N'3', N'311400', N'富阳区', N'FU4 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'934', N'330112', N'3', N'0', N'临安区', N'LIN2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'935', N'330122', N'3', N'311500', N'桐庐县', N'TONG2 LU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'936', N'330127', N'3', N'311700', N'淳安县', N'CHUN2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'937', N'330182', N'3', N'311600', N'建德市', N'JIAN4 DE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'938', N'330200', N'2', N'315000', N'宁波市', N'NING2 BO1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'939', N'330203', N'3', N'315000', N'海曙区', N'HAI3 SHU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'940', N'330205', N'3', N'315040', N'江北区', N'JIANG1 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'941', N'330206', N'3', N'315800', N'北仑区', N'BEI3 LUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'942', N'330211', N'3', N'315200', N'镇海区', N'ZHEN1 HAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'943', N'330212', N'3', N'315100', N'鄞州区', N'YIN2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'944', N'330213', N'3', N'315500', N'奉化区', N'FENG4 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'945', N'330225', N'3', N'315700', N'象山县', N'XIANG4 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'946', N'330226', N'3', N'315600', N'宁海县', N'NING2 HAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'947', N'330281', N'3', N'315400', N'余姚市', N'YU2 YAO2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'948', N'330282', N'3', N'315300', N'慈溪市', N'CI2 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'949', N'330300', N'2', N'325000', N'温州市', N'WEN1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'950', N'330302', N'3', N'325000', N'鹿城区', N'LU4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'951', N'330303', N'3', N'325013', N'龙湾区', N'LONG2 WAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'952', N'330304', N'3', N'325005', N'瓯海区', N'OU1 HAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'953', N'330305', N'3', N'325700', N'洞头区', N'DONG4 TOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'954', N'330324', N'3', N'315100', N'永嘉县', N'YONG3 JIA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'955', N'330326', N'3', N'325400', N'平阳县', N'PING2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'956', N'330327', N'3', N'325800', N'苍南县', N'CANG1 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'957', N'330328', N'3', N'325300', N'文成县', N'WEN2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'958', N'330329', N'3', N'325500', N'泰顺县', N'TAI4 SHUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'959', N'330381', N'3', N'325200', N'瑞安市', N'RUI4 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'960', N'330382', N'3', N'325600', N'乐清市', N'LE4 QING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'961', N'330400', N'2', N'314000', N'嘉兴市', N'JIA1 XING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'962', N'330402', N'3', N'314001', N'南湖区', N'NAN2 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'963', N'330411', N'3', N'314001', N'秀洲区', N'XIU4 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'964', N'330421', N'3', N'314100', N'嘉善县', N'JIA1 SHAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'965', N'330424', N'3', N'314300', N'海盐县', N'HAI3 YAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'966', N'330481', N'3', N'314400', N'海宁市', N'HAI3 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'967', N'330482', N'3', N'314200', N'平湖市', N'PING2 HU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'968', N'330483', N'3', N'314500', N'桐乡市', N'TONG2 XIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'969', N'330500', N'2', N'313000', N'湖州市', N'HU2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'970', N'330502', N'3', N'313000', N'吴兴区', N'WU2 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'971', N'330503', N'3', N'313009', N'南浔区', N'NAN2 XUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'972', N'330521', N'3', N'313200', N'德清县', N'DE2 QING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'973', N'330522', N'3', N'313100', N'长兴县', N'CHANG2 XING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'974', N'330523', N'3', N'313300', N'安吉县', N'AN1 JI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'975', N'330600', N'2', N'312000', N'绍兴市', N'SHAO4 XING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'976', N'330602', N'3', N'312000', N'越城区', N'YUE4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'977', N'330603', N'3', N'312000', N'柯桥区', N'KE1 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'978', N'330604', N'3', N'312300', N'上虞区', N'SHANG3 YU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'979', N'330624', N'3', N'312500', N'新昌县', N'XIN1 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'980', N'330681', N'3', N'311800', N'诸暨市', N'ZHU1 JI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'981', N'330683', N'3', N'312400', N'嵊州市', N'SHENG4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'982', N'330700', N'2', N'321000', N'金华市', N'JIN1 HUA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'983', N'330702', N'3', N'321000', N'婺城区', N'WU4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'984', N'330703', N'3', N'321000', N'金东区', N'JIN1 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'985', N'330723', N'3', N'321200', N'武义县', N'WU3 YI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'986', N'330726', N'3', N'322200', N'浦江县', N'PU3 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'987', N'330727', N'3', N'322300', N'磐安县', N'PAN2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'988', N'330781', N'3', N'321100', N'兰溪市', N'LAN2 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'989', N'330782', N'3', N'322000', N'义乌市', N'YI2 WU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'990', N'330783', N'3', N'322100', N'东阳市', N'DONG1 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'991', N'330784', N'3', N'321300', N'永康市', N'YONG3 KANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'992', N'330800', N'2', N'324000', N'衢州市', N'QU2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'993', N'330802', N'3', N'324100', N'柯城区', N'KE1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'994', N'330803', N'3', N'324022', N'衢江区', N'QU2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'995', N'330822', N'3', N'324200', N'常山县', N'CHANG2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'996', N'330824', N'3', N'324300', N'开化县', N'KAI1 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'997', N'330825', N'3', N'324400', N'龙游县', N'LONG2 YOU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'998', N'330881', N'3', N'324100', N'江山市', N'JIANG1 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'999', N'330900', N'2', N'316000', N'舟山市', N'ZHOU1 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1000', N'330902', N'3', N'316000', N'定海区', N'DING4 HAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1001', N'330903', N'3', N'316100', N'普陀区', N'PU3 TUO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1002', N'330921', N'3', N'316200', N'岱山县', N'DAI4 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1003', N'330922', N'3', N'202450', N'嵊泗县', N'SHENG4 SI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1004', N'331000', N'2', N'318000', N'台州市', N'TAI1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1005', N'331002', N'3', N'318000', N'椒江区', N'JIAO1 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1006', N'331003', N'3', N'318020', N'黄岩区', N'HUANG2 YAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1007', N'331004', N'3', N'318050', N'路桥区', N'LU4 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1008', N'331022', N'3', N'317100', N'三门县', N'SAN1 MEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1009', N'331023', N'3', N'317200', N'天台县', N'TIAN1 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1010', N'331024', N'3', N'317300', N'仙居县', N'XIAN1 JU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1011', N'331081', N'3', N'317500', N'温岭市', N'WEN1 LING3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1012', N'331082', N'3', N'317000', N'临海市', N'LIN2 HAI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1013', N'331083', N'3', N'317600', N'玉环市', N'YU4 HUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1014', N'331100', N'2', N'323000', N'丽水市', N'LI2 SHUI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1015', N'331102', N'3', N'323000', N'莲都区', N'LIAN2 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1016', N'331121', N'3', N'323900', N'青田县', N'QING1 TIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1017', N'331122', N'3', N'321400', N'缙云县', N'JIN4 YUN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1018', N'331123', N'3', N'323300', N'遂昌县', N'SUI2 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1019', N'331124', N'3', N'323400', N'松阳县', N'SONG1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1020', N'331125', N'3', N'323600', N'云和县', N'YUN2 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1021', N'331126', N'3', N'323800', N'庆元县', N'QING4 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1022', N'331127', N'3', N'323500', N'景宁畲族自治县', N'JING3 NING2 SHE1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1023', N'331181', N'3', N'323700', N'龙泉市', N'LONG2 QUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1024', N'340000', N'1', N'0', N'安徽省', N'AN1 HUI1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1025', N'340100', N'2', N'230000', N'合肥市', N'GE3 FEI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1026', N'340102', N'3', N'230011', N'瑶海区', N'YAO2 HAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1027', N'340103', N'3', N'230001', N'庐阳区', N'LU2 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1028', N'340104', N'3', N'230031', N'蜀山区', N'SHU3 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1029', N'340111', N'3', N'230041', N'包河区', N'BAO1 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1030', N'340121', N'3', N'231100', N'长丰县', N'CHANG2 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1031', N'340122', N'3', N'231600', N'肥东县', N'FEI2 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1032', N'340123', N'3', N'231200', N'肥西县', N'FEI2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1033', N'340124', N'3', N'231500', N'庐江县', N'LU2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1034', N'340181', N'3', N'238000', N'巢湖市', N'CHAO2 HU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1035', N'340200', N'2', N'241000', N'芜湖市', N'WU2 HU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1036', N'340202', N'3', N'241000', N'镜湖区', N'JING4 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1037', N'340203', N'3', N'241000', N'弋江区', N'YI4 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1038', N'340207', N'3', N'241000', N'鸠江区', N'JIU1 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1039', N'340208', N'3', N'241000', N'三山区', N'SAN1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1040', N'340221', N'3', N'241100', N'芜湖县', N'WU2 HU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1041', N'340222', N'3', N'241200', N'繁昌县', N'FAN2 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1042', N'340223', N'3', N'242400', N'南陵县', N'NAN2 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1043', N'340225', N'3', N'238300', N'无为县', N'MO2 WEI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1044', N'340300', N'2', N'233000', N'蚌埠市', N'BANG4 BU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1045', N'340302', N'3', N'233000', N'龙子湖区', N'LONG2 ZI3 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1046', N'340303', N'3', N'233000', N'蚌山区', N'BANG4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1047', N'340304', N'3', N'233000', N'禹会区', N'YU3 HUI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1048', N'340311', N'3', N'233000', N'淮上区', N'HUAI2 SHANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1049', N'340321', N'3', N'233400', N'怀远县', N'HUAI2 YUAN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1050', N'340322', N'3', N'233300', N'五河县', N'WU3 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1051', N'340323', N'3', N'233700', N'固镇县', N'GU4 ZHEN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1052', N'340400', N'2', N'232000', N'淮南市', N'HUAI2 NAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1053', N'340402', N'3', N'232033', N'大通区', N'DA4 TONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1054', N'340403', N'3', N'232000', N'田家庵区', N'TIAN2 GU1 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1055', N'340404', N'3', N'232052', N'谢家集区', N'XIE4 GU1 JI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1056', N'340405', N'3', N'232072', N'八公山区', N'BA1 GONG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1057', N'340406', N'3', N'232082', N'潘集区', N'PAN1 JI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1058', N'340421', N'3', N'232100', N'凤台县', N'FENG4 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1059', N'340422', N'3', N'232100', N'寿县', N'SHOU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1060', N'340500', N'2', N'243000', N'马鞍山市', N'MA3 AN1 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1061', N'340503', N'3', N'243000', N'花山区', N'HUA1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1062', N'340504', N'3', N'243071', N'雨山区', N'YU3 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1063', N'340506', N'3', N'243000', N'博望区', N'BO2 WANG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1064', N'340521', N'3', N'243100', N'当涂县', N'DANG1 TU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1065', N'340522', N'3', N'238100', N'含山县', N'HAN2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1066', N'340523', N'3', N'238200', N'和县', N'HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1067', N'340600', N'2', N'235000', N'淮北市', N'HUAI2 BEI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1068', N'340602', N'3', N'235000', N'杜集区', N'DU4 JI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1069', N'340603', N'3', N'235000', N'相山区', N'XIANG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1070', N'340604', N'3', N'235000', N'烈山区', N'LIE4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1071', N'340621', N'3', N'235100', N'濉溪县', N'SUI1 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1072', N'340700', N'2', N'244000', N'铜陵市', N'TONG2 LING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1073', N'340705', N'3', N'244000', N'铜官区', N'TONG2 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1074', N'340706', N'3', N'244000', N'义安区', N'YI2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1075', N'340711', N'3', N'244000', N'郊区', N'JIAO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1076', N'340722', N'3', N'244100', N'枞阳县', N'CONG1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1077', N'340800', N'2', N'246000', N'安庆市', N'AN1 QING4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1078', N'340802', N'3', N'246001', N'迎江区', N'YING2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1079', N'340803', N'3', N'246002', N'大观区', N'DA4 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1080', N'340811', N'3', N'246003', N'宜秀区', N'YI2 XIU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1081', N'340822', N'3', N'246100', N'怀宁县', N'HUAI2 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1082', N'340824', N'3', N'246300', N'潜山县', N'QIAN2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1083', N'340825', N'3', N'246400', N'太湖县', N'TAI4 HU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1084', N'340826', N'3', N'246500', N'宿松县', N'SU4 SONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1085', N'340827', N'3', N'246200', N'望江县', N'WANG4 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1086', N'340828', N'3', N'246600', N'岳西县', N'YUE4 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1087', N'340881', N'3', N'231400', N'桐城市', N'TONG2 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1088', N'341000', N'2', N'245000', N'黄山市', N'HUANG2 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1089', N'341002', N'3', N'245000', N'屯溪区', N'TUN2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1090', N'341003', N'3', N'242700', N'黄山区', N'HUANG2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1091', N'341004', N'3', N'245061', N'徽州区', N'HUI1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1092', N'341021', N'3', N'245200', N'歙县', N'SHE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1093', N'341022', N'3', N'245400', N'休宁县', N'XIU1 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1094', N'341023', N'3', N'245500', N'黟县', N'YI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1095', N'341024', N'3', N'245600', N'祁门县', N'QI2 MEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1096', N'341100', N'2', N'239000', N'滁州市', N'CHU2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1097', N'341102', N'3', N'239000', N'琅琊区', N'LANG2 YA2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1098', N'341103', N'3', N'239000', N'南谯区', N'NAN2 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1099', N'341122', N'3', N'239200', N'来安县', N'LAI2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1100', N'341124', N'3', N'239500', N'全椒县', N'QUAN2 JIAO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1101', N'341125', N'3', N'233200', N'定远县', N'DING4 YUAN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1102', N'341126', N'3', N'233100', N'凤阳县', N'FENG4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1103', N'341181', N'3', N'239300', N'天长市', N'TIAN1 CHANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1104', N'341182', N'3', N'239400', N'明光市', N'MING2 GUANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1105', N'341200', N'2', N'236000', N'阜阳市', N'FU4 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1106', N'341202', N'3', N'236001', N'颍州区', N'YING3 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1107', N'341203', N'3', N'236058', N'颍东区', N'YING3 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1108', N'341204', N'3', N'236045', N'颍泉区', N'YING3 QUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1109', N'341221', N'3', N'236400', N'临泉县', N'LIN2 QUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1110', N'341222', N'3', N'236600', N'太和县', N'TAI4 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1111', N'341225', N'3', N'236300', N'阜南县', N'FU4 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1112', N'341226', N'3', N'236200', N'颍上县', N'YING3 SHANG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1113', N'341282', N'3', N'236500', N'界首市', N'JIE4 SHOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1114', N'341300', N'2', N'234000', N'宿州市', N'SU4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1115', N'341302', N'3', N'234000', N'埇桥区', N'YONG3 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1116', N'341321', N'3', N'235300', N'砀山县', N'DANG4 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1117', N'341322', N'3', N'235200', N'萧县', N'XIAO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1118', N'341323', N'3', N'234200', N'灵璧县', N'LING2 BI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1119', N'341324', N'3', N'234300', N'泗县', N'SI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1120', N'341500', N'2', N'237000', N'六安市', N'LIU4 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1121', N'341502', N'3', N'237000', N'金安区', N'JIN1 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1122', N'341503', N'3', N'237010', N'裕安区', N'YU4 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1123', N'341504', N'3', N'237431', N'叶集区', N'XIE2 JI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1124', N'341522', N'3', N'237400', N'霍邱县', N'HUO4 QIU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1125', N'341523', N'3', N'231300', N'舒城县', N'SHU1 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1126', N'341524', N'3', N'237300', N'金寨县', N'JIN1 ZHAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1127', N'341525', N'3', N'237200', N'霍山县', N'HUO4 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1128', N'341600', N'2', N'236000', N'亳州市', N'BO2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1129', N'341602', N'3', N'236800', N'谯城区', N'QIAO2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1130', N'341621', N'3', N'233600', N'涡阳县', N'GUO1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1131', N'341622', N'3', N'233500', N'蒙城县', N'MENG1 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1132', N'341623', N'3', N'236700', N'利辛县', N'LI4 XIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1133', N'341700', N'2', N'247100', N'池州市', N'CHI2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1134', N'341702', N'3', N'247100', N'贵池区', N'GUI4 CHI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1135', N'341721', N'3', N'247200', N'东至县', N'DONG1 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1136', N'341722', N'3', N'245100', N'石台县', N'SHI2 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1137', N'341723', N'3', N'242800', N'青阳县', N'QING1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1138', N'341800', N'2', N'242000', N'宣城市', N'XUAN1 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1139', N'341802', N'3', N'242000', N'宣州区', N'XUAN1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1140', N'341821', N'3', N'242100', N'郎溪县', N'LANG2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1141', N'341822', N'3', N'242200', N'广德县', N'GUANG3 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1142', N'341823', N'3', N'242500', N'泾县', N'JING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1143', N'341824', N'3', N'245300', N'绩溪县', N'JI4 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1144', N'341825', N'3', N'242600', N'旌德县', N'JING1 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1145', N'341881', N'3', N'242300', N'宁国市', N'NING2 GUO2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1146', N'350000', N'1', N'0', N'福建省', N'FU2 JIAN4 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1147', N'350100', N'2', N'350000', N'福州市', N'FU2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1148', N'350102', N'3', N'350001', N'鼓楼区', N'GU3 LOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1149', N'350103', N'3', N'350004', N'台江区', N'TAI1 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1150', N'350104', N'3', N'350007', N'仓山区', N'CANG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1151', N'350105', N'3', N'350015', N'马尾区', N'MA3 WEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1152', N'350111', N'3', N'350011', N'晋安区', N'JIN4 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1153', N'350112', N'3', N'350200', N'长乐区', N'CHANG2 LE4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1154', N'350121', N'3', N'350100', N'闽侯县', N'MIN3 HOU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1155', N'350122', N'3', N'350500', N'连江县', N'LIAN2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1156', N'350123', N'3', N'350600', N'罗源县', N'LUO2 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1157', N'350124', N'3', N'350800', N'闽清县', N'MIN3 QING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1158', N'350125', N'3', N'350700', N'永泰县', N'YONG3 TAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1159', N'350128', N'3', N'350400', N'平潭县', N'PING2 TAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1160', N'350181', N'3', N'350300', N'福清市', N'FU2 QING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1161', N'350200', N'2', N'361000', N'厦门市', N'SHA4 MEN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1162', N'350203', N'3', N'361001', N'思明区', N'SAI1 MING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1163', N'350205', N'3', N'361026', N'海沧区', N'HAI3 CANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1164', N'350206', N'3', N'361006', N'湖里区', N'HU2 LI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1165', N'350211', N'3', N'361021', N'集美区', N'JI2 MEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1166', N'350212', N'3', N'361100', N'同安区', N'TONG2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1167', N'350213', N'3', N'361101', N'翔安区', N'XIANG2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1168', N'350300', N'2', N'351100', N'莆田市', N'PU2 TIAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1169', N'350302', N'3', N'351100', N'城厢区', N'CHENG2 XIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1170', N'350303', N'3', N'351111', N'涵江区', N'HAN2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1171', N'350304', N'3', N'351100', N'荔城区', N'LI4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1172', N'350305', N'3', N'351152', N'秀屿区', N'XIU4 YU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1173', N'350322', N'3', N'351200', N'仙游县', N'XIAN1 YOU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1174', N'350400', N'2', N'365000', N'三明市', N'SAN1 MING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1175', N'350402', N'3', N'365000', N'梅列区', N'MEI2 LIE4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1176', N'350403', N'3', N'365001', N'三元区', N'SAN1 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1177', N'350421', N'3', N'365200', N'明溪县', N'MING2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1178', N'350423', N'3', N'365300', N'清流县', N'QING1 LIU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1179', N'350424', N'3', N'365400', N'宁化县', N'NING2 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1180', N'350425', N'3', N'366100', N'大田县', N'DA4 TIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1181', N'350426', N'3', N'365100', N'尤溪县', N'YOU2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1182', N'350427', N'3', N'365500', N'沙县', N'SHA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1183', N'350428', N'3', N'353300', N'将乐县', N'JIANG1 LE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1184', N'350429', N'3', N'354400', N'泰宁县', N'TAI4 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1185', N'350430', N'3', N'354500', N'建宁县', N'JIAN4 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1186', N'350481', N'3', N'366000', N'永安市', N'YONG3 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1187', N'350500', N'2', N'362000', N'泉州市', N'QUAN2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1188', N'350502', N'3', N'362000', N'鲤城区', N'LI3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1189', N'350503', N'3', N'362000', N'丰泽区', N'FENG1 ZE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1190', N'350504', N'3', N'362011', N'洛江区', N'LUO4 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1191', N'350505', N'3', N'362114', N'泉港区', N'QUAN2 GANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1192', N'350521', N'3', N'362100', N'惠安县', N'HUI4 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1193', N'350524', N'3', N'362400', N'安溪县', N'AN1 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1194', N'350525', N'3', N'362600', N'永春县', N'YONG3 CHUN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1195', N'350526', N'3', N'362500', N'德化县', N'DE2 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1196', N'350527', N'3', N'362000', N'金门县', N'JIN1 MEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1197', N'350581', N'3', N'362700', N'石狮市', N'SHI2 SHI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1198', N'350582', N'3', N'362200', N'晋江市', N'JIN4 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1199', N'350583', N'3', N'362300', N'南安市', N'NAN2 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1200', N'350600', N'2', N'363000', N'漳州市', N'ZHANG1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1201', N'350602', N'3', N'363000', N'芗城区', N'XIANG1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1202', N'350603', N'3', N'363005', N'龙文区', N'LONG2 WEN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1203', N'350622', N'3', N'363300', N'云霄县', N'YUN2 XIAO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1204', N'350623', N'3', N'363200', N'漳浦县', N'ZHANG1 PU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1205', N'350624', N'3', N'363500', N'诏安县', N'ZHAO4 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1206', N'350625', N'3', N'363900', N'长泰县', N'CHANG2 TAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1207', N'350626', N'3', N'363400', N'东山县', N'DONG1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1208', N'350627', N'3', N'363600', N'南靖县', N'NAN2 JING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1209', N'350628', N'3', N'363700', N'平和县', N'PING2 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1210', N'350629', N'3', N'363800', N'华安县', N'HUA1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1211', N'350681', N'3', N'363100', N'龙海市', N'LONG2 HAI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1212', N'350700', N'2', N'353000', N'南平市', N'NAN2 PING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1213', N'350702', N'3', N'353000', N'延平区', N'YAN2 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1214', N'350703', N'3', N'354200', N'建阳区', N'JIAN4 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1215', N'350721', N'3', N'353200', N'顺昌县', N'SHUN4 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1216', N'350722', N'3', N'353400', N'浦城县', N'PU3 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1217', N'350723', N'3', N'354100', N'光泽县', N'GUANG1 ZE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1218', N'350724', N'3', N'353500', N'松溪县', N'SONG1 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1219', N'350725', N'3', N'353600', N'政和县', N'ZHENG4 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1220', N'350781', N'3', N'354000', N'邵武市', N'SHAO4 WU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1221', N'350782', N'3', N'354300', N'武夷山市', N'WU3 YI2 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1222', N'350783', N'3', N'353100', N'建瓯市', N'JIAN4 OU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1223', N'350800', N'2', N'364000', N'龙岩市', N'LONG2 YAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1224', N'350802', N'3', N'364000', N'新罗区', N'XIN1 LUO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1225', N'350803', N'3', N'427000', N'永定区', N'YONG3 DING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1226', N'350821', N'3', N'366300', N'长汀县', N'CHANG2 TING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1227', N'350823', N'3', N'364200', N'上杭县', N'SHANG3 HANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1228', N'350824', N'3', N'364300', N'武平县', N'WU3 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1229', N'350825', N'3', N'366200', N'连城县', N'LIAN2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1230', N'350881', N'3', N'364400', N'漳平市', N'ZHANG1 PING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1231', N'350900', N'2', N'352000', N'宁德市', N'NING2 DE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1232', N'350902', N'3', N'352100', N'蕉城区', N'JIAO1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1233', N'350921', N'3', N'355100', N'霞浦县', N'XIA2 PU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1234', N'350922', N'3', N'352200', N'古田县', N'GU3 TIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1235', N'350923', N'3', N'352300', N'屏南县', N'BING1 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1236', N'350924', N'3', N'355500', N'寿宁县', N'SHOU4 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1237', N'350925', N'3', N'355400', N'周宁县', N'ZHOU1 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1238', N'350926', N'3', N'355300', N'柘荣县', N'ZHE4 RONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1239', N'350981', N'3', N'355000', N'福安市', N'FU2 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1240', N'350982', N'3', N'355200', N'福鼎市', N'FU2 DING3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1241', N'360000', N'1', N'0', N'江西省', N'JIANG1 XI1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1242', N'360100', N'2', N'330000', N'南昌市', N'NAN2 CHANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1243', N'360102', N'3', N'330006', N'东湖区', N'DONG1 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1244', N'360103', N'3', N'330009', N'西湖区', N'XI1 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1245', N'360104', N'3', N'330001', N'青云谱区', N'QING1 YUN2 PU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1246', N'360105', N'3', N'330004', N'湾里区', N'WAN1 LI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1247', N'360111', N'3', N'330029', N'青山湖区', N'QING1 SHAN1 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1248', N'360112', N'3', N'330100', N'新建区', N'XIN1 JIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1249', N'360121', N'3', N'330200', N'南昌县', N'NAN2 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1250', N'360123', N'3', N'330500', N'安义县', N'AN1 YI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1251', N'360124', N'3', N'331700', N'进贤县', N'JIN4 XIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1252', N'360200', N'2', N'333000', N'景德镇市', N'JING3 DE2 ZHEN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1253', N'360202', N'3', N'333000', N'昌江区', N'CHANG1 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1254', N'360203', N'3', N'333000', N'珠山区', N'ZHU1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1255', N'360222', N'3', N'333400', N'浮梁县', N'FU2 LIANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1256', N'360281', N'3', N'333300', N'乐平市', N'LE4 PING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1257', N'360300', N'2', N'337000', N'萍乡市', N'PING2 XIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1258', N'360302', N'3', N'337000', N'安源区', N'AN1 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1259', N'360313', N'3', N'337016', N'湘东区', N'XIANG1 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1260', N'360321', N'3', N'337100', N'莲花县', N'LIAN2 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1261', N'360322', N'3', N'337009', N'上栗县', N'SHANG3 LI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1262', N'360323', N'3', N'337053', N'芦溪县', N'LU2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1263', N'360400', N'2', N'332000', N'九江市', N'JIU3 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1264', N'360402', N'3', N'332005', N'濂溪区', N'LIAN2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1265', N'360403', N'3', N'332000', N'浔阳区', N'XUN2 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1266', N'360404', N'3', N'332100', N'柴桑区', N'CHAI2 SANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1267', N'360423', N'3', N'332300', N'武宁县', N'WU3 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1268', N'360424', N'3', N'332400', N'修水县', N'XIU1 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1269', N'360425', N'3', N'330300', N'永修县', N'YONG3 XIU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1270', N'360426', N'3', N'330400', N'德安县', N'DE2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1271', N'360428', N'3', N'332600', N'都昌县', N'DOU1 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1272', N'360429', N'3', N'332500', N'湖口县', N'HU2 KOU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1273', N'360430', N'3', N'332700', N'彭泽县', N'PENG2 ZE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1274', N'360481', N'3', N'332200', N'瑞昌市', N'RUI4 CHANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1275', N'360482', N'3', N'332020', N'共青城市', N'GONG1 QING1 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1276', N'360483', N'3', N'332020', N'庐山市', N'LU2 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1277', N'360500', N'2', N'336500', N'新余市', N'XIN1 YU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1278', N'360502', N'3', N'338025', N'渝水区', N'YU2 SHUI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1279', N'360521', N'3', N'336600', N'分宜县', N'FEN1 YI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1280', N'360600', N'2', N'335000', N'鹰潭市', N'YING1 TAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1281', N'360602', N'3', N'335000', N'月湖区', N'YUE4 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1282', N'360622', N'3', N'335200', N'余江区', N'YU2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1283', N'360681', N'3', N'335400', N'贵溪市', N'GUI4 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1284', N'360700', N'2', N'341000', N'赣州市', N'GAN4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1285', N'360702', N'3', N'341000', N'章贡区', N'ZHANG1 GONG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1286', N'360703', N'3', N'341400', N'南康区', N'NAN2 KANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1287', N'360704', N'3', N'341100', N'赣县区', N'GAN4 XIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1288', N'360722', N'3', N'341600', N'信丰县', N'XIN4 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1289', N'360723', N'3', N'341500', N'大余县', N'DA4 YU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1290', N'360724', N'3', N'341200', N'上犹县', N'SHANG3 YOU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1291', N'360725', N'3', N'341300', N'崇义县', N'CHONG2 YI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1292', N'360726', N'3', N'342100', N'安远县', N'AN1 YUAN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1293', N'360727', N'3', N'341700', N'龙南县', N'LONG2 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1294', N'360728', N'3', N'341900', N'定南县', N'DING4 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1295', N'360729', N'3', N'341800', N'全南县', N'QUAN2 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1296', N'360730', N'3', N'342800', N'宁都县', N'NING2 DOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1297', N'360731', N'3', N'342300', N'于都县', N'YU2 DOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1298', N'360732', N'3', N'342400', N'兴国县', N'XING1 GUO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1299', N'360733', N'3', N'342600', N'会昌县', N'HUI4 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1300', N'360734', N'3', N'342200', N'寻乌县', N'XUN2 WU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1301', N'360735', N'3', N'342700', N'石城县', N'SHI2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1302', N'360781', N'3', N'342500', N'瑞金市', N'RUI4 JIN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1303', N'360800', N'2', N'343000', N'吉安市', N'JI2 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1304', N'360802', N'3', N'343000', N'吉州区', N'JI2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1305', N'360803', N'3', N'343009', N'青原区', N'QING1 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1306', N'360821', N'3', N'343100', N'吉安县', N'JI2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1307', N'360822', N'3', N'331600', N'吉水县', N'JI2 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1308', N'360823', N'3', N'331400', N'峡江县', N'XIA2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1309', N'360824', N'3', N'331300', N'新干县', N'XIN1 GAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1310', N'360825', N'3', N'331500', N'永丰县', N'YONG3 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1311', N'360826', N'3', N'343700', N'泰和县', N'TAI4 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1312', N'360827', N'3', N'343900', N'遂川县', N'SUI2 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1313', N'360828', N'3', N'343800', N'万安县', N'MO4 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1314', N'360829', N'3', N'343200', N'安福县', N'AN1 FU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1315', N'360830', N'3', N'343400', N'永新县', N'YONG3 XIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1316', N'360881', N'3', N'343600', N'井冈山市', N'JING3 GANG1 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1317', N'360900', N'2', N'336000', N'宜春市', N'YI2 CHUN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1318', N'360902', N'3', N'336000', N'袁州区', N'YUAN2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1319', N'360921', N'3', N'330700', N'奉新县', N'FENG4 XIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1320', N'360922', N'3', N'336100', N'万载县', N'MO4 ZAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1321', N'360923', N'3', N'336400', N'上高县', N'SHANG3 GAO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1322', N'360924', N'3', N'336300', N'宜丰县', N'YI2 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1323', N'360925', N'3', N'330600', N'靖安县', N'JING4 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1324', N'360926', N'3', N'336200', N'铜鼓县', N'TONG2 GU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1325', N'360981', N'3', N'331100', N'丰城市', N'FENG1 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1326', N'360982', N'3', N'331200', N'樟树市', N'ZHANG1 SHU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1327', N'360983', N'3', N'330800', N'高安市', N'GAO1 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1328', N'361000', N'2', N'344000', N'抚州市', N'FU3 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1329', N'361002', N'3', N'344100', N'临川区', N'LIN2 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1330', N'361003', N'3', N'331800', N'东乡区', N'DONG1 XIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1331', N'361021', N'3', N'344700', N'南城县', N'NAN2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1332', N'361022', N'3', N'344600', N'黎川县', N'LI2 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1333', N'361023', N'3', N'344500', N'南丰县', N'NAN2 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1334', N'361024', N'3', N'344200', N'崇仁县', N'CHONG2 REN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1335', N'361025', N'3', N'344300', N'乐安县', N'LE4 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1336', N'361026', N'3', N'344400', N'宜黄县', N'YI2 HUANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1337', N'361027', N'3', N'344800', N'金溪县', N'JIN1 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1338', N'361028', N'3', N'335300', N'资溪县', N'ZI1 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1339', N'361030', N'3', N'344900', N'广昌县', N'GUANG3 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1340', N'361100', N'2', N'334000', N'上饶市', N'SHANG3 RAO2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1341', N'361102', N'3', N'334000', N'信州区', N'XIN4 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1342', N'361103', N'3', N'334600', N'广丰区', N'GUANG3 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1343', N'361121', N'3', N'334100', N'上饶县', N'SHANG3 RAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1344', N'361123', N'3', N'334700', N'玉山县', N'YU4 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1345', N'361124', N'3', N'334500', N'铅山县', N'QIAN1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1346', N'361125', N'3', N'334300', N'横峰县', N'HENG2 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1347', N'361126', N'3', N'334400', N'弋阳县', N'YI4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1348', N'361127', N'3', N'335100', N'余干县', N'YU2 GAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1349', N'361128', N'3', N'333100', N'鄱阳县', N'PO2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1350', N'361129', N'3', N'335500', N'万年县', N'MO4 NIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1351', N'361130', N'3', N'333200', N'婺源县', N'WU4 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1352', N'361181', N'3', N'334200', N'德兴市', N'DE2 XING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1353', N'370000', N'1', N'0', N'山东省', N'SHAN1 DONG1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1354', N'370100', N'2', N'250000', N'济南市', N'JI3 NAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1355', N'370102', N'3', N'250014', N'历下区', N'LI4 XIA4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1356', N'370103', N'3', N'250001', N'市中区', N'SHI4 ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1357', N'370104', N'3', N'250022', N'槐荫区', N'HUAI2 YIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1358', N'370105', N'3', N'250031', N'天桥区', N'TIAN1 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1359', N'370112', N'3', N'250100', N'历城区', N'LI4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1360', N'370113', N'3', N'250300', N'长清区', N'CHANG2 QING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1361', N'370114', N'3', N'250200', N'章丘区', N'ZHANG1 QIU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1362', N'370124', N'3', N'250400', N'平阴县', N'PING2 YIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1363', N'370125', N'3', N'251400', N'济阳县', N'JI3 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1364', N'370126', N'3', N'251600', N'商河县', N'SHANG1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1365', N'370200', N'2', N'266000', N'青岛市', N'QING1 DAO3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1366', N'370202', N'3', N'266001', N'市南区', N'SHI4 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1367', N'370203', N'3', N'266011', N'市北区', N'SHI4 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1368', N'370211', N'3', N'266500', N'黄岛区', N'HUANG2 DAO3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1369', N'370212', N'3', N'266100', N'崂山区', N'LAO2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1370', N'370213', N'3', N'266021', N'李沧区', N'LI3 CANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1371', N'370214', N'3', N'266041', N'城阳区', N'CHENG2 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1372', N'370215', N'3', N'266200', N'即墨区', N'JI2 MO4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1373', N'370281', N'3', N'266300', N'胶州市', N'JIAO1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1374', N'370283', N'3', N'266700', N'平度市', N'PING2 DU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1375', N'370285', N'3', N'266600', N'莱西市', N'LAI2 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1376', N'370300', N'2', N'255000', N'淄博市', N'ZI1 BO2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1377', N'370302', N'3', N'255100', N'淄川区', N'ZI1 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1378', N'370303', N'3', N'255022', N'张店区', N'ZHANG1 DIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1379', N'370304', N'3', N'255200', N'博山区', N'BO2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1380', N'370305', N'3', N'255400', N'临淄区', N'LIN2 ZI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1381', N'370306', N'3', N'255300', N'周村区', N'ZHOU1 CUN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1382', N'370321', N'3', N'256400', N'桓台县', N'HUAN2 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1383', N'370322', N'3', N'256300', N'高青县', N'GAO1 QING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1384', N'370323', N'3', N'256100', N'沂源县', N'YI2 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1385', N'370400', N'2', N'277000', N'枣庄市', N'ZAO3 ZHUANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1386', N'370402', N'3', N'277101', N'市中区', N'SHI4 ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1387', N'370403', N'3', N'277000', N'薛城区', N'XUE1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1388', N'370404', N'3', N'277300', N'峄城区', N'YI4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1389', N'370405', N'3', N'277400', N'台儿庄区', N'TAI1 ER2 ZHUANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1390', N'370406', N'3', N'277200', N'山亭区', N'SHAN1 TING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1391', N'370481', N'3', N'277500', N'滕州市', N'TENG2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1392', N'370500', N'2', N'257000', N'东营市', N'DONG1 YING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1393', N'370502', N'3', N'257029', N'东营区', N'DONG1 YING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1394', N'370503', N'3', N'257200', N'河口区', N'HE2 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1395', N'370505', N'3', N'257500', N'垦利区', N'KEN3 LI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1396', N'370522', N'3', N'257400', N'利津县', N'LI4 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1397', N'370523', N'3', N'257300', N'广饶县', N'GUANG3 RAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1398', N'370600', N'2', N'264000', N'烟台市', N'YAN1 TAI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1399', N'370602', N'3', N'264001', N'芝罘区', N'ZHI1 FU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1400', N'370611', N'3', N'265500', N'福山区', N'FU2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1401', N'370612', N'3', N'264100', N'牟平区', N'MOU2 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1402', N'370613', N'3', N'264600', N'莱山区', N'LAI2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1403', N'370634', N'3', N'265800', N'长岛县', N'CHANG2 DAO3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1404', N'370681', N'3', N'265700', N'龙口市', N'LONG2 KOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1405', N'370682', N'3', N'265200', N'莱阳市', N'LAI2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1406', N'370683', N'3', N'261400', N'莱州市', N'LAI2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1407', N'370684', N'3', N'265600', N'蓬莱市', N'PENG2 LAI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1408', N'370685', N'3', N'265400', N'招远市', N'QIAO2 YUAN3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1409', N'370686', N'3', N'265300', N'栖霞市', N'QI1 XIA2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1410', N'370687', N'3', N'265100', N'海阳市', N'HAI3 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1411', N'370700', N'2', N'261000', N'潍坊市', N'WEI2 FANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1412', N'370702', N'3', N'261021', N'潍城区', N'WEI2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1413', N'370703', N'3', N'261100', N'寒亭区', N'HAN2 TING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1414', N'370704', N'3', N'261200', N'坊子区', N'FANG1 ZI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1415', N'370705', N'3', N'261031', N'奎文区', N'KUI2 WEN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1416', N'370724', N'3', N'262600', N'临朐县', N'LIN2 QU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1417', N'370725', N'3', N'262400', N'昌乐县', N'CHANG1 LE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1418', N'370781', N'3', N'262500', N'青州市', N'QING1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1419', N'370782', N'3', N'262200', N'诸城市', N'ZHU1 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1420', N'370783', N'3', N'262700', N'寿光市', N'SHOU4 GUANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1421', N'370784', N'3', N'262100', N'安丘市', N'AN1 QIU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1422', N'370785', N'3', N'261500', N'高密市', N'GAO1 MI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1423', N'370786', N'3', N'261300', N'昌邑市', N'CHANG1 YI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1424', N'370800', N'2', N'272000', N'济宁市', N'JI3 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1425', N'370811', N'3', N'272113', N'任城区', N'REN2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1426', N'370812', N'3', N'272000', N'兖州区', N'YAN3 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1427', N'370826', N'3', N'277600', N'微山县', N'WEI1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1428', N'370827', N'3', N'272300', N'鱼台县', N'YU2 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1429', N'370828', N'3', N'272200', N'金乡县', N'JIN1 XIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1430', N'370829', N'3', N'272400', N'嘉祥县', N'JIA1 XIANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1431', N'370830', N'3', N'272501', N'汶上县', N'WEN4 SHANG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1432', N'370831', N'3', N'273200', N'泗水县', N'SI4 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1433', N'370832', N'3', N'272600', N'梁山县', N'LIANG2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1434', N'370881', N'3', N'273100', N'曲阜市', N'QU1 FU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1435', N'370883', N'3', N'273500', N'邹城市', N'JU4 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1436', N'370900', N'2', N'271000', N'泰安市', N'TAI4 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1437', N'370902', N'3', N'271000', N'泰山区', N'TAI4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1438', N'370911', N'3', N'271000', N'岱岳区', N'DAI4 YUE4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1439', N'370921', N'3', N'271400', N'宁阳县', N'NING2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1440', N'370923', N'3', N'271500', N'东平县', N'DONG1 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1441', N'370982', N'3', N'271200', N'新泰市', N'XIN1 TAI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1442', N'370983', N'3', N'271600', N'肥城市', N'FEI2 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1443', N'371000', N'2', N'264200', N'威海市', N'WEI1 HAI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1444', N'371002', N'3', N'264200', N'环翠区', N'HUAN2 CUI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1445', N'371003', N'3', N'264400', N'文登区', N'WEN2 DENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1446', N'371082', N'3', N'264300', N'荣成市', N'RONG2 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1447', N'371083', N'3', N'264500', N'乳山市', N'RU3 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1448', N'371100', N'2', N'276800', N'日照市', N'RI4 ZHAO4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1449', N'371102', N'3', N'276800', N'东港区', N'DONG1 GANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1450', N'371103', N'3', N'276808', N'岚山区', N'LAN2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1451', N'371121', N'3', N'272300', N'五莲县', N'WU3 LIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1452', N'371122', N'3', N'266500', N'莒县', N'JU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1453', N'371200', N'2', N'271100', N'莱芜市', N'LAI2 WU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1454', N'371202', N'3', N'271100', N'莱城区', N'LAI2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1455', N'371203', N'3', N'271100', N'钢城区', N'GANG1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1456', N'371300', N'2', N'276000', N'临沂市', N'LIN2 YI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1457', N'371302', N'3', N'276002', N'兰山区', N'LAN2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1458', N'371311', N'3', N'276022', N'罗庄区', N'LUO2 ZHUANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1459', N'371312', N'3', N'572000', N'河东区', N'HE2 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1460', N'371321', N'3', N'276300', N'沂南县', N'YI2 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1461', N'371322', N'3', N'276100', N'郯城县', N'TAN2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1462', N'371323', N'3', N'276400', N'沂水县', N'YI2 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1463', N'371324', N'3', N'277700', N'兰陵县', N'LAN2 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1464', N'371325', N'3', N'273400', N'费县', N'FEI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1465', N'371326', N'3', N'273300', N'平邑县', N'PING2 YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1466', N'371327', N'3', N'276600', N'莒南县', N'JU3 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1467', N'371328', N'3', N'276200', N'蒙阴县', N'MENG1 YIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1468', N'371329', N'3', N'276700', N'临沭县', N'LIN2 SHU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1469', N'371400', N'2', N'253000', N'德州市', N'DE2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1470', N'371402', N'3', N'253011', N'德城区', N'DE2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1471', N'371403', N'3', N'253500', N'陵城区', N'LING2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1472', N'371422', N'3', N'253400', N'宁津县', N'NING2 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1473', N'371423', N'3', N'253700', N'庆云县', N'QING4 YUN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1474', N'371424', N'3', N'251500', N'临邑县', N'LIN2 YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1475', N'371425', N'3', N'251100', N'齐河县', N'JI4 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1476', N'371426', N'3', N'253100', N'平原县', N'PING2 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1477', N'371427', N'3', N'253200', N'夏津县', N'XIA4 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1478', N'371428', N'3', N'253300', N'武城县', N'WU3 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1479', N'371481', N'3', N'253600', N'乐陵市', N'LE4 LING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1480', N'371482', N'3', N'251200', N'禹城市', N'YU3 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1481', N'371500', N'2', N'252000', N'聊城市', N'LIAO2 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1482', N'371502', N'3', N'252000', N'东昌府区', N'DONG1 CHANG1 FU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1483', N'371521', N'3', N'252300', N'阳谷县', N'YANG2 GU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1484', N'371522', N'3', N'252400', N'莘县', N'SHEN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1485', N'371523', N'3', N'252100', N'茌平县', N'CHI2 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1486', N'371524', N'3', N'252200', N'东阿县', N'DONG1 A1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1487', N'371525', N'3', N'252500', N'冠县', N'GUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1488', N'371526', N'3', N'252800', N'高唐县', N'GAO1 TANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1489', N'371581', N'3', N'252600', N'临清市', N'LIN2 QING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1490', N'371600', N'2', N'256600', N'滨州市', N'BIN1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1491', N'371602', N'3', N'256613', N'滨城区', N'BIN1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1492', N'371603', N'3', N'256800', N'沾化区', N'ZHAN1 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1493', N'371621', N'3', N'251700', N'惠民县', N'HUI4 MIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1494', N'371622', N'3', N'251800', N'阳信县', N'YANG2 XIN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1495', N'371623', N'3', N'251900', N'无棣县', N'MO2 DI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1496', N'371625', N'3', N'256500', N'博兴县', N'BO2 XING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1497', N'371626', N'3', N'256200', N'邹平县', N'JU4 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1498', N'371700', N'2', N'0', N'菏泽市', N'HE2 ZE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1499', N'371702', N'3', N'274009', N'牡丹区', N'MU3 DAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1500', N'371703', N'3', N'274100', N'定陶区', N'DING4 TAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1501', N'371721', N'3', N'274400', N'曹县', N'CAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1502', N'371722', N'3', N'274300', N'单县', N'CHAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1503', N'371723', N'3', N'274200', N'成武县', N'CHENG2 WU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1504', N'371724', N'3', N'274900', N'巨野县', N'JU4 YE3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1505', N'371725', N'3', N'274700', N'郓城县', N'YUN4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1506', N'371726', N'3', N'274600', N'鄄城县', N'JUAN4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1507', N'371728', N'3', N'274500', N'东明县', N'DONG1 MING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1508', N'410000', N'1', N'0', N'河南省', N'HE2 NAN2 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1509', N'410100', N'2', N'450000', N'郑州市', N'ZHENG4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1510', N'410102', N'3', N'450007', N'中原区', N'ZHONG1 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1511', N'410103', N'3', N'450052', N'二七区', N'ER4 QI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1512', N'410104', N'3', N'450000', N'管城回族区', N'GUAN3 CHENG2 HUI2 ZU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1513', N'410105', N'3', N'450003', N'金水区', N'JIN1 SHUI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1514', N'410106', N'3', N'450041', N'上街区', N'SHANG3 JIE1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1515', N'410108', N'3', N'450053', N'惠济区', N'HUI4 JI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1516', N'410122', N'3', N'451450', N'中牟县', N'ZHONG1 MOU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1517', N'410181', N'3', N'451200', N'巩义市', N'GONG3 YI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1518', N'410182', N'3', N'450100', N'荥阳市', N'XING2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1519', N'410183', N'3', N'452300', N'新密市', N'XIN1 MI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1520', N'410184', N'3', N'451100', N'新郑市', N'XIN1 ZHENG4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1521', N'410185', N'3', N'452470', N'登封市', N'DENG1 FENG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1522', N'410200', N'2', N'475000', N'开封市', N'KAI1 FENG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1523', N'410202', N'3', N'475000', N'龙亭区', N'LONG2 TING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1524', N'410203', N'3', N'475000', N'顺河回族区', N'SHUN4 HE2 HUI2 ZU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1525', N'410204', N'3', N'475000', N'鼓楼区', N'GU3 LOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1526', N'410205', N'3', N'475000', N'禹王台区', N'YU3 WANG2 TAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1527', N'410212', N'3', N'475100', N'祥符区', N'XIANG2 FU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1528', N'410221', N'3', N'475200', N'杞县', N'QI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1529', N'410222', N'3', N'452200', N'通许县', N'TONG1 HU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1530', N'410223', N'3', N'452100', N'尉氏县', N'WEI4 SHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1531', N'410225', N'3', N'475300', N'兰考县', N'LAN2 KAO3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1532', N'410300', N'2', N'471000', N'洛阳市', N'LUO4 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1533', N'410302', N'3', N'471002', N'老城区', N'LAO3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1534', N'410303', N'3', N'471000', N'西工区', N'XI1 GONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1535', N'410304', N'3', N'471002', N'瀍河回族区', N'CHAN2 HE2 HUI2 ZU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1536', N'410305', N'3', N'471003', N'涧西区', N'JIAN4 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1537', N'410306', N'3', N'471012', N'吉利区', N'JI2 LI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1538', N'410311', N'3', N'471000', N'洛龙区', N'LUO4 LONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1539', N'410322', N'3', N'471100', N'孟津县', N'MENG4 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1540', N'410323', N'3', N'471800', N'新安县', N'XIN1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1541', N'410324', N'3', N'471500', N'栾川县', N'LUAN2 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1542', N'410325', N'3', N'471400', N'嵩县', N'SONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1543', N'410326', N'3', N'471200', N'汝阳县', N'RU3 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1544', N'410327', N'3', N'471600', N'宜阳县', N'YI2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1545', N'410328', N'3', N'471700', N'洛宁县', N'LUO4 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1546', N'410329', N'3', N'471300', N'伊川县', N'YI1 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1547', N'410381', N'3', N'471900', N'偃师市', N'YAN3 SHI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1548', N'410400', N'2', N'467000', N'平顶山市', N'PING2 DING3 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1549', N'410402', N'3', N'467002', N'新华区', N'XIN1 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1550', N'410403', N'3', N'467021', N'卫东区', N'WEI4 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1551', N'410404', N'3', N'467045', N'石龙区', N'SHI2 LONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1552', N'410411', N'3', N'467000', N'湛河区', N'ZHAN4 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1553', N'410421', N'3', N'467400', N'宝丰县', N'BAO3 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1554', N'410422', N'3', N'467200', N'叶县', N'XIE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1555', N'410423', N'3', N'467300', N'鲁山县', N'LU3 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1556', N'410425', N'3', N'467100', N'郏县', N'JIA2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1557', N'410481', N'3', N'462500', N'舞钢市', N'WU3 GANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1558', N'410482', N'3', N'467500', N'汝州市', N'RU3 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1559', N'410500', N'2', N'0', N'安阳市', N'AN1 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1560', N'410502', N'3', N'455000', N'文峰区', N'WEN2 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1561', N'410503', N'3', N'455001', N'北关区', N'BEI3 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1562', N'410505', N'3', N'455004', N'殷都区', N'YAN1 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1563', N'410506', N'3', N'455001', N'龙安区', N'LONG2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1564', N'410522', N'3', N'455000', N'安阳县', N'AN1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1565', N'410523', N'3', N'456150', N'汤阴县', N'SHANG1 YIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1566', N'410526', N'3', N'456400', N'滑县', N'HUA2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1567', N'410527', N'3', N'456350', N'内黄县', N'NEI4 HUANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1568', N'410581', N'3', N'456500', N'林州市', N'LIN2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1569', N'410600', N'2', N'458000', N'鹤壁市', N'HE4 BI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1570', N'410602', N'3', N'458010', N'鹤山区', N'HE4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1571', N'410603', N'3', N'458000', N'山城区', N'SHAN1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1572', N'410611', N'3', N'458000', N'淇滨区', N'QI2 BIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1573', N'410621', N'3', N'456250', N'浚县', N'JUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1574', N'410622', N'3', N'456750', N'淇县', N'QI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1575', N'410700', N'2', N'453000', N'新乡市', N'XIN1 XIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1576', N'410702', N'3', N'453000', N'红旗区', N'GONG1 QI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1577', N'410703', N'3', N'453000', N'卫滨区', N'WEI4 BIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1578', N'410704', N'3', N'453011', N'凤泉区', N'FENG4 QUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1579', N'410711', N'3', N'453002', N'牧野区', N'MU4 YE3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1580', N'410721', N'3', N'453700', N'新乡县', N'XIN1 XIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1581', N'410724', N'3', N'453800', N'获嘉县', N'HUO4 JIA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1582', N'410725', N'3', N'453500', N'原阳县', N'YUAN2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1583', N'410726', N'3', N'453200', N'延津县', N'YAN2 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1584', N'410727', N'3', N'453300', N'封丘县', N'FENG1 QIU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1585', N'410728', N'3', N'453400', N'长垣县', N'CHANG2 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1586', N'410781', N'3', N'453100', N'卫辉市', N'WEI4 HUI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1587', N'410782', N'3', N'453600', N'辉县市', N'HUI1 XIAN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1588', N'410800', N'2', N'454150', N'焦作市', N'JIAO1 ZUO1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1589', N'410802', N'3', N'454000', N'解放区', N'JIE3 FANG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1590', N'410803', N'3', N'454191', N'中站区', N'ZHONG1 ZHAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1591', N'410804', N'3', N'454171', N'马村区', N'MA3 CUN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1592', N'410811', N'3', N'454002', N'山阳区', N'SHAN1 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1593', N'410821', N'3', N'454350', N'修武县', N'XIU1 WU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1594', N'410822', N'3', N'454450', N'博爱县', N'BO2 AI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1595', N'410823', N'3', N'454950', N'武陟县', N'WU3 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1596', N'410825', N'3', N'454850', N'温县', N'WEN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1597', N'410882', N'3', N'454550', N'沁阳市', N'QIN4 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1598', N'410883', N'3', N'454750', N'孟州市', N'MENG4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1599', N'410900', N'2', N'457000', N'濮阳市', N'PU2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1600', N'410902', N'3', N'457001', N'华龙区', N'HUA1 LONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1601', N'410922', N'3', N'457300', N'清丰县', N'QING1 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1602', N'410923', N'3', N'457400', N'南乐县', N'NAN2 LE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1603', N'410926', N'3', N'457500', N'范县', N'FAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1604', N'410927', N'3', N'457600', N'台前县', N'TAI1 QIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1605', N'410928', N'3', N'457100', N'濮阳县', N'PU2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1606', N'411000', N'2', N'461000', N'许昌市', N'HU3 CHANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1607', N'411002', N'3', N'461000', N'魏都区', N'WEI4 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1608', N'411003', N'3', N'461100', N'建安区', N'JIAN4 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1609', N'411024', N'3', N'461200', N'鄢陵县', N'YAN1 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1610', N'411025', N'3', N'461700', N'襄城县', N'XIANG1 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1611', N'411081', N'3', N'461670', N'禹州市', N'YU3 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1612', N'411082', N'3', N'461500', N'长葛市', N'CHANG2 GE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1613', N'411100', N'2', N'462000', N'漯河市', N'LUO4 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1614', N'411102', N'3', N'462000', N'源汇区', N'YUAN2 HUI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1615', N'411103', N'3', N'462300', N'郾城区', N'YAN3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1616', N'411104', N'3', N'462300', N'召陵区', N'SHAO4 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1617', N'411121', N'3', N'462400', N'舞阳县', N'WU3 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1618', N'411122', N'3', N'462600', N'临颍县', N'LIN2 YING3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1619', N'411200', N'2', N'472000', N'三门峡市', N'SAN1 MEN2 XIA2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1620', N'411202', N'3', N'472000', N'湖滨区', N'HU2 BIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1621', N'411203', N'3', N'472100', N'陕州区', N'SHAN3 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1622', N'411221', N'3', N'472400', N'渑池县', N'MIAN3 CHI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1623', N'411224', N'3', N'472200', N'卢氏县', N'LU2 SHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1624', N'411281', N'3', N'472300', N'义马市', N'YI2 MA3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1625', N'411282', N'3', N'472500', N'灵宝市', N'LING2 BAO3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1626', N'411300', N'2', N'473000', N'南阳市', N'NAN2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1627', N'411302', N'3', N'473001', N'宛城区', N'WAN3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1628', N'411303', N'3', N'473003', N'卧龙区', N'WO4 LONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1629', N'411321', N'3', N'474650', N'南召县', N'NAN2 SHAO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1630', N'411322', N'3', N'473200', N'方城县', N'FANG1 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1631', N'411323', N'3', N'474550', N'西峡县', N'XI1 XIA2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1632', N'411324', N'3', N'474250', N'镇平县', N'ZHEN1 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1633', N'411325', N'3', N'474350', N'内乡县', N'NEI4 XIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1634', N'411326', N'3', N'474450', N'淅川县', N'XI1 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1635', N'411327', N'3', N'473300', N'社旗县', N'SHE4 QI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1636', N'411328', N'3', N'473400', N'唐河县', N'TANG2 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1637', N'411329', N'3', N'473500', N'新野县', N'XIN1 YE3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1638', N'411330', N'3', N'474750', N'桐柏县', N'TONG2 BAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1639', N'411381', N'3', N'474150', N'邓州市', N'DENG4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1640', N'411400', N'2', N'476000', N'商丘市', N'SHANG1 QIU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1641', N'411402', N'3', N'476000', N'梁园区', N'LIANG2 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1642', N'411403', N'3', N'476100', N'睢阳区', N'SUI1 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1643', N'411421', N'3', N'476800', N'民权县', N'MIN2 QUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1644', N'411422', N'3', N'476900', N'睢县', N'SUI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1645', N'411423', N'3', N'476700', N'宁陵县', N'NING2 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1646', N'411424', N'3', N'476200', N'柘城县', N'ZHE4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1647', N'411425', N'3', N'476300', N'虞城县', N'YU2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1648', N'411426', N'3', N'476400', N'夏邑县', N'XIA4 YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1649', N'411481', N'3', N'476600', N'永城市', N'YONG3 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1650', N'411500', N'2', N'464000', N'信阳市', N'XIN4 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1651', N'411502', N'3', N'464000', N'浉河区', N'SHI1 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1652', N'411503', N'3', N'464100', N'平桥区', N'PING2 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1653', N'411521', N'3', N'464200', N'罗山县', N'LUO2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1654', N'411522', N'3', N'465450', N'光山县', N'GUANG1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1655', N'411523', N'3', N'465550', N'新县', N'XIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1656', N'411524', N'3', N'465350', N'商城县', N'SHANG1 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1657', N'411525', N'3', N'465250', N'固始县', N'GU4 SHI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1658', N'411526', N'3', N'465150', N'潢川县', N'HUANG2 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1659', N'411527', N'3', N'464400', N'淮滨县', N'HUAI2 BIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1660', N'411528', N'3', N'464300', N'息县', N'XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1661', N'411600', N'2', N'466000', N'周口市', N'ZHOU1 KOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1662', N'411602', N'3', N'466000', N'川汇区', N'CHUAN1 HUI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1663', N'411621', N'3', N'461300', N'扶沟县', N'FU2 GOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1664', N'411622', N'3', N'466600', N'西华县', N'XI1 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1665', N'411623', N'3', N'466100', N'商水县', N'SHANG1 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1666', N'411624', N'3', N'466300', N'沈丘县', N'SHEN3 QIU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1667', N'411625', N'3', N'477150', N'郸城县', N'DAN1 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1668', N'411626', N'3', N'477150', N'淮阳县', N'HUAI2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1669', N'411627', N'3', N'461400', N'太康县', N'TAI4 KANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1670', N'411628', N'3', N'477200', N'鹿邑县', N'LU4 YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1671', N'411681', N'3', N'466200', N'项城市', N'XIANG4 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1672', N'411700', N'2', N'463000', N'驻马店市', N'ZHU4 MA3 DIAN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1673', N'411702', N'3', N'463000', N'驿城区', N'YI4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1674', N'411721', N'3', N'463900', N'西平县', N'XI1 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1675', N'411722', N'3', N'463800', N'上蔡县', N'SHANG3 CAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1676', N'411723', N'3', N'463400', N'平舆县', N'PING2 YU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1677', N'411724', N'3', N'463600', N'正阳县', N'ZHENG1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1678', N'411725', N'3', N'463200', N'确山县', N'QUE4 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1679', N'411726', N'3', N'463700', N'泌阳县', N'BI4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1680', N'411727', N'3', N'463300', N'汝南县', N'RU3 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1681', N'411728', N'3', N'463100', N'遂平县', N'SUI2 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1682', N'411729', N'3', N'463500', N'新蔡县', N'XIN1 CAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1683', N'419000', N'2', N'0', N'省直辖县级行政区划', N'SHENG3 ZHI2 HE2 XIAN4 JI2 HANG2 ZHENG4 OU1 HUA2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1684', N'419001', N'3', N'454650', N'济源市', N'JI3 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1685', N'420000', N'1', N'0', N'湖北省', N'HU2 BEI3 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1686', N'420100', N'2', N'430000', N'武汉市', N'WU3 HAN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1687', N'420102', N'3', N'430014', N'江岸区', N'JIANG1 AN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1688', N'420103', N'3', N'430021', N'江汉区', N'JIANG1 HAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1689', N'420104', N'3', N'430033', N'硚口区', N'QIAO2 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1690', N'420105', N'3', N'430050', N'汉阳区', N'HAN4 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1691', N'420106', N'3', N'430061', N'武昌区', N'WU3 CHANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1692', N'420107', N'3', N'430080', N'青山区', N'QING1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1693', N'420111', N'3', N'430070', N'洪山区', N'HONG2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1694', N'420112', N'3', N'430040', N'东西湖区', N'DONG1 XI1 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1695', N'420113', N'3', N'430090', N'汉南区', N'HAN4 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1696', N'420114', N'3', N'430100', N'蔡甸区', N'CAI4 DIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1697', N'420115', N'3', N'430200', N'江夏区', N'JIANG1 XIA4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1698', N'420116', N'3', N'432200', N'黄陂区', N'HUANG2 BEI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1699', N'420117', N'3', N'431400', N'新洲区', N'XIN1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1700', N'420200', N'2', N'435000', N'黄石市', N'HUANG2 SHI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1701', N'420202', N'3', N'435000', N'黄石港区', N'HUANG2 SHI2 GANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1702', N'420203', N'3', N'435001', N'西塞山区', N'XI1 SAI1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1703', N'420204', N'3', N'435005', N'下陆区', N'XIA4 LIU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1704', N'420205', N'3', N'435006', N'铁山区', N'TIE3 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1705', N'420222', N'3', N'435200', N'阳新县', N'YANG2 XIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1706', N'420281', N'3', N'435100', N'大冶市', N'DA4 YE3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1707', N'420300', N'2', N'442000', N'十堰市', N'SHI2 YAN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1708', N'420302', N'3', N'442012', N'茅箭区', N'MAO2 JIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1709', N'420303', N'3', N'442001', N'张湾区', N'ZHANG1 WAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1710', N'420304', N'3', N'442500', N'郧阳区', N'YUN2 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1711', N'420322', N'3', N'442600', N'郧西县', N'YUN2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1712', N'420323', N'3', N'442200', N'竹山县', N'ZHU2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1713', N'420324', N'3', N'442300', N'竹溪县', N'ZHU2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1714', N'420325', N'3', N'442100', N'房县', N'FANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1715', N'420381', N'3', N'442700', N'丹江口市', N'DAN1 JIANG1 KOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1716', N'420500', N'2', N'443000', N'宜昌市', N'YI2 CHANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1717', N'420502', N'3', N'443000', N'西陵区', N'XI1 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1718', N'420503', N'3', N'443001', N'伍家岗区', N'WU3 GU1 GANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1719', N'420504', N'3', N'443006', N'点军区', N'DIAN3 JUN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1720', N'420505', N'3', N'443007', N'猇亭区', N'XIAO1 TING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1721', N'420506', N'3', N'443100', N'夷陵区', N'YI2 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1722', N'420525', N'3', N'444200', N'远安县', N'YUAN3 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1723', N'420526', N'3', N'443711', N'兴山县', N'XING1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1724', N'420527', N'3', N'443600', N'秭归县', N'ZI3 GUI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1725', N'420528', N'3', N'443500', N'长阳土家族自治县', N'CHANG2 YANG2 TU3 GU1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1726', N'420529', N'3', N'443400', N'五峰土家族自治县', N'WU3 FENG1 TU3 GU1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1727', N'420581', N'3', N'443300', N'宜都市', N'YI2 DOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1728', N'420582', N'3', N'444100', N'当阳市', N'DANG1 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1729', N'420583', N'3', N'443200', N'枝江市', N'ZHI1 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1730', N'420600', N'2', N'0', N'襄阳市', N'XIANG1 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1731', N'420602', N'3', N'441021', N'襄城区', N'XIANG1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1732', N'420606', N'3', N'441001', N'樊城区', N'FAN2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1733', N'420607', N'3', N'441000', N'襄州区', N'XIANG1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1734', N'420624', N'3', N'441500', N'南漳县', N'NAN2 ZHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1735', N'420625', N'3', N'441700', N'谷城县', N'GU3 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1736', N'420626', N'3', N'441600', N'保康县', N'BAO3 KANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1737', N'420682', N'3', N'441800', N'老河口市', N'LAO3 HE2 KOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1738', N'420683', N'3', N'441200', N'枣阳市', N'ZAO3 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1739', N'420684', N'3', N'441400', N'宜城市', N'YI2 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1740', N'420700', N'2', N'436000', N'鄂州市', N'E4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1741', N'420702', N'3', N'436064', N'梁子湖区', N'LIANG2 ZI3 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1742', N'420703', N'3', N'436030', N'华容区', N'HUA1 RONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1743', N'420704', N'3', N'436000', N'鄂城区', N'E4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1744', N'420800', N'2', N'448000', N'荆门市', N'JING1 MEN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1745', N'420802', N'3', N'448004', N'东宝区', N'DONG1 BAO3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1746', N'420804', N'3', N'448124', N'掇刀区', N'DUO1 DAO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1747', N'420821', N'3', N'431800', N'京山县', N'JING1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1748', N'420822', N'3', N'448200', N'沙洋县', N'SHA1 XIANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1749', N'420881', N'3', N'431900', N'钟祥市', N'ZHONG1 XIANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1750', N'420900', N'2', N'432000', N'孝感市', N'XIAO4 GAN3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1751', N'420902', N'3', N'432100', N'孝南区', N'XIAO4 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1752', N'420921', N'3', N'432900', N'孝昌县', N'XIAO4 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1753', N'420922', N'3', N'432800', N'大悟县', N'DA4 WU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1754', N'420923', N'3', N'432500', N'云梦县', N'YUN2 MENG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1755', N'420981', N'3', N'432400', N'应城市', N'YING1 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1756', N'420982', N'3', N'432600', N'安陆市', N'AN1 LIU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1757', N'420984', N'3', N'432300', N'汉川市', N'HAN4 CHUAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1758', N'421000', N'2', N'434000', N'荆州市', N'JING1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1759', N'421002', N'3', N'434000', N'沙市区', N'SHA1 SHI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1760', N'421003', N'3', N'434020', N'荆州区', N'JING1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1761', N'421022', N'3', N'434300', N'公安县', N'GONG1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1762', N'421023', N'3', N'433300', N'监利县', N'JIAN1 LI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1763', N'421024', N'3', N'434101', N'江陵县', N'JIANG1 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1764', N'421081', N'3', N'434400', N'石首市', N'SHI2 SHOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1765', N'421083', N'3', N'433200', N'洪湖市', N'HONG2 HU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1766', N'421087', N'3', N'434200', N'松滋市', N'SONG1 ZI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1767', N'421100', N'2', N'438000', N'黄冈市', N'HUANG2 GANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1768', N'421102', N'3', N'438000', N'黄州区', N'HUANG2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1769', N'421121', N'3', N'438000', N'团风县', N'TUAN2 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1770', N'421122', N'3', N'438401', N'红安县', N'GONG1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1771', N'421123', N'3', N'438600', N'罗田县', N'LUO2 TIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1772', N'421124', N'3', N'438700', N'英山县', N'YING1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1773', N'421125', N'3', N'438200', N'浠水县', N'XI1 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1774', N'421126', N'3', N'435300', N'蕲春县', N'QI2 CHUN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1775', N'421127', N'3', N'435500', N'黄梅县', N'HUANG2 MEI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1776', N'421181', N'3', N'438300', N'麻城市', N'MA1 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1777', N'421182', N'3', N'435400', N'武穴市', N'WU3 XUE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1778', N'421200', N'2', N'437000', N'咸宁市', N'XIAN2 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1779', N'421202', N'3', N'437000', N'咸安区', N'XIAN2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1780', N'421221', N'3', N'437200', N'嘉鱼县', N'JIA1 YU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1781', N'421222', N'3', N'437400', N'通城县', N'TONG1 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1782', N'421223', N'3', N'437500', N'崇阳县', N'CHONG2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1783', N'421224', N'3', N'437600', N'通山县', N'TONG1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1784', N'421281', N'3', N'437300', N'赤壁市', N'CHI4 BI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1785', N'421300', N'2', N'441300', N'随州市', N'SUI2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1786', N'421303', N'3', N'441300', N'曾都区', N'CENG2 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1787', N'421321', N'3', N'431500', N'随县', N'SUI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1788', N'421381', N'3', N'432700', N'广水市', N'GUANG3 SHUI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1789', N'422800', N'2', N'445000', N'恩施土家族苗族自治州', N'EN1 SHI1 TU3 GU1 ZU2 MIAO2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1790', N'422801', N'3', N'445000', N'恩施市', N'EN1 SHI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1791', N'422802', N'3', N'445400', N'利川市', N'LI4 CHUAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1792', N'422822', N'3', N'445300', N'建始县', N'JIAN4 SHI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1793', N'422823', N'3', N'444300', N'巴东县', N'BA1 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1794', N'422825', N'3', N'445500', N'宣恩县', N'XUAN1 EN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1795', N'422826', N'3', N'445600', N'咸丰县', N'XIAN2 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1796', N'422827', N'3', N'445700', N'来凤县', N'LAI2 FENG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1797', N'422828', N'3', N'445800', N'鹤峰县', N'HE4 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1798', N'429000', N'2', N'0', N'省直辖县级行政区划', N'SHENG3 ZHI2 HE2 XIAN4 JI2 HANG2 ZHENG4 OU1 HUA2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1799', N'429004', N'3', N'433000', N'仙桃市', N'XIAN1 TAO2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1800', N'429005', N'3', N'433100', N'潜江市', N'QIAN2 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1801', N'429006', N'3', N'431700', N'天门市', N'TIAN1 MEN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1802', N'429021', N'3', N'442400', N'神农架林区', N'SHEN2 NONG2 JIA4 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1803', N'430000', N'1', N'0', N'湖南省', N'HU2 NAN2 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1804', N'430100', N'2', N'410000', N'长沙市', N'CHANG2 SHA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1805', N'430102', N'3', N'410011', N'芙蓉区', N'FU2 RONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1806', N'430103', N'3', N'410011', N'天心区', N'TIAN1 XIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1807', N'430104', N'3', N'410006', N'岳麓区', N'YUE4 LU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1808', N'430105', N'3', N'410008', N'开福区', N'KAI1 FU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1809', N'430111', N'3', N'410011', N'雨花区', N'YU3 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1810', N'430112', N'3', N'410000', N'望城区', N'WANG4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1811', N'430121', N'3', N'410100', N'长沙县', N'CHANG2 SHA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1812', N'430181', N'3', N'410300', N'浏阳市', N'LIU2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1813', N'430182', N'3', N'410600', N'宁乡市', N'NING2 XIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1814', N'430200', N'2', N'412000', N'株洲市', N'ZHU1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1815', N'430202', N'3', N'412000', N'荷塘区', N'HE2 TANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1816', N'430203', N'3', N'412000', N'芦淞区', N'LU2 SONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1817', N'430204', N'3', N'412005', N'石峰区', N'SHI2 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1818', N'430211', N'3', N'412007', N'天元区', N'TIAN1 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1819', N'430221', N'3', N'412100', N'株洲县', N'ZHU1 ZHOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1820', N'430223', N'3', N'412300', N'攸县', N'YOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1821', N'430224', N'3', N'412400', N'茶陵县', N'CHA2 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1822', N'430225', N'3', N'412500', N'炎陵县', N'YAN2 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1823', N'430281', N'3', N'412200', N'醴陵市', N'LI3 LING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1824', N'430300', N'2', N'411100', N'湘潭市', N'XIANG1 TAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1825', N'430302', N'3', N'411100', N'雨湖区', N'YU3 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1826', N'430304', N'3', N'411101', N'岳塘区', N'YUE4 TANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1827', N'430321', N'3', N'411228', N'湘潭县', N'XIANG1 TAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1828', N'430381', N'3', N'411400', N'湘乡市', N'XIANG1 XIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1829', N'430382', N'3', N'411300', N'韶山市', N'SHAO2 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1830', N'430400', N'2', N'421000', N'衡阳市', N'HENG2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1831', N'430405', N'3', N'421002', N'珠晖区', N'ZHU1 HUI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1832', N'430406', N'3', N'421001', N'雁峰区', N'YAN4 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1833', N'430407', N'3', N'421001', N'石鼓区', N'SHI2 GU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1834', N'430408', N'3', N'421001', N'蒸湘区', N'ZHENG1 XIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1835', N'430412', N'3', N'421900', N'南岳区', N'NAN2 YUE4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1836', N'430421', N'3', N'421200', N'衡阳县', N'HENG2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1837', N'430422', N'3', N'421131', N'衡南县', N'HENG2 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1838', N'430423', N'3', N'421300', N'衡山县', N'HENG2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1839', N'430424', N'3', N'421400', N'衡东县', N'HENG2 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1840', N'430426', N'3', N'421600', N'祁东县', N'QI2 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1841', N'430481', N'3', N'421800', N'耒阳市', N'LEI3 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1842', N'430482', N'3', N'421500', N'常宁市', N'CHANG2 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1843', N'430500', N'2', N'422000', N'邵阳市', N'SHAO4 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1844', N'430502', N'3', N'422001', N'双清区', N'SHUANG1 QING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1845', N'430503', N'3', N'422000', N'大祥区', N'DA4 XIANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1846', N'430511', N'3', N'422007', N'北塔区', N'BEI3 DA5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1847', N'430521', N'3', N'422800', N'邵东县', N'SHAO4 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1848', N'430522', N'3', N'422900', N'新邵县', N'XIN1 SHAO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1849', N'430523', N'3', N'422100', N'邵阳县', N'SHAO4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1850', N'430524', N'3', N'422200', N'隆回县', N'LONG1 HUI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1851', N'430525', N'3', N'422300', N'洞口县', N'DONG4 KOU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1852', N'430527', N'3', N'422600', N'绥宁县', N'SUI2 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1853', N'430528', N'3', N'422700', N'新宁县', N'XIN1 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1854', N'430529', N'3', N'422500', N'城步苗族自治县', N'CHENG2 BU4 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1855', N'430581', N'3', N'422400', N'武冈市', N'WU3 GANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1856', N'430600', N'2', N'414000', N'岳阳市', N'YUE4 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1857', N'430602', N'3', N'414000', N'岳阳楼区', N'YUE4 YANG2 LOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1858', N'430603', N'3', N'414009', N'云溪区', N'YUN2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1859', N'430611', N'3', N'414005', N'君山区', N'JUN1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1860', N'430621', N'3', N'414100', N'岳阳县', N'YUE4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1861', N'430623', N'3', N'414200', N'华容县', N'HUA1 RONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1862', N'430624', N'3', N'414200', N'湘阴县', N'XIANG1 YIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1863', N'430626', N'3', N'414500', N'平江县', N'PING2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1864', N'430681', N'3', N'414400', N'汨罗市', N'MI4 LUO2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1865', N'430682', N'3', N'414300', N'临湘市', N'LIN2 XIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1866', N'430700', N'2', N'415000', N'常德市', N'CHANG2 DE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1867', N'430702', N'3', N'415000', N'武陵区', N'WU3 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1868', N'430703', N'3', N'415101', N'鼎城区', N'DING3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1869', N'430721', N'3', N'415600', N'安乡县', N'AN1 XIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1870', N'430722', N'3', N'415900', N'汉寿县', N'HAN4 SHOU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1871', N'430723', N'3', N'415500', N'澧县', N'LI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1872', N'430724', N'3', N'415200', N'临澧县', N'LIN2 LI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1873', N'430725', N'3', N'415700', N'桃源县', N'TAO2 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1874', N'430726', N'3', N'415300', N'石门县', N'SHI2 MEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1875', N'430781', N'3', N'415400', N'津市市', N'JIN1 SHI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1876', N'430800', N'2', N'427000', N'张家界市', N'ZHANG1 GU1 JIE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1877', N'430802', N'3', N'427000', N'永定区', N'YONG3 DING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1878', N'430811', N'3', N'427400', N'武陵源区', N'WU3 LING2 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1879', N'430821', N'3', N'427200', N'慈利县', N'CI2 LI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1880', N'430822', N'3', N'427100', N'桑植县', N'SANG1 ZHI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1881', N'430900', N'2', N'413000', N'益阳市', N'YI4 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1882', N'430902', N'3', N'413001', N'资阳区', N'ZI1 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1883', N'430903', N'3', N'413002', N'赫山区', N'HE4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1884', N'430921', N'3', N'413200', N'南县', N'NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1885', N'430922', N'3', N'413400', N'桃江县', N'TAO2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1886', N'430923', N'3', N'413500', N'安化县', N'AN1 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1887', N'430981', N'3', N'413100', N'沅江市', N'YUAN2 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1888', N'431000', N'2', N'423000', N'郴州市', N'CHEN1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1889', N'431002', N'3', N'423000', N'北湖区', N'BEI3 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1890', N'431003', N'3', N'423000', N'苏仙区', N'SU1 XIAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1891', N'431021', N'3', N'424400', N'桂阳县', N'GUI4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1892', N'431022', N'3', N'424200', N'宜章县', N'YI2 ZHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1893', N'431023', N'3', N'423300', N'永兴县', N'YONG3 XING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1894', N'431024', N'3', N'424500', N'嘉禾县', N'JIA1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1895', N'431025', N'3', N'424300', N'临武县', N'LIN2 WU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1896', N'431026', N'3', N'424100', N'汝城县', N'RU3 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1897', N'431027', N'3', N'423500', N'桂东县', N'GUI4 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1898', N'431028', N'3', N'423600', N'安仁县', N'AN1 REN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1899', N'431081', N'3', N'423400', N'资兴市', N'ZI1 XING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1900', N'431100', N'2', N'425000', N'永州市', N'YONG3 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1901', N'431102', N'3', N'425002', N'零陵区', N'LING2 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1902', N'431103', N'3', N'425100', N'冷水滩区', N'LENG3 SHUI3 TAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1903', N'431121', N'3', N'426100', N'祁阳县', N'QI2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1904', N'431122', N'3', N'425900', N'东安县', N'DONG1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1905', N'431123', N'3', N'425200', N'双牌县', N'SHUANG1 PAI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1906', N'431124', N'3', N'425300', N'道县', N'DAO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1907', N'431125', N'3', N'425400', N'江永县', N'JIANG1 YONG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1908', N'431126', N'3', N'425600', N'宁远县', N'NING2 YUAN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1909', N'431127', N'3', N'425800', N'蓝山县', N'LAN2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1910', N'431128', N'3', N'425700', N'新田县', N'XIN1 TIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1911', N'431129', N'3', N'425500', N'江华瑶族自治县', N'JIANG1 HUA1 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1912', N'431200', N'2', N'418000', N'怀化市', N'HUAI2 HUA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1913', N'431202', N'3', N'418000', N'鹤城区', N'HE4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1914', N'431221', N'3', N'418005', N'中方县', N'ZHONG1 FANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1915', N'431222', N'3', N'419600', N'沅陵县', N'YUAN2 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1916', N'431223', N'3', N'419500', N'辰溪县', N'CHEN2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1917', N'431224', N'3', N'419300', N'溆浦县', N'XU4 PU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1918', N'431225', N'3', N'418300', N'会同县', N'HUI4 TONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1919', N'431226', N'3', N'419400', N'麻阳苗族自治县', N'MA1 YANG2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1920', N'431227', N'3', N'419200', N'新晃侗族自治县', N'XIN1 HUANG1 DONG4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1921', N'431228', N'3', N'419100', N'芷江侗族自治县', N'ZHI3 JIANG1 DONG4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1922', N'431229', N'3', N'418400', N'靖州苗族侗族自治县', N'JING4 ZHOU1 MIAO2 ZU2 DONG4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1923', N'431230', N'3', N'418500', N'通道侗族自治县', N'TONG1 DAO1 DONG4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1924', N'431281', N'3', N'418116', N'洪江市', N'HONG2 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1925', N'431300', N'2', N'417000', N'娄底市', N'LOU2 DE5 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1926', N'431302', N'3', N'417000', N'娄星区', N'LOU2 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1927', N'431321', N'3', N'417700', N'双峰县', N'SHUANG1 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1928', N'431322', N'3', N'417600', N'新化县', N'XIN1 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1929', N'431381', N'3', N'417500', N'冷水江市', N'LENG3 SHUI3 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1930', N'431382', N'3', N'417100', N'涟源市', N'LIAN2 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1931', N'433100', N'2', N'416000', N'湘西土家族苗族自治州', N'XIANG1 XI1 TU3 GU1 ZU2 MIAO2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1932', N'433101', N'3', N'416000', N'吉首市', N'JI2 SHOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1933', N'433122', N'3', N'416100', N'泸溪县', N'LU2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1934', N'433123', N'3', N'416200', N'凤凰县', N'FENG4 HUANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1935', N'433124', N'3', N'416400', N'花垣县', N'HUA1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1936', N'433125', N'3', N'416500', N'保靖县', N'BAO3 JING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1937', N'433126', N'3', N'416300', N'古丈县', N'GU3 ZHANG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1938', N'433127', N'3', N'416700', N'永顺县', N'YONG3 SHUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1939', N'433130', N'3', N'416800', N'龙山县', N'LONG2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1940', N'440000', N'1', N'0', N'广东省', N'GUANG3 DONG1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1941', N'440100', N'2', N'510000', N'广州市', N'GUANG3 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1942', N'440103', N'3', N'510145', N'荔湾区', N'LI4 WAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1943', N'440104', N'3', N'510030', N'越秀区', N'YUE4 XIU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1944', N'440105', N'3', N'510220', N'海珠区', N'HAI3 ZHU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1945', N'440106', N'3', N'510630', N'天河区', N'TIAN1 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1946', N'440111', N'3', N'510080', N'白云区', N'BAI2 YUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1947', N'440112', N'3', N'510700', N'黄埔区', N'HUANG2 BU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1948', N'440113', N'3', N'511400', N'番禺区', N'FAN1 YU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1949', N'440114', N'3', N'510800', N'花都区', N'HUA1 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1950', N'440115', N'3', N'511400', N'南沙区', N'NAN2 SHA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1951', N'440117', N'3', N'510900', N'从化区', N'CONG2 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1952', N'440118', N'3', N'511300', N'增城区', N'ZENG1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1953', N'440200', N'2', N'512000', N'韶关市', N'SHAO2 GUAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1954', N'440203', N'3', N'512026', N'武江区', N'WU3 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1955', N'440204', N'3', N'512023', N'浈江区', N'ZHEN1 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1956', N'440205', N'3', N'512100', N'曲江区', N'QU1 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1957', N'440222', N'3', N'512500', N'始兴县', N'SHI3 XING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1958', N'440224', N'3', N'512300', N'仁化县', N'REN2 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1959', N'440229', N'3', N'512600', N'翁源县', N'WENG1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1960', N'440232', N'3', N'512700', N'乳源瑶族自治县', N'RU3 YUAN2 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1961', N'440233', N'3', N'511100', N'新丰县', N'XIN1 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1962', N'440281', N'3', N'512200', N'乐昌市', N'LE4 CHANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1963', N'440282', N'3', N'512400', N'南雄市', N'NAN2 XIONG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1964', N'440300', N'2', N'518000', N'深圳市', N'SHEN1 ZHEN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1965', N'440303', N'3', N'518001', N'罗湖区', N'LUO2 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1966', N'440304', N'3', N'518033', N'福田区', N'FU2 TIAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1967', N'440305', N'3', N'518052', N'南山区', N'NAN2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1968', N'440306', N'3', N'518101', N'宝安区', N'BAO3 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1969', N'440307', N'3', N'518116', N'龙岗区', N'LONG2 GANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1970', N'440308', N'3', N'518083', N'盐田区', N'YAN2 TIAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1971', N'440309', N'3', N'570105', N'龙华区', N'LONG2 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1972', N'440310', N'3', N'518118', N'坪山区', N'PING2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1973', N'440400', N'2', N'519000', N'珠海市', N'ZHU1 HAI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1974', N'440402', N'3', N'519000', N'香洲区', N'XIANG1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1975', N'440403', N'3', N'519100', N'斗门区', N'DOU3 MEN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1976', N'440404', N'3', N'519090', N'金湾区', N'JIN1 WAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1977', N'440500', N'2', N'515000', N'汕头市', N'SHAN4 TOU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1978', N'440507', N'3', N'515041', N'龙湖区', N'LONG2 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1979', N'440511', N'3', N'515041', N'金平区', N'JIN1 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1980', N'440512', N'3', N'515071', N'濠江区', N'HAO2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1981', N'440513', N'3', N'515100', N'潮阳区', N'CHAO2 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1982', N'440514', N'3', N'515144', N'潮南区', N'CHAO2 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1983', N'440515', N'3', N'515800', N'澄海区', N'CHENG2 HAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1984', N'440523', N'3', N'515900', N'南澳县', N'NAN2 AO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1985', N'440600', N'2', N'528000', N'佛山市', N'FO2 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1986', N'440604', N'3', N'528000', N'禅城区', N'CHAN2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1987', N'440605', N'3', N'528200', N'南海区', N'NAN2 HAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1988', N'440606', N'3', N'528300', N'顺德区', N'SHUN4 DE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1989', N'440607', N'3', N'528100', N'三水区', N'SAN1 SHUI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1990', N'440608', N'3', N'528500', N'高明区', N'GAO1 MING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1991', N'440700', N'2', N'529000', N'江门市', N'JIANG1 MEN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1992', N'440703', N'3', N'529051', N'蓬江区', N'PENG2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1993', N'440704', N'3', N'529000', N'江海区', N'JIANG1 HAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1994', N'440705', N'3', N'529100', N'新会区', N'XIN1 HUI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1995', N'440781', N'3', N'529211', N'台山市', N'TAI1 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1996', N'440783', N'3', N'529312', N'开平市', N'KAI1 PING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1997', N'440784', N'3', N'529711', N'鹤山市', N'HE4 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1998', N'440785', N'3', N'529411', N'恩平市', N'EN1 PING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'1999', N'440800', N'2', N'524000', N'湛江市', N'ZHAN4 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2000', N'440802', N'3', N'524033', N'赤坎区', N'CHI4 KAN3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2001', N'440803', N'3', N'524002', N'霞山区', N'XIA2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2002', N'440804', N'3', N'524057', N'坡头区', N'PO1 TOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2003', N'440811', N'3', N'524003', N'麻章区', N'MA1 ZHANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2004', N'440823', N'3', N'524300', N'遂溪县', N'SUI2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2005', N'440825', N'3', N'524100', N'徐闻县', N'XU2 WEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2006', N'440881', N'3', N'524400', N'廉江市', N'LIAN2 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2007', N'440882', N'3', N'524200', N'雷州市', N'LEI2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2008', N'440883', N'3', N'524500', N'吴川市', N'WU2 CHUAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2009', N'440900', N'2', N'525000', N'茂名市', N'MAO4 MING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2010', N'440902', N'3', N'525011', N'茂南区', N'MAO4 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2011', N'440904', N'3', N'525400', N'电白区', N'DIAN4 BAI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2012', N'440981', N'3', N'525200', N'高州市', N'GAO1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2013', N'440982', N'3', N'525100', N'化州市', N'HUA1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2014', N'440983', N'3', N'525300', N'信宜市', N'XIN4 YI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2015', N'441200', N'2', N'526000', N'肇庆市', N'ZHAO4 QING4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2016', N'441202', N'3', N'526040', N'端州区', N'DUAN1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2017', N'441203', N'3', N'526070', N'鼎湖区', N'DING3 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2018', N'441204', N'3', N'526100', N'高要区', N'GAO1 YAO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2019', N'441223', N'3', N'526300', N'广宁县', N'GUANG3 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2020', N'441224', N'3', N'526400', N'怀集县', N'HUAI2 JI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2021', N'441225', N'3', N'526500', N'封开县', N'FENG1 KAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2022', N'441226', N'3', N'526600', N'德庆县', N'DE2 QING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2023', N'441284', N'3', N'526200', N'四会市', N'SI4 HUI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2024', N'441300', N'2', N'516000', N'惠州市', N'HUI4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2025', N'441302', N'3', N'516001', N'惠城区', N'HUI4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2026', N'441303', N'3', N'516200', N'惠阳区', N'HUI4 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2027', N'441322', N'3', N'516100', N'博罗县', N'BO2 LUO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2028', N'441323', N'3', N'516300', N'惠东县', N'HUI4 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2029', N'441324', N'3', N'516800', N'龙门县', N'LONG2 MEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2030', N'441400', N'2', N'514000', N'梅州市', N'MEI2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2031', N'441402', N'3', N'514000', N'梅江区', N'MEI2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2032', N'441403', N'3', N'514700', N'梅县区', N'MEI2 XIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2033', N'441422', N'3', N'514200', N'大埔县', N'DA4 BU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2034', N'441423', N'3', N'514300', N'丰顺县', N'FENG1 SHUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2035', N'441424', N'3', N'514400', N'五华县', N'WU3 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2036', N'441426', N'3', N'514600', N'平远县', N'PING2 YUAN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2037', N'441427', N'3', N'514100', N'蕉岭县', N'JIAO1 LING3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2038', N'441481', N'3', N'514500', N'兴宁市', N'XING1 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2039', N'441500', N'2', N'516600', N'汕尾市', N'SHAN4 WEI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2040', N'441502', N'3', N'516601', N'城区', N'CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2041', N'441521', N'3', N'516400', N'海丰县', N'HAI3 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2042', N'441523', N'3', N'516700', N'陆河县', N'LIU4 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2043', N'441581', N'3', N'516500', N'陆丰市', N'LIU4 FENG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2044', N'441600', N'2', N'517000', N'河源市', N'HE2 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2045', N'441602', N'3', N'517000', N'源城区', N'YUAN2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2046', N'441621', N'3', N'517400', N'紫金县', N'ZI3 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2047', N'441622', N'3', N'517300', N'龙川县', N'LONG2 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2048', N'441623', N'3', N'517100', N'连平县', N'LIAN2 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2049', N'441624', N'3', N'517200', N'和平县', N'HE2 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2050', N'441625', N'3', N'517500', N'东源县', N'DONG1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2051', N'441700', N'2', N'529500', N'阳江市', N'YANG2 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2052', N'441702', N'3', N'529525', N'江城区', N'JIANG1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2053', N'441704', N'3', N'529900', N'阳东区', N'YANG2 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2054', N'441721', N'3', N'529800', N'阳西县', N'YANG2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2055', N'441781', N'3', N'529611', N'阳春市', N'YANG2 CHUN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2056', N'441800', N'2', N'511500', N'清远市', N'QING1 YUAN3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2057', N'441802', N'3', N'511500', N'清城区', N'QING1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2058', N'441803', N'3', N'511800', N'清新区', N'QING1 XIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2059', N'441821', N'3', N'511600', N'佛冈县', N'FO2 GANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2060', N'441823', N'3', N'513100', N'阳山县', N'YANG2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2061', N'441825', N'3', N'513200', N'连山壮族瑶族自治县', N'LIAN2 SHAN1 ZHUANG4 ZU2 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2062', N'441826', N'3', N'513300', N'连南瑶族自治县', N'LIAN2 NAN2 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2063', N'441881', N'3', N'513000', N'英德市', N'YING1 DE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2064', N'441882', N'3', N'513401', N'连州市', N'LIAN2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2065', N'441900', N'2', N'523000', N'东莞市', N'DONG1 GUAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2066', N'441901', N'3', N'523000', N'东城街道', N'DONG1 CHENG2 JIE1 DAO1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2067', N'441902', N'3', N'523000', N'南城街道', N'NAN2 CHENG2 JIE1 DAO1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2068', N'441903', N'3', N'523000', N'万江街道', N'MO4 JIANG1 JIE1 DAO1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2069', N'441904', N'3', N'523000', N'莞城街道', N'GUAN1 CHENG2 JIE1 DAO1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2070', N'441905', N'3', N'523000', N'石碣镇', N'SHI2 JIE2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2071', N'441906', N'3', N'523000', N'石龙镇', N'SHI2 LONG2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2072', N'441907', N'3', N'523000', N'茶山镇', N'CHA2 SHAN1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2073', N'441908', N'3', N'523000', N'石排镇', N'SHI2 PAI2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2074', N'441909', N'3', N'523000', N'企石镇', N'QI3 SHI2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2075', N'441910', N'3', N'523000', N'横沥镇', N'HENG2 LI4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2076', N'441911', N'3', N'523000', N'桥头镇', N'QIAO2 TOU2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2077', N'441912', N'3', N'523000', N'谢岗镇', N'XIE4 GANG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2078', N'441913', N'3', N'523000', N'东坑镇', N'DONG1 KENG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2079', N'441914', N'3', N'523000', N'常平镇', N'CHANG2 PING2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2080', N'441915', N'3', N'523000', N'寮步镇', N'LIAO2 BU4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2081', N'441916', N'3', N'523000', N'樟木头镇', N'ZHANG1 MU4 TOU2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2082', N'441917', N'3', N'523000', N'大朗镇', N'DA4 LANG3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2083', N'441918', N'3', N'523000', N'黄江镇', N'HUANG2 JIANG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2084', N'441919', N'3', N'523000', N'清溪镇', N'QING1 XI1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2085', N'441920', N'3', N'523000', N'塘厦镇', N'TANG2 SHA4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2086', N'441921', N'3', N'523000', N'凤岗镇', N'FENG4 GANG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2087', N'441922', N'3', N'523000', N'大岭山镇', N'DA4 LING3 SHAN1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2088', N'441923', N'3', N'523000', N'长安镇', N'CHANG2 AN1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2089', N'441924', N'3', N'523000', N'虎门镇', N'HU1 MEN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2090', N'441925', N'3', N'523000', N'厚街镇', N'HOU4 JIE1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2091', N'441926', N'3', N'523000', N'沙田镇', N'SHA1 TIAN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2092', N'441927', N'3', N'523000', N'道滘镇', N'DAO1 JIAO4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2093', N'441928', N'3', N'523000', N'洪梅镇', N'HONG2 MEI2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2094', N'441929', N'3', N'523000', N'麻涌镇', N'MA1 CHONG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2095', N'441930', N'3', N'523000', N'望牛墩镇', N'WANG4 NIU2 DUN1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2096', N'441931', N'3', N'523000', N'中堂镇', N'ZHONG1 TANG2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2097', N'441932', N'3', N'523000', N'高埗镇', N'GAO1 BU4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2098', N'441933', N'3', N'523000', N'松山湖管委会', N'SONG1 SHAN1 HU2 GUAN3 WEI1 HUI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2099', N'441934', N'3', N'523000', N'虎门港管委会', N'HU1 MEN2 GANG3 GUAN3 WEI1 HUI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2100', N'441935', N'3', N'523000', N'东莞生态园', N'DONG1 GUAN1 SHENG1 TAI4 YUAN2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2101', N'442000', N'2', N'528403', N'中山市', N'ZHONG1 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2102', N'442001', N'3', N'528403', N'石岐区街道', N'SHI2 QI2 OU1 JIE1 DAO1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2103', N'442002', N'3', N'528403', N'东区街道', N'DONG1 OU1 JIE1 DAO1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2104', N'442003', N'3', N'528403', N'火炬开发区', N'HUO3 JU4 KAI1 FA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2105', N'442004', N'3', N'528403', N'西区街道', N'XI1 OU1 JIE1 DAO1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2106', N'442005', N'3', N'528403', N'南区街道', N'NAN2 OU1 JIE1 DAO1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2107', N'442006', N'3', N'528403', N'五桂山街道', N'WU3 GUI4 SHAN1 JIE1 DAO1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2108', N'442007', N'3', N'528403', N'小榄镇', N'XIAO3 LAN3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2109', N'442008', N'3', N'528403', N'黄圃镇', N'HUANG2 PU3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2110', N'442009', N'3', N'528403', N'民众镇', N'MIN2 ZHONG4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2111', N'442010', N'3', N'528403', N'东凤镇', N'DONG1 FENG4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2112', N'442011', N'3', N'528403', N'东升镇', N'DONG1 SHENG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2113', N'442012', N'3', N'528403', N'古镇镇', N'GU3 ZHEN1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2114', N'442013', N'3', N'528403', N'沙溪镇', N'SHA1 XI1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2115', N'442014', N'3', N'528403', N'坦洲镇', N'TAN3 ZHOU1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2116', N'442015', N'3', N'528403', N'港口镇', N'GANG3 KOU3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2117', N'442016', N'3', N'528403', N'三角镇', N'SAN1 JIAO3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2118', N'442017', N'3', N'528403', N'横栏镇', N'HENG2 LAN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2119', N'442018', N'3', N'528403', N'南头镇', N'NAN2 TOU2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2120', N'442019', N'3', N'528403', N'阜沙镇', N'FU4 SHA1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2121', N'442020', N'3', N'528403', N'南朗镇', N'NAN2 LANG3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2122', N'442021', N'3', N'528403', N'三乡镇', N'SAN1 XIANG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2123', N'442022', N'3', N'528403', N'板芙镇', N'BAN3 FU2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2124', N'442023', N'3', N'528403', N'大涌镇', N'DA4 CHONG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2125', N'442024', N'3', N'528403', N'神湾镇', N'SHEN2 WAN1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2126', N'445100', N'2', N'521000', N'潮州市', N'CHAO2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2127', N'445102', N'3', N'521000', N'湘桥区', N'XIANG1 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2128', N'445103', N'3', N'515638', N'潮安区', N'CHAO2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2129', N'445122', N'3', N'515700', N'饶平县', N'RAO2 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2130', N'445200', N'2', N'522000', N'揭阳市', N'JIE1 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2131', N'445202', N'3', N'522095', N'榕城区', N'RONG2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2132', N'445203', N'3', N'515500', N'揭东区', N'JIE1 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2133', N'445222', N'3', N'515400', N'揭西县', N'JIE1 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2134', N'445224', N'3', N'515200', N'惠来县', N'HUI4 LAI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2135', N'445281', N'3', N'515300', N'普宁市', N'PU3 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2136', N'445300', N'2', N'527300', N'云浮市', N'YUN2 FU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2137', N'445302', N'3', N'527300', N'云城区', N'YUN2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2138', N'445303', N'3', N'527500', N'云安区', N'YUN2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2139', N'445321', N'3', N'527400', N'新兴县', N'XIN1 XING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2140', N'445322', N'3', N'527100', N'郁南县', N'YU4 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2141', N'445381', N'3', N'527500', N'罗定市', N'LUO2 DING4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2142', N'450000', N'1', N'0', N'广西壮族自治区', N'GUANG3 XI1 ZHUANG4 ZU2 ZI4 ZHI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2143', N'450100', N'2', N'530000', N'南宁市', N'NAN2 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2144', N'450102', N'3', N'530012', N'兴宁区', N'XING1 NING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2145', N'450103', N'3', N'530022', N'青秀区', N'QING1 XIU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2146', N'450105', N'3', N'530031', N'江南区', N'JIANG1 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2147', N'450107', N'3', N'530001', N'西乡塘区', N'XI1 XIANG1 TANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2148', N'450108', N'3', N'530200', N'良庆区', N'LIANG2 QING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2149', N'450109', N'3', N'530200', N'邕宁区', N'YONG1 NING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2150', N'450110', N'3', N'530100', N'武鸣区', N'WU3 MING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2151', N'450123', N'3', N'532700', N'隆安县', N'LONG1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2152', N'450124', N'3', N'530600', N'马山县', N'MA3 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2153', N'450125', N'3', N'530500', N'上林县', N'SHANG3 LIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2154', N'450126', N'3', N'530400', N'宾阳县', N'BIN1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2155', N'450127', N'3', N'530300', N'横县', N'HENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2156', N'450200', N'2', N'545000', N'柳州市', N'LIU3 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2157', N'450202', N'3', N'545001', N'城中区', N'CHENG2 ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2158', N'450203', N'3', N'545005', N'鱼峰区', N'YU2 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2159', N'450204', N'3', N'545005', N'柳南区', N'LIU3 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2160', N'450205', N'3', N'545001', N'柳北区', N'LIU3 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2161', N'450206', N'3', N'545100', N'柳江区', N'LIU3 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2162', N'450222', N'3', N'545200', N'柳城县', N'LIU3 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2163', N'450223', N'3', N'545600', N'鹿寨县', N'LU4 ZHAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2164', N'450224', N'3', N'545400', N'融安县', N'RONG2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2165', N'450225', N'3', N'545300', N'融水苗族自治县', N'RONG2 SHUI3 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2166', N'450226', N'3', N'545500', N'三江侗族自治县', N'SAN1 JIANG1 DONG4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2167', N'450300', N'2', N'541000', N'桂林市', N'GUI4 LIN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2168', N'450302', N'3', N'541001', N'秀峰区', N'XIU4 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2169', N'450303', N'3', N'541001', N'叠彩区', N'DIE2 CAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2170', N'450304', N'3', N'541002', N'象山区', N'XIANG4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2171', N'450305', N'3', N'541004', N'七星区', N'QI1 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2172', N'450311', N'3', N'541006', N'雁山区', N'YAN4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2173', N'450312', N'3', N'541199', N'临桂区', N'LIN2 GUI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2174', N'450321', N'3', N'541900', N'阳朔县', N'YANG2 SHUO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2175', N'450323', N'3', N'541200', N'灵川县', N'LING2 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2176', N'450324', N'3', N'541500', N'全州县', N'QUAN2 ZHOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2177', N'450325', N'3', N'541300', N'兴安县', N'XING1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2178', N'450326', N'3', N'541800', N'永福县', N'YONG3 FU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2179', N'450327', N'3', N'541600', N'灌阳县', N'GUAN4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2180', N'450328', N'3', N'541700', N'龙胜各族自治县', N'LONG2 SHENG1 GE3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2181', N'450329', N'3', N'541400', N'资源县', N'ZI1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2182', N'450330', N'3', N'542400', N'平乐县', N'PING2 LE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2183', N'450331', N'3', N'546600', N'荔浦县', N'LI4 PU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2184', N'450332', N'3', N'542500', N'恭城瑶族自治县', N'GONG1 CHENG2 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2185', N'450400', N'2', N'543000', N'梧州市', N'WU2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2186', N'450403', N'3', N'543000', N'万秀区', N'MO4 XIU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2187', N'450405', N'3', N'543002', N'长洲区', N'CHANG2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2188', N'450406', N'3', N'543004', N'龙圩区', N'LONG2 WEI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2189', N'450421', N'3', N'543100', N'苍梧县', N'CANG1 WU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2190', N'450422', N'3', N'543300', N'藤县', N'TENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2191', N'450423', N'3', N'546700', N'蒙山县', N'MENG1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2192', N'450481', N'3', N'543200', N'岑溪市', N'CEN2 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2193', N'450500', N'2', N'536000', N'北海市', N'BEI3 HAI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2194', N'450502', N'3', N'536000', N'海城区', N'HAI3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2195', N'450503', N'3', N'536000', N'银海区', N'YIN2 HAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2196', N'450512', N'3', N'536017', N'铁山港区', N'TIE3 SHAN1 GANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2197', N'450521', N'3', N'536100', N'合浦县', N'GE3 PU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2198', N'450600', N'2', N'538000', N'防城港市', N'FANG2 CHENG2 GANG3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2199', N'450602', N'3', N'538001', N'港口区', N'GANG3 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2200', N'450603', N'3', N'538021', N'防城区', N'FANG2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2201', N'450621', N'3', N'535500', N'上思县', N'SHANG3 SAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2202', N'450681', N'3', N'538100', N'东兴市', N'DONG1 XING1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2203', N'450700', N'2', N'535000', N'钦州市', N'QIN1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2204', N'450702', N'3', N'535000', N'钦南区', N'QIN1 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2205', N'450703', N'3', N'535000', N'钦北区', N'QIN1 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2206', N'450721', N'3', N'535400', N'灵山县', N'LING2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2207', N'450722', N'3', N'535300', N'浦北县', N'PU3 BEI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2208', N'450800', N'2', N'537000', N'贵港市', N'GUI4 GANG3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2209', N'450802', N'3', N'537100', N'港北区', N'GANG3 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2210', N'450803', N'3', N'537132', N'港南区', N'GANG3 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2211', N'450804', N'3', N'537121', N'覃塘区', N'QIN2 TANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2212', N'450821', N'3', N'537300', N'平南县', N'PING2 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2213', N'450881', N'3', N'537200', N'桂平市', N'GUI4 PING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2214', N'450900', N'2', N'0', N'玉林市', N'YU4 LIN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2215', N'450902', N'3', N'537200', N'玉州区', N'YU4 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2216', N'450903', N'3', N'537500', N'福绵区', N'FU2 MIAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2217', N'450921', N'3', N'537500', N'容县', N'RONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2218', N'450922', N'3', N'537700', N'陆川县', N'LIU4 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2219', N'450923', N'3', N'537600', N'博白县', N'BO2 BAI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2220', N'450924', N'3', N'537800', N'兴业县', N'XING1 YE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2221', N'450981', N'3', N'537400', N'北流市', N'BEI3 LIU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2222', N'451000', N'2', N'533000', N'百色市', N'BAI3 SE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2223', N'451002', N'3', N'533000', N'右江区', N'YOU4 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2224', N'451021', N'3', N'533600', N'田阳县', N'TIAN2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2225', N'451022', N'3', N'531500', N'田东县', N'TIAN2 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2226', N'451023', N'3', N'531400', N'平果县', N'PING2 GUO3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2227', N'451024', N'3', N'533700', N'德保县', N'DE2 BAO3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2228', N'451026', N'3', N'533900', N'那坡县', N'NA1 PO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2229', N'451027', N'3', N'533100', N'凌云县', N'LING1 YUN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2230', N'451028', N'3', N'533200', N'乐业县', N'LE4 YE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2231', N'451029', N'3', N'533300', N'田林县', N'TIAN2 LIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2232', N'451030', N'3', N'533500', N'西林县', N'XI1 LIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2233', N'451031', N'3', N'533400', N'隆林各族自治县', N'LONG1 LIN2 GE3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2234', N'451081', N'3', N'533000', N'靖西市', N'JING4 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2235', N'451100', N'2', N'542800', N'贺州市', N'HE4 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2236', N'451102', N'3', N'542800', N'八步区', N'BA1 BU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2237', N'451103', N'3', N'542800', N'平桂区', N'PING2 GUI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2238', N'451121', N'3', N'546800', N'昭平县', N'ZHAO1 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2239', N'451122', N'3', N'542600', N'钟山县', N'ZHONG1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2240', N'451123', N'3', N'542700', N'富川瑶族自治县', N'FU4 CHUAN1 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2241', N'451200', N'2', N'547000', N'河池市', N'HE2 CHI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2242', N'451202', N'3', N'547000', N'金城江区', N'JIN1 CHENG2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2243', N'451203', N'3', N'546300', N'宜州区', N'YI2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2244', N'451221', N'3', N'547200', N'南丹县', N'NAN2 DAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2245', N'451222', N'3', N'547300', N'天峨县', N'TIAN1 E2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2246', N'451223', N'3', N'547600', N'凤山县', N'FENG4 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2247', N'451224', N'3', N'547400', N'东兰县', N'DONG1 LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2248', N'451225', N'3', N'546400', N'罗城仫佬族自治县', N'LUO2 CHENG2 MU4 LAO3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2249', N'451226', N'3', N'547100', N'环江毛南族自治县', N'HUAN2 JIANG1 MAO2 NAN2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2250', N'451227', N'3', N'547500', N'巴马瑶族自治县', N'BA1 MA3 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2251', N'451228', N'3', N'530700', N'都安瑶族自治县', N'DOU1 AN1 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2252', N'451229', N'3', N'530800', N'大化瑶族自治县', N'DA4 HUA1 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2253', N'451300', N'2', N'546100', N'来宾市', N'LAI2 BIN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2254', N'451302', N'3', N'546100', N'兴宾区', N'XING1 BIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2255', N'451321', N'3', N'546200', N'忻城县', N'XIN1 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2256', N'451322', N'3', N'545800', N'象州县', N'XIANG4 ZHOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2257', N'451323', N'3', N'545900', N'武宣县', N'WU3 XUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2258', N'451324', N'3', N'545700', N'金秀瑶族自治县', N'JIN1 XIU4 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2259', N'451381', N'3', N'546500', N'合山市', N'GE3 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2260', N'451400', N'2', N'532200', N'崇左市', N'CHONG2 ZUO3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2261', N'451402', N'3', N'532200', N'江州区', N'JIANG1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2262', N'451421', N'3', N'532100', N'扶绥县', N'FU2 SUI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2263', N'451422', N'3', N'532500', N'宁明县', N'NING2 MING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2264', N'451423', N'3', N'532400', N'龙州县', N'LONG2 ZHOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2265', N'451424', N'3', N'532300', N'大新县', N'DA4 XIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2266', N'451425', N'3', N'532800', N'天等县', N'TIAN1 DENG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2267', N'451481', N'3', N'532600', N'凭祥市', N'PING2 XIANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2268', N'460000', N'1', N'0', N'海南省', N'HAI3 NAN2 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2269', N'460100', N'2', N'570100', N'海口市', N'HAI3 KOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2270', N'460105', N'3', N'570311', N'秀英区', N'XIU4 YING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2271', N'460106', N'3', N'570105', N'龙华区', N'LONG2 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2272', N'460107', N'3', N'571100', N'琼山区', N'QIONG2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2273', N'460108', N'3', N'570203', N'美兰区', N'MEI3 LAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2274', N'460200', N'2', N'572000', N'三亚市', N'SAN1 YA4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2275', N'460202', N'3', N'572000', N'海棠区', N'HAI3 TANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2276', N'460203', N'3', N'572000', N'吉阳区', N'JI2 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2277', N'460204', N'3', N'572000', N'天涯区', N'TIAN1 YA2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2278', N'460205', N'3', N'572000', N'崖州区', N'YA2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2279', N'460300', N'2', N'0', N'三沙市', N'SAN1 SHA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2280', N'460321', N'3', N'572000', N'西沙群岛', N'XI1 SHA1 QUN2 DAO3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2281', N'460322', N'3', N'572000', N'南沙群岛', N'NAN2 SHA1 QUN2 DAO3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2282', N'460323', N'3', N'572000', N'中沙群岛的岛礁及其海域', N'ZHONG1 SHA1 QUN2 DAO3 DE5 DAO3 JIAO1 JI2 JI1 HAI3 YU4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2283', N'460400', N'2', N'571700', N'儋州市', N'DAN1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2284', N'460401', N'3', N'571700', N'那大镇', N'NA1 DA4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2285', N'460402', N'3', N'571700', N'和庆镇', N'HE2 QING4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2286', N'460403', N'3', N'571700', N'南丰镇', N'NAN2 FENG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2287', N'460404', N'3', N'571700', N'大成镇', N'DA4 CHENG2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2288', N'460405', N'3', N'571700', N'雅星镇', N'YA1 XING1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2289', N'460406', N'3', N'571700', N'兰洋镇', N'LAN2 XIANG2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2290', N'460407', N'3', N'571700', N'光村镇', N'GUANG1 CUN1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2291', N'460408', N'3', N'571700', N'木棠镇', N'MU4 TANG2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2292', N'460409', N'3', N'571700', N'海头镇', N'HAI3 TOU2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2293', N'460410', N'3', N'571700', N'峨蔓镇', N'E2 MAN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2294', N'460411', N'3', N'571700', N'三都镇', N'SAN1 DOU1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2295', N'460412', N'3', N'571700', N'王五镇', N'WANG2 WU3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2296', N'460413', N'3', N'571700', N'白马井镇', N'BAI2 MA3 JING3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2297', N'460414', N'3', N'571700', N'中和镇', N'ZHONG1 HE2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2298', N'460415', N'3', N'571700', N'排浦镇', N'PAI2 PU3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2299', N'460416', N'3', N'571700', N'东成镇', N'DONG1 CHENG2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2300', N'460417', N'3', N'571700', N'新州镇', N'XIN1 ZHOU1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2301', N'460418', N'3', N'571700', N'国营西培农场', N'GUO2 YING2 XI1 PEI2 NONG2 CHANG2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2302', N'460419', N'3', N'571700', N'国营西联农场', N'GUO2 YING2 XI1 LIAN2 NONG2 CHANG2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2303', N'460420', N'3', N'571700', N'国营蓝洋农场', N'GUO2 YING2 LAN2 XIANG2 NONG2 CHANG2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2304', N'460421', N'3', N'571700', N'国营八一农场', N'GUO2 YING2 BA1 YI1 NONG2 CHANG2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2305', N'460422', N'3', N'571700', N'洋浦经济开发区', N'XIANG2 PU3 JING1 JI3 KAI1 FA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2306', N'460423', N'3', N'571700', N'华南热作学院', N'HUA1 NAN2 RE4 ZUO1 XUE2 YUAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2307', N'460424', N'3', N'571700', N'红岭农场', N'GONG1 LING3 NONG2 CHANG2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2308', N'469000', N'2', N'0', N'省直辖县级行政区划', N'SHENG3 ZHI2 HE2 XIAN4 JI2 HANG2 ZHENG4 OU1 HUA2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2309', N'469001', N'3', N'572200', N'五指山市', N'WU3 ZHI3 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2310', N'469002', N'3', N'571400', N'琼海市', N'QIONG2 HAI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2311', N'469005', N'3', N'571300', N'文昌市', N'WEN2 CHANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2312', N'469006', N'3', N'571500', N'万宁市', N'MO4 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2313', N'469007', N'3', N'572600', N'东方市', N'DONG1 FANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2314', N'469021', N'3', N'571200', N'定安县', N'DING4 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2315', N'469022', N'3', N'571600', N'屯昌县', N'TUN2 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2316', N'469023', N'3', N'571900', N'澄迈县', N'CHENG2 MAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2317', N'469024', N'3', N'571800', N'临高县', N'LIN2 GAO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2318', N'469025', N'3', N'572800', N'白沙黎族自治县', N'BAI2 SHA1 LI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2319', N'469026', N'3', N'572700', N'昌江黎族自治县', N'CHANG1 JIANG1 LI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2320', N'469027', N'3', N'572500', N'乐东黎族自治县', N'LE4 DONG1 LI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2321', N'469028', N'3', N'572400', N'陵水黎族自治县', N'LING2 SHUI3 LI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2322', N'469029', N'3', N'572300', N'保亭黎族苗族自治县', N'BAO3 TING2 LI2 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2323', N'469030', N'3', N'572900', N'琼中黎族苗族自治县', N'QIONG2 ZHONG1 LI2 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2324', N'500000', N'1', N'400000', N'重庆市', N'CHONG2 QING4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2325', N'500100', N'2', N'400000', N'重庆市', N'CHONG2 QING4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2326', N'500101', N'3', N'404100', N'万州区', N'MO4 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2327', N'500102', N'3', N'408000', N'涪陵区', N'FU2 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2328', N'500103', N'3', N'400010', N'渝中区', N'YU2 ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2329', N'500104', N'3', N'400080', N'大渡口区', N'DA4 DU4 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2330', N'500105', N'3', N'400020', N'江北区', N'JIANG1 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2331', N'500106', N'3', N'400030', N'沙坪坝区', N'SHA1 PING2 BA4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2332', N'500107', N'3', N'400050', N'九龙坡区', N'JIU3 LONG2 PO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2333', N'500108', N'3', N'400064', N'南岸区', N'NAN2 AN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2334', N'500109', N'3', N'400700', N'北碚区', N'BEI3 BEI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2335', N'500110', N'3', N'400000', N'綦江区', N'QI2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2336', N'500111', N'3', N'400000', N'大足区', N'DA4 ZU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2337', N'500112', N'3', N'401120', N'渝北区', N'YU2 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2338', N'500113', N'3', N'401320', N'巴南区', N'BA1 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2339', N'500114', N'3', N'409700', N'黔江区', N'QIAN2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2340', N'500115', N'3', N'401220', N'长寿区', N'CHANG2 SHOU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2341', N'500116', N'3', N'402260', N'江津区', N'JIANG1 JIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2342', N'500117', N'3', N'401520', N'合川区', N'GE3 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2343', N'500118', N'3', N'402160', N'永川区', N'YONG3 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2344', N'500119', N'3', N'408400', N'南川区', N'NAN2 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2345', N'500120', N'3', N'408400', N'璧山区', N'BI4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2346', N'500151', N'3', N'408400', N'铜梁区', N'TONG2 LIANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2347', N'500152', N'3', N'402660', N'潼南区', N'TONG2 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2348', N'500153', N'3', N'408400', N'荣昌区', N'RONG2 CHANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2349', N'500154', N'3', N'408400', N'开州区', N'KAI1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2350', N'500155', N'3', N'405200', N'梁平区', N'LIANG2 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2351', N'500156', N'3', N'408500', N'武隆区', N'WU3 LONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2352', N'500200', N'2', N'0', N'县', N'XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2353', N'500229', N'3', N'405900', N'城口县', N'CHENG2 KOU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2354', N'500230', N'3', N'408200', N'丰都县', N'FENG1 DOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2355', N'500231', N'3', N'408300', N'垫江县', N'DIAN4 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2356', N'500233', N'3', N'404300', N'忠县', N'ZHONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2357', N'500235', N'3', N'404500', N'云阳县', N'YUN2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2358', N'500236', N'3', N'404600', N'奉节县', N'FENG4 JIE1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2359', N'500237', N'3', N'404700', N'巫山县', N'WU1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2360', N'500238', N'3', N'405800', N'巫溪县', N'WU1 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2361', N'500240', N'3', N'409100', N'石柱土家族自治县', N'SHI2 ZHU4 TU3 GU1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2362', N'500241', N'3', N'409900', N'秀山土家族苗族自治县', N'XIU4 SHAN1 TU3 GU1 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2363', N'500242', N'3', N'409800', N'酉阳土家族苗族自治县', N'YOU3 YANG2 TU3 GU1 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2364', N'500243', N'3', N'409600', N'彭水苗族土家族自治县', N'PENG2 SHUI3 MIAO2 ZU2 TU3 GU1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2365', N'510000', N'1', N'0', N'四川省', N'SI4 CHUAN1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2366', N'510100', N'2', N'610000', N'成都市', N'CHENG2 DOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2367', N'510104', N'3', N'610021', N'锦江区', N'JIN3 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2368', N'510105', N'3', N'610031', N'青羊区', N'QING1 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2369', N'510106', N'3', N'610036', N'金牛区', N'JIN1 NIU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2370', N'510107', N'3', N'610041', N'武侯区', N'WU3 HOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2371', N'510108', N'3', N'610066', N'成华区', N'CHENG2 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2372', N'510112', N'3', N'610100', N'龙泉驿区', N'LONG2 QUAN2 YI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2373', N'510113', N'3', N'610300', N'青白江区', N'QING1 BAI2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2374', N'510114', N'3', N'610500', N'新都区', N'XIN1 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2375', N'510115', N'3', N'611130', N'温江区', N'WEN1 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2376', N'510116', N'3', N'610200', N'双流区', N'SHUANG1 LIU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2377', N'510117', N'3', N'611730', N'郫都区', N'PI2 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2378', N'510121', N'3', N'610400', N'金堂县', N'JIN1 TANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2379', N'510129', N'3', N'611300', N'大邑县', N'DA4 YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2380', N'510131', N'3', N'611630', N'蒲江县', N'PU2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2381', N'510132', N'3', N'611430', N'新津县', N'XIN1 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2382', N'510181', N'3', N'611830', N'都江堰市', N'DOU1 JIANG1 YAN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2383', N'510182', N'3', N'611930', N'彭州市', N'PENG2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2384', N'510183', N'3', N'611530', N'邛崃市', N'QIONG2 LAI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2385', N'510184', N'3', N'611230', N'崇州市', N'CHONG2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2386', N'510185', N'3', N'611230', N'简阳市', N'JIAN3 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2387', N'510300', N'2', N'643000', N'自贡市', N'ZI4 GONG4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2388', N'510302', N'3', N'643000', N'自流井区', N'ZI4 LIU2 JING3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2389', N'510303', N'3', N'643020', N'贡井区', N'GONG4 JING3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2390', N'510304', N'3', N'643010', N'大安区', N'DA4 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2391', N'510311', N'3', N'643030', N'沿滩区', N'YAN2 TAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2392', N'510321', N'3', N'643100', N'荣县', N'RONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2393', N'510322', N'3', N'643200', N'富顺县', N'FU4 SHUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2394', N'510400', N'2', N'617000', N'攀枝花市', N'PAN1 ZHI1 HUA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2395', N'510402', N'3', N'617067', N'东区', N'DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2396', N'510403', N'3', N'617068', N'西区', N'XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2397', N'510411', N'3', N'617061', N'仁和区', N'REN2 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2398', N'510421', N'3', N'617200', N'米易县', N'MI3 YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2399', N'510422', N'3', N'617100', N'盐边县', N'YAN2 BIAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2400', N'510500', N'2', N'646000', N'泸州市', N'LU2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2401', N'510502', N'3', N'646000', N'江阳区', N'JIANG1 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2402', N'510503', N'3', N'646300', N'纳溪区', N'NA4 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2403', N'510504', N'3', N'646000', N'龙马潭区', N'LONG2 MA3 TAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2404', N'510521', N'3', N'646106', N'泸县', N'LU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2405', N'510522', N'3', N'646200', N'合江县', N'GE3 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2406', N'510524', N'3', N'646400', N'叙永县', N'XU4 YONG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2407', N'510525', N'3', N'646500', N'古蔺县', N'GU3 LIN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2408', N'510600', N'2', N'618000', N'德阳市', N'DE2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2409', N'510603', N'3', N'618000', N'旌阳区', N'JING1 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2410', N'510604', N'3', N'618500', N'罗江区', N'LUO2 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2411', N'510623', N'3', N'618100', N'中江县', N'ZHONG1 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2412', N'510681', N'3', N'618300', N'广汉市', N'GUANG3 HAN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2413', N'510682', N'3', N'618300', N'什邡市', N'SHEN2 FANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2414', N'510683', N'3', N'618200', N'绵竹市', N'MIAN2 ZHU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2415', N'510700', N'2', N'621000', N'绵阳市', N'MIAN2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2416', N'510703', N'3', N'621000', N'涪城区', N'FU2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2417', N'510704', N'3', N'621022', N'游仙区', N'YOU2 XIAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2418', N'510705', N'3', N'622650', N'安州区', N'AN1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2419', N'510722', N'3', N'621100', N'三台县', N'SAN1 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2420', N'510723', N'3', N'621600', N'盐亭县', N'YAN2 TING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2421', N'510725', N'3', N'622150', N'梓潼县', N'ZI3 TONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2422', N'510726', N'3', N'622750', N'北川羌族自治县', N'BEI3 CHUAN1 QIANG1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2423', N'510727', N'3', N'622550', N'平武县', N'PING2 WU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2424', N'510781', N'3', N'621700', N'江油市', N'JIANG1 YOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2425', N'510800', N'2', N'628000', N'广元市', N'GUANG3 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2426', N'510802', N'3', N'628017', N'利州区', N'LI4 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2427', N'510811', N'3', N'628000', N'昭化区', N'ZHAO1 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2428', N'510812', N'3', N'628017', N'朝天区', N'CHAO2 TIAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2429', N'510821', N'3', N'628200', N'旺苍县', N'WANG4 CANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2430', N'510822', N'3', N'628100', N'青川县', N'QING1 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2431', N'510823', N'3', N'628300', N'剑阁县', N'JIAN4 GE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2432', N'510824', N'3', N'628400', N'苍溪县', N'CANG1 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2433', N'510900', N'2', N'629000', N'遂宁市', N'SUI2 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2434', N'510903', N'3', N'629000', N'船山区', N'CHUAN2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2435', N'510904', N'3', N'629000', N'安居区', N'AN1 JU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2436', N'510921', N'3', N'629100', N'蓬溪县', N'PENG2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2437', N'510922', N'3', N'629200', N'射洪县', N'SHE4 HONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2438', N'510923', N'3', N'629300', N'大英县', N'DA4 YING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2439', N'511000', N'2', N'641000', N'内江市', N'NEI4 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2440', N'511002', N'3', N'614000', N'市中区', N'SHI4 ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2441', N'511011', N'3', N'641100', N'东兴区', N'DONG1 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2442', N'511024', N'3', N'642450', N'威远县', N'WEI1 YUAN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2443', N'511025', N'3', N'641200', N'资中县', N'ZI1 ZHONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2444', N'511083', N'3', N'642150', N'隆昌市', N'LONG1 CHANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2445', N'511100', N'2', N'614000', N'乐山市', N'LE4 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2446', N'511102', N'3', N'614000', N'市中区', N'SHI4 ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2447', N'511111', N'3', N'614900', N'沙湾区', N'SHA1 WAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2448', N'511112', N'3', N'614800', N'五通桥区', N'WU3 TONG1 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2449', N'511113', N'3', N'614700', N'金口河区', N'JIN1 KOU3 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2450', N'511123', N'3', N'614400', N'犍为县', N'JIAN1 WEI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2451', N'511124', N'3', N'613100', N'井研县', N'JING3 YAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2452', N'511126', N'3', N'614100', N'夹江县', N'GA1 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2453', N'511129', N'3', N'614500', N'沐川县', N'MU4 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2454', N'511132', N'3', N'614300', N'峨边彝族自治县', N'E2 BIAN1 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2455', N'511133', N'3', N'614600', N'马边彝族自治县', N'MA3 BIAN1 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2456', N'511181', N'3', N'614200', N'峨眉山市', N'E2 MEI2 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2457', N'511300', N'2', N'637000', N'南充市', N'NAN2 CHONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2458', N'511302', N'3', N'637000', N'顺庆区', N'SHUN4 QING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2459', N'511303', N'3', N'637100', N'高坪区', N'GAO1 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2460', N'511304', N'3', N'637100', N'嘉陵区', N'JIA1 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2461', N'511321', N'3', N'637300', N'南部县', N'NAN2 BU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2462', N'511322', N'3', N'637700', N'营山县', N'YING2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2463', N'511323', N'3', N'637800', N'蓬安县', N'PENG2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2464', N'511324', N'3', N'637600', N'仪陇县', N'YI2 LONG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2465', N'511325', N'3', N'637200', N'西充县', N'XI1 CHONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2466', N'511381', N'3', N'637400', N'阆中市', N'LANG2 ZHONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2467', N'511400', N'2', N'620000', N'眉山市', N'MEI2 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2468', N'511402', N'3', N'620010', N'东坡区', N'DONG1 PO1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2469', N'511403', N'3', N'620860', N'彭山区', N'PENG2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2470', N'511421', N'3', N'620500', N'仁寿县', N'REN2 SHOU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2471', N'511423', N'3', N'620360', N'洪雅县', N'HONG2 YA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2472', N'511424', N'3', N'620200', N'丹棱县', N'DAN1 LENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2473', N'511425', N'3', N'620460', N'青神县', N'QING1 SHEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2474', N'511500', N'2', N'644000', N'宜宾市', N'YI2 BIN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2475', N'511502', N'3', N'644000', N'翠屏区', N'CUI4 BING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2476', N'511503', N'3', N'0', N'南溪区', N'NAN2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2477', N'511521', N'3', N'644600', N'宜宾县', N'YI2 BIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2478', N'511523', N'3', N'644200', N'江安县', N'JIANG1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2479', N'511524', N'3', N'644300', N'长宁县', N'CHANG2 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2480', N'511525', N'3', N'645150', N'高县', N'GAO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2481', N'511526', N'3', N'644500', N'珙县', N'GONG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2482', N'511527', N'3', N'645250', N'筠连县', N'JUN1 LIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2483', N'511528', N'3', N'644400', N'兴文县', N'XING1 WEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2484', N'511529', N'3', N'645350', N'屏山县', N'BING1 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2485', N'511600', N'2', N'638500', N'广安市', N'GUANG3 GUANG3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2486', N'511602', N'3', N'638000', N'广安区', N'GUANG3 GUANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2487', N'511603', N'3', N'638019', N'前锋区', N'QIAN2 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2488', N'511621', N'3', N'638300', N'岳池县', N'YUE4 CHI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2489', N'511622', N'3', N'638400', N'武胜县', N'WU3 SHENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2490', N'511623', N'3', N'638500', N'邻水县', N'LIN2 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2491', N'511681', N'3', N'638600', N'华蓥市', N'HUA1 YING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2492', N'511700', N'2', N'635000', N'达州市', N'DA2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2493', N'511702', N'3', N'635000', N'通川区', N'TONG1 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2494', N'511703', N'3', N'635000', N'达川区', N'DA2 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2495', N'511722', N'3', N'636150', N'宣汉县', N'XUAN1 HAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2496', N'511723', N'3', N'636250', N'开江县', N'KAI1 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2497', N'511724', N'3', N'635100', N'大竹县', N'DA4 ZHU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2498', N'511725', N'3', N'635200', N'渠县', N'QU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2499', N'511781', N'3', N'636350', N'万源市', N'MO4 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2500', N'511800', N'2', N'625000', N'雅安市', N'YA1 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2501', N'511802', N'3', N'625000', N'雨城区', N'YU3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2502', N'511803', N'3', N'0', N'名山区', N'MING2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2503', N'511822', N'3', N'625200', N'荥经县', N'XING2 JING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2504', N'511823', N'3', N'625300', N'汉源县', N'HAN4 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2505', N'511824', N'3', N'625400', N'石棉县', N'SHI2 MIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2506', N'511825', N'3', N'625500', N'天全县', N'TIAN1 QUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2507', N'511826', N'3', N'625600', N'芦山县', N'LU2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2508', N'511827', N'3', N'625700', N'宝兴县', N'BAO3 XING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2509', N'511900', N'2', N'636600', N'巴中市', N'BA1 ZHONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2510', N'511902', N'3', N'636001', N'巴州区', N'BA1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2511', N'511903', N'3', N'636001', N'恩阳区', N'EN1 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2512', N'511921', N'3', N'636700', N'通江县', N'TONG1 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2513', N'511922', N'3', N'636600', N'南江县', N'NAN2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2514', N'511923', N'3', N'636400', N'平昌县', N'PING2 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2515', N'512000', N'2', N'641300', N'资阳市', N'ZI1 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2516', N'512002', N'3', N'641300', N'雁江区', N'YAN4 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2517', N'512021', N'3', N'642350', N'安岳县', N'AN1 YUE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2518', N'512022', N'3', N'641500', N'乐至县', N'LE4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2519', N'513200', N'2', N'624000', N'阿坝藏族羌族自治州', N'A1 BA4 CANG2 ZU2 QIANG1 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2520', N'513201', N'3', N'624000', N'马尔康市', N'MA3 ER3 KANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2521', N'513221', N'3', N'623000', N'汶川县', N'WEN4 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2522', N'513222', N'3', N'623100', N'理县', N'LI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2523', N'513223', N'3', N'623200', N'茂县', N'MAO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2524', N'513224', N'3', N'623300', N'松潘县', N'SONG1 PAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2525', N'513225', N'3', N'623400', N'九寨沟县', N'JIU3 ZHAI4 GOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2526', N'513226', N'3', N'624100', N'金川县', N'JIN1 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2527', N'513227', N'3', N'624200', N'小金县', N'XIAO3 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2528', N'513228', N'3', N'623500', N'黑水县', N'HEI1 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2529', N'513230', N'3', N'624300', N'壤塘县', N'RANG3 TANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2530', N'513231', N'3', N'624600', N'阿坝县', N'A1 BA4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2531', N'513232', N'3', N'624500', N'若尔盖县', N'RE3 ER3 GAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2532', N'513233', N'3', N'624400', N'红原县', N'GONG1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2533', N'513300', N'2', N'626000', N'甘孜藏族自治州', N'GAN1 ZI1 CANG2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2534', N'513301', N'3', N'626000', N'康定市', N'KANG1 DING4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2535', N'513322', N'3', N'626100', N'泸定县', N'LU2 DING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2536', N'513323', N'3', N'626300', N'丹巴县', N'DAN1 BA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2537', N'513324', N'3', N'626200', N'九龙县', N'JIU3 LONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2538', N'513325', N'3', N'627450', N'雅江县', N'YA1 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2539', N'513326', N'3', N'626400', N'道孚县', N'DAO1 FU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2540', N'513327', N'3', N'626500', N'炉霍县', N'LU2 HUO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2541', N'513328', N'3', N'626700', N'甘孜县', N'GAN1 ZI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2542', N'513329', N'3', N'626800', N'新龙县', N'XIN1 LONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2543', N'513330', N'3', N'627250', N'德格县', N'DE2 GE1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2544', N'513331', N'3', N'627150', N'白玉县', N'BAI2 YU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2545', N'513332', N'3', N'627350', N'石渠县', N'SHI2 QU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2546', N'513333', N'3', N'626600', N'色达县', N'SE4 DA2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2547', N'513334', N'3', N'627550', N'理塘县', N'LI3 TANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2548', N'513335', N'3', N'627650', N'巴塘县', N'BA1 TANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2549', N'513336', N'3', N'627850', N'乡城县', N'XIANG1 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2550', N'513337', N'3', N'627750', N'稻城县', N'DAO4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2551', N'513338', N'3', N'627950', N'得荣县', N'DE2 RONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2552', N'513400', N'2', N'615000', N'凉山彝族自治州', N'LIANG2 SHAN1 YI2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2553', N'513401', N'3', N'615000', N'西昌市', N'XI1 CHANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2554', N'513422', N'3', N'615800', N'木里藏族自治县', N'MU4 LI3 CANG2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2555', N'513423', N'3', N'615700', N'盐源县', N'YAN2 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2556', N'513424', N'3', N'615500', N'德昌县', N'DE2 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2557', N'513425', N'3', N'615100', N'会理县', N'HUI4 LI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2558', N'513426', N'3', N'615200', N'会东县', N'HUI4 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2559', N'513427', N'3', N'615400', N'宁南县', N'NING2 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2560', N'513428', N'3', N'615300', N'普格县', N'PU3 GE1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2561', N'513429', N'3', N'615350', N'布拖县', N'BU4 TUO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2562', N'513430', N'3', N'616250', N'金阳县', N'JIN1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2563', N'513431', N'3', N'616150', N'昭觉县', N'ZHAO1 JIAO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2564', N'513432', N'3', N'616750', N'喜德县', N'XI3 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2565', N'513433', N'3', N'615600', N'冕宁县', N'MIAN3 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2566', N'513434', N'3', N'616650', N'越西县', N'YUE4 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2567', N'513435', N'3', N'616850', N'甘洛县', N'GAN1 LUO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2568', N'513436', N'3', N'616450', N'美姑县', N'MEI3 GU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2569', N'513437', N'3', N'616550', N'雷波县', N'LEI2 BO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2570', N'520000', N'1', N'0', N'贵州省', N'GUI4 ZHOU1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2571', N'520100', N'2', N'550000', N'贵阳市', N'GUI4 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2572', N'520102', N'3', N'550001', N'南明区', N'NAN2 MING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2573', N'520103', N'3', N'550001', N'云岩区', N'YUN2 YAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2574', N'520111', N'3', N'550025', N'花溪区', N'HUA1 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2575', N'520112', N'3', N'550018', N'乌当区', N'WU1 DANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2576', N'520113', N'3', N'550014', N'白云区', N'BAI2 YUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2577', N'520115', N'3', N'550009', N'观山湖区', N'GUAN1 SHAN1 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2578', N'520121', N'3', N'550300', N'开阳县', N'KAI1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2579', N'520122', N'3', N'551100', N'息烽县', N'XI1 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2580', N'520123', N'3', N'550200', N'修文县', N'XIU1 WEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2581', N'520181', N'3', N'551400', N'清镇市', N'QING1 ZHEN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2582', N'520200', N'2', N'553000', N'六盘水市', N'LIU4 PAN2 SHUI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2583', N'520201', N'3', N'553000', N'钟山区', N'ZHONG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2584', N'520203', N'3', N'553400', N'六枝特区', N'LIU4 ZHI1 TE4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2585', N'520221', N'3', N'553000', N'水城县', N'SHUI3 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2586', N'520281', N'3', N'561601', N'盘州市', N'PAN2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2587', N'520300', N'2', N'563000', N'遵义市', N'ZUN1 YI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2588', N'520302', N'3', N'563000', N'红花岗区', N'GONG1 HUA1 GANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2589', N'520303', N'3', N'563000', N'汇川区', N'HUI4 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2590', N'520304', N'3', N'563000', N'播州区', N'BO1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2591', N'520322', N'3', N'563200', N'桐梓县', N'TONG2 ZI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2592', N'520323', N'3', N'563300', N'绥阳县', N'SUI2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2593', N'520324', N'3', N'563400', N'正安县', N'ZHENG1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2594', N'520325', N'3', N'563500', N'道真仡佬族苗族自治县', N'DAO1 ZHEN1 GE1 LAO3 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2595', N'520326', N'3', N'564300', N'务川仡佬族苗族自治县', N'WU4 CHUAN1 GE1 LAO3 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2596', N'520327', N'3', N'564200', N'凤冈县', N'FENG4 GANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2597', N'520328', N'3', N'564100', N'湄潭县', N'MEI2 TAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2598', N'520329', N'3', N'564400', N'余庆县', N'YU2 QING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2599', N'520330', N'3', N'564600', N'习水县', N'XI2 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2600', N'520381', N'3', N'564700', N'赤水市', N'CHI4 SHUI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2601', N'520382', N'3', N'564500', N'仁怀市', N'REN2 HUAI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2602', N'520400', N'2', N'561000', N'安顺市', N'AN1 SHUN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2603', N'520402', N'3', N'561000', N'西秀区', N'XI1 XIU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2604', N'520403', N'3', N'561100', N'平坝区', N'PING2 BA4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2605', N'520422', N'3', N'562100', N'普定县', N'PU3 DING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2606', N'520423', N'3', N'561200', N'镇宁布依族苗族自治县', N'ZHEN1 NING2 BU4 YI1 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2607', N'520424', N'3', N'561300', N'关岭布依族苗族自治县', N'GUAN1 LING3 BU4 YI1 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2608', N'520425', N'3', N'550800', N'紫云苗族布依族自治县', N'ZI3 YUN2 MIAO2 ZU2 BU4 YI1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2609', N'520500', N'2', N'551700', N'毕节市', N'BI4 JIE1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2610', N'520502', N'3', N'551700', N'七星关区', N'QI1 XING1 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2611', N'520521', N'3', N'551600', N'大方县', N'DA4 FANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2612', N'520522', N'3', N'551500', N'黔西县', N'QIAN2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2613', N'520523', N'3', N'551800', N'金沙县', N'JIN1 SHA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2614', N'520524', N'3', N'552100', N'织金县', N'ZHI1 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2615', N'520525', N'3', N'553300', N'纳雍县', N'NA4 YONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2616', N'520526', N'3', N'553100', N'威宁彝族回族苗族自治县', N'WEI1 NING2 YI2 ZU2 HUI2 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2617', N'520527', N'3', N'553200', N'赫章县', N'HE4 ZHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2618', N'520600', N'2', N'554300', N'铜仁市', N'TONG2 REN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2619', N'520602', N'3', N'554300', N'碧江区', N'BI4 JIANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2620', N'520603', N'3', N'554300', N'万山区', N'MO4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2621', N'520621', N'3', N'554400', N'江口县', N'JIANG1 KOU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2622', N'520622', N'3', N'554004', N'玉屏侗族自治县', N'YU4 BING1 DONG4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2623', N'520623', N'3', N'555100', N'石阡县', N'SHI2 QIAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2624', N'520624', N'3', N'565100', N'思南县', N'SAI1 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2625', N'520625', N'3', N'555200', N'印江土家族苗族自治县', N'YIN4 JIANG1 TU3 GU1 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2626', N'520626', N'3', N'565200', N'德江县', N'DE2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2627', N'520627', N'3', N'565300', N'沿河土家族自治县', N'YAN2 HE2 TU3 GU1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2628', N'520628', N'3', N'554100', N'松桃苗族自治县', N'SONG1 TAO2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2629', N'522300', N'2', N'562400', N'黔西南布依族苗族自治州', N'QIAN2 XI1 NAN2 BU4 YI1 ZU2 MIAO2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2630', N'522301', N'3', N'562400', N'兴义市', N'XING1 YI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2631', N'522322', N'3', N'562300', N'兴仁县', N'XING1 REN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2632', N'522323', N'3', N'561500', N'普安县', N'PU3 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2633', N'522324', N'3', N'561400', N'晴隆县', N'QING2 LONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2634', N'522325', N'3', N'562200', N'贞丰县', N'ZHEN1 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2635', N'522326', N'3', N'552300', N'望谟县', N'WANG4 MO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2636', N'522327', N'3', N'552200', N'册亨县', N'CE4 HENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2637', N'522328', N'3', N'552400', N'安龙县', N'AN1 LONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2638', N'522600', N'2', N'556000', N'黔东南苗族侗族自治州', N'QIAN2 DONG1 NAN2 MIAO2 ZU2 DONG4 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2639', N'522601', N'3', N'556000', N'凯里市', N'KAI3 LI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2640', N'522622', N'3', N'556100', N'黄平县', N'HUANG2 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2641', N'522623', N'3', N'556200', N'施秉县', N'SHI1 BING3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2642', N'522624', N'3', N'556500', N'三穗县', N'SAN1 SUI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2643', N'522625', N'3', N'557700', N'镇远县', N'ZHEN1 YUAN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2644', N'522626', N'3', N'557800', N'岑巩县', N'CEN2 GONG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2645', N'522627', N'3', N'556600', N'天柱县', N'TIAN1 ZHU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2646', N'522628', N'3', N'556700', N'锦屏县', N'JIN3 BING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2647', N'522629', N'3', N'556400', N'剑河县', N'JIAN4 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2648', N'522630', N'3', N'556300', N'台江县', N'TAI1 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2649', N'522631', N'3', N'557300', N'黎平县', N'LI2 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2650', N'522632', N'3', N'557200', N'榕江县', N'RONG2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2651', N'522633', N'3', N'557400', N'从江县', N'CONG2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2652', N'522634', N'3', N'557100', N'雷山县', N'LEI2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2653', N'522635', N'3', N'557600', N'麻江县', N'MA1 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2654', N'522636', N'3', N'557500', N'丹寨县', N'DAN1 ZHAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2655', N'522700', N'2', N'558000', N'黔南布依族苗族自治州', N'QIAN2 NAN2 BU4 YI1 ZU2 MIAO2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2656', N'522701', N'3', N'558000', N'都匀市', N'DOU1 YUN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2657', N'522702', N'3', N'550500', N'福泉市', N'FU2 QUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2658', N'522722', N'3', N'558400', N'荔波县', N'LI4 BO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2659', N'522723', N'3', N'551300', N'贵定县', N'GUI4 DING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2660', N'522725', N'3', N'550400', N'瓮安县', N'WENG4 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2661', N'522726', N'3', N'558200', N'独山县', N'DU2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2662', N'522727', N'3', N'558300', N'平塘县', N'PING2 TANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2663', N'522728', N'3', N'550100', N'罗甸县', N'LUO2 DIAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2664', N'522729', N'3', N'550700', N'长顺县', N'CHANG2 SHUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2665', N'522730', N'3', N'551200', N'龙里县', N'LONG2 LI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2666', N'522731', N'3', N'550600', N'惠水县', N'HUI4 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2667', N'522732', N'3', N'558100', N'三都水族自治县', N'SAN1 DOU1 SHUI3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2668', N'530000', N'1', N'0', N'云南省', N'YUN2 NAN2 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2669', N'530100', N'2', N'650000', N'昆明市', N'KUN1 MING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2670', N'530102', N'3', N'650032', N'五华区', N'WU3 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2671', N'530103', N'3', N'650051', N'盘龙区', N'PAN2 LONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2672', N'530111', N'3', N'650217', N'官渡区', N'GUAN1 DU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2673', N'530112', N'3', N'650100', N'西山区', N'XI1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2674', N'530113', N'3', N'654100', N'东川区', N'DONG1 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2675', N'530114', N'3', N'650000', N'呈贡区', N'CHENG2 GONG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2676', N'530115', N'3', N'650600', N'晋宁区', N'JIN4 NING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2677', N'530124', N'3', N'650400', N'富民县', N'FU4 MIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2678', N'530125', N'3', N'652100', N'宜良县', N'YI2 LIANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2679', N'530126', N'3', N'652200', N'石林彝族自治县', N'SHI2 LIN2 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2680', N'530127', N'3', N'651700', N'嵩明县', N'SONG1 MING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2681', N'530128', N'3', N'651500', N'禄劝彝族苗族自治县', N'LU4 QUAN4 YI2 ZU2 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2682', N'530129', N'3', N'655200', N'寻甸回族彝族自治县', N'XUN2 DIAN4 HUI2 ZU2 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2683', N'530181', N'3', N'650300', N'安宁市', N'AN1 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2684', N'530300', N'2', N'655000', N'曲靖市', N'QU1 JING4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2685', N'530302', N'3', N'655000', N'麒麟区', N'QI2 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2686', N'530303', N'3', N'655331', N'沾益区', N'ZHAN1 YI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2687', N'530321', N'3', N'655100', N'马龙县', N'MA3 LONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2688', N'530322', N'3', N'655600', N'陆良县', N'LIU4 LIANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2689', N'530323', N'3', N'655700', N'师宗县', N'SHI1 ZONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2690', N'530324', N'3', N'655800', N'罗平县', N'LUO2 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2691', N'530325', N'3', N'655500', N'富源县', N'FU4 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2692', N'530326', N'3', N'654200', N'会泽县', N'HUI4 ZE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2693', N'530381', N'3', N'655400', N'宣威市', N'XUAN1 WEI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2694', N'530400', N'2', N'653100', N'玉溪市', N'YU4 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2695', N'530402', N'3', N'653100', N'红塔区', N'GONG1 DA5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2696', N'530403', N'3', N'652600', N'江川区', N'JIANG1 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2697', N'530422', N'3', N'652500', N'澄江县', N'CHENG2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2698', N'530423', N'3', N'652700', N'通海县', N'TONG1 HAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2699', N'530424', N'3', N'652800', N'华宁县', N'HUA1 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2700', N'530425', N'3', N'651100', N'易门县', N'YI4 MEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2701', N'530426', N'3', N'653200', N'峨山彝族自治县', N'E2 SHAN1 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2702', N'530427', N'3', N'653400', N'新平彝族傣族自治县', N'XIN1 PING2 YI2 ZU2 DAI3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2703', N'530428', N'3', N'653300', N'元江哈尼族彝族傣族自治县', N'YUAN2 JIANG1 HA1 NI2 ZU2 YI2 ZU2 DAI3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2704', N'530500', N'2', N'678000', N'保山市', N'BAO3 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2705', N'530502', N'3', N'678000', N'隆阳区', N'LONG1 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2706', N'530521', N'3', N'678200', N'施甸县', N'SHI1 DIAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2707', N'530523', N'3', N'678300', N'龙陵县', N'LONG2 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2708', N'530524', N'3', N'678100', N'昌宁县', N'CHANG1 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2709', N'530581', N'3', N'679100', N'腾冲市', N'TENG1 CHONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2710', N'530600', N'2', N'657000', N'昭通市', N'ZHAO1 TONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2711', N'530602', N'3', N'657000', N'昭阳区', N'ZHAO1 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2712', N'530621', N'3', N'657100', N'鲁甸县', N'LU3 DIAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2713', N'530622', N'3', N'654600', N'巧家县', N'QIAO3 GU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2714', N'530623', N'3', N'657500', N'盐津县', N'YAN2 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2715', N'530624', N'3', N'657400', N'大关县', N'DA4 GUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2716', N'530625', N'3', N'657300', N'永善县', N'YONG3 SHAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2717', N'530626', N'3', N'657700', N'绥江县', N'SUI2 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2718', N'530627', N'3', N'657200', N'镇雄县', N'ZHEN1 XIONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2719', N'530628', N'3', N'657600', N'彝良县', N'YI2 LIANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2720', N'530629', N'3', N'657900', N'威信县', N'WEI1 XIN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2721', N'530630', N'3', N'657800', N'水富县', N'SHUI3 FU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2722', N'530700', N'2', N'674100', N'丽江市', N'LI2 JIANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2723', N'530702', N'3', N'674100', N'古城区', N'GU3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2724', N'530721', N'3', N'674100', N'玉龙纳西族自治县', N'YU4 LONG2 NA4 XI1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2725', N'530722', N'3', N'674200', N'永胜县', N'YONG3 SHENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2726', N'530723', N'3', N'674800', N'华坪县', N'HUA1 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2727', N'530724', N'3', N'674300', N'宁蒗彝族自治县', N'NING2 LANG4 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2728', N'530800', N'2', N'0', N'普洱市', N'PU3 ER3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2729', N'530802', N'3', N'665000', N'思茅区', N'SAI1 MAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2730', N'530821', N'3', N'665100', N'宁洱哈尼族彝族自治县', N'NING2 ER3 HA1 NI2 ZU2 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2731', N'530822', N'3', N'654800', N'墨江哈尼族自治县', N'MO4 JIANG1 HA1 NI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2732', N'530823', N'3', N'676200', N'景东彝族自治县', N'JING3 DONG1 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2733', N'530824', N'3', N'666400', N'景谷傣族彝族自治县', N'JING3 GU3 DAI3 ZU2 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2734', N'530825', N'3', N'666500', N'镇沅彝族哈尼族拉祜族自治县', N'ZHEN1 YUAN2 YI2 ZU2 HA1 NI2 ZU2 LA1 HU4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2735', N'530826', N'3', N'665900', N'江城哈尼族彝族自治县', N'JIANG1 CHENG2 HA1 NI2 ZU2 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2736', N'530827', N'3', N'665800', N'孟连傣族拉祜族佤族自治县', N'MENG4 LIAN2 DAI3 ZU2 LA1 HU4 ZU2 WA3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2737', N'530828', N'3', N'665600', N'澜沧拉祜族自治县', N'LAN2 CANG1 LA1 HU4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2738', N'530829', N'3', N'665700', N'西盟佤族自治县', N'XI1 MENG2 WA3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2739', N'530900', N'2', N'677000', N'临沧市', N'LIN2 CANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2740', N'530902', N'3', N'677000', N'临翔区', N'LIN2 XIANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2741', N'530921', N'3', N'675900', N'凤庆县', N'FENG4 QING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2742', N'530922', N'3', N'675800', N'云县', N'YUN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2743', N'530923', N'3', N'677600', N'永德县', N'YONG3 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2744', N'530924', N'3', N'677704', N'镇康县', N'ZHEN1 KANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2745', N'530925', N'3', N'677300', N'双江拉祜族佤族布朗族傣族自治县', N'SHUANG1 JIANG1 LA1 HU4 ZU2 WA3 ZU2 BU4 LANG3 ZU2 DAI3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2746', N'530926', N'3', N'677500', N'耿马傣族佤族自治县', N'GENG3 MA3 DAI3 ZU2 WA3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2747', N'530927', N'3', N'677400', N'沧源佤族自治县', N'CANG1 YUAN2 WA3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2748', N'532300', N'2', N'675000', N'楚雄彝族自治州', N'CHU3 XIONG2 YI2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2749', N'532301', N'3', N'675000', N'楚雄市', N'CHU3 XIONG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2750', N'532322', N'3', N'675100', N'双柏县', N'SHUANG1 BAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2751', N'532323', N'3', N'675500', N'牟定县', N'MOU2 DING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2752', N'532324', N'3', N'675200', N'南华县', N'NAN2 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2753', N'532325', N'3', N'675300', N'姚安县', N'YAO2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2754', N'532326', N'3', N'675400', N'大姚县', N'DA4 YAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2755', N'532327', N'3', N'651400', N'永仁县', N'YONG3 REN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2756', N'532328', N'3', N'651300', N'元谋县', N'YUAN2 MOU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2757', N'532329', N'3', N'651600', N'武定县', N'WU3 DING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2758', N'532331', N'3', N'651200', N'禄丰县', N'LU4 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2759', N'532500', N'2', N'661400', N'红河哈尼族彝族自治州', N'GONG1 HE2 HA1 NI2 ZU2 YI2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2760', N'532501', N'3', N'661000', N'个旧市', N'GE3 JIU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2761', N'532502', N'3', N'661600', N'开远市', N'KAI1 YUAN3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2762', N'532503', N'3', N'661400', N'蒙自市', N'MENG1 ZI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2763', N'532504', N'3', N'652399', N'弥勒市', N'MI2 LE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2764', N'532523', N'3', N'661200', N'屏边苗族自治县', N'BING1 BIAN1 MIAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2765', N'532524', N'3', N'654300', N'建水县', N'JIAN4 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2766', N'532525', N'3', N'654300', N'石屏县', N'SHI2 BING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2767', N'532527', N'3', N'652400', N'泸西县', N'LU2 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2768', N'532528', N'3', N'662400', N'元阳县', N'YUAN2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2769', N'532529', N'3', N'654400', N'红河县', N'GONG1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2770', N'532530', N'3', N'661500', N'金平苗族瑶族傣族自治县', N'JIN1 PING2 MIAO2 ZU2 YAO2 ZU2 DAI3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2771', N'532531', N'3', N'662500', N'绿春县', N'LU4 CHUN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2772', N'532532', N'3', N'661300', N'河口瑶族自治县', N'HE2 KOU3 YAO2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2773', N'532600', N'2', N'663000', N'文山壮族苗族自治州', N'WEN2 SHAN1 ZHUANG4 ZU2 MIAO2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2774', N'532601', N'3', N'663000', N'文山市', N'WEN2 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2775', N'532622', N'3', N'663100', N'砚山县', N'YAN4 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2776', N'532623', N'3', N'663500', N'西畴县', N'XI1 CHOU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2777', N'532624', N'3', N'663600', N'麻栗坡县', N'MA1 LI4 PO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2778', N'532625', N'3', N'663700', N'马关县', N'MA3 GUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2779', N'532626', N'3', N'663200', N'丘北县', N'QIU1 BEI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2780', N'532627', N'3', N'663300', N'广南县', N'GUANG3 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2781', N'532628', N'3', N'663400', N'富宁县', N'FU4 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2782', N'532800', N'2', N'666100', N'西双版纳傣族自治州', N'XI1 SHUANG1 BAN3 NA4 DAI3 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2783', N'532801', N'3', N'666100', N'景洪市', N'JING3 HONG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2784', N'532822', N'3', N'666200', N'勐海县', N'MENG3 HAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2785', N'532823', N'3', N'666300', N'勐腊县', N'MENG3 LA4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2786', N'532900', N'2', N'671000', N'大理白族自治州', N'DA4 LI3 BAI2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2787', N'532901', N'3', N'671000', N'大理市', N'DA4 LI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2788', N'532922', N'3', N'672500', N'漾濞彝族自治县', N'YANG4 BI4 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2789', N'532923', N'3', N'672100', N'祥云县', N'XIANG2 YUN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2790', N'532924', N'3', N'671600', N'宾川县', N'BIN1 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2791', N'532925', N'3', N'675600', N'弥渡县', N'MI2 DU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2792', N'532926', N'3', N'675700', N'南涧彝族自治县', N'NAN2 JIAN4 YI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2793', N'532927', N'3', N'672400', N'巍山彝族回族自治县', N'WEI1 SHAN1 YI2 ZU2 HUI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2794', N'532928', N'3', N'672600', N'永平县', N'YONG3 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2795', N'532929', N'3', N'672700', N'云龙县', N'YUN2 LONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2796', N'532930', N'3', N'671200', N'洱源县', N'ER3 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2797', N'532931', N'3', N'671300', N'剑川县', N'JIAN4 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2798', N'532932', N'3', N'671500', N'鹤庆县', N'HE4 QING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2799', N'533100', N'2', N'678400', N'德宏傣族景颇族自治州', N'DE2 HONG2 DAI3 ZU2 JING3 PO1 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2800', N'533102', N'3', N'678600', N'瑞丽市', N'RUI4 LI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2801', N'533103', N'3', N'678400', N'芒市', N'MANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2802', N'533122', N'3', N'679200', N'梁河县', N'LIANG2 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2803', N'533123', N'3', N'679300', N'盈江县', N'YING1 JIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2804', N'533124', N'3', N'678700', N'陇川县', N'LONG3 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2805', N'533300', N'2', N'673100', N'怒江傈僳族自治州', N'NU4 JIANG1 LI4 SU4 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2806', N'533301', N'3', N'673100', N'泸水市', N'LU2 SHUI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2807', N'533323', N'3', N'673400', N'福贡县', N'FU2 GONG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2808', N'533324', N'3', N'673500', N'贡山独龙族怒族自治县', N'GONG4 SHAN1 DU2 LONG2 ZU2 NU4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2809', N'533325', N'3', N'671400', N'兰坪白族普米族自治县', N'LAN2 PING2 BAI2 ZU2 PU3 MI3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2810', N'533400', N'2', N'674400', N'迪庆藏族自治州', N'DI2 QING4 CANG2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2811', N'533401', N'3', N'674400', N'香格里拉市', N'XIANG1 GE1 LI3 LA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2812', N'533422', N'3', N'674500', N'德钦县', N'DE2 QIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2813', N'533423', N'3', N'674600', N'维西傈僳族自治县', N'WEI2 XI1 LI4 SU4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2814', N'540000', N'1', N'0', N'西藏自治区', N'XI1 CANG2 ZI4 ZHI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2815', N'540100', N'2', N'850000', N'拉萨市', N'LA1 SA4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2816', N'540102', N'3', N'850000', N'城关区', N'CHENG2 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2817', N'540103', N'3', N'851400', N'堆龙德庆区', N'DUI1 LONG2 DE2 QING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2818', N'540104', N'3', N'850100', N'达孜区', N'DA2 ZI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2819', N'540121', N'3', N'852000', N'林周县', N'LIN2 ZHOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2820', N'540122', N'3', N'851500', N'当雄县', N'DANG1 XIONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2821', N'540123', N'3', N'851300', N'尼木县', N'NI2 MU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2822', N'540124', N'3', N'850600', N'曲水县', N'QU1 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2823', N'540127', N'3', N'850200', N'墨竹工卡县', N'MO4 ZHU2 GONG1 KA3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2824', N'540200', N'2', N'857000', N'日喀则市', N'RI4 KA1 ZE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2825', N'540202', N'3', N'857000', N'桑珠孜区', N'SANG1 ZHU1 ZI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2826', N'540221', N'3', N'857100', N'南木林县', N'NAN2 MU4 LIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2827', N'540222', N'3', N'857400', N'江孜县', N'JIANG1 ZI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2828', N'540223', N'3', N'858200', N'定日县', N'DING4 RI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2829', N'540224', N'3', N'857800', N'萨迦县', N'SA4 JIA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2830', N'540225', N'3', N'858100', N'拉孜县', N'LA1 ZI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2831', N'540226', N'3', N'858500', N'昂仁县', N'ANG2 REN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2832', N'540227', N'3', N'858900', N'谢通门县', N'XIE4 TONG1 MEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2833', N'540228', N'3', N'857300', N'白朗县', N'BAI2 LANG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2834', N'540229', N'3', N'857200', N'仁布县', N'REN2 BU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2835', N'540230', N'3', N'857500', N'康马县', N'KANG1 MA3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2836', N'540231', N'3', N'857900', N'定结县', N'DING4 JIE1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2837', N'540232', N'3', N'858800', N'仲巴县', N'ZHONG4 BA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2838', N'540233', N'3', N'857600', N'亚东县', N'YA4 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2839', N'540234', N'3', N'858700', N'吉隆县', N'JI2 LONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2840', N'540235', N'3', N'858300', N'聂拉木县', N'NIE4 LA1 MU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2841', N'540236', N'3', N'857800', N'萨嘎县', N'SA4 GA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2842', N'540237', N'3', N'857700', N'岗巴县', N'GANG1 BA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2843', N'540300', N'2', N'854000', N'昌都市', N'CHANG1 DOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2844', N'540302', N'3', N'854000', N'卡若区', N'KA3 RE3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2845', N'540321', N'3', N'854100', N'江达县', N'JIANG1 DA2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2846', N'540322', N'3', N'854200', N'贡觉县', N'GONG4 JIAO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2847', N'540323', N'3', N'855600', N'类乌齐县', N'LEI4 WU1 JI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2848', N'540324', N'3', N'855700', N'丁青县', N'DING1 QING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2849', N'540325', N'3', N'854300', N'察雅县', N'CHA2 YA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2850', N'540326', N'3', N'854600', N'八宿县', N'BA1 SU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2851', N'540327', N'3', N'854400', N'左贡县', N'ZUO3 GONG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2852', N'540328', N'3', N'854500', N'芒康县', N'MANG2 KANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2853', N'540329', N'3', N'855400', N'洛隆县', N'LUO4 LONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2854', N'540330', N'3', N'855500', N'边坝县', N'BIAN1 BA4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2855', N'540400', N'2', N'860000', N'林芝市', N'LIN2 ZHI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2856', N'540402', N'3', N'850400', N'巴宜区', N'BA1 YI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2857', N'540421', N'3', N'850300', N'工布江达县', N'GONG1 BU4 JIANG1 DA2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2858', N'540422', N'3', N'860500', N'米林县', N'MI3 LIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2859', N'540423', N'3', N'855300', N'墨脱县', N'MO4 TUO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2860', N'540424', N'3', N'855200', N'波密县', N'BO1 MI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2861', N'540425', N'3', N'855100', N'察隅县', N'CHA2 YU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2862', N'540426', N'3', N'856500', N'朗县', N'LANG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2863', N'540500', N'2', N'856000', N'山南市', N'SHAN1 NAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2864', N'540502', N'3', N'856100', N'乃东区', N'NAI3 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2865', N'540521', N'3', N'850800', N'扎囊县', N'ZA1 NANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2866', N'540522', N'3', N'850700', N'贡嘎县', N'GONG4 GA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2867', N'540523', N'3', N'856200', N'桑日县', N'SANG1 RI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2868', N'540524', N'3', N'856800', N'琼结县', N'QIONG2 JIE1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2869', N'540525', N'3', N'856300', N'曲松县', N'QU1 SONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2870', N'540526', N'3', N'856900', N'措美县', N'CUO4 MEI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2871', N'540527', N'3', N'851200', N'洛扎县', N'LUO4 ZA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2872', N'540528', N'3', N'856400', N'加查县', N'JIA1 CHA2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2873', N'540529', N'3', N'856600', N'隆子县', N'LONG1 ZI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2874', N'540530', N'3', N'856700', N'错那县', N'CUO4 NA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2875', N'540531', N'3', N'851000', N'浪卡子县', N'LANG4 KA3 ZI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2876', N'542400', N'2', N'0', N'那曲地区', N'NA1 QU1 DE5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2877', N'542421', N'3', N'852000', N'那曲县', N'NA1 QU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2878', N'542422', N'3', N'852400', N'嘉黎县', N'JIA1 LI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2879', N'542423', N'3', N'852300', N'比如县', N'BI3 RU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2880', N'542424', N'3', N'853500', N'聂荣县', N'NIE4 RONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2881', N'542425', N'3', N'852600', N'安多县', N'AN1 DUO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2882', N'542426', N'3', N'853100', N'申扎县', N'SHEN1 ZA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2883', N'542427', N'3', N'852200', N'索县', N'SUO3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2884', N'542428', N'3', N'852500', N'班戈县', N'BAN1 GE1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2885', N'542429', N'3', N'852100', N'巴青县', N'BA1 QING1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2886', N'542430', N'3', N'853200', N'尼玛县', N'NI2 MA3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2887', N'542431', N'3', N'853300', N'双湖县', N'SHUANG1 HU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2888', N'542500', N'2', N'859000', N'阿里地区', N'A1 LI3 DE5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2889', N'542521', N'3', N'859500', N'普兰县', N'PU3 LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2890', N'542522', N'3', N'859600', N'札达县', N'ZHA2 DA2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2891', N'542523', N'3', N'859400', N'噶尔县', N'GA2 ER3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2892', N'542524', N'3', N'859700', N'日土县', N'RI4 TU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2893', N'542525', N'3', N'859100', N'革吉县', N'GE2 JI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2894', N'542526', N'3', N'859200', N'改则县', N'GAI3 ZE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2895', N'542527', N'3', N'859300', N'措勤县', N'CUO4 QIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2896', N'610000', N'1', N'0', N'陕西省', N'SHAN3 XI1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2897', N'610100', N'2', N'710000', N'西安市', N'XI1 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2898', N'610102', N'3', N'710004', N'新城区', N'XIN1 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2899', N'610103', N'3', N'710001', N'碑林区', N'BEI1 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2900', N'610104', N'3', N'710003', N'莲湖区', N'LIAN2 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2901', N'610111', N'3', N'710038', N'灞桥区', N'BA4 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2902', N'610112', N'3', N'710014', N'未央区', N'WEI4 YANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2903', N'610113', N'3', N'710061', N'雁塔区', N'YAN4 DA5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2904', N'610114', N'3', N'710087', N'阎良区', N'YAN2 LIANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2905', N'610115', N'3', N'710600', N'临潼区', N'LIN2 TONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2906', N'610116', N'3', N'710100', N'长安区', N'CHANG2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2907', N'610117', N'3', N'710200', N'高陵区', N'GAO1 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2908', N'610118', N'3', N'710300', N'鄠邑区', N'HU4 YI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2909', N'610122', N'3', N'710500', N'蓝田县', N'LAN2 TIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2910', N'610124', N'3', N'710400', N'周至县', N'ZHOU1 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2911', N'610200', N'2', N'727000', N'铜川市', N'TONG2 CHUAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2912', N'610202', N'3', N'727000', N'王益区', N'WANG2 YI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2913', N'610203', N'3', N'727007', N'印台区', N'YIN4 TAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2914', N'610204', N'3', N'727100', N'耀州区', N'YAO4 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2915', N'610222', N'3', N'727200', N'宜君县', N'YI2 JUN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2916', N'610300', N'2', N'721000', N'宝鸡市', N'BAO3 JI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2917', N'610302', N'3', N'721000', N'渭滨区', N'WEI4 BIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2918', N'610303', N'3', N'721000', N'金台区', N'JIN1 TAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2919', N'610304', N'3', N'721300', N'陈仓区', N'CHEN2 CANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2920', N'610322', N'3', N'721400', N'凤翔县', N'FENG4 XIANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2921', N'610323', N'3', N'722400', N'岐山县', N'QI2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2922', N'610324', N'3', N'722200', N'扶风县', N'FU2 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2923', N'610326', N'3', N'722300', N'眉县', N'MEI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2924', N'610327', N'3', N'721200', N'陇县', N'LONG3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2925', N'610328', N'3', N'721100', N'千阳县', N'QIAN1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2926', N'610329', N'3', N'721500', N'麟游县', N'LIN2 YOU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2927', N'610330', N'3', N'721700', N'凤县', N'FENG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2928', N'610331', N'3', N'721600', N'太白县', N'TAI4 BAI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2929', N'610400', N'2', N'712000', N'咸阳市', N'XIAN2 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2930', N'610402', N'3', N'712000', N'秦都区', N'QIN2 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2931', N'610403', N'3', N'712100', N'杨陵区', N'YANG2 LING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2932', N'610404', N'3', N'712000', N'渭城区', N'WEI4 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2933', N'610422', N'3', N'713800', N'三原县', N'SAN1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2934', N'610423', N'3', N'713700', N'泾阳县', N'JING1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2935', N'610424', N'3', N'713300', N'乾县', N'GAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2936', N'610425', N'3', N'713200', N'礼泉县', N'LI3 QUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2937', N'610426', N'3', N'713400', N'永寿县', N'YONG3 SHOU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2938', N'610427', N'3', N'713500', N'彬州市', N'BIN1 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2939', N'610428', N'3', N'713600', N'长武县', N'CHANG2 WU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2940', N'610429', N'3', N'711300', N'旬邑县', N'XUN2 YI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2941', N'610430', N'3', N'711200', N'淳化县', N'CHUN2 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2942', N'610431', N'3', N'712200', N'武功县', N'WU3 GONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2943', N'610481', N'3', N'713100', N'兴平市', N'XING1 PING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2944', N'610500', N'2', N'714000', N'渭南市', N'WEI4 NAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2945', N'610502', N'3', N'714000', N'临渭区', N'LIN2 WEI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2946', N'610503', N'3', N'714100', N'华州区', N'HUA1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2947', N'610522', N'3', N'714300', N'潼关县', N'TONG2 GUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2948', N'610523', N'3', N'715100', N'大荔县', N'DA4 LI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2949', N'610524', N'3', N'715300', N'合阳县', N'GE3 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2950', N'610525', N'3', N'715200', N'澄城县', N'CHENG2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2951', N'610526', N'3', N'715500', N'蒲城县', N'PU2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2952', N'610527', N'3', N'715600', N'白水县', N'BAI2 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2953', N'610528', N'3', N'711700', N'富平县', N'FU4 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2954', N'610581', N'3', N'715400', N'韩城市', N'HAN2 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2955', N'610582', N'3', N'714200', N'华阴市', N'HUA1 YIN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2956', N'610600', N'2', N'716000', N'延安市', N'YAN2 AN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2957', N'610602', N'3', N'716000', N'宝塔区', N'BAO3 DA5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2958', N'610603', N'3', N'717400', N'安塞区', N'AN1 SAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2959', N'610621', N'3', N'717100', N'延长县', N'YAN2 CHANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2960', N'610622', N'3', N'717200', N'延川县', N'YAN2 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2961', N'610623', N'3', N'717300', N'子长县', N'ZI3 CHANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2962', N'610625', N'3', N'717500', N'志丹县', N'ZHI4 DAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2963', N'610626', N'3', N'716000', N'吴起县', N'WU2 QI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2964', N'610627', N'3', N'716100', N'甘泉县', N'GAN1 QUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2965', N'610628', N'3', N'727500', N'富县', N'FU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2966', N'610629', N'3', N'727400', N'洛川县', N'LUO4 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2967', N'610630', N'3', N'716200', N'宜川县', N'YI2 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2968', N'610631', N'3', N'715700', N'黄龙县', N'HUANG2 LONG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2969', N'610632', N'3', N'727300', N'黄陵县', N'HUANG2 LING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2970', N'610700', N'2', N'723000', N'汉中市', N'HAN4 ZHONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2971', N'610702', N'3', N'723000', N'汉台区', N'HAN4 TAI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2972', N'610703', N'3', N'723100', N'南郑区', N'NAN2 ZHENG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2973', N'610722', N'3', N'723200', N'城固县', N'CHENG2 GU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2974', N'610723', N'3', N'723300', N'洋县', N'XIANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2975', N'610724', N'3', N'723500', N'西乡县', N'XI1 XIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2976', N'610725', N'3', N'724200', N'勉县', N'MIAN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2977', N'610726', N'3', N'724400', N'宁强县', N'NING2 JIANG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2978', N'610727', N'3', N'724300', N'略阳县', N'LVE4 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2979', N'610728', N'3', N'723600', N'镇巴县', N'ZHEN1 BA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2980', N'610729', N'3', N'724100', N'留坝县', N'LIU2 BA4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2981', N'610730', N'3', N'723400', N'佛坪县', N'FO2 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2982', N'610800', N'2', N'719000', N'榆林市', N'YU2 LIN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2983', N'610802', N'3', N'719000', N'榆阳区', N'YU2 YANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2984', N'610803', N'3', N'719100', N'横山区', N'HENG2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2985', N'610822', N'3', N'719400', N'府谷县', N'FU3 GU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2986', N'610824', N'3', N'718500', N'靖边县', N'JING4 BIAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2987', N'610825', N'3', N'718600', N'定边县', N'DING4 BIAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2988', N'610826', N'3', N'718000', N'绥德县', N'SUI2 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2989', N'610827', N'3', N'718100', N'米脂县', N'MI3 ZHI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2990', N'610828', N'3', N'719200', N'佳县', N'JIA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2991', N'610829', N'3', N'718200', N'吴堡县', N'WU2 BAO3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2992', N'610830', N'3', N'718300', N'清涧县', N'QING1 JIAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2993', N'610831', N'3', N'718400', N'子洲县', N'ZI3 ZHOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2994', N'610881', N'3', N'719300', N'神木市', N'SHEN2 MU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2995', N'610900', N'2', N'725000', N'安康市', N'AN1 KANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2996', N'610902', N'3', N'725000', N'汉滨区', N'HAN4 BIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2997', N'610921', N'3', N'725100', N'汉阴县', N'HAN4 YIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2998', N'610922', N'3', N'725200', N'石泉县', N'SHI2 QUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'2999', N'610923', N'3', N'711600', N'宁陕县', N'NING2 SHAN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3000', N'610924', N'3', N'725300', N'紫阳县', N'ZI3 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3001', N'610925', N'3', N'725400', N'岚皋县', N'LAN2 GAO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3002', N'610926', N'3', N'725500', N'平利县', N'PING2 LI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3003', N'610927', N'3', N'725600', N'镇坪县', N'ZHEN1 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3004', N'610928', N'3', N'725700', N'旬阳县', N'XUN2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3005', N'610929', N'3', N'725800', N'白河县', N'BAI2 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3006', N'611000', N'2', N'726000', N'商洛市', N'SHANG1 LUO4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3007', N'611002', N'3', N'726000', N'商州区', N'SHANG1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3008', N'611021', N'3', N'726100', N'洛南县', N'LUO4 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3009', N'611022', N'3', N'726200', N'丹凤县', N'DAN1 FENG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3010', N'611023', N'3', N'726300', N'商南县', N'SHANG1 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3011', N'611024', N'3', N'726400', N'山阳县', N'SHAN1 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3012', N'611025', N'3', N'711500', N'镇安县', N'ZHEN1 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3013', N'611026', N'3', N'711400', N'柞水县', N'ZHA4 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3014', N'620000', N'1', N'0', N'甘肃省', N'GAN1 SU4 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3015', N'620100', N'2', N'730000', N'兰州市', N'LAN2 ZHOU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3016', N'620102', N'3', N'730030', N'城关区', N'CHENG2 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3017', N'620103', N'3', N'730050', N'七里河区', N'QI1 LI3 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3018', N'620104', N'3', N'730060', N'西固区', N'XI1 GU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3019', N'620105', N'3', N'730070', N'安宁区', N'AN1 NING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3020', N'620111', N'3', N'730080', N'红古区', N'GONG1 GU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3021', N'620121', N'3', N'730300', N'永登县', N'YONG3 DENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3022', N'620122', N'3', N'730200', N'皋兰县', N'GAO1 LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3023', N'620123', N'3', N'730100', N'榆中县', N'YU2 ZHONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3024', N'620200', N'2', N'735100', N'嘉峪关市', N'JIA1 YU4 GUAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3025', N'620201', N'3', N'735100', N'雄关区', N'XIONG2 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3026', N'620202', N'3', N'735100', N'镜铁区', N'JING4 TIE3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3027', N'620203', N'3', N'735100', N'长城区', N'CHANG2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3028', N'620300', N'2', N'737100', N'金昌市', N'JIN1 CHANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3029', N'620302', N'3', N'737103', N'金川区', N'JIN1 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3030', N'620321', N'3', N'737200', N'永昌县', N'YONG3 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3031', N'620400', N'2', N'730900', N'白银市', N'BAI2 YIN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3032', N'620402', N'3', N'730900', N'白银区', N'BAI2 YIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3033', N'620403', N'3', N'730913', N'平川区', N'PING2 CHUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3034', N'620421', N'3', N'730600', N'靖远县', N'JING4 YUAN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3035', N'620422', N'3', N'730700', N'会宁县', N'HUI4 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3036', N'620423', N'3', N'730400', N'景泰县', N'JING3 TAI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3037', N'620500', N'2', N'741000', N'天水市', N'TIAN1 SHUI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3038', N'620502', N'3', N'741000', N'秦州区', N'QIN2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3039', N'620503', N'3', N'741020', N'麦积区', N'MAI4 JI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3040', N'620521', N'3', N'741400', N'清水县', N'QING1 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3041', N'620522', N'3', N'741600', N'秦安县', N'QIN2 AN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3042', N'620523', N'3', N'741200', N'甘谷县', N'GAN1 GU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3043', N'620524', N'3', N'741300', N'武山县', N'WU3 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3044', N'620525', N'3', N'741500', N'张家川回族自治县', N'ZHANG1 GU1 CHUAN1 HUI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3045', N'620600', N'2', N'733000', N'武威市', N'WU3 WEI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3046', N'620602', N'3', N'733000', N'凉州区', N'LIANG2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3047', N'620621', N'3', N'733300', N'民勤县', N'MIN2 QIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3048', N'620622', N'3', N'733100', N'古浪县', N'GU3 LANG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3049', N'620623', N'3', N'733200', N'天祝藏族自治县', N'TIAN1 ZHU4 CANG2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3050', N'620700', N'2', N'734000', N'张掖市', N'ZHANG1 YE1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3051', N'620702', N'3', N'734000', N'甘州区', N'GAN1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3052', N'620721', N'3', N'734400', N'肃南裕固族自治县', N'SU4 NAN2 YU4 GU4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3053', N'620722', N'3', N'734500', N'民乐县', N'MIN2 LE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3054', N'620723', N'3', N'734200', N'临泽县', N'LIN2 ZE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3055', N'620724', N'3', N'734300', N'高台县', N'GAO1 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3056', N'620725', N'3', N'734100', N'山丹县', N'SHAN1 DAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3057', N'620800', N'2', N'744000', N'平凉市', N'PING2 LIANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3058', N'620802', N'3', N'744000', N'崆峒区', N'KONG1 DONG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3059', N'620821', N'3', N'744300', N'泾川县', N'JING1 CHUAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3060', N'620822', N'3', N'744400', N'灵台县', N'LING2 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3061', N'620823', N'3', N'744200', N'崇信县', N'CHONG2 XIN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3062', N'620824', N'3', N'744100', N'华亭县', N'HUA1 TING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3063', N'620825', N'3', N'744600', N'庄浪县', N'ZHUANG1 LANG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3064', N'620826', N'3', N'743400', N'静宁县', N'JING4 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3065', N'620900', N'2', N'735000', N'酒泉市', N'JIU3 QUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3066', N'620902', N'3', N'735000', N'肃州区', N'SU4 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3067', N'620921', N'3', N'735300', N'金塔县', N'JIN1 DA5 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3068', N'620922', N'3', N'735000', N'瓜州县', N'GUA1 ZHOU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3069', N'620923', N'3', N'736300', N'肃北蒙古族自治县', N'SU4 BEI3 MENG1 GU3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3070', N'620924', N'3', N'736400', N'阿克塞哈萨克族自治县', N'A1 KE4 SAI1 HA1 SA4 KE4 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3071', N'620981', N'3', N'735200', N'玉门市', N'YU4 MEN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3072', N'620982', N'3', N'736200', N'敦煌市', N'DUI4 HUANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3073', N'621000', N'2', N'745000', N'庆阳市', N'QING4 YANG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3074', N'621002', N'3', N'745000', N'西峰区', N'XI1 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3075', N'621021', N'3', N'745100', N'庆城县', N'QING4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3076', N'621022', N'3', N'745700', N'环县', N'HUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3077', N'621023', N'3', N'745600', N'华池县', N'HUA1 CHI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3078', N'621024', N'3', N'745400', N'合水县', N'GE3 SHUI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3079', N'621025', N'3', N'745300', N'正宁县', N'ZHENG1 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3080', N'621026', N'3', N'745200', N'宁县', N'NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3081', N'621027', N'3', N'744500', N'镇原县', N'ZHEN1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3082', N'621100', N'2', N'743000', N'定西市', N'DING4 XI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3083', N'621102', N'3', N'744300', N'安定区', N'AN1 DING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3084', N'621121', N'3', N'743300', N'通渭县', N'TONG1 WEI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3085', N'621122', N'3', N'748100', N'陇西县', N'LONG3 XI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3086', N'621123', N'3', N'748200', N'渭源县', N'WEI4 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3087', N'621124', N'3', N'730500', N'临洮县', N'LIN2 TAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3088', N'621125', N'3', N'748300', N'漳县', N'ZHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3089', N'621126', N'3', N'748400', N'岷县', N'MIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3090', N'621200', N'2', N'742500', N'陇南市', N'LONG3 NAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3091', N'621202', N'3', N'746000', N'武都区', N'WU3 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3092', N'621221', N'3', N'742500', N'成县', N'CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3093', N'621222', N'3', N'746400', N'文县', N'WEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3094', N'621223', N'3', N'748500', N'宕昌县', N'DANG4 CHANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3095', N'621224', N'3', N'746500', N'康县', N'KANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3096', N'621225', N'3', N'742100', N'西和县', N'XI1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3097', N'621226', N'3', N'742200', N'礼县', N'LI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3098', N'621227', N'3', N'742300', N'徽县', N'HUI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3099', N'621228', N'3', N'742400', N'两当县', N'LIANG3 DANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3100', N'622900', N'2', N'731100', N'临夏回族自治州', N'LIN2 XIA4 HUI2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3101', N'622901', N'3', N'731100', N'临夏市', N'LIN2 XIA4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3102', N'622921', N'3', N'731800', N'临夏县', N'LIN2 XIA4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3103', N'622922', N'3', N'731500', N'康乐县', N'KANG1 LE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3104', N'622923', N'3', N'731600', N'永靖县', N'YONG3 JING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3105', N'622924', N'3', N'731300', N'广河县', N'GUANG3 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3106', N'622925', N'3', N'731200', N'和政县', N'HE2 ZHENG4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3107', N'622926', N'3', N'731400', N'东乡族自治县', N'DONG1 XIANG1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3108', N'622927', N'3', N'731700', N'积石山保安族东乡族撒拉族自治县', N'JI1 SHI2 SHAN1 BAO3 AN1 ZU2 DONG1 XIANG1 ZU2 SA1 LA1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3109', N'623000', N'2', N'747000', N'甘南藏族自治州', N'GAN1 NAN2 CANG2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3110', N'623001', N'3', N'747000', N'合作市', N'GE3 ZUO1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3111', N'623021', N'3', N'747500', N'临潭县', N'LIN2 TAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3112', N'623022', N'3', N'747600', N'卓尼县', N'ZHUO2 NI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3113', N'623023', N'3', N'746300', N'舟曲县', N'ZHOU1 QU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3114', N'623024', N'3', N'747400', N'迭部县', N'DIE2 BU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3115', N'623025', N'3', N'747300', N'玛曲县', N'MA3 QU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3116', N'623026', N'3', N'747200', N'碌曲县', N'LIU4 QU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3117', N'623027', N'3', N'747100', N'夏河县', N'XIA4 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3118', N'630000', N'1', N'0', N'青海省', N'QING1 HAI3 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3119', N'630100', N'2', N'810000', N'西宁市', N'XI1 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3120', N'630102', N'3', N'810000', N'城东区', N'CHENG2 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3121', N'630103', N'3', N'810000', N'城中区', N'CHENG2 ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3122', N'630104', N'3', N'810000', N'城西区', N'CHENG2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3123', N'630105', N'3', N'810000', N'城北区', N'CHENG2 BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3124', N'630121', N'3', N'810100', N'大通回族土族自治县', N'DA4 TONG1 HUI2 ZU2 TU3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3125', N'630122', N'3', N'811600', N'湟中县', N'HUANG2 ZHONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3126', N'630123', N'3', N'812100', N'湟源县', N'HUANG2 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3127', N'630200', N'2', N'810699', N'海东市', N'HAI3 DONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3128', N'630202', N'3', N'810700', N'乐都区', N'LE4 DOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3129', N'630203', N'3', N'810699', N'平安区', N'PING2 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3130', N'630222', N'3', N'810800', N'民和回族土族自治县', N'MIN2 HE2 HUI2 ZU2 TU3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3131', N'630223', N'3', N'810500', N'互助土族自治县', N'HU4 ZHU4 TU3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3132', N'630224', N'3', N'810900', N'化隆回族自治县', N'HUA1 LONG1 HUI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3133', N'630225', N'3', N'811100', N'循化撒拉族自治县', N'XUN2 HUA1 SA1 LA1 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3134', N'632200', N'2', N'812200', N'海北藏族自治州', N'HAI3 BEI3 CANG2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3135', N'632221', N'3', N'810300', N'门源回族自治县', N'MEN2 YUAN2 HUI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3136', N'632222', N'3', N'810400', N'祁连县', N'QI2 LIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3137', N'632223', N'3', N'812200', N'海晏县', N'HAI3 YAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3138', N'632224', N'3', N'812300', N'刚察县', N'GANG1 CHA2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3139', N'632300', N'2', N'811300', N'黄南藏族自治州', N'HUANG2 NAN2 CANG2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3140', N'632321', N'3', N'811300', N'同仁县', N'TONG2 REN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3141', N'632322', N'3', N'811200', N'尖扎县', N'JIAN1 ZA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3142', N'632323', N'3', N'811400', N'泽库县', N'ZE2 KU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3143', N'632324', N'3', N'811500', N'河南蒙古族自治县', N'HE2 NAN2 MENG1 GU3 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3144', N'632500', N'2', N'813000', N'海南藏族自治州', N'HAI3 NAN2 CANG2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3145', N'632521', N'3', N'813000', N'共和县', N'GONG1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3146', N'632522', N'3', N'813200', N'同德县', N'TONG2 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3147', N'632523', N'3', N'811700', N'贵德县', N'GUI4 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3148', N'632524', N'3', N'813300', N'兴海县', N'XING1 HAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3149', N'632525', N'3', N'813100', N'贵南县', N'GUI4 NAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3150', N'632600', N'2', N'814000', N'果洛藏族自治州', N'GUO3 LUO4 CANG2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3151', N'632621', N'3', N'814000', N'玛沁县', N'MA3 QIN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3152', N'632622', N'3', N'814300', N'班玛县', N'BAN1 MA3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3153', N'632623', N'3', N'814100', N'甘德县', N'GAN1 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3154', N'632624', N'3', N'814200', N'达日县', N'DA2 RI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3155', N'632625', N'3', N'624700', N'久治县', N'JIU3 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3156', N'632626', N'3', N'813500', N'玛多县', N'MA3 DUO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3157', N'632700', N'2', N'815000', N'玉树藏族自治州', N'YU4 SHU4 CANG2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3158', N'632701', N'3', N'815000', N'玉树市', N'YU4 SHU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3159', N'632722', N'3', N'815300', N'杂多县', N'ZA2 DUO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3160', N'632723', N'3', N'815100', N'称多县', N'CHEN4 DUO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3161', N'632724', N'3', N'815400', N'治多县', N'ZHI4 DUO1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3162', N'632725', N'3', N'815200', N'囊谦县', N'NANG1 QIAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3163', N'632726', N'3', N'815500', N'曲麻莱县', N'QU1 MA1 LAI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3164', N'632800', N'2', N'817000', N'海西蒙古族藏族自治州', N'HAI3 XI1 MENG1 GU3 ZU2 CANG2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3165', N'632801', N'3', N'816000', N'格尔木市', N'GE1 ER3 MU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3166', N'632802', N'3', N'817000', N'德令哈市', N'DE2 LING3 HA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3167', N'632821', N'3', N'817100', N'乌兰县', N'WU1 LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3168', N'632822', N'3', N'816100', N'都兰县', N'DOU1 LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3169', N'632823', N'3', N'817200', N'天峻县', N'TIAN1 JUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3170', N'632824', N'3', N'816300', N'冷湖行政委员会', N'LENG3 HU2 HANG2 ZHENG4 WEI1 YUAN2 HUI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3171', N'632825', N'3', N'817000', N'大柴旦行政委员会', N'DA4 CHAI2 DAN4 HANG2 ZHENG4 WEI1 YUAN2 HUI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3172', N'632826', N'3', N'817000', N'茫崖行政委员会', N'MANG1 YA2 HANG2 ZHENG4 WEI1 YUAN2 HUI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3173', N'640000', N'1', N'0', N'宁夏回族自治区', N'NING2 XIA4 HUI2 ZU2 ZI4 ZHI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3174', N'640100', N'2', N'750000', N'银川市', N'YIN2 CHUAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3175', N'640104', N'3', N'750001', N'兴庆区', N'XING1 QING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3176', N'640105', N'3', N'750021', N'西夏区', N'XI1 XIA4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3177', N'640106', N'3', N'750011', N'金凤区', N'JIN1 FENG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3178', N'640121', N'3', N'750100', N'永宁县', N'YONG3 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3179', N'640122', N'3', N'750200', N'贺兰县', N'HE4 LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3180', N'640181', N'3', N'750004', N'灵武市', N'LING2 WU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3181', N'640200', N'2', N'753000', N'石嘴山市', N'SHI2 ZUI3 SHAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3182', N'640202', N'3', N'753000', N'大武口区', N'DA4 WU3 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3183', N'640205', N'3', N'753600', N'惠农区', N'HUI4 NONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3184', N'640221', N'3', N'753400', N'平罗县', N'PING2 LUO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3185', N'640300', N'2', N'751100', N'吴忠市', N'WU2 ZHONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3186', N'640302', N'3', N'751100', N'利通区', N'LI4 TONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3187', N'640303', N'3', N'751100', N'红寺堡区', N'GONG1 SI4 BAO3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3188', N'640323', N'3', N'751500', N'盐池县', N'YAN2 CHI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3189', N'640324', N'3', N'751300', N'同心县', N'TONG2 XIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3190', N'640381', N'3', N'751600', N'青铜峡市', N'QING1 TONG2 XIA2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3191', N'640400', N'2', N'756000', N'固原市', N'GU4 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3192', N'640402', N'3', N'756000', N'原州区', N'YUAN2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3193', N'640422', N'3', N'756200', N'西吉县', N'XI1 JI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3194', N'640423', N'3', N'756300', N'隆德县', N'LONG1 DE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3195', N'640424', N'3', N'756400', N'泾源县', N'JING1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3196', N'640425', N'3', N'756500', N'彭阳县', N'PENG2 YANG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3197', N'640500', N'2', N'751700', N'中卫市', N'ZHONG1 WEI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3198', N'640502', N'3', N'755000', N'沙坡头区', N'SHA1 PO1 TOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3199', N'640521', N'3', N'755000', N'中宁县', N'ZHONG1 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3200', N'640522', N'3', N'755200', N'海原县', N'HAI3 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3201', N'650000', N'1', N'0', N'新疆维吾尔自治区', N'XIN1 JIANG1 WEI2 WU2 ER3 ZI4 ZHI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3202', N'650100', N'2', N'830000', N'乌鲁木齐市', N'WU1 LU3 MU4 JI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3203', N'650102', N'3', N'830000', N'天山区', N'TIAN1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3204', N'650103', N'3', N'830002', N'沙依巴克区', N'SHA1 YI1 BA1 KE4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3205', N'650104', N'3', N'830011', N'新市区', N'XIN1 SHI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3206', N'650105', N'3', N'830017', N'水磨沟区', N'SHUI3 MO2 GOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3207', N'650106', N'3', N'830022', N'头屯河区', N'TOU2 TUN2 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3208', N'650107', N'3', N'830039', N'达坂城区', N'DA2 BAN3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3209', N'650109', N'3', N'830019', N'米东区', N'MI3 DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3210', N'650121', N'3', N'830063', N'乌鲁木齐县', N'WU1 LU3 MU4 JI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3211', N'650200', N'2', N'834000', N'克拉玛依市', N'KE4 LA1 MA3 YI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3212', N'650202', N'3', N'834021', N'独山子区', N'DU2 SHAN1 ZI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3213', N'650203', N'3', N'834000', N'克拉玛依区', N'KE4 LA1 MA3 YI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3214', N'650204', N'3', N'834008', N'白碱滩区', N'BAI2 JIAN3 TAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3215', N'650205', N'3', N'834012', N'乌尔禾区', N'WU1 ER3 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3216', N'650400', N'2', N'838000', N'吐鲁番市', N'TU3 LU3 FAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3217', N'650402', N'3', N'838000', N'高昌区', N'GAO1 CHANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3218', N'650421', N'3', N'838200', N'鄯善县', N'SHAN4 SHAN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3219', N'650422', N'3', N'838100', N'托克逊县', N'TUO1 KE4 XUN4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3220', N'650500', N'2', N'839000', N'哈密市', N'HA1 MI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3221', N'650502', N'3', N'839000', N'伊州区', N'YI1 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3222', N'650521', N'3', N'839200', N'巴里坤哈萨克自治县', N'BA1 LI3 KUN1 HA1 SA4 KE4 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3223', N'650522', N'3', N'839300', N'伊吾县', N'YI1 WU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3224', N'652300', N'2', N'831100', N'昌吉回族自治州', N'CHANG1 JI2 HUI2 ZU2 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3225', N'652301', N'3', N'831100', N'昌吉市', N'CHANG1 JI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3226', N'652302', N'3', N'831500', N'阜康市', N'FU4 KANG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3227', N'652323', N'3', N'831200', N'呼图壁县', N'HU1 TU2 BI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3228', N'652324', N'3', N'832200', N'玛纳斯县', N'MA3 NA4 SI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3229', N'652325', N'3', N'831800', N'奇台县', N'JI1 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3230', N'652327', N'3', N'831700', N'吉木萨尔县', N'JI2 MU4 SA4 ER3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3231', N'652328', N'3', N'831900', N'木垒哈萨克自治县', N'MU4 LEI3 HA1 SA4 KE4 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3232', N'652700', N'2', N'833400', N'博尔塔拉蒙古自治州', N'BO2 ER3 DA5 LA1 MENG1 GU3 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3233', N'652701', N'3', N'833400', N'博乐市', N'BO2 LE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3234', N'652702', N'3', N'833400', N'阿拉山口市', N'A1 LA1 SHAN1 KOU3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3235', N'652722', N'3', N'833300', N'精河县', N'JING1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3236', N'652723', N'3', N'833500', N'温泉县', N'WEN1 QUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3237', N'652800', N'2', N'841000', N'巴音郭楞蒙古自治州', N'BA1 YIN1 GUO1 LENG2 MENG1 GU3 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3238', N'652801', N'3', N'841000', N'库尔勒市', N'KU4 ER3 LE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3239', N'652822', N'3', N'841600', N'轮台县', N'LUN2 TAI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3240', N'652823', N'3', N'841500', N'尉犁县', N'WEI4 LI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3241', N'652824', N'3', N'841800', N'若羌县', N'RE3 QIANG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3242', N'652825', N'3', N'841900', N'且末县', N'JU1 MO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3243', N'652826', N'3', N'841100', N'焉耆回族自治县', N'YAN1 QI2 HUI2 ZU2 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3244', N'652827', N'3', N'841300', N'和静县', N'HE2 JING4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3245', N'652828', N'3', N'841200', N'和硕县', N'HE2 SHUO4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3246', N'652829', N'3', N'841400', N'博湖县', N'BO2 HU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3247', N'652900', N'2', N'843000', N'阿克苏地区', N'A1 KE4 SU1 DE5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3248', N'652901', N'3', N'843000', N'阿克苏市', N'A1 KE4 SU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3249', N'652922', N'3', N'843100', N'温宿县', N'WEN1 SU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3250', N'652923', N'3', N'842000', N'库车县', N'KU4 CHE1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3251', N'652924', N'3', N'842200', N'沙雅县', N'SHA1 YA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3252', N'652925', N'3', N'842100', N'新和县', N'XIN1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3253', N'652926', N'3', N'842300', N'拜城县', N'BAI4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3254', N'652927', N'3', N'843400', N'乌什县', N'WU1 SHEN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3255', N'652928', N'3', N'843200', N'阿瓦提县', N'A1 WA3 DI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3256', N'652929', N'3', N'843600', N'柯坪县', N'KE1 PING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3257', N'653000', N'2', N'845350', N'克孜勒苏柯尔克孜自治州', N'KE4 ZI1 LE4 SU1 KE1 ER3 KE4 ZI1 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3258', N'653001', N'3', N'845350', N'阿图什市', N'A1 TU2 SHEN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3259', N'653022', N'3', N'845550', N'阿克陶县', N'A1 KE4 TAO2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3260', N'653023', N'3', N'843500', N'阿合奇县', N'A1 GE3 JI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3261', N'653024', N'3', N'845450', N'乌恰县', N'WU1 QIA4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3262', N'653100', N'2', N'844000', N'喀什地区', N'KA1 SHEN2 DE5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3263', N'653101', N'3', N'844000', N'喀什市', N'KA1 SHEN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3264', N'653121', N'3', N'844100', N'疏附县', N'SHU1 FU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3265', N'653122', N'3', N'844200', N'疏勒县', N'SHU1 LE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3266', N'653123', N'3', N'844500', N'英吉沙县', N'YING1 JI2 SHA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3267', N'653124', N'3', N'844800', N'泽普县', N'ZE2 PU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3268', N'653125', N'3', N'844700', N'莎车县', N'SHA1 CHE1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3269', N'653126', N'3', N'844900', N'叶城县', N'XIE2 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3270', N'653127', N'3', N'844600', N'麦盖提县', N'MAI4 GAI4 DI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3271', N'653128', N'3', N'844400', N'岳普湖县', N'YUE4 PU3 HU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3272', N'653129', N'3', N'844300', N'伽师县', N'GA1 SHI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3273', N'653130', N'3', N'843800', N'巴楚县', N'BA1 CHU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3274', N'653131', N'3', N'845250', N'塔什库尔干塔吉克自治县', N'DA5 SHEN2 KU4 ER3 GAN1 DA5 JI2 KE4 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3275', N'653200', N'2', N'848000', N'和田地区', N'HE2 TIAN2 DE5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3276', N'653201', N'3', N'848000', N'和田市', N'HE2 TIAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3277', N'653221', N'3', N'848000', N'和田县', N'HE2 TIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3278', N'653222', N'3', N'848100', N'墨玉县', N'MO4 YU4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3279', N'653223', N'3', N'845150', N'皮山县', N'PI2 SHAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3280', N'653224', N'3', N'848200', N'洛浦县', N'LUO4 PU3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3281', N'653225', N'3', N'848300', N'策勒县', N'CE4 LE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3282', N'653226', N'3', N'848400', N'于田县', N'YU2 TIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3283', N'653227', N'3', N'848500', N'民丰县', N'MIN2 FENG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3284', N'654000', N'2', N'835000', N'伊犁哈萨克自治州', N'YI1 LI2 HA1 SA4 KE4 ZI4 ZHI4 ZHOU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3285', N'654002', N'3', N'835000', N'伊宁市', N'YI1 NING2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3286', N'654003', N'3', N'833200', N'奎屯市', N'KUI2 TUN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3287', N'654004', N'3', N'835100', N'霍尔果斯市', N'HUO4 ER3 GUO3 SI1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3288', N'654021', N'3', N'835100', N'伊宁县', N'YI1 NING2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3289', N'654022', N'3', N'835300', N'察布查尔锡伯自治县', N'CHA2 BU4 CHA2 ER3 XI1 BAI3 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3290', N'654023', N'3', N'835200', N'霍城县', N'HUO4 CHENG2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3291', N'654024', N'3', N'835400', N'巩留县', N'GONG3 LIU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3292', N'654025', N'3', N'835800', N'新源县', N'XIN1 YUAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3293', N'654026', N'3', N'835600', N'昭苏县', N'ZHAO1 SU1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3294', N'654027', N'3', N'835500', N'特克斯县', N'TE4 KE4 SI1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3295', N'654028', N'3', N'835700', N'尼勒克县', N'NI2 LE4 KE4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3296', N'654200', N'2', N'834700', N'塔城地区', N'DA5 CHENG2 DE5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3297', N'654201', N'3', N'834700', N'塔城市', N'DA5 CHENG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3298', N'654202', N'3', N'833300', N'乌苏市', N'WU1 SU1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3299', N'654221', N'3', N'834600', N'额敏县', N'E2 MIN3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3300', N'654223', N'3', N'832100', N'沙湾县', N'SHA1 WAN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3301', N'654224', N'3', N'834500', N'托里县', N'TUO1 LI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3302', N'654225', N'3', N'834800', N'裕民县', N'YU4 MIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3303', N'654226', N'3', N'834400', N'和布克赛尔蒙古自治县', N'HE2 BU4 KE4 SAI4 ER3 MENG1 GU3 ZI4 ZHI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3304', N'654300', N'2', N'836500', N'阿勒泰地区', N'A1 LE4 TAI4 DE5 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3305', N'654301', N'3', N'836500', N'阿勒泰市', N'A1 LE4 TAI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3306', N'654321', N'3', N'836600', N'布尔津县', N'BU4 ER3 JIN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3307', N'654322', N'3', N'836100', N'富蕴县', N'FU4 WEN1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3308', N'654323', N'3', N'836400', N'福海县', N'FU2 HAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3309', N'654324', N'3', N'836700', N'哈巴河县', N'HA1 BA1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3310', N'654325', N'3', N'836200', N'青河县', N'QING1 HE2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3311', N'654326', N'3', N'836800', N'吉木乃县', N'JI2 MU4 NAI3 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3312', N'659000', N'2', N'0', N'自治区直辖县级行政区划', N'ZI4 ZHI4 OU1 ZHI2 HE2 XIAN4 JI2 HANG2 ZHENG4 OU1 HUA2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3313', N'659001', N'3', N'832000', N'石河子市', N'SHI2 HE2 ZI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3314', N'659002', N'3', N'843300', N'阿拉尔市', N'A1 LA1 ER3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3315', N'659003', N'3', N'843806', N'图木舒克市', N'TU2 MU4 SHU1 KE4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3316', N'659004', N'3', N'831300', N'五家渠市', N'WU3 GU1 QU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3317', N'659005', N'3', N'836000', N'北屯市', N'BEI3 TUN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3318', N'659006', N'3', N'831300', N'铁门关市', N'TIE3 MEN2 GUAN1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3319', N'659007', N'3', N'833408', N'双河市', N'SHUANG1 HE2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3320', N'659008', N'3', N'835213', N'可克达拉市', N'KE3 KE4 DA2 LA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3321', N'659009', N'3', N'848116', N'昆玉市', N'KUN1 YU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3322', N'710000', N'1', N'0', N'台湾省', N'TAI1 WAN1 SHENG3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3323', N'710100', N'2', N'0', N'台北市', N'TAI1 BEI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3324', N'710101', N'3', N'0', N'中正区', N'ZHONG1 ZHENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3325', N'710102', N'3', N'0', N'大同区', N'DA4 TONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3326', N'710103', N'3', N'0', N'中山区', N'ZHONG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3327', N'710104', N'3', N'0', N'松山区', N'SONG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3328', N'710105', N'3', N'0', N'大安区', N'DA4 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3329', N'710106', N'3', N'0', N'万华区', N'MO4 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3330', N'710107', N'3', N'0', N'信义区', N'XIN4 YI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3331', N'710108', N'3', N'0', N'士林区', N'SHI4 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3332', N'710109', N'3', N'0', N'北投区', N'BEI3 TOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3333', N'710110', N'3', N'0', N'内湖区', N'NEI4 HU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3334', N'710111', N'3', N'0', N'南港区', N'NAN2 GANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3335', N'710112', N'3', N'0', N'文山区', N'WEN2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3336', N'710200', N'2', N'0', N'高雄市', N'GAO1 XIONG2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3337', N'710201', N'3', N'0', N'新兴区', N'XIN1 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3338', N'710202', N'3', N'0', N'前金区', N'QIAN2 JIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3339', N'710203', N'3', N'0', N'苓雅区', N'LING2 YA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3340', N'710204', N'3', N'0', N'盐埕区', N'YAN2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3341', N'710205', N'3', N'0', N'鼓山区', N'GU3 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3342', N'710206', N'3', N'0', N'旗津区', N'QI2 JIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3343', N'710207', N'3', N'0', N'前镇区', N'QIAN2 ZHEN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3344', N'710208', N'3', N'0', N'三民区', N'SAN1 MIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3345', N'710209', N'3', N'0', N'左营区', N'ZUO3 YING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3346', N'710210', N'3', N'0', N'楠梓区', N'NAN2 ZI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3347', N'710211', N'3', N'0', N'小港区', N'XIAO3 GANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3348', N'710242', N'3', N'0', N'仁武区', N'REN2 WU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3349', N'710243', N'3', N'0', N'大社区', N'DA4 SHE4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3350', N'710244', N'3', N'0', N'冈山区', N'GANG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3351', N'710245', N'3', N'0', N'路竹区', N'LU4 ZHU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3352', N'710246', N'3', N'0', N'阿莲区', N'A1 LIAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3353', N'710247', N'3', N'0', N'田寮区', N'TIAN2 LIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3354', N'710248', N'3', N'0', N'燕巢区', N'YAN1 CHAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3355', N'710249', N'3', N'0', N'桥头区', N'QIAO2 TOU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3356', N'710250', N'3', N'0', N'梓官区', N'ZI3 GUAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3357', N'710251', N'3', N'0', N'弥陀区', N'MI2 TUO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3358', N'710252', N'3', N'0', N'永安区', N'YONG3 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3359', N'710253', N'3', N'0', N'湖内区', N'HU2 NEI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3360', N'710254', N'3', N'0', N'凤山区', N'FENG4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3361', N'710255', N'3', N'0', N'大寮区', N'DA4 LIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3362', N'710256', N'3', N'0', N'林园区', N'LIN2 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3363', N'710257', N'3', N'0', N'鸟松区', N'DIAO3 SONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3364', N'710258', N'3', N'0', N'大树区', N'DA4 SHU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3365', N'710259', N'3', N'0', N'旗山区', N'QI2 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3366', N'710260', N'3', N'0', N'美浓区', N'MEI3 NONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3367', N'710261', N'3', N'0', N'六龟区', N'LIU4 GUI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3368', N'710262', N'3', N'0', N'内门区', N'NEI4 MEN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3369', N'710263', N'3', N'0', N'杉林区', N'SHA1 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3370', N'710264', N'3', N'0', N'甲仙区', N'JIA3 XIAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3371', N'710265', N'3', N'0', N'桃源区', N'TAO2 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3372', N'710266', N'3', N'0', N'那玛夏区', N'NA1 MA3 XIA4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3373', N'710267', N'3', N'0', N'茂林区', N'MAO4 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3374', N'710268', N'3', N'0', N'茄萣区', N'JIA1 DING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3375', N'710300', N'2', N'0', N'台南市', N'TAI1 NAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3376', N'710301', N'3', N'0', N'中西区', N'ZHONG1 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3377', N'710302', N'3', N'0', N'东区', N'DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3378', N'710303', N'3', N'0', N'南区', N'NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3379', N'710304', N'3', N'0', N'北区', N'BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3380', N'710305', N'3', N'0', N'安平区', N'AN1 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3381', N'710306', N'3', N'0', N'安南区', N'AN1 NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3382', N'710339', N'3', N'0', N'永康区', N'YONG3 KANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3383', N'710340', N'3', N'0', N'归仁区', N'GUI1 REN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3384', N'710341', N'3', N'0', N'新化区', N'XIN1 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3385', N'710342', N'3', N'0', N'左镇区', N'ZUO3 ZHEN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3386', N'710343', N'3', N'0', N'玉井区', N'YU4 JING3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3387', N'710344', N'3', N'0', N'楠西区', N'NAN2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3388', N'710345', N'3', N'0', N'南化区', N'NAN2 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3389', N'710346', N'3', N'0', N'仁德区', N'REN2 DE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3390', N'710347', N'3', N'0', N'关庙区', N'GUAN1 MIAO4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3391', N'710348', N'3', N'0', N'龙崎区', N'LONG2 QI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3392', N'710349', N'3', N'0', N'官田区', N'GUAN1 TIAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3393', N'710350', N'3', N'0', N'麻豆区', N'MA1 DOU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3394', N'710351', N'3', N'0', N'佳里区', N'JIA1 LI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3395', N'710352', N'3', N'0', N'西港区', N'XI1 GANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3396', N'710353', N'3', N'0', N'七股区', N'QI1 GU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3397', N'710354', N'3', N'0', N'将军区', N'JIANG1 JUN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3398', N'710355', N'3', N'0', N'学甲区', N'XUE2 JIA3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3399', N'710356', N'3', N'0', N'北门区', N'BEI3 MEN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3400', N'710357', N'3', N'0', N'新营区', N'XIN1 YING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3401', N'710358', N'3', N'0', N'后壁区', N'HOU4 BI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3402', N'710359', N'3', N'0', N'白河区', N'BAI2 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3403', N'710360', N'3', N'0', N'东山区', N'DONG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3404', N'710361', N'3', N'0', N'六甲区', N'LIU4 JIA3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3405', N'710362', N'3', N'0', N'下营区', N'XIA4 YING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3406', N'710363', N'3', N'0', N'柳营区', N'LIU3 YING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3407', N'710364', N'3', N'0', N'盐水区', N'YAN2 SHUI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3408', N'710365', N'3', N'0', N'善化区', N'SHAN4 HUA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3409', N'710366', N'3', N'0', N'大内区', N'DA4 NEI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3410', N'710367', N'3', N'0', N'山上区', N'SHAN1 SHANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3411', N'710368', N'3', N'0', N'新市区', N'XIN1 SHI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3412', N'710369', N'3', N'0', N'安定区', N'AN1 DING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3413', N'710400', N'2', N'0', N'台中市', N'TAI1 ZHONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3414', N'710401', N'3', N'0', N'中区', N'ZHONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3415', N'710402', N'3', N'0', N'东区', N'DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3416', N'710403', N'3', N'0', N'南区', N'NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3417', N'710404', N'3', N'0', N'西区', N'XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3418', N'710405', N'3', N'0', N'北区', N'BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3419', N'710406', N'3', N'0', N'北屯区', N'BEI3 TUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3420', N'710407', N'3', N'0', N'西屯区', N'XI1 TUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3421', N'710408', N'3', N'0', N'南屯区', N'NAN2 TUN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3422', N'710431', N'3', N'0', N'太平区', N'TAI4 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3423', N'710432', N'3', N'0', N'大里区', N'DA4 LI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3424', N'710433', N'3', N'0', N'雾峰区', N'WU4 FENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3425', N'710434', N'3', N'0', N'乌日区', N'WU1 RI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3426', N'710435', N'3', N'0', N'丰原区', N'FENG1 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3427', N'710436', N'3', N'0', N'后里区', N'HOU4 LI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3428', N'710437', N'3', N'0', N'石冈区', N'SHI2 GANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3429', N'710438', N'3', N'0', N'东势区', N'DONG1 SHI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3430', N'710439', N'3', N'0', N'和平区', N'HE2 PING2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3431', N'710440', N'3', N'0', N'新社区', N'XIN1 SHE4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3432', N'710441', N'3', N'0', N'潭子区', N'TAN2 ZI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3433', N'710442', N'3', N'0', N'大雅区', N'DA4 YA1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3434', N'710443', N'3', N'0', N'神冈区', N'SHEN2 GANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3435', N'710444', N'3', N'0', N'大肚区', N'DA4 DU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3436', N'710445', N'3', N'0', N'沙鹿区', N'SHA1 LU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3437', N'710446', N'3', N'0', N'龙井区', N'LONG2 JING3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3438', N'710447', N'3', N'0', N'梧栖区', N'WU2 QI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3439', N'710448', N'3', N'0', N'清水区', N'QING1 SHUI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3440', N'710449', N'3', N'0', N'大甲区', N'DA4 JIA3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3441', N'710450', N'3', N'0', N'外埔区', N'WAI4 BU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3442', N'710451', N'3', N'0', N'大安区', N'DA4 AN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3443', N'710600', N'2', N'0', N'南投县', N'NAN2 TOU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3444', N'710614', N'3', N'0', N'南投市', N'NAN2 TOU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3445', N'710615', N'3', N'0', N'中寮乡', N'ZHONG1 LIAO2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3446', N'710616', N'3', N'0', N'草屯镇', N'CAO3 TUN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3447', N'710617', N'3', N'0', N'国姓乡', N'GUO2 XING4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3448', N'710618', N'3', N'0', N'埔里镇', N'BU4 LI3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3449', N'710619', N'3', N'0', N'仁爱乡', N'REN2 AI4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3450', N'710620', N'3', N'0', N'名间乡', N'MING2 JIAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3451', N'710621', N'3', N'0', N'集集镇', N'JI2 JI2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3452', N'710622', N'3', N'0', N'水里乡', N'SHUI3 LI3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3453', N'710623', N'3', N'0', N'鱼池乡', N'YU2 CHI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3454', N'710624', N'3', N'0', N'信义乡', N'XIN4 YI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3455', N'710625', N'3', N'0', N'竹山镇', N'ZHU2 SHAN1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3456', N'710626', N'3', N'0', N'鹿谷乡', N'LU4 GU3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3457', N'710700', N'2', N'0', N'基隆市', N'JI1 LONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3458', N'710701', N'3', N'0', N'仁爱区', N'REN2 AI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3459', N'710702', N'3', N'0', N'信义区', N'XIN4 YI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3460', N'710703', N'3', N'0', N'中正区', N'ZHONG1 ZHENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3461', N'710704', N'3', N'0', N'中山区', N'ZHONG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3462', N'710705', N'3', N'0', N'安乐区', N'AN1 LE4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3463', N'710706', N'3', N'0', N'暖暖区', N'NUAN3 NUAN3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3464', N'710707', N'3', N'0', N'七堵区', N'QI1 DU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3465', N'710800', N'2', N'0', N'新竹市', N'XIN1 ZHU2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3466', N'710801', N'3', N'0', N'东区', N'DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3467', N'710802', N'3', N'0', N'北区', N'BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3468', N'710803', N'3', N'0', N'香山区', N'XIANG1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3469', N'710900', N'2', N'0', N'嘉义市', N'JIA1 YI2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3470', N'710901', N'3', N'0', N'东区', N'DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3471', N'710902', N'3', N'0', N'西区', N'XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3472', N'711100', N'2', N'0', N'新北市', N'XIN1 BEI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3473', N'711130', N'3', N'0', N'万里区', N'MO4 LI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3474', N'711131', N'3', N'0', N'金山区', N'JIN1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3475', N'711132', N'3', N'0', N'板桥区', N'BAN3 QIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3476', N'711133', N'3', N'0', N'汐止区', N'XI1 ZHI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3477', N'711134', N'3', N'0', N'深坑区', N'SHEN1 KENG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3478', N'711135', N'3', N'0', N'石碇区', N'SHI2 DING4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3479', N'711136', N'3', N'0', N'瑞芳区', N'RUI4 FANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3480', N'711137', N'3', N'0', N'平溪区', N'PING2 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3481', N'711138', N'3', N'0', N'双溪区', N'SHUANG1 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3482', N'711139', N'3', N'0', N'贡寮区', N'GONG4 LIAO2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3483', N'711140', N'3', N'0', N'新店区', N'XIN1 DIAN4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3484', N'711141', N'3', N'0', N'坪林区', N'PING2 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3485', N'711142', N'3', N'0', N'乌来区', N'WU1 LAI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3486', N'711143', N'3', N'0', N'永和区', N'YONG3 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3487', N'711144', N'3', N'0', N'中和区', N'ZHONG1 HE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3488', N'711145', N'3', N'0', N'土城区', N'TU3 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3489', N'711146', N'3', N'0', N'三峡区', N'SAN1 XIA2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3490', N'711147', N'3', N'0', N'树林区', N'SHU4 LIN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3491', N'711148', N'3', N'0', N'莺歌区', N'YING1 GE1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3492', N'711149', N'3', N'0', N'三重区', N'SAN1 CHONG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3493', N'711150', N'3', N'0', N'新庄区', N'XIN1 ZHUANG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3494', N'711151', N'3', N'0', N'泰山区', N'TAI4 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3495', N'711152', N'3', N'0', N'林口区', N'LIN2 KOU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3496', N'711153', N'3', N'0', N'芦洲区', N'LU2 ZHOU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3497', N'711154', N'3', N'0', N'五股区', N'WU3 GU3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3498', N'711155', N'3', N'0', N'八里区', N'BA1 LI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3499', N'711156', N'3', N'0', N'淡水区', N'DAN4 SHUI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3500', N'711157', N'3', N'0', N'三芝区', N'SAN1 ZHI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3501', N'711158', N'3', N'0', N'石门区', N'SHI2 MEN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3502', N'711200', N'2', N'0', N'宜兰县', N'YI2 LAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3503', N'711214', N'3', N'0', N'宜兰市', N'YI2 LAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3504', N'711215', N'3', N'0', N'头城镇', N'TOU2 CHENG2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3505', N'711216', N'3', N'0', N'礁溪乡', N'JIAO1 XI1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3506', N'711217', N'3', N'0', N'壮围乡', N'ZHUANG4 WEI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3507', N'711218', N'3', N'0', N'员山乡', N'YUAN2 SHAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3508', N'711219', N'3', N'0', N'罗东镇', N'LUO2 DONG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3509', N'711220', N'3', N'0', N'三星乡', N'SAN1 XING1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3510', N'711221', N'3', N'0', N'大同乡', N'DA4 TONG2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3511', N'711222', N'3', N'0', N'五结乡', N'WU3 JIE1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3512', N'711223', N'3', N'0', N'冬山乡', N'DONG1 SHAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3513', N'711224', N'3', N'0', N'苏澳镇', N'SU1 AO4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3514', N'711225', N'3', N'0', N'南澳乡', N'NAN2 AO4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3515', N'711300', N'2', N'0', N'新竹县', N'XIN1 ZHU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3516', N'711314', N'3', N'0', N'竹北市', N'ZHU2 BEI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3517', N'711315', N'3', N'0', N'湖口乡', N'HU2 KOU3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3518', N'711316', N'3', N'0', N'新丰乡', N'XIN1 FENG1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3519', N'711317', N'3', N'0', N'新埔镇', N'XIN1 BU4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3520', N'711318', N'3', N'0', N'关西镇', N'GUAN1 XI1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3521', N'711319', N'3', N'0', N'芎林乡', N'XIONG1 LIN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3522', N'711320', N'3', N'0', N'宝山乡', N'BAO3 SHAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3523', N'711321', N'3', N'0', N'竹东镇', N'ZHU2 DONG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3524', N'711322', N'3', N'0', N'五峰乡', N'WU3 FENG1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3525', N'711323', N'3', N'0', N'横山乡', N'HENG2 SHAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3526', N'711324', N'3', N'0', N'尖石乡', N'JIAN1 SHI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3527', N'711325', N'3', N'0', N'北埔乡', N'BEI3 BU4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3528', N'711326', N'3', N'0', N'峨眉乡', N'E2 MEI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3529', N'711400', N'2', N'0', N'桃园市', N'TAO2 YUAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3530', N'711414', N'3', N'0', N'中坜区', N'ZHONG1 LI4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3531', N'711415', N'3', N'0', N'平镇区', N'PING2 ZHEN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3532', N'711416', N'3', N'0', N'龙潭区', N'LONG2 TAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3533', N'711417', N'3', N'0', N'杨梅区', N'YANG2 MEI2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3534', N'711418', N'3', N'0', N'新屋区', N'XIN1 WU1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3535', N'711419', N'3', N'0', N'观音区', N'GUAN1 YIN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3536', N'711420', N'3', N'0', N'桃园区', N'TAO2 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3537', N'711421', N'3', N'0', N'龟山区', N'GUI1 SHAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3538', N'711422', N'3', N'0', N'八德区', N'BA1 DE2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3539', N'711423', N'3', N'0', N'大溪区', N'DA4 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3540', N'711424', N'3', N'0', N'复兴区', N'FU4 XING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3541', N'711425', N'3', N'0', N'大园区', N'DA4 YUAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3542', N'711426', N'3', N'0', N'芦竹区', N'LU2 ZHU2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3543', N'711500', N'2', N'0', N'苗栗县', N'MIAO2 LI4 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3544', N'711519', N'3', N'0', N'竹南镇', N'ZHU2 NAN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3545', N'711520', N'3', N'0', N'头份市', N'TOU2 FEN4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3546', N'711521', N'3', N'0', N'三湾乡', N'SAN1 WAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3547', N'711522', N'3', N'0', N'南庄乡', N'NAN2 ZHUANG1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3548', N'711523', N'3', N'0', N'狮潭乡', N'SHI1 TAN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3549', N'711524', N'3', N'0', N'后龙镇', N'HOU4 LONG2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3550', N'711525', N'3', N'0', N'通霄镇', N'TONG1 XIAO1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3551', N'711526', N'3', N'0', N'苑里镇', N'YUAN4 LI3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3552', N'711527', N'3', N'0', N'苗栗市', N'MIAO2 LI4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3553', N'711528', N'3', N'0', N'造桥乡', N'ZAO4 QIAO2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3554', N'711529', N'3', N'0', N'头屋乡', N'TOU2 WU1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3555', N'711530', N'3', N'0', N'公馆乡', N'GONG1 GUAN3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3556', N'711531', N'3', N'0', N'大湖乡', N'DA4 HU2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3557', N'711532', N'3', N'0', N'泰安乡', N'TAI4 AN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3558', N'711533', N'3', N'0', N'铜锣乡', N'TONG2 LUO2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3559', N'711534', N'3', N'0', N'三义乡', N'SAN1 YI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3560', N'711535', N'3', N'0', N'西湖乡', N'XI1 HU2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3561', N'711536', N'3', N'0', N'卓兰镇', N'ZHUO2 LAN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3562', N'711700', N'2', N'0', N'彰化县', N'ZHANG1 HUA1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3563', N'711727', N'3', N'0', N'彰化市', N'ZHANG1 HUA1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3564', N'711728', N'3', N'0', N'芬园乡', N'FEN1 YUAN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3565', N'711729', N'3', N'0', N'花坛乡', N'HUA1 TAN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3566', N'711730', N'3', N'0', N'秀水乡', N'XIU4 SHUI3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3567', N'711731', N'3', N'0', N'鹿港镇', N'LU4 GANG3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3568', N'711732', N'3', N'0', N'福兴乡', N'FU2 XING1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3569', N'711733', N'3', N'0', N'线西乡', N'XIAN4 XI1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3570', N'711734', N'3', N'0', N'和美镇', N'HE2 MEI3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3571', N'711735', N'3', N'0', N'伸港乡', N'SHEN1 GANG3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3572', N'711736', N'3', N'0', N'员林市', N'YUAN2 LIN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3573', N'711737', N'3', N'0', N'社头乡', N'SHE4 TOU2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3574', N'711738', N'3', N'0', N'永靖乡', N'YONG3 JING4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3575', N'711739', N'3', N'0', N'埔心乡', N'BU4 XIN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3576', N'711740', N'3', N'0', N'溪湖镇', N'XI1 HU2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3577', N'711741', N'3', N'0', N'大村乡', N'DA4 CUN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3578', N'711742', N'3', N'0', N'埔盐乡', N'BU4 YAN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3579', N'711743', N'3', N'0', N'田中镇', N'TIAN2 ZHONG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3580', N'711744', N'3', N'0', N'北斗镇', N'BEI3 DOU3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3581', N'711745', N'3', N'0', N'田尾乡', N'TIAN2 WEI3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3582', N'711746', N'3', N'0', N'埤头乡', N'PI2 TOU2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3583', N'711747', N'3', N'0', N'溪州乡', N'XI1 ZHOU1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3584', N'711748', N'3', N'0', N'竹塘乡', N'ZHU2 TANG2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3585', N'711749', N'3', N'0', N'二林镇', N'ER4 LIN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3586', N'711750', N'3', N'0', N'大城乡', N'DA4 CHENG2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3587', N'711751', N'3', N'0', N'芳苑乡', N'FANG1 YUAN4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3588', N'711752', N'3', N'0', N'二水乡', N'ER4 SHUI3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3589', N'711900', N'2', N'0', N'嘉义县', N'JIA1 YI2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3590', N'711919', N'3', N'0', N'番路乡', N'FAN1 LU4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3591', N'711920', N'3', N'0', N'梅山乡', N'MEI2 SHAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3592', N'711921', N'3', N'0', N'竹崎乡', N'ZHU2 QI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3593', N'711922', N'3', N'0', N'阿里山乡', N'A1 LI3 SHAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3594', N'711923', N'3', N'0', N'中埔乡', N'ZHONG1 BU4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3595', N'711924', N'3', N'0', N'大埔乡', N'DA4 BU4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3596', N'711925', N'3', N'0', N'水上乡', N'SHUI3 SHANG3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3597', N'711926', N'3', N'0', N'鹿草乡', N'LU4 CAO3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3598', N'711927', N'3', N'0', N'太保市', N'TAI4 BAO3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3599', N'711928', N'3', N'0', N'朴子市', N'PIAO2 ZI3 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3600', N'711929', N'3', N'0', N'东石乡', N'DONG1 SHI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3601', N'711930', N'3', N'0', N'六脚乡', N'LIU4 JIAO3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3602', N'711931', N'3', N'0', N'新港乡', N'XIN1 GANG3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3603', N'711932', N'3', N'0', N'民雄乡', N'MIN2 XIONG2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3604', N'711933', N'3', N'0', N'大林镇', N'DA4 LIN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3605', N'711934', N'3', N'0', N'溪口乡', N'XI1 KOU3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3606', N'711935', N'3', N'0', N'义竹乡', N'YI2 ZHU2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3607', N'711936', N'3', N'0', N'布袋镇', N'BU4 DAI4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3608', N'712100', N'2', N'0', N'云林县', N'YUN2 LIN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3609', N'712121', N'3', N'0', N'斗南镇', N'DOU3 NAN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3610', N'712122', N'3', N'0', N'大埤乡', N'DA4 PI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3611', N'712123', N'3', N'0', N'虎尾镇', N'HU1 WEI3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3612', N'712124', N'3', N'0', N'土库镇', N'TU3 KU4 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3613', N'712125', N'3', N'0', N'褒忠乡', N'BAO1 ZHONG1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3614', N'712126', N'3', N'0', N'东势乡', N'DONG1 SHI4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3615', N'712127', N'3', N'0', N'台西乡', N'TAI1 XI1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3616', N'712128', N'3', N'0', N'仑背乡', N'LUN2 BEI1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3617', N'712129', N'3', N'0', N'麦寮乡', N'MAI4 LIAO2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3618', N'712130', N'3', N'0', N'斗六市', N'DOU3 LIU4 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3619', N'712131', N'3', N'0', N'林内乡', N'LIN2 NEI4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3620', N'712132', N'3', N'0', N'古坑乡', N'GU3 KENG1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3621', N'712133', N'3', N'0', N'莿桐乡', N'CI4 TONG2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3622', N'712134', N'3', N'0', N'西螺镇', N'XI1 LUO2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3623', N'712135', N'3', N'0', N'二仑乡', N'ER4 LUN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3624', N'712136', N'3', N'0', N'北港镇', N'BEI3 GANG3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3625', N'712137', N'3', N'0', N'水林乡', N'SHUI3 LIN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3626', N'712138', N'3', N'0', N'口湖乡', N'KOU3 HU2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3627', N'712139', N'3', N'0', N'四湖乡', N'SI4 HU2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3628', N'712140', N'3', N'0', N'元长乡', N'YUAN2 CHANG2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3629', N'712400', N'2', N'0', N'屏东县', N'BING1 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3630', N'712434', N'3', N'0', N'屏东市', N'BING1 DONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3631', N'712435', N'3', N'0', N'三地门乡', N'SAN1 DE5 MEN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3632', N'712436', N'3', N'0', N'雾台乡', N'WU4 TAI1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3633', N'712437', N'3', N'0', N'玛家乡', N'MA3 GU1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3634', N'712438', N'3', N'0', N'九如乡', N'JIU3 RU2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3635', N'712439', N'3', N'0', N'里港乡', N'LI3 GANG3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3636', N'712440', N'3', N'0', N'高树乡', N'GAO1 SHU4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3637', N'712441', N'3', N'0', N'盐埔乡', N'YAN2 BU4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3638', N'712442', N'3', N'0', N'长治乡', N'CHANG2 ZHI4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3639', N'712443', N'3', N'0', N'麟洛乡', N'LIN2 LUO4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3640', N'712444', N'3', N'0', N'竹田乡', N'ZHU2 TIAN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3641', N'712445', N'3', N'0', N'内埔乡', N'NEI4 BU4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3642', N'712446', N'3', N'0', N'万丹乡', N'MO4 DAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3643', N'712447', N'3', N'0', N'潮州镇', N'CHAO2 ZHOU1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3644', N'712448', N'3', N'0', N'泰武乡', N'TAI4 WU3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3645', N'712449', N'3', N'0', N'来义乡', N'LAI2 YI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3646', N'712450', N'3', N'0', N'万峦乡', N'MO4 LUAN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3647', N'712451', N'3', N'0', N'崁顶乡', N'KAN4 DING3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3648', N'712452', N'3', N'0', N'新埤乡', N'XIN1 PI2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3649', N'712453', N'3', N'0', N'南州乡', N'NAN2 ZHOU1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3650', N'712454', N'3', N'0', N'林边乡', N'LIN2 BIAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3651', N'712455', N'3', N'0', N'东港镇', N'DONG1 GANG3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3652', N'712456', N'3', N'0', N'琉球乡', N'LIU2 QIU2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3653', N'712457', N'3', N'0', N'佳冬乡', N'JIA1 DONG1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3654', N'712458', N'3', N'0', N'新园乡', N'XIN1 YUAN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3655', N'712459', N'3', N'0', N'枋寮乡', N'FANG1 LIAO2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3656', N'712460', N'3', N'0', N'枋山乡', N'FANG1 SHAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3657', N'712461', N'3', N'0', N'春日乡', N'CHUN1 RI4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3658', N'712462', N'3', N'0', N'狮子乡', N'SHI1 ZI3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3659', N'712463', N'3', N'0', N'车城乡', N'CHE1 CHENG2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3660', N'712464', N'3', N'0', N'牡丹乡', N'MU3 DAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3661', N'712465', N'3', N'0', N'恒春镇', N'HENG2 CHUN1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3662', N'712466', N'3', N'0', N'满州乡', N'MAN3 ZHOU1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3663', N'712500', N'2', N'0', N'台东县', N'TAI1 DONG1 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3664', N'712517', N'3', N'0', N'台东市', N'TAI1 DONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3665', N'712518', N'3', N'0', N'绿岛乡', N'LU4 DAO3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3666', N'712519', N'3', N'0', N'兰屿乡', N'LAN2 YU3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3667', N'712520', N'3', N'0', N'延平乡', N'YAN2 PING2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3668', N'712521', N'3', N'0', N'卑南乡', N'BEI1 NAN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3669', N'712522', N'3', N'0', N'鹿野乡', N'LU4 YE3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3670', N'712523', N'3', N'0', N'关山镇', N'GUAN1 SHAN1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3671', N'712524', N'3', N'0', N'海端乡', N'HAI3 DUAN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3672', N'712525', N'3', N'0', N'池上乡', N'CHI2 SHANG3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3673', N'712526', N'3', N'0', N'东河乡', N'DONG1 HE2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3674', N'712527', N'3', N'0', N'成功镇', N'CHENG2 GONG1 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3675', N'712528', N'3', N'0', N'长滨乡', N'CHANG2 BIN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3676', N'712529', N'3', N'0', N'金峰乡', N'JIN1 FENG1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3677', N'712530', N'3', N'0', N'大武乡', N'DA4 WU3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3678', N'712531', N'3', N'0', N'达仁乡', N'DA2 REN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3679', N'712532', N'3', N'0', N'太麻里乡', N'TAI4 MA1 LI3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3680', N'712600', N'2', N'0', N'花莲县', N'HUA1 LIAN2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3681', N'712615', N'3', N'0', N'花莲市', N'HUA1 LIAN2 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3682', N'712616', N'3', N'0', N'新城乡', N'XIN1 CHENG2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3683', N'712618', N'3', N'0', N'秀林乡', N'XIU4 LIN2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3684', N'712619', N'3', N'0', N'吉安乡', N'JI2 AN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3685', N'712620', N'3', N'0', N'寿丰乡', N'SHOU4 FENG1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3686', N'712621', N'3', N'0', N'凤林镇', N'FENG4 LIN2 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3687', N'712622', N'3', N'0', N'光复乡', N'GUANG1 FU4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3688', N'712623', N'3', N'0', N'丰滨乡', N'FENG1 BIN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3689', N'712624', N'3', N'0', N'瑞穗乡', N'RUI4 SUI4 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3690', N'712625', N'3', N'0', N'万荣乡', N'MO4 RONG2 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3691', N'712626', N'3', N'0', N'玉里镇', N'YU4 LI3 ZHEN1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3692', N'712627', N'3', N'0', N'卓溪乡', N'ZHUO2 XI1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3693', N'712628', N'3', N'0', N'富里乡', N'FU4 LI3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3694', N'712700', N'2', N'0', N'澎湖县', N'PENG1 HU2 XIAN4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3695', N'712707', N'3', N'0', N'马公市', N'MA3 GONG1 SHI4')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3696', N'712708', N'3', N'0', N'西屿乡', N'XI1 YU3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3697', N'712709', N'3', N'0', N'望安乡', N'WANG4 AN1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3698', N'712710', N'3', N'0', N'七美乡', N'QI1 MEI3 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3699', N'712711', N'3', N'0', N'白沙乡', N'BAI2 SHA1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3700', N'712712', N'3', N'0', N'湖西乡', N'HU2 XI1 XIANG1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3701', N'810000', N'1', N'0', N'香港特别行政区', N'XIANG1 GANG3 TE4 BIE2 HANG2 ZHENG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3702', N'810100', N'2', N'0', N'香港特别行政区', N'XIANG1 GANG3 TE4 BIE2 HANG2 ZHENG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3703', N'810101', N'3', N'0', N'中西区', N'ZHONG1 XI1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3704', N'810102', N'3', N'0', N'东区', N'DONG1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3705', N'810103', N'3', N'0', N'九龙城区', N'JIU3 LONG2 CHENG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3706', N'810104', N'3', N'0', N'观塘区', N'GUAN1 TANG2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3707', N'810105', N'3', N'0', N'南区', N'NAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3708', N'810106', N'3', N'0', N'深水埗区', N'SHEN1 SHUI3 BU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3709', N'810107', N'3', N'0', N'湾仔区', N'WAN1 ZAI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3710', N'810108', N'3', N'0', N'黄大仙区', N'HUANG2 DA4 XIAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3711', N'810109', N'3', N'0', N'油尖旺区', N'YOU1 JIAN1 WANG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3712', N'810110', N'3', N'0', N'离岛区', N'LI2 DAO3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3713', N'810111', N'3', N'0', N'葵青区', N'KUI2 QING1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3714', N'810112', N'3', N'0', N'北区', N'BEI3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3715', N'810113', N'3', N'0', N'西贡区', N'XI1 GONG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3716', N'810114', N'3', N'0', N'沙田区', N'SHA1 TIAN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3717', N'810115', N'3', N'0', N'屯门区', N'TUN2 MEN2 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3718', N'810116', N'3', N'0', N'大埔区', N'DA4 BU4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3719', N'810117', N'3', N'0', N'荃湾区', N'QUAN2 WAN1 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3720', N'810118', N'3', N'0', N'元朗区', N'YUAN2 LANG3 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3721', N'820000', N'1', N'0', N'澳门特别行政区', N'AO4 MEN2 TE4 BIE2 HANG2 ZHENG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3722', N'820100', N'2', N'0', N'澳门特别行政区', N'AO4 MEN2 TE4 BIE2 HANG2 ZHENG4 OU1')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3723', N'820101', N'3', N'0', N'澳门半岛', N'AO4 MEN2 BAN4 DAO3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3724', N'820102', N'3', N'0', N'凼仔', N'DANG4 ZAI3')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3725', N'820103', N'3', N'0', N'路凼城', N'LU4 DANG4 CHENG2')
GO

INSERT INTO [dbo].[Region] ([Id], [Code], [Level], [PostCode], [Name], [Pinyin]) VALUES (N'3726', N'820104', N'3', N'0', N'路环', N'LU4 HUAN2')
GO

SET IDENTITY_INSERT [dbo].[Region] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for SimpleOrder
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SimpleOrder]') AND type IN ('U'))
	DROP TABLE [dbo].[SimpleOrder]
GO

CREATE TABLE [dbo].[SimpleOrder] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [Type] int DEFAULT ((0)) NOT NULL,
  [UserId] bigint DEFAULT ((0)) NOT NULL,
  [OrderNO] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [transaction_id] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [time_end] varchar(20) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [total_fee] int DEFAULT ((0)) NOT NULL,
  [body] varchar(256) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Status] int DEFAULT ((0)) NOT NULL,
  [AddTime] datetime DEFAULT (getdate()) NOT NULL
)
GO

ALTER TABLE [dbo].[SimpleOrder] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'订单类型',
'SCHEMA', N'dbo',
'TABLE', N'SimpleOrder',
'COLUMN', N'Type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户编号',
'SCHEMA', N'dbo',
'TABLE', N'SimpleOrder',
'COLUMN', N'UserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'订单号，out_trade_no',
'SCHEMA', N'dbo',
'TABLE', N'SimpleOrder',
'COLUMN', N'OrderNO'
GO

EXEC sp_addextendedproperty
'MS_Description', N'微信支付订单号',
'SCHEMA', N'dbo',
'TABLE', N'SimpleOrder',
'COLUMN', N'transaction_id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'支付完成时间',
'SCHEMA', N'dbo',
'TABLE', N'SimpleOrder',
'COLUMN', N'time_end'
GO

EXEC sp_addextendedproperty
'MS_Description', N'订单金额（分）',
'SCHEMA', N'dbo',
'TABLE', N'SimpleOrder',
'COLUMN', N'total_fee'
GO

EXEC sp_addextendedproperty
'MS_Description', N'商品描述',
'SCHEMA', N'dbo',
'TABLE', N'SimpleOrder',
'COLUMN', N'body'
GO

EXEC sp_addextendedproperty
'MS_Description', N'订单状态，0-未支付，1-已支付，2-已取消，3-支付失败',
'SCHEMA', N'dbo',
'TABLE', N'SimpleOrder',
'COLUMN', N'Status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'SimpleOrder',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'订单表',
'SCHEMA', N'dbo',
'TABLE', N'SimpleOrder'
GO


-- ----------------------------
-- Table structure for SmsCode
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SmsCode]') AND type IN ('U'))
	DROP TABLE [dbo].[SmsCode]
GO

CREATE TABLE [dbo].[SmsCode] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [UserId] bigint DEFAULT ((0)) NOT NULL,
  [Mobile] varchar(20) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Code] varchar(20) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [IsUse] bit DEFAULT ((0)) NOT NULL,
  [Type] int DEFAULT ((0)) NOT NULL,
  [AddTime] datetime DEFAULT (getdate()) NOT NULL
)
GO

ALTER TABLE [dbo].[SmsCode] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户编号',
'SCHEMA', N'dbo',
'TABLE', N'SmsCode',
'COLUMN', N'UserId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'手机号',
'SCHEMA', N'dbo',
'TABLE', N'SmsCode',
'COLUMN', N'Mobile'
GO

EXEC sp_addextendedproperty
'MS_Description', N'验证码',
'SCHEMA', N'dbo',
'TABLE', N'SmsCode',
'COLUMN', N'Code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否使用',
'SCHEMA', N'dbo',
'TABLE', N'SmsCode',
'COLUMN', N'IsUse'
GO

EXEC sp_addextendedproperty
'MS_Description', N'类型1注册，2找回密码',
'SCHEMA', N'dbo',
'TABLE', N'SmsCode',
'COLUMN', N'Type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'SmsCode',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'验证码',
'SCHEMA', N'dbo',
'TABLE', N'SmsCode'
GO


-- ----------------------------
-- Table structure for SystemRes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemRes]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemRes]
GO

CREATE TABLE [dbo].[SystemRes] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [Name] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Url] varchar(200) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Target] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Type] int DEFAULT ((0)) NOT NULL,
  [Status] int DEFAULT ((0)) NOT NULL,
  [OrderNum] int DEFAULT ((0)) NOT NULL,
  [ParentId] bigint DEFAULT ((0)) NOT NULL,
  [Remark] varchar(500) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [AddTime] datetime DEFAULT (getdate()) NOT NULL,
  [Icon] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL
)
GO

ALTER TABLE [dbo].[SystemRes] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'资源名称',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'资源地址',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes',
'COLUMN', N'Url'
GO

EXEC sp_addextendedproperty
'MS_Description', N'链接目标',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes',
'COLUMN', N'Target'
GO

EXEC sp_addextendedproperty
'MS_Description', N'资源类型，1-菜单，2-权限',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes',
'COLUMN', N'Type'
GO

EXEC sp_addextendedproperty
'MS_Description', N'1启用，2禁用',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes',
'COLUMN', N'Status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'排序号',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes',
'COLUMN', N'OrderNum'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父编号',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes',
'COLUMN', N'ParentId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes',
'COLUMN', N'Remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图标',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes',
'COLUMN', N'Icon'
GO

EXEC sp_addextendedproperty
'MS_Description', N'菜单权限资源表',
'SCHEMA', N'dbo',
'TABLE', N'SystemRes'
GO


-- ----------------------------
-- Records of SystemRes
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[SystemRes] ON
GO

INSERT INTO [dbo].[SystemRes] ([Id], [Name], [Url], [Target], [Type], [Status], [OrderNum], [ParentId], [Remark], [AddTime], [Icon]) VALUES (N'1', N'权限', N'11', N'22', N'1', N'2', N'999', N'0', N'sdsd', N'2018-04-21 10:27:59.000', N'123')
GO

INSERT INTO [dbo].[SystemRes] ([Id], [Name], [Url], [Target], [Type], [Status], [OrderNum], [ParentId], [Remark], [AddTime], [Icon]) VALUES (N'2', N'用户管理', N'/systemuser/list', N'', N'1', N'1', N'1', N'1', N'', N'2018-04-21 10:39:06.993', N'')
GO

INSERT INTO [dbo].[SystemRes] ([Id], [Name], [Url], [Target], [Type], [Status], [OrderNum], [ParentId], [Remark], [AddTime], [Icon]) VALUES (N'3', N'角色管理', N'/systemrole/list', N'', N'1', N'1', N'2', N'1', N'', N'2018-04-21 10:39:52.286', N'')
GO

INSERT INTO [dbo].[SystemRes] ([Id], [Name], [Url], [Target], [Type], [Status], [OrderNum], [ParentId], [Remark], [AddTime], [Icon]) VALUES (N'4', N'资源管理', N'/systemres/list', N'', N'1', N'1', N'3', N'1', N'', N'2018-04-21 10:40:23.290', N'')
GO

INSERT INTO [dbo].[SystemRes] ([Id], [Name], [Url], [Target], [Type], [Status], [OrderNum], [ParentId], [Remark], [AddTime], [Icon]) VALUES (N'6', N'内容管理', N'', N'', N'1', N'1', N'0', N'0', N'', N'2018-05-25 15:59:24.870', N'')
GO

INSERT INTO [dbo].[SystemRes] ([Id], [Name], [Url], [Target], [Type], [Status], [OrderNum], [ParentId], [Remark], [AddTime], [Icon]) VALUES (N'7', N'数据字典', N'/datadict/list', N'', N'1', N'1', N'0', N'6', N'', N'2018-05-25 15:59:52.073', N'')
GO

INSERT INTO [dbo].[SystemRes] ([Id], [Name], [Url], [Target], [Type], [Status], [OrderNum], [ParentId], [Remark], [AddTime], [Icon]) VALUES (N'8', N'广告管理', N'/ad/list', N'', N'1', N'1', N'0', N'6', N'', N'2018-05-25 16:00:06.886', N'')
GO

SET IDENTITY_INSERT [dbo].[SystemRes] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for SystemRole
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemRole]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemRole]
GO

CREATE TABLE [dbo].[SystemRole] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [Name] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT ('‘’') NOT NULL
)
GO

ALTER TABLE [dbo].[SystemRole] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色名称',
'SCHEMA', N'dbo',
'TABLE', N'SystemRole',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色',
'SCHEMA', N'dbo',
'TABLE', N'SystemRole'
GO


-- ----------------------------
-- Records of SystemRole
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[SystemRole] ON
GO

INSERT INTO [dbo].[SystemRole] ([Id], [Name]) VALUES (N'1', N'管理员1')
GO

INSERT INTO [dbo].[SystemRole] ([Id], [Name]) VALUES (N'4', N'角色1')
GO

SET IDENTITY_INSERT [dbo].[SystemRole] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for SystemRole_Res
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemRole_Res]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemRole_Res]
GO

CREATE TABLE [dbo].[SystemRole_Res] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [SystemRoleId] bigint  NOT NULL,
  [SystemResId] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[SystemRole_Res] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统角色资源',
'SCHEMA', N'dbo',
'TABLE', N'SystemRole_Res'
GO


-- ----------------------------
-- Records of SystemRole_Res
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[SystemRole_Res] ON
GO

INSERT INTO [dbo].[SystemRole_Res] ([Id], [SystemRoleId], [SystemResId]) VALUES (N'42', N'1', N'6')
GO

INSERT INTO [dbo].[SystemRole_Res] ([Id], [SystemRoleId], [SystemResId]) VALUES (N'43', N'1', N'7')
GO

INSERT INTO [dbo].[SystemRole_Res] ([Id], [SystemRoleId], [SystemResId]) VALUES (N'44', N'1', N'8')
GO

INSERT INTO [dbo].[SystemRole_Res] ([Id], [SystemRoleId], [SystemResId]) VALUES (N'45', N'1', N'1')
GO

INSERT INTO [dbo].[SystemRole_Res] ([Id], [SystemRoleId], [SystemResId]) VALUES (N'46', N'1', N'2')
GO

INSERT INTO [dbo].[SystemRole_Res] ([Id], [SystemRoleId], [SystemResId]) VALUES (N'47', N'1', N'3')
GO

INSERT INTO [dbo].[SystemRole_Res] ([Id], [SystemRoleId], [SystemResId]) VALUES (N'48', N'1', N'4')
GO

SET IDENTITY_INSERT [dbo].[SystemRole_Res] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for SystemUser
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemUser]
GO

CREATE TABLE [dbo].[SystemUser] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [Username] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Password] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Nickname] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Gender] int DEFAULT ((0)) NOT NULL,
  [Status] int DEFAULT ((0)) NOT NULL,
  [avatar] varchar(200) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [AddTime] datetime DEFAULT (getdate()) NOT NULL
)
GO

ALTER TABLE [dbo].[SystemUser] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户名',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Username'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Password'
GO

EXEC sp_addextendedproperty
'MS_Description', N'昵称',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Nickname'
GO

EXEC sp_addextendedproperty
'MS_Description', N'1-男，2-女',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Gender'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态，1-正常，2-禁用',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'Status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'头像',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'avatar'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'员工表',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser'
GO


-- ----------------------------
-- Records of SystemUser
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[SystemUser] ON
GO

INSERT INTO [dbo].[SystemUser] ([Id], [Username], [Password], [Nickname], [Gender], [Status], [avatar], [AddTime]) VALUES (N'1', N'loogn', N'E10ADC3949BA59ABBE56E057F20F883E', N'王小龙', N'1', N'1', N'', N'2018-04-19 16:58:05.770')
GO

INSERT INTO [dbo].[SystemUser] ([Id], [Username], [Password], [Nickname], [Gender], [Status], [avatar], [AddTime]) VALUES (N'15', N'abc', N'E10ADC3949BA59ABBE56E057F20F883E', N'sd', N'1', N'1', N'', N'2019-07-15 15:41:50.603')
GO

SET IDENTITY_INSERT [dbo].[SystemUser] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for SystemUser_Res
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser_Res]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemUser_Res]
GO

CREATE TABLE [dbo].[SystemUser_Res] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [SystemUserId] bigint  NOT NULL,
  [SystemResId] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[SystemUser_Res] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统用户资源',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser_Res'
GO


-- ----------------------------
-- Records of SystemUser_Res
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[SystemUser_Res] ON
GO

INSERT INTO [dbo].[SystemUser_Res] ([Id], [SystemUserId], [SystemResId]) VALUES (N'11', N'1', N'1')
GO

INSERT INTO [dbo].[SystemUser_Res] ([Id], [SystemUserId], [SystemResId]) VALUES (N'12', N'1', N'2')
GO

INSERT INTO [dbo].[SystemUser_Res] ([Id], [SystemUserId], [SystemResId]) VALUES (N'13', N'1', N'3')
GO

INSERT INTO [dbo].[SystemUser_Res] ([Id], [SystemUserId], [SystemResId]) VALUES (N'14', N'1', N'4')
GO

SET IDENTITY_INSERT [dbo].[SystemUser_Res] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for SystemUser_Role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser_Role]') AND type IN ('U'))
	DROP TABLE [dbo].[SystemUser_Role]
GO

CREATE TABLE [dbo].[SystemUser_Role] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [SystemUserId] bigint  NOT NULL,
  [SystemRoleId] bigint  NOT NULL
)
GO

ALTER TABLE [dbo].[SystemUser_Role] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统用户角色',
'SCHEMA', N'dbo',
'TABLE', N'SystemUser_Role'
GO


-- ----------------------------
-- Records of SystemUser_Role
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[SystemUser_Role] ON
GO

INSERT INTO [dbo].[SystemUser_Role] ([Id], [SystemUserId], [SystemRoleId]) VALUES (N'11', N'1', N'1')
GO

INSERT INTO [dbo].[SystemUser_Role] ([Id], [SystemUserId], [SystemRoleId]) VALUES (N'22', N'1', N'4')
GO

INSERT INTO [dbo].[SystemUser_Role] ([Id], [SystemUserId], [SystemRoleId]) VALUES (N'23', N'15', N'4')
GO

SET IDENTITY_INSERT [dbo].[SystemUser_Role] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for User
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type IN ('U'))
	DROP TABLE [dbo].[User]
GO

CREATE TABLE [dbo].[User] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [Username] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Password] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Gender] int DEFAULT ((0)) NOT NULL,
  [Avatar] varchar(200) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Mobile] varchar(20) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [Status] int DEFAULT ((0)) NOT NULL,
  [AddTime] datetime DEFAULT (getdate()) NOT NULL,
  [Birthday] date DEFAULT ('1900-1-1') NOT NULL,
  [RegistrationId] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL
)
GO

ALTER TABLE [dbo].[User] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户名',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'Username'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登陆密码',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'Password'
GO

EXEC sp_addextendedproperty
'MS_Description', N'性别 0-保密,1-男，2-女',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'Gender'
GO

EXEC sp_addextendedproperty
'MS_Description', N'头像地址',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'Avatar'
GO

EXEC sp_addextendedproperty
'MS_Description', N'手机号',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'Mobile'
GO

EXEC sp_addextendedproperty
'MS_Description', N'1正常，2禁用',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'Status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'添加时间',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'生日',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'Birthday'
GO

EXEC sp_addextendedproperty
'MS_Description', N'设备注册编号',
'SCHEMA', N'dbo',
'TABLE', N'User',
'COLUMN', N'RegistrationId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户',
'SCHEMA', N'dbo',
'TABLE', N'User'
GO


-- ----------------------------
-- Records of User
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [dbo].[User] ON
GO

INSERT INTO [dbo].[User] ([Id], [Username], [Password], [Gender], [Avatar], [Mobile], [Status], [AddTime], [Birthday], [RegistrationId]) VALUES (N'1', N'loogn', N'123', N'0', N'', N'', N'0', N'2019-03-15 11:42:13.830', N'2019-03-15', N'')
GO

SET IDENTITY_INSERT [dbo].[User] OFF
GO

COMMIT
GO


-- ----------------------------
-- Primary Key structure for table Ad
-- ----------------------------
ALTER TABLE [dbo].[Ad] ADD CONSTRAINT [PK_Ad] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table AppVersion
-- ----------------------------
ALTER TABLE [dbo].[AppVersion] ADD CONSTRAINT [PK_AppVersion] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table CountLimit
-- ----------------------------
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180725-115903]
ON [dbo].[CountLimit] (
  [UniqueId] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table CountLimit
-- ----------------------------
ALTER TABLE [dbo].[CountLimit] ADD CONSTRAINT [PK_CountLimit] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table DataDict
-- ----------------------------
ALTER TABLE [dbo].[DataDict] ADD CONSTRAINT [PK__DataDict__3214EC0714270015] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Feedback
-- ----------------------------
ALTER TABLE [dbo].[Feedback] ADD CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Region
-- ----------------------------
ALTER TABLE [dbo].[Region] ADD CONSTRAINT [PK__Range__3214EC07123EB7A3] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SimpleOrder
-- ----------------------------
ALTER TABLE [dbo].[SimpleOrder] ADD CONSTRAINT [PK__Order__3214EC071B9317B3] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SmsCode
-- ----------------------------
ALTER TABLE [dbo].[SmsCode] ADD CONSTRAINT [PK_SmsCode] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SystemRes
-- ----------------------------
ALTER TABLE [dbo].[SystemRes] ADD CONSTRAINT [PK_SystemRes] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SystemRole
-- ----------------------------
ALTER TABLE [dbo].[SystemRole] ADD CONSTRAINT [PK_SystemRole] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SystemRole_Res
-- ----------------------------
ALTER TABLE [dbo].[SystemRole_Res] ADD CONSTRAINT [PK_SystemRole_Res] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SystemUser
-- ----------------------------
ALTER TABLE [dbo].[SystemUser] ADD CONSTRAINT [PK_SystemUser] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SystemUser_Res
-- ----------------------------
ALTER TABLE [dbo].[SystemUser_Res] ADD CONSTRAINT [PK_SystemUser_Res] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SystemUser_Role
-- ----------------------------
ALTER TABLE [dbo].[SystemUser_Role] ADD CONSTRAINT [PK_SystemUser_Role] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table User
-- ----------------------------
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

