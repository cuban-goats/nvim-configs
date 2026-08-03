return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    float_opts = {
      border = "curved",
      width = function()
        return vim.o.columns
      end,
      height = function()
        return math.floor(vim.o.lines * 0.45)
      end,
      row = function()
        return math.floor(vim.o.lines * 0.50)
      end,
      col = 0,
      winblend = 10,
    },
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    highlights = {
      FloatBorder = { link = "FloatBorder" },
    },
  },
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    { "<Esc>", "<C-\\><C-n>", desc = "Unfocus terminal", mode = "t" },
  },
}
