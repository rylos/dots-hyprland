-- Amazon Q Integration for LazyVim - Chat and Explain only
return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      local Terminal = require("toggleterm.terminal").Terminal
      
      -- Create a single Amazon Q chat terminal instance that gets reused
      local amazon_q_terminal = Terminal:new({
        cmd = "q chat",
        hidden = true,
        direction = "float",
        float_opts = {
          border = "curved",
          width = math.floor(vim.o.columns * 0.8),
          height = math.floor(vim.o.lines * 0.8),
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          -- Map 'q' to close in normal mode within this terminal
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
          -- Map Ctrl+q to toggle from within the terminal
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-q>", "<cmd>lua _AMAZON_Q_TOGGLE()<CR>", { noremap = true, silent = true })
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
      })

      -- Global function to toggle Amazon Q chat
      _G._AMAZON_Q_TOGGLE = function()
        amazon_q_terminal:toggle()
      end

      -- Global function to explain code using the same terminal
      _G._AMAZON_Q_EXPLAIN = function(code_lines)
        -- Open the same Amazon Q terminal
        if not amazon_q_terminal:is_open() then
          amazon_q_terminal:open()
        end
        
        -- Wait a bit for terminal to be ready, then send the explain prompt
        vim.defer_fn(function()
          local prompt = "Please explain this code:\n\n```\n" .. table.concat(code_lines, "\n") .. "\n```"
          -- Send the prompt to the terminal
          vim.api.nvim_chan_send(amazon_q_terminal.job_id, prompt .. "\n")
        end, 500)
      end

      -- Amazon Q Chat keymaps
      vim.keymap.set({ "n", "t" }, "<leader>ac", _AMAZON_Q_TOGGLE, { desc = "Amazon Q Chat" })
      vim.keymap.set({ "n", "t" }, "<C-q>", _AMAZON_Q_TOGGLE, { desc = "Amazon Q Chat" })
      
      -- Amazon Q Explain - For selected code (uses same terminal instance)
      vim.keymap.set("v", "<leader>ae", function()
        -- Exit visual mode properly to set the marks
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'x', false)
        
        -- Small delay to ensure marks are set
        vim.defer_fn(function()
          -- Get the visual selection using marks
          local start_line = vim.fn.line("'<")
          local end_line = vim.fn.line("'>")
          local start_col = vim.fn.col("'<")
          local end_col = vim.fn.col("'>")
          
          -- Get the selected lines
          local lines = vim.fn.getline(start_line, end_line)
          
          if #lines == 0 or start_line == 0 or end_line == 0 then
            vim.notify("No text selected", vim.log.levels.WARN)
            return
          end
          
          -- For character-wise selection, trim the lines if needed
          if start_line == end_line then
            -- Single line selection - check if we need to trim
            if start_col > 1 or end_col < #lines[1] then
              lines[1] = string.sub(lines[1], start_col, end_col)
            end
          elseif start_col > 1 or end_col < #lines[#lines] then
            -- Multi-line character selection (not full line selection)
            if start_col > 1 then
              lines[1] = string.sub(lines[1], start_col)
            end
            if end_col < #lines[#lines] then
              lines[#lines] = string.sub(lines[#lines], 1, end_col)
            end
          end
          
          -- Remove completely empty lines at start and end
          while #lines > 0 and lines[1]:match("^%s*$") do
            table.remove(lines, 1)
          end
          while #lines > 0 and lines[#lines]:match("^%s*$") do
            table.remove(lines, #lines)
          end
          
          if #lines == 0 then
            vim.notify("No meaningful text selected", vim.log.levels.WARN)
            return
          end
          
          -- Use the same Amazon Q terminal instance
          _AMAZON_Q_EXPLAIN(lines)
          vim.notify("Explaining " .. #lines .. " line(s) of code with Amazon Q...", vim.log.levels.INFO)
        end, 10) -- 10ms delay
      end, { desc = "Amazon Q Explain Selection" })
    end,
  },
  
  -- Which-Key configuration for Amazon Q
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "amazonq", icon = { icon = "󰭹 ", color = "orange" } },
      },
    },
  },
}
