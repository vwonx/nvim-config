function _G.pRequire(name)
  local status_ok, plugin = pcall(require, name)
  if not status_ok then
    vim.notify(" Can't find: " .. name)
    return nil
  end
  return plugin
end

function _G.keymap(mode, lhs, rhs, opts)
  if not lhs or not rhs then
    return
  end

  local keyOpts = vim.tbl_extend("force", { remap = false, silent = true }, (opts or {}))

  if type(lhs) == "table" then
    for _, x in pairs(lhs) do
      vim.keymap.set(mode, x, rhs, keyOpts)
    end
    return
  end

  vim.keymap.set(mode, lhs, rhs, keyOpts)
end

function _G.setColorScheme(name)
  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. name)
  if not status_ok then
    vim.notify("colorscheme:·" .. colorscheme .. " not found！")
    return
  end
end
