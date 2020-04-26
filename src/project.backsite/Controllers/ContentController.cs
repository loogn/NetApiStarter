using System;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using project.backsite.Services;
using project.backsite.Tools;
using project.backsite.Tools.Auth;
using project.dao.Models;

namespace project.backsite.Controllers
{
    /// <summary>
    /// 内容
    /// </summary>
    public class ContentController : MvcController
    {
        [Autowired] private AdService _adService;
        [Autowired] private DataDictService _dataDictService;
        [Autowired] private AnnouncementService _announcementService;
        [Autowired] private ArticleService _articleService;

        public ContentController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        #region 广告

        [ResItem]
        public ActionResult AdList(string title, int? typeId, DateTime? start, DateTime? end, int page = 1)
        {
            var pageSize = 10;
            var plist = _adService.SelectList(title, typeId, start, end, page, pageSize);
            ViewBag.plist = plist.ToStaticPagedList();

            var positionList = _dataDictService.GetTreeList(DataDictType.广告类型);
            ViewBag.positionList = positionList;

            return View();
        }
        
        public ActionResult AdEdit(int id = 0)
        {
            var m = _adService.SingleById(id);
            if (m == null)
            {
                m = new Ad()
                {
                    Status = 1,
                    OrderNum = 999,
                    BeginTime = DateTime.Now,
                    EndTime = DateTime.Now.AddYears(1)
                };
            }

            ViewBag.m = m;

            var positionList = _dataDictService.GetTreeList(DataDictType.广告类型);
            ViewBag.positionList = positionList;

            return View();
        }

        [ResItem("编辑","/content/AdList")]
        public ActionResult AdSave(Ad m)
        {
            var ro = _adService.Edit(m);
            return Json(ro);
        }

        public ActionResult AdDel(long id)
        {
            var ro = _adService.Del(id);
            return Json(ro);
        }

        #endregion

        #region 广告类型

        // GET
        public IActionResult AdTypeList(int parentId = 0)
        {
            var list = _dataDictService.GetList(DataDictType.广告类型, parentId);
            ViewBag.list = list;
            var parentList = _dataDictService.GetParentList(DataDictType.广告类型, parentId, true);
            ViewBag.parentList = parentList;

            ViewBag.parentId = parentId;
            ViewBag.maxLevel = 1;

            return View();
        }

        public IActionResult AdTypeEdit(long id, int parentId = 0)
        {
            var dataDict = _dataDictService.Single(id);
            if (dataDict == null)
            {
                dataDict = new DataDict();
                dataDict.ParentId = parentId;
                dataDict.OrderNum = 999;
                dataDict.Status = 1;
            }

            ViewBag.m = dataDict;
            return View();
        }

        [ResItem("编辑","/content/AdTypeList")]
        public IActionResult AdTypeSave(DataDict dataDict)
        {
            dataDict.DictType = DataDictType.广告类型;
            var ro = _dataDictService.Edit(dataDict);
            return Json(ro);
        }

        public IActionResult AdTypeDel(long id)
        {
            var ro = _dataDictService.DeleteById(id);
            return Json(ro);
        }

        #endregion

        #region 公告

        public ActionResult AnnList(string title, int page = 1)
        {
            var pageSize = 10;
            var plist = _announcementService.SelectList(title, page, pageSize);
            ViewBag.plist = plist.ToStaticPagedList();

            return View();
        }

        public ActionResult AnnEdit(int id = 0)
        {
            var m = _announcementService.SingleById(id);
            if (m == null)
            {
                m = new Announcement()
                {
                    Status = 1,
                };
            }

            ViewBag.m = m;

            return View();
        }

        [ResItem("编辑","/content/AnnList")]
        public ActionResult AnnSave(Announcement m)
        {
            var ro = _announcementService.Edit(m);
            return Json(ro);
        }

        public ActionResult AnnDel(long id)
        {
            var ro = _announcementService.Del(id);
            return Json(ro);
        }

        #endregion


        #region 文章

        public ActionResult ArticleList(string title, int? typeId, int page = 1)
        {
            var pageSize = 10;
            var plist = _articleService.SelectList(title, typeId, page, pageSize);
            ViewBag.plist = plist.ToStaticPagedList();

            var positionList = _dataDictService.GetTreeList(DataDictType.文章类型);
            ViewBag.positionList = positionList;

            return View();
        }

        public ActionResult ArticleEdit(int id = 0)
        {
            var m = _articleService.SingleById(id);
            if (m == null)
            {
                m = new Article()
                {
                    Status = 1,
                    OrderNum = 999,
                };
            }

            ViewBag.m = m;

            var positionList = _dataDictService.GetTreeList(DataDictType.文章类型);
            ViewBag.positionList = positionList;

            return View();
        }

        [ResItem("编辑","/content/ArticleList")]
        public ActionResult ArticleSave(Article m)
        {
            var ro = _articleService.Edit(m);
            return Json(ro);
        }

        public ActionResult ArticleDel(long id)
        {
            var ro = _articleService.Del(id);
            return Json(ro);
        }

        #endregion

        #region 文章类型

        // GET
        public IActionResult ArticleTypeList(int parentId = 0)
        {
            var list = _dataDictService.GetList(DataDictType.文章类型, parentId);
            ViewBag.list = list;
            var parentList = _dataDictService.GetParentList(DataDictType.文章类型, parentId, true);
            ViewBag.parentList = parentList;

            ViewBag.parentId = parentId;
            ViewBag.maxLevel = 1;

            return View();
        }

        public IActionResult ArticleTypeEdit(long id, int parentId = 0)
        {
            var dataDict = _dataDictService.Single(id);
            if (dataDict == null)
            {
                dataDict = new DataDict();
                dataDict.ParentId = parentId;
                dataDict.OrderNum = 999;
                dataDict.Status = 1;
            }

            ViewBag.m = dataDict;
            return View();
        }

        [ResItem("编辑","/Content/ArticleTypeList")]
        public IActionResult ArticleTypeSave(DataDict dataDict)
        {
            dataDict.DictType = DataDictType.文章类型;
            var ro = _dataDictService.Edit(dataDict);
            return Json(ro);
        }

        public IActionResult ArticleTypeDel(long id)
        {
            var ro = _dataDictService.DeleteById(id);
            return Json(ro);
        }

        #endregion
    }
}