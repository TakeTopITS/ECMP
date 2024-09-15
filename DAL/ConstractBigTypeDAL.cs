using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractBigTypeDAL
    {
        private EntityControl control;

        public ConstractBigTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractBigType(ConstractBigType constractBigType)
        {
            control.AddEntity(constractBigType);
        }

        public void UpdateConstractBigType(ConstractBigType constractBigType, string BigType)
        {
            control.UpdateEntity(constractBigType, BigType);
        }

        public void DeleteConstractBigType(ConstractBigType constractBigType)
        {
            control.DeleteEntity(constractBigType);
        }

        public IList GetAllConstractBigTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}