-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<cmd>Telescope resume<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>Neotree<CR>", { noremap = true, silent = true })

vim.keymap.set("n", ";", "<Nop>") -- Unbind semicolon from its default behavior

local wk = require("which-key")

wk.add({
  -- Normal mode mappings
  { ";", group = "Utils" }, -- Start of Utils menu
  { ";f", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format Document" },
  { ";a", "<cmd>ClangdSwitchSourceHeader<CR>", desc = "Switch Source/Header" },
  { ";e", "<cmd>Neotree<CR>", desc = "File Explorer" },
  { ";s", group = "Search" }, -- Start of Search submenu
  { ";sf", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
  { ";sg", "<cmd>Telescope live_grep<CR>", desc = "Grep Text" },
  { ";sb", "<cmd>Telescope buffers<CR>", desc = "Opened Buffers" },
}, { mode = "n" }) -- Ensure that the mappings are for normal mode only
