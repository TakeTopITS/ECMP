using System;

namespace ProjectMgt.Model
{
    public class ProjectMemberStudentCost
    {
        public ProjectMemberStudentCost()
        {
        }

        public virtual int id { get; set; }

        public virtual string StudentCode { get; set; }
        public virtual string StudentName { get; set; }

        public virtual string CostProject { get; set; }
        public virtual decimal CostDemial { get; set; }

        public virtual DateTime CollectTime { get; set; }

        public virtual decimal WangFeePerSemester { get; set; }
        public virtual decimal Meals { get; set; }
        public virtual decimal ActivityCost { get; set; }
        public virtual decimal CustodyAfterClass { get; set; }
        public virtual decimal ReplaceCosts { get; set; }

        public virtual string CreatUserCode { get; set; }

        public virtual string Status { get; set; }
    }
}