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
        env = load_env,
    },
}
