using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    /// <summary>
    /// 工评任务书
    /// </summary>
    public class WPQMWorkReviewCommitDAL
    {
        private EntityControl control;

        public WPQMWorkReviewCommitDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWPQMWorkReviewCommit(WPQMWorkReviewCommit wPQMWorkReviewCommit)
        {
            control.AddEntity(wPQMWorkReviewCommit);
        }

        public void UpdateWPQMWorkReviewCommit(WPQMWorkReviewCommit wPQMWorkReviewCommit, int ID)
        {
            control.UpdateEntity(wPQMWorkReviewCommit, ID);
        }

        public void DeleteWPQMWorkReviewCommit(WPQMWorkReviewCommit wPQMWorkReviewCommit)
        {
            control.DeleteEntity(wPQMWorkReviewCommit);
        }

        public IList GetAllWPQMWorkReviewCommits(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}