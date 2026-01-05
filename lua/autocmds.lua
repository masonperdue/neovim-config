local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 1. Highlight on Yank
-- Briefly highlights the text you just copied (yanked)
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual", -- Uses your theme's Visual highlight color
            timeout = 200,      -- Duration in milliseconds
        })
    end,
})

-- 2. Resize Splits on Terminal Resize
-- Automatically adjusts window sizes if you resize your terminal window
autocmd("VimResized", {
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- 3. Go to last loc when opening a buffer
-- Returns the cursor to the exact line/column you were on when you last closed the file
autocmd("BufReadPost", {
    callback = function(event)
        local exclude = { "gitcommit", "gitrebase" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
            return
        end
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- 4. Close certain windows with <q>
-- Makes it easier to close help, man pages, or quickfix windows
autocmd("FileType", {
    pattern = { "help", "man", "lspinfo", "checkhealth" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
    end,
})
