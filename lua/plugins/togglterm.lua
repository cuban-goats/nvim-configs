return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "vertical",
    size = function()
      return math.floor(vim.o.columns * 0.4)
    end,
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
  },
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    { "<Esc>", "<C-\\><C-n>", desc = "Unfocus terminal", mode = "t" },
  },
}
