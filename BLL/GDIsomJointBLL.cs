using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDIsomJointBLL
    {
        public void AddGDIsomJoint(GDIsomJoint gDIsomJoint)
        {
            GDIsomJointDAL dal = new GDIsomJointDAL();
            dal.AddGDIsomJoint(gDIsomJoint);
        }

        public void UpdateGDLineWeld(GDIsomJoint gDIsomJoint, int ID)
        {
            GDIsomJointDAL dal = new GDIsomJointDAL();
            dal.UpdateGDIsomJoint(gDIsomJoint, ID);
        }

        public void DeleteGDIsomJoint(GDIsomJoint gDIsomJoint)
        {
            GDIsomJointDAL dal = new GDIsomJointDAL();
            dal.DeleteGDIsomJoint(gDIsomJoint);
        }

        public IList GetAllGDIsomJoints(string strHQL)
        {
            GDIsomJointDAL dal = new GDIsomJointDAL();
            return dal.GetAllGDIsomJoints(strHQL);
        }
    }
}