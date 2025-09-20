return {
  {
    "ThePrimeagen/harpoon",
    opts = {
      settings = {
        save_on_toggle = true,
        save_on_ui_close = true,
        save_on_change = true,
        key = function()
          return vim.loop.cwd()
        end,
        exclude_buffers = function(bufnr)
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          return bufname:match("^oil://")
        end,
      },
    },
    keys = function()
      local harpoon = require("harpoon")
      local keys = {
        {
          "<leader>a",
          function()
            harpoon:list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<C-d>",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
        },
        {
          "<C-h>",
          function()
            harpoon:list():select(1)
          end,
        },
        {
          "<C-j>",
          function()
            harpoon:list():select(2)
          end,
        },
        {
          "<C-k>",
          function()
            harpoon:list():select(3)
          end,
        },
        {
          "<C-l>",
          function()
            harpoon:list():select(4)
          end,
        },
        {
          "<C-S-P>",
          function()
            harpoon:list():prev()
          end,
        },
        {
          "<C-S-N>",
          function()
            harpoon:list():next()
          end,
        },
      }
      return keys
    end,
  },
}
