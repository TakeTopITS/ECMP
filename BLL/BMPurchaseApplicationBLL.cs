using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 采购申请
    /// </summary>
    public class BMPurchaseApplicationBLL
    {
        public void AddBMPurchaseApplication(BMPurchaseApplication bMPurchaseApplication)
        {
            BMPurchaseApplicationDAL dal = new BMPurchaseApplicationDAL();
            dal.AddBMPurchaseApplication(bMPurchaseApplication);
        }

        public void UpdateBMPurchaseApplication(BMPurchaseApplication bMPurchaseApplication, int ID)
        {
            BMPurchaseApplicationDAL dal = new BMPurchaseApplicationDAL();
            dal.UpdateBMPurchaseApplication(bMPurchaseApplication, ID);
        }

        public void DeleteBMPurchaseApplication(BMPurchaseApplication bMPurchaseApplication)
        {
            BMPurchaseApplicationDAL dal = new BMPurchaseApplicationDAL();
            dal.DeleteBMPurchaseApplication(bMPurchaseApplication);
        }

        public IList GetAllBMPurchaseApplications(string strHQL)
        {
            BMPurchaseApplicationDAL dal = new BMPurchaseApplicationDAL();
            return dal.GetAllBMPurchaseApplications(strHQL);
        }
    }
}