using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HeadLineBLL
    {
        public void AddHeadLine(HeadLine headLine)
        {
            HeadLineDAL dal = new HeadLineDAL();
            dal.AddHeadLine(headLine);
        }

        public void UpdateHeadLine(HeadLine headLine, int ID)
        {
            HeadLineDAL dal = new HeadLineDAL();
            dal.UpdateHeadLine(headLine, ID);
        }

        public void DeleteHeadLine(HeadLine headLine)
        {
            HeadLineDAL dal = new HeadLineDAL();
            dal.DeleteHeadLine(headLine);
        }

        public IList GetAllHeadLines(string strHQL)
        {
            HeadLineDAL dal = new HeadLineDAL();
            return dal.GetAllHeadLines(strHQL);
        }
    }
}