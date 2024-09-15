namespace ProjectMgt.Model
{
    public class MailProfile
    {
        public MailProfile()
        {
        }

        private int webMailID;
        private string userCode;
        private string userName;
        private string aliasName;
        private string email;
        private string password;
        private string smtpServerIP;
        private int smtpServerPort;
        private string pop3ServerIP;
        private int pop3ServerPort;

        private string enablePOP3SSL;

        private string enableSMPTSSL;

        public virtual int WebMailID
        {
            get { return webMailID; }
            set { webMailID = value; }
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

        public virtual string AliasName
        {
            get { return aliasName; }
            set { aliasName = value; }
        }

        public virtual string Email
        {
            get { return email; }
            set { email = value; }
        }

        public virtual string Password
        {
            get { return password; }
            set { password = value; }
        }

        public virtual string SmtpServerIP
        {
            get { return smtpServerIP; }
            set { smtpServerIP = value; }
        }

        public virtual int SmtpServerPort
        {
            get { return smtpServerPort; }
            set { smtpServerPort = value; }
        }

        public virtual string Pop3ServerIP
        {
            get { return pop3ServerIP; }
            set { pop3ServerIP = value; }
        }

        public virtual int Pop3ServerPort
        {
            get { return pop3ServerPort; }
            set { pop3ServerPort = value; }
        }

        public virtual string EnablePOP3SSL
        {
            get { return enablePOP3SSL; }
            set { enablePOP3SSL = value; }
        }

        public virtual string EnableSMTPSSL
        {
            get { return enableSMPTSSL; }
            set { enableSMPTSSL = value; }
        }
    }
}