using System;

namespace ProjectMgt.Model
{
    public class GoodsDeliveryOrder
    {
        public GoodsDeliveryOrder()
        {
        }

        private int doID;
        private string doName;
        private DateTime deliveryTime;
        private DateTime arrivalTime;
        private string invoiceHead;
        private string receiverName;
        private string purchaseName;
        private string purchasePhone;
        private string carTeam;
        private string driver;
        private string carCode;
        private decimal amount;
        private string currencyType;
        private string operatorCode;
        private string operatorName;
        private string relatedType;
        private int relatedID;
        private string comment;
        private string status;

        public virtual int DOID
        {
            get { return doID; }
            set { doID = value; }
        }

        public virtual string DOName
        {
            get { return doName; }
            set { doName = value; }
        }

        public virtual DateTime DeliveryTime
        {
            get { return deliveryTime; }
            set { deliveryTime = value; }
        }

        public virtual DateTime ArrivalTime
        {
            get { return arrivalTime; }
            set { arrivalTime = value; }
        }

        public virtual string InvoiceHead
        {
            get { return invoiceHead; }
            set { invoiceHead = value; }
        }

        public virtual string ReceiverName
        {
            get { return receiverName; }
            set { receiverName = value; }
        }

        public virtual decimal Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual string PurchaseName
        {
            get { return purchaseName; }
            set { purchaseName = value; }
        }

        public virtual string PurchasePhone
        {
            get { return purchasePhone; }
            set { purchasePhone = value; }
        }

        public virtual string CarTeam
        {
            get { return carTeam; }
            set { carTeam = value; }
        }

        public virtual string Driver
        {
            get { return driver; }
            set { driver = value; }
        }

        public virtual string CarCode
        {
            get { return carCode; }
            set { carCode = value; }
        }

        public virtual string OperatorCode
        {
            get { return operatorCode; }
            set { operatorCode = value; }
        }

        public virtual string OperatorName
        {
            get { return operatorName; }
            set { operatorName = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}