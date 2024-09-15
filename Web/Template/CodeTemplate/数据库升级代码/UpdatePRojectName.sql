

Alter Procedure Pr_UpdateProjectName
as

   declare @chrProjectName Char(200)
   declare @intProjectID int
   declare @chrPlanDetail varchar(200)

   set @chrProjectName = '富力盈丰商务大厦设计项目'
   set @intProjectID = 153
   set @chrPlanDetail = '富力盈丰商务厦设计项目 '
   
   update T_Project Set ProjectName = @chrProjectName Where ProjectID = @intProjectID

   update T_DailyWork set ProjectName = @chrProjectName where ProjectID = @intProjectID


   update T_ImplePlan set PlanDetail = @chrProjectName where ProjectID = @intProjectID and PlanDetail = @chrPlanDetail

   update T_WorkFlow Set WLName = '项目：富力盈丰商务大厦设计项目 进度评审' where RelatedType = '项目' and RelatedID = 153


GO

Execute  Pr_UpdateProjectName
   

GO