﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace upb.tabd.entidades
{
    public class DetalleFactura
    {
        public string Nombre_Producto { get; set; }
        public int Id_Producto { get; set; }
        public int Cantidad { get; set; }
        public int Precio_Unitario { get; set; }
    }
}
