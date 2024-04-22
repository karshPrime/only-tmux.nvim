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

        -- create a new tmux window 
        vim.cmd('silent !tmux new-window -d -n ' .. new_window)
        local new_window_index = vim.fn.trim(
            vim.fn.system('tmux display-message -p "#I"')
        )

        -- move other panes to the new window
        local pane_list = vim.fn.systemlist(
            "tmux list-panes -F '#{pane_id} #{?pane_active,yes,no}'"
        )

        for _, pane in ipairs(pane_list) do
            if not string.find(pane, "yes") then
                local pane_id = string.match(pane, "(%S+)")

                vim.cmd(
                    'silent !tmux join-pane -s ' .. pane_id .. ' -t ' .. new_window_index
                )

            end
        end
    end
end

return M

