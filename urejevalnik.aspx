<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urejevalnik.aspx.cs" Inherits="SP_faza4_take03.urejevalnik" %>

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
               Urejevalnik vira
	    </aside>

        <div id="mainContent">
	        <section id="intro">  
		        <!-- Introduction -->  
                <form runat="server">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="virID" DataSourceID="SqlDataSource1">
                        <EditItemTemplate>
                            virID:
                            <asp:Label Text='<%# Eval("virID") %>' runat="server" ID="virIDLabel1" /><br />
                            naziv:
                            <asp:TextBox Text='<%# Bind("naziv") %>' runat="server" ID="nazivTextBox" /><br />
                            vsebina:
                            <asp:TextBox Text='<%# Bind("vsebina") %>' runat="server" ID="vsebinaTextBox" /><br />
                            avtor_id:
                            <asp:TextBox Text='<%# Bind("avtor_id") %>' runat="server" ID="avtor_idTextBox" /><br />
                            timestamp:
                            <asp:TextBox Text='<%# Bind("timestamp") %>' runat="server" ID="timestampTextBox" /><br />
                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            naziv:
                            <asp:TextBox Text='<%# Bind("naziv") %>' runat="server" ID="nazivTextBox" /><br />
                            vsebina:
                            <asp:TextBox Text='<%# Bind("vsebina") %>' runat="server" ID="vsebinaTextBox" /><br />
                            avtor_id:
                            <asp:TextBox Text='<%# Bind("avtor_id") %>' runat="server" ID="avtor_idTextBox" /><br />
                            timestamp:
                            <asp:TextBox Text='<%# Bind("timestamp") %>' runat="server" ID="timestampTextBox" /><br />
                            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            virID:
                            <asp:Label Text='<%# Eval("virID") %>' runat="server" ID="virIDLabel" /><br />
                            naziv:
                            <asp:Label Text='<%# Bind("naziv") %>' runat="server" ID="nazivLabel" /><br />
                            vsebina:
                            <asp:Label Text='<%# Bind("vsebina") %>' runat="server" ID="vsebinaLabel" /><br />
                            avtor_id:
                            <asp:Label Text='<%# Bind("avtor_id") %>' runat="server" ID="avtor_idLabel" /><br />
                            timestamp:
                            <asp:Label Text='<%# Bind("timestamp") %>' runat="server" ID="timestampLabel" /><br />
                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:gc9623ConnectionString %>' DeleteCommand="DELETE FROM viri WHERE (virID = 0)" InsertCommand="INSERT INTO viri(naziv, vsebina, avtor_id, `timestamp`) VALUES ('gggg', 'gggggg', 2, 'now')" ProviderName='<%$ ConnectionStrings:gc9623ConnectionString.ProviderName %>' SelectCommand="SELECT virID, naziv, vsebina, avtor_id, `timestamp` FROM viri WHERE virID = 1" UpdateCommand="UPDATE viri SET naziv = 'ttt', vsebina = 'ttt' WHERE (virID = 1)"></asp:SqlDataSource>
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
