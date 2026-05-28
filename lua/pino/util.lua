local M = {}

---@param str string
---@param tbl table<string, any>
function M.template(str, tbl)
	return str:gsub("($%b{})", function(w)
		local keys = vim.split(w:sub(3, -2), ".", { plain = true })
		local value = tbl
		for _, key in ipairs(keys) do
			if type(value) ~= "table" then
				return w
			end
			value = value[key]
		end
		return value or w
	end)
end

---@param path string
---@param content string
---@return boolean
M.write_file = function(path, content)
	vim.fn.mkdir(vim.fs.dirname(path), "p")
	local fd = vim.uv.fs_open(path, "w", 438)
	if not fd then
		return false
	end
	local ok, err = pcall(vim.uv.fs_write, fd, content, 0)
	vim.uv.fs_close(fd)
	if not ok then
		vim.notify("pino: failed to write file: " .. err, vim.log.levels.WARN)
		return false
	end
	return true
end

return M
