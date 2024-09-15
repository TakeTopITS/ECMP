using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 招标补遗
    /// </summary>
    public class BMBidAddendumDAL
    {
        private EntityControl control;

        public BMBidAddendumDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMBidAddendum(BMBidAddendum bMBidAddendum)
        {
            control.AddEntity(bMBidAddendum);
        }

        public void UpdateBMBidAddendum(BMBidAddendum bMBidAddendum, int ID)
        {
            control.UpdateEntity(bMBidAddendum, ID);
        }

        public void DeleteBMBidAddendum(BMBidAddendum bMBidAddendum)
        {
            control.DeleteEntity(bMBidAddendum);
        }

        public IList GetAllBMBidAddendums(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}