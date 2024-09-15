
--查询XML列符合条件的节点值

Alter Database ProjectMgtDBPro Set ARITHABORT On

DECLARE @xml XML
DECLARE @xml2 XML

select @xml = WFXMLData.query('
    declare namespace my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2012-06-04T05:49:21";
    //my:bingxi1')
 From T_WorkFlow Where WLID = 734  and WFXMLData.value('
    declare namespace my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2012-06-04T05:49:21";
    (//my:riqi1/text())[1]', 'Nvarchar(10)') > '2012-06-10'

SELECT T.x.query('./text()') as BingXi FROM @xml.nodes('declare namespace my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2012-06-04T05:49:21";//my:bingxi1') AS T(x) 
 
SELECT sum(T.x.value('.','int')) as TotalBingXi FROM @xml.nodes('declare namespace my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2012-06-04T05:49:21";//my:bingxi1') AS T(x) 

Alter Database ProjectMgtDBPro Set ARITHABORT Off

