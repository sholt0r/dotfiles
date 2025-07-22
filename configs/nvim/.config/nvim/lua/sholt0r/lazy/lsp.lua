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
		'rafamadriz/friendly-snippets',
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
		require('luasnip.loaders.from_vscode').lazy_load()

    local server_settings = {
			ansiblels = {
				capabilities = capabilities,
				filetypes = {
					"yaml.ansible",
					"yaml"
				},
				settings = {
					ansible = {
						validation = true,
						lint = {
							enabled = true,
							path = "ansible-lint"
						}
					},
					completion = {
						provideRedirectModules = true,
						provideModuleOptionAliases = true
					}
				}
			},

			gopls = {
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
						completionDocumentation = false,
						deepCompletion = false,
						fuzzyMatching = false,
					}
				}
			},

      lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
              path = vim.split(package.path, ';'),
            },
						workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
            completion = {
              callSnippet = 'Replace',
              keywordSnippet = 'Disable',
              showWord = 'Disable',
              workspaceWord = false,
            },
            diagnostics = {
              workspaceDelay = 3000,
              workspaceRate = 100,
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
        'terraformls',
        'ts_ls',
        'lemminx',
        --'yamlls',
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
			performance = {
				debounce = 60,
				throttle = 30,
				fetching_timeout = 500,
			},
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
			preselect = cmp.PreselectMode.None,
			completion = {
				completeopt = 'menu,menuone,noselect',
				keyword_length = 2,
			},
			experimental = {
				ghost_text = false,
			},
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'go_deep', keyword_length = 3},
        { name = 'buffer', keyword_length = 3},
      })
    })

    vim.diagnostic.config({
      update_in_insert = false,
      virtual_lines = {
        current_line = true,
      },
    })

    vim.o.updatetime = 250

    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
      group = format_sync_grp
    })

  end -- Config end
}
