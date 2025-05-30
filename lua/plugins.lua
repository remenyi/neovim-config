return {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope.nvim",              dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-dap.nvim" }, } },

    { "catppuccin/nvim",                            name = "catppuccin",                                                                     priority = 1000 },
    { "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = { theme = "catppuccin" }
            })
        end
    },
    { "tpope/vim-sleuth" },

    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
        },
        opts = {},
    },

    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },

    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
        config = true,
    },

    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "skim"
        end
    },
    {
      "chentoast/marks.nvim",
      event = "VeryLazy",
      opts = {},
    },

    { "neovim/nvim-lspconfig" },
}
