namespace ProjectMgt.Model
{
    public class MeetingAttendant
    {
        public MeetingAttendant()
        {
        }

        private int id;
        private int meetingID;
        private string userCode;
        private string userName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int MeetingID
        {
            get { return meetingID; }
            set { meetingID = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }
    }
}