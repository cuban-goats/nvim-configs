return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		styles = {
			comments = {},
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
		},
		color_overrides = {
			mocha = {
				text = "#F4CDE9",
				subtext1 = "#DEBAD4",
				subtext0 = "#C8A6BE",
				overlay2 = "#B293A8",
				overlay1 = "#9C7F92",
				overlay0 = "#866C7D",
				surface2 = "#705867",
				surface1 = "#5A4551",
				surface0 = "#44313B",

				base = "#352939",
				mantle = "#211924",
				crust = "#1a1016",
			},
		},
		integrations = {
			telescope = {
				enabled = true,
				style = "nvchad",
			},
			dropbar = {
				enabled = true,
				color_mode = true,
			},
		},
	},
}
