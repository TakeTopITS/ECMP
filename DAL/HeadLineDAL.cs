using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HeadLineDAL
    {
        private EntityControl control;

        public HeadLineDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHeadLine(HeadLine headLine)
        {
            control.AddEntity(headLine);
        }

        public void UpdateHeadLine(HeadLine headLine, int ID)
        {
            control.UpdateEntity(headLine, ID);
        }

        public void DeleteHeadLine(HeadLine headLine)
        {
            control.DeleteEntity(headLine);
        }

        public IList GetAllHeadLines(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}