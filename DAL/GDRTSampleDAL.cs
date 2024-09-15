using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDRTSampleDAL
    {
        private EntityControl control;

        public GDRTSampleDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDRTSample(GDRTSample gDRTSample)
        {
            control.AddEntity(gDRTSample);
        }

        public void UpdateGDRTSample(GDRTSample gDRTSample, int ID)
        {
            control.UpdateEntity(gDRTSample, ID);
        }

        public void DeleteGDRTSample(GDRTSample gDRTSample)
        {
            control.DeleteEntity(gDRTSample);
        }

        public IList GetAllGDRTSamples(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}