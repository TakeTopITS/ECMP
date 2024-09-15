using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDIsomJointDAL
    {
        private EntityControl control;

        public GDIsomJointDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDIsomJoint(GDIsomJoint gDIsomJoint)
        {
            control.AddEntity(gDIsomJoint);
        }

        public void UpdateGDIsomJoint(GDIsomJoint gDIsomJoint, int ID)
        {
            control.UpdateEntity(gDIsomJoint, ID);
        }

        public void DeleteGDIsomJoint(GDIsomJoint gDIsomJoint)
        {
            control.DeleteEntity(gDIsomJoint);
        }

        public IList GetAllGDIsomJoints(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}