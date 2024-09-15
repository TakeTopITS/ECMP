using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 预算数据
    /// </summary>
    public class BDBaseDataDAL
    {
        private EntityControl control;

        public BDBaseDataDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBDBaseData(BDBaseData bDBaseData)
        {
            control.AddEntity(bDBaseData);
        }

        public void UpdateBDBaseData(BDBaseData bDBaseData, int ID)
        {
            control.UpdateEntity(bDBaseData, ID);
        }

        public void DeleteBDBaseData(BDBaseData bDBaseData)
        {
            control.DeleteEntity(bDBaseData);
        }

        public IList GetAllBDBaseDatas(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}