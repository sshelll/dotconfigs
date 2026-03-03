local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 字体设置
config.font = wezterm.font_with_fallback({
	-- { family = "JetBrainsMono Nerd Font", weight = "Regular" },
	{ family = "Maple Mono NF CN", weight = "DemiBold" },
})
config.font_size = 11.5
config.line_height = 1
config.cell_width = 0.9

-- 光标设置
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0

-- 色彩渲染设置模拟 alacritty 效果
config.bold_brightens_ansi_colors = false
config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 0.85, -- 降低饱和度
	brightness = 0.9, -- 稍微降低亮度
}

config.color_scheme = "Tokyo Night Storm"

-- 窗口设置
config.window_background_opacity = 0.85
config.enable_tab_bar = false

-- 自动重载配置
config.automatically_reload_config = true

return config
