return {
  'refractalize/oil-git-status.nvim',
  config = function()
    local oil_git_status = require("oil-git-status")
    oil_git_status.setup()
  end
}
