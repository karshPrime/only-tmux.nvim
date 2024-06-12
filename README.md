# only-tmux.nvim

## Description
You probably use
[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) and
wonder if you could further blur the line between tmux and nvim panes. With this
plugin you could by extending the use of `:only` to minimise/close tmux panes on
your current window as well. 

With a keybind you'll minimise all unfocused nvim panes to buffer and either
move all other tmux panes to new window or simply delete them (or just config
different keys for different actions).


## Installation and Setup
Install using your favorite plugin manager. For example, using
[lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{  'karshPrime/only-tmux.nvim',
    event = 'VeryLazy',
    config = { new_window_name = "session" }
},
```

## Keybinds

```vim
-- move nvim panes to buffer and close unfocused tmux panes
vim.keymap.set('n', '<leader>o', ':TMUXonly close<CR>', { silent = true })

-- move nvim panes to buffer and move unfocused tmux panes to new window
vim.keymap.set('n', '<leader>O', ':TMUXonly move<CR>', { silent = true })
```

