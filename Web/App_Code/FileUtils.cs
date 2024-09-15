using System;
using System.IO;
using System.Net;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for FileUtils
/// </summary>
public static class FileUtils
{
    /// <summary>
    /// 获取唯一文件名
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    public static string GetUniqueFileName(string fileName)
    {
        string postfixName = GetPostfixName(fileName);

        StringBuilder sb = new StringBuilder();
        sb.Append(Guid.NewGuid().ToString("N"));
        sb.Append('.');
        sb.Append(postfixName);

        return sb.ToString();
    }

    /// <summary>
    /// 获取日期格式的文件名.
    ///     如20100529.jpg
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    public static string GetFileNameByDate(string fileName)
    {
        string postfixName = GetPostfixName(fileName);

        StringBuilder sb = new StringBuilder();
        sb.Append(DateTime.Now.ToString("yyyyMMdd"));
        sb.Append('.');
        sb.Append(postfixName);

        return sb.ToString();
    }

    /// <summary>
    /// 获取时间格式的文件名.
    ///     如111523.jpg
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    public static string GetFileNameByTime(string fileName)
    {
        string postfixName = GetPostfixName(fileName);

        StringBuilder sb = new StringBuilder();
        sb.Append(DateTime.Now.ToString("hhmmss"));
        sb.Append('.');
        sb.Append(postfixName);

        return sb.ToString();
    }

    /// <summary>
    /// 获取日期时间格式的文件名.
    ///     如20100529111523.jpg
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    public static string GetFileNameByDateTime(string fileName)
    {
        string postfixName = GetPostfixName(fileName);

        StringBuilder sb = new StringBuilder();
        sb.Append(DateTime.Now.ToString("yyyyMMddhhmmss"));
        sb.Append(DateTime.Now.Millisecond.ToString());   // 附加毫秒
        sb.Append('.');
        sb.Append(postfixName);

        return sb.ToString();
    }

    /// <summary>
    /// 获取文件后缀名
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    public static string GetPostfixName(string fileName)
    {
        int idx = fileName.LastIndexOf(".");
        return fileName.Substring(idx + 1);
    }

    /// <summary>
    /// 根据路径（非URL）获取文件名
    /// </summary>
    /// <param name="filePath"></param>
    /// <returns></returns>
    public static string GetFileNameByPath(string filePath)
    {
        if (String.IsNullOrEmpty(filePath))
        {
            throw new ArgumentException("文件名不能为空", "filePath");
        }

        int idx = filePath.LastIndexOf('\\');
        if (idx == -1)
        {
            return filePath;
        }

        return filePath.Substring(idx + 1);
    }

    /// <summary>
    /// 根据URL获取文件名
    /// </summary>
    /// <param name="fileUrl"></param>
    /// <returns></returns>
    public static string GetFileNameByUrl(string fileUrl)
    {
        if (String.IsNullOrEmpty(fileUrl))
        {
            throw new ArgumentException("文件url不能为空", "fileUrl");
        }

        int idx = fileUrl.LastIndexOf('/');
        if (idx == -1 || fileUrl[idx - 1] == '/')
        {
            return "";
        }

        string str = fileUrl.Substring(idx + 1);
        int i = str.IndexOf('?');
        if (i != -1)
        {
            return str.Substring(0, i);
        }

        return fileUrl.Substring(idx + 1);
    }

    /// <summary>
    /// 获取文件名称（不包括文件后缀名）
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    public static string GetFileName(string fileName)
    {
        if (String.IsNullOrEmpty(fileName))
        {
            return String.Empty;
        }

        int idx = fileName.LastIndexOf(".");
        if (idx == -1)
        {
            return fileName;
        }
        return fileName.Remove(idx);
    }

    /// <summary>
    /// 下载文件.
    /// </summary>
    /// <param name="path"></param>
    /// <param name="fileName"></param>
    /// <param name="response"></param>
    /// <param name="shouldDelete"></param>
    public static void Download(string path, string fileName, HttpResponse response, bool shouldDelete)
    {
        if (string.IsNullOrEmpty(path) || !File.Exists(path))
            throw new FileNotFoundException("未能找到文件，" + path + " 不存在或已删除。");

        FileInfo file = new FileInfo(path);
        fileName = HttpUtility.UrlEncode(string.IsNullOrEmpty(fileName) ? file.Name : fileName);

        response.Clear();
        response.AddHeader("Pragma", "public");
        response.AddHeader("Expires", "0");
        response.AddHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        response.AddHeader("Content-Type", "application/force-download");
        response.AddHeader("Content-Type", "application/octet-stream");
        response.AddHeader("Content-Type", "application/download");
        response.AddHeader("Content-Disposition", String.Format("attachment; filename={0}", fileName));
        response.AddHeader("Content-Transfer-Encoding", "binary");
        response.AddHeader("Content-Length", file.Length.ToString());

        response.WriteFile(path);
        response.Flush();

        if (shouldDelete)
        {
            File.Delete(path);
        }
    }

    /// <summary>
    /// 下载远程文件保存到本地.
    /// </summary>
    /// <param name="remotingFile"></param>
    /// <param name="localFile"></param>
    public static void DownloadToLocal(string remotingFile, string localFile)
    {
        using (WebClient downloadClient = new WebClient())
        {
            try
            {
                downloadClient.DownloadFile(remotingFile, localFile);
            }
            catch
            {
                byte[] data = downloadClient.DownloadData(remotingFile);
                using (FileStream stream = File.Open(localFile, FileMode.OpenOrCreate))
                {
                    stream.Write(data, 0, data.Length);
                    stream.Close();
                }
            }
            downloadClient.Dispose();
        }
    }
}