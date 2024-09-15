using System;

namespace ProjectMgt.Model
{
    public class TaskTestRecord
    {
        public TaskTestRecord()
        {
        }

        private int id;
        private int taskID;
        private int testCaseID;
        private string command;
        private DateTime testTime;
        private string testerCode;
        private string testerName;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int TaskID
        {
            get { return taskID; }
            set { taskID = value; }
        }

        public virtual int TestCaseID
        {
            get { return testCaseID; }
            set { testCaseID = value; }
        }

        public virtual string Command
        {
            get { return command; }
            set { command = value; }
        }

        public virtual DateTime TestTime
        {
            get { return testTime; }
            set { testTime = value; }
        }

        public virtual string TesterCode
        {
            get { return testerCode; }
            set { testerCode = value; }
        }

        public virtual string TesterName
        {
            get { return testerName; }
            set { testerName = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}