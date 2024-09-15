namespace ProjectMgt.Model
{
    public class WZCompactCheck
    {
        public WZCompactCheck()
        {
        }

        public virtual int ID { get; set; }
        public virtual string CompactCode { get; set; }	//合同编号
        public virtual string PlanCode { get; set; }	//计划编号
        public virtual string ProjectCode { get; set; }	//项目编码
        public virtual string ProjectName { get; set; }	//项目名称
        public virtual string SupplierCode { get; set; }	//供方编号
        public virtual string SupplierName { get; set; }	//供方名称
        public virtual string ObjectCode { get; set; }	//物资代码
        public virtual string ObjectName { get; set; }	//物资名称
        public virtual string Model { get; set; }	//规格型号
        public virtual string Criterion { get; set; }	//标准
        public virtual string Grade { get; set; }	//级别
        public virtual int Unit { get; set; }	//计量单位
        public virtual decimal CompactNumber { get; set; }	//合同数量
        public virtual string ArrivalGoodsName { get; set; }	//到货名称
        public virtual string ArrivalGoodsModel { get; set; }	//到货规格型号
        public virtual decimal ArrivalGoodsNumber { get; set; }	//到货数量
        public virtual string Factory { get; set; }	//生产厂家
        public virtual string BatchNo { get; set; }	//炉批号
        public virtual string ExecutionStandard { get; set; }	//执行标准
        public virtual string DeliveryStatus { get; set; }	//交货状态
        public virtual string CheckCode { get; set; }	//检号
        public virtual string Checker { get; set; }	//材检员
        public virtual string CheckerDate { get; set; }	//材检日期
        public virtual string CheckDocument { get; set; }	//材检资料
        public virtual string CheckDocumentURL { get; set; }
        public virtual string ReinspectionRecord { get; set; }	//复验记录
        public virtual string ReinspectionRecordURL { get; set; }
        public virtual string Remark { get; set; }	//备注
        public virtual string Progress { get; set; }	//进度

        public virtual int CompactDetailID { get; set; }
    }
}