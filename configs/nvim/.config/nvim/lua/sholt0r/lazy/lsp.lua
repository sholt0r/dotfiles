return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'j-hui/fidget.nvim',
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require('cmp_nvim_lsp')
    local capabilities = vim.tbl_deep_extend(
    'force',
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities())

    require('fidget').setup({})
    require('mason').setup()

    local server_settings = {
      lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
              path = vim.split(package.path, ';'),
            },
            diagnostics = {
              globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
              filetypes = { 'lua', 'nse' }
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            completion = {
              callSnippet = 'Replace',
            },
            telemetry = {
              enable = false,
            },
          }
        }
      },

      ts_ls = {
        capabilities = capabilities,
        root_dir = function(fname)
            local util = require('lspconfig.util')
            local root = util.root_pattern("tsconfig.json", "package.json")(fname)
            return root
        end,
        cmd = { "typescript-language-server", "--stdio" },
      },

      yamlls = {
        capabilities = capabilities,
        settings = {
          yaml = {
            validate = true,
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = {
              ['https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook'] = 'playbook.{yml,yaml}',
              ['https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks'] = 'tasks.{yml,yaml}',
            }
          }
        }
      },
    }


    require('mason-lspconfig').setup({
      ensure_installed = {
        'ansiblels',
        'bashls',
        'clangd',
        'cssls',
        'dockerls',
        'docker_compose_language_service',
        'gopls',
        'html',
        'htmx',
        'jsonls',
        'lua_ls',
        'perlnavigator',
        'powershell_es',
        'puppet',
        'pyright',
        'rust_analyzer',
        'svelte',
        'taplo',
        'ts_ls',
        'lemminx',
        'yamlls',
        'zls',
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require('lspconfig')[server_name].setup(vim.tbl_deep_extend(
            'force',
            {
              capabilities = capabilities,
            },
            server_settings[server_name] or {}
          ))
        end,
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }


    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      })
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    })

    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
      group = format_sync_grp
    })
  end
}
