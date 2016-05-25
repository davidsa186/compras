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
    public partial class Producto : System.Web.UI.Page
    {
        private static string id;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];
        }

        [System.Web.Services.WebMethod]
        public static EN.Producto GetProducto()
        {
            int IdProducto = int.Parse(id);
            CT.Producto controladora = new CT.Producto();            
            return controladora.GetProducto(IdProducto);
        }     
    }
}