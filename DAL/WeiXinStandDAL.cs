using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WeiXinStandDAL
    {
        private EntityControl control;

        public WeiXinStandDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWeiXinStand(WeiXinStand weiXinStand)
        {
            control.AddEntity(weiXinStand);
        }

        public void UpdateWeiXinStand(WeiXinStand weiXinStand, string WeiXinNo)
        {
            control.UpdateEntity(weiXinStand, WeiXinNo);
        }

        public void DeleteWeiXinStand(WeiXinStand weiXinStand)
        {
            control.DeleteEntity(weiXinStand);
        }

        public IList GetAllWeiXinStands(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}