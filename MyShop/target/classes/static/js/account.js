//user info
$(function () {
    $.getJSON("/getUserInfo", function (data) {
        var username = data.data.userName;
        var userimg = data.data.headImg;
        var useremail = data.data.userId;
        var userdate = data.data.birthday;
         // 打印用户信息
        $('#user-info-name').attr('placeholder', username);
        $('#user-info-email').attr('placeholder', useremail);
        $('#send_id').attr('value',useremail);
        if (null != userdate) {
            userdate = userdate.substring(0, 10);
            $('#user-info-date').attr('placeholder', userdate);
        }
        $('#user-info-image').attr('src', userimg);
    })
});

function check() {
    var username = $('#user-info-name').val();
    var userdate = $('#user-info-date').val();
    var userpsw1 = $('#user-info-psw1').val();
    var userpsw2 = $('#user-info-psw2').val();
    var DATE_FORMAT = /^[0-9]{4}-[0-1]?[0-9]{1}-[0-3]?[0-9]{1}$/; //日期的正则表达式
    //对输入内容的判断
    //至少得输入一项
    if (!username && !userdate && !userpsw1 && !userpsw2) {
        swal("", "请至少修改一项内容", "warning");
        return false;
    }
    //密码得一样
    else if (userpsw2 !== userpsw1) {
        swal("", "两次密码输入不一致，请重试", "error");
        return false;
    }
    //输入的格式不能错
    else if (userdate && !DATE_FORMAT.test(userdate)) {
        swal("", "输入的日期格式有误，请按照xxxx-xx-xx的格式输入", "error");
        return false;
    }

}

function checkAddress() {
    var address = $('input[name = addressInfo]').val();
    var phone = $('input[name = phoneNumber]').val();
    if (!address || !phone) {
        swal("", "请将信息输入完整", "warning");
        return false;
    }

}

//上传图片功能
$('#user-info-image').click(function () {
    $('#choose-image').trigger('click');
});
$('#choose-image').change(function () {
    $('#submit-image').submit();
});

//order
$(function () {
    var status = "";
    var order_number = 1;
    $.getJSON("/getUserOrders", function (data) {
        for (var i = 0; i < data.length; i++) {
            status = data[i].orderStatus;
            var orderID = data[i].orderId;
            $.post("/getOrderItems", {
                orderID: data[i].orderId
            }, function (DATA) {
                for (var j = 0; j < DATA.length; j++) {
                    var tr = "<tr>";
                    if (0 == j) {
                        tr += "<td rowspan='" + DATA.length + "'>" + order_number + "</td>";
                        order_number++;
                    }
                    tr += "<td>";
                    tr += "<h4><a href='productdetails?productID=" + DATA[j].productId + "'>" + DATA[j].productName + "</a></h4>";
                    tr += "<span>" + DATA[j].productDescription + "</span>";
                    tr += "</td>";
                    tr += "<td>" + DATA[j].productPrice + "</td>";
                    tr += "<td>" + DATA[j].productLeftTotals + "</td>";
                    tr += "<td>" + DATA[j].productPrice * DATA[j].productLeftTotals + "</td>";
                    if (0 === j) {
                        if (status === "已付款") {
                            tr += "<td rowspan='" + DATA.length + "'>" + "<button id='" + orderID + "' onclick='pay(this)' style=\"margin-right:20px;\"  class=\"btn mini btn-success\"><i class=\"fa fa-edit\"></i>" + status + "</button></td>";
                        }
                        else {

                            tr += "<td rowspan='" + DATA.length + "'>" + "<button id='" + orderID + "' onclick='pay(this)' style=\"margin-right:20px;\"  class=\"btn mini btn-warning\"><i class=\"fa fa-edit\"></i>" + status + "</button></td>";
                        }
                    }
                    if (0 === j) {
                        tr += "<td rowspan='" + DATA.length + "'>" + "<a class=\'glyphicon glyphicon-trash\'href=\'\'></a></td>";
                    }

                    tr += "</tr>";
                    $('#order-info').append(tr);
                }
            })
        }

    })
});

function pay(obj) {
    var btn = $(obj);
    var id = btn.attr("id");
    swal({
        title: "确认付款",
        text: "请确认您的付款",
        type: "info",
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true,
    }).then(function (value) {
        $.post(
            "payOrderByOrderId",
            {orderId: id},
            function (result) {
                if (result == null || result === "") {
                    //TODO
                    btn.text("已付款");
                    btn.removeClass("btn-warning");
                    btn.addClass("btn-success");
                    btn.prop("disabled", true);
                    swal("", "付款成功", "success");
                }
                else {
                    swal("", result, "error");
                }
            }
        );
    });
}


//address
$(function () {
    $.getJSON("/getUserAddress", function (data) {
        console.log(data);
        for (var i = 0; i < data.length; i++) {
            var tr = "<tr>";
            tr += "<td>" + data[i].userId + "</td>";
            tr += "<td>" + data[i].addressInfo + "</td>";
            tr += "<td>" + data[i].phoneNumber + "</td>";
            tr += "<td>" + "<a href=\"javascript:void(0);\">修改</a>|<a href=\"javascript:void(0);\">删除</a>" + "</td>";
            if (data[i].isDefaultAddress === false) {
                tr += "<td>" + "</td>";
            }
            else {
                tr += "<td>" + "默认地址" + "</td>";
            }
            tr += "</tr>";
            $('#address-info').append(tr);
        }
    })

});

//message

$(function () {
    $.getJSON("/getUserMessage", function (data) {
        var unread = 0;
        for (var i = 0; i < data.length; i++) {
            var div = "<div class=\"notif\">";
            if (data[i].isRead === false) {
                div += "<div class=\"notif-status col-sm-1 col-md-1\">未读</div>";
                unread++;
            }
            else {
                div += "<div class=\"notif-status col-sm-1 col-md-1\">已读</div>";
            }
            div += "<div class=\"col-sm-11 col-md-11\">\n" +
                "<div class=\"notif-head\">";
            div += "<span>" + data[i].senderId + "</span>&nbsp;&nbsp;&nbsp;";
            if (data[i].sendTime != null) {
                div += "<span>" + new Date(data[i].sendTime).format(("yyyy-MM-dd").toString()) + "</span>";
            }
            div += "</div>";
            div += "<div class=\"notif-body fa-border\">";
            div += "<p>" + data[i].messageContent + "</p>";
            div += "</div>";
            div += "</div>";
            div += "</div>";
            $('#user-notification').append(div);
        }
        $('.badge').text(unread);
    })
});

Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1,                 //月份
        "d+": this.getDate(),                    //日
        "h+": this.getHours(),                   //小时
        "m+": this.getMinutes(),                 //分
        "s+": this.getSeconds(),                 //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds()             //毫秒
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
};
//js实现标签栏跳转至对应的窗口
$(function () {
    var url = decodeURI(window.location.href);
    var argsIndex = url.split("?kw=");
    var arg = argsIndex[1];
    console.log(arg);
    // $('#shop-menu > li').click(function () {
    //     $('#shop-menu2 > li .active').removeClass('active');
    //     console.log($('li .active'));
    $('#shop-menu2').find('> li').each(function () {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
        }
    })
    $('.tab-content > div').each(function () {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
        }
    })
    var id = "#" + arg;
    $('#shop-menu2').find('> li > a').each(function () {
        if ($(this).attr('href') === id) {
            $(this).parent().addClass("active");
            $(id).addClass("active");
        }
    });
    if (!arg) {
        $('#shop-menu2').find('> li > a').each(function () {
            if ($(this).attr('href') === "#user-info") {
                $(this).parent().addClass("active");
                $("#user-info").addClass("active");
            }
        })
    }
});