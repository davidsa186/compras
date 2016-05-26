<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="CarritoDeCompras.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-9">
        <div class="row" id="index">
            <div class="container">
                <h3>Carrito de Compras</h3>
            </div>
            <hr />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        var items = sessionStorage.getItem("ItemsCarrito");
        if (items == null) {
            console.log("No hay productos en el carrito");
        } else {
            var arrayItems = JSON.parse(items);
            console.log(items);
            $.ajax({
                type: "POST",
                url: "Carrito.aspx/CargarCarrito",
                data: '{ItemsCarrito: ' + items + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var boton = '<div class="form-group"><button type="button" class="btn btn-default del"><i class="glyphicon glyphicon-remove"></i></button></div></form>';
                        for (var i = 0; i < response.d.length; i++) {
                            var div = '<div class="col-sm-4 col-lg-4 col-md-4">';
                            div += '<div class="thumbnail">';
                            div += '<img class="img_small" src="' + response.d[i].Imagen + '" alt="">';
                            div += '<div class="caption">';
                            div += '<h5><a href="Producto.aspx?id=' + response.d[i].Id_Producto + '">' + response.d[i].Nombre_Producto + '</a></h5>';
                            div += '<h5>$' + response.d[i].Precio + '</h5><form class="form-inline"><h5>Cantidad</h5>';
                            div += '<div class="form-group"><input type="number" class="form-control" id="cantidad"></input></div>';
                            div += boton;
                            div += '</div></div>';
                            $("#index").append(div);
                        }
                },
                error: function (response) {
                    //Mostrar un mensaje de error
                }
            });
        }

       
    </script>
</asp:Content>
