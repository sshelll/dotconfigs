require("other-nvim").setup({
    rememberBuffers = false,
    mappings = {
        -- builtin mappings
        "livewire",
        "angular",
        "laravel",
        "rails",
        "golang",
        {
            context = "plugin config",
            pattern = "/lua/plugins.lua",
            target = "/lua/plugin-config/*.lua",
        },
        {
            context = "plugin list",
            pattern = "/lua/plugin%-config/.*.lua",
            target = "/lua/*.lua",
        },
    },
    transformers = {
        -- defining a custom transformer
        lowercase = function(inputString)
            return inputString:lower()
        end
    },
    style = {
        -- How the plugin paints its window borders
        -- Allowed values are none, single, double, rounded, solid and shadow
        border = "rounded",

        -- Column seperator for the window
        seperator = "|",

        -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
        width = 0.7,

        -- Indicator showing that the file does not yet exist
        newFileIndicator = "(* new *)",

        -- min height in rows.
        -- when more columns are needed this value is extended automatically
        minHeight = 2
    },
})
