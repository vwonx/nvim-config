local gitsigns = pRequire("gitsigns")

if gitsigns then
  gitsigns.setup({
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 350,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = " <author>, <author_time:%R> - <summary> "
  })
end
