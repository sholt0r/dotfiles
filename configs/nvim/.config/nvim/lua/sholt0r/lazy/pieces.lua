return {
  'pieces-app/plugin_neovim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    'hrsh7th/nvim-cmp',
  },
  build = ':UpdateRemotePlugins',
  lazy = false
}
