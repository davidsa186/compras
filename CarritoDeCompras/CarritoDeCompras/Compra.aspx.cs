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
    public partial class Compra : System.Web.UI.Page
    {
        int id_factura  ;
        protected void Page_Load(object sender, EventArgs e)
        {

            string id = Request.QueryString["id"];
            id_factura = int.Parse(id.ToString());

            if (!IsPostBack)
            {
                ConsultarFactura(id_factura);

            }
        }

        public void ConsultarFactura(int id_factura)
        {
            CT.DetalleFactura control = new CT.DetalleFactura();

            var listaRuta = control.ObtenerFactura(id_factura);

            gridFactura.DataSource = listaRuta;
            gridFactura.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {           
            string[] arg = new string[2];
            arg = e.CommandArgument.ToString().Split(';');
            string Id_Producto = arg[0];
            string Nombre_Producto = arg[1];

            lblId_Producto.Text = Id_Producto;
            lblNombre_Producto.Text = Nombre_Producto;
            panel_grid.Visible = false;
            panel_comentarios.Visible = true;            
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                
            }
            catch (Exception ex)
            {
                
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            panel_comentarios.Visible = false;
            panel_grid.Visible = true;            
        }
    }
}