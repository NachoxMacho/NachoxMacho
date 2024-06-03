vim.opt.number = true
vim.opt.relativenumber = false

-- NetRW settings
vim.g.netrw_keepdir = 1
vim.g.netrw_localcopydircommand = 'cp -r'


-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Disable showing mode in command line
vim.opt.showmode = false

-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.endofline = false
vim.opt.fixeol = false

vim.opt.swapfile = false
vim.opt.backup = false

if vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 or vim.fn.has('win16') == 1 then
    -- vim.opt.undodir = os.getenv('LocalAppData') .. '/nvim-data/undodir'
    local powershell_options = {
      shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
      shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
      shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
      shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
      shellquote = "",
      shellxquote = "",
    }

    for option, value in pairs(powershell_options) do
        vim.opt[option] = value
    end
-- else
--     vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.opt.mouse = 'a'

-- When breaking a line, indent the following line
vim.opt.breakindent = true

vim.opt.completeopt = 'menuone,noselect'

vim.g.mapleader = " "

vim.api.nvim_create_augroup("nachoxmacho", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "nachoxmacho",
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})