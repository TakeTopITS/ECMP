using System;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace ASP.App_Code.Data
{
    public class Hash
    {
        public static string SHA1(string src)
        {
            byte[] bytes = Encoding.ASCII.GetBytes(src);
            return Convert.ToBase64String(new SHA1CryptoServiceProvider().ComputeHash(bytes)).Replace("+", "-").Replace("/", "-").Replace("=", ".");
        }

        public static string ForPage(Page page)
        {
            return SHA1(page.Request.PhysicalPath);
        }
    }
}