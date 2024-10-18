return {
  -- Other plugins...
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        copy_sync = {
          enable = true, -- enables tmux clipboard sync
          redirect_to_clipboard = true, -- copy to system clipboard
        },
        navigation = {
          enable_default_keybindings = true, -- enables default tmux navigation keybindings
        },
      })
    end,
  },
}
