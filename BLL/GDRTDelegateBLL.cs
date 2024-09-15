using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDRTDelegateBLL
    {
        public void AddGDRTDelegate(GDRTDelegate gDRTDelegate)
        {
            GDRTDelegateDAL dal = new GDRTDelegateDAL();
            dal.AddGDRTDelegate(gDRTDelegate);
        }

        public void UpdateGDRTDelegate(GDRTDelegate gDRTDelegate, int ID)
        {
            GDRTDelegateDAL dal = new GDRTDelegateDAL();
            dal.UpdateGDRTDelegate(gDRTDelegate, ID);
        }

        public void DeleteGDRTDelegate(GDRTDelegate gDRTDelegate)
        {
            GDRTDelegateDAL dal = new GDRTDelegateDAL();
            dal.DeleteGDRTDelegate(gDRTDelegate);
        }

        public IList GetAllGDRTDelegates(string strHQL)
        {
            GDRTDelegateDAL dal = new GDRTDelegateDAL();
            return dal.GetAllGDRTDelegates(strHQL);
        }
    }
}