return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.10.0",
    event = "VeryLazy",
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSInstall" },
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "lua", "vim", "vimdoc", "yaml" },
            auto_install = true,
        })
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
}
