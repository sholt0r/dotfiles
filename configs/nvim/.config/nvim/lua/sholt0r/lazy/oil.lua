return {
  'stevearc/oil.nvim',
  config = function()
    local oil = require("oil")

    oil.setup({
      default_file_explorer = true,
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
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

    vim.api.nvim_create_autocmd("User", {
      pattern = "OilEnter",
      callback = function(args)
        local oil_dir = vim.api.nvim_buf_get_name(args.buf)
        local fs_path = oil_dir:gsub('^oil://', ''):gsub('/$', '')
        if vim.fn.isdirectory(fs_path) == 1 then
          vim.cmd("cd " .. vim.fn.fnameescape(fs_path))
        end
      end,
    })
  end
}
