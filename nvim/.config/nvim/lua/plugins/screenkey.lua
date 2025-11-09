return {
    "NStefan002/screenkey.nvim",
    event = { "BufReadPre", "BufNewFile", "BufEnter", "BufNew" },
    version = "*", -- or branch = "dev", to use the latest commit
    enabled = true,
    config = function()
        require("screenkey").setup({
            win_opts = {
                row = vim.o.lines - vim.o.cmdheight - 1,
                -- col = vim.o.columns - 1,
                col = math.floor(vim.o.columns / 2),
                relative = "editor",
                anchor = "SE",
                width = 25,
                height = 1,
                border = "single",
                title = "Key presses",
                title_pos = "center",
                style = "minimal",
                focusable = false,
                noautocmd = true,
            },
        })
    end,
}
