-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<cmd>Telescope resume<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>Neotree<CR>", { noremap = true, silent = true })

vim.keymap.set("n", ";", "<Nop>") -- Unbind semicolon from its default behavior

local function toggle_diffopt_iwhite()
  local diffopt = vim.opt.diffopt:get()
  if vim.tbl_contains(diffopt, "iwhite") then
    vim.opt.diffopt:remove("iwhite")
    print("Disabled ignoring whitespace in diff")
  else
    vim.opt.diffopt:append("iwhite")
    print("Enabled ignoring whitespace in diff")
  end
end

local wk = require("which-key")

wk.add({
  -- Normal mode mappings
  { ";", group = "Utils" }, -- Start of Utils menu
  { ";F", "m'<cmd>silent! ?^\\s*using\\|>;?,/>;/EasyAlign * / \\@<=, \\|>,\\|> \\+>{};\\|>>;\\|>$/ {'right_marin':0, 'delimiter_align':l}<cr><esc><cmd>nohl<cr>`'", desc = "Align Fsm" },
  { ";f", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format Document" },
  { ";a", "<cmd>ClangdSwitchSourceHeader<CR>", desc = "Switch Source/Header" },
  { ";e", "<cmd>Neotree<CR>", desc = "File Explorer" },
  { ";w", toggle_diffopt_iwhite, desc = "Toggle to ignore white spaces im vimdiff" },
  { ";q", "<cmd>qa<CR>", desc = "Exit all files" },
  { ";s", group = "Search" }, -- Start of Search submenu
  { ";sf", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
  { ";sg", "<cmd>Telescope live_grep<CR>", desc = "Grep Text" },
  { ";sb", "<cmd>Telescope buffers<CR>", desc = "Opened Buffers" },
}, { mode = "n" }) -- Ensure that the mappings are for normal mode only
