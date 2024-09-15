using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 澄清/答疑文件
    /// </summary>
    public class BMAnnClaFileBLL
    {
        public void AddBMAnnClaFile(BMAnnClaFile bMAnnClaFile)
        {
            BMAnnClaFileDAL dal = new BMAnnClaFileDAL();
            dal.AddBMAnnClaFile(bMAnnClaFile);
        }

        public void UpdateBMAnnClaFile(BMAnnClaFile bMAnnClaFile, int ID)
        {
            BMAnnClaFileDAL dal = new BMAnnClaFileDAL();
            dal.UpdateBMAnnClaFile(bMAnnClaFile, ID);
        }

        public void DeleteBMAnnClaFile(BMAnnClaFile bMAnnClaFile)
        {
            BMAnnClaFileDAL dal = new BMAnnClaFileDAL();
            dal.DeleteBMAnnClaFile(bMAnnClaFile);
        }

        public IList GetAllBMAnnClaFiles(string strHQL)
        {
            BMAnnClaFileDAL dal = new BMAnnClaFileDAL();
            return dal.GetAllBMAnnClaFiles(strHQL);
        }
    }
}