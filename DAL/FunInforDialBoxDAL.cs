using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class FunInforDialBoxDAL
    {
        private EntityControl control;

        public FunInforDialBoxDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddFunInforDialBox(FunInforDialBox funInforDialBox)
        {
            control.AddEntity(funInforDialBox);
        }

        public void UpdateFunInforDialBox(FunInforDialBox funInforDialBox, int ID)
        {
            control.UpdateEntity(funInforDialBox, ID);
        }

        public void DeleteFunInforDialBox(FunInforDialBox funInforDialBox)
        {
            control.DeleteEntity(funInforDialBox);
        }

        public IList GetAllFunInforDialBoxs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}