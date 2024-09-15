using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 招标文件(附件形式)
    /// </summary>
    public class BMBidTemplateFileBLL
    {
        public void AddBMBidTemplateFile(BMBidTemplateFile bMBidTemplateFile)
        {
            BMBidTemplateFileDAL dal = new BMBidTemplateFileDAL();
            dal.AddBMBidTemplateFile(bMBidTemplateFile);
        }

        public void UpdateBMBidTemplateFile(BMBidTemplateFile bMBidTemplateFile, int ID)
        {
            BMBidTemplateFileDAL dal = new BMBidTemplateFileDAL();
            dal.UpdateBMBidTemplateFile(bMBidTemplateFile, ID);
        }

        public void DeleteBMBidTemplateFile(BMBidTemplateFile bMBidTemplateFile)
        {
            BMBidTemplateFileDAL dal = new BMBidTemplateFileDAL();
            dal.DeleteBMBidTemplateFile(bMBidTemplateFile);
        }

        public IList GetAllBMBidTemplateFiles(string strHQL)
        {
            BMBidTemplateFileDAL dal = new BMBidTemplateFileDAL();
            return dal.GetAllBMBidTemplateFiles(strHQL);
        }
    }
}