using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProductModule_YYUPBLL
    {
        public void AddProductModule_YYUP(ProductModule_YYUP productModule_YYUP)
        {
            ProductModule_YYUPDAL dal = new ProductModule_YYUPDAL();
            dal.AddProductModule_YYUP(productModule_YYUP);
        }

        public void UpdateProductModule_YYUP(ProductModule_YYUP productModule_YYUP, int ID)
        {
            ProductModule_YYUPDAL dal = new ProductModule_YYUPDAL();
            dal.UpdateProductModule_YYUP(productModule_YYUP, ID);
        }

        public void DeleteProductModule_YYUP(ProductModule_YYUP productModule_YYUP)
        {
            ProductModule_YYUPDAL dal = new ProductModule_YYUPDAL();
            dal.DeleteProductModule_YYUP(productModule_YYUP);
        }

        public IList GetAllProductModule_YYUPs(string strHQL)
        {
            ProductModule_YYUPDAL dal = new ProductModule_YYUPDAL();
            return dal.GetAllProductModule_YYUPs(strHQL);
        }
    }
}