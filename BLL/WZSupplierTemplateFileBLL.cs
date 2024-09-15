using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZSupplierTemplateFileBLL
    {
        public void AddWZSupplierTemplateFile(WZSupplierTemplateFile wZSupplierTemplateFile)
        {
            WZSupplierTemplateFileDAL dal = new WZSupplierTemplateFileDAL();
            dal.AddWZSupplierTemplateFile(wZSupplierTemplateFile);
        }

        public void UpdateWZSupplierTemplateFile(WZSupplierTemplateFile wZSupplierTemplateFile, int ID)
        {
            WZSupplierTemplateFileDAL dal = new WZSupplierTemplateFileDAL();
            dal.UpdateWZSupplierTemplateFile(wZSupplierTemplateFile, ID);
        }

        public void DeleteWZSupplierTemplateFile(WZSupplierTemplateFile wZSupplierTemplateFile)
        {
            WZSupplierTemplateFileDAL dal = new WZSupplierTemplateFileDAL();
            dal.DeleteWZSupplierTemplateFile(wZSupplierTemplateFile);
        }

        public IList GetAllWZSupplierTemplateFiles(string strHQL)
        {
            WZSupplierTemplateFileDAL dal = new WZSupplierTemplateFileDAL();
            return dal.GetAllWZSupplierTemplateFiles(strHQL);
        }
    }
}