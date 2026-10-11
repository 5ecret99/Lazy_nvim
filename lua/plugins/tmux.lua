-- tmux <-> nvim: seamless pane navigation (C-hjkl), resize (A-hjkl) and register sync
return {
  {
    "aserowy/tmux.nvim",
    opts = {
      copy_sync = {
        enable = true,
        redirect_to_clipboard = true, -- tmux >= 3.2: yanks go to the system clipboard
      },
      navigation = {
        enable_default_keybindings = true,
        cycle_navigation = true,
        persist_zoom = true,
      },
      resize = { enable_default_keybindings = true },
    },
  },
}
