return function()
    require("smartyank").setup({
        highlight = {
            enabled = false,
        },
        clipboard = {
            enabled = true,
        },
        tmux = {
            enabled = false,
        },
        osc52 = {
			enabled = true,
            ssh_only = true,
            silent = false,
            echo_hl = "Directory"
        },
    })
end