
1.�ж�LINKSERVER�Ƿ����
if exists(select * from sysservers where srvname='sqlsrv03')
begin
print 'ok'
end
else
begin
EXEC sp_addlinkedserver @server = 'dbserver'
end
GO



�Ӱѱ��صı������ݲ嵽��һ���������������£�
insert into opendatasource( 'SQLOLEDB', 'Data Source=172.17.254.5;User ID=��½��;Password=����').PF_DB.dbo.seT_orderbuy 
select *from dbo.seT_orderbuy 
where orderstartdate>='2008/11/26' and orderenddate<='2008/12/02' and suppliercode='3429' 

/*--ͬ���������ݿ��ʾ�� 
 
������ 
srv1.����..author���ֶ�:id,name,phone, 
srv2.����..author���ֶ�:id,name,telphone,adress 
 
Ҫ�� 
srv1.����..author���Ӽ�¼��srv1.����..author��¼���� 
srv1.����..author��phone�ֶθ��£���srv1.����..author��Ӧ�ֶ�telphone���� 
*/ 
 
--���µĴ����� 
--1.�� srv1 �ϴ������ӷ�����,�Ա��� srv1 �в��� srv2,ʵ��ͬ�� 
exec sp_addlinkedserver 'srv2','','SQLOLEDB','srv2��sqlʵ������ip' 
exec sp_addlinkedsrvlogin 'srv2','false',null,'�û���','����' 
go 
 
--2.�� srv1 �� srv2 ����̨������,���� msdtc(�ֲ�ʽ���������),��������Ϊ�Զ����� 
�ҵĵ���--�������--������--����--�Ҽ� Distributed Transaction Coordinator--����--����--����������������Ϊ�Զ����� 
go 
 
 
--Ȼ�󴴽�һ����ҵ��ʱ���������ͬ������洢���̾����� 
 
��ҵ������ 
--���� 
--SQL Server���� 
--�Ҽ���ҵ 
--�½���ҵ 
--"����"����������ҵ���� 
--"����"�� 
--�½� 
--"������"�����벽���� 
--"����"��ѡ��"Transact-SQL �ű�(TSQL)" 
--"���ݿ�"ѡ��ִ����������ݿ� 
--"����"������Ҫִ�е����: exec p_process 
--ȷ�� 
--"����"�� 
--�½����� 
--"����"������������� 
--"��������"��ѡ�������ҵִ�а��� 
--���ѡ��"��������" 
--��"����"���������ʱ�䰲�� 
 
 
Ȼ��SQL Agent��������,������Ϊ�Զ�����,���������ҵ���ᱻִ�� 
 
���÷���: 
�ҵĵ���--�������--������--����--�Ҽ� SQLSERVERAGENT--����--��������--ѡ��"�Զ�����"--ȷ��. 
 
 
--3.ʵ��ͬ������ķ���2,��ʱͬ�� 
 
--��srv1�д������µ�ͬ������洢���� 
create proc p_process 
as 
--�����޸Ĺ������� 
update b set name=i.name,telphone=i.telphone 
from srv2.����.dbo.author b,author i 
where b.id=i.id and 
(b.name <> i.name or b.telphone <> i.telphone) 
 
--�������������� 
insert srv2.����.dbo.author(id,name,telphone) 
select id,name,telphone from author i 
where not exists( 
select * from srv2.����.dbo.author where id=i.id) 
 
--ɾ���Ѿ�ɾ��������(�����Ҫ�Ļ�) 
delete b 
from srv2.����.dbo.author b 
where not exists( 
select * from author where id=b.id) 
go 


Exec sp_droplinkedsrvlogin DBVIP,Null
Exec sp_dropserver DBVIP

EXEC  sp_addlinkedserver
      @server='DBVIP',--�����ʵķ��������� 
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='Server2'   --Ҫ���ʵķ�����


EXEC sp_addlinkedsrvlogin 
     'DBVIP', --�����ʵķ���������
     'false', 
     NULL, 
     'sa', --�ʺ�
     'thankyoubobby' --����


Select   *   from DBVIP.pubs.dbo.orders   
