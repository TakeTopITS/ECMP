namespace ProjectMgt.Model
{
    public class WeiXinStand
    {
        public WeiXinStand()
        {
        }

        private string weiXinNo;
        private string passWord;
        //private string tokenValue;

        private string status;

        public virtual string WeiXinNo
        {
            get { return weiXinNo; }
            set { weiXinNo = value; }
        }

        public virtual string PassWord
        {
            get { return passWord; }
            set { passWord = value; }
        }

        //public virtual string TokenValue
        //{
        //    get { return tokenValue; }
        //    set { tokenValue = value; }
        //}
        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}