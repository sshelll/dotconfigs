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

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'K', require("pretty_hover").hover, opts)
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
            -- vim.lsp.buf.format { async = true }
            require('conform').format { async = true }
        end, opts)
    end,
})

-- Golang Auto-Import
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params(0, "utf-8")
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

-- Auto fmt
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- Java Auto-Import
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*.java",
--     callback = function()
--         require 'jdtls'.organize_imports()
--     end
-- })

-- diagnostic symbols
local diagnostics = {
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
        }
    },
    virtual_improved = {
        current_line = 'only',
    },
    severity_sort = true -- sometimes we need a Hint instead of an Error
}
vim.diagnostic.config(diagnostics)

-- disable some mappings since nvim v0.11, cuz we've already mapped 'gr' to lsp_references
-- if we don't disabled these, the resp time of 'gr' will be too slow
vim.keymap.del('n', 'gri') -- lsp impls
vim.keymap.del('n', 'gra') -- lsp code actions
vim.keymap.del('n', 'grr') -- lsp references
vim.keymap.del('n', 'grn') -- lsp rename
