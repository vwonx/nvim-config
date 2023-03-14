local null_ls = pRequire("null-ls")

if null_ls then
  local formatting = null_ls.builtins.formatting

  null_ls.setup({
    debug = false,
    sources = {
      -- StyLua
      formatting.stylua.with({
        extra_args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
        },
      }),
    },
    -- #{m}: message
    -- #{s}: source name (defaults to null-ls if not specified)
    -- #{c}: code (if available)
    diagnostics_format = "[#{s}] #{m}",
    on_attach = function(_)
      -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
      -- if client.resolved_capabilities.document_formatting then
      --   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
      -- end
    end,
  })
end
