using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDOrderCodeBLL
    {
        public void AddGDOrderCode(GDOrderCode gDOrderCode)
        {
            GDOrderCodeDAL dal = new GDOrderCodeDAL();
            dal.AddGDOrderCode(gDOrderCode);
        }

        public void UpdateGDOrderCode(GDOrderCode gDOrderCode, int ID)
        {
            GDOrderCodeDAL dal = new GDOrderCodeDAL();
            dal.UpdateGDOrderCode(gDOrderCode, ID);
        }

        public void DeleteGDOrderCode(GDOrderCode gDOrderCode)
        {
            GDOrderCodeDAL dal = new GDOrderCodeDAL();
            dal.DeleteGDOrderCode(gDOrderCode);
        }

        public IList GetAllGDOrderCodes(string strHQL)
        {
            GDOrderCodeDAL dal = new GDOrderCodeDAL();
            return dal.GetAllGDOrderCodes(strHQL);
        }
    }
}