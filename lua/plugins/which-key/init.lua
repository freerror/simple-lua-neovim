require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = ">", -- symbol used in the command line area that shows your active key combo
        separator = ":", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
        }, 
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':let @/=""<CR>',
                        {noremap = true, silent = true})

-- explorer

-- TODO this introduces some bugs unfortunately
vim.api.nvim_set_keymap('n', '<Leader>e',
                        ":lua require'lv-nvimtree'.toggle_tree()<CR>",
                        {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<Leader>e',
--                         ":NvimTreeToggle<CR>",
--                         {noremap = true, silent = true})

-- dashboard
vim.api.nvim_set_keymap('n', '<Leader>;', ':Dashboard<CR>',
                        {noremap = true, silent = true})

-- Reload settings
-- Based on:
--   " Fast edit .vimrc
--   nnoremap <Leader>ve :e $MYVIMRC<cr>
-- 
--   " Fast reload vim config
--   nnoremap <Leader>vr :source $MYVIMRC<cr> 
-- vim.api.nvim_set_keymap("n", "<leader>vr", ":source $MYVIMRC<cr>",
--                         {noremap = true, silent = true})



-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>",
                        {noremap = true, silent = true})

-- close buffer
vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>",
                        {noremap = true, silent = true})

local mappings = {

    -- customize here:
    ["/"] = "Comment",
    -- ["c"] = "Close Buffer",
    ["e"] = "Explorer",
    ["f"] = "Find File",
    ["h"] = "No Highlight",
    c = {"<cmd>close<cr>", "Close Current Split/Window"},
    C = {"<cmd>vspl<cr>", "Create Vertical Split"},
    D = {
        name = "Delete",
        b = {"<cmd>bd<cr>", "Delete Current Buffer"},
        f = {"<cmd>call delete(expand('%'))<cr>", "Delete Current File"},
    },
    d = {
        name = "Diff",
        n = {"<cmd>diffthis<cr><cmd>vspl<cr><cmd>bnext<cr><cmd>diffthis<cr>", "New diff window/split"},
        t = {"<cmd>diffthis<cr>", "This window/split"},
        o = {"<cmd>diffoff<cr>", "Off"},
    },
    q = {"<cmd>quitall<cr>", "Quit"},
    S = {"<cmd>SessionSave<cr>", "Save Session"},
    L = {"<cmd>SessionLoad<cr>", "Load Session"},
    n = {"<cmd>noh<cr>", "No search highlight"},
    t = {
        name = "Terminal",
        t = {"<cmd>split<cr><cmd>resize 20<cr><cmd>term<cr>", "Open Terminal"},
        j = {"<cmd>resize 1<cr>", "Downsized Split"},
        k = {"<cmd>resize 20<cr>", "Upsized Split"}
    },
    T = {
        name = "theme",
        t = {"<cmd>Telescope colorscheme<cr>", "Choose Colorscheme"},
        d = {"<cmd>colorscheme base16-black-metal<cr>", "Dark Theme: Black Metal"},
        l = {"<cmd>colorscheme base16-one-light<cr>", "Light Theme: One Light"},
    },
    w = {
        name = "Window",
        c = {"<cmd>close<cr>", "Close Current Split/Window"},
        s = {"<cmd>spl<cr>", "Split Horizontal"},
        v = {"<cmd>vspl<cr>", "Split Vertical"},
    },
    o = {
        name = "Organization",
        i = {'"=strftime("%y%m%d%H%M")<CR>p', "Insert Datestring (Zettel ID)"},
    },
    b = {
        name = "Buffers",
        b = {"<cmd>BufferPick<cr>", "Buffer Pick"},
        w = {"<cmd>BufferWipeout<cr>", "Wipeout buffer"},
        e = {"<cmd>BufferCloseAllButCurrent<cr>", "Close all but current buffer"},
        h = {"<cmd>BufferMovePrevious<cr>", "Move left"},
        l = {"<cmd>BufferMoveNext<cr>", "Move right"},
        H = {"<cmd>BufferCloseBuffersLeft<cr>","Close all BufferLines to the left"},
        L = {"<cmd>BufferCloseBuffersRight<cr>","Close all BufferLines to the right"},
        D = {"<cmd>BufferOrderByDirectory<cr>","Sort BufferLines automatically by directory"},
        S = {"<cmd>BufferOrderByLanguage<cr>","Sort BufferLines automatically by language"}
    },

    -- diagnostics vanilla nvim
    -- -- diagnostic
    -- function lv_utils.get_all()
    --     vim.lsp.diagnostic.get_all()
    -- end
    -- function lv_utils.get_next()
    --     vim.lsp.diagnostic.get_next()
    -- end
    -- function lv_utils.get_prev()
    --     vim.lsp.diagnostic.get_prev()
    -- end
    -- function lv_utils.goto_next()
    --     vim.lsp.diagnostic.goto_next()
    -- end
    -- function lv_utils.goto_prev()
    --     vim.lsp.diagnostic.goto_prev()
    -- end
    -- function lv_utils.show_line_diagnostics()
    --     vim.lsp.diagnostic.show_line_diagnostics()
    -- end

    -- " Available Debug Adapters:
    -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
    -- " Adapter configuration and installation instructions:
    -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    -- " Debug Adapter protocol:
    -- "   https://microsoft.github.io/debug-adapter-protocol/
    -- " Debugging
    -- command! DebugToggleBreakpoint lua require'dap'.toggle_breakpoint()
    -- command! DebugStart lua require'dap'.continue()
    -- command! DebugContinue lua require'dap'.continue()
    -- command! DebugStepOver lua require'dap'.step_over()
    -- command! DebugStepOut lua require'dap'.step_out()
    -- command! DebugStepInto lua require'dap'.step_into()
    -- command! DebugToggleRepl lua require'dap'.repl.toggle()
    -- command! DebugGetSession lua require'dap'.session()
    -- D = {
    --     name = "Debug",
    --     b = {"<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint"},
    --     c = {"<cmd>DebugContinue<cr>", "Continue"},
    --     i = {"<cmd>DebugStepInto<cr>", "Step Into"},
    --     o = {"<cmd>DebugStepOver<cr>", "Step Over"},
    --     r = {"<cmd>DebugToggleRepl<cr>", "Toggle Repl"},
    --     s = {"<cmd>DebugStart<cr>", "Start"}
    -- },
    g = {
        name = "Git",
        j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
        k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
        l = {"<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame"},
        p = {"<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk"},
        r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"},
        R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer"},
        s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"},
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk"
        },
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit(for current file)"
        }
    },
    l = {
        name = "LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            "Document Diagnostics"
        },
        D = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics"
        },
        f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
        h = {"<cmd>Lspsaga hover_doc<cr>", "Hover Doc"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        j = {"<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic"},
        k = {"<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols"
        }
    },
    F = {
        name = "Find",
        -- b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        -- c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        -- d = {
        --     "<cmd>Telescope lsp_document_diagnostics<cr>",
        --     "Document Diagnostics"
        -- },
        -- D = {
        --     "<cmd>Telescope lsp_workspace_diagnostics<cr>",
        --     "Workspace Diagnostics"
        -- },
        h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
        -- m = {"<cmd>Telescope marks<cr>", "Marks"},
        -- M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
    },
    -- T = {
    --     name = "Treesitter",
    --     i = {":TSConfigInfo<cr>", "Info"}
    -- }
}


local wk = require("which-key")
wk.register(mappings, opts)
