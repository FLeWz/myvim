local parse_messages = function(opts)
    local messages = {
        { role = "system", content = opts.system_prompt },
    }

    vim
        .iter(opts.messages)
        :each(function(msg) table.insert(messages, { role = msg.role, content = msg.content }) end)
    return messages
end

return {
    {
        "yetone/avante.nvim",
        build = function()
            local build_command
            if vim.fn.has("win32") == 1 then
                build_command = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource true"
            else
                build_command = "make BUILD_FROM_SOURCE=true"
            end

            -- Execute the build command and handle errors
            local result = vim.fn.system(build_command)
            if vim.v.shell_error ~= 0 then
                return nil, "Build failed: " .. result
            else
                return result
            end
        end,
        event = "VeryLazy",
        version = false,
        opts = {
            provider = "myOpenWebUI",
            providers = {
                myOpenWebUI = {
                    __inherited_from = "openai",
                    endpoint = "https://ai.pecnik.dev/api/chat/completions",
                    model = "qwen2.5-coder:latest",
                    api_key_name = "OPENWEBUI_TOKEN",
                    disable_tools = true,
                    parse_messages = parse_messages,
                    parse_curl_args = function(opts, code_opts)
                        local headers = {
                            ["Content-Type"] = "application/json",
                            ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name)
                        }

                        return {
                            url = opts.endpoint,
                            headers = headers,
                            body = vim.tbl_deep_extend("force", {
                                model = opts.model,
                                stream = true,
                                messages = parse_messages(code_opts),
                            }, {}),
                        }
                    end,
                },
            },
        },
        behaviour = {
        },
        -- not working
        mappings = {
            sidebar = {
                apply_all = "<leader>bA",
                apply_cursor = "<leader>ba",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua",              -- for file_selector provider fzf
            "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
}
