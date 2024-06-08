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
    "echasnovski/mini.base16",
    version = "*",
    dependenciens = {
        {
            "cuducos/yaml.nvim",
            ft = { "yaml" },
            requires = { "nvim-treesitter/nvim-treesitter" },
        },
        {
            { "echasnovski/mini.colors", version = "*" },
        },
    },
    setup = function()
        -- Load the yaml.nvim plugin
        -- Example usage
        local base16 = require("mini.base16")
        local colors = require("mini.colors")
        local base16_colors = parse_yaml_file("~/.config/colors/onedark.yaml")
        if base16_colors then
            base16.setup({
                palette = {
                    base00 = "#" .. base16_colors.base00,
                    base01 = "#" .. base16_colors.base01,
                    base02 = "#" .. base16_colors.base02,
                    base03 = "#" .. base16_colors.base03,
                    base04 = "#" .. base16_colors.base04,
                    base05 = "#" .. base16_colors.base05,
                    base06 = "#" .. base16_colors.base06,
                    base07 = "#" .. base16_colors.base07,
                    base08 = "#" .. base16_colors.base08,
                    base09 = "#" .. base16_colors.base09,
                    base0A = "#" .. base16_colors.base0A,
                    base0B = "#" .. base16_colors.base0B,
                    base0C = "#" .. base16_colors.base0C,
                    base0D = "#" .. base16_colors.base0D,
                    base0E = "#" .. base16_colors.base0E,
                    base0F = "#" .. base16_colors.base0F,
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
