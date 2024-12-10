-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus"
vim.opt.spell = false -- disable spell checking
vim.opt.swapfile = false -- don't create swapfile
vim.opt.scrolloff = 3 -- start scrolling text 3 lines before and after screen limits
vim.opt.sidescrolloff = 3 -- same as 'scrolloff' but horizontally
vim.opt.signcolumn = "yes" -- always show left side column for side-messages
vim.opt.foldcolumn = "auto:9" -- foldcolumn can take from 0 to 9 columns space
vim.opt.showmode = false -- disable -- INSERT -- and -- VISUAL -- like messages
vim.opt.winbar = "%=%f" -- show on top of every buffer the name of that file
vim.opt.laststatus = 3 -- show only one big statusline
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.softtabstop = 4 -- insert 4 spaces for a tab
vim.opt.shiftwidth = 4 -- number of spaces inserted for each indentation
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- use smart indenting
vim.opt.wrap = false -- display lines as one long line
vim.opt.splitright = true -- by default split horizontally to the right
vim.opt.splitbelow = true -- by default split vertically at the bottom
vim.opt.number = true -- get line numbers
vim.opt.relativenumber = true -- display line numbers relative to the current position for quick jumps
vim.opt.cursorline = true -- highlight the current cursor line
vim.opt.hlsearch = false -- don't display matches on the previous search pattern
vim.opt.list = true -- enable listchars
vim.opt.listchars = { tab = "¦ ", trail = "." } -- display tabs and trailing whitespace

vim.opt.shortmess:append("c") -- don't display ins-completion-menu messages
vim.opt.iskeyword:append("-") -- add '-' as a keyword
vim.cmd("set whichwrap+=<,>,[,],h,l") -- enable movement with arrow keys across lines

vim.g.autoformat = false
vim.o.hlsearch = true
vim.o.incsearch = true

vim.diagnostic.enable(false)

-- Apply the custom highlight after the colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.opt.fillchars:append({ diff = " " })
    end,
})
