	return{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		keys = {
			{ "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Open file history" },
         { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close diff view"},
		},
		opts = {
			enhanced_diff_hl = true,
			use_icons = true,
			view = {
				default = { layout = "diff2_horizontal" },
				merge_tool = {
					layout = "diff4_mixed",
					disable_diagnostics = true,
				}
			}
		}
	}
