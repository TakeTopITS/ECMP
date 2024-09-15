using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 专家评标意见
    /// </summary>
    public class BMSupBidByExpDAL
    {
        private EntityControl control;

        public BMSupBidByExpDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMSupBidByExp(BMSupBidByExp bMSupBidByExp)
        {
            control.AddEntity(bMSupBidByExp);
        }

        public void UpdateBMSupBidByExp(BMSupBidByExp bMSupBidByExp, int ID)
        {
            control.UpdateEntity(bMSupBidByExp, ID);
        }

        public void DeleteBMSupBidByExp(BMSupBidByExp bMSupBidByExp)
        {
            control.DeleteEntity(bMSupBidByExp);
        }

        public IList GetAllBMSupBidByExps(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}