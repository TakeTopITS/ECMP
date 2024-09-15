using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GDPressureTestDAL
    {
        private EntityControl control;

        public GDPressureTestDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGDPressureTest(GDPressureTest gDPressureTest)
        {
            control.AddEntity(gDPressureTest);
        }

        public void UpdateGDPressureTest(GDPressureTest gDPressureTest, int ID)
        {
            control.UpdateEntity(gDPressureTest, ID);
        }

        public void DeleteGDPressureTest(GDPressureTest gDPressureTest)
        {
            control.DeleteEntity(gDPressureTest);
        }

        public IList GetAllGDPressureTests(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}