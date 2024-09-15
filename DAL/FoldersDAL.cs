using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class FoldersDAL
    {
        private EntityControl control;

        public FoldersDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddFolders(Folders folders)
        {
            control.AddEntity(folders);
        }

        public void UpdateFolders(Folders folders, int FolderID)
        {
            control.UpdateEntity(folders, FolderID);
        }

        public void DeleteFolders(Folders folders)
        {
            control.DeleteEntity(folders);
        }

        public IList GetAllFolderss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}