using System.Net;
using System.Net.Mail;
using System.Text;

namespace CoreHelper
{
    public class EmailHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="smtpServer">SMTP服务器</param>
        /// <param name="enableSsl">是否启用SSL加密</param>
        /// <param name="userName">登录帐号</param>
        /// <param name="pwd">登录密码</param>
        /// <param name="nickName">发件人昵称</param>
        /// <param name="fromMail">发件人</param>
        /// <param name="toMail">收件人</param>
        /// <param name="subject">主题</param>
        /// <param name="bodys">内容</param>
        public static bool SendMail(string smtpServer, int smptPort, bool enableSsl, string userName, string pwd, string nickName, string fromMail, string toMail, string subject, string bodys)
        {
            try
            {
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.Host = smtpServer;
                smtpClient.Credentials = new NetworkCredential(userName, pwd);
                smtpClient.EnableSsl = enableSsl;
                smtpClient.Port = smptPort;
                MailAddress fromAddress = new MailAddress(fromMail, nickName);
                MailAddress toAddress = new MailAddress(toMail);

                MailMessage mailMessage = new MailMessage(fromAddress, toAddress);
                mailMessage.Subject = subject;
                mailMessage.Body = bodys;
                mailMessage.BodyEncoding = Encoding.Default;
                mailMessage.IsBodyHtml = true;
                mailMessage.Priority = MailPriority.Normal;
                smtpClient.Send(mailMessage);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
