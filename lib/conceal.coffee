module.exports =
  config:
    replacements:
      type: 'object'
    preserveWidth:
      type: 'boolean'
      default: yes
      title: 'Preserve the width of the concealed element'
      description: 'When replacing an element you have the choice of replacing
                    the entire value (including it\'s space) or preseve the
                    width of the original element.'

  activate: ->
    replacements = atom.config.get 'conceal.replacements'
    atom.config.observe 'conceal.replacements', (newValue) ->
      replacements = newValue

    atom.workspace.observeTextEditors (editor) ->
      editor.onDidStopChanging ->
        view = atom.views.getView editor
        return unless view

        for element in view.querySelectorAll '.line span:not(.syntax--concealed)'
          replacement = replacements[element.textContent]
          continue unless replacement

          element.classList.add 'syntax--concealed'
          element.dataset.replacement = replacement
          unless atom.config.get 'conceal.preserveWidth'
            element.dataset.replacementLength = replacement.length
