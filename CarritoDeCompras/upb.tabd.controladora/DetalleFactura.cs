using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BR = upb.tabd.broker;
using EN = upb.tabd.entidades;


namespace upb.tabd.controladora
{
    public class DetalleFactura
    {
        private BR.TABD_FinalEntities db = new BR.TABD_FinalEntities();
        public List<EN.DetalleFactura> ObtenerFactura(int id_factura)
        {
            List<EN.DetalleFactura> listado = new List<EN.DetalleFactura>();

            try
            {
                var resultado = from c in db.Detalle_Factura
                                join p in db.Producto on c.Id_Producto equals p.Id_Producto
                                where c.Id_Factura == id_factura
                                select new { c.Id_Producto, c.Cantidad, c.Precio_Unitario, p.Nombre_Producto };

                foreach (var item in resultado)
                {
                    EN.DetalleFactura detalle = new EN.DetalleFactura();
                    detalle.Id_Producto = item.Id_Producto;
                    detalle.Nombre_Producto = item.Nombre_Producto;
                    detalle.Cantidad = item.Cantidad;
                    detalle.Precio_Unitario = item.Precio_Unitario;
                    listado.Add(detalle);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return listado;
        }
    }
}
