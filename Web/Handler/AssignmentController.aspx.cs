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
    public partial class AssignmentController : System.Web.UI.Page
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
            assignment[] jsonData = null;

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
                    jsonData = JsonConvert.DeserializeObject<assignment[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Create(jsonData));
                    break;
                case "update":
                    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    jsonData = JsonConvert.DeserializeObject<assignment[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Update(jsonData));
                    break;
                case "destroy":
                    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    jsonData = JsonConvert.DeserializeObject<assignment[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Delete(jsonData));
                    break;

            }
            //直接用这个输出
            this.Response.Write(ret);
            this.Response.End();
        }


        public Object Get()
        {
            return _db.assignment.Where(b => b.resourceid != null);
        }


        public Object Create(assignment[] jsonData)
        {
            ////查找项目的id
            //int taskid = Convert.ToInt32(Request["taskid"]);

            ////强行设置taskid， 避免
            //foreach (assignment a in jsonData)
            //{
            //    a.task_id = taskid;
            //}

            //直接insert到数据表中
            var jsonData2 = jsonData.Where(b => b.resourceid != null);
            _db.assignment.InsertAllOnSubmit(jsonData2);
            _db.SubmitChanges(ConflictMode.ContinueOnConflict);
            return jsonData2;
        }

        public Object Update(assignment[] jsonData)
        {
            if (jsonData != null)
            {
                foreach (assignment a in jsonData)
                {
                    assignment assign = _db.assignment.Single(b => b.id == a.id);
                    assign.task_id = a.task_id;
                    assign.resource_id = a.resource_id;
                    assign.units_val = a.units_val;
                    assign.resourceid = a.resourceid;
                    assign.unitsval = a.unitsval;
                }
            }
            _db.SubmitChanges();
            return jsonData;
        }

        public Object Delete(assignment[] jsonData)
        {
            if (jsonData != null)
            {
                foreach (assignment a in jsonData)
                {
                    assignment assign = _db.assignment.SingleOrDefault(b => b.id == a.id);
                    _db.assignment.DeleteOnSubmit(assign);
                }
            }
            _db.SubmitChanges();
            return new { success = true };
        }
    }
}