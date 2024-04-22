local M = {}

local default_config = {
    new_window_name = "moved"     -- default name for new windows
}

local user_config = {}

-- up user configuration
function M.setup(config)
    user_config = vim.tbl_extend(
        "force", 
        default_config, 
        config or {}
    )
end

-- close all other tmux panes except the current one
function M.tmuxCloseAll()
    if os.getenv("TMUX") then
        vim.cmd('silent !tmux kill-pane -a')
        vim.cmd('silent only')
    else
        vim.cmd('silent only')
    end
end

-- move all other tmux panes to a new window
function M.tmuxMoveOthers()
    if os.getenv("TMUX") then
        local new_window = user_config.new_window_name
        local current_session = vim.fn.system("tmux display-message -p \"#I\"")
        vim.cmd("silent !tmux break-pane")
        vim.cmd("silent !tmux swap-window -d -t " .. current_session)
    end
end

return M

