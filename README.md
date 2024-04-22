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
Install the plugin using your preferred package manager. For example, with
`Packer`, just add...
```vim
use 'karshPrime/only-tmux.nvim'
```

and setup with
```vim
require('only_tmux').setup({
    new_window_name = "session"
})

-- move nvim panes to buffer and close unfocused tmux panes
vim.api.nvim_set_keymap('n', '<leader>o',
    ':lua require("only_tmux").tmuxCloseAll()<CR>', 
    { noremap = true, silent = true }
)

-- move nvim panes to buffer and move unfocused tmux panes to new window
vim.api.nvim_set_keymap('n', '<leader>O', 
    ':lua require("only_tmux").tmuxMoveOthers()<CR>', 
    { noremap = true, silent = true }
)
```

