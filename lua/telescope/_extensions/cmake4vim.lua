local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("This plugin requires nvim-telescope/telescope.nvim")
end

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local select_target = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "CMake Target",
    finder = finders.new_table {
      results = vim.fn['cmake4vim#GetAllTargets']()
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.g.cmake_build_target = selection[1]
      end)
      return true
    end,
  }):find()
end

local select_build_type = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "CMake Build Type",
    finder = finders.new_table {
      results = vim.fn.keys(vim.fn['utils#cmake#getCMakeVariants']())
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.g.cmake_build_type = selection[1]
      end)
      return true
    end,
  }):find()
end

local select_kit = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "CMake Kit",
    finder = finders.new_table {
      results = vim.fn.keys(vim.fn['utils#cmake#kits#getCMakeKits']())
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.g.cmake_selected_kit = selection[1]
      end)
      return true
    end,
  }):find()
end

return telescope.register_extension {
  exports = {
    select_kit = select_kit,
    select_build_type = select_build_type,
    select_target = select_target
  },
}
