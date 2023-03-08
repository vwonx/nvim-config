local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.flags = {
  debounce_text_changes = 150,
}

M.disableFormat = function(client)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false
end

M.keyAttach = function(_, bufnr)
  local keys = require("utils.global-keys-mapping").lsp
  local opt = { noremap = true, silent = true, buffer = bufnr }

  -- diagnostic
  keymap("n", keys.open_flow, "<CMD>lua vim.diagnostic.open_float()<CR>")
  keymap("n", keys.goto_next, "<CMD>lua vim.diagnostic.goto_next()<CR>")
  keymap("n", keys.goto_prev, "<CMD>lua vim.diagnostic.goto_prev()<CR>")
  keymap("n", keys.list, "<CMD>lua require'telescope.builtin'.diagnostics{} <CR>")

  -- lsp
  keymap("n", keys.definition, require("telescope.builtin").lsp_definitions, opt)
  keymap("n", keys.declaration, vim.lsp.buf.declaration, opt)
  keymap("n", keys.hover, vim.lsp.buf.hover, opt)
  keymap("n", keys.implementation, require("telescope.builtin").lsp_implementations, opt)
  keymap(
    "n",
    keys.references,
    "<CMD>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy())<CR>",
    opt
  )
  keymap("n", keys.rename, "<CMD>lua vim.lsp.buf.rename()<CR>", opt)
  -- keymap("n", keys.code_action, "<CMD>lua vim.lsp.buf.code_action()<CR>", opt)
  -- keymap("n", keys.format, "<CMD>lua vim.lsp.buf.format({ async = true })<CR>", opt)
end

return M
