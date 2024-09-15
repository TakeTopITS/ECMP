using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDRTResultBLL
    {
        public void AddGDRTResult(GDRTResult gDRTResult)
        {
            GDRTResultDAL dal = new GDRTResultDAL();
            dal.AddGDRTResult(gDRTResult);
        }

        public void UpdateGDRTResult(GDRTResult gDRTResult, int ID)
        {
            GDRTResultDAL dal = new GDRTResultDAL();
            dal.UpdateGDRTResult(gDRTResult, ID);
        }

        public void DeleteGDRTResult(GDRTResult gDRTResult)
        {
            GDRTResultDAL dal = new GDRTResultDAL();
            dal.DeleteGDRTResult(gDRTResult);
        }

        public IList GetAllGDRTResults(string strHQL)
        {
            GDRTResultDAL dal = new GDRTResultDAL();
            return dal.GetAllGDRTResults(strHQL);
        }
    }
}