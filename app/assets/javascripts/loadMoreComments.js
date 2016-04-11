$(document).ready(function() {
  $('body').on('click', '.show-comments-link', function() {
    $(this).on('ajax:success', function(event, data, status, xhr) {
      var postId = $(this).data("post-id");
      $("#comments_" + postId).html(data);
      $("#show_comments_" + postId).remove();
    });
  });
});