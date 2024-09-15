using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDJointRevisionDAL
    {
        private EntityControl control;

        public GDJointRevisionDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDJointRevision(GDJointRevision gDJointRevision)
        {
            control.AddEntity(gDJointRevision);
        }

        public void UpdateGDJointRevision(GDJointRevision gDJointRevision, int ID)
        {
            control.UpdateEntity(gDJointRevision, ID);
        }

        public void DeleteGDJointRevision(GDJointRevision gDJointRevision)
        {
            control.DeleteEntity(gDJointRevision);
        }

        public IList GetAllGDJointRevisions(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}