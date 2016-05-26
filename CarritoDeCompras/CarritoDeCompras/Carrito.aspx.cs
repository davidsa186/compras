using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using CT = upb.tabd.controladora;
using EN = upb.tabd.entidades;

namespace CarritoDeCompras
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static List<EN.Producto>  CargarCarrito(int[] ItemsCarrito)
        {
            CT.Producto controladora = new CT.Producto();
            List<EN.Producto> resultado = new List<EN.Producto>();
            if (ItemsCarrito==null)
            {
                resultado.DefaultIfEmpty();
            }
            else
            {
                resultado = controladora.GetProductosCarro(ItemsCarrito);
            }

            return resultado;
        }

        [System.Web.Services.WebMethod]
        public static int Comprar(int totalNeto, List<EN.DetalleFactura> productos)
        {
            int idFactura = -1;
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Guid Id_Cliente = (Guid)Membership.GetUser(HttpContext.Current.User.Identity.Name).ProviderUserKey;
                EN.Factura factura = new EN.Factura
                {
                    Id_Cliente = Id_Cliente,
                    Descuento = 10,
                    Total_Neto = totalNeto
                };
                CT.Factura controladora = new CT.Factura();
                idFactura = controladora.CrearFactura(factura, productos);
            }
            return idFactura;
        }
    }
}