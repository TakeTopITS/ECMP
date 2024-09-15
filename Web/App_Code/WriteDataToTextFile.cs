using System;
using System.IO;
using System.Web;


/// <summary>
/// WriteDataToTextFile 的摘要说明
/// </summary>
public class WriteDataToTextFile
{
    public WriteDataToTextFile()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <param name="input"></param>
    public static void WriteTextFile(string strDirectory, string strFile, string input)
    {
        /**/
        ///指定日志文件的目录
        ///
        string fname;

        fname = HttpContext.Current.Server.MapPath(strDirectory) + "\\" + strFile;

        //判断是否存在相同内容
        if (IfExistsThisData(fname, input))
        {
            return;
        }

        /**/
        ///定义文件信息对象

        FileInfo finfo = new FileInfo(fname);
        if (!finfo.Exists)
        {
            ShareClass.CreateDirectory(HttpContext.Current.Server.MapPath(strDirectory));

            FileStream fs;
            fs = File.Create(fname);
            fs.Close();
            finfo = new FileInfo(fname);
        }

        try
        {
            /**/
            ///判断文件是否存在以及是否大于2K
            if (finfo.Length > 1024 * 1024 * 10)
            {
                /**/
                ///文件超过10MB则重命名
                File.Move(fname, HttpContext.Current.Server.MapPath(strDirectory) + "\\" + "BackupFile" + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".txt");

                /**/
                ///删除该文件
                //finfo.Delete();
            }
        }
        catch
        {
        }
        //finfo.AppendText();
        /**/
        ///创建只写文件流

        using (FileStream fs = finfo.OpenWrite())
        {
            /**/
            ///根据上面创建的文件流创建写数据流
            StreamWriter w = new StreamWriter(fs);

            /**/
            ///设置写数据流的起始位置为文件流的末尾
            w.BaseStream.Seek(0, SeekOrigin.End);

            ///写入日志内容并换行
            w.Write("\r\n");
            w.Write(input);

            /**/
            ///清空缓冲区内容，并把缓冲区内容写入基础流
            w.Flush();

            /**/
            ///关闭写数据流
            w.Close();
        }
    }

    protected static bool IfExistsThisData(string fileName, string pastr)
    {
        var filest = new FileStream(fileName, FileMode.Open, FileAccess.Read);
        using (var sr = new StreamReader(filest))
        {
            string strLine = sr.ReadLine(); //读取文件中的一行
            while (strLine != null) //判断是否为空,表示到文件最后一行了
            {
                if (strLine.Trim() == pastr.Trim())
                    return true;

                strLine = sr.ReadLine();
            }
        }

        return false;
    }
}