using System;

namespace VirtusServices.Model
{
    public class Event
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageURL { get; set; }
        public DateTime Date { get; set; }
        public string Place { get; set; }
    }
}