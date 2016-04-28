var STORE_KEY = '@submissions/' + window.location.pathname;

function storeCode(code) {
  var codeObject = {
    body: code
  };

  console.log("Storing in " + STORE_KEY, codeObject);
  localStorage.setItem(STORE_KEY, JSON.stringify(codeObject));
};

function loadCode()  {
  var code;
  try {
    code = JSON.parse(localStorage.getItem(STORE_KEY));
  } catch (e) {
    code = {
      body: ''
    }
  }

  console.log("Loading from " + STORE_KEY, code);
  return code.body;
};

$(document).on('ready page:load', () => {
  $("table#submissions").tablesorter({
    sortList: [[3,0],[2,0]]
  });

  var editor = ace.edit("editor");
  editor.getSession().setMode('ace/mode/ruby');
  editor.setOptions({
    'theme': 'ace/theme/twilight',
    'tabSize': 2,
    'useSoftTabs': true,
  });

  var textarea = $('#submission_code');
  textarea.hide();

  var storedCode = loadCode();
  editor.setValue(storedCode);

  editor.getSession().on('change', () => {
    var code = editor.getSession().getValue();
    textarea.val(code);
    storeCode(code);
  });
});
