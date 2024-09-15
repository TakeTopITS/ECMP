using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDRTSampleBLL
    {
        public void AddGDRTSample(GDRTSample gDRTSample)
        {
            GDRTSampleDAL dal = new GDRTSampleDAL();
            dal.AddGDRTSample(gDRTSample);
        }

        public void UpdateGDRTSample(GDRTSample gDRTSample, int ID)
        {
            GDRTSampleDAL dal = new GDRTSampleDAL();
            dal.UpdateGDRTSample(gDRTSample, ID);
        }

        public void DeleteGDRTSample(GDRTSample gDRTSample)
        {
            GDRTSampleDAL dal = new GDRTSampleDAL();
            dal.DeleteGDRTSample(gDRTSample);
        }

        public IList GetAllGDRTSamples(string strHQL)
        {
            GDRTSampleDAL dal = new GDRTSampleDAL();
            return dal.GetAllGDRTSamples(strHQL);
        }
    }
}