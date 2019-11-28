using project.dao.DataModel;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;

namespace project.service.ApiModel
{
    /// <summary>
    /// 登录用户请求的基类
    /// </summary>
    public class LoginedRequest
    {
        #region jwt相关用户
        private ClaimsPrincipal _claimsPrincipal { get; set; }

        public ClaimsPrincipal GetPrincipal()
        {
            return _claimsPrincipal;
        }
        public void SetPrincipal(ClaimsPrincipal user)
        {
            _claimsPrincipal = user;
        }

        public string GetClaimValue(string name)
        {
            return _claimsPrincipal?.FindFirst(name)?.Value;
        }
        #endregion


        #region 数据库相关用户 （如果有必要的话）
        //不用属性是因为swagger中会显示出来
        private User _user;
        public User GetUser()
        {
            return _user;
        }
        public void SetUser(User user)
        {
            _user = user;
        }
        #endregion
    }

    public class PagedRequest : LoginedRequest
    {
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
    }
}
