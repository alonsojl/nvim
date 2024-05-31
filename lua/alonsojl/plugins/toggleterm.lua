return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		require("toggleterm").setup {
			direction = "horizontal",
			size = 30,
			open_mapping = [[<A-t>]]
		}
	end
}
