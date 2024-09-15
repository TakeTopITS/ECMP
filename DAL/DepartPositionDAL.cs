using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DepartPositionDAL
    {
        private EntityControl control;

        public DepartPositionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDepartPosition(DepartPosition departPosition)
        {
            control.AddEntity(departPosition);
        }

        public void UpdateDepartPosition(DepartPosition departPosition, int ID)
        {
            control.UpdateEntity(departPosition, ID);
        }

        public void DeleteDepartPosition(DepartPosition departPosition)
        {
            control.DeleteEntity(departPosition);
        }

        public IList GetAllDepartPositions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}