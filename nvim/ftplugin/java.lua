local jdtls_home = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local jdtls_bin = vim.fn.stdpath('data') .. '/mason/bin/jdtls'
local lombok_jar = jdtls_home .. '/lombok.jar'
local java_debug_jar = vim.fn.glob(vim.fn.stdpath('data') ..
    '/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', true)
local vscode_java_test_jars = vim.fn.glob(vim.fn.stdpath('data') ..
    '/vscode-java-test/server/*.jar', true)

local home = os.getenv("HOME")
local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

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
    cmd = {
        'java',
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx4g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-javaagent:" .. lombok_jar,
        '-jar', vim.fn.glob(jdtls_home .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', jdtls_home .. '/config_mac_arm',

        -- 💀
        -- See `data directory configuration` section in the README
        '-data', workspace_folder,
    },
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
