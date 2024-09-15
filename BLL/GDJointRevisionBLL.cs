using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDJointRevisionBLL
    {
        public void AddGDJointRevision(GDJointRevision gDJointRevision)
        {
            GDJointRevisionDAL dal = new GDJointRevisionDAL();
            dal.AddGDJointRevision(gDJointRevision);
        }

        public void UpdateGDJointRevision(GDJointRevision gDJointRevision, int ID)
        {
            GDJointRevisionDAL dal = new GDJointRevisionDAL();
            dal.UpdateGDJointRevision(gDJointRevision, ID);
        }

        public void DeleteGDJointRevision(GDJointRevision gDJointRevision)
        {
            GDJointRevisionDAL dal = new GDJointRevisionDAL();
            dal.DeleteGDJointRevision(gDJointRevision);
        }

        public IList GetAllGDJointRevisions(string strHQL)
        {
            GDJointRevisionDAL dal = new GDJointRevisionDAL();
            return dal.GetAllGDJointRevisions(strHQL);
        }
    }
}