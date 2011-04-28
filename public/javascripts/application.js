// This file is automatically included by javascript_include_tag :defaults
$(function() {
  // Add a unique tracking cookie
  // TODO - test it gets included in first view of page
  if($.cookie("uid") == null) {
    var tracking_id = $.md5($.now() + "-" + Math.ceil(Math.random() * 314159)); // Current time + random seed
    $.cookie("uid", tracking_id, { expires: 365 * 20, path: "/" });    
  }

  $("a").live("click", function() {
    params = { click: { url: this.href } };
    $.post("/clicks", params);
    setTimeout('document.location = "' + this.href + '"', 100);
    return false;
  });
});
