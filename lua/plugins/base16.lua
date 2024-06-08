-- Function to read and parse the YAML file
local function parse_yaml_file(file_path)
    local yaml = require("yaml_nvim")
    local file = io.open(file_path, "r")
    if not file then
        print("Could not open file: " .. file_path)
        return nil
    end
    local content = file:read("*all")
    file:close()
    return yaml.parse(content)
end

return {
    "echasnovski/mini.nvim",
    version = "*",
    dependenciens = {
        "cuducos/yaml.nvim",
        ft = { "yaml" },
        requires = { "nvim-treesitter/nvim-treesitter" },
    },
    setup = function()
        -- Load the yaml.nvim plugin
        -- Example usage
        local base16 = require("base16")
        local colors = parse_yaml_file("~/.config/colors/onedark.yaml")
        if colors then
            base16.setup({
                palette = {
                    base00 = "#" .. colors.base00,
                    base01 = "#" .. colors.base01,
                    base02 = "#" .. colors.base02,
                    base03 = "#" .. colors.base03,
                    base04 = "#" .. colors.base04,
                    base05 = "#" .. colors.base05,
                    base06 = "#" .. colors.base06,
                    base07 = "#" .. colors.base07,
                    base08 = "#" .. colors.base08,
                    base09 = "#" .. colors.base09,
                    base0A = "#" .. colors.base0A,
                    base0B = "#" .. colors.base0B,
                    base0C = "#" .. colors.base0C,
                    base0D = "#" .. colors.base0D,
                    base0E = "#" .. colors.base0E,
                    base0F = "#" .. colors.base0F,
                },
                use_cterm = {
                    base00 = 254,
                    base01 = 250,
                    base02 = 246,
                    base03 = 243,
                    base04 = 239,
                    base05 = 18,
                    base06 = 20,
                    base07 = 232,
                    base08 = 52,
                    base09 = 130,
                    base0A = 28,
                    base0B = 22,
                    base0C = 133,
                    base0D = 24,
                    base0E = 90,
                    base0F = 31,
                },
            })
            vim.g.colors_name = "onedark"
        end
        vim.cmd("colorscheme onedark")
    end,
}
