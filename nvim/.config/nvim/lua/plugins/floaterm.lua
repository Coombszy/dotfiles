return {
    "voldikss/vim-floaterm",
    -- tag = "", -- None suitable
    event = "VeryLazy",
    config = function()
        local g = vim.g
        g.floaterm_title = "Terminal"
        -- Float: Percent of window width, Integer: Num of columns
        g.floaterm_width = 0.999 -- Lua convets 1.0 to 1, which is then 1 column
        g.floaterm_height = 0.34
        g.floaterm_position = "bottom"
        vim.api.nvim_set_keymap("n", "<F2>", "<cmd>FloatermToggle<CR>", { desc = "Toggle float term" })
        vim.api.nvim_set_keymap("i", "<F2>", "<ESC><cmd>FloatermToggle<CR>", { desc = "Toggle float term" })
        vim.api.nvim_set_keymap("t", "<F2>", "<C-\\><C-n><cmd>FloatermToggle<CR>", { desc = "Toggle float term" })
    end,
}
