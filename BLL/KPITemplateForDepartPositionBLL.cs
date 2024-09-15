using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class KPITemplateForDepartPositionBLL
    {
        public void AddKPITemplateForDepartPosition(KPITemplateForDepartPosition kpiTemplateForDepartPosition)
        {
            KPITemplateForDepartPositionDAL dal = new KPITemplateForDepartPositionDAL();
            dal.AddKPITemplateForDepartPosition(kpiTemplateForDepartPosition);
        }

        public void UpdateKPITemplateForDepartPosition(KPITemplateForDepartPosition kpiTemplateForDepartPosition, int ID)
        {
            KPITemplateForDepartPositionDAL dal = new KPITemplateForDepartPositionDAL();
            dal.UpdateKPITemplateForDepartPosition(kpiTemplateForDepartPosition, ID);
        }

        public void DeleteKPITemplateForDepartPosition(KPITemplateForDepartPosition kpiTemplateForDepartPosition)
        {
            KPITemplateForDepartPositionDAL dal = new KPITemplateForDepartPositionDAL();
            dal.DeleteKPITemplateForDepartPosition(kpiTemplateForDepartPosition);
        }

        public IList GetAllKPITemplateForDepartPositions(string strHQL)
        {
            KPITemplateForDepartPositionDAL dal = new KPITemplateForDepartPositionDAL();
            return dal.GetAllKPITemplateForDepartPositions(strHQL);
        }
    }
}