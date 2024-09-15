using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 合同洽谈
    /// </summary>
    public class BMContractDiscussDAL
    {
        private EntityControl control;

        public BMContractDiscussDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMContractDiscuss(BMContractDiscuss bMContractDiscuss)
        {
            control.AddEntity(bMContractDiscuss);
        }

        public void UpdateBMContractDiscuss(BMContractDiscuss bMContractDiscuss, int ID)
        {
            control.UpdateEntity(bMContractDiscuss, ID);
        }

        public void DeleteBMContractDiscuss(BMContractDiscuss bMContractDiscuss)
        {
            control.DeleteEntity(bMContractDiscuss);
        }

        public IList GetAllBMContractDiscusss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}