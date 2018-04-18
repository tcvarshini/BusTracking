<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddStudents.aspx.cs" Inherits="AddStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
 function initMap() {
 var mapProp = {
        center: new google.maps.LatLng(17.8708742,83.2931797),
        scaleControl: false,        
        zoom: 10,
        overviewMapControl: false,
        rotateControl: true,
        gestureHandling: 'greedy',
    };
   var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
     var marker1 = new google.maps.Marker({
                position: new google.maps.LatLng(17.8708742,83.2931797),               
                draggable: false,
                map: map
            });
google.maps.event.addListener(map, 'click', function (e) {
                document.getElementById("ContentPlaceHolder1_txtcordinates").value =e.latLng.lat()+","+e.latLng.lng();
            });
   }
</script> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
		<div class="container">
				<div class="tittle_head_w3layouts">
				<h4 class="tittle three" style="text-align: left;">Student Operations</h4>
                <h4 style="float:right">
                <asp:LinkButton ID="lnkselection" runat="server" OnClick="lnkselection_click" Text="Add Student"></asp:LinkButton>
                </h4>
			</div>
            <div class="col-md-12" id="addform" runat="server" visible="false">
            <div class="col-md-6">
			<div class="inner_sec_info_agileits_w3">
				<div class="signin-form">
					<div class="login-form-rec"  style="width:100%">
						<form action="#" method="post">                        
							<asp:TextBox ID="txtstudentname" runat="server" placeholder="Student Name"></asp:TextBox>
                            <asp:TextBox ID="txtrollnumber" runat="server" placeholder="Student Rollnumber"></asp:TextBox>
                            <asp:TextBox ID="txtuid" runat="server" placeholder="Student Mobile UUID"></asp:TextBox>
                            <asp:DropDownList ID="ddldriver" runat="server" CssClass="dropdownmanual">
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlyear" runat="server" CssClass="dropdownmanual">
                            <asp:ListItem Text="--Select Year--" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1st Year" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2nd Year" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3rd Year" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4th Year" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlsemister" runat="server" CssClass="dropdownmanual">
                            <asp:ListItem Text="--Select Semister--" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1-Sem" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2-Sem" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtguardian" runat="server" placeholder="Guardian"></asp:TextBox>
                            <asp:TextBox ID="txtrelation" runat="server" placeholder="Relation"></asp:TextBox>
                            <asp:TextBox ID="txtphonenumber" runat="server" placeholder="Student Phonenumber"></asp:TextBox>
                            <asp:TextBox ID="txtemail" runat="server" placeholder="Student Email"></asp:TextBox>
                            <asp:TextBox ID="txtaddress" runat="server" placeholder="Adderess" TextMode="MultiLine"></asp:TextBox>
						</form>
					</div>
					<div class="tp">
								<asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_OnClick" />
							</div>

				</div>
			</div>
            </div>
            <div class="col-md-6">
            <div class="inner_sec_info_agileits_w3">				
					<div class="login-form-rec"  style="width:100%;height:487px;" ID="googleMap"> 
						
					</div>
                    <div class="signin-form">
					<div class="tp">
					   <asp:TextBox ID="txtcordinates" runat="server" placeholder="Student Cordinates"></asp:TextBox>
				    </div>
				    </div>
			</div>
            </div>
            </div>
            <div class="col-md-12" id="viewform" runat="server" style="font-size: 12px;padding:0;border-top:1px Solid grey">
            <asp:GridView ID="grddetails" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
            <Columns>
            <asp:BoundField HeaderText="Sno" DataField="Sno" />
            <asp:BoundField HeaderText="Name" DataField="NAME" />
            <%--<asp:BoundField HeaderText="UID" DataField="STUID" />--%>
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
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyAvCB0fJALK-4VaEiubgiVYuh-pJxNGvH0&callback=initMap&libraries=geometry,drawing"
    async defer></script>
</asp:Content>

