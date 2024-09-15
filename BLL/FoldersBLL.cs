using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class FoldersBLL
    {
        public void AddFolders(Folders folders)
        {
            FoldersDAL dal = new FoldersDAL();
            dal.AddFolders(folders);
        }

        public void UpdateFolders(Folders folders, int FolderID)
        {
            FoldersDAL dal = new FoldersDAL();
            dal.UpdateFolders(folders, FolderID);
        }

        public void DeleteFolders(Folders folders)
        {
            FoldersDAL dal = new FoldersDAL();
            dal.DeleteFolders(folders);
        }

        public IList GetAllFolderss(string strHQL)
        {
            FoldersDAL dal = new FoldersDAL();
            return dal.GetAllFolderss(strHQL);
        }
    }
}