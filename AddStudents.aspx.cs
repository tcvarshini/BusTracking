using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class AddStudents : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TRACKING"].ToString());     

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindstudata();
            binddrivers();
        }
    }

    public void binddrivers()
    {
        SqlDataAdapter adp= new SqlDataAdapter("sp_get_drivers",con);
        adp.SelectCommand.CommandType=CommandType.StoredProcedure;
        DataSet ds= new DataSet();
        adp.Fill(ds);
        ddldriver.DataSource = ds.Tables[0];
        ddldriver.DataTextField = "Drivername";
        ddldriver.DataValueField = "DriverUUId";
        ddldriver.DataBind();
    }

    public void bindstudata()
    {
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter("sp_get_students", con);
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
            lnkselection.Text = "Add Student";
        }
        else
        {
            viewform.Visible = false;
            addform.Visible = true;
            lnkselection.Text = "Close";
        }
    }    

    protected void btnsubmit_OnClick(object sender, EventArgs e)
    {
        try
        {
            if (validation() == 1)
            {
                if (con.State == ConnectionState.Closed) con.Open();
                SqlCommand cmd = new SqlCommand("SP_ins_student", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@NAME", txtstudentname.Text);
                cmd.Parameters.AddWithValue("@ROLLNUMBER", txtrollnumber.Text);
                cmd.Parameters.AddWithValue("@UID", txtuid.Text);
                cmd.Parameters.AddWithValue("@YEAR", ddlyear.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SEMISTER", ddlsemister.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@GUARDIAN", txtguardian.Text);
                cmd.Parameters.AddWithValue("@RELATION", txtrelation.Text);
                cmd.Parameters.AddWithValue("@PHONENUMBER", txtphonenumber.Text);
                cmd.Parameters.AddWithValue("@EMAIL", txtemail.Text);
                cmd.Parameters.AddWithValue("@ADDRESS", txtaddress.Text);
                cmd.Parameters.AddWithValue("@CORDINATES", txtcordinates.Text);
                cmd.Parameters.AddWithValue("@type", "I");
                Int32 i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    callreversemethod();
                    alert(txtstudentname.Text + " Data added successfully");
                    Response.Redirect("blog.html?id=" + txtuid.Text+","+ddldriver.SelectedValue.ToString());
                }

            }
        }
        catch (Exception ex)
        {
            alert(ex.Message.ToString());
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
        if (txtstudentname.Text == "")
        {
            i = 0;
            alert("Enter Student Name");
            return i;
        }
        if (txtrollnumber.Text == "") 
        {
            i = 0;
            alert("Enter Rollnumber");
            return i;
        }
        if (txtuid.Text == "")
        {
            i = 0;
            alert("Enter Mobile UUID");
            return i;
        }
        if (ddldriver.SelectedItem.Text == "--Select Driver--")
        {
            i = 0;
            alert("Please select driver");
            return i;
        }
        if (ddlyear.SelectedValue.ToString() == "0")
        {
            i = 0;
            alert("Please Select Year");
            return i;
        }
        if (ddlsemister.SelectedValue.ToString() == "0")
        {
            i = 0;
            alert("Please Select Semister");
            return i;
        }
        if (txtguardian.Text=="")
        {
            i = 0;
            alert("Enter Gurdian");
            return i;
        }
        if (txtrelation.Text == "")
        {
            i = 0;
            alert("Enter Relation");
            return i;
        }        
        if (txtphonenumber.Text=="")
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
        if (txtemail.Text=="")
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
        if (txtaddress.Text=="")
        {
            i = 0;
            alert("Enter address");
            return i;
        }
        if (txtcordinates.Text=="")
        {
            i = 0;
            alert("Enter Cordinates");
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