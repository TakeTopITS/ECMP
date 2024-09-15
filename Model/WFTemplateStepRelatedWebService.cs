namespace ProjectMgt.Model
{
    public class WFTemplateStepRelatedWebService
    {
        public WFTemplateStepRelatedWebService()
        {
        }

        public virtual int ID { get; set; }
        public virtual string TemName { get; set; }
        public virtual int StepSortNumber { get; set; }
        public virtual string StepName { get; set; }
        public virtual string WebServiceName { get; set; }
        public virtual string MethodName { get; set; }
        public virtual string Comment { get; set; }
    }
}