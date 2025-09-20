return {
  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")

      local function get_project_root()
        local root_markers = {
          ".git",
          "package.json",
          "Cargo.toml",
          "go.mod",
          "requirements.txt",
          "Makefile",
          ".project",
          ".root",
          ".jj",
        }

        local current_file = vim.fn.expand("%:p:h")
        if current_file == "" then
          current_file = vim.fn.getcwd()
        end

        local function find_root(path)
          for _, marker in ipairs(root_markers) do
            if vim.fn.filereadable(path .. "/" .. marker) == 1 or vim.fn.isdirectory(path .. "/" .. marker) == 1 then
              return path
            end
          end

          local parent = vim.fn.fnamemodify(path, ":h")
          if parent == path then
            return vim.fn.getcwd()
          end

          return find_root(parent)
        end

        return find_root(current_file)
      end

      fzf.setup({
        winopts = {
          height = 0.85,
          width = 0.80,
          preview = {
            default = "bat",
            border = "border",
            wrap = "nowrap",
            hidden = "nohidden",
            vertical = "down:45%",
            horizontal = "right:60%",
          },
        },
        files = {
          cwd = function()
            return get_project_root()
          end,
          fzf_opts = { ["--exact"] = false },
        },
        grep = {
          cwd = function()
            return get_project_root()
          end,
          fzf_opts = { ["--exact"] = false },
        },
      })

      vim.keymap.set("n", "<leader>pf", function()
        local root = get_project_root()
        fzf.files({ cwd = root })
      end, { desc = "Find files in project" })
      vim.keymap.set("n", "<C-p>", function()
        local current_dir = vim.fn.expand("%:p:h")
        if current_dir == "" then
          current_dir = vim.fn.getcwd()
        end
        local git_root = vim.fn.systemlist("git -C " .. current_dir .. " rev-parse --show-toplevel 2>/dev/null")[1]
        if git_root and git_root ~= "" and vim.v.shell_error == 0 then
          fzf.git_files()
        else
          local root = get_project_root()
          fzf.files({ cwd = root })
        end
      end, { desc = "Smart find files" })
      vim.keymap.set("n", "<leader>pws", function()
        local root = get_project_root()
        fzf.grep_cword({ cwd = root })
      end, { desc = "Grep word under cursor in project" })
      vim.keymap.set("n", "<leader>pWs", function()
        local root = get_project_root()
        fzf.grep_cWORD({ cwd = root })
      end, { desc = "Grep WORD under cursor in project" })
      vim.keymap.set("n", "<leader>ps", function()
        local root = get_project_root()
        fzf.live_grep({ cwd = root })
      end, { desc = "Live grep in project" })
      vim.keymap.set("n", "<leader>vh", function()
        fzf.helptags()
      end, { desc = "Help tags" })
    end,
  },
}
