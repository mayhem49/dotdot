local opt = vim.opt

opt.number = true
--opt.relativenumber = true

local tabwidth = 2
opt.tabstop = tabwidth
opt.softtabstop = tabwidth
opt.shiftwidth = tabwidth
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.signcolumn = "yes"

opt.splitright = true

opt.incsearch = true

opt.scrolloff = 4
opt.swapfile = false
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
