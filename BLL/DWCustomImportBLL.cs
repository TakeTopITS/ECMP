using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DWCustomImportBLL
    {
        public void AddDWCustomImport(DWCustomImport dWCustomImport)
        {
            DWCustomImportDAL dal = new DWCustomImportDAL();
            dal.AddDWCustomImport(dWCustomImport);
        }

        public void UpdateDWCustomImport(DWCustomImport dWCustomImport, int ID)
        {
            DWCustomImportDAL dal = new DWCustomImportDAL();
            dal.UpdateDWCustomImport(dWCustomImport, ID);
        }

        public void DeleteDWCustomImport(DWCustomImport dWCustomImport)
        {
            DWCustomImportDAL dal = new DWCustomImportDAL();
            dal.DeleteDWCustomImport(dWCustomImport);
        }

        public IList GetAllDWCustomImports(string strHQL)
        {
            DWCustomImportDAL dal = new DWCustomImportDAL();
            return dal.GetAllDWCustomImports(strHQL);
        }
    }
}