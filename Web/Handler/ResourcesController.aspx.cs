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

using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace TakeTopGantt.handler
{
    public partial class ResourcesController : System.Web.UI.Page
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
            resources[] jsonData = null;

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
                    jsonData = JsonConvert.DeserializeObject<resources[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Create(jsonData));
                    break;
                case "update":
                    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    jsonData = JsonConvert.DeserializeObject<resources[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Update(jsonData));
                    break;
                case "destroy":
                    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    jsonData = JsonConvert.DeserializeObject<resources[]>(data, settings);
                    ret = JsonConvert.SerializeObject(this.Delete(jsonData));
                    break;

            }
            //直接用这个输出
            this.Response.Write(ret);
            this.Response.End();
        }

        public Object Get()
        {
            //查找所有资源
            //int pid = Convert.ToInt32(Request["pid"]);
            return _db.resources.Select(p => p);
        }


        public Object Create(resources[] jsonData)
        {
            //直接insert到数据表中
            _db.resources.InsertAllOnSubmit(jsonData);
            _db.SubmitChanges(ConflictMode.ContinueOnConflict);
            return jsonData;
        }

        public Object Update(resources[] jsonData)
        {
            if (jsonData != null)
            {
                foreach (resources r in jsonData)
                {
                    resources res = _db.resources.Single(b => b.id == r.id);
                    res.name = r.name;
                }
            }
            _db.SubmitChanges();
            return jsonData;
        }

        public Object Delete(resources[] jsonData)
        {
            if (jsonData != null)
            {
                foreach (resources r in jsonData)
                {
                    resources res = _db.resources.SingleOrDefault(b => b.id == r.id);
                    _db.resources.DeleteOnSubmit(res);
                }
            }
            _db.SubmitChanges();
            return new { success = true };
        }
    }
}