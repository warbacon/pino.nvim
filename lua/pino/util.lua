local M = {}

---@param l number
---@param c number
---@param h number
---@return string
M.oklch = function(l, c, h)
	l = l / 100

	local a = c * math.cos(math.rad(h))
	local b = c * math.sin(math.rad(h))

	local l_ = l + 0.3963377774 * a + 0.2158037573 * b
	local m_ = l - 0.1055613458 * a - 0.0638541728 * b
	local s_ = l - 0.0894841775 * a - 1.2914855480 * b

	local l3 = l_ * l_ * l_
	local m3 = m_ * m_ * m_
	local s3 = s_ * s_ * s_

	local r = 4.0767416621 * l3 - 3.3077115913 * m3 + 0.2309699292 * s3
	local g = -1.2684380046 * l3 + 2.6097574011 * m3 - 0.3413193965 * s3
	local b_rgb = -0.0041960863 * l3 - 0.7034186147 * m3 + 1.7076147010 * s3

	local function to_srgb(v)
		if v <= 0.0031308 then
			return 12.92 * v
		else
			return 1.055 * math.pow(v, 1 / 2.4) - 0.055
		end
	end

	r = to_srgb(r)
	g = to_srgb(g)
	b_rgb = to_srgb(b_rgb)

	local function clamp(v)
		return math.max(0, math.min(1, v))
	end

	r = clamp(r)
	g = clamp(g)
	b_rgb = clamp(b_rgb)

	local function to_hex(v)
		return string.format("%02x", math.floor(v * 255 + 0.5))
	end

	return "#" .. to_hex(r) .. to_hex(g) .. to_hex(b_rgb)
end

---@param color string
---@return number?, number?, number?
local function parse_oklch(color)
	if type(color) ~= "string" then
		return nil, nil, nil
	end

	local spec = color:match("^oklch%((.*)%)$")
	if not spec then
		return nil, nil, nil
	end

	spec = spec:gsub(",", " ")
	local parts = {}
	for part in spec:gmatch("%S+") do
		table.insert(parts, part)
	end

	if #parts ~= 3 then
		return nil, nil, nil
	end

	local l_raw = parts[1]
	local l_is_percent = l_raw:sub(-1) == "%"
	if l_is_percent then
		l_raw = l_raw:sub(1, -2)
	end

	local l = tonumber(l_raw)
	local c = tonumber(parts[2])
	local h = tonumber(parts[3])
	if not l or not c or not h then
		return nil, nil, nil
	end

	if l_is_percent then
		l = l / 100
	elseif l > 1 then
		l = l / 100
	end

	l = math.max(0, math.min(1, l))
	c = math.max(0, c)
	h = h % 360
	if h < 0 then
		h = h + 360
	end

	return l, c, h
end

---@param color string
---@return string
M.oklch_to_hex = function(color)
	local l, c, h = parse_oklch(color)
	if not l or not c or not h then
		return color
	end

	return M.oklch(l * 100, c, h)
end

---@param c string
---@return integer[]
local function rgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param color string
---@return number?, number?, number?
local function hex_to_oklch(color)
	if type(color) ~= "string" or not color:match("^#%x%x%x%x%x%x$") then
		return nil, nil, nil
	end

	local srgb = rgb(color)
	local r = srgb[1] / 255
	local g = srgb[2] / 255
	local b = srgb[3] / 255

	local function to_linear(v)
		if v <= 0.04045 then
			return v / 12.92
		end
		return math.pow((v + 0.055) / 1.055, 2.4)
	end

	r = to_linear(r)
	g = to_linear(g)
	b = to_linear(b)

	local l = 0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b
	local m = 0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b
	local s = 0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b

	local function cbrt(v)
		if v < 0 then
			return -math.pow(-v, 1 / 3)
		end
		return math.pow(v, 1 / 3)
	end

	local l_ = cbrt(l)
	local m_ = cbrt(m)
	local s_ = cbrt(s)

	local lightness = 0.2104542553 * l_ + 0.7936177850 * m_ - 0.0040720468 * s_
	local a = 1.9779984951 * l_ - 2.4285922050 * m_ + 0.4505937099 * s_
	local b_ = 0.0259040371 * l_ + 0.7827717662 * m_ - 0.8086757660 * s_

	local chroma = math.sqrt(a * a + b_ * b_)
	local hue = math.deg(math.atan2(b_, a))
	if hue < 0 then
		hue = hue + 360
	end

	return math.max(0, math.min(1, lightness)), chroma, hue
end

---@param color string
---@return number?, number?, number?
local function to_oklch(color)
	local l, c, h = parse_oklch(color)
	if l then
		return l, c, h
	end
	return hex_to_oklch(color)
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
---@return string
function M.blend_oklch(foreground, alpha, background)
	local fg_l, fg_c, fg_h = to_oklch(foreground)
	local bg_l, bg_c, bg_h = to_oklch(background)

	if not fg_l or not bg_l then
		return background
	end

	alpha = math.max(0, math.min(1, alpha or 0))

	local l = bg_l + alpha * (fg_l - bg_l)
	local c = bg_c + alpha * (fg_c - bg_c)

	local hue_delta = ((fg_h - bg_h + 540) % 360) - 180
	local h = (bg_h + alpha * hue_delta) % 360
	if h < 0 then
		h = h + 360
	end

	return string.format("oklch(%.4f %.4f %.1f)", l, c, h)
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
---@return string
function M.blend(foreground, alpha, background)
	return M.oklch_to_hex(M.blend_oklch(foreground, alpha, background))
end

---@param str string
---@param table table<string, string>[]
M.template = function(str, table)
	return str:gsub("($%b{})", function(w)
		local keys = vim.split(w:sub(3, -2), ".", { plain = true })
		local value = table
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
