return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded"
    },
    doc_lines = 0,
    hint_enable = false,
    floating_window = true,
    floating_window_off = 5
  },
  config = function(_, opts) require("lsp_signature").setup(opts) end
}
