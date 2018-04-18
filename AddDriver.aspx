<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddDriver.aspx.cs" Inherits="AddDriver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
		<div class="container">
				<div class="tittle_head_w3layouts">
				<h4 class="tittle three" style="text-align: left;">Driver Operations</h4>
                <h4 style="float:right">
                <asp:LinkButton ID="lnkselection" runat="server" OnClick="lnkselection_click" Text="Add Driver"></asp:LinkButton>
                </h4>
			</div>
            <div class="col-md-12" id="addform" runat="server" visible="false">            
			<div class="inner_sec_info_agileits_w3">
				<div class="signin-form">
					<div class="login-form-rec"  style="width:100%">
						<form action="#" method="post">                        
							<asp:TextBox ID="txtdrivername" runat="server" placeholder="Driver Name"></asp:TextBox>
                            <asp:TextBox ID="txtdrivernumber" runat="server" placeholder="Driver unique number"></asp:TextBox>                                                                                                                
                            <asp:TextBox ID="txtlisencenumber" runat="server" placeholder="Lisence number"></asp:TextBox>
                            <asp:TextBox ID="txtphonenumber" runat="server" placeholder="Driver Phonenumber"></asp:TextBox>                                                        
                            <asp:TextBox ID="txtemail" runat="server" placeholder="Driver Email"></asp:TextBox>
                            <asp:TextBox ID="txtaddress" runat="server" placeholder="Address" TextMode="MultiLine"></asp:TextBox>
						</form>
					</div>
					<div class="tp">
								<asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_OnClick" />
							</div>

				</div>
			</div>
            </div>
            <div class="col-md-12" id="viewform" runat="server" style="font-size: 12px;padding:0;border-top:1px Solid grey">
            <asp:GridView ID="grddetails" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
            <Columns>
            <asp:BoundField HeaderText="Sno" DataField="Sno" />
            <asp:BoundField HeaderText="Driver name" DataField="Drivername" />
            <asp:BoundField HeaderText="UUID" DataField="DriverUUId" />
            <asp:BoundField HeaderText="Lisence Number" DataField="Lisencenumber" />
            <asp:BoundField HeaderText="phone Number" DataField="phonenumber" />
            <asp:BoundField HeaderText="Email" DataField="Email" />            
            <asp:TemplateField HeaderText="Address">
            <ItemTemplate> 
            <asp:Label ID="lbladdressdesc" runat="server" ToolTip='<%#Eval("ADDRESS") %>' Text='<%#Eval("ADDRESSTOOLTIP")%>'></asp:Label>
            <asp:HiddenField ID="hfid" runat="server" Value='<%#Eval("Sno")%>' />
            </ItemTemplate>
            </asp:TemplateField>            
            </Columns>
            </asp:GridView>

            </div>
		</div>
	</div>
</asp:Content>

