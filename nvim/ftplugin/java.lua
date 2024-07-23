local jdtls_bin = vim.fn.stdpath('data') .. '/mason/bin/jdtls'
local java_debug_jar = vim.fn.glob(vim.fn.stdpath('data') ..
    '/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', 1)
local vscode_java_test_jars = vim.fn.glob(vim.fn.stdpath('data') ..
    '/vscode-java-test/server/*.jar', 1)

if vim.fn.filereadable(jdtls_bin) == 0 then
    print('jdtls binary not found')
    return
end

if java_debug_jar == '' then
    print('java debug jar not found')
    return
end

if vscode_java_test_jars == '' then
    print('vscode java test jars not found')
    return
end

local config = {
    cmd = { jdtls_bin },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}

local bundles = {
    java_debug_jar,
};

vim.list_extend(bundles, vim.split(vscode_java_test_jars, '\n'))
config['init_options'] = {
    bundles = bundles,
}

require('jdtls').start_or_attach(config)
require('jdtls').setup_dap()
