local M = {}

local function clamp(v, min, max)
	return math.max(min, math.min(max, v))
end

local function clamp01(v)
	return clamp(v, 0, 1)
end

local function cbrt(v)
	return v < 0 and -math.pow(-v, 1 / 3) or math.pow(v, 1 / 3)
end

local function hex_to_rgb(hex)
	local r = tonumber(hex:sub(2, 3), 16)
	local g = tonumber(hex:sub(4, 5), 16)
	local b = tonumber(hex:sub(6, 7), 16)
	if not r or not g or not b then
		return nil, nil, nil
	end
	return r / 255, g / 255, b / 255
end

local function rgb_to_hex(r, g, b)
	local function channel(v)
		return string.format("%02x", math.floor(clamp01(v) * 255 + 0.5))
	end
	return "#" .. channel(r) .. channel(g) .. channel(b)
end

local function to_linear(v)
	return v <= 0.04045 and v / 12.92 or math.pow((v + 0.055) / 1.055, 2.4)
end

local function to_srgb(v)
	return v <= 0.0031308 and 12.92 * v or 1.055 * math.pow(v, 1 / 2.4) - 0.055
end

M.is_oklch_leaf = function(value)
	return type(value) == "table"
		and type(value.l) == "number"
		and type(value.c) == "number"
		and type(value.h) == "number"
end

M.oklch_to_hex = function(color)
	local l, c, h = color.l, color.c, color.h
	if not l then
		return nil
	end

	local a = c * math.cos(math.rad(h))
	local b = c * math.sin(math.rad(h))

	local l_ = l + 0.3963377774 * a + 0.2158037573 * b
	local m_ = l - 0.1055613458 * a - 0.0638541728 * b
	local s_ = l - 0.0894841775 * a - 1.2914855480 * b

	local l3, m3, s3 = l_ ^ 3, m_ ^ 3, s_ ^ 3

	return rgb_to_hex(
		clamp01(to_srgb(4.0767416621 * l3 - 3.3077115913 * m3 + 0.2309699292 * s3)),
		clamp01(to_srgb(-1.2684380046 * l3 + 2.6097574011 * m3 - 0.3413193965 * s3)),
		clamp01(to_srgb(-0.0041960863 * l3 - 0.7034186147 * m3 + 1.7076147010 * s3))
	)
end

M.oklch_tree_to_hex = function(tree)
	local hex_tree = {}
	for key, value in pairs(tree) do
		hex_tree[key] = M.is_oklch_leaf(value) and M.oklch_to_hex(value) or M.oklch_tree_to_hex(value)
	end
	return hex_tree
end

M.hex_to_oklch = function(color)
	local r, g, b = hex_to_rgb(color)
	if not r then
		return nil
	end

	r, g, b = to_linear(r), to_linear(g), to_linear(b)

	local l_ = cbrt(0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b)
	local m_ = cbrt(0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b)
	local s_ = cbrt(0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b)

	local a = 1.9779984951 * l_ - 2.4285922050 * m_ + 0.4505937099 * s_
	local b_ = 0.0259040371 * l_ + 0.7827717662 * m_ - 0.8086757660 * s_
	local hue = math.deg(math.atan2(b_, a))

	return {
		l = clamp01(0.2104542553 * l_ + 0.7936177850 * m_ - 0.0040720468 * s_),
		c = math.sqrt(a * a + b_ * b_),
		h = hue < 0 and hue + 360 or hue,
	}
end

---Blends two hex colors together.
---@param foreground string Hex color (e.g. "#ff0000")
---@param alpha number Blend factor between 0 and 1 (0 = background only, 1 = foreground only)
---@param background string Hex color (e.g. "#000000")
---@return string Blended hex color
M.blend_hex = function(foreground, alpha, background)
	alpha = clamp(alpha or 0, 0, 1)
	local fr, fg, fb = hex_to_rgb(foreground)
	local br, bg, bb = hex_to_rgb(background)
	if not fr or not br then
		return background or foreground
	end
	return rgb_to_hex(br + alpha * (fr - br), bg + alpha * (fg - bg), bb + alpha * (fb - bb))
end

M.blend = function(foreground, alpha, background)
	alpha = clamp(alpha or 0, 0, 1)
	local fg_hex = M.oklch_to_hex(foreground)
	local bg_hex = M.oklch_to_hex(background)
	if not fg_hex or not bg_hex then
		return bg_hex or fg_hex or background or foreground
	end
	return M.blend_hex(fg_hex, alpha, bg_hex)
end

return M
