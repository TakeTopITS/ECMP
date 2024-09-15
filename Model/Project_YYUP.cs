namespace ProjectMgt.Model
{
    public class Project_YYUP
    {
        public Project_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual int ProjectID { get; set; }
        public virtual string ContractCode { get; set; }			//合同编号
        public virtual string CustomerServiceCode { get; set; }			//客户服务识别码
        public virtual string CustomerName { get; set; }			//客户名称
        public virtual string EncryptionKey { get; set; }			//加密序列号
        public virtual string ProjectSupervision { get; set; }			//项目监管
        public virtual string ProjectSize { get; set; }			//项目规模
        public virtual string SubordinateIndustry { get; set; }			//所属行业

        public virtual string SubordinateIndustryChild { get; set; }//子行业

        public virtual string ProductLine { get; set; }			//产品线

        public virtual string NumberSites { get; set; }			//站点数
        public virtual string Cycle { get; set; }			//周期
        public virtual string OutsourcingInformation { get; set; }			//外包信息
        public virtual string SignBillTime { get; set; }			//签单时间
        public virtual string OfferStandard { get; set; }			//报价标准
        public virtual string CustomMainProducts { get; set; }			//客户主营产品
        public virtual string ProgressStatus { get; set; }			//进展状态

        public virtual string IsSample { get; set; }                //是否样板
        public virtual string IsPrototype { get; set; }             //是否原型
        public virtual string IsStrategy { get; set; }              //是否战略
        public virtual string IsKey { get; set; }                   //是否重点
        public virtual string SalesProperty { get; set; }           //销售属性（新项目销售、老客户挖掘）

        public virtual string ModuleIDs { get; set; }
        public virtual string ModuleNames { get; set; }

        public virtual string DataBaseName { get; set; }

        public virtual string DataBaseSystemName { get; set; }

        public virtual string DataBaseHardwareName { get; set; }

        public virtual string ApplicationSystemName { get; set; }

        public virtual string ApplicationHardwareName { get; set; }

        public virtual string NetworkName { get; set; }

        public virtual int PlanID { get; set; }

        public virtual string CustomerAddress { get; set; }

        public virtual string VersionName { get; set; }                 //版本

        public virtual string CustomerServicePass { get; set; }         //密码

        public virtual int TemProjectID { get; set; }
    }
}