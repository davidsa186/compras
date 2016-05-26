using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace upb.tabd.entidades
{
    public class Factura
    {
        public Guid Id_Cliente { get; set; }
        public int Total_Neto { get; set; }
        public int Descuento { get; set; }

    }
}
