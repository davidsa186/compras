using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BR = upb.tabd.broker;
using EN = upb.tabd.entidades;


namespace upb.tabd.controladora
{
    public class Factura
    {

        private BR.TABD_FinalEntities db = new BR.TABD_FinalEntities();
        public int CrearFactura(EN.Factura facturita, List<EN.DetalleFactura> detalle)
        {
            foreach (var item in detalle)
            {
                BR.Producto productoComprado = db.Producto.Where(x => x.Id_Producto == item.Id_Producto).FirstOrDefault();
                if (productoComprado.Stock < item.Cantidad)
                {
                    throw new Exception("No hay suficiente Stock para alguno de los productos.");
                }
            }
            try
            {
                BR.Factura factura = new BR.Factura();
                factura.Fecha = DateTime.Now;
                factura.Id_Cliente = facturita.Id_Cliente;
                factura.Total_Neto = facturita.Total_Neto;
                factura.Descuento = facturita.Descuento;
                int total = (int)(facturita.Total_Neto - (facturita.Total_Neto * (facturita.Descuento / 100.0)));
                factura.Total = total;
                db.Factura.Add(factura);
                //que nos explique porque lo cogia detallefactura sin guardar cambios
                db.SaveChanges();
                int id_factura = factura.Id_Factura;
                foreach (var item in detalle)
                {
                    BR.Detalle_Factura detallefactura = new BR.Detalle_Factura();
                    detallefactura.Id_Factura = id_factura;
                    detallefactura.Id_Producto = item.Id_Producto;
                    detallefactura.Precio_Unitario = item.Precio_Unitario;
                    detallefactura.Cantidad = item.Cantidad;
                    BR.Producto productoComprado = db.Producto.Where(x => x.Id_Producto == item.Id_Producto).FirstOrDefault();
                    productoComprado.Stock = productoComprado.Stock - item.Cantidad;
                    db.Detalle_Factura.Add(detallefactura);
                }
                db.SaveChanges();
                return id_factura;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public EN.Factura ConsultarFactura(int id_factura) {
            BR.Factura consulta = db.Factura.Where(x => x.Id_Factura == id_factura).FirstOrDefault();

            EN.Factura factura = new EN.Factura();
            factura.Descuento = consulta.Descuento;
            factura.Total = consulta.Total;
            factura.Total_Neto = consulta.Total_Neto;
            factura.Id_Factura = consulta.Id_Factura;
            factura.Fecha = consulta.Fecha;

            return factura;
        }

        public List<EN.Factura> ConsultarFacturasCliente(Guid idCliente)
        {
            List<EN.Factura> resultado = new List<EN.Factura>();
            var listado = db.Factura.Where(x => x.Id_Cliente == idCliente).ToList();
            foreach (var item in listado)
            {
                EN.Factura f = ConsultarFactura(item.Id_Factura);
                resultado.Add(f);
            }
            return resultado;
        }
    }
}
