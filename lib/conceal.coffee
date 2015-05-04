module.exports =
  config:
    replacements:
      type: 'object'
      default:
        '::': '∷'
        '=>': '⇒'
        '->': '→'

  activate: ->
    replacements = atom.config.get 'conceal.replacements'
    atom.workspace.observeTextEditors (editor) ->
      editor.onDidStopChanging ->
        view = atom.views.getView editor
        return unless view

        for element in view.querySelectorAll '::shadow .line span'
          continue unless element.childElementCount == 0

          replacement = replacements[element.textContent]
          continue unless replacement

          element.classList.add 'concealed'
          element.dataset.replacement = replacement
