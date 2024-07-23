local mason_registry = require('mason-registry')
local codelldb_root = mason_registry.get_package("codelldb"):get_install_path()
local codelldb_bin_path = codelldb_root .. "/codelldb"
local codelldb_lib_path = codelldb_root .. "/extension/lldb/lib/liblldb.dylib"

require("rust-tools").setup({
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_bin_path, codelldb_lib_path)
    },
})
