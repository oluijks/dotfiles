return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPACE ee", "  > File Explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPACE ff", "󰱼  > Find a file", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPACE fs", "  > Find a word", "<cmd>Telescope live_grep<CR>"),
			-- dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button("q", "  > Quit NeoVim", "<cmd>qa<CR>"),
		}

		-- do not show bufferline when alpha open
		dashboard.opts.opts.setup = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				desc = "disable tabline for alpha",
				callback = function()
					vim.opt.showtabline = 0
				end,
			})
			vim.api.nvim_create_autocmd("BufUnload", {
				buffer = 0,
				desc = "enable tabline after alpha",
				callback = function()
					vim.opt.showtabline = 2
				end,
			})
		end

		-- Send config to alpha
		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		local alpha_on_empty = vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			pattern = "BDeletePost*",
			group = alpha_on_empty,
			callback = function(event)
				local fallback_name = vim.api.nvim_buf_get_name(event.buf)
				local fallback_ft = vim.api.nvim_get_option_value("filetype", { buf = event.buf })
				local fallback_on_empty = fallback_name == "" and fallback_ft == ""

				if fallback_on_empty then
					vim.cmd("Alpha")
					vim.cmd(event.buf .. "bwipeout")
				end
			end,
		})
	end,
}
