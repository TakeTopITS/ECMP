using System.Linq;
using System.Text;

public class CheckSignature
{
    /// <summary>
    /// 在网站没有提供Token（或传入为null）的情况下的默认Token。
    /// </summary>
    public const string Token = "TakeTopMISToken";

    /// <summary>
    /// 检查签名是否正确
    /// </summary>
    /// <param name="signature"></param>
    /// <param name="timestamp"></param>
    /// <param name="nonce"></param>
    /// <param name="token"></param>
    /// <returns></returns>
    public static bool Check(string signature, string timestamp, string nonce, string token)
    {
        return signature == GetSignature(timestamp, nonce, token);
    }

    /// <summary>
    /// 返回正确的签名
    /// </summary>
    /// <param name="timestamp"></param>
    /// <param name="nonce"></param>
    /// <param name="token"></param>
    /// <returns></returns>
    public static string GetSignature(string timestamp, string nonce, string token = Token)
    {
        token = token ?? Token;
        string[] arr = new[] { token, timestamp, nonce }.OrderBy(z => z).ToArray();
        string arrString = string.Join("", arr);
        System.Security.Cryptography.SHA1 sha1 = System.Security.Cryptography.SHA1.Create();
        byte[] sha1Arr = sha1.ComputeHash(Encoding.UTF8.GetBytes(arrString));
        StringBuilder enText = new StringBuilder();
        foreach (var b in sha1Arr)
        {
            enText.AppendFormat("{0:x2}", b);
        }
        return enText.ToString();
    }
}