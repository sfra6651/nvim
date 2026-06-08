local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- need to set globals before require('lazy').
require('config.globals')
require('config.my_options')
require('config.keymaps')
require('config.commands')

local opts = {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = {"my_matrix", "my_zig", "onedark"}
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = true,
	},
}


require("lazy").setup('plugins', opts)

-- Active colorscheme. Options: 'my_matrix' (local), 'my_zig' (local), 'my_one_dark_minimal' (local), 'onedark' (plugin).
vim.cmd('colorscheme nordic')
