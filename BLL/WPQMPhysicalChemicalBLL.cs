using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 理化
    /// </summary>
    public class WPQMPhysicalChemicalBLL
    {
        public void AddWPQMPhysicalChemical(WPQMPhysicalChemical wPQMPhysicalChemical)
        {
            WPQMPhysicalChemicalDAL dal = new WPQMPhysicalChemicalDAL();
            dal.AddWPQMPhysicalChemical(wPQMPhysicalChemical);
        }

        public void UpdateWPQMPhysicalChemical(WPQMPhysicalChemical wPQMPhysicalChemical, int ID)
        {
            WPQMPhysicalChemicalDAL dal = new WPQMPhysicalChemicalDAL();
            dal.UpdateWPQMPhysicalChemical(wPQMPhysicalChemical, ID);
        }

        public void DeleteWPQMPhysicalChemical(WPQMPhysicalChemical wPQMPhysicalChemical)
        {
            WPQMPhysicalChemicalDAL dal = new WPQMPhysicalChemicalDAL();
            dal.DeleteWPQMPhysicalChemical(wPQMPhysicalChemical);
        }

        public IList GetAllWPQMPhysicalChemicals(string strHQL)
        {
            WPQMPhysicalChemicalDAL dal = new WPQMPhysicalChemicalDAL();
            return dal.GetAllWPQMPhysicalChemicals(strHQL);
        }
    }
}