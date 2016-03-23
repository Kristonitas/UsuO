enableResponses= () ->
  opts = {
    container: 'epiceditor',
    textarea: 'my-edit-area',
    basePath: '/epiceditor',
    clientSideStorage: false,
    useNativeFullscreen: true,
    parser: marked,
    theme: {
      base: '/themes/base/epiceditor.css',
      preview: '/themes/preview/github.css',
      editor: '/themes/editor/epic-light.css'
    },
    button: {
      preview: true,
      fullscreen: true,
      bar: "auto"
    },
    focusOnLoad: false,
    shortcut: {
      modifier: 18,
      fullscreen: 70,
      preview: 80
    },
    string: {
      togglePreview: 'Toggle Preview Mode',
      toggleEdit: 'Toggle Edit Mode',
      toggleFullscreen: 'Enter Fullscreen'
    },
    autogrow: true
  }

  editor = new EpicEditor(opts);
  editor.load()

  $(".answer").each (v,k) ->
    $(k).find('button').click () ->
      editor.unload()
      $("#new_response").appendTo($(k).find(".comment-field"));
      $("#new_response").find('input[id=response_target_response_token]').val($(k).attr('id').substr(7))
      editor.load()

ready= () ->
  if $("#epiceditor").length
    enableResponses()

$(document).ready(ready);
$(document).on('page:load', ready);

