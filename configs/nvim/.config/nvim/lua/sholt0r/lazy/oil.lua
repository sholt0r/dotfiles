return {
  'stevearc/oil.nvim',
  config = function()
    local oil = require("oil")

    oil.setup({
      default_file_explorer = true,
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      win_options = {
        signcolumn = "yes:1",
      },
      skip_confirm_for_simple_edits = true,
      watch_for_changes = true,
      view_options = {
        show_hidden = true,
      }
    })

    vim.keymap.set("n", "<leader>pv", vim.cmd.Oil, { desc = "Open parent directory"})
  end
}
