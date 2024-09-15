using System;
using System.Data;
using System.IO;
using System.Text;
using System.Xml;

/// <summary>
/// Summary description for DataToXml
/// </summary>
public class DataToXml
{
    public DataToXml()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string ConvertDataTableToXML(DataTable xmlDS)
    {
        MemoryStream stream = null;
        XmlTextWriter writer = null;
        try
        {
            stream = new MemoryStream();
            writer = new XmlTextWriter(stream, Encoding.Default);
            xmlDS.WriteXml(writer);
            int count = (int)stream.Length;
            byte[] arr = new byte[count];
            stream.Seek(0, SeekOrigin.Begin);
            stream.Read(arr, 0, count);
            UTF8Encoding utf = new UTF8Encoding();
            return utf.GetString(arr).Trim();
        }
        catch
        {
            return String.Empty;
        }
        finally
        {
            if (writer != null) writer.Close();
        }
    }

    public static DataSet ConvertXMLToDataSet(string xmlData)
    {
        StringReader stream = null;
        XmlTextReader reader = null;
        try
        {
            DataSet xmlDS = new DataSet();
            stream = new StringReader(xmlData);
            reader = new XmlTextReader(stream);
            xmlDS.ReadXml(reader);
            return xmlDS;
        }
        catch (Exception ex)
        {
            string strTest = ex.Message;
            return null;
        }
        finally
        {
            if (reader != null)
                reader.Close();
        }
    }
}