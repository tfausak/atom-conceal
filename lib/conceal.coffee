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
    atom.config.observe 'conceal.replacements', (newValue) ->
      replacements = newValue

    atom.workspace.observeTextEditors (editor) ->
      editor.onDidStopChanging ->
        view = atom.views.getView editor
        return unless view

        for element in view.querySelectorAll '::shadow .line span:not(.concealed)'
          replacement = replacements[element.textContent]
          continue unless replacement

          element.classList.add 'concealed'
          element.dataset.replacement = replacement
