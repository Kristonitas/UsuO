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

  if $('.answer').length
    $(".answer").each (v,k) ->
      $(k).find('button').click () ->
        $("#new_response").find('#response-title').text("Write a comment")

        editor.unload()
        $("#new_response").appendTo($(k).find(".comment-field"));
        $("#new_response").find('input[id=response_target_response_token]').val($(k).attr('id').substr(7))
        editor.load()

  if $('#cancel-comment-button').length
    $('#cancel-comment-button').click () ->
      $("#new_response").find('#response-title').text("Write an answer")

      editor.unload()
      $("#new_response").appendTo($('#answer-container'))
      $("#new_response").find('input[id=response_target_response_token]').val('')
      editor.load()

  if $('#question_tag_list')
    $('#question_tag_list').selectize
      maxItems: 5,
      maxOptions: 10,
      delimiter: ',',
      persist: false,
      create: (input) ->
        return {
          value: input.toLowerCase().replace(/ /g,"-"),
          text: input.toLowerCase().replace(/ /g,"-")
        }

ready= () ->
  if $("#epiceditor").length
    enableResponses()

$(document).ready(ready);
$(document).on('page:load', ready);

