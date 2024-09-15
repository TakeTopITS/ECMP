using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTGDIsomJointEdit : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            string strIsom_no = Request.QueryString["Isom_no"].ToString();
            HF_Isom_no.Value = strIsom_no;

            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                string id = Request.QueryString["id"].ToString();
                HF_ID.Value = id;
                int intID = 0;
                int.TryParse(id, out intID);


                BindData(intID);
            }
        }
    }


    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            string strJointNo = TXT_JointNo.Text.Trim();
            string strRev = TXT_Rev.Text.Trim();
            string strSize = TXT_Size.Text.Trim();
            string strMold = TXT_Mold.Text.Trim();
            string strSF = DDL_SF.SelectedValue; //TXT_SF.Text.Trim();
            string strMediumCode = TXT_MediumCode.Text.Trim();
            string strPipefittings = TXT_Pipefittings.Text.Trim();
            string strInstallationTime = TXT_InstallationTime.Text.Trim();
            string strRanderWelder1 = HF_RanderWelder1.Value;
            string strRanderWelderName1 = TXT_RanderWelder1.Text.Trim();
            string strRanderWelder2 = HF_RanderWelder2.Value;
            string strRanderWelderName2 = TXT_RanderWelder2.Text.Trim();
            string strRanderTime = TXT_RanderTime.Text.Trim();
            string strCoveringWelder1 = HF_CoveringWelder1.Value;
            string strCoveringWelderName1 = TXT_CoveringWelder1.Text.Trim();
            string strCoveringWelder2 = HF_CoveringWelder2.Value;
            string strCoveringWelderName2 = TXT_CoveringWelder2.Text.Trim();
            string strCoveringTime = TXT_CoveringTime.Text.Trim();
            string strWPSNo = TXT_WPSNo.Text.Trim();
            string strPressurePackNo = TXT_PressurePackNo.Text.Trim();
            string strFRI1 = TXT_FRI1.Text.Trim();
            string strFRI2 = TXT_FRI2.Text.Trim();
            string strFRI3 = TXT_FRI3.Text.Trim();
            string strFRI4 = TXT_FRI4.Text.Trim();
            string strFitUpTime = TXT_FitUpTime.Text.Trim();
            string strFitUp = TXT_FitUp.Text.Trim();
            string strVisualTime = TXT_VisualTime.Text.Trim();
            string strVisual = TXT_Visual.Text.Trim();
            string strRTTime = TXT_RTTime.Text.Trim();
            string strRT = TXT_RT.Text.Trim();
            string strPTTime = TXT_PTTime.Text.Trim();
            string strPT = TXT_PT.Text.Trim();
            string strPWHTTime = TXT_PWHTTime.Text.Trim();
            string strPWHT = TXT_PWHT.Text.Trim();
            string strPMITime = TXT_PMITime.Text.Trim();
            string strPMI = TXT_PMI.Text.Trim();
            string strMTTime = TXT_MTTime.Text.Trim();
            string strMT = TXT_MT.Text.Trim();
            string strHistorySheet = TXT_HistorySheet.Text.Trim();
            string strPressTest = TXT_PressTest.Text.Trim();
            string strRTLotDetailsRT1 = TXT_RTLotDetailsRT1.Text.Trim();
            string strRTLotDetailsRT2 = TXT_RTLotDetailsRT2.Text.Trim();
            string strRTLotDetailsRT3 = TXT_RTLotDetailsRT3.Text.Trim();
            string strRTLotDetailsRT4 = TXT_RTLotDetailsRT4.Text.Trim();

            GDIsomJointBLL gDIsomJointBLL = new GDIsomJointBLL();


            string strIsom_no = HF_Isom_no.Value;


            if (!string.IsNullOrEmpty(HF_ID.Value))
            {
                //修改
                int intID = 0;
                int.TryParse(HF_ID.Value, out intID);

                string strGDIsomJointSql = "from GDIsomJoint as gDIsomJoint where id = " + intID;
                IList listGDIsomJoint = gDIsomJointBLL.GetAllGDIsomJoints(strGDIsomJointSql);
                if (listGDIsomJoint != null && listGDIsomJoint.Count > 0)
                {
                    GDIsomJoint gDIsomJoint = (GDIsomJoint)listGDIsomJoint[0];

                    gDIsomJoint.JointNo = strJointNo;
                    gDIsomJoint.Rev = strRev;
                    gDIsomJoint.Size = strSize;
                    gDIsomJoint.Mold = strMold;
                    gDIsomJoint.SF = strSF;
                    gDIsomJoint.MediumCode = strMediumCode;
                    gDIsomJoint.Pipefittings = strPipefittings;
                    gDIsomJoint.InstallationTime = strInstallationTime;
                    gDIsomJoint.RanderWelder1 = strRanderWelder1;
                    gDIsomJoint.RanderWelderName1 = strRanderWelderName1;
                    gDIsomJoint.RanderWelder2 = strRanderWelder2;
                    gDIsomJoint.RanderWelderName2 = strRanderWelderName2;
                    gDIsomJoint.RanderTime = strRanderTime;
                    gDIsomJoint.CoveringWelder1 = strCoveringWelder1;
                    gDIsomJoint.CoveringWelderName1 = strCoveringWelderName1;
                    gDIsomJoint.CoveringWelder2 = strCoveringWelder2;
                    gDIsomJoint.CoveringWelderName2 = strCoveringWelderName2;
                    gDIsomJoint.CoveringTime = strCoveringTime;
                    gDIsomJoint.WPSNo = strWPSNo;
                    gDIsomJoint.PressurePackNo = strPressurePackNo;
                    gDIsomJoint.FRI1 = strFRI1;
                    gDIsomJoint.FRI2 = strFRI2;
                    gDIsomJoint.FRI3 = strFRI3;
                    gDIsomJoint.FRI4 = strFRI4;
                    gDIsomJoint.FitUpTime = strFitUpTime;
                    gDIsomJoint.FitUp = strFitUp;
                    gDIsomJoint.VisualTime = strVisualTime;
                    gDIsomJoint.Visual = strVisual;
                    gDIsomJoint.RTTime = strRTTime;
                    gDIsomJoint.RT = strRT;
                    gDIsomJoint.PTTime = strPTTime;
                    gDIsomJoint.PT = strPT;
                    gDIsomJoint.PWHTTime = strPWHTTime;
                    gDIsomJoint.PWHT = strPWHT;
                    gDIsomJoint.PMITime = strPMITime;
                    gDIsomJoint.PMI = strPMI;
                    gDIsomJoint.MTTime = strMTTime;
                    gDIsomJoint.MT = strMT;
                    gDIsomJoint.HistorySheet = strHistorySheet;
                    gDIsomJoint.PressTest = strPressTest;
                    gDIsomJoint.RTLotDetailsRT1 = strRTLotDetailsRT1;
                    gDIsomJoint.RTLotDetailsRT2 = strRTLotDetailsRT2;
                    gDIsomJoint.RTLotDetailsRT3 = strRTLotDetailsRT3;
                    gDIsomJoint.RTLotDetailsRT4 = strRTLotDetailsRT4;
                    gDIsomJoint.Isom_no = strIsom_no;

                    gDIsomJointBLL.UpdateGDLineWeld(gDIsomJoint, intID);
                }
            }
            else
            {
                //增加
                GDIsomJoint gDIsomJoint = new GDIsomJoint();
                gDIsomJoint.JointNo = strJointNo;
                gDIsomJoint.Rev = strRev;
                gDIsomJoint.Size = strSize;
                gDIsomJoint.Mold = strMold;
                gDIsomJoint.SF = strSF;
                gDIsomJoint.MediumCode = strMediumCode;
                gDIsomJoint.Pipefittings = strPipefittings;
                gDIsomJoint.InstallationTime = strInstallationTime;
                gDIsomJoint.RanderWelder1 = strRanderWelder1;
                gDIsomJoint.RanderWelderName1 = strRanderWelderName1;
                gDIsomJoint.RanderWelder2 = strRanderWelder2;
                gDIsomJoint.RanderWelderName2 = strRanderWelderName2;
                gDIsomJoint.RanderTime = strRanderTime;
                gDIsomJoint.CoveringWelder1 = strCoveringWelder1;
                gDIsomJoint.CoveringWelderName1 = strCoveringWelderName1;
                gDIsomJoint.CoveringWelder2 = strCoveringWelder2;
                gDIsomJoint.CoveringWelderName2 = strCoveringWelderName2;
                gDIsomJoint.CoveringTime = strCoveringTime;
                gDIsomJoint.WPSNo = strWPSNo;
                gDIsomJoint.PressurePackNo = strPressurePackNo;
                gDIsomJoint.FRI1 = strFRI1;
                gDIsomJoint.FRI2 = strFRI2;
                gDIsomJoint.FRI3 = strFRI3;
                gDIsomJoint.FRI4 = strFRI4;
                gDIsomJoint.FitUpTime = strFitUpTime;
                gDIsomJoint.FitUp = strFitUp;
                gDIsomJoint.VisualTime = strVisualTime;
                gDIsomJoint.Visual = strVisual;
                gDIsomJoint.RTTime = strRTTime;
                gDIsomJoint.RT = strRT;
                gDIsomJoint.PTTime = strPTTime;
                gDIsomJoint.PT = strPT;
                gDIsomJoint.PWHTTime = strPWHTTime;
                gDIsomJoint.PWHT = strPWHT;
                gDIsomJoint.PMITime = strPMITime;
                gDIsomJoint.PMI = strPMI;
                gDIsomJoint.MTTime = strMTTime;
                gDIsomJoint.MT = strMT;
                gDIsomJoint.HistorySheet = strHistorySheet;
                gDIsomJoint.PressTest = strPressTest;
                gDIsomJoint.RTLotDetailsRT1 = strRTLotDetailsRT1;
                gDIsomJoint.RTLotDetailsRT2 = strRTLotDetailsRT2;
                gDIsomJoint.RTLotDetailsRT3 = strRTLotDetailsRT3;
                gDIsomJoint.RTLotDetailsRT4 = strRTLotDetailsRT4;
                gDIsomJoint.Isom_no = strIsom_no;

                gDIsomJoint.IsMark = 0;
                gDIsomJoint.UserCode = strUserCode;

                gDIsomJointBLL.AddGDIsomJoint(gDIsomJoint);
            }

            //Response.Redirect("TTGDIsomJointList.aspx?Isom_no=" + strIsom_no);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "LoadParentLit();", true);
        }
        catch (Exception ex)
        { }
    }


    private void BindData(int id)
    {
        GDIsomJointBLL gDIsomJointBLL = new GDIsomJointBLL();
        string strGDIsomJointSql = "from GDIsomJoint as gDIsomJoint where id = " + id;
        IList listGDIsomJoint = gDIsomJointBLL.GetAllGDIsomJoints(strGDIsomJointSql);
        if (listGDIsomJoint != null && listGDIsomJoint.Count > 0)
        {
            GDIsomJoint gDIsomJoint = (GDIsomJoint)listGDIsomJoint[0];
            TXT_JointNo.Text = gDIsomJoint.JointNo;
            TXT_Rev.Text = gDIsomJoint.Rev;
            TXT_Size.Text = gDIsomJoint.Size;
            TXT_Mold.Text = gDIsomJoint.Mold;
            //TXT_SF.Text = gDIsomJoint.SF;
            DDL_SF.SelectedValue = gDIsomJoint.SF;
            TXT_MediumCode.Text = gDIsomJoint.MediumCode;
            TXT_Pipefittings.Text = gDIsomJoint.Pipefittings;
            TXT_InstallationTime.Text = gDIsomJoint.InstallationTime.ToString();
            HF_RanderWelder1.Value = gDIsomJoint.RanderWelder1;
            TXT_RanderWelder1.Text = gDIsomJoint.RanderWelderName1;
            HF_RanderWelder2.Value = gDIsomJoint.RanderWelder2;
            TXT_RanderWelder2.Text = gDIsomJoint.RanderWelderName2;
            TXT_RanderTime.Text = gDIsomJoint.RanderTime.ToString();
            HF_CoveringWelder1.Value = gDIsomJoint.CoveringWelder1;
            TXT_CoveringWelder1.Text = gDIsomJoint.CoveringWelderName1;
            HF_CoveringWelder2.Value = gDIsomJoint.CoveringWelder2;
            TXT_CoveringWelder2.Text = gDIsomJoint.CoveringWelderName2;
            TXT_CoveringTime.Text = gDIsomJoint.CoveringTime.ToString();
            TXT_WPSNo.Text = gDIsomJoint.WPSNo;
            TXT_PressurePackNo.Text = gDIsomJoint.PressurePackNo;
            TXT_FRI1.Text = gDIsomJoint.FRI1;
            TXT_FRI2.Text = gDIsomJoint.FRI2;
            TXT_FRI3.Text = gDIsomJoint.FRI3;
            TXT_FRI4.Text = gDIsomJoint.FRI4;
            TXT_FitUpTime.Text = gDIsomJoint.FitUpTime.ToString();
            TXT_FitUp.Text = gDIsomJoint.FitUp;
            TXT_VisualTime.Text = gDIsomJoint.VisualTime.ToString();
            TXT_Visual.Text = gDIsomJoint.Visual;
            TXT_RTTime.Text = gDIsomJoint.RTTime.ToString();
            TXT_RT.Text = gDIsomJoint.RT;
            TXT_PTTime.Text = gDIsomJoint.PTTime.ToString();
            TXT_PT.Text = gDIsomJoint.PT;
            TXT_PWHTTime.Text = gDIsomJoint.PWHTTime.ToString();
            TXT_PWHT.Text = gDIsomJoint.PWHT;
            TXT_PMITime.Text = gDIsomJoint.PMITime.ToString();
            TXT_PMI.Text = gDIsomJoint.PMI;
            TXT_MTTime.Text = gDIsomJoint.MTTime.ToString();
            TXT_MT.Text = gDIsomJoint.MT;
            TXT_HistorySheet.Text = gDIsomJoint.HistorySheet;
            TXT_PressTest.Text = gDIsomJoint.PressTest;
            TXT_RTLotDetailsRT1.Text = gDIsomJoint.RTLotDetailsRT1;
            TXT_RTLotDetailsRT2.Text = gDIsomJoint.RTLotDetailsRT2;
            TXT_RTLotDetailsRT3.Text = gDIsomJoint.RTLotDetailsRT3;
            TXT_RTLotDetailsRT4.Text = gDIsomJoint.RTLotDetailsRT4;
            HF_Isom_no.Value = gDIsomJoint.Isom_no;
        }
    }
}