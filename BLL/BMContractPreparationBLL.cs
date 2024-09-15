using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 合同编制
    /// </summary>
    public class BMContractPreparationBLL
    {
        public void AddBMContractPreparation(BMContractPreparation bMContractPreparation)
        {
            BMContractPreparationDAL dal = new BMContractPreparationDAL();
            dal.AddBMContractPreparation(bMContractPreparation);
        }

        public void UpdateBMContractPreparation(BMContractPreparation bMContractPreparation, int ID)
        {
            BMContractPreparationDAL dal = new BMContractPreparationDAL();
            dal.UpdateBMContractPreparation(bMContractPreparation, ID);
        }

        public void DeleteBMContractPreparation(BMContractPreparation bMContractPreparation)
        {
            BMContractPreparationDAL dal = new BMContractPreparationDAL();
            dal.DeleteBMContractPreparation(bMContractPreparation);
        }

        public IList GetAllBMContractPreparations(string strHQL)
        {
            BMContractPreparationDAL dal = new BMContractPreparationDAL();
            return dal.GetAllBMContractPreparations(strHQL);
        }
    }
}