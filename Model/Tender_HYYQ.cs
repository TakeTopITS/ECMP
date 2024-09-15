namespace ProjectMgt.Model
{
    public class Tender_HYYQ
    {
        public virtual int id { get; set; }
        public virtual string TenderCode { get; set; }
        public virtual string ProjectName { get; set; }
        public virtual string CompactCode { get; set; }
        public virtual string BiddingAgent { get; set; }
        public virtual string BiddingAgentPhone { get; set; }
        public virtual string UserCode { get; set; }
        public virtual string UserCodePhone { get; set; }
        public virtual string SalesCode { get; set; }
        public virtual string SalesCodePhone { get; set; }
        public virtual string TenderBuyTime { get; set; }
        public virtual int TenderBuyDay { get; set; }
        public virtual int IsTender { get; set; }
        public virtual decimal Margin { get; set; }
        public virtual string MarginTime { get; set; }
        public virtual int MarginDay { get; set; }
        public virtual int IsMargin { get; set; }

        public virtual decimal ReceiveMargin { get; set; }
        public virtual string ReceiveMarginTime { get; set; }
        public virtual int ReceiveMarginDay { get; set; }
        public virtual int IsReceiveMargin { get; set; }

        public virtual string BidOpeningDate { get; set; }
        public virtual int BidOpeningDay { get; set; }
        public virtual int IsBidOpening { get; set; }
        public virtual string WinningFeeDate { get; set; }
        public virtual int WinningFeeDay { get; set; }
        public virtual int IsWinningFee { get; set; }
        public virtual string TenderContent { get; set; }
        public virtual string Remarks { get; set; }
        public virtual string Progress { get; set; }
        public virtual string CreatorCode { get; set; }
        public virtual string CreatorName { get; set; }

        public virtual decimal WorkCost { get; set; }
        public virtual decimal AgencyCost { get; set; }
        public virtual string TenderStatus { get; set; }


        //public virtual string Tenderer { get; set; }
        public virtual string PMCode { get; set; }
        public virtual string PMName { get; set; }
        public virtual string TechnicalDirectorCode { get; set; }
        public virtual string TechnicalDirectorName { get; set; }
        public virtual string PrincipalCode { get; set; }
        public virtual string PrincipalName { get; set; }
        public virtual string InternalAndExternal { get; set; }

        public virtual decimal BiddingPrice { get; set; }
        public virtual decimal ControlPrice { get; set; }


    }
}