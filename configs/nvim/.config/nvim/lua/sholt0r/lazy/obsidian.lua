return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local obsidian = require("obsidian")

    obsidian.setup({
      workspaces = {
        {
        name = "Main",
        path = "~/Obsidian/Main",
        },
      },
    })

    vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick switch to another note" })
    vim.opt.conceallevel = 2

  end
}
