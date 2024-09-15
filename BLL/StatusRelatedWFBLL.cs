using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class StatusRelatedWFBLL
    {
        public void AddStatusRelatedWF(StatusRelatedWF statusRelatedWF)
        {
            StatusRelatedWFDAL dal = new StatusRelatedWFDAL();
            dal.AddStatusRelatedWF(statusRelatedWF);
        }

        public void UpdateStatusRelatedWF(StatusRelatedWF statusRelatedWF, int ID)
        {
            StatusRelatedWFDAL dal = new StatusRelatedWFDAL();
            dal.UpdateStatusRelatedWF(statusRelatedWF, ID);
        }

        public void DeleteStatusRelatedWF(StatusRelatedWF statusRelatedWF)
        {
            StatusRelatedWFDAL dal = new StatusRelatedWFDAL();
            dal.DeleteStatusRelatedWF(statusRelatedWF);
        }

        public IList GetAllStatusRelatedWFs(string strHQL)
        {
            StatusRelatedWFDAL dal = new StatusRelatedWFDAL();
            return dal.GetAllStatusRelatedWFs(strHQL);
        }
    }
}