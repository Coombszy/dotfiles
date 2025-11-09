return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = false,
    config = function()
        require("catppuccin").setup({
            integrations = {
                treesitter = true,
                cmp = true,
                gitsigns = true,
                mason = true,
            },
        })
        vim.cmd.colorscheme "catppuccin"
    end,
}
