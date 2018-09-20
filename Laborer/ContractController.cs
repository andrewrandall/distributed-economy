using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;

namespace Laborer.Controllers
{
    [Route("contract")]
    [ApiController]
    public class ContractController : ControllerBase
    {
        [HttpPut]
        public ActionResult Update(Contract contract)
        {
            Db.Contract = contract;
            return NoContent();
        }

        [HttpGet]
        public ActionResult Read()
        {
            return Ok(Db.Contract);
        }

        [HttpDelete]
        public ActionResult Delete()
        {
            Db.Contract = null;
            return NoContent();
        }
    }
}
