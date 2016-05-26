﻿using System;
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
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Panel_Login.Visible = false;
                Panel_Status.Visible = true;
            }
            else
            {
                Panel_Login.Visible = true;
                Panel_Status.Visible = false;
            }
        }
        
    }
}
