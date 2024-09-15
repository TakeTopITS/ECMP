using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 安全隐患整改通知
    /// </summary>
    public class HSERectificationNotice
    {
        public HSERectificationNotice()
        {
        }

        private string code;
        private string name;
        private string status;
        private string safeInspectId;
        private string safeInspectName;
        private string departCode;
        private DateTime inspectionDate;
        private string qESEngineerCode;
        private DateTime signDate1;
        private DateTime reqRecDate;
        private string projectManager;
        private DateTime signDate2;
        private string inspectors;
        private string rectificationOpinions;

        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string SafeInspectId
        {
            get { return safeInspectId; }
            set { safeInspectId = value; }
        }

        public virtual string SafeInspectName
        {
            get { return safeInspectName; }
            set { safeInspectName = value; }
        }

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual DateTime InspectionDate
        {
            get { return inspectionDate; }
            set { inspectionDate = value; }
        }

        public virtual string QESEngineerCode
        {
            get { return qESEngineerCode; }
            set { qESEngineerCode = value; }
        }

        public virtual DateTime SignDate1
        {
            get { return signDate1; }
            set { signDate1 = value; }
        }

        public virtual DateTime ReqRecDate
        {
            get { return reqRecDate; }
            set { reqRecDate = value; }
        }

        public virtual string ProjectManager
        {
            get { return projectManager; }
            set { projectManager = value; }
        }

        public virtual DateTime SignDate2
        {
            get { return signDate2; }
            set { signDate2 = value; }
        }

        public virtual string Inspectors
        {
            get { return inspectors; }
            set { inspectors = value; }
        }

        public virtual string RectificationOpinions
        {
            get { return rectificationOpinions; }
            set { rectificationOpinions = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}