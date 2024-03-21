local function collector()
    local configDir = "plugins.dap.daps."

    local files = vim.split(vim.fn.glob(vim.fn.stdpath('config').."/lua/plugins/dap/daps/*.lua"), "\n")
    local configurations = {}
    for _, b in pairs(files) do
        for w in string.gmatch(b, "[^/]+%.lua") do
            local configName, _ = w:gsub("%.lua$", "")
            if configName == "init" then
                goto continue
            end
            local config = require(configDir .. configName)
            configurations[configName] = config
            ::continue::
        end
    end
    return configurations
end

return collector()
