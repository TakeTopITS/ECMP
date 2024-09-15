using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ProductLineVersion_YYUPBLL
    {
        public void AddProductLineVersion_YYUP(ProductLineVersion_YYUP productLineVersion_YYUP)
        {
            ProductLineVersion_YYUPDAL dal = new ProductLineVersion_YYUPDAL();
            dal.AddProductLineVersion_YYUP(productLineVersion_YYUP);
        }

        public void UpdateProductLineVersion_YYUP(ProductLineVersion_YYUP productLineVersion_YYUP, int ID)
        {
            ProductLineVersion_YYUPDAL dal = new ProductLineVersion_YYUPDAL();
            dal.UpdateProductLineVersion_YYUP(productLineVersion_YYUP, ID);
        }

        public void DeleteProductLineVersion_YYUP(ProductLineVersion_YYUP productLineVersion_YYUP)
        {
            ProductLineVersion_YYUPDAL dal = new ProductLineVersion_YYUPDAL();
            dal.DeleteProductLineVersion_YYUP(productLineVersion_YYUP);
        }

        public IList GetAllProductLineVersion_YYUPs(string strHQL)
        {
            ProductLineVersion_YYUPDAL dal = new ProductLineVersion_YYUPDAL();
            return dal.GetAllProductLineVersion_YYUPs(strHQL);
        }
    }
}