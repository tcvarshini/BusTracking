<%@ Page Title="" Language="C#" MasterPageFile="~/Exeternal.master" AutoEventWireup="true" CodeFile="Adminlogin.aspx.cs" Inherits="Adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/jscript">
    $(function () {
        $("input[value='Signin']").on("click", function () {
            if ($("input[name='UserName']").val() == "Admin" && $("input[name='password']").val() == "Admin") {
                document.location = 'AdminHome.aspx';
                return false;
            }
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
		<div class="container">
			<div class="tittle_head_w3layouts">
				<h3 class="tittle three">SignIn to <span>Adminstrator Account </span></h3>
			</div>
			<div class="inner_sec_info_agileits_w3">
				<div class="signin-form">
					<div class="login-form-rec">
						<form action="#" method="post">
							<input type="text" name="UserName" placeholder="User Name" required="">
							<input type="password" name="password" placeholder="Password" required="">
							<div class="tp">
								<input type="submit" value="Signin">
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</asp:Content>

