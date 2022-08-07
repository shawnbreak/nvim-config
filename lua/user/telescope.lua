local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup{
    defaults = {
        mappings = {
            i = {

            }
        }
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
      },
      help_tags = {
        theme = "dropdown",
        previewer = false,
      },
      live_grep = {
        theme = "ivy",
      },
      git_status = {
        theme = "ivy",
      }
    },
    extensions = {
      projects = {
        theme = "dropdown",
      }
    },
    layout_config = {
      vertical = { width = 0.5 }
    }
}
