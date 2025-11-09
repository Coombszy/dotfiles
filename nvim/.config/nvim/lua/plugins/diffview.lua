return {
    "sindrets/diffview.nvim",
    -- tag = "", -- None suitable
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-web-devicons").setup()
        vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>DiffviewOpen<CR>", { desc = "Open diff view" })
        vim.api.nvim_set_keymap("n", "<leader>G", "<cmd>DiffviewClose<CR>", { desc = "Close diff view" })
    end,
}
