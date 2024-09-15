namespace ProjectMgt.Model
{
    public class WZCompactDetail
    {
        public WZCompactDetail()
        {
        }

        public virtual int ID { get; set; }
        public virtual string CompactCode { get; set; }
        public virtual int PlanDetailID { get; set; }
        public virtual string ObjectCode { get; set; }
        public virtual string StandardCode { get; set; }
        public virtual string Factory { get; set; }
        public virtual string Remark { get; set; }
        public virtual decimal CompactNumber { get; set; }
        public virtual decimal CompactPrice { get; set; }
        public virtual decimal CompactMoney { get; set; }
        public virtual string CheckCode { get; set; }
        public virtual decimal CollectNumber { get; set; }
        public virtual decimal CollectMoney { get; set; }
        public virtual int IsMark { get; set; }
        public virtual int IsPrint { get; set; }
        public virtual int PurchaseDetailID { get; set; }

        public virtual string ObjectName { get; set; }             //物资名称
        public virtual string Model { get; set; }             //规格型号
        public virtual string Grade { get; set; }             //级别
        public virtual string Criterion { get; set; }             //标准
        public virtual int Unit { get; set; }             //计量单位
        public virtual int IsCheck { get; set; }             //材检标志
    }
}