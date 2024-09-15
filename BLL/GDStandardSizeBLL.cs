using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GDStandardSizeBLL
    {
        public void AddGDStandardSize(GDStandardSize gDStandardSize)
        {
            GDStandardSizeDAL dal = new GDStandardSizeDAL();
            dal.AddGDStandardSize(gDStandardSize);
        }

        public void UpdateGDStandardSize(GDStandardSize gDStandardSize, int ID)
        {
            GDStandardSizeDAL dal = new GDStandardSizeDAL();
            dal.UpdateGDStandardSize(gDStandardSize, ID);
        }

        public void DeleteGDStandardSize(GDStandardSize gDStandardSize)
        {
            GDStandardSizeDAL dal = new GDStandardSizeDAL();
            dal.DeleteGDStandardSize(gDStandardSize);
        }

        public IList GetAllGDStandardSizes(string strHQL)
        {
            GDStandardSizeDAL dal = new GDStandardSizeDAL();
            return dal.GetAllGDStandardSizes(strHQL);
        }
    }
}