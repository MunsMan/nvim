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
        { "williamboman/mason.nvim" },
        { "stevearc/overseer.nvim", config = true },
    },
    config = function()
        local map = require("util").keymap_set
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
        map("n", "<leader>dp", dap.pause, { desc = "Pause Debugger" })
        map("n", "<leader>di", dap.step_into, { desc = "Step Into" })
        map("n", "<leader>dh", dap.step_into, { desc = "Step Out" })
        map("n", "<leader>dn", dap.step_into, { desc = "Step Over" })
        map("n", "<leader>dr", dap.restart, { desc = "Restart DAP" })
        map("n", "<leader>?", function()
            require("dapui").eval(nil, { enter = true })
        end, { desc = "Step Over" })
        map("n", "<leader>dc", function()
            dap.terminate()
            dap.repl.close()
        end, { desc = "Close DAP" })
    end,
    keys = {
        {
            "<leader>ds",
            function()
                if vim.fn.filereadable(".vscode/launch.json") then
                    require("dap.ext.vscode").load_launchjs(nil, {
                        ["codelldb"] = { "c", "cpp", "rust" },
                    })
                end
                require("dap").continue()
                -- require("dapui").open()
            end,
            desc = "Start Debugger",
        },
        {
            "<leader>b",
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
    },
}
