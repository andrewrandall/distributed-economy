using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MetalMine
{
    [Route("labor")]
    [ApiController]
    public class LaborController : ControllerBase
    {
        [HttpPost]
        public ActionResult Labor()
        {
            Db.OnHand += 50;
            return Ok();
        }
    }
}
