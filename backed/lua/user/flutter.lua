require("flutter-tools").setup({
	ui = {
		border = "rounded",
		notification_style = "plugin",
	},
	decorations = {
		statusline = { app_version = false,
			device = true,
		},
	},
	widget_guides = {
		enabled = true,
	},
	closing_tags = {
		highlight = "ErrorMsg",
		prefix    = "=> ",
		enabled   = true,
	},
	lsp = {
		color = {
			enabled          = true,
			background       = false,
			foreground       = true,
			virtual_text     = true,
			virtual_text_str = "■",
		},
		settings = {
			showTodos             = true,
			completeFunctionCalls = true,
			enableSnipets         = true,
		},
	},
	debugger = {
		enabled     = true,
		run_via_dap = false,
	},
})

require('telescope').load_extension('flutter')
