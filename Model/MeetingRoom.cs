namespace ProjectMgt.Model
{
    public class MeetingRoom
    {
        public MeetingRoom()
        {
        }

        private int id;
        private string roomName;
        private string roomPosition;
        private int accommodateCount;
        private string note;
        private string belongDepartCode;
        private string belongDepartName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string RoomName
        {
            get { return roomName; }
            set { roomName = value; }
        }

        public virtual string RoomPosition
        {
            get { return roomPosition; }
            set { roomPosition = value; }
        }

        public virtual int AccommodateCount
        {
            get { return accommodateCount; }
            set { accommodateCount = value; }
        }

        public virtual string Note
        {
            get { return note; }
            set { note = value; }
        }

        public virtual string BelongDepartCode
        {
            get { return belongDepartCode; }
            set { belongDepartCode = value; }
        }

        public virtual string BelongDepartName
        {
            get { return belongDepartName; }
            set { belongDepartName = value; }
        }
    }
}