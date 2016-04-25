$(document).on('ready page:load', () => {
  $("table#submissions").tablesorter();

  let editor = ace.edit("editor");
  editor.setTheme("ace/theme/twilight");
  editor.getSession().setMode("ace/mode/ruby");
});
