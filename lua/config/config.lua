local config = {
    icons = {
        dap = {
            Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
            Breakpoint = { " ", "DiagnosticError" },
            BreakpointCondition = "🔍",
            BreakpointRejected = { "🚫", "DiagnosticError" },
            LogPoint = "📝",
        },
        dap_ui = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = "",
        },
    },
}

return config
