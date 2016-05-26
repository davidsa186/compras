<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="CarritoDeCompras.Producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-9">
        <div class="thumbnail">
            <img class="img-responsive" id="img_producto" alt="">
            <div class="caption-full">
                <h4 class="pull-right" id="productPrice"></h4>
                <h4 id="productName"></h4>
                <p id="descripcion"></p>                
                <button type="button" class="btn btn-default" id="btn_carrito">
                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                    <span>Añadir al carrito</span>
                </button>                
                <button type="button" class="btn btn-default pull-right" id="btn_lista" aria-label="Añadir a la lista de deseos">
                    <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                    <span>Añadir a la lista de deseos</span>
                </button>
            </div>
            <div class="ratings">
                <p class="pull-right">3 reviews</p>
                <p>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star-empty"></span>
                    4.0 stars
                </p>
            </div>
        </div>

        <div class="well">
            <%--<div class="text-right">
                <a class="btn btn-success">Leave a Review</a>
            </div>

            <hr>--%>
            <div class="row">
                <div class="col-md-12">
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star-empty"></span>
                    Anonymous
                    <span class="pull-right">10 days ago</span>
                    <p>This product was great in terms of quality. I would definitely buy another!</p>
                </div>
            </div>

            <hr>
            <div class="row">
                <div class="col-md-12">
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star-empty"></span>
                    Anonymous
                    <span class="pull-right">12 days ago</span>
                    <p>I've alredy ordered another one!</p>
                </div>
            </div>

            <hr>
            <div class="row">
                <div class="col-md-12">
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star-empty"></span>
                    Anonymous
                    <span class="pull-right">15 days ago</span>
                    <p>I've seen some better than this, but not at this price. I definitely recommend this item.</p>
                </div>
            </div>
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
                    $("#productPrice").text("$" + response.d.Precio);
                    $("#img_producto").prop("src", response.d.Imagen);
                    $('#descripcion').text(response.d.Categoria.Descripcion);
                    $("#id_producto").text(response.d.Id_Producto);
                },
                error: function (response) {
                    //Mostrar un mensaje de error
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
                        alert("ok");
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
