local wilder = require('wilder')

wilder.setup {
		next_key = "<C-j>",
		accept_key = "<C-l>",
		reject_key = "<C-h>",
		previous_key = "<C-k>",
		modes = { ":", '/', '?'  },
	}

wilder.set_option('renderer', wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  left = {' ', wilder.popupmenu_devicons()},
  right = {' ', wilder.popupmenu_scrollbar()},
}))

-- wilder.set_option(
-- 	"renderer",
-- 	wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
-- 		pumblend = 20,
-- 		border = "rounded",
-- 		highlights = { border = "Normal" },
-- 		highlighter = wilder.basic_highlighter(),
-- 		left = { " ", wilder.popupmenu_devicons() },
-- 	}
-- 	)
-- )
