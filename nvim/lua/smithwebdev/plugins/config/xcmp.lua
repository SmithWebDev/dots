local cmp = require('cmp')

["<C-Space>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
      return press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
    end

    cmp.select_next_item()
  elseif has_any_words_before() then
    press("<Space>")
  else
    fallback()
  end
end, {
  "i",
  "s",
  -- add this line when using cmp-cmdline:
  "c",
}),





["<C-Space>"] = cmp.mapping(function(fallback)
  if cmp.complete_info().selected == -1 then
    if cmp.visible() then
      cmp.close()
    end
    press("<C-G>u", "n")
    press("<CR>", "n")
    press("<Plug>DiscretionaryEnd", "")
  else 
    cmp.confirm()
  end
end, {
  "i",
  "s",
  -- add this line when using cmp-cmdline:
  "c",
}),














["<C-Space>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
      return press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
    end
  elseif has_any_words_before() then
    press("<Space>")
  else
    fallback()
  end
end, {
  "i",
  "s",
  -- add this line when using cmp-cmdline:
  "c",
}),
--==================================================================================================



  if cmp.get_selected_entry() == nil and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
    press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
  elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    press("<ESC>:call UltiSnips#JumpForwards()<CR>")
  elseif cmp.visible() then
    cmp.select_next_item()
  elseif has_any_words_before() then
    press("<C-j>")
  else
    fallback()
  end
end, {
  "i",
  "s",
  -- add this line when using cmp-cmdline:
  "c",

--==================================================================================================

