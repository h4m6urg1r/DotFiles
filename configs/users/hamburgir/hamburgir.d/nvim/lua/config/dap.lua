local dap = require('dap')
dap.adapters.dart = {
    type = 'executable',
    command = 'dart',
    args = {'debug_adapter'}
}
dap.adapters.flutter = {
    type = 'executable',
    command = 'flutter',
    args = {'debug_adapter'}
}
dap.configurations.dart = {
    {
        type = "dart",
        request = "launch",
        name = "Launch dart",
        dartSdkPath = vim.fn.exepath('flutter') .. "/cache/dart-sdk/",                       -- ensure this is correct
        flutterSdkPath = vim.fn.exepath('flutter'):gsub('/bin/[^/]+$', ''),                  -- ensure this is correct
        program = "${workspaceFolder}/lib/main.dart",                                        -- ensure this is correct
        cwd = "${workspaceFolder}",
        toolArgs = {"-d", "linux"},
    },
    {
        type = "flutter",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = vim.fn.exepath('flutter') .. "/cache/dart-sdk/",                       -- ensure this is correct
        flutterSdkPath = vim.fn.exepath('flutter'):gsub("/bin/[^/]+$", ""),                  -- ensure this is correct
        program = "${workspaceFolder}/lib/main.dart",                                        -- ensure this is correct
        cwd = "${workspaceFolder}",
    }
}
