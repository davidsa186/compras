<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarritoDeCompras.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="slide-image" src="http://placehold.it/800x300" alt="">
                        </div>
                        <div class="item">
                            <img class="slide-image" src="http://placehold.it/800x300" alt="">
                        </div>
                        <div class="item">
                            <img class="slide-image" src="http://placehold.it/800x300" alt="">
                        </div>
                    </div>
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

            <%--<div class="col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail">
                    <img src="http://placehold.it/320x150" alt="">
                    <div class="caption">
                        <h4 class="pull-right">$24.99</h4>
                        <h4><a href="#">First Product</a>
                        </h4>
                        <p>See more snippets like this online store item at <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">15 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail">
                    <img src="http://placehold.it/320x150" alt="">
                    <div class="caption">
                        <h4 class="pull-right">$64.99</h4>
                        <h4><a href="#">Second Product</a>
                        </h4>
                        <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">12 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail">
                    <img src="http://placehold.it/320x150" alt="">
                    <div class="caption">
                        <h4 class="pull-right">$74.99</h4>
                        <h4><a href="#">Third Product</a>
                        </h4>
                        <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">31 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail">
                    <img src="http://placehold.it/320x150" alt="">
                    <div class="caption">
                        <h4 class="pull-right">$84.99</h4>
                        <h4><a href="#">Fourth Product</a>
                        </h4>
                        <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">6 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail">
                    <img src="http://placehold.it/320x150" alt="">
                    <div class="caption">
                        <h4 class="pull-right">$94.99</h4>
                        <h4><a href="#">Fifth Product</a>
                        </h4>
                        <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">18 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 col-lg-4 col-md-4">
                <h4><a href="#">Like this template?</a>
                </h4>
                <p>If you like this template, then check out <a target="_blank" href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this tutorial</a> on how to build a working review system for your online store!</p>
                <a class="btn btn-primary" target="_blank" href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">View Tutorial</a>
            </div>--%>

        </div>

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "Default.aspx/GetProductos",
                data: '{id: -1}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);
                    for (var i = 0; i < response.d.length; i++) {
                        var div = '<div class="col-sm-4 col-lg-4 col-md-4">';
                        div += '<div class="thumbnail">';
                        div += '<img src="http://placehold.it/320x150" alt="">';
                        div += '<div class="caption">';
                        div += '<h4 class="pull-right">$' + response.d[i].Precio + '</h4>';
                        div += '<h4><a href="Producto.aspx?id=' + response.d[i].Id_Producto + '">' + response.d[i].Nombre_Producto +'</a></h4>';
                        div += '<p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>';
                        div += '</div></div>';
                        $("#index").append(div);
                    }
                },
                error: function (response) {
                    //Mostrar un mensaje de error
                }
            });
        });
    </script>
</asp:Content>
