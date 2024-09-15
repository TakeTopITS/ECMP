--自定义表单报表视图模板----------------------------------------------------
Create View V_ExpenseClaim_Report
AS


/*---汇总统计函数样板-------------------------------------------------------
Drop Function GetSumAmount
GO

Create Function GetSumAmount(@xml xml) RETURNS float
AS 
Begin  
    declare @SubAmount float

	Select  @subAmount = sum(T.x.value('.','float')) From @xml.nodes('//amount') AS T(x)   

    return @subAmount
end
GO
*/


----分组基于数据汇总统计-----
Select WLID,CreatorCode,CreatorName,cast(WFXMLData.query('/expenseReport/employee/name/text()') as char) As Employee, 
     dbo.GetSumAmount(cast(WFXMLData.query('/expenseReport/items/item/amount') as xml)) as TotalAmount  
     From T_WorkFlow Where  WLType = '费用报销' and isnull(cast(WFXMLData as varchar(max)),'') <> '' 

/*
----分组基于字符列表统计-----
Select WLID,cast(WFXMLData.query('/expenseReport/employee/name/text()') as char) As Employee, 
     substring(replace(replace(cast(WFXMLData.query('/expenseReport/items/item/description') as varchar(max)),'<description>',''),'</description>',','),1,len(replace(replace(cast(WFXMLData.query('/expenseReport/items/item/description') as varchar(max)),'<description>',''),'</description>',','))-1)  AS DescriptionList
     From T_WorkFlow Where  WLType = '费用报销' and isnull(cast(WFXMLData as varchar(max)),'') <> '' 
/*

