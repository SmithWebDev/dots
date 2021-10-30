---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                  Utilities                  --
---[[---------------------------------------]]---
local fn, api = vim.fn, vim.api
_G.Util = {}

-------------------- HELPERS --------------------

-- Universal attributes/utilities
vim.g.python3_host_prog = vim.fn.exepath('python3')



-- Autocommand wrapper
--Util.create_augroups = function(definitions)
--	for group_name, definition in pairs(definitions) do
--		vim.api.nvim_command('augroup ' .. group_name)
--		vim.api.nvim_command('autocmd!')
--		for _, def in ipairs(definition) do
--			local command = table.concat(
--				vim.tbl_flatten({ 'autocmd', def }),
--				' '
--			)
--			vim.api.nvim_command(command)
--		end
--		vim.api.nvim_command('augroup END')
--	end
--end
--
--
--P = function(stuff)
--  print(vim.inspect(stuff))
--  return stuff
--end

--================================================================================


-- Taken from Elianiva dotfiles
Util.trigger_completion = function()

  --if fn.pumvisible() ~= 0 and fn.complete_info()["selected"] ~= -1 then
  --  local e = core.menu:get_selected_entry() or (core.menu:get_first_entry())
  --  core.confirm(e, {
  --    behavior = cmp.ConfirmBehavior.Replace,
  --  }, function()
  --    core.complete(
  --      core.get_context { reason = types.cmp.ContextReason.TriggerOnly }
  --    )
  --  end)
  --  return
  --end

  local prev_col, next_col = fn.col "." - 1, fn.col "."
  local prev_char = fn.getline("."):sub(prev_col, prev_col)
  local next_char = fn.getline("."):sub(next_col, next_col)

  -- minimal autopairs-like behaviour
  if prev_char == "{" and next_char ~= "}" then
    return Util.t "<CR>}<C-o>O"
  end
  if prev_char == "[" and next_char ~= "]" then
    return Util.t "<CR>]<C-o>O"
  end
  if prev_char == "(" and next_char ~= ")" then
    return Util.t "<CR>)<C-o>O"
  end
  if prev_char == ">" and next_char == "<" then
    return Util.t "<CR><C-o>O"
  end -- html indents
  if prev_char == "(" and next_char == ")" then
    return Util.t "<CR><C-o>O"
  end -- flutter indents

  return Util.t "<CR>"
end

return Util
