using System;
using System.IO;
using System.Web;

/// <summary>
/// LogClass 的摘要说明
/// </summary>
public class LogClass
{
    public LogClass()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /**//// <summary>

        /// 写入日志文件
        /// </summary>
        /// <param name="input"></param>
    public static void WriteLogFile(string input)
    {
        /**/
        ///指定日志文件的目录
        ///

        //string strLogDirectory = HttpContext.Current.Server.MapPath(HttpContext.Current.Server.MapPath("Doc") + "\\Log");
        //ShareClass.CreateDirectory(strLogDirectory);

        string fname;

        fname = HttpContext.Current.Server.MapPath("Doc") + "\\Log\\LogFile.txt";
        /**/
        ///定义文件信息对象

        FileInfo finfo = new FileInfo(fname);
        if (!finfo.Exists)
        {
            ShareClass.CreateDirectory(HttpContext.Current.Server.MapPath("Doc") + "\\Log");

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
                File.Move(fname, HttpContext.Current.Server.MapPath("Doc") + "\\Log\\" + "BackupLogFile" + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".txt");

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

            /**/
            ///写入“Log Entry : ”
            w.Write("\n\rLog Entry : ");

            /**/
            ///写入当前系统时间并换行
            w.Write("{0} {1} \n\r", DateTime.Now.ToLongTimeString(),
                DateTime.Now.ToLongDateString());

            /**/
            ///写入日志内容并换行
            w.Write(input + "\n\r");

            /**/
            ///写入------------------------------------“并换行
            w.Write("\n\r------------------------------------\n\r");

            /**/
            ///清空缓冲区内容，并把缓冲区内容写入基础流
            w.Flush();

            /**/
            ///关闭写数据流
            w.Close();
        }
    }
}