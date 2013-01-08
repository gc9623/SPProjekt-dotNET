<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dodajVir.aspx.cs" Inherits="SP_faza4_take03.dodajVir" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <title></title>
</head>
<body>
    <header id="header">    
    </header>
      
    <nav id="navigation">   
    </nav>  

    <div id="content">      	 
       	<aside id ="sidebar">  
               Dodajanje novega Vira <br />
               Pri dodajanju se uporablja AJAX.
	    </aside>

        <div id="mainContent">
	        <section id="intro">  
                <form id="form1" runat="server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="button1" EventName="Click" />
                        </Triggers>

                        <ContentTemplate>
                            <table>
                                <tr><td>Naslov vira:</td><td><asp:TextBox ID="TextBoxNaziv" runat="server" Width="500px"></asp:TextBox></td></tr>
                                <tr><td>Vsebina</td><td><asp:TextBox ID="TextBoxVsebina" runat="server" Rows="20" EnableViewState="True" TextMode="MultiLine" MaxLength="50" Width="500px"></asp:TextBox></td></tr>
                                <tr><td></td><td><asp:Button ID="button1" runat="server" OnClick="GumbDodaj_Click" Text="Dodaj" /></td></tr>
                                <tr><td></td><td><asp:Label ID="obvestilo" runat="server" Text="" BackColor="Green" Visible="false"></asp:Label></td></tr>
                            </table> 
                        </ContentTemplate>
                        
                    </asp:UpdatePanel>
                </form>
            </section>
        </div>
    </div>

    <footer id="footer">
    </footer>  
</body>
<script>
    $('body > header').load('template.aspx #header');
    $('body > nav').load('template.aspx #navigation');
    $('body > footer').load('template.aspx #footer');
    //$('#sidebar').load('template.aspx #sidebar');
</script>
</html>
