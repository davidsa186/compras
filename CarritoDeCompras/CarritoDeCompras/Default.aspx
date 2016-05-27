<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarritoDeCompras.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Platini Express</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-9">
        <div class="row carousel-holder">
            <div class="col-md-12">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="5"></li>                        
                    </ol>
                    <div class="carousel-inner"></div>
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>

        <div class="row" id="index">
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="/js/cargarProductos.js"></script>

    <script>
        $(document).ready(function () {
            cargar('Default.aspx/GetProductoDefault', '{}');

            $.ajax({
                type: "POST",
                url: 'Default.aspx/GetProductoDefault',
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);
                    for (var i = 0; i < response.d.length; i++) {
                        var div;
                        if (i == 0) {
                            div = '<div class="item active">';
                        } else {
                            div = '<div class="item">';
                        }                        
                        div += '<img class="slide-image" src="' + response.d[i].Imagen + '" alt=""></div>';
                        $(".carousel-inner").append(div);
                    }
                },
                error: function (response) {
                    //Mostrar un mensaje de error
                }
            });
        });
    </script>
</asp:Content>
