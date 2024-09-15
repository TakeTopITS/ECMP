namespace ProjectMgt.Model
{
    public class VendorRelatedGoodsInfor
    {
        public VendorRelatedGoodsInfor()
        {
        }

        private int id;
        private string vendorCode;
        private string type;
        private string goodsCode;
        private string goodsName;
        private string modelNumber;
        private string spec;
        private decimal number;
        private string unit;
        private decimal price;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string VendorCode
        {
            get { return vendorCode; }
            set { vendorCode = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string GoodsCode
        {
            get { return goodsCode; }
            set { goodsCode = value; }
        }

        public virtual string GoodsName
        {
            get { return goodsName; }
            set { goodsName = value; }
        }

        public virtual string ModelNumber
        {
            get { return modelNumber; }
            set { modelNumber = value; }
        }

        public virtual string Spec
        {
            get { return spec; }
            set { spec = value; }
        }

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual string Unit
        {
            get { return unit; }
            set { unit = value; }
        }

        public virtual decimal Price
        {
            get { return price; }
            set { price = value; }
        }
        public virtual string Brand
        {
            get; set;
        }
    }
}