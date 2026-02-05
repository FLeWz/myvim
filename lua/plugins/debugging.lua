return {
    "mfussenegger/nvim-dap-ui",
    dependencies = {
        "rcarriga/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" },
        }

        dap.adapters.gdb_hpc = {
            type = "executable",
            command = "../gdb/gdb-15.2/gdb/gdb",
            args = { "-i", "dap", "--data-directory", "../gdb/gdb-15.2/gdb/data-directory" },
        }

        dap.configurations.cpp = {
            {
                name = 'GDB',
                type = 'gdb',
                request = 'launch',
                program = function()
                    local path = vim.fn.input({
                        prompt = 'Path to executable: ',
                        default = vim.fn.getcwd() .. '/',
                        completion = 'file',
                    })

                    return (path and path ~= '') and path or dap.ABORT
                end,
            },
            {
                name = 'GDB + args',
                type = 'gdb',
                request = 'launch',
                program = function()
                    local path = vim.fn.input({
                        prompt = 'Path to executable: ',
                        default = vim.fn.getcwd() .. '/',
                        completion = 'file',
                    })

                    return (path and path ~= '') and path or dap.ABORT
                end,
                args = function()
                    local args_str = vim.fn.input({
                        prompt = 'Arguments: ',
                    })
                    return vim.split(args_str, ' +')
                end,
            },
        }

        dap.configurations.c = dap.configurations.cpp

        require("dap.ext.vscode").load_launchjs(nil, {
            gdb = { "c" },
            gdb_hpc = { "c" },
        })
    end,
}
