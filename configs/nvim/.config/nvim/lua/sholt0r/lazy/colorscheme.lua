return {
  'olimorris/onedarkpro.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local onedarkpro = require('onedarkpro')

    onedarkpro.setup({
      options = {
        transparency = true
      }
    })

    vim.cmd('colorscheme onedark_vivid')
  end
}
