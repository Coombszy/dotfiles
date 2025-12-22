return {
    "sindrets/diffview.nvim",
    -- tag = "", -- None suitable
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-web-devicons").setup()

        -- Prevent specific LSPs from attaching to diffview buffers
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                local filetype = vim.bo[bufnr].filetype
                local bufname = vim.api.nvim_buf_get_name(bufnr)

                -- Check if buffer is a diffview buffer
                if filetype:match("^diffview") or
                   filetype == "DiffviewFiles" or
                   bufname:match("^diffview://") then
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local client_id = args.data.client_id

                    -- List of LSP servers to disable in diffview
                    -- They cause issues due to parts of the buffer missing
                    local disabled_lsps = {
                        "terraformls",
                        "gopls",
                        "rust-analyzer",
                        "yamlls",
                        "jsonls",
                        "ansible-language-server",
                    }

                    if client then
                        for _, lsp_name in ipairs(disabled_lsps) do
                            if client.name == lsp_name then
                                vim.lsp.buf_detach_client(bufnr, client_id)
                                return
                            end
                        end
                    end
                end
            end,
        })

        -- Auto-close diffview when leaving the tab
        vim.api.nvim_create_autocmd("TabLeave", {
            callback = function()
                local view = require("diffview.lib").get_current_view()
                if view then
                    vim.cmd("DiffviewClose")
                end
            end,
        })

        -- Toggle diffview open/close
        vim.keymap.set("n", "<leader>g", function()
            local view = require("diffview.lib").get_current_view()
            if view then
                vim.cmd("DiffviewClose")
            else
                vim.cmd("DiffviewOpen")
            end
        end, { desc = "Toggle diff view" })
    end,
}
