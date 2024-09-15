using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    /// <summary>
    /// 工评任务书
    /// </summary>
    public class WPQMWorkReviewCommitBLL
    {
        public void AddWPQMWorkReviewCommit(WPQMWorkReviewCommit wPQMWorkReviewCommit)
        {
            WPQMWorkReviewCommitDAL dal = new WPQMWorkReviewCommitDAL();
            dal.AddWPQMWorkReviewCommit(wPQMWorkReviewCommit);
        }

        public void UpdateWPQMWorkReviewCommit(WPQMWorkReviewCommit wPQMWorkReviewCommit, int ID)
        {
            WPQMWorkReviewCommitDAL dal = new WPQMWorkReviewCommitDAL();
            dal.UpdateWPQMWorkReviewCommit(wPQMWorkReviewCommit, ID);
        }

        public void DeleteWPQMWorkReviewCommit(WPQMWorkReviewCommit wPQMWorkReviewCommit)
        {
            WPQMWorkReviewCommitDAL dal = new WPQMWorkReviewCommitDAL();
            dal.DeleteWPQMWorkReviewCommit(wPQMWorkReviewCommit);
        }

        public IList GetAllWPQMWorkReviewCommits(string strHQL)
        {
            WPQMWorkReviewCommitDAL dal = new WPQMWorkReviewCommitDAL();
            return dal.GetAllWPQMWorkReviewCommits(strHQL);
        }
    }
}