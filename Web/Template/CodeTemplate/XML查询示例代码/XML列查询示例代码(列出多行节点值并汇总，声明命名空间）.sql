
--查询XML列符合条件的节点值并汇总
Alter Database ProjectMgtDBPro Set ARITHABORT On

DECLARE @xml XML

WITH XMLNAMESPACES ('http://schemas.microsoft.com/office/infopath/2003/myXSD/2012-06-04T05:49:21' as my)
select @xml = WFXMLData.query('//my:bingxi1')
   From T_WorkFlow Where WLID = 734  and WFXMLData.value('(//my:riqi1/text())[1]', 'Nvarchar(10)') > '2012-06-10'

WITH XMLNAMESPACES ('http://schemas.microsoft.com/office/infopath/2003/myXSD/2012-06-04T05:49:21' as my)
SELECT T.x.query('./text()') as BingXi FROM @xml.nodes('//my:bingxi1') AS T(x) 

WITH XMLNAMESPACES ('http://schemas.microsoft.com/office/infopath/2003/myXSD/2012-06-04T05:49:21' as my) 
SELECT sum(T.x.value('.','float')) as TotalBingXi FROM @xml.nodes('//my:bingxi1') AS T(x) 
   Where T.x.value('.','float') > 3250

Alter Database ProjectMgtDBPro Set ARITHABORT Off

