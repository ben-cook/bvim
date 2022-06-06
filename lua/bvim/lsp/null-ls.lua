local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md


null_ls.setup({
  debug = false,
  sources = {
    -- Code Actions
    code_actions.eslint_d,
    -- Diagnostics
    diagnostics.ansiblelint,
    diagnostics.cppcheck,
    diagnostics.eslint_d,
    diagnostics.hadolint,
    diagnostics.jsonlint,

    -- Formatting
    formatting.prettierd,
    formatting.black,
    formatting.stylua,
    formatting.prismaFmt,
    formatting.remark,
    formatting.rustfmt.with({
      extra_args = { "--edition=2021" }
    }),
    formatting.rustywind,
    formatting.shellharden,
    formatting.taplo,
    formatting.uncrustify,
    formatting.xmllint
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(c)
              return c.name == "null-ls"
            end
          })
        end,
      })
    end
  end,
})
