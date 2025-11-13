return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    event = "VeryLazy", -- Load after other plugins to avoid conflicts
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatStop",
      "CopilotChatReset",
      "CopilotChatSave",
      "CopilotChatLoad",
      "CopilotChatPrompts",
      "CopilotChatModels",
    },
    opts = {
      -- See Configuration section for options
      model = "gpt-4o",
      window = {
        layout = "horizontal",
      },
      auto_insert_mode = true,
      -- Debug: ensure vim.ui.select is working
      debug = true,
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      -- Disable blink.cmp for copilot-chat filetype to allow native completion
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "copilot-chat",
        callback = function()
          -- Disable blink.cmp for this buffer
          if package.loaded["blink.cmp"] then
            require("blink.cmp").setup_buffer({ enabled = false })
          end

          -- Ensure native completion works
          vim.bo.omnifunc = ""
          vim.bo.completefunc = ""
        end,
      })

      -- Set up keymaps after plugin is loaded to avoid conflicts
      vim.schedule(function()
        vim.keymap.set("n", "<leader>co", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle CopilotChat" })
        vim.keymap.set("n", "<leader>cp", "<cmd>CopilotChatPrompts<cr>", { desc = "CopilotChat Prompts" })
        vim.keymap.set("n", "<leader>cm", "<cmd>CopilotChatModels<cr>", { desc = "CopilotChat Models" })

        -- Test keymaps
        vim.keymap.set("n", "<leader>ct", function()
          vim.ui.select({ "Option 1", "Option 2", "Option 3" }, {
            prompt = "Test fzf-lua ui.select:",
          }, function(choice)
            if choice then
              vim.notify("Selected: " .. choice)
            else
              vim.notify("No selection made")
            end
          end)
        end, { desc = "Test fzf-lua ui.select" })

        vim.keymap.set("n", "<leader>cb", function()
          local buffers = {}
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) then
              local name = vim.api.nvim_buf_get_name(buf)
              if name ~= "" then
                table.insert(buffers, {
                  bufnr = buf,
                  name = vim.fn.fnamemodify(name, ":t"),
                  path = name,
                })
              end
            end
          end

          vim.ui.select(buffers, {
            prompt = "Select buffer:",
            format_item = function(item)
              return item.name .. " (" .. item.path .. ")"
            end,
          }, function(choice)
            if choice then
              vim.notify("Selected buffer: " .. choice.name)
            end
          end)
        end, { desc = "Test buffer selection with fzf-lua" })

        vim.keymap.set("n", "<leader>cs", function()
          vim.ui.select({ "listed", "visible" }, {
            prompt = "Select buffer scope:",
          }, function(choice)
            if choice then
              vim.notify("Selected scope: " .. choice)
            end
          end)
        end, { desc = "Test buffer scope selection with fzf-lua" })
      end)
    end,
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    lazy = false, -- Load immediately to ensure ui_select override works
    priority = 1000, -- High priority to load before other plugins
    opts = {},
    config = function()
      local fzf = require("fzf-lua")

      -- Register fzf-lua ui.select
      fzf.register_ui_select()

      -- Enhanced ui.select that works better with async contexts
      vim.ui.select = function(items, opts, on_choice)
        -- Ensure we're on the main thread
        if vim.in_fast_event() then
          vim.schedule(function()
            fzf.ui_select(items, opts, on_choice)
          end)
        else
          fzf.ui_select(items, opts, on_choice)
        end
      end

      -- Debug: Check if ui_select is properly set
      if vim.env.DEBUG_FZFLUA then
        print("fzf-lua ui_select registered:", type(vim.ui.select))
      end
    end,
  },
}
