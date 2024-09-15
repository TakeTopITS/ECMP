namespace ProjectMgt.Model
{
    public class ProjectDataBase_YYUP
    {
        public ProjectDataBase_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual int ProjectID { get; set; }
        public virtual string DataBaseCode { get; set; }//编号
        public virtual string DataBaseName { get; set; }//名称
        public virtual string DataBaseType { get; set; }//客户软硬件信息，数据库(DataBase)，数据库操作系统(DataBaseSystem)，数据库硬件(DataBaseHardware)，应用服务器操作系统(ApplicationSystem),应用服务器硬件(ServerHardware),网络状况(NetworkStatus)
    }
}