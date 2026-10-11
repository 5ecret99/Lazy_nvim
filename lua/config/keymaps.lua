-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = function(lhs, rhs) vim.keymap.set("n", lhs, rhs, { silent = true }) end

map("<C-f>", "<cmd>Telescope find_files<CR>")
map("<C-g>", "<cmd>Telescope live_grep<CR>")
map("<C-b>", "<cmd>Telescope buffers<CR>")
map("<C-t>", "<cmd>Telescope tags<CR>")
map("<C-u>", "<cmd>Telescope resume<CR>")
map("<C-m>", "<cmd>CopilotChat<CR>") -- note: <C-m> is the same key as <CR> in a terminal
map("<C-e>", "<cmd>Neotree<CR>")

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
  { ";st", "<cmd>Telescope tags<CR>", desc = "Tags" },
  { ";sp", "<cmd>Telescope registers<CR>", desc = "Registers" },
  { ";sm", "<cmd>CopilotChat<CR>", desc = "CopilotChat" },
}, { mode = "n" }) -- Ensure that the mappings are for normal mode only
