<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="AS_Assignment_202322H.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>
                <legend>Homepage</legend>

                <br />

                <asp:Label ID="lbl_errormsg" runat="server" EnableViewState="false" />
                <br />
                <br />

                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="LogoutMe" Visible="false" />

                <p/>

            </fieldset>
        </div>
    </form>
</body>
</html>
