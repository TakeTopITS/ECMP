using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class StatusRelatedWFDAL
    {
        private EntityControl control;

        public StatusRelatedWFDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddStatusRelatedWF(StatusRelatedWF statusRelatedWF)
        {
            control.AddEntity(statusRelatedWF);
        }

        public void UpdateStatusRelatedWF(StatusRelatedWF statusRelatedWF, int ID)
        {
            control.UpdateEntity(statusRelatedWF, ID);
        }

        public void DeleteStatusRelatedWF(StatusRelatedWF statusRelatedWF)
        {
            control.DeleteEntity(statusRelatedWF);
        }

        public IList GetAllStatusRelatedWFs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}