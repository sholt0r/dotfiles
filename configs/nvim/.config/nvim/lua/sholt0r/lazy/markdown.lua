return {
	"tadmccorkle/markdown.nvim",
	config = function()
		local markdown = require("markdown")
		markdown.setup({
			mappings = {
				inline_surround_toggle = "ms",
				inline_surround_toggle_line = "mss",
				link_add = "ml",
				link_follow = "gl",
			},
		})
	end,
}
