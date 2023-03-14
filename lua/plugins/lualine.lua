local lualine = pRequire("lualine")

if lualine then
  lualine.setup({
    options = {
      theme = "tokyonight",
      globalstatus = true,
    },
    extensions = { "nvim-tree" },
    sections = {
      lualine_c = { "filename", "lsp_progress" },
    },
  })
end
