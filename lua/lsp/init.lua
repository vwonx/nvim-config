local mason = pRequire("mason")
local mason_config = pRequire("mason-lspconfig")
local lspconfig = pRequire("lspconfig")

if not mason or not mason_config or not lspconfig then
  return
end

-- mason
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- mason-config
mason_config.setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "cmake",
    -- "jdtls",
  }
})

-- servers map
-- { key: server name， value: config file }
local servers = {
  lua_ls = require("lsp.config.lua"),
  clangd = require("lsp.config.clangd"),
  cmake = require("lsp.config.cmake"),
  -- jdtls = require("lsp.config.jdtls"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- config file must implement on_setup method
    config.on_setup(lspconfig[name])
  else
    -- or else use default params
    lspconfig[name].setup({})
  end
end

-- cmp
require("lsp.cmp")

-- format
require("lsp.format")

