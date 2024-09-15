using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

/// <summary>
/// Summary description for Dispatch
/// </summary>
public class Dispatch : IDisposable
{
    public Dispatch()
    {
    }

    private Queue<object> objectCodeQueue = new Queue<object>(2048);

    public void Add(object item)
    {
        lock (this)
        {
            if (!objectCodeQueue.Contains(item))
            {
                objectCodeQueue.Enqueue(item);
            }
        }
    }

    public string GetQueueObjectCode(string strXLCode)
    {
        string strQueueObjectCode = string.Empty;
        lock (this)
        {
            try
            {
                int intIsExistRumber = 0;
                //可以考慮一次取100個號碼存放在內存中，程序直接從內存取，取完，再從數據庫取至內存，以此類推
                do
                {
                    if (objectCodeQueue.Count > 0)
                    {
                        strQueueObjectCode = objectCodeQueue.Dequeue().ToString();
                    }
                    else
                    {
                        //从数据库取出最小的物资代码，然后存100个物资代码号到队列中
                        string strMinObjectCodeHQL = string.Format("select COUNT(1) as RowNumber from T_WZObject where XLCode = '{0}'", strXLCode);
                        DataTable dtMinObjectCode = ShareClass.GetDataSetFromSql(strMinObjectCodeHQL, "strMinObjectCodeHQL").Tables[0];
                        int intCount = 0;
                        int.TryParse(dtMinObjectCode.Rows[0]["RowNumber"] == DBNull.Value ? "0" : dtMinObjectCode.Rows[0]["RowNumber"].ToString(), out intCount);
                        for (int i = 1; i <= 100; i++)
                        {
                            int intRumberCode = intCount + i;
                            string strNewObjectCode = string.Empty;
                            StringBuilder sbObjectCode = new StringBuilder();
                            for (int j = 4 - intRumberCode.ToString().Length; j > 0; j--)
                            {
                                sbObjectCode.Append("0");
                            }
                            strNewObjectCode = strXLCode + sbObjectCode.ToString() + intRumberCode.ToString();
                            Add(strNewObjectCode);
                        }
                        // 取一个物资代码号
                        strQueueObjectCode = objectCodeQueue.Dequeue().ToString();
                    }
                    //判断所取的物资代号是否已存在
                    string strIsExistObjectCodeHQL = string.Format("select COUNT(1) as RowNumber from T_WZObject where ObjectCode = '{0}'", strQueueObjectCode);
                    DataTable dtIsExistObjectCode = ShareClass.GetDataSetFromSql(strIsExistObjectCodeHQL, "strIsExistObjectCodeHQL").Tables[0];

                    int.TryParse(dtIsExistObjectCode.Rows[0]["RowNumber"].ToString(), out intIsExistRumber);
                } while (intIsExistRumber > 0);
            }
            catch (Exception ex)
            { }
        }
        return strQueueObjectCode;
    }

    public bool CheckIsExistObjectCode()
    {
        bool IsExixt = false;
        lock (this)
        {
            try
            {
                if (objectCodeQueue.Count > 0)
                {
                    IsExixt = true;
                }
            }
            catch (Exception ex)
            { }
        }
        return IsExixt;
    }

    public void Dispose()
    {
    }
}