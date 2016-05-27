using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CT = upb.tabd.controladora;
using EN = upb.tabd.entidades;

namespace CarritoDeCompras
{
    public partial class ComprasRealizadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarFacturas();
            }
        }

        private void CargarFacturas()
        {
            Guid Id_Cliente = (Guid)Membership.GetUser(HttpContext.Current.User.Identity.Name).ProviderUserKey;
            CT.Factura controladora = new CT.Factura();
            List<EN.Factura> facturas = controladora.ConsultarFacturasCliente(Id_Cliente);
            gridFacturas.DataSource = facturas;
            gridFacturas.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {

            string id = (string)e.CommandArgument;
            int Id_factura = int.Parse(id);


            Response.Redirect("FacturaCompra.aspx?id=" + Id_factura);
        }
    }
}