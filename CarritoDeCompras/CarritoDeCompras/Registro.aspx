<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="CarritoDeCompras.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro</title>
    <link rel="icon" type="image/png" href="/images/favicon.png" />
    <%--<link rel="stylesheet" href="fontsfa/css/font-awesome.min.css" />--%>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="text-center">
            <h1><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>PlatiniExpress</h1>
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
                            <form id="form1" runat="server">
                                <asp:Panel ID="PanelInicial" runat="server" CssClass="col-lg-6">
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
                                    <asp:Button ID="Btn_Siguiente" runat="server" Text="Siguiente" CssClass="btn btn-primary" OnClick="Btn_Siguiente_Click" />
                                </asp:Panel>
                            </form>

                            <asp:Panel ID="Panel1" runat="server" CssClass="col-lg-6" Visible="false">
                                <div class="form-group">
                                    <label>Ciudad</label>
                                    <select id="Drop_Ciudades" class="form-control"></select>
                                </div>
                                <div class="form-group">
                                    <label>Cédula</label>
                                    <input id="TextBox_Cedula" type="number" class="form-control" placeholder="EJ: 21777321"></input>
                                </div>
                                <div class="form-group">
                                    <label>Nombres</label>
                                    <input id="TextBox_Nombre" type="text" class="form-control" placeholder="EJ: Juan Pablo"></input>
                                </div>
                                <div class="form-group">
                                    <label>Dirección</label>
                                    <input id="TextBox_Direccion" type="text" class="form-control" placeholder="EJ: Calle 50 #20a-30"></input>
                                </div>
                                <button id="Btn_Terminar" class="btn btn-primary">Terminar</button>
                            </asp:Panel>

                            <asp:Panel ID="Panel2" runat="server" Visible="false">
                                <div class="col-lg-6" id="div_telefonos">
                                    <p><strong>Teléfono</strong></p>
                                    <button id="btn_telefono" class="btn btn-default">Agregar Telefono</button>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="js/jquery.js"></script>

    <script>
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "Registro.aspx/ListadoCiudades",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    for (var j = 0; j < response.d.length; j++) {
                        $("#Drop_Ciudades").append('<option value="' + response.d[j].Id_Ciudad + '">' + response.d[j].Nombre_Ciudad + '</option>');
                    }
                },
                error: function (response) {
                    //Mostrar un mensaje de error
                }
            });
        });

        $("#btn_telefono").click(function () {
            var input = '<div class="col-lg-10"><input type="number" class="form-control in_telefono"></input></div>';
            var boton = '<div class="col-lg-2"><button type="button" class="btn btn-default del"><i class="fa fa-remove"></i></button></div>';
            $("#div_telefonos").append('<div class="row"><br>' + input + boton + '</div>');
        });

        $("#div_telefonos").on("click", ".del", function () {
            $(this).closest(".row").remove();
        });

        $("#Btn_Terminar").click(function () {
            var ciudad = $("#Drop_Ciudades").val();
            var cedula = $("#TextBox_Cedula").val();
            var direccion = $("#TextBox_Direccion").val();
            var nombre = $("#TextBox_Nombre").val();
            var array_telefonos = [];
            $("#div_telefonos").find(".in_telefono").each(function (index) {
                array_telefonos.push($(this).val());
            });
            $.ajax({
                type: "POST",
                url: "Registro.aspx/Insertar",
                data: '{ciudad:"' + ciudad + '", cedula:"' + cedula + '", direccion:"' + direccion + '", nombre:"' + nombre + '", arrayTelefonos:' + JSON.stringify(array_telefonos) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == true) {
                        alert("Cliente Ingresado");
                        window.location.href = "Default.aspx";
                    } else {
                        alert("Client no ingresado");
                    }
                },
                error: function (response) {
                    //Mostrar un mensaje de error
                }
            });
        });
    </script>
</body>
</html>
