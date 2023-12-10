return {
    "tpope/vim-surround",
    "vim-scripts/ReplaceWithRegister",
    { "numToStr/Comment.nvim", event = {
        "BufReadPre", "BufNewFile" }, config = true, 
        lazy = false 
    },
    "szw/vim-maximizer",
}


-- vim-surround keymaps
-- cs"' -- "Hello" -> 'Hello'
-- cs'<q> -- 'Hello' -> <q> Hello </q>
-- cst" -- <q> Hello </q> -> "Hello"
-- ds" -- "Hello" -> Hello
--
--
-- ReplaceWithRegister example
-- text1 text2 - replace word with copy 
-- 1 action copy word -> yw
-- 2 action replace word with copied one -> grw
--
--
-- Comment.nvim example
--
-- gcc - put line in comment
-- gbc - blockwise comment
-- [count]gcc - number of given times put in comment
-- gc8j - toggle 8 lines after the current position
-- gc8k - toggle 8 lines before current position
