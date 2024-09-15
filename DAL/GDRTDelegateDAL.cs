using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDRTDelegateDAL
    {
        private EntityControl control;

        public GDRTDelegateDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDRTDelegate(GDRTDelegate gDRTDelegate)
        {
            control.AddEntity(gDRTDelegate);
        }

        public void UpdateGDRTDelegate(GDRTDelegate gDRTDelegate, int ID)
        {
            control.UpdateEntity(gDRTDelegate, ID);
        }

        public void DeleteGDRTDelegate(GDRTDelegate gDRTDelegate)
        {
            control.DeleteEntity(gDRTDelegate);
        }

        public IList GetAllGDRTDelegates(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}