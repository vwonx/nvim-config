local toggleterm = pRequire("toggleterm")
local keys = require("utils.global-keys-mapping").toggleterm

if toggleterm then
  toggleterm.setup({
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.3
      end
    end,
    start_in_insert = true,
  })

  local Terminal = require("toggleterm.terminal").Terminal
  local ta = Terminal:new({
    direction = "float",
    float_opts = {
      border = "rounded",
    },
    close_on_exit = true,
  })

  local tb = Terminal:new({
    direction = "vertical",
    close_on_exit = true,
  })

  local tc = Terminal:new({
    direction = "horizontal",
    close_on_exit = true,
  })

  local M = {}

  M.toggleA = function(cmd)
    if ta:is_open() then
      ta:close()
      return
    end
    tb:close()
    tc:close()
    ta:open()
    if cmd ~= nil then
      ta:send(cmd)
    end
  end

  M.toggleB = function(cmd)
    if tb:is_open() then
      tb:close()
      return
    end
    ta:close()
    tc:close()
    tb:open()
    if cmd ~= nil then
      tb:send(cmd)
    end
  end

  M.toggleC = function(cmd)
    if tc:is_open() then
      tc:close()
      return
    end
    ta:close()
    tb:close()
    tc:open()
    if cmd ~= nil then
      tc:send(cmd)
    end
  end

  vim.keymap.set({ "n", "t" }, keys.toggle_float_window, function()
    M.toggleA(keys.toggle_float_window_command)
  end)
  vim.keymap.set({ "n", "t" }, keys.toggle_side_window, function()
    M.toggleB(keys.toggle_side_window_command)
  end)
  vim.keymap.set({ "n", "t" }, keys.toggle_bottom_window, function()
    M.toggleC(keys.toggle_bottom_window_command)
  end)
end
