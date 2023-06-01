---[[
-- lvim is the global options object
-- 
-- Linters should be
-- filled in as strings with either
-- a global executable or a path to
-- an executable
-- ]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = 'warn'
lvim.format_on_save.enabled = false
lvim.colorscheme = 'catppuccin'
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = 'space'
-- add your own keymapping
lvim.keys.normal_mode['<C-s>'] = ':w<cr>'
lvim.keys.normal_mode["|"] = ':vsplit<CR>'
lvim.keys.normal_mode["-"] = ':split<CR>'
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = 'dashboard'
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed =
	{
		'bash',
		'c',
		'javascript',
		'json',
		'lua',
		'python',
		'typescript',
		'tsx',
		'css',
		'rust',
		'java',
		'yaml',
	}

lvim.builtin.treesitter.ignore_install = { 'haskell' }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.which_key.mappings['t'] = {
	name = 'Diagnostics',
	t = { '<cmd>TroubleToggle<cr>', 'trouble' },
	w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'workspace' },
	d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'document' },
	q = { '<cmd>TroubleToggle quickfix<cr>', 'quickfix' },
	l = { '<cmd>TroubleToggle loclist<cr>', 'loclist' },
	r = { '<cmd>TroubleToggle lsp_references<cr>', 'references' },
}

lvim.builtin.which_key.mappings['S'] = {
	name = 'Session',
	c = {
		"<cmd>lua require('persistence').load()<cr>",
		'Restore last session for current dir',
	},
	l = {
		"<cmd>lua require('persistence').load({ last = true })<cr>",
		'Restore last session',
	},
	Q = {
		"<cmd>lua require('persistence').stop()<cr>",
		'Quit without saving session',
	},
}

-- lvim.builtin.which_key.mappings['W'] = {
--   name = 'Workspace',
--   f = {
--     ""
--   }
-- }

lvim.builtin.cmp.formatting.source_names['copilot'] = '(Copilot)'
table.insert(lvim.builtin.cmp.sources, 1, { name = 'copilot' })

-- generic LSP settings
local graphql_lsp_opts = {
	filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript" },
}

require("lvim.lsp.manager").setup("graphql", graphql_lsp_opts)
-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = { {
	'echasnovski/mini.map',
	branch = 'stable',
	config = function()
		require('mini.map').setup()
		local map = require('mini.map')
		map.setup({ -- set to 1 for a pure scrollbar :)
			integrations = {
				map.gen_integration.builtin_search(),
				map.gen_integration.diagnostic({
					error = 'DiagnosticFloatingError',
					warn = 'DiagnosticFloatingWarn',
					info = 'DiagnosticFloatingInfo',
					hint = 'DiagnosticFloatingHint',
				}),
			},
			symbols = { encode = map.gen_encode_symbols.dot('4x2') },
			window = {
				side = 'right',
				width = 20,
				winblend = 15,
				show_integration_count = false,
			},
		})
	end,
}, {
	'windwp/nvim-spectre',
	event = 'BufRead',
	config = function()
		require('spectre').setup()
	end,
}, {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	requires = {
		'nvim-lua/plenary.nvim',
		'kyazdani42/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	config = function()
		require('neo-tree').setup({
			close_if_last_window = true,
			window = { width = 30 },
			buffers = { follow_current_file = true },
			filesystem = {
				follow_current_file = true,
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = { 'node_modules' },
					never_show = { '.DS_Store', 'thumbs.db' },
				},
			},
		})
	end,
}, {
	'kevinhwang91/rnvimr',
	cmd = 'RnvimrToggle',
	config = function()
		vim.g.rnvimr_draw_border = 1
		vim.g.rnvimr_pick_enable = 1
		vim.g.rnvimr_bw_enable = 1
	end,
}, {
	'sindrets/diffview.nvim',
	event = 'BufRead',
}, {
	'f-person/git-blame.nvim',
	event = 'BufRead',
	config = function()
		vim.cmd'highlight default link gitblame SpecialComment'
		vim.g.gitblame_enabled = 0
	end,
}, {
	'pwntester/octo.nvim',
	requires = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
		'kyazdani42/nvim-web-devicons',
	},
	config = function()
		require('octo').setup()
	end,
}, {
	'windwp/nvim-ts-autotag',
	config = function()
		require('nvim-ts-autotag').setup()
	end,
}, { 'mrjones2014/nvim-ts-rainbow' }, {
	'romgrk/nvim-treesitter-context',
	config = function()
		require('treesitter-context').setup{
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			throttle = true, -- Throttles plugin updates (may improve performance)
			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
			patterns = {
				-- Match patterns for TS nodes. These get wrapped to match at word boundaries.
				-- For all filetypes
				-- Note that setting an entry here replaces all other patterns for this entry.
				-- By setting the 'default' entry below, you can control which nodes you want to
				-- appear in the context window.
				default = { 'class', 'function', 'method' },
			},
		}
	end,
}, {
	'rmagatti/goto-preview',
	config = function()
		require('goto-preview').setup{
			width = 120, -- Width of the floating window
			height = 25, -- Height of the floating window
			default_mappings = false, -- Bind default mappings
			debug = false, -- Print debug information
			opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
			post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
			-- You can use "default_mappings = true" setup option
			-- Or explicitly set keybindings
			-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
			-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
			-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
		}
	end,
}, {
	'ray-x/lsp_signature.nvim',
	event = 'BufRead',
	config = function()
		require'lsp_signature'.on_attach()
	end,
}, {
	'simrat39/symbols-outline.nvim',
	config = function()
		require('symbols-outline').setup()
	end,
}, {
	'folke/trouble.nvim',
	cmd = 'TroubleToggle',
}, {
	'Pocco81/auto-save.nvim',
	config = function()
		require('auto-save').setup()
	end,
}, {
	'zbirenbaum/copilot.lua',
	event = { 'VimEnter' },
	config = function()
		require('copilot').setup{
			plugin_manager_path = get_runtime_dir() .. '/site/pack/packer',
			suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<Tab>',
          }
      },
		}
	end,
}, {
	'zbirenbaum/copilot-cmp',
	after = { 'copilot.lua', 'nvim-cmp' },
}, {
	'npxbr/glow.nvim',
	ft = { 'markdown' },
	-- run = "yay -S glow"
},
-- {
-- 	'karb94/neoscroll.nvim',
-- 	event = 'WinScrolled',
-- 	config = function()
-- 		require('neoscroll').setup({
-- 		-- All these keys will be mapped to their corresponding default scrolling animation -- Hide cursor while scrolling -- Stop at <EOF> when scrolling downwards -- Use the local scope of scrolloff instead of the global scope -- Stop scrolling when the cursor reaches the scrolloff margin of the file -- The cursor will keep on scrolling even if the window cannot scroll further -- Default easing function -- Function to run before the scrolling animation starts -- Function to run after the scrolling animation ends
-- 			mappings = {
-- 				'<C-w>',
-- 				'<C-s>',
-- 				'<C-d>',
-- 				'<C-a>',
-- 				'<C-y>',
-- 				'<C-e>',
-- 				'zt',
-- 				'zz',
-- 				'zb',
-- 			},
-- 			hide_cursor = true,
-- 			stop_eof = true,
-- 			use_local_scrolloff = false,
-- 			respect_scrolloff = false,
-- 			cursor_scrolls_alone = true,
-- 			easing_function = nil,
-- 			pre_hook = nil,
-- 			post_hook = nil,
-- 		})
-- 	end,
-- },
{
	'ethanholz/nvim-lastplace',
	event = 'BufRead',
	config = function()
		require('nvim-lastplace').setup({
			lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
			lastplace_ignore_filetype = {
				'gitcommit',
				'gitrebase',
				'svn',
				'hgcommit',
			},
			lastplace_open_folds = true,
		})
	end,
}, {
	'folke/persistence.nvim',
	event = 'BufReadPre', -- this will only start session saving when an actual file was opened
	module = 'persistence',
	config = function()
		require('persistence').setup{
			dir = vim.fn.expand(vim.fn.stdpath'config' .. '/session/'),
			options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
		}
	end,
}, {
	'folke/todo-comments.nvim',
	event = 'BufRead',
	config = function()
		require('todo-comments').setup()
	end,
}, {
	'itchyny/vim-cursorword',
	event = { 'BufEnter', 'BufNewFile' },
	config = function()
		vim.api.nvim_command('augroup user_plugin_cursorword')
		vim.api.nvim_command('autocmd!')
		vim.api.nvim_command(
			'autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0'
		)
		vim.api.nvim_command(
			'autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif'
		)
		vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
		vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
		vim.api.nvim_command('augroup END')
	end,
}, {
  'stevearc/dressing.nvim',
}, {
  'ziontee113/icon-picker.nvim',
  config = function()
    require('icon-picker').setup({
        disable_legacy_commands = true
    })
  end
}, {
	'catppuccin/nvim',
	as = 'catppuccin',
}, { 'andweeb/presence.nvim' } }


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands = {
--  {
--    {"BufEnter", "Filetype"},
--    {
--      desc = "Open mini.map and exclude some filetypes",
--      pattern = { "*" },
--      callback = function()
--        local exclude_ft = {
--          "qf",
--          "NvimTree",
--          "toggleterm",
--          "TelescopePrompt",
--          "alpha",
--          "netrw",
--        }
--
--        local map = require('mini.map')
--        if vim.tbl_contains(exclude_ft, vim.o.filetype) then
--          vim.b.minimap_disable = true
--          map.close()
--        elseif vim.o.buftype == "" then
--          map.open()
--        end
--      end,
--    },
--  },
--}
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
