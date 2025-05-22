return {
  {
    "sainnhe/everforest",
    priority = 1000, -- Make sure this loads before other plugins
    config = function()
      -- previous settings
      vim.g.everforest_background = "soft"
      vim.g.everforest_ui_contrast = "high"
      vim.g.everforest_transparent_background = "0" -- 1 is transparent, 2 changes other ui elements
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
      -- colorscheme = "catppuccin-frappe",
    },
  },
}
