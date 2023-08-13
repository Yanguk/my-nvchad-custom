-- cSpell:disable
local opt = vim.opt
local o = vim.o
local keymap = vim.keymap
local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- goToTab
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

-- tab
autocmd("FileType", {
  pattern = { "typescriptreact", "typescript" },
  callback = function()
    -- opt.tabstop = 4
    -- opt.shiftwidth = 4
    -- opt.softtabstop = 4
    opt.expandtab = false
  end,
})

o.termguicolors = true
opt.wrap = false

-- don't create backup files
opt.swapfile = false

-- resize
keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window bigger vertically
keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- UFO folding
o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.cmd [[autocmd FileType * set formatoptions-=cro]]
