local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 2,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    colorcolumn = "80",
    cursorline = true,                       -- highlight the current line
    expandtab = true,                        -- convert tabs to spaces
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    guifont = "monospace:h17",               -- the font used in graphical neovim applications
    guicursor = "",
    ignorecase = true,                       -- ignore case in search patterns
    incsearch = true,
    linebreak = true,                        -- companion to wrap, don't split words
    mouse = "a",                             -- allow the mouse to be used in neovim
    number = true,                           -- set numbered lines
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    nu = true,
    pumheight = 10,                          -- pop up menu height
    relativenumber = false,                  -- set relative numbered lines
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    softtabstop = 4,
    swapfile = false,                        -- creates a swapfile
    shiftwidth = 2,                          -- the number of spaces inserted for each indentation
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
    scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    tabstop = 2,                             -- insert 2 spaces for a tab
    undofile = true,                         -- enable persistent undo
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    updatetime = 50,                        -- faster completion (4000ms default)

    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    wrap = false,                             -- display lines as one long line
    whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use
