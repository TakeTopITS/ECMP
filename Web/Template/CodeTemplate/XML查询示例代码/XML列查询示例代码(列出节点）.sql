//查询XML列符合条件的节点

Alter Database ProjectMgtDBPro Set ARITHABORT On

SELECT WFXMLData.query('declare namespace my="http://schemas.microsoft.com/office/infopath/2003/myXSD/2011-04-23T03:39:03";/my:myFields/my:riqi') 
  From T_WorkFlow Where WLID = 717