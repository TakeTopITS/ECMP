using System;

namespace ProjectMgt.Model
{
    public class UserAttendanceRule
    {
        public UserAttendanceRule()
        {
        }

        private int id;
        private string userCode;
        private string userName;

        private DateTime createDate;

        private string mCheckInStart;
        private string mCheckInEnd;
        private string mCheckOutStart;
        private string mCheckOutEnd;

        private string aCheckInStart;
        private string aCheckInEnd;
        private string aCheckOutStart;
        private string aCheckOutEnd;

        private string nCheckInStart;
        private string nCheckInEnd;
        private string nCheckOutStart;
        private string nCheckOutEnd;

        private string oCheckInStart;
        private string oCheckInEnd;
        private string oCheckOutStart;
        private string oCheckOutEnd;

        private string status;

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

        public virtual DateTime CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }

        public virtual string MCheckInStart
        {
            get { return mCheckInStart; }
            set { mCheckInStart = value; }
        }

        public virtual string MCheckInEnd
        {
            get { return mCheckInEnd; }
            set { mCheckInEnd = value; }
        }

        public virtual string MCheckOutStart
        {
            get { return mCheckOutStart; }
            set { mCheckOutStart = value; }
        }

        public virtual string MCheckOutEnd
        {
            get { return mCheckOutEnd; }
            set { mCheckOutEnd = value; }
        }

        public virtual string ACheckInStart
        {
            get { return aCheckInStart; }
            set { aCheckInStart = value; }
        }

        public virtual string ACheckInEnd
        {
            get { return aCheckInEnd; }
            set { aCheckInEnd = value; }
        }

        public virtual string ACheckOutStart
        {
            get { return aCheckOutStart; }
            set { aCheckOutStart = value; }
        }

        public virtual string ACheckOutEnd
        {
            get { return aCheckOutEnd; }
            set { aCheckOutEnd = value; }
        }

        public virtual string NCheckInStart
        {
            get { return nCheckInStart; }
            set { nCheckInStart = value; }
        }

        public virtual string NCheckInEnd
        {
            get { return nCheckInEnd; }
            set { nCheckInEnd = value; }
        }

        public virtual string NCheckOutStart
        {
            get { return nCheckOutStart; }
            set { nCheckOutStart = value; }
        }

        public virtual string NCheckOutEnd
        {
            get { return nCheckOutEnd; }
            set { nCheckOutEnd = value; }
        }

        public virtual string OCheckInStart
        {
            get { return oCheckInStart; }
            set { oCheckInStart = value; }
        }

        public virtual string OCheckInEnd
        {
            get { return oCheckInEnd; }
            set { oCheckInEnd = value; }
        }

        public virtual string OCheckOutStart
        {
            get { return oCheckOutStart; }
            set { oCheckOutStart = value; }
        }

        public virtual string OCheckOutEnd
        {
            get { return oCheckOutEnd; }
            set { oCheckOutEnd = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string MCheckInIsMust
        {
            set;
            get;
        }

        public virtual string MCheckOutIsMust
        {
            set;
            get;
        }

        public virtual string ACheckInIsMust
        {
            set;
            get;
        }

        public virtual string ACheckOutIsMust
        {
            set;
            get;
        }

        public virtual string NCheckInIsMust
        {
            set;
            get;
        }

        public virtual string NCheckOutIsMust
        {
            set;
            get;
        }

        public virtual string OCheckInIsMust
        {
            set;
            get;
        }

        public virtual string OCheckOutIsMust
        {
            set;
            get;
        }

        public virtual decimal LargestDistance
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

        public virtual string Address
        {
            get;
            set;
        }
    }
}