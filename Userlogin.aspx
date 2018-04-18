<%@ Page Title="" Language="C#" MasterPageFile="~/Exeternal.master" AutoEventWireup="true" CodeFile="Userlogin.aspx.cs" Inherits="Userlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/jscript">
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
		<div class="container">
			<div class="tittle_head_w3layouts">
				<h3 class="tittle three">SignIn to <span>User Account </span></h3>
			</div>
			<div class="inner_sec_info_agileits_w3">
				<div class="signin-form">
					<div class="login-form-rec">
						<form action="#" method="post">
							<input type="email" name="email" placeholder="E-mail" required="">
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

