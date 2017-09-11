using System.Linq;
using System.Threading;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using VirtusServices.Model;

namespace VirtusServices.Controllers
{
    [Route("api/[controller]")]
    public class EventsController : Controller
    {
        // GET api/values
        [HttpGet]
        public EventsCollection Get([FromQuery]int from, [FromQuery] int take)
        {
            Thread.Sleep(1000);
            using (var r = System.IO.File.OpenText("Events.json"))
            {
                var json = r.ReadToEnd();
                var events = JsonConvert.DeserializeObject<EventsCollection>(json);
                events.Events = events.Events.OrderByDescending(eventItem => eventItem.Date); 
                events.Events = events.Events.Skip(from).Take(take);
                return events;
            }
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }
    }
}