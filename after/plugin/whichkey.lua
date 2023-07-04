local wk = require('which-key')
wk.register({
	["["] = "First Buffer",
	["]"] = "Last Buffer",
	["="] = "Vertical Width +5",
	["-"] = "Vertical Width -5",
	["+"] = "Horizontal Width +5",
	["_"] = "Horizontal Width -5",
	a = "Highlight Buffer",
	b = "Close Buffer",
	c = {
		name = "Comment => Multiple Lines",
		c = 'Comment => Single Line',
	},
	e = { name = "Toggle Nvim Tree" },
	f = {
		name = "Flutter",
		s = 'Flutter => Run',
		v = 'Flutter => Visual Debug',
		r = 'Flutter => Restart',
		q = 'Flutter => Quit',
		d = 'Flutter => Devices',
		o = 'Flutter => Outline Toggle',
		l = 'Flutter => Clear Log',
	},
	g = {
		name = "Lsp",
		d = 'LSP => Defintion Popup',
		f = 'LSP => Defintion Reformat',
		r = 'LSP => Defintion References',
		i = 'LSP => Defintion Implementation',
		c = 'LSP => Code Action',
		t = 'LSP => Toggle Diagnostics'
	},
	G = {
		name = "Goto Functions",
		D = 'Goto => Preview Definition',
		C = 'Goto => Close All Windows',
		T = 'Goto => Preview Type Defintition',
		P = 'Goto => Preview Implementation',
		R = 'Goto => Preview References',
	},
	h = "Previous Buffer",
	l = "Next Buffer",
  t = {
    name = "Telescope",
		f = 'Telescope => Find Files',
		g = 'Telescope => Live Grep',
		b = 'Telescope => Buffers',
		h = 'Telescope => Help Tags',
		c = 'Telescope => Flutter Commands',
  },
  O = {
    name = "ChatGPT",
    I = "ChatGPT => Window",
    E = "ChatGPT => Act As",
    W = "ChatGPT => Edit With Instructions",
  },
  z = {
    name = "Pretty Close",
    c = "PrettyClose => Close",
    o = "PrettyClose => Open"
  }
}, { prefix = "<leader>" })

wk.register({
	u = "Undo last edit",
	r = "Undo last Undo"
}, { prefix = "<C>" })

-- vim.keymap.set('n', '<leader>OI', '<cmd>:ChatGPT<CR>')
-- vim.keymap.set('n', '<leader>OE', '<cmd>:ChatGPTActAs<CR>')
-- vim.keymap.set('n', '<leader>OW', '<cmd>:ChatEditWithInstructions<CR>')

-- Available Keybindings within ChatGPT Window
-- <C-Enter> to submit.
-- <C-c> to close chat window.
-- <C-u> scroll up chat window.
-- <C-d> scroll down chat window.
-- <C-y> to copy/yank last answer.
-- <C-k> to copy/yank code from last answer.
-- <C-o> Toggle settings window.
-- <C-n> Start new session.
-- <Tab> Cycle over windows.
-- <C-i> [Edit Window] use response as input.

