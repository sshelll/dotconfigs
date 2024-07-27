local M = {}

M.num_to_hex = function (num)
	if num == 0 then
		return "#000000";
	elseif num ~= nil then
		return string.format("#%06X", num);
	end
end

M.get_hl_value = function (ns_id, hl_group, value)
	local hl = vim.api.nvim_get_hl(ns_id, { name = hl_group, link = false });

	if value == "fg" then
		return M.num_to_hex(hl.fg)
	elseif value == "bg" then
		return M.num_to_hex(hl.bg)
	elseif value == "sp" then
		return M.num_to_hex(hl.sp)
	else
		return hl[value];
	end
end

M.hex_to_rgb = function(str)
    str = str:gsub("#", "");

    if #str == 3 then
        return {
            r = tonumber(str:sub(1, 1), 16),
            g = tonumber(str:sub(2, 2), 16),
            b = tonumber(str:sub(3, 3), 16),
        }
    elseif #str == 6 then
        return {
            r = tonumber(str:sub(1, 2), 16),
            g = tonumber(str:sub(3, 4), 16),
            b = tonumber(str:sub(5, 6), 16),
        }
    end
end

M.clamp = function(val, min, max)
    return math.min(math.max(val, min), max)
end

M.rgb_to_hex = function(tbl)
    return string.format("#%02X%02X%02X", tbl.r, tbl.g, tbl.b);
end

-- Usage:
-- local bg = get_hl_value(0, "Normal", "bg") or get_hl_value(0, "Cursor", "fg");
-- local fg = get_hl_value(0, "markdownH1", "fg") or "#f38ba8";
-- return {
--     bg = mix(bg, fg, 0.7, 0.25),
--     fg = fg
-- }
M.mix = function(color_1, color_2, per_1, per_2)
    local c_1, c_2;

    if type(color_1) == "table" then
        c_1 = color_1;
    elseif type(color_1) == "string" then
        c_1 = M.hex_to_rgb(color_1);
    end

    if type(color_2) == "table" then
        c_2 = color_2;
    elseif type(color_2) == "string" then
        c_2 = M.hex_to_rgb(color_2);
    end

    if not c_1 or not c_2 then
        return;
    end

    local _r = M.clamp((c_1.r * per_1) + (c_2.r * per_2), 1, 255);
    local _g = M.clamp((c_1.g * per_1) + (c_2.g * per_2), 1, 255);
    local _b = M.clamp((c_1.b * per_1) + (c_2.b * per_2), 1, 255);

    return M.rgb_to_hex({ r = _r, g = _g, b = _b });
end

return M
