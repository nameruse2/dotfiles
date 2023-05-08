return {
    {
        "goolord/alpha-nvim",
        lazy = true,
    },
        -- Auto Pairs
    {
        "windwp/nvim-autopairs"
    },
  -- Which-key Extension
    {
        "folke/which-key.nvim",
        lazy = true,
    },

  -- Bufferline 
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

        -- Colorscheme
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
        vim.cmd.colorscheme 'tokyonight'
        end,
    },
    { 
        'navarasu/onedark.nvim',
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
-- Language Support
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    },
        -- Hop (Better Navigation)
    {
        "phaazon/hop.nvim",
        lazy = true,
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
        -- Nvimtree (File Explorer)
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
        -- Telescope (Fuzzy Finder)
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {
            {'nvim-lua/plenary.nvim'},
        }
    },
        -- Toggle Term
    {
        'akinsho/toggleterm.nvim',
        config = true
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
    },
        -- Undo-Tree
    -- Added this plugin
    {
        "jiaoshijie/undotree",
      dependencies  = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
    },

    -- Rainbow Highlighting
    {
        "HiPhish/nvim-ts-rainbow2",
    },

    {
        'renerocksai/telekasten.nvim',
        dependencies = {'nvim-telescope/telescope.nvim'}
    },
    {
        'nvim-neorg/neorg',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {'nvim-orgmode/orgmode',},
    {'jakewvincent/mkdnflow.nvim'},
}
