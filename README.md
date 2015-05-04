# Conceal

Conceal is an [Atom][] package that conceals text and replaces it with prettier
alternatives.

![Screenshot][]

To configure Conceal, set the `replacements` option in your init script.

``` coffee
# init.coffee
atom.config.set 'conceal.replacements',
  '.' : '∘'
```

[atom]: https://atom.io
[screenshot]: https://i.imgur.com/MxEX9hN.png
