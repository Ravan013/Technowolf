﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Shopping_Backup.Pages
{
    public partial class Successful : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}