using System;
using System.Resources;
using System.Drawing;
using System.Data;

using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Xml;
using System.IO;
using System.Text;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopCore;

public partial class TTAPPGetUserPositionForIOSAndroid : System.Web.UI.Page
{
    public SignModel signModel;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode = Session["UserCode"].ToString();
        int i = 0;

        string strSystemVersionType = Session["SystemVersionType"].ToString();
        string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
        if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
        {
            Response.Redirect("TTAPPGetUserPositionForIOSAndroidSAAS.aspx");
        }

        bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //微信jssdk配置参数
        try
        {
            //扫码功能必须
            signModel = TakeTopCore.WXHelper.GetWXInfo(Request.Url.ToString());
            if (signModel != null)
            {
                if (signModel.appId == null)
                {
                    signModel.appId = "";
                }
            }
        }
        catch
        {
            signModel = new SignModel();
            signModel.appId = "";
        }

        if (Page.IsPostBack == false)
        {
            new System.Threading.Thread(delegate ()
            {
                try
                {
                    strHQL = "Insert Into T_UserAttendanceRule(UserCode,UserName,CreateDate,MCheckInStart,MCheckInEnd,MCheckOutStart,MCheckOutEnd,";
                    strHQL += "ACheckInStart,ACheckInEnd,ACheckOutStart,ACheckOutEnd,NCheckInStart,NCheckInEnd,NCheckOutStart,NCheckOutEnd,";
                    strHQL += "OCheckInStart,OCheckInEnd,OCheckOutStart,OCheckOutEnd,Status,MCheckInIsMust,MCheckOutIsMust,ACheckInIsMust,ACheckOutIsMust,NCheckInIsMust,NCheckOutIsMust,OCheckInIsMust,OCheckOutIsMust,LargestDistance,LeaderCode,LeaderName,OfficeLongitude,OfficeLatitude,Address)";
                    strHQL += " Select A.UserCode,A.UserName,now(),B.MCheckInStart,B.MCheckInEnd,B.MCheckOutStart,B.MCheckOutEnd,";
                    strHQL += "B.ACheckInStart,B.ACheckInEnd,B.ACheckOutStart,B.ACheckOutEnd,B.NCheckInStart,B.NCheckInEnd,B.NCheckOutStart,B.NCheckOutEnd,";
                    strHQL += "B.OCheckInStart,B.OCheckInEnd,B.OCheckOutStart,B.OCheckOutEnd,'处理中',B.MCheckInIsMust,B.MCheckOutIsMust,B.ACheckInIsMust,B.ACheckOutIsMust,B.NCheckInIsMust,B.NCheckOutIsMust,B.OCheckInIsMust,B.OCheckOutIsMust,B.LargestDistance,'','',B.OfficeLongitude,B.OfficeLatitude,B.Address";
                    strHQL += " From T_ProjectMember A, T_AttendanceRule B";
                    strHQL += " Where A.UserCode not in (Select UserCode From T_UserAttendanceRule) and A.Status not in ('离职','终止') ";
                    strHQL += " And A.UserCode = '" + strUserCode + "' limit 1";
                    ShareClass.RunSqlCommand(strHQL);
                }
                catch (Exception err)
                {
                    //LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                }

            }).Start();

            strHQL = "Select * From T_UserAttendanceRule Where UserCode = '" + strUserCode + "'";
            strHQL += " and Status = '在用'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserAttendanceRule");
            if (ds.Tables[0].Rows.Count > 0)
            {
                System.TimeSpan objT;
                double douMinutes;

                string strmcheckinend = DateTime.Now.ToString("yyyy-MM-dd") + " " + ds.Tables[0].Rows[0]["mcheckinend"].ToString().Trim();
                objT = DateTime.Now.Subtract(DateTime.Parse(strmcheckinend));
                douMinutes = objT.TotalMinutes;
                if (douMinutes < 0)
                {
                    douMinutes = 0 - douMinutes;
                }
                if (ds.Tables[0].Rows[0]["MCheckInIsMust"].ToString().Trim() == "YES" && douMinutes < 30)
                {
                    RBL_ShiftType.Items.Add(new ListItem(Resources.lang.ZaoBanShangBanShiJian, "上午上班时间"));
                    RBL_ShiftType.Items[0].Selected = true;
                }

                string strmcheckoutend = DateTime.Now.ToString("yyyy-MM-dd") + " " + ds.Tables[0].Rows[0]["mcheckoutend"].ToString().Trim();
                objT = DateTime.Now.Subtract(DateTime.Parse(strmcheckoutend));
                douMinutes = objT.TotalMinutes;
                if (douMinutes < 0)
                {
                    douMinutes = 0 - douMinutes;
                }
                if (ds.Tables[0].Rows[0]["MCheckOutIsMust"].ToString().Trim() == "YES" && douMinutes < 30)
                {
                    RBL_ShiftType.Items.Add(new ListItem(Resources.lang.ZaoBanXiaBanShiJian, "上午下班时间"));
                    RBL_ShiftType.Items[0].Selected = true;
                }


                string stracheckinend = DateTime.Now.ToString("yyyy-MM-dd") + " " + ds.Tables[0].Rows[0]["acheckinend"].ToString().Trim();
                objT = DateTime.Now.Subtract(DateTime.Parse(stracheckinend));
                douMinutes = objT.TotalMinutes;
                if (douMinutes < 0)
                {
                    douMinutes = 0 - douMinutes;
                }
                if (ds.Tables[0].Rows[0]["ACheckInIsMust"].ToString().Trim() == "YES" && douMinutes < 30)
                {
                    RBL_ShiftType.Items.Add(new ListItem(Resources.lang.ZhongBanShangBanShiJian, "下午上班时间"));
                    RBL_ShiftType.Items[0].Selected = true;
                }

                string stracheckoutend = DateTime.Now.ToString("yyyy-MM-dd") + " " + ds.Tables[0].Rows[0]["acheckoutend"].ToString().Trim();
                objT = DateTime.Now.Subtract(DateTime.Parse(stracheckoutend));
                douMinutes = objT.TotalMinutes;
                if (douMinutes < 0)
                {
                    douMinutes = 0 - douMinutes;
                }
                if (ds.Tables[0].Rows[0]["ACheckOutIsMust"].ToString().Trim() == "YES" && douMinutes < 30)
                {
                    RBL_ShiftType.Items.Add(new ListItem(Resources.lang.ZhongBanXiaBanShiJian, "下午下班时间"));
                    RBL_ShiftType.Items[0].Selected = true;
                }

                string strncheckinend = DateTime.Now.ToString("yyyy-MM-dd") + " " + ds.Tables[0].Rows[0]["ncheckinend"].ToString().Trim();
                objT = DateTime.Now.Subtract(DateTime.Parse(strncheckinend));
                douMinutes = objT.TotalMinutes;
                if (douMinutes < 0)
                {
                    douMinutes = 0 - douMinutes;
                }
                if (ds.Tables[0].Rows[0]["NCheckInIsMust"].ToString().Trim() == "YES" && douMinutes < 30)
                {
                    RBL_ShiftType.Items.Add(new ListItem(Resources.lang.WanBanShangBanShiJian, "晚班上班时间"));
                    RBL_ShiftType.Items[0].Selected = true;
                }

                string strncheckoutend = DateTime.Now.ToString("yyyy-MM-dd") + " " + ds.Tables[0].Rows[0]["ncheckoutend"].ToString().Trim();
                objT = DateTime.Now.Subtract(DateTime.Parse(strncheckoutend));
                douMinutes = objT.TotalMinutes;
                if (douMinutes < 0)
                {
                    douMinutes = 0 - douMinutes;
                }
                if (ds.Tables[0].Rows[0]["NCheckOutIsMust"].ToString().Trim() == "YES" && douMinutes < 30)
                {
                    RBL_ShiftType.Items.Add(new ListItem(Resources.lang.WanBanXiaBanShiJian, "晚班下班时间"));
                    RBL_ShiftType.Items[0].Selected = true;
                }

                string strocheckinend = DateTime.Now.ToString("yyyy-MM-dd") + " " + ds.Tables[0].Rows[0]["ocheckinend"].ToString().Trim();
                objT = DateTime.Now.Subtract(DateTime.Parse(strocheckinend));
                douMinutes = objT.TotalMinutes;
                if (douMinutes < 0)
                {
                    douMinutes = 0 - douMinutes;
                }
                if (ds.Tables[0].Rows[0]["OCheckInIsMust"].ToString().Trim() == "YES" && douMinutes < 30)
                {
                    RBL_ShiftType.Items.Add(new ListItem(Resources.lang.JiaBanShangBanShiJian, "午夜上班时间"));
                    RBL_ShiftType.Items[0].Selected = true;
                }

                string strocheckoutend = DateTime.Now.ToString("yyyy-MM-dd") + " " + ds.Tables[0].Rows[0]["ocheckoutend"].ToString().Trim();
                objT = DateTime.Now.Subtract(DateTime.Parse(strocheckoutend));
                douMinutes = objT.TotalMinutes;
                if (douMinutes < 0)
                {
                    douMinutes = 0 - douMinutes;
                }
                if (ds.Tables[0].Rows[0]["OCheckOutIsMust"].ToString().Trim() == "YES" && douMinutes < 30)
                {
                    RBL_ShiftType.Items.Add(new ListItem(Resources.lang.JiaBanXiaBanShiJian, "午夜下班时间"));
                    RBL_ShiftType.Items[0].Selected = true;
                }

                if (RBL_ShiftType.Items.Count == 0)
                {
                    BT_Attendance.Enabled = false;
                }
            }
            else
            {
                BT_Attendance.Enabled = false;
            }

        }
    }

    protected void BT_SavePosition_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strUserCode, strUserName;
        string strJingDu, strWeiDu, strAddress, strMacAddress, strShiftType;

        strUserCode = Session["UserCode"].ToString();
        strJingDu = LNG_value.Value;
        strWeiDu = LAT_value.Value;

        strAddress = GetAddressByBAIDU(strJingDu, strWeiDu);
        strUserName = ShareClass.GetUserName(strUserCode);
        strMacAddress = HttpContext.Current.Request.UserHostAddress;

        strShiftType = "";

        new System.Threading.Thread(delegate ()
        {
            strHQL = "Insert Into T_UserPositionByGPS(UserCode,UserName,Longitude,Latitude,Address,MacAddress,CreateTime,ShiftType,LeaderCode,LeaderName)";
            strHQL += " Values('" + strUserCode + "','" + strUserName + "','" + strJingDu + "','" + strWeiDu + "','" + strAddress + "','" + strMacAddress + "',now(),'" + strShiftType + "','','')";
            ShareClass.RunSqlCommand(strHQL);

        }).Start();

        ClientScript.RegisterStartupScript(this.GetType(), "5555", "<script>alert('OK');</script>");
    }

    protected void BT_Attendance_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strUserCode, strUserName;
        string strJingDu, strWeiDu, strAddress, strMacAddress, strShiftType, strDeviceID;
        double deLongitude, deLatitude;
        double deJingDu, deWeiDu, deDistance = 0;

        if (Session["DeviceID"] == null)
        {
            strDeviceID = "";
        }
        else
        {
            strDeviceID = Session["DeviceID"].ToString();
        }


        strUserCode = Session["UserCode"].ToString();
        strJingDu = LNG_value.Value;
        strWeiDu = LAT_value.Value;

        strAddress = GetAddressByBAIDU(strJingDu, strWeiDu);
        strUserName = ShareClass.GetUserName(strUserCode);
        strMacAddress = HttpContext.Current.Request.UserHostAddress;

        strShiftType = RBL_ShiftType.SelectedValue;

        try
        {

            deJingDu = double.Parse(strJingDu);
            deWeiDu = double.Parse(strWeiDu);
        }
        catch
        {
            deJingDu = 0;
            deWeiDu = 0;
        }

        try
        {
            deLongitude = double.Parse(GetUserAttendanceRuleLongitude(strUserCode));
            deLatitude = double.Parse(GetUserAttendanceRuleOfficeLatitude(strUserCode));
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

            deLongitude = 0;
            deLatitude = 0;
        }


        new System.Threading.Thread(delegate ()
        {
            if (deLongitude != 0 & deJingDu != 0)
            {
                deDistance = ShareClass.CoordDispose.GetDistance(new ShareClass.Degree(deLongitude, deLatitude), new ShareClass.Degree(deJingDu, deWeiDu));


                strHQL = "Insert Into T_UserPositionByGPS(UserCode,UserName,Longitude,Latitude,Address,Distance,MacAddress,CreateTime,ShiftType,DeviceID,LeaderCode,LeaderName)";
                strHQL += " Values('" + strUserCode + "','" + strUserName + "','" + strJingDu + "','" + strWeiDu + "','" + strAddress + "'," + deDistance.ToString() + ",'" + strMacAddress + "',now(),'" + strShiftType + "','" + strDeviceID + "','','')";
                ShareClass.RunSqlCommand(strHQL);


            }
            else
            {
                strHQL = "Insert Into T_UserPositionByGPS(UserCode,UserName,Longitude,Latitude,Address,Distance,MacAddress,CreateTime,ShiftType,DeviceID,LeaderCode,LeaderName)";
                strHQL += " Values('" + strUserCode + "','" + strUserName + "','" + strJingDu + "','" + strWeiDu + "','" + strAddress + "',0,'" + strMacAddress + "',now(),'" + strShiftType + "','" + strDeviceID + "','','')";
                ShareClass.RunSqlCommand(strHQL);
            }

        }).Start();

        try
        {
            if (!string.IsNullOrEmpty(strShiftType))
            {

                new System.Threading.Thread(delegate ()
                {
                    CreateUserAttendanceRule(strUserCode, deLongitude.ToString(), deLatitude.ToString());
                    CreateAttendanceRecord(strUserCode, deLongitude.ToString(), deLatitude.ToString());
                    UpdateUserAttendanceRecord(strUserCode, strAddress, deJingDu.ToString(), deWeiDu.ToString(), deDistance);

                    try
                    {
                        new System.Threading.Thread(delegate ()
                        {
                            //更改加班签到时间，前后不超过60分钟
                            UpdateOvertimeCheckTime(strUserCode);

                        }).Start();
                    }
                    catch (Exception err)
                    {
                        //LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                    }

                }).Start();

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "333", "<script>alert('" + Resources.lang.ZZQXZBCLX + "');</script>");
                return;
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

            ClientScript.RegisterStartupScript(this.GetType(), "222", "<script>alert('" + err.Message.ToString() + "');</script>");
        }

        ClientScript.RegisterStartupScript(this.GetType(), "111", "<script>alert('OK');</script>");
    }

    //更改加班签到时间，前后不超过60分钟
    protected void UpdateOvertimeCheckTime(string strUserCode)
    {
        string strHQL;

        int intStartMinute, intEndMinute;

        intStartMinute = getCurrentOverTimeStartTime(strUserCode);
        intEndMinute = getCurrentOverTimeEndTime(strUserCode);

        if (intStartMinute < 60 & intStartMinute != -1)
        {
            strHQL = "Update T_OvertimeApplyForm Set OverTimeCheckInTime = now() Where to_char(StartTime,'yyyymmdd') = to_char(now(),'yyyymmdd') and  Creator = '" + strUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);
        }

        if ((intEndMinute < 60 || intEndMinute == 1) & intEndMinute != -1)
        {
            strHQL = "Update T_OvertimeApplyForm Set OverTimeCheckOutTime = now() Where to_char(EndTime,'yyyymmdd') = to_char(now(),'yyyymmdd') and  Creator = '" + strUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            int intID = getPreDayOvertimeID(strUserCode);
            if (intID != -1)
            {
                strHQL = "Update T_OvertimeApplyForm Set OverTimeCheckOutTime = EndTime Where  ID = " + intID.ToString();
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Update T_OvertimeApplyForm Set OverTimeCheckInTime = StartTime Where to_char(EndTime,'yyyymmdd') = to_char(now(),'yyyymmdd') and  Creator = '" + strUserCode + "'";
                ShareClass.RunSqlCommand(strHQL);
            }
        }
    }


    protected int getCurrentOverTimeStartTime(string strUserCode)
    {
        string strHQL;
        DateTime dtOvertimeStartTime;

        try
        {
            strHQL = "Select StartTime From T_OvertimeApplyForm Where to_char(StartTime,'yyyymmdd') = to_char(now(),'yyyymmdd') and  Creator = '" + strUserCode + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_OvertimeApplyForm");
            if (ds.Tables[0].Rows.Count > 0)
            {
                dtOvertimeStartTime = DateTime.Parse(ds.Tables[0].Rows[0]["StartTime"].ToString());

                return int.Parse(Math.Round(DateTime.Now.Subtract(dtOvertimeStartTime).TotalMinutes).ToString());
            }
            else
            {
                return -1;
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            return -1;
        }
    }

    protected int getCurrentOverTimeEndTime(string strUserCode)
    {
        string strHQL;
        DateTime dtOvertimeEndTime, dtOvertimeStartTime;


        try
        {
            strHQL = "Select StartTime, EndTime From T_OvertimeApplyForm Where to_char(EndTime,'yyyymmdd') = to_char(now(),'yyyymmdd') and Creator = '" + strUserCode + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_OvertimeApplyForm");
            if (ds.Tables[0].Rows.Count > 0)
            {
                dtOvertimeStartTime = DateTime.Parse(ds.Tables[0].Rows[0]["StartTime"].ToString());
                dtOvertimeEndTime = DateTime.Parse(ds.Tables[0].Rows[0]["EndTime"].ToString());

                if (dtOvertimeEndTime >= DateTime.Now & dtOvertimeStartTime < DateTime.Now)
                {
                    return 1;
                }
                else
                {
                    return int.Parse(Math.Round(DateTime.Now.Subtract(dtOvertimeEndTime).TotalMinutes).ToString());
                }
            }
            else
            {
                return -1;
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            return -1;
        }
    }

    //取得前一天晚上的加班申请 ID 号
    protected int getPreDayOvertimeID(string strUserCode)
    {
        string strHQL1, strHQL2;
        DateTime dtOvertimeEndTime, dtOvertimeStartTime, dtPreOvertimeEndTime;

        DataSet ds1, ds2;
        int intID;

        try
        {
            strHQL1 = "Select StartTime, EndTime From T_OvertimeApplyForm Where to_char(EndTime,'yyyymmdd') = to_char(now(),'yyyymmdd') and Creator = '" + strUserCode + "'";
            ds1 = ShareClass.GetDataSetFromSql(strHQL1, "T_OvertimeApplyForm");
            if (ds1.Tables[0].Rows.Count > 0)
            {
                dtOvertimeStartTime = DateTime.Parse(ds1.Tables[0].Rows[0]["StartTime"].ToString());
                dtOvertimeEndTime = DateTime.Parse(ds1.Tables[0].Rows[0]["EndTime"].ToString());

                strHQL2 = "Select ID,EndTime From T_OvertimeApplyForm Where to_char(EndTime,'yyyymmdd') = to_char(now()-'1 day'::interval),'yyyymmdd') and Creator = '" + strUserCode + "' Order By EndTime DESC";
                ds2 = ShareClass.GetDataSetFromSql(strHQL1, "T_OvertimeApplyForm");
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    intID = int.Parse(ds2.Tables[0].Rows[0]["ID"].ToString());
                    dtPreOvertimeEndTime = DateTime.Parse(ds2.Tables[0].Rows[0]["EndTime"].ToString());

                    if (dtPreOvertimeEndTime.Subtract(dtOvertimeStartTime).TotalMinutes <= 10)
                    {
                        return intID;
                    }
                    else
                    {
                        return -1;
                    }
                }
                else
                {
                    return -1;
                }
            }
            else
            {
                return -11;
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            return -1;
        }
    }



    //取得员工考勤规则的经度
    protected string GetUserAttendanceRuleLongitude(string strUserCode)
    {
        string strHQL;

        strHQL = "Select OfficeLongitude From T_UserAttendanceRule Where UserCode = '" + strUserCode + "' and Status = '在用'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserAttendanceRule");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }

    //取得员工考勤规则的纬度
    protected string GetUserAttendanceRuleOfficeLatitude(string strUserCode)
    {
        string strHQL;

        strHQL = "Select OfficeLatitude From T_UserAttendanceRule Where UserCode = '" + strUserCode + "' and Status = '在用'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserAttendanceRule");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }

    protected void CreateUserAttendanceRule(string strUserCode, string strLongitude, string strLatitude)
    {
        string strHQL;

        strHQL = "Insert Into T_UserAttendanceRule(UserCode,UserName,CreateDate,MCheckInStart,MCheckInEnd,MCheckOutStart,MCheckOutEnd,";
        strHQL += "ACheckInStart,ACheckInEnd,ACheckOutStart,ACheckOutEnd,NCheckInStart,NCheckInEnd,NCheckOutStart,NCheckOutEnd,";
        strHQL += "OCheckInStart,OCheckInEnd,OCheckOutStart,OCheckOutEnd,Status,MCheckInIsMust,MCheckOutIsMust,ACheckInIsMust,ACheckOutIsMust,NCheckInIsMust,NCheckOutIsMust,OCheckInIsMust,OCheckOutIsMust,LargestDistance,LeaderCode,LeaderName,OfficeLongitude,OfficeLatitude,Address)";
        strHQL += " Select A.UserCode,A.UserName,now(),B.MCheckInStart,B.MCheckInEnd,B.MCheckOutStart,B.MCheckOutEnd,";
        strHQL += "B.ACheckInStart,B.ACheckInEnd,B.ACheckOutStart,B.ACheckOutEnd,B.NCheckInStart,B.NCheckInEnd,B.NCheckOutStart,B.NCheckOutEnd,";
        strHQL += "B.OCheckInStart,B.OCheckInEnd,B.OCheckOutStart,B.OCheckOutEnd,'处理中',B.MCheckInIsMust,B.MCheckOutIsMust,B.ACheckInIsMust,B.ACheckOutIsMust,B.NCheckInIsMust,B.NCheckOutIsMust,B.OCheckInIsMust,B.OCheckOutIsMust,B.LargestDistance,'','','" + strLongitude + "','" + strLatitude + "',B.Address";
        strHQL += " From T_ProjectMember A, T_AttendanceRule B";
        strHQL += " Where A.UserCode not in (Select UserCode From T_UserAttendanceRule) and A.Status not in ('离职','终止') ";
        strHQL += " and A.UserCode = " + "'" + strUserCode + "' limit 1";

        try
        {
            ShareClass.RunSqlCommand(strHQL);
        }
        catch (Exception err)
        {
            //LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSCHENGSBQJC + "');</script>");
        }
    }

    protected void CreateAttendanceRecord(string strUserCode, string strLongitude, string strLatitude)
    {
        string strHQL;

        string strAttendanceDate3;


        strAttendanceDate3 = DateTime.Parse(DateTime.Now.ToString()).ToString("yyyyMMdd");

        strHQL = "Insert Into T_UserAttendanceRecord(UserCode,UserName,AttendanceDate,MCheckIn,MCheckOut,";
        strHQL += "ACheckIn,ACheckOut,NCheckIn,NCheckOut,OCheckIn,OCheckOut,LateMinute,EarlyMinute,MCheckInIsMust,MCheckOutIsMust,ACheckInIsMust,ACheckOutIsMust,NCheckInIsMust,NCheckOutIsMust,OCheckInIsMust,OCheckOutIsMust,LargestDistance,LeaderCode,LeaderName,OfficeLongitude,OfficeLatitude)";
        strHQL += " Select A.UserCode,A.UserName,now(),('" + strAttendanceDate3 + " ' || B.MCheckInEnd || ':00.000')::timestamp ,('" + strAttendanceDate3 + " ' ||B.MCheckOutEnd || ':00.000')::timestamp,";
        strHQL += "('" + strAttendanceDate3 + " '|| B.ACheckInEnd || ':00.000')::timestamp,('" + strAttendanceDate3 + " ' ||B.ACheckOutEnd || ':00.000')::timestamp,('" + strAttendanceDate3 + " '|| B.NCheckInEnd || ':00.000')::timestamp,('" + strAttendanceDate3 + " '|| B.NCheckOutEnd || ':00.000')::timestamp,";
        strHQL += " ('" + strAttendanceDate3 + " '|| B.OCheckInEnd || ':00.000')::timestamp + '1 day'::interval,('" + strAttendanceDate3 + " '||B.OCheckOutEnd || ':00.000')::timestamp + '1 day'::interval,0,0,B.MCheckInIsMust,B.MCheckOutIsMust,B.ACheckInIsMust,B.ACheckOutIsMust,B.NCheckInIsMust,B.NCheckOutIsMust,B.OCheckInIsMust,B.OCheckOutIsMust,B.LargestDistance,B.LeaderCode,B.LeaderName,'" + strLongitude + "','" + strLatitude + "'";
        strHQL += " From T_ProjectMember A, T_UserAttendanceRule B";
        strHQL += " Where A.UserCode = B.UserCode and A.UserCode not in (Select UserCode From T_UserAttendanceRecord Where to_char(AttendanceDate,'yyyymmdd') = " + "'" + strAttendanceDate3 + "'" + ") and A.Status not in ('离职','终止') ";
        strHQL += " and A.UserCode = " + "'" + strUserCode + "'";
        strHQL += " and B.Status = '在用' ";

        try
        {
            ShareClass.RunSqlCommand(strHQL);
        }
        catch (Exception err)
        {
            //LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    protected void UpdateUserAttendanceRecord(string strUserCode, string strAddress, string strLongitude, string strLatitude, double deDistance)
    {
        string strHQL;
        IList lst;

        string strID;
        string strUserName;
        string strShiftType;

        string strAttendanceDate;


        strAttendanceDate = DateTime.Parse(DateTime.Now.ToString()).ToString("yyyyMMdd");

        strUserName = ShareClass.GetUserName(strUserCode);

        strShiftType = RBL_ShiftType.SelectedValue.Trim();

        strHQL = "From UserAttendanceRecord as userAttendanceRecord Where userAttendanceRecord.UserCode = " + "'" + strUserCode + "'" + " and to_char( userAttendanceRecord.AttendanceDate, 'yyyymmdd') = " + "'" + strAttendanceDate + "'";
        UserAttendanceRecordBLL userAttendanceRecordBLL = new UserAttendanceRecordBLL();
        lst = userAttendanceRecordBLL.GetAllUserAttendanceRecords(strHQL);
        UserAttendanceRecord userAttendanceRecord = (UserAttendanceRecord)lst[0];

        try
        {
            strID = userAttendanceRecord.ID.ToString();

            if (strShiftType == "上午上班时间")
            {
                //userAttendanceRecord.MCheckIn = DateTime.Now;

                strHQL = "Update T_UserAttendanceRecord Set MCheckIn = now(),MCheckInAddress = '" + strAddress + "',MCheckInLongitude = '" + strLongitude + "',MCheckInLatitude = '" + strLatitude + "',MCheckInDistance = " + deDistance.ToString() + " Where ID = " + strID;

            }
            if (strShiftType == "上午下班时间")
            {
                //userAttendanceRecord.MCheckOut = DateTime.Now;

                strHQL = "Update T_UserAttendanceRecord Set MCheckOut = now(),MCheckOutAddress = '" + strAddress + "',MCheckOutLongitude = '" + strLongitude + "',MCheckOutLatitude = '" + strLatitude + "',MCheckOutDistance = " + deDistance.ToString() + " Where ID = " + strID;

            }
            if (strShiftType == "下午上班时间")
            {
                //userAttendanceRecord.ACheckIn = DateTime.Now;

                strHQL = "Update T_UserAttendanceRecord Set ACheckIn = now(),ACheckInAddress = '" + strAddress + "',ACheckInLongitude = '" + strLongitude + "',ACheckInLatitude = '" + strLatitude + "',ACheckInDistance = " + deDistance.ToString() + " Where ID = " + strID;

            }
            if (strShiftType == "下午下班时间")
            {
                //userAttendanceRecord.ACheckOut = DateTime.Now;

                strHQL = "Update T_UserAttendanceRecord Set ACheckOut = now(),ACheckOutAddress = '" + strAddress + "',ACheckOutLongitude = '" + strLongitude + "',ACheckOutLatitude = '" + strLatitude + "',ACheckOutDistance = " + deDistance.ToString() + " Where ID = " + strID;

            }
            if (strShiftType == "晚班上班时间")
            {
                //userAttendanceRecord.NCheckIn = DateTime.Now;

                strHQL = "Update T_UserAttendanceRecord Set NCheckIn = now(),NCheckInAddress = '" + strAddress + "',NCheckInLongitude = '" + strLongitude + "',NCheckInLatitude = '" + strLatitude + "',NCheckInDistance = " + deDistance.ToString() + " Where ID = " + strID;

            }
            if (strShiftType == "晚班下班时间")
            {
                //userAttendanceRecord.NCheckOut = DateTime.Now;

                strHQL = "Update T_UserAttendanceRecord Set NCheckOut = now(),NCheckOutAddress = '" + strAddress + "',NCheckOutLongitude = '" + strLongitude + "',NCheckOutLatitude = '" + strLatitude + "',NCheckOutDistance = " + deDistance.ToString() + " Where ID = " + strID;

            }
            if (strShiftType == "午夜上班时间")
            {
                //userAttendanceRecord.OCheckIn = DateTime.Now;

                strHQL = "Update T_UserAttendanceRecord Set OCheckIn = now(),OCheckInAddress = '" + strAddress + "',OCheckInLongitude = '" + strLongitude + "',OCheckInLatitude = '" + strLatitude + "',OCheckInDistance = " + deDistance.ToString() + " Where ID = " + strID;

            }
            if (strShiftType == "午夜下班时间")
            {
                //userAttendanceRecord.OCheckIn = DateTime.Now;

                strHQL = "Update T_UserAttendanceRecord Set OCheckOut = now(),OCheckOutAddress = '" + strAddress + "',OCheckOutLongitude = '" + strLongitude + "',OCheckOutLatitude = '" + strLatitude + "',OCheckOutDistance = " + deDistance.ToString() + " Where ID = " + strID;

            }

            //userAttendanceRecordBLL.UpdateUserAttendanceRecord(userAttendanceRecord, int.Parse(strID));

            ShareClass.RunSqlCommand(strHQL);

            UpdateLateMinute(strID);
            UpdateEarlyMinute(strID);

            //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

        }
        catch
        {
            //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXGSBJC + "')", true);
        }
    }

    protected void UpdateLateMinute(string strID)
    {
        string strHQL;
        int intSumLateMinute, intMLateMinute = 0, intALateMinute = 0, intNLateMinute = 0, intOLateMinute = 0;

        DataSet ds;

        strHQL = " select extract(epoch FROM (A.MCheckIn-(to_char(A.MCheckIn,'yyyymmdd') || ' ' || rtrim(ltrim(B.MCheckInEnd)) ||':00.000')::timestamp))/60";
        strHQL += " From T_UserAttendanceRecord A,T_userAttendanceRule B ";
        strHQL += " Where A.UserCode = B.UserCode and A.ID = " + strID + " and B.Status = '处理中'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_LateMinute");

        if (ds.Tables[0].Rows.Count > 0)
        {
            intMLateMinute = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (intMLateMinute < 0)
            {
                intMLateMinute = 0;
            }
        }

        strHQL = " Select extract(epoch FROM (A.ACheckIn-(to_char(A.ACheckIn,'yyyymmdd') || ' ' || rtrim(ltrim(B.ACheckInEnd)) ||':00.000')::timestamp))/60";
        strHQL += " From T_UserAttendanceRecord A,T_userAttendanceRule B ";
        strHQL += " Where A.UserCode = B.UserCode and A.ID = " + strID + " and B.Status = '处理中'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_LateMinute");

        if (ds.Tables[0].Rows.Count > 0)
        {
            intALateMinute = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (intALateMinute < 0)
            {
                intALateMinute = 0;
            }
        }

        strHQL = " Select extract(epoch FROM (A.NCheckIn-(to_char(A.NCheckIn,'yyyymmdd') || ' ' || rtrim(ltrim(B.NCheckInEnd)) ||':00.000')::timestamp))/60";
        strHQL += " From T_UserAttendanceRecord A,T_userAttendanceRule B ";
        strHQL += " Where A.UserCode = B.UserCode and A.ID = " + strID + " and B.Status = '处理中'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_LateMinute");

        if (ds.Tables[0].Rows.Count > 0)
        {
            intNLateMinute = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (intNLateMinute < 0)
            {
                intNLateMinute = 0;
            }
        }


        strHQL = " Select extract(epoch FROM (A.OCheckIn-(to_char(A.OCheckIn,'yyyymmdd') || ' ' || rtrim(ltrim(B.OCheckInEnd)) ||':00.000')::timestamp))/60";
        strHQL += " From T_UserAttendanceRecord A,T_userAttendanceRule B ";
        strHQL += " Where A.UserCode = B.UserCode and A.ID = " + strID + " and B.Status = '处理中'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_LateMinute");

        if (ds.Tables[0].Rows.Count > 0)
        {
            intOLateMinute = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (intOLateMinute < 0)
            {
                intOLateMinute = 0;
            }
        }

        intSumLateMinute = intMLateMinute + intALateMinute + intNLateMinute + intOLateMinute;

        strHQL = "Update T_UserAttendanceRecord Set LateMinute = " + intSumLateMinute.ToString() + " Where ID = " + strID;

        ShareClass.RunSqlCommand(strHQL);
    }

    protected void UpdateEarlyMinute(string strID)
    {
        string strHQL;
        int intSumEarlyMinute, intMEarlyMinute = 0, intAEarlyMinute = 0, intNEarlyMinute = 0, intOEarlyMinute = 0;
        DataSet ds;

        strHQL = " Select extract(epoch FROM ((to_char(A.MCheckOut,'yyyymmdd') || ' ' || rtrim(ltrim(B.MCheckOutStart)) ||':00.000')::timestamp)-A.MCheckOut)/60";
        strHQL += " From T_UserAttendanceRecord A,T_userAttendanceRule B ";
        strHQL += " Where A.UserCode = B.UserCode and A.ID = " + strID + " and B.Status = '处理中'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_EarlyMinute");

        if (ds.Tables[0].Rows.Count > 0)
        {
            intMEarlyMinute = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (intMEarlyMinute < 0)
            {
                intMEarlyMinute = 0;
            }
        }

        strHQL = " Select extract(epoch FROM ((to_char(A.ACheckOut,'yyyymmdd') || ' ' || rtrim(ltrim(B.ACheckOutStart)) ||':00.000')::timestamp)-A.ACheckOut)/60";
        strHQL += " From T_UserAttendanceRecord A,T_userAttendanceRule B ";
        strHQL += " Where A.UserCode = B.UserCode and A.ID = " + strID + " and B.Status = '处理中'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_EarlyMinute");

        if (ds.Tables[0].Rows.Count > 0)
        {
            intAEarlyMinute = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            LB_Sql.Text = intAEarlyMinute.ToString();

            if (intAEarlyMinute < 0)
            {
                intAEarlyMinute = 0;
            }
        }

        strHQL = " Select extract(epoch FROM ((to_char(A.NCheckOut,'yyyymmdd') || ' ' || rtrim(ltrim(B.NCheckOutStart)) ||':00.000')::timestamp)-A.NCheckOut)/60";
        strHQL += " From T_UserAttendanceRecord A,T_userAttendanceRule B ";
        strHQL += " Where A.UserCode = B.UserCode and A.ID = " + strID + " and B.Status = '处理中'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_EarlyMinute");

        if (ds.Tables[0].Rows.Count > 0)
        {
            intNEarlyMinute = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (intNEarlyMinute < 0)
            {
                intNEarlyMinute = 0;
            }

        }

        strHQL = " Select extract(epoch FROM ((to_char(A.OCheckOut,'yyyymmdd') || ' ' || rtrim(ltrim(B.OCheckOutStart)) ||':00.000')::timestamp)-A.OCheckOut)/60";
        strHQL += " From T_UserAttendanceRecord A,T_userAttendanceRule B ";
        strHQL += " Where A.UserCode = B.UserCode and A.ID = " + strID + " and B.Status = '处理中'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_EarlyMinute");

        if (ds.Tables[0].Rows.Count > 0)
        {
            intOEarlyMinute = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (intOEarlyMinute < 0)
            {
                intOEarlyMinute = 0;
            }
        }

        intSumEarlyMinute = intMEarlyMinute + intAEarlyMinute + intNEarlyMinute + intOEarlyMinute;

        strHQL = "Update T_UserAttendanceRecord Set EarlyMinute = " + intSumEarlyMinute.ToString() + " Where ID = " + strID;

        ShareClass.RunSqlCommand(strHQL);
    }

    private string GetAddressByBAIDU(string lng, string lat)
    {
        try
        {
            string url = @"http://api.map.baidu.com/geocoder/v2/?ak=r3oHIq6zgkF3BU9cXlgIQuMu&location=" + lat + "," + lng + @"&output=xml&pois=1";

            WebRequest request = WebRequest.Create(url);
            request.Method = "POST";
            XmlDocument xmlDoc = new XmlDocument();
            string sendData = xmlDoc.InnerXml;
            byte[] byteArray = Encoding.Default.GetBytes(sendData);

            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);
            dataStream.Close();

            WebResponse response = request.GetResponse();
            dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream, System.Text.Encoding.GetEncoding("utf-8"));
            string responseXml = reader.ReadToEnd();

            XmlDocument xml = new XmlDocument();
            xml.LoadXml(responseXml);
            string status = xml.DocumentElement.SelectSingleNode("status").InnerText;
            if (status == "0")
            {

                XmlNodeList nodes = xml.DocumentElement.GetElementsByTagName("formatted_address");
                if (nodes.Count > 0)
                {
                    return nodes[0].InnerText;
                }
                else
                    return "Can not get position information,error code 3";
            }
            else
            {
                return "Can not get position information,error code 1";
            }
        }
        catch (System.Exception ex)
        {
            return "Can not get position information,error code 2";
        }
    }

    private string GetAddressByGOOGLE(string lng, string lat)
    {
        try
        {
            //webclient客户端对象 
            WebClient client = new WebClient();
            string url = "http://maps.google.com/maps/api/geocode/xml?latlng=" + lng + "," + lat + "&language=zh-CN&sensor=false";//请求地址 
            client.Encoding = Encoding.UTF8;//编码格式 
            string responseTest = client.DownloadString(url);
            //下载xml响应数据 
            string address = "";//返回的地址 
            XmlDocument doc = new XmlDocument();
            //创建XML文档对象 
            if (!string.IsNullOrEmpty(responseTest))
            {
                doc.LoadXml(responseTest);//加载xml字符串 
                //查询状态信息 
                string xpath = @"GeocodeResponse/status";
                XmlNode node = doc.SelectSingleNode(xpath);
                string status = node.InnerText.ToString();
                if (status == "OK")
                {
                    //查询详细地址信息 
                    xpath = @"GeocodeResponse/result/formatted_address";
                    node = doc.SelectSingleNode(xpath);
                    address = node.InnerText.ToString();
                    //查询地区信息 
                    XmlNodeList nodeListAll = doc.SelectNodes("GeocodeResponse/result");

                    XmlNode idt = nodeListAll[0];
                    XmlNodeList idts = idt.SelectNodes("address_component[type='sublocality']");
                    //address_component[type='sublocality']表示筛选type='sublocality'的所有相关子节点； 
                    XmlNode idtst = idts[0];

                    string area = idtst.SelectSingleNode("short_name").InnerText;
                    address = address + "," + area;

                    return address;
                }
                else
                {
                    return "Can not get position information,error code 2";
                }
            }
            else
            {
                return "Can not get position information,error code 2";
            }
        }
        catch (System.Exception ex)
        {
            return "Can not get position information,error code 2";
        }
    }



}