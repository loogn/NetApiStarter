using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.api.Controllers
{
    [Authorize]
    [Produces("application/json")]
    [Route("api/[controller]/[action]")]
    public class ApiController : ControllerBase
    {
    }
}
