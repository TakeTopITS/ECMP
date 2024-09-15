using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 焊工持证项目
    /// </summary>
    public class TRHolderWelderBLL
    {
        public void AddTRHolderWelder(TRHolderWelder tRHolderWelder)
        {
            TRHolderWelderDAL dal = new TRHolderWelderDAL();
            dal.AddTRHolderWelder(tRHolderWelder);
        }

        public void UpdateTRHolderWelder(TRHolderWelder tRHolderWelder, int ID)
        {
            TRHolderWelderDAL dal = new TRHolderWelderDAL();
            dal.UpdateTRHolderWelder(tRHolderWelder, ID);
        }

        public void DeleteTRHolderWelder(TRHolderWelder tRHolderWelder)
        {
            TRHolderWelderDAL dal = new TRHolderWelderDAL();
            dal.DeleteTRHolderWelder(tRHolderWelder);
        }

        public IList GetAllTRHolderWelders(string strHQL)
        {
            TRHolderWelderDAL dal = new TRHolderWelderDAL();
            return dal.GetAllTRHolderWelders(strHQL);
        }
    }
}