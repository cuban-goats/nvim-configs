return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- Enable syntax highlighting via native treesitter
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      -- Auto-install parser for the current filetype
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local ft = vim.bo.filetype
          if ft == "" then return end
          local installed = require("nvim-treesitter.config").get_installed()
          if not vim.list_contains(installed, ft) then
            local available = require("nvim-treesitter.config").get_available()
            if vim.list_contains(available, ft) then
              require("nvim-treesitter.install").install({ ft })
            end
          end
        end,
      })
    end,
  },
}
