return {
    "simrat39/rust-tools.nvim",
    lazy = true,
    opts = function()
        local ok, mason_registry = pcall(require, "mason-registry")
        local adapter ---@type any
        if ok then
            -- rust tools configuration for debugging support
            local codelldb = mason_registry.get_package("codelldb")
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = ""
            if vim.loop.os_uname().sysname:find("Windows") then
                liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
            elseif vim.fn.has("mac") == 1 then
                liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
            else
                liblldb_path = extension_path .. "lldb/lib/liblldb.so"
            end
            adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
        end
        return {
            dap = {
                adapter = adapter,
            },
            tools = {
                on_initialized = function()
                    vim.cmd([[
                                augroup RustLSP
                                    autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                                    autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                                    autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                                augroup END
                            ]])
                end,
            },
        }
    end,
    config = function() end,

--[[        {
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
                local cmp_nvim_lsp = require("cmp_nvim_lsp")
                local rt = require("rust-tools")
                local capabilities = cmp_nvim_lsp.default_capabilities()
                rt.setup({
                        server = {
                        capabilities = capabilities,
                        on_attach = function(_, bufnr)
                                -- Hover actions
                                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                                -- Code action groups
                                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                        end,
                        },
                })
        end,
        ]]
}
