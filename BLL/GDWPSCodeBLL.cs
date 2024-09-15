using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDWPSCodeBLL
    {
        public void AddGDWPSCode(GDWPSCode gDWPSCode)
        {
            GDWPSCodeDAL dal = new GDWPSCodeDAL();
            dal.AddGDWPSCode(gDWPSCode);
        }

        public void UpdateGDWPSCode(GDWPSCode gDWPSCode, string strWPSNo)
        {
            GDWPSCodeDAL dal = new GDWPSCodeDAL();
            dal.UpdateGDWPSCode(gDWPSCode, strWPSNo);
        }

        public void DeleteGDWPSCode(GDWPSCode gDWPSCode)
        {
            GDWPSCodeDAL dal = new GDWPSCodeDAL();
            dal.DeleteGDWPSCode(gDWPSCode);
        }

        public IList GetAllGDWPSCodes(string strHQL)
        {
            GDWPSCodeDAL dal = new GDWPSCodeDAL();
            return dal.GetAllGDWPSCodes(strHQL);
        }
    }
}