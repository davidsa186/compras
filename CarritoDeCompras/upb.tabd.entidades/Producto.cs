using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace upb.tabd.entidades
{
    public class Producto
    {
        public int Id_Producto { get; set; }
        public string Nombre_Producto { get; set; }
        public int Precio { get; set; }
        public int Stock { get; set; }
        public Categoria Categoria { get; set; }
        public Proveedor Proveedor { get; set; }
        public string Imagen { get; set; }
    }
}
