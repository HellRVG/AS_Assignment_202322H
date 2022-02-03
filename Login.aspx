<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AS_Assignment_202322H.Login" ValidateRequest="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Login</title>
    <script src="https://www.google.com/recaptcha/api.js?render=6LekCE4eAAAAAM39TXnQcfYL9etpuQoOMl5h-72a"></script>
</head>
<body>
    <form id="form1" runat="server">
        <h2>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label>
        <br />
        <br />
   </h2>
        <table class="style1">
            <tr>
                <td class="style3">
        <asp:Label ID="lbl_userid" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="tb_userid" runat="server" Height="16px" Width="280px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
        <asp:Label ID="lbl_pwd" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="tb_pwd" runat="server" Height="16px" Width="280px"></asp:TextBox>
                </td>
            </tr>
                        <tr>
                <td class="style3">
       
                </td>
                <td class="style2">
    <asp:Button ID="btn_Login" runat="server" OnClick="btn_Login_Click" Text="Login" Height="35px"  Width="288px" />
                </td>
            </tr>
    </table>
        <h4><a href="../Registration.aspx">Click here to Register an account</a></h4>
&nbsp;&nbsp;&nbsp;
    <br />
        <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response"/>
           <br />
        <asp:Label ID="lbl_errormsg" runat="server" EnableViewState="False" ></asp:Label>
           <br />
           <br />
           <br />
        <br />
        <br />
        <div>
        </div>
    </form>

    <script>
 grecaptcha.ready(function () {
     grecaptcha.execute('6LekCE4eAAAAAM39TXnQcfYL9etpuQoOMl5h-72a', { action: 'Login' }).then(function (token) {
 document.getElementById("g-recaptcha-response").value = token;
 });
 });
    </script>

</body>
</html>
