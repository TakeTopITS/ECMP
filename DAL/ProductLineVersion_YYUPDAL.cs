using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ProductLineVersion_YYUPDAL
    {
        private EntityControl control;

        public ProductLineVersion_YYUPDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProductLineVersion_YYUP(ProductLineVersion_YYUP productLineVersion_YYUP)
        {
            control.AddEntity(productLineVersion_YYUP);
        }

        public void UpdateProductLineVersion_YYUP(ProductLineVersion_YYUP productLineVersion_YYUP, int ID)
        {
            control.UpdateEntity(productLineVersion_YYUP, ID);
        }

        public void DeleteProductLineVersion_YYUP(ProductLineVersion_YYUP productLineVersion_YYUP)
        {
            control.DeleteEntity(productLineVersion_YYUP);
        }

        public IList GetAllProductLineVersion_YYUPs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}