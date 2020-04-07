using System;
using System.Collections.Generic;

namespace lotteryapi.Repositories.Entities
{
    public partial class Lotto649
    {
        public int Term { get; set; }
        public sbyte No1 { get; set; }
        public sbyte No2 { get; set; }
        public sbyte No3 { get; set; }
        public sbyte No4 { get; set; }
        public sbyte No5 { get; set; }
        public sbyte No6 { get; set; }
        public sbyte NoS { get; set; }
        public string Creater { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
