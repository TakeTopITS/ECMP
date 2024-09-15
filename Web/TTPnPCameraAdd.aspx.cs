using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTPnPCameraAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            LoadDepartmentTree();

            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                HF_ID.Value = Request.QueryString["id"];
                int id = 0;
                int.TryParse(Request.QueryString["id"], out id);
                BindCameraData(id);
            }
        }
    }


    private void LoadDepartmentTree()
    {
        //DepartmentBLL departmentBLL = new DepartmentBLL();
        //string strDepartmentSql = "from Department as department";
        //IList listDepartment = departmentBLL.GetAllDepartments(strDepartmentSql);
        //if (listDepartment != null && listDepartment.Count > 0)
        //{
        //    TV_Department.Nodes.Clear();
        //    TreeNode Node = new TreeNode();
        //    Node.Text = "全部";
        //    Node.Value = "0";
        //    for (int i = 0; i < listDepartment.Count; i++)
        //    {
        //        Department department = (Department)listDepartment[i];
        //        TreeNode NodeChild = new TreeNode();
        //        NodeChild.Text = department.DepartName;
        //        NodeChild.Value = department.DepartCode;
        //        Node.ChildNodes.Add(NodeChild);
        //    }
        //    Node.ExpandAll();
        //    TV_Department.Nodes.Add(Node);
        //}
        TakeTopCore.CoreShareClass.InitialAllDepartmentTree( Resources.lang.ZZJGT,TV_Department);
    }


    private void BindCameraData(int id)
    {
        CameraInfoBLL cameraInfoBLL = new CameraInfoBLL();
        string strCameraSql = "from CameraInfo as cameraInfo where id = " + id;
        IList cameraList = cameraInfoBLL.GetAllCameraInfos(strCameraSql);
        if (cameraList != null && cameraList.Count > 0)
        {
            CameraInfo cameraInfo = (CameraInfo)cameraList[0];
            HF_ForeignID.Value = cameraInfo.ForeignID;
            TXT_CameraName.Text = cameraInfo.CameraName;
            TXT_ServerIP.Text = cameraInfo.ServerIP;
            TXT_CameraUserName.Text = cameraInfo.CameraUserName;
            TXT_CameraPass.Text = cameraInfo.CameraPass;
            TXT_Description.Value = cameraInfo.Description;
        }
    }

    protected void BT_Save_Click(object sender, EventArgs e)
    {
        try
        {
            CameraInfoBLL cameraInfoBLL = new CameraInfoBLL();
            string id = HF_ID.Value;
            if (!string.IsNullOrEmpty(id))
            {
                //修改
                int intID = 0;
                int.TryParse(id,out intID);
                string strCameraInfoHQL = "from CameraInfo as cameraInfo where id = " + intID;
                IList cameraList = cameraInfoBLL.GetAllCameraInfos(strCameraInfoHQL);
                if (cameraList != null && cameraList.Count > 0)
                {
                    CameraInfo cameraInfo = (CameraInfo)cameraList[0];
                    cameraInfo.ForeignID = HF_ForeignID.Value;
                    cameraInfo.CameraType = 1;
                    cameraInfo.CameraName = TXT_CameraName.Text;
                    cameraInfo.ServerIP = TXT_ServerIP.Text;
                    cameraInfo.CameraUserName = TXT_CameraUserName.Text;
                    cameraInfo.CameraPass = TXT_CameraPass.Text;
                    cameraInfo.Description = TXT_Description.Value;

                    cameraInfoBLL.UpdateCameraInfo(cameraInfo, intID);
                }
            }
            else { 
                //增加
                CameraInfo cameraInfo = new CameraInfo();
                cameraInfo.ForeignID = HF_ForeignID.Value;
                cameraInfo.CameraType = 1;
                cameraInfo.CameraName = TXT_CameraName.Text;
                cameraInfo.ServerIP = TXT_ServerIP.Text;
                cameraInfo.CameraUserName = TXT_CameraUserName.Text;
                cameraInfo.CameraPass = TXT_CameraPass.Text;
                cameraInfo.Description = TXT_Description.Value;
                cameraInfo.CreatorCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();
                cameraInfo.CreatorName = Session["UserName"] == null ? "" : Session["UserName"].ToString();
                cameraInfo.CreateTime = DateTime.Now;

                cameraInfoBLL.AddCameraInfo(cameraInfo);
            }

            Response.Redirect("TTPnPCameraView.aspx");
        }
        catch (Exception ex)
        { }
    }


    protected void TV_Department_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strSelectNode = TV_Department.SelectedNode.Value;
        if (!string.IsNullOrEmpty(strSelectNode))
        {
            HF_ForeignID.Value = TV_Department.SelectedNode.Target;//strSelectNode;
        }
    }
}