local bufferline = pRequire("bufferline")
local keys = require("utils.global-keys-mapping").bufferline

if bufferline then
  bufferline.setup({
    options = {
      separator_style = "slant",
      numbers = "ordinal",
      close_command = "Bdelete! %d",
      right_mouse_command = "Bdelete! %d",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
    },
  })

  keymap("n", keys.prev, ":BufferLineCyclePrev<CR>")
  keymap("n", keys.next, ":BufferLineCycleNext<CR>")
  -- "moll/vim-bbye"
  keymap("n", keys.close, ":Bdelete!<CR>")
  keymap("n", keys.close_left, ":BufferLineCloseLeft<CR>")
  keymap("n", keys.close_right, ":BufferLineCloseRight<CR>")
  keymap("n", keys.close_others, ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>")
  keymap("n", keys.close_pick, ":BufferLinePickClose<CR>")
end
