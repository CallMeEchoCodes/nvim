return function()
    local notify = require("notify")

    notify.setup({
        stages = "slide",
        on_open = nil,
        on_close = nil,
        timeout = 2000,
        fps = 60,
        render = "default",
        backgroud_colour = "Normal",
        minimum_width = 50,
        level = "TRACE"
    })

    vim.notify = notify
end