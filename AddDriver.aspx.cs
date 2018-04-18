using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class AddDriver : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TRACKING"].ToString());   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindstudata();

        }
    }
    protected void btnsubmit_OnClick(object sender, EventArgs e)
    {
        try
        {
            if (validation() == 1)
            {
                if (con.State == ConnectionState.Closed) con.Open();
                SqlCommand cmd = new SqlCommand("sp_driver_ope", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Drivername", txtdrivername.Text);
                cmd.Parameters.AddWithValue("@DriverUUId", txtdrivernumber.Text);
                cmd.Parameters.AddWithValue("@Lisencenumber", txtlisencenumber.Text);
                cmd.Parameters.AddWithValue("@phonenumber", txtphonenumber.Text);
                cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                cmd.Parameters.AddWithValue("@Address", txtaddress.Text);                
                Int32 i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    callreversemethod();
                    alert(txtdrivername.Text + " Data added successfully");
                    Response.Redirect("driver.html?id=" + txtdrivernumber.Text);
                }

            }
        }
        catch (Exception ex)
        {
            alert(ex.Message.ToString());
        }
    }

    public void bindstudata()
    {
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter("sp_get_driver", con);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                grddetails.DataSource = ds.Tables[0];
                grddetails.DataBind();
            }
        }
        catch
        {
            grddetails.DataSource = null;
            grddetails.DataBind();
        }
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
            lnkselection.Text = "Add Driver";
        }
        else
        {
            viewform.Visible = false;
            addform.Visible = true;
            lnkselection.Text = "Close";
        }
    }


    public bool IsValidPhone(string Phone)
    {
        try
        {
            if (string.IsNullOrEmpty(Phone))
                return false;
            var r = new Regex(@"^(0|\+91)?[789]\d{9}$");
            return r.IsMatch(Phone);

        }
        catch (Exception)
        {
            throw;
        }
    }

    public static bool isValidEmail(string inputEmail)
    {
        string strRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
              @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
              @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
        Regex re = new Regex(strRegex);
        if (re.IsMatch(inputEmail))
            return (true);
        else
            return (false);
    }

    public Int32 validation()
    {
        Int32 i = 1;
        if (txtdrivername.Text == "")
        {
            i = 0;
            alert("Enter Driver Name");
            return i;
        }
        if (txtdrivernumber.Text == "")
        {
            i = 0;
            alert("Enter UUID");
            return i;
        }
        if (txtlisencenumber.Text == "")
        {
            i = 0;
            alert("Enter Lisence");
            return i;
        }     
 
        if (txtphonenumber.Text == "")
        {
            i = 0;
            alert("Enter Phonenumber");
            return i;
        }
        if (!IsValidPhone(txtphonenumber.Text))
        {
            i = 0;
            alert("Enter valid phone number");
            return i;
        }
        if (txtemail.Text == "")
        {
            i = 0;
            alert("Enter email");
            return i;
        }
        if (!isValidEmail(txtemail.Text))
        {
            i = 0;
            alert("Enter valid email");
            return i;
        }
        if (txtaddress.Text == "")
        {
            i = 0;
            alert("Enter address");
            return i;
        }     
        return i;
    }

    public void alert(String Message)
    {
        string message = Message;
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("<script type = 'text/javascript'>");
        sb.Append("window.onload=function(){");
        sb.Append("alert('");
        sb.Append(message);
        sb.Append("')};");
        sb.Append("</script>");
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
    }

}