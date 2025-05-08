return {
  'nosduco/remote-sshfs.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    local sshfs = require('remote-sshfs')
    local api = require('remote-sshfs.api')

    sshfs.setup({
      mounts = {
        unmount_on_exit = true,
      },
      ui = {
        confirm = {
          connect = false,
        },
      },
    })

    vim.keymap.set("n", "<leader>rc", function() api.connect() end)
    vim.keymap.set("n", "<leader>rd", function() api.disconnect() end)
    vim.keymap.set("n", "<leader>re", function() api.edit() end)

  end
}
