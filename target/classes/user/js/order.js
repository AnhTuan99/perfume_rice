var order = {

    chon_san_pham_dua_vao_gio_hang: function (productId, soLuong) {
        var data = {};
        data["productId"] = productId;
        data["soLuong"] = soLuong;

        $.ajax({
            url: "/chon-san-pham-dua-vao-gio-hang",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(data), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function (jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.statusCode == 200) {
                    // alert('Thêm vào giỏ hàng thành công');
                    /*location.reload();*/
                    $("#so_luong_sp").html(jsonResult.data);
                    $("#soLuongInMenu").html(jsonResult.data);


                } else {
                    alert('loi');
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
    /*Xóa sản phẩm trong giỏ hàng*/
    xoa_sp_trong_gio_hang: function (productId) {
        var data = {};
        data["productId"] = productId;


        $.ajax({
            url: "/xoa-sp-gio-hang",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: "json",
            success: function (jsonResult) {

                if (jsonResult.statusCode == 200) {


                    $('#spInMenu' + productId).remove();
                    $('#sp' + productId).remove();
                    $("#tongtienT").html(jsonResult.data["tongGia"]);
                    $("#tongtien").html(jsonResult.data["tongGia"]);
                    $("#so_luong_sp").html(jsonResult.data["soLuong"]);
                    $("#soLuongInMenu").html(jsonResult.data["soLuong"]);
                    // alert('Xóa thành công');
                    if(jsonResult.data["soLuong"] <= 0){
                        $("#formCart").hide();
                        $("#shopping-cart-table").css('display','none');
                        $("#alertPro").css('display','block');
                        $("#noProInCart").css('display','block');
                    }


                } else {
                    alert('Lỗi');
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },

    update_sl_sp_trong_gio_hang(productId, gia, tongSoLuong){
    var soLuong = Number($('.so_luong_sp'+productId).val());
    /*if(soLuong > tongSoLuong)
    {
        var lk = Number($('.slBD'+productId).val());
        alert("Số lượng sản phẩm không đủ");
        $('.so_luong_sp'+productId).val(lk);
    }
    else{

    }*/
        var data = {};
        data["productId"] = productId;
        data["soLuong"] = soLuong;

        $.ajax({
            url: "/update-sp-gio-hang",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(data),

            dataType: "json",
            success: function(jsonResult) {
                /*$('.slBD'+productId).val(soLuong);*/
                $("#giatien"+productId).html(jsonResult.data.soLuong);
                $("#tongtienT").html(jsonResult.data.tongGia);
                $("#tongtien").html(jsonResult.data.tongGia);
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });

}


}