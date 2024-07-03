local set = vim.keymap.set
local opts = { noremap = true, silent = false }
local cmd = vim.cmd
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

--=======================================
----------------TEMP---------------------
--=======================================
set("n", "<leader>v", "mfgg=G`fzz", opts)
--rustlings
set("n", "<leader>d", "/\\/\\/ I AM NOT DONE<cr>dddd:w<cr>", opts)

--=======================================
-- set("n", "<C-n>", cmd.Ex, opts)

--reload source file
set("n", "<leader>r", ":source $MYVIMRC<cr>", opts)

--window navigation
set("n", "<C-h>", "<C-w>h", opts)
--set("n", "<C-j>", "<C-w>j", opts)
--set("n", "<C-k>", "<C-w>k", opts)
set("n", "<C-l>", "<C-w>l", opts)

set("n", "<C-j>", "<C-w>W", opts)
set("n", "<C-k>", "<C-w>w", opts)

set("n", "J", "mzJ`z", opts)
set("n", "n", "nzzzv", opts)
set("n", "N", "Nzzzv", opts)

--save and quit
set("n", "<leader>s", ":w", opts)

--clipboard
set("n", "<leader>y", "\"+y", opts)
set("v", "<leader>y", "\"+y", opts)
set("n", "<leader>p", "\"+p", opts)
set("n", "yp", "\"0p", opts) -- paste from yank register(0)

--format
set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, opts)

--go to file, gF respects line number if available
set("n", "gf", "gF", opts)

--VISUAL MODE
set("v", "<", "<gv", opts)
set("v", ">", ">gv", opts)
set("v", "p", "P", opts) --don't change the content of the register in visual mode
--move
set("v", "J", ":move '>+1<cr>gv=gv", opts)
set("v", "K", ":move '<-2<cr>gv=gv", opts)

set("i", "<C-BS>", "<C-W>", opts)


--=======================================
----------------Insert Mode mappings---------------------
--=======================================
-- Basically put frequently used insert mode commands in the right hand,
-- since I use left shift

-- delete word before the cursor
-- <C-G>u sets undo point for each word deletion.
set("i", "<C-U>", "<C-G>u<C-W>", opts)
set("i", "<C-W>", "<C-G>u<C-U>", opts)



-- use i,,<C- u, r, a
