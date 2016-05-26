using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace upb.tabd.entidades
{
    public class ListaDeDeseos
    {
        public string IdUsuario { get; set; }
        public List<int> ProductosDeseados { get; set; }
    }
}
