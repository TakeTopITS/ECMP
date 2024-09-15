using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProductModule_YYUPDAL
    {
        private EntityControl control;

        public ProductModule_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProductModule_YYUP(ProductModule_YYUP productModule_YYUP)
        {
            control.AddEntity(productModule_YYUP);
        }

        public void UpdateProductModule_YYUP(ProductModule_YYUP productModule_YYUP, int ID)
        {
            control.UpdateEntity(productModule_YYUP, ID);
        }

        public void DeleteProductModule_YYUP(ProductModule_YYUP productModule_YYUP)
        {
            control.DeleteEntity(productModule_YYUP);
        }

        public IList GetAllProductModule_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}