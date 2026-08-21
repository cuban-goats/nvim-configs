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
    winbar_enabled = true,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    vim.api.nvim_set_hl(0, "ToggleTermWinSeparator", { fg = "#343434", bg = "#343434" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "toggleterm",
      callback = function()
        vim.wo.winhl = "WinSeparator:ToggleTermWinSeparator,StatusLine:ToggleTermWinSeparator,StatusLineNC:ToggleTermWinSeparator"
      end,
    })
  end,
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    {
      "<leader>tn",
      function()
        local terms = require("toggleterm.terminal").get_all()
        local max_id = 0
        for _, t in ipairs(terms) do
          if t.id > max_id then max_id = t.id end
        end
        vim.cmd((max_id + 1) .. "ToggleTerm")
      end,
      desc = "New terminal",
    },

    { "<Esc>", "<C-\\><C-n>", desc = "Unfocus terminal", mode = "t" },
  },
}
