using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class QMRewardPunishmentDAL
    {
        private EntityControl control;

        public QMRewardPunishmentDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddQMRewardPunishment(QMRewardPunishment qMRewardPunishment)
        {
            control.AddEntity(qMRewardPunishment);
        }

        public void UpdateQMRewardPunishment(QMRewardPunishment qMRewardPunishment, string Code)
        {
            control.UpdateEntity(qMRewardPunishment, Code);
        }

        public void DeleteQMRewardPunishment(QMRewardPunishment qMRewardPunishment)
        {
            control.DeleteEntity(qMRewardPunishment);
        }

        public IList GetAllQMRewardPunishments(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}