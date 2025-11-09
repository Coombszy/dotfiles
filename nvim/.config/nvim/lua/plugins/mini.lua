return {
    "echasnovski/mini.nvim",
    version = "*", -- Latest stable
    event = "VimEnter",
    config = function()
        require("mini.files").setup({
            mappings = {
                close  = "<ESC>",
                -- Stop using arrow keys loser!
                -- go_in  = "<Right>",
                -- go_out = "<Left>",
            },
        })
        local mf = require("mini.files")
        function ToggleMiniFiles(path)
            if not mf.close() then
                mf.open(path)
            end
        end

        vim.api.nvim_set_keymap("n", "<F3>", "<cmd>lua ToggleMiniFiles()<CR>", { desc = "Toggle mini.files" })
        vim.api.nvim_set_keymap("n", "<S-F3>", "<cmd>lua ToggleMiniFiles(vim.api.nvim_buf_get_name(0))<CR>", { desc = "Toggle mini.files (cwd)" })
    end,
}
