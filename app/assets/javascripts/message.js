$(function () {
  let html;
  for (let i = 1; i <= 3; i++){
    html = `<input type="file" name="message[images_attributes][${i}][image]" id="message_images_attributes_${i}_image">`
    $(".aaa").append(html);
  }
})