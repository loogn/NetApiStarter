using CoreHelper;
using CoreHelper.Ioc;
using CoreHelper.Mapper;
using Loogn.OrmLite;
using Microsoft.AspNetCore.Http;
using project.backsite.Models;
using project.dal;
using project.model;
using project.model.entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace project.backsite.Services
{
    [AppService]
    public class SystemUserService
    {
        [Autowired]
        SystemUserDao systemUserDao;
        [Autowired]
        SystemUser_RoleDao systemUser_RoleDao;
        [Autowired]
        SystemUser_ResDao systemUser_ResDao;
        [Autowired]
        private IHttpContextAccessor httpContextAccessor;

        public SystemUserService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public ResultObject<SystemUser> Login(LoginRequest request)
        {

            var password = EncryptHelper.MD5Encrypt(request.Password);
            var emp = systemUserDao.Login(request.Username, password);
            if (emp == null)
            {
                return new ResultObject<SystemUser>("用户名或密码不正确");
            }
            else
            {
                if (emp.Status == 1)
                {
                    return new ResultObject<SystemUser>(emp) { Msg = "登录成功" };
                }
                else
                {
                    return new ResultObject<SystemUser>("用户状态不正确");
                }
            }
        }

        public ResultObject Edit(EditEmployeeRequest request)
        {


            var m = SimpleMapper.Map<SystemUser>(request);

            var flag = 0L;
            if (m.Id > 0)
            {
                flag = systemUserDao.Update(m);
            }
            else
            {
                if (systemUserDao.ExistsUsername(request.Username))
                {
                    return new ResultObject("用户名已存在");
                }
                m.Password = EncryptHelper.MD5Encrypt(request.Password);
                flag = systemUserDao.Insert(m);
                m.Id = (int)flag;
            }
            if (flag > 0)
            {
                // C_Employee.SetCacheOne(m.Id);
            }
            return new ResultObject(flag > 0);
        }

        public ResultObject ResetPassword(long id, string password)
        {
            if (string.IsNullOrEmpty(password))
            {
                return new ResultObject("密码不能为空");
            }
            var pwd = EncryptHelper.MD5Encrypt(password);
            var flag = systemUserDao.ResetPassword(id, pwd);
            return new ResultObject(flag);
        }

        public SystemUser SingleById(int id)
        {
            return systemUserDao.SingleById(id);
        }

        public OrmLitePageResult<SystemUser> SelectPage(string nickname, int pageIndex, int pageSize)
        {
            return systemUserDao.SelectPage(nickname, pageIndex, pageSize);
        }
        public List<SystemUser> SelectAll()
        {
            return systemUserDao.SelectAll();
        }

        public List<SystemUser> SelectAllNormal()
        {
            return systemUserDao.SelectAllNormal();
        }

        public ResultObject UpdatePassword(UpdatePasswordRequest request)
        {
            var userid = httpContextAccessor.HttpContext.User.GetUserId();
            var emp = systemUserDao.SingleById(userid);
            var oldPassword = EncryptHelper.MD5Encrypt(request.OldPassword);
            if (oldPassword != emp.Password)
            {
                return new ResultObject("原密码不正确");
            }
            var newPasword = EncryptHelper.MD5Encrypt(request.NewPassword);
            var flag = systemUserDao.ResetPassword(emp.Id, newPasword);
            return new ResultObject(flag > 0);
        }

        public HashSet<long> GetEmployeeResourceIds(long employeeId)
        {
            return systemUserDao.GetEmployeeResourceIds(employeeId);
        }

        public ResultObject SetAvatar(string avatar)
        {
            var userid = httpContextAccessor.HttpContext.User.GetUserId();
            var flag = systemUserDao.SetAvatar(userid, avatar);
            return new ResultObject(flag);
        }

        public ResultObject Delete(long userId)
        {
            var flag = systemUserDao.DeleteById(userId);
            if (flag > 0)
            {
                systemUser_RoleDao.DeleteByUserId(userId);
                systemUser_ResDao.DeleteByEmployeeId(userId);
            }
            return new ResultObject(flag);
        }
    }
}
