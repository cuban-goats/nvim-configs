return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup {
        install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
      }

      local enabled = {}

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          if enabled[ft] then
            return
          end
          enabled[ft] = true

          local available = ts.get_available()
          if not vim.tbl_contains(available, ft) then
            return
          end

          if not vim.tbl_contains(ts.get_installed("parsers"), ft) then
            pcall(ts.install, { ft })
          end

          if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}