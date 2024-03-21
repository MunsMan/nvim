local adapters = {
    lldb = {
        type = "executable",
        command = "/usr/local/opt/llvm/bin/lldb-vscode", -- adjust as needed, must be absolute path
        name = "lldb",
    },
}

return adapters
