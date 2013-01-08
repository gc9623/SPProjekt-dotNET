<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="template.aspx.cs" Inherits="SP_faza4_take03.template" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <title>Vseved</title>
</head>
<body>
    <header id="header">  
        <h1>Vseved</h1>
        <!--<div id="nastaviJezik">
            <a href="zamenjajJezik.html?jezik=en">English</a>
            <a href="zamenjajJezik.html?jezik=si">Slovenščina</a>
        </div> -->
    </header>  

    <nav id="navigation">  
        <!-- Navigation -->  
        <ul>
        <li><a href="template.aspx">Znanje</a></li>
        <li><a href="dodajVir.aspx">Dodaj vir</a></li>
        <li><a href="urejevalnik.aspx">Urejevalnik</a></li>
        <li><a href="urejevalnikStrani.aspx">Strani</a></li>
        <li><a href="geoIP.aspx">GeoIP</a></li>
    	</ul>
    </nav>
  	 
    <div id="content">      	 
        <aside id="sidebar" runat="server">  
	        <!-- Sidebar --> 
            <form runat="server">
                <asp:GridView ID="mrezaVsebine" runat="server" DataKeyNames="virID" OnRowDataBound="ViriGridView_RowDataBound" >
                    <Columns>
                        <asp:BoundField DataField="naziv" HeaderText="Vsebina" />
                        <asp:BoundField DataField="virId" HeaderText="ID" Visible="false" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="napaka" runat="server" Text="napaka" Visible="False" CssClass="error"></asp:Label>
            </form>
        </aside>

        <div id="mainContent">
	        <section id="intro"> 
                <!-- Introduction -->
                <h3><asp:Label ID="podrobnostiNaziv" runat="server" Text="" /> </h3>
                <asp:Label ID="podrobnostiVsebina" runat="server" Text="" /> <br />
                <asp:Label ID="podorobnostiAvtor" runat="server" Text="" /> <asp:Label ID="podrobnostiTimestamp" runat="server" Text="" /> <br />
	        </section> 
        </div> 
    </div>

    <footer id="footer">  
        <!-- Footer -->  
        SP projekt Wikipedia 2012
    </footer>  
</body>
</html>