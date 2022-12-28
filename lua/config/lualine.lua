local M = {}
local kind = require "config.icons"
local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local function clock()
  return kind.icons.clock .. os.date "%H:%M"
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local function keymap()
  if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
    return '⌨ ' .. vim.b.keymap_name
  end
  return ''
end

local mode = function()
  local mod = vim.fn.mode()
  local _time = os.date "*t"
  local selector = math.floor(_time.hour / 8) + 1
  local normal_icons = {
    "  ",
    "  ",
    "  ",
  }

  if mod == "n" or mod == "no" or mod == "nov" then
    return normal_icons[selector]
  elseif mod == "i" or mod == "ic" or mod == "ix" then
    local insert_icons = {
      "  ",
      "  ",
      "  ",
    }
    return insert_icons[selector]
  elseif mod == "V" or mod == "v" or mod == "vs" or mod == "Vs" or mod == "cv" then
    local verbose_icons = {
      " 勇",
      "  ",
      "  ",
    }
    return verbose_icons[selector]
  elseif mod == "c" or mod == "ce" then
    local command_icons = {
      "  ",
      "  ",
      "  ",
    }

    return command_icons[selector]
  elseif mod == "r" or mod == "rm" or mod == "r?" or mod == "R" or mod == "Rc" or mod == "Rv" or mod == "Rv" then
    local replace_icons = {
      "  ",
      "  ",
      "  ",
    }
    return replace_icons[selector]
  end
  return normal_icons[selector]
end

M.options = {
  icons_enabled = true,
  theme = "auto",
  component_separators = { left = "", right = "" },
  section_separators = { left = "", right = "" },
  disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
  always_divide_middle = true,
}
M.sections = {
  lualine_a = { branch, diagnostics },
  lualine_b = { mode, keymap },
  lualine_c = {  },
  -- lualine_x = { "encoding", "fileformat", "filetype" },
  lualine_x = { diff, "encoding", filetype },
  lualine_y = { location, progress },
  lualine_z = { clock },
}
M.inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { "filename" },
  lualine_x = { "location" },
  lualine_y = {},
  lualine_z = {},
}
M.tabline = {}
M.extensions = {}
return M
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
