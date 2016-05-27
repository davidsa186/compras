using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace upb.tabd.entidades
{
    public class Cliente
    {
        public Guid Id_Cliente { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public long Cedula { get; set; }
        public int Id_Ciudad { get; set; }
        public long[] Array_Telefonos { get; set; }
    }
}
