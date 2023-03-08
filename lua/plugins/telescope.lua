local telescope = pRequire("telescope")
local keys = require("utils.global-keys-mapping").telescope

if telescope then
  telescope.setup({
    defaults = {
      initial_mode = "insert",
      -- vertical , center , cursor
      -- layout_strategy = "center",
      mappings = {
        i = {
          -- move up and down
          [keys.move_selection_next] = "move_selection_next",
          [keys.move_selection_previous] = "move_selection_previous",
          [keys.preview_scrolling_up] = "preview_scrolling_up",
          [keys.preview_scrolling_down] = "preview_scrolling_down",
          -- history
          [keys.cycle_history_next] = "cycle_history_next",
          [keys.cycle_history_prev] = "cycle_history_prev",
        },
      },
    },
    pickers = {},
    extensions = {},
  })
  
  keymap("n", keys.find_files, ":Telescope find_files<CR>")
  keymap("n", keys.live_grep, ":Telescope live_grep<CR>")
end
