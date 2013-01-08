<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urejevalnikStrani.aspx.cs" Inherits="SP_faza4_take03.urejevalnikStrani" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            Urejevalnik strani v obliki GriwView-a.
	    </aside>

        <div id="mainContent">
	        <section id="intro">  
		        <!-- Introduction -->  
		        <header>  
		        <h2>Urejevalnik strani</h2>  
			    </header>  
			    <p> 
                    Na tej strani lahko urejate strani ki ste jih objavili.
				</p>  

                <form runat="server">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="virID" DataSourceID="SqlDataSourceVsiMojiViri" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                        <Columns>
                            <asp:BoundField DataField="naziv" HeaderText="naziv" SortExpression="naziv"></asp:BoundField>
                            <asp:BoundField DataField="virID" HeaderText="virID" ReadOnly="True" InsertVisible="False" SortExpression="virID"></asp:BoundField>
                            <asp:BoundField DataField="vsebina" HeaderText="vsebina" SortExpression="vsebina"></asp:BoundField>
                            <asp:BoundField DataField="timestamp" HeaderText="timestamp" SortExpression="timestamp"></asp:BoundField>
                            <asp:BoundField DataField="avtor_id" HeaderText="avtor_id" SortExpression="avtor_id"></asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                        <RowStyle BackColor="#EFF3FB"></RowStyle>

                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                    
                    <asp:SqlDataSource runat="server" ID="SqlDataSourceVsiMojiViri" ConnectionString='<%$ ConnectionStrings:gc9623ConnectionString %>' ProviderName='<%$ ConnectionStrings:gc9623ConnectionString.ProviderName %>' SelectCommand="SELECT naziv, virID, vsebina, timestamp, avtor_id FROM viri"></asp:SqlDataSource>
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
