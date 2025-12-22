return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    enabled = true,
    config = function()
        require('lualine').setup {
            options = {
                theme = 'auto',
            },
            sections = {
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = {
                    'lsp_status',
                    function()
                        local format_icons = {
                            unix = '', -- e712
                            dos = '', -- e70f
                            mac = '', -- e711
                        }
                        local format = vim.bo.fileformat
                        local icon = format_icons[format] or format
                        if vim.bo.filetype == "" then
                            return icon
                        else
                            return vim.bo.fileencoding .. "/" .. icon
                        end

                    end,
                    'filetype',
                    'progress'
                },
                lualine_y = { "os.date('%H:%M')" }
            }
        }
    end
}
