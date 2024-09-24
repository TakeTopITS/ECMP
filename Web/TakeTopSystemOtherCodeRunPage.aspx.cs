using System;
using System.Net;
using System.Web.UI;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Threading;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Web;
using System.ServiceModel.Channels;

public partial class TakeTopSystemOtherCodeRunPage : System.Web.UI.Page
{
    public string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        if (Page.IsPostBack == false)
        {
            Session["SystemName"] = System.Configuration.ConfigurationManager.AppSettings["SystemName"];

            AsyncWork();
        }
    }

    protected void AsyncWork()
    {
        if (ShareClass.SystemLatestLoginUser == "")
        {
            ShareClass.SystemLatestLoginUser = "Timer";

            //执行特殊代码
            RunSpecialCode(strUserCode, strUserName);

            //最后登录用户
            ShareClass.SystemLatestLoginUser = "";
        }
    }

    //执行特殊代码
    public static void RunSpecialCode(string strUserCode, string strUserName)
    {
        int intUserNumber;

        intUserNumber = getUserNumber();

        //判断现有系统是否已经在使用,没有正式使用则执行下面代码
        if (intUserNumber < 3)
        {
            //更改预警命令
            ShareClass.UpdateEaryWarningOrder("待处理的任务");
            ShareClass.UpdateEaryWarningOrder("待处理的需求");
            ShareClass.UpdateEaryWarningOrder("要处理的投标");
            ShareClass.UpdateEaryWarningOrder("要审核的申请");
            ShareClass.UpdateEaryWarningOrder("拖期的项目计划");
            ShareClass.UpdateEaryWarningOrder("合同预付预警");
            ShareClass.UpdateEaryWarningOrder("要参加的会议");
            ShareClass.UpdateEaryWarningOrder("未写本周计划");
            ShareClass.UpdateEaryWarningOrder("要审核的申请");

            //增加预警命令
            AddEarlyWarningOrder("待处理的缺陷");

            //增加系统分析图
            InitialSystemAnalystChart(strUserCode, "ADMIN");

            //初始化模块操作导航的路线定义
            UpdateModuleFlowDefinition();

            //增加分析图给用户
            AddChartToUser(strUserCode);
        }

        //判断现有系统是否已经在使用，正式使用了则执行下面代码
        if (intUserNumber > 2)
        {
            //禁用实施阶段的基础数据删除功能
            UpdateIsCanClearBaseData(strUserCode, strUserName);
        }
    }

    //初始化模块操作导航的路线定义
    public static void UpdateModuleFlowDefinition()
    {
        string strMFXML;
        string strSystemProductType;

        try
        {
            strSystemProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];

            //初始化实施导航的实施路线定义
            strMFXML = @"{states:{rect1:{type:'start',text:{text:'开始'}, attr:{ x:141, y:12, width:50, height:50}, props:{guid:{value:'4af6bc4b-7ed9-0b0b-e3a0-91c9d8fd92d1'},text:{value:'开始'}}},rect2:{type:'task',text:{text:'基础数据(外置)'}, attr:{ x:267, y:62, width:100, height:50}, props:{guid:{value:'330ea6c7-33f5-e8e4-882a-c2e7b5763e84'},text:{value:'基础数据(外置)',url:'TTBaseDataOuter.aspx'}}},rect3:{type:'task',text:{text:'基础数据(内置)'}, attr:{ x:496, y:62, width:100, height:50}, props:{guid:{value:'39ecc8b3-039f-f13b-7b56-b380c8eb2d3d'},text:{value:'基础数据(内置)',url:'TTBaseDataInner.aspx'}}},rect4:{type:'task',text:{text:'组织架构设置'}, attr:{ x:691, y:62, width:100, height:50}, props:{guid:{value:'0a6fd6c1-c2a6-b674-6a38-b407ac819f76'},text:{value:'组织架构设置',url:'TTDepartment.aspx'}}},rect5:{type:'task',text:{text:'员工档案设置'}, attr:{ x:886, y:63, width:100, height:50}, props:{guid:{value:'fcf442a4-3711-d09c-ffee-b8a6fcdcdac9'},text:{value:'员工档案设置',url:'TTUserInfor.aspx'}}},rect6:{type:'task',text:{text:'员工资料导入'}, attr:{ x:271, y:154, width:100, height:50}, props:{guid:{value:'85f9b02d-84c6-b9d9-9b22-4831788ae50e'},text:{value:'员工资料导入',url:'TTUserInforImport.aspx'}}},rect7:{type:'task',text:{text:'用户权限管理'}, attr:{ x:270, y:250, width:100, height:50}, props:{guid:{value:'4ca043ad-3c84-c0af-4e7b-0c749ccb1c3d'},text:{value:'用户权限管理',url:'TTProModuleAuthority.aspx'}}},rect8:{type:'task',text:{text:'系统用户设置'}, attr:{ x:494, y:253, width:100, height:50}, props:{guid:{value:'01517ae8-e172-149d-359e-5ff6afc87603'},text:{value:'系统用户设置',url:'TTSystemActiveUserSet.aspx'}}},rect9:{type:'task',text:{text:'直接成员层次设置'}, attr:{ x:692, y:253, width:100, height:50}, props:{guid:{value:'18faee71-5273-0cbd-7bd3-1fc624e2253f'},text:{value:'直接成员层次设置',url:'TTMemberLevelSet.aspx'}}},rect10:{type:'task',text:{text:'流程模板设置'}, attr:{ x:887, y:255, width:100, height:50}, props:{guid:{value:'b84f2f71-fd7b-5c3f-78aa-8e79021683ba'},text:{value:'流程模板设置',url:'TTWorkFlowTemplate.aspx'}}},rect11:{type:'task',text:{text:'文档类型设置'}, attr:{ x:272, y:332, width:100, height:50}, props:{guid:{value:'7291f992-1ad8-b3b6-1eff-be100785b975'},text:{value:'文档类型设置',url:'TTDocumentTypeSet.aspx'}}},rect12:{type:'task',text:{text:'角色组设置'}, attr:{ x:272, y:456, width:100, height:50}, props:{guid:{value:'6c73074a-58f7-f5c7-62ce-a5aba9142648'},text:{value:'角色组设置',url:'TTActorGroup.aspx'}}},rect13:{type:'task',text:{text:'新闻类型设置'}, attr:{ x:491, y:457, width:100, height:50}, props:{guid:{value:'f0d6623c-39ab-fdca-cf64-3c507371a429'},text:{value:'新闻类型设置',url:'TTPersonalSpaceNewsTypeEdit.aspx'}}},rect14:{type:'end',text:{text:'结束(End)'}, attr:{ x:698, y:456, width:50, height:50}, props:{guid:{value:'718652a3-5724-2781-786b-abe937bd574b'},text:{value:'结束(End)'}}}},paths:{path15:{from:'rect1',to:'rect2', dots:[],text:{text:'TO 步骤(Step)'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path16:{from:'rect2',to:'rect3', dots:[],text:{text:'TO 步骤(Step)'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path17:{from:'rect3',to:'rect4', dots:[],text:{text:'TO 组织架构设置'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path18:{from:'rect4',to:'rect5', dots:[],text:{text:'TO 员工资料导入'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path19:{from:'rect7',to:'rect8', dots:[],text:{text:'TO 系统用户设置'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path20:{from:'rect8',to:'rect9', dots:[],text:{text:'TO 直接成员层次设置'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path21:{from:'rect12',to:'rect13', dots:[],text:{text:'TO 新闻类型设置'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path22:{from:'rect9',to:'rect10', dots:[],text:{text:'TO 流程模板设置'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path23:{from:'rect13',to:'rect14', dots:[],text:{text:'TO 结束(End)'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path24:{from:'rect5',to:'rect6', dots:[{x:935,y:179}],text:{text:'TO 员工档案设置'},textPos:{x:0,y:-10}, props:{text:{value:'TO 员工档案设置'}}},path25:{from:'rect6',to:'rect7', dots:[],text:{text:'TO 用户权限管理'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path26:{from:'rect10',to:'rect11', dots:[{x:937,y:357}],text:{text:'TO 文档类型设置'},textPos:{x:-12,y:-10}, props:{text:{value:'TO 文档类型设置'}}},path27:{from:'rect11',to:'rect12', dots:[],text:{text:'TO 角色组设置'},textPos:{x:0,y:-10}, props:{text:{value:''}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
            SaveModuleFlowDefinition("实施导航", strMFXML, 1, "INNER");

            if ("ECMP,DEMO".IndexOf(strSystemProductType) > -1)
            {
                strMFXML = @"{states:{rect1:{type:'task',text:{text:'项目立项'}, attr:{ x:105, y:127, width:100, height:50}, props:{guid:{value:'02899d0f-472c-063f-f67e-c6b9d45c8d29'},text:{value:'项目立项',url:'TTMakeProject.aspx'}}},rect2:{type:'task',text:{text:'项目管理'}, attr:{ x:313, y:127, width:100, height:50}, props:{guid:{value:'5fe585ee-cf14-5681-46eb-e0f32e23b369'},text:{value:'项目管理',url:'TTProjectManage.aspx'}}},rect3:{type:'task',text:{text:'项目任务管理'}, attr:{ x:313, y:8, width:100, height:50}, props:{guid:{value:'e2637d3e-2cdb-2369-c06d-febd974c8af5'},text:{value:'项目任务管理',url:'TTProjectTaskManageMain.aspx'}}},rect4:{type:'task',text:{text:'工作流管理'}, attr:{ x:541, y:128, width:100, height:50}, props:{guid:{value:'7c6325be-8337-ec12-76ed-1a03b86afab4'},text:{value:'工作流管理',url:'TTWLManage.aspx'}}},rect5:{type:'task',text:{text:'项目需求管理'}, attr:{ x:313, y:243, width:100, height:50}, props:{guid:{value:'54404d63-2600-e15e-81e4-d73382f0c4be'},text:{value:'项目需求管理',url:'TTProjectReqManageMain.aspx'}}},rect6:{type:'task',text:{text:'供应链管理'}, attr:{ x:733, y:130, width:100, height:50}, props:{guid:{value:'1c96be8a-74f3-4245-8410-1e644295853b'},text:{value:'供应链管理',url:'TTGoodsManage.aspx'}}},rect7:{type:'task',text:{text:'知识管理'}, attr:{ x:1142, y:132, width:100, height:50}, props:{guid:{value:'5d7924f1-d30f-8e77-f9c2-bbff046fc474'},text:{value:'知识管理',url:'TTDocumentManage.aspx'}}},rect8:{type:'task',text:{text:'财务管理'}, attr:{ x:940, y:131, width:100, height:50}, props:{guid:{value:'1d88fb65-7ead-3211-578a-ca3f51f6d5c4'},text:{value:'财务管理',url:'TTReceivablesPayableAlert.aspx'}}},rect9:{type:'task',text:{text:'入库单'}, attr:{ x:733, y:7, width:100, height:50}, props:{guid:{value:'7f67e5bf-6b78-d79c-9ef3-b2858f7293b0'},text:{value:'入库单',url:'TTMakeGoods.aspx'}}},rect10:{type:'task',text:{text:'出库单'}, attr:{ x:733, y:244, width:100, height:50}, props:{guid:{value:'ca55c30d-c204-9183-baea-4629fb52ef33'},text:{value:'出库单',url:'TTGoodsShipmentOrder.aspx'}}},rect11:{type:'task',text:{text:'收款'}, attr:{ x:940, y:6, width:100, height:50}, props:{guid:{value:'bb49d768-afb5-6148-bad3-a10a1f4e47db'},text:{value:'收款',url:'TTAccountReceivablesRecord.aspx'}}},rect12:{type:'task',text:{text:'付款'}, attr:{ x:940, y:243, width:100, height:50}, props:{guid:{value:'40067ae4-3ada-306f-0e3a-33f00532c494'},text:{value:'付款',url:'TTAccountPayableRecord.aspx'}}}},paths:{path13:{from:'rect1',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path14:{from:'rect2',to:'rect3', dots:[],text:{text:'TO 项目任务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目任务管理'}}},path15:{from:'rect2',to:'rect4', dots:[],text:{text:'TO 工作流管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 工作流管理'}}},path16:{from:'rect2',to:'rect5', dots:[],text:{text:'TO 项目需求管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目需求管理'}}},path17:{from:'rect4',to:'rect6', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path18:{from:'rect6',to:'rect8', dots:[],text:{text:'TO 财务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 财务管理'}}},path19:{from:'rect8',to:'rect7', dots:[],text:{text:'TO 知识管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 知识管理'}}},path20:{from:'rect9',to:'rect6', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path21:{from:'rect10',to:'rect6', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path22:{from:'rect11',to:'rect8', dots:[],text:{text:'TO 财务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 财务管理'}}},path23:{from:'rect12',to:'rect8', dots:[],text:{text:'TO 财务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 财务管理'}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
                SaveModuleFlowDefinition("操作导航", strMFXML, 3, "INNER");
            }

            if (strSystemProductType == "EDPMP")
            {
                strMFXML = @"{states:{rect1:{type:'task',text:{text:'项目立项'}, attr:{ x:105, y:127, width:100, height:50}, props:{guid:{value:'02899d0f-472c-063f-f67e-c6b9d45c8d29'},text:{value:'项目立项',url:'TTMakeProject.aspx'}}},rect2:{type:'task',text:{text:'项目管理'}, attr:{ x:313, y:127, width:100, height:50}, props:{guid:{value:'5fe585ee-cf14-5681-46eb-e0f32e23b369'},text:{value:'项目管理',url:'TTProjectManage.aspx'}}},rect3:{type:'task',text:{text:'项目任务管理'}, attr:{ x:539, y:30, width:100, height:50}, props:{guid:{value:'e2637d3e-2cdb-2369-c06d-febd974c8af5'},text:{value:'项目任务管理',url:'TTProjectTaskManageMain.aspx'}}},rect4:{type:'task',text:{text:'工作流管理'}, attr:{ x:541, y:128, width:100, height:50}, props:{guid:{value:'7c6325be-8337-ec12-76ed-1a03b86afab4'},text:{value:'工作流管理',url:'TTWLManage.aspx'}}},rect5:{type:'task',text:{text:'知识管理'}, attr:{ x:1150, y:129, width:100, height:50}, props:{guid:{value:'cc37c28e-3f87-c548-408e-c5404815c2f6'},text:{value:'知识管理',url:'TTDocumentManage.aspx'}}},rect6:{type:'task',text:{text:'投标管理'}, attr:{ x:741, y:128, width:100, height:50}, props:{guid:{value:'7afdc1c7-86a7-86f0-f1f4-27080c5a5e12'},text:{value:'投标管理',url:'TTTenderUNHandleList.aspx'}}},rect7:{type:'task',text:{text:'投标登记'}, attr:{ x:741, y:32, width:100, height:50}, props:{guid:{value:'a156bfcc-cc20-8067-f531-88166371239c'},text:{value:'投标登记',url:'TTTenderList.aspx'}}},rect8:{type:'task',text:{text:'投标确认'}, attr:{ x:742, y:234, width:100, height:50}, props:{guid:{value:'ed594496-0b83-c6d3-5922-8efad984eee1'},text:{value:'投标确认',url:'TTTenderFinanceList.aspx'}}},rect9:{type:'task',text:{text:'所有成员项目状态'}, attr:{ x:935, y:130, width:120, height:50}, props:{guid:{value:'016de4e1-1aa6-e650-cd13-261b951d2066'},text:{value:'所有成员项目状态',url:'TTAllProjectsRunStatus.aspx'}}},rect10:{type:'task',text:{text:'项目风险管理'}, attr:{ x:542, y:234, width:100, height:50}, props:{guid:{value:'273b9704-371f-e2aa-41ae-d3a94c29ae6c'},text:{value:'项目风险管理',url:'TTProjectRiskManageMain.aspx'}}}},paths:{path11:{from:'rect1',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path12:{from:'rect2',to:'rect3', dots:[],text:{text:'TO 项目任务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目任务管理'}}},path13:{from:'rect2',to:'rect4', dots:[],text:{text:'TO 工作流管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 工作流管理'}}},path14:{from:'rect4',to:'rect6', dots:[],text:{text:'TO 投标管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 投标管理'}}},path15:{from:'rect7',to:'rect6', dots:[],text:{text:'TO 投标管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 投标管理'}}},path16:{from:'rect8',to:'rect6', dots:[],text:{text:'TO 投标管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 投标管理'}}},path17:{from:'rect6',to:'rect9', dots:[],text:{text:'TO 所有成员项目状态'},textPos:{x:0,y:-10}, props:{text:{value:'TO 所有成员项目状态'}}},path18:{from:'rect9',to:'rect5', dots:[],text:{text:'TO 知识管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 知识管理'}}},path19:{from:'rect2',to:'rect10', dots:[],text:{text:'TO 项目风险管理'},textPos:{x:0,y:-10}, props:{text:{value:''}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
                SaveModuleFlowDefinition("操作导航", strMFXML, 3, "INNER");
            }

            if (strSystemProductType == "RDPMP")
            {
                strMFXML = @"{states:{rect1:{type:'task',text:{text:'项目立项'}, attr:{ x:146, y:125, width:100, height:50}, props:{guid:{value:'02899d0f-472c-063f-f67e-c6b9d45c8d29'},text:{value:'项目立项',url:'TTMakeProject.aspx'}}},rect2:{type:'task',text:{text:'项目管理'}, attr:{ x:405, y:126, width:100, height:50}, props:{guid:{value:'5fe585ee-cf14-5681-46eb-e0f32e23b369'},text:{value:'项目管理',url:'TTProjectManage.aspx'}}},rect3:{type:'task',text:{text:'项目任务管理'}, attr:{ x:320, y:18, width:100, height:50}, props:{guid:{value:'e2637d3e-2cdb-2369-c06d-febd974c8af5'},text:{value:'项目任务管理',url:'TTProjectTaskManageMain.aspx'}}},rect4:{type:'task',text:{text:'供应链管理'}, attr:{ x:795, y:127, width:100, height:50}, props:{guid:{value:'2c43e892-71ba-f826-f0df-5393bdd20173'},text:{value:'供应链管理',url:'TTGoodsManage.aspx'}}},rect5:{type:'task',text:{text:'领料单'}, attr:{ x:795, y:11, width:100, height:50}, props:{guid:{value:'ee0e9c61-2ba9-f307-2ca5-45ca1e58345f'},text:{value:'领料单',url:'TTGoodsApplicationOrder.aspx'}}},rect6:{type:'task',text:{text:'出库单'}, attr:{ x:795, y:244, width:100, height:50}, props:{guid:{value:'d0018ba6-ef5d-b0ba-5e9c-97e001e698c5'},text:{value:'出库单',url:'TTGoodsShipmentOrder.aspx'}}},rect7:{type:'task',text:{text:'工作流管理'}, attr:{ x:607, y:127, width:100, height:50}, props:{guid:{value:'39e45ece-447c-72ff-eb5f-bd5d40217313'},text:{value:'工作流管理',url:'TTWLManage.aspx'}}},rect8:{type:'task',text:{text:'项目需求管理'}, attr:{ x:323, y:241, width:100, height:50}, props:{guid:{value:'77cdd84c-a60a-7777-2611-114303e65439'},text:{value:'项目需求管理',url:'TTProjectReqManageMain.aspx'}}},rect9:{type:'task',text:{text:'知识管理'}, attr:{ x:1040, y:128, width:100, height:50}, props:{guid:{value:'ed1042f6-938a-dbc6-d876-5b0adbeffecc'},text:{value:'知识管理',url:'TTDocumentManage.aspx'}}},rect10:{type:'task',text:{text:'项目缺陷管理'}, attr:{ x:498, y:243, width:100, height:50}, props:{guid:{value:'e7016fa9-7391-8ca2-4f7d-d528cf302d8d'},text:{value:'项目缺陷管理',url:'TTProjectDefectManageMain.aspx'}}},rect11:{type:'task',text:{text:'项目风险管理'}, attr:{ x:496, y:19, width:100, height:50}, props:{guid:{value:'960e6089-9bbb-4f27-a14f-acc8acc0fce4'},text:{value:'项目风险管理',url:'TTProjectRiskManageMain.aspx'}}}},paths:{path12:{from:'rect1',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path13:{from:'rect5',to:'rect4', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path14:{from:'rect6',to:'rect4', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path15:{from:'rect2',to:'rect7', dots:[],text:{text:'TO 工作流管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 工作流管理'}}},path16:{from:'rect7',to:'rect4', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path17:{from:'rect3',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path18:{from:'rect8',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path19:{from:'rect4',to:'rect9', dots:[],text:{text:'TO 知识管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 知识管理'}}},path20:{from:'rect10',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path21:{from:'rect11',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:''}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
                SaveModuleFlowDefinition("操作导航", strMFXML, 3, "INNER");
            }

            if (strSystemProductType == "SIPMP")
            {
                strMFXML = @"{states:{rect1:{type:'task',text:{text:'项目立项'}, attr:{ x:105, y:127, width:100, height:50}, props:{guid:{value:'02899d0f-472c-063f-f67e-c6b9d45c8d29'},text:{value:'项目立项',url:'TTMakeProject.aspx'}}},rect2:{type:'task',text:{text:'项目管理'}, attr:{ x:313, y:127, width:100, height:50}, props:{guid:{value:'5fe585ee-cf14-5681-46eb-e0f32e23b369'},text:{value:'项目管理',url:'TTProjectManage.aspx'}}},rect3:{type:'task',text:{text:'项目任务管理'}, attr:{ x:539, y:32, width:100, height:50}, props:{guid:{value:'e2637d3e-2cdb-2369-c06d-febd974c8af5'},text:{value:'项目任务管理',url:'TTProjectTaskManageMain.aspx'}}},rect4:{type:'task',text:{text:'收款明细汇总表'}, attr:{ x:972, y:32, width:100, height:50}, props:{guid:{value:'6f8c99c9-3fcd-297d-1fa8-19811a07312b'},text:{value:'收款明细汇总表',url:'TTAccountReceiveRecordSummary.aspx'}}},rect5:{type:'task',text:{text:'付款明细汇总表'}, attr:{ x:971, y:233, width:100, height:50}, props:{guid:{value:'5a1f8b2b-c6f3-ce0b-7604-f7a986a65be7'},text:{value:'付款明细汇总表',url:'TTAccountPayRecordSummary.aspx'}}},rect6:{type:'task',text:{text:'工作流管理'}, attr:{ x:541, y:128, width:100, height:50}, props:{guid:{value:'7c6325be-8337-ec12-76ed-1a03b86afab4'},text:{value:'工作流管理',url:'TTWLManage.aspx'}}},rect7:{type:'task',text:{text:'项目需求管理'}, attr:{ x:539, y:233, width:100, height:50}, props:{guid:{value:'cc37c28e-3f87-c548-408e-c5404815c2f6'},text:{value:'项目需求管理',url:'TTProjectReqManageMain.aspx'}}},rect8:{type:'task',text:{text:'知识管理'}, attr:{ x:1192, y:127, width:100, height:50}, props:{guid:{value:'28fad06e-abdf-9e5c-5dcc-83cf8e31b868'},text:{value:'知识管理',url:'TTDocumentManage.aspx'}}},rect9:{type:'task',text:{text:'供应链管理'}, attr:{ x:734, y:126, width:100, height:50}, props:{guid:{value:'97a9836e-9bfd-0785-186c-82b045d4c045'},text:{value:'供应链管理',url:'TTGoodsManage.aspx'}}},rect10:{type:'task',text:{text:'采购订单'}, attr:{ x:681, y:35, width:100, height:50}, props:{guid:{value:'2885595e-3090-94cf-dcbb-eeec21743fd1'},text:{value:'采购订单',url:'TTMakeGoodsPurchase.aspx'}}},rect11:{type:'task',text:{text:'入库单'}, attr:{ x:831, y:33, width:100, height:50}, props:{guid:{value:'ff012f74-eb6a-ece7-07d0-802a93ac8630'},text:{value:'入库单',url:'TTMakeGoods.aspx'}}},rect12:{type:'task',text:{text:'领料单'}, attr:{ x:681, y:232, width:100, height:50}, props:{guid:{value:'d6a96f3c-4232-b23a-5d98-851660ee72e3'},text:{value:'领料单',url:'TTGoodsApplicationOrder.aspx'}}},rect13:{type:'task',text:{text:'出库单'}, attr:{ x:831, y:231, width:100, height:50}, props:{guid:{value:'8552f52f-2566-d548-b15d-b482a47f9c59'},text:{value:'出库单',url:'TTGoodsShipmentOrder.aspx'}}},rect14:{type:'task',text:{text:'财务管理'}, attr:{ x:972, y:126, width:100, height:50}, props:{guid:{value:'fdfcecbb-2f46-87c3-73ba-3264fee27d42'},text:{value:'财务管理',url:'TTReceivablesPayableAlert.aspx'}}}},paths:{path15:{from:'rect1',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path16:{from:'rect2',to:'rect3', dots:[],text:{text:'TO 项目任务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目任务管理'}}},path17:{from:'rect2',to:'rect6', dots:[],text:{text:'TO 工作流管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 工作流管理'}}},path18:{from:'rect6',to:'rect9', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path19:{from:'rect9',to:'rect14', dots:[],text:{text:'TO 财务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 财务管理'}}},path20:{from:'rect10',to:'rect9', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path21:{from:'rect11',to:'rect9', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path22:{from:'rect12',to:'rect9', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path23:{from:'rect13',to:'rect9', dots:[],text:{text:'TO 供应链管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 供应链管理'}}},path24:{from:'rect4',to:'rect14', dots:[],text:{text:'TO 财务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 财务管理'}}},path25:{from:'rect5',to:'rect14', dots:[],text:{text:'TO 财务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 财务管理'}}},path26:{from:'rect2',to:'rect7', dots:[],text:{text:'TO 项目需求管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目需求管理'}}},path27:{from:'rect14',to:'rect8', dots:[],text:{text:'TO 知识管理'},textPos:{x:0,y:-10}, props:{text:{value:''}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
                SaveModuleFlowDefinition("操作导航", strMFXML, 3, "INNER");
            }

            if (strSystemProductType == "SOPMP")
            {
                strMFXML = @"{states:{rect1:{type:'task',text:{text:'项目立项'}, attr:{ x:105, y:127, width:100, height:50}, props:{guid:{value:'02899d0f-472c-063f-f67e-c6b9d45c8d29'},text:{value:'项目立项',url:'TTMakeProject.aspx'}}},rect2:{type:'task',text:{text:'项目管理'}, attr:{ x:313, y:127, width:100, height:50}, props:{guid:{value:'5fe585ee-cf14-5681-46eb-e0f32e23b369'},text:{value:'项目管理',url:'TTProjectManage.aspx'}}},rect3:{type:'task',text:{text:'项目任务管理'}, attr:{ x:539, y:30, width:100, height:50}, props:{guid:{value:'e2637d3e-2cdb-2369-c06d-febd974c8af5'},text:{value:'项目任务管理',url:'TTProjectTaskManageMain.aspx'}}},rect4:{type:'task',text:{text:'收付款预警'}, attr:{ x:752, y:131, width:100, height:50}, props:{guid:{value:'cf2796ca-6729-11cd-5270-5a691941fe8b'},text:{value:'收付款预警',url:'TTReceivablesPayableAlert.aspx'}}},rect5:{type:'task',text:{text:'收款明细汇总表'}, attr:{ x:961, y:69, width:100, height:50}, props:{guid:{value:'6f8c99c9-3fcd-297d-1fa8-19811a07312b'},text:{value:'收款明细汇总表',url:'TTAccountReceiveRecordSummary.aspx'}}},rect6:{type:'task',text:{text:'付款明细汇总表'}, attr:{ x:961, y:180, width:100, height:50}, props:{guid:{value:'5a1f8b2b-c6f3-ce0b-7604-f7a986a65be7'},text:{value:'付款明细汇总表',url:'TTAccountPayRecordSummary.aspx'}}},rect7:{type:'task',text:{text:'工作流管理'}, attr:{ x:541, y:128, width:100, height:50}, props:{guid:{value:'7c6325be-8337-ec12-76ed-1a03b86afab4'},text:{value:'工作流管理',url:'TTWLManage.aspx'}}},rect8:{type:'task',text:{text:'项目需求管理'}, attr:{ x:540, y:236, width:100, height:50}, props:{guid:{value:'cc37c28e-3f87-c548-408e-c5404815c2f6'},text:{value:'项目需求管理',url:'TTProjectReqManageMain.aspx'}}},rect21:{type:'task',text:{text:'知识管理'}, attr:{ x:1174, y:131, width:100, height:50}, props:{guid:{value:'3801c149-8a75-9414-4a66-2dd13c668cd1'},text:{value:'知识管理',url:'TTDocumentManage.aspx'}}}},paths:{path10:{from:'rect1',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path11:{from:'rect2',to:'rect3', dots:[],text:{text:'TO 项目任务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目任务管理'}}},path12:{from:'rect3',to:'rect4', dots:[],text:{text:'TO 收付款预警'},textPos:{x:0,y:-10}, props:{text:{value:'TO 收付款预警'}}},path13:{from:'rect4',to:'rect5', dots:[],text:{text:'TO 收款明细汇总表'},textPos:{x:0,y:-10}, props:{text:{value:'TO 收款明细汇总表'}}},path14:{from:'rect4',to:'rect6', dots:[],text:{text:'TO 付款明细汇总表'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path15:{from:'rect2',to:'rect7', dots:[],text:{text:'TO 工作流管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 工作流管理'}}},path16:{from:'rect7',to:'rect4', dots:[],text:{text:'TO 收付款预警'},textPos:{x:0,y:-10}, props:{text:{value:'TO 收付款预警'}}},path18:{from:'rect8',to:'rect4', dots:[],text:{text:'TO 收付款预警'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path22:{from:'rect2',to:'rect8', dots:[],text:{text:'TO 项目需求管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目需求管理'}}},path23:{from:'rect4',to:'rect21', dots:[],text:{text:'TO 知识管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 知识管理'}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
                SaveModuleFlowDefinition("操作导航", strMFXML, 3, "INNER");
            }

            if (strSystemProductType == "GAPMP")
            {
                strMFXML = @"{states:{rect1:{type:'task',text:{text:'项目立项'}, attr:{ x:105, y:127, width:100, height:50}, props:{guid:{value:'02899d0f-472c-063f-f67e-c6b9d45c8d29'},text:{value:'项目立项',url:'TTMakeProject.aspx'}}},rect2:{type:'task',text:{text:'项目管理'}, attr:{ x:313, y:127, width:100, height:50}, props:{guid:{value:'5fe585ee-cf14-5681-46eb-e0f32e23b369'},text:{value:'项目管理',url:'TTProjectManage.aspx'}}},rect3:{type:'task',text:{text:'项目任务管理'}, attr:{ x:538, y:29, width:100, height:50}, props:{guid:{value:'e2637d3e-2cdb-2369-c06d-febd974c8af5'},text:{value:'项目任务管理',url:'TTProjectTaskManageMain.aspx'}}},rect4:{type:'task',text:{text:'工作流管理'}, attr:{ x:541, y:127, width:100, height:50}, props:{guid:{value:'7c6325be-8337-ec12-76ed-1a03b86afab4'},text:{value:'工作流管理',url:'TTWLManage.aspx'}}},rect5:{type:'task',text:{text:'成员负荷'}, attr:{ x:740, y:130, width:100, height:50}, props:{guid:{value:'f1e0ed67-edc6-c121-6483-f8c659a50981'},text:{value:'成员负荷',url:'TTMyMemWorkLoad.aspx'}}},rect6:{type:'task',text:{text:'所有成员项目状态'}, attr:{ x:938, y:131, width:129, height:50}, props:{guid:{value:'b38dbce8-3d0f-59c2-254c-eed1be874be4'},text:{value:'所有成员项目状态',url:'TTAllProjectsRunStatus.aspx'}}},rect7:{type:'task',text:{text:'项目需求管理'}, attr:{ x:541, y:240, width:100, height:50}, props:{guid:{value:'05017a00-1673-af9b-376a-4910161fabdb'},text:{value:'项目需求管理',url:'TTProjectReqManageMain.aspx'}}},rect8:{type:'task',text:{text:'知识管理'}, attr:{ x:1169, y:132, width:100, height:50}, props:{guid:{value:'aa579bd1-56e0-6b13-0f2f-0cc3f2bcba5c'},text:{value:'知识管理',url:'TTDocumentManage.aspx'}}}},paths:{path9:{from:'rect1',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path10:{from:'rect2',to:'rect3', dots:[],text:{text:'TO 项目任务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目任务管理'}}},path11:{from:'rect2',to:'rect4', dots:[],text:{text:'TO 工作流管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 工作流管理'}}},path12:{from:'rect2',to:'rect7', dots:[],text:{text:'TO 项目需求管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目需求管理'}}},path13:{from:'rect4',to:'rect5', dots:[],text:{text:'TO 成员负荷'},textPos:{x:0,y:-10}, props:{text:{value:'TO 成员负荷'}}},path14:{from:'rect5',to:'rect6', dots:[],text:{text:'TO 所有成员项目状态'},textPos:{x:0,y:-10}, props:{text:{value:'TO 所有成员项目状态'}}},path15:{from:'rect6',to:'rect8', dots:[],text:{text:'TO 知识管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 知识管理'}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
                SaveModuleFlowDefinition("操作导航", strMFXML, 3, "INNER");
            }

            if (strSystemProductType == "ERP")
            {
                strMFXML = @"{states:{rect1:{type:'task',text:{text:'项目立项'}, attr:{ x:105, y:127, width:100, height:50}, props:{guid:{value:'02899d0f-472c-063f-f67e-c6b9d45c8d29'},text:{value:'项目立项',url:'TTMakeProject.aspx'}}},rect2:{type:'task',text:{text:'项目管理'}, attr:{ x:313, y:127, width:100, height:50}, props:{guid:{value:'5fe585ee-cf14-5681-46eb-e0f32e23b369'},text:{value:'项目管理',url:'TTProjectManage.aspx'}}},rect3:{type:'task',text:{text:'项目任务管理'}, attr:{ x:539, y:30, width:100, height:50}, props:{guid:{value:'e2637d3e-2cdb-2369-c06d-febd974c8af5'},text:{value:'项目任务管理',url:'TTProjectTaskManageMain.aspx'}}},rect4:{type:'task',text:{text:'工作流管理'}, attr:{ x:541, y:128, width:100, height:50}, props:{guid:{value:'7c6325be-8337-ec12-76ed-1a03b86afab4'},text:{value:'工作流管理',url:'TTWLManage.aspx'}}},rect5:{type:'task',text:{text:'库存管理'}, attr:{ x:751, y:129, width:100, height:50}, props:{guid:{value:'82e392bd-eacd-e39b-6c04-20b6b557fb8d'},text:{value:'库存管理',url:'TTGoodsManage.aspx'}}},rect6:{type:'task',text:{text:'入库单'}, attr:{ x:806, y:32, width:100, height:50}, props:{guid:{value:'220f25e9-5536-da10-cf76-df87209bdd57'},text:{value:'入库单',url:'TTMakeGoods.aspx'}}},rect7:{type:'task',text:{text:'出库单'}, attr:{ x:750, y:232, width:100, height:50}, props:{guid:{value:'c35a73a7-7760-0515-9cb4-c819a205e156'},text:{value:'出库单',url:'TTGoodsShipmentOrder.aspx'}}},rect8:{type:'task',text:{text:'知识管理'}, attr:{ x:1140, y:130, width:100, height:50}, props:{guid:{value:'7493182a-8965-2821-127c-307cf283d679'},text:{value:'知识管理',url:'TTDocumentManage.aspx'}}},rect9:{type:'task',text:{text:'项目缺陷管理'}, attr:{ x:541, y:232, width:100, height:50}, props:{guid:{value:'ee665fc9-3bf7-6e8f-6258-ac32f63aeb21'},text:{value:'项目缺陷管理',url:'TTProjectDefectManageMain.aspx'}}},rect10:{type:'task',text:{text:'作业管理'}, attr:{ x:941, y:130, width:100, height:50}, props:{guid:{value:'a1db5803-1780-e0c5-2c57-6a69a7ef579d'},text:{value:'作业管理',url:'TTGoodsProductionManagement.aspx'}}},rect11:{type:'task',text:{text:'生产作业单'}, attr:{ x:940, y:32, width:100, height:50}, props:{guid:{value:'5df740b5-bc9c-d182-e1ef-dd6c2602838b'},text:{value:'生产作业单',url:'TTGoodsProductionOrder.aspx'}}},rect12:{type:'task',text:{text:'作业领料申请'}, attr:{ x:940, y:233, width:100, height:50}, props:{guid:{value:'5d11af4b-6483-4d3f-078b-21877023f95f'},text:{value:'作业领料申请',url:'TTGoodsApplicationOrderForProduction.aspx'}}},rect13:{type:'task',text:{text:'采购订单'}, attr:{ x:681, y:32, width:100, height:50}, props:{guid:{value:'101a03f5-091f-8d2d-e3a0-3a4053d40323'},text:{value:'采购订单',url:'TTMakeGoodsPurchase.aspx'}}}},paths:{path14:{from:'rect1',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path15:{from:'rect2',to:'rect3', dots:[],text:{text:'TO 项目任务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目任务管理'}}},path16:{from:'rect2',to:'rect4', dots:[],text:{text:'TO 工作流管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 工作流管理'}}},path17:{from:'rect4',to:'rect5', dots:[],text:{text:'TO 库存管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 库存管理'}}},path18:{from:'rect6',to:'rect5', dots:[],text:{text:'TO 库存管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 库存管理'}}},path19:{from:'rect7',to:'rect5', dots:[],text:{text:'TO 库存管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 库存管理'}}},path20:{from:'rect2',to:'rect9', dots:[],text:{text:'TO 项目缺陷管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目缺陷管理'}}},path21:{from:'rect5',to:'rect10', dots:[],text:{text:'TO 作业管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 作业管理'}}},path22:{from:'rect10',to:'rect8', dots:[],text:{text:'TO 知识管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 知识管理'}}},path23:{from:'rect10',to:'rect11', dots:[],text:{text:'TO 生产作业单'},textPos:{x:0,y:-10}, props:{text:{value:'TO 生产作业单'}}},path24:{from:'rect10',to:'rect12', dots:[],text:{text:'TO 作业领料申请'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path25:{from:'rect13',to:'rect5', dots:[],text:{text:'TO 库存管理'},textPos:{x:0,y:-10}, props:{text:{value:''}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
                SaveModuleFlowDefinition("操作导航", strMFXML, 3, "INNER");
            }

            if (strSystemProductType == "CMP")
            {
                strMFXML = @"{states:{rect1:{type:'task',text:{text:'知识管理'}, attr:{ x:1160, y:122, width:100, height:50}, props:{guid:{value:'a7881a76-7a03-bbb7-acb5-a0b3c9798e5d'},text:{value:'知识管理',url:'TTDocumentManage.aspx'}}},rect2:{type:'task',text:{text:'工作流管理'}, attr:{ x:336, y:118, width:115, height:50}, props:{guid:{value:'9070892c-92e7-a7ba-6a9e-eabbb579c872'},text:{value:'工作流管理',url:'TTWLManage.aspx'}}},rect3:{type:'task',text:{text:'常用工作流申请'}, attr:{ x:118, y:117, width:114, height:50}, props:{guid:{value:'e4ea0ce0-ef2b-704c-b200-7b8fa1f73673'},text:{value:'常用工作流申请',url:'TTRegularWLMain.aspx'}}},rect4:{type:'task',text:{text:'合同管理'}, attr:{ x:569, y:118, width:100, height:50}, props:{guid:{value:'cadbd16e-60c2-9a78-469b-303d94aada59'},text:{value:'合同管理',url:'TTConstractManagement.aspx'}}},rect5:{type:'task',text:{text:'资产管理'}, attr:{ x:768, y:119, width:100, height:50}, props:{guid:{value:'ff18fe05-f7f6-a480-bf89-aee77f83738b'},text:{value:'资产管理',url:'TTAssetManage.aspx'}}},rect6:{type:'task',text:{text:'会议管理'}, attr:{ x:959, y:121, width:100, height:50}, props:{guid:{value:'78df5ac9-4c70-d0fc-6b5d-c05c64e9eda0'},text:{value:'会议管理',url:'TTMeetingManage.aspx'}}},rect7:{type:'task',text:{text:'制定合同'}, attr:{ x:569, y:13, width:100, height:50}, props:{guid:{value:'2e4ba6ce-eaaf-707c-af98-1f6de5f4bbd2'},text:{value:'制定合同',url:'TTMakeConstract.aspx'}}},rect8:{type:'task',text:{text:'合同收付款预警'}, attr:{ x:570, y:244, width:100, height:50}, props:{guid:{value:'43c3f25a-f5b7-1240-bfd7-fe9a72565e62'},text:{value:'合同收付款预警',url:'TTConstractUnHandleReceivePay.aspx'}}},rect9:{type:'task',text:{text:'资产登记入库'}, attr:{ x:768, y:13, width:100, height:50}, props:{guid:{value:'f3a168f0-0754-c806-8335-6f43083cd1c3'},text:{value:'资产登记入库',url:'TTMakeAsset.aspx'}}},rect10:{type:'task',text:{text:'供应商档案'}, attr:{ x:768, y:244, width:100, height:50}, props:{guid:{value:'e9763179-5c7f-b63e-3f28-27dc57403adc'},text:{value:'供应商档案',url:'TTMakeVendor.aspx'}}}},paths:{path11:{from:'rect3',to:'rect2', dots:[],text:{text:'TO 工作流管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 工作流管理'}}},path12:{from:'rect2',to:'rect4', dots:[],text:{text:'TO 合同管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 合同管理'}}},path13:{from:'rect4',to:'rect5', dots:[],text:{text:'TO 资产管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 资产管理'}}},path14:{from:'rect5',to:'rect6', dots:[],text:{text:'TO 会议管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 会议管理'}}},path15:{from:'rect6',to:'rect1', dots:[],text:{text:'TO 知识管理'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path16:{from:'rect7',to:'rect4', dots:[],text:{text:'TO 合同管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 合同管理'}}},path17:{from:'rect4',to:'rect8', dots:[],text:{text:'TO 合同收付款预警'},textPos:{x:0,y:-10}, props:{text:{value:'TO 合同收付款预警'}}},path19:{from:'rect10',to:'rect5', dots:[],text:{text:'TO 资产管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 资产管理'}}},path20:{from:'rect9',to:'rect5', dots:[],text:{text:'TO 资产管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 资产管理'}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
                SaveModuleFlowDefinition("操作导航", strMFXML, 3, "INNER");
            }

            if (strSystemProductType == "CRM")
            {
                strMFXML = @"{states:{rect1:{type:'task',text:{text:'工作流管理'}, attr:{ x:1033, y:114, width:100, height:50}, props:{guid:{value:'a7881a76-7a03-bbb7-acb5-a0b3c9798e5d'},text:{value:'工作流管理',url:'TTWLManage.aspx'}}},rect2:{type:'task',text:{text:'客户档案'}, attr:{ x:60, y:109, width:100, height:50}, props:{guid:{value:'3952c5e4-0d25-add9-8021-ad5f7f334d98'},text:{value:'客户档案',url:'TTMakeCustomer.aspx'}}},rect3:{type:'task',text:{text:'客户管理'}, attr:{ x:229, y:110, width:100, height:50}, props:{guid:{value:'f7543276-c8df-37e4-5e85-e1b37a22529a'},text:{value:'客户管理',url:'TTCustomerManagement.aspx'}}},rect4:{type:'task',text:{text:'记录客户需求'}, attr:{ x:394, y:111, width:100, height:50}, props:{guid:{value:'b72692cc-6050-cd8c-d6ad-151b700ce96a'},text:{value:'记录客户需求',url:'TTCustomerQuestionRecord.aspx'}}},rect5:{type:'task',text:{text:'客户服务'}, attr:{ x:566, y:110, width:100, height:50}, props:{guid:{value:'3f24ae23-e9e7-747f-a131-3226f27a8650'},text:{value:'客户服务',url:'TTCustomerQuestionManage.aspx'}}},rect6:{type:'task',text:{text:'直接成员客户服务'}, attr:{ x:719, y:20, width:100, height:50}, props:{guid:{value:'5be02d4d-4885-de29-ff36-af24bc36c22c'},text:{value:'直接成员客户服务',url:'TTMyMemberCustomerQuestions.aspx'}}},rect7:{type:'task',text:{text:'直接成员客户'}, attr:{ x:720, y:216, width:100, height:50}, props:{guid:{value:'623ae48d-2495-f612-6a49-69c00ad4dd8f'},text:{value:'直接成员客户',url:'TTMyMemberCustomers.aspx'}}},rect8:{type:'task',text:{text:'合同管理'}, attr:{ x:854, y:113, width:100, height:50}, props:{guid:{value:'d7b0d005-9fce-a047-8aec-b67aa39d69fd'},text:{value:'合同管理',url:'TTConstractManagement.aspx'}}},rect9:{type:'task',text:{text:'知识管理'}, attr:{ x:1208, y:114, width:100, height:50}, props:{guid:{value:'0f72603f-0b40-f129-608a-168a9284654e'},text:{value:'知识管理',url:'TTDocumentManage.aspx'}}}},paths:{path10:{from:'rect2',to:'rect3', dots:[],text:{text:'TO 客户管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 客户管理'}}},path11:{from:'rect3',to:'rect4', dots:[],text:{text:'TO 记录客户需求'},textPos:{x:0,y:-10}, props:{text:{value:'TO 记录客户需求'}}},path12:{from:'rect4',to:'rect5', dots:[],text:{text:'TO 客户服务'},textPos:{x:0,y:-10}, props:{text:{value:'TO 客户服务'}}},path13:{from:'rect5',to:'rect6', dots:[],text:{text:'TO 直接成员客户服务'},textPos:{x:0,y:-10}, props:{text:{value:'TO 直接成员客户服务'}}},path14:{from:'rect5',to:'rect7', dots:[],text:{text:'TO 直接成员客户'},textPos:{x:0,y:-10}, props:{text:{value:'TO 直接成员客户'}}},path15:{from:'rect5',to:'rect8', dots:[],text:{text:'TO 合同管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 合同管理'}}},path16:{from:'rect8',to:'rect1', dots:[],text:{text:'TO 工作流管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 工作流管理'}}},path17:{from:'rect1',to:'rect9', dots:[],text:{text:'TO 知识管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 知识管理'}}},path18:{from:'rect6',to:'rect8', dots:[],text:{text:'TO 合同管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 合同管理'}}},path19:{from:'rect7',to:'rect8', dots:[],text:{text:'TO 合同管理'},textPos:{x:0,y:-10}, props:{text:{value:''}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
                SaveModuleFlowDefinition("操作导航", strMFXML, 3, "INNER");
            }

            if (strSystemProductType.IndexOf("SAAS") > -1)
            {
                strMFXML = @"{states:{rect1:{type:'task',text:{text:'项目立项'}, attr:{ x:105, y:127, width:100, height:50}, props:{guid:{value:'02899d0f-472c-063f-f67e-c6b9d45c8d29'},text:{value:'项目立项',url:'TTMakeProject.aspx'}}},rect2:{type:'task',text:{text:'项目管理'}, attr:{ x:313, y:127, width:100, height:50}, props:{guid:{value:'5fe585ee-cf14-5681-46eb-e0f32e23b369'},text:{value:'项目管理',url:'TTProjectManageSAAS.aspx'}}},rect3:{type:'task',text:{text:'项目任务管理'}, attr:{ x:539, y:27, width:100, height:50}, props:{guid:{value:'e2637d3e-2cdb-2369-c06d-febd974c8af5'},text:{value:'项目任务管理',url:'TTProjectTaskManageMain.aspx'}}},rect4:{type:'task',text:{text:'收款明细汇总表'}, attr:{ x:952, y:26, width:100, height:50}, props:{guid:{value:'6f8c99c9-3fcd-297d-1fa8-19811a07312b'},text:{value:'收款明细汇总表',url:'TTAccountReceiveRecordSummarySAAS.aspx'}}},rect5:{type:'task',text:{text:'付款明细汇总表'}, attr:{ x:952, y:221, width:100, height:50}, props:{guid:{value:'5a1f8b2b-c6f3-ce0b-7604-f7a986a65be7'},text:{value:'付款明细汇总表',url:'TTAccountPayRecordSummarySAAS.aspx'}}},rect6:{type:'task',text:{text:'财务管理'}, attr:{ x:711, y:130, width:100, height:50}, props:{guid:{value:'a5861d1c-845e-3475-5fb0-c194c3325bbb'},text:{value:'财务管理',url:'TTReceivablesPayableAlert.aspx'}}},rect7:{type:'task',text:{text:'所有成员的项目'}, attr:{ x:1165, y:133, width:100, height:50}, props:{guid:{value:'1402c8e9-c44c-d59b-5f95-2448f73144ec'},text:{value:'所有成员的项目',url:'TTAllProject.aspx'}}},rect8:{type:'task',text:{text:'项目文档管理'}, attr:{ x:540, y:221, width:100, height:50}, props:{guid:{value:'4c9dcf45-06d3-a292-1516-57d02b2a61e0'},text:{value:'项目文档管理',url:'TTProjectDocManageMain.aspx'}}}},paths:{path9:{from:'rect1',to:'rect2', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path10:{from:'rect2',to:'rect3', dots:[],text:{text:'TO 项目任务管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目任务管理'}}},path11:{from:'rect6',to:'rect4', dots:[],text:{text:'TO 收款明细汇总表'},textPos:{x:0,y:-10}, props:{text:{value:'TO 收款明细汇总表'}}},path12:{from:'rect6',to:'rect5', dots:[],text:{text:'TO 付款明细汇总表'},textPos:{x:0,y:-10}, props:{text:{value:'TO 付款明细汇总表'}}},path13:{from:'rect2',to:'rect6', dots:[],text:{text:'TO 财务管理'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path14:{from:'rect2',to:'rect8', dots:[],text:{text:'TO 项目文档管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目文档管理'}}},path15:{from:'rect6',to:'rect7', dots:[],text:{text:'TO 所有成员的项目'},textPos:{x:0,y:-10}, props:{text:{value:''}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
                SaveModuleFlowDefinition("操作导航", strMFXML, 3, "INNER");
            }

            strMFXML = @"{states:{rect1:{type:'task',text:{text:'我的协作'}, attr:{ x:89, y:114, width:100, height:50}, props:{guid:{value:'9cf167e5-eaa0-2a0a-d046-f9b95f20a18f'},text:{value:'我的协作',url:'TTCollaborationManage.aspx'}}},rect2:{type:'task',text:{text:'我的流程'}, attr:{ x:292, y:114, width:100, height:50}, props:{guid:{value:'d453b354-38bd-d4f2-5bd2-d052ce6757d0'},text:{value:'我的流程',url:'TTWLManage.aspx'}}},rect3:{type:'task',text:{text:'项目管理'}, attr:{ x:486, y:116, width:100, height:50}, props:{guid:{value:'4d13368a-8662-46bb-2302-30f0ec9ab00b'},text:{value:'项目管理',url:'TTProjectManageOuter.aspx'}}},rect4:{type:'task',text:{text:'我的客服'}, attr:{ x:677, y:116, width:100, height:50}, props:{guid:{value:'97c25bff-5352-fc37-8ae7-cb421fcdf7cc'},text:{value:'我的客服',url:'TTCustomerQuestionManage.aspx'}}},rect5:{type:'task',text:{text:'我的缺陷'}, attr:{ x:386, y:225, width:100, height:50}, props:{guid:{value:'7bfb19b8-ba4b-9be7-9af6-a3037cd27a1c'},text:{value:'我的缺陷',url:'TTDefectHandlePageThirdPart.aspx'}}},rect6:{type:'task',text:{text:'我的需求'}, attr:{ x:583, y:223, width:100, height:50}, props:{guid:{value:'463cef82-59b2-a9ad-134c-3b446afe71a9'},text:{value:'我的需求',url:'TTReqHandlePageThirdPart.aspx'}}},rect7:{type:'task',text:{text:'我的考勤'}, attr:{ x:873, y:117, width:100, height:50}, props:{guid:{value:'c6ab08dc-af3e-84c8-b0d6-094f352580cc'},text:{value:'我的考勤',url:'TTUserAttendanceRecordForMe.aspx'}}},rect8:{type:'task',text:{text:'项目任务'}, attr:{ x:486, y:11, width:100, height:50}, props:{guid:{value:'907e7f31-cd94-309a-bdf6-95313362f7c1'},text:{value:'项目任务',url:'TTProjectTaskManageMain.aspx'}}}},paths:{path9:{from:'rect2',to:'rect3', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path10:{from:'rect3',to:'rect4', dots:[],text:{text:'TO 我的客服'},textPos:{x:0,y:-10}, props:{text:{value:'TO 我的客服'}}},path11:{from:'rect4',to:'rect7', dots:[],text:{text:'TO 我的考勤'},textPos:{x:0,y:-10}, props:{text:{value:'TO 我的考勤'}}},path12:{from:'rect6',to:'rect3', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path13:{from:'rect5',to:'rect3', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}},path14:{from:'rect1',to:'rect2', dots:[],text:{text:'TO 我的流程'},textPos:{x:0,y:-10}, props:{text:{value:''}}},path15:{from:'rect8',to:'rect3', dots:[],text:{text:'TO 项目管理'},textPos:{x:0,y:-10}, props:{text:{value:'TO 项目管理'}}}},props:{props:{name:{value:'新建流程'},key:{value:''},desc:{value:''}}}}";
            SaveModuleFlowDefinition("操作导航", strMFXML, 3, "OUTER");
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    //禁用实施阶段的基础数据删除功能
    public static void UpdateIsCanClearBaseData(string strUserCode, string strUserName)
    {
        string strHQL1, strHQL2;

        try
        {
            strHQL1 = "Select * from T_SystemDataManageForBeginer Where OperationName = 'ClearData'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "T_SystemDataManageForBeginer");
            if (ds.Tables[0].Rows.Count == 0)
            {
                strHQL2 = string.Format(@"Insert Into T_SystemDataManageForBeginer(OperationName,IsForbit,OperatorCode,OperatorName,Operatetime,IsBackup)
                      Values('{0}','{1}','{2}','{3}',now(),'YES')", "ClearData", "YES", strUserCode, strUserName);

                ShareClass.RunSqlCommand(strHQL2);
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }

    }

    //增加预警命令
    public static void AddEarlyWarningOrder(string strFunName)
    {
        string strHQL, strUpdateHQL;
        IList lst;

        try
        {
            strHQL = "From FunInforDialBox as funInforDialBox where funInforDialBox.InforName = '" + strFunName + "'";
            FunInforDialBoxBLL funInforDialBoxBLL = new FunInforDialBoxBLL();
            lst = funInforDialBoxBLL.GetAllFunInforDialBoxs(strHQL);

            if (lst.Count == 0)
            {
                FunInforDialBox funInforDialBox = new FunInforDialBox();

                strUpdateHQL = @"select * from T_DefectAssignRecord as defectAssignRecordBySystem where defectAssignRecordBySystem.OperatorCode = '[TAKETOPUSERCODE]' 
                    and defectAssignRecordBySystem.Status in ('计划','受理','待处理') and defectAssignRecordBySystem.ID not in (select defectAssignRecord.PriorID 
                    from T_DefectAssignRecord as defectAssignRecord) and defectAssignRecordBySystem.DefectID in 
                    (select defectment.DefectID from T_Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))
                    Order by defectAssignRecordBySystem.ID DESC";

                funInforDialBox.Status = "启用";
                funInforDialBox.SQLCode = strUpdateHQL;
                funInforDialBox.InforName = strFunName;
                funInforDialBox.HomeName = strFunName;
                funInforDialBox.LangCode = HttpContext.Current.Session["LangCode"].ToString();
                funInforDialBox.CreateTime = DateTime.Now;
                funInforDialBox.BoxType = "SYS";
                funInforDialBox.UserType = "INNER";
                funInforDialBox.IsForceInfor = "NO";
                funInforDialBox.LinkAddress = "TTDefectHandlePage.aspx";
                funInforDialBox.MobileLinkAddress = "TTDefectHandlePage.aspx";
                funInforDialBox.IsSendMsg = "YES";
                funInforDialBox.IsSendEmail = "YES";

                funInforDialBoxBLL.AddFunInforDialBox(funInforDialBox);
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }


    //初始化系统分析图
    public static void InitialSystemAnalystChart(string strToUserCode, string strFromUserCode)
    {
        string strHQL;

        try
        {
            strHQL = string.Format(@"Insert Into T_SystemAnalystChartRelatedUser
                 Select '{0}',ChartName,FormType,SortNumber From T_SystemAnalystChartRelatedUser
                 Where UserCode = '{1}' 
	             and ChartName Not in (Select ChartName From T_SystemAnalystChartRelatedUser Where UserCode = '{0}')", strToUserCode, strFromUserCode);
            ShareClass.RunSqlCommand(strHQL);

            strHQL = @"Delete From T_SystemAnalystChartRelatedUser Where ID Not In 
                  (Select Max(ID) From T_SystemAnalystChartRelatedUser Group By UserCode, ChartName, FormType)";
            ShareClass.RunSqlCommand(strHQL);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }


    //初始化模组的操作导航流程定义
    public static void SaveModuleFlowDefinition(string strModuleName, string strMFXML, int intUpdateMark, string strUserType)
    {
        string strHQL;
        IList lst;

        string strID;
        int i;

        try
        {
            if (GetProModuleUpdateMark(strModuleName, strUserType) != intUpdateMark)
            {
                ProModuleLevelBLL proModuleLevelBLL = new ProModuleLevelBLL();
                strHQL = string.Format(@"from ProModuleLevel as proModuleLevel where proModuleLevel.ModuleName = '{0}' and proModuleLevel.UserType ='{1}' and proModuleLevel.ModuleType = 'SYSTEM'", strModuleName, strUserType);
                lst = proModuleLevelBLL.GetAllProModuleLevels(strHQL);

                ProModuleLevel proModuleLevel;

                for (i = 0; i < lst.Count; i++)
                {
                    proModuleLevel = (ProModuleLevel)lst[i];

                    strID = proModuleLevel.ID.ToString();
                    proModuleLevel.ModuleDefinition = strMFXML;
                    proModuleLevelBLL.UpdateProModuleLevel(proModuleLevel, int.Parse(strID));
                }

                strHQL = string.Format(@"Update T_ProModuleLevel Set UpdateMark = {0} Where ModuleName = '{1}' and UserType ='{2}' and ModuleType = 'SYSTEM'", intUpdateMark, strModuleName, strUserType);
                ShareClass.RunSqlCommand(strHQL);


                //设置缓存更改标志，并刷新页面缓存
                ChangePageCache();
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    //设置缓存更改标志，并刷新页面缓存
    protected static void ChangePageCache()
    {
        //更新页面缓存，刷新页面
        ShareClass.AddSpaceLineToFile("TTPersonalSpaceModuleFlowView.aspx", "<%--***--%>");
        ShareClass.AddSpaceLineToFile("TTModuleFlowChartViewJS.aspx", "<%--***--%>");
        ShareClass.AddSpaceLineToFile("WFDesigner/TTTakeTopMFChartViewJS.aspx", "<%--***--%>");
    }


    //取得模组行更新标志
    protected static int GetProModuleUpdateMark(string strModuleName, string strUserType)
    {
        string strHQL;

        strHQL = string.Format(@"Select UpdateMark From T_ProModuleLevel Where ModuleName = '{0}' and UserType = '{1}'", strModuleName, strUserType);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return int.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    //取得系统员工数量
    public static int getUserNumber()
    {
        string strHQL1;

        strHQL1 = "Select * from T_ProjectMember limit 3";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "T_SystemDataManageForBeginer");

        return ds.Tables[0].Rows.Count;
    }

    //增加分析图给用户
    public static void AddChartToUser(string strUserCode)
    {
        string strHQL;

        if (GetUserChartNumber(strUserCode) == 0)
        {
            strHQL = string.Format(@"Insert Into t_systemanalystchartrelateduser(UserCode,ChartName,FormType,SortNumber) 
              Select '{0}',ChartName,FormType,SortNumber From t_systemanalystchartrelateduser 
                Where UserCode = 'ADMIN'", strUserCode);

            ShareClass.RunSqlCommand(strHQL);
        }
    }

    //取得用户分析图数量
    public static int GetUserChartNumber(string strUserCode)
    {
        string strHQL;

        strHQL = string.Format(@"Select * From t_systemanalystchartrelateduser
           Where UserCode = '{0}'", strUserCode);

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "t_systemanalystchartrelateduser");

        return ds.Tables[0].Rows.Count;
    }
}