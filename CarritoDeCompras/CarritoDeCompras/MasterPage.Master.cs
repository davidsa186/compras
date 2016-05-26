using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CarritoDeCompras
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {   

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && !String.IsNullOrEmpty(Request["ReturnUrl"]))
            {
                //Response.Redirect("Default.aspx");
            }
        }

        protected void login_Click(object sender, EventArgs e)
        {

            var valid = Membership.ValidateUser(exampleInputUserName.Text, exampleInputPassword2.Text);
            if (valid == true)
            {
                //no devulve true 
                FormsAuthentication.SetAuthCookie(exampleInputUserName.Text, true);
                Response.Redirect("Default.aspx");
                
            }
            
        }
    }
}
