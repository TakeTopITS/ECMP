using DayPilot.Web.Ui.Json;

using System.Text;
using System.Web.UI;

/// <summary>
/// Summary description for Modal
/// </summary>
public class Modal
{

    public static void Close(Page page)
    {
        Close(page, null);
    }

    public static string Script(object result)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<script type='text/javascript'>");
        //sb.Append("if (parent && parent.DayPilot && parent.DayPilot.ModalStatic) {");
        sb.Append("parent.DayPilot.ModalStatic.close(" + SimpleJsonSerializer.Serialize(result) + ");");
        //sb.Append("}");
        sb.Append("</script>");

        return sb.ToString();
    }

    public static void Close(Page page, object result)
    {
        page.ClientScript.RegisterStartupScript(typeof(Page), "close", Script(result));
        return;
    }

}