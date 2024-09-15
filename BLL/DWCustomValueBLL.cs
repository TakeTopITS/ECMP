using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DWCustomValueBLL
    {
        public void AddDWCustomValue(DWCustomValue dWCustomValue)
        {
            DWCustomValueDAL dal = new DWCustomValueDAL();
            dal.AddDWCustomValue(dWCustomValue);
        }

        public void UpdateDWCustomValue(DWCustomValue dWCustomValue, int ID)
        {
            DWCustomValueDAL dal = new DWCustomValueDAL();
            dal.UpdateDWCustomValue(dWCustomValue, ID);
        }

        public void DeleteDWCustomValue(DWCustomValue dWCustomValue)
        {
            DWCustomValueDAL dal = new DWCustomValueDAL();
            dal.DeleteDWCustomValue(dWCustomValue);
        }

        public IList GetAllDWCustomValues(string strHQL)
        {
            DWCustomValueDAL dal = new DWCustomValueDAL();
            return dal.GetAllDWCustomValues(strHQL);
        }
    }
}