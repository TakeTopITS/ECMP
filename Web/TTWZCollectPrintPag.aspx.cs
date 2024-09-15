using System;
using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;
using System.Drawing;
using System.Data;
using System.Text;

public partial class TTWZCollectPrintPag : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        if (!IsPostBack)
        {
            if (Request.QueryString["collectCode"] != null)
            {
                string strCollectCodes = Request.QueryString["collectCode"];

                if (!string.IsNullOrEmpty(strCollectCodes))
                {
                    string[] arrCollectCode = strCollectCodes.Split(',');
                    string strCollects = string.Empty;
                    for (int i = 0; i < arrCollectCode.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(arrCollectCode[i]))
                        {
                            strCollects += "'" + arrCollectCode[i] + "',";
                        }
                    }
                    strCollects = strCollects.EndsWith(",") ? strCollects.TrimEnd(',') : strCollects;
                    DataCollectBinder(strCollects);
                }
            }
        }
    }

    private void DataCollectBinder(string strCollectCodes)
    {
        string strCollectHQL = string.Format(@"select c.*,o.ObjectName,s.SupplierName,h.UserName as CheckerName,m.UnitName,w.GoodsCode,o.Criterion,o.Grade,o.Model,d.UserName as DelegateAgentName,
                    a.UserName as SafekeeperName,n.UserName as ContacterName,
                    f.UserName as FinanceApproveName
                    from T_WZCollect c
                    left join T_WZObject o on c.ObjectCode = o.ObjectCode
                    left join T_WZSupplier s on c.SupplierCode = s.SupplierCode
                    left join T_WZCompact p on c.CompactCode = p.CompactCode
                    left join T_ProjectMember h on c.Checker = h.UserCode
                    left join T_ProjectMember d on p.DelegateAgent = d.UserCode
                    left join T_ProjectMember a on c.Safekeeper = a.UserCode
                    left join T_ProjectMember n on c.Contacter = n.UserCode 
                    left join T_ProjectMember f on c.FinanceApprove = f.UserCode
                    left join T_WZSpan m on o.Unit  = m.ID
                    left join T_WZStore w on c.StoreRoom = w.StockCode
                    where c.CollectCode in ({0}) limit 1", strCollectCodes);

        //string strCollectHQL = string.Format(@"select c.*,o.Model,o.Grade,o.Criterion,o.ObjectName,o.Unit,p.SupplierCode,s.GoodsCode,n.UnitName from T_WZCollect c
        //        left join T_WZObject o on c.ObjectCode = o.ObjectCode
        //        left join T_WZCompact p on c.CompactCode = p.CompactCode
        //        left join T_WZStore s on c.StoreRoom = s.StockCode
        //        and c.ObjectCode = s.ObjectCode
        //        and c.CheckCode = s.CheckCode
        //        left join T_WZSpan n on o.Unit  = n.ID
        //        where c.CollectCode in ({0})", strCollectCodes);
        DataTable dtCollect = ShareClass.GetDataSetFromSql(strCollectHQL, "Collect").Tables[0];

        RT_Collect.DataSource = dtCollect;
        RT_Collect.DataBind();
    }

    protected void RT_Collect_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item)
        {
            //Literal ltMarker = (Literal)e.Item.FindControl("LT_Marker");
            //ltMarker.Text = strUserCode;
        }
    }
}