using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 供应商信息
    /// </summary>
    public class BMSupplierInfoDAL
    {
        private EntityControl control;

        public BMSupplierInfoDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddBMSupplierInfo(BMSupplierInfo bMSupplierInfo)
        {
            control.AddEntity(bMSupplierInfo);
        }

        public void UpdateBMSupplierInfo(BMSupplierInfo bMSupplierInfo, int ID)
        {
            control.UpdateEntity(bMSupplierInfo, ID);
        }

        public void DeleteBMSupplierInfo(BMSupplierInfo bMSupplierInfo)
        {
            control.DeleteEntity(bMSupplierInfo);
        }

        public IList GetAllBMSupplierInfos(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}