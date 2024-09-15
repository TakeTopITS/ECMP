using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 发图登记表
    /// </summary>
    public class ProSendFigureRegistrationDAL
    {
        private EntityControl control;

        public ProSendFigureRegistrationDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddProSendFigureRegistration(ProSendFigureRegistration proSendFigureRegistration)
        {
            control.AddEntity(proSendFigureRegistration);
        }

        public void UpdateProSendFigureRegistration(ProSendFigureRegistration proSendFigureRegistration, int ID)
        {
            control.UpdateEntity(proSendFigureRegistration, ID);
        }

        public void DeleteProSendFigureRegistration(ProSendFigureRegistration proSendFigureRegistration)
        {
            control.DeleteEntity(proSendFigureRegistration);
        }

        public IList GetAllProSendFigureRegistrations(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}