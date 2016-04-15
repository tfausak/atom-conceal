**This is a proof of concept. It is not actively maintained and has several known bugs. Consider using something like [Fira Code](https://github.com/tonsky/FiraCode) instead.**

# Conceal

Conceal is an [Atom][] package that conceals text and replaces it with prettier
alternatives.

![Screenshot][]

To configure Conceal, set the `replacements` option in your config.

``` cson
# config.cson
"*":
  conceal:
    replacements:
      ".": "∘"
```

[atom]: https://atom.io
[screenshot]: https://i.imgur.com/MxEX9hN.png
