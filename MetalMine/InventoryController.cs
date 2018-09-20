using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MetalMine
{
    [Route("inventory")]
    [ApiController]
    public class InventoryController : ControllerBase
    {
        [HttpGet]
        public ActionResult Get()
        {
            return Ok(Db.OnHand);
        }
    }
}
