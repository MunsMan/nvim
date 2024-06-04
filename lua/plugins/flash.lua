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
                    ["f"] = "t",
                    ["t"] = "T",
                    ["F"] = "<leader>t",
                    ["T"] = "<leader>T",
                    [";"] = "I",
                    [","] = "H",
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
        search = {
            multi_window = true,
            wrap = true,
            mode = "fuzzy",
        },
        jump = {
            nohlsearch = true,
            autojump = true,
        },
    },
}
