-- Add tmux.nvim plugin
return {
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        copy_sync = {
          enable = true,  -- Enable copying from tmux to Neovim
          redirect_to_clipboard = true,  -- Redirect yanked text to the system clipboard
        },
        navigation = {
          enable_default_keybindings = true,  -- Use default keybindings
        },
      })
    end,
  },
}
