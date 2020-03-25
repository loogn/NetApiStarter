using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;

namespace CoreHelper
{
    public static class StringHelper
    {
        public const string EmailReg =
            @"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-||_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+([a-z]+|\d|-|\.{0,1}|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])?([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

        public const string PhoneReg = @"^(1[34578][0-9])\d{8}$";

        public static string GetConsoleInput(string name)
        {
            Console.WriteLine("请输入 " + name + ":");
            return Console.ReadLine();
        }

        /// <summary>
        /// 阿拉伯数字转换汉字
        /// </summary>
        /// <param name="num">num</param>
        /// <returns></returns>
        public static string ToCapitalFigure(double num)
        {
            if (num >= 1000000000)
                throw new ArgumentException("超出转换范围：-1000000000 < 要转换的数字 < 1000000000");
            num = Math.Round(num, 2); //四舍五入，保留两位小数
            string intNum = ((int) Math.Abs(num)).ToString(CultureInfo.InvariantCulture);
            string[] upperList = {"零", "一", "二", "三", "四", "五", "六", "七", "八", "九"}; //把这个数组改成一、二、...
            string[] wei = {"", "十", "百", "千", "万", "亿"}; //这个数组改成十、百
            string[] upper = new string[intNum.Length];
            for (int i = 0; i < intNum.Length; i++)
            {
                if (i < intNum.Length - 1 && intNum[i] == intNum[i + 1] && intNum[i] == '0')
                    upper[i] = "";
                else
                    upper[i] = upperList[Int32.Parse(intNum[i].ToString(CultureInfo.InvariantCulture))];
            }

            for (int i = 0; i < upper.Length / 2; i++)
            {
                string temp = upper[i];
                upper[i] = upper[upper.Length - i - 1];
                upper[upper.Length - i - 1] = temp;
            }

            for (int i = 0; i < upper.Length; i++)
            {
                if (i < 4)
                {
                    if (i % 4 == 0)
                    {
                        if (upper[i].Equals(upperList[0]))
                            upper[i] = wei[i];
                        else
                            upper[i] += wei[i];
                    }
                    else if (!upper[i].Equals("") && !upper[i].Equals(upperList[0]))
                        upper[i] += wei[i];
                }
                else if (i < 9)
                {
                    if (i % 4 == 0)
                    {
                        if (upper[i].Equals(upperList[0]))
                            upper[i] = wei[3 + i / 4];
                        else
                            upper[i] += wei[3 + i / 4];
                    }
                    else if (i % 4 != 0 && !upper[i].Equals("") && !upper[i].Equals(upperList[0]))
                        upper[i] += wei[i % 4];
                }
            }

            string upperNum = "";
            for (int i = upper.Length - 1; i >= 0; i--)
            {
                upperNum += upper[i];
            }

            if (upperNum.IndexOf("十", StringComparison.Ordinal) == 1 &&
                upperNum.IndexOf("一", StringComparison.Ordinal) == 0)
                return upperNum.Replace("一十", "十");
            return upperNum;
        }


        #region html

        /// <summary>
        /// 替换特殊字符为空
        /// </summary>
        /// <param name="Htmlstring"></param>
        /// <returns></returns>
        public static string RemoveHTML(string Htmlstring)
        {
            if (!string.IsNullOrEmpty(Htmlstring))
            {
                Htmlstring = Htmlstring.Replace("'", "");
                Htmlstring = Regex.Replace(Htmlstring, @"<script[^ >]*? >.*?</script >", "", RegexOptions.IgnoreCase);
                //Htmlstring = Regex.Replace(Htmlstring, @"<(.[^ >]*) >", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"<[^>]*>", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"([\r\n])[\s]+", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"-- >", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"<!--.*", "", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(quot|#34);", "\"", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(amp|#38);", "&", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(lt|#60);", "<", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(gt|#62);", " >", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(nbsp|#160);", " ", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(iexcl|#161);", "\xa1", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(cent|#162);", "\xa2", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(pound|#163);", "\xa3", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&(copy|#169);", "\xa9", RegexOptions.IgnoreCase);
                Htmlstring = Regex.Replace(Htmlstring, @"&#(\d+);", "", RegexOptions.IgnoreCase);
                Htmlstring = Htmlstring.Replace("<", "");
                Htmlstring = Htmlstring.Replace(">", "");
                Htmlstring = Htmlstring.Replace("\r\n", "");
                Htmlstring = Htmlstring.Replace("/", "");
                return Htmlstring;
            }

            return Htmlstring;
        }

        /// <summary>
        /// 还原恢复html表示 如回车-><br/>
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static string RecoverHTML(string text)
        {
            if (!string.IsNullOrEmpty(text))
            {
                text = text.Replace("<", "&lt;");
                text = text.Replace(">", "&gt;");
                text = text.Replace(" ", "&nbsp;");
                text = text.Replace("\n", "<br/>");
                text = text.Replace("\r\n", "<br/>");
                return text;
            }
            else
            {
                return text;
            }
        }

        #endregion

        /// <summary>
        /// 截取字符串
        /// </summary>
        /// <param name="str">原字符串</param>
        /// <param name="number">截取数量</param>
        /// <param name="ending">结尾字符串</param>
        /// <returns></returns>
        public static string CutString(string str, int number, string ending = "…")
        {
            if (str == null || str.Length == 0 || number <= 0) return "";
            if (str.Length <= number)
            {
                return str;
            }
            else
            {
                return str.Substring(0, number) + ending;
            }
        }


        #region RandomCode

        /// <summary>
        /// 得到随机字符字符串
        /// </summary>
        /// <param name="count"></param>
        /// <returns></returns>
        public static string GetRandomCode(int count = 4)
        {
            char[] charset =
            {
                '2', '3', '4', '5', '6', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P',
                'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
                'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
            };
            return GetRandom(count, charset);
        }

        /// <summary>
        /// 得到随机字符字符串(包含特殊字符串)
        /// </summary>
        /// <param name="count"></param>
        /// <returns></returns>
        public static string GetRandomSpecialCode(int count = 4)
        {
            char[] charset =
            {
                '2', '3', '4', '5', '6', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P',
                'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
                'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*',
                '(', ')', '{', '}', '<', '>', '?'
            };
            return GetRandom(count, charset);
        }

        /// <summary>
        /// 得到随机数字字符串
        /// </summary>
        /// <param name="count"></param>
        /// <returns></returns>
        public static string GetRandomNumber(int count = 4)
        {
            return GetRandom(count, new char[] {'1', '2', '3', '4', '5', '6', '8', '9', '0'});
        }

        static string GetRandom(int count, char[] charset)
        {
            Random rnd = new Random();
            //生成验证码字符串
            char[] codes = new char[count];
            for (int i = 0; i < count; i++)
            {
                codes[i] = charset[rnd.Next(charset.Length)];
            }

            return new string(codes);
        }

        #endregion


        #region 分隔字符串

        public static string[] Split(string items, params char[] separator)
        {
            if (string.IsNullOrEmpty(items))
            {
                return new string[0];
            }

            return items.Split(separator, StringSplitOptions.RemoveEmptyEntries);
        }

        public static IEnumerable<T> Split<T>(string items, Func<string, T> parser, params char[] separator)
        {
            if (string.IsNullOrEmpty(items))
            {
                return new T[0];
            }

            var parts = items.Split(separator, StringSplitOptions.RemoveEmptyEntries);
            return parts.Select<string, T>(parser);
        }

        public static string Repeat(string item, int count)
        {
            if (count <= 0) return "";

            List<string> items = new List<string>(count);
            for (int i = 0; i < count; i++)
            {
                items.Add(item);
            }

            return String.Concat(items);
        }

        #endregion

        #region JoinStr

        public static string JoinStr<T>(IEnumerable<T> values, string separator = ",")
        {
            if (values == null)
            {
                return string.Empty;
            }

            return string.Join<T>(separator, values);
        }

        public static string JoinStr(IEnumerable<string> values, string separator = ",")
        {
            if (values == null)
            {
                return string.Empty;
            }

            return string.Join(separator, values);
        }

        public static string JoinStr(object[] values, string separator = ",")
        {
            if (values == null)
            {
                return string.Empty;
            }

            return string.Join(separator, values);
        }

        public static string JoinStr(string[] values, string separator = ",")
        {
            if (values == null)
            {
                return string.Empty;
            }

            return string.Join(separator, values);
        }

        #endregion

        #region 判断

        public static bool IsCellphone(string phone)
        {
            if (string.IsNullOrWhiteSpace(phone))
            {
                return false;
            }

            return Regex.IsMatch(phone, PhoneReg);
        }

        public static bool IsEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
            {
                return false;
            }

            return Regex.IsMatch(email, EmailReg);
        }

        /// <summary>
        /// 是否是中国公民身份证号
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public static bool IsIDCard(string Id)
        {
            if (string.IsNullOrWhiteSpace(Id)) return false;
            if (Id.Length == 18)
            {
                return isIDCard18(Id);
            }
            else if (Id.Length == 15)
            {
                return isIDCard15(Id);
            }
            else
            {
                return false;
            }
        }

        private static bool isIDCard18(string Id)
        {
            long n = 0;
            if (long.TryParse(Id.Remove(17), out n) == false || n < Math.Pow(10, 16) ||
                long.TryParse(Id.Replace('x', '0').Replace('X', '0'), out n) == false)
            {
                return false; //数字验证
            }

            string address =
                "11x22x35x44x53x12x23x36x45x54x13x31x37x46x61x14x32x41x50x62x15x33x42x51x63x21x34x43x52x64x65x71x81x82x91";
            if (address.IndexOf(Id.Remove(2)) == -1)
            {
                return false; //省份验证
            }

            string birth = Id.Substring(6, 8).Insert(6, "-").Insert(4, "-");
            DateTime time = new DateTime();
            if (DateTime.TryParse(birth, out time) == false)
            {
                return false; //生日验证
            }

            string[] arrVarifyCode = ("1,0,x,9,8,7,6,5,4,3,2").Split(',');
            string[] Wi = ("7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2").Split(',');
            char[] Ai = Id.Remove(17).ToCharArray();
            int sum = 0;
            for (int i = 0; i < 17; i++)
            {
                sum += int.Parse(Wi[i]) * int.Parse(Ai[i].ToString());
            }

            int y = -1;
            Math.DivRem(sum, 11, out y);
            if (arrVarifyCode[y] != Id.Substring(17, 1).ToLower())
            {
                return false; //校验码验证
            }

            return true; //符合GB11643-1999标准
        }

        private static bool isIDCard15(string Id)
        {
            long n = 0;
            if (long.TryParse(Id, out n) == false || n < Math.Pow(10, 14))
            {
                return false; //数字验证
            }

            string address =
                "11x22x35x44x53x12x23x36x45x54x13x31x37x46x61x14x32x41x50x62x15x33x42x51x63x21x34x43x52x64x65x71x81x82x91";
            if (address.IndexOf(Id.Remove(2)) == -1)
            {
                return false; //省份验证
            }

            string birth = Id.Substring(6, 6).Insert(4, "-").Insert(2, "-");
            DateTime time = new DateTime();
            if (DateTime.TryParse(birth, out time) == false)
            {
                return false; //生日验证
            }

            return true; //符合15位身份证标准
        }

        #endregion

        public static int? AsInt32(string str)
        {
            if (string.IsNullOrWhiteSpace(str)) return null;
            int val;
            if (int.TryParse(str, out val))
            {
                return val;
            }

            return null;
        }

        public static int AsInt32(string str, int defaultValue)
        {
            if (string.IsNullOrWhiteSpace(str)) return defaultValue;
            int val;
            if (int.TryParse(str, out val))
            {
                return val;
            }

            return defaultValue;
        }

        public static long? AsInt64(string str)
        {
            if (string.IsNullOrWhiteSpace(str)) return null;
            long val;
            if (long.TryParse(str, out val))
            {
                return val;
            }

            return null;
        }

        public static byte? AsByte(string str)
        {
            if (string.IsNullOrWhiteSpace(str)) return null;
            byte val;
            if (byte.TryParse(str, out val))
            {
                return val;
            }

            return null;
        }

        public static float? AsSingle(string str)
        {
            if (string.IsNullOrWhiteSpace(str)) return null;
            float val;
            if (float.TryParse(str, out val))
            {
                return val;
            }

            return null;
        }

        public static double? AsDouble(string str)
        {
            if (string.IsNullOrWhiteSpace(str)) return null;
            double val;
            if (double.TryParse(str, out val))
            {
                return val;
            }

            return null;
        }

        public static DateTime? AsDateTime(string str)
        {
            if (string.IsNullOrWhiteSpace(str)) return null;
            DateTime val;
            if (DateTime.TryParse(str, out val))
            {
                return val;
            }

            return null;
        }

        public static decimal? AsDecimal(string str)
        {
            if (string.IsNullOrWhiteSpace(str)) return null;
            decimal val;
            if (decimal.TryParse(str, out val))
            {
                return val;
            }

            return null;
        }

        public static decimal AsDecimal(string str, decimal defaultValue = 0)
        {
            if (string.IsNullOrWhiteSpace(str)) return defaultValue;
            decimal val;
            if (decimal.TryParse(str, out val))
            {
                return val;
            }

            return defaultValue;
        }

        public static string GetMaskPhone(string str)
        {
            if (string.IsNullOrEmpty(str))
            {
                return str;
            }

            if (str.Length == 11)
            {
                return str.Substring(0, 3) + "****" + str.Substring(7);
            }

            var herf = str.Length / 2;
            return new string('*', herf) + str.Substring(herf);
        }
    }
}