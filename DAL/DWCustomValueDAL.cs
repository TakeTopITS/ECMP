using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DWCustomValueDAL
    {
        private EntityControl control;

        public DWCustomValueDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDWCustomValue(DWCustomValue dWCustomValue)
        {
            control.AddEntity(dWCustomValue);
        }

        public void UpdateDWCustomValue(DWCustomValue dWCustomValue, int ID)
        {
            control.UpdateEntity(dWCustomValue, ID);
        }

        public void DeleteDWCustomValue(DWCustomValue dWCustomValue)
        {
            control.DeleteEntity(dWCustomValue);
        }

        public IList GetAllDWCustomValues(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}