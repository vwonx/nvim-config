local treesitter = pRequire("nvim-treesitter.configs")
local keys = require("utils.global-keys-mapping").treesitter

if treesitter then
  treesitter.setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "cpp", "cmake", "lua", "vim", "help", "query" },

    highlight = {
      enable = true,
      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = keys.init_selection,
        node_incremental = keys.node_incremental,
        node_decremental = keys.node_decremental,
        scope_incremental = keys.scope_incremental,
      },
    },

    indent = {
      enable = true,
    },
  })
end
