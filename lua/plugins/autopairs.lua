local autopairs = pRequire("nvim-autopairs")

if autopairs then
  autopairs.setup({
    check_ts = true,
  })
  -- todo : add nvim-cmp
end
