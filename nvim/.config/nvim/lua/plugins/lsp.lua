return {

    -- Mason (LSP Config/Autoloading)
    {
        "mason-org/mason.nvim",
        event = "VeryLazy",
        tag = "stable",
        dependencies = { "mason-org/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- Configure LSP servers
            require("mason").setup()
            require("mason-lspconfig").setup({
                automatic_enable = true,
            })

            -- Get usable LSP capabilities. Set as default LSP caps
            local cap = cmp_nvim_lsp.default_capabilities()
            vim.lsp.config('*', {capabilities = cap})
        end
    },

    -- Auto completion (nvim-cmp)
    {
        "hrsh7th/nvim-cmp",
        -- tag = "", -- None suitable
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/cmp-buffer",           -- source from buffer
            "hrsh7th/cmp-path",             -- source from file system paths
            "L3MON4D3/LuaSnip",             -- snippet engine
            "rafamadriz/friendly-snippets", -- generic snippet collection
            "saadparwaiz1/cmp_luasnip",     -- source from snippet engine
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Load generic snippets (friendly-snippets)
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                snippet = {
                    -- Interact with snippet engine
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<F4>"] = cmp.mapping.complete(),                  -- Show suggestions
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm suggestion
                    ["<C-PageDown>"] = cmp.mapping.scroll_docs(2),      -- Scroll docs down
                    ["<C-PageUp>"] = cmp.mapping.scroll_docs(-2),       -- Scroll docs up
                }),
                -- All sources for completion
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- LSP servers
                    { name = "luasnip" },  -- snippets
                    { name = "buffer" },   -- text in current buffer
                    { name = "path" },     -- file system paths
                }),
            })
        end
    },
}
