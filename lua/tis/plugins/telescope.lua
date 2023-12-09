return {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim",
                    "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
    config = function()
        -- telescope keymaps
        local keymap = vim.keymap
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {})
        keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {})
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {})
        keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", {})
    end,
}
