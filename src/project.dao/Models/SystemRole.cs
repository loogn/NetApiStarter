﻿
//-----------------------------------------------------------------------
// * Copyright (C) 2018 UU898 Enterprises All Rights Reserved
// * author  : auto generated by ModelGenerator
//-----------------------------------------------------------------------

using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 角色
    /// </summary>
    public partial class SystemRole
    {
        /// <summary>
        /// 
        /// </summary>
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }
        /// <summary>
        /// 角色名称
        /// </summary>
        public string Name { get; set; }
    }
}