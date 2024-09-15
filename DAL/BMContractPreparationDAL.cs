using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 合同编制
    /// </summary>
    public class BMContractPreparationDAL
    {
        private EntityControl control;

        public BMContractPreparationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMContractPreparation(BMContractPreparation bMContractPreparation)
        {
            control.AddEntity(bMContractPreparation);
        }

        public void UpdateBMContractPreparation(BMContractPreparation bMContractPreparation, int ID)
        {
            control.UpdateEntity(bMContractPreparation, ID);
        }

        public void DeleteBMContractPreparation(BMContractPreparation bMContractPreparation)
        {
            control.DeleteEntity(bMContractPreparation);
        }

        public IList GetAllBMContractPreparations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}