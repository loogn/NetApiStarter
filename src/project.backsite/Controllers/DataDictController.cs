using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using project.backsite.Services;
using project.dao.Models;

namespace project.backsite.Controllers
{
    /// <summary>
    /// 数据字典管理模板
    /// </summary>
    public class DataDictController : Controller
    {
        private int maxLevel = 3; //最大层级
        private int dictType = DataDictType.广告类型; //类型 
        [Autowired] private DataDictService _dataDictService;

        public DataDictController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }


        // GET
        public IActionResult List(int parentId = 0)
        {
            var list = _dataDictService.GetList(dictType, parentId);
            ViewBag.list = list;
            var parentList = _dataDictService.GetParentList(dictType, parentId, true);
            ViewBag.parentList = parentList;

            ViewBag.parentId = parentId;
            ViewBag.maxLevel = maxLevel;

            return View();
        }

        public IActionResult Edit(long id, int parentId = 0)
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

        public IActionResult Save(DataDict dataDict)
        {
            dataDict.DictType = dictType;
            var ro = _dataDictService.Edit(dataDict);
            return Json(ro);
        }

        public IActionResult Del(long id)
        {
            var ro = _dataDictService.DeleteById(id);
            return Json(ro);
        }
    }
}