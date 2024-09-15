using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Text;

public partial class TTDWProMatchPurchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            DataProductTypeBinder();

            DataProductMatchBinder();
        }
    }

    private void DataProductTypeBinder()
    {
        DWProductTypeBLL dWProductTypeBLL = new DWProductTypeBLL();
        string strDWProductTypeHQL = "from DWProductType as dWProductType order by dWProductType.ID desc";
        IList listDWProductType = dWProductTypeBLL.GetAllDWProductTypes(strDWProductTypeHQL);

        DDL_Type.DataSource = listDWProductType;
        DDL_Type.DataBind();

        DDL_Type.Items.Insert(0, new ListItem("全部", "0"));
    }

    private void DataProductMatchBinder()
    {
        try
        {
            string strMatchName = TXT_MatchName.Text.Trim();
            string strProductType = DDL_Type.SelectedValue;
            string strProductCode = TXT_ProductCode.Text.Trim();
            string strProductName = TXT_ProductName.Text.Trim();

            DWMatchBLL dWMatchBLL = new DWMatchBLL();
            string strDWMatchHQL = "from DWMatch as dWMatch ";
            if (!string.IsNullOrEmpty(strMatchName))
            {
                strDWMatchHQL += " where MatchName like '%" + strMatchName + "%'";
            }
            strDWMatchHQL += " order by dWMatch.ID asc";
            IList listDWMatch = dWMatchBLL.GetAllDWMatchs(strDWMatchHQL);

            DWProductBLL dWProductBLL = new DWProductBLL();
            string strDWProductHQL = "from DWProduct as dWProduct where 1=1 ";
            if (!string.IsNullOrEmpty(strProductType) && strProductType != "0")
            {
                strDWProductHQL += " and TypeID = " + strProductType;
            }
            if (!string.IsNullOrEmpty(strProductCode))
            {
                strDWProductHQL += " and ProductCode like '%" + strProductCode + "%'";
            }
            if (!string.IsNullOrEmpty(strProductName))
            {
                strDWProductHQL += " and ProductName like '%" + strProductName + "%'";
            }
            strDWProductHQL += " order by dWProduct.ID desc";
            IList listDWProduct = dWProductBLL.GetAllDWProducts(strDWProductHQL);

            string strProMatchHQL = "select * from T_DWProMatch";
            DataTable dtProMatch = ShareClass.GetDataSetFromSql(strProMatchHQL, "ProMatch").Tables[0];

            StringBuilder sbHeader = new StringBuilder();
            StringBuilder sbLeft = new StringBuilder();
            StringBuilder sbLeftFooter = new StringBuilder();
            StringBuilder sbContent = new StringBuilder();
            StringBuilder sbFooter1 = new StringBuilder();          //总数量
            StringBuilder sbFooter2 = new StringBuilder();          //本色成本
            StringBuilder sbFooter3 = new StringBuilder();          //颜色料成本
            StringBuilder sbFooter4 = new StringBuilder();          //配方价
            //sbHeader.Append("<td class=\"formItemBgStyle\" width=\"150\">代号</td><td class=\"formItemBgStyle\" style=\"display:none;\">原料价格</td>");
            //表头部分
            if (listDWProduct != null && listDWProduct.Count > 0)
            {
                for (int i = 0; i < listDWProduct.Count; i++)
                {
                    DWProduct dWProduct = (DWProduct)listDWProduct[i];
                    sbHeader.AppendFormat("<td class=\"formItemBgStyle\" width=\"180\">{0}-{1}</td>", dWProduct.ProductCode, dWProduct.ProductName);

                }
                HF_ProductCount.Value = listDWProduct.Count.ToString();
            }
            else
            {
                sbHeader.AppendFormat("<td class=\"formItemBgStyle\" width=\"180\">无产品记录</td>");
            }

            if (listDWMatch != null && listDWMatch.Count > 0)
            {
                IDictionary<string, decimal> dictionTotal = new Dictionary<string, decimal>();                  //原料价格与原料数量相乘之和
                IDictionary<string, decimal> dictionProductTotal = new Dictionary<string, decimal>();           //原料数量之和
                IDictionary<string, string> dictionProductType = new Dictionary<string, string>();              //产品类型

                //sbLeft.Append("<tr><td class=\"formItemBgStyle\" width=\"150\">原料代号</td></tr>");
                for (int i = 0; i < listDWMatch.Count; i++)
                {
                    DWMatch dWMatch = (DWMatch)listDWMatch[i];
                    sbContent.Append("<tr>");
                    //sbContent.AppendFormat("<td class=\"formItemBgStyle\" width=\"150\" style=\"display:none;\">{0}</td>", dWMatch.MatchName);
                    //sbContent.AppendFormat("<td class=\"formItemBgStyle\" width=\"150\" style=\"display:none;\">{0}</td>", dWMatch.MaterialPrice);
                    sbLeft.Append("<tr>");
                    sbLeft.AppendFormat("<td class=\"formItemBgStyle\" width=\"180\"><p>{0}</p>&nbsp;</td>", dWMatch.MatchName);
                    sbLeft.AppendFormat("<td class=\"formItemBgStyle\" width=\"180\">{0}</td>", dWMatch.MaterialPrice);
                    if (listDWProduct != null && listDWProduct.Count > 0)
                    {
                        for (int j = 0; j < listDWProduct.Count; j++)
                        {
                            DWProduct dWProduct = (DWProduct)listDWProduct[j];
                            //判断是否有关联值
                            DataView dvProMatch = dtProMatch.DefaultView;
                            dvProMatch.RowFilter = "MatchID = " + dWMatch.ID + " and ProductID = " + dWProduct.ID;
                            //dvProMatch.RowFilter = "ProductID = " + dWProduct.ID;
                            DataTable dtValue = dvProMatch.ToTable();
                            if (dtValue != null && dtValue.Rows.Count > 0)
                            {
                                #region 原料与产品有原料数量的时候
                                decimal decimalProductPrice = 0;
                                decimal.TryParse(ShareClass.ObjectToString(dtValue.Rows[0]["ProductPrice"]), out decimalProductPrice);

                                sbContent.Append("<td class=\"formItemBgStyle\" width=\"180\">");
                                string strP = string.Format("<p class=\"playtitle\">{0}</p>&nbsp;", decimalProductPrice);
                                string strEditor = "<a class=\"playeditor\" href=\"javascript:void(0)\" style=\"display:none;\">编辑</a>";
                                string strInput = "<input type=\"text\" style=\"display:none;\" class=\"playtx\" />";
                                string strSave = string.Format("<a class=\"playsave\" value=\"{0}|{1}\" style=\"display:none;\" href=\"javascript:void(0)\">保存</a>", dWMatch.ID, dWProduct.ID);
                                sbContent.Append(strP + strEditor + strInput + strSave);
                                sbContent.Append("</td>");

                                if (!dictionTotal.Keys.Contains(j.ToString()))
                                {
                                    dictionTotal.Add(j.ToString(), dWMatch.MaterialPrice * decimalProductPrice);
                                }
                                else
                                {
                                    dictionTotal[j.ToString()] += dWMatch.MaterialPrice * decimalProductPrice;
                                }

                                if (!dictionProductTotal.Keys.Contains(j.ToString()))
                                {
                                    dictionProductTotal.Add(j.ToString(), decimalProductPrice);
                                }
                                else
                                {
                                    dictionProductTotal[j.ToString()] += decimalProductPrice;
                                }

                                if (!dictionProductType.Keys.Contains(j.ToString()))
                                {
                                    dictionProductType.Add(j.ToString(), dWProduct.TypeID.ToString());
                                }
                                #endregion
                            }
                            else
                            {
                                #region  原料与产品没有原料数量
                                sbContent.Append("<td class=\"formItemBgStyle\" width=\"180\">");
                                string strP = "<p class=\"playtitle\">0</p>&nbsp;";
                                string strEditor = "<a class=\"playeditor\" href=\"javascript:void(0)\" style=\"display:none;\">编辑</a>";
                                string strInput = "<input type=\"text\" style=\"display:none;\" class=\"playtx\" />";
                                string strSave = string.Format("<a class=\"playsave\" value=\"{0}|{1}\" style=\"display:none;\" href=\"javascript:void(0)\">保存</a>", dWMatch.ID, dWProduct.ID);
                                sbContent.Append(strP + strEditor + strInput + strSave);
                                sbContent.Append("</td>");

                                if (!dictionTotal.Keys.Contains(j.ToString()))
                                {
                                    dictionTotal.Add(j.ToString(), 0);
                                }
                                else
                                {
                                    dictionTotal[j.ToString()] += 0;
                                }

                                if (!dictionProductTotal.Keys.Contains(j.ToString()))
                                {
                                    dictionProductTotal.Add(j.ToString(), 0);
                                }
                                else
                                {
                                    dictionProductTotal[j.ToString()] += 0;
                                }

                                if (!dictionProductType.Keys.Contains(j.ToString()))
                                {
                                    dictionProductType.Add(j.ToString(), dWProduct.TypeID.ToString());
                                }
                                #endregion
                            }
                        }
                    }
                    sbContent.Append("</tr>");
                    sbLeft.Append("</tr>");
                }
                #region 注释底下部分
                //#region 总数量
                //sbFooter1.Append("<tr>");
                ////sbFooter1.Append("<td class=\"formItemBgStyle\">&nbsp;</td><td class=\"formItemBgStyle\">&nbsp;</td>");

                //if (listDWProduct != null && listDWProduct.Count > 0)
                //{
                //    for (int j = 0; j < listDWProduct.Count; j++)
                //    {
                //        sbFooter1.AppendFormat("<td class=\"formItemBgStyle\">{0}</td>", dictionProductTotal[j.ToString()].ToString("#0.00"));
                //    }
                //}
                //sbFooter1.Append("</tr>");
                //#endregion

                //#region 本色成本
                //sbFooter2.Append("<tr>");
                ////sbFooter2.Append("<td class=\"formItemBgStyle\">&nbsp;</td><td class=\"formItemBgStyle\">&nbsp;</td>");

                //if (listDWProduct != null && listDWProduct.Count > 0)
                //{
                //    for (int j = 0; j < listDWProduct.Count; j++)
                //    {
                //        if (dictionProductTotal[j.ToString()] != 0)
                //        {
                //            decimal decimalResult = dictionTotal[j.ToString()] * 1000 / dictionProductTotal[j.ToString()];
                //            sbFooter2.AppendFormat("<td class=\"formItemBgStyle\">{0}</td>", decimalResult.ToString("#0.00"));
                //        }
                //        else
                //        {
                //            sbFooter2.Append("<td class=\"formItemBgStyle\">0</td>");
                //        }
                //    }
                //}
                //sbFooter2.Append("</tr>");
                //#endregion

                //#region 颜色料成本
                //sbFooter3.Append("<tr>");
                ////sbFooter3.Append("<td class=\"formItemBgStyle\">&nbsp;</td><td class=\"formItemBgStyle\">&nbsp;</td>");

                //if (listDWProduct != null && listDWProduct.Count > 0)
                //{
                //    for (int j = 0; j < listDWProduct.Count; j++)
                //    {
                //        if (dictionProductTotal[j.ToString()] != 0)
                //        {
                //            decimal decimalResult = dictionTotal[j.ToString()] / dictionProductTotal[j.ToString()];
                //            string strProductTypeHQL = string.Format("select * from T_DWProductType where ID = {0}", dictionProductType[j.ToString()]);
                //            DataTable dtProductType = ShareClass.GetDataSetFromSql(strProductTypeHQL, "ProductType").Tables[0];
                //            if (dtProductType != null && dtProductType.Rows.Count > 0)
                //            {
                //                if (ShareClass.ObjectToString(dtProductType.Rows[0]["ProductType"]).ToLower() == "pvc")
                //                {
                //                    sbFooter3.AppendFormat("<td class=\"formItemBgStyle\">{0}</td>", 100);
                //                }
                //                else
                //                {
                //                    sbFooter3.Append("<td class=\"formItemBgStyle\">0</td>");
                //                }
                //            }
                //        }
                //        else
                //        {
                //            sbFooter3.Append("<td class=\"formItemBgStyle\">0</td>");
                //        }
                //    }
                //}
                //sbFooter3.Append("</tr>");
                //#endregion

                //#region 配方价
                //sbFooter4.Append("<tr>");
                ////sbFooter4.Append("<td class=\"formItemBgStyle\">&nbsp;</td><td class=\"formItemBgStyle\">&nbsp;</td>");

                //if (listDWProduct != null && listDWProduct.Count > 0)
                //{
                //    for (int j = 0; j < listDWProduct.Count; j++)
                //    {
                //        if (dictionProductTotal[j.ToString()] != 0)
                //        {
                //            decimal decimalResult = dictionTotal[j.ToString()] * 1000 / dictionProductTotal[j.ToString()];
                //            string strProductTypeHQL = string.Format("select * from T_DWProductType where ID = {0}", dictionProductType[j.ToString()]);
                //            DataTable dtProductType = ShareClass.GetDataSetFromSql(strProductTypeHQL, "ProductType").Tables[0];
                //            if (dtProductType != null && dtProductType.Rows.Count > 0)
                //            {
                //                if (ShareClass.ObjectToString(dtProductType.Rows[0]["ProductType"]).ToLower() == "pvc")
                //                {
                //                    sbFooter4.AppendFormat("<td class=\"formItemBgStyle\">{0}</td>", (decimalResult + 100).ToString("#0.00"));
                //                }
                //                else
                //                {
                //                    sbFooter4.AppendFormat("<td class=\"formItemBgStyle\">{0}</td>", decimalResult.ToString("#0.00"));
                //                }
                //            }
                //        }
                //        else
                //        {
                //            sbFooter4.Append("<td class=\"formItemBgStyle\">0</td>");
                //        }
                //    }
                //}
                //sbFooter4.Append("</tr>");
                //#endregion

                //#region 左边底部
                //sbLeftFooter.Append("<tr><td class=\"formItemBgStyle\">总数量</td></tr><tr><td class=\"formItemBgStyle\">本色成本</td></tr><tr><td class=\"formItemBgStyle\">颜色料成本</td></tr><tr><td class=\"formItemBgStyle\">配方价</td></tr>");
                //#endregion
                #endregion
            }
            else
            {
                sbLeft.Append("<tr>");
                sbLeft.Append("<td class=\"formItemBgStyle\" width=\"180\"><p>无原料记录</p>&nbsp;</td>");
                sbLeft.Append("<td class=\"formItemBgStyle\" width=\"180\" style=\"display:none;\">0</td>");
                sbLeft.Append("</tr>");
            }

            LT_Left.Text = sbLeft.ToString() + sbLeftFooter.ToString();
            LT_Header.Text = sbHeader.ToString();
            LT_Content.Text = sbContent.ToString() + sbFooter1.ToString() + sbFooter2.ToString() + sbFooter3.ToString() + sbFooter4.ToString();
        }
        catch (Exception ex) { }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataProductMatchBinder();
    }
}