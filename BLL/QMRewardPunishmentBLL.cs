using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class QMRewardPunishmentBLL
    {
        public void AddQMRewardPunishment(QMRewardPunishment qMRewardPunishment)
        {
            QMRewardPunishmentDAL dal = new QMRewardPunishmentDAL();
            dal.AddQMRewardPunishment(qMRewardPunishment);
        }

        public void UpdateQMRewardPunishment(QMRewardPunishment qMRewardPunishment, string Code)
        {
            QMRewardPunishmentDAL dal = new QMRewardPunishmentDAL();
            dal.UpdateQMRewardPunishment(qMRewardPunishment, Code);
        }

        public void DeleteQMRewardPunishment(QMRewardPunishment qMRewardPunishment)
        {
            QMRewardPunishmentDAL dal = new QMRewardPunishmentDAL();
            dal.DeleteQMRewardPunishment(qMRewardPunishment);
        }

        public IList GetAllQMRewardPunishments(string strHQL)
        {
            QMRewardPunishmentDAL dal = new QMRewardPunishmentDAL();
            return dal.GetAllQMRewardPunishments(strHQL);
        }
    }
}