local cmp = pRequire("cmp")
local keys = require("utils.global-keys-mapping").cmp

if not cmp or not keys then
  return
end

local mapping = {
  [keys.complete] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  [keys.abort] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  -- Accept currently selected item. If none selected, `select` first item.
  -- Set `select` to `false` to only confirm explicitly selected items.
  [keys.confirm] = cmp.mapping.confirm({
    select = true,
    behavior = cmp.ConfirmBehavior.Replace,
  }),
  [keys.scroll_doc_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
  [keys.scroll_doc_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
  [keys.select_prev_item] = cmp.mapping.select_prev_item(),
  [keys.select_next_item] = cmp.mapping.select_next_item(),
}

-- select next/prev in command mode
keymap("c", keys.select_next_item, "<C-n>", {
  remap = true,
  silent = true,
})
keymap("c", keys.select_prev_item, "<C-p>", {
  remap = true,
  silent = true,
})

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = mapping,
  sources = cmp.config.sources({
    {
      name = "nvim_lsp",
      group_index = 1,
    },
    {
      name = "vsnip",
      group_index = 2,
    },
    {
      name = "buffer",
      group_index = 3,
    },
    {
      name = "path",
      group_index = 3,
    },
    {
      name = "cmdline",
      group_index = 4,
      option = {
        ignore_cmds = { "Man", "!" }
      }
    }
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
