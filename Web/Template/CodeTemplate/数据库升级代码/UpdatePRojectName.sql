

Alter Procedure Pr_UpdateProjectName
as

   declare @chrProjectName Char(200)
   declare @intProjectID int
   declare @chrPlanDetail varchar(200)

   set @chrProjectName = '����ӯ��������������Ŀ'
   set @intProjectID = 153
   set @chrPlanDetail = '����ӯ�������������Ŀ '
   
   update T_Project Set ProjectName = @chrProjectName Where ProjectID = @intProjectID

   update T_DailyWork set ProjectName = @chrProjectName where ProjectID = @intProjectID


   update T_ImplePlan set PlanDetail = @chrProjectName where ProjectID = @intProjectID and PlanDetail = @chrPlanDetail

   update T_WorkFlow Set WLName = '��Ŀ������ӯ��������������Ŀ ��������' where RelatedType = '��Ŀ' and RelatedID = 153


GO

Execute  Pr_UpdateProjectName
   

GO