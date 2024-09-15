using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 招标文件(附件形式)
    /// </summary>
    public class BMBidTemplateFileDAL
    {
        private EntityControl control;

        public BMBidTemplateFileDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMBidTemplateFile(BMBidTemplateFile bMBidTemplateFile)
        {
            control.AddEntity(bMBidTemplateFile);
        }

        public void UpdateBMBidTemplateFile(BMBidTemplateFile bMBidTemplateFile, int ID)
        {
            control.UpdateEntity(bMBidTemplateFile, ID);
        }

        public void DeleteBMBidTemplateFile(BMBidTemplateFile bMBidTemplateFile)
        {
            control.DeleteEntity(bMBidTemplateFile);
        }

        public IList GetAllBMBidTemplateFiles(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}