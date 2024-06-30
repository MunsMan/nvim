return {
    "rolv-apneseth/tfm.nvim",
    lazy = false,
    enabled = false,
    opts = {
        file_manager = "yazi",
        replace_netrw = true,
        enable_cmds = false,
        ui = {
            border = "none",
            height = 1,
            width = 1,
            x = 0.5,
            y = 0.5,
        },
    },
    keys = {
        {
            "<leader>e",
            function()
                require("tfm").open()
            end,
            desc = "TFM",
        },
        {
            "<leader>mh",
            function()
                local tfm = require("tfm")
                tfm.open(nil, tfm.OPEN_MODE.split)
            end,
            desc = "TFM - horizontal split",
        },
        {
            "<leader>mv",
            function()
                local tfm = require("tfm")
                tfm.open(nil, tfm.OPEN_MODE.vsplit)
            end,
            desc = "TFM - vertical split",
        },
        {
            "<leader>mt",
            function()
                local tfm = require("tfm")
                tfm.open(nil, tfm.OPEN_MODE.tabedit)
            end,
            desc = "TFM - new tab",
        },
    },
}
