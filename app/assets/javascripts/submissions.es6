$(document).on('ready page:load', () => {
  $("table#submissions").tablesorter();

  var editor = ace.edit("editor");
  editor.setTheme("ace/theme/twilight");
  editor.getSession().setMode("ace/mode/ruby");

  var textarea = $('#submission_code');
  textarea.hide();

  editor.getSession().on('change', () => {
    textarea.val(editor.getSession().getValue());
  });
});
