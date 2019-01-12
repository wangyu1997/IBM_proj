$(function () {
    $.getJSON("/getUserInfo", function (data) {
        var user_id = data.data.userId;
        console.log(user_id);
        $('#send_id').text(user_id);
    })
});