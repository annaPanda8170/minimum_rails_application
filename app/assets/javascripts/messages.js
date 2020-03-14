$(function () {
  $(".form").on("submit", function (e) {
    e.preventDefault();
    $.ajax({
      url: "/messages",
      type: "POST",
      data: { message: { message: $("#message_message").val() } },
      dataType: 'json',
    }).done(function (eee) {
      $('.form')[0].reset();
      $('#bbb').prop('disabled', false);
      $("#aaa").append(`<div style="margin-top: 20px;"><span style="color: red;">${eee.ddd}</span>${eee.ccc}</div>`)
    });
  })
});