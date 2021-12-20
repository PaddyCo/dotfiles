-- TODO: shorten long branchnames
-- TODO: fg color for lualine c
local diagnostics = {
    'diagnostics',
    sources = { "nvim_diagnostic" },
    color_error = "#FF3333",
    color_warn = "#FFD94D",
    color_info = "#5C76FF",
    color_hint = "#5C76FF", 
}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = "ayu_dark",
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{ 'filename', path = 1 }},
    lualine_x = {'encoding'},
    lualine_y = { diagnostics, 'filetype'},
    lualine_z = {'location', 'progress'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},

    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
