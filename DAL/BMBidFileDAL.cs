using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 招标文件(附件形式)
    /// </summary>
    public class BMBidFileDAL
    {
        private EntityControl control;

        public BMBidFileDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMBidFile(BMBidFile bMBidFile)
        {
            control.AddEntity(bMBidFile);
        }

        public void UpdateBMBidFile(BMBidFile bMBidFile, int ID)
        {
            control.UpdateEntity(bMBidFile, ID);
        }

        public void DeleteBMBidFile(BMBidFile bMBidFile)
        {
            control.DeleteEntity(bMBidFile);
        }

        public IList GetAllBMBidFiles(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}