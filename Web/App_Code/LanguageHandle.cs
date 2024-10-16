using System;
using System.Collections;
using System.Resources;
using System.Web;

public static class LanguageHandle
{
    public static ResXResourceReader resxReader;
    public static IDictionaryEnumerator dict;

    static LanguageHandle()
    {
        resxReader = new ResXResourceReader(getSystemLanguageFile());
        dict = resxReader.GetEnumerator();
    }

    //取得语言字符串
    public static string GetWord(string strKey)
    {
        try
        {
            foreach (DictionaryEntry d in resxReader)
            {
                if (d.Key.ToString() == strKey)
                {
                    string result = d.Value.ToString();
                    resxReader.Close();
                    return RemovePunctuation(result);
                }
            }
            resxReader.Close();
            return strKey;
        }
        catch
        {
            return strKey;
        }

    }

    //取得语言文件
    private static string getSystemLanguageFile()
    {
        string strLangFile, strLangCode;

        try
        {
            strLangCode = HttpContext.Current.Session["LangCode"].ToString();

            if (strLangCode != null && strLangCode != "")
            {
                strLangFile = HttpContext.Current.Server.MapPath("Language/lang." + strLangCode + ".resx");
            }
            else
            {
                strLangFile = HttpContext.Current.Server.MapPath("Language/lang.zh-CN.resx");
            }

            return strLangFile;
        }
        catch (Exception err)
        {
            strLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];

            HttpContext.Current.Session["LangCode"] = strLangCode;

            return HttpContext.Current.Server.MapPath("Language/lang." + strLangCode + ".resx");
        }
    }

    public static string RemovePunctuation(string str)
    {
        str = str.Replace("\"", "'").Replace("“", "'").Replace("”", "'").Replace("\\", "");

        //.Replace("，", "")
        //.Replace(".", "")
        //.Replace("。", "")
        //.Replace("!", "")
        //.Replace("！", "")
        //.Replace("?", "")
        //.Replace("？", "")
        //.Replace(":", "")
        //.Replace("：", "")
        //.Replace(";", "")
        //.Replace("；", "")
        //.Replace("～", "")
        //.Replace("-", "")
        //.Replace("_", "")
        //.Replace("——", "")
        //.Replace("—", "")
        //.Replace("--", "")
        //.Replace("【", "")
        //.Replace("】", "")
        //.Replace("\\", "")
        //.Replace("(", "")
        //.Replace(")", "")
        //.Replace("（", "")
        //.Replace("）", "")
        //.Replace("#", "")
        //.Replace("$", "");

        return str;
    }

}