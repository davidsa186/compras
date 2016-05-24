<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="CarritoDeCompras.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td align="center" colspan="2">Regístrese para obtener una nueva cuenta</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label runat="server" AssociatedControlID="UserName" ID="UserNameLabel">Nombre de usuario:</asp:Label></td>
                                    <td>
                                        <asp:TextBox runat="server" ID="UserName"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ErrorMessage="El nombre de usuario es obligatorio." ValidationGroup="CreateUserWizard1" ToolTip="El nombre de usuario es obligatorio." ID="UserNameRequired">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label runat="server" AssociatedControlID="Password" ID="PasswordLabel">Contraseña:</asp:Label></td>
                                    <td>
                                        <asp:TextBox runat="server" TextMode="Password" ID="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="La contrase&#241;a es obligatoria." ValidationGroup="CreateUserWizard1" ToolTip="La contrase&#241;a es obligatoria." ID="PasswordRequired">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label runat="server" AssociatedControlID="ConfirmPassword" ID="ConfirmPasswordLabel">Confirmar contraseña:</asp:Label></td>
                                    <td>
                                        <asp:TextBox runat="server" TextMode="Password" ID="ConfirmPassword"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirmar contrase&#241;a es obligatorio." ValidationGroup="CreateUserWizard1" ToolTip="Confirmar contrase&#241;a es obligatorio." ID="ConfirmPasswordRequired">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label runat="server" AssociatedControlID="Email" ID="EmailLabel">Correo electrónico:</asp:Label></td>
                                    <td>
                                        <asp:TextBox runat="server" ID="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ErrorMessage="El correo electr&#243;nico es obligatorio." ValidationGroup="CreateUserWizard1" ToolTip="El correo electr&#243;nico es obligatorio." ID="EmailRequired">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>                                
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="Contrase&#241;a y Confirmar contrase&#241;a deben coincidir." Display="Dynamic" ValidationGroup="CreateUserWizard1" ID="PasswordCompare"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: Red;">
                                        <asp:Literal runat="server" ID="ErrorMessage" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    </asp:CompleteWizardStep>
                </WizardSteps>
            </asp:CreateUserWizard>
        </div>
    </form>
</body>
</html>
