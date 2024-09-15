using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 招标文件(附件形式)
    /// </summary>
    public class BMBidFileBLL
    {
        public void AddBMBidFile(BMBidFile bMBidFile)
        {
            BMBidFileDAL dal = new BMBidFileDAL();
            dal.AddBMBidFile(bMBidFile);
        }

        public void UpdateBMBidFile(BMBidFile bMBidFile, int ID)
        {
            BMBidFileDAL dal = new BMBidFileDAL();
            dal.UpdateBMBidFile(bMBidFile, ID);
        }

        public void DeleteBMBidFile(BMBidFile bMBidFile)
        {
            BMBidFileDAL dal = new BMBidFileDAL();
            dal.DeleteBMBidFile(bMBidFile);
        }

        public IList GetAllBMBidFiles(string strHQL)
        {
            BMBidFileDAL dal = new BMBidFileDAL();
            return dal.GetAllBMBidFiles(strHQL);
        }
    }
}