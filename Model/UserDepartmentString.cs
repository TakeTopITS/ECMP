namespace ProjectMgt.Model
{
    public class UserDepartmentString
    {
        public UserDepartmentString()
        {
        }

        public virtual string UserCode
        {
            get; set;
        }

        public virtual string ParentDepartmentString
        {
            get; set;
        }

        public virtual string UnderDepartmentString
        {
            get; set;
        }
    }
}
