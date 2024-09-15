using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//数据层相关的项目
using TakeTopGantt.models;
using Devart.Data.Linq;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using Newtonsoft.Json;


namespace TakeTopGantt.handler
{
    public partial class TaskController : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.dispachAction();
        }

        readonly extganttDataContext _db = new extganttDataContext();

        protected void dispachAction()
        {
            String action = this.Request["action"];
            String ret = null;
            String data = null;
            task[] jsonData = null;

            //在新建的项目中， 可能id=“”或空， 
            var settings = new JsonSerializerSettings();
            settings.NullValueHandling = NullValueHandling.Ignore;

            //判断当前用户有没有修改用户计划的权限
            int pid = Convert.ToInt32(Request["pid"]);
            if (GanttShareClass.CheckUserCanUpdatePlan(pid.ToString()) == false || GanttShareClass.CheckIsCanUpdatePlanByProjectStatus(pid.ToString()) == false)
            {
                if (action != "read")
                {
                    action = "";
                }
            }
         

            switch (action)
            {
                case "read":
                    ret = JsonConvert.SerializeObject(this.Get());
                    break;
                case "create":
                    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    jsonData = JsonConvert.DeserializeObject<task[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Create(jsonData));
                    break;
                case "update":
                    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    jsonData = JsonConvert.DeserializeObject<task[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Update(jsonData));
                    break;
                case "destroy":
                    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    jsonData = JsonConvert.DeserializeObject<task[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Delete(jsonData));
                    break;

            }
            this.Response.Write(ret);
            this.Response.End();
        }

        /*********************************************************
         * 以下分别是增删改查的具体实现
         * *******************************************************/
        //获取计划列表
        public object Get()
        {
            extganttDataContext _db = new extganttDataContext();
            //查找项目的id
            int pid = Convert.ToInt32(Request["pid"]);

            //取值是parent_id = null是
            var rootTasks = _db.task.Where(b => b.parent_id == 0 && b.pid == pid);
            List<NestedTaskModel> roots = new List<NestedTaskModel>();

            foreach (task cd in rootTasks)
            {
                NestedTaskModel n = new NestedTaskModel(cd);
                roots.Add(n);
                this.SetNodeChildren(n);
            }

            return roots;
        }


        //新建计划， 注意计划的pid应该保存
        public Object Create(task[] jsonData)
        {
            //查找项目的id
            int pid = Convert.ToInt32(Request["pid"]);

            extganttDataContext _db = new extganttDataContext();

            //强行设置pid， 避免多个项目混淆
            foreach (task t in jsonData)
            {
                t.pid = pid;
                //bryntum 会将root节点的parentid设置为null， 我们软件是用0来判断的
                if (t.parent_id == null)
                {
                    t.parent_id = 0;
                }
            }

            _db.task.InsertAllOnSubmit(jsonData);
            _db.SubmitChanges(ConflictMode.ContinueOnConflict);
            List<NestedTaskModel> roots = new List<NestedTaskModel>();

            foreach (task cd in jsonData)
            {
                NestedTaskModel n = new NestedTaskModel(cd);
                roots.Add(n);
                this.SetNodeChildren(n);
            }
            return roots;
        }

        //计划的更新操作
        public Object Update(task[] jsonData)
        {
            extganttDataContext _db = new extganttDataContext();
            foreach (task vals in jsonData)
            {
                task t = _db.task.SingleOrDefault(b => b.id == vals.id);

                if (t != null)
                {
                    t.name = vals.name;
                    t.parent_id = vals.parent_id;
                    t.duration = vals.duration;
                    t.duration_unit = vals.duration_unit;

                    t.percent_done = vals.percent_done;
                    t.start_date = vals.start_date;
                    t.end_date = vals.end_date;

                    t.priority = vals.priority;

                    t.baseline_start_date = vals.baseline_start_date;
                    t.baseline_end_date = vals.baseline_end_date;
                    t.baseline_percent_done = vals.baseline_percent_done;

                    t.other_field = vals.other_field;
                    t.pid = vals.pid;
                    t.index = vals.index;

                    try
                    {
                        t.leader = GanttShareClass.GetUserName(vals.leader.Trim());
                        t.leadercode = vals.leader;
                    }
                    catch
                    {
                        try
                        {
                            t.leadercode = GanttShareClass.GetUserCodeByProjectMemberName(vals.leader.Trim());
                            t.leader = vals.leader;
                        }
                        catch
                        {

                        }
                    }

                    

                    t.workhour = vals.workhour;
                    t.actualhour = vals.actualhour;

                    t.requirenumber = vals.requirenumber;
                    t.finishednumber = vals.finishednumber;
                    t.price = vals.price;
                    t.unitname = vals.unitname;

                    t.budget = vals.budget;
                    t.expense = vals.expense;

                    t.remark = vals.remark;
                    t.taskcolor = vals.taskcolor;
                    //bryntum 会将root节点的parentid设置为null， 我们软件是用0来判断的
                    if (t.parent_id == null)
                    {
                        t.parent_id = 0;
                    }
                }
            }
            _db.SubmitChanges(ConflictMode.ContinueOnConflict);

            List<NestedTaskModel> roots = new List<NestedTaskModel>();

            foreach (task cd in jsonData)
            {
                NestedTaskModel n = new NestedTaskModel(cd);
                roots.Add(n);
                this.SetNodeChildren(n);
            }
            return roots;
            //return jsonData;
        }

        public Object Delete(task[] jsonData)
        {
            extganttDataContext _db = new extganttDataContext();
            foreach (task t in jsonData)
            {
                task taskInDb = _db.task.SingleOrDefault(b => b.id == t.id);

                //先删除计划的关联关系，再删除计划
                if (taskInDb != null)
                {
                    var deps = _db.dependency.Where(b => (b.to_id == t.id || b.from_id == t.id));
                    _db.dependency.DeleteAllOnSubmit(deps);
                    _db.task.DeleteOnSubmit(taskInDb);
                }
            }
            _db.SubmitChanges();
            return new { success = true };
        }

        //设置Task的子节点
        protected void SetNodeChildren(NestedTaskModel node)
        {
            extganttDataContext _db = new extganttDataContext();
            //查找node的儿子节点
            var children = _db.task.Where(b => b.parent_id == node.id);

            if (children.Count<task>() > 0)
            {
                node.children = new List<NestedTaskModel>();

                //
                foreach (task t in children)
                {
                    NestedTaskModel n = new NestedTaskModel(t);
                    node.children.Add(n);
                    this.SetNodeChildren(n);
                }

                // Last step, sort children on the 'index' field
                //最后一步，设置node的index
                node.children = node.children.OrderBy(a => a.index).ToList();
            }
            node.leaf = (node.children == null);
            node.expanded = !node.leaf;
        }
    }
}