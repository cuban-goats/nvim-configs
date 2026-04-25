return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },

        -- 👇 THIS is the modern auto-install switch
        auto_install = true,
      })
    end,
  },
}
