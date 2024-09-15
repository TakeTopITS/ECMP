using System; using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TakeTopInfoPathSoft.Service;

public partial class xdoc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected override void Render(HtmlTextWriter output)
    {
        string publishUrl = this.Context.Request["xdoc_param_xsn_uri"];
        //string publishUrl = "E:\\请假申请单.xsn";

        if (publishUrl != null && publishUrl.Length > 0)
        {
            if (!TakeTopInfoPathService.ContainsXSN(publishUrl))
            {
                //Try to load the binary content of the form template by the publishUrl.
                //Then please call TakeTopInfoPathService.Register().
            }
        }

        try
        {
            TakeTopInfoPathForm form = TakeTopInfoPathService.UpdateForm(this.Context);
            output.Write(form.Xhtml);
            output.Close();

        }
        catch (Exception e)
        {
            output.Write(e.Message + "<br>");
            output.Write(e.StackTrace);
            output.Close();
        }
    }

}
