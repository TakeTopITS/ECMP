namespace ProjectMgt.Model
{
    public class DayHourNum
    {
        public DayHourNum()
        {
        }

        private int id;
        private decimal hourNum;
        private string startTime;
        private string endTime;
        private string restStartTime;
        private string restEndTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual decimal HourNum
        {
            get { return hourNum; }
            set { hourNum = value; }
        }

        public virtual string StartTime
        {
            get { return startTime; }
            set { startTime = value; }
        }

        public virtual string EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }

        public virtual string RestStartTime
        {
            get { return restStartTime; }
            set { restStartTime = value; }
        }

        public virtual string RestEndTime
        {
            get { return restEndTime; }
            set { restEndTime = value; }
        }
    }
}