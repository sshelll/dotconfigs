require("avante").setup({
	instructions_file = "avante.md",
	provider = "moonshot",
	providers = {
		claude = {
			endpoint = "https://api.gptsapi.net",
			model = "claude-sonnet-4-5-20250929",
			timeout = 30000, -- Timeout in milliseconds
			extra_request_body = {
				temperature = 0.75,
				max_tokens = 20480,
			},
		},
		moonshot = {
			endpoint = "https://api.moonshot.cn/v1",
			model = "kimi-k2-0905-preview",
			timeout = 30000, -- Timeout in milliseconds
			extra_request_body = {
				temperature = 0.75,
				max_tokens = 20480,
			},
		},
		-- NOTE: deep think model is broken for code completion,
		-- this is just a demo of 'inherit' api configuration.
		-- deepseek = {
		-- 	__inherited_from = "openai",
		-- 	api_key_name = "AVANTE_DEEPSEEK_API_KEY",
		-- 	endpoint = "https://api.gptsapi.net/v1",
		-- 	model = "deepseek-r1",
		-- 	disable_tools = true,
		-- 	extra_request_body = {
		-- 		temperature = 0.75,
		-- 		max_tokens = 20480,
		-- 	},
		-- },
	},
})
