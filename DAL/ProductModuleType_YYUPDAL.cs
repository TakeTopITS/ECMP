using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProductModuleType_YYUPDAL
    {
        private EntityControl control;

        public ProductModuleType_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProductModuleType_YYUP(ProductModuleType_YYUP productModuleType_YYUP)
        {
            control.AddEntity(productModuleType_YYUP);
        }

        public void UpdateProductModuleType_YYUP(ProductModuleType_YYUP productModuleType_YYUP, int ID)
        {
            control.UpdateEntity(productModuleType_YYUP, ID);
        }

        public void DeleteProductModuleType_YYUP(ProductModuleType_YYUP productModuleType_YYUP)
        {
            control.DeleteEntity(productModuleType_YYUP);
        }

        public IList GetAllProductModuleType_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}