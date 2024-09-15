using System;

namespace ProjectMgt.Model
{
    public class SmsSend
    {
        public SmsSend()
        {
        }

        private int id;
        private string mobile;
        private string msg;
        private int state;
        private int sendYorn;
        private DateTime sendTime;
        private string userRTXCode;
        private int rtxState;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Mobile
        {
            get { return mobile; }
            set { mobile = value; }
        }

        public virtual string Msg
        {
            get { return msg; }
            set { msg = value; }
        }

        public virtual int State
        {
            get { return state; }
            set { state = value; }
        }

        public virtual int SendYorn
        {
            get { return sendYorn; }
            set { sendYorn = value; }
        }

        public virtual DateTime SendTime
        {
            get { return sendTime; }
            set { sendTime = value; }
        }

        public virtual string UserRTXCode
        {
            get { return userRTXCode; }
            set { userRTXCode = value; }
        }

        public virtual int RTXState
        {
            get { return rtxState; }
            set { rtxState = value; }
        }
    }
}