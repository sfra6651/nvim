local opt = vim.opt

-- Tab / Indentaions
-- Disable Rust's built-in ftplugin forcing 4-space indent, so the settings below apply
vim.g.rust_recommended_style = 0
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent =true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true

-- Auto-clear search highlight when not navigating matches (n/N/*/# etc)
vim.on_key(function(char)
  if vim.fn.mode() == 'n' then
    local new_hlsearch = vim.tbl_contains({ '<CR>', 'n', 'N', '*', '#', '?', '/' }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end, vim.api.nvim_create_namespace('auto_hlsearch'))

-- Appearance
opt.relativenumber = true
opt.termguicolors = true
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250"
-- opt.colorcolumn = '100'
-- opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 8
opt.showtabline = 0
--opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append('a')
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"

-- Stop auto-inserting the comment leader on a new line below a comment.
-- Filetype plugins set these per-buffer, so strip them after FileType runs.
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

-- Unlist terminal buffers so :bnext / :bprev skip them
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function(args)
    vim.bo[args.buf].buflisted = false
  end,
})
