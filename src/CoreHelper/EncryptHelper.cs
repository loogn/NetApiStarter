using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace CoreHelper
{
    /// <summary>
    /// 加密帮助类
    /// </summary>
    public static class EncryptHelper
    {
        /// <summary>
        /// MD5加密
        /// </summary>
        /// <param name="plaintext">明文</param>
        /// <param name="bytesEncoding">编码</param>
        /// <returns></returns>
        public static string MD5Encrypt(string plaintext, Encoding bytesEncoding)
        {
            byte[] sourceBytes = bytesEncoding.GetBytes(plaintext);
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] hashedBytes = md5.ComputeHash(sourceBytes);
            return BitConverter.ToString(hashedBytes).Replace("-", "");
        }
        /// <summary>
        /// 以UTF8编码做MD5加密
        /// </summary>
        /// <param name="plaintext">明文</param>
        /// <returns></returns>
        public static string MD5Encrypt(string plaintext)
        {
            return MD5Encrypt(plaintext, Encoding.UTF8);
        }



        #region 字符串加密

        private const string DefaultDESKey = "loogn789";
        /// <summary>   
        /// 利用DES加密算法加密字符串（可解密）   
        /// </summary>   
        /// <param name="plaintext">被加密的字符串</param>   
        /// <param name="key">密钥（只支持8个字节的密钥）</param>   
        /// <returns>加密后的字符串</returns>   
        public static string EncryptString(string plaintext, string key = DefaultDESKey)
        {
            DES des = new DESCryptoServiceProvider();
            des.Key = Encoding.UTF8.GetBytes(key);
            des.IV = Encoding.UTF8.GetBytes(key);
            byte[] bytes = Encoding.UTF8.GetBytes(plaintext);
            byte[] resultBytes = des.CreateEncryptor().TransformFinalBlock(bytes, 0, bytes.Length);
            return Convert.ToBase64String(resultBytes);
        }


        /// <summary>   
        /// 利用DES解密算法解密密文（可解密）   
        /// </summary>   
        /// <param name="ciphertext">被解密的字符串</param>   
        /// <param name="key">密钥（只支持8个字节的密钥，同前面的加密密钥相同）</param>   
        /// <returns>返回被解密的字符串</returns>   
        public static string DecryptString(string ciphertext, string key = DefaultDESKey)
        {
            DES des = new DESCryptoServiceProvider();
            des.Key = Encoding.UTF8.GetBytes(key);
            des.IV = Encoding.UTF8.GetBytes(key);
            byte[] bytes = Convert.FromBase64String(ciphertext);
            byte[] resultBytes = des.CreateDecryptor().TransformFinalBlock(bytes, 0, bytes.Length);
            return Encoding.UTF8.GetString(resultBytes);
        }

        #endregion

        #region 文件加密

        /// <summary>
        /// 加密文件
        /// </summary>
        /// <param name="inputFilename">要加密的文件的决定路径</param>
        /// <param name="outputFilename">加密后文件的输出路径</param>
        /// <param name="key">加密key,只支持8个字节</param>
        public static void EncryptFile(string inputFilename, string outputFilename, string key = DefaultDESKey)
        {
            using (FileStream fsInput = new FileStream(inputFilename, FileMode.Open, FileAccess.Read, FileShare.Read))
            {
                EncryptFile(fsInput, outputFilename, key);
            }
        }

        /// <summary>
        /// 加密流
        /// </summary>
        /// <param name="inputStream">要加密的流</param>
        /// <param name="outputFilename">加密后文件的输出路径</param>
        /// <param name="key">加密key,只支持8个字节</param>
        public static void EncryptFile(Stream inputStream, string outputFilename, string key = DefaultDESKey)
        {
            DESCryptoServiceProvider DES = new DESCryptoServiceProvider();
            DES.Key = ASCIIEncoding.ASCII.GetBytes(key);
            DES.IV = ASCIIEncoding.ASCII.GetBytes(key);
            ICryptoTransform desencrypt = DES.CreateEncryptor();
            using (FileStream fsEncrypted = new FileStream(outputFilename, FileMode.Create, FileAccess.Write))
            using (CryptoStream cryptostream = new CryptoStream(fsEncrypted, desencrypt, CryptoStreamMode.Write))
            {
                byte[] bytearrayinput = new byte[inputStream.Length];
                inputStream.Read(bytearrayinput, 0, bytearrayinput.Length);
                cryptostream.Write(bytearrayinput, 0, bytearrayinput.Length);
            }
        }

        /// <summary>
        /// 解密文件到文件
        /// </summary>
        /// <param name="inputFilename">加密文件的路径</param>
        /// <param name="outputFilename">解密后文件的输出路径</param>
        /// <param name="key">解密key,只支持8个字节</param>
        public static void DecryptFile(string inputFilename, string outputFilename, string key = DefaultDESKey)
        {
            using (FileStream fsDecrypted = new FileStream(outputFilename, FileMode.Create, FileAccess.Write))
            {
                DecryptFile(inputFilename, fsDecrypted, key);
            }
        }

        /// <summary>
        /// 解密文件到流
        /// </summary>
        /// <param name="inputFilename">加密文件的路径</param>
        /// <param name="outStream">解密输出的流</param>
        /// <param name="key">解密key,只支持8个字节</param>
        public static void DecryptFile(string inputFilename, Stream outStream, string key = DefaultDESKey)
        {
            DESCryptoServiceProvider DES = new DESCryptoServiceProvider();
            DES.Key = ASCIIEncoding.ASCII.GetBytes(key);
            DES.IV = ASCIIEncoding.ASCII.GetBytes(key);
            ICryptoTransform desdecrypt = DES.CreateDecryptor();

            using (FileStream fsread = new FileStream(inputFilename, FileMode.Open, FileAccess.Read))
            using (CryptoStream cryptostreamDecr = new CryptoStream(fsread, desdecrypt, CryptoStreamMode.Read))
            {
                byte[] buffer = new byte[1024];
                int count = 0;
                while ((count = cryptostreamDecr.Read(buffer, 0, buffer.Length)) > 0)
                {
                    outStream.Write(buffer, 0, count);
                }
            }
        }

        #endregion


        public static string SHA1Encrypt(string str_sha1_in, Encoding bytesEncoding)
        {
            SHA1 sha1 = new SHA1CryptoServiceProvider();
            byte[] bytes_sha1_in = bytesEncoding.GetBytes(str_sha1_in);
            byte[] bytes_sha1_out = sha1.ComputeHash(bytes_sha1_in);
            string str_sha1_out = BitConverter.ToString(bytes_sha1_out);
            str_sha1_out = str_sha1_out.Replace("-", "");
            return str_sha1_out;
        }

        public static string SHA1Encrypt(string str_sha1_in)
        {
            return SHA1Encrypt(str_sha1_in, Encoding.UTF8);
        }



        /// <summary>
        /// hmacSHA256加密算法
        /// </summary>
        /// <param name="plaintext"></param>
        /// <param name="secret"></param>
        /// <returns></returns>
        public static string HmacSHA256(string plaintext, string secret)
        {
            secret = secret ?? "";
            var encoding = new UTF8Encoding();
            byte[] keyByte = encoding.GetBytes(secret);
            byte[] messageBytes = encoding.GetBytes(plaintext);
            using (var hmacsha256 = new HMACSHA256(keyByte))
            {
                byte[] hashmessage = hmacsha256.ComputeHash(messageBytes);
                return BitConverter.ToString(hashmessage).Replace("-", "").ToLower();
            }
        }

    }
}
