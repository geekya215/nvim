require("bufferline").setup {
  options = {
    mode = "buffers",
    numbers = "none", -- "none" | "ordinal" | "buffer_id" 
    diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
    indicator_icon = " ",
    close_icon = "",
    separator_style = "thin", -- "slant" | "thick" | "thin" | { "any", "any" },
    always_show_bufferline = true,
    show_tab_indicators = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        padding = 1,
      },
    },
  }
}
