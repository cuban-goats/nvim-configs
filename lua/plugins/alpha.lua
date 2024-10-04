return {
 'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {

      [[           .#@@                  ]],
      [[         .   */@      *,,**&@    ]],
      [[             /((   **/,,,     ,  ]],
      [[             @&%@@@,**,#,* *     ]],
      [[           ,.@#%..&&.,,***/,     ]],
      [[    //,... @..%###&.. .,.,&      ]],
      [[             @@@@%., ..     .,,  ]],
      [[            .@ %/@, ...          ]],
      [[            *////,*....          ]],
      [[            *.,,. .              ]],
      [[              ..                 ]],
      [[                                 ]],
      [[              NEOVIM             ]],
      [[                                 ]],
    }
    alpha.setup(dashboard.opts)
    dashboard.section.buttons.val = {
      dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
      dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
      dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
    }
  end
}
