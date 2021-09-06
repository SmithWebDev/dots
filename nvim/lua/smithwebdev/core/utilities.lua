---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                  Utilities                  --
---[[---------------------------------------]]---

local M = {}

-------------------- HELPERS --------------------

-- Keybind map wrapper 
local function map(mode, lhs, rhs, opts, is_buf)
end

-- Universal attributes/utilities

-- Autocommand wrapper
M.create_augroups = function(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command('augroup ' .. group_name)
		vim.api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(
				vim.tbl_flatten({ 'autocmd', def }),
				' '
			)
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command('augroup END')
	end
end
