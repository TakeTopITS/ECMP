using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MTTypeBLL
    {
        public void AddMTType(MTType mtType)
        {
            MTTypeDAL dal = new MTTypeDAL();
            dal.AddMTType(mtType);
        }

        public void UpdateMTType(MTType mtType, string Type)
        {
            MTTypeDAL dal = new MTTypeDAL();
            dal.UpdateMTType(mtType, Type);
        }

        public void DeleteMTType(MTType mtType)
        {
            MTTypeDAL dal = new MTTypeDAL();
            dal.DeleteMTType(mtType);
        }

        public IList GetAllMTTypes(string strHQL)
        {
            MTTypeDAL dal = new MTTypeDAL();
            return dal.GetAllMTTypes(strHQL);
        }
    }
}