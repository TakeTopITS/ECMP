namespace ProjectMgt.Model
{
    public class ProjectDataLink
    {
        public ProjectDataLink()
        {
        }

        private string code;
        private string host;
        private string dataBaseName;
        private string loginNo;
        private string passWord;

        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string Host
        {
            get { return host; }
            set { host = value; }
        }

        public virtual string DataBaseName
        {
            get { return dataBaseName; }
            set { dataBaseName = value; }
        }

        public virtual string LoginNo
        {
            get { return loginNo; }
            set { loginNo = value; }
        }

        public virtual string PassWord
        {
            get { return passWord; }
            set { passWord = value; }
        }
    }
}