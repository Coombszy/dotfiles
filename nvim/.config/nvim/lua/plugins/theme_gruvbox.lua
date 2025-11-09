return {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    enabled = true,
    config = function()
        require("gruvbox").setup({})
        vim.cmd.colorscheme "gruvbox"
    end,
}
