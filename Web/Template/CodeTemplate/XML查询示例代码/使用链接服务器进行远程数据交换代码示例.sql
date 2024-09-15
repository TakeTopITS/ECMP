
1.判断LINKSERVER是否存在
if exists(select * from sysservers where srvname='sqlsrv03')
begin
print 'ok'
end
else
begin
EXEC sp_addlinkedserver @server = 'dbserver'
end
GO



从把本地的表中数据插到另一个服务器里，语句如下：
insert into opendatasource( 'SQLOLEDB', 'Data Source=172.17.254.5;User ID=登陆名;Password=密码').PF_DB.dbo.seT_orderbuy 
select *from dbo.seT_orderbuy 
where orderstartdate>='2008/11/26' and orderenddate<='2008/12/02' and suppliercode='3429' 

/*--同步两个数据库的示例 
 
有数据 
srv1.库名..author有字段:id,name,phone, 
srv2.库名..author有字段:id,name,telphone,adress 
 
要求： 
srv1.库名..author增加记录则srv1.库名..author记录增加 
srv1.库名..author的phone字段更新，则srv1.库名..author对应字段telphone更新 
*/ 
 
--大致的处理步骤 
--1.在 srv1 上创建连接服务器,以便在 srv1 中操作 srv2,实现同步 
exec sp_addlinkedserver 'srv2','','SQLOLEDB','srv2的sql实例名或ip' 
exec sp_addlinkedsrvlogin 'srv2','false',null,'用户名','密码' 
go 
 
--2.在 srv1 和 srv2 这两台电脑中,启动 msdtc(分布式事务处理服务),并且设置为自动启动 
我的电脑--控制面板--管理工具--服务--右键 Distributed Transaction Coordinator--属性--启动--并将启动类型设置为自动启动 
go 
 
 
--然后创建一个作业定时调用上面的同步处理存储过程就行了 
 
企业管理器 
--管理 
--SQL Server代理 
--右键作业 
--新建作业 
--"常规"项中输入作业名称 
--"步骤"项 
--新建 
--"步骤名"中输入步骤名 
--"类型"中选择"Transact-SQL 脚本(TSQL)" 
--"数据库"选择执行命令的数据库 
--"命令"中输入要执行的语句: exec p_process 
--确定 
--"调度"项 
--新建调度 
--"名称"中输入调度名称 
--"调度类型"中选择你的作业执行安排 
--如果选择"反复出现" 
--点"更改"来设置你的时间安排 
 
 
然后将SQL Agent服务启动,并设置为自动启动,否则你的作业不会被执行 
 
设置方法: 
我的电脑--控制面板--管理工具--服务--右键 SQLSERVERAGENT--属性--启动类型--选择"自动启动"--确定. 
 
 
--3.实现同步处理的方法2,定时同步 
 
--在srv1中创建如下的同步处理存储过程 
create proc p_process 
as 
--更新修改过的数据 
update b set name=i.name,telphone=i.telphone 
from srv2.库名.dbo.author b,author i 
where b.id=i.id and 
(b.name <> i.name or b.telphone <> i.telphone) 
 
--插入新增的数据 
insert srv2.库名.dbo.author(id,name,telphone) 
select id,name,telphone from author i 
where not exists( 
select * from srv2.库名.dbo.author where id=i.id) 
 
--删除已经删除的数据(如果需要的话) 
delete b 
from srv2.库名.dbo.author b 
where not exists( 
select * from author where id=b.id) 
go 


Exec sp_droplinkedsrvlogin DBVIP,Null
Exec sp_dropserver DBVIP

EXEC  sp_addlinkedserver
      @server='DBVIP',--被访问的服务器别名 
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='Server2'   --要访问的服务器


EXEC sp_addlinkedsrvlogin 
     'DBVIP', --被访问的服务器别名
     'false', 
     NULL, 
     'sa', --帐号
     'thankyoubobby' --密码


Select   *   from DBVIP.pubs.dbo.orders   
