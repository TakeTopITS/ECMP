using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractPayableVisaDetailDAL
    {
        private EntityControl control;

        public ConstractPayableVisaDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractPayableVisaDetail(ConstractPayableVisaDetail constractPayableVisaDetail)
        {
            control.AddEntity(constractPayableVisaDetail);
        }

        public void UpdateConstractPayableVisaDetail(ConstractPayableVisaDetail constractPayableVisaDetail, int ID)
        {
            control.UpdateEntity(constractPayableVisaDetail, ID);
        }

        public void DeleteConstractPayableVisaDetail(ConstractPayableVisaDetail constractPayableVisaDetail)
        {
            control.DeleteEntity(constractPayableVisaDetail);
        }

        public IList GetAllConstractPayableVisaDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}