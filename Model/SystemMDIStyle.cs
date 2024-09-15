namespace ProjectMgt.Model
{
    public class SystemMDIStyle
    {
        public SystemMDIStyle()
        {
        }

        private string mdiStyle;
        private string pageName;
        private string mobilePageName;
        private string thirdPartPageName;
        private string thirdPartMobilePageName;
        private int sortNumber;

        public virtual string MDIStyle
        {
            get { return mdiStyle; }
            set { mdiStyle = value; }
        }

        public virtual string PageName
        {
            get { return pageName; }
            set { pageName = value; }
        }

        public virtual string MobilePageName
        {
            get { return mobilePageName; }
            set { mobilePageName = value; }
        }

        public virtual string ThirdPartPageName
        {
            get { return thirdPartPageName; }
            set { thirdPartPageName = value; }
        }

        public virtual string ThirdPartMobilePageName
        {
            get { return thirdPartMobilePageName; }
            set { thirdPartMobilePageName = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}