function cargar(urlMetodo, data) {    
    $.ajax({
        type: "POST",
        url: urlMetodo,
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            console.log(response);            
            for (var i = 0; i < response.d.length; i++) {
                var div = '<div class="col-sm-4 col-lg-4 col-md-4">';
                div += '<div class="thumbnail">';
                div += '<img class="img_small" src="' + response.d[i].Imagen + '" alt="">';
                div += '<div class="caption">';
                div += '<h4><a href="Producto.aspx?id=' + response.d[i].Id_Producto + '">' + response.d[i].Nombre_Producto + '</a></h4>';
                div += '<h4>Valor: $' + response.d[i].Precio + '</h4>';
                div += '<h5>Cantidad en Stock: ' + response.d[i].Stock + '</h5>';
                div += '<p>Proveedor: ' + response.d[i].Proveedor.Nombre + '</p>';
                div += '</div></div>';
                $("#index").append(div);
            }
        },
        error: function (response) {
            //Mostrar un mensaje de error
        }
    });
}
