
---------20140318 BEGIN-------------------------------------------------
Update T_Project Set CurrencyType = 'Ԫ' Where CurrencyType = '�����'
GO
Update T_Project Set CurrencyType = 'Ԫ' Where CurrencyType = '�����'
GO

---�����˻������ֶ�������-----------------------------------------------
EXEC sp_rename 'T_GoodsReturnOrder.ReturnNO','ROID','column'
GO

EXEC sp_rename 'T_GoodsReturnDetail.ReturnNO','ROID','column'
GO


---ɾ�����񱨱�---------------------------------
Delete From T_ProModule Where ModuleName in ('�ֽ�������','�ʲ���ծ��','�����','�ʲ���ϸ��')
GO
Delete From T_ProModuleLevel Where ModuleName in ('�ֽ�������','�ʲ���ծ��','�����','�ʲ���ϸ��')
GO

-------------SAMPLE----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('��֧��ϸ���ܱ�','SAMPLE','NO')
GO

-------------ADMIN----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('��֧��ϸ���ܱ�','ADMIN','YES')
GO

----------���ӡ���֧��ϸ���ܱ�ģ��--------------
Insert into T_ProModuleLevel(ModuleName,ParentModule,SortNumber,PageName)
      Values('��֧��ϸ���ܱ�','�������',7,'TTAccountReceiverPayDetailSummaryReport.aspx')
GO

update T_ProModuleLevel
set ModuleName = '�����'
where ModuleName = '��Ŀ����༭'
GO

update T_ProModule
set ModuleName = '�����'
where ModuleName = '��Ŀ����༭'
GO

-------------SAMPLE----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('�а��̵Ǽ�','SAMPLE','NO')
GO

-------------ADMIN----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('�а��̵Ǽ�','ADMIN','YES')
GO

----------���ӡ���Ͷ�����ģ��--------------
Insert into T_ProModuleLevel(ModuleName,ParentModule,SortNumber,PageName)
      Values('�а��̵Ǽ�','��Ͷ�����',1,'TTBMSupplierInfo.aspx')
GO
-------------SAMPLE----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('�а����ʺŹ���','SAMPLE','NO')
GO

-------------ADMIN----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('�а����ʺŹ���','ADMIN','YES')
GO

----------���ӡ��а����ʺŹ���ģ��--------------
Insert into T_ProModuleLevel(ModuleName,ParentModule,SortNumber,PageName)
      Values('�а����ʺŹ���','��Ͷ�����',1,'TTBMCustomerMember.aspx')
GO

----V20140331 BEGIN-------------------------------------------------------
Update T_ProModule Set ModuleName = '������' Where ModuleName = '�ֳ�����'
GO

Update T_ProModuleLevel Set ModuleName = '������' Where ModuleName = '�ֳ�����'
GO

Update T_ProModuleLevel Set ParentModule = '������' Where ParentModule = '�ֳ�����'
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

---��������������----------------
ALTER TABLE T_ProjectMember ADD JobTitle VARCHAR(50) DEFAULT ''
GO

UPDATE T_ProjectMember SET JobTitle = '' Where Isnull(JobTitle,'') = ''
GO

ALTER TABLE T_DataBaseUpgrate ADD UPDATETIME DATETIME  DEFAULT GETDATE()
GO

UPDATE T_DataBaseUpgrate SET UpdateTime = GETDATE() Where ISNULL (UpdateTime,now()) = now()
GO

Delete From T_ProModuleLevel  Where PageName = 'TTAccountBaseData.aspx' And ModuleName = 'ϵͳģ���趨'
GO

Insert into T_ProModuleLevel(ModuleName,ParentModule,PageName,ModuleType,SortNumber)
      Values('��ƿ�Ŀ����','��������','TTAccountBaseData.aspx','SYSTEM',3)


-------------SAMPLE----------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('��ƿ�Ŀ����','SAMPLE','YES')


-------------ADMIN------------------------------
Insert into T_ProModule(ModuleName,UserCode,Visible)
      Values('��ƿ�Ŀ����','ADMIN','YES')
      
GO

Update T_ProModule Set Visible = 'YES' Where UserCode = 'ADMIN'
GO


---------------------�ж�����BEGIN---------------------------
--V20140418 BEGIN-------------------------------------------
Alter Table T_WorkFlowTemplate Add Visible char(10) default 'YES'
GO

Update T_WorkFlowTemplate Set Visible = 'YES'
GO
---------------------�ж�����END----------------------------

