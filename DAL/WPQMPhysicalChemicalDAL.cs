using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 理化
    /// </summary>
    public class WPQMPhysicalChemicalDAL
    {
        private EntityControl control;

        public WPQMPhysicalChemicalDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMPhysicalChemical(WPQMPhysicalChemical wPQMPhysicalChemical)
        {
            control.AddEntity(wPQMPhysicalChemical);
        }

        public void UpdateWPQMPhysicalChemical(WPQMPhysicalChemical wPQMPhysicalChemical, int ID)
        {
            control.UpdateEntity(wPQMPhysicalChemical, ID);
        }

        public void DeleteWPQMPhysicalChemical(WPQMPhysicalChemical wPQMPhysicalChemical)
        {
            control.DeleteEntity(wPQMPhysicalChemical);
        }

        public IList GetAllWPQMPhysicalChemicals(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}