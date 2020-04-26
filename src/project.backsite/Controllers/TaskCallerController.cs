using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using project.backsite.Services;
using project.backsite.Tools;
using project.dao.Models;

namespace project.backsite.Controllers
{
    public class TaskCallerController : MvcController
    {
        [Autowired] private TimedTaskService _timedTaskService;
        [Autowired] private DelayTaskService _delayTaskService;
        [Autowired] private ExecuteLogService _executeLogService;

        public TaskCallerController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        #region 延迟任务
        // GET: DelayTask
        public ActionResult DelayList(string name, int page = 1)
        {
            var pageSize = 10;
            var plist = _delayTaskService.SearchList(name, page, pageSize);
            ViewBag.plist = plist.ToStaticPagedList();
            return View();
        }

        public ActionResult DelayEdit(long id = 0)
        {
            var m = _delayTaskService.SingleById(id);
            if (m == null)
            {
                m = new DelayTask();
                m.Enable = true;
                m.Method = "GET";
                m.TimeoutSeconds = 15;
                m.MaxRetryCount = 3;
                m.RetrySeconds = 30;
            }

            ViewBag.m = m;
            return View();
        }

        public ActionResult DelaySave(DelayTask m)
        {
            var ro = _delayTaskService.Edit(m);
            return Json(ro);
        }

        public ActionResult DelayDelete(long id)
        {
            var ro = _delayTaskService.Delete(id);
            return Json(ro);
        }
        
        #endregion 延迟任务

        #region 定时任务

        // GET: TimedTask
        public ActionResult TimedList(string name, bool? enable, int page = 1)
        {
            var pageSize = 10;
            var plist = _timedTaskService.SearchList(name, enable, page, pageSize);
            ViewBag.plist = plist.ToStaticPagedList();
            return View();
        }

        public ActionResult TimedEdit(long id = 0)
        {
            var m = _timedTaskService.SingleById(id);
            if (m == null)
            {
                m = new TimedTask();
                m.Enable = true;
                m.Method = "GET";
                m.TimeoutSeconds = 15;
            }
            ViewBag.m = m;
            return View();
        }
        public ActionResult TimedSave(TimedTask m)
        {
            var ro = _timedTaskService.Edit(m);
            return Json(ro);
        }

        public ActionResult TimedDelete(long id)
        {
            var ro = _timedTaskService.Delete(id);
            return Json(ro);
        }

        #endregion
        
        public ActionResult LogList(long taskId = 0, int taskType = 0, int status = 0, int page = 1)
        {
            var pageSize = 10;
            var plist = _executeLogService.SearchList(taskId, taskType, status, page, pageSize);
            ViewBag.plist = plist.ToStaticPagedList();
            return View();
        }
        
    }
}