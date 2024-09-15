using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 澄清/答疑文件
    /// </summary>
    public class BMAnnClaFileDAL
    {
        private EntityControl control;

        public BMAnnClaFileDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMAnnClaFile(BMAnnClaFile bMAnnClaFile)
        {
            control.AddEntity(bMAnnClaFile);
        }

        public void UpdateBMAnnClaFile(BMAnnClaFile bMAnnClaFile, int ID)
        {
            control.UpdateEntity(bMAnnClaFile, ID);
        }

        public void DeleteBMAnnClaFile(BMAnnClaFile bMAnnClaFile)
        {
            control.DeleteEntity(bMAnnClaFile);
        }

        public IList GetAllBMAnnClaFiles(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}