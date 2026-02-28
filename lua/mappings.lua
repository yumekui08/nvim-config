require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- 置換/削除コマンドの短縮入力補助関数
_G.ShortcutCmd = function(replace_from, replace_to)
    local cmdtype = vim.fn.getcmdtype()
    local cmdline = vim.fn.getcmdline()
    local cmd = cmdtype .. cmdline

    if string.match(cmd, '^:' .. replace_from) then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<BS>%' .. replace_to, true, false, true), 'n', false)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Left><Left><Left>', true, false, true), 'n', false)
        return ''
    elseif string.match(cmd, "^:'<,'>" .. replace_from) then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<BS>' .. replace_to, true, false, true), 'n', false)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Left><Left><Left>', true, false, true), 'n', false)
        return ''
    end
    return replace_from
end

-- 短縮入力
vim.cmd([[cnoreabbrev <expr> s v:lua.ShortcutCmd('s', 's///g')]])
vim.cmd([[cnoreabbrev <expr> v v:lua.ShortcutCmd('v', 'v//d')]])
vim.cmd([[cnoreabbrev <expr> g v:lua.ShortcutCmd('g', 'g//d')]])

-- Key mappings
-- vim.api.nvim_set_keymap('n', '<Tab-w>', ':tabnext<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<S-Tab-w>', ':tabprevious<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-Tab>', '<C-w>w', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-S-Tab>', '<C-w>h', { noremap = true })

vim.api.nvim_set_keymap('n', '$', 'g_', { noremap = true })
vim.api.nvim_set_keymap('v', '$', 'g_', { noremap = true })

vim.api.nvim_set_keymap('n', '1', '0', { noremap = true })
vim.api.nvim_set_keymap('v', '1', '0', { noremap = true })

vim.api.nvim_set_keymap('n', '0', 'g_', { noremap = true })
vim.api.nvim_set_keymap('v', '0', 'g_', { noremap = true })
vim.api.nvim_set_keymap('n', '-', 'g_', { noremap = true })
vim.api.nvim_set_keymap('v', '-', 'g_', { noremap = true })

vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', { noremap = true })
