require('nvim-lsp-setup').setup({
  -- nvim-lsp-installer
  -- https://github.com/williamboman/nvim-lsp-installer#configuration
  installer = {},
  -- Default mappings
  gD = 'lua vim.lsp.buf.declaration()',
  gd = 'lua vim.lsp.buf.definition()',
  gt = 'lua vim.lsp.buf.type_definition()',
  gi = 'lua vim.lsp.buf.implementation()',
  gr = 'lua vim.lsp.buf.references()',
  K = 'lua vim.lsp.buf.hover()',
  ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
  ['<space>rn'] = 'lua vim.lsp.buf.rename()',
  ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
  -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
  -- ['<space>e'] = 'lua vim.diagnostic.open_float()',
  ['[d'] = 'lua vim.diagnostic.goto_prev()',
  [']d'] = 'lua vim.diagnostic.goto_next()',
  default_mappings = false,
  -- Custom mappings, will overwrite the default mappings for the same key
  -- Example mappings for telescope pickers:
  -- gd = 'lua require"telescope.builtin".lsp_definitions()',
  -- gi = 'lua require"telescope.builtin".lsp_implementations()',
  -- gr = 'lua require"telescope.builtin".lsp_references()',
  mappings = {},
  -- Global on_attach
  on_attach = function(client, _bufnr)
    require('nvim-lsp-setup.utils').format_on_save(client)
  end,
  -- Global capabilities
  -- capabilities = vim.lsp.protocol.make_client_capabilities(),
  -- Configuration of LSP servers
  servers = {
    -- Install LSP servers automatically
    -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    pylsp = {},
    rust_analyzer = {
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    },
    eslint = {},
    html = {},
    remark_ls = {},
    tailwindcss = {},
    tsserver = {},
    lemminx = {},
    sumneko_lua = {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          }, }
      }
    },
  },
})
