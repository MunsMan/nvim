local function initCommands()
    local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

    local script_import = 'command script import "'
        .. rustc_sysroot
        .. '/lib/rustlib/etc/lldb_lookup.py"'
    local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

    local commands = {}
    local file = io.open(commands_file, "r")
    if file then
        for line in file:lines() do
            table.insert(commands, line)
        end
        file:close()
    end
    table.insert(commands, 1, script_import)

    return commands
end

local function load_env()
    local variables = {}
    for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
    end
    return variables
end

local function get_filename()
    local cwd = vim.fn.getcwd()
    local binary = cwd:match("^.+/(.+)$")
    return cwd .. "/target/debug/" .. binary
end

local function get_args()
    return vim.fn.input("Enter Args: ")
end

return {
    {
        name = "Just Launch",
        type = "codelldb",
        request = "launch",
        program = get_filename,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        initCommands = initCommands,
        env = load_env,
    },
    {
        name = "Launch with args",
        type = "codelldb",
        request = "launch",
        program = get_filename,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = get_args,
        initCommands = initCommands,
        env = load_env,
    },
}
