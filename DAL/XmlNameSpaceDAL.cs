using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class XmlNameSpaceDAL
    {
        private EntityControl control;

        public XmlNameSpaceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddXmlNameSpace(XmlNameSpace xmlNameSpace)
        {
            control.AddEntity(xmlNameSpace);
        }

        public void UpdateXmlNameSpace(XmlNameSpace xmlNameSpace, int ID)
        {
            control.UpdateEntity(xmlNameSpace, ID);
        }

        public void DeleteXmlNameSpace(XmlNameSpace xmlNameSpace)
        {
            control.DeleteEntity(xmlNameSpace);
        }

        public IList GetAllXmlNameSpaces(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}