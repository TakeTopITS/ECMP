using System;

namespace ProjectMgt.Model
{
    public class HSEMeeting
    {
        public HSEMeeting()
        {
        }

        private string code;

        /// <summary>
        /// 格式 HSEMTGX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        private string name;

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private int projectId;

        public virtual int ProjectId
        {
            get { return projectId; }
            set { projectId = value; }
        }

        private string projectName;

        public virtual string ProjectName
        {
            get { return projectName; }
            set { projectName = value; }
        }

        private string meetingPlace;

        public virtual string MeetingPlace
        {
            get { return meetingPlace; }
            set { meetingPlace = value; }
        }

        private DateTime meetingDate;

        public virtual DateTime MeetingDate
        {
            get { return meetingDate; }
            set { meetingDate = value; }
        }

        private string hoster;

        public virtual string Hoster
        {
            get { return hoster; }
            set { hoster = value; }
        }

        private string departCode;

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        private string departName;

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        private DateTime startTime;

        public virtual DateTime StartTime
        {
            get { return startTime; }
            set { startTime = value; }
        }

        private DateTime endTime;

        public virtual DateTime EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }

        private string summaryType;

        public virtual string SummaryType
        {
            get { return summaryType; }
            set { summaryType = value; }
        }

        private string summaryContent;

        public virtual string SummaryContent
        {
            get { return summaryContent; }
            set { summaryContent = value; }
        }

        private string participants;

        public virtual string Participants
        {
            get { return participants; }
            set { participants = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}