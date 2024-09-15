namespace ProjectMgt.Model
{
    public class BusinessFormReAndPay
    {
        public BusinessFormReAndPay()
        {
        }

        private string formCode;
        private string formName;
        private string receiveOrPay;
        private string relatedAccountCode;
        private string relatedAccount;

        public virtual string FormCode
        {
            get { return formCode; }
            set { formCode = value; }
        }

        public virtual string FormName
        {
            get { return formName; }
            set { formName = value; }
        }

        public virtual string ReceiveOrPay
        {
            get { return receiveOrPay; }
            set { receiveOrPay = value; }
        }

        public virtual string RelatedAccountCode
        {
            get { return relatedAccountCode; }
            set { relatedAccountCode = value; }
        }

        public virtual string RelatedAccount
        {
            get { return relatedAccount; }
            set { relatedAccount = value; }
        }
    }
}