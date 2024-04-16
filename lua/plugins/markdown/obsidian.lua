return {
    "epwalsh/obsidian.nvim",
    -- dir = '/Users/munsman/Code/obsidian.nvim/worktree/dailyTemplate/',
    -- name = 'obsidian.nvim',
    -- docs: https://github.com/epwalsh/obsidian.nvim
    lazy = true,
    event = {
        "BufReadPre **/obsidian/second-brain/**.md",
        "BufNewFile **/obsidian/second-brain/**.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "second-brain",
                path = "~/obsidian/second-brain",
            },
        },
        daily_notes = {
            folder = "daily",
            template = "daily.md",
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
        new_notes_location = "current_dir",
        templates = {
            subdir = "templates",
            date_format = "%Y-%m-%d",
            substitutions = {
                yesterday = function()
                    return os.date("%Y-%m-%d", os.time() - 86400)
                end,
            },
        },
        mappings = {},
        open_notes_in = "current",
        note_id_func = function(title)
            local suffix = ""
            if title ~= nil then
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.date("%Y%m%d%M")) .. "-" .. suffix
        end,
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

        follow_url_func = function(url)
            vim.fn.jobstart({ "open", url })
        end,
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
