using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
    }
}