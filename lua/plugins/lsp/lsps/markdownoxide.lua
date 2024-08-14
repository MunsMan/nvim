return {
    opts = {},
    setup = function(opts)
        opts.capabilities.workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        }
        require("lspconfig").markdown_oxide.setup(opts)
    end,
}
