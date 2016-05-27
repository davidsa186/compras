<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="CarritoDeCompras.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Carrito de Compras</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-9">
        <div class="row" id="index">
            <div class="container">
                <h3>Carrito de Compras</h3>
            </div>
            <hr />
        </div>
        <div class="row">
            <div class="container">
                <p id="costo_total"></p>
                <button class="btn btn-success" id="btn_comprar">Comprar</button>
            </div>
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
                    for (var i = 0; i < response.d.length; i++) {
                        var div = '<div class="col-sm-4 col-lg-4 col-md-4 producto">';
                        div += '<div class="thumbnail">';
                        div += '<img class="img_small" src="' + response.d[i].Imagen + '" alt="">';
                        div += '<div class="caption">';
                        div += '<h5>' + response.d[i].Nombre_Producto + '</h5>';
                        div += '<h5 class="precio">Valor: $' + response.d[i].Precio + '</h5><form class="form-inline">';
                        div += '<h5>Cantidad en Stock: ' + response.d[i].Stock + '</h5>';
                        div += '<div class="row">'
                        div += '<div class="form-group col-xs-9"><input type="number" class="form-control cantidad" value="1"></input></div>';
                        div += '<div class="form-group col-xs-2"><button type="button" class="btn btn-default del"><i class="glyphicon glyphicon-remove"></i><span hidden="hidden" class="id_producto">';
                        div += response.d[i].Id_Producto + '</span></button></div></form>';
                        div += '</div></div></div>';
                        $("#index").append(div);
                    }
                    calcularTotal();
                },
                error: function (response) {
                    //Mostrar un mensaje de error
                }
            });
        }

        $("#index").on("click", ".del", function () {
            $(this).closest(".producto").remove();
            var id = $(this).find(".id_producto").text();
            var items = sessionStorage.getItem("ItemsCarrito");
            var arrayItems = JSON.parse(items);
            var i = arrayItems.indexOf(id);
            if (i > -1) {
                arrayItems.splice(i, 1);
            }
            sessionStorage.setItem("ItemsCarrito", JSON.stringify(arrayItems));
            $("#carrito").text(arrayItems.length);
            calcularTotal();
        });

        $("#btn_comprar").click(function () {
            console.log("click");
            var precioTotal = 0;
            var productos = new Array();
            $("#index").find(".producto").each(function (index) {
                var cantidad = $(this).find(".cantidad").val();
                var precio = parseInt($(this).find(".precio").text().substring(8));
                var id = $(this).find(".id_producto").text();
                precioTotal += precio * cantidad;
                productos.push({ Id_Producto: id, Cantidad: cantidad, Precio_Unitario: precio });
            });

            $.ajax({
                type: "POST",
                url: "Carrito.aspx/Comprar",
                data: '{totalNeto:"' + precioTotal + '", productos:' + JSON.stringify(productos) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d != -1) {
                        sessionStorage.setItem("ItemsCarrito", JSON.stringify(new Array()));
                        $("#carrito").text(arrayItems.length);
                        console.log(response.d);
                        window.location.href = "FacturaCompra.aspx?id=" + response.d;
                    } else {
                        alert("Debe iniciar sesión!");
                    }
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    alert(err.Message);
                }
            });
        });

        function calcularTotal() {
            var precioTotal = 0;
            $("#index").find(".producto").each(function (index) {
                var cantidad = $(this).find(".cantidad").val();
                if (cantidad < 1) {
                    cantidad = 1;
                    $(this).find(".cantidad").val("1");
                }
                var precio = parseInt($(this).find(".precio").text().substring(8));
                precioTotal += precio * cantidad;
            });
            $("#costo_total").text("Precio total: $" + precioTotal);
        }

        $("#index").on("change", ".cantidad", function () {
            calcularTotal();
        });
    </script>
</asp:Content>
