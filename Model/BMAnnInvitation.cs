using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 招标公告/招标邀请函
    /// </summary>
    public class BMAnnInvitation
    {
        public BMAnnInvitation()
        {
        }

        private int id;

        /// <summary>
        /// 自增ID
        /// </summary>
        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string name;

        /// <summary>
        /// 招标公告/招标邀请函名称
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private int bidPlanID;

        /// <summary>
        /// 招标计划ID
        /// </summary>
        public virtual int BidPlanID
        {
            get { return bidPlanID; }
            set { bidPlanID = value; }
        }

        private string bidPlanName;

        /// <summary>
        /// 招标计划名称
        /// </summary>
        public virtual string BidPlanName
        {
            get { return bidPlanName; }
            set { bidPlanName = value; }
        }

        private string enterPer;

        /// <summary>
        /// 编制人
        /// </summary>
        public virtual string EnterPer
        {
            get { return enterPer; }
            set { enterPer = value; }
        }

        private string enterUnit;

        /// <summary>
        /// 编制单位
        /// </summary>
        public virtual string EnterUnit
        {
            get { return enterUnit; }
            set { enterUnit = value; }
        }

        private DateTime enterDate;

        /// <summary>
        /// 编制日期
        /// </summary>
        public virtual DateTime EnterDate
        {
            get { return enterDate; }
            set { enterDate = value; }
        }

        private string bidWay;

        /// <summary>
        /// 招标方式
        /// </summary>
        public virtual string BidWay
        {
            get { return bidWay; }
            set { bidWay = value; }
        }

        private string bidObjects;

        /// <summary>
        /// 投标对象 供应商编码列表
        /// </summary>
        public virtual string BidObjects
        {
            get { return bidObjects; }
            set { bidObjects = value; }
        }

        private string remark;

        /// <summary>
        /// 招标公告/招标邀请函内容
        /// </summary>
        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        private string enterCode;

        /// <summary>
        /// 编制人编码
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }

        private string phoneList;

        /// <summary>
        /// 附加短信通知人 手机号码 多个以“/”隔开
        /// </summary>
        public virtual string PhoneList
        {
            get { return phoneList; }
            set { phoneList = value; }
        }

        private string phoneRemark;

        /// <summary>
        /// 短信内容
        /// </summary>
        public virtual string PhoneRemark
        {
            get { return phoneRemark; }
            set { phoneRemark = value; }
        }

        //private string emailList;
        ///// <summary>
        ///// 附加邮件通知人 邮箱地址 多个以“/”隔开
        ///// </summary>
        //public virtual string EmailList
        //{
        //    get { return emailList; }
        //    set { emailList = value; }
        //}

        private string emailRemark;

        /// <summary>
        /// 邮件内容
        /// </summary>
        public virtual string EmailRemark
        {
            get { return emailRemark; }
            set { emailRemark = value; }
        }

        private string resRemark;

        /// <summary>
        /// 承包商响应说明
        /// </summary>
        public virtual string ResRemark
        {
            get { return resRemark; }
            set { resRemark = value; }
        }
    }
}