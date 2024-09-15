using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZCompactDetailDAL
    {
        private EntityControl control;

        public WZCompactDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZCompactDetail(WZCompactDetail wZCompactDetail)
        {
            control.AddEntity(wZCompactDetail);
        }

        public void UpdateWZCompactDetail(WZCompactDetail wZCompactDetail, int ID)
        {
            control.UpdateEntity(wZCompactDetail, ID);
        }

        public void DeleteWZCompactDetail(WZCompactDetail wZCompactDetail)
        {
            control.DeleteEntity(wZCompactDetail);
        }

        public IList GetAllWZCompactDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}