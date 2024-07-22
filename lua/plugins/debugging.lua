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

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug continue" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug step over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug step into" })

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

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = true,
			},
		}

        dap.configurations.c = dap.configurations.cpp
	end,
}
