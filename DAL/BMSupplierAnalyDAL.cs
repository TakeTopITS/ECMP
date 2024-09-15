using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 供应商评价分析
    /// </summary>
    public class BMSupplierAnalyDAL
    {
        private EntityControl control;

        public BMSupplierAnalyDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMSupplierAnaly(BMSupplierAnaly bMSupplierAnaly)
        {
            control.AddEntity(bMSupplierAnaly);
        }

        public void UpdateBMSupplierAnaly(BMSupplierAnaly bMSupplierAnaly, int ID)
        {
            control.UpdateEntity(bMSupplierAnaly, ID);
        }

        public void DeleteBMSupplierAnaly(BMSupplierAnaly bMSupplierAnaly)
        {
            control.DeleteEntity(bMSupplierAnaly);
        }

        public IList GetAllBMSupplierAnalys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}