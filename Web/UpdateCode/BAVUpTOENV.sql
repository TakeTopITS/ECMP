
---------20140318 BEGIN-------------------------------------------------
Update T_Project Set CurrencyType = '元' Where CurrencyType = '人民币'
GO
Update T_Project Set CurrencyType = '元' Where CurrencyType = '人民币'
GO

---物料退货表单号字段名改正-----------------------------------------------
EXEC sp_rename 'T_GoodsReturnOrder.ReturnNO','ROID','column'
GO

EXEC sp_rename 'T_GoodsReturnDetail.ReturnNO','ROID','column'
GO


---删除财务报表---------------------------------
Delete From T_ProModule Where ModuleName in ('现金流量表','资产负债表','损益表','资产明细表')
GO
Delete From T_ProModuleLevel Where ModuleName in ('现金流量表','资产负债表','损益表','资产明细表')
GO

-------------SAMPLE----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('收支明细汇总表','SAMPLE','NO')
GO

-------------ADMIN----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('收支明细汇总表','ADMIN','YES')
GO

----------增加“收支明细汇总表”模块--------------
Insert into T_ProModuleLevel(ModuleName,ParentModule,SortNumber,PageName)
      Values('收支明细汇总表','财务管理',7,'TTAccountReceiverPayDetailSummaryReport.aspx')
GO

update T_ProModuleLevel
set ModuleName = '立项补充'
where ModuleName = '项目立项编辑'
GO

update T_ProModule
set ModuleName = '立项补充'
where ModuleName = '项目立项编辑'
GO

-------------SAMPLE----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('承包商登记','SAMPLE','NO')
GO

-------------ADMIN----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('承包商登记','ADMIN','YES')
GO

----------增加“招投标管理”模块--------------
Insert into T_ProModuleLevel(ModuleName,ParentModule,SortNumber,PageName)
      Values('承包商登记','招投标管理',1,'TTBMSupplierInfo.aspx')
GO
-------------SAMPLE----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('承包商帐号管理','SAMPLE','NO')
GO

-------------ADMIN----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('承包商帐号管理','ADMIN','YES')
GO

----------增加“承包商帐号管理”模块--------------
Insert into T_ProModuleLevel(ModuleName,ParentModule,SortNumber,PageName)
      Values('承包商帐号管理','招投标管理',1,'TTBMCustomerMember.aspx')
GO

----V20140331 BEGIN-------------------------------------------------------
Update T_ProModule Set ModuleName = '摄像监控' Where ModuleName = '现场管理'
GO

Update T_ProModuleLevel Set ModuleName = '摄像监控' Where ModuleName = '现场管理'
GO

Update T_ProModuleLevel Set ParentModule = '摄像监控' Where ParentModule = '现场管理'
GO

--V20140418 BEGIN-------------------------------------------
CREATE TABLE [dbo].[T_DataBaseUpgrate](
	[ID] [int] NOT NULL,
	[SQLText] [varchar](max) NULL,
	[IsSucess] [char](10) NULL,
 CONSTRAINT [PK_T_DataBaseUpgrate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

---基础版修正代码----------------
ALTER TABLE T_ProjectMember ADD JobTitle VARCHAR(50) DEFAULT ''
GO

UPDATE T_ProjectMember SET JobTitle = '' Where Isnull(JobTitle,'') = ''
GO

ALTER TABLE T_DataBaseUpgrate ADD UPDATETIME DATETIME  DEFAULT GETDATE()
GO

UPDATE T_DataBaseUpgrate SET UpdateTime = GETDATE() Where ISNULL (UpdateTime,now()) = now()
GO

Delete From T_ProModuleLevel  Where PageName = 'TTAccountBaseData.aspx' And ModuleName = '系统模组设定'
GO

Insert into T_ProModuleLevel(ModuleName,ParentModule,PageName,ModuleType,SortNumber)
      Values('会计科目设置','参数设置','TTAccountBaseData.aspx','SYSTEM',3)


-------------SAMPLE----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('会计科目设置','SAMPLE','YES')


-------------ADMIN------------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('会计科目设置','ADMIN','YES')
      
GO

Update T_ProModule Set Visible = 'YES' Where UserCode = 'ADMIN'
GO


---------------------判断条件BEGIN---------------------------
--V20140418 BEGIN-------------------------------------------
Alter Table T_WorkFlowTemplate Add Visible char(10) default 'YES'
GO

Update T_WorkFlowTemplate Set Visible = 'YES'
GO
---------------------判断条件END----------------------------

