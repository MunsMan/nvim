return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            search = {
                enabled = true,
            },
            char = {
                keys = {
                    ["f"] = "s",
                    ["t"] = "t",
                    ["F"] = "S",
                    ["T"] = "T",
                    [";"] = "N",
                    [","] = "E",
                },
                char_actions = function()
                    return {
                        [";"] = "right",
                        [","] = "left",
                    }
                end,
                jump_labels = true,
            },
        },
        -- search = {
        --     multi_window = true,
        --     wrap = true,
        --     mode = "fuzzy",
        -- },
        jump = {
            nohlsearch = true,
            autojump = true,
        },
    },
    keys = {
        {
            "<leader>cf",
            function()
                require("flash").toggle()
            end,
            desc = "Toggle Flash in regular search",
            mode = "n",
        },
    },
}
