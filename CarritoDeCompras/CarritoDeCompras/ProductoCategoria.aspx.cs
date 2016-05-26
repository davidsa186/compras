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
    public partial class ProductoCategoria : System.Web.UI.Page
    {
        private static string id;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];
            MostrarCategoria();          
        }
                
        private void MostrarCategoria()
        {
            CT.Categoria controladora = new CT.Categoria();
            int Id_Categoria = int.Parse(id);
            EN.Categoria categoria = controladora.ListaCategorias(Id_Categoria).FirstOrDefault();
            lblCategoria.Text = categoria.Nombre_Categoria;
        }

        [System.Web.Services.WebMethod]
        public static List<EN.Producto> GetProductoCategoria()
        {
            int Id_Categoria = int.Parse(id);
            CT.Producto controladora = new CT.Producto();
            return controladora.GetProductoCategoria(Id_Categoria);            
        }
    }
}