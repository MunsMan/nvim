return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "nvim-neotest/nvim-nio",
            },
            opts = {
                controls = {
                    icons = {
                        require("config.config").icons.dap_ui,
                    },
                },
            },
            config = function(opts)
                require("dapui").setup(opts)
                local dap, dapui = require("dap"), require("dapui")
                dap.listeners.before.attach.dapui_config = function()
                    dapui.open()
                end
                dap.listeners.before.launch.dapui_config = function()
                    dapui.open()
                end
                dap.listeners.before.event_terminated.dapui_config = function()
                    dapui.close()
                end
                dap.listeners.before.event_exited.dapui_config = function()
                    dapui.close()
                end
            end,
        },
        { "nvim-telescope/telescope.nvim" },
        { "theHamsta/nvim-dap-virtual-text" },
    },
    config = function()
        local Config = require("config.config")
        local dap = require("dap")
        local adapters = require("plugins.dap.adapters")
        local confiurations = require("plugins.dap.daps")

        for name, sign in pairs(Config.icons.dap) do
            sign = type(sign) == "table" and sign or { sign }
            vim.fn.sign_define("Dap" .. name, {
                text = sign[1],
                texthl = sign[2] or "DiagnosticInfo",
                linehl = sign[3] or "",
                numhl = sign[3] or "",
            })
        end

        dap.adapters = adapters
        dap.configurations = confiurations
    end,
    keys = {
        {
            "<leader>dr",
            function()
                require("dap").continue()
                -- require("dapui").open()
            end,
            desc = "Start Debugger",
        },
        {
            "<leader>dp",
            function()
                require("dap").pause()
            end,
            desc = "Pause Debugger",
        },
        {
            "<leader>di",
            function()
                require("dap").step_into()
            end,
            desc = "step into - DAP",
        },
        {
            "<leader>dh",
            function()
                require("dap").step_out()
            end,
            desc = "step out - DAP",
        },
        {
            "<leader>dn",
            function()
                require("dap").step_over()
            end,
            desc = "step over - DAP",
        },
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "toggle Breakpoint - DAP",
        },
        {
            "<leader>do",
            function()
                local telescope = require("telescope")
                telescope.load_extension("dap")
                telescope.extensions.dap.commands({})
            end,
            desc = "Search DAP Options",
        },
        {
            "<leader>dc",
            function()
                local dap = require("dap")
                -- require("dapui").close()
                dap.terminate()
                dap.repl.close()
            end,
            desc = "close DAP",
        },
    },
}
