return {
    "vim-test/vim-test",
    event = "VeryLazy",
    keys = {
        { "<leader>tt", "<cmd>TestFile<cr>",    { desc = "Test Test" } },
        { "<leader>tn", "<cmd>TestNearest<cr>", { desc = "Test Nearest" } },
        { "<leader>ts", "<cmd>TestSuite<cr>",   { desc = "Test Suite" } },
        { "<leader>tl", "<cmd>TestLast<cr>",    { desc = "Test Last" } },
        { "<leader>tv", "<cmd>TestVisit<cr>",   { desc = "Test Visit" } },
    },
}
