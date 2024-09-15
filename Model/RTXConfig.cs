namespace ProjectMgt.Model
{
    public class RTXConfig
    {
        public RTXConfig()
        {
        }

        private string serverIP;
        private int serverPort;
        private string webSite;

        public virtual string ServerIP
        {
            get { return serverIP; }
            set { serverIP = value; }
        }

        public virtual int ServerPort
        {
            get { return serverPort; }
            set { serverPort = value; }
        }

        public virtual string WebSite
        {
            get { return webSite; }
            set { webSite = value; }
        }
    }
}