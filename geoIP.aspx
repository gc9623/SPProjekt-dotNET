<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gepIP.aspx.cs" Inherits="SP_faza4_take03.geoIP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
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
            Na tej strani lahko preverite v kateri državi izvira vaš IP oz. katerkoli javni IP naslov.
	    </aside>

        <div id="mainContent">
	        <section id="intro">  
		        <!-- Introduction -->  
			    <p> 
                    Vaš IP naslov je: <%= HttpContext.Current.Request.UserHostAddress %>
                    <form id="lokacija1" runat="server">
                        <asp:Button ID="gumbPridobiLokacijo" runat="server" Text="Pridobi lokacijo" OnClick="gumbPridobiLokacijo_Click" />
                        <br />
                        <asp:Label ID="drzava" runat="server" Text=""></asp:Label>
                    </form>

				</p>  
                
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
