using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace fiap_githubactions_03.Controllers
{
    [Route("api/hello-world")]
    [ApiController]
    public class HelloWorldController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return this.Ok("Hello World!");
        }
    }
}
