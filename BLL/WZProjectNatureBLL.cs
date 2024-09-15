using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class WZProjectNatureBLL
    {
        public void AddWZProjectNature(WZProjectNature wZProjectNature)
        {
            WZProjectNatureDAL dal = new WZProjectNatureDAL();
            dal.AddWZProjectNature(wZProjectNature);
        }

        public void UpdateWZProjectNature(WZProjectNature wZProjectNature, int ID)
        {
            WZProjectNatureDAL dal = new WZProjectNatureDAL();
            dal.UpdateWZProjectNature(wZProjectNature, ID);
        }

        public void DeleteWZProjectNature(WZProjectNature wZProjectNature)
        {
            WZProjectNatureDAL dal = new WZProjectNatureDAL();
            dal.DeleteWZProjectNature(wZProjectNature);
        }

        public IList GetAllWZProjectNatures(string strHQL)
        {
            WZProjectNatureDAL dal = new WZProjectNatureDAL();
            return dal.GetAllWZProjectNatures(strHQL);
        }
    }
}