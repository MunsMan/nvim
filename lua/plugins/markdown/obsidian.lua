return {
    "epwalsh/obsidian.nvim",
    -- dir = '/Users/munsman/Code/obsidian.nvim/worktree/dailyTemplate/',
    -- name = 'obsidian.nvim',
    -- docs: https://github.com/epwalsh/obsidian.nvim
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "second-brain",
                path = "~/obsidian/second-brain",
            },
            {
                name = "no-vault",
                path = function()
                    -- alternatively use the CWD:
                    -- return assert(vim.fn.getcwd())
                    return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
                end,
                overrides = {
                    notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
                    daily_notes = vim.NIL,
                    new_notes_location = "current_dir",
                    templates = {
                        folder = vim.NIL,
                    },
                    disable_frontmatter = true,
                },
            },
        },
        daily_notes = {
            folder = "daily",
            template = "daily.md",
        },
        completion = {
            nvim_cmp = true,
            min_chars = 1,
        },
        new_notes_location = "notes_subdir",
        templates = {
            subdir = "templates",
            date_format = "%Y-%m-%d",
            substitutions = {
                yesterday = function()
                    return os.date("%Y-%m-%d", os.time() - 86400)
                end,
            },
        },
        note_frontmatter_func = function(note)
            local out = { id = note.id, aliases = note.aliases, tags = note.tags, date = note.date }
            if
                note.metadata ~= nil
                and require("obsidian").util.table_length(note.metadata) > 0
            then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end
            return out
        end,

        ui = {
            hl_groups = {
                ObsidianTodo = { bold = true, fg = "#f78c6c" },
                ObsidianDone = { bold = true, fg = "#89ddff" },
                ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                ObsidianTilde = { bold = true, fg = "#ff5370" },
                ObsidianImportant = { bold = true, fg = "#d73128" },
                ObsidianBullet = { bold = true, fg = "#89ddff" },
                ObsidianRefText = { fg = "#c792ea" },
                ObsidianExtLinkIcon = { fg = "#c792ea" },
                ObsidianTag = { italic = true, fg = "#89ddff" },
                ObsidianBlockID = { italic = true, fg = "#89ddff" },
                ObsidianHighlightText = { bg = "#75662e" },
            },
        },
    },
    keys = {
        {
            "<leader>nn",
            function()
                vim.ui.input({ prompt = "Title: ", completion = "file" }, function(title)
                    if not title then
                        vim.cmd(":ObsidianNew")
                    else
                        vim.cmd(":ObsidianNew " .. title)
                    end
                end)
            end,
            desc = "open new note",
        },
        { "<leader>nd", "<cmd>ObsidianToday<cr>", desc = "open today's note" },
        { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "note text search" },
        { "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "note text search" },
        { "<leader>no", "<cmd>ObsidianOpen<cr>", desc = "open note in obsidian" },
        { "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "open note" },
    },
    cmd = { "ObsidianToday" },
}
