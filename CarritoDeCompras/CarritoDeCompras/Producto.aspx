<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="CarritoDeCompras.Producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Productos</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-9">
        <div class="thumbnail">
            <img class="img-responsive" id="img_producto" alt="">
            <div class="caption-full">
                <h4 class="pull-right" id="productPrice"></h4>
                <h4 id="productName"></h4>
                <p id="descripcion"></p>   
                <p id="stock"></p>               
                <button type="button" class="btn btn-default" id="btn_carrito">
                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                    <span>Agregar al carrito</span>
                </button>                
                <button type="button" class="btn btn-default pull-right" id="btn_lista">
                    <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                    <span>Agregar a la lista de deseos</span>
                </button>
            </div>
            <div class="ratings">
                <p class="pull-right" id="numero_comentarios"></p>
                <p id="estrellas"></p>
            </div>
        </div>

        <div class="well">
            <h4>Calificaciones</h4>
            <hr />            
        </div>
    </div>
    <p hidden="hidden" id="id_producto"></p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "Producto.aspx/GetProducto",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#productName").text(response.d.Nombre_Producto);
                    $("#productPrice").text("Valor: $" + response.d.Precio);
                    $("#img_producto").prop("src", response.d.Imagen);
                    $('#descripcion').text(response.d.Categoria.Descripcion);
                    $("#id_producto").text(response.d.Id_Producto);
                    $("#stock").text("Cantidad en Stock: "+response.d.Stock);
                },
                error: function (response) {
                    //Mostrar un mensaje de error
                }
            });
         
            $.ajax({
                type: "POST",
                url: "Producto.aspx/GetComentarios",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#numero_comentarios").text(response.d.length + " comentarios");
                    var promedio = 0;
                    for (var i = 0; i < response.d.length; i++) {                        
                        promedio += response.d[i].Puntuacion;
                        var div = '<div class="row"><div class="col-md-12">';
                        var full = response.d[i].Puntuacion;
                        var empty = 5 - full;
                        for (var j = 0; j < full; j++) {
                            div += '<span class="glyphicon glyphicon-star"></span>';
                        }
                        for (var j = 0; j < empty; j++) {
                            div += '<span class="glyphicon glyphicon-star-empty"></span>';
                        }
                        div += '<span>' + response.d[i].NombreUsuario + '</span>';
                        div += '<p>' + response.d[i].Comentario + '</p>';
                        div += '</div></div><hr />';
                        $(".well").append(div);
                    }
                    promedio = Math.round(promedio / response.d.length);
                    var vacio = 5 - promedio;
                    var estrellas = '';
                    for (var j = 0; j < promedio; j++) {
                        estrellas += '<span class="glyphicon glyphicon-star"></span>';
                    }
                    for (var j = 0; j < vacio; j++) {
                        estrellas += '<span class="glyphicon glyphicon-star-empty"></span>';
                    }
                    $("#estrellas").append(estrellas);
                    $("#estrellas").append('<span>' + promedio + '</span>');
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    alert(err.Message);
                }
            });
        });

        $("#btn_carrito").click(function () {
            var items = sessionStorage.getItem("ItemsCarrito");
            if (items == null) {
                var arrayItems = new Array();
            } else {
                var arrayItems = JSON.parse(items);                
            }
            var producto = $("#id_producto").text();
            if ($.inArray(producto, arrayItems) == -1) {
                arrayItems.push(producto);
            }            
            sessionStorage.setItem("ItemsCarrito", JSON.stringify(arrayItems));
            $("#carrito").text(arrayItems.length);
        });

        $("#btn_lista").click(function () {
            $.ajax({
                type: "POST",
                url: "Producto.aspx/AgregarALista",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == true) {
                        alert("Agregado a la Lista de Deseos.");
                    } else {
                        alert("Debe iniciar sesión!");
                    }
                },
                error: function (response) {
                    //Mostrar un mensaje de error
                }
            });
        });
    </script>
</asp:Content>
