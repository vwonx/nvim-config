local packer = pRequire("packer")

if packer then
  packer.startup({
    function(use)
      -- packer can manage itself
      use("wbthomason/packer.nvim")

      -- colorscheme
      use("folke/tokyonight.nvim")

      ---------- plugins ---------
      -- nvim-tree
      use({
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
          require("plugins.nvim-tree")
        end
      })
      -- bufferline
      use({
        "akinsho/bufferline.nvim",
        requires = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
        config = function()
          require("plugins.bufferline")
        end,
      })
      -- lualine
      use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
        config = function()
          require("plugins.lualine")
        end,
      })
      -- telescope
      use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        branch = "0.1.x",
        config = function()
          require("plugins.telescope")
        end,
      })
      -- comment.nvim
      use({
        "numToStr/Comment.nvim",
        config = function()
          require("plugins.comment")
        end,
      })
      -- autopairs
      use({
        "windwp/nvim-autopairs",
        config = function()
          require("plugins.autopairs")
        end,
      })
      -- treesitter
      use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
          local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
          ts_update()
        end,
        config = function()
          require("plugins.nvim-treesitter")
        end
      })
      -- gitsigns
      use({
        "lewis6991/gitsigns.nvim",
        config = function()
          require("plugins.gitsigns")
        end
      })
      -- diffview
      use({
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("diffview").setup()
        end
      })
      -- leap
      use({
        "ggandor/leap.nvim",
        config = function()
          require("leap").add_default_mappings()
        end
      })

      ---------- LSP ---------
      -- lspconfig
      use("neovim/nvim-lspconfig")
      -- mason
      use("williamboman/mason.nvim")
      use("williamboman/mason-lspconfig.nvim")

      -- cmp
      use("hrsh7th/nvim-cmp")
      -- sources
      use("hrsh7th/cmp-nvim-lsp")
      use("hrsh7th/cmp-buffer")
      use("hrsh7th/cmp-path")
      use("hrsh7th/cmp-cmdline")
      -- snippet plugin
      use("hrsh7th/cmp-vsnip")
      use("hrsh7th/vim-vsnip")

      -----------Format--------
      use({
        "jose-elias-alvarez/null-ls.nvim",
        require = "nvim-lua/plenary.nvim",
      })
    end,
    config = {
      display = {
        open_fn = function()
          return require('packer.util').float({ border = 'single' })
        end
      },
    },
  })
end
