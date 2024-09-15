using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 焊工持证项目
    /// </summary>
    public class TRHolderWelderDAL
    {
        private EntityControl control;

        public TRHolderWelderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTRHolderWelder(TRHolderWelder tRHolderWelder)
        {
            control.AddEntity(tRHolderWelder);
        }

        public void UpdateTRHolderWelder(TRHolderWelder tRHolderWelder, int ID)
        {
            control.UpdateEntity(tRHolderWelder, ID);
        }

        public void DeleteTRHolderWelder(TRHolderWelder tRHolderWelder)
        {
            control.DeleteEntity(tRHolderWelder);
        }

        public IList GetAllTRHolderWelders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}