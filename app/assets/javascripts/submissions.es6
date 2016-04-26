$(document).on('ready page:load', () => {
  $("table#submissions").tablesorter();

  var editor = ace.edit("editor");
  editor.setOptions({
    'theme': 'ace/theme/twilight',
    'mode:': 'ace/mode/ruby',
    'tabSize': 2,
    'useSoftTabs': true,
  });

  var textarea = $('#submission_code');
  textarea.hide();

  editor.getSession().on('change', () => {
    textarea.val(editor.getSession().getValue());
  });
});
