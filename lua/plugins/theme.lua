return {
	"polirritmico/monokai-nightasty.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("monokai-nightasty")
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#343434" })
	end,
}
