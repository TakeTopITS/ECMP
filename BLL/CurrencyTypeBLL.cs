using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 货币种类
    /// </summary>
    public class CurrencyTypeBLL
    {
        public void AddCurrencyType(CurrencyType currencyType)
        {
            CurrencyTypeDAL dal = new CurrencyTypeDAL();
            dal.AddCurrencyType(currencyType);
        }

        public void UpdateCurrencyType(CurrencyType currencyType, string Type)
        {
            CurrencyTypeDAL dal = new CurrencyTypeDAL();
            dal.UpdateCurrencyType(currencyType, Type);
        }

        public void DeleteCurrencyType(CurrencyType currencyType)
        {
            CurrencyTypeDAL dal = new CurrencyTypeDAL();
            dal.DeleteCurrencyType(currencyType);
        }

        public IList GetAllCurrencyTypes(string strHQL)
        {
            CurrencyTypeDAL dal = new CurrencyTypeDAL();
            return dal.GetAllCurrencyTypes(strHQL);
        }
    }
}