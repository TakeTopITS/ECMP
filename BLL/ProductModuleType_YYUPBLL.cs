using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProductModuleType_YYUPBLL
    {
        public void AddProductModuleType_YYUP(ProductModuleType_YYUP productModuleType_YYUP)
        {
            ProductModuleType_YYUPDAL dal = new ProductModuleType_YYUPDAL();
            dal.AddProductModuleType_YYUP(productModuleType_YYUP);
        }

        public void UpdateProductModuleType_YYUP(ProductModuleType_YYUP productModuleType_YYUP, int ID)
        {
            ProductModuleType_YYUPDAL dal = new ProductModuleType_YYUPDAL();
            dal.UpdateProductModuleType_YYUP(productModuleType_YYUP, ID);
        }

        public void DeleteProductModuleType_YYUP(ProductModuleType_YYUP productModuleType_YYUP)
        {
            ProductModuleType_YYUPDAL dal = new ProductModuleType_YYUPDAL();
            dal.DeleteProductModuleType_YYUP(productModuleType_YYUP);
        }

        public IList GetAllProductModuleType_YYUPs(string strHQL)
        {
            ProductModuleType_YYUPDAL dal = new ProductModuleType_YYUPDAL();
            return dal.GetAllProductModuleType_YYUPs(strHQL);
        }
    }
}