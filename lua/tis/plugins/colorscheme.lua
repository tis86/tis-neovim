return {
    "EdenEast/nightfox.nvim",
    priority = 1000, --high priority
    config = function()
        -- load colors and config
        vim.cmd([[colorscheme nightfox]])
    end,
}
