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
    public partial class DependencyController : System.Web.UI.Page
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
            dependency[] jsonData = null;

            //在新建的项目中， 可能id=“”或空， 
            var settings = new JsonSerializerSettings();
            settings.NullValueHandling = NullValueHandling.Ignore;

            //判断当前用户有没有修改用户计划的权限
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
                    jsonData = JsonConvert.DeserializeObject<dependency[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Create(jsonData));
                    break;
                case "update":
                    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    jsonData = JsonConvert.DeserializeObject<dependency[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Update(jsonData));
                    break;
                case "destroy":
                    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    jsonData = JsonConvert.DeserializeObject<dependency[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Delete(jsonData));
                    break;

            }
            //直接用这个输出
            this.Response.Write(ret);
            this.Response.End();
        }


        public Object Get()
        {
            //查找项目的id
            int pid = Convert.ToInt32(Request["pid"]);
            return _db.dependency.Where(b => b.pid == pid);
        }


        public Object Create(dependency[] jsonData)
        {
            //查找项目的id
            int pid = Convert.ToInt32(Request["pid"]);

            //强行设置pid， 避免
            foreach (dependency t in jsonData)
            {
                t.pid = pid;
            }

            //直接insert到数据表中
            _db.dependency.InsertAllOnSubmit(jsonData);
            _db.SubmitChanges(ConflictMode.ContinueOnConflict);
            return jsonData;
        }

        public Object Update(dependency[] jsonData)
        {
            if (jsonData != null)
            {
                foreach (dependency d in jsonData)
                {
                    dependency dep = _db.dependency.Single(b => b.id == d.id);
                    dep.from_id = d.from_id;
                    dep.to_id = d.to_id;
                    dep.pid = d.pid;
                    dep.type = d.type;
                    //todo 没有lag day
                }
            }
            _db.SubmitChanges();
            return jsonData;
        }

        public Object Delete(dependency[] jsonData)
        {
            if (jsonData != null)
            {
                foreach (dependency d in jsonData)
                {
                    dependency dep = _db.dependency.SingleOrDefault(b => b.id == d.id);
                    _db.dependency.DeleteOnSubmit(dep);
                }
            }
            _db.SubmitChanges();
            return new { success = true };
        }
    }
}