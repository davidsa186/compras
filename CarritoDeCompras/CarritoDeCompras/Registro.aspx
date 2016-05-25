<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="CarritoDeCompras.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro</title>
    <link rel="icon" type="image/png" href="/images/favicon.png" />
    <link rel="stylesheet" href="fontsfa/css/font-awesome.min.css">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="text-center">
                <h1><i class="fa fa-shopping-cart" aria-hidden="true"></i>PlatiniExpress</h1>
            </div>
                        
            <h2 class="page-header">Registro de Usuarios</h2>           

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Ingrese los datos del nuevo Usuario                
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">

                                    <div class="<%= Clase %>">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <%= Mensaje%>
                                    </div>

                                    <div class="form-group">
                                        <label>Usuario</label>
                                        <asp:TextBox ID="TextBox_username" runat="server" CssClass="form-control" placeholder="EJ: Usuario1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox_username"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <asp:TextBox ID="TextBox_email" runat="server" CssClass="form-control" placeholder="EJ: ejemplo@ejemplo.com"> </asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox_email"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email invalido" ValidationExpression="^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$" ControlToValidate="TextBox_email"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <asp:TextBox ID="TextBox_password" TextMode="Password" runat="server" CssClass="form-control" Type="password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="TextBox_password"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password invalido (debe contener minimo 7 caracteres)" ValidationExpression="^([A-Za-z0-9]{7,})$" ControlToValidate="TextBox_password"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Ciudad</label>
                                        <asp:DropDownList ID="dropCiudades" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label>Cédula</label>
                                        <asp:TextBox ID="TextBox_Cedula" runat="server" CssClass="form-control" placeholder="EJ: 21777321"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="TextBox_Cedula"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Cedula invalida" ValidationExpression="^([0-9]+)$" ControlToValidate="TextBox_Cedula"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Nombres</label>
                                        <asp:TextBox ID="TextBox_Nombre" runat="server" CssClass="form-control" placeholder="EJ: Daniel Arboleda"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="TextBox_Nombre"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Nombre invalido" ValidationExpression="^([A-Za-záéíóúñ]{2,}([\s][A-Za-záéíóúñ]{2,})*)$" ControlToValidate="TextBox_Nombre"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Dirección</label>
                                        <asp:TextBox ID="TextBox_Direccion" runat="server" CssClass="form-control" placeholder="EJ: Carrera 70 #42-8"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="TextBox_Direccion"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Teléfono</label>
                                        <asp:TextBox ID="TextBox_Telefono" runat="server" CssClass="form-control" placeholder="EJ: 4444444"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="TextBox_Telefono"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Telefono invalido" ValidationExpression="^([0-9]+)$" ControlToValidate="TextBox_Telefono"></asp:RegularExpressionValidator>
                                    </div>
                                    <asp:Button ID="Button1" runat="server" Text="Guardar" CssClass="btn btn-default" OnClick="Button1_Click" />
                                    <%--<asp:Literal ID="Resultado" runat="server"></asp:Literal>--%>
                                </div>
                                <!-- /.col-lg-6 (nested) -->

                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
    </form>
</body>
</html>
