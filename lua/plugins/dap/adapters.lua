local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")

local adapters = {
    codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = "codelldb",
            args = { "--port", "${port}" },
        },
    },
}

return adapters
