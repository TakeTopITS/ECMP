using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTMakeBookInfoDetail : System.Web.UI.Page
{
    public static string strBookImage = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strID = Request.QueryString["ID"];
        string strPara = Request.QueryString["Para"];
        string strUserCode = Session["UserCode"].ToString();
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (!IsPostBack)
        {
            GetHeadLineData(strID, strPara);
        }
    }

    protected void GetHeadLineData(string strId, string strpara)
    {
        string strHQL = "from BookInformation as bookInformation where bookInformation.ID = '" + strId + "' ";
        BookInformationBLL bookInformationBLL = new BookInformationBLL();
        IList lst = bookInformationBLL.GetAllBookInformation(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BookInformation bookInformation = (BookInformation)lst[0];
            lbl_Author.Text = bookInformation.Author;
            lbl_BarCode.Text = bookInformation.BarCode;
            lbl_BookClassificationName.Text = bookInformation.BookClassificationName;
            lbl_BookName.Text = bookInformation.BookName;
            lbl_BookNum.Text = bookInformation.BookNum.ToString();
            lbl_BookPublishersName.Text = bookInformation.BookPublishersName;
            lbl_BookUseNum.Text = bookInformation.BookUseNum.ToString();
            lbl_DepartCodeName.Text = bookInformation.DepartCode + " " + bookInformation.DepartName;
            lbl_Donors.Text = bookInformation.Donors;
            lbl_Introduction.Text = bookInformation.Introduction;
            lbl_Location.Text = bookInformation.Location;
            lbl_PageNum.Text = bookInformation.PageNum.ToString();
            lbl_Price.Text = bookInformation.Price.ToString();
            lbl_PublicationDate.Text = bookInformation.PublicationDate.ToString("yyyy-MM-dd");
            lbl_ReferenceNo.Text = bookInformation.ReferenceNo;
            lbl_Source.Text = bookInformation.Source;
            lbl_Status.Text = bookInformation.Status;
            lbl_Translator.Text = bookInformation.Translator;
            lbl_UseNum.Text = bookInformation.UseNum.ToString();
            lbl_Version.Text = bookInformation.Version;
            lbl_Title.Text = bookInformation.BookName;
            strBookImage = bookInformation.BookImage;
            if (bookInformation.BookType.Trim().Equals("图书"))
            {
                Panel_Book.Visible = true;
                Panel_Stand.Visible = false;
            }
            else
            {
                if (string.IsNullOrEmpty(bookInformation.BookImage.Trim()))
                {
                    Panel_Stand.Visible = false;
                }
                else
                {
                    if (strpara.Trim() == "1")
                    {
                        Panel_Stand.Visible = false;
                    }
                    else
                    {
                        HyperLink1.NavigateUrl = strBookImage;
                        Panel_Stand.Visible = true;
                    }
                }
                Panel_Book.Visible = false;
            }
        }
    }
}