local telescope_builtin = require('telescope.builtin')

-- Global mappings.
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Buffer local mappings.
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, opts)
        vim.keymap.set('n', '<leader>f', function()
            local fileType = vim.bo.filetype
            local file = vim.fn.expand('%:p')
            if fileType == 'sh' then
                vim.cmd("!shfmt -l -w " .. file)
                vim.cmd("edit")
                return
            elseif fileType == 'json' then
                vim.cmd("!biome check --apply " .. file)
                return
            elseif fileType == 'yaml' then
                vim.cmd("!prettier --write " .. file)
                return
            elseif fileType == 'sql' then
                vim.cmd("!sql-formatter --fix " .. file)
                return
            elseif fileType == 'python' then
                vim.cmd("!black " .. file)
                return
            end
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- Golang Auto-Import
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end
})

-- Java Auto-Import
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.java",
    callback = function()
        require 'jdtls'.organize_imports()
    end
})

-- Rust / Java auto-formatting
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs,*.java",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end
})

-- Bash auto-formatting
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.sh",
    callback = function()
        local file = vim.fn.expand('%:p')
        vim.cmd("silent !shfmt -l -w " .. file)
        vim.cmd("edit")
    end
})

-- diagnostic symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- show diagnostic info in float window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

require 'lspconfig'.millet.setup {
    cmd = { "millet" },
}
