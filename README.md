# telescope-cmake4vim.nvim

Integration for [cmake4vim](https://github.com/ilyachur/cmake4vim) with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).

## Requirements

- [cmake4vim](https://github.com/ilyachur/cmake4vim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

## Setup

You can setup the extension by doing

```lua
require('telescope').load_extension('cmake4vim')
```

somewhere after your require('telescope').setup() call.

## Available commands

```vim
:Telescope cmake4vim select_kit
:Telescope cmake4vim select_target
:Telescope cmake4vim select_build_type
```

## Available functions

```lua
require'telescope'.extensions.cmake4vim.select_kit{}
require'telescope'.extensions.cmake4vim.select_target{}
require'telescope'.extensions.cmake4vim.select_build_type{}
```
