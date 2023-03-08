local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- set different indent to lua file
vim.api.nvim_create_autocmd("FileType", {
  group = myAutoGroup,
  pattern = "lua",
  command = "setlocal shiftwidth=2 tabstop=2"
})

-- open_on_setup
-- automatically open the tree when running setup if startup buffer is a directory
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    local directory = vim.fn.isdirectory(data.file) == 1
    if not no_name and not directory then
      return
    end
    if directory then
      -- create a new, empty buffer
      vim.cmd.enew()

      -- wipe the directory buffer
      vim.cmd.bw(data.buf)

      -- change to the directory
      vim.cmd.cd(data.file)
    end
    require("nvim-tree.api").tree.open()
  end
})
