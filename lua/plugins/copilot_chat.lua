return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    require("CopilotChat").setup()
  end,
}
