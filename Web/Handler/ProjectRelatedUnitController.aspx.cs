using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//数据层相关的项目
using TakeTopGantt.models;
using Devart.Data.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using Newtonsoft.Json;

namespace TakeTopGantt.handler
{
    public partial class ProjectRelatedUnitController : System.Web.UI.Page
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
            projects[] jsonData = null;

            //在新建的项目中， 可能id=“”或空， 
            var settings = new JsonSerializerSettings();
            settings.NullValueHandling = NullValueHandling.Ignore;

            switch (action)
            {
                case "read":
                    ret = JsonConvert.SerializeObject(this.Get());
                    break;
                    //case "create":
                    //    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    //    jsonData = JsonConvert.DeserializeObject<projects[]>(data, settings);
                    //    ret = JsonConvert.SerializeObject(this.Create(jsonData));
                    //    break;
                    //case "update":
                    //    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    //    jsonData = JsonConvert.DeserializeObject<projects[]>(data, settings);
                    //    ret = JsonConvert.SerializeObject(this.Update(jsonData));
                    //    break;
                    //case "destroy":
                    //    data = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                    //    jsonData = JsonConvert.DeserializeObject<projects[]>(data, settings);
                    //    ret = JsonConvert.SerializeObject(this.Delete(jsonData));
                    //    break;

            }
            //直接用这个输出
            this.Response.Write(ret);
            this.Response.End();
        }


        //查询
        public Object Get()
        {
            return _db.t_jnunit.Where(b => b.unitname != "");
        }

        //public Object Create(projects[] jsonData)
        //{
        //    //直接insert到数据表中
        //    _db.projects.InsertAllOnSubmit(jsonData);
        //    _db.SubmitChanges(ConflictMode.ContinueOnConflict);
        //    return jsonData;
        //}

        //public Object Update(projects[] jsonData)
        //{
        //    if (jsonData != null)
        //    {
        //        foreach (projects d in jsonData)
        //        {
        //            projects dep = _db.projects.Single(b => b.id == d.id);
        //            dep.name = d.name;
        //            dep.content = d.content;
        //        }
        //    }
        //    _db.SubmitChanges();

        //    return jsonData;
        //}

        //public Object Delete(projects[] jsonData)
        //{
        //    if (jsonData != null)
        //    {
        //        foreach (projects d in jsonData)
        //        {
        //            projects dep = _db.projects.SingleOrDefault(b => b.id == d.id);
        //            _db.projects.DeleteOnSubmit(dep);
        //        }
        //    }
        //    _db.SubmitChanges();
        //    return new { success = true };
        //}
    }
}