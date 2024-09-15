using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;

public partial class TTWZSelectorSupplier : System.Web.UI.Page
{
    string strSupplierCode, strSortNumber, strPurchaseCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strSupplierCode = Request.QueryString["SupplierCode"];
        strSortNumber = Request.QueryString["SortNumber"];
        strPurchaseCode = Request.QueryString["PurchaseCode"];

        Label1.Text = strPurchaseCode;

        if (strSortNumber == null)
        {
            strSortNumber = "0";
        }


        string strUserCode = Session["UserCode"].ToString();
        if (!IsPostBack)
        {
            DataBinder();
        }
    }

    private string getMajorTypeFromPurchaseOrder(string strPurchaseCode)
    {
        string strHQL;

        strHQL = "Select MajorType From T_WZPurchaseDetail Where PurchaseCode = '" + strPurchaseCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WZPurchaseDetail");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }


    private void DataBinder()
    {
        //WZSupplierBLL wZSupplierBLL = new WZSupplierBLL();
        //string strSupplierHQL = "from WZSupplier as wZSupplier";
        //IList listSupplier = wZSupplierBLL.GetAllWZSuppliers(strSupplierHQL);

        //DG_List.DataSource = listSupplier;
        //DG_List.DataBind();

        string strMajorType = getMajorTypeFromPurchaseOrder(strPurchaseCode);

        string strSupplierHQL = @"select s.*,m.UserName as AuditorName,q.UserName as QualityEngineerName,p.UserName as PushPersonName,
                        a.UserName as CompetentMaterialsName,
                        c.UserName as ContractWhoseName,
                        l.UserName as CompetentLeadershipName
                        from T_WZSupplier s
                        left join T_ProjectMember m on s.Auditor = m.UserCode 
                        left join T_ProjectMember p on s.PushPerson = p.UserCode 
                        left join T_ProjectMember q on s.QualityEngineer = q.UserCode
                        left join T_ProjectMember a on s.CompetentMaterials = a.UserCode
                        left join T_ProjectMember c on s.ContractWhose = c.UserCode
                        left join T_ProjectMember l on s.CompetentLeadership = l.UserCode
                        where 
                        s.Grade <> '禁用'
                        and s.Progress in ('登记','批准', '复审')
                        and s.ReviewDate::timestamp  > now()";

        //if (strSupplierCode != null & strSupplierCode != "")
        //{
        //    strSupplierHQL += " and s.SupplierCode = " + "'" + strSupplierCode + "'";
        //}
        if (strMajorType != null & strMajorType != "")
        {
            strSupplierHQL += " and MainSupplier like '%" + strMajorType + "%' ";
        }

        TextBox1.Text = strSupplierHQL;

        DataTable dtSupplier = ShareClass.GetDataSetFromSql(strSupplierHQL, "Supplier").Tables[0];


        DG_List.DataSource = dtSupplier;
        DG_List.DataBind();

        LB_TotalNumber.Text = "共：" + dtSupplier.Rows.Count.ToString() + " 条";
    }
}