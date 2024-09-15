using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class RelatedDefectDAL
    {
        private EntityControl control;

        public RelatedDefectDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddRelatedDefect(RelatedDefect relatedDefect)
        {
            control.AddEntity(relatedDefect);
        }

        public void UpdateRelatedDefect(RelatedDefect relatedDefect, int ID)
        {
            control.UpdateEntity(relatedDefect, ID);
        }

        public void DeleteRelatedDefect(RelatedDefect relatedDefect)
        {
            control.DeleteEntity(relatedDefect);
        }

        public IList GetAllRelatedDefects(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}