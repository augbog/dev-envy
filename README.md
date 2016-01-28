dev-envy
========

The ultimate development environment? A list of things that optimize your work flow including bash scripts, Sublime plugins, etc.

Don't know markup? Here you go: <a href="https://help.github.com/articles/writing-on-github/" target="_blank">Markup on Github</a>

## Files
`.bash_profile` Edit your `~/.bash_profile` to get access to terminal commands.

`.editorconfig` Put at the root of project folder and use in conjunction with Sublime EditorConfig

`.csscomb.json` Put at the root of project folder and use in conjunction with [csscomb](http://csscomb.com/)

`.eslintrc` I opt for [Airbnb's JavaScript style guide](https://github.com/airbnb/javascript)

## Sublime Text

* <a href="https://github.com/sergeche/emmet-sublime" target="_blank">Emmet.io</a>
  * Generate HTML markup with CSS Selector syntax
  * <a href="http://docs.emmet.io/" target="_blank">Documentation</a>

* <a href="https://sublime.wbond.net/packages/TodoReview" target="_blank">ToDoReview</a>
  * Creates a list of all TODOs in certain files, folders, projects and takes you directly to them
  * Allows you to right-click in Project pane to only look at TODOs of specific project
  * Supports priorities and allows you to sort TODOs by just adding (1) or (2)
  * Exclude .git and node_modules folder

* <a href="https://github.com/Monnoroch/ColorHighlighter" target="_blank">Color Highlighter</a>
  * When highlighting HEX and RGB values, in CSS, color of highlighter will match color

* <a href="http://equinusocio.github.io/material-theme/" target="_blank">Material-Theme</a>
  * Material Design theme for Sublime

## Atom

One line install

```
apm install seti-ui monokai-seti open-recent project-manager todo-show minimap highlight-selected minimap-highlight-selected autoclose-html pigments minimap-pigments linter linter-htmllint linter-csslint linter-jshint linter-scss-lint linter-eslint linter-jsonlint auto-detect-indentation atom-beautify php-cs-fixer emmet trailing-spaces
```

Note: [`php-cs-fixer`](https://github.com/FriendsOfPHP/PHP-CS-Fixer) requires install for `atom-beautify` for PHP

## Vim

```
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'
Plugin 'moll/vim-node'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'wincent/command-t'
Plugin 'mkitt/tabline.vim'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'scrooloose/syntastic'
```

## CLI tools

Miscellaneous tools that are useful to have in the command line

One line install

```
brew install trash jq
```

## NPM tools

Miscellaneous npm packages that are useful to have

One line install

```
npm install -g node-inspector eslint
```

## Chrome extensions

Development
* <a href="https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi" target="_blank">React Developer Tools</a>
Design
* <a href="https://chrome.google.com/webstore/detail/whatfont/jabopobgcpjmedljpbcaablpmlmfcogm/related?hl=en" target="_blank">WhatFont</a>
* <a href="https://chrome.google.com/webstore/detail/dimensions/baocaagndhipibgklemoalmkljaimfdj?hl=en" target="_blank">Dimensions</a>
