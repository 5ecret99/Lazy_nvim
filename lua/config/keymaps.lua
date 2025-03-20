-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>FzfLua files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>FzfLua live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>FzfLua buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>FzfLua tags<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>FzfLua tmux_buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<cmd>FzfLua resume<CR>", { noremap = true, silent = true })
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
  { ";sf", "<cmd>FzfLua files<CR>", desc = "Find Files" },
  { ";sg", "<cmd>FzfLua live_grep<CR>", desc = "Grep Text" },
  { ";sb", "<cmd>FzfLua buffers<CR>", desc = "Opened Buffers" },
  { ";st", "<cmd>FzfLua tags<CR>", desc = "Tags" },
  { ";sp", "<cmd>FzfLua tmux_buffers<CR>", desc = "Clipboard" },
}, { mode = "n" }) -- Ensure that the mappings are for normal mode only
