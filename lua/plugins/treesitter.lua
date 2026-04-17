return {
    {
      "nvim-treesitter/nvim-treesitter",
      version = false,
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          highlight = { enable = true },
          indent = { enable = true },
          auto_install = true,
          ensure_installed = {
            "bash",
            "c",
            "lua",
            "markdown",
            "vim",
            "vimdoc",
            "typst",
          },
        })
      end,
    },
  }
