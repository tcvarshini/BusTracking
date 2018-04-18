using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddBuses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btnsubmit_OnClick(object sender, EventArgs e)
     {

     }
    protected void lnkselection_click(object sender, EventArgs e)
    {
        callreversemethod();
    }
    public void callreversemethod()
    {
        if (addform.Visible == true)
        {
            viewform.Visible = true;
            addform.Visible = false;
            lnkselection.Text = "Add Buses";
        }
        else
        {
            viewform.Visible = false;
            addform.Visible = true;
            lnkselection.Text = "Close";
        }
    }    


}