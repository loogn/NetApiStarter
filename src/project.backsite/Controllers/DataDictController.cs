using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using project.backsite.Services;
using project.dao.Models;

namespace project.backsite.Controllers
{
    public class DataDictController:Controller
    {
        private int maxLevel = 3;
        private int dictType = 1;
        [Autowired] private DataDictService _dataDictService;
        
        public DataDictController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }
        
        
        // GET
        public IActionResult List(int parentId=0)
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
        public IActionResult DoEdit(DataDict dataDict)
        {
            dataDict.DictType = dictType;
            var ro = _dataDictService.Edit(dataDict);
            return Json(ro);
        }
    }
}