﻿using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao;
 using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
 using project.dao.Models;

 namespace project.backsite.Services
{
    [AppService]
    public class RegionService
    {
        [Autowired] private RegionDao regionDao;
        public RegionService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public List<Region> GetProvince()
        {
            return regionDao.SelectWhere("Level", 1);
        }

        public List<Region> GetCity(int provinceCode)
        {
            return regionDao.SelectWhere(DictBuilder.GT("Code", provinceCode).LT("Code", provinceCode + 10000).EQ("Level", 2));
        }

        public List<Region> GetCounty(int cityCode)
        {
            return regionDao.SelectWhere(DictBuilder.GT("Code", cityCode).LT("Code", cityCode + 100).EQ("Level", 3));
        }
    }
}
