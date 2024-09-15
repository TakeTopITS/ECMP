using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 货币种类
    /// </summary>
    public class CurrencyTypeDAL
    {
        private EntityControl control;

        public CurrencyTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCurrencyType(CurrencyType currencyType)
        {
            control.AddEntity(currencyType);
        }

        public void UpdateCurrencyType(CurrencyType currencyType, string Type)
        {
            control.UpdateEntity(currencyType, Type);
        }

        public void DeleteCurrencyType(CurrencyType currencyType)
        {
            control.DeleteEntity(currencyType);
        }

        public IList GetAllCurrencyTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}