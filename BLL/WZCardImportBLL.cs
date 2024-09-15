using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZCardImportBLL
    {
        public void AddWZCardImport(WZCardImport wZCardImport)
        {
            WZCardImportDAL dal = new WZCardImportDAL();
            dal.AddWZCardImport(wZCardImport);
        }

        public void UpdateWZCardImport(WZCardImport wZCardImport, int ID)
        {
            WZCardImportDAL dal = new WZCardImportDAL();
            dal.UpdateWZCardImport(wZCardImport, ID);
        }

        public void DeleteWZCardImport(WZCardImport wZCardImport)
        {
            WZCardImportDAL dal = new WZCardImportDAL();
            dal.DeleteWZCardImport(wZCardImport);
        }

        public IList GetAllWZCardImports(string strHQL)
        {
            WZCardImportDAL dal = new WZCardImportDAL();
            return dal.GetAllWZCardImports(strHQL);
        }
    }
}