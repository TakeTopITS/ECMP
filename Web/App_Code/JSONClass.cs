using System.Data;
using System.Text;

/// <summary>
/// Summary description for JSONClass
/// </summary>
public class JSONClass
{
    public JSONClass()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// DataTable 转换成 JSON
    /// </summary>
    /// <param name="dt">需要转换的DataTable</param>
    /// <returns>JSON结构字符串</returns>
    public static string DtToSON(DataTable dt)
    {
        StringBuilder jsonBuilder = new StringBuilder();
        //  jsonBuilder.Append("{");
        //jsonBuilder.Append(dt.TableName.ToString());
        //jsonBuilder.Append("\":[");
        jsonBuilder.Append("[");
        bool isNull = false;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            isNull = true;
            jsonBuilder.Append("{");
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                jsonBuilder.Append("\"");
                jsonBuilder.Append(dt.Columns[j].ColumnName);
                jsonBuilder.Append("\":\"");
                jsonBuilder.Append(dt.Rows[i][j].ToString());
                jsonBuilder.Append("\",");
            }
            jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
            jsonBuilder.Append("},");
        }
        if (isNull)
        {
            jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
        }
        jsonBuilder.Append("]");
        // jsonBuilder.Append("}");

        return jsonBuilder.ToString();
    }

    /// </summary>
    /// <param name="dt"> Requires a Datatable</param>
    /// <returns> return a string contain JSON DataTable </returns>
    public string JSON_DataTable(DataTable dt)
    {
        /****************************************************************************
         * Without goingin to the depth of the functioning of this Method, i will try to give an overview
         * As soon as this method gets a DataTable it starts to convert it into JSON String,
         * it takes each row and ineach row it creates an array of cells and in each cell is having its data
         * on the client side it is very usefull for direct binding of object to  TABLE.
         * Values Can be Access on clien in this way. OBJ.TABLE[0].ROW[0].CELL[0].DATA
         * NOTE: One negative point. by this method user will not be able to call any cell by its name.
         * *************************************************************************/
        StringBuilder JsonString = new StringBuilder();
        JsonString.Append("{ ");
        JsonString.Append("\"TABLE\":[{ ");
        JsonString.Append("\"ROW\":[ ");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            JsonString.Append("{ ");
            JsonString.Append("\"COL\":[ ");
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                if (j < dt.Columns.Count - 1)
                {
                    JsonString.Append("{" + "\"DATA\":\"" + dt.Rows[i][j].ToString() + "\"},");
                }
                else if (j == dt.Columns.Count - 1)
                {
                    JsonString.Append("{" + "\"DATA\":\"" + dt.Rows[i][j].ToString() + "\"}");
                }
            }
            /*end Of String*/
            if (i == dt.Rows.Count - 1)
            {
                JsonString.Append("]} ");
            }
            else
            {
                JsonString.Append("]}, ");
            }
        }
        JsonString.Append("]}]}");
        return JsonString.ToString();
    }

    /// </summary>
    /// <param name="dt"> Requires a Datatable</param>
    /// <returns> return a string contain JSON DataTable </returns>
    public static string JSONFlexi(DataTable dt, string id, string total, string page)
    {
        /****************************************************************************
         * Without goingin to the depth of the functioning of this Method, i will try to give an overview
         * As soon as this method gets a DataTable it starts to convert it into JSON String,
         * it takes each row and ineach row it creates an array of cells and in each cell is having its data
         * on the client side it is very usefull for direct binding of object to  TABLE.
         * Values Can be Access on clien in this way. OBJ.TABLE[0].ROW[0].CELL[0].DATA
         * NOTE: One negative point. by this method user will not be able to call any cell by its name.
         * *************************************************************************/
        StringBuilder JsonString = new StringBuilder();

        JsonString.Append("{\"total\":\"" + total + "\",\"page\":\"" + page + "\",\"rows\":[ ");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            JsonString.Append("{ ");
            JsonString.Append("\"id\":\"" + dt.Rows[i][id].ToString() + "\",\"cell\":[ ");
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                if (j < dt.Columns.Count - 1)
                {
                    JsonString.Append("\"" + dt.Rows[i][j].ToString() + "\",");
                }
                else if (j == dt.Columns.Count - 1)
                {
                    JsonString.Append("\"" + dt.Rows[i][j].ToString() + "\"");
                }
            }
            /*end Of String*/
            if (i == dt.Rows.Count - 1)
            {
                JsonString.Append("]} ");
            }
            else
            {
                JsonString.Append("]}, ");
            }
        }
        JsonString.Append("]}");

        return JsonString.ToString();
    }

    public string CreateJsonParameters(DataTable dt)
    {
        /* /****************************************************************************
         * Without goingin to the depth of the functioning of this Method, i will try to give an overview
         * As soon as this method gets a DataTable it starts to convert it into JSON String,
         * it takes each row and in each row it grabs the cell name and its data.
         * This kind of JSON is very usefull when developer have to have Column name of the .
         * Values Can be Access on clien in this way. OBJ.HEAD[0].<ColumnName>
         * NOTE: One negative point. by this method user will not be able to call any cell by its index.
         * *************************************************************************/
        StringBuilder JsonString = new StringBuilder();
        //Exception Handling
        if (dt != null && dt.Rows.Count > 0)
        {
            JsonString.Append("{ ");
            JsonString.Append("\"Head\":[ ");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                JsonString.Append("{ ");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    if (j < dt.Columns.Count - 1)
                    {
                        JsonString.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":" + "\"" + dt.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == dt.Columns.Count - 1)
                    {
                        JsonString.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":" + "\"" + dt.Rows[i][j].ToString() + "\"");
                    }
                }
                /*end Of String*/
                if (i == dt.Rows.Count - 1)
                {
                    JsonString.Append("} ");
                }
                else
                {
                    JsonString.Append("}, ");
                }
            }
            JsonString.Append("]}");
            return JsonString.ToString();
        }
        else
        {
            return null;
        }
    }
}