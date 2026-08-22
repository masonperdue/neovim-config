local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
            timeout = 200,
        })
    end,
})

autocmd("VimResized", {
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Adapted from https://github.com/Folke/LazyVim
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

autocmd("FileType", {
    pattern = { "help", "man", "lspinfo", "checkhealth" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
    end,
})
