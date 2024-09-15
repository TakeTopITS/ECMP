namespace ProjectMgt.Model
{
    public class WLTStepConditionExpression
    {
        public WLTStepConditionExpression()
        {
        }

        private int id;
        private int conID;
        private string expression;
        private string logicalOperator;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ConID
        {
            get { return conID; }
            set { conID = value; }
        }

        public virtual string Expression
        {
            get { return expression; }
            set { expression = value; }
        }

        public virtual string LogicalOperator
        {
            get { return logicalOperator; }
            set { logicalOperator = value; }
        }
    }
}