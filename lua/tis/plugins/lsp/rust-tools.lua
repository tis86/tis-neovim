return {
    {
        "simrat39/rust-tools.nvim",
        ft = "rust"
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end
    },

    config = function()
  --      local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local rt = require("rust-tools")
 --       local capabilities = cmp_nvim_lsp.default_capabilities()
        rt.setup({
            server = {
--            capabilities = capabilities,
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
            },
        })
    end,
}
