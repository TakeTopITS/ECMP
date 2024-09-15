using System.Data;

/// <summary>
/// XMLProcess 的摘要说明
/// </summary>
public class XMLProcess
{
    public XMLProcess()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public string DbToXML(string strCmdText, string strTableName, string strDocSavePath)
    {
        DataSet ds = ShareClass.GetDataSetFromSql(strCmdText, strTableName);
        ds.WriteXml(strDocSavePath);

        return strDocSavePath;
    }
}