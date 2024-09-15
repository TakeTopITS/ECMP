using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class XmlNameSpaceBLL
    {
        public void AddXmlNameSpace(XmlNameSpace xmlNameSpace)
        {
            XmlNameSpaceDAL dal = new XmlNameSpaceDAL();
            dal.AddXmlNameSpace(xmlNameSpace);
        }

        public void UpdateXmlNameSpace(XmlNameSpace xmlNameSpace, int ID)
        {
            XmlNameSpaceDAL dal = new XmlNameSpaceDAL();
            dal.UpdateXmlNameSpace(xmlNameSpace, ID);
        }

        public void DeleteXmlNameSpace(XmlNameSpace xmlNameSpace)
        {
            XmlNameSpaceDAL dal = new XmlNameSpaceDAL();
            dal.DeleteXmlNameSpace(xmlNameSpace);
        }

        public IList GetAllXmlNameSpaces(string strHQL)
        {
            XmlNameSpaceDAL dal = new XmlNameSpaceDAL();
            return dal.GetAllXmlNameSpaces(strHQL);
        }
    }
}