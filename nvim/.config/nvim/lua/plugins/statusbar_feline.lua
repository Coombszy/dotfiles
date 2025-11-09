local gruvbox = { -- Works nice with gruvbox theme
    fg = '#928374',
    bg = '#1F2223',
    black = '#1B1B1B',
    skyblue = '#458588',
    cyan = '#83a597',
    green = '#689d6a',
    oceanblue = '#1d2021',
    magenta = '#fb4934',
    orange = '#fabd2f',
    red = '#cc241d',
    violet = '#b16286',
    white = '#ebdbb2',
    yellow = '#d79921',
}

return {
    "famiu/feline.nvim",
    tag = "v1.1.3",
    event = "VimEnter",
    enabled = false,
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
        -- local ctp_feline = require("catppuccin.groups.integrations.feline")
        -- ctp_feline.setup()
        require("gitsigns").setup()
        require("feline").setup({
            -- components = ctp_feline.get(), -- catppuccin
            theme = gruvbox -- gruvbox
        })
    end,
}
