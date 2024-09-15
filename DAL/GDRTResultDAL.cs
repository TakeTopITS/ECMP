using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDRTResultDAL
    {
        private EntityControl control;

        public GDRTResultDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDRTResult(GDRTResult gDRTResult)
        {
            control.AddEntity(gDRTResult);
        }

        public void UpdateGDRTResult(GDRTResult gDRTResult, int ID)
        {
            control.UpdateEntity(gDRTResult, ID);
        }

        public void DeleteGDRTResult(GDRTResult gDRTResult)
        {
            control.DeleteEntity(gDRTResult);
        }

        public IList GetAllGDRTResults(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}