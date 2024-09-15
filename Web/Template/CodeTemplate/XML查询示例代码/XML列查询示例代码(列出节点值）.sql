//查询XML列符合条件的节点值

Alter Database ProjectMgtDBPro Set ARITHABORT On

select WLID,WLName, WFXMLData.value('
    declare namespace my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2011-04-23T03:39:03";
    (/my:myFields/my:riqi/text())[1]', 'Nvarchar(50)') as RiQi    
 From T_WorkFlow Where WLID = 717



   