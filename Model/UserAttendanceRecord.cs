using System;

namespace ProjectMgt.Model
{
    public class UserAttendanceRecord
    {
        public UserAttendanceRecord()
        {
        }

        private int id;
        private string userCode;
        private string userName;

        private DateTime attendanceDate;

        private DateTime mCheckIn;

        private DateTime mCheckOut;

        private DateTime aCheckIn;

        private DateTime aCheckOut;

        private DateTime nCheckIn;

        private DateTime nCheckOut;

        private DateTime oCheckIn;

        private DateTime oCheckOut;

        private int lateMinute;

        private int earlyMinute;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
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

        public virtual DateTime AttendanceDate
        {
            get { return attendanceDate; }
            set { attendanceDate = value; }
        }

        public virtual DateTime MCheckIn
        {
            get { return mCheckIn; }
            set { mCheckIn = value; }
        }

        public virtual DateTime MCheckOut
        {
            get { return mCheckOut; }
            set { mCheckOut = value; }
        }

        public virtual DateTime ACheckIn
        {
            get { return aCheckIn; }
            set { aCheckIn = value; }
        }

        public virtual DateTime ACheckOut
        {
            get { return aCheckOut; }
            set { aCheckOut = value; }
        }

        public virtual DateTime NCheckIn
        {
            get { return nCheckIn; }
            set { nCheckIn = value; }
        }

        public virtual DateTime NCheckOut
        {
            get { return nCheckOut; }
            set { nCheckOut = value; }
        }

        public virtual DateTime OCheckIn
        {
            get { return oCheckIn; }
            set { oCheckIn = value; }
        }

        public virtual DateTime OCheckOut
        {
            get { return oCheckOut; }
            set { oCheckOut = value; }
        }

        public virtual int LateMinute
        {
            get { return lateMinute; }
            set { lateMinute = value; }
        }

        public virtual int EarlyMinute
        {
            get { return earlyMinute; }
            set { earlyMinute = value; }
        }

        public virtual decimal MCheckInDistance
        {
            get;
            set;
        }

        public virtual decimal MCheckOutDistance
        {
            get;
            set;
        }

        public virtual decimal ACheckInDistance
        {
            get;
            set;
        }

        public virtual decimal ACheckOutDistance
        {
            get;
            set;
        }

        public virtual decimal NCheckInDistance
        {
            get;
            set;
        }

        public virtual decimal NCheckOutDistance
        {
            get;
            set;
        }

        public virtual decimal OCheckInDistance
        {
            get;
            set;
        }

        public virtual decimal OCheckOutDistance
        {
            get;
            set;
        }

        public virtual string LeaderCode
        {
            get;
            set;
        }

        public virtual string LeaderName
        {
            get;
            set;
        }

        public virtual string OfficeLongitude
        {
            get;
            set;
        }

        public virtual string OfficeLatitude
        {
            get;
            set;
        }
    }
}