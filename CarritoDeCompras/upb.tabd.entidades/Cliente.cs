using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace upb.tabd.entidades
{
    public class Cliente
    {
        //organizar lo del id_cliente si es guid o q
        public Guid Id_Cliente { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public int Cedula { get; set; }
        //public Ciudad Ciudad { get; set; }



    }
}
