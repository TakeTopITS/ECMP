namespace ProjectMgt.Model
{
    /// <summary>
    /// 项目文控类型
    /// </summary>
    public class ProDocGraphControl
    {
        public ProDocGraphControl()
        {
        }

        private int id;
        private string parentName;
        private string classificationName;
        private int sortNo;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ParentName
        {
            get { return parentName; }
            set { parentName = value; }
        }

        public virtual string ClassificationName
        {
            get { return classificationName; }
            set { classificationName = value; }
        }

        public virtual int SortNo
        {
            get { return sortNo; }
            set { sortNo = value; }
        }
    }
}