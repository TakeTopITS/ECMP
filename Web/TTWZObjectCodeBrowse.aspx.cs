using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZObjectCodeBrowse : System.Web.UI.Page
{
    public string strUserCode
    {
        get;
        set;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            //加载单位列表
            BindUnitData();

            if (!string.IsNullOrEmpty(Request.QueryString["ObjectCode"]))
            {
                string strExistObjectCode = Request.QueryString["ObjectCode"];

                HF_ObjectCode.Value = strExistObjectCode;

                DataBinder(strExistObjectCode);

            }

            //加载控件
            SetControlState();

        }
    }



    private void DataBinder(string strExistObjectCode)
    {
        WZObjectBLL wZObjectBLL = new WZObjectBLL();

        string strObjectSql = "from WZObject as wZObject where ObjectCode = '" + strExistObjectCode + "'";
        IList objectList = wZObjectBLL.GetAllWZObjects(strObjectSql);
        if (objectList != null && objectList.Count == 1)
        {
            WZObject wZObject = (WZObject)objectList[0];

            TXT_ObjectCode.Text = wZObject.ObjectCode;
            TXT_ObjectName.Text = wZObject.ObjectName;
            TXT_Standard.Text = wZObject.Criterion;
            TXT_Level.Text = wZObject.Grade;
            TXT_Model.Text = wZObject.Model;
            DDL_Unit.SelectedValue = wZObject.Unit.ToString();
            DDL_ConvertUnit.SelectedValue = wZObject.ConvertUnit.ToString();
            TXT_ConvertRatio.Text = wZObject.ConvertRatio.ToString();

            TXT_ReferDesc.Text = wZObject.ReferDesc;
            TXT_ReferStandard.Text = wZObject.ReferStandard;

            TXT_Market.Text = wZObject.Market.ToString();
        }
    }


    private void BindUnitData()
    {
        WZSpanBLL wZSpanBLL = new WZSpanBLL();
        string strWZSpan = "from WZSpan as wZSpan";
        IList lstWZSpan = wZSpanBLL.GetAllWZSpans(strWZSpan);

        DDL_Unit.DataSource = lstWZSpan;
        DDL_Unit.DataBind();

        DDL_ConvertUnit.DataSource = lstWZSpan;
        DDL_ConvertUnit.DataBind();

        DDL_ConvertUnit.Items.Insert(0, new ListItem("选择", "0"));
    }


    private void SetControlState()
    {
        TXT_ObjectName.ReadOnly = true;            //物资名称
        TXT_ObjectName.BackColor = Color.White;
        TXT_Level.ReadOnly = true;                 //级别
        TXT_Level.BackColor = Color.White;
        TXT_Model.ReadOnly = true;                 //规格型号
        TXT_Model.BackColor = Color.White;
        DDL_Unit.Enabled = false;                     //计量单位
        DDL_Unit.BackColor = Color.White;
        DDL_ConvertUnit.Enabled = false;             //换算单位
        DDL_ConvertUnit.BackColor = Color.White;

        TXT_Market.ReadOnly = true;                //市场行情
        TXT_Market.BackColor = Color.White;
        TXT_ConvertRatio.ReadOnly = true;          //换算系数
        TXT_ConvertRatio.BackColor = Color.White;
        TXT_Standard.ReadOnly = true;              //标准
        TXT_Standard.BackColor = Color.White;
        TXT_ReferStandard.ReadOnly = true;         //对照标准
        TXT_ReferStandard.BackColor = Color.White;
        TXT_ReferDesc.ReadOnly = true;             //对照描述
        TXT_ReferDesc.BackColor = Color.White;

    }
}