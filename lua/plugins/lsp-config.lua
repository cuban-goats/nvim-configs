return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.ltex.setup({
        capabilities = capabilities,
        filetypes = { "markdown", "tex", "text" },
      })

      vim.diagnostic.config({
        float = { border = "rounded" },
      })

      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover({ border = "rounded" })
      end, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local jdtls = require("jdtls")
          local root_markers = { "pom.xml", "build.gradle", ".git" }
          local root_dir = require("jdtls.setup").find_root(root_markers)

          local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" ..
            vim.fn.fnamemodify(root_dir, ":p:h:t")

          jdtls.start_or_attach({
            cmd = {
              "/opt/homebrew/bin/jdtls",
              "-data", workspace_dir,
            },
            root_dir = root_dir,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
          })
        end,
      })
    end,
  },
}
