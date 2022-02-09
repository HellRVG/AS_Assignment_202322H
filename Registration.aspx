<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AS_Assignment_202322H.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Registration</title>

    <script type="text/javascript">
        function validate() {
            var str = document.getElementById('<%=tb_pwd.ClientID %>').value;

            if (str.length < 12) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password length must be at least 12 characters";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("too_short");
            }

            else if (str.search(/[0-9]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 number";
                docuemtn.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_number");
            }

            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 lower-case letter";
                docuemtn.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_small");
            }

            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 upper-case letter";
                docuemtn.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_cap");
            }

            else if (str.search(/[^a-zA-Z0-9]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password require at least 1 special character";
                docuemtn.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_special");
            }

            document.getElementById("lbl_pwdchecker").innerHTML = "Excellent"
            document.getElementById("lbl_pwdchecker").style.color = "Blue";
        }
    </script>

    <style type="text/css">
        .auto-style1 {
            text-align: left;
            width: 287px;
        }
        </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>
        <br />
        <asp:Label ID="lbl_title" runat="server" Text="Account Registration"></asp:Label>
        <br />
   </h2>
        <table class="style1">
            <tr>
                <td class="style3">
        <asp:Label ID="lbl_fname" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_fname" runat="server" Height="32px" Width="281px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
        <asp:Label ID="lbl_lname" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_lname" runat="server" Height="32px" Width="281px"></asp:TextBox>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td>Credit Card Info:</td></tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="lbl_ccno" runat="server" Text="Credit Card No."></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_ccno" runat="server" Height="32px" Width="281px" placeholder="E.g. 1234 5678 9012 3456"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="lbl_cvv" runat="server" Text="CVV"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_cvv" runat="server" Height="32px" Width="281px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="lbl_expdate" runat="server" Text="Expiry date"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_expdate" runat="server" Height="32px" Width="281px" placeholder="MM/YY"></asp:TextBox>
                </td>
            </tr>
            <tr><td></td></tr>

            <tr>
                <td class="style3">
        <asp:Label ID="lbl_userid" runat="server" Text="Email Address"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_userid" runat="server" Height="36px" Width="281px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
        <asp:Label ID="lbl_pwd" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style1">
                    <%-- <asp:TextBox ID="tb_pwd" runat="server" Height="32px" Width="281px" onkeyup="javascript:validate()" TextMode="Password"></asp:TextBox> --%>
                    <asp:TextBox ID="tb_pwd" runat="server" Height="32px" Width="281px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lbl_pwdchecker" runat="server" Text=" "></asp:Label>
                </td>
            </tr>
                        <tr>
                <td class="style3">
        <asp:Label ID="lbl_dob" runat="server" Text="Date of Birth"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="tb_dob" runat="server" Height="32px" Width="281px" placeholder="DD/MM/YY"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
        <asp:Label ID="lbl_photo" runat="server" Text="Photo"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="32px" Width="398px" />
                    
                </td>
            </tr>
            <tr><td></td></tr>
                        <tr>
                <td class="style4">
                </td>
                <td class="auto-style1">
                    <p>
            <asp:Button ID="btn_checkpwd" runat="server" OnClick="btn_checkpwd_Click" Text="Check Password" Width="290px" />
        </p>
    <asp:Button ID="btn_Submit" runat="server" Height="35px" 
        onclick="btn_Submit_Click" Text="Submit" Width="290px" />
                </td>
            </tr>
    </table>
            <h4><a href="../Login.aspx">Click here to Login</a></h4>
            <%--&nbsp;<br />
        <asp:Label ID="lb_error1" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lb_error2" runat="server"></asp:Label>
    <br />
        <br />--%>
        </div>
    </form>
</body>
</html>
