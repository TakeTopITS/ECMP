using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 安全检查记录
    /// </summary>
    public class HSESafeInspectionRecord
    {
        public HSESafeInspectionRecord()
        {
        }

        private string code;
        private string name;
        private int projectId;
        private string projectName;
        private string status;
        private DateTime inspectionDate;
        private string headCode;
        private string projectManager;
        private string qESEngineer;
        private string inspectionTeamLeader;
        private string inspectorsCode;
        private string inspectionOverView;
        private string inspectContentFindings;

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

        public virtual int ProjectId
        {
            get { return projectId; }
            set { projectId = value; }
        }

        public virtual string ProjectName
        {
            get { return projectName; }
            set { projectName = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual DateTime InspectionDate
        {
            get { return inspectionDate; }
            set { inspectionDate = value; }
        }

        public virtual string HeadCode
        {
            get { return headCode; }
            set { headCode = value; }
        }

        public virtual string ProjectManager
        {
            get { return projectManager; }
            set { projectManager = value; }
        }

        public virtual string QESEngineer
        {
            get { return qESEngineer; }
            set { qESEngineer = value; }
        }

        public virtual string InspectionTeamLeader
        {
            get { return inspectionTeamLeader; }
            set { inspectionTeamLeader = value; }
        }

        public virtual string InspectorsCode
        {
            get { return inspectorsCode; }
            set { inspectorsCode = value; }
        }

        public virtual string InspectionOverView
        {
            get { return inspectionOverView; }
            set { inspectionOverView = value; }
        }

        public virtual string InspectContentFindings
        {
            get { return inspectContentFindings; }
            set { inspectContentFindings = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}