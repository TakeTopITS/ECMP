using System;

namespace ProjectMgt.Model
{
    public class DWCustomValue
    {
        public DWCustomValue()
        {
        }

        public virtual int ID { get; set; }
        public virtual string CustomName { get; set; }
        public virtual string ProductName { get; set; }
        public virtual string ProductCode { get; set; }
        public virtual string ProductType { get; set; }
        public virtual DateTime SaleTime { get; set; }
        public virtual decimal SaleNumber { get; set; }
        public virtual decimal SalePrice { get; set; }
        public virtual decimal SaleMoney { get; set; }
        public virtual decimal ProductCost { get; set; }
        public virtual decimal MakeCost { get; set; }
        public virtual decimal TonCost { get; set; }
        public virtual decimal PickCost { get; set; }
        public virtual decimal QualityCost { get; set; }
        public virtual decimal TransportCost { get; set; }
        public virtual decimal AccountCost { get; set; }
        public virtual decimal ServeCost { get; set; }
        public virtual decimal TravelCost { get; set; }
        public virtual string Applyer { get; set; }
        public virtual decimal SalesmanWages { get; set; }
        public virtual decimal SurplusValue { get; set; }
        public virtual string YearMonth { get; set; }
    }
}