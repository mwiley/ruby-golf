/* Store user's solution in localStore */
function storeCode(key, code) {
  var codeObject = {
    body: code
  };

  console.log("Storing in " + key, codeObject);
  localStorage.setItem(key, JSON.stringify(codeObject));
};

/* Retreive user's solution from localStorage */
function loadCode(key)  {
  var code;
  try {
    code = JSON.parse(localStorage.getItem(key));
    console.log("Loading from " + key, code)
  } catch (error) {
    console.log('Error loading from ' + key, error);
  }

  if (!code) {
    code = { body: '' }
  }

  return code.body;
};

$(document).on('ready page:load', () => {
  var STORE_KEY = '@submissions/' + window.location.pathname;

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

  var storedCode = loadCode(STORE_KEY);
  editor.setValue(storedCode);
  textarea.val(storedCode);

  editor.getSession().on('change', () => {
    var code = editor.getSession().getValue();
    textarea.val(code);
    storeCode(STORE_KEY, code);
  });
});
