<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddBuses.aspx.cs" Inherits="AddBuses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
		<div class="container">
				<div class="tittle_head_w3layouts">
				<h4 class="tittle three" style="text-align: left;">Buses Operations</h4>
                <h4 style="float:right">
                <asp:LinkButton ID="lnkselection" runat="server" OnClick="lnkselection_click" Text="Add Driver"></asp:LinkButton>
                </h4>
			</div>
            <div class="col-md-12" id="addform" runat="server" visible="false">            
			<div class="inner_sec_info_agileits_w3">
				<div class="signin-form">
 					<div class="login-form-rec"  style="width:100%">
						<form action="#" method="post">                        
							<asp:TextBox ID="txtbusno" runat="server" placeholder="Bus No"></asp:TextBox>                                                        
                            <asp:TextBox ID="txtburegno" runat="server" placeholder="Regn No"></asp:TextBox>                                                        
                            <asp:TextBox ID="txtremarks" runat="server" placeholder="Remarks" TextMode="MultiLine"></asp:TextBox>
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
            <asp:BoundField HeaderText="Name" DataField="NAME" />
            <asp:BoundField HeaderText="Rollnumber" DataField="ROLLNUMBER" />
            <asp:BoundField HeaderText="Year" DataField="YEAR" />
            <asp:BoundField HeaderText="Semister" DataField="SEMISTER" />
            <asp:BoundField HeaderText="Guardian" DataField="GUARDIAN" />
            <asp:BoundField HeaderText="Relation" DataField="RELATION" />
            <asp:BoundField HeaderText="Phone number" DataField="PHONENUMBER" />
            <asp:BoundField HeaderText="Email" DataField="EMAIL" />
            <asp:TemplateField HeaderText="Address">
            <ItemTemplate> 
            <asp:Label ID="lbladdressdesc" runat="server" ToolTip='<%#Eval("ADDRESSTOOLTIP") %>' Text='<%#Eval("ADDRESS")%>'></asp:Label>
            <asp:HiddenField ID="hfid" runat="server" Value='<%#Eval("Stu_ID")%>' />
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Cordinates" DataField="CORDINATES" />
            <asp:BoundField HeaderText="Created Date" DataField="CREATEDDATE" />            
            </Columns>
            </asp:GridView>

            </div>
		</div>
	</div>
</asp:Content>

