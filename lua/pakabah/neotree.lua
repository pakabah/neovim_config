local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
	return
end

--[[ vim.g.loaded_netrw = 1 ]]
--[[ vim.g.loaded_netrwPlugin = 1 ]]
-- Diagnostic icons (Assuming Neotree supports diagnostics)
vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "󰌵", texthl = "DiagnosticSignHint"})

-- Configuration
neo_tree.setup({
  -- Window Position and Width
  side = 'left',
  width = 35,

  -- Git Status
  enable_git = true,
  git_icons = {
    added = "✚",
    modified = "",
    deleted = "✖",
    renamed = "󰁕",
    untracked = "",
    ignored = "",
    unstaged = "󰄱",
    staged = "",
    conflict = "",
  },

  -- Diagnostics
  enable_diagnostics = true,  -- If neotree supports diagnostics
  diagnostic_icons = {
    error = "",
    warn = "",
    info = "",
    hint = "󰌵",
  },

  -- Key Mappings
  mappings = {
    open = '<cr>',
    open_split = 'S',
    open_vsplit = 's',
    open_tab = 't',
    close = 'q',
    refresh = 'R'
    -- Add more mappings here
  },

  -- File Filters
  ignore = { 'node_modules', '.git', '.DS_Store' },
  filesystem = {
    follow_current_file = {
      enabled = true, -- This will find and focus the file in the active buffer every time
      --               -- the current file is changed while the tree is open.
      leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
    group_empty_dirs = false, -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
  },

  -- File and Folder Icons
  -- Assuming you are using 'nvim-web-devicons'
  icons = {
    default = '',
    folder_open = '',
    folder_close = '',
    git_added = "✚",
    git_modified = "",
    git_deleted = "✖",
    git_renamed = "󰁕",
    diagnostic_error = "",
    diagnostic_warn = "",
    diagnostic_info = "",
    diagnostic_hint = "󰌵",
  },

  -- Sorting and Grouping
  sort = function(a, b)
    return a.name < b.name
  end,
  -- File Size, Type, Last Modified, and Created Columns
})
