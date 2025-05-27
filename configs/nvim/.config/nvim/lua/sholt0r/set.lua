vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
if (vim.fn.has('unix') == 1) then
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.g.mapleader = " "

--vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
