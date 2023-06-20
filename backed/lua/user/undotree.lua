vim.keymap.set('n', '<leader>`', vim.cmd.UndotreeToggle)

-- Persistent Undos
vim.cmd([[
	if has("persistent_undo")
		let target_path = expand('~/.undodir')

		" create the Directory and any parent Directories
		" if the location does not exist
		if !isdirectory(target_path)
			call mkdir(target_path, "p", 0700)
		endif

		let &undodir=target_path
		set undofile
	endif

]])
