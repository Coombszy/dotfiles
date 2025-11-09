return {
    "karb94/neoscroll.nvim",
    -- tag = "" -- None suitable
    event = "VimEnter",
    -- enabled = false, -- Disabled due to bug: https://github.com/karb94/neoscroll.nvim/issues/96
    config = function()
        local neoscroll = require('neoscroll')
        neoscroll.setup({
            easing = "quintic",
            mappings = {},
            performance_mode = true, -- Disable "Performance Mode" on all buffers.
            ignored_events = {       -- Events ignored while scrolling
                'WinScrolled', 'CursorMoved'
            },
        })

        local keymap = {
            ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 150 }) end,
            ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 150 }) end,
            ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 250 }) end,
            ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 250 }) end,
            ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
            ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
            ["zt"]    = function() neoscroll.zt({ half_win_duration = 150 }) end,
            ["zz"]    = function() neoscroll.zz({ half_win_duration = 150 }) end,
            ["zb"]    = function() neoscroll.zb({ half_win_duration = 150 }) end,
        }

        local modes = { 'n', 'v', 'x' }
        for key, func in pairs(keymap) do
            vim.keymap.set(modes, key, func)
        end
    end,
}
