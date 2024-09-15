using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSEEnvirFactorSurDetailDAL
    {
        private EntityControl control;

        public HSEEnvirFactorSurDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEEnvirFactorSurDetail(HSEEnvirFactorSurDetail hSEEnvirFactorSurDetail)
        {
            control.AddEntity(hSEEnvirFactorSurDetail);
        }

        public void UpdateHSEEnvirFactorSurDetail(HSEEnvirFactorSurDetail hSEEnvirFactorSurDetail, int ID)
        {
            control.UpdateEntity(hSEEnvirFactorSurDetail, ID);
        }

        public void DeleteHSEEnvirFactorSurDetail(HSEEnvirFactorSurDetail hSEEnvirFactorSurDetail)
        {
            control.DeleteEntity(hSEEnvirFactorSurDetail);
        }

        public IList GetAllHSEEnvirFactorSurDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}